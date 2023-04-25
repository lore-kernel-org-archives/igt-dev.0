Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DE810E6BE
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 07:55:14 +0000 (UTC)
Date: Tue, 25 Apr 2023 09:55:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230425075505.4xcmatvhvvmw7v6z@kamilkon-desk1>
References: <20230424183400.465464-1-mcanal@igalia.com>
 <20230424183400.465464-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424183400.465464-2-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_plane_scaling: fix
 variable misspelling
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

Hi,

On 2023-04-24 at 15:33:59 -0300, Maíra Canal wrote:
> As the function test_scaler_with_multi_pipe_plane() intends to test two
> planes, it is necessary to check the output of both planes, not only
> one. Therefore, instead of checking the variable ret1 twice, check the
> variable ret2.
> 
> Fixes: 56bedcde ("tests/kms_plane_scaling: Cleanup")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  tests/kms_plane_scaling.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 302fffcd..7f5cb00d 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -926,7 +926,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>  	cleanup_fbs(d);
>  
>  	igt_skip_on_f(ret1 == -ERANGE || ret1 == -EINVAL ||
> -		      ret2 == -ERANGE || ret1 == -EINVAL,
> +		      ret2 == -ERANGE || ret2 == -EINVAL,

Good catch, thank you for the fix,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		      "Scaling op is not supported by driver\n");
>  	igt_assert_eq(ret1 && ret2, 0);
>  }
> -- 
> 2.40.0
> 
