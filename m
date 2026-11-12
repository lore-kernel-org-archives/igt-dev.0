Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09B606A330
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOirtn7i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E210E607;
	Thu, 12 Nov 2026 13:14:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E479110E607
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794489178; x=1826025178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6rGrf+RnbkYmBZ5WH9TAtAHwu/lrOpBMKDaZ2CyA3XA=;
 b=ZOirtn7iKweILsZCAOXVjj05jVTl51ZwGCjDANI+pfzEcu7ZAhJ0yw/0
 GGsvjo9I67t8zXfu81aW78mqZfrDIepJzalUsNwC7IVKYckwpv9YxKDFK
 y/gcceKZrKFcYN7HqlG6i0JkfccuCfL930pN8HyatBwVrmuxA4gkoNIgN
 ElcL391FQwVJ2mQA3koW2Y3Z6mdiRQZ0IhTWCBqQqjC/NUupx3EZdNrUz
 nDh8Si90TOoqiH2N71zwE5LiRUU4UgBlizGUIqMh0iDH2XMdLI85gBQti
 7cvjdqHCqm4vH7L8yZYl46Owgk3pIFaqi1lzfpBsnyt7mOifIktjxvnon Q==;
X-CSE-ConnectionGUID: 7vIh9v+URvKm8danTW3oOw==
X-CSE-MsgGUID: bA3FbGF1TUuHQ/TRhvYT/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3308655"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3308655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:12:57 -0800
X-CSE-ConnectionGUID: +H19j9RMT4ycPyOI+Yvigg==
X-CSE-MsgGUID: du+MneAPT3m+V9UXkPoNwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8836173"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:12:54 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v5 0/2] Ignore AER error and recovery messages in dmesg
Date: Thu, 12 Nov 2026 18:42:13 +0530
Message-Id: <20261112131215.1458319-1-ravi.kishore.koppuravuri@intel.com>
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

v5: declare regex as const (Kamil)
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

