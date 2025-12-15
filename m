Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B16D5B16F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 13:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7A210E26A;
	Mon, 15 Dec 2025 13:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NtDQtwfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325C710E26A
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765804949; x=1797340949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5f7Kd/H6wSminp12ZJuDW1zQY5THDRCa0ZOYOadTHAQ=;
 b=NtDQtwfXM58n097rMPXjiE/JXeU0VRLBj+dfllYLtp90FDCj76cU+8Ji
 NlfjFg/mj4Wjcs3mXHn8Nw71Nx05MctoRLUrZ7G9JDU6HKCp8WOgN4/Rq
 p5YWx1/X3ezGM2O2D8XzQug92Tysw+BlIQk+bosNIJjpjstjPT8RLIT0p
 8mF3qLxqqDhLro6aWXredovo+InkvTF0CGcsvlTjvLBsUn9ZRBHeYEQBk
 xgWrM4Jd8mv3t2m7+WmyM0qRUk9yOlQc6jfdIqlNwmetWpgcefuTUyhZI
 jiPcreitzUoh9YWFnSYaNWrZSu/NgcliEwXqGqixjua0m+O3MEPe/ctBK g==;
X-CSE-ConnectionGUID: hDAnA6mDQKi9a8WoVcbOrQ==
X-CSE-MsgGUID: fxAB9UUXTJifLw0clRWBkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67587428"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67587428"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:22:28 -0800
X-CSE-ConnectionGUID: Lc6l0dNPTlaFCAUNNDtVyA==
X-CSE-MsgGUID: xeUOHb1LT8qonvxgU56obA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="202632396"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 15 Dec 2025 05:22:25 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH i-g-t 0/1] tests/i915_pm_rps: Improve sysfs error reporting
Date: Mon, 15 Dec 2025 18:51:33 +0530
Message-ID: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add detailed error logging when writing to RPS sysfs files fails.
This helps diagnose issues where frequency writes are rejected by
the kernel, particularly after events like GPU resets or during
frequency transistions.

Mallesh Koujalagi (1):
  tests/i915_pm_rps: Improve error reporting for sysfs write failures

 tests/intel/i915_pm_rps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.43.0

