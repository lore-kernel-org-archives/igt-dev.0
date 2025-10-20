Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79B9CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 13:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B4810E43C;
	Mon, 20 Oct 2025 13:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZQK0HT3W";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A6310E43C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 13:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dm6DDY1KubW80E0VwQHGIX7sLPxJAU65sPBL4cZQYuM=; b=ZQK0HT3W7ZsoKa+vVbQHhyBld7
 VFkFIAADG8sxRkq3gPj7ySLMTTDkWASMsGca26bVnf7XvURUe2qpDORhaCYyARGLyM58PyFxF+PZb
 57SxAKSVtBHBSeJ/reqPDykpXSzvY0obe9J2seSQtUAkD5T4P0LZtoC7m5R375mlusCOhqAKEjbNP
 W4Od1wZOcDaKfw2hyRGuwyzP3PKSacGcUjplc8kktaYd6UHfe3FLkGoJdg9fFJOhnGpQldD5ovIXK
 i+4cft26MRtUZQpi3YaKNmm9cbeJ8otjlRZ88J1DW9vAAVMviXfaPtptPe+5LbAMYIDqtjVjUivQi
 M5d6reqA==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vAqCQ-00C7sM-L1; Mon, 20 Oct 2025 15:45:22 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/intel/mocs: Add documentation for MOCS helpers
Date: Mon, 20 Oct 2025 14:45:17 +0100
Message-ID: <20251020134517.38780-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Add some documentation for the MOCS helpers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_mocs.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 9809e32113eb..778fd848ed47 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -13,6 +13,18 @@ struct drm_intel_mocs_index {
 	uint8_t defer_to_pat_index;
 };
 
+/**
+ * SECTION:intel_mocs
+ * @short_description: Intel Memory Object Control State (MOCS) helpers
+ * @title: Intel MOCS helpers
+ * @include: igt.h
+ *
+ * Memory Object Control State (MOCS) defines the behaviour of memory accesses
+ * beyond the graphics core, including encryption, graphics data types that
+ * allow selective flushing of data from outer caches, and controlling
+ * cacheability in the outer caches.
+ */
+
 static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 {
 	uint16_t devid = intel_get_drm_devid(fd);
@@ -53,6 +65,13 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 	}
 }
 
+/**
+ * intel_get_wb_mocs_index:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The MOCS index corresponding to the basic write-back behaviour for
+ * the open Intel DRM device.
+ */
 uint8_t intel_get_wb_mocs_index(int fd)
 {
 	struct drm_intel_mocs_index mocs;
@@ -62,6 +81,13 @@ uint8_t intel_get_wb_mocs_index(int fd)
 	return mocs.wb_index;
 }
 
+/**
+ * intel_get_uc_mocs_index:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The MOCS index corresponding to the uncached behaviour for the open
+ * Intel DRM device.
+ */
 uint8_t intel_get_uc_mocs_index(int fd)
 {
 	struct drm_intel_mocs_index mocs;
@@ -71,6 +97,14 @@ uint8_t intel_get_uc_mocs_index(int fd)
 	return mocs.uc_index;
 }
 
+/**
+ * intel_get_displayable_mocs_index:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The MOCS index corresponding to the uncached displayable behaviour
+ * for the open Intel DRM device. This should be used for buffers which may be
+ * simultaneously displayed and rendered to.
+ */
 uint8_t intel_get_displayable_mocs_index(int fd)
 {
 	struct drm_intel_mocs_index mocs;
@@ -80,6 +114,13 @@ uint8_t intel_get_displayable_mocs_index(int fd)
 	return mocs.displayable_index;
 }
 
+/**
+ * intel_get_defer_to_pat_mocs_index:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The MOCS index corresponding to the "defer to PAT" caching
+ * behaviour, or asserts if the platform does not support this mode.
+ */
 uint8_t intel_get_defer_to_pat_mocs_index(int fd)
 {
 	struct drm_intel_mocs_index mocs;
-- 
2.48.0

