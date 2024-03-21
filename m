Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD037C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F86A10EC00;
	Thu, 21 Mar 2024 15:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxgubGKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02010EBFB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711033855; x=1742569855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HGOcQDheClBJyVYHFv6VXfcNVxPDzLbhNIEM3Q0x8Nk=;
 b=nxgubGKauvx1uBPcmmpZPI/6l4wrAO+O9yGYQsbxZIv1T6ojVUyGtgl/
 cHBcJL1vaWkKUGmelH1qryA5rSggQ92xMaQlUrVNrWzloxlSOfB2JcMP5
 3Nwu8J3hWJfdOSwxzNftwnufjn9u00SL4QIR1ZTZZq3uyPmH+Y/mYzIVf
 Al6jvFlgOD5kR79L7KSGYYKM+9OUjLL2JVulytJ8+q1o/T51y0UBGrTDj
 Qjt3ReTTeZ88flCSjGHSAcuTgy5phaD4ZTWWyvPjdMHKO5qCYbRuy1ypG
 4POebEDVfy+Holow8uNqk8oLZxGbuUQxE+d0Ob6zNu36aIK7w127ujDvV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16575632"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16575632"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19011304"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2024 08:10:52 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Extend gt test to check
 mocs entry
Date: Thu, 21 Mar 2024 20:46:36 +0530
Message-Id: <20240321151637.3320911-2-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
References: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
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

