Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F885EFCD6F
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013A810E4B7;
	Mon,  9 Mar 2026 09:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eu3mco5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981E10E4B6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048348; x=1804584348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4QFiX0qh2MdkgX/oBOhKmGM6BOvPfvkIwoxNyC4kY8g=;
 b=eu3mco5RdxDN/32bC8Mk+NsipxemvYauDx1Ic/CJV1CgNcHunuQPrpM9
 Xk36bj/hhKy5v/PjrUDgtBY3uBazM3UZXdtqkgaMSUb7jZyVq5DukjQy7
 M74B2CNif6rKNkDj1IWQ5AXr8qzhXkhYAikILchAHEMmCh1syUyzLBAUF
 gyUyl1NhJzOg9BfcTWfEqoc4wnxgX80Ke9auWKjXHrXuC69HhHfGMBJ87
 yp86osc6NO14LVUwPAp3ZsXrvTLK+ehNn+17KZOlvbGG4a+JnzJFfkRyT
 BE0fBfrswT1Ex1IFSPKewDPw1LJqawd9Ukwl7EC5T4O4dMvN5WvTDegMN A==;
X-CSE-ConnectionGUID: EkIDTpWwSo+7FdjTT3nUtg==
X-CSE-MsgGUID: MdR1+j/ZR/enJIisjNXsJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77918378"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77918378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:25:48 -0700
X-CSE-ConnectionGUID: FDAQbHp9Tzasdw6MQprVBg==
X-CSE-MsgGUID: lMEPLWABQ2KqgEpmmBZquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="257620341"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 09 Mar 2026 02:25:47 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v8 6/6] tests/kms_flip: test suspend at most twice on
 SNB && BMG
Date: Mon,  9 Mar 2026 10:25:28 +0100
Message-ID: <20260309092528.3336467-7-michal.grzelak@intel.com>
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

gettime_us() on SNB and BMG does not return proper time after starting
suspend tests. This results in too many suspends issued before we hit
the duration_ms. Break the loop on second execution.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f17d027cc..3c5428ff0 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1322,6 +1322,12 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 {
 	unsigned long start, end;
 	int count = 0;
+	int devid;
+	bool wa;
+
+	devid = intel_get_drm_devid(drm_fd);
+
+	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
 
 	start = gettime_us();
 
@@ -1342,6 +1348,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		if (count && (gettime_us() - start) / 1000 >= duration_ms)
 			break;
 
+		if (count && wa && o->flags & TEST_SUSPEND)
+			break;
+
 		count++;
 	}
 
-- 
2.45.2

