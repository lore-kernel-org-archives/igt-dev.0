Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481776E2CF
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 11:31:40 +0000 (UTC)
From: "Saarinen, Jani" <jani.saarinen@intel.com>
Date: Wed, 18 Dec 2019 11:31:38 +0000
Message-ID: <43D4F724E12AB6478FC1572B3FBE89D076A5E829@IRSMSX106.ger.corp.intel.com>
References: <20191218112012.3539911-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191218112012.3539911-1-chris@chris-wilson.co.uk>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Open DRM_MASTER for display
 operations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Chris
> Wilson
> Sent: keskiviikko 18. joulukuuta 2019 13.20
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests: Open DRM_MASTER for display operations
> 
> To configure the display, one is required to be the DRM_MASTER.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/855
Is this change also for : https://gitlab.freedesktop.org/drm/intel/issues/844 ?

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/kms_content_protection.c | 2 +-
>  tests/kms_panel_fitting.c      | 2 +-
>  tests/kms_plane_alpha_blend.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 8b361fdef..3b9cedcb4 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -654,7 +654,7 @@ static void test_content_protection_cleanup(void)
>  igt_main
>  {
>  	igt_fixture {
> -		data.drm_fd = drm_open_driver(DRIVER_ANY);
> +		data.drm_fd =
> drm_open_driver_master(DRIVER_ANY);
> 
>  		igt_display_require(&data.display, data.drm_fd);
>  	}
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c index
> ac24730f8..065fc2df8 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -252,7 +252,7 @@ igt_main
>  	data_t data = {};
> 
>  	igt_fixture {
> -		data.drm_fd = drm_open_driver(DRIVER_ANY);
> +		data.drm_fd =
> drm_open_driver_master(DRIVER_ANY);
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
>  	}
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index d7dc44ab9..085099f81 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -565,7 +565,7 @@ igt_main
>  	enum pipe pipe;
> 
>  	igt_fixture {
> -		data.gfx_fd = drm_open_driver(DRIVER_ANY);
> +		data.gfx_fd =
> drm_open_driver_master(DRIVER_ANY);
>  		igt_require_pipe_crc(data.gfx_fd);
>  		igt_display_require(&data.display, data.gfx_fd);
>  		igt_require(data.display.is_atomic);
> --
> 2.24.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
