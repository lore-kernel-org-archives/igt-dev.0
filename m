Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6884FC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 15:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED07210EAFB;
	Fri, 16 May 2025 15:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLUjfs06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED5210EAFB
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747409864; x=1778945864;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N8xi3hDJLywUxeFt0vWbm6t5ORQeZgLZ7PH89GrtlYE=;
 b=JLUjfs06H/ssK9HWtwTYdu0OSN791tyP0iC3d+92VT5gvZANGbJu0hpP
 OHDWTsbjkVDjjlF7vuiGkzBWYqpD97gagYHTRAiWlFFIGaYIIy5o9QR+r
 kpMAF4WhpB02q1mhB62PF1F5sZ9aIWvQdIbOP8TMXv5OIk8VYigt8T0bJ
 iUhmuPqi8rfwIMxxaz4oIGPIcmP/PJ7PMa/8vIKJqwsBTcPMN0CBRcEgC
 K8fxhMgGX7qVxHBz70a3Q1cxe1FUdCVJQgLYbqz+Fo8aPXHiizjEif7lY
 CM/N9++BvV7RyAPT6GivX8vtqGLoquXmG/HliNg87sQKs03q14T6c5PJx w==;
X-CSE-ConnectionGUID: VLGUwYUMTq+c6tdLozQ44Q==
X-CSE-MsgGUID: 1Ri9Qa82SXiBqa9IYbAWTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49542224"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49542224"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:37:42 -0700
X-CSE-ConnectionGUID: fkm0GN6TQE6hvSNhHsDu0A==
X-CSE-MsgGUID: km1OGavWSPebuNAn6tY8Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="142726592"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by fmviesa003.fm.intel.com with ESMTP; 16 May 2025 08:37:41 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_mmap: Acquire rpm ref for all
 pci-membarrier tests
Date: Fri, 16 May 2025 21:25:31 +0530
Message-Id: <20250516155533.2786246-1-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
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

During the test, the device is entering into runtime suspend, which is
leading the device to d3hot or d3cold mode. Hence the read is giving
a special value 0xffffffff.

To avoid this issue acquired an rpm ref to keep the device awake
during the access.

Kolanupaka Naveena (2):
  tests/intel/xe_mmap: Acquire rpm reference for pci-membarrier tests
  tests/intel/xe_mmap: Fix open/close calls

 tests/intel/xe_mmap.c | 63 ++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 27 deletions(-)

-- 
2.34.1

