Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8328BCEDD97
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 14:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396C789950;
	Tue, 18 Nov 2025 14:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mdx4PZXw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB79089950
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763475884; x=1795011884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bw4Wd/4eP3PlQgGEJ4NDYW9bt+ganLHeXVeiIpzMjvs=;
 b=Mdx4PZXw08jNtOIulXaRwipvgaiMYlUkClgRkIIOP9e3Z66LZFxpmIOO
 5YYc+5urw4oOvnDcWne4haskliEXOimzQ4kP4MPabrLEiKJON/dawORCu
 8piqOwQm4vzg3vjFXbX1CS93wnl9N/pOkJ7rAL/XmGAgKGMagR6RB7TNo
 OeY3COAg/+XQrjUKSN6vtqi54flb5EdrwoxUoNWQyOckABJlBfUaGE1dn
 lCBtV91VFiJ+UkABIUGXFDl756jE8tJ+raO7VhSPOqwrXkjf8b+ZhdOcq
 zEW2yGr8yyWboas8HFtpjehrbVw5GD9FwwgoGPSIhTyhaRsi9XUVqC9K6 A==;
X-CSE-ConnectionGUID: fqVudmuQTOW9deSI3QO0yw==
X-CSE-MsgGUID: cYi4hMErRl+XxAjbN2LTIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65587303"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65587303"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:24:44 -0800
X-CSE-ConnectionGUID: Rz7pVp7KSKWok8Bz/0vQ8Q==
X-CSE-MsgGUID: 5aeJalw1QFuJ5mnxnCGCOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214168188"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:24:43 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 1/2] lib/xe_spin: Pass drm file handle for mem_copy
Date: Tue, 18 Nov 2025 19:55:24 +0530
Message-ID: <20251118142522.3957318-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
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

Receive the drm file handle for mem_copy. It is required to check the IP
version while constructing the mem_copy instruction due to change in
the instruction structure between platforms.
Following patch will be using the file handle.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 lib/xe/xe_spin.h             | 1 +
 tests/intel/xe_render_copy.c | 1 +
 tests/intel/xe_spin_batch.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index c2199d0aa..92479eb45 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -35,6 +35,7 @@ void xe_spin_free(int fd, struct igt_spin *spin);
  * Used to perform memory copy with the spinner.
  */
 struct xe_spin_mem_copy {
+	int fd;
 	struct blt_mem_object *src;
 	struct blt_mem_object *dst;
 	uint64_t src_offset;
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index ae2bb6f59..dffce1e7f 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -458,6 +458,7 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
 	int32_t src_handle, dst_handle;
 	struct blt_mem_object src, dst;
 	struct xe_spin_mem_copy mem_copy = {
+		.fd = fd,
 		.src = &src,
 		.dst = &dst,
 	};
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index ee2d0ec3f..615373917 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -333,6 +333,7 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
 	int32_t src_handle, dst_handle;
 	struct blt_mem_object src, dst;
 	struct xe_spin_mem_copy mem_copy = {
+		.fd = fd,
 		.src = &src,
 		.dst = &dst,
 	};
-- 
2.43.0

