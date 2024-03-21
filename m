Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E0DC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19CD10ECD2;
	Thu, 21 Mar 2024 15:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6alH9mo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BE610ECD2
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035623; x=1742571623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hXSUaOuFIDygdC+wL400/aUdTYlhuIlbW/fxwWnPXh0=;
 b=W6alH9moQb7+3itPEo0GKkYWZvdkOQabq+ioRy92Y9CVNex6X94tv1Uh
 aP57Blhi/YR5u4Hv/W3LN1cQvBF4K34TNEGMEZDUii4pKUatVPjIlgbPp
 FkWumSebCuT+ktGeSw/FZy3TIjGQbCNlXqL/9JpxvXcKEgT0O3TOuhpG7
 DYhE/nHSoiYOrcEWqNzEJWfHFEvzygDIefniX70nVtBF2wTBLPDsbMSsl
 kXDrlQIOpqotbo+iNrjNHC4XY1YhewbLg9LJpm/sb/lEAUxdzXYqH7Eys
 GUloK9Nej0eiFxM+trcagGldCtXLDhY4QCNCGsYXEMqzxRIUwgwwi6AwW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23527395"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="23527395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45538354"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:40:21 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v5 08/24] tests/intel: Introduce FDinfo subcategory
Date: Thu, 21 Mar 2024 15:38:31 +0000
Message-Id: <20240321153847.1787625-9-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

Let's introduce FDinfo subcategory.

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Acked-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/drm_fdinfo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 3ced658f2..aac2fdb6a 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -36,7 +36,10 @@
 /**
  * TEST: drm fdinfo
  * Description: Test the i915 drm fdinfo data
- * Feature: client_busyness
+ * Feature: client busyness
+ * Functionality: client_busyness
+ * Sub-category: FDinfo
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: all-busy-check-all
-- 
2.34.1

