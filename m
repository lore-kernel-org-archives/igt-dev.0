Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32193C021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 18:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9780A10E06C;
	Tue, 18 Feb 2025 18:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZe54CM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F7F10E021
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739902894; x=1771438894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6CmlOdbT4g5s83/9HuUf7tQuBcIH4U4IxsCMiZVwMsQ=;
 b=IZe54CM6M168xXJcBo5jRUun1aTJ8QhXazUmKCJpdFpqLBN2BbHjXuC4
 Sjl7yu51qSfjXchB+Ur+itPCrdYMpWhhjzbhJ67nOL57cvMTWHOl6hIAk
 UpUJYVNnSrPY6vLactFTiY5pWcn/42VpIrtyXs+mzwN+qKEWgzR+Ol+0P
 fWNmkVEFGCYJ+B88jszFL5mm4uuXGiuDcFfxvRiSfOJAPB2sni/EfwJwJ
 ktjiEEm8CMwSuQ4RfhEh+FPB7XKMbCncefeEKkCebD9rzDXZjVSZcfh7y
 5XJ2DMn6NhEzvrxxaio8xCdnRb1+veD2WjBn37O6XQbAsf7HHuzVVxZdr Q==;
X-CSE-ConnectionGUID: IO9vZE9fRd6nnaLwmBbUTQ==
X-CSE-MsgGUID: ng0hY073Qgy295k6xKQ5UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40823137"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40823137"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:21:33 -0800
X-CSE-ConnectionGUID: psIQkPeoTLW2Ew75V1BCLQ==
X-CSE-MsgGUID: BXX+rKsxRI6zzBphSGvTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145371694"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:21:33 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, shubham.kumar@intel.com,
 kamil.konieczny@linux.intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t v2 0/2] Add tests for EU stall sampling 
Date: Tue, 18 Feb 2025 10:21:25 -0800
Message-ID: <cover.1739901972.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

The patches in this series add IGT tests for EU stall sampling, a
hardware feature first introduced in PVC and also supported in XE2 and
later architecture GPUs.

The Xe driver patches that add support for EU stall sampling are under
review: https://patchwork.freedesktop.org/series/144609/

These IGT tests are being used to test the driver changes for EU stall
sampling.

v2: No longer use the OA library functions used in v1
    Move xe_drm.h header changes into separate patch
    Address review feedback from v1

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Harish Chegondi (2):
  drm-uapi/xe: Sync with EU stall sampling uapi updates
  tests/intel/xe_eu_stall: Add tests for EU stall  sampling

 include/drm-uapi/xe_drm.h |  74 +++++
 tests/intel/xe_eu_stall.c | 623 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 3 files changed, 698 insertions(+)
 create mode 100644 tests/intel/xe_eu_stall.c

-- 
2.48.1

