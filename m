Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD4E69189
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 18:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC0110EC4F;
	Fri, 22 Nov 2024 18:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUluuzx8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED37310EC4F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 18:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732301658; x=1763837658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KEuTA+0/8a7UiC9qXrAimAs/RoBWP1e7hTJBt10eIn4=;
 b=kUluuzx8Ri7a7GY8p7oyFsXVhMEKDD+IGvIOD/t9VVcD9KOVL2oHnBah
 W8ZTfPBuzuSFURivkTb92t7W8HeTAaLINkhm/WVwxjk4C4tWvSJMpoPHL
 ljNt7eyLMKMm/GSoM0qsE+UCtCNO5a23i+xzDIVdkHOCwnJ+0qhu3URHZ
 8UCXz7ZWU5Y70zpnOqZnDO66EqwrcXo/qEgnilaca7/UH2wn/dxzdJcE1
 VmqYFUJ1VtBJRfPqwobfA51DhsuMik8qy30F57DsabEj5PEYPArZidTP9
 gN2m6QXJSgsdQh4eXdfLTEE/FjWB3/XHwk8beVr2fcWll7M5CTQ2OV57/ w==;
X-CSE-ConnectionGUID: qZxjBkQSQ5KhszVhxL+4Xg==
X-CSE-MsgGUID: /JMcIIutQzCEwfzGUiwgvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49987385"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="49987385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 10:54:17 -0800
X-CSE-ConnectionGUID: hbTpmIo9RlWr5yj4N7CGEg==
X-CSE-MsgGUID: FS9njdHpQ1SSlSL3jzaAzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="113930248"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 10:54:16 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v8 0/4] Add new test to validate adaptive sharpness
 filter
Date: Sat, 23 Nov 2024 00:27:04 +0530
Message-Id: <20241122185708.1755203-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

New test is added to validate adaptive sharpness filter on
LNL platform. Pipe scaler is repurposed to perform a portion
of this work. This means pipe scaling will be unavailable while
the sharpening function is being used. The other scaler can be
used for plane scaler.

In this series, attempt is made to validate adaptive sharpness
solution which helps in improving the image quality. For this new
CRTC property is added. The user can set this property with desired
sharpness strength value with 0-255. A value of 1 representing
minimum sharpening strength and 255 representing maximum
sharpness strength. A strength value of 0 means no sharpening or
sharpening feature disabled.

KMD: https://patchwork.freedesktop.org/series/138754/

Swati Sharma (4):
  lib/igt_kms: Add "sharpness strength" as crtc property
  lib/igt_kms: Add func() to return scaling mode name string
  tests/kms_sharpness_filter: Add adaptive sharpness filter test
  tests/chamelium/kms_chamelium_sharpness_filter: Add basic test

 lib/igt_kms.c                                 |  23 +
 lib/igt_kms.h                                 |   2 +
 .../kms_chamelium_sharpness_filter.c          | 240 ++++++
 tests/kms_sharpness_filter.c                  | 739 ++++++++++++++++++
 tests/meson.build                             |   3 +
 5 files changed, 1007 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

