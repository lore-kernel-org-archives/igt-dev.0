Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DD5CD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 11:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A1810EA32;
	Tue, 16 Jun 2026 11:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyUCSSYM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF4C10E6E2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 11:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781608326; x=1813144326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KQr/Ah+GdB33MsPziq5Mn3fK4JNsgS7P0Vp+csoPScA=;
 b=YyUCSSYMCsl0XtzEwUKP+p786p4nRVs7JG/tm4G95XnM/iCLH1XCM8ht
 YpFUT3FsIzTL0d/PyZeEsMD4SM9wmDT7FGV/YuNEPW8KgMikF03Eu0/j4
 5+S0Jfm2VIPhf2TAHDrpZTabAUDNC6Eip6PCGFlneZZl0lgmQOCOgGup2
 e7QuSeGdVF0k232UuJe1GG2wXpV6FChYBbyXGKCWMzahGPWRMS88QoM0J
 lZqzbycuIjJK5gefo52FWFIlfmHgs5FXcA4PnHLLJ/JE5uPLJLitL2Tfh
 Mv2UmIQvTWsTCXS7LvH8B6MMFvfp+2G9fqq6ukiSBX27sHXW8kN6SYrKQ g==;
X-CSE-ConnectionGUID: 7vPB83uySs25JFKTgYUOBQ==
X-CSE-MsgGUID: etQ7WmzFTSiFfIYCN0c5sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82381956"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82381956"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 04:12:06 -0700
X-CSE-ConnectionGUID: jMeC0XDgRui3v5bkUMp1Iw==
X-CSE-MsgGUID: RqFsYJtvRb2f352idXpM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252714021"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 04:12:04 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 0/6] Vswing / Pre-emphasis Override decoding
Date: Tue, 16 Jun 2026 13:11:56 +0200
Message-ID: <20260616111202.1254067-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
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

Next version of [1]. v8 of kernel part is at [2].

[1] https://lore.kernel.org/igt-dev/20260615093137.681050-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/intel-gfx/20260615181207.1033389-1-michal.grzelak@intel.com/

BR,
Michał

---
Changelog:
v3->v4
- rebase onto master

v2->v3
- show whole invalid DEVICE env var (Jani)
- return 16 rows on MTL instead of 10
- use Cx0 for Snps

v1->v2
- check platform basing on devid not VBT signature (Jani)


Michał Grzelak (6):
  tools/vbt_decode: fix tables' offset reading
  tools/vbt_decode: rename VBT#57 related vars
  tools/vbt_decode: validate DEVICE env var
  tools/vbt_decode: parse & dump VS/PE-O tables for LT
  tools/vbt_decode: parse & dump VS/PE-O tables for Snps
  tools/vbt_decode: parse & dump VS/PE-O tables for Combo

 lib/intel_chipset.h      |   2 +
 tools/intel_vbt_decode.c | 163 +++++++++++++++++++++++++++++++++++----
 2 files changed, 150 insertions(+), 15 deletions(-)

-- 
2.45.2

