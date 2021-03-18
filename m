Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210317224949.448284-1-lyude@redhat.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <7995a772-c57d-afeb-aa7b-df6f729a3777@mupuf.org>
Date: Thu, 18 Mar 2021 08:48:20 +0200
MIME-Version: 1.0
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 0/7] lib: Miscellaneous cleanups from
 nouveau work
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude <lyude@redhat.com>, nouveau@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>
List-ID: <igt-dev@lists.freedesktop.org>

On 18/03/2021 00:49, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> These are just a couple of small fixes that didn't seem important
> enough to stick in their own patch series, but were various issues with
> igt that I found along the way during my recent nouveau igt work.
> 
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>

This series looks sensible to me, and do not seem to have affected 
Intel's results.

I'll refrain from giving a full R-b because I lack the historical 
context for some of these changes, but it seems safe to me:

Acked-by: Martin Peres <martin.peres@mupuf.org>

> 
> Lyude Paul (7):
>    lib/drmtest: Use igt_assert_eq() for do_or_die()
>    lib/drmtest: And use do_or_die() in do_ioctl()
>    lib/drmtest: Remove i915 refs in do_ioctl*() docs
>    lib/igt_fb: Remove domain from igt_fb
>    lib/debugfs: Fix igt_crc_t docs to mention has_valid_frame
>    lib/igt_aux: Print name of debug var in igt_debug_wait_for_keypress()
>    lib/debugfs: Fix function name in igt_pipe_crc_get_for_frame() docs
> 
>   lib/drmtest.h     | 8 ++++----
>   lib/igt_aux.c     | 2 +-
>   lib/igt_debugfs.c | 2 +-
>   lib/igt_debugfs.h | 3 ++-
>   lib/igt_fb.c      | 3 ---
>   lib/igt_fb.h      | 2 --
>   6 files changed, 8 insertions(+), 12 deletions(-)
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
