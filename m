Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED1B606A33F
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EbQLf51l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4985810EC27;
	Wed, 18 Nov 2026 15:48:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1CC10FE0E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016740; x=1826552740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTWzQKnybOvcs2eDFzPUnFTEz0Q3CKTfI+WiVpkNtAQ=;
 b=EbQLf51lRcIJyXNxAviKIEaBN5t/0ZYwcRqJ3Mig9wxOkwIPGwXQK6z5
 rHHHqVG1VrpWBkHhTdhOms8rQJsYynriTtJg/aKD5XKmrfqW1yszJDKYh
 TXi16DdQ+cMPZ9tpQpLN+x0tn25FsLT/MPMw8+TRXSAjU7DMzsckTp4A3
 J+uZz8Hv0TK2v9C4gCM2mvDjxTQIuYpEiDUqauIJpgh/D/nRHdrbYXcyB
 0r7nN1QkkJfD7dB8Ov6jx6qnxSXY31mM+XpXZGTePEcJlg+OnfijeQYro
 T5RyThUmiKpuqzfVLun50xlog1OhTKgHtNRo6N6IdtY1eUBaee/A42AH+ g==;
X-CSE-ConnectionGUID: fL/c8L7hSEKaVgPxYqGDoQ==
X-CSE-MsgGUID: HM3XXqZ6Q32MPFZHOv4zrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720364"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:40 -0800
X-CSE-ConnectionGUID: KFZXMAeVTQOtSfOI6G7Nuw==
X-CSE-MsgGUID: lKAt0HbmRy2FkPmzacMdYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319395"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:38 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 4/8] tests/intel/xe_module_load: Check intel_display in
 load subtests
Date: Wed, 18 Nov 2026 21:14:19 +0530
Message-ID: <20261118154426.345883-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118154426.345883-1-jeevan.b@intel.com>
References: <20261118154426.345883-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add intel_display to unwanted_drivers so the load subtest skips when it
is already loaded and force-load unloads it first.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/xe_module_load.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 0c75c4ebc..ae6c6708b 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -94,6 +94,7 @@ static void load_and_check_xe(const char *opts)
 static const char * const unwanted_drivers[] = {
 	"xe",
 	"i915",
+	"intel_display",
 	NULL
 };
 
-- 
2.43.0

