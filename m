Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8CBD35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 09:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D824210ECC4;
	Wed,  1 Apr 2026 09:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mhzw33Yv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FC710ECC4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775034626; x=1806570626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E5NDpbcQuG6RHNf3g2r5VQXwPUr4tWpO+We26cYeifg=;
 b=Mhzw33YvPxUrjSZ4T73XDTXMdi5RpYAfRpXNjaFaJRP5sVZCm3v45Vu1
 i7DEK8MEkkziyRuG3rEwjI+mIoOPP4QyhuGIvOX1rcZLhiZEc8DxCKcYX
 kUSmljpL1pDmNNueKlU0C25p9G+FS0/gx87Z3tSvl8TjeaiNfOG/9iasC
 xwAixEfZ05PMkMShATgy7HczrjUD3v9VE94WE2WGBM4VaroDbvI54B0as
 q7cvKX50VvfuvXkPpyzJ7E5C1LGUBPDvp/y7UJ9+z4XNw4Z4eH7M3ISkk
 WBPj0ZjZsa0C4mMLaX2D6p8FgGOFP/lfQpgnW8Bzq6RwL2DoZI9+bO/c8 w==;
X-CSE-ConnectionGUID: loMe+kB/TuGTBnxZt48+dQ==
X-CSE-MsgGUID: s51FDvcdQVGF71thH2X6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78659420"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78659420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:26 -0700
X-CSE-ConnectionGUID: rWgAe3wORFa1ZsUG0DqLZA==
X-CSE-MsgGUID: U3OBgY8jQNS6GxVmDl0++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222255522"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.181])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:25 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 0/3] Exercise large buffer in compute-square
Date: Wed,  1 Apr 2026 11:10:18 +0200
Message-ID: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
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

We need to check large buffer are properly supported in different
pipelines especially when passed via userenv.

Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Zbigniew Kempczyński (3):
  lib/intel_compute: Print handle in list of bindings
  tests/xe_compute: Don't use FAULT_MODE flag when not needed
  tests/xe_compute: Exercise larger buffers passed from the user

 lib/intel_compute.c      |  4 ++--
 tests/intel/xe_compute.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.43.0

