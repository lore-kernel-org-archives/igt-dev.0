Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1B1C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 08:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC9E10E1CD;
	Tue, 30 Jun 2026 08:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzPDr7jF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F0710EBBF
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782809592; x=1814345592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQPROxsMVdjQFtR492fkZLPvU969hQ/ASaGFXTBrreg=;
 b=OzPDr7jFsyM3jBKL7+3JiYTdQocom8OAOA0bzNKgSCOQ5QHpquPpAXCS
 +K27vlK++MpAIkSHhItGDfM/7J3GM6wACeUTjRTaenzyO5ncYSaKvITw5
 1NGwdBhV4RWrwENQo9BT1Yss1leiQzVFYNk9V/wavq9I3LE3ER7F4g4RB
 IgnMTZ9wKiJIFxPOFuilQaZwY5ne5VXxY2vubIW2l8TkpleSsIKQWFNV4
 nTkUJoCNAyTvP769cZpIH3BtYCHULOm3v3Nrgcg6SnUpEtu/NT1Bx9lZS
 IJ+zzo2p+CyOeO3IU5JMGtP+qBaLa5tDMrBWM4EsLhGpa+q0eknvHa9fR A==;
X-CSE-ConnectionGUID: mXVisS6jQa66l+ifbRNK3Q==
X-CSE-MsgGUID: 2akaZ07MSZ+RX0jLM6pMuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106310034"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106310034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 01:53:11 -0700
X-CSE-ConnectionGUID: FeVXOZDpRuiFgQhmNfX7Vg==
X-CSE-MsgGUID: bb6vJIwHQvWjdqDhFr3i5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="248841179"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.245.134])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 01:53:10 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 5/5] tests/meson: Remove Xe EUdebug
Date: Tue, 30 Jun 2026 10:52:51 +0200
Message-Id: <20260630085251.32120-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630085251.32120-1-dominik.karol.piatkowski@intel.com>
References: <20260630085251.32120-1-dominik.karol.piatkowski@intel.com>
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

