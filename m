Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C59606A31D
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LCXz5DaO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82F4112C70;
	Fri, 23 Oct 2026 17:14:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71C2112C70
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792775621; x=1824311621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W+Sj8UrK/GX+AfIj/deTlK6voF44HG/u3Jn39YfuALk=;
 b=LCXz5DaOxo5BDkd/khS/Gv9eIgSe059iAnTy7I4t4qO2ZDWMKw9o82Wm
 cWRf8KTJE8r6JLbVRBr0KRxgjHUB6EHs1NI83YAG7x5K692rgA9nkDLRx
 HuOxcBB+P0y+FXSj6jJFSClJOAmIaoP6qNs0msRiBkEfua3LvFJw3GmMr
 ZrOzngQZi4D5tRPWEu5sH3ZbJiWk0QPdlL332fQHFVvHette6cKhoB8ii
 eNNGCN74IpJCQWXYGMXoiBdbYsONaXx3FguoYyOAFoRyeBJznm2F4WlqM
 fXxdSnmQ+NtY9P1HQoLiZaGZBeJtQk6NehfY7p/Z1oezFkLKGxRElpBGN A==;
X-CSE-ConnectionGUID: U9983KyxSL2oFt/wyioShg==
X-CSE-MsgGUID: /W4uBGEKQWy6F7/m34smKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428209"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428209"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 10:13:41 -0700
X-CSE-ConnectionGUID: GIxzH09uQy2BKhuvgTm0tA==
X-CSE-MsgGUID: Ncxgxg07Q+G/+e5ew0UG2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3755824"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 10:13:39 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 0/2] Ignore AER error and recovery messages in dmesg
Date: Fri, 23 Oct 2026 22:43:24 +0530
Message-Id: <20261023171326.982997-1-ravi.kishore.koppuravuri@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
```
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
```

v2: simplified the regex and removed duplicate strings (Kamil)

Ravi Kishore Koppuravuri (2):
  From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
    DONOT REVIEW. COMPILATION ONLY.
  tests/intel/xe_err_injection: regex to ignore AER messages in dmesg

 include/drm-uapi/drm_ras.h     |  67 ++++
 lib/igt_drm_ras_nl.c           | 610 ++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h           |  77 ++++
 lib/meson.build                |   7 +
 tests/intel/xe_err_injection.c | 713 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 6 files changed, 1475 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_ras_nl.c
 create mode 100644 lib/igt_drm_ras_nl.h
 create mode 100644 tests/intel/xe_err_injection.c

-- 
2.34.1

