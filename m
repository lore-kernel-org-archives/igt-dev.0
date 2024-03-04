Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43E0C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8308F11200E;
	Mon,  4 Mar 2024 11:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqNVcTfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB9011200F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551108; x=1741087108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FxlHYqceHBU6cwyCnydwnpuAl3ev4ubHQiIKt031eK8=;
 b=fqNVcTfMvqtK9M43gapSW3hR+5FrmrOeT3cReztsqumYgsqwSzKLA7xa
 FTjyLp5sm4lVzV0a82AinKP66Ho5ncMYaiIXC8RQhQ/BJWXromOf6n756
 bx7Js9vNUPB6EFroUXGN1hDCsaFnAqZIt2vm0qjmpC83lWYS554uttaci
 jKdLiMyIHv/41ykapWcNprHF0b6Nalbcf0PlisAhlW9jh2iOYJsDjLvu9
 p3lmeBIYskiTMQyAQv7wYD5XA+gZ5fqC1vvwQ8wi8+mHBYr4Urhxucp2O
 YtXPxtCDBJAwccGoMTUWVcBw0Lv1uMmVZXATq0axvNlYNLAW+witp7Mjs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15445022"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15445022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9104990"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:24 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Feng Qi <feng.qi@intel.com>, Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 11/24] tests/intel: Introduce HUC subcategory
Date: Mon,  4 Mar 2024 11:16:04 +0000
Message-Id: <20240304111617.849785-12-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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

Let's put huc test under HUC subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Feng Qi <feng.qi@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_huc_copy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 246fa0a8b..311c2fc59 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -39,6 +39,9 @@
  * TEST: gem huc copy
  * Description: A very simple workload for the HuC.
  * Feature: huc
+ * Sub-category: HUC
+ * Category: Desktop client
+ * Functionality: huc
  * Run type: BAT
  *
  * SUBTEST: huc-copy
-- 
2.34.1

