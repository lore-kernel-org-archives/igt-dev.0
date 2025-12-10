Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C5CD2CE17
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 05:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF5810E09D;
	Wed, 10 Dec 2025 05:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNDf6flW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D9C10E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 05:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344409; x=1796880409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ojXIo2R0g6gq/2z0HVKgZ6tH/cgJaWbZwH93j7LttLU=;
 b=WNDf6flWiVuYLmoceTWXSsdpnRwcM12kiWcY4seshJgyaSMMYKT94Cuy
 n5Z+wNR9EokUBtmh1BbUd/rwLv3n13MOQYRjAOApNpHwZPnDmC84Uj+4P
 PzZWMMv5Mb+wa1qMtBMD+4TTbObj4I5pxaqD3ocB/ZyJxGawL1+ymW3Wl
 XbWtglKnr2msgoJZ/3aAUHQogb+Ptwwu3vbVgq9+RVR42l6dj13qvP6Vg
 RyDJVhcK8xhaUeNxr+pfCqxcXsup+x1Dv5pGv6tN7B4cTlNzBnThngF1/
 keGNCG0cinMlLVFIHooPON+yZJwzdJBO5kWceI3uXB+mcONjfv50HhieU w==;
X-CSE-ConnectionGUID: jG6JDO7GRPe8LEtUn+L+zA==
X-CSE-MsgGUID: CIslSGFsSgu4bcEQE8J/Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="92785553"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="92785553"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:26:49 -0800
X-CSE-ConnectionGUID: xi24ovwdQa2WG8eIlNwyjQ==
X-CSE-MsgGUID: IlgXTnHRS+Sgyw/6ykd/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="201348341"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:26:46 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 2/2] HAX: Add throttle_basic_api test to fast feedback list
Date: Wed, 10 Dec 2025 10:49:25 +0530
Message-ID: <20251210051922.1186869-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210051922.1186869-4-sk.anirban@intel.com>
References: <20251210051922.1186869-4-sk.anirban@intel.com>
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
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 15fce6a42..bd5b1789d 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -135,6 +135,7 @@ igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
 igt@xe_gpgpu_fill@basic
+igt@xe_gt_freq@throttle_basic_api
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
 igt@xe_gt_freq@freq_range_idle
-- 
2.43.0

