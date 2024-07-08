Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B89AC3DA42
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 14:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EBD10E36F;
	Mon,  8 Jul 2024 14:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0/r5PYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3C410E36F
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720449511; x=1751985511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A2vtn6XtYN720FeDgvbrJ3vwVvKbi2AKYrtpTVI6tCA=;
 b=B0/r5PYzl0goQKrfIvgljo249weDSPERg5DJuYzcwe/xEzZGMZSDbJb4
 Pw7pwH3TrytO9s7wysJ8q6Iv279Yp1/zlYVCNBj8d4uSXy0Rjp3Yz5eQy
 7/cgJfCbJLc218sRqJ2gmJrDM3055gbdskZylt0teB4jH85NxS7bJ/DoQ
 6eK/kLl8gan4pOalO5+K/Do3XhS8f3bcjukfWHV+tZuAT4tPSgTzbwyY8
 4V4U9evqV7RN4eEtp+gRLYbcwiVJ0FDy2pV+4HctYSBg4hq3KsA7bV7r4
 c7AQmpCq2iZAqj7Ls2fX2oZ+8tMx9Is4sXD6+m40gAzSoiUqVmqiGZmOO g==;
X-CSE-ConnectionGUID: wJ/k4DJhTFKvuC2UrqwGpw==
X-CSE-MsgGUID: fqxDkdXgREqVNfQfF+P3jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21465599"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="21465599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:31 -0700
X-CSE-ConnectionGUID: kWjDgcxoTZ+kqyjhEVcxuA==
X-CSE-MsgGUID: s6ZZ4jVOTv20+a5O7+u+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47491430"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:28 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, janga.rahul.kumar@intel.com,
 kamil.konieczny@linux.intel.com, riana.tauro@intel.com
Subject: [PATCH i-g-t v2 0/3] Extend mocs-rpm test to support d3 cold
Date: Mon,  8 Jul 2024 20:26:04 +0530
Message-Id: <20240708145607.272869-1-badal.nilawar@intel.com>
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

Extend mocs-rpm test to support d3 cold

Badal Nilawar (3):
  tests/intel/xe_pm: Install fw close exit handler before rpm tests
  tests/intel/xe_pm: Extend mocs-rpm test to support D3Cold
  HAX: Add s*/d3*-mocs tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |  5 ++
 tests/intel/xe_pm.c                      | 78 +++++++++++++-----------
 2 files changed, 49 insertions(+), 34 deletions(-)

-- 
2.34.1

