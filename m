Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E32C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 14:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9920E10E188;
	Tue, 14 May 2024 14:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8qiIpbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833D310E188
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715698599; x=1747234599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y1DhTYuCGRweRpKN54BKYzgcaAnikM3wM+Wr/YYculs=;
 b=i8qiIpbKXMoCbBw8t/zTvGQet0oO1cZ2ftxG9Ek7HxLYFbD7rLozJMAB
 dnZVZF+jrLSZE8uxODLvkgsqHN7O5ydL5yuAtu0prLNJHbXFrXt0Brxhr
 nBGCmQvWfzQiG2FYFMMVxwHeJFLWgzBGTU79hQkr2ATtNGdD1y5dzR0Oj
 lkwC++h2IeG/sQhBq5AxjKknf3Vqo1Wgd6E0nnvJfyWxQXFlgDxCq1/jR
 ssM64VmNlIu1KxneS2/DsGQT1fCI9zk9jJ3h78XlLBPUkf08j/SNIsYEJ
 4yyZWjmbSQy22wEz3b5881LDzAIk72RmKuQtncq3TDhE+WzbWJ73+W9TJ g==;
X-CSE-ConnectionGUID: GToUU9TfSFOgC2xCNrUJlw==
X-CSE-MsgGUID: CPIdbW4GTmmrmkhV8paA3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11537727"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11537727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 07:56:38 -0700
X-CSE-ConnectionGUID: Jnx+XBVAQxSva2uM9fizkA==
X-CSE-MsgGUID: zSQa/2U5Q+OwMjSBrVZStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35420470"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 07:56:38 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH igt-dii-client v3 0/2] lib/xe/xe_query: Wait for
 xe_supports_faults
Date: Tue, 14 May 2024 07:41:20 -0700
Message-Id: <20240514144122.3778902-1-jonathan.cavitt@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

It's possible for xe_supports_faults to return false if the system is
busy with multiple running tests.  This is because the check looks for
all active VMs and searches for VMs that do not have faults enabled,
returning false if any exist.  Recently, this check has been changed to
return EBUSY when the check fails in this way, so wait for up to ten
seconds for all the active VMs to flush out before proceeding.

v2:
- Remove loop from lib version of xe_supports_faults.
- Change xe_supports_faults to instead return the return value of the
  ioctl call used for the check.
- Loop when xe_supports_faults is called instead if the return value is
  -EBUSY.

v3:
- Add missing newlines.
- Split series into two patches.
- Make timeout depend on simulation status.

v4:
- Wait 5 milliseconds between xe_supports_faults calls.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1562
Test-with: 20240503190138.1958302-1-jonathan.cavitt@intel.com
Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Jonathan Cavitt (2):
  lib/xe/xe_query: return errno from xe_supports_faults check
  tests/intel/xe_exec_fault_mode: account for EBUSY in support check

 lib/xe/xe_query.c                | 15 ++++++++-------
 lib/xe/xe_query.h                |  2 +-
 tests/intel/xe_exec_fault_mode.c | 14 +++++++++++++-
 3 files changed, 22 insertions(+), 9 deletions(-)

-- 
2.25.1

