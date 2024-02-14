Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6730C48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C864C10E1BF;
	Wed, 14 Feb 2024 06:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGRcdv6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825210E12C
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893142; x=1739429142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8LHOCENCdY6onToJ5VvQOlMDe14M6D9m1r99kFgyzo=;
 b=UGRcdv6O0P57/oKPpn+LMLt2n4MEsC82ddYTExrFopC+MclEKBB99oD3
 CU9OB2lff9Kd5mdSt80HR67Y/7SSHWDCeTO90AHZ5SP/hiCIVYC3/+1zu
 2dbMCltl8ECvALygZViqYu2PmiVMH4a68S4ci0oQQxxRBNPbB1VWB/Quk
 I/Dng+xyRyrU+5rBVcLKSs65X9PqYNFpuTNsb2Y+XA0M+CG+hzLVh1YFp
 isBpqozot8MIEk7pRMrNSCRkPyEwcJT9aYL5PHOaq2JJ97UOGb17GzRhy
 cdrNV3SYiRYMNeIxfU9XO/9fLO9XvrwhD6LhDMJ2Yq4d70gPWzNePVNFA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645414"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427545"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:40 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC v4 01/22] lib/drmtest: Add is_vkms_device()
Date: Wed, 14 Feb 2024 12:09:32 +0530
Message-ID: <20240214063953.1285495-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

From: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..7df9bd0b7 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -106,6 +106,11 @@ static bool __is_device(int fd, const char *expect)
 	return strcmp(expect, name) == 0;
 }
 
+bool is_vkms_device(int fd)
+{
+	return __is_device(fd, "vkms");
+}
+
 bool is_amdgpu_device(int fd)
 {
 	return __is_device(fd, "amdgpu");
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 6bc819734..ddf8ae083 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -121,6 +121,7 @@ void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
 
+bool is_vkms_device(int fd);
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
-- 
2.43.0

