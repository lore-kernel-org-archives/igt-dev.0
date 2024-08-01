Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FC0C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A350910E14B;
	Thu,  1 Aug 2024 15:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrsGPqoF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEC510E14B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722524899; x=1754060899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OXuQ+uUOXEYPyZFiGAYbBpZZdFzOCWTQsz2jJTVgPmw=;
 b=RrsGPqoFqB8DLZt+ddfCPJba9/MktFShKCzcaIlJvix4iqdcs99B74of
 LXCL6BFCRRBvNuMWmWg5a2/qGHJP202Et8OWg6Of0IOIeTw3/0KB9G4rA
 0PbSRTk8hr5sXuoAJfLRI3gIGa60sbf8HDlpKR+iIJgUQ5MWWf8QErdWL
 8E780A+N602Oy12fht0oOUOyHzVZCNlK3wkqH2FS7doRlRKU0Gm71tJBo
 1uSPMEOx/bxa9/wCO9JTmn3wXyv95be9N9ShNg5zI5ZB/MQYT0oARkQuT
 rhcVrfyT3eYmG7GHmHgslLHXFXNG4VIO9DfQUmEfxKmMha5PER31GKlGY w==;
X-CSE-ConnectionGUID: a7MgiQzMSPKwlzoxZQmKlg==
X-CSE-MsgGUID: A8xelbM3Th6qIXfpzanDHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31135506"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31135506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:07:18 -0700
X-CSE-ConnectionGUID: mUu/s8QKQ6uauWCrQZnk+g==
X-CSE-MsgGUID: q6byueNnTSO5px0kBB2zxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59712512"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2024 08:07:16 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t,
 v5 0/2] tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt
 test in xe
Date: Thu,  1 Aug 2024 20:37:35 +0530
Message-Id: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Changing variable initialisation type, sorting igt headers,adding spaces
according to comments in v3

Adding test in fast_feedback to check it xe BAT in CI

Nakshtra Goyal (2):
  tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe
  HAX/DO_NOT_MERGE: xe-fast-feedback: test  xe_sysfs_preempt_timeout

 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_sysfs_preempt_timeout.c   | 218 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 221 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c

-- 
2.34.1

