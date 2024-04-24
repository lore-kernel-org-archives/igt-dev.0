Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3664C10F15
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8425F10E94E;
	Wed, 24 Apr 2024 20:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVwRKtdy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7511202C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713989304; x=1745525304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HGOcQDheClBJyVYHFv6VXfcNVxPDzLbhNIEM3Q0x8Nk=;
 b=VVwRKtdyU/yTA9A73BHjo7p3mSdkpb4U22XYNjbA0KxWfDfQCKxs2pPJ
 jb+X3quc61Q/oV5MuhVE0zB1KjzehdsqzWT+IvC9GEyYQzzjk40AkExE/
 T8HAXFe7x43l5GeTU9o+G6YpspjZ2Qrex4cyzgW9838a924fk1TlF8lEt
 EBaXQHNpt1Yq12acyFEZH5Ea1aDL9Jy0wpBhw9rx2xzaN/lyfQLBsSbBQ
 OHOS1UcFFlhrCgNFxcGLjMSsxtDaci6KXo3sCasSSDfTCEYakWE+jEZ9i
 Awfqtrm6MMC/g7XwPZuhbJY9hiCOnLBsLHF7QZVcsaTVmixFq/mSDbY9w w==;
X-CSE-ConnectionGUID: FjU6iAx+TNKTMiu2xqHI1Q==
X-CSE-MsgGUID: +i8uQAx6RvWOw/wzDD7Ohw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21068038"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21068038"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:08:24 -0700
X-CSE-ConnectionGUID: ZbTSY+l5Rwa4I6unEGjKHA==
X-CSE-MsgGUID: ieQNwkeJSZ+jHr/i0iAU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24898411"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2024 13:08:21 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Extend gt test to check
 mocs entry
Date: Thu, 25 Apr 2024 01:38:55 +0530
Message-Id: <20240424200856.1194881-2-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
References: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Read and dump mocs debugfs entry.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index c5a586e9b..ba12f6ccc 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -158,6 +158,7 @@ test_gt(int fd, int gt_id)
 		"topology",
 		"sa_info",
 		"hw_engines",
+		"mocs",
 //		"force_reset"
 	};
 	static const char * const expected_files_uc[] = {
@@ -183,6 +184,10 @@ test_gt(int fd, int gt_id)
 	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
 	igt_debugfs_dump(fd, name);
 
+	sprintf(name, "gt%d/mocs", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
 	sprintf(name, "gt%d/uc/guc_info", gt_id);
 	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
 	igt_debugfs_dump(fd, name);
-- 
2.25.1

