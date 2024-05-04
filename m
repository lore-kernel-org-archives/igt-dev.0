Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D6EC25B4F
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 13:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464DA112C08;
	Sat,  4 May 2024 13:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgTm9BPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D417112C08
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714827852; x=1746363852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IACG/C3OdG+MnP8tUUaxwV1eAUsAf1uNLyPetu4nTfk=;
 b=CgTm9BPP+Zo0bLNjqx9FJ6mpC/08KEi6EuNyIplPuVwWfm5FIJ3QGykU
 4wktpxQmY708IwnnpeGOsjzS1KxM2EdIVzLXNfQOeWrE/L2uZClI7Fa1+
 mjTaLhyYtHFG4cNT0t/zZIJRda5l77bzju85bob3mmAgC7/d91MMgPbTX
 u55mWRiVIdNR+rpsAW/90fuCMoxAw7A0NLAiBMd/zLEUKm9Pxtm3je6i3
 ebJPsBEvPpa4ho5jqePyCUx7k+IBeilyLSc/BMEAFq2bzJw2FcXDoQt4b
 RykZF1GByxf98Hza17o9D56eXORmh9sUapc8JGmQM6MYWNlz7koXA8qZ3 g==;
X-CSE-ConnectionGUID: 6aKJzMIETV6hjSin/TqCMA==
X-CSE-MsgGUID: 1Nxg5lhpR1+vhCUzkuUePA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10506812"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10506812"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 06:04:12 -0700
X-CSE-ConnectionGUID: t0IMEg33RbiHUYSMzDR6AA==
X-CSE-MsgGUID: Ql2i/dcDQHGKIRxOXjPvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="27769779"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa009.jf.intel.com with ESMTP; 04 May 2024 06:04:10 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com,
	badal.nilawar@intel.com
Subject: [PATCH i-g-t 1/3] tests/intel/xe_debugfs: Extend gt test to check
 mocs entry
Date: Sat,  4 May 2024 18:34:56 +0530
Message-Id: <20240504130458.2102132-2-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
References: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
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

