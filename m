Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA6606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTPvD3AM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D058610E3D7;
	Thu, 22 Oct 2026 10:52:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224D710E3D7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792666278; x=1824202278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WpHUiDhpuFc8CAktOZZPE6xK93RAzX1SzK40/g63h4Y=;
 b=CTPvD3AMShp6t9u6e2iGFLoFx9MUr2WCH2n7SMk5AZuvsk/1HLjTTJzv
 WstwS7Br9/+L2wa6oQkUO354yG9Y3PupM62HOS7CbIoYwPRsIR5JP22JO
 IkQh6ETYHuxmZViLbEUasx4uzFWc3UEy0b5kMNWitHwqxKKu3tXolvlRd
 lq0wmDb/qPjPeD348hDznE7IiJiPZ9523dCACdus3XWTsSLq1zmmlrTnL
 Xk6xTLJw4sJ46Et2nSwUQbHM/k2RQCiVm6q8dupL+GWC0Rku3HPE18qt9
 V4r9iF3uaSQQAIE9U4vFr0uhwlMeARN89Rn2E+kcEq4dViaDGTYGmxw4E A==;
X-CSE-ConnectionGUID: 1tIkfY0xSLCtxFiAllJ60w==
X-CSE-MsgGUID: rcADkUwVRuuF8l2V6OrSrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1502729"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1502729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:51:18 -0700
X-CSE-ConnectionGUID: 1tUnGUJsRmSmNvSRma/lYw==
X-CSE-MsgGUID: ow4m+JwQSraUySeOGw37ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3400768"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:51:17 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 0/3] lib/igt_hdcp: extract shared HDCP helpers from
 kms_content_protection
Date: Thu, 22 Oct 2026 16:20:55 +0530
Message-ID: <20261022105102.384486-1-sowmiya.s@intel.com>
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

tests/kms_content_protection.c duplicates nearly every HDCP primitive
(enable, disable, Link Integrity Check wait, sink capability probing,
force-HDCP1.4 toggling, DP-MST topology grouping, etc.) between its
single-output and DP-MST code paths. This series pulls that mechanism
out into a new shared library, lib/igt_hdcp.{c,h}, so it isn't
maintained as two near-identical copies, and so it's available to
future HDCP-related tests (e.g. a concurrency test exercising HDCP
alongside other dependent modules) instead of being re-implemented
from scratch.

The functions are parametrized over output arrays (count == 1 for the
single-output case, count == N for DP-MST) so both code paths share
the exact same primitives rather than near-duplicate copies.
Test-specific policy - retry loops, FB/plane handling, SRM firmware
writing, uevent-vs-poll waiting, and the subtest tables - stays in the
test file; only the HDCP mechanism itself moves to the library.

Patch 1 adds the library. It's purely additive and not used by any
test yet, so it doesn't change behavior on its own.

Patch 2 switches kms_content_protection.c over to the new library,
removing its duplicated local helpers. Each call site's original
behavior is preserved exactly, including places where the
single-output and DP-MST paths used to differ subtly (LIC retry
tolerance, which output's name appears in a failure message, and
which outputs get actively polled vs. spot-checked during disable).

Patch 3 adds a "hdcp" subtest that reports whether at least one
connected output supports HDCP.

Sowmiya S (3):
  lib/igt_hdcp: add shared HDCP helper library
  tests/kms_content_protection: use shared igt_hdcp library
  tests/kms_feature_discovery: add hdcp capability discovery subtest

 lib/igt_hdcp.c                 | 423 +++++++++++++++++++++++++++++++
 lib/igt_hdcp.h                 |  67 +++++
 lib/meson.build                |   1 +
 tests/kms_content_protection.c | 444 +++++++--------------------------
 tests/kms_feature_discovery.c  |  26 ++
 5 files changed, 612 insertions(+), 349 deletions(-)
 create mode 100644 lib/igt_hdcp.c
 create mode 100644 lib/igt_hdcp.h

-- 
2.43.0

