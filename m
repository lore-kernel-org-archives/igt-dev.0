Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0DBCCD18E
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E1B10E58E;
	Tue, 14 Oct 2025 09:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iChHfQYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1310E58E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434754; x=1791970754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WgO7CJIVeg+6QRF2T5EohWM1Ms8kNC4cmD450nSFmPM=;
 b=iChHfQYyn1Ssz0O97HPfRBv5J4ZjYgQ4eGyjQweDW+OU6V5zW9z+daum
 oAPl423B+A3f3iU/6LXLO9b4KuuFGrAmA1ouQRKqkxcUXCo3jSDLjFpvb
 lpHV7dRZ6kfYhI+zpVQn6CiY2CGoCBj7o2cmUL8b1JF/rQ4oVfTQ2NLKs
 rBRDYMj45yKdjwg2OhObyYs1eTBWlyMCO+sBniyWFzcACDuBoSOSaHxdE
 4XHtX1ElUexRYz0EfLd5H/yy0cr9aALHRAEKeP/k5/T05VHaRF2TVEyjc
 tpNrC3v+GCDBrAwYAmrJ4dwJe6SYSYkAhYkUd6ZsKoztvwj3pGCFk5xz6 g==;
X-CSE-ConnectionGUID: Iq4q+RxNR2SsmnU07JhvOA==
X-CSE-MsgGUID: Lu5bVLxnSeGH/YcA7zAr2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192506"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192506"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:14 -0700
X-CSE-ConnectionGUID: TOFMKJTATe6404qKm4jGzQ==
X-CSE-MsgGUID: /xLT7FWGRtWycTol2YsEqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066500"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:12 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 5/7] lib/xe/xe_eudebug: Assert that there is always
 client work
Date: Tue, 14 Oct 2025 12:38:46 +0300
Message-ID: <20251014093848.2394531-6-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
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

It makes no sense that we would not have a client work
to do on setup. So assert it is always there and add
debugs when the client thread enters and exits on work.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 84309043d5..7ea63b22b4 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1512,8 +1512,11 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 
 		c->pid = client_wait_token(c, CLIENT_RUN);
 		igt_assert_eq(c->pid, mypid);
-		if (work)
-			work(c);
+		igt_assert(work);
+
+		igt_debug("client: work start\n");
+		work(c);
+		igt_debug("client: work end\n");
 
 		client_signal(c, CLIENT_FINI, c->seqno);
 
-- 
2.43.0

