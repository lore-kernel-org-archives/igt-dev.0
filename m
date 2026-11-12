Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C9606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LsPIfnXa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C9B11206C;
	Thu, 12 Nov 2026 12:09:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B39112074
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794485323; x=1826021323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F+6NWOqtaW61jdH+mdFfWjn0quFtzczkDYfTSSM5PLQ=;
 b=LsPIfnXalzuWhcY74eWQm2R1dLrx027S/t9uO0K7/azJw8G53G+DwMMu
 liBymRILpNfSEJZC0j/op1OAU+VwPrPC1uY0kIT/AGlCyem0wSDbhhwJu
 EdPwvi6BO1CHGKZkW/CBsa6qjwj1pPO7HXrkEjjS6KliheYce7VPX6eHe
 GFnFG+GZ8KjqI4awd1FH2P5zHm8zV8jYjY2oe3mzQsY/vOI5lXxixGHNh
 h5zp1bV1rIJlE14OeNbV8kn/ujuW9mvVGHecM3sVj87aUtxZP4NORki5O
 IOEwwhs450Dc9f+aXW1fvhtt4okeskSOmUncgFxwspMjHyvPy1t4j+lbp Q==;
X-CSE-ConnectionGUID: vrC+sr/vSxqS7t+XEqAyEg==
X-CSE-MsgGUID: vKI2/sY0Tnqii5YreWMqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3164016"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3164016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:08:43 -0800
X-CSE-ConnectionGUID: EUNDafOpTVacd71Qtz6zBA==
X-CSE-MsgGUID: VkqKFb7ISyiuKz+PYL9y8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8829188"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:08:42 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v4 0/2] Ignore AER error and recovery messages in dmesg
Date: Thu, 12 Nov 2026 17:38:19 +0530
Message-Id: <20261112120821.1456555-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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

Error injection tests in xe_err_injection intentionally trigger AER
(Advanced Error Reporting) errors, which leads to PCIe device recovery.
Corresponding logs are recorded in dmesg.

This series adds a regex to inform igt_runner that these AER error and
recovery messages are expected and should not be treated as failures.

Example dmesg output that will be ignored by the added regex:
pcieport 0000:00:06.0: AER: Uncorrectable (Non-Fatal) error message received from 0000:02:00.0
pcieport 0000:02:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Receiver ID)
pcieport 0000:02:00.0:   device [8086:676b] error status/mask=00400000/00000000
pcieport 0000:02:00.0:    [22] UncorrIntErr           (First)
xe 0000:04:00.0: Xe Pci error recovery: error detected state 1
mei_csc 0000:05:00.0: error recovery: error detected. state 1
xe 0000:04:00.0: Xe Pci error recovery: MMIO enabled
pcieport 0000:00:06.0: AER: Root Port link has been reset (0)
xe 0000:04:00.0: Xe Pci error recovery: Slot reset
xe 0000:04:00.0: Xe Pci error recovery: Recovered
mei_csc 0000:05:00.0: error recovery: resume
pcieport 0000:00:06.0: AER: device recovery successful

v4: Rebased on top of the latest patch series of 171275
v3: Removed redundant strings and arranged the regex in alphabetical order (Kamil)
v2: simplified the regex and removed duplicate strings (Kamil)

Ravi Kishore Koppuravuri (2):
  From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
    DONOT REVIEW. COMPILATION ONLY.
  tests/intel/xe_err_injection: regex to ignore AER messages in dmesg

 include/drm-uapi/drm_ras.h     |  67 ++++
 lib/igt_drm_ras_nl.c           | 659 +++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h           |  77 ++++
 lib/meson.build                |   5 +
 meson.build                    |   4 +
 tests/intel/xe_err_injection.c | 615 ++++++++++++++++++++++++++++++
 tests/meson.build              |   4 +
 7 files changed, 1431 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_ras_nl.c
 create mode 100644 lib/igt_drm_ras_nl.h
 create mode 100644 tests/intel/xe_err_injection.c

-- 
2.34.1

