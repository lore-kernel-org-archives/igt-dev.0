Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF4B10E4A6
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 19:14:13 +0000 (UTC)
Message-ID: <ad9c31e5-60fc-5e07-132d-80f14a730b6d@intel.com>
Date: Thu, 10 Aug 2023 00:43:36 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-35-bhanuprakash.modem@intel.com>
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
In-Reply-To: <20230629144910.3055377-35-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5, i-g-t,
 34/81] tests/kms_atomic: Document each subtest for testplan
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

LGTM
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>

On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_atomic.c | 102 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 100 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index b65045abc..f07d47abc 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -27,8 +27,10 @@
>    *    Pekka Paalanen <pekka.paalanen@collabora.co.uk>
>    */
>   
> -/*
> - * Testcase: testing atomic modesetting API
> +/**
> + * TEST: kms atomic
> + * Category: Display
> + * Description: Test atomic modesetting API
>    */
>   
>   #include <unistd.h>
> @@ -287,6 +289,16 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
>   	return 0;
>   }
>   
> +/**
> + * SUBTEST: plane-primary-overlay-mutable-zpos
> + * Description: Verify that the overlay plane can cover the primary one (and
> + *              vice versa) by changing their zpos property.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void
>   plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
>   				   igt_plane_t *primary, igt_plane_t *overlay,
> @@ -369,6 +381,16 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
>   	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
>   }
>   
> +/**
> + * SUBTEST: plane-immutable-zpos
> + * Description: Verify the reported zpos property of planes by making sure only
> + *              higher zpos planes cover the lower zpos ones.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void
>   plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>   		     igt_output_t *output)
> @@ -505,6 +527,22 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>   	igt_remove_fb(display->drm_fd, &fb_upper);
>   }
>   
> +/**
> + * SUBTEST: plane-%s-legacy
> + * Description: Test for KMS atomic modesetting on %arg[1] and ensure coherency
> + *              between legacy and atomic interfaces.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @cursor:         Cursor plane
> + * @overlay:        Overlay plane
> + * @primary:        Primary plane
> + */
>   static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *plane)
>   {
>   	drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -579,6 +617,17 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
>   	plane_commit(plane, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
>   }
>   
> +/**
> + * SUBTEST: test-only
> + * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
> + *              the free-standing state objects and nothing else.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
>   /* test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
>    * free-standing state objects and nothing else.
>    */
> @@ -687,6 +736,20 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
>   	plane_commit(cursor, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
>   }
>   
> +/**
> + * SUBTEST: plane-invalid-%s
> + * Description: Test error handling when invalid %arg[1] are passed
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @params:           plane parameters
> + * @params-fence:     plane fence parameters
> + */
>   static void plane_invalid_params(igt_pipe_t *pipe,
>   				 igt_output_t *output,
>   				 igt_plane_t *plane,
> @@ -776,6 +839,20 @@ static void plane_invalid_params_fence(igt_pipe_t *pipe,
>   	close(timeline);
>   }
>   
> +/**
> + * SUBTEST: crtc-invalid-%s
> + * Description: Test error handling when invalid %arg[1] are passed
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @params:           crtc parameters
> + * @params-fence:     crtc fence parameters
> + */
>   static void crtc_invalid_params(igt_pipe_t *pipe,
>   				igt_output_t *output,
>   				igt_plane_t *plane,
> @@ -923,6 +1000,18 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
>   	igt_assert(pipe->out_fence_fd != -1);
>   }
>   
> +/**
> + * SUBTEST: atomic-invalid-params
> + * Description: Test abuse the atomic ioctl directly in order to test various
> + *              invalid conditions which the libdrm wrapper won't allow us to
> + *              create.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
>   /* Abuse the atomic ioctl directly in order to test various invalid conditions,
>    * which the libdrm wrapper won't allow us to create. */
>   static void atomic_invalid_params(igt_pipe_t *pipe,
> @@ -1064,6 +1153,15 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
>   	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
>   }
>   
> +/**
> + * SUBTEST: atomic_plane_damage
> + * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *fb)
>   {
>   	struct drm_mode_rect damage[2];

-- 
~Nidhi Gupta
