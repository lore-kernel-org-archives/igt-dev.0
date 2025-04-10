Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B8C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B6010EA84;
	Thu, 10 Apr 2025 22:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9nJl+sX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AA910EA7E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325338; x=1775861338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2CxL8VjddbljmOapyfkfbk1CK54KKF8deZrnR+eROjc=;
 b=d9nJl+sXBO9ba5U1R3K7m4e7HONTKZBdT2cQoHBH7vsnpzuf+HKwAr4M
 Z7aO9aWv9VKMgSG1ANisz3CsbRQ2mfKAAGuynIug9aKqlyYL9gxO1IJ6+
 UkE6J3krcUVn9LR3/A8EV/ydegyICnt0UgdZfWsZbIqFeipf8RhV9taF1
 c7U71z+o/l2Z9jOeSBecH5LH7jU8RQec7fnIJfEaxg3eAa0l5d/UEX2va
 PVDtTnQHGCSuXvup25pgcwkf9a+X7bPNwq3jUUNdqqOxLIml1zqT3UXPR
 hNEaIv2+NMi2hxo75WuyUDQvTFbOcegNdbU9CgUXrt2hpWQYOPKZmqzY+ w==;
X-CSE-ConnectionGUID: TFYqXbX4QGOmhbxT7SYquQ==
X-CSE-MsgGUID: G/UGrLfvRAiaRffmBpNoxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757015"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:57 -0700
X-CSE-ConnectionGUID: AUguBfYkQ6yENbsi2/yuZA==
X-CSE-MsgGUID: UpwnzCaLQyqmYSq7LV7eeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998327"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 08/10] tests/intel/xe_fault_injection: Drop
 XE_SYSFS_DRIVER_TRY_BIND usage
Date: Thu, 10 Apr 2025 15:48:37 -0700
Message-ID: <20250410-lib-kmod-v1-8-84b1ad0b8075@intel.com>
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

Use igt_kmod_bind() instead.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_fault_injection.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 61d5fa872..24d3df572 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -195,7 +195,9 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	ignore_faults_in_dmesg(function_name);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
-	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
+
+	igt_kmod_bind("xe", pci_slot);
+
 	igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_remove(function_name);
 }

-- 
2.49.0

