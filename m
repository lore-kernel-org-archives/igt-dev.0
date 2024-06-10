Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752E3C27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 12:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDE010E36B;
	Mon, 10 Jun 2024 12:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4Tb2caQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D1910E345
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718020812; x=1749556812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7qkEc1WzgiWhgiBjUbKX1z6Rzd11OD3Laqcyiu5fpCw=;
 b=A4Tb2caQADCRBNeZ+hsh8BUl4C3XsZ23bp9BgB/lxnLViKZxj34Rb7Oj
 Z4W4BTghqZ0ymkxPBen9HpWrsMwc07YoleeY60xs2LtlB84HjwvZG/gim
 2ZUXQXYOkEZ6YI8sFdmKD3DdmidhhMHGqEBSOGk4tlNXdZJZ7B5/q7GoI
 /VNTnu0R/J5WIZLNoEkbWQTDX3H8cCw/2LAgIssgB9Suc5sIn9VUoMJiq
 oKTSGCZWrukXggdA9Zk7hSL1DAk6aLIDwwD/pSyVfd3EDqHxVtBlpRCRP
 XHWWTb3ZkCeJWDk4MEPlIfY6sSQCpS3GvQooOV+x3IvJKVBnhFdIho39E A==;
X-CSE-ConnectionGUID: 56mPks8AR1as611IAnCK1Q==
X-CSE-MsgGUID: NaiB+D30Q2mL6JUv04Pwqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14626166"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14626166"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:12 -0700
X-CSE-ConnectionGUID: ATHwFuwCSD6xmN4catPl+A==
X-CSE-MsgGUID: Kf3Px3O0Qo+YtuezOf/Igw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43472131"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:09 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 5/5] tests/kms_dirtyfb: ensure plane size is within
 fbc supported limit
Date: Mon, 10 Jun 2024 14:59:41 +0300
Message-Id: <20240610115941.35279-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610115941.35279-1-vinod.govindapillai@intel.com>
References: <20240610115941.35279-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

When FBC tests are performed, ensure that plane size is within the
FBC supported plane size limit. Skip the iteration if the plane
size is bigger that FBC enforced restrictions.

v2: update the usage of drmmmodeinfo

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index c0eacda9b..75047ec63 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -102,7 +102,12 @@ static bool check_support(data_t *data)
 	case FEATURE_NONE:
 		return true;
 	case FEATURE_FBC:
-		return intel_fbc_supported_on_chipset(data->drm_fd, data->pipe);
+		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->pipe))
+			return false;
+
+		return intel_fbc_plane_size_supported(data->drm_fd,
+						      data->mode->hdisplay,
+						      data->mode->vdisplay);
 	case FEATURE_PSR:
 		if (data->output->config.connector->connector_type !=
 		    DRM_MODE_CONNECTOR_eDP)
-- 
2.34.1

