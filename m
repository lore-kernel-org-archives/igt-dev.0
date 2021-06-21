Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE288997E
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 08:39:37 +0000 (UTC)
Date: Mon, 21 Jun 2021 11:41:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YNBQv/jOJspSW/4B@platvala-desk.ger.corp.intel.com>
References: <20210618142855.5750-1-Anson.Jacob@amd.com>
 <20210618142855.5750-2-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618142855.5750-2-Anson.Jacob@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_kms: Fix test_init() crash
 when <6 pipes
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
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 10:28:52AM -0400, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
> 
> [why & how]
> An upstream change is causing the common amdgpu test_init() to crash on
> ASICs with <6 pipes.
> 
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> ---
>  lib/igt_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c7c69b6ea0eb..26c51a384918 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2164,8 +2164,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	 * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CRTC_ID ioctl
>  	 * for a pipe to do pipe ordering with respect to crtc list.
>  	 */
> -	display->n_pipes = IGT_MAX_PIPES;
> -	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
> +	display->n_pipes = resources->count_crtcs;
> +	display->pipes = calloc(sizeof(igt_pipe_t), IGT_MAX_PIPES);
>  	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);


NAK on this, this will break i915 testing.

A little background: The IGT interface for CRTCs has been changed to
accomodate Intel HW change where some pipes are disabled leaving
holes. The resources->crtcs array still has the crtcs that actually
exist, but it could be for example

count_crtcs = 2
crtcs[0] with PIPE_A
crtcs[1] with PIPE_C

Not all pipes are created equal so we need to track which one is which
so we know which pipe is broken when failures happen.

Now, the IGT interface should be fairly invisible except in
cornercases. Every access to a pipe needs to check pipe->enabled
before doing anything to it, and that's done automatically with things
like for_each_pipe(). Directly selecting a pipe should be the only
case where one needs to do the pipe->enabled check themselves.

Where does it crash for you? I tried to look at the test_init()
functions in tests/amdgpu/*.c but couldn't spot anything that touches
n_pipes. Or even uses anything other than PIPE_A.

I wonder if fixing this for you is as simple as doing

 if (!i915_device) display->n_pipes = i;

after the for loop you're changing here...


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
