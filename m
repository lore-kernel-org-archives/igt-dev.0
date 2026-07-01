Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD9C43458
	for <igt-dev@archiver.kernel.org>; Wed,  1 Jul 2026 12:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FD610E9EE;
	Wed,  1 Jul 2026 12:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5XEQS5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D065710E9EE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2026 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782907931; x=1814443931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQPROxsMVdjQFtR492fkZLPvU969hQ/ASaGFXTBrreg=;
 b=N5XEQS5XhTMocWO0wnBXbb/Ifmgp+G9dEm4XLwsTDaMms+ajie+Zwhnu
 e/uRLuWWkS+7c5oNbCGlU4T1ijlO8+KaMdPsr2T08WZqkaB+SDI9v4gi+
 /9bjfxKqLD/jFY+DY0dXWPDE/FtjTjpjhpBZ6WEAV1KHHJ1vCIUb6NQ/b
 03LuRioXePBv3EeiGL4zjqkqhygVBlsG2LC4lp79H3JEexab8jrBceGse
 SZpRDqbQcPqdWbtKU3ikbI6U9kDzpaTArZkfplkUeSS2qlAbaZiqa1wC/
 xRc3azLLpIfvH9O9l/UPj+g0MAEdBeShcT5mbuIwYlDGrViSE6KPODNzt A==;
X-CSE-ConnectionGUID: gsZkF2V2QOSdGfL6MyIa9Q==
X-CSE-MsgGUID: ps9TxwKaTlaqGkQhiaiLEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83414372"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83414372"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:10 -0700
X-CSE-ConnectionGUID: 2pAaUJLOSWSno7VXNQnqBQ==
X-CSE-MsgGUID: jH15FyQERcSnY4xdG1iRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="254477240"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.244.55])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:09 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 5/8] tests/meson: Remove Xe EUdebug
Date: Wed,  1 Jul 2026 14:11:46 +0200
Message-Id: <20260701121149.16639-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701121149.16639-1-dominik.karol.piatkowski@intel.com>
References: <20260701121149.16639-1-dominik.karol.piatkowski@intel.com>
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

Remove Xe EUdebug from tests/meson, as intel_xe_eudebug_progs is empty.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/meson.build | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 94c3dc214..6d90627b9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -353,14 +353,6 @@ intel_xe_progs = [
         'xe_tlb',
 ]
 
-intel_xe_eudebug_progs = [
-]
-
-if build_xe_eudebug
-	build_info += 'Xe EUdebug **experimental** tests enabled.'
-	intel_xe_progs += intel_xe_eudebug_progs
-endif
-
 chamelium_progs = [
 	'kms_chamelium_audio',
 	'kms_chamelium_color',
-- 
2.34.1

