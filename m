Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D29FF327A3
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 05:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8410E7CD;
	Tue, 21 Apr 2026 05:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGu8EDOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2C610E17D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 05:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776750611; x=1808286611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=usho2dnkxdvllUjGYHyQcc7gBL3qOc+P1/WNlv8cpNI=;
 b=gGu8EDOzBeRh9rjnZnoqloeR0X5ANCLuPxibYwyv376iDuq0bKlDDmls
 Vqzrlpf0cfLdiu4yvzqxb8BojN5qCQ0Ucj9Sic6/ACDsHmIhPYmoRRfrC
 wXDiPx6XT8Je8N9EAoqIQk+foox/TRHeScyzxdttJ3Bob+EHpHqWiWK+T
 QF3TaM6Efh2/hFgJscC9/d8qdfN2h+7fFQYrJyc3xzfKYoqbsI5hlghLe
 5IppOukJOLXYhGGbpEkZCnB5kZP2yB+FQJ9uNS6NAiOVCKUzHUTX40JqO
 EujIrIgvH3F4yq9Jujhfn3FVSAFTtxSeYph/ejcrSL5qeQ7bLVuFQubV4 w==;
X-CSE-ConnectionGUID: rP8Rq22WSJ6GZ6iSR40Pvg==
X-CSE-MsgGUID: CB49QeX1RvK+uD8RgNZQ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81288124"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="81288124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 22:50:10 -0700
X-CSE-ConnectionGUID: dHzypMeeTWq/jHMyeums0A==
X-CSE-MsgGUID: RRJnhltJQNOr3vaNGRooxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="225449826"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 22:50:08 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/2] Fix 2-display test for MST shared-link BW
Date: Tue, 21 Apr 2026 11:41:12 +0530
Message-ID: <20260421061114.2262809-1-sowmiya.s@intel.com>
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

On MST hubs / daisy-chain setups two display streams
share one DP link; a joint atomic commit can be rejected
by the driver if the combined mode bandwidth exceeds the
link capacity. The driver therefore adjusts per-pipe
settings (for example reducing pipe bpp and enabling
dithering) when both streams are committed together,
so tests must pick a mode combination the driver will accept.

Sowmiya S (2):
  lib/igt_kms: Add MST bandwidth-fitting support and helpers
  tests/kms_plane_multiple: Fix 2-display test for MST shared-link BW

 lib/igt_kms.c              | 33 +++++++++++++++
 lib/igt_kms.h              |  3 ++
 tests/kms_plane_multiple.c | 87 ++++++++++++++++++++++++++++++++------
 3 files changed, 109 insertions(+), 14 deletions(-)

-- 
2.43.0

