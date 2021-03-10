Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EDF6E1F4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 12:49:41 +0000 (UTC)
Date: Wed, 10 Mar 2021 14:50:09 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YEjAgf7NcaA/TCDa@platvala-desk.ger.corp.intel.com>
References: <20210310203640.6149-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310203640.6149-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_busy: Limit the execution to
 two pipes
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kunche Kishore <kishore.kunche@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 02:06:40AM +0530, Bhanuprakash Modem wrote:
> As all pipes are symmetric, restrict the execution to two pipes
> can save lot of CI time.
> 
> If we want to execute on all pipes, we need to pass an extra
> argument "-e" indicates extended.
> 
> Example: ./build/tests/kms_busy -e --r basic
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Latvala Petri <petri.latvala@intel.com>
> Cc: Kunche Kishore <kishore.kunche@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_busy.c | 138 ++++++++++++++++++++++++++---------------------
>  1 file changed, 77 insertions(+), 61 deletions(-)
> 
> diff --git a/tests/kms_busy.c b/tests/kms_busy.c
> index df1f8e11a..48ed11229 100644
> --- a/tests/kms_busy.c
> +++ b/tests/kms_busy.c
> @@ -30,6 +30,15 @@
>  
>  IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
>  
> +/* restricted pipe count */
> +#define CRTC_RESTRICT_CNT 2
> +
> +static bool all_pipes = false;
> +
> +#define for_each_pipe_with_valid_output_limited(display, pipe, output, pipe_count) \
> +	for_each_pipe_with_valid_output(display, pipe, output) \
> +			for_each_if(pipe_count-- > 0)
> +
>  static igt_output_t *
>  set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
>  {
> @@ -287,10 +296,41 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
>  	igt_remove_fb(dpy->drm_fd, &fb);
>  }
>  
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +		case 'e':
> +			all_pipes = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
> +
> +igt_main_args("det:", NULL, help_str, opt_handler, NULL)

Same here as in that other patch: You declare det: but handle only e.

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
