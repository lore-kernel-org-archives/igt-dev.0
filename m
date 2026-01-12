Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88881C9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AD310E3C7;
	Mon, 12 Jan 2026 13:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjjsPVfm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF50910E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222832; x=1799758832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+N12J/xXQPjA+ooobx8VwlCR3T4fNGI4ALvzBtjn5Ec=;
 b=FjjsPVfmGDCdqYhyWIomTCbL3eNFa4W9olmUhcZF07RR20b5Z7jsJ5sq
 4HbR8gzCt7zwgOKZXNeekUsD6AEE42eqZ6ub3ljilYggGKflogw+MFRX3
 FWGtO1lw8/rBMpxNM2DnHb/+eRh3HeGjs09YOLDaLhfNdG9TKiYuVmXmf
 eoYIEomRjxN/zD8aZmiZKTD/dVR5+RxJ9db1EZWBm+VWQwebHITmL9xhX
 2Yq6VxBqdecCnpzfdOBZo7Xa+2gXyRm2+vJcHoScma57sAQ9gPojEqSH3
 tqWQnDz9UttPRp2tgXbXmAt7Zk6MyunKCliPSYNquJZhMs6B4YMiSLNIb g==;
X-CSE-ConnectionGUID: f+xlush8TWa6At8ySARBcA==
X-CSE-MsgGUID: 4cdy8K8qQi2FC2bB+BtRWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545524"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:32 -0800
X-CSE-ConnectionGUID: t8FhdIbXRaiz4aKlHCstwQ==
X-CSE-MsgGUID: M26OOy9oRBiMIvxB80HShg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094938"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:29 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 04/21] tests/intel/xe_eudebug_sriov: Align expected
 return code
Date: Mon, 12 Jan 2026 14:59:50 +0200
Message-ID: <20260112130008.1649357-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Align with kernel commit 387aba39b7be (drm/xe/pf: Allow to lockdown
the PF using custom guard).

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug_sriov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
index 1f150d0efe..8b318d48b0 100644
--- a/tests/intel/xe_eudebug_sriov.c
+++ b/tests/intel/xe_eudebug_sriov.c
@@ -71,7 +71,7 @@ static void test_deny_eudebug(int fd)
 
 	sysfs = igt_sysfs_open(fd);
 	igt_assert_fd(sysfs);
-	igt_assert_eq(igt_sysfs_printf(sysfs, "device/enable_eudebug", "1"), -EPERM);
+	igt_assert_eq(igt_sysfs_printf(sysfs, "device/enable_eudebug", "1"), -EBUSY);
 	close(sysfs);
 }
 
-- 
2.43.0

