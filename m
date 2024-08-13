Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E4BC531DC
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 12:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4369F10E320;
	Tue, 13 Aug 2024 12:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkWsjVbj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2303A10E320
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551357; x=1755087357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2N6g4oSoJryq00IQ1nE1G5mzC7L8c8QYax73Q4YHEQI=;
 b=GkWsjVbjAANzCAXXtMS47XqodemNkQmZ4Tf+mJBJQ/d22O/3UIp3u6Ra
 w/LrIj3SAjjuWlEQmTL/jRrW7bkjxq7j69x8EoCQnjHF874fc7LTcL3xz
 fCZKQ9gCG0oSSiIwfJ2QQdP0WvsZxTXOXmFwfOyfAQsXXvPTiRNGqNORP
 UNtG0jr5eK2rG5vv/4l3/sciL4fjZxzKxAYYx8HNd9XnQksIslpwlDtRe
 C38J5SUKIWORkSh2P+4ztS+MInb+Ml5sBVJhT9WUk2j3C8OQEiGt/w3Ze
 tpYHuAbpSUOk/tVC3cyyjuQ8/ZuQ1zd/dPCmeiE6KZhhOcpUxAtFLtAOG Q==;
X-CSE-ConnectionGUID: 0WcMFkKjSgyzweu38lKFjw==
X-CSE-MsgGUID: wjA4Kp0ZR9C5bAYiaT2JXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21869614"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21869614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:15:57 -0700
X-CSE-ConnectionGUID: Fhg25FenRwaDdTvILfc3vw==
X-CSE-MsgGUID: WWef6RnxQdir0lmfLDBXWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96181322"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:15:55 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 0/5] Force connector/crtc attrs to default
Date: Tue, 13 Aug 2024 17:36:13 +0530
Message-ID: <20240813120618.2697195-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Add a mechamisn to force connector/crtc arbitrary attributes
to default on exit.

Bhanuprakash Modem (5):
  lib/igt_kms: Add infra to handle crtc arbitrary attributes
  lib/drrs: Add support to force drrs to default on exit
  lib/dsc: Reset DSC bpc to default on exit
  lib/igt_kms: Force "edid_override" to NULL on exit
  lib/igt_kms: Reset spurious hpd to default on exit

 lib/i915/intel_drrs.c        |  41 ++++----
 lib/igt_dsc.c                |  16 +++
 lib/igt_dsc.h                |   1 +
 lib/igt_kms.c                | 191 ++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h                |   6 ++
 tests/intel/kms_dsc_helper.c |   9 +-
 6 files changed, 243 insertions(+), 21 deletions(-)

-- 
2.43.2

