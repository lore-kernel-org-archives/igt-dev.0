Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947B9CAC583
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 06:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4708510EA1B;
	Thu, 11 Sep 2025 06:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwHfjy+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B9310EA1B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757571050; x=1789107050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8/lcFiY9MUFmD5y2mObJkEXkIv1kLwGEd0fZbrbyj38=;
 b=dwHfjy+TCpKsGya6K75Qahz+wyqjIS4QwOp+7xoqqPRV9VvW8FMxpDAn
 xQ73F78s6154vJUqdjRgphnjNOQN2YHZQ5FKkzb5FxRib4ddxGJkTPywL
 3g6n2uuDjDuq8Iwx2E1pvKSnAaIkAJIMCdJk/abFdXuHDMiw7gXIUfYLA
 5TMH/EYa9/9Z0s7g3/DHeIRDaOHMJ25nFi3yrVyE43bNmPpFO5qse/v6l
 /P0U0Eu5lnMblWxGbdKtT2k1o75tPSGV73wTakPd/X+AxFOmSa22+Lnd/
 P9PYiU6kfXV61e/hrDqJ/i0EV3m4xb1fu2frJjLVU+gm+KFTJnaA+MBtF A==;
X-CSE-ConnectionGUID: UqAP+H5MR1a1PHxzuH0LSA==
X-CSE-MsgGUID: +rtwun8LTJ6yR0VBpm0ukg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82481652"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82481652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:10:50 -0700
X-CSE-ConnectionGUID: Vau/Ph+aTDO716Ry3a4Xmg==
X-CSE-MsgGUID: FC6EcKzcTp6faSFGaXaeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="210736931"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:10:51 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATH i-g-t 0/1] [PATH v6 i-g-t 1/1] tests/intel/xe_evict_ccs: Adjust
 object size for non-resizable BAR
Date: Thu, 11 Sep 2025 06:10:41 +0000
Message-Id: <20250911061042.1855914-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum BAR size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

v5: Fixed review comment for igt warnings and commit subject. [kamil]
    Fixed the condition for user provided max size value. [kamil]
v6: Modified to adjust params only incase vram_mb <= 256MB. [kamil]

Sobin Thomas (1):
  tests/intel/xe_evict_ccs: Adjust object size for non-resizable BAR

 tests/intel/xe_evict_ccs.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.34.1

