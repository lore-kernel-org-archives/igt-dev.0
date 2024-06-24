Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857BDC2D0D1
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 09:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E9610E3C6;
	Mon, 24 Jun 2024 09:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHY2reqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D076010E3C6
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719220655; x=1750756655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eTSiLJN1+4XgE0YOM+0dmQl9mZq+gpQLe2exgcaxR8I=;
 b=CHY2reqJtGo5dBdC+g0Fs42zh2NCm6Xcu8yluoHEBVplvujcXstBG8/C
 3mHSnOKD640NECLd8dqkLezCTGnZpPWuG6hXH0dLIYNs86mZicBIkEBZy
 JDpClBouC2m+6tq3OKDEZ/wZb8PdDi5JukcgmLEQfLxtWplUnV7oto/w0
 ZB/m/iRAGj/GXzLuQaCp4QcpE4JRDS/iOj+IrOTzznSBTzMx4RTqqObR7
 IlVY1mq4bwLi4NjyKQAVmJ5LXuRHh5EfmL100zmnCqIifTznhemXtE3PR
 B5CYM0K12VnzusXRNnYyrNE6Ef4fhcqvVBgqmlMCVCQaW6w8yBzOO7Uo9 g==;
X-CSE-ConnectionGUID: 3+7dRscLRpWnLYDUMeozqA==
X-CSE-MsgGUID: 5CVFz56yQ3i7Oi48HHDgBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26771089"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="26771089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:17:35 -0700
X-CSE-ConnectionGUID: cO+8IZMuQJGJNWqQUknMuw==
X-CSE-MsgGUID: 5nEfLs0sQhacq5guwvkr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43353951"
Received: from melanie-nuc10i7fnh.iind.intel.com ([10.223.167.49])
 by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2024 02:17:31 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 ville.syrjala@intel.com, Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for RGB16161616_64B compressed formats
Date: Mon, 24 Jun 2024 20:12:46 +0530
Message-Id: <20240624144248.216308-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603081607.30930-1-melanie.lobo@intel.com>
References: <20240603081607.30930-1-melanie.lobo@intel.com>
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

Support XRGB16161616_64B and ARGB16161616_64B compressed formats

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for RGB16161616_64B
    format
  tests/intel/kms_flip_scaled_crc: Add support for RGB16161616_64B
    compressed formats

 lib/intel_aux_pgtable.c           |  5 ++++
 tests/intel/kms_flip_scaled_crc.c | 39 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.34.1

