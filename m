Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776ACD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7F110E348;
	Mon,  8 Jun 2026 12:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbD9NXMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FA410E257
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922572; x=1812458572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQtSwQC4YFZrL4T5h1RPtW70FSUTzTpy/FsjpyaGSsA=;
 b=GbD9NXMcbqjN17K3YiRJNNTFbt+OPkUD3qpc2d4z8jaPOd+wxpcf8kna
 LXEp1KqddBfrTDa3MwOnbb4382ZVA2x6APXUct8dgW92ZNYFioIgGjzxm
 GRzKVStWYEXIO9SPlsWnaoJd6RgBQ4EuE8F1npqJX2w4TTJEUhpeY+lXI
 wFi6/8yaNiihiHsbjluNTBJyCa51RpYoPNVXbwapmB+wvBroPneQd9tjG
 5nidr4+teAG3yjsLNuQkR4WdsWXFu6rloljdUQKd+Z4WqzcnxtUVjm3dX
 9jj+dzerqJskK9lyEaD32XzMiEnFfJYP0ahJI68tftx+bOIKpMRCsLJ38 A==;
X-CSE-ConnectionGUID: 6i7E0CFwQwu19stz3WRQtg==
X-CSE-MsgGUID: NRDiiFbfSVq9CNsRw56LBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683110"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683110"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:42:52 -0700
X-CSE-ConnectionGUID: tmBQpIaERcOu6bM5hOwUag==
X-CSE-MsgGUID: /Br14ShyTyqcTdu51bhMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688420"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:42:50 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 1/8] tools/vbt_decode: fix tables' offset reading
Date: Mon,  8 Jun 2026 14:41:14 +0200
Message-ID: <20260608124121.3131410-2-michal.grzelak@intel.com>
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

During dumping of VBT #57, all rows are same because parser does not
change offset read. Adjust the offset to change basing on the row used.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index cf7bcc5771..1d6bbc88a4 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3478,7 +3478,7 @@ static void dump_vswing_preemphasis(struct context *context,
 			printf("\t\t%s: ", vswing_preemph[i]);
 
 			for (int j = 0; j < vs->num_columns; j++)
-				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + j]);
+				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + i * j]);
 			printf("\n");
 		}
 	}
-- 
2.45.2

