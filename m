Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B184CD4F3C
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 07:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA9910E127;
	Thu, 21 May 2026 07:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhBkluU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6CB10E127
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 07:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779348343; x=1810884343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1pi31w6h5uUpPNDIVjvrQLa+wNa7HI0qonmtRAMo7js=;
 b=OhBkluU6S2IapjVsUlFMV9dUM45/BaqocBGnh5z0O0ttA7rwuhAXcSSz
 LAg6DPAaSeLwsTvhdw99rrKztyFCY8v7yL+DKfUq6vMpS22n1j2XDiHq8
 GS2R8oGB8vePo4ZeRSm1JhrMsoPXbgwM+GH5UApLPALmkdW/WnJzupVKZ
 KsMhYFspHt7mXdjILzPEz5gYPeMPYkEBRdkF9c/b/38wr8jt30Gz092i3
 rsME1kh0moyU7fr1+XCk1Ql9GBZs2Fs2sjJqLi2wRrSkRdbcftgUJTSem
 3W0Wqhen1hWC3TY6eUoZXOs2Qvnz2kCVT0N/Tz3YQOO5armekNNaHv4XN g==;
X-CSE-ConnectionGUID: V3vyDq2wQ9yArSXLs8iotg==
X-CSE-MsgGUID: BMuyN0/wR+uJi0tYk+aGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91653728"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="91653728"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 00:25:42 -0700
X-CSE-ConnectionGUID: sRbQ2JlOQryBE582DF57gw==
X-CSE-MsgGUID: xPrFg5hUSFqQr4fx9ocY4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="240311585"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 00:25:41 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 0/2] Update pre-Xe large-buffer compute support
Date: Thu, 21 May 2026 09:25:37 +0200
Message-ID: <20260521072536.796712-4-zbigniew.kempczynski@intel.com>
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

Introduced large-buffer and SVM tests causes failures on pre-Xe
platforms. Update compute library to fix this behavior plus alter tests
to skip SVM tests when vm doesn't support fault mode.

Cc: Francois Dugast <francois.dugast@intel.com>

Zbigniew Kempczyński (2):
  tests/xe_compute: Skip SVM tests on platforms without fault mode vm
  lib/intel_compute: Improve executing large-buffer compute on pre-Xe

 lib/intel_compute.c            | 68 +++++++++++++++++++++-------------
 lib/intel_compute_krn_square.h | 36 +++++++-----------
 tests/intel/xe_compute.c       | 17 ++++++---
 3 files changed, 67 insertions(+), 54 deletions(-)

-- 
2.43.0

