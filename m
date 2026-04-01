Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AA6D35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7246410ECC6;
	Wed,  1 Apr 2026 11:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCw+n2Dz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9CE10ED26
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043242; x=1806579242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3/fZVdThe1v6Dwa3gtVnvGJeTvxnEyKxp6etr1jV+hE=;
 b=aCw+n2DzBvKf0rpBLNx50e0EuMKLXvHv5gUZGMGJe6qKfrY2+047rip7
 tE5CZ/Hup8kbO+VrB+6V/7B4P4YMZbA6C28vPHe35zjYGos2K4MWFa8LJ
 SiVdYg5A7j4zgMYiImBDJ4bhvpqTUObWBdlc9DJ4WmJnuESx4vxB4J2J5
 BGeNeE4U/9fFl3LKXBkqiN3fQfDrVsW8MK1QfPWwUPWniDeSqjtoB/LP0
 sbpP+vcZxQRu0NwJkK1fKzvBDVyu8Xq2lohinNb0nQC51tSfQXTpd8Bp0
 FxZSOuPEINmHbYI2qVGlsV/TYTIGXl724hWNweNH0pozJI0G18hrj8UoD Q==;
X-CSE-ConnectionGUID: NxSZcVqwT56nkD3dQfgg2Q==
X-CSE-MsgGUID: rUAvFZq3Ty2CJlR9kgEYPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76266209"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76266209"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:34:02 -0700
X-CSE-ConnectionGUID: g8WFfJRcRCadq5GWl1uLzg==
X-CSE-MsgGUID: 2duJ49AwQqq+0K1iwLMUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="264577690"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:34:01 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v6 0/4] Verify PTA entries contains expected values
Date: Wed,  1 Apr 2026 13:33:54 +0200
Message-ID: <20260401113353.2825367-6-zbigniew.kempczynski@intel.com>
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

According to spec verify PAT entries in reset / suspend scenarios.
Extending parsing to media gt was necessary as it may contain
different PTA values for main / media gts. With this series
I also observe different PAT ATS values on BMGs.

v2: use pat debugfs instead of pat_sw_config
v3: add hw/sw PAT compare subtest
v4: simplify PTA comparison subtest (Matt)
v5: unify PTA/PAT tests
v6: skip on !pf and assert in case of PAT access failure (Wang)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_pat: Support other than gt0 during parsing debugfs PAT
  lib/intel_pat: Expose getter of PAT registers
  lib/intel_pat: Set PTA + ATS PAT entries to invalid value
  tests/xe_pat: Verify PAT entries contain expected values

 lib/intel_pat.c      | 51 +++++++++++++++++++++++++--
 lib/intel_pat.h      |  3 +-
 lib/xe/xe_query.c    |  2 +-
 tests/intel/xe_pat.c | 84 +++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 135 insertions(+), 5 deletions(-)

-- 
2.43.0

