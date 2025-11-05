Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDC7CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 08:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93CD10E6DB;
	Wed,  5 Nov 2025 08:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1Nchj7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F2510E6DB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762332279; x=1793868279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gWYpfx6+GNCcU58CiGljxEftICf8zVUE/ZtxzsYVPms=;
 b=L1Nchj7Fug/bW2QrsuoyvCDG/PTEjUmb0ATHHvxqfyc79bNN2o58aiTR
 viAJktvtJuB+0RwNJX+Oshyg9LS1fKHcRWxEiOZPjGW9rBeqgWgyj0BTf
 pSefLbi7l/0kT0PRZLB0uDtZ2J/fgfMMdYSVWkJLsdCZHt+nJn6OEe6wr
 7zlZycit+fTFekUIXEgzWno0465tWUWgvWiGn68GyWXsNXZ5vrJWJRHwO
 hbfMYoM+418QBFwoOrAPXkjRqdWhlmWQD73Er00K6hT8CP/jP9lgDropd
 7lvZclbQnNSnRxjaJW32e2wZzQ5AnPVmNtUPZuoos0VuOzj1pdzOiWe+B Q==;
X-CSE-ConnectionGUID: 8KYanbP3ROGvTHmC7oJApw==
X-CSE-MsgGUID: VRQKnsUxS0uwyFmD0KzpjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64471697"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64471697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:44:38 -0800
X-CSE-ConnectionGUID: /rY4muTvT+KrDbu0oedlcQ==
X-CSE-MsgGUID: fEvCD8hxSmCJ/jpcqsPLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="186685292"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:44:36 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Wed,  5 Nov 2025 14:14:24 +0530
Message-Id: <20251105084426.601123-1-karthik.poosa@intel.com>
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

Add subtest aspm_link_residency to xe_pm_residency test to check ASPM Link state residency.
This uses the debugfs /sys/kernel/debug/dri/0/dgfx_pcie_link_residencies to read the
residency counters.
Add an API igt_device_get_pci_usp() to get pcie device's upstream port.

Previous patchwork link which is combined patch: https://patchwork.freedesktop.org/series/155053/

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  27 ++++++
 lib/igt_device.h              |   1 +
 tests/intel/xe_pm_residency.c | 159 ++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

-- 
2.25.1

