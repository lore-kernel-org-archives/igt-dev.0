Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DA2C61CE7
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B2310E586;
	Mon,  2 Jun 2025 19:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1j6SVNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358E10E586
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892355; x=1780428355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=idsW7KmWL4Mwm6mNwmNbgGKIv1YEhtlLbLN7/8adzEU=;
 b=I1j6SVNOtY+kTw1v5LbiHKybQ7qvqX1zR3xHdj1QmFk9H07Al61QH3dG
 jdLYi1aYq5tK/eHdkBuaHPHmUAuPiKgSEXxgfBllXd1ssVp0GM6sNQ0XC
 1/LaZn0N1q6TC3+8D499GWrjzP44OC9Z1BaRhwGLow1zaytTXmn5DZrfb
 VoILbrqAhQibpx/N+3t0/rd7GtzEq9vme5juOZlOHryG5kWqeXiYwnHn+
 fGx9H4eELiSqbTYkAHOIs2WyRLx1hpdWbvpmaxU8Z0WlV5D1whyKNhlBg
 8ygj6b6IesOolwgZpXpIlQOrD4BQEy4leBs0W5l/IXPtmNfAA4WFlcieb w==;
X-CSE-ConnectionGUID: Ffc+BWEZR3iM+9k2v948JQ==
X-CSE-MsgGUID: eTM5/ZkLQTaT83zY5Wc3cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777095"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777095"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:25:55 -0700
X-CSE-ConnectionGUID: hA56dy9qQJ2buNzyCz22fQ==
X-CSE-MsgGUID: 6IzTe1+2QlCccC2MvJu6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590217"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:25:52 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v12 02/11] lib/intel_batchbuffer: handle base64 encode
 fail
Date: Mon,  2 Jun 2025 19:25:06 +0000
Message-ID: <20250602192515.95309-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
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

g_base64_encode function returns a newly allocated string containing
the Base64 encoded data. Upon failure, null can be returned.

When g_base64_encode function fails, exit the calling function.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/intel_batchbuffer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f7569e768..03ce65ded 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2348,6 +2348,9 @@ static void intel_bb_dump_base64(struct intel_bb *ibb, int linelen)
 
 	igt_info("--- bb ---\n");
 	pos = str = g_base64_encode((const guchar *) ibb->batch, ibb->size);
+	if (str == NULL)
+		return;
+
 	outsize = strlen(str);
 
 	while (outsize > 0) {
-- 
2.49.0

