Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BB389F69
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2020 05:25:17 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Mon, 15 Jun 2020 10:48:48 +0530
Message-Id: <20200615051848.24654-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] lib/rendercopy: Specify the correct vertex buffer
 offset
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
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

We must specify the correct vertex buffer offset as
"End Offset Enable" bit is not enabled in 3DPRIMITIVE instruction.

This fixes below fatal error:

 [FATAL]:
 ***** **** *** ** * FATAL * ** *** **** *****
 StateArbiter>Surface State Pointers in the binding table must be 64 byte aligned.
 Be sure that the binding table is set up correctly. Address found: 6b6b6b6b
 ***** **** *** ** END FATAL ** *** **** *****

Bspec: 56206

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 85ae4cabc..695806500 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -951,7 +951,7 @@ static void gen8_emit_primitive(struct intel_batchbuffer *batch, uint32_t offset
 	OUT_BATCH(GEN4_3DPRIMITIVE | (7-2));
 	OUT_BATCH(0);	/* gen8+ ignore the topology type field */
 	OUT_BATCH(3);	/* vertex count */
-	OUT_BATCH(0);	/*  We're specifying this instead with offset in GEN6_3DSTATE_VERTEX_BUFFERS */
+	OUT_BATCH(offset);
 	OUT_BATCH(1);	/* single instance */
 	OUT_BATCH(0);	/* start instance location */
 	OUT_BATCH(0);	/* index buffer offset, ignored */
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
