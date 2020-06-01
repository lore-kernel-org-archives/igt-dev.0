Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDA789D8D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2020 09:14:18 +0000 (UTC)
Date: Mon, 1 Jun 2020 12:14:14 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200601091414.i7nc2mlwzcaeaken@ahiler-desk1.fi.intel.com>
References: <20200307211751.22125-3-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307211751.22125-3-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [i-g-t,
 2/3] test/kms: Loop for enable pipes only in static iteration
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Mar 08, 2020 at 02:47:50AM +0530, Mohammed Khajapasha wrote:
> In non-contiguous pipes display, the static iteration of pipes
> in test can cause iteration over disabled pipes and segmentation
> fault in test.
> 
> for example, if PIPE_C,D are disabled and PIPE_A,B are enabled
> in kernel, test case will iterate over PIPE_C,D in
> for_each_pipe_static() even pipes C,D disabled and cause
> segmentation fault while accessing pipes display pipes.
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  lib/igt_kms.h                 | 7 +++++--
>  tests/kms_busy.c              | 2 +-
>  tests/kms_ccs.c               | 2 +-
>  tests/kms_color.c             | 2 +-
>  tests/kms_color_chamelium.c   | 2 +-
>  tests/kms_concurrent.c        | 2 +-
>  tests/kms_cursor_crc.c        | 2 +-
>  tests/kms_cursor_edge_walk.c  | 2 +-
>  tests/kms_cursor_legacy.c     | 2 +-
>  tests/kms_pipe_crc_basic.c    | 2 +-
>  tests/kms_plane.c             | 2 +-
>  tests/kms_plane_alpha_blend.c | 2 +-
>  tests/kms_plane_cursor.c      | 2 +-
>  tests/kms_plane_lowres.c      | 2 +-
>  tests/kms_plane_multiple.c    | 2 +-
>  tests/kms_plane_scaling.c     | 2 +-
>  tests/kms_universal_plane.c   | 2 +-
>  tests/kms_vblank.c            | 2 +-
>  18 files changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index cd3fdbc0..b534ae64 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -494,8 +494,11 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>   * This should be used to enumerate per-pipe subtests since it has no runtime
>   * depencies.
>   */
> -#define for_each_pipe_static(pipe) \
> -	for (pipe = 0; pipe < IGT_MAX_PIPES; pipe++)
> +#define for_each_pipe_static(display, __pipe)	\
> +	for (int p__ = (__pipe) = 0;	\
> +			__pipe < IGT_MAX_PIPES && p__ < (display)->n_pipes; __pipe++, p__++)	\
> +			for_each_if ((((display)->pipes[(p__)].pipe) == __pipe))

Hey,

Please pay attention to:
"This should be used to enumerate per-pipe subtests since it has no runtime dependencies."

This applies to all the *_static enumerators.

To put this in contexts:
 1. IGT test binary can have subtest
 2. subtests are listable via --list-subtests
 3. this should always list all possible subtests no matter the machine
    you are running this on
 4. you should be able to run such tests (--run-subtest) and it should
    skip

With this change you are trying to make --list-subtests produce a
machine-specific output.

On top of this igt_display_t should be initialized in igt_fixture block
which is not evaluated during --list-subtests, so this breaks subtest
listing completely.

https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-gpu-tools-Core.description
https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-fixture

Instead you should make sure that all the tests that go over pipes are
using the appropriate iterators and skip for pipe letters that are not
there.

A lot of test are using this for skipping:
  igt_skip_on(pipe >= display.n_pipes);

which should be turned into something like:
  igt_require_pipe(display, pipe);

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
