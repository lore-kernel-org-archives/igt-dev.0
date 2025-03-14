Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3F2C35FF3
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 00:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B6F10E957;
	Fri, 14 Mar 2025 00:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qifok8XK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17C510E23A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741911667; x=1773447667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GM+LfueloQOTrtq9gLO55xnBEOYpjGydtDWuuFLcii8=;
 b=Qifok8XKg+my16kYlDgAi+1Vsn7QCukUnE9Yd/kTncSYJ5MwO1LJqdfl
 azT/sDi4+Fr+t8+Mz6f6Eaco7x59O5KS6fuVOFNNpY7PaBALmBy9GWAKe
 CR3/B1eNh9MXiCtOHJg0p6Uggnz2wc7x9DdSSTZTQes7Ozn6/Kv6ufjsE
 u2jq7zqCgsoS5fSXWNWXlNhFiWLzVHycgP9j+E6Hd+5j7yxzBFT1BRVK7
 Pb13otAgqu4uWutnHPr4ZcFXYF+cQdh2geRJJCwFEuSQsoP1Z2JUGFqJ6
 usBXlak3FWqKdgElYALkM2wB5APjAgP8d6Lz4PgqoNHmbdr2sk+AkcKbE A==;
X-CSE-ConnectionGUID: A5KBz9X7T1eVbLkDdnODZw==
X-CSE-MsgGUID: Ic4QWZOqS9mUTmvxJuNFEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46703108"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="46703108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
X-CSE-ConnectionGUID: dg2ac3j5R72XgMLluRf8GQ==
X-CSE-MsgGUID: 2VrYy/MASjOefHZO9LNg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126149591"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 3/3] tests/amdgpu/amd_hotplug: Fix compile on Ubuntu 24
Date: Thu, 13 Mar 2025 17:20:58 -0700
Message-ID: <20250314002058.220854-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314002058.220854-1-ashutosh.dixit@intel.com>
References: <20250314002058.220854-1-ashutosh.dixit@intel.com>
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

Fix following compile errors on Ubuntu 24:

../tests/amdgpu/amd_hotplug.c: In function ‘is_system_s2idle’:
../tests/amdgpu/amd_hotplug.c:110:14: error: implicit declaration of function ‘open’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
  110 |         fd = open(MEM_SLEEP_PATH, O_RDONLY);
      |              ^~~~
      |              popen
../tests/amdgpu/amd_hotplug.c:110:14: warning: nested extern declaration of ‘open’ [-Wnested-externs]
../tests/amdgpu/amd_hotplug.c:110:35: error: ‘O_RDONLY’ undeclared (first use in this function)
  110 |         fd = open(MEM_SLEEP_PATH, O_RDONLY);

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/amdgpu/amd_hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index ee3256c0b7..93765afb6a 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <fcntl.h>
 #include "igt.h"
 #include "igt_amd.h"
 
-- 
2.48.1

