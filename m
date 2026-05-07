Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E7CD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 05:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B745310E167;
	Thu,  7 May 2026 05:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1T4ENWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E6910E167
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 05:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778132111; x=1809668111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R/v8Qb1oQ7hr5RyaG2I2sLGppGjFVqMLZwLQzqBKaSg=;
 b=d1T4ENWhlNTpkoRO65vT5EveIrO/zvYaXkmmbBY1UXlewoXPlS4LOdao
 tv+K/1t4w33xVUnGrc3CqKqX1uLybNPh/TAW5oDzxGlsF2BF1iY5p4BEh
 Naq4aJSOgKTx2pK78UqNNSiqDxTh4qZ7mGH4bQsh3wlQ76YXe0IAv7aBe
 dbPcoxucWmKpbwUKlS/G0XpzQ/TBkOOWNFwCc9JANLZlDEJGcyX0MunAw
 rDtS/mdLNqy6u+Oaq907qwm5Np49NfEWmGwRK1JCFoF2p8lK6Vd5BthP0
 C6VXpoqFd8GRz/Mr8r1MkcAJ4F06xPOxRQHeq5EBBqrfw5MiOchm2zfIb A==;
X-CSE-ConnectionGUID: c0RGCK/tQsSBIb1Dcr5P1Q==
X-CSE-MsgGUID: HvxTNUCiR7SeVw881co73w==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82916163"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="82916163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:35:10 -0700
X-CSE-ConnectionGUID: rJi8IpZmRuSxYwrznI4iXA==
X-CSE-MsgGUID: jMN7l3LMSFm60fem+P6zDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="236621246"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:35:08 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v6 0/2] Wa_14026633728
Date: Thu,  7 May 2026 11:04:57 +0530
Message-ID: <20260507053459.766300-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

This series introduces Wa_14026633728. For it's introduction, changes
are made in lib/intel_wa to ensure we check from debugfs whether a
workaround is enabled via the KMD or not.

v1: Add workaround patch.
v2: Fix commit title, description and code description.
v3: Check if the wa exists and reuse it, also, fix a warning for C90
rule.
v4: Introduce changes in lib/intel_wa to ensure we are properly checking
the debugfs file for the workaround.
v5: Roll back to original design for increasing oa_exponent to keep it
simple.

Shekhar Chauhan (2):
  lib/intel_wa: Check for device workarounds
  tests/intel/xe_oa: Wa_14026633728

 lib/intel_wa.c      | 40 ++++++++++++++++++++++++++--------------
 tests/intel/xe_oa.c | 18 ++++++++++++++++++
 2 files changed, 44 insertions(+), 14 deletions(-)

-- 
2.53.0

