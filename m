Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21036CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 05:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C8E11392B;
	Fri,  5 Apr 2024 05:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHAdJB8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2093311392B
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 05:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296583; x=1743832583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QxV5e5FUfEDLYJ403IF8gfSBdW4lC6yRMWb27X/vPXc=;
 b=AHAdJB8jqPxyGlYIbJdyYwL9zuSPtSGyhtZyDCJbAfunl/ciYuVYHImP
 M7TS63O38Yzpxn48UnMFl4RYsiGyEQbaLslFHhGGO7IQ8IMcWGGq7Ljjz
 MFi5D4k/XdMg0wHFIzqC41yC+W192ZWNJ0kxXyu6ZFpHcC/eQ9T4W7AR4
 CyKOP2UBvskRuMPeEJWuKHDJJYtv/o/6JRAkIG76lf6YXqCgAlhHh9Aze
 CFKjWBmCI5TwpNcLn0KDOOWkUZvf5X8fzKx3NXDCV3P58ZfN66e9JbVEc
 iLEpxxlF8UlLHjyoNe1q5JRIbIBgxwklEAlGGgh7Z0aCABuo/Aljg1Daa A==;
X-CSE-ConnectionGUID: 3dfaf2rwSg+B4X9IC0tmAg==
X-CSE-MsgGUID: vmZ4tEs0SsKqRQH+Pb6NTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7514710"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7514710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 22:56:23 -0700
X-CSE-ConnectionGUID: /RaQ0V6xR3SKQhWS2YRM0g==
X-CSE-MsgGUID: kr/D8NYHS2qNKoD5VAJrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18978514"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2024 22:56:20 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 0/2] Add new test to validate adaptive sharpness filter
Date: Fri,  5 Apr 2024 11:26:00 +0530
Message-Id: <20240405055602.11965-1-mohammed.thasleem@intel.com>
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

This test to validate adaptive sharpness filter.

Swati Sharma (2):
  lib/igt_kms: Added "sharpness strength" as crtc property
  tests/kms_sharpness_filter: Add adaptive sharpness filter test

 lib/igt_kms.c                      |   4 +
 lib/igt_kms.h                      |   1 +
 tests/intel/kms_sharpness_filter.c | 666 +++++++++++++++++++++++++++++
 tests/meson.build                  |   1 +
 4 files changed, 672 insertions(+)
 create mode 100644 tests/intel/kms_sharpness_filter.c

-- 
2.34.1

