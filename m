Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F51F01804
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 07:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDBE10E39F;
	Fri,  6 Mar 2026 07:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9HG0j5h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5A710E39F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772783885; x=1804319885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nz9igzK8iYpiTfO5pM/GQMzLRJq3uHAf9BhRTE6AviQ=;
 b=i9HG0j5hVPH+Ozwdp48ltYXz8zUXRjZ8uRxU284buLXDvj3hFapMgmKR
 mvge8gN7kqLjs+wdxxEmpDgnGUPY5vmuUc4Qvk7Dx/y9ZToolswNhnJsw
 Hq0EzF5kRGBpA0LWI+0R5nTVVFY/hLQupY2q8m1xPlPgr+9gMIhJ1T+OF
 AisYh6X8JbVU2gVrXckJjktzEUHBVP/hzCtD1oqbl/eAwOzq6noxLtDPk
 DrA4DIfAR1U6kPM2u6XNvr3Kh3B0uXRrAjCUrjk+nAmAfezYuM3b++t3x
 ktd7W4naglflYZhLMFtbkilYa6sn0E0+sJ/Yfp/VTv8wXHGTxOUsoKh0w w==;
X-CSE-ConnectionGUID: M4o5FOz0TP2nKzG0AJ57rQ==
X-CSE-MsgGUID: qgGGiLShR6WsKuFhOkCjAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73588253"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73588253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:04 -0800
X-CSE-ConnectionGUID: EmOl9AEwSO6sYiAuRkPp1Q==
X-CSE-MsgGUID: cgU3yJAASjaePQu7HK3lpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="215652141"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:03 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v6 0/6] Extend compute userenv to support user passed
 buffers
Date: Fri,  6 Mar 2026 08:58:00 +0100
Message-ID: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
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

v5: updating commit descriptions, no functional changes
v6: fix PVC path, but as it requires pipeline rework limit iteration
    number and fix in the future

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Zbigniew Kempczyński (6):
  lib/intel_compute: Add types for input and output buffers
  lib/intel_compute: Extend userenv by adding input and output bos
  lib/intel_compute: Enhance Xe3p pipeline to accept user data
  tests/xe_compute: Extend compute test to cover user passed buffers
  tests/xe_compute: Use appropriate feature in compute-square tests
  tests/xe_compute: Limit loop count on PVC

 lib/intel_compute.c      | 193 ++++++++++++++++++++++++++++-----------
 lib/intel_compute.h      |   4 +
 tests/intel/xe_compute.c | 159 +++++++++++++++++++++++++++++++-
 3 files changed, 301 insertions(+), 55 deletions(-)

-- 
2.43.0

