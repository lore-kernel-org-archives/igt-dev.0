Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6519BC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 12:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0014910E12F;
	Wed, 26 Mar 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqOM8Peb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317FF10E12F
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742992936; x=1774528936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dRPRt8xPWf+3oM4V4D85ka7QJTic8E4paRLkt0O9TXM=;
 b=aqOM8PebMvIePY1VWmF4ZMfE943mVSn1+Br7c2X363ve04IMQhrdSTME
 qpXCXN9jKIrJk9D8F4gRPg8ZdXoh3tYpPsgd8t6e301yHhSuFfCkNuHTc
 oDJqCqm7l/lxifja9QHwZlU33KK/06u6LkVYPschxBInHGUcFPHFR/FTD
 g18i44noY6HrGKxVudcSrDncgRW4tMbio1koTSq3243e0/3B/HmZ76mZs
 IFCSl9VWxf29QpBPbbjcV54rzaJvdItlPp1cQRS8scCrjos/TKJxFOomD
 j2WpBNmpY6ut2hk5NA282zZohdYe403cBT2a43swkayuptQWSxA0vNLxZ A==;
X-CSE-ConnectionGUID: 9fYjc5EtR+SN69Hi+S1MjQ==
X-CSE-MsgGUID: QMLgGkDzSba4KiOSlLXWvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44200864"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44200864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:42:16 -0700
X-CSE-ConnectionGUID: vzS3Fni/Sx+WEw6XUrhJEg==
X-CSE-MsgGUID: R6lvY+ijSIiALKkYyDbCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125680621"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.13])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:42:13 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vm.blocklist.txt: Blocklist
 for SR-IOV VM runs
Date: Wed, 26 Mar 2025 13:42:03 +0100
Message-Id: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This file contains tests that are not applicable for QEMU Virtual Machine
(VM) runs. It extends xe.blocklist.txt and should be kept as minimal as
possible.

v2: Added igt@xe_css@suspend-resume.
    Removed inaccessible reference. (Lukasz)

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe-sriov-vm.blocklist.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 tests/intel-ci/xe-sriov-vm.blocklist.txt

diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
new file mode 100644
index 000000000..06ed60b52
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
@@ -0,0 +1,8 @@
+##################################################################
+# Block list for VM runs
+##################################################################
+#
+# rtcwake does not wake the VM from s2idle
+#
+igt@xe_pm@s2idle.*
+igt@xe_ccs@suspend-resume
-- 
2.31.1

