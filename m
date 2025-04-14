Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14541C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 10:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C024910E53D;
	Mon, 14 Apr 2025 10:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfLWJOZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E6410E53D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744625902; x=1776161902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N8qPRp2JyJWFRlBn5sELKhKd6FI4ze3f7+TVwKVa7iY=;
 b=dfLWJOZ78Uq1XjhWnoEDQZ/4fPWnDN/QmmgkLWIxk8kIQzt4kuUfAP1l
 +atD1mG3UVNb7F2PXLwWOKsO7xpcymB4/jmrbBLipNfNYX3oGkS+HrYtk
 GQhY4nkI/oSW3AyDVZd85CcicZwdjD4rYaI9vp3CVoXoqEXDetfks2LYc
 5758tBJlM21/RsGLf/PDHkYxBP5q0eflAt6I/vyNVGm0JoIvHpNAaaBbb
 39FJl81mSuNxFjxKBmJBT2AMhCILIpgGGSmePir5uEOW8nIb/3fy1wuHA
 0sJLr6yRGIJnxsEMQaDmZFr5NKvuetoLoCZEBL27NJqs3Vf+lMyPGvahm A==;
X-CSE-ConnectionGUID: kDSYxSQ6SMqY9aG0ABk8ug==
X-CSE-MsgGUID: WOT8C6rPTl6rjfQyP19ZKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71473937"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="71473937"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:18:22 -0700
X-CSE-ConnectionGUID: 2VC02i/dSIuWcEGtYga8TQ==
X-CSE-MsgGUID: r6RP3gOKSMao5sOlNHKqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="133878623"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2025 03:18:21 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	chris.p.wilson@intel.com
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] prime_mmap: Limit aperture testing to machines with an
 aperture
Date: Mon, 14 Apr 2025 15:56:40 +0530
Message-Id: <20250414102640.755085-1-pravalika.gurram@intel.com>
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

The test_aperture_limit looks at the handling of internal GGTT mmaps for
the dmabuf and checking what happens if we try to mmap more than we can
fit inside the aperture. Thus if we have no aperture, there is no corner
case regarding the mmapable aperture that requires validation.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/prime_mmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index 6de54b840..ae0c74dfe 100644
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
@@ -498,7 +502,7 @@ test_aperture_limit(uint32_t region, uint64_t size)
 	fill_bo_cpu(ptr1, size);
 	igt_assert(memcmp(ptr1, pattern, sizeof(pattern)) == 0);
 
-	handle2 = gem_create(fd, size1);
+	handle2 = gem_create(fd, size2);
 	dma_buf_fd2 = prime_handle_to_fd_for_mmap(fd, handle2);
 	igt_assert(errno == 0);
 	ptr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd2, 0);
-- 
2.34.1

