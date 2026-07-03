Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4BEC44500
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 06:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1774610F661;
	Fri,  3 Jul 2026 06:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGflKEqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC3510F656
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 06:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783060725; x=1814596725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hwPK+YmlOdHHJk2NOQU4DKq5+3EHtPTBItiesAAkukg=;
 b=ZGflKEqeCFHkBAJ9hyyBTsEOK9Gy6JPcOM+lm2hoan5gcmbD9adfacVd
 qftBoELBk5XuflA6x8ZuwM/6NUyiXWgJEu/tYMbS9eFpcf4AXvSNgR6B+
 vTsPuY1w+Iw3/j83emEODb2ZdtRqecjLJ9xTQpnxYcIixKXbQOpCM3MUR
 8mkpIjpOl0qbUWckQ1hziXykw82uL620eedqJ/ZgNZk1AIG0iBTo21ZMV
 JXo3+paVQE8ezO8GZNAxGwGvDbZoRlozwC87bOaugnLucvLM5VwHYy9VT
 6QjT9PEdK4dTc0v3oh+aKpibnWhoYf+29gqqli7Mf0EF44oinNgEVY6Q7 Q==;
X-CSE-ConnectionGUID: pGPeOPToTOyVpxO1VIlFHw==
X-CSE-MsgGUID: WurZTYEdR8arHvqhmagKxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94168547"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="94168547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:38:45 -0700
X-CSE-ConnectionGUID: fU9kfdXZS9GTPaRW9+Algg==
X-CSE-MsgGUID: JcdhGlMGS62s9IZhQs0TYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="291167001"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.245.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:38:44 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 5/7] tests/meson: Remove Xe EUdebug
Date: Fri,  3 Jul 2026 08:38:19 +0200
Message-Id: <20260703063821.11560-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703063821.11560-1-dominik.karol.piatkowski@intel.com>
References: <20260703063821.11560-1-dominik.karol.piatkowski@intel.com>
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

