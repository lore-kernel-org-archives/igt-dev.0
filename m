Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C0CC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 08:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0210FC21;
	Wed, 14 Oct 2026 08:19:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535B610FC1C
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791965886; x=1823501886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9BJuwcdHQlZN6ZUoDsNQGjcB5WAzJyuQBIPXEakSt0k=;
 b=XxoyYaFcIFUKOCJr4vLOk01e8zJydX/rxzCCh8iNAQE4JYyniH6FH7/p
 pgR4mbgdaxrl8eBkEEsXugu/7+xDIvoMGo0U7ndauoqWy50Qg2cQ2ljdy
 8wtVZTAbyCV2Zl/D0FkRmQONe2kE5B8arTwO2+B50chN644+e43aVxkGx
 +AV0Q1d7LEtq/arfRd6b0ZMnAZj9LyWMLc7ckmwC1d+qvLjoFhM9XDoSY
 F6QUyDS18Wcau4jyr1+s0Q43mBRfakxwkYPmUL6V2b/+CGcel+Ouqj9XL
 rf2GW34W0hPtKY8KIL1T+VCcVTnvR+PI5ubgn6h8hKmfE3wcooBt67F3h A==;
X-CSE-ConnectionGUID: JFoQ/61jR2asZHg1bNr+NA==
X-CSE-MsgGUID: uiVCkEOaQnW2gRSuQqt/5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="584215"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="584215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 01:18:05 -0700
X-CSE-ConnectionGUID: Z8FKa0ksQMWzGJvXxEM20g==
X-CSE-MsgGUID: 9vsD8I5OQ+aTrEEXog7xaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1292639"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 01:18:03 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 0/1] xe_pmu: Do not enable VFs in unrelated subtests
Date: Wed, 14 Oct 2026 10:17:58 +0200
Message-ID: <20261014081759.1111471-1-marcin.bernatowicz@linux.intel.com>
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

Gustavo's v2 proposal avoids enabling VFs for unrelated xe_pmu subtests.
This update keeps that goal, but moves setup into the first selected
dynamic case because SR-IOV helpers can call igt_assert(), which is not
allowed in the outer dynamic container.

Later engine cases reuse the VFs, and cleanup runs after the group. If
setup fails partway through, later cases skip and point to the case with
the detailed failure log.

Previous proposal:
Gustavo's v2: https://lore.kernel.org/igt-dev/20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com/

Changes since v2:
- Rename the state variables to sriov_num_functions and
  sriov_vfs_setup_started (Gustavo).

Marcin Bernatowicz (1):
  tests/intel/xe_pmu: Provision VFs inside dynamic subtests

 tests/intel/xe_pmu.c | 48 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 12 deletions(-)

-- 
2.43.0
