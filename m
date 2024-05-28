Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF45EC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 05:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B2910FD14;
	Tue, 28 May 2024 05:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6WX8hEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A40110FD14
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716875388; x=1748411388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xcbHk1LPXeSBiM7TjXBKlpagk25akVoKUPgJ5C27Muc=;
 b=g6WX8hEquFVxI4U9J6WhQ9lWR94/L2sHTmWIlCb9lhgFKUAd5rFVm8V5
 Svo/GnPyxlsT6dv90fHTE27YKhawo04+/9EGswiBcn8i0AoKpUHaMmd/R
 I3ChMdtpVWGi2KYN3nOu2ahJUMRO9dGRsYoslEbzpt/Fn7I61bIT+hMbT
 6uqhFqeGvQR5LsxTKj7LPC9TEo7BP8hgkY+CEkCtRso+VV/QcbKR5jHdX
 Ck3uPmIVx5/xckCN/xSCrsUqLQW7/UaQ6AQ31W4BOWyxqNIiHfy3nwAwp
 /GzNd6jF7Ze5pZ/R4yY+OnPUtDcTsAdwnEwxHr5POem7Z8g9Sg4TkKdo1 w==;
X-CSE-ConnectionGUID: JEomnhDQQ9eL5fsuPkgbIA==
X-CSE-MsgGUID: jvDF+0HDQD2IhYspsip/RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24615876"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24615876"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:48 -0700
X-CSE-ConnectionGUID: 9gdmw9rYRyiiAakDRi4/1w==
X-CSE-MsgGUID: dzps6LxxT/CKGwS/oho7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="66165878"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:47 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/kms_test_config: Add fbdev tests to
 testplan
Date: Tue, 28 May 2024 11:12:21 +0530
Message-ID: <20240528054223.2945356-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
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

Add fbdev tests to KMS testplan.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index bca3b250f..7886b6f58 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -2,7 +2,7 @@
     "description": "JSON file to be used to parse KMS documentation",
     "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
     "drivers": [ "xe", "i915" ],
-    "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
+    "files": [ "../chamelium/kms_*.c", "../fbdev.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
     "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
                        "kms_dsc_helper.c" ],
     "fields": {
-- 
2.43.2

