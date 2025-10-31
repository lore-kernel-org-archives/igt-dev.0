Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110ABCCF9FA
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 09:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CFA10EAEB;
	Fri, 31 Oct 2025 09:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaYgqzWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A4F10EAEE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761903579; x=1793439579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1tK2GHQ9mIxCAdxse3JQHbsZji8nLmXPSrL8zoVpN4=;
 b=SaYgqzWJUok6IAaa9nJRr3VmdhwS4ZlWoZKacPv9pfru7PrfnXj/rRmJ
 4eCRIZ18syChenYffgzC0TwCXOKOBQk8zYGOncwIf0qNzvr0Pds07pPu2
 K+Tr2gxCheOOud7pJvKPy8v1giMqWnm2/0M0u4Ru/okxT92WjgedkqSn3
 lSD/bjW9IHyZEzz+Kvf4FMAGq1PxrXj0GZcvXyU3QH6N2+xLvoex8D7xB
 ljuqQnjN6NBWQs05e8gmUzs77fncaMlexgViDRr2WROSX7WF3E/R/PvRE
 onyIGS0Ip6GQVN9mnGgR0YTOzI5XtprpQbl8ZC1cM3MA0L1AJSPWUaoUD A==;
X-CSE-ConnectionGUID: xwIM0vWCSQ2IYn3DM2qg4g==
X-CSE-MsgGUID: sVlzk78PTe62qgqZvr0how==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86686895"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="86686895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 02:39:39 -0700
X-CSE-ConnectionGUID: zeVDQntnRuexgdCai7UzOw==
X-CSE-MsgGUID: XkPnZnvgQtyR3IEy5e+lhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186311876"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 02:39:36 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v9,3/3] HAX: Add xe_survivability tests to fast feedback list
Date: Fri, 31 Oct 2025 15:04:54 +0530
Message-ID: <20251031093452.3842245-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031093452.3842245-5-sk.anirban@intel.com>
References: <20251031093452.3842245-5-sk.anirban@intel.com>
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

Add xe_survivability to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index e64fdf400..9e3713eff 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -188,6 +188,8 @@ igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
 igt@xe_survivability@i2c-functionality
 igt@xe_survivability@runtime-survivability
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

