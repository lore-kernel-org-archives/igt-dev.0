Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B0CAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 16:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B711A10E55A;
	Mon,  8 Sep 2025 16:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIt6N9VZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9D210E55A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 16:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757347665; x=1788883665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ACek+g+W7EdYEgN9QGqBqWqeeUJ7wUfTC4cEu+ch4vA=;
 b=UIt6N9VZwfPoMmGczipQ3lJLiy2/k7DUU/A8YmDtOZND50k0jyaRjNiS
 LNl1Fk0mPaq/+DQLJVKkfH9669SUTOg4B0DLRQkEAuqKUX7i4YM9OPK3u
 5VQrlLglg3q2+JmUqzyvzYirVgoh/KC2adoXXNPxfW7T9v/PjQNLzmTYh
 Yg+YW+DrGItG2brgJx8zqeOtAYLsNMrRGkKAP76xrcUXrrQ2nh4fGcst/
 k0NtHyvF20/WPjOjvyAHmZxYCuJRlBHmC7xZ01N3M0bB3vfVPqg/1aVHE
 jlVB6DKYu/IitN+8Qr9LMEDLqt/FLlHPC533j5c+v4QAM+az9R+y3DjDv A==;
X-CSE-ConnectionGUID: iMOhB0sNQmuppIW4R1tfTw==
X-CSE-MsgGUID: lLiloqosTZybIWjuvmXUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59548650"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59548650"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:07:45 -0700
X-CSE-ConnectionGUID: vTqz1ewESPmxWIzkSww4qw==
X-CSE-MsgGUID: ySSIB8HhTVOn9geieCHFvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172096661"
Received: from unknown (HELO localhost) ([172.28.180.168])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:07:42 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_sriov_flr: Use xe_for_each_gt() for
 GT iteration
Date: Mon,  8 Sep 2025 18:07:23 +0200
Message-Id: <20250908160723.1723178-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
References: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Switch from indexing with num_gts to xe_for_each_gt(),
ensuring we use real GT IDs from gt_mask and not assume
sequential numbering.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_sriov_flr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 448b63521..2138debfe 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -1012,13 +1012,13 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 	};
 	const unsigned int num_checks = num_gts + 3;
 	struct subcheck checks[num_checks];
-	int i;
+	int i = 0, gt_id;
 
 	memset(mmio, 0, sizeof(mmio));
 
-	for (i = 0; i < num_gts; ++i) {
+	xe_for_each_gt(pf_fd, gt_id) {
 		gdata[i] = (struct ggtt_data){
-			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = i },
+			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = gt_id },
 			.mmio = &xemmio
 		};
 		checks[i] = (struct subcheck){
@@ -1029,6 +1029,7 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 			.verify_vf = ggtt_subcheck_verify_vf,
 			.cleanup = ggtt_subcheck_cleanup
 		};
+		i++;
 	}
 	checks[i++] = (struct subcheck) {
 		.data = (struct subcheck_data *)&ldata,
-- 
2.31.1

