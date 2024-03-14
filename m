Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BBC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCA910FBB8;
	Thu, 14 Mar 2024 14:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaJGyamV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC94B10FBBF
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427027; x=1741963027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uI1hibSihnvvnGBRaYWBXokQSngRfEIwmwpxw3kSl7M=;
 b=KaJGyamVgJUeIHEp2uwUeiuLrb6Zuks6lMRzFUWBbGuyKCucMCRT+J46
 NrPXFkDATcMxEUODhcefiBgG8mbIpO7+uwjAdZCfOd/v6hcaZ/wYH6PAr
 55o4aP7w42KmCsB1KK5HDtdiq7kW0zMRlhWLVGlbgp1Wy6wqVJO2lYkIJ
 gwxke9KikLKoR7xqjmXnEYHz+Pfk/GXHhb7gsCxosXo182bisJ4nC0E5B
 N3+ZaULqJxoisBgRxVO6dvbL58uKqsA1hMURmJWgxl5uhhagx8cj0RWuu
 zynqvPdIvkhLYn8duYWxfxu3tqr14Q4POElC4qUpYHdgqoGKqzPVjP5pU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697831"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697831"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12883974"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:37:06 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Turko <andrzej.turko@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 12/25] tests/intel: Introduce Media subcategory
Date: Thu, 14 Mar 2024 14:34:42 +0000
Message-Id: <20240314143455.1436688-13-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Let's have media tests under Media subcategory.

v2: changing functionality to not break automation tools:
 - igt@gem_media_fill@media-fill - s/media/fill media/
 - igt@gem_media_vme - s/media/vme media block/

v3: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_media_fill.c | 5 ++++-
 tests/intel/gem_media_vme.c  | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index 79a06f7b8..fcd90b70c 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -48,7 +48,10 @@
 /**
  * TEST: gem media fill
  * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
- * Feature: media
+ * Feature: media feature
+ * Sub-category: Media
+ * Category: Desktop client
+ * Functionality: fill media
  * Run type: FULL
  *
  * SUBTEST: media-fill
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 38ebd157d..d6afca01e 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -38,7 +38,10 @@
 /**
  * TEST: gem media vme
  * Description: A very simple workload for the VME media block.
- * Feature: media
+ * Feature: media feature
+ * Sub-category: Media
+ * Category: Desktop client
+ * Functionality: vme media block
  * Run type: FULL
  *
  * SUBTEST:
-- 
2.34.1

