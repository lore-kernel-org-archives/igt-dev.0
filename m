Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6443CE77182
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 13:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F4610E192;
	Wed, 11 Dec 2024 13:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3r4MPjH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C70510E192
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733925054; x=1765461054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=50pJtAFCtTGXWhds7VGLrt62fwYANf8IijDRznmKdrQ=;
 b=S3r4MPjHfhtJHvpOkc5GygU6pqUdDv933zOpCJEy3d1Y+881deI7mNf0
 cTLaAFzUkOopOs2l784xvH590m3e/1qZab9yJfyGBJKmvh4Gg+pFUB2Qr
 zUSIyrEa7yzlEf4EPAKEvx/JLItjGoNh863IphrBhkzx2SeNofOX/VYfX
 I2ZMdhoFUcdriMpuHy8KZgFSUYQmfMz0DBg5S9nsEXDsP/bU6X4viv7GV
 piDcWf3smcjRmlPDA7dRCrd9XI/fVM0PboPxVGXCsU2CQusnHGhhEWwoq
 CcXykzXAYdkJ2UI8TPfDVZXswGeFBfdJF6L6evHdublTdNTPWuKk5t8gJ g==;
X-CSE-ConnectionGUID: M8eIGiOsQ8KXYTtJ8YKNhQ==
X-CSE-MsgGUID: hUO1hNvWTgieWfAlZBSwyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44913425"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="44913425"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:54 -0800
X-CSE-ConnectionGUID: Jr0pX4ZwQUGzJEGlVn0Sbg==
X-CSE-MsgGUID: 089LZs4ySWe84yNsj/V+Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100870267"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.30])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:51 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 1/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-delay-ack test
Date: Wed, 11 Dec 2024 14:50:37 +0100
Message-Id: <20241211135039.5853-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
References: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a test that gives user fence in application and checks if delayed
ufence ack works.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 39db16457..1853dee40 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -54,16 +54,17 @@ static void test_sysfs_toggle(int fd)
 #define STAGE_PRE_DEBUG_RESOURCES_DONE	1
 #define STAGE_DISCOVERY_DONE		2
 
-#define CREATE_VMS		(1 << 0)
-#define CREATE_EXEC_QUEUES	(1 << 1)
-#define VM_BIND			(1 << 2)
-#define VM_BIND_VM_DESTROY	(1 << 3)
-#define VM_BIND_EXTENDED	(1 << 4)
-#define VM_METADATA		(1 << 5)
-#define VM_BIND_METADATA	(1 << 6)
-#define VM_BIND_OP_MAP_USERPTR	(1 << 7)
-#define EXEC_QUEUES_PLACEMENTS	(1 << 8)
-#define TEST_DISCOVERY		(1 << 31)
+#define CREATE_VMS			(1 << 0)
+#define CREATE_EXEC_QUEUES		(1 << 1)
+#define VM_BIND				(1 << 2)
+#define VM_BIND_VM_DESTROY		(1 << 3)
+#define VM_BIND_EXTENDED		(1 << 4)
+#define VM_METADATA			(1 << 5)
+#define VM_BIND_METADATA		(1 << 6)
+#define VM_BIND_OP_MAP_USERPTR		(1 << 7)
+#define EXEC_QUEUES_PLACEMENTS		(1 << 8)
+#define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
+#define TEST_DISCOVERY			(1 << 31)
 
 #define PAGE_SIZE SZ_4K
 #define MDATA_SIZE (WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM * PAGE_SIZE)
@@ -2124,6 +2125,10 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
  * SUBTEST: basic-vm-bind-ufence
  * Description:
  *      Give user fence in application and check if ufence ack works
+ *
+ * SUBTEST: basic-vm-bind-ufence-delay-ack
+ * Description:
+ *	Give user fence in application and check if delayed ufence ack works
  */
 static void test_basic_ufence(int fd, unsigned int flags)
 {
@@ -2148,6 +2153,10 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
 	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
 			    "missing ufence events\n");
+
+	if (flags & VM_BIND_DELAY_UFENCE_ACK)
+		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
+
 	ack_fences(d);
 
 	xe_eudebug_client_wait_done(c);
@@ -2813,6 +2822,9 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence")
 		test_basic_ufence(fd, 0);
 
+	igt_subtest("basic-vm-bind-ufence-delay-ack")
+		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
+
 	igt_subtest("vma-ufence")
 		test_vma_ufence(fd, 0);
 
-- 
2.34.1

