Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE45CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAABA10E980;
	Mon,  1 Jun 2026 20:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUFgim7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11E710E978
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346690; x=1811882690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m9xJQZRsHeiGYkKcAdE1KorLgUx+VYsbvlfEQsGEHj0=;
 b=BUFgim7wMjmm9xQtoMiZ2/gaG6dGPfXyQO6N5LTQx+QTVkX7JGJi7jEQ
 6+vw6zJABOseTy7+BtXwc6sYqhachdaRqMUYXrL5t91R7d39/tslO3+kB
 fDJLfXsDu/SRL2K/WIj4F0WepkqD8UyTAUmcsLW74qHf7moA0gHgYY/Im
 El5BUBiemGG3U/cUvwCk2r0pQ2d5kY30jxYJI1dOSakCC6k0a8WSxsM3w
 D1aBiu9qBXs7suKjy/3top6Hn6DOiKJeMlEQfszEyEpBKfSf4WtUTtGyX
 FK65grlfIujWEei+gZcglyAIGyX0YqBITUqoyhBtSMZj0ZW1r2zsbUZcz w==;
X-CSE-ConnectionGUID: 3Esaxrs7TYuW+b+iJn9kzw==
X-CSE-MsgGUID: c+Aab4z6Qv6Bortq1biDvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652884"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652884"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:50 -0700
X-CSE-ConnectionGUID: tQgg4XewTEa8Ekn5ymI1Uw==
X-CSE-MsgGUID: i1cCAW8NTiadm0y5gXsooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331544"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:48 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 12/12] tests/intel/fbc: detatiled debug info for
 unsupported plane size for fbc
Date: Mon,  1 Jun 2026 23:44:07 +0300
Message-ID: <20260601204407.39934-13-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601204407.39934-1-vinod.govindapillai@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

When FBC cannot be enabled because the plane is larger than the
display  supports, log the attempted plane size in the IGT info
text for the skipping reason.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c        | 3 ++-
 tests/intel/kms_fbc_dirty_rect.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index b5de63350..48fcb6c61 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -108,7 +108,8 @@ static bool check_support(data_t *data)
 		if (!intel_fbc_plane_size_supported(&data->display,
 						    data->mode->hdisplay,
 						    data->mode->vdisplay)) {
-			igt_info("Plane size not supported as per FBC size restrictions\n");
+			igt_info("Plane size (%d, %d) not supported as per FBC size restrictions\n",
+				 data->mode->hdisplay, data->mode->vdisplay);
 			return false;
 		}
 		return true;
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 4187ee072..f025a57ae 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -410,7 +410,8 @@ static bool check_fbc_supported(data_t *data)
 
 	if (!intel_fbc_plane_size_supported(&data->display, data->mode->hdisplay,
 					    data->mode->vdisplay)) {
-		igt_info("Plane size not supported as per FBC size restrictions\n");
+		igt_info("Plane size (%d, %d) not supported as per FBC size restrictions\n",
+			 data->mode->hdisplay, data->mode->vdisplay);
 		return false;
 	}
 
-- 
2.43.0

