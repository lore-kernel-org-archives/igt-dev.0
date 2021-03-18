Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57B86E1B3
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 22:21:39 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Thu, 18 Mar 2021 18:21:24 -0400
Message-Id: <20210318222124.970997-3-lyude@redhat.com>
In-Reply-To: <20210318222124.970997-1-lyude@redhat.com>
References: <20210318222124.970997-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_cursor_crc: Test 32x32
 cursors
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
To: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Since pre-nve4 only has two cursor sizes (32x32 and 64x64), we should at
least test both of them.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_cursor_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index b9c05472..754e1073 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -703,7 +703,7 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 	igt_fixture
 		igt_remove_fb(data->drm_fd, &data->fb);
 
-	for (cursor_size = 64; cursor_size <= 512; cursor_size *= 2) {
+	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
 		int w = cursor_size;
 		int h = cursor_size;
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
