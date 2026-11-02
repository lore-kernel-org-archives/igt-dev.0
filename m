Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DAF606D803
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 00:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lx0qnRiK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F6F10E0AD;
	Tue,  3 Nov 2026 00:03:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C0A10F298
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793663953; x=1825199953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jymM/w+yPOgM4GSsIjkqqyuC2sO3XXvIhnNtmzN7Bb4=;
 b=Lx0qnRiKByC+x2c/Rl5dfu5Nz4fmqlmVftmQOZrOCS5FYvLU8rS25wFr
 cMUZ6p8/CfPkVlz1OLNOp5K20w10Ayf4WPRuuS88ceN89NgOL9iFzwXBB
 0IJBm8smtDKZGdNCYbKsBx4RBI2MQECT5l8RPET3pVirXt0EZFJqDL/4n
 6xC2C4zv8Tflp3SfNVDLnGtY5jyrdUH4TCLRuk8aOVx1lRgrl/gg7p9XN
 B4+g+rskbos2dVNUoSVP3mVspKmD440nHeB2dRbFuP12H3JcZS/witNUO
 tV7354bwS/Qn0MpxEdYHf2yVnhYc1WPPv2YVn+TLky3UbuM0MaRzhnuK+ Q==;
X-CSE-ConnectionGUID: a9fAxbG2QFCujkKmHSdRSw==
X-CSE-MsgGUID: ghFhqleORbCaygUEJITjaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391551"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391551"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:12 -0800
X-CSE-ConnectionGUID: KBaTi2YtRy2W6oRebIVcAg==
X-CSE-MsgGUID: QmVrmNDMRzeuB8rMfs/72Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6595257"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:59:10 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 3/7] tools/vbt_decode: validate DEVICE env var
Date: Tue,  3 Nov 2026 00:58:49 +0100
Message-ID: <20261102235853.3437332-4-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102235853.3437332-1-michal.grzelak@linux.intel.com>
References: <20261102235853.3437332-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
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
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On error, strotoul() returns converted value of longest substring
spanning from beginning. Check if device ID input via DEVICE env var is
valid. Show it and return if it is not.

v2->v3
- show whole invalid DEVICE env var (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
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

