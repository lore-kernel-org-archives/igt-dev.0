Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EC86E9E6
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 10:26:46 +0000 (UTC)
Date: Wed, 3 Nov 2021 12:25:26 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYJjlvTGU25WMT2E@platvala-desk.ger.corp.intel.com>
References: <20211101165824.2810805-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101165824.2810805-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Use
 igt_require_intel before get_reloc_ahnd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: chunkuang.hu@kernel.org, igt-dev@lists.freedesktop.org, seanpaul@chromium.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 01, 2021 at 12:58:24PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> get_reloc_ahnd uses the intel allocator, which is not supported on
> non-intel devices.
> 
> [How]
> Call igt_require_intel before any call to get_reloc_ahnd.
> 
> Test: igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-{atomic,legacy} on
> ChromeOS Jacuzzi (MTK)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/kms_cursor_legacy.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 81362807..e48cdf6c 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -522,10 +522,16 @@ static void basic_flip_cursor(igt_display_t *display,
>  	struct igt_fb fb_info, cursor_fb, cursor_fb2, argb_fb;
>  	unsigned vblank_start;
>  	enum pipe pipe = find_connected_pipe(display, false);
> -	uint64_t ahnd = (flags & BASIC_BUSY) ? get_reloc_ahnd(display->drm_fd, 0) : 0;
> +	uint64_t ahnd = 0;
>  	igt_spin_t *spin;
>  	int i, miss1 = 0, miss2 = 0, delta;
>  
> +	if (flags & BASIC_BUSY)
> +	{
> +		igt_require_intel(display->drm_fd);
> +		ahnd = get_reloc_ahnd(display->drm_fd, 0);
> +	}
> +
>  	if (mode >= flip_test_atomic)
>  		igt_require(display->is_atomic);
>  
> @@ -1327,6 +1333,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>  	igt_pipe_t *pipe_connected = &display->pipes[pipe];
>  	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
>  	igt_crc_t crcs[2], test_crc;
> +	igt_require_intel(display->drm_fd);
>  	uint64_t ahnd = get_reloc_ahnd(display->drm_fd, 0);
>  
>  	if (atomic)
> -- 
> 2.33.1.1089.g2158813163f-goog
> 
