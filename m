Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ADFC3ABAA
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 07:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9E710E6DA;
	Wed, 30 Apr 2025 07:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg2xdpJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7110E6D9
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745997757; x=1777533757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4WFDWt/JE0IZaDtDuH6Nai9So4TMqBfVMX/CNB3/aL0=;
 b=Zg2xdpJ8ByrPrW/xVNcgik+YWGFIMTwW3RslgJtKlvf0y3zKJ3HTVVXU
 xFfYkLQ0DxZaeiLM4Lz1ZguufUJRGBOnd8Ll5ppUJ4lS2x+dWq2dfbqYc
 2L6y/SgmnSXhfIl/Yc5c0fM2CqRtLLM4dwkosONU9lYwRYfHGSG/MzWkp
 yRTCm2UJZkUV9cjCDuuQrARQ4Vr6V7oyhOV/o52/5UOOe9H9LXRWhXlEV
 gIqCiuhsB8k77cgITbCy6ECOM7EDGsrYHPXUiWRb1PO4QV/KqVaAemhDX
 XzrF+kzYFOZ0eftV2A56+VbZK+rUNb4uuwYMnWBKVsusxZCH7MZQpR0Ki w==;
X-CSE-ConnectionGUID: HMixshMbRVeZBCU5qIJvYw==
X-CSE-MsgGUID: KkH9ymWDTnaJnQppZVsCiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73031278"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="73031278"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:22:37 -0700
X-CSE-ConnectionGUID: cx7QnE0rRiWUY1Z6JyAFRA==
X-CSE-MsgGUID: iFZ26d22Q0Oeg/S6CLHeEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138056343"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2025 00:22:35 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Ignore faults for
 *guc*
Date: Wed, 30 Apr 2025 13:08:45 +0530
Message-ID: <20250430073845.30093-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430073845.30093-1-satyanarayana.k.v.p@intel.com>
References: <20250430073845.30093-1-satyanarayana.k.v.p@intel.com>
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

Add some more guc fault messages in the dmesg ignore list.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 82d730a7c..f293ac8af 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -83,6 +83,8 @@ static void ignore_faults_in_dmesg(const char function_name[])
 	if (function_is_part_of_guc(function_name)) {
 		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
 		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	(-ENOMEM)");
+		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
 	}
 
 	igt_emit_ignore_dmesg_regex(regex);
-- 
2.43.0

