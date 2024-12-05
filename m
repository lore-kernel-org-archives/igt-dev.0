Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50CCE77170
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6047F10E230;
	Thu,  5 Dec 2024 09:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="np8zSA4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EAF10EDE6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733390752; x=1764926752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HNDgFZXuYRH0GK3+LNVO07SGKyD12L6/WgrJKgP60Dg=;
 b=np8zSA4zq0x5MT9h+rgvz9+4yq/ryj4RZJyxZoXycEhzzWqqT7t/uMxH
 BQNusKCgs85eHuxIWBM8nxSLrT71/XpLjDMmYh0h06X1QCdMhaxaJMohO
 To/p8d0d9O0Oxx//ftMK6dqtOblz0361CXD+WNLq9nClE3dnqKUy4nEW+
 VpjUSPQlYQTQV6QDqPp88O09WfasMz2c4d83Jj1Adxp6pUjkx4l7CEaMO
 u+uSN3mpOxummEtdxmtlXZGYIBuHz/OO4qc9hCDle+esjteqspqF9JlYT
 ObDy7USViFa/qBupzIcOJFpNiWfrVfR9RPZDL6b45wujDbCYX/z5PJ6Ge g==;
X-CSE-ConnectionGUID: gbmH1K/LRXmXnuYvI5KQ+Q==
X-CSE-MsgGUID: RZsgv7dMSyGr0eD4/H+2jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33827979"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33827979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:25:52 -0800
X-CSE-ConnectionGUID: ns0rHvW/Tu2NiKOthrKdXQ==
X-CSE-MsgGUID: 6TkRV0cFQdCCb2yByXQiww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="99117526"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:25:51 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/2] HAX: Please do not merge
Date: Thu,  5 Dec 2024 15:10:52 +0530
Message-Id: <20241205094052.1259373-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205094052.1259373-1-kunal1.joshi@intel.com>
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
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

---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..2cfff7de8 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe
+igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 727be9230..787be910d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe
+igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

