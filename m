Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC762C47DB3
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 18:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5BA10EB3B;
	Mon, 29 Jan 2024 18:54:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FFA112A83
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706554470; x=1738090470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WM/hG4ZzPPdPVMiluTM9zoIFVDqLjBLKISwBNU0isJs=;
 b=Hnkxz6o1d6Yz/md4/gPMdUPfgJk5VXo6z9CnllwhRXm6Fv1fU7NLwzpx
 GeHR1VvniRsi54nbi8jDdSL5lNTxyF2ekS5/X0Ju4kMdM2ARdnubstT4o
 OUfGzPWvSyHlqpaHfsvDIq7QI21VaKI0B4x1Rd5Du9DupPpchgIgHnRKw
 TYXGgVd8W8sPn8WL5CA2Ky1SicKmISUtIrzDqapEmkvo/LNLqF++VGFnE
 Tf2Z1KTXrCYG+pP2pruYtp91npTXp5Ap+1gWvWCVpLy577rKUh1VvFM5+
 +p0IlzS7fAeJWKAxPQzAH9lsbCkY5BSdaKaixyUO/Tzgjm+V+49vhQvEx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393485886"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="393485886"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931179874"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="931179874"
Received: from saharhal-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.112.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:54:17 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_atomic: fix basic-inc-all
Date: Mon, 29 Jan 2024 19:54:12 +0100
Message-ID: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Previous test removed skips on unsupported system memory on dGPU
but did it only for basic-dec-all. Fix it for second test
basic-inc-all. Also while at this, use drm_open_driver and
drm_close_driver which takes care of xe device get/put.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_atomic.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 48c70ec72..d9790da78 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -124,10 +124,8 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest_with_dynamic("basic-dec-all") {
 		xe_for_each_engine(fd, hwe) {
@@ -152,8 +150,8 @@ igt_main
 			uint64_t memreg = all_memory_regions(fd), region;
 
 			xe_for_each_mem_region(fd, memreg, region) {
-
-				igt_skip_on(!has_atomics(fd, region));
+				if (!has_atomics(fd, region))
+					continue;
 
 				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
 					      xe_engine_class_string(hwe->engine_class),
@@ -165,8 +163,6 @@ igt_main
 		}
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
-		close(fd);
-	}
+	igt_fixture
+		drm_close_driver(fd);
 }
-- 
2.42.0

