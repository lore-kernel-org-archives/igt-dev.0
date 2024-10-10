Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4303ECF07B7
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 06:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2BB10E87D;
	Thu, 10 Oct 2024 06:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jS5z4tpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BD010E87D
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728543526; x=1760079526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5q1dX0iXEBrKm6hHv0sqqX0PEQV32ZNp7iYvJ2pIPI=;
 b=jS5z4tpa1THHjLdruUg10BpGT//lMhsPSTwvjpOuXdX3isHkqnbRJNwZ
 WA22SiRl/ilNDB3oa4RaI1cPPUVNySn39Ld2paRp5qBvvaWDN53kqIdsa
 UESoAPByZj4gL2vjY+/F1oawYEYtSsJmlmAmiStN6cj5ExZwD+bEf2ekm
 y2QH3/n5BgbPZFTdHTv1+bybCUqt6DT1tJmPk5m5ukpJDK947Az5iqW9r
 KNwcZfa3VqzsTz2jFsAzyQ2uVn+ZXNuf8YfWIyZWebIYKS02VEU/t4wuJ
 5Ymgn00tn1DJS0/t3165C0q86QcwpYo0PWR6LGkv9sI9kGtXnD/9tEFzf Q==;
X-CSE-ConnectionGUID: getuj55sRBGHW8Z4I1x6pg==
X-CSE-MsgGUID: WT5CEYaMTxSGMRA9bNRmiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31779340"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="31779340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 23:58:46 -0700
X-CSE-ConnectionGUID: g+umB+YDTL6AJQMRe7iT8Q==
X-CSE-MsgGUID: vLA76xzmRjyMu7lizppc5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76104091"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 23:58:43 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com,
	vinay.belgaumkar@intel.com
Subject: [PATCH 2/2] HAX: Add Coarse power gating tests to fast feedback list
Date: Thu, 10 Oct 2024 12:23:12 +0530
Message-Id: <20241010065312.1988533-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010065312.1988533-1-sk.anirban@intel.com>
References: <20241010065312.1988533-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Add cpg tests cpg-basic and toggle-gt-cpg to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..3234b5b37 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -2,6 +2,8 @@
 igt@i915_module_load@load
 
 # Keep alphabetically sorted by default
+igt@xe_pm_residency@cpg-basic
+igt@xe_pm_residency@toggle-gt-cpg
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@debugfs_test@basic-hwmon
-- 
2.34.1

