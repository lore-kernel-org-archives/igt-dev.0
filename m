Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7080DC47DB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 00:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC610FE05;
	Thu,  1 Feb 2024 00:51:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933FE10FE03
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 00:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748673; x=1738284673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DVo+H07fbz9hFO4xqI3qVvUxgNsA3+DZZ0oH9bFGtks=;
 b=Xz9RHHnm+rFx6ENJJDPo+pmZCA6e1evXQr6C+pm66RTuicIdW0ah6hNs
 n02oJ58Zkoe4s8/YRkHCWTFhvVGYjWvpGCvfhcnidSnn2lvDpk7P4gc7c
 Fi5p+NXUDWvqCivc7t2oeZK2vnDxIOzXN6E4YrIQ56luCmHSXeCecbn2C
 GnW16Zt8G2Mkb2c4Fvwe9QhQZppytbt69eU53ZvjduzbAUmqPzZNUomuU
 w0lANcnJKov6g7Wmz9hGYNc4A5z2WWo9T5oacwwQr6/RJ+3B5XGzQ6Ety
 bOVgI4cGK+1Q3XygxF25A6K7a8HODuANSB8I97P0pEogOKBfNOdyY4zWU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3608555"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="3608555"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911966771"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="911966771"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:51:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] igt_kmod and sysfs fixes
Date: Wed, 31 Jan 2024 16:50:27 -0800
Message-ID: <20240201005115.352192-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Related to my review of
https://lore.kernel.org/igt-dev/20240131181156.80571-8-janusz.krzysztofik@linux.intel.com/

Lucas De Marchi (3):
  lib/igt_kmod: stop using KMOD_REMOVE_FORCE
  lib/igt_sysfs: make sure to write empty strings
  lib/igt_sysfs: Fix dir fd documentation

 lib/igt_kmod.c                 | 42 ++++++++++++++++------------------
 lib/igt_kmod.h                 |  2 +-
 lib/igt_sysfs.c                | 20 +++++++++++-----
 tests/intel/i915_module_load.c |  4 ++--
 tests/kms_content_protection.c |  2 +-
 tests/vgem_basic.c             |  2 +-
 6 files changed, 39 insertions(+), 33 deletions(-)

-- 
2.43.0

