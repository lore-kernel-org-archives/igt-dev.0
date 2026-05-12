Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1ABCD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B8E10EA7F;
	Tue, 12 May 2026 12:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFPIuS/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F6610E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588583; x=1810124583;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5vYUCVgvBAvxtWvZGGggJ9zB5vD5tvY+nwwpioeZ1dA=;
 b=YFPIuS/l/JC/Br75x5SRv1GAiBAvnZOp81NPsAGmYqkTEq1W1aRkbqCO
 IjSYueeFXyw4HpuBVm6Ow/zcbak6LbjWw/YFLrK5HeFKQgbZMU2YQA/e3
 LS59WFnbx/ZyHx2I5xtKoCODWiCXGyRmLRcDA6D6RxfGFWxTig0aLHOfw
 c3nh7/j6GpqYAWE1zyVckhCLVIjj1165BrvQVZE+QNBeAS85oD6J2AxIc
 /xBFz5dpNjR/OFznzNaMpf0hDW1xNrHyvlzWqSOz+pbcG72eeO5zm+OsH
 vJL6ZQPGrleX3qXpnmKzx2tMeCy0g69ZnIbGzcMVx5hw9aMMc1/6uz9Y7 w==;
X-CSE-ConnectionGUID: 3wO6XPS5TX+Eu7lSBraRqQ==
X-CSE-MsgGUID: GbgzAbD/RcCCIJG//G7DgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950046"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104950046"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:03 -0700
X-CSE-ConnectionGUID: +l3GnZFARMqTmiSqob5wzg==
X-CSE-MsgGUID: 738WOHPhSgyy17MumgI4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234691110"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:23:01 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 19/25] tests/kms_plane: Use
 igt_format_mods_has_modifier()
Date: Tue, 12 May 2026 15:21:37 +0300
Message-ID: <20260512122143.11013-20-ville.syrjala@linux.intel.com>
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

test_format_plane() has an open coded copy of
igt_format_mods_has_modifier(). Replace it with the
real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 5990adabf175..5923b5917579 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1124,18 +1124,8 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 	struct format_mod ref = {};
 	igt_crc_t* crcset;
 	bool result = true;
-	bool found = false;
 
-	for (int i = 0; i < plane->format_mods.count; i++) {
-		uint64_t modifier = plane->format_mods.modifiers[i];
-
-		if (data->mod == modifier) {
-			found = true;
-			break;
-		}
-	}
-
-	igt_skip_on_f(!found,
+	igt_require_f(igt_format_mods_has_modifier(&plane->format_mods, data->mod),
 		      "Modifier " IGT_MODIFIER_FMT " not supported on plane %d\n",
 		      IGT_MODIFIER_ARGS(data->mod), plane->index);
 
-- 
2.52.0

