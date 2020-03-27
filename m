Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77606E9CC
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 08:05:36 +0000 (UTC)
Date: Fri, 27 Mar 2020 10:01:42 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20200327080142.GA26731@intel.com>
References: <20200326135322.9958-1-mika.kahola@intel.com>
 <20200326135322.9958-3-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326135322.9958-3-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/kms_concurrent: Plug
 possible memory leaks
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 03:53:22PM +0200, Mika Kahola wrote:
> Free dynamically allocated memory that has a potential
> to leak memory.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  tests/kms_concurrent.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

TBH dynamically allocating memory here seems to be overkill
anyway. We already know for sure that max planes that we are going
to have is no more than 8, We could just set limit of max planes to
lets say even 10 and just do all this stuff in stack, thus avoiding
those issues.

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 1a7c12fc..1403e990 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -193,6 +193,10 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
>  				    max_planes, output);
>  
>  	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
> +
> +	free(x);
> +	free(y);
> +	free(size);
>  }
>  
>  static int test_bandwidth(data_t *data, enum pipe pipe, igt_output_t *output)
> @@ -228,6 +232,10 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
>  	while (i < iterations || loop_forever) {
>  		prepare_planes(data, pipe, max_planes, output);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		for (int c = 0; c < max_planes; c++)
> +			igt_remove_fb(data->drm_fd, &data->fb[c]);
> +
>  		i++;
>  	}
>  }
> -- 
> 2.20.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
