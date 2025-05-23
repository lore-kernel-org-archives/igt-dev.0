Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F2C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 08:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B3A10E7A7;
	Fri, 23 May 2025 08:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNMbhq0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148310E7A7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 08:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747987293; x=1779523293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=773rcIfvveAUz+oGjd8mIcIZj3jRN1Mo8PrgetjAxXE=;
 b=BNMbhq0TOCcXsBIWSsZwiJI6FNoSMVjqulMhAXsEylKkYybJgQm5bBML
 JmFOBS0EZB6SRu7dH/e6WrjEEGg6z1STAEceWXW9wctwbecfPr0iNphkG
 DgkovlUBSw+FEeoIqeAOlV+q7l5N12PV+XG3dcuOgqkVhEvw2aCxLgDhv
 ELBigPlp6h4e34udhSvOXMj+0FjKTmCizilO1TQreOlpLcd6c8q9cJjHF
 Vi8RpGQPcAkQTH45AZoe3PL6dtgwHUpOw1Yj138GtGxqrhf5zN1jqK14H
 e/a69ZyPyMrfIg+wnLnSrdcQyceURDpS+heqUHI0dtMa12mqGnm68Yo8t g==;
X-CSE-ConnectionGUID: MaArYYZzQI+7UvJRhPTUIw==
X-CSE-MsgGUID: C6cZwfY9QjK+TLHnUF5riA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50091193"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50091193"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:01:32 -0700
X-CSE-ConnectionGUID: r6LtqES4SCyJDajI0PS4/Q==
X-CSE-MsgGUID: f2uCX2IsTXG5DK+3AwN1Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="146269631"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:01:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 00/11] Improve mem-copy/mem-set lib and tests
Date: Fri, 23 May 2025 10:01:15 +0200
Message-ID: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
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

Zbigniew Kempczyński (11):
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
 lib/intel_cmds_info.h        |  21 ++-
 tests/intel/xe_copy_basic.c  | 191 +++++++++++++++++++++----
 tests/intel/xe_render_copy.c |   4 +-
 tests/intel/xe_spin_batch.c  |   6 +-
 7 files changed, 445 insertions(+), 79 deletions(-)

-- 
2.43.0

