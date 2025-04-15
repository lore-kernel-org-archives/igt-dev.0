Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145ADC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 13:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CA510E78E;
	Tue, 15 Apr 2025 13:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bT1ERv4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A79B10E78F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744723373; x=1776259373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QMaZ2gkB65D3oxZJjpNlNBFT3VQyEEeYNBFhbH+0wmA=;
 b=bT1ERv4qA72Ghw8daBjWZdrxWmvkAa/bixLVpvaERTmTKMkAP4b/CfFy
 WnMNcKH2UT/v9ABJPXnqKyq0YphBoeN9Je8uwMiDDA3blwtqd7fFhGheu
 2txzJqGSxQ47dC/KWbiQ+WJigXGqBfLYCpo0A632/dtjhS3VLoP+N6H08
 vptwnQ9mjJ7jUEFhS0w7iBSP4k13eaYdzLeO8NTU1T8eZ2L99cGDP4VaB
 wLrJtvWBSelpk0AqP1Zknu3v1tJmug1UVBOskFcfuLG2NrdzdyGpX9gQn
 Yx2NuEh4lGJGokAIUqqtWgsJ1ZFODwZ79OeMt0O4qRLB4a6wxsxB/bv7U w==;
X-CSE-ConnectionGUID: PQI9j74uRamidACWdnAhWA==
X-CSE-MsgGUID: w1Dkv3FLSS2g9/ovjJD6MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46244599"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46244599"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 06:22:49 -0700
X-CSE-ConnectionGUID: bWzMaSyMRqCcYgfcyaWpow==
X-CSE-MsgGUID: iXp/RF8LQbiNNbHCodvLkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135186590"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2025 06:22:47 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	chris.p.wilson@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 0/2] test/intel/prime_mmap: Limit aperture testing to machines
 with an aperture
Date: Tue, 15 Apr 2025 19:01:04 +0530
Message-Id: <20250415133106.764148-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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


Chris Wilson (2):
  test/intel/prime_mmap: Limit aperture testing to machines with an
    aperture
  tests/intel/prime_mmap: use proper size for dma_buf_fd

 tests/intel/prime_mmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.34.1

