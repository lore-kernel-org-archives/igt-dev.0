Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1FECD98ED
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 20:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7D410F105;
	Wed, 17 Jun 2026 20:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNOs0Upz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9810F114
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781727969; x=1813263969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TQw0MSU+Y3ixQY039J5O+/+cdDcfxR74vNrZxi9fOkU=;
 b=gNOs0Upz4vj+ApLPtg9Gs/B1yfzV/aOsufG9mra1YegxLhnTI5XCfzei
 UI61lJSY6DNXcC1Hywxuz0EHz5DLM4uVTjlBOU1AyTOq9bSg0LKUxfBzw
 zXUu5diLkG2IjlCE/OodS6OJ4QZfcw8lbmTqBWMI3Ski3GOu45Jw925q/
 oqaZrhSBsRpJEz5EVK4N4x9GOvWXCCZlBOljpCMWOlNhvcfQzUrmQYPWF
 BZBjludddFFM56psUkB9FDkaju+hnH20Vt7WCk2+G6JQ4D714DgHkzM40
 rxhrvoBUpSY0gJofzyZyUoPFt370xoEOizjzVR9CIvblgwAUHePu/QY9d A==;
X-CSE-ConnectionGUID: OqvEzxrGR4uzoowV4KkaYQ==
X-CSE-MsgGUID: MJZrwdv9SXmrSYeU5fkQZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82736170"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82736170"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:26:09 -0700
X-CSE-ConnectionGUID: nItdvMXbS0CAbWYMLRrfsw==
X-CSE-MsgGUID: FJ27lKMSRDivH9KUkmhq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="252476040"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.127])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:26:07 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1 0/2] Allow intel_reg tool to work also with
 accelerators
Date: Wed, 17 Jun 2026 22:25:56 +0200
Message-ID: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

An Intel tool for register access could also be used for
accelerators. While the device could be accesed by BDF address
with the help of --pci-slot option, allow a tool to work with
default device found on PCI bus. When no Intel display device
is present then intel_reg will search for Intel accelerator and
it will use it for operations on registers.

For reference please look into https://patchwork.freedesktop.org/series/168385/
lib/intel_chipset: Extend intel_get_pci_device to PCI accelerator class

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/intel_chipset: Create intel_get_pci_accelerator_device() function
  tools/intel_reg: Create default accelerator access

 lib/intel_chipset.c | 47 ++++++++++++++++++++++++++++++++++++---------
 lib/intel_chipset.h |  1 +
 tools/intel_reg.c   | 12 ++++++++++++
 3 files changed, 51 insertions(+), 9 deletions(-)

-- 
2.54.0

