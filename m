Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A025D2ECF9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790F10E235;
	Tue, 20 Jan 2026 04:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISSjffaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9E810E2B8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768884894; x=1800420894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SOdtnpOmtYEIg1hhs5mlRt5achELsnisfcka06dxV0c=;
 b=ISSjffaMQauVLOjmSoiE6gCUQGj9S2eP5HY6jtuT+1HerySWhVVahmtW
 S/POAEscuZVqvvEyCmBlKqxxZEWomvJ/3hdkF3feC6gODfHH+08QrzGq2
 kAsUrpxLJ6mJ3Ry4cCueHNuZ143teSLdvPMLWA1hrfvNSd+s4o8k3HjkW
 ty7UK2neK6Damj1+XJiWlpV4m/04paBpjR2YMSje07B3RSrXCqle8ou9c
 GTA8uyhVDDWVSpH6BxlgL4nfPrn8vkJHlczTiwm0uDtRpYL00Nu0H3h+u
 /2FffgbWeP/RUaoePD2hq5O6vQkEd1TFYTL2gA4blrT7YmddD/4CyB8vc g==;
X-CSE-ConnectionGUID: 3jIOnBfzR7qE+p9GnR7Dkg==
X-CSE-MsgGUID: FB130HbsTBGb29V0v3wqrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70057624"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="70057624"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:54:53 -0800
X-CSE-ConnectionGUID: V6DCR/E4TdiwDsXE4PU61w==
X-CSE-MsgGUID: joQs1+BLThqfdMbrkW0wIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="205816995"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:54:52 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, juha-pekka.heikkila@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/3] Improve pixel-format tests
Date: Tue, 20 Jan 2026 10:25:42 +0530
Message-ID: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Refines modifier-based pixel‑format testing and reduces unnecessary
work during simulation runs.

v2: Address review comments And fix false positive tests.

Naladala Ramanaidu (3):
  tests/kms_plane: Split pixel‑format validation into modifier specific
  tests/kms_plane: Speed up simulation by limiting YUV range tests
  tests/kms_plane: skip cursor clamping to avoid false positives

 tests/kms_plane.c | 104 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 17 deletions(-)

-- 
2.43.0

