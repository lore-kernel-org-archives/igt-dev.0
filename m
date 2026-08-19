Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0810C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 06:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8092610E0CB;
	Wed, 19 Aug 2026 06:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G81TUP1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2743A10E069
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 06:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787120864; x=1818656864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQIm67kWd4xImH3O01x6apSa5Bp7dk8BECkA/ApzSdw=;
 b=G81TUP1F9leCo35+R5UixQB3MzHTsDjSUHxyl2Ii+oskFSqvr6TRtQqE
 o+6zImkulvzRJ/To/NtlY+H3bxZ2ZTQVpyUBQLl9vR1r5X3Fbcn7nUK4l
 3TK0VXiAtGV4rRW/QZUrYomtq4k9FEitjXehhxOxO0EEqc8NObBjOW4Sq
 YpVUIv2fxXJvWG1QtT8pzZ+Rox2BqmroJG82PBl+3b0Og674AU51gfH60
 2oirUQN969wtBBr0DpckD0OfLgIjv0luhPoqA//BrhKhWYd151ytN2JK7
 ek8MBRX71OGmzpmwIgwjNbeESxAx/M+hTHt0FocokbRBl0mG070bADBXy w==;
X-CSE-ConnectionGUID: evpJXqfYRKGAAo3XagFC+w==
X-CSE-MsgGUID: Uf9iKh9iRpaR63miNRUwDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87641689"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87641689"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:27:44 -0700
X-CSE-ConnectionGUID: uxohLixiTHyZiNf8VNf1tA==
X-CSE-MsgGUID: xdsSaV1DRMuOR5Ec3h7TxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="264132541"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:27:42 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 2/3] tests/intel/kms_dp_linktrain_fallback: Reset
 traversed MST output count
Date: Wed, 19 Aug 2026 11:57:29 +0530
Message-ID: <20260819062730.1116813-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819062730.1116813-1-sowmiya.s@intel.com>
References: <20260819062730.1116813-1-sowmiya.s@intel.com>
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

run_lt_fallback_test() tracks which MST outputs it has already
traversed in a file-static counter that is never cleared. Today it
has a single caller so the counter is implicitly zero, but a second
caller would silently inherit the first run's state and skip every
MST sibling as "already visited".

Reset the counter on entry so the function is safe to call more than
once per binary. The DSC path never reaches setup_mst_outputs(), so
run_dsc_sst_fallaback_test() does not need the same treatment.

v4: reworded commit message to explain this is a no-op prep patch
    until run_lt_fallback_test() gains a second caller (Kunal)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 115183d2d..44b875ab9 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -431,6 +431,13 @@ static bool run_lt_fallback_test(data_t *data)
 	bool ran = false;
 	igt_output_t *output;
 
+	/*
+	 * Reset per invocation so MST traversal state from a previous subtest
+	 * (e.g. dp-fallback followed by dsc-fallback) doesn't leak and cause
+	 * MST siblings to be silently skipped as "already visited".
+	 */
+	traversed_mst_output_count = 0;
+
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
 
-- 
2.43.0

