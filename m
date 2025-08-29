Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C36CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 03:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA77410E1F5;
	Fri, 29 Aug 2025 03:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBYkr05z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8567310E1F2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 03:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756439778; x=1787975778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IrlMn9Th/wqbdVIYLnYDSV/wbh7qqOjCiX3G4q9awoo=;
 b=mBYkr05zuEijSSiwSo8Xqm6+Qkb2PC8oOBGVeGl5nA9l8cBcWKMiRJS4
 KCEQWlsOBj/IPucTDIbJ96Z5D8duBr5mZ5GWUD2hOWzXq9hZ1hknkKtMb
 PRQ4g/miXgc1BUhnMmv7TsZzkjqrXmnlwc4xk+ApCfrqUeFtyEY9uli5h
 bQbusZPUfjZEErKdyuXv8m1kH/2fkMnVKEZXLR0fRU6Y/9NLEhyUTPlH7
 J0ur/UcgQT6Xo2YyJoRgkXRPKAg9/A340ir4UvruG+RG3ieyAIGESp9HC
 hi+sT4IOzEbXiJFUW1ATqaGkhA6AGTI90gyzlUk+Hp91Lzzqc6o+pTKps g==;
X-CSE-ConnectionGUID: BRigF/hzTRyhkEWXl0wIuA==
X-CSE-MsgGUID: YwQwA7UyRK+WLAqkRBZ+xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81314110"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81314110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 20:56:17 -0700
X-CSE-ConnectionGUID: 1AJAv7o8Tbyvm1PZ8zOlMQ==
X-CSE-MsgGUID: hyVFhGW4Q3yDPMWtym2dlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169808975"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 20:56:16 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v5 0/1] tests/intel/xe_evict_ccs: This patch adjust
 object size as per VRAM
Date: Fri, 29 Aug 2025 03:56:08 +0000
Message-Id: <20250829035609.858784-1-sobin.thomas@intel.com>
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum VRAM size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

v5: Fixed review comment for igt warnings and commit subject. [kamil]
    Fixed the condition for user provided max size value. [kamil]

Sobin Thomas (1):
  tests/xe_evict_ccs:Adjust object size as per VRAM

 tests/intel/xe_evict_ccs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.34.1

