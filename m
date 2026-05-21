Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1646CD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 13:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7415510E4CD;
	Thu, 21 May 2026 13:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4hD19f4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1060510E4CD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779370936; x=1810906936;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=tCMrQ0VBhfR+gqEg8fjdphLkUyWk2IM39BiabnzYH74=;
 b=O4hD19f43JoBjGh5sF+QeUiDlshSQSvcZghWoTilw7+ACi7JX99Yx+6g
 CUyTaHC3ImTOX2wd1J4w96GisbAsRbErg7T17S7GVeW9bbqOWhrBw0pSt
 FACL/Gau673QSVJKhLp3w3/rEfJo4a+IpJerHVbFsw682yg4Dv0qurlE2
 r7ExpPDo5kO4J9lDBs1yE89PyFefteWzIxvD5nSsH2CRvubm1nHdYaAeI
 YGO5Li+dJqU1vJ9cx7mjeZ9FmRqXfaL8/W5nbkXjB9Rf88YnQPBuudcnv
 diZHMlxLJOAgUZlLE7FkCKG/9WPMifzzoawdJs9WUxynAO1YYFllC4x1i g==;
X-CSE-ConnectionGUID: 6qOUiQ5CRUWf35p4H3Rsqg==
X-CSE-MsgGUID: 52KnUUMuQ4GZyHEc+KGFnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80321880"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80321880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:42:16 -0700
X-CSE-ConnectionGUID: jJAkRzrJQ/OEElYHYlItgw==
X-CSE-MsgGUID: ifctvMI3TAGm77aDXtIQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="239517290"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:42:14 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 21 May 2026 15:40:45 +0200
Subject: [PATCH v2 1/2] lib/intel_batchbuffer: assert on accessing prefetch
 area
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-ibb_fixes2-v2-1-a36d7a9e71e5@intel.com>
References: <20260521-ibb_fixes2-v2-0-a36d7a9e71e5@intel.com>
In-Reply-To: <20260521-ibb_fixes2-v2-0-a36d7a9e71e5@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2632;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=tCMrQ0VBhfR+gqEg8fjdphLkUyWk2IM39BiabnzYH74=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDwtrPvDHXdG+xu7Wz38GUa7XJ7QpZoXLofuNu
 1obRRDoMhaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag8LawAKCRAjYrKT3hD9
 15LrC/9cwwGAWfk4/2WAxpSXblfQL5PMWfbYjbMcKf7eFeBJa6++zVW7PEnYL9XYLHO/XOKxW1J
 hPSPYU+PKwYrM1yC5fy6/GigMK12ObpnM09tWVtSO6gqJrWU+zZ0/CD9+1OBv+xAQyoc7iSzWNu
 TPWIFXx0g2GAAgaSwLbGk9Y/MSg8aIVFlA2FZlp5O1EAhUzolMFZ1qqdxKIPBZP58uWac2grwZH
 SxliGU9rH7OUj5F7hE1g6luMuawwRk90bH5r1GYE2+ywyL9GWexTqbvzLwKycMin03Daed4azmM
 Xwkd4xiob615yZzqfHC+JN6Kvx6Q4ugMKVDK8oNPoTEiikzaH9BhkDRgFGFM1e9kevm4Azm1Y8u
 0jaammArG23BQBTDc0LDXc1K6IEzAodY6WTWdFjxhkVxQ3qhTraJVWfyI+9+aUK0VN1SCY4L//p
 myVzWoNTUKl3cs5VlxKX84DJjeeK96NwbvK2H7ZgvYEvtulx3QDXZCFVPkcjIqGUNwtT4=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

On batchbuffer allocation library adds 4k padding to the buffer to avoid
prefetch errors. To avoid batchbuffer overflow existing asserts should
compare against requested buffer size (usable_size), instead of allocated
buffer size. Otherwise we risk prefetch errors.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/intel_batchbuffer.c | 3 ++-
 lib/intel_batchbuffer.h | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 17b2b8625d4e..ec0a7108b1f7 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -917,6 +917,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb->devid = intel_get_drm_devid(fd);
 	ibb->gen = intel_gen(ibb->devid);
 	ibb->ctx = ctx;
+	ibb->usable_size = size;
 
 	ibb->fd = fd;
 	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -2931,7 +2932,7 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
 
 	intel_bb_ptr_align(ibb, align);
 	offset = intel_bb_offset(ibb);
-	igt_assert_lt(offset + bytes, ibb->size);
+	igt_assert_lte(offset + bytes, ibb->usable_size);
 
 	subdata = intel_bb_ptr(ibb);
 	memcpy(subdata, data, bytes);
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7250..d26d58aba0d2 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -255,6 +255,7 @@ struct intel_bb {
 	bool enforce_relocs;
 	uint32_t devid;
 	uint32_t handle;
+	uint32_t usable_size;
 	uint32_t size;
 	uint32_t *batch;
 	uint32_t *ptr;
@@ -363,7 +364,7 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
 
 static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
 {
-	igt_assert(offset < ibb->size);
+	igt_assert_lte(offset, ibb->usable_size);
 
 	return ((uint8_t *) ibb->batch + offset);
 }
@@ -372,7 +373,7 @@ static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
 {
 	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
 
-	igt_assert(intel_bb_offset(ibb) <= ibb->size);
+	igt_assert_lte(intel_bb_offset(ibb), ibb->usable_size);
 }
 
 static inline void intel_bb_ptr_add(struct intel_bb *ibb, uint32_t offset)
@@ -407,7 +408,7 @@ static inline void intel_bb_out(struct intel_bb *ibb, uint32_t dword)
 	*ibb->ptr = dword;
 	ibb->ptr++;
 
-	igt_assert(intel_bb_offset(ibb) <= ibb->size);
+	igt_assert_lte(intel_bb_offset(ibb), ibb->usable_size);
 }
 
 void intel_bb_set_pxp(struct intel_bb *ibb, bool new_state,

-- 
2.54.0

