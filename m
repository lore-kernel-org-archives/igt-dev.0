Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63A3CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A310EA89;
	Tue, 12 May 2026 12:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoMC1Z2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39DB10EA7F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588591; x=1810124591;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hTjE3PxgdZtCUeiG9WEwiCAF33UyhXYRidponGFmXek=;
 b=NoMC1Z2wha566ApJW1bSDiO9RL0rqDe6htrCfTymqnAa3/PRLAqzIx+U
 02o0k+Tn2KgXHTzEsHf5zfzLZHfgFqMYMVA9zb2kOqkcj4Z9LzpOSh2Eo
 iS2sqcgyswUyGzdCKVOKbyooLQa4VYNCddBDl+cU0+dueLjjJ7w0eEcRZ
 G5sEW5h0It5vq5pxv3COnsx4ovaj3ZbKCCoeuHolGB9ZEzj6UjzPqAwXx
 IUUHIKyEa/o7w1pPUaGTe1BxPGrH5o2YsAk963kbfunFmpoJXWG7FZLCq
 QSftc0/57mZ+Wik95+iCtE3KpKXHxkijYnmJPr8gxrBkNno1Nvf7f3CDC Q==;
X-CSE-ConnectionGUID: gVdWC4lFRTqqoCgq6wvB5A==
X-CSE-MsgGUID: 2gFDO0BUSFmStDFyC34jyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950055"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950055"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:11 -0700
X-CSE-ConnectionGUID: mw2/qYEdQy614NB5XxzRJg==
X-CSE-MsgGUID: FoFwz+l/RCKFtJH6/aR+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691167"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 21/25] tests/kms_async_flips: Remove the IN_FORMAT_ASYNC
 check
Date: Tue, 12 May 2026 15:21:39 +0300
Message-ID: <20260512122143.11013-22-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
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

Stop looking for the IN_FORMATS_ASYNC blob. lib/kms will now
provide format_mods_async even if the blob isn't there.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6a56aaa48ecd..3d8c37631e2a 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -871,11 +871,6 @@ static void test_crc(data_t *data)
 
 static void require_linear_modifier(data_t *data)
 {
-	if(!igt_plane_has_prop(data->plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
-		data->modifier = DRM_FORMAT_MOD_LINEAR;
-		return;
-	}
-
 	for (int i = 0; i < data->plane->format_mods_async.count; i++) {
 		uint64_t modifier = data->plane->format_mods_async.modifiers[i];
 
-- 
2.52.0

