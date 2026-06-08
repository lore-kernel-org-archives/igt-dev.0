Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F3BCD8C9F
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEFE10E348;
	Mon,  8 Jun 2026 12:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlCB5dtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D71210E257
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922571; x=1812458571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IsUi/jt3ug0fH2/cf9T0J98MPDLqncQskKvHnFiisW4=;
 b=VlCB5dtTGwhYVof7hmXOFXRs2VLXlbah/S/H2zn8RdO8pqZjWLchym46
 9ttq39wYOwS3MOcZ2S3QuzOH4XdXf/mG4a7jHFhb97a+Mr98Nwbi2Y6QC
 EvE3L6Fe4yeAr0YJqaxamyl4tvmp/qsoVwKl+2NuHH2SaGYQ+mPM/c+L3
 wrsuW/3252wtM78omb5qzHJ3xiVBZFlSEthYo+5I5YLLs9IPo+RnOcbpS
 HTtruaITgwRnMCRyDxoXx9T2CuayOtyjtynj9Az0qEQC2n7YRW1L1LKaV
 1ZjyMK/QIRi5CdvEnkUmRQw1u5XRoUMDQZ4FwZJVJbss32zxMCLzfeJwT Q==;
X-CSE-ConnectionGUID: zVV2c1rTSeqykak/8qeR3A==
X-CSE-MsgGUID: IMpPou5RSvSQjq5+rckS8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683108"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683108"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:42:50 -0700
X-CSE-ConnectionGUID: QhKs09fHT5uvKTXHsd8ALg==
X-CSE-MsgGUID: TUPbjkrUTl2ayK6s/ecW5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688413"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:42:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 0/8] Vswing / Pre-emphasis Override decoding
Date: Mon,  8 Jun 2026 14:41:13 +0200
Message-ID: <20260608124121.3131410-1-michal.grzelak@intel.com>
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

Next version of [1]. Kernel v6 is at [2].

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260507012821.527453-1-michal.grzelak@intel.com
[2] https://lore.kernel.org/intel-gfx/20260603230544.1993439-1-michal.grzelak@intel.com/

---
Changelog:
v1->v2
- check platform basing on devid not VBT signature (Jani)


Michał Grzelak (8):
  tools/vbt_decode: fix tables' offset reading
  tools/vbt_decode: rename VBT#57 related vars
  tools/vbt_decode: return 0 from get_device_id()
  tools/vbt_decode: validate DEVICE env var
  tools/vbt_decode: guess devid from VBT signature
  tools/vbt_decode: parse & dump VS/PE-O tables for LT
  tools/vbt_decode: parse & dump VS/PE-O tables for Snps
  tools/vbt_decode: parse & dump VS/PE-O tables for Combo

 lib/intel_chipset.h      |   2 +
 tools/intel_vbt_decode.c | 202 +++++++++++++++++++++++++++++++++++----
 2 files changed, 186 insertions(+), 18 deletions(-)

-- 
2.45.2

