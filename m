Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520310E5A3
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 05:42:53 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Mar 2022 05:42:46 +0000
Message-ID: <042e7fc1bea04c4789c2a2a2d0d948b4@intel.com>
References: <20220328051727.119142-1-riana.tauro@intel.com>
 <20220328051727.119142-2-riana.tauro@intel.com>
In-Reply-To: <20220328051727.119142-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/drmtest : add function to call
 exit handler to unload i915 module
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Monday, March 28, 2022 10:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Dixit,
> Ashutosh <ashutosh.dixit@intel.com>
> Subject: [PATCH i-g-t 1/3] lib/drmtest : add function to call exit handle=
r to
> unload i915 module
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Unload of i915 module needs closing of  at_exit_drm_fd.
> Add a function that calls the exit handler of at_exit_drm_fd to unload mo=
dule
We are not calling the exit handler directly, may be need to rephrase the c=
ommit log ?
> successfully
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> ---
>  lib/drmtest.c | 17 +++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c index 09a9a229..e84e0360 10064=
4
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -588,6 +588,23 @@ int drm_open_driver(int chipset)
>  	return fd;
>  }
>=20
> +/**
> + * drm_cancel_work_at_exit:
How about drmtest_cancel_work_prior_unload_i915  ?
> + *
> + * calls __cancel_work_at_exit and closes
> + * at_exit_drm_fd to allow unloading of the module.
> + */
> +void drm_cancel_work_at_exit(void)
> +{
> +	if (at_exit_drm_fd < 0)
> +		return;
> +
> +	__cancel_work_at_exit(at_exit_drm_fd);
> +
> +	close(at_exit_drm_fd);
> +	at_exit_drm_fd =3D -1;
> +}
> +
>  /**
>   * drm_open_driver_master:
>   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL di=
ff --git
> a/lib/drmtest.h b/lib/drmtest.h index b5debd44..df551873 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -88,6 +88,7 @@ void __set_forced_driver(const char *name);
>   */
>  #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
>=20
> +void drm_cancel_work_at_exit(void);
>  void drm_load_module(unsigned int chipset);  int drm_open_driver(int chi=
pset);
> int drm_open_driver_master(int chipset);
> --
> 2.25.1
