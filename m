Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200761124FD
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jul 2022 08:35:29 +0000 (UTC)
Date: Wed, 6 Jul 2022 10:35:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YsVJTYpfAZw0VTkO@kamilkon-desk1>
References: <20220706034846.441338-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220706034846.441338-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_color: Fix memory leaks
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

Hi Bhanuprakash,

On 2022-07-06 at 09:18:46 +0530, Bhanuprakash Modem wrote:
> Free allocated memory before return.
> 
> Fixes: d61e4598
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 0b03fb9a..a9d55d44 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -427,13 +427,14 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  			   lut[i].blue == 0xffff);
>  	drmModeFreePropertyBlob(blob);

There are malloc for red_lut and two others, imho they should be
cleaned up before end: label.

>  
> +end:
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit(&data->display);
>  
>  	free_lut(degamma_linear);
>  	free_lut(gamma_zero);
> -end:
> +

Remove this empty line.

Regards,
Kamil

>  	return ret;
>  }
>  
> -- 
> 2.35.1
> 
