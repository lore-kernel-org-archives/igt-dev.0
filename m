Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E107C79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 18:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB51B10E1F0;
	Wed,  9 Sep 2026 18:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdFDehJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4041110E1F0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 18:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788978927; x=1820514927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VKZuRUdclHMstXsJtaTxMwfCQ15Ifm1SGIrdhdPTyFw=;
 b=PdFDehJlcjJ19nr6QqPuEs82s71iw+yuyGvuKUpCQnhOZuGKyS5IOVE5
 SapBnnUX6Xm8+r0henppi8kPa1Xqrm9frjzbPu5iyWslMi005LO5JuynI
 8tsxPUKtUWHUxNch9q/NtTL8264xy6CXCH9GdpHMxD+l7Tfqga63llfQ0
 ql/YHYgoq4cUNzB0LWgbOnbd07/rJBp2yinFTnVSEWK+I5WAIhna531OA
 CRb9eLRfUEZzGE9JL9QfCf6OeiW9AqM3Bk8FivNIvxRAAN7WqSsur7FMX
 XiT/opSj2LjjMrmSnWakCxCXeDJOgX4Alf9q5TDZECxcxMNW44PXVJSFT g==;
X-CSE-ConnectionGUID: 4RRfz50pQpOiWs/n73JFyA==
X-CSE-MsgGUID: m3FoLJWERFSUGRC5qQDU0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114960097"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114960097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 11:35:27 -0700
X-CSE-ConnectionGUID: XWXod+QRSjqTPGk5DgCMMQ==
X-CSE-MsgGUID: a+Z6grCmQDiUUQdoNaA0GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270901249"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 11:35:25 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v6 0/6] Vswing / Pre-emphasis Override decoding
Date: Wed,  9 Sep 2026 20:34:45 +0200
Message-ID: <20260909183451.2630263-1-michal.grzelak@intel.com>
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

Next version of [1]. Kernel part got merged, but v12/v13 is
available at [2] as reference. 

This series excludes LT PHY parsing. It will be re-introduced
later, when kernel will support it.

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260702182619.3973788-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/intel-gfx/20260904123148.2165596-1-michal.grzelak@intel.com/

---
Changelog:
v5->v6
- read entry's offset properly (Pranay)
- rename table of rows' description (Pranay)
- add spaces around operators
- exclude LT PHY temporarily

v4->v5
- show all Combo's columns
- change shown format of Combo's tables

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
  tools/vbt_decode: parse & dump VS/PE-O tables for Snps
  tools/vbt_decode: parse & dump VS/PE-O tables for Combo
  tools/vbt_decode: change VBT#57 Combo's layout

 lib/intel_chipset.h      |   2 +
 tools/intel_vbt_decode.c | 139 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 126 insertions(+), 15 deletions(-)

-- 
2.45.2

