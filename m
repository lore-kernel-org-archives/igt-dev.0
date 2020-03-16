Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6D56E471
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:12:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707C218CB8FB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:11:36 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Mon, 16 Mar 2020 12:11:30 -0400
Message-Id: <20200316161132.29833-3-lyude@redhat.com>
In-Reply-To: <20200316161132.29833-1-lyude@redhat.com>
References: <20200316161132.29833-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/rendercopy_gen*: Make cc/viewport
 static
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

Since both rendercopy_gen8.c and rendercopy_gen9.c declare cc/viewport
variables without marking them as static, -fcommon also causes these to
make our builds fail:

/usr/bin/ld:
lib/libigt-rendercopy_gen9_c.a(rendercopy_gen9.c.o):lib/rendercopy_gen9.c:46:
multiple definition of `cc';
lib/libigt-rendercopy_gen8_c.a(rendercopy_gen8.c.o):lib/rendercopy_gen8.c:45:
first defined here
/usr/bin/ld:
lib/libigt-rendercopy_gen9_c.a(rendercopy_gen9.c.o):lib/rendercopy_gen9.c:51:
multiple definition of `viewport';
lib/libigt-rendercopy_gen8_c.a(rendercopy_gen8.c.o):lib/rendercopy_gen8.c:50:
first defined here

So, fix this by marking them as static.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/rendercopy_gen8.c | 4 ++--
 lib/rendercopy_gen9.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index 8e02d846..bace64a7 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -39,12 +39,12 @@ static void dump_batch(struct intel_batchbuffer *batch) {
 #define dump_batch(x) do { } while(0)
 #endif
 
-struct {
+static struct {
 	uint32_t cc_state;
 	uint32_t blend_state;
 } cc;
 
-struct {
+static struct {
 	uint32_t cc_state;
 	uint32_t sf_clip_state;
 } viewport;
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 835c8d80..f364c2b9 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -40,12 +40,12 @@ static void dump_batch(struct intel_batchbuffer *batch) {
 #define dump_batch(x) do { } while(0)
 #endif
 
-struct {
+static struct {
 	uint32_t cc_state;
 	uint32_t blend_state;
 } cc;
 
-struct {
+static struct {
 	uint32_t cc_state;
 	uint32_t sf_clip_state;
 } viewport;
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
