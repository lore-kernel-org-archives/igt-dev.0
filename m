Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74942CD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2780A10E317;
	Mon, 15 Jun 2026 09:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TA3t4dfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2B910E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515912; x=1813051912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HpfTXMtzRcPa6tU6dLxXZm5qR9KQbce7+ZDQd1h/XD8=;
 b=TA3t4dfuc9cnAQcQu9ce2W4ChGB++lpGEF8pb9CYcEx64VHbrVhyr1UN
 FkvTgbKaUztra3VPuknfqiV+yOqceTF6EwqWihDbtXBumR+A5X1UH15ik
 V/qqb5Ek6yBCAJK6ARJ2Ny4UzI4Tfu2hTNJHinMb4aPS9a1k/5+noYm+K
 YkIltCo1L5X6PywR5VO3XJgf63Q//MwIuQkBFlsOnt8aghTzyfI2z8fRa
 z9HpjNc1/651cP5UD6bL9b2XC/voUj0X8HeDlx/RhPTgz4dvKEbxyu0fH
 lxDEu0RCjL0oLdMFDZg+rK9COFyo7pXPCLSgSrV2sSMcDsxZwB/j4zl3D g==;
X-CSE-ConnectionGUID: xGVDQUQ3SjCIBQXPdV33rQ==
X-CSE-MsgGUID: ylJt0u6QQxKKNbKCJhWrLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82235898"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82235898"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:31:52 -0700
X-CSE-ConnectionGUID: tLZ1ifgSQTae9CV/FyG6IQ==
X-CSE-MsgGUID: ENaaeWNjRK6+JDhrOpyyBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247465292"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 02:31:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 07/10] tools/vbt_decode: validate DEVICE env var
Date: Mon, 15 Jun 2026 11:31:34 +0200
Message-ID: <20260615093137.681050-8-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615093137.681050-1-michal.grzelak@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
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

