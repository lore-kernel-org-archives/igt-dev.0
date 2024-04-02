Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B2CCD129A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D011120F2;
	Tue,  2 Apr 2024 22:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLRrRvyo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D571120E5
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CnndQWTjKdMHi/mZK93VgsakSCKukowQ5YCPqoP13u8=;
 b=YLRrRvyoXwTMBmaNazVxVHCwJvxypSTCbC1v7SP+AK3q7oZ+bcalRiyU
 9n3K//jGxceSYIkWz97yH9QFLC7Ce222JsoIDdVOEr2QGbQV2SMCtUPxT
 XT8mzbxMRLBRl4s8F0XTJUyAYkBd/g1LU58EYmR1ZStaUzdtmurR/n8LG
 3dzZF3T3C142i0DnnjcmLptEljtemPJpl/ZGFwKZrpe0odmU4vvf3jAQU
 RIhiiRQdmA8u+mICO+IAdUeHcIk9gXTh1P1R/F1WMLXBaVLQ45fGMi0Oe
 HyeCln+8t+oNnTh/Qw0LHsg7VMXRv5qo3ZHRivIkBOMgqFm+JrIFbJleq Q==;
X-CSE-ConnectionGUID: Hv6sABIHSFu3WQp3UVEPPA==
X-CSE-MsgGUID: yr3vTbxhQNOSRqJydm18gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424324"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424324"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
X-CSE-ConnectionGUID: qrQwreEhTCqZI7G5OXoMDw==
X-CSE-MsgGUID: S0/B0KoRQc6+gSUDD+YvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035601"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/8] lib/igt_drm_clients: Fix leaks
Date: Tue,  2 Apr 2024 15:17:11 -0700
Message-ID: <20240402221716.1840148-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402221716.1840148-1-lucas.demarchi@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
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

Stop leaking memory-related fields.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index c8dc21d6a..c174c96ab 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -221,9 +221,19 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
 		free(c->engines->names);
 	}
 	free(c->engines);
+
 	free(c->val);
 	free(c->last);
 
+	if (c->regions) {
+		for (i = 0; i <= c->regions->max_region_id; i++)
+			free(c->regions->names[i]);
+		free(c->regions->names);
+	}
+	free(c->regions);
+
+	free(c->memory);
+
 	if (clear)
 		memset(c, 0, sizeof(*c));
 }
-- 
2.43.0

