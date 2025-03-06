Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413E5C28B22
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04410E932;
	Thu,  6 Mar 2025 09:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miohOJgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB90510E932
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254916; x=1772790916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DaGALLefcnV6d7+5JEglBy1wqDIt4aBD0patS6yEBvg=;
 b=miohOJgkDm1R2UCgpCoXYEaJjv2Sgao30P66wIMUZuLFpY5h6WO0fU0d
 w5A73ma+Avz65R3XBT4zq5ANUqqCxo36rMEJIJAhp+FfuF2FKPRmxyDVa
 BTivSuZP9dpRvhuqL7P/f3xLEu7IWvhLp8tbiZX8H3qTE/NcxxZSR5Oyi
 x4n4TpJEY6HHgNjPx0P6wqtxFeaDiyVsLUq5QIe+nWkBcoLFvuOkMUm9l
 ky7BlpxdEPk2ZanqYU7OlgXnm6un+uTB9ZB5iVQ/VkOOq4YER5tZXEQNR
 xBzXQTclFvv0x9/4eN0afLcXjgpdMMXSn9Oed5hcGQT0TuxhvJ0qIN//F Q==;
X-CSE-ConnectionGUID: CzCOGGlGTHShX3MR47pz7w==
X-CSE-MsgGUID: zKc4mLRwR8GzHgttqIdz7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29839195"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29839195"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:55:16 -0800
X-CSE-ConnectionGUID: ZZemVSJNQYC63yQhEbmRYQ==
X-CSE-MsgGUID: KkwZ7044RNW9037cVmtT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119160955"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 01:55:15 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 5/6] tests/intel/xe_fault_injection: Try to unbind
 the device after error injection
Date: Thu,  6 Mar 2025 15:40:40 +0530
Message-Id: <20250306101041.26827-6-satyanarayana.k.v.p@intel.com>
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

Try to unbind the device at the end of inject_fault_probe() as this can be
executed in a loop if IGT_FAULT_INJECT_ITERATION environment variable is set.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index de9ae02f1..10e243679 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -230,6 +230,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
 	igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);
 }
 
 /**
-- 
2.35.3

