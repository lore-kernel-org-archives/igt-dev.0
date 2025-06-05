Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE111C5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 14:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFF210E056;
	Thu,  5 Jun 2025 14:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxMzFypL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52FD10E056
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749133735; x=1780669735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ok4a0Q+qvQApi8AOQ2q+lDJ8FC1koxZk8pciNSD9pw=;
 b=BxMzFypL3eUAULr462qMiBsZiv1JClPuR2l6sEGh0BtxbVxDgk6mY85K
 yssTjfvCvJzSpwf4t21XLO320RaUMCfkhF4352jWcm7xr5Yt8Qh/JFebU
 bjlXhl39lJt3BkCsTZ/ziTX/pSGxlDe+IXIaY/nurrX25eb88eYrEMO0A
 w+by+s/PDQsy78O29OCB+NnqWRQ2myOZ7whmI90ma7Lc2GMLwEVm+s6ZU
 dFh2ONYmmLdDSIGQWghy2g5rJd9SOSbf8Bul68rRZYlt0vn0NGnh0eVnx
 eCxDDIoGxDYT3AXAOlaS3IvU+b2ZjxRb/pHSmeQDsV7mR6NY4q9cvPU2v g==;
X-CSE-ConnectionGUID: cH+C4QoxQFy8R3Whahi4uQ==
X-CSE-MsgGUID: LRzRyXz4SoiItUnMyV2Pww==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="50954435"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="50954435"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 07:28:50 -0700
X-CSE-ConnectionGUID: Zg7dpb0kQWu13y95rPzqkA==
X-CSE-MsgGUID: GTnljVSOSlePSsgzES5pxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150406821"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.2])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 07:28:48 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 0/2] Control compute-preempt bo allocation
Date: Thu,  5 Jun 2025 16:28:25 +0200
Message-ID: <20250605142824.380177-4-zbigniew.kempczynski@intel.com>
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

Compute-preempt on BMG reveals some bugs related to oversized
bo allocation. This happens because memory limits for objects
allocated in vram are taken from system memory - what is wrong
obviously. However it should work as well even if this exceeds
vram size and causes eviction.

First patch in the series makes all platform starts to use
system memory allocation for compute objects. Second patch
extends testing on discrete to use vram objects.

Cc: Francois Dugast <francois.dugast@intel.com>

v2: rebase (conflict in printf() + missing igt_debug instead igt_info)

Zbigniew Kempczyński (2):
  lib/intel_compute: add alloc preference for objects used in compute
  tests/xe_compute_preempt: add compute preempt on vram bos

 lib/intel_compute.c              | 91 ++++++++++++++++++++++----------
 lib/intel_compute.h              | 15 ++++--
 tests/intel/gem_compute.c        |  3 +-
 tests/intel/xe_compute.c         |  5 +-
 tests/intel/xe_compute_preempt.c | 88 ++++++++++++++++++++++++++----
 5 files changed, 157 insertions(+), 45 deletions(-)

-- 
2.43.0

