Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127D810E6C8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 09:00:37 +0000 (UTC)
Date: Tue, 25 Apr 2023 11:00:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230425090025.6i73v3oqoplztlsr@kamilkon-desk1>
References: <20230424183400.465464-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424183400.465464-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_plane_scaling: negative
 tests can return -EINVAL or -ERANGE
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

On 2023-04-24 at 15:33:58 -0300, Maíra Canal wrote:
> Similar to the subtest invalid-parameters, when the display commit fails
> due to invalid parameters, the commit can return -EINVAL ou -ERANGE, not
> only -EINVAL.
> 
> Fixes: 2372a4beb ("tests/kms_plane_scaling: Add negative test to check num of scalers")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_plane_scaling.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 5008cd93..302fffcd 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -838,7 +838,7 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
>  	 * */
>  	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  	igt_skip_on_f(ret == 0, "Cannot test handling of too many scaling ops, the device supports a large amount.\n");
> -	igt_assert_eq(ret, -EINVAL);
> +	igt_assert(ret == -EINVAL || ret == -ERANGE);
>  
>  	/* cleanup */
>  	igt_plane_set_fb(plane[0], NULL);
> -- 
> 2.40.0
> 
