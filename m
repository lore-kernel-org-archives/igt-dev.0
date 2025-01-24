Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4BC02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 08:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A9010E915;
	Fri, 24 Jan 2025 08:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDA0LA52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD42C10E915
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737706248; x=1769242248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kg05wYc/7KGfpJInJtZgdz6D75J2zSKOkUDJEtBGLCM=;
 b=mDA0LA52LnMnHZKlP8JjNyB+DKSPG/4tLggN5W5XZFXMEv2GloUaREv1
 LpweqMUc6M6CjLvZjDGh8ToDJdu2y+/qgcvzQs40tOSIMYq8p1P7XCvOp
 hto8B4YeWY0XaJrpke2A8AGFp3y04kvok7sMJRg8B1ij/1rJWlHujLsO/
 OHTe33hijwbPKMVWQTEvLAC4R9mD17wH2Rgy6PXk/7T4l3Acq3uiO6e8X
 JXw5hssGeEWj7x47kXw++r0P0pnStG4QZJk+PXTdRSogW4GfOnUkhwjK6
 k4lKF1l/BfWdEFO9V1/X1umgj38KpyJNGWA2NfL7GvD+VIIzCGsHGNAAq Q==;
X-CSE-ConnectionGUID: SIo3uX0oQq2kwb1G6Ya1YQ==
X-CSE-MsgGUID: PrFrMgRcT5C/PGsritaNRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63587298"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="63587298"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:47 -0800
X-CSE-ConnectionGUID: RCl2dhtFRQymeZ1s+ahrSg==
X-CSE-MsgGUID: P2dH32CRTnOGUrjJlHL5Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112340309"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:45 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v1 0/4] Verify VF configuration data against provisioned
 values
Date: Fri, 24 Jan 2025 09:10:35 +0100
Message-Id: <20250124081039.31201-1-lukasz.laguna@intel.com>
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
- helper to iterate over VFs, starting from a specified VF number.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (4):
  lib/xe/xe_sriov_provisioning: Add helper to read VF's configuration
    data
  lib/xe/xe_sriov_provisioning: Add helper to get VF's provisioned quota
  lib/igt_sriov_device: Add helper to iterate over VFs from starting
    number
  tests/xe_sriov_auto_provisioning: Add subtest to verify VF's
    configuration

 lib/igt_sriov_device.h                   |  15 +++
 lib/xe/xe_sriov_provisioning.c           | 136 +++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h           |  11 ++
 tests/intel/xe_sriov_auto_provisioning.c | 124 ++++++++++++++++++++-
 4 files changed, 284 insertions(+), 2 deletions(-)

-- 
2.40.0

