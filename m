Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE4CCE8347
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 14:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD5610E50D;
	Mon, 30 Sep 2024 14:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqGKShQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030210E3F6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727705605; x=1759241605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ddSMHgkxpafJAoFcMDqXaLhK0ahI6rpGk6CCQ53Kw9w=;
 b=dqGKShQvjSNqkXs8RYwKrrpgFEor1stmklwUMaHu5eILFvMMbcnNJdnS
 U6sNG3Z0jbeMI9Hs9Z0Y+EUX/9nOa6O9O4JM8/4kf/DfGF8Gm/BCG/FPi
 jG9W1v3PRttnNfszERjGQQGloJW3Ell806ckiaH3DQYw952SWhZT2UC7d
 wi72ng512A3QirD50MDYrWSFYAomFBIbvssvcG+t3N4xAI5Z0e8ZotJ0N
 QUhuQL3DWoCJGhvpegIrkL1UNimvSwkLM30Lw58t4J5B6LyrOXkLvsVGG
 g9az7+9ffmayYT7xXwNnI22hErJkrR4TzyAetyvUYEG6nOu2RUn/nhFa/ w==;
X-CSE-ConnectionGUID: ZlTMc6gpQfCo14rev/Hl7A==
X-CSE-MsgGUID: SKmRsypRRHWQ5sFje8PQdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30591114"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30591114"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:13:25 -0700
X-CSE-ConnectionGUID: 2HaX88u3Qr2EcxIc7N9Llg==
X-CSE-MsgGUID: n+ZDs7wdSfOG23UlKFy5SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="96645233"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.99])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:13:23 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v4 0/2] Add test for fault injection
Date: Mon, 30 Sep 2024 16:08:22 +0200
Message-ID: <20240930141248.810483-1-francois.dugast@intel.com>
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

Francois Dugast (2):
  lib/igt_sysfs: Promote driver rebind function
  tests/intel/xe_fault_injection: Add new test for fault injection

 lib/igt_sysfs.c                  |  54 +++++++++
 lib/igt_sysfs.h                  |   9 ++
 tests/intel/xe_fault_injection.c | 191 +++++++++++++++++++++++++++++++
 tests/intel/xe_wedged.c          |  36 +-----
 tests/meson.build                |   1 +
 5 files changed, 260 insertions(+), 31 deletions(-)
 create mode 100644 tests/intel/xe_fault_injection.c

-- 
2.43.0

