Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D10C02194
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 13:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596DC10E04E;
	Mon,  3 Feb 2025 13:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9RIGT1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B3510E04E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738589983; x=1770125983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qnglZQD3TujYgL+p30WiGCoqFr748L/oya+RcUDhlXM=;
 b=b9RIGT1TwgPWp3yzmZ1ONssQpkJvoXxWJbUTLYTZOIcOqgRI5oaVBMq9
 dEj0qoVBdi+ut1XVILWLrCCTOmYgWwUJvqBf+bng7NKIYkcBW7TCg8hwt
 RPxs3cgUvYLEz/cAkxLjG3M/mDet0xjcR82ZXoqP+5j9rd9jfoSkf9P5C
 M/zocBHC1iYvPOTk58fCxn7Kt+3pCsTbGfJYEhQICn9Ty/IVNKRO3OUp7
 3Dp5uDxXPdnm2Qkv8ilBZxFH6gLHF1KwbpDMiv/+2+cl7ORGpnwl4PRx+
 hZ10Q9ZYDg8XNGJqambr/fFVP7Z+ibKCXjMm2r4+PF5+HodeB1VSATCoR Q==;
X-CSE-ConnectionGUID: ZXY9bkFCRcy9R9ogFKwMVg==
X-CSE-MsgGUID: OiZ+2INfRge1hPFX4tJTOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26682910"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="26682910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:39:42 -0800
X-CSE-ConnectionGUID: EXg9NVZTRkiK3crujFJi8g==
X-CSE-MsgGUID: dnpMSNm8RtCWgYhG/2Jyew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110242848"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:39:41 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/3] Use LR mode for compute
Date: Mon,  3 Feb 2025 14:38:45 +0100
Message-ID: <20250203133916.843931-1-francois.dugast@intel.com>
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

This series is a follow-up of [1]. The CI failures are fixed in 2 new
preparation patches to make xe_bo_create() work on xehp and xehpc with
64K alignment.

[1] https://patchwork.freedesktop.org/series/143899/#rev4

Francois Dugast (3):
  lib/intel_compute: Align objects on 64K for xehp
  lib/intel_compute: Align objects on 64K for xehpc
  lib/intel_compute: Use LR mode for compute when using Xe

 lib/intel_compute.c | 190 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 146 insertions(+), 44 deletions(-)

-- 
2.43.0

