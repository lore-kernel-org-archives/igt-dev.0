Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDDB606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIbSDG+S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D676810EBB3;
	Mon, 23 Nov 2026 10:11:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193BE10EBAA
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795428635; x=1826964635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sTpUKx/WkYKyWM+YDBz9DSFKId/koyari/YvDZtd6LI=;
 b=mIbSDG+SrEFNUW8HxpoaiXFmO4VmJI6vU0p9tSru3OCwl4VY31N6Wg+9
 TfGAkQM2xBhe0qZLSPka/u2/DWwyFV+5KuCU2Wt9Hgfm5mwHIlm+gla4d
 lJY4AH83mt/OsfRUcpxWOfTCSaeTtbYAi6sBpyt7RoTW0SQOt9WpYA9zT
 MdeXl9ukpceNYEcbNGKUFJgXTLIhbaENFyHsQF5m5+0PozsMtUZxrs7hx
 UOz3zzRYnDNbkXokGeC38xTaqL+lA4J53eDusCt1RaqGsCxnvqaxFAvXI
 2wlQu0w3AL0UpLw7rJNCVVdgz+xdjxiMy4miCNuU453LdxjLLQPugbYeC w==;
X-CSE-ConnectionGUID: LyV3LqeGQxu5BMTHqwIojA==
X-CSE-MsgGUID: rTQoKrbIRMSdt8tsqXh8jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4247493"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4247493"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:10:34 -0800
X-CSE-ConnectionGUID: Fx6ma4m+QSWoEXH1fT0vVg==
X-CSE-MsgGUID: J7pn6PhbSFmhjHLJNFZaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11621879"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:10:33 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v2 0/2] Extend multiple planes with multiple pixel
 formats
Date: Mon, 23 Nov 2026 15:40:53 +0530
Message-ID: <20261123101055.583218-1-avandhica.s.r@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend kms_plane_multiple to additionally exercise a range of pixel
formats (DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB16161616F,
DRM_FORMAT_YUYV, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB8888) on top
of the existing modifier-based subtests, for both the single-display
and 2-display test variants, to improve coverage of multi-plane
atomic commits across different pixel formats.

Avandhica S R (2):
  Fix plane count and shuffle bugs
  Add pixel format support

 tests/kms_plane_multiple.c | 355 ++++++++++++++++++++++---------------
 1 file changed, 212 insertions(+), 143 deletions(-)

-- 
2.53.0

