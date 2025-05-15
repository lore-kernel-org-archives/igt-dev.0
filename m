Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE672C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EB510E94C;
	Thu, 15 May 2025 19:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnfCqr9g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009C10E951
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338778; x=1778874778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vQ1qYyT8la5L8/imrHMjxwQIUzrpxrpye0aT71KYBrc=;
 b=PnfCqr9gLFyRzDdl3piK42YjeEkhduvUsMndGcc0F9tWiIT+QW62eSjv
 9sG4PC6vCUBqof2ZFkfKhjLxobtEh4/Nhklo3H5xR5dJsn3dkPV1gg+eg
 TAJX0oFly4vzDLXizGCXuGKLIIhziOqx+f4OQtHeqNMTciKLSz3PNB3Mx
 mz19m1CaFbS2+Y4U4cllfQaVBrom5EQtpdxBhPlyXFlwoiSBUsO+D27Te
 4PCflxYtOpRjM4NuX1UeSh1BTnx3kLTB47mNPHNMoY5HpBsRQrw0yJZKE
 nkRWRLUaCN4RGQvb3WfVDameCEAQgjg8uqkF961Tdqu1yN+ApPPehtO6a g==;
X-CSE-ConnectionGUID: dzJFDthVSUeJEvIuRfh1xQ==
X-CSE-MsgGUID: MnNMh3kYQByQ+CNCs/ESow==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454485"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:58 -0700
X-CSE-ConnectionGUID: 5KTfyQssRdWT60TSnM05Ww==
X-CSE-MsgGUID: hA5IIsZ8TM+U19V+devDxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347400"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:56 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 11/14] tools/intel_gpu_top: Replace index with strchr
Date: Thu, 15 May 2025 19:52:04 +0000
Message-ID: <20250515195207.106414-12-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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

As index is deprecated, replace index with strchr.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tools/intel_gpu_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 68d27089b..54e71e559 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -290,7 +290,7 @@ get_pmu_config(int dirfd, const char *name, const char *counter)
 	if (ret <= 0)
 		return -1;
 
-	p = index(buf, '0');
+	p = strchr(buf, '0');
 	if (!p)
 		return -1;
 
-- 
2.34.1

