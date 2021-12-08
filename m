Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0676E72C3D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 16:49:04 +0000 (UTC)
Date: Wed, 8 Dec 2021 18:47:31 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbDhoyqG3UYnjSoH@platvala-desk.ger.corp.intel.com>
References: <20211208163440.4155376-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208163440.4155376-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: igt_require_pipe_crc
 for flip-vs-cursor{-busy}-crc
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, igt-dev@lists.freedesktop.org, tzungbi@google.com, seanpaul@chromium.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 11:34:40AM -0500, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> flip_vs_cursor_crc and flip_vs_cursor_busy_crc use CRC in debugfs which is
> not supported by some drivers.
> 
> [How]
> igt_require_pipe_crc in igt_fixture before the subtests start.
> 
> Test: igt@kms_cursor_legacy@flip-vs-cursor{-busy}-crc-{atomic,legacy} on
> ChromeOS Jacuzzi (MTK)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/kms_cursor_legacy.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index d50155e8..47b9b4e1 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1533,6 +1533,8 @@ igt_main
>  	/*Test description for cursor-crc tests*/
>  	igt_describe("Test will first does a page flip and then cursor update");
>  	igt_subtest_group {
> +		igt_fixture
> +			igt_require_pipe_crc(display.drm_fd);
>  
>  		igt_subtest("flip-vs-cursor-crc-legacy")
>  			flip_vs_cursor_crc(&display, false);
> @@ -1544,6 +1546,8 @@ igt_main
>  	/*Test description for busy-crc tests*/
>  	igt_describe("this test perform a busy bo update followed by a cursor update");
>  	igt_subtest_group {
> +		igt_fixture
> +			igt_require_pipe_crc(display.drm_fd);
>  
>  		igt_subtest("flip-vs-cursor-busy-crc-legacy")
>  			flip_vs_cursor_busy_crc(&display, false);
> -- 
> 2.34.1.400.ga245620fadb-goog
> 
