Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555B5CD37B6
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 07:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236D510E6A3;
	Wed,  4 Sep 2024 07:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9Xar4MU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CC110E6A0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725435508; x=1756971508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0qOa0FT6TiglRG4WICSNmT+puVmmBhaHbv+qGYgYhXs=;
 b=C9Xar4MUS1W/36WS0GGr/QbNyWjvtptFXIhG6RDPoHNamhL6LESvtlFW
 E/a8QPswO/vF3fMzXSuJCijbFLBnqy+qXKi2HdlNVbqvX+SmBfoAhBuzn
 oTl8+NJVzO99QnTXlIhbivpJmqZADpFYRLTwRPU9dPu95Ca0PAuhAa/aV
 QoBM26/WgvoYM8/Zi2MmOIx5HkUVWk7PudgsZ+SGDAQC4eIAuCVhTSv4D
 edVbd67PTbhiDPUn+pSedozv61xxjbSJPdWaHy7fATUaasnztK0j/73wV
 +M2TwXykWft+hBDo87fQmtxTfrtBLaOtFmQpM1m8oOzP7JjS7oCcyRMI9 g==;
X-CSE-ConnectionGUID: oq50FbRsRICuo+Lb+cZt9Q==
X-CSE-MsgGUID: M8a7iFyMQaSmXOTY3VDHAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23953741"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23953741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:38:18 -0700
X-CSE-ConnectionGUID: 3GmFp8y1RleYF5TDOkZuvQ==
X-CSE-MsgGUID: C/RxTFTHSnCrtCQeNazHrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="64997084"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.15])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:38:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/2] lib/intel_batchbuffer: Fix igt_require in
 intel_bb_create_no_relocs
Date: Wed,  4 Sep 2024 09:38:03 +0200
Message-Id: <20240904073803.3239-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904073803.3239-1-dominik.karol.piatkowski@intel.com>
References: <20240904073803.3239-1-dominik.karol.piatkowski@intel.com>
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

gem_uses_full_ppgtt() calls gem_gtt_type(), that expects i915 drm
file descriptor. Wrap the igt_require in is_i915_device() check
to fix the issue.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/intel_batchbuffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 72e2a5d38..93477661b 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1234,7 +1234,8 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
  */
 struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 {
-	igt_require(gem_uses_full_ppgtt(fd));
+	if (is_i915_device(fd))
+		igt_require(gem_uses_full_ppgtt(fd));
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-- 
2.34.1

