Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9B2CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 12:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1732810E476;
	Thu, 18 Jun 2026 12:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFJW1TZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842910E476
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781786194; x=1813322194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S0nsz87BXygltH874fC6MCRLEhtzACom5l6Un6SOOnw=;
 b=WFJW1TZTExSvtXj0xi2PGeLugnw4Y89rqh7QMSDIGL0Di1hdFztmBXTn
 80OiML49RgojF20hFfx1mSWJEaEg4r1r15uyN1V2b+uk4OquyAbeh+XcQ
 BExg1YkEi5rRVspK882llMYSGYqKSsMWJADoyGZlflc37DZRVJpH85mX1
 OU76RwfuGezlsjm55cwVc//apel3yCAW3CfP4sJbVO2JYMASseFAJdb1M
 iCEqEcvfl2yTZzZ+OY63easuL5f3AUo/1RviWPgMsUTbv4AkHdunYmXH3
 arqBRz+Vn8SeQGnPuQ8jmjxZRkhVU5oK+fKCiXvzezG514zFczl17bjoN Q==;
X-CSE-ConnectionGUID: vpRLXOCUQP22Bwd0MvD9LA==
X-CSE-MsgGUID: 2pvIkt/BR46txZWazo4WVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="92955800"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="92955800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 05:36:30 -0700
X-CSE-ConnectionGUID: 7K6QFiUUTimPEak+/UieJA==
X-CSE-MsgGUID: J8iQrdXEQpG0rThK1E15Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="286479104"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 05:36:28 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] Allow intel_reg tool to work also with
 accelerators
Date: Thu, 18 Jun 2026 14:36:20 +0200
Message-ID: <20260618123623.68006-1-kamil.konieczny@linux.intel.com>
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

v2: removed printing info on success (Jani)

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
 tools/intel_reg.c   |  7 +++++++
 3 files changed, 46 insertions(+), 9 deletions(-)

-- 
2.54.0

