Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EA1CAC587
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 04:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98AA10E0B7;
	Tue, 16 Sep 2025 04:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2xwSRt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8F10E09C
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 04:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757995628; x=1789531628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yLjOQ2BWm5CodkLweoJ4mPe92XR+IVfiSkcC+XTcS3A=;
 b=J2xwSRt0G5G+0nRH3oCDEGzH+oKRY8XQxR/JE/1S/Md7+3HYV0Nd61AU
 4ycwg8ENXmNMnljskUQsFFa4/lFyj7BRcX2ZMuMFD3xV5UmIvV/hoUkIr
 QdsddKM/r7ucy40YwgekpSBrukfHXUqugmOOcOoAk4uGFD5O/lu+f/b57
 X2i7zFWfd3Shho5VsUo/WegZWOBeqNcJMvHiN2w1WQ+6ZmC+FznA/8Vt3
 PNwqu3y8j5kpQHy7BgVOjSgH0K130We9TEFQjiSKHS2fqDlF8WW/Kw1cN
 aXAQU6q2aLmyeDzWzqzamg8CejR+UOraU5wBF8Nk7jwliUqdjq1j5kJPd w==;
X-CSE-ConnectionGUID: hX+0ZC5NS2GxOCWeXz8DNg==
X-CSE-MsgGUID: h2HTug99RvCbuH4uuVftoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60319792"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60319792"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 21:07:08 -0700
X-CSE-ConnectionGUID: gx/X+LwIR3CBxbuvXLcgEA==
X-CSE-MsgGUID: mlcdO+BlSg20TcK3EzLpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="175612769"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 21:07:06 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, vinod.govindapillai@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_fbc_dirty_rect: Limit to one format on
 simulation
Date: Tue, 16 Sep 2025 09:34:55 +0530
Message-Id: <20250916040455.267648-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040455.267648-1-santhosh.reddy.guddati@intel.com>
References: <20250916040455.267648-1-santhosh.reddy.guddati@intel.com>
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

limit fbc-dirty-rectangle-different-formats subtest to execute on single
format on simulation platforms to avoid CI timeouts while still
validating functionality.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index b187a5942..c3a86aeda 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -510,6 +510,10 @@ igt_main
 				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
 				for (int i = 0; i < num_formats; i++) {
+					/* on simulation platforms , limit to single format */
+					if (data.is_simulation && i > 0)
+						break;
+
 					igt_dynamic_f("pipe-%s-%s-format-%s",
 						       kmstest_pipe_name(data.pipe),
 						       igt_output_name(data.output),
-- 
2.34.1

