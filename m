Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D1CC3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 10:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217DC10E8E1;
	Thu, 10 Apr 2025 10:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDmVK8Pc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0148510E8E1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744279545; x=1775815545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/cEeRGAuT5SVyuUFecLyib+1yDWqG2Q2VWp/vzqHe3E=;
 b=LDmVK8PcwWKKsYRLFGiPOpoMrfMXydpQ35BDaVHRN86YosrapsWUzOKZ
 Wl/Pw1qLrbTUDC6+9dGCFOEDiLj/CNWmVDL1P5ja4T02fdY0/ewtabqTd
 OIHXL1n5lAU9IE9om6Id1iwLrAQZ0i/doWSPlDEQkD6hkTXNXomDDH0Nd
 3QV0wh+qPliSR44GIFopmtP+xyddjxS+IiZztCLSP+W45jpkqx7AM/9j5
 2TMcNfqCPfi3bcqDFVJGzhAdueGfcogNJZUQWKPvoXIofd7Jo+lmsa5zd
 t6LhO2dNGAj4vS0/65i+Abr8jlWTcoqNysyWOqP4h/7OYPsq2/cnpZwKL w==;
X-CSE-ConnectionGUID: PxxgoTtrREKk7kMyX8Avbg==
X-CSE-MsgGUID: CnQWqu7VSfKIPxCvrBXy2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="55967324"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="55967324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 03:05:43 -0700
X-CSE-ConnectionGUID: yDWwc3ZOR3aY/bsOkRVvSQ==
X-CSE-MsgGUID: /B0tP0KjTpySBjnNQvlT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133835623"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 03:05:42 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/1] Runner: sync files and dirs after execution
Date: Thu, 10 Apr 2025 12:05:36 +0200
Message-ID: <20250410100537.61489-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

In runs with crashes or reboots some dmesg files collected by
igt_runner are truncated. They are saved in folders NNN/ where NNN
is a number of a test in testlist, started with 0.

If such crash happens then after a reboot one could run igt_result
to recreate valid result.json file. It turns out that few last tests
before one that caused actual crash are marked as incompletes, as
their NNN/dmesg.txt files are cut.

Try to remediate this and make additional file and dir sync to disk
just after a test was run. This should help us unless there is a
bug in kernel filesystem code.

For reference these problems could be seen in:

https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8281/shard-dg2-10/igt@gem_ctx_shared@q-smoketest@ccs0.html

https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

v2: added 'static' and applied r-b

Kamil Konieczny (1):
  runner/executor: sync outputs after tests end

 runner/executor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

-- 
2.49.0
