Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C09CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 12:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5D910EC7C;
	Tue, 19 May 2026 12:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HugoO31H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6569C10EC7C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 12:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779192065; x=1810728065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vo1kcZP80utPXWyYmCNek9BsErD8NmtlhRB+P7v1Bxs=;
 b=HugoO31HqfkFhw6I/unCLV5GUIUZLwk9Ez77zBKp+DVJyrjH+kacPyi/
 iG+H338mtFYOuqtLZIfpiQrWrSIKjLuMk2ph8b5/yVwqlLvwAB4U7JBfK
 7/5rw+x4uyuWG457D9SrSXC6PWa6InxkkTJx11X05zZAOUjk3K+MGMZT9
 A1wjVsMxI/YlW88bhI6KC6JwD9XwjY4F2YKA13XsseM8YkpmSwyIfORoh
 jUjI2KHLxEFwlHbs6jWwGynB9IE6pAQxG2eO4FVsaRrid/wYyGzF+4LZ5
 dEPKQDx+FeNgKpP8TNbigcuNsTG/PtKGVHY5/4QxwTNkfso+z3/kFH07J g==;
X-CSE-ConnectionGUID: cIWYNw4JR4eZ4RypjSdTtA==
X-CSE-MsgGUID: HxabFtllT5qd41RrdIww7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79212866"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79212866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:01:04 -0700
X-CSE-ConnectionGUID: 7Ej+kiNyRlqSmoYzk4byVA==
X-CSE-MsgGUID: BNtM2t1VRbiZHfQDzKy3yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239611865"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:01:03 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH 0/2] tests/intel/xe_sriov_vfio: fix region-info subtest and
 cleanup path
Date: Tue, 19 May 2026 14:00:53 +0200
Message-ID: <20260519120055.201038-1-lukasz.laguna@intel.com>
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

This series fixes two issues in the xe_sriov_vfio:
- query only BAR regions in region-info subtest to avoid false failures
  on non-VGA devices,
- ensure VFIO fds are always closed in final cleanup fixture to prevent
  stale open fds from blocking VF teardown when disabling VFs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (2):
  tests/intel/xe_sriov_vfio: Query only BAR regions in region-info
  tests/intel/xe_sriov_vfio: Ensure VFIO fds are closed in fixture

 tests/intel/xe_sriov_vfio.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.43.0

