Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB26D6E04E
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:05 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:49:42 -0400
Message-Id: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/7] lib: Miscellaneous cleanups from
 nouveau work
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
To: nouveau@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

These are just a couple of small fixes that didn't seem important
enough to stick in their own patch series, but were various issues with
igt that I found along the way during my recent nouveau igt work.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>

Lyude Paul (7):
  lib/drmtest: Use igt_assert_eq() for do_or_die()
  lib/drmtest: And use do_or_die() in do_ioctl()
  lib/drmtest: Remove i915 refs in do_ioctl*() docs
  lib/igt_fb: Remove domain from igt_fb
  lib/debugfs: Fix igt_crc_t docs to mention has_valid_frame
  lib/igt_aux: Print name of debug var in igt_debug_wait_for_keypress()
  lib/debugfs: Fix function name in igt_pipe_crc_get_for_frame() docs

 lib/drmtest.h     | 8 ++++----
 lib/igt_aux.c     | 2 +-
 lib/igt_debugfs.c | 2 +-
 lib/igt_debugfs.h | 3 ++-
 lib/igt_fb.c      | 3 ---
 lib/igt_fb.h      | 2 --
 6 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
