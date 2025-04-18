Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D7FC369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 20:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7215910E2BC;
	Fri, 18 Apr 2025 20:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZaZhgqO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A99B10E2BC
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745009532; x=1776545532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1u0EFKezw7pWaVcOSCKfxpVy7OHkuRSevbfS8Yp525o=;
 b=fZaZhgqOc00pi+1ORSYgySOBJgDRbCmSkMH+Ls2LFBwvjom0O7wqZt3s
 hXpXJdH8Rln5XiNhkRByj7orq9kTaKla/vNYBiFmA/AALNEppuG7h3BfC
 qgkMyq5gMqYQhg/LQFGn/h7dsms/Ik7lmSHn1EDlct0WN7Z95P/hmgWcf
 GwftjfjIYsOrZQfeo76/HX/82OsBAamYB8mZiqvltH39dui5BgCj3dhu5
 UE4HmVisNw0ZMsDtuBqgYsF9prNICvxjPZgiohCppkYOvWl7GmGoTK89N
 L2HcU0Fqc3WvppXlrHXjyZQiO44l846JP3siamENjXKkBpTu6YKTMfOJ6 g==;
X-CSE-ConnectionGUID: ddJCmHmyT2in7QhJooVcvA==
X-CSE-MsgGUID: CL0AjTANTyWRrbfV2AJjRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46746615"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="46746615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:52:12 -0700
X-CSE-ConnectionGUID: JgurVJ3kSuuUzXKyGN3ZwQ==
X-CSE-MsgGUID: fzTdHZEDQeSngCndxgNAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="162252752"
Received: from dut4046ptlh.fm.intel.com ([10.105.8.209])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:52:11 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 umesh.nerlige.ramappa@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2] tests/intel/xe_oa: Remove buffer overflow guard from
 buffer-size tests
Date: Fri, 18 Apr 2025 20:52:11 +0000
Message-ID: <20250418205211.346135-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

The guard was a holdover from i915 that is not relevant to Xe because
the buffer contents are preserved during an overflow.  Remove the check.

v2: Keep check for non-zero-reason test (Ashutosh)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4541
Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1fc8bfaafe..9db3d850c4 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2503,7 +2503,8 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 	while (total_len < buf_size &&
 	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
 		(len == -1 && (errno == EINTR || errno == EIO)))) {
-		if (errno == EIO) {
+		/* Assert only for default OA buffer size */
+		if (errno == EIO && !oa_buffer_size) {
 			oa_status = get_stream_status(stream_fd);
 			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
 		}
-- 
2.43.0

