Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23C2C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 16:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7435C10E854;
	Thu, 18 Jan 2024 16:09:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6012E10E83C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705594156; x=1737130156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qRE1nUPDipOPfLY7zRXQZIShaQgXoyioGB4hLLGpGY8=;
 b=OoiNVVbg1seQ5eyyHR9CWdK1ocNuymY4EUTQxPkK5dLHtwDkf8apI6Mz
 BUpNTL0+98M2k7SIG+jWRnkDfeJcpi3LD4oF6Mr3k3tgViOu+TaWiRvuY
 +RTKMKG7i7MwgdVEyEgtCK7MUitBmUshLCKvpbkp6UzIqHv1wzMmKQZAN
 bisbKADA+IA/W6pBLo8sCBkbEOOBg6iZ2JwNkNnk9ZGP5nOzRi5iPy9qH
 bP6P/eL/mA3Bhw8a9ESDC3o01jycz43oR+FiqvkyT1/evq6dV12HfCsmt
 SccNlbB5VxgdKwegYxAnGHzGH87mo6yflDkOpoTJWw2I7eijsJFN4dddx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="382016"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="382016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="33145324"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:09:14 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] add force bigjoiner test
Date: Thu, 18 Jan 2024 21:48:45 +0530
Message-Id: <20240118161847.1001234-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Earlier bigjoiner was enabled only for below cases
a) for mode having hdisplay > 5k
b) if clock requirement were higher than 1 pipe could handle

https://patchwork.freedesktop.org/series/124730/
With above series we can force bigjoiner without such constraints.

Kunal Joshi (2):
  lib/igt_kms: add support to force big joiner
  tests/intel/kms_big_joiner: add new test to validate force bigjoiner

 lib/igt_kms.c                | 54 +++++++++++++++++++++
 lib/igt_kms.h                |  2 +
 tests/intel/kms_big_joiner.c | 92 +++++++++++++++++++++++++++++++++---
 3 files changed, 142 insertions(+), 6 deletions(-)

-- 
2.25.1

