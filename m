Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC33CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5394A10E348;
	Mon,  8 Jun 2026 12:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARxcRxWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB14310E257
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922576; x=1812458576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pPQX6TEooPP4yz7hR//0a9B4S8gHo9h/glwVDv9+xMU=;
 b=ARxcRxWS84rDPNbtyzcp33Axz1e85sESf78fkVZqoxATv85KyRkRWJQ+
 9IJbd84K336x8ydqZzz4MGhf0TbdVq5YJSb4yx9+95rzcfxlP80GGJGxq
 Hk9vvWLU97UfzfAORCDXhjwz5utVc+Ymz3wMH4bubnFSIY8UkGIEStDtm
 NW/0Xi7q903QVt8RsSvv4ebdF67r3nOde/xhSMldwGHjBpsi2RlEY6QJK
 yzUrugocIpEanMtovPKxTfQWcuLfRI21VntHAtz2SrqF4mxZnFVB4W4Yp
 zS2OTf46jDgDBtFDYvXSIeiOKCzxjhPef3fqAbiqZGbwvforFqPpHYEEA w==;
X-CSE-ConnectionGUID: ly8LcSkcQ9efTGg8vpWVWQ==
X-CSE-MsgGUID: MtuGdyNAS8qoOOe590Gi7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683117"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683117"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:42:56 -0700
X-CSE-ConnectionGUID: Ej5nS484Sj+75byjVC08yA==
X-CSE-MsgGUID: xt0zQ32AQpi4iiSJpI84Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688444"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:42:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 4/8] tools/vbt_decode: validate DEVICE env var
Date: Mon,  8 Jun 2026 14:41:17 +0200
Message-ID: <20260608124121.3131410-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260608124121.3131410-1-michal.grzelak@intel.com>
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
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
valid. Log to the user if it is not and reset the devid.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6a9c1de7b3..5681643f4b 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -4315,8 +4315,13 @@ int main(int argc, char **argv)
 
 	if (!context.devid) {
 		const char *devid_string = getenv("DEVICE");
-		if (devid_string)
-			context.devid = strtoul(devid_string, NULL, 16);
+		if (devid_string) {
+			context.devid = strtoul(devid_string, &endp, 16);
+			if (*endp) {
+				fprintf(stderr, "invalid devid: %s\n", endp);
+				context.devid = 0;
+			}
+		}
 	}
 	if (!context.devid)
 		context.devid = get_device_id(VBIOS, size);
-- 
2.45.2

