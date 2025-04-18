Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAE0C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 20:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E04310E2C4;
	Fri, 18 Apr 2025 20:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBam2xVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E8C10E2C4
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745008927; x=1776544927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+QHKT94vZd7+bXvQ5hotUbkmAGdBtEl5xCn/nUqhwRE=;
 b=YBam2xVmQoHC5O0BBy/BOIQkgsAyKZEOzUaqwViKsQ+E1d6RE4gkFzPj
 oDEawt1Mi/snRW8IyI3tegJb7FXiacbvVXBU6FCEoepGgw5ytO8sJfMqy
 8BvBkEQCPMMYUr0D6t+P4dc+zHANXJXBbq3CFUODs6aXpibskiIeET1uu
 YjWFpl8p7UzTzLTxhziOXjowv0oZe3SjoGsgR9YIPceQAltNkS0AqewUI
 bBMHr3DhmaCRdhDxk17ECfWWTpmf94eKnnqpXHuXBc8dC8t38P/n7t17t
 6BCDzyXC0yaJkrrwr0DTNsjfdFxXGi7TbvvDF+FHGZ3mSWduGrPziJk1l A==;
X-CSE-ConnectionGUID: gRWfVA/0S+e8y0Kftx1/xw==
X-CSE-MsgGUID: 1NwcgWSTR4KyWd1mjuKPpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="72034672"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="72034672"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:42:03 -0700
X-CSE-ConnectionGUID: PWPtXFk+ReWRdZvqDowsww==
X-CSE-MsgGUID: KQDslL0VQratAL3CIFE7TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="162250582"
Received: from dut4046ptlh.fm.intel.com ([10.105.8.209])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:42:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 umesh.nerlige.ramappa@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH] tests/intel/xe_oa: Remove buffer overflow guard from
 buffer-size tests
Date: Fri, 18 Apr 2025 20:42:02 +0000
Message-ID: <20250418204203.341078-1-jonathan.cavitt@intel.com>
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

