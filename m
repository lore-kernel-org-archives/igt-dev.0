Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DECD767F2
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 17:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A099910E16B;
	Thu, 31 Oct 2024 17:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tb/PS1jW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0190010E16B
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730396001; x=1761932001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0P6c6HYfQsi85HfNu0fWKo7xKVoWzoEbLuxPMW/X0yA=;
 b=Tb/PS1jWmxEBIHCBqdSDDAE79dWUZEXhJDrNYfmtK3CgZEJ3+CEAJKY+
 q9JATBaBrxxboIbn6wlwo4vzEBcghjTQ1GMpIHb62g4c6JWin/xMBdWxD
 Mlzu+Q32mhScErlKPFYUbuiGybfdqU0o4tA/fsAkkwbNu1V5zqcdiANXs
 t6saZdctMIAyDJWWS09kIotsBpzhOH5vfIeh8x7FTBKalCsFLDI1vZL5P
 cjzpbfsHiz7t+W0y6fXMkx4ls6FCiOfzXV0UnzMLXjgslfnMmlTIaWH3W
 Z6snG4Ph3FTWKwNml3T79kwpf11OHEDt1oCOoo6TlzpZg4JmfYebl4Wso g==;
X-CSE-ConnectionGUID: xeuw7rIkSLeHU4PKCFRTwg==
X-CSE-MsgGUID: nOXQO3k/R5m7dm9m442Hjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17789932"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="17789932"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:33:20 -0700
X-CSE-ConnectionGUID: YjGKSnT9QfWDgNoewYAF1A==
X-CSE-MsgGUID: ZhpTdOdLTga3wg1XuR3L3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87476096"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:33:18 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v4 0/2] rename drm_fdinfo into i915_fdinfo
Date: Thu, 31 Oct 2024 18:32:52 +0100
Message-ID: <20241031173306.73864-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

This test opens i915 drm card and will not work for other drivers.
Hence rename it to avoid confusion.

See also discussion at
https://patchwork.freedesktop.org/series/139451/
i915/drm_fdinfo: Quiesce GPU prior to running some tests

v2: corrected Tvrtko e-mail and corrected xe.blocklist
v3: squashed patch 2 into 1, resulting in removing drm_fdinfo
  from xe.blocklist, added r-b (Lucas)
v4: corrected dependency for lib in meson.build (Kamil)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Kamil Konieczny (2):
  tests/intel: rename drm_fdinfo into i915_fdinfo
  HAX/DO_NOT_MERGE: test drm/i915_fdinfo

 tests/intel-ci/fast-feedback.testlist |   56 ++
 tests/intel-ci/xe.blocklist.txt       |    1 -
 tests/intel/i915_fdinfo.c             | 1146 +++++++++++++++++++++++++
 tests/meson.build                     |   12 +-
 4 files changed, 1209 insertions(+), 6 deletions(-)
 create mode 100644 tests/intel/i915_fdinfo.c

-- 
2.47.0

