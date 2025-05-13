Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BCCC3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E4410E5CD;
	Tue, 13 May 2025 18:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAYCWmzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0F210E5CD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162697; x=1778698697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x9vOJRDznBzCdcEsLNaI8YAKJx2PJCKauXxqtMgRTtI=;
 b=ZAYCWmzlIuT56i9nuX1wDB5+Te7NpzRPiStkidW1buBqQeCe9c/DWgdV
 CEcOFNfRiXNjPLldNl57Cjv2rtbxFbxYH8Cf693VYtKM/JMS6dq+nBQJ3
 fNe8z/OLya3bxBkW+DR4FJuyJ9CFGVDHmvm8rCX7QCNiUXddUhCqYNSix
 ZSKy4ij0N/uYZUkEXJvMYqfHL1N0R/Wqd95mABz7B0KiQGQa5lCTH/X4M
 utIJPtee9hjat/RRLv439N49P9YIVDppvFEJSV4jqdSPgdDOBY6+6h13f
 5Tk4I0sUUv/G67W94ZNy5AaDDuAJQ/MZGG3V5eUDEcSdODrJrDcoPdpSn Q==;
X-CSE-ConnectionGUID: z/qG4eC6TgST0XK0ztAfJQ==
X-CSE-MsgGUID: S1lLdkRgTx6gAepYMAX+qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960571"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960571"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:17 -0700
X-CSE-ConnectionGUID: OfUWYpKmQ9CMa+jE2Lf36A==
X-CSE-MsgGUID: 7nc6fcbzTeGRC1tbIQVLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679093"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:15 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 00/15] Improve mem-copy/mem-set lib and tests
Date: Tue, 13 May 2025 20:57:55 +0200
Message-ID: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
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

There were missing page and matrix tests in mem-copy. Apart of
that batch emission code allowed to set invalid bits in the command.
Fix all of these.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Zbigniew Kempczyński (15):
  lib/xe_spin: limit width/pitch for mem-copy
  tests/xe_render_copy: change width and pitch to be in valid range
  tests/xe_spin_batch: change width and pitch to be in valid range
  tests/xe_copy_basic: use non-zero pitch
  lib/intel_cmds_info: rename M to TYPE in blt_memop_type
  lib/intel_blt: separate mem-copy and mem-set
  lib/intel_cmds_info: add blt_memop_mode (byte/page)
  lib/intel_blt: add emit batchbuffer end
  lib/intel_blt: use struct instead of inline coding
  tests/xe_copy_basic: replace size to rect which keeps objects geometry
  tests/xe_copy_basic: add testcase with large buffer size
  tests/xe_copy_basic: add subtest to verify mem-copy in pages
  lib/intel_blt: add support for matrix mem-copy
  tests/xe_copy_basic: add mem-copy matrix subtests
  lib/intel_blt: add mem-copy debug facility

 lib/intel_blt.c              | 267 +++++++++++++++++++++++++++++++----
 lib/intel_blt.h              |  27 +++-
 lib/intel_cmds_info.c        |   8 +-
 lib/intel_cmds_info.h        |   9 +-
 lib/xe/xe_spin.c             |  35 ++++-
 tests/intel/xe_copy_basic.c  | 193 ++++++++++++++++++++-----
 tests/intel/xe_render_copy.c |  10 +-
 tests/intel/xe_spin_batch.c  |  12 +-
 8 files changed, 471 insertions(+), 90 deletions(-)

-- 
2.43.0

