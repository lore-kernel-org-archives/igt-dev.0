Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F5C369B5
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 13:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D88010E78F;
	Tue, 15 Apr 2025 13:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="US+oXn5w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7110E791
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744723373; x=1776259373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xLL9VUFwOubCqPI3TrFWtSEnpnq8rL5UOmt2qoOtMkc=;
 b=US+oXn5wbAuE7EyVvBYBv+90dyqL+3nA8/VrrtROQYgsPmyx+G0Y6vcw
 lQHCraDdrOoLmRoZM1JvVp4TsO/XG6gRYiTDAJnlvKCBhMCx0KS7mFrEI
 ufR/cnt83O67UCjefVogWbFktpnYIa4RlHUONGG03yWFtCEFpKKp9wcP3
 wvp2Vw9K9RCMc3dwYoDMwoERlDOFmJkr4iTIw/1xxLL+HBfTMl3HMivnU
 Y6R/uW/ofCQ7QYDDpaMgm2YHq70EmGdVnkMV5/DM/yOh0Yv6aQFLt4tFC
 mPCmq1K1AAwpCyb1XgGfykguaBXhp9IP5dhImHBP5yyOSfS8dLmlC0Lc2 A==;
X-CSE-ConnectionGUID: JNXv85hmSD+bYkwrxkB9IA==
X-CSE-MsgGUID: VytQdmESTqGw2f4VqZA1vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46244600"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46244600"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 06:22:50 -0700
X-CSE-ConnectionGUID: HSKlBQ4IS7+ivQnXdjJ4BA==
X-CSE-MsgGUID: 5ZB2AkC7SEK869ujti84sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135186594"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2025 06:22:49 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	chris.p.wilson@intel.com
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 1/2] test/intel/prime_mmap: Limit aperture testing to machines
 with an aperture
Date: Tue, 15 Apr 2025 19:01:05 +0530
Message-Id: <20250415133106.764148-2-pravalika.gurram@intel.com>
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

The test_aperture_limit looks at the handling of internal GGTT mmaps for
the dmabuf and checking what happens if we try to mmap more than we can
fit inside the aperture. Thus if we have no aperture, there is no corner
case regarding the mmapable aperture that requires validation.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/prime_mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index 6de54b840..e3a3a021b 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -490,6 +490,10 @@ test_aperture_limit(uint32_t region, uint64_t size)
 	uint64_t size1 = (gem_mappable_aperture_size(fd) * 7) / 8;
 	uint64_t size2 = (gem_mappable_aperture_size(fd) * 3) / 8;
 
+	igt_require(gem_has_mappable_ggtt(fd));
+	igt_require(size1 >= size2);
+	igt_require(size2 >= size);
+
 	handle1 = gem_create(fd, size1);
 	dma_buf_fd1 = prime_handle_to_fd_for_mmap(fd, handle1);
 	igt_assert(errno == 0);
-- 
2.34.1

