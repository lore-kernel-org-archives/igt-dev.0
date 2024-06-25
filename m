Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06355C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 04:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3C410E1C8;
	Tue, 25 Jun 2024 04:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZAH/CIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5910E1C8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 04:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719290387; x=1750826387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lM5XXxt8tj7DG1tGDQphhwAgWnln3fz/EKgET0Un8uo=;
 b=hZAH/CIiBw2hJga6jrbdtwwsH2XnRw/YaleEblVW/EYd5gf9VojMblJh
 ZDBs5XyFvhQvZ+s7MyFI7FQeaed3h2QHgMpBp0C4jfuYuNzswNJtGIECi
 tXUFBWaIkA+etbqCxn5QVh4yKyqtvBl/GoY/ES/LMWKRhKpq5ePanawcq
 XN6kRdk5e7BqDlN0dJ0hrJeiybs13C7trl+iREXB2IwTfX1Gb7dnIzf5s
 eehw+yPLxR/hK/o6dG01/TeOIcRyW/iVSBqrUIVacnJZ+FcSOOPJIvKLy
 y5xu+ZUz7IRoobx/LiAK6EAJVQPLlwp5QDccb754GGmME7gWRD8T2iIu9 g==;
X-CSE-ConnectionGUID: HqFcR+QkRlCz8j0SeUu6kg==
X-CSE-MsgGUID: qvmh+ksyQ2W2Ue0sxdDpRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="41707158"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="41707158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:39:46 -0700
X-CSE-ConnectionGUID: vPBSiMe7ReyjZu7QHqlDpw==
X-CSE-MsgGUID: 4U9Ni9jBSkyuioCC2RSJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48688498"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:39:44 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [i-g-t 1/2] tests/kms_hdr: Fix bpc-switch subtests
Date: Tue, 25 Jun 2024 10:01:35 +0530
Message-ID: <20240625043136.257253-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

igt@kms_hdr@bpc-switch.* subtests are getting skip due to
recently merged cleanup patch. This patch will fix the logic
to run the subtests.

Fixes: (4fe91292b) tests/kms_hdr: Use lib helper to check the pipe/output combo validity
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 475463c21..36ebb4f4e 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -274,7 +274,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 		for_each_pipe(display, pipe) {
 			igt_output_set_pipe(output, pipe);
-			if (intel_pipe_output_combo_valid(display)) {
+			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_pipe(output, PIPE_NONE);
 				continue;
 			}
-- 
2.43.2

