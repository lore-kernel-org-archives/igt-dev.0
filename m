Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2681FF4958
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E72B10E3EA;
	Mon, 30 Mar 2026 07:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBrXAcKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002DD10E3EA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857315; x=1806393315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5s7h+kai672vXyFaU/YF97/JUb4mbcR73wXviDx8klM=;
 b=SBrXAcKShHTpno1zpXdDxbua7Ol7y5sH9vtU87dQC8zt+nRgwtR2R3k2
 ZB6upC6P+8m6/kv1Svsy+W1+hUNtBeUnBFtQpgFFUUqb6gtie28xs9ctp
 SdaM+rtHyj1n4ZDbbjaMKbmSOGSzPBWZR7/Sx9FoNBXkFmR+3RyGvf83E
 eItnExk2ikzZL+XANSM1RD/f/1Uc8fh2lrpAC9k2d53PbxBcZZn7HPZ46
 pKm7FonrkXo5wrt/lJ+kjcELTKJFbgDulbFR6FUAvXDKAF3JZRcAQUMgN
 iKWEawEKp62e9Y7eculRfAAMLKOepPCdcBzmGMs0cuQxjzSXz0ElSmh6R w==;
X-CSE-ConnectionGUID: Wd3TXe0bTNiVEMu/0pZehA==
X-CSE-MsgGUID: uPoTn55qQBewViSfHqKVnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75729065"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75729065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:55:15 -0700
X-CSE-ConnectionGUID: jASymFDRT9CNDCTnCojCaQ==
X-CSE-MsgGUID: 9BH9533MTSKBcoZAKl8uOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227595614"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 00:55:13 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v9 2/6] tests/kms_flip: run suspend tests on one pipe
 per output
Date: Mon, 30 Mar 2026 09:55:04 +0200
Message-ID: <20260330075508.1003899-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260330075508.1003899-1-michal.grzelak@intel.com>
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
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

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 7d2143889e..2a843800b8 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1848,6 +1848,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1880,6 +1884,10 @@ static void run_test(int duration, int flags)
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

