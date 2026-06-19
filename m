Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5A3CD98F8
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 08:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACBA10F4B3;
	Fri, 19 Jun 2026 08:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cnl0BD4f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB2D10F4B3
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781858382; x=1813394382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5bJNWRReMJexdeH/jxJebMgXWFU427eSbe/9dVCnrac=;
 b=Cnl0BD4fVSwZNcGiWZI6tGDK5PxkjSSsGddyF6/8ziyTl6iVl0J4sqXa
 +fVO8hOipboAy/tutU7hK8F96oTnwVdiQ5DE0cemmzxIcEVqlLOFuPw/b
 uvDomrhPuGtvZQXj0kbBJGJlh5KJ8XiQm46d5JQR7EubYkAJ8PxyqNqTL
 eKiuUsdxpkErnvR94hUkTafGEYns/fWJ9YjIJFUZWpuB6dhyepT/vS1Ri
 pjipvoB4KS7QJBmh7NxJyH4L07XojuTjt6PQePMo/Xlha66t4qZKQX8cY
 gQsVkg87LPcwg6SlqJpcHV2tvgauPCQvykOGH6MexovzdHUMr3RxEQg81 Q==;
X-CSE-ConnectionGUID: WuitHONYQE+tbCmAjpFdFg==
X-CSE-MsgGUID: rXwEvWqNThaC3k0igWOziQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="94203996"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="94203996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 01:39:41 -0700
X-CSE-ConnectionGUID: efFRoMSzS2uDZGImf+HbGQ==
X-CSE-MsgGUID: gyCEQZQ5TxqDiqeItajegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="278764470"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 01:39:41 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: piotr.piorkowski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v4 0/2] Add debugfs entry
Date: Fri, 19 Jun 2026 08:39:19 +0000
Message-ID: <20260619083921.637427-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Extend the root-dir subtest to validate additional Xe debugfs
entries. Optional entries are those that may not be present on all
platforms or configurations — their absence is not treated as a failure.
Validate:

Patch 1 adds validation for optional debugfs entries

Patch 2 adds non-empty validation for existing entries that
are expected to always provide content.

Sobin Thomas (2):
  tests/intel/xe_debugfs: Add debugfs optional entry validation
  tests/intel/xe_debugfs: Add checks for existing root dir entries

 tests/intel/xe_debugfs.c | 190 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 183 insertions(+), 7 deletions(-)

-- 
2.52.0

