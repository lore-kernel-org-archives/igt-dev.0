Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE0FEFCD6E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1074710E4B8;
	Mon,  9 Mar 2026 09:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/tlEHFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC4B10E4B6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048343; x=1804584343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vElp826IA4quH+9OxrHQeli0h9QF6yTsLDoRHmIcnwM=;
 b=K/tlEHFx9p3gpZ6lLavR1qhc1emyHyJn7Ta1nR3HCvWnQiA1ZoRmjNO6
 D5+0A6tjmKb26ZLg0JKPijzu0IYtn/upNPIKCO4CJASc6dD3rVwq1kt0H
 Cq5r5plqSp4pOz9Px80ohPFxpvjZw9tL1kCkMf0ttoq36s/98wsGaNRow
 dzBLolgWeT934QCublUIbFvsKcTSMKnORQE9z30Vsw+EjQKh+MswjIyLH
 Qtp1bUruay+cSx3cU2VtNXcTW/Ts/7KJFRwVLovUX0FBIBKUK3rA2J5qb
 LZc0jDzDRDmtvnSNsE0mqbBM2mpag+7h29wukL+FWg22aG6XX0PpzQzbv Q==;
X-CSE-ConnectionGUID: QCdfhWugTV2lNWGAo4OXkw==
X-CSE-MsgGUID: C+frTMHZQkeDWKMVUJ1n/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77918368"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77918368"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:25:43 -0700
X-CSE-ConnectionGUID: MzE7WfGDQg2fUALtVYlrNg==
X-CSE-MsgGUID: PxyZFgIeQOm/twsjE48vuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="257620301"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 09 Mar 2026 02:25:42 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v8 2/6] tests/kms_flip: run suspend tests on one pipe
 per output
Date: Mon,  9 Mar 2026 10:25:24 +0100
Message-ID: <20260309092528.3336467-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260309092528.3336467-1-michal.grzelak@intel.com>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

It is not necessary to test suspend on same output but different pipe.
In case of suspend tests, limit number of dynamic subtests run per
output when any pipe has already been tested.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_flip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 8bda82627..d09813f02 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1844,6 +1844,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1876,6 +1880,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
-- 
2.45.2

