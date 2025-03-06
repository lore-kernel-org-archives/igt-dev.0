Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FAFC28B22
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DE310E928;
	Thu,  6 Mar 2025 09:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLz9rXMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6100F10E928
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254909; x=1772790909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XqTls7Db11CAaQGAZEsufWG4mQjSsvtw02+YS48PEUM=;
 b=WLz9rXMrER5k0g/wN556K/wHvJfDZkLiAUK4EunWF7Hjn2nlHUJ8cdWz
 kSexk1w5PvN4r6tzzhR2fYhjbIHpM95p/N2t/+OMwnWUXGwNpGhzQrom1
 qtlD0oFQlnw6uRY/3BJZrj/H+xqSVrNgN/RiztptPAdgJHcZb9faN6Wg/
 F8HUFkXm4TqW8G77P4ok4pxgAWsN6RW4qzR2hHNwFRPAT/y5kG3zxUm3S
 u+kN7asbnMHWN5hZD3ynhYgdLUljn1aQJjYYsLg/p5y3bNNTXKOIyFL+j
 7m1fUKpRzBp8HOvivLN01O02SgzIaHnqLR1TFdExDthY0XEPWgbVxldES w==;
X-CSE-ConnectionGUID: 0S20htX1Rz2EKHoLQn1VMQ==
X-CSE-MsgGUID: smaZuFHCTRaMG+MQlhSO6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29839191"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29839191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:55:09 -0800
X-CSE-ConnectionGUID: tv3H2u+aTKS5dBoERc79kg==
X-CSE-MsgGUID: 0owFhHjLTsi/V/IW0XUngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119160886"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 01:55:07 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 1/6] lib/igt_sysfs: Add support for device unbinding
Date: Thu,  6 Mar 2025 15:40:36 +0530
Message-Id: <20250306101041.26827-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
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

It does not harm anything when we try to unbind a device which
is already unbinded. We do not want to throw assertion when
the device is already unbinded.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/igt_sysfs.c | 4 ++++
 lib/igt_sysfs.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2e4c2ee63..3fffaf96b 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1509,6 +1509,10 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
 		close(sysfs);
 		break;
+	case XE_SYSFS_DRIVER_TRY_UNBIND:
+		igt_sysfs_set(sysfs, "unbind", pci_slot);
+		close(sysfs);
+		break;
 	case XE_SYSFS_DRIVER_REBIND:
 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
 
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 86345f3d1..cc4971e70 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -187,6 +187,7 @@ enum xe_sysfs_driver_action {
 	XE_SYSFS_DRIVER_BIND,
 	XE_SYSFS_DRIVER_TRY_BIND,
 	XE_SYSFS_DRIVER_UNBIND,
+	XE_SYSFS_DRIVER_TRY_UNBIND,
 	XE_SYSFS_DRIVER_REBIND,
 };
 
-- 
2.35.3

