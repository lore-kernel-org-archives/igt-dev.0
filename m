Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B0A10E177
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Nov 2022 06:45:46 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 1 Nov 2022 06:45:37 +0000
Message-ID: <CY5PR11MB62110F00B27ADBEC30A17CBB95369@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20221031195859.127493-1-rodrigo.vivi@intel.com>
 <20221031195859.127493-2-rodrigo.vivi@intel.com>
In-Reply-To: <20221031195859.127493-2-rodrigo.vivi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tools/intel_pm_rpm: Only init
 debufs_fd if needed.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Tuesday, November 1, 2022 1:29 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t 2/2] tools/intel_pm_rpm: Only init debufs_fd if
> needed.
>=20
> So we can run a --setup-d3cold without depending on the presence of a
> debugfs.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
LGTM
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tools/intel_pm_rpm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c index
> 05d7f6fb..17cd2bc1 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -197,10 +197,9 @@ int main(int argc, char *argv[])
>  		goto exit;
>  	}
>=20
> -	data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> -
>  	data.res =3D drmModeGetResources(data.drm_fd);
>  	if (data.res) {
> +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>=20
> @@ -240,7 +239,8 @@ exit:
>  	if (data.res)
>  		igt_display_fini(&data.display);
>=20
> -	close(data.debugfs_fd);
> +	if (data.debugfs_fd)
> +		close(data.debugfs_fd);
>  	close(data.drm_fd);
>  	igt_devices_free();
>=20
> --
> 2.37.3
