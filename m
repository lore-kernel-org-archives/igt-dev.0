Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D547C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CFE10F8F9;
	Fri,  8 Mar 2024 08:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2Y2WA8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968F810F8F9
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887153; x=1741423153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPOFK2E5GEcg3U7VwKvSBpupEZENIXRli69+4wbLQrU=;
 b=Y2Y2WA8XwjPw57dkXj13MDQREmKIoUcbTXpFAiin3ZhhhzEEBn1J27uH
 72MnDxl2zWEBSbwZu/E/HZW2HgEoSPAjDkem8MzvNA06UxfESQ97vxKs5
 rIMLzIvlr5j3U3LhcLw/8CUFBQ9VQhgLwyRjWBiBl1Ogv0bdSf90CWpKS
 /3oZDBM0EUXdeO+DKYKHvUlj4CxuWvuToga8kDm2qzH/1RC0x4rc7YxvL
 pKlOSfUZs1DrdqaApNKksKKRWvxkRTNHvgoRnNHMMkN02bDVI1AWwHa3x
 a4AEpuZjqZB3Sw91VSo1SAK8Ga5Clb5nzcB1KOGPMFucFveP2InDeecJt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4737197"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4737197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10808468"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:12 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Turko <andrzej.turko@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 12/25] tests/intel: Introduce Media subcategory
Date: Fri,  8 Mar 2024 08:36:44 +0000
Message-Id: <20240308083657.1092049-13-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_media_fill.c | 3 +++
 tests/intel/gem_media_vme.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index 79a06f7b8..f0ba797d9 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -49,6 +49,9 @@
  * TEST: gem media fill
  * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
  * Feature: media
+ * Sub-category: Media
+ * Category: Desktop client
+ * Functionality: fill media
  * Run type: FULL
  *
  * SUBTEST: media-fill
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 38ebd157d..ee1f020fc 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -39,6 +39,9 @@
  * TEST: gem media vme
  * Description: A very simple workload for the VME media block.
  * Feature: media
+ * Sub-category: Media
+ * Category: Desktop client
+ * Functionality: vme media block
  * Run type: FULL
  *
  * SUBTEST:
-- 
2.34.1

