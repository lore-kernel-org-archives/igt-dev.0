Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337D3CD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB29F10E231;
	Thu,  7 May 2026 01:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xtl+W0Wm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34710E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117311; x=1809653311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WlH5fDrkzUhj+quQN6lsAOVSJb4+uRq5uwE5oiApyQc=;
 b=Xtl+W0WmF3jW9yJDfrgW4dOLAUByi+0YbipehftK3+l8Olvv9f5a0KfO
 ic4JPTtuuSaPFB8u6qcB+wneg79Hp8pAONk98pZa3r84o4J5nB1HqeoM3
 QbPPonnMViCbQ5bRRmOXz+aeasKZGF5JVt94Xnc1E2bwemlcQ3BI+uVfm
 DvKuKNFkGYaBytlnMRJvWTD5HRDWQIyByAYsmbWg7Y+omgHFOVPiD2ObV
 q9zTbRMsqjqQYU7Smu9mJEPc21DFXjVpAO44bzjw1X2SB4i6UFU0iyCdT
 I7DC3PUhEjPG4obF7zJm/orY6aDKpRdQd+XOEvyjg0tFQPQsQ6uD8aXm7 w==;
X-CSE-ConnectionGUID: nKi1ZwMxR2iGw99JaGaDLQ==
X-CSE-MsgGUID: uTmbXfWMSYyqZLyJ3J1ICA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490330"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490330"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:30 -0700
X-CSE-ConnectionGUID: rkP+1kl1Sm+V6o3DE9aM2Q==
X-CSE-MsgGUID: p792p4xxTgatnU7Q29WDpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115828"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:29 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 2/7] tools/vbt_decode: vary number of rows wrt VBT #57
Date: Thu,  7 May 2026 03:28:16 +0200
Message-ID: <20260507012821.527453-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507012821.527453-1-michal.grzelak@intel.com>
References: <20260507012821.527453-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Current implementation assumes that each VBT #57 table contains 10
rows. That is true for pre-MTL platforms. However, GOP for MTL+ actually
contains 16 rows. Show the number of rows during dumping.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 1d6bbc88a4..74ac958f71 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3450,7 +3450,7 @@ static void dump_compression_parameters(struct context *context,
 	}
 }
 
-static const char * const vswing_preemph[10] = {
+static const char * const vswing_preemph[16] = {
 	"V0-P0",
 	"V0-P1",
 	"V0-P2",
@@ -3461,6 +3461,12 @@ static const char * const vswing_preemph[10] = {
 	"V2-P0",
 	"V2-P1",
 	"V3-P0",
+	"N/A  ",
+	"N/A  ",
+	"N/A  ",
+	"N/A  ",
+	"N/A  ",
+	"N/A  ",
 };
 
 static void dump_vswing_preemphasis(struct context *context,
-- 
2.45.2

