Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA425CF8542
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 21:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BC610E77E;
	Wed,  2 Oct 2024 21:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1D3nqCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6548310E77E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727904055; x=1759440055;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QzSD/WgadEFjJzxI7gap7Iyd4uWeq8t/9FB4DdclQ0Q=;
 b=e1D3nqCEMHqPPC+55K3ueMlCMAHnb+nFpXtN5ZXsWRGVtF0kyjj44Lb7
 QmRxE+L7DQDjzdbfjrQU9gRr/7vWpm5BqW3AWk61669zgoxFP9FtiOod2
 G5odj+mE+5bKqLyY2YY7xx0ZwFXbioBgXyG9fLNCxOXadHqcLEPB3K+FX
 ukqttRaT5x+fW5hXF6MdK53WwFoFeQ/iJiGgEZG/2ujtfHbGuaPUKio6v
 OFS/G3Z109DwEBnn9fnP64TbOFwgGOtaI33g/L474cIlJDLNgtOdQSXi2
 lTsnbQKsuHWQZaxri9AwmW3/rPfXRBjozB3Gb+99/iiuNtAKWEGaGnNgk g==;
X-CSE-ConnectionGUID: QiwjRYs5RTmLrOx72g68gQ==
X-CSE-MsgGUID: OKigD69BQeWMWDfW2JinWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26889023"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="26889023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 14:20:54 -0700
X-CSE-ConnectionGUID: 3zv5ibgARtKJwk0ssk1kzg==
X-CSE-MsgGUID: NzQiiqa3QH2JIuy6PuErcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="78550478"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 14:20:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] i915/drm_fdinfo: Quiesce GPU prior to running some tests
Date: Wed,  2 Oct 2024 14:20:49 -0700
Message-Id: <20241002212049.769042-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

Sometimes render is still running a remnant of a prior workload when we
expect it to be idle. This throws some tests off. Ensure that these
tests wait for a quiescent state prior to checking if render is idle.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12179
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/drm_fdinfo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 45d17aaaa..b66ac9e1b 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -219,6 +219,8 @@ single(int gem_fd, const intel_ctx_t *ctx,
 	int spin_fd;
 	uint64_t ahnd;
 
+	gem_quiescent_gpu(gem_fd);
+
 	if (flags & TEST_BUSY)
 		igt_require(!gem_using_guc_submission(gem_fd));
 
@@ -374,6 +376,8 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	memset(busy_class, 0, sizeof(busy_class));
 	memset(tval, 0, sizeof(tval));
 
+	gem_quiescent_gpu(gem_fd);
+
 	for_each_ctx_engine(gem_fd, ctx, e_) {
 		if (e->class == e_->class && e->instance == e_->instance) {
 			continue;
-- 
2.38.1

