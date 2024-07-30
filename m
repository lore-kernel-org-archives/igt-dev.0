Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D1BC3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D82A10E513;
	Tue, 30 Jul 2024 11:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C70D29QD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE08510E513
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340107; x=1753876107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lyO2BNk9c8pXt1A4dXq4IjxDjG3Go/Ui190DLrXUSUk=;
 b=C70D29QD2/0QffACneNP4wSNaT6Jd55XmrQ0lyiAaYiFMN77s9h1wf2k
 P0shX9AWmYI2PE9SXyhoFmc6w8DXnYsLdg0VY71fxaY0nLaYyNqFnncrw
 FtcFK/LcocRsyEMh5W8LEHDng6mspPYmtboe8mKLJRJ6Mf7IkFxmC7GFW
 7scMkB5t9NdKm1zfJU+7AR2QQBilcXQ0QxHTqOUq12wTi9GYFylluC6hK
 YQeaEY2dIhfJIBoD2xjXZD84AaRUdlKk1a+M7uDyKr0fWUrQDgvyXj7sE
 5I5M2UFf7nRmOlcIebH+LANrsWQXH9j64H8lbhTZldlCx4XTLaNXW/W7N A==;
X-CSE-ConnectionGUID: eeM5Fe+FQAKTlVeo3hyIgQ==
X-CSE-MsgGUID: B+ukQahoQUWgk5IZriRvTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937348"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937348"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:27 -0700
X-CSE-ConnectionGUID: 4nE5QN/SRGufWJI3msWUPg==
X-CSE-MsgGUID: +4Dn7sf+R+StR7qGCODCpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217070"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:23 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 35/66] tests/xe_eudebug: Exercise lseek
Date: Tue, 30 Jul 2024 13:44:52 +0200
Message-Id: <20240730114523.334156-36-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Add an additional check in debugger_test_vma that simultaneously
exercises lseek support and also that pwrite successfully wrote the
new buffer contents to the vma via pwrite.

Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index edb76685e..928dcdce4 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1414,13 +1414,15 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
 			      uint64_t va_length)
 {
 	struct drm_xe_eudebug_vm_open vo = { 0, };
-	uint64_t *v;
+	uint64_t *v1, *v2;
 	uint64_t items = va_length / sizeof(uint64_t);
 	int fd;
 	int r, i;
 
-	v = malloc(va_length);
-	igt_assert(v);
+	v1 = malloc(va_length);
+	igt_assert(v1);
+	v2 = malloc(va_length);
+	igt_assert(v2);
 
 	vo.client_handle = client_handle;
 	vo.vm_handle = vm_handle;
@@ -1428,22 +1430,30 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
 	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
 	igt_assert_lte(0, fd);
 
-	r = pread(fd, v, va_length, va_start);
+	r = pread(fd, v1, va_length, va_start);
 	igt_assert_eq(r, va_length);
 
 	for (i = 0; i < items; i++)
-		igt_assert_eq(v[i], va_start + i);
+		igt_assert_eq(v1[i], va_start + i);
 
 	for (i = 0; i < items; i++)
-		v[i] = va_start + i + 1;
+		v1[i] = va_start + i + 1;
 
-	r = pwrite(fd, v, va_length, va_start);
+	r = pwrite(fd, v1, va_length, va_start);
+	igt_assert_eq(r, va_length);
+
+	lseek(fd, va_start, SEEK_SET);
+	r = read(fd, v2, va_length);
 	igt_assert_eq(r, va_length);
 
+	for (i = 0; i < items; i++)
+		igt_assert_eq(v1[i], v2[i]);
+
 	fsync(fd);
 
 	close(fd);
-	free(v);
+	free(v1);
+	free(v2);
 }
 
 static void vm_trigger(struct xe_eudebug_debugger *d,
-- 
2.34.1

