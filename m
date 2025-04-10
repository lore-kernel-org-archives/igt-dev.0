Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D763C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 05:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E410310E35F;
	Thu, 10 Apr 2025 05:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgkjeaiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8120C10E35F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744263938; x=1775799938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P0aV5yDejhuSjanvCcZiMMLDJKL+TIcWEdCwh1c29nU=;
 b=JgkjeaiV8Su4HCCNyIFRVFTlgqU2mAPu1pHsQEJpDzBwp9amelfflS0i
 jh9AV2l26f3umRus0JC+ScgMeDjN0ETYII8RJSC6vl6XQYHa64JZmzear
 6ROLoda8ykvok/fH441QX/7f/joJyDT2D986R/waQc/I41YssS3UtwAwk
 Bf9rAGUem3zmHXlitIngmzb8w5WmKxE7nmZv29sjm7NRgStld+MHPNDpg
 iPBduHyj27xbbxuJ2v4kJxu0XbU4JLsGCKlfb2g8syirVMYdp9wx84Iaj
 8IahoDoJICRpQEqbjPau9twPI0a+FJhzY9RrOrFNEsxq74Tkre5E7j3kL g==;
X-CSE-ConnectionGUID: ih7MR8nlSMyk7HuDjFHHJw==
X-CSE-MsgGUID: nbqwJuQLSG2VwRpKXTAgAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44902872"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="44902872"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:45:38 -0700
X-CSE-ConnectionGUID: RutU9NiZT2C+6rBpUe5A1A==
X-CSE-MsgGUID: sY3Aus3nRvutjHSvzipNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133765956"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:45:36 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t 0/2] Add test to validate survivability mode
Date: Thu, 10 Apr 2025 11:37:24 +0530
Message-ID: <20250410060727.1857299-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add tests to validate survivability mode using configfs attribute.
This tests unbinds the card, sets survivability mode and rebinds
the card. The card enters survivability mode if supported.

Riana Tauro (2):
  lib/igt_configfs: Add library for configfs
  tests/intel/xe_configfs: Add survivability test

 lib/igt_configfs.c        |  88 ++++++++++++++++++++++++
 lib/igt_configfs.h        |  13 ++++
 lib/meson.build           |   1 +
 tests/intel/xe_configfs.c | 138 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 241 insertions(+)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 create mode 100644 tests/intel/xe_configfs.c

-- 
2.47.1

