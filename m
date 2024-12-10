Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CCCE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 09:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6246E10E842;
	Tue, 10 Dec 2024 09:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTvwnSey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E19C10E842
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733822492; x=1765358492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7K5uwhqYuXfH5+YJ92R5UEjAYMvQJKS4PQfGrZXUShM=;
 b=lTvwnSeySIRS/pK6R7SBuYTCAXa0hXu3OkmN0jZwCqMTRve4XII9Dozw
 ikp6Dh6lnCw9BE1K+DlnR2XmuxmNO2iZXYfN6g0dnqd/raiWFUAL3PKJo
 CCYhanInc+uwZllYHTFGMDbWZQUvgM6dNLVW9WdArgwltSI5Y79pNfk4z
 NtFxcp/rIypceWS1o4rifu8xiarjiC+CLl3AtJdQ/IbEmdZc3aH0d9aqE
 Hm+Wnh2a4leIVKipTzP1T3TjFbBRF6Y+57g9HbS6HWI6fzTelJrdzh14H
 554RgpFFqDKEtLHk/MqgFVfdGxiQJWiNpsSHSnQDDm4xlnxsb3QMYyW5D g==;
X-CSE-ConnectionGUID: t/pYhq80TDeu4xDYsZC23Q==
X-CSE-MsgGUID: 4npAZ7kQRDeIIyPHtDXCXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34294758"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34294758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:21:32 -0800
X-CSE-ConnectionGUID: vazj1nQXTKuJ7R+E9/RrWw==
X-CSE-MsgGUID: BiD0sVNBRz28rPbo6Ua1XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="118599211"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.231])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:21:30 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Add helpers to set CPU governor and GPU frequency
Date: Tue, 10 Dec 2024 10:19:30 +0100
Message-ID: <20241210092119.1556652-1-francois.dugast@intel.com>
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

Those helpers can be used when using IGT to check performance based on
test duration.

Francois Dugast (2):
  lib/igt_sysfs: Promote helpers to get and set GT frequency
  lib/igt_sysfs: Add helper to set the CPU scaling governor

 lib/igt_sysfs.c          | 111 ++++++++++++++++++++++++++
 lib/igt_sysfs.h          |   6 ++
 tests/intel/xe_gt_freq.c | 166 ++++++++++++++++-----------------------
 3 files changed, 183 insertions(+), 100 deletions(-)

-- 
2.43.0

