Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC5AC79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 12:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5910E4DA;
	Mon,  7 Sep 2026 12:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hh+XkW0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1617710E02A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 12:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788785236; x=1820321236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PgylEHvPIhMPUdCN+C9UXF7fRDNsrniljUyMf6kpDsI=;
 b=Hh+XkW0G+PeO/ReqqrItRJRwf9Wgak87+aixqTyHCwwptlSPn0kfhyNO
 qFGZPCE6Q2uOK8cb7wigtfJmuXlPwVxTWR7fg4u7Dl/aFvJw0tIWHsxqB
 NjCTXqOIBaFrS/wvVT0z28FXhoyUJfT6e6VmOqBb5paXECgy9D0jkysbL
 5eg1dC1QC3J+gF1NyleR8UKWtXuF62Z4hF8Emzk4YhNJYg7ViIK8wVwAN
 FnwYAFaeuBbr9BpC7gk+4M/oYQyNlLg5Bo+FEAjp8eXLwiw1VDefVYuV6
 u+8w6gksvKeeZH7XsmlBBgs7AZ9C99rPNy0d90B4ZOlI3/rw8iaZ3DDmy A==;
X-CSE-ConnectionGUID: cYPLzzB3RjK+047lnlFKqA==
X-CSE-MsgGUID: m00cvbXFSredtw/tFgNa+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="91697199"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="91697199"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:47:16 -0700
X-CSE-ConnectionGUID: vH8kgmUzTqyDdGwkgih4Cw==
X-CSE-MsgGUID: CuEjYy4DSOiy+8hO0mPrlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272631614"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:47:15 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v2 3/3] intel-ci: Block igt@xe_sriov_mmio_regs.*
Date: Mon,  7 Sep 2026 14:46:58 +0200
Message-ID: <20260907124658.613244-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907124658.613244-1-lukasz.laguna@intel.com>
References: <20260907124658.613244-1-lukasz.laguna@intel.com>
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

This test is dedicated for HW checkout and it's not suited for recurring
CI runs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d0a2bf87d..116b0b93a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -117,6 +117,7 @@ igt@sriov_basic@bind-unbind-vf$
 # SR-IOV tests for HW checkout, not suited for recurring CI runs
 ##################################################################
 igt@xe_sriov_ggtt.*
+igt@xe_sriov_mmio_regs.*
 ##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
 # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
-- 
2.43.0

