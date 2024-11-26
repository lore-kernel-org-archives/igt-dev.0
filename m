Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF5D6553E
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 18:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D219810E99B;
	Tue, 26 Nov 2024 18:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b02/SQBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B1910E97B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732644654; x=1764180654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C1N1CN6sGP6hJk4afX1UN19ErSKRERLxEIYgjSZ96cU=;
 b=b02/SQBO9lbDwexiRm+sZ17tjIU+uT3Ps1UthOActud9eDXJoxrAPolg
 3uCecMbfms1+k88zy0v8L1NUiIs/GKxMngsFMXgDONGW7qh2vxeNXd40q
 fn7Mk3CWwWkihP8qV7hbFLEOj435gqGCJjW7oM5VkCIvO8G1B/LbeGUe2
 Fd6Kvfl5GwvihitLl9Z64l7mcIeQ6Y6x9CSiXaWgql0VAHvW0dpdxDjFj
 2fFv2i67XWEY/pyBP6CyxAfloSjG8TLFCCmyY4Tv9M+UaaZXC2CHsjBl5
 ULutBB3GQkT5wTFGAOv1hvfhY9AIUUVLNQ/kZ8soxKIrCkyT6074hisK1 Q==;
X-CSE-ConnectionGUID: jXxPy1cvSfWrdTV/DJfL5Q==
X-CSE-MsgGUID: JCiIoMi8R8GYWY22waEXIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32952163"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32952163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:10:54 -0800
X-CSE-ConnectionGUID: Bgspgj38S/6G3HES2RFyFQ==
X-CSE-MsgGUID: JT30BD36RKG8lWb5hbSrzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91583157"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:10:52 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 0/4] Ignore more warns in xe_wedged tests
Date: Tue, 26 Nov 2024 19:10:19 +0100
Message-Id: <20241126181024.1398259-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It turns out that there are more drm warnings which should be ignored
by igt_runner. Tests succeeds but later on when generating results
runner turns it into a failure.

v2: corrected and added more regex-es, move '|' to begin of split
  strings for better reading, corrected name in Cc and added r-b
v3: corrected drmtest logic for opening cards, improved assert
  logic for xe unbind (Kamil)
v4: simplify and correct pfx___drm regex

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil Konieczny (4):
  tests/intel/xe_wedged: Ignore more dmesg warnings
  HAX/DO_NOT_MERGE: xe-fast-feedback: test xe_wedged
  lib/drmtest: invalidate cached fds after unbind
  lib/igt_sysfs: improve xe sysfs checks

 lib/drmtest.c                            | 18 ++++++++++++++++++
 lib/drmtest.h                            |  2 ++
 lib/igt_sysfs.c                          |  6 ++++--
 tests/core_hotunplug.c                   |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  4 ++++
 tests/intel/xe_wedged.c                  |  6 +++++-
 6 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.34.1

