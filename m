Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A3BC10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 13:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0837410E18B;
	Tue,  7 May 2024 13:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LB3o4nQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E6F10E18B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715089431; x=1746625431;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HMkWDmlrmS5SGXqRsuxRwCmqjeOiqpRpeVqPP50mnZo=;
 b=LB3o4nQG9O9gmADsD/WAMgxKYVFZSMy0At4NEo707DoJGvwB0JZhI1o1
 Ot2sv6GEuxXx0bSOVkKCY4x0sQ8eV/JGZW4YDmfIdo04altyoelmBHoZ3
 9jA4EhmNehvBtKBJ4orAkQXBYFRZ1jKROgiTlHPIrMnLYDXNIrEO+fPoJ
 ATdy6LZH3NBcp4L9/1XY77nmtS9zHzd0ECwfP1WuntZ04US27kkTtfnHb
 ng89/Gb4bI6QK+s8uX2fhEhvyyvsqbXQxe1UpVYi+yFgCZyAqqRD273HE
 FOMko0TkRcwGfovmTacrGZuPM54R0ywP2TmJ9NFEkJLBNBwReAV3Gsv2q Q==;
X-CSE-ConnectionGUID: G0gHTI8KRreHNYqHPojiIQ==
X-CSE-MsgGUID: UJTu/hD2RX6m+FgP5F+v3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11009105"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="11009105"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 06:43:51 -0700
X-CSE-ConnectionGUID: O3xEH6BmQ7eiqu0dmziSuQ==
X-CSE-MsgGUID: HLpt7vb2TPe7n5dRPw/0SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="29112973"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa008.jf.intel.com with ESMTP; 07 May 2024 06:43:49 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_debugfs: Extend gt test to check pat
 entry
Date: Tue,  7 May 2024 19:14:42 +0530
Message-Id: <20240507134442.2246647-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
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

Read and dump pat debugfs entry.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index ba12f6ccc..73b11dc74 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -158,6 +158,7 @@ test_gt(int fd, int gt_id)
 		"topology",
 		"sa_info",
 		"hw_engines",
+		"pat",
 		"mocs",
 //		"force_reset"
 	};
@@ -184,6 +185,10 @@ test_gt(int fd, int gt_id)
 	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
 	igt_debugfs_dump(fd, name);
 
+	sprintf(name, "gt%d/pat", gt_id);
+	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+	igt_debugfs_dump(fd, name);
+
 	sprintf(name, "gt%d/mocs", gt_id);
 	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
 	igt_debugfs_dump(fd, name);
-- 
2.25.1

