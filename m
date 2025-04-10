Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77B6C369AA
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC0D10EA81;
	Thu, 10 Apr 2025 22:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsnQtRUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE4110EA7E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325338; x=1775861338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwybRxgUnI5PIHJ7TbE1DrrkGWjBC4Yt5Mmtf4dWSPs=;
 b=IsnQtRUIAWaCBNqrCqDjO6IkwznnatbUOsNG64jqKho3L3r85ap5hUUd
 sxEuiM7o5Uw8AajhLwd/n7wNWl8IFMBl8lMbKIpZWy5del6IBrbSMitht
 9IzdBbdHPkb1J4ujhONlq8GzqTG5cADOEqrzNGFpbhutHMmapiLOhsFB4
 r3/o4MHmW+vsgSncoJv9suptHYbOh8IwiXMY03IzvczMDCXKuZQBX9+24
 rMijdeIbyQ0eUZpepkkxzgR9+fVi6cqI3ZMjXfrT52rnaihyROW+VXYiO
 qNTMskINZaO2gLUUYGED+XFMpBIF34/lOlLxfwyITzFUZgiFQEMNZkX6V A==;
X-CSE-ConnectionGUID: V4EO8dhJSPGUoe1R9OFKQw==
X-CSE-MsgGUID: AeB8ddzFRXqIvMk6AbEFcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757020"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:57 -0700
X-CSE-ConnectionGUID: s7CRlQ2+RmCxoWeXUadCKA==
X-CSE-MsgGUID: o7GDxhxoTTGw4yViwD9N0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998321"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 06/10] tests/intel/xe_fault_injection: Use
 igt_kmod_bind()
Date: Thu, 10 Apr 2025 15:48:35 -0700
Message-ID: <20250410-lib-kmod-v1-6-84b1ad0b8075@intel.com>
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

The following sequence is very odd:

	drm_close_driver(fd);
	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);

When the second call is done, fd is invalid. It's not a bug since
xe_sysfs_driver_do() does nothing with that other than returning.
However, now that we have igt_kmod_bind(), use it.

While at it, remove some trailing newlines.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_fault_injection.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index fdd11ffe6..61d5fa872 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -481,8 +481,6 @@ igt_main
 	igt_fixture {
 		close(sysfs);
 		drm_close_driver(fd);
-		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
+		igt_kmod_bind("xe", pci_slot);
 	}
-
-
 }

-- 
2.49.0

