Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B13CDD1B2
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 14:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5AE10EC49;
	Fri, 27 Sep 2024 14:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9zwIf3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857D210EC60
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445834; x=1758981834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=miEhk0UTNwXiaNIJHZXNKGanROu8krMRMKWpOCwLoYk=;
 b=g9zwIf3taFMjAgPWxr6bF3UPQGz2SXsRHQnYjL8r9wj3potFlsO553j/
 P1dKmum4ryC8Kd9nDoQActR5+XJBSGDuZ29grQYnAmHgAV/dFBfjrjvNz
 p3ANiNZVRhBwVpJUlRRfULW5kdozprH5wW8TVrHweYuwCDXusq03N99gP
 UcCUPJBb28ZQz3mm/mw3vZ2w1qelTRY+pnGU2A4MZZmID+uE9GrK7E6kS
 7eOQ3dEcqiSwkMyiR9JrD6DJtbhOItLFvyGFhQMkeWj3oqvQoSrfLyYyq
 G4+0y50CZHjme4R8CXfD/+dW4wxMR4Dsc70ypPhoJ7YllTH5M2d9oSNXa Q==;
X-CSE-ConnectionGUID: mDlkMovgQBq0NqAKU296JQ==
X-CSE-MsgGUID: eGgZrvVSQLKIubqU5ILqcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30480485"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="30480485"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:03:53 -0700
X-CSE-ConnectionGUID: h6vMXRE4Qwis8GPNaQZGgA==
X-CSE-MsgGUID: zAYn62zXRm2pGX90S/5s6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72203105"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:03:51 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/4] tests/xe_eudebug: Keep engine for each client
Date: Fri, 27 Sep 2024 16:53:32 +0300
Message-Id: <20240927135335.1107326-1-mika.kuoppala@linux.intel.com>
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
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index e28c9ab67..1c90fd16a 100644
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

