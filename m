Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B32CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 10:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0710E02D;
	Thu, 26 Sep 2024 10:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFoNonq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E27310E02D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727347799; x=1758883799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JfpZ12KNMOEqEMk24xWOvgKK9YmzTW7cZPCJF36Mj2w=;
 b=HFoNonq4qd8+S7NZpK4qjTfCJ4pZ9hqSsJsqpehcEnv5sNa8oFWufYdO
 eo838jFocNVCr0XbmoZM9CUsGiWnjnV991e1Tyikx4EfF5+OCquj0ZJQ7
 OI3+TjjFAah9XIedvsWyEB1wet91+2y9KiWVn1LePmC7q5A22V8NGmIp/
 Ux4G60I/Z9R3zVNZFgZzBrdU/fJT6NvKII0nU92XiTZb0vLrRXxGvGjCu
 Z6E+PvtLYqwpxaCdiVI2T7cQplKniSKeA3fQC8Za9Y8bTx0m/en66ppkG
 pJzoEhMmRK84O8gpU3nI4ekYU/wDeeM2QuR68U4Vaqx2grQd2UPTBVS3r A==;
X-CSE-ConnectionGUID: mnHzk5plTVSwq5g2/wLV1A==
X-CSE-MsgGUID: vYzsAhiMQ8qOpCYXajF++g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48963132"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="48963132"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:49:58 -0700
X-CSE-ConnectionGUID: I2UJ9KNkTjenOUZ4ggHjeg==
X-CSE-MsgGUID: Fb3Hrzy0QGKzkdSrb6Tg6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="72909307"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:49:57 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/3] tests/xe_eudebug: Keep engine for each client
Date: Thu, 26 Sep 2024 13:39:37 +0300
Message-Id: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

If we only find hardware engine for first client,
it can be stale for other clients, after we close
the first client, as it was associated through the fd
and we should not trust lib/xe internals how it handles
the engine array.

I found this when trying to track down:

[  132.467616] xe 0000:00:02.0: [drm] *ERROR* Ioctl argument check
failed at drivers/gpu/drm/xe/xe_exec_queue.c:611:
eci[0].gt_id >= xe->info.gt_count

transient error when running xe_eudebug@discovery-empty.
Implying that a provided class_instance was corrupted/stale.

Rediscover the engine for each opened client so that
it points to a proper valid entry for exec_queue_create.

Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 40e07ddf6..a2b2f3596 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1007,7 +1007,6 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
 #define DISCOVERY_VM_BIND		(1 << 3)
 static void run_discovery_client(struct xe_eudebug_client *c)
 {
-	struct drm_xe_engine_class_instance *hwe = NULL;
 	int fd[RESOURCE_COUNT], i;
 	bool skip_sleep = c->flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT);
 	uint64_t addr = 0x1a0000;
@@ -1015,20 +1014,15 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 	srand(getpid());
 
 	for (i = 0; i < RESOURCE_COUNT; i++) {
+		struct drm_xe_engine_class_instance *hwe = NULL;
+
 		fd[i] = xe_eudebug_client_open_driver(c);
 
-		if (!i) {
-			bool found = false;
+		/* Get first */
+		xe_eudebug_for_each_engine(fd[i], hwe)
+			break;
 
-			xe_for_each_engine(fd[0], hwe) {
-				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ||
-				    hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
-					found = true;
-					break;
-				}
-			}
-			igt_assert(found);
-		}
+		igt_assert(hwe);
 
 		/*
 		 * Give the debugger a break in event stream after every
-- 
2.34.1

