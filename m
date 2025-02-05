Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4A2C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 03:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CACF10E12C;
	Wed,  5 Feb 2025 03:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDgw0dD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A9C10E12C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 03:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738725007; x=1770261007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tOsQBc6PLEjkJYY+iUXaaOLP2ts88AFygjsXN1sd+Z4=;
 b=fDgw0dD0tbWtHGyPZUe60u+vZeRl45wuuXFjjwZdnVjw5myXTKgNsffC
 HLc9umbVM6B5AMpcdGtuvVMgrM4F14Qsvy/c7E86Qs/irjRrQMNoQMBw1
 sq0UxGRSEDBL+qrZP+/zYtVe4E7ovIC3fcZGF6EEQFHM7Nj2FWycwhKU6
 pXth0ZRVhwEyi4/dEsWP3FrDfrGiY5Qd7VhpAAh1GT9vC0uPrFLJmnVo5
 jCFWv0oZkWX7JMt1z8tCfV1kIiUxExVslklY6S0st1GAjqRICOT/4u9PK
 Z5Ab3mNP41CDbfXv6cVRejxx3t5UGrRJcoeuzBVlnL8GeHg3OBZ1AaFze g==;
X-CSE-ConnectionGUID: TQN6urIyR9COvKYLEfuA0A==
X-CSE-MsgGUID: 1uUVrzX5Qs2pvZ3TaPZI8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39539620"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="39539620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 19:10:07 -0800
X-CSE-ConnectionGUID: lD2NQJIFS/WJYoonxT88AA==
X-CSE-MsgGUID: jx6wHXquQOeMnHHNDNszjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="115817082"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 19:10:06 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Stop unloading drm
Date: Tue,  4 Feb 2025 19:07:43 -0800
Message-ID: <20250205030948.1965423-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

When testing i915, if there's another driver present, unloading i915 may
cause the other driver to unload and let developers chasing ghosts when
they think it was caused by i915.

Hopefully fix the ATSM testing where AST driver is also bound to a
a device.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13292
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

After this change, running i915_module_load@reload doesn't cause ast to
be unloaded, but I couldn't check it really fixes the issue since I
couldn't reproduce it.

 lib/igt_kmod.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d154701c6..524c1a632 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -690,7 +690,6 @@ int igt_kmod_unbind(const char *mod_name)
  * igt_intel_driver_unload:
  *
  * Unloads an Intel driver and its dependencies.
- *
  */
 int
 igt_intel_driver_unload(const char *driver)
@@ -709,12 +708,6 @@ igt_intel_driver_unload(const char *driver)
 	}
 	free(who);
 
-	if (igt_kmod_is_loaded("intel-gtt"))
-		igt_kmod_unload("intel-gtt");
-
-	igt_kmod_unload("drm_kms_helper");
-	igt_kmod_unload("drm");
-
 	if (igt_kmod_is_loaded(driver)) {
 		igt_warn("%s.ko still loaded!\n", driver);
 		return -EBUSY;
-- 
2.48.1

