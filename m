Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2743AC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 15:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D5010F88A;
	Fri, 29 Mar 2024 15:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdcuD8Xz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EA810F88A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711726281; x=1743262281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qO1mmTudFPecUeT/4g8oISUAP6zMn8H9cBtoOhrsKuw=;
 b=SdcuD8XzCSLhvB8b+2CATpHp2rqBV3ktcQnt8cI6VuHB0Wt7+bQRmypv
 wW4/pn7E0ZQB/qzR4fQ9gDzaGzTbUcg6BAyNpBiVFFitPUYUCK3WaUO14
 2RnyfZFQELTWoiVFpJz34dAoMhMjmwthyZwPHj8kInWusYXzf+S9C5aUt
 nPPUzKLdwK5fqNVaVFaj7JtVOOMIH164LOyVbTtcFxBySC1hGec84UUlw
 CkmBg9fIJovy1fmMGghgzQ7QelAtm9YNCPI7ctDnIl2uWcBumVFY6MH4G
 Zyp0yOG8aaG9p9zcE3YdW6kGioY5yyrpE4hQh9cT36V9hJylIkTfW6ipl A==;
X-CSE-ConnectionGUID: x9CLHu0mSViTA6kdV9KRDg==
X-CSE-MsgGUID: j+i18AX/SdOm1zaP90i7Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7042941"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7042941"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 08:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="54459201"
Received: from fpirou-mobl1.ger.corp.intel.com (HELO f83c703597ca.intel.com)
 ([10.252.40.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 08:31:20 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/3] Align Xe header and restore some uAPI flags
Date: Fri, 29 Mar 2024 15:30:55 +0000
Message-Id: <20240329153058.7-1-francois.dugast@intel.com>
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

The first 2 patches align the header to the current version in
drm-xe-next. The last one brings back some tests now that the flags
they depend on are also back. The matching kernel series is:
https://patchwork.freedesktop.org/series/131790/

Francois Dugast (3):
  drm-uapi/xe: Align header with drm-xe-next
  drm-uapi/xe: Define topology types as indexes rather than masks
  drm-uapi/xe: Restore flags VM_BIND_FLAG_READONLY and
    VM_BIND_FLAG_IMMEDIATE

 include/drm-uapi/xe_drm.h                | 27 +++-------
 tests/intel-ci/xe-fast-feedback.testlist | 10 ++++
 tests/intel/xe_exec_fault_mode.c         | 65 ++++++++++++++++++++----
 tests/intel/xe_vm.c                      | 16 ++++--
 4 files changed, 85 insertions(+), 33 deletions(-)

-- 
2.34.1

