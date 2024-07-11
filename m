Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71888C3DA47
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 10:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B5C10EA19;
	Thu, 11 Jul 2024 10:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6wl2Q3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E722410EA1C
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720693117; x=1752229117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BI4j43YWiSSj6fOz7bWB6Hq81FRXZODemT8aRXHTsR0=;
 b=m6wl2Q3poleC5JeVMKzsphF5YFkRP7AvjxtLGvEL4+jXhdPGEQU69Pfj
 DI7lMI6/T3w+zU8PcD/oTYW1elGIAyK9cLqy5ZVF+SCergYePICk7yOQv
 OCVZFxRlMIkTRgayhCw08SUBeb2bhlqpswEFyY93oyt858S4Hd8eAaORj
 NjLOv7gmW2MzNzDs87VqaYRgUTgA9tpYEC4k58yhWmjHR2Cxic3R0K9iq
 Ou2vzuYF0MOopPNI4nWroU/3eVEkIae4c073tHy7Wyd/OP5I1sXxJiX8v
 9IFFaJ/1DyS2+06vYPlD4p7B0zkhGdMewrPh8EESqOgFhk6Bymjir9Lw5 w==;
X-CSE-ConnectionGUID: IGikvYmZRN+7qVmY1d00dQ==
X-CSE-MsgGUID: +7T5Q2DSRyKLdC82D5UzDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18009668"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="18009668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 03:18:36 -0700
X-CSE-ConnectionGUID: 7zA6YU27QHGXfCmy8s6IBw==
X-CSE-MsgGUID: cY+pt6YMRyKg3UAJLcpl0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="53325824"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 03:18:34 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v4 0/2] Runtime alteration of debuglog level
Date: Thu, 11 Jul 2024 15:48:41 +0530
Message-Id: <20240711101843.760796-1-pranay.samala@intel.com>
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

In certain scenarios, tests may fail due to insufficient disk space, 
even though they fulfill all requirements.

To resolve this issue, adjust the debug log level before initiating 
the test. Rather than manually editing the debug log level each time, 
aim to dynamically adjust it.

This approach involves modifying the log level within the test using 
the debugfs entry, with an exit handler ensuring default settings are 
restored after testing.

Pranay Samala (2):
  lib/igt_sysfs: Implement dynamic adjustment of debug log level
  tests/kms_atomic_transition: Reducing debug loglevel dynamically

 lib/igt_sysfs.c               | 103 ++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h               |   5 ++
 tests/kms_atomic_transition.c |  10 ++++
 3 files changed, 118 insertions(+)

-- 
2.34.1

