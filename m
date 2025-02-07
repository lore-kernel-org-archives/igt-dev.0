Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFEEC0219C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 09:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5AD10EA8C;
	Fri,  7 Feb 2025 09:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ovu//odt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FF510EA93
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738921238; x=1770457238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r2luHMclqzUIRu5Eal08KKVYXyyaSls0mMjVipwiKXQ=;
 b=Ovu//odtGnTzoKM/n2RZ779UWktb4+ogrVqE06HVDE7+ca2YGqV/C7zK
 ueEX+RurkhuOwOWYxQe4SvlQyQ1MoZ69Ez01iw2YDHmbrqgVCotzo54ob
 sPCd6jyqH0qCHAQ2M8b2DoyQbRKWqyk3KJ1OqmWNTivxGJKn547gaka0+
 JPrfEQgMJgfEjtLL4gsMk+g0+1U5aKAkIDQOlTQ16Iiy+GwrJWv3Ph/zD
 G+54+GnXLfHrY6P5oDSdYBbbpsHCF6WEzxAA+id8OrJ4NmEdJwtcc6Zwx
 V1SHRSRnClLiUexFbEudoOyHi2Ye/+8kL+62ExUfuUwOdqIDo9iDNovTm Q==;
X-CSE-ConnectionGUID: s+47HssAToiq8msY3miWpQ==
X-CSE-MsgGUID: Pz6dXMnaTDiUxomZRCnd4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64913939"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="64913939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:38 -0800
X-CSE-ConnectionGUID: fQMCwY/dSWil1lSH6Kz40w==
X-CSE-MsgGUID: x+MsOEFkQs+BVdlWI0ws3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111328444"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:36 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v2 0/4] Verify VF configuration data against provisioned
 values
Date: Fri,  7 Feb 2025 10:40:27 +0100
Message-Id: <20250207094031.15942-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Series introduces subtests to validate that the configuration data
received by VF from GuC during probe matches the provisioned values.

Additionally, it includes the following helpers added for the subtests
purpose:
- helper to read VF's configuration data,
- helper to read VF's provisioned quota,
- helper to iterate over VFs within the specified range.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (4):
  lib/xe/xe_sriov_debugfs: Add helper to read VF's configuration data
  lib/xe/xe_sriov_provisioning: Add helper to get VF's provisioned quota
  lib/igt_sriov_device: Add helper to iterate over VFs in specified
    range
  tests/xe_sriov_auto_provisioning: Add subtest to verify VF's
    configuration

 lib/igt_sriov_device.h                   |  18 ++++
 lib/xe/xe_sriov_debugfs.c                |  78 ++++++++++++++
 lib/xe/xe_sriov_debugfs.h                |   5 +
 lib/xe/xe_sriov_provisioning.c           |  59 +++++++++++
 lib/xe/xe_sriov_provisioning.h           |   6 ++
 tests/intel/xe_sriov_auto_provisioning.c | 123 ++++++++++++++++++++++-
 6 files changed, 287 insertions(+), 2 deletions(-)

-- 
2.40.0

