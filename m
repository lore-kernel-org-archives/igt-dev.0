Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DF7C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 20:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BB310E2BC;
	Fri, 18 Apr 2025 20:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aalifoEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A8F10E2BC
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745009515; x=1776545515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+QHKT94vZd7+bXvQ5hotUbkmAGdBtEl5xCn/nUqhwRE=;
 b=aalifoEzXVPe1OjMICnXW/O75+h53bs6OhvWAlgUqULdTpA7Ldt33csh
 /kDSL8ciDiVtSSdczGuQPMo4mZ3SGenpeh5YJfXjzoORh4E5NsOLasKug
 Vi3vVHlZyteOkE7NZLQMm/V8CbMMhTz2nPhhqIE5DxbObj1TnSlUCKya0
 7EDSGFlLSuplE1p7PRW+t44dsRNCWbz+pvFpumAWpunr2QuTfY/SXWb/r
 gYlcq9LEMRHfEjCqptUpzoXsv4ymyIZA73cY9/CAt0HuY0bA+Q+GQy6gr
 Ja/I5F/vYjDLN+++EswmwBOebDnhixNy5D1dZUR9MSuejIdfidfnVnwPy Q==;
X-CSE-ConnectionGUID: h9zfpx4YSWGHN3PL9O5Nhw==
X-CSE-MsgGUID: ZsKnR6/BRu+Nf8yUBwEqhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46746593"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="46746593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:51:54 -0700
X-CSE-ConnectionGUID: BziyOT7zRXWRbxMUZZDYlg==
X-CSE-MsgGUID: aGSerlzzS2iYtj9+YzdNJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="162252449"
Received: from dut4046ptlh.fm.intel.com ([10.105.8.209])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:51:54 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 umesh.nerlige.ramappa@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH] tests/intel/xe_oa: Remove buffer overflow guard from
 buffer-size tests
Date: Fri, 18 Apr 2025 20:51:54 +0000
Message-ID: <20250418205154.345960-1-jonathan.cavitt@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4541
Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_oa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1fc8bfaafe..7d13bd340a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2503,10 +2503,6 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 	while (total_len < buf_size &&
 	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
 		(len == -1 && (errno == EINTR || errno == EIO)))) {
-		if (errno == EIO) {
-			oa_status = get_stream_status(stream_fd);
-			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
-		}
 		if (len > 0)
 			total_len += len;
 	}
-- 
2.43.0

