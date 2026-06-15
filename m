Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642FDCD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384310E30B;
	Mon, 15 Jun 2026 09:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLy77nH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD87110E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515903; x=1813051903;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HR5VOOGH2fZMbSWB8tMp8bIeJF79rAVY6rjVuADjY7Y=;
 b=BLy77nH+a8QQ9Qp0jvlgbv1GTbTS37PzHxE3hPB2TYIXF3HZWi2aGpcS
 CA+klEFc4XHw/i9l09ZRcJpb2G2QT2obRO4zyIlxsuRG3VUzX9v5wA68r
 iqGtZS2e2LY7/gUe3sTNE/DYxScyyIheImO5E6xrfnsESd3JxXfXnQg6U
 rcFHtoltqj6AsizrhlA2LZ3n/BBO4ncw5Rt1XduF94ZVDBk65GazadNx7
 w2mBr2bqQjdxcGp3efXqW6seP1Bzxjdw6S1m2xOM4x49s9CNJTw2ZHBvt
 oXRdSL0KOZWl3uGuSBsGycKA03KlgYNtb19iYdA3W6VbhCEkM4lRG9Y3+ g==;
X-CSE-ConnectionGUID: togtcJuRR0ezXFB7jCe+jw==
X-CSE-MsgGUID: yAPMh3imQSmPYgIVQyc7eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82235876"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82235876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:31:42 -0700
X-CSE-ConnectionGUID: PWhMgS4tQh+7wGkc+tRqhA==
X-CSE-MsgGUID: 5uwSwewtSgOD6wClo/ICzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247465268"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 02:31:42 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 00/10] Vswing / Pre-emphasis Override decoding
Date: Mon, 15 Jun 2026 11:31:27 +0200
Message-ID: <20260615093137.681050-1-michal.grzelak@intel.com>
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

Next version of [1]. v7 of kernel part is at [2].

This patchset includes Jani's series [3] for guessing devid from VBT
signature.

[1] https://lore.kernel.org/igt-dev/20260608124121.3131410-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/intel-gfx/20260608192821.3414590-1-michal.grzelak@intel.com/
[3] https://lore.kernel.org/igt-dev/cover.1781261899.git.jani.nikula@intel.com/

BR,
Michał

---
Changelog:
v2->v3
- show whole invalid DEVICE env var (Jani)
- return 16 rows on MTL instead of 10
- use Cx0 for Snps

v1->v2
- check platform basing on devid not VBT signature (Jani)

Jani Nikula (3):
  tools/intel_vbt_decode: store codename from VBT signature to context
  lib/intel_device_info: add a helper to guess the PCI ID for a codename
  tools/intel_vbt_decode: fall back to guessing PCI ID from VBT
    signature

Michał Grzelak (7):
  tools/vbt_decode: fix tables' offset reading
  tools/vbt_decode: rename VBT#57 related vars
  tools/vbt_decode: return 0 from get_device_id()
  tools/vbt_decode: validate DEVICE env var
  tools/vbt_decode: parse & dump VS/PE-O tables for LT
  tools/vbt_decode: parse & dump VS/PE-O tables for Snps
  tools/vbt_decode: parse & dump VS/PE-O tables for Combo

 lib/intel_chipset.h      |   3 +
 lib/intel_device_info.c  |  75 +++++++++++++++
 tools/intel_vbt_decode.c | 198 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 250 insertions(+), 26 deletions(-)

-- 
2.45.2

