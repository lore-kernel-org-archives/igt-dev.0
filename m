Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDB1CA5FF6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 11:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F026410E3BF;
	Mon, 19 Jan 2026 11:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6er786a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A3B10E3BF
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768822512; x=1800358512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=snzdwX9QRW0MD4z9Mj2Q58p1ZDhDU9NNjjkn1TI//j0=;
 b=G6er786aRghk68SHTJtc8zrpvT5unR7a0FpTEo+LuGAGZ1Apgs5FIVOm
 YfFeY2bn4Lb15lHNlYd1TL8G7SUVzfJnMfu4GmFWj4MWlhBJQuyW2nhRc
 v9yipYe1VRwQ4GtjRgH2D1Tpi7wTFtnXqU6DcvE4hRXV9QreLJzZmKGLC
 GrPOFNGtEVzyFcAdG2mEtrJBsrvDf3pztR65km1RYQagopKzlGUarOa4U
 5m3of1VF04+u06Wqu/nQAEKQ2CKGSI+McK7Bay+wXe69/iSl4PDFah9cN
 ycqjEmLnC8YCnnrn+euWxzCiHNxKsVBUB9go2E0GS17SA+imPknOCXgeN Q==;
X-CSE-ConnectionGUID: iClKExyiTSKGbIeY/ueb8Q==
X-CSE-MsgGUID: 1QAJMKIuSkiZKeXGm5xDSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69942204"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69942204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:35:12 -0800
X-CSE-ConnectionGUID: vCvvYmgHSImKx1Sw+XFOHg==
X-CSE-MsgGUID: 6UvyiqP8RkG9cnPxyZcrbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205102200"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:35:12 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 0/2] intel_vbt_decode: Sync intel_vbt_defs.h with latest
 changes
Date: Mon, 19 Jan 2026 16:49:16 +0530
Message-ID: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Add VBT bits for:
 - eDP Data override:
   - 835a0d544def ("drm/i915/bios: Add function to check if edp data override is needed")
 - eDP Pipe Joiner Feature:
   - 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")

Ankit Nautiyal (2):
  tools/intel_vbt_decode: sync intel_vbt_defs.h with commit 835a0d544def
  tools/intel_vbt_decode: sync intel_vbt_defs.h with commit 1b85a9b04681

 tools/intel_vbt_decode.c | 40 ++++++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_defs.h   | 19 +++++++++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.45.2

