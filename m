Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4ACCCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 06:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FAF10E0A0;
	Mon, 27 Oct 2025 06:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BttueDVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9BE10E0A0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 06:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761546418; x=1793082418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kmYN6H5MzJdQ1Q7NtBaSW7aphnHW4f5OPysXdPPA39I=;
 b=BttueDVx/j0IFZbxGj68c58yls88K2WHbCPW8KPkvmhoyQeKDfIPsoVg
 SpFWbRUXZQgGBe9I/75eMupdsFKVybD8GcD7k4gprR81Z9IvMGeNS3Dfp
 tfRYhXOuMw9jjFoyVjIpXaW40Fv1pFAFwBzfmobclkCGQZlIesuzKUt/j
 hLsYmkDKdej3Y8yJUp4ieXLLNS0FcArk3psnhZYfSrAykDOEZjQS5qa2J
 P7gfQfzT71aLWcjwbi2o7E2uW0LhTPYhofLIvStTVHBlfzI9N9Rd4E2y4
 L6jj76Ut7dMnzHKhTaUykSTAXKOfI9nbq8sk4+lF9eZ4Ky2g8l05etSHx A==;
X-CSE-ConnectionGUID: zsZ20ltNQLSq/ZVOBSu56w==
X-CSE-MsgGUID: I3iBOiRjTFWraXkpKk8FfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74295439"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="74295439"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 23:26:58 -0700
X-CSE-ConnectionGUID: g5VUzyvSRxGnNd+ndnskMw==
X-CSE-MsgGUID: RtnjTJ6XRMygYG7434ewTg==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2025 23:26:56 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Reduce iterations on
 simulation
Date: Mon, 27 Oct 2025 12:05:27 +0530
Message-Id: <20251027063527.607053-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Reduce pipe state combination iterations during modeset
transitions test in simulation environment to reduce
test execution time to avoid timeout in simulation.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a13830965..e1387bd89 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -961,7 +961,7 @@ retry:
 	iter_max = (j > 0) ? (j << 1) : 1;
 
 	if (igt_run_in_simulation() && iter_max > 1)
-		iter_max = iter_max >> 1;
+		iter_max = iter_max >> 2;
 
 	if (igt_display_try_commit_atomic(&data->display,
 				DRM_MODE_ATOMIC_TEST_ONLY |
-- 
2.34.1

