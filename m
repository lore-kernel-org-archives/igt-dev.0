Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E963EEC2B8
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 00:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C7610E468;
	Tue, 24 Feb 2026 00:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdG/QJwK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD70510E468
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 00:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771893719; x=1803429719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3IFOWoMBe2jMQxcgHeWkbN8kJyWcnSCw8FPgxbbIOw4=;
 b=gdG/QJwKbdtEdMlOfLKKvxdr+tw/uKLPubtWbEAgO7dzqcfmu/uUBxAb
 TS+OUv9EfhdDue3iK1UCXUrsJiFUSkH7e84FcV32F2PB3lyTTkkc10ebG
 g1kIbF9RVOvIKcsKa5pisnLJJr9SfHGoEDuc/UO6CSPl6AxSz67Z1iOm7
 m8KghEyJusi7F439mFWpYd1J9j5Lld4gpdWd6F/RDFXy+2gdkSzds2Dce
 /nEb6cgaD0ECoc4nkylA4TQraQYhc5BrF3sQeQ3RLCmbPD+5W8jw7RrrF
 lHNfH4GV5Ha+YhGzf85Bb5jvMfHsjtLf5Gata4bsMzj/GTbgUbsPWwqIt Q==;
X-CSE-ConnectionGUID: 5QGcssKSQGGldFdMHoZY4g==
X-CSE-MsgGUID: X5+6TcB5TQynVEucu9DfxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83224686"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83224686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:41:59 -0800
X-CSE-ConnectionGUID: LuYMinRXQS+gqxGIL4IKxQ==
X-CSE-MsgGUID: mEYmmw1wRUizIJ9btb4rwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="246322603"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:41:59 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jose.souza@intel.com,
	sushma.venkatesh.reddy@intel.com
Subject: [PATCH i-g-t 0/2] lib/xe/oa: Add CRI metrics XML
Date: Mon, 23 Feb 2026 16:41:49 -0800
Message-ID: <20260224004151.1836090-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (2):
  lib/xe/oa: Add CRI metrics XML
  tests/intel/xe_oa: more CRI changes

 lib/meson.build                           |    1 +
 lib/xe/oa-configs/guids.xml               |    8 +
 lib/xe/oa-configs/mdapi-xml-convert.py    |   12 +-
 lib/xe/oa-configs/oa-cri.xml              | 3795 +++++++++++++++++++++
 lib/xe/oa-configs/oa-metricset-codegen.py |    4 +-
 lib/xe/oa-configs/oa_guid_registry.py     |    1 +
 lib/xe/oa-configs/update-guids.py         |    1 +
 lib/xe/xe_oa.c                            |    3 +
 tests/intel/xe_oa.c                       |    3 +
 9 files changed, 3825 insertions(+), 3 deletions(-)
 create mode 100644 lib/xe/oa-configs/oa-cri.xml

-- 
2.48.1

