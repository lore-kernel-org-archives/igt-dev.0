Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35110E302
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jan 2023 10:51:59 +0000 (UTC)
Message-ID: <2d0cec9f-5c0e-d9cc-493e-d26fb0665582@intel.com>
Date: Mon, 2 Jan 2023 11:51:44 +0100
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
References: <7d276e53-0798-dc64-32be-a20bb4fb84a3@linux.intel.com>
 <20230102104901.214146-1-andrzej.hajda@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20230102104901.214146-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: cleanup
 framebuffers after test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 1/2/2023 11:49 AM, Andrzej Hajda wrote:
> Framebuffers created by igt_create_*_fb should be removed with
> igt_remove_fb after test finish. Since all this happens inside
> data_t context there is cleanup_fbs helper for it.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7331
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/kms_plane_scaling.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 4c621cce842..887a55e63ff 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -366,6 +366,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   
>   	igt_plane_set_fb(plane, NULL);
>   	igt_plane_set_position(plane, 0, 0);
> +	cleanup_fbs(d);
>   
>   	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
>   		      "Unsupported scaling factor with fb size %dx%d\n",
> @@ -670,8 +671,7 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   					    test_type);
>   	}
>   
> -	igt_remove_fb(display->drm_fd, &d->fb[1]);
> -	igt_remove_fb(display->drm_fd, &d->fb[2]);
> +	cleanup_fbs(d);
>   }
>   
>   static void
> @@ -735,9 +735,7 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
>   	igt_plane_set_fb(plane[0], NULL);
>   	igt_plane_set_fb(plane[1], NULL);
>   	igt_plane_set_fb(plane[2], NULL);
> -	igt_remove_fb(display->drm_fd, &d->fb[0]);
> -	igt_remove_fb(display->drm_fd, &d->fb[1]);
> -	igt_remove_fb(display->drm_fd, &d->fb[2]);
> +	cleanup_fbs(d);
>   }
>   
>   static void test_scaler_with_multi_pipe_plane(data_t *d)
> @@ -813,6 +811,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>   	igt_plane_set_fb(plane[1], NULL);
>   	igt_plane_set_fb(plane[2], NULL);
>   	igt_plane_set_fb(plane[3], NULL);
> +	cleanup_fbs(d);
>   
>   	igt_skip_on_f(ret1 == -ERANGE || ret1 == -EINVAL ||
>   		      ret2 == -ERANGE || ret1 == -EINVAL,
