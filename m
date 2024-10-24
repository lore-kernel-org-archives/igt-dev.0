Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C59D0BB6E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 08:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0735A10E8D1;
	Thu, 24 Oct 2024 08:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd+5B3wL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9557210E8D1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729758400; x=1761294400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtXyb0EJEG/3TR0pgcFMgtvJDQ3pMgS8+MdPVLQSDCs=;
 b=dd+5B3wLVKTetdg6iFmOhrpNUZ9D0lUxJ3JSg+EE/pqKmMzuPFpSkybf
 KGwEz0xk4O4WmDCL3gs3+DwEd04m6nZf+O7t5NvSoKnLvO72xji1EfI2j
 c6Q6huUN1KQ4dUglLcGo/3TiN+lvJIvUJYOFP612qT98JX/nuplup2M15
 9XOYgiWeEosXN+9yOuKPpxMYkM6msVGBNQP9JIPi6ySPrrY/c2tXHh2Ns
 B/DIzcuMo1J4Lu7mJQrb4W1vJTubD8R3c2TVuCIed+lq11hqq9uGFgLy3
 UNWJ9lD2D0XuMiUc5v8vsx3isAmdiA6r+IqDl21T4mFWu8QhP0oXoaXZj A==;
X-CSE-ConnectionGUID: O6LzSRH9QLOFHsWbZFIkmw==
X-CSE-MsgGUID: FkyiK0ZwQBiz+zcb+qwWew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33063172"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33063172"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:26:40 -0700
X-CSE-ConnectionGUID: ykOXtDg1RV+/lqWdfRVi1w==
X-CSE-MsgGUID: y+b6odKCTX+U1RdvWcvCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80828618"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 01:26:37 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/3] HAX: Do not merge
Date: Thu, 24 Oct 2024 13:57:03 +0530
Message-Id: <20241024082704.1746746-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024082704.1746746-1-pranay.samala@intel.com>
References: <20241024082704.1746746-1-pranay.samala@intel.com>
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
index be0965110..7f54eda16 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..8b70164f6 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

