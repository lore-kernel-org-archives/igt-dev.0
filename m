Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578B3CD342C
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 01:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4FB10E231;
	Thu,  7 May 2026 01:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7/yHkC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F8310E569
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 01:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117309; x=1809653309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQtSwQC4YFZrL4T5h1RPtW70FSUTzTpy/FsjpyaGSsA=;
 b=P7/yHkC1d7tzFekEjFJDx0s1uhM85VhZpO3f+lk5+GYe7I33QH970mYU
 uK1H8L+Oy2udqcVUAB4L3B2/5lCsA9GJo1g6qm1XnYwV0Pz+XGAj5YyE9
 jYEkV9zaYFTb1JlI26jlJxsXnKT0UEhfGyFy2dMaqJplk0K+T6WAJqQ47
 35dCIANdP7KyQz+HAFgvrMkzxqCZBA4RMwcAvkdBR24EqNKCjWYabYnwn
 O1COkCAaHPinzttrHOI80A19E1sCHdWtnGMKk7Wy2JnBAwQBCxYzYxtxq
 T0LusJ10xsgrh+XbgdX9Y0sXcT8IBs9fTRqx8BSkS98PDeb+5c2zpXnKl Q==;
X-CSE-ConnectionGUID: ZdpNqvgBQNCzqehrHsMtgw==
X-CSE-MsgGUID: nry2NzqQSkWkD9oYvy+E3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96490329"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="96490329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:28:29 -0700
X-CSE-ConnectionGUID: phLaWTGjRh+nptXNRlquHw==
X-CSE-MsgGUID: Z7/6ETpNQ4+5gXnfDWrf1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238115823"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 18:28:28 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 1/7] tools/vbt_decode: fix tables' offset reading
Date: Thu,  7 May 2026 03:28:15 +0200
Message-ID: <20260507012821.527453-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507012821.527453-1-michal.grzelak@intel.com>
References: <20260507012821.527453-1-michal.grzelak@intel.com>
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

