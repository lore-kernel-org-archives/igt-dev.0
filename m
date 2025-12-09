Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BAD3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 11:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61C410E1CE;
	Tue,  9 Dec 2025 11:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1p/sNqt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968EE10E523
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765279133; x=1796815133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XZTrDgq/YmUgDZ+q6/LWw6Cp6T5+oMfBIStU0sgnXI=;
 b=L1p/sNqtUvPw19UT5kegNpdVbmT8R5SEUDOaXtouMBZz52hlPtc8DVqZ
 UCwOwOO0GVX6PkgV0ek+DdTVqSdPgaZtvo/E8aTBZTXv5s1eBMTQhQyPi
 kS3FlMpgYeB8Rt01b8nRVW/usWyA5tJBkuTKQYa+Q5TUPIeOR/rg8hWdq
 gvBEYO3s28AtK3sDBS7euhq1zBbY8ru3gm5R1kHoeVZzZT+2nFEJ1vi5s
 r71pDAftEw5k9/z0trblDDZarctN+RqlZNkceqVbnbrQhemFDfM3oiAa0
 bZAQN8Yrzinmzxxd9Pb65Vp5IR5z4zBxDREwxcaQvt3NcPgpQhnr+17Et g==;
X-CSE-ConnectionGUID: r+5XHEG8RyyLgYwghqrgVw==
X-CSE-MsgGUID: po+9/x4lS+mbCDePaRxw8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="69823750"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="69823750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:18:53 -0800
X-CSE-ConnectionGUID: godkqPqCSzycYJ8lBHGcBw==
X-CSE-MsgGUID: H4lk1j0qR7i4YcWc65rU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196212365"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:18:50 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 2/2] HAX: Add throttle_basic_api test to fast feedback list
Date: Tue,  9 Dec 2025 16:41:29 +0530
Message-ID: <20251209111126.1155774-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209111126.1155774-4-sk.anirban@intel.com>
References: <20251209111126.1155774-4-sk.anirban@intel.com>
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

Add throttle_basic_api test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..62eaf7078 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -134,6 +134,7 @@ igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
 igt@xe_gpgpu_fill@basic
+igt@xe_gt_freq@throttle_basic_api
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
 igt@xe_gt_freq@freq_range_idle
-- 
2.43.0

