Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D944CFCC9C2
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 05:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4728610E1F0;
	Tue, 10 Mar 2026 05:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luIbTb8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E4510E1F0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 05:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773119928; x=1804655928;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xIJeEUCRTJONDieux4XbCEUzSFVOIedR6urc/21KHms=;
 b=luIbTb8KrWFfuDIn7RrICFE+W3Tg8VEZuPn9Iv/s0G+Mt2IEnb76LRVN
 7eTz6mA9xUSbJPoIKUtulytge48OPjew5uqynz7cIzF1OW3H7447X7cr3
 xGqoxCnMh6B0gcLG0RlJUg2QfJVKS2YLga2KwB4Se1l52GelvssLKwszL
 JVsa2JnnRz+q02TVnrrhbIx70Byt7LZ0mQMiayDv5xxtAK+MXS4wXr/3b
 g0uihVr60ysaMQRKoCndJUir46aoG+N1tLcq7bVHYGtlMcevd2l3mJawL
 c5/vRIe9U/BZyTpd3X7UMqtPTcyYM5OCwUv7daKPRdQzMOf1TVuX2YVXW g==;
X-CSE-ConnectionGUID: SaQNIXO1TLCdvkNDEqz9oA==
X-CSE-MsgGUID: FMGtupP5TdeXo4l29RNCUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77763959"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="77763959"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 22:18:48 -0700
X-CSE-ConnectionGUID: YQQwByTVRymsPkEQA9iwpQ==
X-CSE-MsgGUID: 9+LUr8dxRRCO8FJ2kTyaew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219937050"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa009.jf.intel.com with ESMTP; 09 Mar 2026 22:18:47 -0700
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] Validate compute walker notification
Date: Tue, 10 Mar 2026 10:48:41 +0530
Message-ID: <20260310051840.2885701-4-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test to validate compute walker notification and update libs related
to compute walker for post sync.

v2: Resending it as dependent lib changes got merged.


Priyanka Dandamudi (2):
  lib/gpu_cmds: Add support for compute walker interrupt
  tests/intel/xe_non_msix: Test compute walker interrupt on non msix

 lib/gpgpu_shader.c        |   4 +-
 lib/gpgpu_shader.h        |   2 +
 lib/gpu_cmds.c            |  15 +-
 lib/gpu_cmds.h            |   9 +-
 tests/intel/xe_non_msix.c | 301 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 6 files changed, 326 insertions(+), 6 deletions(-)
 create mode 100644 tests/intel/xe_non_msix.c

-- 
2.43.0

