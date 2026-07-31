Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A167C54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 14:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC3E10F291;
	Fri, 31 Jul 2026 14:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhW2RzHu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE4E10E20D
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785507512; x=1817043512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+R3B+KGNslh/QXVZbT0TuX9TsHl2Xl/jpaG84QT9Qd0=;
 b=dhW2RzHu2Wusq1J0nj/DBzbmOxA+P666FyD++Qfm6VChkbXBF22PhLJo
 x2fs+E5rYln8pKDzgBuXN94VuBbOOblV1qD9wMd/8p/3cFqXtkW3PbjUm
 lRvNVMp33IlbY5q3B0b11TQRKApNXesNXHx6XW6ARVUejkeueLu8FBKf2
 OZWwpRbFSxeD0iTsvp6OCllfQ7RdWb1ssGpocOVp/zTxt2RWLdmUT0JKH
 6Outeo/FsX8n3iPrBbV/4yBgGBSOhAl8KCeHC6OwLG7Z9y5/v5+rNuIVR
 Z0QnLsdo35aKFrS+OBZZqVAZBTBVfC70L/muGcqo47S9lYG6MbNTmk8z6 A==;
X-CSE-ConnectionGUID: oUg0LmvJTbWq5M1PxhH+Nw==
X-CSE-MsgGUID: ByS9VGDpTIuvyjYhf/n+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89945052"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="89945052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:32 -0700
X-CSE-ConnectionGUID: IfH74qKaT8ObLaLCt9coIw==
X-CSE-MsgGUID: hHLc3uz2RmS5kU3FRSnHfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="254283824"
Received: from unknown (HELO localhost) ([10.94.249.102])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:31 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com, zbigniew.kempczynski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/3] benchmarks/gem_wsim: fix ticks_delta assertion for
 non-inverted logic
Date: Fri, 31 Jul 2026 16:18:05 +0200
Message-ID: <20260731141806.890207-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
References: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
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

xe_spin now stores elapsed ticks directly in ticks_delta (not inverted).
Update the post-execution assertion accordingly.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 benchmarks/gem_wsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 8be44d0c8..462188708 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2676,7 +2676,7 @@ static void xe_w_step_sync_and_verify(struct w_step *w)
 
 	if (!w->duration.unbound) {
 		igt_assert(w->duration.requested_ticks && w->xe.data->spin.ticks_delta);
-		igt_assert_lte(w->duration.requested_ticks, ~w->xe.data->spin.ticks_delta);
+		igt_assert_lte(w->duration.requested_ticks, w->xe.data->spin.ticks_delta);
 	}
 }
 
-- 
2.43.0

