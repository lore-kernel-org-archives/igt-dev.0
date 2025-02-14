Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84116C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 12:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFFB10E316;
	Fri, 14 Feb 2025 12:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/aGHzLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A510E316
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739537226; x=1771073226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WvSJF3trBTg0F/Ti1SY2sMxUqKPprQ1IEq5Cm1+vte4=;
 b=Q/aGHzLkpDzzL5WkD0EaWupwYssmXWUSHHZhEgXnW6OBo3XC22o4HLWz
 kREB4Ep2xfKs3fFcAwcPcBhaHg0wFXFtGSqxJQJQxaHQqFRJo5ntnHm0y
 kCqjKt1qs1A4stniQkTJ1x809AyziSmzdiFc+FSFaeMu3i/Sk4R8EkVkG
 E5ztKScXkj7j+FZhOeaVY6ymu2SrS4rgXsGo3M2ieYIgzL58wKiaUBp2O
 bKl5L3cjJjhrAqZHLLPFy3oMCxVoBPCB/GChkzLb+9PNI/8pA6Qz3cauP
 rjSyumO2ZlddrprXTP7sWhRgYUsPJCPClUExis3y+BfMHrO80AFxcNk4M g==;
X-CSE-ConnectionGUID: /QDiMzMFSGuR9F6tOlVF9Q==
X-CSE-MsgGUID: PEQN5ZGMQTWUHjyNjBQb/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="62749297"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="62749297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 04:47:06 -0800
X-CSE-ConnectionGUID: bSCU92CIR8aVFGYjpqn8tQ==
X-CSE-MsgGUID: ve/J0uCXSPiGbrqlXwm49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150625096"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 04:47:02 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
	Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
	Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
	Laguna@freedesktop.org, Lukasz <lukasz.laguna@intel.com>,
	Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Mika Kuoppala <mika.kuoppala@linux.intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 0/2] Ensure that SR-IOV and eudebug are exclusive for Xe
Date: Fri, 14 Feb 2025 13:46:41 +0100
Message-Id: <20250214124643.20908-1-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Ensure that VF provisioning and eudebug enabling is exclusive by
returning EPERM on attempt enable one of those features while the
other is already enabled. Check that enable_eudebug sysfs entry is
not present when the driver is loaded in VF mode.

Since eudebug KMD side is still in upstream review phase, the related
kernel side change can be found here:
https://gitlab.freedesktop.org/miku/kernel/-/merge_requests/1

Christoph Manszewski (2):
  lib/xe_eudebug: Export __xe_eudebug_enable_getset
  tests/xe_eudebug.c: Add subtests for eudebug/SR-IOV exlusion

 lib/xe/xe_eudebug.c      |   4 +-
 lib/xe/xe_eudebug.h      |   1 +
 tests/intel/xe_eudebug.c | 123 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+), 2 deletions(-)

-- 
2.34.1

