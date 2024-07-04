Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF28C3DA45
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 01:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD6910E3F7;
	Thu,  4 Jul 2024 01:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lb7avSdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A1110E00B
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 01:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720055508; x=1751591508;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z/tUSNKALzrZoNEYoY3rL44K0KBwvF+MHFkHYbOy38g=;
 b=lb7avSdOmJi16cRVDx330eN8F2B6/V6d6UOmUEYLOmMzNPxG4kgYCYi4
 J7RAv+L6RI3qCwvdnR39u6P+Qo4cj+cgjgKC8rYB+LfdxRGXG2/72pCsA
 A1b6R9G2C0VGHodfuaPbH7hnleU7AInkIih2SSEjTsZMxD0HGn5vREAk4
 Si78Rxp+niPqTABHXiw/2ZESlm97WK8IzdWWWbDGu4OAvLHoYfdvPqWDw
 +mLziATaFiRf2i74l1LAY+JuuurvzVfT0WuwR9hpxjUdI83llZLP7IqZ4
 uQmaMvhQLsIUDqPhDWwuGicekKZzWJR6K8YImMNDUyilt2ek6L2vK5nYb Q==;
X-CSE-ConnectionGUID: KxsJ2RkLTGes/zzdVNUvkA==
X-CSE-MsgGUID: r63u5ebnTsmccRnYzgipMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17450023"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17450023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:47 -0700
X-CSE-ConnectionGUID: hmelZTV9SEmV3JtGjGNlCQ==
X-CSE-MsgGUID: gcgr02dpRm+ZLoAxeSQVRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46320153"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/15] HAX: Add Xe OA tests to xe-fast-feedback.testlist
Date: Wed,  3 Jul 2024 18:11:42 -0700
Message-ID: <20240704011142.2618968-16-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
References: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
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
 tests/intel-ci/xe-fast-feedback.testlist | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e64..bcd53fb98f 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,46 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+
+# oa tests
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

