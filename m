Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA22CD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 07:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E701131FE;
	Wed, 10 Apr 2024 07:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGnrYS0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB891131FF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712733106; x=1744269106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ireLmxZ2QGw+h4IUVoh7DP6ZYGHYxZsE0awnSM088Ac=;
 b=fGnrYS0AdQPGxZchwh0oyF5L44SK6YW9R9PiHCr1MePA9ylV9iwXwRCK
 /pMBLlCCM0GYvrOeZXXAlzX5vJlM8dLfZpArCrAigVtDcdvqgxNuzBKYw
 5biuFq3UnlWtSsQWv5fabA5DNIiMhtzDsu8nSOpoaEXIdSyXy8AvWf4aH
 wahomxetjDnjGJNznGtern/7t0/UkDrp7KPmvp5tsq9JRhBhWi6sxLtyV
 1ZNFRriYltw7xqyLRFHu7sy2jFhz/yoYSS5XasiWvxdUTk55D+3S+uSED
 oyYJiaBRyOFvrLoNjYiRYDzNz0ITO8d5wgVi9RGpyXMPid7aZuuCphssN w==;
X-CSE-ConnectionGUID: U9ogp+7VRh6aN7VXY4Uj4Q==
X-CSE-MsgGUID: IK3A/GzvTcehpPjqpTqSbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7935769"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7935769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 00:11:45 -0700
X-CSE-ConnectionGUID: 7aasw0sgRNmeeXkdjZuc6Q==
X-CSE-MsgGUID: 4RMIZnsLSLixABlZlfPAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20500387"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 00:11:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/1] Add xe_bo_alloc test 
Date: Wed, 10 Apr 2024 00:12:08 -0700
Message-Id: <20240410071209.481206-1-matthew.brost@intel.com>
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

In an attempt to recreate [1] in an IGT add xe_bo_alloc test.

I believe I've seen the new IGT fail similar to [1] with a certain seed,
more investigation is needed. Regardless this seems to a good test to
add to the suite.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799

Matthew Brost (1):
  xe: Add xe_bo_alloc test

 lib/xe/xe_ioctl.c         |  12 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_bo_alloc.c | 568 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 4 files changed, 582 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.34.1

