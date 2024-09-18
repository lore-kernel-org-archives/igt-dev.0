Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E89CDD548
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 16:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A4210E290;
	Wed, 18 Sep 2024 16:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/VtuxyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A5C10E290
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677391; x=1758213391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0YSJctjJ8cuUgubpJ2g/cAzwU/UOkQjXWqvW24gCkmk=;
 b=f/VtuxyXtO9jJW+wmheOoJeY2l4SJCjbY+Xa1sgj8l0sfspjzXzEIYi4
 TIcebDbEkI1PrC5zDMxEVZdaLC2F2OLjTOdtj6JS7PSNM30SkQ6FRvBYZ
 KFUwG6eE7hUN79se5kizvlEdLAwGh/n6J2ovuuKDDen/jUcY2xiiC1IPG
 0lVOjH7xBNTQp0Ry2V/eJyypZXXLzblUIaaqYqngy7Qw2+313JaCkjwod
 kPkMGZIv9daGQm/7dXhBYCLF8rcdViDp0NZjCDn/Ee0Ca1YfWYXhw9qPy
 L7ZGDyC5F8aEJ0sL7jYW4NpbOgJmYTT4l1W7d/UGsSiqlNIESAX6I23Mg w==;
X-CSE-ConnectionGUID: NdUnsi71QBS7Aaea1nTyBw==
X-CSE-MsgGUID: bMIKr8G9T+CMg4ASr6hb+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29496272"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29496272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
X-CSE-ConnectionGUID: vZWsJPd4Qq+CkDMp0J3AqQ==
X-CSE-MsgGUID: Oamz49jRSFyNHEKTTerHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69235564"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/6] Add forcewake support for xe
Date: Wed, 18 Sep 2024 09:36:23 -0700
Message-ID: <20240918163629.1186314-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
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

First 3 patches are sufficient, but I also think the behavior with
passing fd == -1 is not very good. Hence, also add code in intel_reg to
be explicit about what driver to use.

Lucas De Marchi (6):
  lib/igt_gt: Fix forcewake open
  lib/igt_gt: Document fd argument in igt_open_forcewake_handle()
  lib/igt_gt: Make igt_open_forcewake_handle() xe-compatible
  lib/igt_gt: Fallback on filenames in igt_open_forcewake_handle()
  tools/intel_reg: Add wrapper for reg access init
  tools/intel_reg: Add forcewake support to xe

 lib/igt_gt.c      | 25 ++++++++++++++++++++++++-
 tools/intel_reg.c | 28 +++++++++++++++++++++++-----
 2 files changed, 47 insertions(+), 6 deletions(-)

-- 
2.46.1

