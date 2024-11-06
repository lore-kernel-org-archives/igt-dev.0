Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F18AD3E799
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 09:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4662110E23E;
	Wed,  6 Nov 2024 09:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLI7Vkk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9F610E6A0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730887192; x=1762423192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xwXbpckG/YjDxWrsB9v8/9eGXZHK80BGSWrb+8iJT6A=;
 b=DLI7Vkk1J4bQuxbJiMG1C9Wtj8k81fR8s0OBpDKVgAD+Kbso7W3Mw2we
 zgHyHuelhMC05D/x8syhbo3IgKP61nBXkPRevXgD09x3feYy2yZ6HTt5/
 GSs95Gp1hYLRQVCaSRsfsEszjryEvC87l76eco/vnc2mEHgI9eBKZzE57
 yTh8md5ZudVKXF8v4ZUrSCQJouihdFi4nB4pdcmSM8QOL0sYl+sHKCjLQ
 j4+y5lxehe2+du614mT9RKC0g06yc7qiSBNVVBZ4UCZPorM/KiWF/GFD7
 ZkzVhSMguiU62wuCtYEfCdZ5iPjIDDdy+1GXwa/c/nGMmBXzqUvaHRU21 A==;
X-CSE-ConnectionGUID: yZjWgUWSTTadCigVlo4Jcw==
X-CSE-MsgGUID: sIu2jM3yTP+7+WRNx80h9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41268201"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="41268201"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:59:52 -0800
X-CSE-ConnectionGUID: 8fKt5HEkRaG2FVP+V4Mw6g==
X-CSE-MsgGUID: rBZwmN3qTGyxdnbAsa9wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84850875"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa007.jf.intel.com with ESMTP; 06 Nov 2024 01:59:50 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] HAX: Do not merge
Date: Wed,  6 Nov 2024 15:30:21 +0530
Message-Id: <20241106100021.1831921-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106100021.1831921-1-pranay.samala@intel.com>
References: <20241106100021.1831921-1-pranay.samala@intel.com>
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
 tests/intel-ci/fast-feedback.testlist    | 17 +++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..71d7d413a 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,23 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait
+igt@kms_atomic_transition@plane-all-transition
+igt@kms_atomic_transition@plane-all-transition-fencing
+igt@kms_atomic_transition@plane-all-transition-nonblocking
+igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing
+igt@kms_atomic_transition@plane-use-after-nonblocking-unbind
+igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing
+igt@kms_atomic_transition@plane-all-modeset-transition
+igt@kms_atomic_transition@plane-all-modeset-transition-fencing
+igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels
+igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels
+igt@kms_atomic_transition@plane-toggle-modeset-transition
+igt@kms_atomic_transition@modeset-transition
+igt@kms_atomic_transition@modeset-transition-fencing
+igt@kms_atomic_transition@modeset-transition-nonblocking
+igt@kms_atomic_transition@modeset-transition-nonblocking-fencing
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..57602575a 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,23 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait
+igt@kms_atomic_transition@plane-all-transition
+igt@kms_atomic_transition@plane-all-transition-fencing
+igt@kms_atomic_transition@plane-all-transition-nonblocking
+igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing
+igt@kms_atomic_transition@plane-use-after-nonblocking-unbind
+igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing
+igt@kms_atomic_transition@plane-all-modeset-transition
+igt@kms_atomic_transition@plane-all-modeset-transition-fencing
+igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels
+igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels
+igt@kms_atomic_transition@plane-toggle-modeset-transition
+igt@kms_atomic_transition@modeset-transition
+igt@kms_atomic_transition@modeset-transition-fencing
+igt@kms_atomic_transition@modeset-transition-nonblocking
+igt@kms_atomic_transition@modeset-transition-nonblocking-fencing
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

