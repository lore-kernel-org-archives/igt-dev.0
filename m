Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0C7C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD31E10E123;
	Sun, 25 Aug 2024 19:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EauByLVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C6E10E123
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615676; x=1756151676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZyrqCX/75dzJoWPhdOMmRrWh3xcWjRV8SjNNW0xA5M=;
 b=EauByLVAX2Fi6uxRQ/ERD7eeyCBF6d75CQbaBOSuPzR+IaXa4Nreb5FX
 EBbBzyWH4MzOMfmVcwZJMG/EVQquvrfaY4y0+KilTwroYLVc0UM9n+BBD
 WSX4fPYEhJqytQSXlSoQGYsX3/PRNVg6QmUnhaEAjgddgKqoEUutY7fP3
 HEd78+8zccOvjA1tKjoeJtJ100ozVSD7e5xjVuIJnx4/lH2bZBx1iVQWc
 nBM0YRnihlcqh5ZR06PntmZVPInnntrgcL7j5i3MvpWE3vIHUgrQ5PVSR
 Ed3pN4W/D79d1XIvcrSI9Za9vjvyRmGDsJdFkNlt6neRwHUFVkXvIwQj2 A==;
X-CSE-ConnectionGUID: pjpj5SIzTlOhUHwKKBY2XQ==
X-CSE-MsgGUID: pTmyMR5lSz2BiiFddMeQDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591511"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591511"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:36 -0700
X-CSE-ConnectionGUID: 21Gtcvc2TBegP3HpaojMaA==
X-CSE-MsgGUID: XOOzmk84ToeioqPgznde/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283726"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:35 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 14/14] HAX: Do not merge
Date: Mon, 26 Aug 2024 01:36:12 +0530
Message-Id: <20240825200612.4036178-15-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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
2.34.1

