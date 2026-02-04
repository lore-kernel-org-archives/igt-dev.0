Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F0E83EED
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 08:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35A410E232;
	Wed,  4 Feb 2026 08:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvNgnZK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569B310E55F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 08:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770193718; x=1801729718;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jtm43nnhCf2lp00R+RnPbpfdyRdo0AmuiTzuJeJs7PY=;
 b=VvNgnZK1BQfSIdcIdi1rD7nLQO2EzdMG/H3JqTwNwCGvu38OkdoTi96y
 W5PE3ywb7Mj/ZzcIKO20WtUI0aRZ70K8hqL41QA0iWJMmiJnNtS75Wy9v
 YA4KrRmCrXucD1qqf1yr/x2kzoepLTq8ZJuQIjWTIJFKdWngiE5wgALsV
 pRJAECJmjEZU4GLkuhrRWZ8to90F8tDz685RWmHCtgW/nBBl/RLA+dD9Y
 TkjBd3DdsLdLFQmrV/QCWLjavWvc+zl5oYGvhT3ojGVpCTDHq+DEoUR3y
 EUBMIWMLhSF6e1KTJ9zTCbQ2KI7+71t705kh3a7HPh/XZl9+Kuikx8bGo w==;
X-CSE-ConnectionGUID: IrgyDaaWR3y9D1yqBSXq4Q==
X-CSE-MsgGUID: +tcj/kgFQ+GV6ph0fAjPLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71278296"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71278296"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 00:28:38 -0800
X-CSE-ConnectionGUID: nyieMnG6TamGCe+45gs4ew==
X-CSE-MsgGUID: bur9EbS5RDu6fKY4m2Xd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="240930490"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2026 00:28:36 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t 0/2] tests/kms_plane: Refine clamping and modifier skips
Date: Wed,  4 Feb 2026 14:09:11 +0530
Message-Id: <20260204083913.1048566-1-pranay.samala@intel.com>
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

These changes avoid running source clamping tests on cursor planes and 
skip modifier subtests that are not supported on the target display 
platform.

Pranay Samala (2):
  tests/kms_plane: Skip cursor plane for source clamping
  tests/kms_plane: Skip unsupported modifiers

 tests/kms_plane.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.34.1

