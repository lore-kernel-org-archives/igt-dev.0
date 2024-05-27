Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19037C25B7C
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525A710E9E9;
	Mon, 27 May 2024 07:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVc+4y3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC22C10E4B2
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795263; x=1748331263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HcwwQYR2xC0NKchI8+XJA0wTjWkgZ5qXV3+pyS8SUaM=;
 b=fVc+4y3VTgyS5/mfpOowX+CAkMFiV528gHQ7X54N7AM/lX4tGTOptk1X
 8EhXrw5/iuIr2Oj0hJrmVsInN+XTK7a8HPc9yfWgUgy1CwXEEMiHbaRkm
 PT27GARlWVH++Z6aX8V78MAzjiCtHeizQQf66jJ7eDpkU7eZWU4c4JHe8
 jfth8zOVhgrBlVjKfPK93ASSN6q+z3onCtu/AIxZv5wjPLwm7jI6861rp
 ItL8kNt3AIJ3cAxwpSZP96x/8A8WNcmwxBrrLW8cMzUjps181neynAlG4
 EylKuYRcY8w9oE5mglyyqDipZU9ffIvEwjGtCaaAZVJfTueEYF3Wn/fPQ w==;
X-CSE-ConnectionGUID: c9y/UG/6SCOaguaBT+g9yg==
X-CSE-MsgGUID: 9COS7W8WRcu9R2kDBSveUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23700427"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="23700427"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:15 -0700
X-CSE-ConnectionGUID: vdMa3pCIRjiDrv9AVY3P/Q==
X-CSE-MsgGUID: UeRCzaS6Q06VTjHBPlWMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34569812"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:10 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 02/12] lib/intel_bufops: Fix mapping/unmapping for i915
 and xe
Date: Mon, 27 May 2024 09:33:35 +0200
Message-Id: <20240527073345.54729-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It looks previously there was no user of intel-buf mapping code so
missing xe path wasn't notice. Lets add xe path along with correct
buffer size mapping.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 313c2665ae..b4ccf4c093 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1232,37 +1232,46 @@ void intel_buf_destroy(struct intel_buf *buf)
 
 void *intel_buf_cpu_map(struct intel_buf *buf, bool write)
 {
-	int i915 = buf_ops_get_fd(buf->bops);
+	int fd = buf_ops_get_fd(buf->bops);
 
 	igt_assert(buf);
 	igt_assert(buf->ptr == NULL); /* already mapped */
 
 	buf->cpu_write = write;
-	buf->ptr = gem_mmap__cpu_coherent(i915, buf->handle, 0,
-					  buf->surface[0].size,
-					  write ? PROT_WRITE : PROT_READ);
 
-	gem_set_domain(i915, buf->handle,
-		       I915_GEM_DOMAIN_CPU,
-		       write ? I915_GEM_DOMAIN_CPU : 0);
+	if (is_xe_device(fd)) {
+		buf->ptr = xe_bo_map(fd, buf->handle, buf->bo_size);
+	} else {
+		buf->ptr = gem_mmap__cpu_coherent(fd, buf->handle, 0,
+						  buf->bo_size,
+						  write ? PROT_WRITE : PROT_READ);
+
+		gem_set_domain(fd, buf->handle,
+			       I915_GEM_DOMAIN_CPU,
+			       write ? I915_GEM_DOMAIN_CPU : 0);
+	}
 
 	return buf->ptr;
 }
 
 void *intel_buf_device_map(struct intel_buf *buf, bool write)
 {
-	int i915 = buf_ops_get_fd(buf->bops);
+	int fd = buf_ops_get_fd(buf->bops);
 
 	igt_assert(buf);
 	igt_assert(buf->ptr == NULL); /* already mapped */
 
-	buf->ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
-					     buf->surface[0].size,
-					     write ? PROT_WRITE : PROT_READ);
+	if (is_xe_device(fd)) {
+		buf->ptr = xe_bo_map(fd, buf->handle, buf->bo_size);
+	} else {
+		buf->ptr = gem_mmap__device_coherent(fd, buf->handle, 0,
+						     buf->bo_size,
+						     write ? PROT_WRITE : PROT_READ);
 
-	gem_set_domain(i915, buf->handle,
-		       I915_GEM_DOMAIN_WC,
-		       write ? I915_GEM_DOMAIN_WC : 0);
+		gem_set_domain(fd, buf->handle,
+			       I915_GEM_DOMAIN_WC,
+			       write ? I915_GEM_DOMAIN_WC : 0);
+	}
 
 	return buf->ptr;
 }
@@ -1272,7 +1281,7 @@ void intel_buf_unmap(struct intel_buf *buf)
 	igt_assert(buf);
 	igt_assert(buf->ptr);
 
-	munmap(buf->ptr, buf->surface[0].size);
+	munmap(buf->ptr, buf->bo_size);
 	buf->ptr = NULL;
 }
 
-- 
2.34.1

