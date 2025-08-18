Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40899CA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 16:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4F510E06A;
	Mon, 18 Aug 2025 16:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVIOXZZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A406910E06A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755533340; x=1787069340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=82cJ5oXkCcb5yKmRtQZwwVYSSbrYwKiRtbOnmUiY02o=;
 b=QVIOXZZpYUY/Jd4uQtYAiUPDCeTvMGrfC2hr7p2AKZ2EXUIGSpGlJPR/
 umD0QI1ROttdC3NfE+ro6B/kBJ8/Nb63dOuiHHeujHCxZN12VLz3qKqyJ
 B3jSBNB0MTwq7IDg1y+GNnh5ETC6oOXIv9OK7L5wbauwqkce6udNAOwei
 rbmd+kTeuiOACBA/KaC3X7bCkeoyoQbJKn27bwD+e0/dKCGyE2x54wZm5
 GC1bHMe55mQMXZ0UoQpd7cpD0CHk6uACEVCDMBwBr2hA16mjF8iRcmiZx
 jOHBAxO+mqXo0xEFxtSDw2yiC+ZfYy5ZHRgYMYwSNZEmed+aF6rT012TC g==;
X-CSE-ConnectionGUID: n4/dz30ARUS7WjQbCFq/1w==
X-CSE-MsgGUID: gzY6MHvMR4CL2Sh3x0d5GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75329192"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75329192"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:09:00 -0700
X-CSE-ConnectionGUID: /kxuewxFQLinIzlnI+Vn9A==
X-CSE-MsgGUID: pArWXnFUSvWP27dYPHwjDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168415972"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2025 09:08:59 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/2] tests/kms_atomic_transition: Change debug mask
 for multi-output modeset tests
Date: Mon, 18 Aug 2025 21:46:47 +0530
Message-Id: <20250818161649.2157822-1-pranay.samala@intel.com>
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

For modeset_tests, limit debug logging to DRM_UT_DRIVER only when
more than two outputs are connected to prevent excessive disk usage
during CI runs.

Add a new helper function to return the number of actively connected
outputs in a given igt_display_t instance.

Pranay Samala (2):
  tests/kms_atomic_transition: Update debug mask for multi-output
    modeset tests
  lib/igt_kms: Add helper to get count of connected outputs

 lib/igt_kms.c                 | 19 +++++++++++++++++++
 lib/igt_kms.h                 |  1 +
 tests/kms_atomic_transition.c |  6 ++++++
 3 files changed, 26 insertions(+)

-- 
2.34.1

