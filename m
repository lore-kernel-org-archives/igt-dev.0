Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562A3CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 15:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44F710E908;
	Thu,  6 Nov 2025 15:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLA4nzo4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061E10E904
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762441981; x=1793977981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tymg7mNY9swhdVrwaxjgX1d2//tr64SLxeIk+mosWIA=;
 b=QLA4nzo4YgGin2wi5KEqsugCr6g/ZgEO/4Hk7IJSxgF18WzEdiJbu6Sr
 iyv7xO7a12m1YA/sfhCw3IrH99hj4B/HnnhbGh8/DZ/cqkYMrcEPkGZQm
 CmFOvJhiYrm+0DYMcSXX+v3pQSNdzWewm78nfRakq7YrFmSCTLik5XBQq
 x8SgNBS/gE5JS76Yzdeknw8nWwmU/zmE9q013b5TTv/zIXEUHd0e3Rf02
 tf/Pyh8nI/NTglWXIfWd6AcJuFWznWd8IwbtlkybMBcIAsatoG4ieJdVf
 OL/4DHXDNjZp0ULqXIC/JCz0ObGiwWiTbRFRe4kiiasbD6G96nn7NF3XK Q==;
X-CSE-ConnectionGUID: 58jPI8a/RDe6ObVEUEiggQ==
X-CSE-MsgGUID: R+e1WB8ESgqni3E8WphyYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64488744"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64488744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:13:01 -0800
X-CSE-ConnectionGUID: OLM9+MiqSFGyroMA9kz3PQ==
X-CSE-MsgGUID: 0NOvl3JlRLm1Pg1F/LhKiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187623771"
Received: from linux-raptor-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2025 07:12:59 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.poosa@intel.com, karthik.b.s@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 0/1] Enable VRSR
Date: Thu,  6 Nov 2025 20:43:21 +0530
Message-ID: <20251106151325.3605-1-mohammed.thasleem@intel.com>
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

Enable VRAM Self Refresh.

Mohammed Thasleem (1):
  tests/intel/kms_pm_vrsr: Add test to validate VRSR with system suspend

 tests/intel/kms_pm_vrsr.c | 552 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 553 insertions(+)
 create mode 100644 tests/intel/kms_pm_vrsr.c

-- 
2.43.0

