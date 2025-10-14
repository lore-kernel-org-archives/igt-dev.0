Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3298CCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 08:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A82D10E75E;
	Wed, 15 Oct 2025 08:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuhE+Myz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEE110E171
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760429178; x=1791965178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uiyX23y+YtPF69rlcxcYdOazGiqY1u+Iz7cOp5jdDgc=;
 b=LuhE+MyzihoTmQX6wqvTgXM8hTV7WbrQITqI2+ySs2CHmZ1Y1du7lUr6
 trhfzLr1Ez37nAguBJwWEsUcvGLMx6ETLkhgX1AuWLIzrhnQ7yTQxxzHV
 K93EezKHmUeOA0UzIJx+MVInWVdkOuGb+2SV5jNxgi7yxWlcGXqNDpl6r
 Khf64wLaB3m9FCwy+fhMIi8AqzmI4YEfVT1OQ6OX1grVzf8uT0oL3YX4V
 cpwiDwGVVxiI5e/PHhtr5izfP+mUxntRhuZxJ7zOVzgWxx1z24Vv5q9EV
 yqCz35W9G/ypkZmlYZaoOXKrtaLDUrbFHwg6xW6bOIYLHwBtKuDbG9rib Q==;
X-CSE-ConnectionGUID: +S5L038LTDaqU+tl0Oupww==
X-CSE-MsgGUID: Wp0lXeBeSlebTzrliwwAxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61792742"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="61792742"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:06:15 -0700
X-CSE-ConnectionGUID: dSRtGZrFS02QmLvpBIzveQ==
X-CSE-MsgGUID: czh0AlQ0R52rJo2WLInJEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="212794329"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:06:14 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/2] Change debug mask to reduce log level
Date: Tue, 14 Oct 2025 13:53:28 +0530
Message-ID: <20251014082330.2936489-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 08:58:12 +0000
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

To mitigate disk usage during CI runs with multiple outputs,
this patch restricts debug logging to DRM_UT_DRIVER for
subtests when more than two outputs are connected,
and restores it to DRM_UT_KMS after the subtest completes.

Sowmiya S (2):
  tests/kms_cursor_legacy: Change debug mask to reduce log
  tests/intel/kms_dp_linktrain_fallback: Change debug mask to reduce log

 tests/intel/kms_dp_linktrain_fallback.c |  4 ++++
 tests/kms_cursor_legacy.c               | 16 +++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.43.0

