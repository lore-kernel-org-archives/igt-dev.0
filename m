Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E4BC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 07:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157810E6D3;
	Wed, 30 Apr 2025 07:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/QWP7Es";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA22A10E6D3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745997754; x=1777533754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xg2/ZihTT+A7sJ7Zbr6cn4uWKhD2aXLhgzMmly1gLPA=;
 b=Q/QWP7EsN5N4FwAAjqtUWHxvSfSqR+rB7HzXbwVpP4AXqalvy+cYbjT+
 r/Cox3YuQdyF1qq93QLnEG6yKHP09zLpmv0FL3+XpcdcS3Tw0ZswdLZYc
 yvWM54ttlNF8klNzyfffY5cfZ+YHHA7uzuaaIXr6tHMTPjED/Nl1JPvPP
 IdFofNyVXl7lDCf1J9EKKGiJDLWArF6N3rGToYhIn1+BeiN5AqBKBmD7N
 rjvMQbFLYyaOFebldwQV1SnGxLhhwWCsDcz7DGzuzVVXpcIZCtiybQPDW
 WZlrDt51r0GT1u0BtEICj0kuuyoy0f/CAVS0gmftee+U5Q44N/OyGlemP g==;
X-CSE-ConnectionGUID: o6G5l1vOQGWzVBKmjEl4FQ==
X-CSE-MsgGUID: 1K+h00zwRwSdRxQSJei2HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73031270"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="73031270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:22:33 -0700
X-CSE-ConnectionGUID: 0fI23qIgTWOh8RKJXufKqQ==
X-CSE-MsgGUID: LCzffDLwSRCu1apUQDs2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138056317"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2025 00:22:32 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Date: Wed, 30 Apr 2025 13:08:43 +0530
Message-ID: <20250430073845.30093-1-satyanarayana.k.v.p@intel.com>
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

When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
functions, the CI test systems are going out of space and crashing. To
avoid this issue, a new helper function is created and when fault is injected
into this xe_should_fail_ct_dead_capture() helper function, ct dead capture is
avoided which suppresses ct dumps in the log.

Inject fault into xe_should_fail_ct_dead_capture() function along with
xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.

Also, added some more guc fault messages in the dmesg ignore list.

Test-with: 20250429134649.4747-1-satyanarayana.k.v.p@intel.com

Satyanarayana K V P (2):
  tests/intel/xe_fault_injection: Suppress Guc CT dumps during fault
    injection
  tests/intel/xe_fault_injection: Ignore faults for *guc*

 tests/intel/xe_fault_injection.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.43.0

