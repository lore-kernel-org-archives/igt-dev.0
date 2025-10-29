Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61C4CCF9EE
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 22:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7EB10E860;
	Wed, 29 Oct 2025 22:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUhFPDJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3449E10E85D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761775230; x=1793311230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xDfQQHiO5oFHsEO6CtDmgRfs9aU+PPRRQJjlR2FEWXA=;
 b=bUhFPDJPXcJKsSIhJ0Lum6XW6pshqudmTWbLlZZntrDtSigaxXX+P6c3
 ZsV3++Prb2R+XVrNGQkw8Z0Gco7Uddou7KWzg50foFB7bnTO+f9ZWCOwk
 V2iYoD64yYhzXg5pnkmCtmVPvCqVUNNTEFmYNv6Su5/PTn3dK0PTqfnvG
 3SF+5AOic1X46lvwkgOSC6w+W4VPhW1ckJg9hxnqLpQfn3TlJWZRJvsci
 uxdQ9S3fg5ospb8xTcEvA5TWfN3GS07cqPk3tkCTr4Yl8k1VdYb7/lUDz
 O1Nqcw4EWo4zl50D2MwbVNLkz9133INAunQNuO/rdfHMT7faeQoV+FNnS w==;
X-CSE-ConnectionGUID: jsdBBSIKT1uFQl1s9fc4vA==
X-CSE-MsgGUID: BVm1BXRYSxaQE62/M5iuTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75028491"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="75028491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:00:29 -0700
X-CSE-ConnectionGUID: 8PKf5h0tQZyWC2WYXDjcYA==
X-CSE-MsgGUID: uMJIiDx5QUeruRguh7Hfwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="190101988"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:00:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_configfs: Test invalid engine with
 valid class
Date: Wed, 29 Oct 2025 14:59:48 -0700
Message-ID: <20251029215947.3580744-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.0
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

ctx_restore_* expects only the engine class. Pass in an invalid engine
with a valid engine class to make sure it's correctly handled in the
kernel.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 7a7a7edf4..ecba69dbd 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -177,6 +177,9 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-reg-addr-only",
 		  .in = "rcs reg 4F100",
 		},
+		{ .test = "invalid-engine-instance",
+		  .in = "rcs0 reg 4F100 DEADBEEF",
+		},
 	};
 	char buf[4096] = { };
 	char file[64] = { };
-- 
2.51.0

