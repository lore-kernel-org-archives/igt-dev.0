Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225E1C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 09:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606010E59D;
	Mon, 20 May 2024 09:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMiajQWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD5210E59D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716198046; x=1747734046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V7HgVRr7xT+JJq3QXsAZZKo1pJ+8aRyaBrHQlm1zypk=;
 b=GMiajQWQ4DW4VYSSeTcbmgJUxWieLJCYdnt/zXl0fnzn1ollehA1Ryn0
 AWhvGCNOzgB9ChH7UHlZ0P43QdpvqFdsqw4c5OpWHjBvqDadzE4lVXNes
 zesmNvFrkY1XP/+qKrT/wU0DE9+3+jvGL1mv3xWab99GDaKMrgDOXYDzK
 LXfbO//h0OfWkhWpUd75miLdBcuro4HYpnBt02Q1l0uZLeMvbpCXZPQAN
 iVLjlmjZ/3ca38Ssfw7sEPoOj3IfbUzGaPDFsSGsvOq7508dMD3p8hncC
 eOdrPDDPWjdwuVH/9A7YhT9+omo3Q71WLb4M4rmHg7LwN87Lski8EZasF A==;
X-CSE-ConnectionGUID: fymuiWTkQRmepVWGYCXmHw==
X-CSE-MsgGUID: OmmpiF/NTiK+Le1MI1PhRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12187332"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12187332"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:40:45 -0700
X-CSE-ConnectionGUID: sxvfhMyQRvCjso9qj1jR/w==
X-CSE-MsgGUID: uvcApBETR+mzxEcJv5wLvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32378361"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.100])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:40:44 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: add missing subtest
 description
Date: Mon, 20 May 2024 11:40:39 +0200
Message-ID: <20240520094039.31187-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

There is a warning for missing subtest documentation even for
only one subtest present in this test, so add one.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_sysfs_defaults.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 5c5db71a4..dd975c5bb 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -13,6 +13,7 @@
  * Test category: functionality test
  *
  * SUBTEST: engine-defaults
+ * Description: check each engine defaults in sysfs.
  */
 
 #include <dirent.h>
-- 
2.42.0

