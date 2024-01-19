Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9684C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 10:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7099910E0AD;
	Fri, 19 Jan 2024 10:32:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC310E98F
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705660331; x=1737196331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4JbGbYwj6VGRNAmrRX10udr23YSpuzxDgsF09CTS/0Q=;
 b=aJU4YrZiyuJ7p/XdlBhldmhnl74HedIvaaNBCxK9WQ/UoOCKWVjAfKBZ
 qChBRzjw2bKqu+SfsFxViqM8SCRXztQ4kaLY31K4aYgGFHPVWdPhq8jH+
 1kHxlLKUdHiKi4NbZsW+LW4NNje0q6ngug9G1oaiZxGpo2osFYja7r269
 pM/7s+erH4FmZo8046vtLfA3vNM/OdhL5bT3gS2OkkW9DqD5IiNGJeCf6
 bjXzNBn9YB8hEutzeMH/45h1YYKd5ueAINVI9Io2rSBKY9C2wHe3fL9Ix
 pM8kAFtjfhb3qCsRtLcCKrC8TFVTwl0AWWBJqptY+5EmI5OlzdkQxxNKs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="467090264"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="467090264"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 02:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734520340"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="734520340"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 02:32:02 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_atomic: Skip early on unsupported
 platform
Date: Fri, 19 Jan 2024 11:18:44 +0100
Message-ID: <20240119101844.15898-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Skip early if the test is not supported without
creating a dynamic subtest.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_atomic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index a21def999..209df8419 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -137,14 +137,14 @@ igt_main
 
 			xe_for_each_mem_region(fd, memreg, region) {
 
+					igt_skip_on(!has_atomics(fd, region));
+
 				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
 					      xe_engine_class_string(hwe->engine_class),
 					      hwe->engine_instance,
-					      hwe->gt_id, xe_region_name(region)) {
+					      hwe->gt_id, xe_region_name(region))
 
-					igt_skip_on(!has_atomics(fd, region));
 					basic_inst(fd, MI_ATOMIC_DEC, hwe, region);
-				}
 			}
 		}
 	}
@@ -155,14 +155,14 @@ igt_main
 
 			xe_for_each_mem_region(fd, memreg, region) {
 
+					igt_skip_on(!has_atomics(fd, region));
+
 				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
 					      xe_engine_class_string(hwe->engine_class),
 					      hwe->engine_instance,
-					      hwe->gt_id, xe_region_name(region)) {
+					      hwe->gt_id, xe_region_name(region))
 
-					igt_skip_on(!has_atomics(fd, region));
 					basic_inst(fd, MI_ATOMIC_INC, hwe, region);
-				}
 			}
 		}
 	}
-- 
2.42.0

