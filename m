Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3682AEE644D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885AA10EADA;
	Thu, 12 Sep 2024 06:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5DCiHQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715BD10EADA
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726121812; x=1757657812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HWjiyAaVc4UFN5mdSnOeHN+C2kN2dVBrwAy+c5I8ny4=;
 b=H5DCiHQCeaB9TMuFyUfExXqAExIqsgEIeJH5Q6faDJAtA5gAgUYfVgHh
 EvhAqMyjNLRFoVCkwHT3wxWDCit+c1RZFISW6YOxOSkXgCJTx+vXc3nbc
 HCAEcZaHU8JpayrbS/2BCfOPnU5/x9SAeWDhrKV8wXuFtY0q6rT0hDLRM
 WZKVqCdRtpaD23It1jiZ6BfYM9iZnvxioliCEYTbSLFalLY4DnMU+ZChh
 NlXBsteRYXsDmDfvVisODnUCWIudqePCrPMFCztXWXJXTF1wzPTw2eJzC
 lyrTQC4hTtHsPvHqFwKUBg5ixlbVMKKu5YtWIwbuNcKyDo08bS+vE9NSw Q==;
X-CSE-ConnectionGUID: pERFmnF0T+mxwvy77VVtuQ==
X-CSE-MsgGUID: oOsdnBOWQNC+EbPyoofy4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25056626"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25056626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:16:52 -0700
X-CSE-ConnectionGUID: EVKNKBsdQkKoh7As/vFqEw==
X-CSE-MsgGUID: /1D88WvfTdm6bG4mpsPcZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="98310293"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 23:16:51 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/6] HAX: Do not merge
Date: Thu, 12 Sep 2024 11:58:39 +0530
Message-Id: <20240912062839.760661-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912062839.760661-1-kunal1.joshi@intel.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
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

HAX: Do not merge

Just for testing in CI
---
 tests/intel-ci/fast-feedback.testlist    | 1 +
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..7b84ccffc 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_fallback@dp-fallback
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..110675cd3 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_fallback@dp-fallback
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.43.0

