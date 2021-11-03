Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9665E6EA17
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 09:55:19 +0000 (UTC)
Date: Wed, 3 Nov 2021 11:53:59 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYJcN4//SrpOwoJg@platvala-desk.ger.corp.intel.com>
References: <20211101163730.2769897-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101163730.2769897-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: igt_require_pipe_crc
 for flip_vs_cursor_crc
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

On Mon, Nov 01, 2021 at 12:37:30PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> test_init uses CRC in debugfs which is not supported by some drivers.
> 
> [How]
> igt_require_pipe_crc before igt_pipe_crc_new is called.
> 
> Test: igt@kms_cursor_legacy@flip-vs-cursor-crc-{atomic,legacy} on
> ChromeOS Jacuzzi (MTK)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_cursor_legacy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 81362807..b006e566 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1281,6 +1281,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>  
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
> +	igt_require_pipe_crc(display->drm_fd);
>  	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);

These requirement checks should be done before doing anything to the
system state, even from the context lines of this diff I see a commit
being done. So this require call should be at the very beginning of
this function, or in the igt_subtest() block, or in an igt_fixture
preferrably.

What about flip_vs_cursor_busy_crc?

flip_vs_cursor_crc and flip_vs_cursor_busy_crc are both called in neat
subtest groups already so I suppose the most elegant solution for both
is to add

igt_fixture {
  igt_require_pipe_crc(display.drm_fd);
}

to the beginning of both those groups.


-- 
Petri Latvala
