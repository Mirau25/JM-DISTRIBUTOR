﻿using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;


namespace SistemaAdministrativo.AplicacionWeb.Utilidades.ViewComponents
{
    public class MenuUsuarioViewComponent : ViewComponent
    {


        public async Task<IViewComponentResult> InvokeAsync()
        {
            ClaimsPrincipal claimUser = HttpContext.User; //Contexto del usuario creado
            string nombreUsuario = "";
            string urlFotoUsuario = "";
            
            if(claimUser.Identity.IsAuthenticated) {
                nombreUsuario = claimUser.Claims
                    .Where(c => c.Type == ClaimTypes.Name)
                    .Select(c => c.Value).SingleOrDefault();

                urlFotoUsuario = ((ClaimsIdentity)claimUser.Identity).FindFirst("UrlFoto").Value;

            }

            ViewData["nombreUsuario"] = nombreUsuario; //Compartimos la info con nuestra vista
            ViewData["urlFotoUsuario"] = urlFotoUsuario;

            return View();
        }

    }
}
