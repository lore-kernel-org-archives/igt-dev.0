Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F16CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBE310E02C;
	Tue, 12 May 2026 06:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8ZwHJBv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BB410E02C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778566922; x=1810102922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TFl5iaAcZyEMAN0CM1/Rlm2VRTrKcOwlMSVjV8WMzys=;
 b=H8ZwHJBvIuGGGmDhG2wk4bJibZQZYKc3RYvTdeEk0b9UhxaFidwCLgYz
 Na8Ym+ztZu/U25Tgm1HE+RVZpZeFFAK5vXn4H+4M9HFYf1+xXU4kLHfTn
 BfLVwl6pYbur0/3iWKYUIKbxC25XrRWpUpoaaTFw9oM1zU/FY2ttdbluw
 pnGsLv1+NlWb7zbuO91DNUSXiEgX83iqojXWOoAVU0NAsY6beCHHh4zGe
 tNRiiqPqRdklnkN7nr2SuDWatV+t6Fq66wV6Bg6cOVRDEnRmx9mAb9vKP
 Wr7Y8oVirveeWQKsyzksPjlmW4kYzJGLkW1CHIeiVI16d5s16O77H/uq/ w==;
X-CSE-ConnectionGUID: FzOgnb73Ss2IkLaiyBjJkg==
X-CSE-MsgGUID: AwyY/wbhSluO6TnxnDnvyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82033631"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="82033631"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:22:01 -0700
X-CSE-ConnectionGUID: VkUv8ly+SYm+Ghhr3xsFBg==
X-CSE-MsgGUID: xm6dr1hqRQaYFA8IHgYtbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="242032282"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 23:22:00 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@intel.com, ville.syrjala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 0/2] RFC: Add preferred FB modifier helper
Date: Tue, 12 May 2026 11:50:16 +0530
Message-ID: <20260512062020.546220-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add an IGT‑internal modifier, IGT_FORMAT_MOD_PREFERRED, allowing
tests to request the preferred tiling format without hardcoding
driver‑specific modifiers.

A follow‑up HAX patch updates kms_cursor_legacy to use this modifier
for cursor framebuffer creation to exercise the new code paths.

Jeevan B (2):
  lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED helper modifier
  HAX: kms_cursor_legacy: Use IGT_FORMAT_MOD_PREFERRED for cursor FBs

 lib/igt_fb.c              | 71 ++++++++++++++++++++++++++++++++++++++-
 lib/igt_fb.h              | 19 +++++++++++
 tests/kms_cursor_legacy.c | 31 ++++++++---------
 3 files changed, 105 insertions(+), 16 deletions(-)

-- 
2.43.0

