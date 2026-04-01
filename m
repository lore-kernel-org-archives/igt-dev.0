Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A568D35160
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 09:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9110EFF3;
	Wed,  1 Apr 2026 09:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAq2wEgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AEB10ECE3
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 09:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775034629; x=1806570629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UXkjMMTokeF/yaf+5/fOvRShRpV+5ugJl2xJeV47tvI=;
 b=fAq2wEggQHphePV/jK4zPugXKynBeqzEtr65vgoKlppmZO2Mpd1vwshL
 qz6f6mSaXil9yOCXKm4nugll/WDqd9wJMWcI7+tShpkEaCL2fn+vPK9h+
 pDZexuMh+K34XoOHtjIU5dZD+qWA5P72y6sBXfEaZ+jDUWalvSo4ADC7I
 Iyp9OANr1OMLuLJgQnMGRPjd2Jd3CZLCUmYbiJr9KoRrdWv2hrGi38iMi
 TxEk5G5jvv+YM9af9nZ9i7ozYOFeSXxmhu7leV9QnMvXSl9XmBeX/wMIX
 ACkOj4q8vk1SEW4k7rv88bBEU63+uZAOomSGBHkoVlssNGnWgncn0nmQ+ A==;
X-CSE-ConnectionGUID: mBbJxRp/QpSXzaViSaNYBw==
X-CSE-MsgGUID: 1zi5wZfaT7u22O+y6lkdyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78659424"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78659424"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:29 -0700
X-CSE-ConnectionGUID: CF7GV3mmRdGWGczU57lZpw==
X-CSE-MsgGUID: 01jg/u6UQU6C6b9u01J3BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222255533"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.181])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:28 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 1/3] lib/intel_compute: Print handle in list of bindings
Date: Wed,  1 Apr 2026 11:10:19 +0200
Message-ID: <20260401091017.2772519-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add handle during printing bo bindings in compute library. It is
useful to debug what's wrong when user passes its own env.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_compute.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index b3336a7b5b..7dda423c80 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -352,8 +352,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 				memset(bo_dict[i].data, 0, bo_dict[i].size);
 			}
 
-			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
-				  i, bo_dict[i].name, bo_dict[i].data,
+			igt_debug("[i: %2d name: %20s] data: %p, handle: %u, addr: %16llx, size: %llx\n",
+				  i, bo_dict[i].name, bo_dict[i].data, bo_dict[i].handle,
 				  (long long)bo_dict[i].addr,
 				  (long long)bo_dict[i].size);
 		}
-- 
2.43.0

