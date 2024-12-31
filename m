Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD80FE77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 12:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD9510E033;
	Tue, 31 Dec 2024 12:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfNLp2Te";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0010E033
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735649857; x=1767185857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GnxHsbq0Jc0jYvLEUSm9UQfnndw7+2Gwf2+q33zGAXg=;
 b=MfNLp2Te+KSidV6VFIXUOyPWg3ld5dy8/zxRPB6g0pLsNRUSnlFqV06o
 q/22dtMMTtIFiTgl6gUyI4FiZ4vTWSDzjpxymJe8/lJ5zQm7/kQTvhgT3
 Vzvmw9IO3BcWOYfzlqHf0Moz1WWU/Z+dGlDsgdjgakRoYTqIp59YkeLKD
 uwzGyJ+1FxOqQWnUqG7WBo7xEnnZnx3vI6EFCi1xjsG7p4A1ehNtIvbdN
 uOYGQSEZFVuLrbGbyIUOG091EarIxgIbNJc1DscScP8GUILrCb1xe9i9Q
 WgANMlDsGx8vMfr6QJZ5diuWcRQROJrsxPl8/MYy/Y5kwQf+NuxlrXlGQ g==;
X-CSE-ConnectionGUID: 8fjQjNDYTNW33FhNvg/mDg==
X-CSE-MsgGUID: MePNX/hiQgC4B0e/mGu0mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46518388"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="46518388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:36 -0800
X-CSE-ConnectionGUID: EsGmGZqDTCWNaI5D1+jAVg==
X-CSE-MsgGUID: KLGdTE0nRRmDk3TOshP5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100867182"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:34 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/9] Add new test to validate adaptive sharpness filter
Date: Tue, 31 Dec 2024 18:32:32 +0530
Message-Id: <20241231130241.69689-1-swati2.sharma@intel.com>
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

Swati Sharma (9):
  lib/igt_kms: Add "sharpness strength" as crtc property
  lib/igt_kms: Add func() to return scaling mode name string
  tests/kms_sharpness_filter: Add adaptive sharpness basic filter tests
  tests/kms_sharpness_filter: Add toggle subtest
  tests/kms_sharpness_filter: Add filter-tap subtest
  tests/kms_sharpness_filter: Add dpms/suspend subtests
  tests/kms_sharpness_filter: Add scaler subtests
  tests/kms_sharpness_filter: Add invalid subtests
  tests/chamelium/kms_chamelium_sharpness_filter: Add basic test

 lib/igt_kms.c                                 |  23 +
 lib/igt_kms.h                                 |   2 +
 .../kms_chamelium_sharpness_filter.c          | 240 ++++++
 tests/kms_sharpness_filter.c                  | 773 ++++++++++++++++++
 tests/meson.build                             |   3 +
 5 files changed, 1041 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

