Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAB810E169
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 05:22:45 +0000 (UTC)
Message-ID: <013d21eb-00b0-9b75-1e3c-8ff9e4a62196@intel.com>
Date: Fri, 8 Jul 2022 10:52:26 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220630145816.68461-2-mohammed.thasleem@intel.com>
 <20220707092211.16895-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220707092211.16895-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 1/1] tests/i915/kms_legacy_colorkey: Create
 dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu-07-07-2022 02:52 pm, Mohammed Thasleem wrote:
> Modified kms_legacy_colorkey to include dynamic test cases.
> 
> v2: Updated igt_dynamic subtest names of invalid-plane.
> v3: Minor changes.
> v4: Changes in discription.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> ---
>   tests/i915/kms_legacy_colorkey.c | 50 +++++++++++++++++++++++---------
>   1 file changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
> index de9610a7..5b2fd64b 100644
> --- a/tests/i915/kms_legacy_colorkey.c
> +++ b/tests/i915/kms_legacy_colorkey.c
> @@ -43,28 +43,50 @@ static void test_plane(uint32_t plane_id, int expected_ret)
>   				   sizeof(ckey)) == expected_ret);
>   }
>   
> -igt_simple_main
> +igt_main
>   {
> -	drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +	igt_fixture {
> +		drm_fd = drm_open_driver_master(DRIVER_INTEL);
>   
> -	kmstest_set_vt_graphics_mode();
> +		kmstest_set_vt_graphics_mode();
>   
> -	igt_display_require(&display, drm_fd);
> +		igt_display_require(&display, drm_fd);
> +		for_each_pipe(&display, p) {
> +			for_each_plane_on_pipe(&display, p, plane) {
> +				max_id = max(max_id, plane->drm_plane->plane_id);
> +			}
> +		}
> +
> +	}
>   
> -	for_each_pipe(&display, p) {
> -		for_each_plane_on_pipe(&display, p, plane) {
> -			bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
> -			                 plane->type == DRM_PLANE_TYPE_CURSOR);
> -			test_plane(plane->drm_plane->plane_id,
> -				   is_valid ? -ENOENT : 0);
> +	igt_describe("Test to check the legacy set colorkey ioctl "
> +		     "only works for sprite planes.\n");
> +	igt_subtest_with_dynamic("basic") {
> +		for_each_pipe(&display, p) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(p)) {
> +				for_each_plane_on_pipe(&display, p, plane) {
> +					bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
> +							 plane->type == DRM_PLANE_TYPE_CURSOR);
>   
> -			max_id = max(max_id, plane->drm_plane->plane_id);
> +					test_plane(plane->drm_plane->plane_id,
> +						   is_valid ? -ENOENT : 0);
> +					max_id = max(max_id, plane->drm_plane->plane_id);
> +				}
> +			}
>   		}
>   	}
>   
>   	/* try some invalid IDs too */
> -	test_plane(0, -ENOENT);
> -	test_plane(max_id + 1, -ENOENT);
> +	igt_describe("Check invalid plane id's, zero and outrange\n");
> +	igt_subtest_with_dynamic("invalid-plane") {
> +		igt_dynamic("zero-id")
> +			test_plane(0, -ENOENT);
> +		igt_dynamic("outrange-id")
> +			test_plane(max_id + 1, -ENOENT);
> +	}
>   
> -	igt_display_fini(&display);
> +	igt_fixture {
> +		igt_display_fini(&display);
> +		close(drm_fd);
> +	}
>   }
