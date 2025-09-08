Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B9BCA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 18:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F2610E5A8;
	Mon,  8 Sep 2025 18:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXY9oojr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E53B10E5A8
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757355656; x=1788891656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7+66PxuZEQGgeMkuwroVqm4xLOUusCZjSudLWiNguyM=;
 b=bXY9oojrpN727IGjDZYavIt0QFuafcokovze+C8Mmd1X+PUXgWwzisNm
 cuNDxll/n3YgwA75nOKNpY+KvMhK33ALgXgqn+Q2jrvkyBqk/84I8MUXQ
 +7ZftofIhgnLvLswrG7Lcgw6YI0uJDe/MZtK1szkWGiT8mQPzYl2OTMaF
 Kmq8lOcAnf02mr8UCLvEzkrIdeSI5JcWHPiSvCBxOkOUgddnl/Vj69bIG
 b7gZDtx0HBaAGQu8dpzCA+iGPPzVJSNf5fc3PcCQqUDquZO6z1rs8HJSp
 /mOtSSaA8av825ygjKrD7It7MCkfXDRNNwvDwfF0fzmE5D/rF6LxRfbEs g==;
X-CSE-ConnectionGUID: h56Nob/hTXSqBfzUi9JqTQ==
X-CSE-MsgGUID: 1cQGRsduT8qw1z6h7e6uOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47195233"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="47195233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 11:20:56 -0700
X-CSE-ConnectionGUID: gbjtXxvUSd2tmokMiVH7iQ==
X-CSE-MsgGUID: MxawLnwbTTiXv2h5Vdwm5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172126853"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 11:20:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/kms_ccs: stop using l3 enabled PAT index
Date: Mon,  8 Sep 2025 19:20:46 +0100
Message-ID: <20250908182045.66769-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

When populating the fb using an l3 compression enabled PAT index some or
all of the data may end up cached. However the HW looks to only perform
the compression step in this case upon evicting those entries, when also
trying to write them back to VRAM. This seems to be the cause of this
test randomly failing on BMG with the CCS state appearing to sometimes
be zeroed even after doing a compression enabled copy. From
experimentation adding a sleep before the surface copy cures the
failure, which fits since this will give plenty of time to enter rc6
which will indirectly also nuke the l3.  Grabbing a forcewake around the
sleep brings back the failure which also makes sense since this will
inhibit the flush and also rules out missing synchronisation hidden by
the sleep. Using a large fb also cures the issue, which also fits since
the fb will now be larger than the entire l3, so some data will have to
be compressed when evicted.

To fix this don't use an l3 enabled PAT index prior to taking a snapshot
of the raw CCS state. Probably this also means the test is maybe too
much looking at implementation details, by assuming that zeroed CCS
state must also imply that there is no compression, even if compression
is merely delayed until the data is evicted.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5941
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5376
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index cb0c80f03..ab081aa75 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -812,7 +812,7 @@ static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
 		fb = get_fb(data, modifier, r, g, b, width, height,
 			    data->format);
 
-		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_wt(fb->fd));
+		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_uc_comp(fb->fd));
 		access_flat_ccs_surface(fb, true);
 		return fb;
 
-- 
2.51.0

