Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4482C001CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EB110F2B8;
	Thu, 11 Apr 2024 18:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJiW3EVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E075C10F2B2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712860503; x=1744396503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q/zFMt6VmfpSxS2nwsB7vFpOiQafUYZoFhAbqy2pZxg=;
 b=WJiW3EVf1iYGIETd9iY5UW/nSchL0Y9jQadXmnfeNDbjznt1XpNeooZY
 Uwxww7lp9wqOr64+i4V9kj/cdn9RxlmlauZeJuqto+WbX4Y0DNytQeljU
 h8k1MxBAY7ZahunyShoMj91feoi8A/H7rRSIF4MLgYhUIsllWOUz1ElxG
 tZZ9LVr0WgzgAtOTi8pwdjZNtroMWyjPAwpUE3SSOkOFMCYR8GsdLuCE8
 b5rzHPaV5usobsLbNA6myjl6zxOB2jXB6jXUh81I5yYlyYtmlrFEAiXt7
 IHAJedNMv+dK5waIHj7KCU6+AhEGXXGLYeTf2T7J1JOQG40eKYRwzyc1+ Q==;
X-CSE-ConnectionGUID: T9g90oJRTbmkXEgJT9A7WA==
X-CSE-MsgGUID: t185swMoQgC7S5MngyHYrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8852319"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8852319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 11:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="827793662"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="827793662"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 11 Apr 2024 11:35:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 21:34:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v2 4/4] lib/kms: Clear connector_attrs[] upon setting
 the reset value
Date: Thu, 11 Apr 2024 21:34:50 +0300
Message-ID: <20240411183450.6417-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
References: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
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

When anyone manually sets the connector attr to the reset value
we can stop tracking said attr.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3da49d1ccb6e..3216fe7e434c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1572,6 +1572,9 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
 		return false;
 	}
 
+	if (!strcmp(c->value, c->reset_value))
+		connector_attr_free(c);
+
 	return true;
 }
 
-- 
2.43.2

