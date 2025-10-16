Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27117CCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 16:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55C610EA3F;
	Thu, 16 Oct 2025 16:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezjsmc+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6419C10EA3F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760632007; x=1792168007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v77XchdeuiJARy3+9gIIOEgj/fvMD6e//N4gj2q/GG4=;
 b=ezjsmc+duD5QoDQ/IpIcuky7zx6kgu6/4spX02oe7U9dPgHNNmFeb73h
 Y6S96uuRAfCzJabFMtOgFEAwId60edR2i/lwOTXUJqzKNCScrhjYnJXj4
 aRaIKpJN+WUBb6XBdAfMTcyXNFc3Xye54Ej5M3ap0QYrNPGrBYHyhGWlU
 aao3RPcHF1RwID9RRBtMJVEs9ECG7ksCoQcCwpF4c7QFp8OohRVcGZ/dN
 Xc7o1kkYUCDEFEE3L+TLCjUxH/pCZo55sUnj4lW6TCnplLGsnPSnx6q6Z
 QRBcbvfmmnJDK/x7KD+74/p18B7cJCf/0yJFcGRs8V6WM0ACU5OXEMvw2 Q==;
X-CSE-ConnectionGUID: 4Lp+7g5MTXuGGXgPHldK0w==
X-CSE-MsgGUID: 0W4r/pExSaa1cLWinmvoEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62879794"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62879794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:26:47 -0700
X-CSE-ConnectionGUID: gEEFYE8GTNGCawDcJOySyA==
X-CSE-MsgGUID: SW6yqTNoQsexvJfqh8nfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182910072"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:26:44 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 badal.nilawar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t 1/2] tools/gputop/xe_gputop: Close card_fd after engine
 population in xe_populate_engines()
Date: Thu, 16 Oct 2025 21:46:56 +0530
Message-Id: <20251016161657.3707264-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016161657.3707264-1-soham.purkait@intel.com>
References: <20251016161657.3707264-1-soham.purkait@intel.com>
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

During the engine initialization for a specific device, igt helper
functions need card_fd to access each engine and respective configs which
is required in obtaining the busyness of the same through PMU.
Once the required configs and engines are obtained, the card_fd is closed
as opened card_fd in gputop make appear itself as DRM client.

Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index bb2caa6ea..113a32601 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -197,6 +197,8 @@ void *xe_populate_engines(const void *obj, int index)
 		engines->num_engines++;
 	}
 
+	close(card_fd);
+
 	if (!ret) {
 		errno = ret;
 		return NULL;
-- 
2.34.1

