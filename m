Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ECB606A32A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kA8cKajh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2994A10FE04;
	Wed, 18 Nov 2026 15:46:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E317F10FE13
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016732; x=1826552732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/l6IIk1LcvMxpjQn57xkNtgYBMWhKF77wuyfz1lCYxo=;
 b=kA8cKajhjt3fJ9WuFnspgnu6dj52Wjk76Ufp+3W5wUEH/ff6iSuxaJyF
 SZn5wh1deChxX+Swvgbg7H44uzYO0GQOl8HrNDSlL1R5Tz2HInqDgCBI2
 bSkmRj0haKV3iz5E2e6qAWFsAVszAVkrVfj9zgUcc26Ur9GdlvSiQ9YLY
 ge0Bsh0DZNBUIIeqfLRjcQm9G1JMYBKN3Em+dxC8x3MiPxV5rqiklmiUU
 Sdhq5FGakL5xUhRi5Gqow1jXTH3BRmaawYMdUyo1fXM5Q6np30g2MBVr4
 NbAAuPbAV6q1iZ+c97w9Ci3ByFNZAluv6PtBoYG++Z2cSdUiB1VFDRoqP g==;
X-CSE-ConnectionGUID: Ze0tIsefQs28ojVNttXjaA==
X-CSE-MsgGUID: CU6jkkbJRkG8BVLjA7cfRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720341"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720341"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:31 -0800
X-CSE-ConnectionGUID: AUs/dyDWTLO/NnZJQEpfEA==
X-CSE-MsgGUID: fkJCZIorStmS3V1EkXmeUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319378"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:29 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/8] RFC: Add intel_display module support to module
 load tests
Date: Wed, 18 Nov 2026 21:14:15 +0530
Message-ID: <20261118154426.345883-1-jeevan.b@intel.com>
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

Kernels split the display code out of i915/xe into a separate
intel_display module. This RFC makes IGT aware of it:

- Fall back to intel_display module parameters when looking up params
  (igt_params, kms_panel_fitting).
- Check for intel_display in the i915/xe module_load load subtests.
- Unload intel_display together with the GPU driver.
- Add an intel_display_module_load test.
- Verify the driver unload result in xe/i915_module_load.

Jeevan B (8):
  lib/igt_params: Fall back to intel_display module parameters
  tests/kms_panel_fitting: Find fastboot param with a dedicated display
    module
  tests/intel/i915_module_load: Check intel_display in load subtest
  tests/intel/xe_module_load: Check intel_display in load subtests
  lib/igt_kmod: Unload intel_display together with the GPU driver
  tests/intel: Add intel_display_module_load test
  tests/intel/xe_module_load: Verify driver unload result
  tests/intel/i915_module_load: Verify driver unload result

 lib/igt_kmod.c                          |  45 +++++
 lib/igt_params.c                        |  48 ++++-
 lib/igt_params.h                        |   1 +
 tests/intel/i915_module_load.c          |  11 +-
 tests/intel/intel_display_module_load.c | 221 ++++++++++++++++++++++++
 tests/intel/xe_module_load.c            |  17 +-
 tests/kms_panel_fitting.c               |  17 +-
 tests/meson.build                       |   1 +
 8 files changed, 341 insertions(+), 20 deletions(-)
 create mode 100644 tests/intel/intel_display_module_load.c

-- 
2.43.0

