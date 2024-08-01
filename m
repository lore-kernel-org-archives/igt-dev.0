Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172BAC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ED610E8EF;
	Thu,  1 Aug 2024 10:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXdNYVuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3394C10E8EE
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722508075; x=1754044075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HbtkHNo/wgefAyyUBJh5ZF5MxLebO6q3jcBOwlFeNHc=;
 b=AXdNYVuVEGZcPjkYICArZ+nZyVB0JfLTtguJojipcbuftfNCUH2yZniT
 Cj1ha7KbgLM6kBoPpu1TiiKo4uOr4/JMqjxpKAExmbH4aC7mnAS19tkIZ
 Rcgs60bRLQrZZfXCkYdW6MBkGzafUCsYpr00XnCYkMyRZLojGPjx9++hI
 fmEApEi/fAtavetwVVsBkcK/5mTnz3ks1WV4U0htZqGAXbzemhgSMTXYR
 83Bex7dftLCzZFJNJ58pyIxdbpsBsJ2eKwi2S+RdeFFFfhk7FmESlRF8c
 qtTXk1LMV3ojLIO8athp6yS8ICl/GsBkvOtZfQuErwms6RJFlTcMTVztW w==;
X-CSE-ConnectionGUID: m9MmX0YLSbGfvaVOw0GP7g==
X-CSE-MsgGUID: KBcS98dnR2G5CELc2fDjYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24244506"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24244506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:27:54 -0700
X-CSE-ConnectionGUID: Xj0R5T+HSoy5YXn35sZa1g==
X-CSE-MsgGUID: ZEHjpbE/RDSiPQoamp72Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54967007"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:27:52 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 0/3] Add sysfs node checks for gt_freq and
 pm_residency tests
Date: Thu,  1 Aug 2024 12:27:45 +0200
Message-Id: <20240801102748.487160-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
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

This patch series introduces necessary node checks to ensure that tests
are only executed when specific sysfs nodes are present. This prevents
test failures on Virtual Function (VF) devices where these nodes might
be missing.

v2: Use "node" instead of "attribute" for more accuracy

Marcin Bernatowicz (3):
  lib/igt_sysfs: Add xe_sysfs_gt_has_node to check node existence
  tests/intel/xe_gt_freq: Skip test if 'freq0' node is missing
  tests/intel/xe_pm_residency: Skip test if 'gtidle' node is missing

 lib/igt_sysfs.c               | 26 ++++++++++++++++++++++++++
 lib/igt_sysfs.h               |  1 +
 tests/intel/xe_gt_freq.c      |  1 +
 tests/intel/xe_pm_residency.c |  2 ++
 4 files changed, 30 insertions(+)

-- 
2.31.1

