Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3C6C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61A310E0DA;
	Tue,  1 Apr 2025 14:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8NAvSN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8713C10E0DA
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743516330; x=1775052330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mRdaoFnV5JWSd01Mz95x0B17ez7sWvQ+eGRw9HVfBpA=;
 b=E8NAvSN+5kYAAT5h9rKSNsZPboZKuQK9czBTQlIkKf+TguiK24u8HSwb
 idLo4NxUYxOlpKpp0UP5m3ESeDdZh+btB4D3vG9JjJJL3uO+G63zLPxt2
 Wo/g4V5CZpqF21vQm7HdQ5ClPswXj2jYxTe8f8NbK5e6erVplYFwHFNLD
 AfuzCZpBEjTJ2kdj89VM38t5L/x+Ug640pTtB4B/jvrJwK7pPhtIxMmLd
 9Jy1A9XM7CVxjnD3UXFiuneCPY3wm/E8mEszGsPP6M8dC/48kkek9Gmto
 taeSg+DBBm4teyHG8L+JqH5uE95SIijx9+4ZZOQ79t1jU7dOuIci2F5dJ w==;
X-CSE-ConnectionGUID: 3xfGajx5SbeVzWbCF+e94w==
X-CSE-MsgGUID: Con/lMR+TyS+zOfvgxlE6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70198581"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="70198581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:29 -0700
X-CSE-ConnectionGUID: yKkOhtmLTc61twBPmGwpOw==
X-CSE-MsgGUID: qZOlsR4uSzKmQyGhq0JkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126364576"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v4 0/5] Stress copy engines during render
Date: Tue,  1 Apr 2025 16:00:55 +0200
Message-ID: <20250401140510.38142-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds new tests to stress the copy engines with multiple jobs
in parallel, while measuring the impact on the execution duration of a
rendering job.

v3: Rename to xe_blt_mem_copy() and promote to xe_util instead of
    lib/intel_blt as this is xe-specific

v4: Follow Zbigniew's recommendation and adopt a new approach: the spinner
    is extended to optionnally perform copies. In the test, rndering only
    starts when copies are running. It runs for a defined time thanks to
    igt_until_timeout().

Francois Dugast (5):
  lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
  lib/xe/xe_spin: Add mem copy capability to spinner
  tests/intel/xe_spin_batch: Add basic test for mem copy from spinner
  tests/intel/xe_render_copy: Expose render duration
  tests/intel/xe_render_copy: Add new test for render under copy stress

 lib/intel_blt.c              |   1 -
 lib/intel_blt.h              |   1 +
 lib/xe/xe_spin.c             |  14 +++
 lib/xe/xe_spin.h             |  19 +++
 tests/intel/xe_render_copy.c | 217 ++++++++++++++++++++++++++++++++++-
 tests/intel/xe_spin_batch.c  | 109 +++++++++++++++++-
 6 files changed, 357 insertions(+), 4 deletions(-)

-- 
2.43.0

