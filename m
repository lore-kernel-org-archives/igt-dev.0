Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7C16E479
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:13:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7783010BE8BB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:11:35 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Mon, 16 Mar 2020 12:11:28 -0400
Message-Id: <20200316161132.29833-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Fixes for GCC 10's -fcommon default
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

It appears that since GCC 10, -fcommon has become the default over the
previous -fno-common causing igt builds to fail by default. Likewise,
we've also started setting -fcommon by default when building RPMs in
Fedora (likewise, this has broken igt-gpu-tools builds for a while and
I'm only just now getting to fixing it). So, let's fix the issues this
introduced and make -fcommon the default in igt as well to prevent
breakages from this in the future.

Lyude Paul (4):
  lib/igt_core: Make igt_subtest_jmpbuf/igt_dynamic_jmpbuf extern
  lib/rendercopy_gen*: Make cc/viewport static
  assembler/gen4asm.h: Make struct src_operand extern
  meson: Add -fcommon to cc_flags

 assembler/gen4asm.h   | 2 +-
 lib/igt_core.c        | 3 +++
 lib/igt_core.h        | 4 ++--
 lib/rendercopy_gen8.c | 4 ++--
 lib/rendercopy_gen9.c | 4 ++--
 meson.build           | 1 +
 6 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
