Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024186E85F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:12 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:49:47 -0400
Message-Id: <20210317224949.448284-6-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] lib/debugfs: Fix igt_crc_t docs to
 mention has_valid_frame
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

Looks like this never got updated when has_valid_frame got added.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/igt_debugfs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index d43ba6c6..97cbaa1c 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -70,10 +70,11 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
 /**
  * igt_crc_t:
  * @frame: frame number of the capture CRC
+ * @has_valid_frame: whether this CRC entry has a valid frame counter
  * @n_words: internal field, don't access
  * @crc: internal field, don't access
  *
- * Pipe CRC value. All other members than @frame are private and should not be
+ * Pipe CRC value. All other members than @frame and @has_valid_frame are private and should not be
  * inspected by testcases.
  */
 typedef struct {
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
