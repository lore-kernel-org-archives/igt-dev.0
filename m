Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D083C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 16:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9C010E315;
	Mon, 13 Jul 2026 16:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtKAn0fO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02F410E4D9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783958441; x=1815494441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iOpofnkfZEQNlGB2c3FAGSmKMnZG3/vlL7e8c3DPbmM=;
 b=QtKAn0fOlH+VNB3NQ9HfI/TFZhyIAumRnYLKQqBxWUSJSPZvwQalGEkE
 YhiOq45HZ+BFeLuEzdav7npKCMqq7bs0TROb2VBQ5cFJ1MQC5ZLua2ywN
 0IFhuUNCyjLXfLjHJmJYwKswLZ9BUJW3lJrB4NZZH55yTT6x0j5D3BJDt
 JPBqe+1P+FKjqlkzuH7aVXK6sel7ySi/nOa6v/kQ8CvVIRe4e/5jwD1ZU
 4kg+e3GNBydb7pcqz+ytkZA9cJ+8yAXhoXbrN6v9kRJtZ3/m1Z4uwI87N
 HfpDI5+7jpRUQKdVujq7vlU42VFNrvUeaqU4aNNJcrSXLURHRd1GcfLiA w==;
X-CSE-ConnectionGUID: PoRJS6GsSAeNiq05Nq4hoA==
X-CSE-MsgGUID: Yi4niJbETf2EzL2GydKVEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83688405"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83688405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:00:40 -0700
X-CSE-ConnectionGUID: bqc3EawPQNqdqNcxgFVCLg==
X-CSE-MsgGUID: MixC9c93SJmdqKsIThMFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="251156058"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:00:39 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>,
 Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on VF/VM
 runs
Date: Mon, 13 Jul 2026 16:53:12 +0000
Message-ID: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.43.0
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

SR-IOV and EUdebug are mutually exclusive features.
Block EUdebug tests on SR-IOV VF/VM runs since they will
inevitably skip.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel-ci/xe.sriov-vf.blocklist.txt | 8 ++++++--
 tests/intel-ci/xe.sriov-vm.blocklist.txt | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
index 4a19aa943..7b5bd2165 100644
--- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
+++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
@@ -9,7 +9,6 @@ igt@xe_module_load@.*
 # tests applicable for PF only
 #
 igt@sriov_basic.*
-igt@xe_eudebug_sriov.*
 igt@xe_pmu@.*fn-engine-activity.*
 igt@xe_sriov.*
 #
@@ -60,4 +59,9 @@ igt@xe_query@.*cs-cycles
 #
 # Tests that need to be executed in VM instead.
 #
-igt@xe_live_ktest.*
\ No newline at end of file
+igt@xe_live_ktest.*
+#
+# Tests related to EUdebug
+#
+igt@xe_eudebug.*
+igt@xe_exec_sip_eudebug@.*
diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
index 6271b1a70..0a02abaa8 100644
--- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
+++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
@@ -10,7 +10,6 @@ igt@xe_ccs@suspend-resume
 # tests applicable for PF only
 #
 igt@sriov_basic.*
-igt@xe_eudebug_sriov.*
 igt@xe_pmu@.*fn-engine-activity.*
 igt@xe_sriov.*
 #
@@ -57,4 +56,10 @@ igt@xe_pmu@gt-frequency
 #
 # The feature query_cs_cycles is not supported on VF
 #
-igt@xe_query@.*cs-cycles
\ No newline at end of file
+igt@xe_query@.*cs-cycles
+#
+# Tests related to EUdebug
+#
+igt@xe_eudebug.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
-- 
2.43.0

