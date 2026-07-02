Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CA7C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 18:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C240110F56C;
	Thu,  2 Jul 2026 18:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbywR/gk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9410F55E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 18:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783016803; x=1814552803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wwbxHglyqa/a9xxUqlPpxS976rraQI24Xum5vyg1iio=;
 b=IbywR/gkFkGDE3C07Ya1xGsCtlb+CQjGP9aOQoI5I9dZ7p4SJjDx/16T
 NyBHxI+rvq7ZP09J57zvwfdh1nqwoPkCG1vPWSaNI9jZTkuKcefXIEnMn
 9gqBqhvkjuM96tgyWQB2wCDn8ZpROO7aXTlo1kxOkb1zekQWMo12BRaqg
 re2KIs2SiKGRclagq72tUI8Q6cs+KJfQ0eRZReFglcrQt4czs99yWMoOB
 TRjMzESs8KlA6Z+tjo6kUKm2AmmZuv+PAXISvHc75z2q9QvLYQ27wlQ+O
 nvoVN+ZZl1Qhlujgqqe7m1nfNzxntyznuVK5KV6M2c/0pESE3WRLXN7AX Q==;
X-CSE-ConnectionGUID: kuzUnE1XT3WOSRM6IhpovQ==
X-CSE-MsgGUID: 9byo4iptSues5SEiXBC1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95154702"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="95154702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 11:26:42 -0700
X-CSE-ConnectionGUID: +lv3X+ewSiyGiK7BlyVukg==
X-CSE-MsgGUID: NXkC8/JLQSqOfP7YoX+yjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="253577103"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 02 Jul 2026 11:26:42 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 3/7] tools/vbt_decode: validate DEVICE env var
Date: Thu,  2 Jul 2026 20:26:15 +0200
Message-ID: <20260702182619.3973788-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702182619.3973788-1-michal.grzelak@intel.com>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
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

On error, strotoul() returns converted value of longest substring
spanning from beginning. Check if device ID input via DEVICE env var is
valid. Show it and return if it is not.

v2->v3
- show whole invalid DEVICE env var (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index a2e57206d6..33f8598e5f 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -4326,8 +4326,14 @@ int main(int argc, char **argv)
 
 	if (!context.devid) {
 		const char *devid_string = getenv("DEVICE");
-		if (devid_string)
-			context.devid = strtoul(devid_string, NULL, 16);
+		if (devid_string) {
+			context.devid = strtoul(devid_string, &endp, 16);
+			if (!context.devid || *endp) {
+				fprintf(stderr, "invalid devid '%s' in DEVICE environment variable\n",
+					devid_string);
+				return EXIT_FAILURE;
+			}
+		}
 	}
 	if (!context.devid)
 		context.devid = get_device_id(VBIOS, size);
-- 
2.45.2

