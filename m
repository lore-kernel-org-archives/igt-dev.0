Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665C3D49219
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 12:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7C710E081;
	Mon, 18 Nov 2024 12:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbSzbS3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35A910E081
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731933872; x=1763469872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O0OpXwHDtgPScsctxLBsD0otN7BXGe/0yc7OqqpCtVc=;
 b=NbSzbS3hJPEYBjopETgdKw+4gVQhgLr613Qw4yMGYxK6qQM31RZ6zHTH
 x5XnkHTDCDeoNoTcVBwdnWn3vd6IuwRrtN3hU/WCkvRffPWaJ5OfMqsh6
 noIy+o42CHUSNHR9f1EdWQEYDFAmQ8qmT4hcjoHz8I64P+vWI5YzhpfPk
 zK71w4hJhdw3Scq7olh3NR2ulj7dMQIVyLY9QHM7VYVBmE0tbF04F4gdY
 myx1Yu/GFfiGlbaDxMAjUfNZh4HtAZ3MgJquViRq+fxTRYcMCsBpAPBpi
 6HKQxbZbDhKNjHuUh03xs14q7kZNXvmuER+5dqC9hH8J216Y06lgyMS9G Q==;
X-CSE-ConnectionGUID: oWJNqIb2QqqZ88mkMQQ/xQ==
X-CSE-MsgGUID: dzIkwDodQU26h7rHm2wglw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32038956"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32038956"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:32 -0800
X-CSE-ConnectionGUID: cPTcfLOXQX6jjO5kWdb6Sw==
X-CSE-MsgGUID: o9j+hpqIQPGxwO7dYK0etg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89365004"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.159])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:29 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 0/2] tests/syncobj_wait: Update
 invalid-wait-zero-handles test
Date: Mon, 18 Nov 2024 13:44:20 +0100
Message-ID: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

The behavior of DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT has been changed in [1]
to accept empty lists of syncobj handles, but the
invalid-wait-zero-handles test has not been updated to mirror this
change. Fix the assert to check against 0 instead of -EINVAL, and rename
the test to wait-zero-handles as this is no longer an invalid scenario.

This change mirrors [2] for the syncobj_wait test.

[1] https://patchwork.freedesktop.org/patch/554042/
[2] https://patchwork.freedesktop.org/patch/618483/

Krzysztof Niemiec (2):
  tests/syncobj_wait: Update invalid-wait-zero-handles test
  HAX/DO_NOT_MERGE: Add wait-zero-handles to fast feedback list

 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 tests/syncobj_wait.c                     | 8 ++++----
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.45.2

