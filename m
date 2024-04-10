Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C61CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A7F10E23A;
	Wed, 10 Apr 2024 15:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/lYgmxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5AA10ECAC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712761359; x=1744297359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9AWdy5qYpdFyqO/RlitQMtSiovyHvvgWsr3mVXfi61c=;
 b=c/lYgmxcRQlCddIUciDuckir7lNCgEiGm4Pt98A87ysDZO/f2Wqp/tXJ
 /EA/5lzIMo+ZbGf1cX/VPwd7mdblJRVvaoYgDmBjBACbBCdIUvnZCOuGn
 tdeQHIK6ayeTmsEpPlPz9rRvJdhvAmHKVFTW2HSA1gqX10yaMjRJnpqDI
 6dKMsNe6RE9PvA35F526Astm6YSD+7t9PsoBiFRhhe2iz/hgLFmD+m3Ih
 xxWG8r+TXPBL4bfCEWS6gYGHe4Vnpq4v27juVArMEXDXy2oojqTHRr04D
 ZvYAUCaD0iip06z2+8ka1fvsaT36GOQY26SNGybIblB8ci1+dXZsloecG A==;
X-CSE-ConnectionGUID: MYDMAcCrTkm/L5TGswfq7Q==
X-CSE-MsgGUID: g2VbL2RdQw6j/q/Mf28MsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8697261"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8697261"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="827793156"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="827793156"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 10 Apr 2024 08:02:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Apr 2024 18:02:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/3] lib/kms: Simplify force_connectors[] error handling
Date: Wed, 10 Apr 2024 18:02:28 +0300
Message-ID: <20240410150229.28922-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
References: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The failure to allocate a forced_connector entry is entirely
our own fault. If we hit this then we've screwd up and made
the array too small. Skip the error handling and just assert
that we must have enough room in the array.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f7dd1db91827..19bb4ac66ece 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1518,8 +1518,7 @@ static struct igt_forced_connector *forced_connector_alloc(void)
 	for (i = 0; forced_connectors[i].connector_type; i++)
 		;
 
-	if (i >= ARRAY_SIZE(forced_connectors))
-		return NULL;
+	igt_assert_lt(i, ARRAY_SIZE(forced_connectors));
 
 	return &forced_connectors[i];
 }
@@ -1558,11 +1557,6 @@ static bool force_connector(int drm_fd,
 	}
 
 	c = forced_connector_alloc();
-	if (!c) {
-		igt_warn("Connector limit reached, %s will not be reset\n", name);
-		close(dir);
-		return true;
-	}
 
 	c->idx = idx;
 	c->connector_type = connector->connector_type;
-- 
2.43.2

