Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DAD10E177
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Nov 2022 06:45:11 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 1 Nov 2022 06:45:02 +0000
Message-ID: <CY5PR11MB6211897EF59A7A23880665A595369@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20221031195859.127493-1-rodrigo.vivi@intel.com>
In-Reply-To: <20221031195859.127493-1-rodrigo.vivi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tools/intel_pm_rpm: Remove unused
 devid.
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
> Subject: [PATCH i-g-t 1/2] tools/intel_pm_rpm: Remove unused devid.
>=20
> Just a small clean-up. No functional change.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tools/intel_pm_rpm.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c index
> 53ad252d..05d7f6fb 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -40,7 +40,6 @@
>  typedef struct {
>  	int drm_fd;
>  	int debugfs_fd;
> -	uint32_t devid;
>  	drmModeResPtr res;
>  	igt_display_t display;
>  } data_t;
> @@ -199,7 +198,6 @@ int main(int argc, char *argv[])
>  	}
>=20
>  	data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> -	data.devid =3D intel_get_drm_devid(data.drm_fd);
>=20
>  	data.res =3D drmModeGetResources(data.drm_fd);
>  	if (data.res) {
> --
> 2.37.3
