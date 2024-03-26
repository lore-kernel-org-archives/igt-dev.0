Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B69C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 21:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BDC10EB12;
	Mon, 25 Mar 2024 21:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgAiT+tK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9AC10EB12
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711403788; x=1742939788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUijdEmGq+bACKITlBxSN72SVsTkN6hiXs8N3qMzkJE=;
 b=dgAiT+tK3GYL/qtMqdwLid8Cnyub7/79hk/dUFD9sJ9oyoV20ZXHmNil
 Wq507l0x+XQMfggxEV7GIxkZLyZrc3mQjFJM9dxgtB+qpn4qRaeq3+1Rv
 tRe/25YKxoAE0U+/oKPX4oRIsSDc2w2K3QO84XjSP37etQUcbDNZzHUNk
 HeMfHe9blEof5V3qMbmf3V4HjCoYgLWXNrWac1dI+MZoQAL7JVqwQLDhT
 Un3U+llsFh8ZEPTlUHeRfyDZClPqbtywaw2OAKrXgWYvpYzcCglkrhUi0
 /JR1by4/oc8lSc4P/g05UDytf/2N1Dk9QtSa15axUZxZYJmds7ez6CRqv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6540569"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6540569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20413087"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:56:27 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v1 0/3] Add check to ensure platform supports compression
Date: Tue, 26 Mar 2024 02:54:35 -0700
Message-Id: <cover.1711444735.git.akshata.jahagirdar@intel.com>
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

Currently, the igt testcases don't have any check to ensure the platform
supports compression (has flat ccs enabled) before running the test.
Add this check by reading the flat_ccs value received from DRM_IOCTL_XE_DEVICE_QUERY 
ioctl and proceed accordingly.

KMD-changes patch: https://patchwork.freedesktop.org/series/131595/
Fixes : VLK-56136

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform supports
    compression
  tests/xe_ccs: Check if platform supports compression
  drm-uapi/xe_drm: Read flat ccs value from drm_xe_query_config

 include/drm-uapi/xe_drm.h |  3 +++
 lib/intel_blt.c           | 18 ++++++++++++++++++
 lib/intel_blt.h           |  1 +
 tests/intel/xe_ccs.c      |  1 +
 4 files changed, 23 insertions(+)

-- 
2.34.1

