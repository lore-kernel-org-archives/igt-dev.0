Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6A3C369B4
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 13:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ECD10E791;
	Tue, 15 Apr 2025 13:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zj9ockm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD8210E78E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744723374; x=1776259374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ty5d/fOTvNBh7AiHVh11uwUxH7F5ItEpoU7nojSteLs=;
 b=Zj9ockm2Dmw6sepIkRp1GEEKuKIspVRw44O0UkZyNcjj3Bm77dYdPttx
 tj3LZy5R64Ot7RXBx0Wc8NU154GfMSxkSb60z6mX+gfpPy2ucXe9ZkmeM
 ieXXbGMCddEVLWMlZK4dnbEdjJBCRfsgtROgBOQslsKoSZLfBfWKlSDLH
 6885fXtG4wQZZDylnNijogC744o/d49Wdozm0vVTrHfgOSIYENOoXClgI
 /i4E1wAEisxOkc//V211M6oPKGDR8TzuF7izbBtmWzWWEIZNH7gVAklGz
 VvnaMhAFgGXgBvblU+eEdj25I4ls9e+/mrP97nizP1jrT7HoFJxkni1RU A==;
X-CSE-ConnectionGUID: 233gS9S3R529ezpfE4S2/A==
X-CSE-MsgGUID: 4/WJq+VUTV20z1SFNQsKug==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46244601"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46244601"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 06:22:52 -0700
X-CSE-ConnectionGUID: uIzdb0/JRCaeuKFwobbTJw==
X-CSE-MsgGUID: WqM4wSf4SOmor+9lnovaOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135186597"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2025 06:22:50 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	chris.p.wilson@intel.com
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 2/2] tests/intel/prime_mmap: use proper size for dma_buf_fd
Date: Tue, 15 Apr 2025 19:01:06 +0530
Message-Id: <20250415133106.764148-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415133106.764148-1-pravalika.gurram@intel.com>
References: <20250415133106.764148-1-pravalika.gurram@intel.com>
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

correct the size for dma_buf_fd.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/prime_mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index e3a3a021b..ae0c74dfe 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -502,7 +502,7 @@ test_aperture_limit(uint32_t region, uint64_t size)
 	fill_bo_cpu(ptr1, size);
 	igt_assert(memcmp(ptr1, pattern, sizeof(pattern)) == 0);
 
-	handle2 = gem_create(fd, size1);
+	handle2 = gem_create(fd, size2);
 	dma_buf_fd2 = prime_handle_to_fd_for_mmap(fd, handle2);
 	igt_assert(errno == 0);
 	ptr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd2, 0);
-- 
2.34.1

