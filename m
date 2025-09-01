Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A5CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 08:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBE310E07E;
	Mon,  1 Sep 2025 08:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUTEVYnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948AC10E07E
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756714330; x=1788250330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V/gYYV2HWBaYVUjKGbxoDK/JqiOS3qdZrpJSor0w93E=;
 b=MUTEVYnpkM42URztaO1QCFCViiPvCEcBPSm3l5qzmQFGlSocJdXbM6BR
 D+dqfFin1duevnOg5kTQN1eWsPuRj9ceaETapf/ivmxAGm0IGG3T7gBnZ
 cf1fhbzIpYCW+e4veyofwHXJ9JRX8kdI4LGk7hpv78+RtI4+Ui/gxLV6D
 QeCXsimReeEZ+psGS6RfIKjQKlc6gEyllmFb1UaqAlVrkcciKo05j+uHs
 lE4OZ4k5x6NpXGJ5hEgqdUq9pAaY+iYDfsDINlfHPPNdYtOn2ikrwXfk0
 R0AT9K7dWzxRwqjsve8v5F7ErszCz8ELmGX8Kl8WPiutOy6b+RYR1UVaB g==;
X-CSE-ConnectionGUID: Wo+5gWE/RDGcKJGkaOvGDg==
X-CSE-MsgGUID: PRzDdZQTQlGvgoSS3l9Q4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="69554641"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="69554641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:05:43 -0700
X-CSE-ConnectionGUID: +SaS6i+eSkOO7wiEn81g4w==
X-CSE-MsgGUID: z8VCIYu5QGyBa2AEjrm5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="176235112"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 01:05:42 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Block unsupported test on chamelium v1
Date: Mon,  1 Sep 2025 13:51:30 +0530
Message-Id: <20250901082130.1787813-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Chamelium V1 HDMI reciever can support max 4k@30
Test forces EDID with 4k@60 which isn't supported
Blocklist test untill we have newer V3 boards

v2: Fix typo and rephrase (Swati)
    Fix commit subject (Kamil/Swati)
    Block i915 as well (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 8 ++++++++
 tests/intel-ci/xe.blocklist.txt   | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index ac9bb2f0b..b36015b53 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -178,3 +178,11 @@ igt@kms_fbc_dirty_rect.*
 # platforms connected to different displays.
 ###############################################
 igt@kms_sysfs_edid_timing
+##################################################################
+# Chamelium V1 HDMI receiver supports a maximum resolution
+# of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
+# which exceeds the capabilities of V1 hardware and results
+# in failures. Temporarily blocklist this test until V3 Chamelium
+# boards (which support 4K @ 60Hz) are available in the test environment.
+##################################################################
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 14e0b9482..2e1ebf299 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -117,3 +117,10 @@ igt@xe_evict@.*-multi-vm-cm.*
 igt@xe_evict@.*-threads-.*
 # igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
 ##################################################################
+# Chamelium V1 HDMI receiver supports a maximum resolution
+# of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
+# which exceeds the capabilities of V1 hardware and results
+# in failures. Temporarily blocklist this test until V3 Chamelium
+# boards (which support 4K @ 60Hz) are available in the test environment.
+##################################################################
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
-- 
2.25.1

