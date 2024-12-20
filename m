Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABB0E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 09:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CD710EF4F;
	Fri, 20 Dec 2024 09:43:17 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA89910EF4F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 09:43:16 +0000 (UTC)
Received: from 91-155-254-69.elisa-laajakaista.fi ([91.155.254.69]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tOZXN-000000038kl-1lGh; Fri, 20 Dec 2024 11:43:15 +0200
Message-ID: <b53da129da1f2eafb7733ac7eb0f22b1246a6178.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, arun.r.murthy@intel.com
Date: Fri, 20 Dec 2024 11:43:12 +0200
In-Reply-To: <20241219155453.24946-1-santhosh.reddy.guddati@intel.com>
References: <20241219155453.24946-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v1] lib/igt_kms: Backup connector modes before
 sorting
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, 2024-12-19 at 21:24 +0530, Santhosh Reddy Guddati wrote:
> Backup connector modes before sorting to ensure the original mode
> is not changed if the joiner is not found.This will skip updating
> connector->mode[0] if joiner is not available.
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3d061abc5..21a6a4639 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6394,6 +6394,11 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConne=
ctor *connector,
>  			  int max_dotclock, drmModeModeInfo *mode)
>  {
>  	bool found =3D false;
> +	drmModeModeInfo *modes_backup;
> +
> +	modes_backup =3D malloc(connector->count_modes * sizeof(drmModeModeInfo=
));
> +	igt_assert(modes_backup);
> +	memcpy(modes_backup, connector->modes, connector->count_modes * sizeof(=
drmModeModeInfo));

It's usually considered safer to use the size of the instance and not
of the structure itself (though in practice it doesn't make much
difference): sizeof(*modes_backup).


>  	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>  	found =3D igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotc=
lock);
> @@ -6401,8 +6406,14 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConne=
ctor *connector,
>  		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>  		found =3D igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dot=
clock);
>  	}
> -	if (found)
> +	if (found) {
>  		*mode =3D connector->modes[0];
> +	} else {
> +		memcpy(connector->modes, modes_backup,
> +		       connector->count_modes * sizeof(drmModeModeInfo));
> +	}
> +
> +	free(modes_backup);
>  	return found;
>  }
> =20
> @@ -6438,6 +6449,11 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeCon=
nector *connector,
>  			  int max_dotclock, drmModeModeInfo *mode)
>  {
>  	bool found =3D false;
> +	drmModeModeInfo *modes_backup;
> +
> +	modes_backup =3D malloc(connector->count_modes * sizeof(drmModeModeInfo=
));
> +	igt_assert(modes_backup);
> +	memcpy(modes_backup, connector->modes, connector->count_modes * sizeof(=
drmModeModeInfo));
> =20
>  	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>  	found =3D igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
> @@ -6445,8 +6461,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeCon=
nector *connector,
>  		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>  		found =3D igt_ultrajoiner_possible(&connector->modes[0], max_dotclock)=
;
>  	}
> -	if (found)
> +	if (found) {
>  		*mode =3D connector->modes[0];
> +	} else {
> +		memcpy(connector->modes, modes_backup,
> +		       connector->count_modes * sizeof(drmModeModeInfo));
> +	}
> +
> +	free(modes_backup);
>  	return found;
>  }
> =20

Generally this looks okay to fix the bug, but IMHO the actual problem
is that we shouldn't really be sorting the modes in order to find them.
Maybe it would be better to use an find_max_res_mode() or something
similar instead of using the sort function to find the mode you want?

--
Cheers,
Luca.
