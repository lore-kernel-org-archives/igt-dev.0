Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D1CCD185
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 19:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EE610E502;
	Mon, 13 Oct 2025 19:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0X63x/T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA33810E078
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760385156; x=1791921156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nNKaHZFxJCmZZAfU81TafStUFHeaGayQJk8pCG0iHgA=;
 b=M0X63x/T1RW3TQJM/0kpsvymBosQjYCIcFLq1HSjoida0L+Qgz486kCn
 P6D8XvuDAOXA8kc/oWymf+Lqn0+ZO5Pdz879m0DCsVFb4YeJsLizN0iWA
 rOE/PUz0vGR/NPs/FdAIXcshp/S69s6u5SLLBLs56VMi+WBmN3mZGJyuQ
 efrcL3f+bq7PXrNsMGcN767PAaOtlEHD/RY1pqdfmQ78mroAjsmcTcK9N
 4nJd896a6bcu/ZXNiBmps577oYuAWdfI5MN/+Qzxb+ffqPMFbib51gJ2p
 sRmWg7jkOSnFt38BH3Hr94e6JT8NtGone+MwC4QDcGGrEAGSBKUDbWe3L g==;
X-CSE-ConnectionGUID: MFdMq/54SOmIdUBJhMjzuA==
X-CSE-MsgGUID: /cf3rh5CTeCrb1uamxmr9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62633587"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62633587"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:52:36 -0700
X-CSE-ConnectionGUID: g3bNkOXNTay5QWSGKBML/A==
X-CSE-MsgGUID: aTQim6yYQcKMJfehJ0q5mg==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:52:33 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v6,3/3] HAX: Add xe_survivability tests to fast feedback list
Date: Tue, 14 Oct 2025 01:19:05 +0530
Message-ID: <20251013194910.1065392-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013194910.1065392-5-sk.anirban@intel.com>
References: <20251013194910.1065392-5-sk.anirban@intel.com>
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
index 5f27baafb..d18a44610 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -187,6 +187,8 @@ igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
 igt@xe_survivability@i2c-functionality
 igt@xe_survivability@runtime-survivability
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

