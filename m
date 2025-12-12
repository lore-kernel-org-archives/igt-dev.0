Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4E8D43371
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 07:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2A810E075;
	Fri, 12 Dec 2025 07:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIvJrDdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B7410E075
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765524872; x=1797060872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ydj7KjpuXWngsscec7eR5kVK/BJtRgjaKoYhqnpzm+c=;
 b=cIvJrDdu9POrpVWvmyOVQQlau0xsar0+D32140loe0Oi8K/jcCoNiWTY
 dtam1lqfNvk3HMGSYkMl0EMzTBxik66u8X7FnttARE3oDJAt77K+QsaQV
 sAHKfMexx5PSkzif0ndboReSz5q9Bh3mr8gVGby86iJMYwoiOTHtHRVGq
 YzFSMdm2Ev3Gh5+5/M4tsoRKUHpY+REs05r20aeF7okLMJgkQN59DdpE2
 8L/P8w4/fI+xFhXKDsyG1mgzWtfMuFspd9Al8BS/qt+qeQug7+th7muVY
 VbPBv/EEDjYA3/d6nvbposy8IZXxsxVZ41KSkwHPudRLhkghdrRsC+6mu g==;
X-CSE-ConnectionGUID: 2QgIc7PgTuK1gt6K/A9IFg==
X-CSE-MsgGUID: N02pQv55RhSQvdkLjo1u7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78136875"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78136875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:34:32 -0800
X-CSE-ConnectionGUID: 0kCQfPB2TnaK5m3XmlF//A==
X-CSE-MsgGUID: Lr0DjCRKRbWZ6vZsNPlClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="227658963"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:34:32 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/1] docs: update for platform-neutrality
Date: Fri, 12 Dec 2025 08:34:21 +0100
Message-ID: <20251212073423.337861-1-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
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

Dear IGT Maintainers,
I am submitting this patch to update the documentation to better
reflect IGT's current multi-platform scope.

While IGT historically focused primarily on Intel GPU testing, 
the project has evolved to support multiple GPU platforms. 
However, some documentation still contains language that suggests 
Intel GPUs remain the primary or exclusive focus, which may mislead
new contributors and users about IGT's current capabilities and direction.

This patch updates Intel-specific language in the documentation
to use more platform-neutral terminology.

v2:
 - minor corrections suggested by Kamil

Kind regards, 
Pawel
*** BLURB HERE ***

Pawel Sikora (1):
  docs: fix intel-specific descriptions

 docs/faq.md       | 15 +++++++++++----
 docs/platforms.md | 23 ++++++++++++++---------
 2 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.51.0

