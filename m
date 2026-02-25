Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFCAFD45E2
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 19:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90E510E376;
	Wed, 25 Feb 2026 19:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVUaxMBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34FC10E376
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 19:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772048667; x=1803584667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1CJPdF5NRjRjLCZtLn6bs2TgYaa1A3zi+IoMb+jrwk=;
 b=fVUaxMBO2bSpQVVsP04H386cHpOXkWKuRw1mHutjYRUoSvCdpQ37QR2v
 GLqydBYhj5fn5rrF/BFZTO9wS0KKt2ln41gbXo5EKybGbRiaot4ceLfIl
 lTX7sX3nFfe5IqRNIy6P690kO5+J/wGs90b8WILO+Sjyaq/pumuoTBLUc
 DkVaIX1XvhpuYd5EUsV7d1irXvy5qwNowrjmhGCRvVIsLuFcJMDUz9/Ge
 LQzK6v3UYnsH4eIjFO/ME6wXhnPzN5SGUdxsn8ieJBAJ3ANGpdiFskpPu
 PPzX5zQYh/KpUu/HxvQ7zMM4FS44ugUy55NlINOcTnH5XsKX8Y/UbTjvb A==;
X-CSE-ConnectionGUID: njxOsDz9QDa+ysyVitc+/Q==
X-CSE-MsgGUID: +xPQrThKSpyfDxIPszON3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73277500"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73277500"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:27 -0800
X-CSE-ConnectionGUID: JEP2ekBtRuWKyVcurPnYVQ==
X-CSE-MsgGUID: 3OWncTkSQa2hVqA2VHWWZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="215443690"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:26 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/4] Extend compute userenv to support user passed
 buffers
Date: Wed, 25 Feb 2026 20:44:22 +0100
Message-ID: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add support for user passed buffers in compute userenv. This allows
users to pass their own input and output buffers to compute tests, which
can be useful for testing specific scenarios.

Cc: Francois Dugast <francois.dugast@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_compute: Add types for input and output buffers
  lib/intel_compute: Extend userenv by adding input and output bos
  tests/xe_compute: Exercise user passed buffers
  tests/xe_compute: Use appropriate feature in compute-square tests

 lib/intel_compute.c      | 156 +++++++++++++++++++++++++++++----------
 lib/intel_compute.h      |   4 +
 tests/intel/xe_compute.c |  63 +++++++++++++++-
 3 files changed, 180 insertions(+), 43 deletions(-)

-- 
2.43.0

