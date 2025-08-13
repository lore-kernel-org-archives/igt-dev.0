Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F8CA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 08:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0528889343;
	Wed, 13 Aug 2025 08:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0P+MDSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057FD89343
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755073514; x=1786609514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R0HPNOvLVAAKZOlcutJ4eXvM8GoaFCrEzocyPDzJrqM=;
 b=U0P+MDSeLpSr2HFjw38Wb+YtVYYsgmMfBA0KaokefswDsuWhahnKDBBl
 qqilFst48UXNdkHuawZYB1p8FRY4nScKZ22OtYdh/YbEy5Y25ZATZJF7q
 9sctLcumgaXHWHJSG6tkA9BSXtWvJqit3q4DodSLm9Isp/MsqLUxG2UHx
 CpdAT9s3c7FQqadPN1SLfUTA9dCtctbEEx0YXHxrPVIDyl3BnoclqTGZL
 icw10EY0WZud7DBIT23foMseAc6WkzuYl1p64bYV9XUlkGRCGLv5y6gWh
 YEa19of1rt8ypCRcEyeszCVL3PFXCudHpdGjs7m0vKw4OlnwQNAovlVpQ A==;
X-CSE-ConnectionGUID: AiiEhbN4Ra2xvvsb457vgg==
X-CSE-MsgGUID: FPj0bA6MRH+icw6Ne3xnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57319100"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57319100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:25:13 -0700
X-CSE-ConnectionGUID: ld0t2DCBRTalu318CwyDGA==
X-CSE-MsgGUID: kLQxcXMbT7yoZf1P1C8ePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166293119"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.170])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:25:12 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/4] Shaders migration to separate headers
Date: Wed, 13 Aug 2025 10:25:03 +0200
Message-ID: <20250813082502.371493-6-zbigniew.kempczynski@intel.com>
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

This is cleanup series, no functional change. We want to add
some loop kernels to other platforms and keeping all shaders
in single file is cumbersome.

Zbigniew Kempczyński (4):
  lib/intel_compute_krn_sip: separate sip from the shaders
  lib/intel_compute: migrate compute square kernels
  lib/intel_compute: migrate compute loop count kernels
  lib/intel_compute: migrate compute loop kernels

 lib/intel_compute_krn_loop.h       |   83 +
 lib/intel_compute_krn_loop_count.h |   93 +
 lib/intel_compute_krn_sip.h        | 5051 +++++++++++++++++++++
 lib/intel_compute_krn_square.h     |  290 ++
 lib/intel_compute_square_kernels.c | 6671 +---------------------------
 5 files changed, 5523 insertions(+), 6665 deletions(-)
 create mode 100644 lib/intel_compute_krn_loop.h
 create mode 100644 lib/intel_compute_krn_loop_count.h
 create mode 100644 lib/intel_compute_krn_sip.h
 create mode 100644 lib/intel_compute_krn_square.h

-- 
2.43.0

