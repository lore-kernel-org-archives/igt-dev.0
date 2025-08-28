Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3535ACA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 10:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E898810E1BE;
	Thu, 28 Aug 2025 10:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uxvi1NOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC60710E1BE
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756377688; x=1787913688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nRjLBubUXedFOrMdsq9cMTvjMbMOmFZSScYVBChC51A=;
 b=Uxvi1NOqQ26ff4eI84fOyuEyErofQIMGn/ZkuLSMmeKyb6X0/cK+Gk8j
 U7HJewObIknex1aJfLZoIezHESt0FNluCvrRyUqIqO1PnwmHVkmS31pLP
 FX2BKgo0RfxqmJib0cZ0/Bx3QDC2+xAt7vFEimc2KEcewSsR08S9MfXZe
 opgQdSapPY2Ql6z2JpPq0kkyyZdKVm900qctkiPGzEWMbEEsLC2sm0ZWK
 uS+HVVmdu2k7gZQ7Mpm2W9uDwZ943TWGc3TpIS0M4GqiIxU2acXqaHU/M
 F21I9OWmPunBP21ykKhD7tdNMmqhzDeyaFBdMtQY4jt8JYNDzW3ZKTSK3 A==;
X-CSE-ConnectionGUID: BLc98clVTTSDpIPgUhlY/A==
X-CSE-MsgGUID: JIhXcj79QDyO9saIQL5dZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58743296"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58743296"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:41:27 -0700
X-CSE-ConnectionGUID: nYnBdIM0RgSZeISr3IJqnA==
X-CSE-MsgGUID: Qn9nlj3NQt+XQGXeJ1yoeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="201044139"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 28 Aug 2025 03:41:25 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 0/1] Skip PSR when disabled
Date: Thu, 28 Aug 2025 12:43:10 +0200
Message-ID: <20250828104311.1279788-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of v1 [1]. Took into consideration Jouni's reviews,
both on IGT patch [2, 3] and on kernel patch [4]. 

This series is expected to fail on CI, since at this point no
tag should be added to this patch.

[1] https://lore.kernel.org/igt-dev/20250715113822.831686-1-michal.grzelak@intel.com
[2] https://lore.kernel.org/igt-dev/e73166b7224f538d3773bde6c21f2ddcfd94e17a.camel@intel.com
[3] https://lore.kernel.org/igt-dev/49470c32ccc3d613a81fdc7a1292c7f96e823088.camel@intel.com
[4] https://lore.kernel.org/intel-gfx/c5683e8ebc687b7e669ae3950cc16108ba9397cc.camel@intel.com

Best regards,
Michał

---
Changelog:

v1->v2
- drop whole patch handling output passing [Jouni]
- drop changing igt_debugfs_simple_read [Jouni] 

Michał Grzelak (1):
  lib/igt_psr: Skip the test when PSR is disabled

 lib/igt_psr.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.45.2

