Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0C510E5C4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:32:13 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2CCFA580D96
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:32:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgmx4-00ABng-0Z
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:31:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:31:55 +0200
Message-Id: <20230327133155.2428454-12-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/11] xe/xe_noexec_ping_pong: document
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Use the SUBTEST tag to add the subtest's description to the
IGT test plan documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_noexec_ping_pong.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
index dc14f8cf3f2d..367671883a28 100644
--- a/tests/xe/xe_noexec_ping_pong.c
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -20,20 +20,22 @@
  * Category: Software building block
  * Sub-category: compute
  * Test category: functionality test
- */
-
-/*
- * This test creates compute vms, binds a couple of bos and an engine each,
- * thus redying it for execution. However, VRAM memory is over-
- * committed and while there is still nothing to execute, an eviction
- * will trigger the VM's rebind worker to rebind the evicted bo, which
- * will in turn trigger another eviction and so on.
  *
- * Since we don't have eviction stats yet we need to watch "top" for
- * the rebind kworkers using a lot of CPU while the test idles.
+ * SUBTEST:
+ * Description:
+ *	This test creates compute vms, binds a couple of bos and an engine each,
+ *	thus redying it for execution. However, VRAM memory is over-
+ *	committed and while there is still nothing to execute, an eviction
+ *	will trigger the VM's rebind worker to rebind the evicted bo, which
+ *	will in turn trigger another eviction and so on.
+ *
+ *	Since we don't have eviction stats yet we need to watch "top" for
+ *	the rebind kworkers using a lot of CPU while the test idles.
  *
- * The correct driver behaviour should be not to rebind anything unless
- * there is worked queued on one of the VM's compute engines.
+ *	The correct driver behaviour should be not to rebind anything unless
+ *	there is worked queued on one of the VM's compute engines.
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 {
-- 
2.39.2
