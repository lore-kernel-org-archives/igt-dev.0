Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E72C83F04
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 07:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C5210E7DA;
	Thu,  3 Jul 2025 07:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2JgrsPe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9421410E152
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751529220; x=1783065220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4BO1rPZ2vM8eORiZGjM72HAT+C/oIc6yK08RkZC9HPA=;
 b=J2JgrsPeOPe4BeqzCL3x/HzKWOv8sTQkLU94Xv/XkPhS6Ez/8p5j5M6D
 pNQoS1t3Gt7mzSZ+aP2EduesyMgUlw4ycoUnY9NpPT2f2Ri+UN3cAGIA2
 CORKzECWGUp3UK0jbpvc1F/z6JrXMVyAIMekf+LbVqywM3yDq0g4ml7No
 IN2fK0k948jtKghVjJSHwQ2hcvSRXpn4hTxbA5YxXWTfdZfVnhVT1yg9O
 yCQuUKH9AG8HYxOheduOrxgNkAV7JJmg5GkiofNqPyGP7+Uyd7TETpt03
 XvR6tvtp/mx80zgcoffOIkFIBRODo5uJcl78yhCkCt+hr0NnerJ8hlzm2 g==;
X-CSE-ConnectionGUID: R7VdqexnSlS7x7lN+L0mZw==
X-CSE-MsgGUID: RlUfoyM6QmGRKepUkx02ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71279205"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="71279205"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:40 -0700
X-CSE-ConnectionGUID: pPdWnF4nQS2wjOTw4IqNjw==
X-CSE-MsgGUID: aSUJuL8MRjKk6Tu2FU7y3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153732147"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:39 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v7 0/4] Update image assets
Date: Thu,  3 Jul 2025 13:23:40 +0530
Message-ID: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
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

Update image assets and improve file handling.

Naladala Ramanaidu (4):
  data: Move PNG images to new data directory
  runner/settings: Constify absolute_path parameter
  lib/igt_core: Enhance __igt_fopen_data to support additional
    directories
  runner/settings: Add function to set IGT_DATA_PATH environment
    variable

 {tests => data}/1080p-left.png  | Bin
 {tests => data}/1080p-right.png | Bin
 data/meson.build                |  11 +++++++++
 {tests => data}/pass.png        | Bin
 lib/igt_core.c                  |  36 ++++++++++++++++++++----------
 lib/igt_core.h                  |   6 ++---
 lib/meson.build                 |   1 +
 meson.build                     |   2 ++
 runner/settings.c               |  38 +++++++++++++++++++++++++++++++-
 runner/settings.h               |   2 +-
 tests/meson.build               |   7 ------
 11 files changed, 79 insertions(+), 24 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0

