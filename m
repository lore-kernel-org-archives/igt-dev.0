Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FAA6E859
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:10 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:49:44 -0400
Message-Id: <20210317224949.448284-3-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/7] lib/drmtest: And use do_or_die() in
 do_ioctl()
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

No need to use igt_assert_eq() here now that do_or_die() uses
igt_assert_eq()

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/drmtest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 789452ea..c4b15a26 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -125,7 +125,7 @@ bool is_vc4_device(int fd);
  * successfully executed.
  */
 #define do_ioctl(fd, ioc, ioc_data) do { \
-	igt_assert_eq(igt_ioctl((fd), (ioc), (ioc_data)), 0); \
+	do_or_die(igt_ioctl((fd), (ioc), (ioc_data))); \
 	errno = 0; \
 } while (0)
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
