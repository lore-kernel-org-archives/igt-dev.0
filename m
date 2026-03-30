Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F8FFF4947
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 05:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E358110E193;
	Mon, 30 Mar 2026 05:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RK5weqHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6D810E193
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774849557; x=1806385557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gSBWbMCc5Zu64fi5xzJW9C4YXXjVa7sA5i5uIypUxBo=;
 b=RK5weqHXxiIKkUVaArhMyDSyp+LPjqiuQRB5DrSgzeMeQskzvFcMgYv5
 HCv7u1QmoB4XfelnFKq8j2+9J6uNjXlOVzRAOjjEeNYgd5QlXQza1o75t
 3s1Sh6FQ1rEOfgJ9zEKP9KTZmoeAUqZ0SL96Kr7Vm4lt49oAp1VPEe/Sr
 B/8xClHNf0pybq0izBiuRbhTXMO0G2SuWR6ZlC9cRX8GXZIIG2zaBu9Ym
 SLxzFNsE9lk5YIB76CNVRJ/wh5egg9SQ3gdgnT0N0kxyMHTd/iLCTP3i0
 8HYTBVaIS5Nacg2sJAUqpSiEEOQblj9YKzFnUCoOuNTlIHKYl62VGP3pI g==;
X-CSE-ConnectionGUID: Z4WG+TV4SJ2vUp2ZSCvmkg==
X-CSE-MsgGUID: UOV6i+1bShmm831QAhDK/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75728598"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75728598"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2026 22:45:57 -0700
X-CSE-ConnectionGUID: VcKMZYnLTSi6JZJPfRJ7nw==
X-CSE-MsgGUID: bkO4IHeRQ5uDWU7U/Hzv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227569608"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2026 22:45:56 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v3 0/4] Verify PTA entries contains expected values
Date: Mon, 30 Mar 2026 07:45:52 +0200
Message-ID: <20260330054551.1729437-6-zbigniew.kempczynski@intel.com>
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

According to spec verify PTA entries in reset / suspend scenarios.
Extending parsing to media gt was necessary as it may contain
different PTA values for main / media gts.

v2: use pat debugfs instead of pat_sw_config
v3: add hw/sw PAT compare subtest

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_pat: Support other than gt0 during parsing debugfs PAT
  lib/intel_pat: Expose getter of PAT registers
  tests/xe_pat: Verify PTA PAT entries contain expected values
  tests/xe_pat: Add PAT registers contain expected config

 lib/intel_pat.c      |  49 +++++++++++++-
 lib/intel_pat.h      |   3 +-
 lib/xe/xe_query.c    |   2 +-
 tests/intel/xe_pat.c | 154 ++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 203 insertions(+), 5 deletions(-)

-- 
2.43.0

