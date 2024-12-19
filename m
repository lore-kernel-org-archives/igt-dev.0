Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2F9E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 18:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4458010ED9E;
	Thu, 19 Dec 2024 18:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwNQ1VXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D513710ED9E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 18:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734634121; x=1766170121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uK1Nqpdk/aJdDCcH+X4He1VTE5g8qDAMxWhf/3y2c1M=;
 b=lwNQ1VXIPJRYGOZZKrOVJBM+rJQ+jL0Ppvz5OKYjEGBjgTpHJq9shujg
 4CPyM32AgAahLG9fARAw4SmW00o5vmdyZIV9UkF2WRd3il5uHcDKf59qk
 fledoNnrAnj9bJf4zf9JTCKmqIaxYwXbcIiB9zMvjaoFqZxv6s57YeY03
 54vsLXQm482fNGR+38hID/5i3r0+pEX8uvHTOIrx/g+VcAmtjn+Tp7+ZY
 7uprG0JFu7aEVxQikQTqu4B65Qr7hCH4+a7Q+lsEZg5iD4+BWIGLkls6M
 Hx9VcJ4OLmMJtaeBtzJC7JUF8OqwWNLrr9UAqaoaipmuBso8auIHOCy4m Q==;
X-CSE-ConnectionGUID: 0l8eIM0qT8+CC+Y9UhuMRw==
X-CSE-MsgGUID: LYPE9/c+Q7mp4+B9Nxyw7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="60545596"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="60545596"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 10:48:40 -0800
X-CSE-ConnectionGUID: 4qybIP7hTHuZW/dgYJsRmQ==
X-CSE-MsgGUID: GhtewWlhTBupUhmUgofp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98174090"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 10:48:37 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mika.kuoppala@linux.intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t] tests/xe_eudebug.c: Enhance memory access testcases
Date: Thu, 19 Dec 2024 19:48:26 +0100
Message-Id: <20241219184826.603072-1-dominik.grzegorzek@intel.com>
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

UMD tests revealed issues with memory read/write operations when
accessing data at any nonzero offset within a VMA. Address this by
verifying access to a buffer object at random unaligned offset.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index d9281f78f..51d02e06c 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1556,6 +1556,7 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
 	struct drm_xe_eudebug_vm_open vo = { 0, };
 	uint64_t *v1, *v2;
 	uint64_t items = va_length / sizeof(uint64_t);
+	uint64_t offset;
 	int fd;
 	int r, i;
 
@@ -1573,14 +1574,24 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
 	r = pread(fd, v1, va_length, va_start);
 	igt_assert_eq(r, va_length);
 
+	for (i = 0; i < items; i++)
+		igt_assert_eq(v1[i], va_start + i);
+
+	/* random unaligned offset within the vm */
+	offset = 1 + random() % (va_length / 2);
+	r = pread(fd, (char *)v1 + offset, va_length - offset, va_start + offset);
+	igt_assert_eq(r, va_length - offset);
 	for (i = 0; i < items; i++)
 		igt_assert_eq(v1[i], va_start + i);
 
 	for (i = 0; i < items; i++)
 		v1[i] = va_start + i + 1;
 
-	r = pwrite(fd, v1, va_length, va_start);
-	igt_assert_eq(r, va_length);
+	r = pwrite(fd, v1, offset, va_start);
+	igt_assert_eq(r, offset);
+
+	r = pwrite(fd, (char *)v1 + offset, va_length - offset, va_start + offset);
+	igt_assert_eq(r, va_length - offset);
 
 	lseek(fd, va_start, SEEK_SET);
 	r = read(fd, v2, va_length);
-- 
2.34.1

