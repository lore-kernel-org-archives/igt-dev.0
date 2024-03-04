Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C7C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DA910E408;
	Mon,  4 Mar 2024 11:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3i52Wox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E810E224
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551117; x=1741087117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+FFn5RXKH+tXmZEACQxNnHcNlmnG5mp+ikGif1dNGb8=;
 b=l3i52WoxrVpNUEn/YEkK38aSC2oziGK2pipi6LgJH3U+T0PMgnW5xWG3
 LvT3TH4obvOWDn9WucdZ+yfn80OLEVrSnCCwkHiSrwJ4xtPSzDuFXrII6
 mcKGFCvzj9vqi7GapycRwu9R+JsFNsBTHf2HFNF/3VfmIbMIYy4XqNwXh
 Q9mRt1dbyUmrE6E/dPTBSggKCcH/ldM0ps2JAUsHCODFzH5rJ/fwTD3jg
 TOO22Ly4sNHCLE9FeaEFonUio0HBfGpoWu92nhCYlk0eSKnR9XdMXCcXs
 2DMuxFYi6PLo4AEjOFFSmfykd0KWbZOHVI/8e+5r6imxxjQejCSjfMS1j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15445051"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15445051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9105080"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:35 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Turko <andrzej.turko@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 12/24] tests/intel: Introduce Media subcategory
Date: Mon,  4 Mar 2024 11:16:05 +0000
Message-Id: <20240304111617.849785-13-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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
index 79a06f7b8..65b53a6e0 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -49,6 +49,9 @@
  * TEST: gem media fill
  * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
  * Feature: media
+ * Sub-category: Media
+ * Category: Desktop client
+ * Functionality: fill surface with media block
  * Run type: FULL
  *
  * SUBTEST: media-fill
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 38ebd157d..d58c990f7 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -39,6 +39,9 @@
  * TEST: gem media vme
  * Description: A very simple workload for the VME media block.
  * Feature: media
+ * Sub-category: Media
+ * Category: Desktop client
+ * Functionality: media
  * Run type: FULL
  *
  * SUBTEST:
-- 
2.34.1

