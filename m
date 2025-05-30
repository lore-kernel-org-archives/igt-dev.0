Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3A0C54F30
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDAC10E21B;
	Fri, 30 May 2025 06:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXwtWmo4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C8510E78C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587262; x=1780123262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ype2nsBaXVfK9fSv69yC9HUb9Xf/pbc1zfjDck4RaLw=;
 b=bXwtWmo4mGPaTXGkXw+skA0PFviEpjFW/yuDnCwX5goljD5F8N5/fbY2
 +dWrsoGh2ehCImExkdEslDYyG72oLJjLNrdAB/YLP7/ojUC3T9c7Iq1qG
 tjxTXTYCKTdaRzHt9XgxkVTD/HjlBADW8cnttbT2WcijES4xA8r5OSkV8
 hnedXYZyOs/ZTcY5Hk9rah6hs4n9D8aXoEYxTUFHoZEupz4thQn7F2vVm
 3zyVk5elLYiTmGDi1DwcG61ED3PORegMDJwS1p4Ew8j0hqTWgbZuJGEXk
 l5R+keDBsWwRCmchfEIamIf47A26pI3GnXqcnJbf9dPhlnxz9SuN0mjvU g==;
X-CSE-ConnectionGUID: 7jjpGme5Rj+SoZeW5JIEfg==
X-CSE-MsgGUID: GgF+aDCkTU2fDROKMq3L7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38295921"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="38295921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:01 -0700
X-CSE-ConnectionGUID: h3XOZFYuT7O2go8yMSGrcA==
X-CSE-MsgGUID: LGmUkTzoSKKOlLbSQoHt1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143817603"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:00 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 00/11] Improve mem-copy/mem-set lib and tests
Date: Fri, 30 May 2025 08:40:39 +0200
Message-ID: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
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
  tests/xe_copy_basic: add mem-copy matrix type subtests
  lib/intel_blt: add mem-copy debug facility

 lib/intel_blt.c              | 267 +++++++++++++++++++++++++++++++----
 lib/intel_blt.h              |  27 +++-
 lib/intel_cmds_info.c        |   8 +-
 lib/intel_cmds_info.h        |  21 ++-
 tests/intel/xe_copy_basic.c  | 188 ++++++++++++++++++++----
 tests/intel/xe_render_copy.c |   4 +-
 tests/intel/xe_spin_batch.c  |   6 +-
 7 files changed, 442 insertions(+), 79 deletions(-)

-- 
2.43.0

