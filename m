Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1939606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FiaAZDUL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E63310E234;
	Thu, 26 Nov 2026 07:50:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2693910E2BD
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679220; x=1827215220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wvWKy6cCmtJRZ4Ts8zKgw7cJ1hTnIo/5zQ2vy2DiHy4=;
 b=FiaAZDULNRm4VXhgwYc2Ote46A4NX4BMq8bQ+c6YcNwEg8plzOpsCTtW
 W4KAXiNiIyTQEurCYlVIHnER16LsaFYT7OSWPq28ZPD5B6RpB4qbbDuBy
 gwWPVVJJM2gqiHB9WM0WjupqeXQOo8zA5MonKvjYVbkOKhjiOpEP/81Lo
 /TvLuG/rYL3fN0mx3Ya4WlvRycHe3ykUMnyfznu00vEfanDUaYi8whvZf
 TB4NoZgiLMLd1V2khXVJr3bWOiRS+SpjQDeukcYSxUtXJilFpGK1wmoMf
 HUW5sjigBfTx64yefuWaeEb+qNdHDvCLmMyr35WrccClMDFob7LVE4zoA Q==;
X-CSE-ConnectionGUID: HKq2q28vSMeYpLIyllvAKA==
X-CSE-MsgGUID: GZPwglWaSCSnhvxMxTzMUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4566200"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4566200"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:54 -0800
X-CSE-ConnectionGUID: P/E77jgMQwaUl9do8yIEig==
X-CSE-MsgGUID: c8O+YvSFTpOBvBNM3sSt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="11991837"
Received: from hchegond-desk.jf.intel.com ([10.24.80.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:54 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, ravi.kishore.koppuravuri@intel.com,
 zbigniew.kempczynski@intel.com, maarten.lankhorst@intel.com,
 alexander.usyskin@intel.com, anshuman.gupta@intel.com,
 soham.purkait@intel.com, riana.tauro@intel.com, nishit.sharma@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 0/6] Add DG Diag error injection tests
Date: Wed, 25 Nov 2026 23:46:40 -0800
Message-ID: <cover.1795677252.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds DG Diag error injection tests. These tests
inject errors through debugfs-based test interface for the
System Controller's RAS error injection command. The tests
require the DG Diag FW application to be loaded through
late binding. Intel Graphics System Controller (IGSC)
firmware update library API will be used to load the
DG Diag FW. RAS netlink counters will be read before and
after injection to make sure errors are injected.
The patch series is still under testing.

Harish Chegondi (6):
  meson: Add IGSC as an IGT subproject
  lib/xe: Add API for late binding from an input file
  drm-uapi/xe: Sync with DRM RAS uapi updates
  tests/intel/xe_err_injection: Add memory error injection tests
  tests/intel/xe_err_injection: Add PUnit error injection test
  tests/intel/xe_err_injection: Add CSC error injection tests

 include/drm-uapi/xe_drm.h      |  11 +-
 lib/meson.build                |   5 +
 lib/xe/xe_igsc.c               | 142 ++++++++++++++
 lib/xe/xe_igsc.h               |  13 ++
 meson.build                    |   9 +
 meson_options.txt              |   5 +
 subprojects/igsc.wrap          |   5 +
 tests/intel/xe_err_injection.c | 347 ++++++++++++++++++++++++++++++++-
 tests/meson.build              |   6 +
 9 files changed, 540 insertions(+), 3 deletions(-)
 create mode 100644 lib/xe/xe_igsc.c
 create mode 100644 lib/xe/xe_igsc.h
 create mode 100644 subprojects/igsc.wrap

-- 
2.43.0

