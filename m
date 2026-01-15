Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EDBD4114B
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 09:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548ED10E70D;
	Thu, 15 Jan 2026 09:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDnuj5P/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2F310E70D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768468922; x=1800004922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9njnkzri2Yje4vHolDHnXXO0NO2/wXK/iAgRQElb5Jc=;
 b=QDnuj5P/lqa7c0c/fmZOQ4bMKybz+fLkpuU+wVl1lgEUOBP52EP8Gl0N
 MJAqA0JNyr/cmgQjTDy7mbjA4HGi+6SbLBD2oH0m7gy+deMrZoPpLlRE4
 Dp7n6Ol1OeFdy6M2OmChA+QpWD1sJKYtvVEQvjj2EjAO0Mm8yHqvWSIzX
 YAdac4IG/EPkmfmlZljFxj4Gh6JLOjMZjE5PgpBV5562c4GKL1fj8v2aD
 MxqSwsG2UI3j1ALzc+Dpgh537jTkqIX2yLlrrWILiCf5vQAXdTNuCje8m
 eGi9U8RjLS5xCpJHHqIig2qt3WcZ78myDJ+pq1d7F4Y33gnaZh2PFLU01 A==;
X-CSE-ConnectionGUID: 1gimeJmGQeOtWwJeXgtV/w==
X-CSE-MsgGUID: YU7d4mxURiK99sk+CMF5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92442588"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="92442588"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:22:01 -0800
X-CSE-ConnectionGUID: 7N/b1s8zT4qOGbOGz64jNw==
X-CSE-MsgGUID: iaYdaiKuQXGKeLg16Jj8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204936190"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:22:00 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/2] Add missing flatccs flag for NVL-S
Date: Thu, 15 Jan 2026 10:21:56 +0100
Message-ID: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
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

Add flatccs flag and skip render-copy-compressed test if there's
no platform support for flatccs.

Zbigniew Kempczyński (2):
  tests/xe_render_copy: Skip if platform doesn't support flatccs
  lib/intel_device_info: Add missing flatccs flag for NVL-S

 lib/intel_device_info.c      | 1 +
 tests/intel/xe_render_copy.c | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.43.0

