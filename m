Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F6FD4417C
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 15:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDBD10E672;
	Tue, 19 Nov 2024 15:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbXbFLxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF55B10E674
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732031770; x=1763567770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NpfBJz4oKAgWhXXCWMex/nSH2mBQJX7QefjQNocEezw=;
 b=KbXbFLxugV2qWMuhBMG9gb5hF1H0o59K9bOij7ratDuo8pShZDKOMPLB
 F9HqzwrXG94W5KEnQggqxJmSgUlYBOjFqkBNLuRrJTJzRsAp9sl6Oqyng
 uC1+8hj3i4dRKDyf8aoyUAaccPkm1UnolLrf8WUhpSfs+w/Xo/hnnVoiW
 BXwHZzaXQTxg319HBMw9TfXXbAe1+gp6FSPGpd+aHMIeELgrDd1rWR/Y0
 sPY/Dfg5/6y5i2SQB7nwWEketpezJRcfpRUuHpZaTHhiSC79DqduOLTiX
 cFUMMa5OoqOhm6ihIRXmZCV4Jc9W9b7r7t4lvZ/UuhHJ7cnbHh2GYATY7 Q==;
X-CSE-ConnectionGUID: +bW2PrZtQSOcf8gazYs4ew==
X-CSE-MsgGUID: IJgKxACUTnO+Au+cBOFewQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="57448932"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="57448932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:56:08 -0800
X-CSE-ConnectionGUID: 5YQC/BmvR0a0KcIzvUNGVg==
X-CSE-MsgGUID: d8hyGAwnTYKp6VxaRiHCcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="127127020"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:56:05 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/3] tests/xe/xe_sriov_flr: Improve clear-ggtt subcheck
 initialization
Date: Tue, 19 Nov 2024 16:55:38 +0100
Message-Id: <20241119155538.605000-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
References: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
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

Mark the ggtt-clear subcheck as SKIP when prerequisites, such as scanning
GGTT provisioned offsets, are not met. Asserting in these cases falsely
implies that FLR is broken, while the test has not even started.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: C V Narasimha <narasimha.c.v@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 1049cffec..502691765 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -393,7 +393,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 		if (vf_id == 0)
 			continue;
 
-		igt_assert(vf_id >= 1 && vf_id <= num_vfs);
+		if (vf_id < 1 || vf_id > num_vfs) {
+			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",
+					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
+			free(ranges);
+			return -1;
+		}
 
 		if (gdata->pte_offsets[vf_id].end) {
 			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
@@ -410,7 +415,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 
 	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
 		if (!gdata->pte_offsets[vf_id].end) {
-			set_fail_reason(&gdata->base,
+			set_skip_reason(&gdata->base,
 					"Failed to find VF%u provisioned GGTT PTE offset range\n",
 					vf_id);
 			return -1;
@@ -440,7 +445,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 
 		populate_ggtt_pte_offsets(gdata);
 	} else {
-		set_fail_reason(data, "xe_mmio is NULL\n");
+		set_skip_reason(data, "xe_mmio is NULL\n");
 	}
 }
 
-- 
2.31.1

