Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD69ECD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 06:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6694210ECA4;
	Wed, 13 May 2026 06:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7Snwc/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D41A10EC91
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 06:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778653005; x=1810189005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TFl5iaAcZyEMAN0CM1/Rlm2VRTrKcOwlMSVjV8WMzys=;
 b=L7Snwc/B4cqAONtrDnqrC4VtaneeJcYEgT14x5P1LIoIR4HTbIChkjj8
 0IvZxZgjUysXOtUyYqdVkrEOIhPlYKWDx7lDXCnVnki6OyruOa6gEIm6z
 ByhBYj7hBf1+bTV31sDZlPiSXOevrRB3bz534DPniytzMcnBCscyJRKui
 aDdP3xo4beZLrLMgsMoH63DCFuscROSGiIcuWNrLIhsABn7WeZwuYI1u2
 djhTSfO50sYTZv5OdtgsMH4bS6IwGVIXiClfSwI72J4LxBnpaitiHawUf
 E7aKg4F8d2daL0xp2n+ZSZpyeq6rcOGLA3i389urfeyYg3WdEvxk41pOh A==;
X-CSE-ConnectionGUID: grW6xofRRJWqAMKjEqTSng==
X-CSE-MsgGUID: nfx0YzqARtW5xTsuKLIN3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79524875"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79524875"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:16:44 -0700
X-CSE-ConnectionGUID: 23yWGR0RQB6viq1fhNyFNw==
X-CSE-MsgGUID: uIMgMH9CRW6B8FN7HcXB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242341796"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:16:42 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 0/2] RFC: Add preferred FB modifier helper
Date: Wed, 13 May 2026 11:45:00 +0530
Message-ID: <20260513061503.645278-1-jeevan.b@intel.com>
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

Add an IGT‑internal modifier, IGT_FORMAT_MOD_PREFERRED, allowing
tests to request the preferred tiling format without hardcoding
driver‑specific modifiers.

A follow‑up HAX patch updates kms_cursor_legacy to use this modifier
for cursor framebuffer creation to exercise the new code paths.

Jeevan B (2):
  lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED helper modifier
  HAX: kms_cursor_legacy: Use IGT_FORMAT_MOD_PREFERRED for cursor FBs

 lib/igt_fb.c              | 71 ++++++++++++++++++++++++++++++++++++++-
 lib/igt_fb.h              | 19 +++++++++++
 tests/kms_cursor_legacy.c | 31 ++++++++---------
 3 files changed, 105 insertions(+), 16 deletions(-)

-- 
2.43.0

