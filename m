Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04039C19F4E
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DECB112024;
	Wed, 24 Apr 2024 20:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9adn/wv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D010FE73
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 20:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713989302; x=1745525302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZcGQ+Q4vHFAWUZ04JaV5u4WObr9cwpMKqNQB4RT3b3E=;
 b=h9adn/wv+ctYWMePnGjud3NFYeYrMZg2TJJl5s3yhG/wViZXsh1jgQ9t
 IKMxj0fib5nTcJI0XJzAYWfa6JvNDEVClTqwO1tpGcAm5fHF4kah06odg
 qhkG3yBEByDT/Oj3Baj9ILFXHWt6l6cyCPzg7padkkPhKjfeu2oVoDM/y
 SQYL3DFjyvss6w+hUnpwg/no90HrbHCrAUTQQSFbt7ps7bRDywPopBXsH
 tRRp+9m+pVYpCH5ptSIXv/StRs186bVEHR7qG8fsnU5HwKOaIeZgNjcFo
 VGDAcIThkTfsaeWxbMZUnSK6oNa0lxKqqrmfZUv4DET8c9e57NhhxWAFq w==;
X-CSE-ConnectionGUID: CcJycnCyRa6IkkxuKqPvyw==
X-CSE-MsgGUID: pLqNxKS2R+uRDVdCJEUsLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21068032"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21068032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:08:22 -0700
X-CSE-ConnectionGUID: wV5VV0BKTZO08+ceH2xoEw==
X-CSE-MsgGUID: 3SbkNhOHQNGseCuFTLSjpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24898407"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2024 13:08:19 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t v2 0/2] Add mocs tests
Date: Thu, 25 Apr 2024 01:38:54 +0530
Message-Id: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add below mocs tests:
1. Test to read and dump mocs debugfs entry
2. Test to check mocs values retained over suspend/resume.

Below patch add mocs debugfs in kernel:
https://patchwork.freedesktop.org/series/131425/

Janga Rahul Kumar (2):
  tests/intel/xe_debugfs: Extend gt test to check mocs entry
  tests/intel/xe_pm: Add mocs suspend resume test

 tests/intel/xe_debugfs.c |  5 ++++
 tests/intel/xe_pm.c      | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

-- 
2.25.1

