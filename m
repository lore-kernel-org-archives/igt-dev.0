Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E3C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 10:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5B410E414;
	Tue, 28 Jul 2026 10:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bW3SlDv7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B2B10E495
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785234429; x=1816770429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hkHlZLAo0Bsiq6K5Twx2qSIh+JdtGD2cZeNhrGCbmcU=;
 b=bW3SlDv7Ao0DwnZ20AUMR8HkSbk8J4Xp8anbRmzxyifQ3gnhLWzSme8N
 leQD/lSHHHMvJ+ZRJF/ER2ioYoE6LvMI4c+v8lYLsTxlp7fqE6LG3y19p
 5bIA350cWC3kSUk2CQ3xnrXdyd3u4Jy+5ul+83QolRLGVgSx9uzND47vX
 Gvy+L4QzaxHlkLFaezL3YLks7Lgnz7Vnw4KTDtjXLsihiuRHQfu2roggo
 q20HW+01ECafxjKsImoj1xLO2Thk8kEIPrdEUYFBhcKoyt+Jd5/N40QGM
 jO/eirJU20uvk7NsbcClwEDu59EmwwjK1V+/ZPUFK7Wjva0YOj+a3Zj+b A==;
X-CSE-ConnectionGUID: OuSjOzT9RlC2jpPd815cdQ==
X-CSE-MsgGUID: nHJa8p4tRT2EBO+ytBgLFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85827961"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85827961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 03:27:09 -0700
X-CSE-ConnectionGUID: oC0TZJBiQs6r7acEF9K94w==
X-CSE-MsgGUID: KylYg6OeS72oOsz0DG2PVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="257861966"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 03:27:08 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe/xe_spin: initialize ticks_delta to ~0u
Date: Tue, 28 Jul 2026 12:26:58 +0200
Message-ID: <20260728102659.316861-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
References: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
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

Initialize ticks_delta to ~0u instead of 0. This value does not satisfy
the COND_BBE exit condition and prevents false batch termination.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_spin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 874310789..331bed1d2 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -60,7 +60,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	spin->start = 0;
 	spin->end = 0xffffffff;
 	spin->wait_cond = 0;
-	spin->ticks_delta = 0;
+	spin->ticks_delta = ~0u;
 
 	if (opts->ctx_ticks) {
 		/* store start timestamp */
-- 
2.43.0

