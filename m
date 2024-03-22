Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B8C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA15112769;
	Fri, 22 Mar 2024 20:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBzxvTeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2309112769
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140112; x=1742676112;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=E2kZHqSLBCvP1b4Aal70pyF71XFoFLJ2nZDFtjzaP5E=;
 b=WBzxvTeGk5QPLiYm6WAIE1xL3H95dLwW0ZeElTIqoZhSbQLDLtI17K7s
 xNFkcqljiyQNOOWsUG7XmCeMQlA+siSkUh9I5YyaMTwVKEpVIcHIkPD5g
 szeD/zzdMEDbk/VSebc8Rd9q6a77mC1aeT5dL0YwSYkn8QeRr9T4UvYsT
 QBBMVQpObQ7KVCH6jVVxt6WgTZn1u+kgdZYcpJ7K+6+wBoQmAAiHppOWA
 80IFJtMY8fArkEgkdIz5a6EhTcKSnt9+yOkScwkGQlyCRzPSdyqAJEO6l
 96d1M7DOq6xlheIKG2LqZiygSh8xcX0lyM1zI3gTe2bu5T2xCJnoSpkKM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329365"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329365"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783617"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783617"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:49 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/13] tools/intel_vbt_decode: Check version before
 decoding lace_aggressiveness_profile
Date: Fri, 22 Mar 2024 22:41:20 +0200
Message-ID: <20240322204125.17212-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

The LFP power lace_aggressiveness_profile was introduced in
VBT verson 210. Check for that version before deocoding the
information.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 7cfa357ac526..fa9c45920853 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1810,6 +1810,9 @@ static void dump_lfp_power(struct context *context,
 		       lfp_block->als[i].lux);
 	}
 
+	if (context->bdb->version < 210)
+		return;
+
 	printf("\tDisplay LACE aggressiveness profile: %d\n",
 	       lfp_block->lace_aggressiveness_profile);
 
-- 
2.43.2

