Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9B4C02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 07:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB50410E261;
	Fri,  7 Feb 2025 07:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maqGJBn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B81F10E261
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738912423; x=1770448423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qjaTmSlbQXhOYhG6//AG1rH5jhxb5LhuOTeyEs8IZdU=;
 b=maqGJBn/M8KjZsbzk58tMHyFXOS3tEQcH6BMP5Xwz/65kE+j54v++7kb
 G1QzUTX8gANi7E5IOAIQZTLbOZzuBTgdL+LuMgPLgBmS8ZzGdGsDvfL03
 oR9oIrWV/7Pinqp+ranQj3ORrcg4ModLknh0lx5ta/LQxPZjZ9ghUQSqE
 ATfX+ODEJ/I5HDFmqPMOowv5c87ufbEuCGH+x+d6cb2QKnpzaHGU6T64i
 tWJoKGUjQIVf5PYAQDkWymDTg3kYDi/oAC7U3cjaeGw77WlQBGR028YLh
 ATCexPp/ND4Jpf+EujHeNVOUaGt9y/m5yk+P3+r5HRILhHAoz1E3AYWPB A==;
X-CSE-ConnectionGUID: BYmx4+95RueCyhuHNQxJPA==
X-CSE-MsgGUID: pQbDMC84Q+yY2eoP8ll3HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50530060"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50530060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:13:43 -0800
X-CSE-ConnectionGUID: 35Agd3ecR/OoS6SQrk+3CA==
X-CSE-MsgGUID: L6VUCkFCRu2xa4nxUZeaXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111373942"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2025 23:13:41 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_sysfs: Add support for device unbinding
Date: Fri,  7 Feb 2025 12:58:59 +0530
Message-Id: <20250207072902.12582-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
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

