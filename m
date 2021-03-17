Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D826E04E
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:06 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:49:43 -0400
Message-Id: <20210317224949.448284-2-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/7] lib/drmtest: Use igt_assert_eq() for
 do_or_die()
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
Cc: Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Noticed this while working on some nouveau tests, if we use igt_assert_eq()
here we'll output both the expected and returned value instead of just the
expected value.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/drmtest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index d393dbf1..789452ea 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -113,7 +113,7 @@ bool is_vc4_device(int fd);
  * that in any failure case the return value is non-zero and a precise error is
  * logged into errno. Uses igt_assert() internally.
  */
-#define do_or_die(x) igt_assert((x) == 0)
+#define do_or_die(x) igt_assert_eq((x), 0)
 
 /**
  * do_ioctl:
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
