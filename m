Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E458CD342C
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A1110E231;
	Thu,  7 May 2026 01:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sigebajf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0674610E245
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117309; x=1809653309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=puRiBl31ZbvmvlOeuZQCqYP+pP/JdThrdcdk0zYSVPk=;
 b=SigebajfOl2Z0qoTYi3ZuuyXtPQoUXvS15uyz5X0gsjlo4JmGSs6zYO/
 RW3L8avcjK/DpCevlDwUQCAL9tokZ2Lg4HD3A04MnoXFHwYmIN9nm+V2i
 hq5TNwBshM9kh37+J+Q4peSKonIkVeJbQn+MwfnxkCdx2+w3GU1TrY6UZ
 5EYBgwX1jQvulDTKLJBqOE807Z9XiUnyE4plFNtjXJACKYbJ5evuRh/ja
 tcG52yx4comH1V9O/PN8gjv3d/ZCNWNyCdb92WMXC7Y3HGZavuZHQvugW
 D1MFn76uNEaMO2Lb/dRPLSl2bGTBt51ye1HgVY/2NJN7ZSaPLVpIf76Tq w==;
X-CSE-ConnectionGUID: QhVrRGOxStyZjvLUnvvN0Q==
X-CSE-MsgGUID: K/DxhRf1Qtu71Jnf4heZ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490327"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490327"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:28 -0700
X-CSE-ConnectionGUID: 1ZbCH1bMQV60GmSYlV8v1Q==
X-CSE-MsgGUID: cYpkeK9qQFSFIvVa0ZwBnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115814"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:27 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 0/7] Vswing/Preemphasis Override decoding
Date: Thu,  7 May 2026 03:28:14 +0200
Message-ID: <20260507012821.527453-1-michal.grzelak@intel.com>
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

Patch series needed to decode VS/PE-O, which v2 was introduced at [1].

[1] https://lore.kernel.org/intel-gfx/20260415234639.3577774-1-michal.grzelak@intel.com/

BR,
Michał

Michał Grzelak (7):
  tools/vbt_decode: fix tables' offset reading
  tools/vbt_decode: vary number of rows wrt VBT #57
  tools/vbt_decode: rename VBT#57 related vars
  tools/vbt_decode: nuke get_device_id()
  tools/vbt_decode: parse & dump VS/PE-O tables for LT
  tools/vbt_decode: parse & dump VS/PE-O tables for Snps
  tools/vbt_decode: parse & dump VS/PE-O tables for JSL

 tools/intel_vbt_decode.c | 165 ++++++++++++++++++++++++++++++---------
 1 file changed, 130 insertions(+), 35 deletions(-)

-- 
2.45.2

