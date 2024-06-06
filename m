Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D166BC27C55
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 11:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6780210E919;
	Thu,  6 Jun 2024 11:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzvkxFxE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1875210E918
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2024 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717675136; x=1749211136;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=zm2xMnchWoPuLcgPBe6rg92St+RWPuUm022Adbxu9/4=;
 b=LzvkxFxEd+agfY4PJKECfSj3tpmxe5kgWs7m5PXtZduDUZOnm2G+c51s
 s+k24kQnl4fKxlOs1NF9+JCf5X3FX1nkxJf0KiRpFEwh1I/lhghiNgnMQ
 XocC+BU7srDFORwIXjOIcHOWv1ehqc3JAZQVomll1MEofjhhLwZsoK0xw
 UFdGZm+4XnIUVleGozYNzwV+GPGAPcWC85i2t2aP6FfNHEo6AFALefLhu
 zjf6Xffu32UnzkmAANVoV3j+4J1AMXU/nXcbPXjF1PcGLqXqPgQHFmI5l
 WlZA17ou9N9ky/SbOJ3KCri7ysCeRPakPPvZeWwJvNt+Aa6PjNPHAHd7I w==;
X-CSE-ConnectionGUID: dhCCYXs/QUCP5IUUxNmb7w==
X-CSE-MsgGUID: 5gmlh+Z6S5W3DKW6gwIH+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11940832"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="11940832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 04:58:55 -0700
X-CSE-ConnectionGUID: AoCXx9ufTFKTvEURMTMPvw==
X-CSE-MsgGUID: ob9N140oQTC0LoZHb/PAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42870623"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa005.jf.intel.com with ESMTP; 06 Jun 2024 04:58:51 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vidya.srinivas@intel.com,
	Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for RGB16161616_64B compressed format
Date: Thu,  6 Jun 2024 17:41:20 +0530
Message-Id: <20240606121122.5140-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240603081607.30930-1-melanie.lobo@intel.com>
References: <20240603081607.30930-1-melanie.lobo@intel.com>
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
 tests/intel/kms_flip_scaled_crc.c | 42 +++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

-- 
2.17.1

