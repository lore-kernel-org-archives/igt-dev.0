Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F81CD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 12:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E19210F03A;
	Thu,  7 May 2026 12:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLW+pOcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D2D10F03A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778157345; x=1809693345;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=to2XEFMQb39kENNK06WF4ugu1QpNO8qwckH83Onml54=;
 b=CLW+pOcEPBW2JB7EHzeTw0q+alWGgymdA9O7S0NRXtRXGN3xuuiuiquG
 4x270kWXni/KW3BDjMauXo8BN7XDRy3A+W+YVw9KXXieLBxVq4dHpQCsu
 W49ZHDujjjHMPpOinbWhhoX650fQtAOLbhuc4WILiUsUf13aS3rzKVGnR
 37V4qIYU+4UZRYl2CcHy0CDv5ebXhLt3C96YRYJOMmqoGfeRw39Qbalz7
 mLH5qigut/jZn1bTih/JQuWJvWmORpnz0pX2qey9gXDxmsoHMFPMGOMSw
 eL3gZJ6gD3leXJqjpWl6kno6SspYcVWR9Nd7dBJlobc1nTfDkOglf+JF0 g==;
X-CSE-ConnectionGUID: akTilEx9Rp2DGc/BpvmGJQ==
X-CSE-MsgGUID: weEqc3QhSRORdcfTt4tC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="81674968"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="81674968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:45 -0700
X-CSE-ConnectionGUID: MJ0XJPPgT0q9C/yYq6PTyA==
X-CSE-MsgGUID: sdVBjDFGS6mlQmIN7KFUDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236716826"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:43 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 07 May 2026 14:34:17 +0200
Subject: [PATCH v2 1/3] tests/core_auth: do not call any function before
 errno check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-add_timestamps_to_logs-v2-1-9591e90e0a6a@intel.com>
References: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
In-Reply-To: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Jari Tahvanainen <jari.tahvanainen@intel.com>, 
 Mateusz Grabski <mateusz.grabski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=to2XEFMQb39kENNK06WF4ugu1QpNO8qwckH83Onml54=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBp/IbU5yIcToUI4Q1IhfLXleyackdPohFlvXVCZ
 BzIFYOL61iJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCafyG1AAKCRAjYrKT3hD9
 16wSC/4p+f0WllQekfyH4fGSGkmeJ3ieShSBcTEi0ebPe368K7VHXi0LmA5G7RuuUGxRh4Ph2cX
 zFJQ5SKRDryz9VHC+8+yNb9Riaj2ritceWAfk1zcJCW+Ly68hAS3eMIUj95LLLOXk2r05dpKNdD
 9UXEaFttVApRgCTqW0RQ4Cl4MhPmELOrO5n/IPDyBvsNYfngFrnAZeFVw0QkBRzztcxdmJ315Sg
 00apZQJ6sNu8vh9QQc0x82a8T1rSgwF5aEIxmYz69Q0PH8atHH4dBuAG/xR2zXY/CF1cZovPo/u
 CgN6MgjZLSH0lAK8u/uV5IAuI0/89qJ9jsTTiLGXK0WpQPlOZdHCIbOSd4og77qfyqT2TGWc1RX
 2cNs+etZGk8ND3sNAeNkOzneBtqFkThaVKZCqgjnPiY2Qx4XXoxCZClnwnJqd9Aa/ELPCirN2yb
 dGjDuwZpTOoxVr2SN3U63skmh4A9gePjvqqeh7TMBzScX0fzjzUSzfAIAPxiBtUayRcso=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

If open returns error errno should be checked immediately, otherwise it
can be overwritten by subsequent call.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/core_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index 31ba2cfb2d24..19e69b543620 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -128,8 +128,8 @@ static void test_many_magics(int master)
 		/* open slave and make sure it's NOT a master */
 		slave = open(path, O_RDWR | O_CLOEXEC);
 		if (slave < 0) {
-			igt_info("Reopening device failed after %d opens\n", i);
 			igt_assert(errno == EMFILE);
+			igt_info("Reopening device failed after %d opens\n", i);
 			break;
 		}
 		igt_assert(drmSetMaster(slave) < 0);

-- 
2.54.0

