Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C32CCF9EC
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 18:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5E810E854;
	Wed, 25 Sep 2024 18:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpcMpjc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCED10E854
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727288276; x=1758824276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HWjiyAaVc4UFN5mdSnOeHN+C2kN2dVBrwAy+c5I8ny4=;
 b=OpcMpjc3lDkvV+diYC0XWghreFHbZi9MR6EWNIAfdOlnBHPMCl4yF304
 f/xkYwaz5VQ9V2XDDk6EHSOeHRdGio8S6cuxlt8+wC911UQwQplU2D0Im
 0C/hE1yw2FYaLVfBqSDWX7Lk9wM78M4Y4haVNLQizIbh0A7O3GlLdEB2k
 cY+BM5gDl+W2E8va0Esfj9NDbzqrCLkE7LxiNvr3WhfqTrvQKGKmcg73v
 DAuvb6b+s/RUxiUu8DfQcXJW4Vw+NH5ebjTqC8j49jzq+2ZUewKanJzhQ
 0/X5+2Qr9VWqMDLh6C4Egj2DPMrGd4wamRKcj/zqBaq/eiVCdOhx1rNfB g==;
X-CSE-ConnectionGUID: HOzPeTkmRl6C+ZRFAfR9sg==
X-CSE-MsgGUID: 6elLrmaMTSase/diFyAdWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37032379"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="37032379"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 11:17:56 -0700
X-CSE-ConnectionGUID: 9hv1ycjQSraEDFQkuTIrGg==
X-CSE-MsgGUID: s5UeJEOxQmWifloTRMmVCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="72324337"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 11:17:55 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/7] HAX: Do not merge
Date: Wed, 25 Sep 2024 23:59:44 +0530
Message-Id: <20240925182944.1603015-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925182944.1603015-1-kunal1.joshi@intel.com>
References: <20240925182944.1603015-1-kunal1.joshi@intel.com>
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

