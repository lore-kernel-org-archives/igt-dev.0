Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CC8FF4958
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD03B10E46C;
	Mon, 30 Mar 2026 07:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkHlhk6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8D810E3EA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857320; x=1806393320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J16kE5k9ejYXeQ8DGdp5GcmRvymOXeO/ZnTEWkos7Bo=;
 b=dkHlhk6wcpIhWIL2klY6lSjpdne6rH66Fk72DuSXWeHfV9xTj37z3Hln
 7HihMsvCswPLnt10nbSU845wvh7oj1AJxlFUXnTO+DtoJgcBXAJMZbqhc
 pHw3cjFqbYlbKcpEsCjxTBf6K+VMLknyF5gMYFSeKXdpqCkFnyZDtEWE8
 MkkkETnzAfbM5MneQP4SRsGSEJecdBCFYpy3YC20kBqqV3rg7LwGdRnVc
 kCkI16vWCEGCN6q6gBiGhBQ3pD4CsOB1TVkZW8SyP3czaK0heN4agKjpQ
 AZ2GCcYiyCn7Gc09eibOPDzaTyc4iojmKa4K68mqdMW5JNtcoRlc+rPsL w==;
X-CSE-ConnectionGUID: kshQ4gQ2ShipQFlySqGyNw==
X-CSE-MsgGUID: c/RQzx+6Rmy69N0GzGggrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75729073"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75729073"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:55:19 -0700
X-CSE-ConnectionGUID: Shmfs1MZRfej4QToQBLSzg==
X-CSE-MsgGUID: aKaC6b7dSruvSmBMCSYmeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227595683"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 00:55:18 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v9 6/6] tests/kms_flip: test suspend at most twice on
 SNB && BMG
Date: Mon, 30 Mar 2026 09:55:08 +0200
Message-ID: <20260330075508.1003899-7-michal.grzelak@intel.com>
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

gettime_us() on SNB and BMG from CI does not return proper time after
starting suspend tests. This results in too many suspends issued before
we hit the duration_ms. Break the loop on second execution.

This WA explicitly conflicts with commit c75dcbdac51d ("tests/kms_flip:
various improvements"). This WA is therefore only used by SNB and BMG.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 1a0517bcef..81fa8dd5c0 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1325,7 +1325,13 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		       unsigned *elapsed)
 {
 	unsigned long start, end;
+	uint32_t devid;
 	int count = 0;
+	bool wa;
+
+	devid = intel_get_drm_devid(drm_fd);
+
+	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
 
 	start = gettime_us();
 
@@ -1346,6 +1352,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		if (count && (gettime_us() - start) / 1000 >= duration_ms)
 			break;
 
+		if (count && wa && o->flags & TEST_SUSPEND)
+			break;
+
 		count++;
 	}
 
-- 
2.45.2

