Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBFCC369A6
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100B10EA85;
	Thu, 10 Apr 2025 22:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7RIPbI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEC810EA7F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325338; x=1775861338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXrS9HNwSEkyTD1lJOhiuuGLdO4LBg0dlzqlcLQGLjM=;
 b=i7RIPbI4zoRuk0IxarRxmjOMZ+XA7fwVL9p2yf6L8F92tTjLOS4eyS3K
 Ej5YKbQ5A53+KDt0WX3a4WHWPzbXY9CeboUdv5og0ejsEQ9MP+Y1ZypJ2
 2AlUHuG2dMWjG+KIUvs8iHtxKlRS/uxMQTQlfuHBso6wjDh5Yy1O+dKEi
 CBItOOPvzi7u+9OXPFkm2HF1bCQyj0z1/Jz/MwOijCH1A58fuH/LbEXNN
 bgotKvTeZqEuc+S7aj68DYUTRZSDjFze4CT4yMLtObcmVpyun0XL3qLgW
 uv+1kYaSxjm5pPpi8/5K5mqtFoCvg3hzweT3Vppu+JkQ2UbdvXQCJx3Nv A==;
X-CSE-ConnectionGUID: woyf4UfgQP6s/E9kggqvEQ==
X-CSE-MsgGUID: TSerfx5QTsye8SCI/ldUjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757017"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757017"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:57 -0700
X-CSE-ConnectionGUID: 0ot9VaErSLCsbxf0I7dKcg==
X-CSE-MsgGUID: tXJvS4iOR26CIbXzXbX9hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998330"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 09/10] tests/intel/xe_wedged: Drop
 XE_SYSFS_DRIVER_REBIND usage
Date: Thu, 10 Apr 2025 15:48:38 -0700
Message-ID: <20250410-lib-kmod-v1-9-84b1ad0b8075@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-9a9c7
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

Replace with XE_SYSFS_DRIVER_REBIND with igt_kmod_rebind().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_wedged.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 22ff75367..1d2c510b7 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -228,7 +228,11 @@ igt_main
 
 		force_wedged(fd);
 		igt_assert_neq(simple_ioctl(fd), 0);
-		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
+
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
+		fd = drm_open_driver(DRIVER_XE);
+
 		igt_assert_eq(simple_ioctl(fd), 0);
 		xe_for_each_engine(fd, hwe)
 			simple_exec(fd, hwe);
@@ -266,7 +270,10 @@ igt_main
 		 * Rebind the device and ensure proper operation is restored
 		 * for all engines.
 		 */
-		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
+		fd = drm_open_driver(DRIVER_XE);
+
 		igt_assert_eq(simple_ioctl(fd), 0);
 		xe_for_each_engine(fd, hwe)
 			simple_exec(fd, hwe);
@@ -299,8 +306,7 @@ igt_main
 		}
 
 		/* Tests might have failed, force a rebind before exiting */
-		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
-
 		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
 	}
 }

-- 
2.49.0

