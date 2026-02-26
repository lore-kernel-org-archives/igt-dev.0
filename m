Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FD3FC5910
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E78810E16C;
	Thu, 26 Feb 2026 08:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEPOUL0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6081110E16C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772094709; x=1803630709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vElp826IA4quH+9OxrHQeli0h9QF6yTsLDoRHmIcnwM=;
 b=cEPOUL0KIo+LzvT9TLg38nNr2GAoeiL4sLAzngK1dTXtAvHPq97sQH5h
 rHVCCv71AY58xEIfvBq8wL3HOJA0q9EmFfLX1rF9cPTAnz5asKrANJso4
 K3uS/rvGksW0rbtT2P5f2tPm68N1Zk1vr9grbD5oG9MnQpjA1xJ0Ppibc
 cm6/RUwuGpmLcTBY0B0zHFn8se1qAbGqfgVJT0QoZ0BYCfCXNZc7Kd/EO
 LTxV+AuRYGDdHcWFF6ozMvakc8VXkwYl8rcKYBYqzPUVFmvOpncweJRCb
 jOUst9ZjHE9Ks0G4I5ee1VhFQhhXvNN0bXAz6gVlz3UOjhmnEOhN3CDMS A==;
X-CSE-ConnectionGUID: /YZ1kDgoSdGbjexF0ol0EQ==
X-CSE-MsgGUID: CCg5O1AyQki+ZImEnqfQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72849658"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72849658"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:31:49 -0800
X-CSE-ConnectionGUID: oOkUGqxGQ4SK7J2zZH4dQw==
X-CSE-MsgGUID: LNHtmRtqQPKl8xu6fSWy4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214739996"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 00:31:48 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v7 2/6] tests/kms_flip: run suspend tests on one pipe
 per output
Date: Thu, 26 Feb 2026 09:31:11 +0100
Message-ID: <20260226083115.1747856-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260226083115.1747856-1-michal.grzelak@intel.com>
References: <20260226083115.1747856-1-michal.grzelak@intel.com>
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

