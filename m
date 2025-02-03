Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D2C0219C
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 07:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E7010E3F9;
	Mon,  3 Feb 2025 07:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3qemrqO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8381B10E3F8
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738569436; x=1770105436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4GjhRoaUHL7txU11toeFxgcuxwUFf95FKQBuUYBE68c=;
 b=e3qemrqOU6Jf3NYlLmgPkQ1Zt3G1jwPV5HwYgTH3xG0JZEM+Hh+UA3mA
 3J4bRgrCj6kBP4hWRFFaNS4l+2VowTynKiByrnXXOmVtNP5CDWM42RbbE
 MTM28/Ncbm4SlcOlbRlTKEm05UBpc5As0yVVK2ykcEmtW9LwCVBZr2xzP
 zEiGZZNcyG+dUbfQVZssKhCIsUOtpud2JcjVFe9SsvIuEzgTAKgEis0TP
 Go6v87pao26MGe648aG3bp3PFRXhtldZRV5fG55pAKUCMWmFvpd8qQg8s
 pEujMebmQrzNrHBdlL2a6nnMa7PgUb7nz2RhIs8xOPfaYaphBeG991HLZ A==;
X-CSE-ConnectionGUID: R0+HeK8wSnmJz3rbKIW1Qg==
X-CSE-MsgGUID: Al2qESfzQ1+RQ315mNXUpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49652721"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49652721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:57:16 -0800
X-CSE-ConnectionGUID: FedI1yJiT/a52rD3jdU3LQ==
X-CSE-MsgGUID: nmuT49/rQhC44AB8SziLfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110786407"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:57:14 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/5] HAX: DO NOT MERGE
Date: Mon,  3 Feb 2025 13:42:41 +0530
Message-Id: <20250203081241.659139-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203081241.659139-1-kunal1.joshi@intel.com>
References: <20250203081241.659139-1-kunal1.joshi@intel.com>
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

HAX patch do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 14 ++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..57126a87f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,20 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_dp_linktraining@uhbr-sst
+igt@kms_dp_linktraining@uhbr-mst
+igt@kms_dp_linktraining@non-uhbr-sst
+igt@kms_dp_linktraining@non-uhbr-mst
+igt@kms_joiner@basic-big-joiner
+igt@kms_joiner@basic-ultra-joiner
+igt@kms_joiner@invalid-modeset-big-joiner
+igt@kms_joiner@invalid-modeset-ultra-joiner
+igt@kms_joiner@basic-force-big-joiner
+igt@kms_joiner@invalid-modeset-force-big-joiner
+igt@kms_joiner@basic-force-ultra-joiner
+igt@kms_joiner@invalid-modeset-force-ultra-joiner
+igt@kms_dp_linktrain_fallback@dp-fallback
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 0234d3e72..8f0e5ca48 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,20 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_dp_linktraining@uhbr-sst
+igt@kms_dp_linktraining@uhbr-mst
+igt@kms_dp_linktraining@non-uhbr-sst
+igt@kms_dp_linktraining@non-uhbr-mst
+igt@kms_joiner@basic-big-joiner
+igt@kms_joiner@basic-ultra-joiner
+igt@kms_joiner@invalid-modeset-big-joiner
+igt@kms_joiner@invalid-modeset-ultra-joiner
+igt@kms_joiner@basic-force-big-joiner
+igt@kms_joiner@invalid-modeset-force-big-joiner
+igt@kms_joiner@basic-force-ultra-joiner
+igt@kms_joiner@invalid-modeset-force-ultra-joiner
+igt@kms_dp_linktrain_fallback@dp-fallback
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

