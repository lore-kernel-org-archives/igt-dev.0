Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF34F531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA8610E585;
	Tue, 14 Apr 2026 07:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5g822/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D5D10E072
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150894; x=1807686894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EO4YH7pL/b24TzanXqjlBCCwGmO5iR6T73Dqs0Xx1KQ=;
 b=X5g822/As1gmPiES72ugEps122ojJ1iWb002bso+8GuAtpo3xQP0nIf8
 Bla1arKIJ2xpIT0qbJGsydAbZwfikO0KsyysEAt57xmkjR9PSntJSwBpE
 TEkf0MtHYkWGZF20u5CzxDyfGx/xN7L3+q88FPIcq5S1RDQYw7jmUTQAw
 q+i0WHuBhO/rmYP2Klgh+lch4LA7ZrOx5JaqnMdju9ZV2X2SLVlgIgMY8
 ldtR8S7ZHQSiDYpXTbsdX9G6hnzhjC0X6jOFUGwDOTjsN3TPCMwW2Mv/Z
 RxLUqQewKYCSxSrViwSgmzph3e36vkQiyRSCI7za3dttFD080sXbrDr/r w==;
X-CSE-ConnectionGUID: VodEBmy8QB2nj2dO2qdn/Q==
X-CSE-MsgGUID: vnSF7Q0+Q/yENTRI5Dj4vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102555727"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102555727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:54 -0700
X-CSE-ConnectionGUID: 7CnncvKKQJ6FKEsMxUszGQ==
X-CSE-MsgGUID: rKXWcCs5RhSfP06haXrAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234046786"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 02/16] lib/kms: rename struct igt_plane to _igt_plane
Date: Tue, 14 Apr 2026 10:14:22 +0300
Message-ID: <ee878a5eebe4f0d870760443db56b56a36c9271b.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Prefer igt_plane_t over struct igt_plane, and rename the struct to avoid
accidental use. The named struct is only needed for the typedef
declaration.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bb50ed7ff908..9b8614c4e6b8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -409,7 +409,7 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
 	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
 }
 
-typedef struct igt_plane igt_plane_t;
+typedef struct _igt_plane igt_plane_t;
 
 typedef struct igt_colorop {
 	uint32_t id;
@@ -423,10 +423,10 @@ typedef struct igt_colorop {
 
 } igt_colorop_t;
 
-typedef struct igt_plane {
+typedef struct _igt_plane {
 	/*< private >*/
 	igt_crtc_t *crtc;
-	struct igt_plane *ref;
+	igt_plane_t *ref;
 	int index;
 	/* capabilities */
 	int type;
-- 
2.47.3

