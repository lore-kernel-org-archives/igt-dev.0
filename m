Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C416FC3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 22:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7613010E749;
	Wed, 14 May 2025 22:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/pir2fN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3DD10E749
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 22:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747260150; x=1778796150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qPOzbLKOKIGs4WCVK9zfr/gLg7CEuh0yv4WvGCiBk04=;
 b=a/pir2fN6xIsD4VdgJQ2KbgqOprv2EXlucdCI7n9WWPrV+IzEYqb4PXw
 5489UQIAatdr4p0ctKvjzpxMdMbVFnbHFMjapzQn7u3yANQxUTvZuAvLG
 JYsyDHL2PhKdFko08yBa7ZkXSEeS0RloN+TUo1wCcQiOZk57CrZqccGWO
 oPLlmCPTL+FdT9vEoEGscPlsvzMUJGcfh29hMHS7DG5wlPqU8RczRggkK
 +AWudGkvJ35cNF4nJKTOAu0cln1QYi3Q+x5T2XhcB+nLpTXupOnby2fcb
 gRpQGawkmjT1uuIRrvdQWdVP/c8L0E0BJFrxVXH7bROq5kU9au7Q4gIL1 w==;
X-CSE-ConnectionGUID: MAx8E4LkSNWyzNv3H8JtGg==
X-CSE-MsgGUID: ydTVGwG3RKSWDQ1oO/OqWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48430682"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="48430682"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:02:30 -0700
X-CSE-ConnectionGUID: wzknpCREQtC0wKYOjs+L0Q==
X-CSE-MsgGUID: kbcVjHZ6QhCHZXmCbQLrvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138682066"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:02:30 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Skip non-zero-reason subtest in
 simulation
Date: Wed, 14 May 2025 15:02:25 -0700
Message-ID: <20250514220225.1132066-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Filling 16 M OA buffer multiple times is too long for simulation,

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 48e6d6fd36..1576479d98 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4970,6 +4970,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("non-zero-reason") {
+		igt_require(!igt_run_in_simulation());
 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_one_hwe_in_oag(hwe)
 			test_non_zero_reason(hwe, 0);
-- 
2.48.1

