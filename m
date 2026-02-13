Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4A1EF48E8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 08:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EF910E7B1;
	Fri, 13 Feb 2026 08:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQeGTCwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7896D10E7B1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770972366; x=1802508366;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CJMJbYJLi/fV1FignW0CNDwT3OEevkK7krQxIln5Yr8=;
 b=cQeGTCwNFq+QswhdFxzOP7/VK0EwdXOE6b9Lso6LoU0GK1SRJLiQ5yfY
 AXv454sar05hVwxhKusXa940LTUH2y30H5gXe3etUdicrMebS+Rp68dIU
 MoG0BtWW9oSZq9q3rWhsobtxkTaeutgks8G0sVJtbjS1ZTgk8fvEY6tic
 0nX4wNttCBKw1s46gj24YONzaww8fLYc0IqM0gb/h7xNvMq5bFQZUBMY9
 NRimYpujfIefwC0DY2uI6SgQZ+cWmQUbCgqEPvxul70/+rXxr/DY6hXiP
 xUZ1qOH2Ot8F0eVE7dMowZR36aEqVTinrdSh23/7Fy4ts4x6rXBI7ukKh w==;
X-CSE-ConnectionGUID: /Xcc1pmQRyulGC38yXRNZg==
X-CSE-MsgGUID: e62KJDXYRdqomPAJVb624A==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72142234"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72142234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:46:06 -0800
X-CSE-ConnectionGUID: ZpMzKKnpRRirBTPjShl02w==
X-CSE-MsgGUID: yPGH0cDIRYi1FWlzPwFJXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217336999"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2026 00:46:05 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, matthew.auld@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/5] Add false sharing and XA app transient tests
Date: Fri, 13 Feb 2026 14:15:58 +0530
Message-ID: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add tests to validate XA app transient and false sharing.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (3):
  tests/xe_pat: Add pat indices for XA App Transient in false-sharing
    test
  tests/intel/xe_pat: Use intel_get_defer_to_pat_mocs_index() to
    exercise coherency
  tests/intel/xe_pat: Validate XA App Transient feature

Zbigniew Kempczyński (2):
  tests/xe_pat: Add false-sharing subtest
  tests/xe_pat: Handle false-sharing on Xe3

 tests/intel/xe_pat.c | 339 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 333 insertions(+), 6 deletions(-)

-- 
2.43.0

