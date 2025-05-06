Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE419C3ABC0
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342210E347;
	Tue,  6 May 2025 13:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MULygMUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F74810E347
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746539260; x=1778075260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NuetKdRVwVn7/g8MIEm7WYointBN7wLfS31Q49JB5rc=;
 b=MULygMUIBMFEPqsfdpPRDjAX8YUJeEDmSuwjmQm/zHrPVAh23EiWlMrK
 7HtSjswMs2yQE+NyyBy2YiuiJB+mvCDjUROJSIo7o+A2i0Gl/7pA3uBjG
 9SI8EfR+g8MNEDoHyzRGLwLVCQ5m5B61Gd0RAyUaMjoPGkAvlT+RpNuQZ
 8ijReZzzu1kz+73AfQkBhjlvT10MLyYGJvb8qOjkSBTNC3cTGkksPnGkR
 hfBgSlz6vKO33qbofjWGdZSfOmvNr8DRnFXZ1DYYmBfm0sm5SvDZsyiqh
 wRKnblxSMGbtIKKz8Sj/fcZXQvmMeIcrfRFRCbyrEbkyOq0tr/WqmhT8i A==;
X-CSE-ConnectionGUID: 4nVwFVyPRcO2i4kkDx+2NQ==
X-CSE-MsgGUID: ykiYxWv/Rwix3TkkVG2AWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58865731"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58865731"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:47:40 -0700
X-CSE-ConnectionGUID: tYc7C+gKTCyWQuyBbVDoCg==
X-CSE-MsgGUID: FK8VC1JhTamQszyfc/WBJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136568377"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 06 May 2025 06:47:39 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Ignore faults
 for *guc*
Date: Tue,  6 May 2025 19:33:51 +0530
Message-ID: <20250506140351.29612-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
References: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
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
index 82d730a7c..10374d23e 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -83,6 +83,8 @@ static void ignore_faults_in_dmesg(const char function_name[])
 	if (function_is_part_of_guc(function_name)) {
 		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
 		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
 	}
 
 	igt_emit_ignore_dmesg_regex(regex);
-- 
2.43.0

