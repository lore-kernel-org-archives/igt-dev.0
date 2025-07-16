Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDB9C83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 13:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B405310E3A0;
	Wed, 16 Jul 2025 13:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4b1bEsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699DA10E2AD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752672010; x=1784208010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7lHZp3NZmLjZq/okXoPaNYoZJ9tUItiZL55NF+x5Rhw=;
 b=W4b1bEsEvyCR7KqubIaxEHYcHRufH1jsAlcks6WpV6niaNvSuWoVENTk
 x2Zb2vy2iyk7JEguGLEfEcdF4lGp6VlB32+fUrZa40m6M6GiXx0iY43xA
 lgSeUDKKFJhhyXWh7wsPhFZ/PILOq8bDu0rwN4JaFuAhfBHcEX6Gk1bne
 sOh54ewybT3W6tC7HrfP8DrnrZZycO9PZ088vPXYyfbmYSsi/Vv1glvqJ
 VJ5YlWhv7ghWOmvaDjaU21jHAXRWA0FV1Mp+CmPOQhH7nSLe1PZz7w95t
 9yYE+bj2kFHKN/06S4rrDGPv1U9TfY+RyUEKuO4c8yL4tVB415bBgY6RU A==;
X-CSE-ConnectionGUID: TRNzmCC/SHeXZxxx5mfRVA==
X-CSE-MsgGUID: BbbClI7ZT9WeZaO17sWBXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58686227"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="58686227"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 06:20:10 -0700
X-CSE-ConnectionGUID: LA0JDpQGS1aOVSP7JmM0sQ==
X-CSE-MsgGUID: QloAVy5sSTKwSnLMH2Vuvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="163135938"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 16 Jul 2025 06:20:07 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] lib/igt_sysfs: Remove redundant variable assignment
Date: Wed, 16 Jul 2025 18:57:52 +0530
Message-Id: <20250716132752.1279098-1-pranay.samala@intel.com>
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

Eliminate redundant assignment in debug mask setup.
Simplified the logic by directly using the input
parameter for logging and sysfs operations.

Fixes: 835f38b71973 ("lib/igt_sysfs: Update new debug mask requested by user")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index aec157b5b..96ca57ed9 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -506,7 +506,6 @@ void igt_drm_debug_mask_reset_exit_handler(int sig)
  */
 void igt_drm_debug_mask_update(unsigned int mask_to_set)
 {
-	unsigned int new_debug_mask;
 	static bool debug_mask_read_once = true;
 	char buf[20];
 	int dir;
@@ -525,8 +524,8 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
 		}
 	}
 
-	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
-	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
+	igt_debug("Setting DRM debug mask to %d\n", mask_to_set);
+	snprintf(buf, sizeof(buf), "%d", mask_to_set);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
-- 
2.34.1

