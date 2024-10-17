Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA925D3C52D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 19:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B4910E223;
	Thu, 17 Oct 2024 19:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPW9ujUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1FF10E223
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729194078; x=1760730078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ax4oGSj+X6VXSJXYy7Lc1qVr32zk0t2tvd9gPVbzvY=;
 b=fPW9ujUMiyM2iQV+QTEDvhSyBY9RJMdy8Gmc4YO1NR9WJYweOYnWPoZ+
 rhsNskyxWVLhzU1PkTuvSuo5hiKyEJKygwO/SiJtJfsmoejKBiORvD0kL
 bs2G5hqLP3Bh4K0u1YMFErnpowAb4eXIYN00VYDlf40fGKh5gAE88FMYm
 f+dG9wllf+tPy23ZEyXLPnJW6SEcio6oJKuIPeiJNw4W8O0HVbkedaBM5
 WKtuTDOEPE8oTkpa00QVQhBOr80ji32shDaICUWp6ivmXL98q1O7GGofG
 4DCc1XdD/ZC7NDSDmnb1TcS5EXc1Xcc1WzEf/d3+M9PaYUFc6GeKIRJd3 g==;
X-CSE-ConnectionGUID: wCG2cRQjQbWs2eTov/wtmQ==
X-CSE-MsgGUID: vkdI6QZgRg+EqwHD7ZMQBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32500179"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="32500179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 12:41:17 -0700
X-CSE-ConnectionGUID: NvqrIBPtRf6bD36e2e29gA==
X-CSE-MsgGUID: ns8mBo+ARPiw8oCAaFkaTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78690955"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 17 Oct 2024 12:41:15 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2] HAX: Do not merge
Date: Fri, 18 Oct 2024 01:11:42 +0530
Message-Id: <20241017194142.1740244-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017194142.1740244-1-pranay.samala@intel.com>
References: <20241017194142.1740244-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c9e478b75..341e38039 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 igt@kms_flip@2x-wf_vblank-ts-check
 igt@kms_flip@2x-blocking-wf_vblank
 igt@kms_flip@2x-absolute-wf_vblank
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index cfc7afdee..765d93bde 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -7,6 +7,8 @@ igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 igt@kms_flip@2x-wf_vblank-ts-check
 igt@kms_flip@2x-blocking-wf_vblank
 igt@kms_flip@2x-absolute-wf_vblank
-- 
2.34.1

