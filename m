Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D65F8D74F
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 14:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862810E8CE;
	Thu, 16 Apr 2026 14:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FstTgKLJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D242E10E8CF
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776348823; x=1807884823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6FCmcETEEy5vsNmNOz/wqv58JtpyRI/Ve0+LiB65JRA=;
 b=FstTgKLJUy4YszyMTrLzsGluWq9uCT3fjo/zXSn0M/tGwdT1raTTnMRg
 0vaZgaQ/F6VGT45sZkvewCPBRI92na9TQqGl8s6Nt5IApP89RDIBUsMgV
 WLYywuSSXGveCW2q0hl0RcMk7rsay2gEc454WS9eIpLJy484C5MGirzTA
 Fx5hR2BavkA5uHNiXP+AEVHv+aCE7Q/bDcBZQG7lMK4fxz65KapQsHpaV
 6eLkZ16uKecPt+hq2LelGaIH9deDmKD/orM+3VQqzcBuUME2GXInrlzpX
 TQ2FhQdUFR2F4D2bh6vUoUQjOjkevLj5gNXBASgvh4+Fl9j4lJJYhcOtb g==;
X-CSE-ConnectionGUID: wCzrBqQoRjmPzKYZXW3Vig==
X-CSE-MsgGUID: 89EqnV/VQ/+BL9JKkmEdhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88731146"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88731146"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 07:13:42 -0700
X-CSE-ConnectionGUID: qD/auv0LTlGVRtwXV06rrg==
X-CSE-MsgGUID: 65EW+4aJR/KsG9sAevj59Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="226410273"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 07:13:41 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t 2/3] lib/kms: Use for_each_plane_format() for the msm
 scaler counting
Date: Thu, 16 Apr 2026 17:13:33 +0300
Message-ID: <20260416141334.20086-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
References: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Currently the scaler counting loop iterates over the entire
format_mod blob format list. That list may contain a lot of duplicate
formats (one for each modifier supported with that format), so this
is a bit inefficient. Iterate the plane's format list instead which
has no duplicates.

Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d758b63c043..4cc7c06812c8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7504,10 +7504,11 @@ int igt_crtc_num_scalers(igt_crtc_t *crtc)
 		 * as a rough approximation of the # of scalars.. it may
 		 * undercount on some hw, but it will not overcount
 		 */
-		for_each_plane_on_crtc(crtc,
-				       plane) {
-			for (unsigned i = 0; i < plane->format_mod_count; i++) {
-				if (igt_format_is_yuv(plane->formats[i])) {
+		for_each_plane_on_crtc(crtc, plane) {
+			uint32_t format;
+
+			for_each_plane_format(plane, format) {
+				if (igt_format_is_yuv(format)) {
 					num_scalers++;
 					break;
 				}
-- 
2.52.0

