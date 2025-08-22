Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF2FCA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 09:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4C610EAA7;
	Fri, 22 Aug 2025 09:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwVwVXRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BF110EAA7
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855556; x=1787391556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E7WgbFK2HPWjkWSalgpBguxDWe9o7ylKgdhmiiHSjwk=;
 b=XwVwVXRXQ/l2rDjhO1QKZm8xVv5fvaGCzBnyDuVy8SuSDJP73gP88lzl
 MqZWR9Z44hytoNpLS1fXy+hXGqopdYb+7lZyGxXgywpkCt4Pzra04CFg0
 Lr4fjpeJEaE8/o3JhpNsThJp6vdxyYf+h1WbumhI1gG4XR9tC7kmrfTIv
 QTR5LlTcsL+W6bYYCXxYEafQMV88aGLij0D1wEtGXW7mgwkH7A0RMbTL/
 IboElcpweTdZE91k/qApgRD1OUexQvUwWHQ6r533Ga6ac5oaiNq+pYidb
 ErojYYZrhhCTo/apWAG5+UXhMplFi1rJKTOGVk1NRbPi5U170aqgOLi5l A==;
X-CSE-ConnectionGUID: e1fN1njAS8WYPmrmMTUW5Q==
X-CSE-MsgGUID: XNdxs3sdQ4mfphgPpWg3Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80760502"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80760502"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:39:15 -0700
X-CSE-ConnectionGUID: 8FEVpxZVTO6/xUure95VoA==
X-CSE-MsgGUID: KCZvinTUS/6yiv3mDsbaXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169492007"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:39:13 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_flr: Handle missing provisioning
 data per-GT
Date: Fri, 22 Aug 2025 11:39:08 +0200
Message-Id: <20250822093908.414306-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

When reading provisioned LMEM ranges from debugfs, some GTs may not
expose provisioning data at all. Previously, this caused the test to
skip entirely with a "Failed read" reason.

Relax the check to treat -ENOENT as a valid case and simply continue
to the next GT. This ensures the test is not skipped unnecessarily
when provisioning data is absent on some GTs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_sriov_flr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index fc08703c0..9eebe5f71 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -816,7 +816,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
 		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
 								  XE_SRIOV_SHARED_RES_LMEM,
 								  gt, &ranges, &nr_ranges);
-		if (ret) {
+		if (ret == -ENOENT) {
+			continue;
+		} else if (ret) {
 			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
 					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
 					gt, ret);
-- 
2.31.1

