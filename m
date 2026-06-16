Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F402FCD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 11:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A647B10EA35;
	Tue, 16 Jun 2026 11:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmH99Btz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F310410E6E2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 11:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781608330; x=1813144330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wwbxHglyqa/a9xxUqlPpxS976rraQI24Xum5vyg1iio=;
 b=SmH99BtztWw45pyyL8VL1KAmDHJnnoMgNeRL2N3ooqiesq3Kg7G8n+EF
 WUXYxb/ey0g0K61Dey+2s7p/wLXhiIcx6vjFkeC2CLhkundPm3xZhvP+g
 pGfVcEzGHSb0nARgS0WG280Zeacc3gJyEYDnOry80OUtl8fjHCUUZm4c4
 okdnPFwsyzLQXlWRnbuc6/cbUsRMEQ7Qvzwicx3yQQeemBBTbjzX+CRjb
 oPcIoVW+xrykqShDNGoEG2ARIQQhrU/NAeWNMxD6sjM5DJP51o1oaCTIF
 W4XCFB5KL/eU0J11c6ubBE8LinjEaIWzgcrC5ESzHZ4R3UrXZdzzNJgfy w==;
X-CSE-ConnectionGUID: r0X9u0KQSwqLxFanoGmrWg==
X-CSE-MsgGUID: Owr2JgkHRgq0OWFvrN87LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82381962"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82381962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 04:12:09 -0700
X-CSE-ConnectionGUID: qWa5iILqQSCYPu59XFDQzg==
X-CSE-MsgGUID: b8TsbxKvQqyI78ScYs23RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252714057"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 04:12:08 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 3/6] tools/vbt_decode: validate DEVICE env var
Date: Tue, 16 Jun 2026 13:11:59 +0200
Message-ID: <20260616111202.1254067-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260616111202.1254067-1-michal.grzelak@intel.com>
References: <20260616111202.1254067-1-michal.grzelak@intel.com>
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

