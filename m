Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F41CC021B2
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 14:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45AF10E0D6;
	Thu, 20 Feb 2025 14:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lA1cQcYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82C710E0D6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740063582; x=1771599582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3GOZ4OKB08WGJ2VWG/UK80ugz8/Bldc7+kVXBZkZ8E8=;
 b=lA1cQcYmm/zLLIBcRBnZXuPPeVHwZsZrY52iH3jPNZsYtjQ7/hRXhmn1
 /+HLRxX18naw0kt8uA7o5Z3ijaqlJuDi0PbabXqNmsmI9mF3baXKAqYJp
 1p89ICibUraNCiq8beWIY/1/U4g9gJfWo9+kOdCKr4f7lv1jBVLFM3snP
 dI3p+H6GQ3c7at70KyESPFvzXMzf9A+pfCtyFyS3xa4nNiPG7AMREsHuU
 eaxV5jSGt45dT0XBpUyK7lPMQ9bsk5+/r7qZB30UNOKKj4bI3vdhIF0pt
 SKNYhxUid+VRIrtJPqaa2MXv4ZRZb6qSU9VrrosDcMhemS0v5mW0B1O9J Q==;
X-CSE-ConnectionGUID: T4zFmXI0TBSgS4ej0R2+HA==
X-CSE-MsgGUID: EMb/sRUzSUKHjreLprUh+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="52249647"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="52249647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:59:41 -0800
X-CSE-ConnectionGUID: mDGNd3qhTF+GGry4HQbEJw==
X-CSE-MsgGUID: QE7y2Gm8RPmhKGjqiGVKdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119158653"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.232])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:59:39 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v2 0/2] Ensure that SR-IOV and eudebug are exclusive for
 Xe
Date: Thu, 20 Feb 2025 15:59:10 +0100
Message-Id: <20250220145912.37735-1-christoph.manszewski@intel.com>
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

Ensure that VF provisioning and eudebug enabling is exclusive by
returning EPERM on an attempt to enable one of those features while
the other is already enabled. Check that enable_eudebug sysfs entry
is not present when the driver is loaded in VF mode.

Since eudebug KMD side is still in the upstream review phase, the related
kernel side change can be found here:
https://gitlab.freedesktop.org/cmanszew/kernel/-/commits/cmanszew/dev/sriov-eudebug-exclusivity

v2:
 - move subtests into dedicated 'xe_eudebug_sriov' test (Kamil)

Christoph Manszewski (2):
  lib/xe_eudebug: Export __xe_eudebug_enable_getset
  tests/intel/xe_eudebug: Add subtests for eudebug/SR-IOV exclusion

 lib/xe/xe_eudebug.c            |  15 +++-
 lib/xe/xe_eudebug.h            |   1 +
 tests/intel/xe_eudebug.c       |   2 +
 tests/intel/xe_eudebug_sriov.c | 153 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 5 files changed, 170 insertions(+), 2 deletions(-)
 create mode 100644 tests/intel/xe_eudebug_sriov.c

-- 
2.34.1

