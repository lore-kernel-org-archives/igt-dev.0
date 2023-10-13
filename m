Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE59A10E59C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:01:39 +0000 (UTC)
Message-ID: <38435f08-a60e-ee24-593d-46614a666eba@intel.com>
Date: Fri, 13 Oct 2023 10:31:15 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231011083557.65193-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231011083557.65193-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_interruptible: use
 pipe_name followed by output_name
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


On 10/11/2023 2:05 PM, Swati Sharma wrote:
> Use pipe_name followed by output_name.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_atomic_interruptible.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
> index 0ae2435f9..1a104106a 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -363,7 +363,7 @@ igt_main
>   			if (!pipe_output_combo_valid(&display, pipe, output))
>   				continue;
>   
> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
>   			break;
>   		}
> @@ -375,7 +375,7 @@ igt_main
>   			if (!pipe_output_combo_valid(&display, pipe, output))
>   				continue;
>   
> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
>   			break;
>   		}
> @@ -387,7 +387,7 @@ igt_main
>   			if (!pipe_output_combo_valid(&display, pipe, output))
>   				continue;
>   
> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
>   			break;
>   		}
> @@ -399,7 +399,7 @@ igt_main
>   			if (!pipe_output_combo_valid(&display, pipe, output))
>   				continue;
>   
> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
>   			break;
>   		}
> @@ -411,7 +411,7 @@ igt_main
>   			if (!pipe_output_combo_valid(&display, pipe, output))
>   				continue;
>   
> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
>   			break;
>   		}
> @@ -423,7 +423,7 @@ igt_main
>   			if (!pipe_output_combo_valid(&display, pipe, output))
>   				continue;
>   
> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
>   			break;
>   		}
> @@ -435,7 +435,7 @@ igt_main
>   			if (!pipe_output_combo_valid(&display, pipe, output))
>   				continue;
>   
> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
>   			break;
>   		}
