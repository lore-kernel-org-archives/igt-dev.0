Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B84C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 13:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9649E10E26C;
	Tue,  1 Jul 2025 13:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAPTYW2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BA610E26C
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751377998; x=1782913998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3oATKgjzgizBVxahiDua468iOk5RD6J+wXh6HxtX2Bg=;
 b=bAPTYW2ZZRFZpNTQkGuXxa3IDeyZcsBMj3+To9b7FabI/7+gqrDNWLwL
 Ezwk3TUW2Gzockp3AhzAPOwi3BTQwJZvBnN8bOT0UosG98JC3NerpigxD
 yX/7Yt6tuGsVs+SAecZEVDYGhNa9gFJQnENzGz5VO1r2NF0f1a/MKjsea
 ZxRMrriL6hRs5qx29CQxcdqn8p2sWphtAu21ylTS47MNC1EcjGCIMX71F
 DYL8JqWJwOBjwteEkeiA5yCMPX+cHFZhvhLRei99OxHb7Kp8KFaOtXfQn
 HUoQLb8sfBXPRy67B/kcYFsx5S/m+GO/gUypYa8JEHgQ4qlhEdOHZwrE+ g==;
X-CSE-ConnectionGUID: QCH5TqizSMOm6hUpthCvjg==
X-CSE-MsgGUID: 6VERXBsyRQ6KjbTN26S2gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57421125"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57421125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:18 -0700
X-CSE-ConnectionGUID: u7ALbJ0jQoCuRd+CoL8pKw==
X-CSE-MsgGUID: Bc98wt//Q/iHJdm6tVBaAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154504123"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:17 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/3] tests/intel/xe_eudebug_online: Introduce pagefault stress
 tests
Date: Tue,  1 Jul 2025 13:53:04 +0000
Message-Id: <20250701135307.68147-1-jan.maslak@intel.com>
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

v2: Compute `maximum number of threads in shader` and
`maximum number of threads per thread group` values based on
hardware capabilities instead of using hardcoded values.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Jan Maslak (3):
  lib/gpu_cmds: expose num_threads_in_tg parameter for tests
  lib/gpgpu_shader: add function for computing max number of threads per
    tg
  tests/intel/xe_eudebug_online: add pagefault stress tests

 lib/gpgpu_fill.c                  |  6 +--
 lib/gpgpu_shader.c                | 80 ++++++++++++++++++++++++++++---
 lib/gpgpu_shader.h                | 10 ++++
 lib/gpu_cmds.c                    |  8 ++--
 lib/gpu_cmds.h                    |  4 +-
 lib/media_fill.c                  |  4 +-
 lib/media_spin.c                  |  4 +-
 tests/intel/xe_eudebug_online.c   | 75 ++++++++++++++++++++++++-----
 tests/intel/xe_exec_sip.c         |  2 +-
 tests/intel/xe_exec_sip_eudebug.c |  2 +-
 tests/intel/xe_exec_store.c       |  2 +-
 11 files changed, 166 insertions(+), 31 deletions(-)

-- 
2.34.1

