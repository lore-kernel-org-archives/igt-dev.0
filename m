Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6809C05023
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4271510F6E1;
	Fri, 19 Apr 2024 06:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N46RRwHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B5710E55A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508154; x=1745044154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtD4xL6Rsh8vb+RQUi3nkgGqxqleg2oIeS9fujQ3mZs=;
 b=N46RRwHCpaXEnpT/Dv9leMAZy/+8OY0UN3vwkIUtvwVZDYlgNjYC83IK
 eA5A4VnzmdTAWaaVwb7GW4QrObXPHDAs+ugBxx1LROYxj/D+NkBFUUsi9
 bEN3Cjz0eZ4m/GcdTgCeqvt0Pj1WzNS5N2ce/yOSS3MqSJb5/FV4Cho68
 fJBIiWl8aEoWVL7daVV4hzebfXxD2+pbA9r6FVjpUGlGFVDv5BkGYl1Z8
 D4FkWLxC8ZshimWmyNrSShBoM2/bwDs2ggcbzH8o2WuwR1dANykFeatXk
 xe+DdPA4dRmvJW99QSnqFchtrife4MI7r5wAX5EzhLIDgcYaLrps6OuAU A==;
X-CSE-ConnectionGUID: o+xyf24JS/ua7Uj7OJfmdA==
X-CSE-MsgGUID: 9pSlaTNZS/OwRaem35O9cQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637544"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:14 -0700
X-CSE-ConnectionGUID: e3DI7KnjQjmdakFWgpymEQ==
X-CSE-MsgGUID: R00giesNSkCtjMw3UO31vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310760"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
Date: Fri, 19 Apr 2024 12:09:55 +0530
Message-Id: <20240419064001.2401850-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

kmd exposes debugfs for all the platforms, so add
a check in igt

v2: dsc is required for gen12, so test only
for devid 13 and 13+ (Ankit)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3216fe7e4..378c97f88 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6246,6 +6246,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
 	char buf[512];
 	int debugfs_fd, ret;
 
+	/*
+	 * bigjoiner is supported on display>= 12 with and only on
+	 * Pipe A for Display 11
+	 * For simplicity avoid Display 11 and 12, check for >= 13
+	 */
+	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
+		return false;
+
 	igt_assert_f(output->name, "Connector name cannot be NULL\n");
 	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
 	if (debugfs_fd < 0)
-- 
2.25.1

