Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39536C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E665210E53D;
	Mon, 14 Apr 2025 11:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5oaRJtJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367A310E53D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744629096; x=1776165096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fgwkVAMrdsa8zVINCGv0tvdHZt6ydO+lD/ZTFWWvVXU=;
 b=V5oaRJtJUQM4bU//rhQSaNIXOognNdzj3TUNodNsZxidiOjdTr/JOlm7
 P7AMstvg39RcB+Tt86UnZwIAPyZWU7fET4l5GNu602+zov3yTXd/RBzPT
 Vs8TGZG4ulUP9TJFcTf44nPsbdXRtFB/IVqBC2pw+MQiMPEkyL+a4FwCp
 Lu6p93jdHiBfnU/53449uLZB2+dd2HwRpg7AWhGCF6Xk+X9YJa8FFzQhL
 syrahSbsQN84i/l3v0QRC23lPOfg82DlQlVt+HIOyrVKvYgyrDpVOV1mI
 7BC5e7qsRrXs8+g9stM23ocIaWtTPMWeAIknFocN3Lg7Tc0PoNqiaUmeG w==;
X-CSE-ConnectionGUID: BcCMjeQMSVGSOR7gJRaq6w==
X-CSE-MsgGUID: KojHXHIoQ36wBFxixOZqPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="33706178"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="33706178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:36 -0700
X-CSE-ConnectionGUID: 7N+rK7PmR9CB/t3ca464ZQ==
X-CSE-MsgGUID: BUxvci0ARQGoS9VqA2stGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134838309"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 00/10] Add new test to validate adaptive sharpness filter
Date: Mon, 14 Apr 2025 16:46:47 +0530
Message-Id: <20250414111657.794484-1-swati2.sharma@intel.com>
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

Swati Sharma (10):
  lib/igt_kms: Add "sharpness strength" as crtc property
  lib/igt_kms: Add func() to return scaling mode name string
  tests/kms_sharpness_filter: Add adaptive sharpness basic filter tests
  tests/kms_sharpness_filter: Add toggle subtest
  tests/kms_sharpness_filter: Add filter-tap subtest
  tests/kms_sharpness_filter: Add dpms/suspend subtests
  tests/kms_sharpness_filter: Add scaler subtests
  tests/kms_sharpness_filter: Add invalid subtests
  lib/igt_chamelium: Add chamelium_frame_eq_or_dump_frame_pair()
  tests/chamelium/kms_chamelium_sharpness_filter: Add basic test

 lib/igt_chamelium.c                           |  38 +
 lib/igt_chamelium.h                           |   3 +
 lib/igt_kms.c                                 |  23 +
 lib/igt_kms.h                                 |   2 +
 .../kms_chamelium_sharpness_filter.c          | 282 +++++++
 tests/kms_sharpness_filter.c                  | 773 ++++++++++++++++++
 tests/meson.build                             |   3 +
 7 files changed, 1124 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

