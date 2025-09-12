Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383AECAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 12:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB85610E1C4;
	Fri, 12 Sep 2025 12:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UM0ryo6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2609A10E1C4
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757680169; x=1789216169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TK+GAFt3OR1y8ULwvF5hvKfprcdsL7pcAmvlnMNQrJY=;
 b=UM0ryo6NtLA6D1f1xX+ar8Ar8cJTQaUUPqmlC2/I5krJ8WUsxL3Towbk
 +tc3ooqMcEBDpjWKgNg8l/e8latSB0q1SoEzZQvD4hFDDyA4gUjlGiXDi
 UmbZSCfSoEu+T4J2vmb3s3pqVKzJRPm2gAW3O3Se1xwKKBMtWfN1/llcC
 GwOnqz4V6ZFBjStC0/I8olLg1+5P064O8URNq1pX/x9iuOzahD43JoU7Y
 vHpX7h5l9P4jNbFmXKWtmEqxpV8DX0gS5FsfDPdaW5qQZuevkd5FtxzeA
 SbBexmuI9JLcohj6eANmlmgXgikFFYU5tHLiQN+obBP7IXUHTqFsrTSFO A==;
X-CSE-ConnectionGUID: b4tXQnQKREm0Bfz9LR40dQ==
X-CSE-MsgGUID: 7kscnHfrQOC8qgdK69/sxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="77635129"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="77635129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 05:26:56 -0700
X-CSE-ConnectionGUID: qvvNX2MIRUS3UsWt8eWrow==
X-CSE-MsgGUID: 332uBRhqSqOKZtSHO7Bpyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="177988943"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 05:26:54 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 3/3] HAX: Add xe_survivability tests to fast feedback list
Date: Fri, 12 Sep 2025 17:55:42 +0530
Message-ID: <20250912122541.2238004-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122541.2238004-5-sk.anirban@intel.com>
References: <20250912122541.2238004-5-sk.anirban@intel.com>
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

Add xe_survivability to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..5f27baafb 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -185,6 +185,8 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
 igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
 igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

