Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3429DC30653
	for <igt-dev@archiver.kernel.org>; Sun, 30 Jun 2024 22:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE0110E2AE;
	Sun, 30 Jun 2024 22:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIhtJQCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2F10E0D7
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Jun 2024 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719788200; x=1751324200;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VAzG+7fSb6ifhi0VPiVmzaP/BrmDjknzm6tcQKMTtw0=;
 b=OIhtJQCzu5wDYPFTHEw1b1PzGzSGSjEI8Ld40i3X1sPLhw/a52Pmy3Ek
 PZfQg3Siy4alaVNOkhXfOzWImVk5kW8HMKIvyvZQtrlFZEw78wo/1P5yn
 HxabOrolal5aHujjETIs2TeX39tfRH8i6rUBUdGL3sjSDZIMjPKw5jMw/
 zK0C8VHa74zH1fL3dITqBN9Ylcnbgg00uOnc9/xa6mDMR35DlJ11INMEu
 wYWZBRK4Bvt63YlzUGtsI/6t3M64havvkVA/lVUNffIjudTXKb+fVcoxd
 UmgH7N/PvNOlGSO9p5Toaaw3HTwupFaeuJni0V9uIYlAzXCEX8MEl2Ueu w==;
X-CSE-ConnectionGUID: 0GE6NKT2QkqyVK77dwkfiA==
X-CSE-MsgGUID: gx8DohxtQ+uvfOrBQeSAkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="20763793"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="20763793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 15:56:39 -0700
X-CSE-ConnectionGUID: 6OPNx3pASiqQkBjuTFjl/Q==
X-CSE-MsgGUID: YYb49ff0T6O2MkbkeHnlMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="45216142"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 15:56:39 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/13] HAX: Add Xe OA tests to xe-fast-feedback.testlist
Date: Sun, 30 Jun 2024 15:56:34 -0700
Message-ID: <20240630225634.2404840-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240630225634.2404840-1-ashutosh.dixit@intel.com>
References: <20240630225634.2404840-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e64..a577452179 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,47 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+
+# oa tests
+igt@xe_oa@xe-ref-count
+igt@xe_oa@sysctl-defaults
+igt@xe_oa@non-system-wide-paranoid
+igt@xe_oa@invalid-oa-metric-set-id
+igt@xe_oa@invalid-oa-format-id
+igt@xe_oa@missing-sample-flags
+igt@xe_oa@oa-formats
+igt@xe_oa@invalid-oa-exponent
+igt@xe_oa@oa-exponents
+igt@xe_oa@buffer-fill
+igt@xe_oa@non-zero-reason
+igt@xe_oa@disabled-read-error
+igt@xe_oa@non-sampling-read-error
+igt@xe_oa@enable-disable
+igt@xe_oa@blocking
+igt@xe_oa@polling
+igt@xe_oa@polling-small-buf
+igt@xe_oa@short-reads
+igt@xe_oa@mi-rpc
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_oa@unprivileged-single-ctx-counters
+igt@xe_oa@oa-unit-exclusive-stream-sample-oa
+igt@xe_oa@oa-unit-exclusive-stream-exec-q
+igt@xe_oa@oa-unit-concurrent-oa-buffer-read
+igt@xe_oa@rc6-disable
+igt@xe_oa@stress-open-close
+igt@xe_oa@invalid-create-userspace-config
+igt@xe_oa@invalid-remove-userspace-config
+igt@xe_oa@create-destroy-userspace-config
+igt@xe_oa@whitelisted-registers-userspace-config
+igt@xe_oa@map-oa-buffer
+igt@xe_oa@invalid-map-oa-buffer
+igt@xe_oa@non-privileged-map-oa-buffer
+igt@xe_oa@non-privileged-access-vaddr
+igt@xe_oa@privileged-forked-access-vaddr
+igt@xe_oa@closed-fd-and-unmapped-access
+igt@xe_oa@oa-regs-whitelisted
+igt@xe_oa@mmio-triggered-reports
+
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
-- 
2.41.0

