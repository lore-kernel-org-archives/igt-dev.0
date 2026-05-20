Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA0ECD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3B810E10C;
	Wed, 20 May 2026 09:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOHbL3NX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD40510E10C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779267639; x=1810803639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pXlg67w4n4L0KKqs4+1mV0fk9X2h2+WiUFsp4k1GW2A=;
 b=aOHbL3NXBvhIvNoKndlbx0yt6BDrtVe1MMe514B5rhy+sFo2kZ4FW+CJ
 s8oo24h03P/zFNk/k2nHiKglRQ0+bYIGaU+w3+/fV/kGc5Y4rtd4Qz/kP
 nfaf1LOxLAxrtNbo9PlRdo149VLWfwRXGHhLdignxmZEn6TCusg5csrfr
 +q+x1WJgos23MmqPzVF18UQ6LSXh7mDIFs8CdbgOpSU5kkl1L40RSejnQ
 4UV0hUXE5kNqFUGozTkJLRl2mR3wr8llOJ5UaJL10aUPt3mdcBQOG8Bzq
 XPGOyn3mVn0ssxyCWI/nUai2Kp7HpzwiNcxWQeOHFRNQlgamhsKink+Pp g==;
X-CSE-ConnectionGUID: wtL8odrFRgerIgC3nYELrw==
X-CSE-MsgGUID: ZMmgWBaSR12NMR5cPvK7eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90856616"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="90856616"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:00:39 -0700
X-CSE-ConnectionGUID: jtV8L9tuQbeF++iduAFGhw==
X-CSE-MsgGUID: OArUpmp6SmSJLKC5DTtYYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="240346299"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:00:38 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Update pre-Xe large-buffer compute support
Date: Wed, 20 May 2026 11:00:35 +0200
Message-ID: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
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

Introduced large-buffer and SVM tests causes failures on pre-Xe
platforms. Update compute library to fix this behavior plus alter tests
to skip SVM tests when vm doesn't support fault mode.

Cc: Francois Dugast <francois.dugast@intel.com>

Zbigniew Kempczyński (2):
  tests/xe_compute: Skip SVM tests on platforms without fault mode vm
  lib/intel_compute: Improve executing large-buffer compute on pre-Xe

 lib/intel_compute.c            | 74 +++++++++++++++++++++-------------
 lib/intel_compute_krn_square.h | 36 ++++++-----------
 tests/intel/xe_compute.c       | 17 +++++---
 3 files changed, 71 insertions(+), 56 deletions(-)

-- 
2.43.0

