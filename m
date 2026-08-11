Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B856C5B56A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 14:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6073710E0CA;
	Tue, 11 Aug 2026 14:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blrI9sz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863210E0CA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786457689; x=1817993689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=78Z8H5DbicYAJg5RzE2PYRMKQpwO8ReqXrhsExKLzww=;
 b=blrI9sz8tISHjNuyfWi8sF1EFYmNLzCd2vC+j1xLdGyXivVgm0Vzndec
 bdAmIFtc7ev7+djSGCOeF40RXsT9zl9CooLVqKN0upLRO4i8c0W2hKWm4
 F9TDyCptP1wOe2M29MASOQWIWpmqK4THOaACvkLVolkAktFT3oydEEM0O
 mIyxD/DmtCSISOjlw/bOwijyWGm/rB6hxyd1NrH3lte5sIJ9Sdczh/E+E
 gGzrL5NOHopvw0nnd/BFNycWhdTxMWOIATyh3Y/GhFRm0QwzxO5IX0Kjy
 NZwpdSy0oL6fgtUaAS5hCT+2tq79NwXBc1K5eK6KEer3ctYTjVkEKGfbU w==;
X-CSE-ConnectionGUID: fUELUKFxRiOQmA+RWYnmyA==
X-CSE-MsgGUID: KBvQSkcKSG2uyo9gBdAk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74524252"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="74524252"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:14:48 -0700
X-CSE-ConnectionGUID: 3FIGETTiT1yyAwPIcjU1Tg==
X-CSE-MsgGUID: 4SVHhALtTAuzZHp+20MrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="301570254"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 07:14:47 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v1 0/2] tests/device_reset: Add Xe healthcheck to post-reset
 validation
Date: Tue, 11 Aug 2026 16:14:24 +0200
Message-ID: <20260811141426.1642321-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extend the healthcheck for Xe devices to validate basic command
submission after reset.

Lukasz Laguna (2):
  lib/xe/xe_device: Add helper for device healthcheck
  tests/device_reset: Add Xe healthcheck to post-reset validation

 lib/meson.build      |  1 +
 lib/xe/xe_device.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_device.h   | 11 +++++++
 tests/device_reset.c | 13 ++++++--
 4 files changed, 95 insertions(+), 3 deletions(-)
 create mode 100644 lib/xe/xe_device.c
 create mode 100644 lib/xe/xe_device.h

-- 
2.43.0

