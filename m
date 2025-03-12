Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE066C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 10:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9557810E766;
	Wed, 12 Mar 2025 10:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YV+clq0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C0010E767
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 10:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741775366; x=1773311366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CBuFhBj53/LVHvWiOj2mZ3P85uJgkbj1lYsHojW04Q8=;
 b=YV+clq0F+brWSaEi61OGfeQiEgEwJFnaAiyw9jM+ejQ180xMdMhDY+/8
 YyYWo5G1Fd2PiIkEyG5p96rfBl94C5DV+VGnOELd8bLbIkRrtOksAT38X
 L8WNkuFg2mVzxj4wU1Ka3l1unZj4tgyVfIz/aiANu5M2LaqdABNRCaTXj
 9cmoa9JSy+MuvaifjArJZGK4gRPXHBTucBHRvO4rKJss3cqjRj3eonafJ
 pjLMyf0bwx8N+hpZcv7DhWNIEKNhkri6OTxTbzY3wHTpbzL3ho6i2qIq6
 sQoDqE5tuW8thWgQdoIJIiZx86ZHBDCJyONrW+7kqeUjC/eMB6kXC0nUi g==;
X-CSE-ConnectionGUID: anc8AaF7RtyT3gdAm8eCUQ==
X-CSE-MsgGUID: ILLu8CWrQxG0OndTn9+OTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53052332"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="53052332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:29:26 -0700
X-CSE-ConnectionGUID: E1Cb6eIJTJyzjLsl9Fc+7w==
X-CSE-MsgGUID: SE8d827yQfWnGyWKf0zqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="121103146"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:29:24 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/kms_addfb_basic: Split tests into subtest groups
Date: Wed, 12 Mar 2025 16:00:08 +0530
Message-ID: <20250312103008.613087-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Multiple subtest groups exist in kms_addfb_basic with individual
igt_fixutre calls. Split these using igt_subtest_group so that any
failure in the fixture of one of the individual subtest groups don't
affect the results of subtests in other groups.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_addfb_basic.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index e5ff9ea32..268e4e0e4 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -989,15 +989,20 @@ igt_main
 		igt_require(has_addfb2_iface(fd));
 	}
 
-	invalid_tests(fd);
+	igt_subtest_group
+		invalid_tests(fd);
 
-	pitch_tests(fd);
+	igt_subtest_group
+		pitch_tests(fd);
 
-	prop_tests(fd);
+	igt_subtest_group
+		prop_tests(fd);
 
-	master_tests(fd);
+	igt_subtest_group
+		master_tests(fd);
 
-	tiling_tests(fd);
+	igt_subtest_group
+		tiling_tests(fd);
 
 	igt_subtest_group {
 		igt_fixture
-- 
2.43.0

