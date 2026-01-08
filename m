Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90C3D148A3
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 06:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E2B10E699;
	Thu,  8 Jan 2026 06:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYA2OZV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2033710E699
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767855577; x=1799391577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HoDcYmFih7k2fu1ZBougeMfSdvPfoKunmxWEmfBm4wE=;
 b=nYA2OZV4gXwIvMd7dq2nDLN6U96lxsVJOl1h7Fh5rht1rDdHO2bM/zBK
 CDob7fyPeDMg5jNw28TgXQ0SmhQKUpU7hjUDE/tt/Rmq3fWDiGQu77a21
 3cKVRW5mG6F6I200ka+M/W2RbM7uKNhnzQE8IRw6u2bOLo8I4w+S4K3C4
 bs0RIUZO4Lcyx9nnFrM35bDzKb0B9hBKhmmXQ5FFdZSP5MpWo9oO6cD6a
 Ku7nEzCvnmaf4fWkx9f3WKM8B2M76cF754nR5E1I1mqeopYanbtdk19Sn
 cSRtLzQYJ7sa5I5st0ZTwv9VJJgbymAJ1vtGTDQ6e/gv9LRhnhoS5kG00 A==;
X-CSE-ConnectionGUID: yj5o0Q68T5eSPUtPGcYhow==
X-CSE-MsgGUID: 9QcYbISoTgCvO56EIAMUpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73078775"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="73078775"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:59:36 -0800
X-CSE-ConnectionGUID: OK4QhMPiQC+q3ls2rmPBQA==
X-CSE-MsgGUID: t2+bdpDoQTSCrf4v1St79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="203034242"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2026 22:59:36 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 4/4] intel-ci: add xe_pat compression subtests
Date: Thu,  8 Jan 2026 06:59:33 +0000
Message-ID: <20260108065933.409757-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108065933.409757-1-x.wang@intel.com>
References: <20260108065933.409757-1-x.wang@intel.com>
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

Add xe_pat compression-related subtests for early regression coverage.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..3faf84ad6 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -204,8 +204,11 @@ igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
 igt@xe_pat@pat-sanity
 igt@xe_pat@userptr-coh-none
+igt@xe_pat@userptr-comp
 igt@xe_pat@prime-self-import-coh
 igt@xe_pat@prime-external-import-coh
+igt@xe_pat@prime-external-import-comp
+igt@xe_pat@bo-wb-comp-1way-bind
 igt@xe_pat@pat-index-all
 igt@xe_pat@pat-index-xelp
 igt@xe_pat@pat-index-xehpc
-- 
2.43.0

