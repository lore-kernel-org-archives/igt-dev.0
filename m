Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590F6E059
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:13 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:49:48 -0400
Message-Id: <20210317224949.448284-7-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/7] lib/igt_aux: Print name of debug var in
 igt_debug_wait_for_keypress()
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/igt_aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 1217f5e8..0ab51124 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -997,7 +997,7 @@ void igt_debug_wait_for_keypress(const char *var)
 	    !strstr(igt_interactive_debug, "all"))
 		return;
 
-	igt_info("Press any key to continue ...\n");
+	igt_info("Hit interactive debug var %s, press any key to continue...\n", var);
 
 	tcgetattr ( STDIN_FILENO, &oldt );
 	newt = oldt;
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
