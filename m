Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB947109E549
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 05:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF0210E8DF;
	Thu, 26 Mar 2026 05:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Djc09JeN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20E010E8DF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 05:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774501626; x=1806037626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M4lozxZi3VNoLL2gQDcFjyjLVarhAq0hSKlIlZOJXKs=;
 b=Djc09JeNL/yKK7INvi0z53u+vdeIvMWZ+ieo3vWR5JT0J84hUBWTdmow
 PWBhS7eWAq8TY67a7Xwh1IYuoDgk0T7ByQiGip+EPJ7ef5QdDLQMtJPeJ
 bZt9vO2isVJBWYIGj/koz+dhnwUvLP/6DixwuLoa2wseDHpWwWSO4fMFQ
 5pL4XBHoeNVtv65t7iWaGKaU30xHm4xpZt9znPPTQiP7FtR4bbW10mSbg
 OBK9fv1ZujImPZj3MYPXrBL+2Yiywn4ypvGEHWan8oDXY+e/V3fwz2k3T
 6ttsszj+MDu2pfzHzGCcq6b278EqJa9TjE0feLbmqCCoxHmd691tXwGVu g==;
X-CSE-ConnectionGUID: Y4LwZeVUQtKs/3Ue1Qfcmg==
X-CSE-MsgGUID: mePAOTfvR7GBlQufsnNyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="93130267"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="93130267"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:07:05 -0700
X-CSE-ConnectionGUID: PETKJKfNTUeYBjRbuQehRA==
X-CSE-MsgGUID: OX61VPQmRx6tan+uDkocEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224920282"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:07:03 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: badal.nilawar@intel.com, karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [[i-g-t] 0/1] Frequency throttle reason tests using kernel's
 fault-injection
Date: Thu, 26 Mar 2026 10:36:27 +0530
Message-Id: <20260326050628.2510944-1-ravi.kishore.koppuravuri@intel.com>
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

Add IGT test to verify frequency throttling reason reporting with
the help of kernel's fault-injection framework. 

Dependencies:
	- Requires xe patch https://patchwork.freedesktop.org/patch/711954/
	- Kernel fault injection support (CONFIG_FAIL_FUNCTION=y)

Ravi Kishore Koppuravuri (1):
  [i-g-t] tests/intel/xe_fault_injection: Add fault-injection tests for
    Freq Throttle Reasons

 tests/intel/xe_fault_injection.c | 172 +++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

-- 
2.34.1

