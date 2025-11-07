Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0F2CCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189510E1C5;
	Fri,  7 Nov 2025 12:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aguaqPcR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67910E0AA
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518273; x=1794054273;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=mLp9+62nTXXBxX/MbbM31+VhBYzIv8zXaO2efYIkHm4=;
 b=aguaqPcRJp2noIlhtWC7dazXcn2etYWZKZvw938F5xZmA0fJFdj+mDX8
 vagUKfvuL+UUP8hhpyFy1dg4mG4t/q9qKLmK//y9Nvzko2IY6j3pDvb+N
 XAD6YXaCRNjZrVEjv3oK/G07PDjcUOFSTkAA4N3swfNmrZ/UL4dPjDlDz
 WL5ZrZbrWdqEW4hnN4UYg7zA6S7xr04mB9te2vooGJgaNqhKj6RN6N3fX
 cjI0HnrHTYvSqlVp0IMUOarbJViHfc7uBxjxGnzHXF2nnpW7WL8QuYPyz
 RCABgr1sThjW4sq0BQyaH5vK2irPQCyb+2EGsubD8108CDlxvRVV7IcEs w==;
X-CSE-ConnectionGUID: 6OI2jhIuQgi13LaDynn38g==
X-CSE-MsgGUID: WRXCLmP8Sw2XF5E5aQ1DVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365671"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:33 -0800
X-CSE-ConnectionGUID: M/SoVjclRaeks4SCJHv8Cg==
X-CSE-MsgGUID: L8MPHuEnQUWDIXG3gDM+ag==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:32 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/8] lib/xe/xe_query: implement few query helpers
Date: Fri, 07 Nov 2025 13:23:13 +0100
Message-Id: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHkDWkC/32OSw6DIBRFt2IY97WC1E9H3UdjDMJTSRQsqNEY9
 150AR2ewTn37sSj0+jJK9qJw0V7bU0AdouI7IRpEbQKTFjMnpTGKaxYfWd0W9VhP6LzUAhe8IS
 pnOWKBG102Oj1Sn7KwLXwCLUTRnZnqOaPUbTYiLmfwBoE28AgzHaqnfaTddt1ZqFn4M/uQiEGl
 aVUFJxLlmRvbSbs79IOpDyO4wexa61A2wAAAA==
X-Change-ID: 20251106-xe_query_helpers-9a49432d828d
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=mLp9+62nTXXBxX/MbbM31+VhBYzIv8zXaO2efYIkHm4=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS57PVX8pHNe2gDsk/oAiCOWbsmHg65P9Alh
 7vZGX6nSmWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kuQAKCRAjYrKT3hD9
 1z3VC/9m3Y2G6xdl/++pX6nYmGCaOzERhAcToc90PeP10Myh9njPWhiJ+fBUjSBGx7Ihq/Wmnsb
 4cEwu2HGMac7ZLwcDxokwqZtUemu5lW4GKMjRdWzWV/hmK2MvRx+6GKBuxedfdJs81YFC0TwBm4
 rtt0s7WRdFxRpXcAdgvYnxTMjEl5stR5DlPTsZ6S+YC5VblswKqcg1ALw0YoiTjbW9RF2ekJ7LR
 eGgUrrhGnxCgC3S1jwcpyOhDr/IzT4Q759p5kmPqNsH3lPqcqycumqmuGeQqyHKihjibIytm8XE
 ww/yQ8VR35ToCzJ80PBpASFHbehTZtYxUyEsd6uieTIH9Zeurpnpqfib1bDRGjHY9kOpra2DFU7
 6XygfP9LrhdjidPybV/ilYDrv3ena+SsU57UIfmyGQOgZqNrP61igYKsGJDt3+Ur4jJDztnBiTv
 EygjdkMOs1duXWM3AHQASlYs37aAra9Ek6cziHRLowZfjx1sBK6UT/ncbZQQ6AY1BkrMI=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

This patchset adds following helpers to xe_query library:
- xe_hwconfig_get_u32 - to get single value from hwconfig,
  similar helper exists in kernel,
- xe_query_device - encapsulates common code around DRM_IOCTL_XE_DEVICE_QUERY,
- xe_for_each_topology_mask - iterator for blob returned by DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
Beside adding helpers patchset also shows their usefullness.

Cleaner code and diffstat of 85 insertions vs 282 deletions hopefuly
proves usability of these helpers.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v2:
- add xe_query_device arg to allow fail without assert,
  because EU_STALL and OA_UNITS are not implemented on old platforms,
- also return NULL if data size is 0 - case of hwconfig on old platforms,
- split first patch to implementation and conversion,
- Link to v1: https://lore.kernel.org/r/20251106-xe_query_helpers-v1-0-d761a944c237@intel.com

---
Andrzej Hajda (8):
      lib/xe_query: add helper to get first value of hwconfig
      tests/intel/xe_eudebug_online: use helper to get hwconfig value
      lib/xe/xe_query: introduce helper for device query
      lib/xe/xe_query: use recently introduced helper to query device
      lib/xe/xe_query: introduce iterator for GT topology masks
      tests/intel/xe_eudebug_online: use xe_query helpers for query GT topology
      tests/intel/xe_query: use xe_query helpers for query GT topology
      lib/xe/xe_oa: use xe_query helpers for query GT topology

 lib/xe/xe_oa.c                  |  37 ++-----
 lib/xe/xe_query.c               | 218 ++++++++++------------------------------
 lib/xe/xe_query.h               |   8 ++
 tests/intel/xe_eudebug_online.c |  41 +-------
 tests/intel/xe_query.c          |  69 ++++---------
 5 files changed, 91 insertions(+), 282 deletions(-)
---
base-commit: b35f18b8bd2b3b18332e7db550e5dde851d7a8e1
change-id: 20251106-xe_query_helpers-9a49432d828d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

