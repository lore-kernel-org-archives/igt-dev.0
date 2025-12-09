Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71233D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 11:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E352310E1CE;
	Tue,  9 Dec 2025 11:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jywJ8SQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9783610E1CE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765279127; x=1796815127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PzWODf6nDf5eBcHKbg2TVYZ2vdmbA08yo7y8DKCmpHs=;
 b=jywJ8SQgeCAkW5iHqM7CIQ5eDYO8VSlTXM0WZClmawf3v/tfqQysrDGR
 EgF6XdgVmUSSKUPkSFBvwOAwQXuWGAD6M2im/CbAG+hLNJDd/iSklxAD0
 Yav2hw9YTinGcGV3ZUpoqcNNyOCo2X1sP0y3TZjLBYb0uiCwFGmr6vilM
 0qQDvaAFDKZ0fegDMvg/Jw8xJ6kjqKv6uztBk9wp4lB4yWfgZhfe49+Un
 X2C9jWpbjhLnemCNfJHimB2MQ7GU6yx++SzAR4f88ypI3L89f6n2I0Eil
 6CAPfB7FEk52FRbv11l6F+RNMmRTDu+rZ1HQHax1EfNFCbifAqY1zy6EP Q==;
X-CSE-ConnectionGUID: OcWV2dmKSHW5KqARcJMUjA==
X-CSE-MsgGUID: x8fIuwxSQf2ifkhLSzOovw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="69823742"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="69823742"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:18:46 -0800
X-CSE-ConnectionGUID: 7vlLxFqbQoiLIqA6sUBJqw==
X-CSE-MsgGUID: 6XKP3VTeSzibkQI3gMaytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196212357"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:18:43 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 0/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Tue,  9 Dec 2025 16:41:27 +0530
Message-ID: <20251209111126.1155774-4-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Change throttle_basic_api to read the new atomic reasons attribute
instead of checking status and individual reason files separately.
This validates the kernel's TOCTOU-free throttling interface.


Sk Anirban (2):
  tests/intel/xe_gt_freq: Modify test to support new throttle reasons
    sysfs
  HAX: Add throttle_basic_api test to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/intel/xe_gt_freq.c                 | 44 ++++++------------------
 2 files changed, 12 insertions(+), 33 deletions(-)

-- 
2.43.0

