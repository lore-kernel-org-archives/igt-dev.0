Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87321CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 11:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619710E03F;
	Mon, 18 Aug 2025 11:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4kAjO1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6D310E03F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755517281; x=1787053281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bNVCpgBdU89PxS05PvzX7TSQxEbihHbyCZldMmW7sHg=;
 b=T4kAjO1oSk0Z7DMD79XdIz20fZHcqWVUUPSiyAfJhR/4/1t7S5mIvjp9
 EmfrQvza+TMdumZ4niEZuRh5i03UsvDUQtA8HFxgDIW1FNX06Z30kGwr3
 CEyQo2KeEHc6BGkm3vxqJomQ24PIjL0hNb6c1FHdydy9SVHA2mF1L1zld
 ujClAU2sgxE3CDr4sjQsFRCIr9stElBeQl/XiNg9lQm6sZ9ax+vYp4Cp6
 gEmSSIUPAxGui/GN1qK9pvb/N0Lny3mOacTlHphFif9hqhzUiNCas72fh
 vsuaaSAMgHuRqjKC9oK/ujdNMkLvx/YJOOTkGwIUF/fm53qEeboEqPud1 Q==;
X-CSE-ConnectionGUID: XcBrZVDdSTe99EYkeCiplg==
X-CSE-MsgGUID: yeBItLHnS6mvKDwTXR5quQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="80318233"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="80318233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 04:41:03 -0700
X-CSE-ConnectionGUID: XxH3Ci5sS5224YnOpo9jtA==
X-CSE-MsgGUID: Fqs7+fVVSQ2vA06JLbobJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166786081"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 18 Aug 2025 04:41:02 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 0/1] tests/kms_cursor_legacy: don't inhibit pipe CRC
 calculation
Date: Mon, 18 Aug 2025 13:42:06 +0200
Message-ID: <20250818114207.2251823-1-michal.grzelak@intel.com>
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

Next version of v2 [1].

[1] https://lore.kernel.org/igt-dev/20250722124823.912472-1-michal.grzelak@intel.com

Best regards,
Michał

---
Changelog:
v1->v2
- reorder igt_pipe_crc_stop before the clean-up (Swati)
- describe in commit message stopping CRC calculation 

v2->v3
- add Closes: and Reviewed-by: tags (Swati)

Michał Grzelak (1):
  tests/kms_cursor_legacy: don't inhibit pipe CRC calculation

 tests/kms_cursor_legacy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.45.2

