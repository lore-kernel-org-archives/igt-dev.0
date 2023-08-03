Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C6210E64C
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 17:46:32 +0000 (UTC)
Date: Thu, 3 Aug 2023 20:46:18 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Message-ID: <ZMvnyVOtCXEqtgol@intel.com>
References: <20230707153720.1478-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707153720.1478-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Skip the
 negative test on MST Hub
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 09:07:20PM +0530, Thasleem, Mohammed wrote:
> Skip the test on which MST hub which support bandwidth for 2k-4k
> and 4k-4k multi displays.
> 
> Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> ---
>  tests/kms_display_modes.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 4bebb25e..8e117695 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -310,6 +310,7 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
>  
>  	igt_require(i915_pipe_output_combo_valid(display));
>  	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	igt_skip_on_f(ret == 0, "MST Hub supports bandwidth on multi display\n");

Hi Mohammed,

How do we know if it is MST hub here?

>  	igt_assert(ret != 0 && errno == ENOSPC);
>  }
>  
> -- 
> 2.34.1
> 
