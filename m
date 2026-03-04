Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D648EFCE4C
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 22:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A421210EA72;
	Wed,  4 Mar 2026 22:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iY+Eum/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85A010EA72
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 22:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772662346; x=1804198346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SfhDhJ84tAtATaBAqy74HzlnFawb7zoQJDXpi1aLJEc=;
 b=iY+Eum/2HMZcZ5ZOh1qC7N+qNAC2ymJTAK7X1FNQ37qt7CyO567AZ4Yx
 M/SJtaFb1RHdNAwvyOAQGqQuOhSMTJXf7B77ygd9m0efmScjICPFmX9M4
 LA+33bJw4V33I4+f9zx7sTbs+7/gMMD6PpMKoM2xe3Ke7rqN5xiEJp8Sr
 RURveta0Sw8hxrKe6iuxxPZdtlISfdXf0Z68IhZpVl3R7lmXPjULuqk63
 BZMIXbXId2CycUckU9wj8gyNLyaaIsVDQSZcRLTIzQcH0VbTw7EqaMdGG
 hbAAlBkFdeIS4wPgVafiZQYFi2VvnzZZiqsD8DEu4p4AfRWuqoj3nQpQa A==;
X-CSE-ConnectionGUID: 4W0iV1FKQQSLQV8Z81IZmQ==
X-CSE-MsgGUID: Gi+YHP+SRcKS+d4z86CEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73651238"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73651238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 14:12:25 -0800
X-CSE-ConnectionGUID: sQPQtHVrQS6Qx374epuU4A==
X-CSE-MsgGUID: g3WXwAeLTqiu/Qx2nhL+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218417636"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 14:12:24 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, zbigniew.kempczynski@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] tests/xe_userptr_pressure: Add rebind-under-compaction
 test
Date: Wed,  4 Mar 2026 23:12:02 +0100
Message-Id: <20260304221203.4053291-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series adds xe_userptr_pressure, a new IGT test file targeting the
userptr bind/rebind paths under sustained memory pressure.  The goal is
to provide a reproducible regression signal for bugs that only surface
when the kernel's compaction machinery is actively migrating userptr-backed
pages concurrently with GPU VM operations.

Written to catch regressions like the one fixed in
"drm/xe/userptr: fix notifier vs folio deadlock".
See: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4765

Jan Maslak (1):
  tests/xe_userptr_pressure: Add rebind-under-compaction test

 tests/intel/xe_userptr_pressure.c | 372 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 2 files changed, 373 insertions(+)
 create mode 100644 tests/intel/xe_userptr_pressure.c

-- 
2.34.1

