Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2160FC021AF
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 07:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B4310E478;
	Wed, 19 Feb 2025 07:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHGD7DC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3169910E477
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739949574; x=1771485574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T+9LywsKwvg9ewtWenT1jVQCTHzcnDN8luI/L4tV4ug=;
 b=ZHGD7DC3sXhq3wsmwP52IJRWwY6J0wkFbFBy+nOILNFar81F9dFXTO5t
 OIz3QYLcQl2RLBd5wdeQ6km0sGk6IcTHLHBMdGSc+wqB42Z7834V33e9v
 M4jOM2FSPzNemCIKYGwUvPurQy4nlPqSTwIY/F4GDJYcyeQ+Fg8GyLPAL
 x7WzyzHkxxmwjvSppIinJk8kAVNjdJfocazlY9ln2NfF94+Kd0bLZK76B
 +sTjl+yFfU6pE4n8E3SJ7gnohj3+4Rb1uj6lVHIfSXGcFowK+V2/+YA6h
 c251ppa5KbHoOuF37NMktvsMe+GgIwwjs9+jaNX4ppPKfrG6E+d3Ll9wZ g==;
X-CSE-ConnectionGUID: sg1PHJvSTe2txAeHZ1YDNw==
X-CSE-MsgGUID: Yvs95dbuRjezCDVFI12MEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40885375"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40885375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 23:19:34 -0800
X-CSE-ConnectionGUID: 8ZoJ7DkqQ3+4znw9dbFA0g==
X-CSE-MsgGUID: tcsJx1CHRk2FDjbwS5PTyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114611855"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2025 23:19:32 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 5/5] tests/intel/xe_fault_injection: Do not assert if
 the captured error is not same as injected error.
Date: Wed, 19 Feb 2025 13:04:45 +0530
Message-Id: <20250219073445.31423-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
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

In the current implementation, test asserts if the captured error is not same as
injected error. It is a possible that the error received is translated to other
error which can be returned to application.

Try to unbind the device at the end of inject_fault_probe() as this can be
executed in a loop if IGT_FAULT_INJECT_ITERATION environment variable is set.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index cf0337733..82e338965 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -227,8 +227,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);
 }
 
 /**
-- 
2.35.3

