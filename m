Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1490BC79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 18:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AA310E1F0;
	Wed,  9 Sep 2026 18:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvFArwEb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1988A10E1F0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 18:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788978931; x=1820514931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FtjhitLUi6fBowItyq8ZKq094FTvvJE1Q/HAsw8eyU4=;
 b=fvFArwEb/Lj+FNrJ+ggde5Hk2/xCPnX0tLFFXj85miHZBpq2u6s+0XiJ
 a46AK3pLh4FgJFmJm+NfG8nS13VbcDQ3UVnT5vO8omcI4ZR0LtumVr1qY
 a6BN9h1s47GSBn3Ht7dSZ/ojCFP2X16Z0vJEc8C8laAo15pnziU7z436O
 ijVAtVlaQZChOiYiaZ7/PSzmVW1VE991HL0mEcx4Unj4jC8Tb/I4wc9/u
 zGdSBjKnz+ghVmcf/EAjIlIUkokYIo2bkqR158mNf7xmmLS9X7kmiwpEi
 VYXVmRKo2eUBNzkD9BnVgyDJlTBJhJafKs6XdWzi74gMfwGkWIw/iAH1u g==;
X-CSE-ConnectionGUID: YiN8C68XSO2DUkIVMYT0EA==
X-CSE-MsgGUID: urBaIeExTDSu9ogEmAapoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114960103"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114960103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 11:35:31 -0700
X-CSE-ConnectionGUID: x3TIMtCmRg24KZnB+mNAuQ==
X-CSE-MsgGUID: EtZLnUWhSJa2cazGalnjpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270901276"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 11:35:29 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v6 3/6] tools/vbt_decode: validate DEVICE env var
Date: Wed,  9 Sep 2026 20:34:48 +0200
Message-ID: <20260909183451.2630263-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260909183451.2630263-1-michal.grzelak@intel.com>
References: <20260909183451.2630263-1-michal.grzelak@intel.com>
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
index 9f059bfbbb..80e0db2814 100644
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

