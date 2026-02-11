Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65872E9E30A
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 13:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED65510E5C0;
	Wed, 11 Feb 2026 13:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0SZjUMO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CBC10E5C0
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770818175; x=1802354175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZfSFdaJzr7GQQu0d83pl+HVWkjsKNcIXQ0PvrTZQ1PU=;
 b=A0SZjUMOfAu5KIfwtdVXw6eZsqT4SccNihHXVB9h/Ez+zOi4dvQMDHHY
 +oWc5hNro/rUUPbp0S3X0iQQ6BFzZHqLHIThpJixaM0kidI2YX8tY8v+V
 7CokHF6FBbbBmvq8dwgrZdmPDF95FzBxqfcRkRLWCQEapUzUSYhvdV+7e
 YMaxpV62pDIrnkxCrHrSayim8wBZWTiWRE+/hJRJwuZWqhzah58CrxGLg
 tTM3iR2TQq2ezewMCT0RHdDVVXHjijtM+f79tGly0nftisL38Hd7CTaGF
 qaQJ3uCBfoleLrtx+m6R02EWfiIY1pOtVEVgxlxYPQLkWWxtEuyfqc92O g==;
X-CSE-ConnectionGUID: jokAC+jcS6u6bb00I2Cp6w==
X-CSE-MsgGUID: 2yv0YXAKTrKgd/BirkWNFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82603453"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82603453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:56:14 -0800
X-CSE-ConnectionGUID: o1P+tDvBQH6zAVbGdPktmg==
X-CSE-MsgGUID: PviWunGqQyuRz7QqQb7zUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="249904547"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:56:13 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] tests/xe_eudebug_online: Skip canary check in
 set-breakpoint-sigint-debugger
Date: Wed, 11 Feb 2026 14:55:48 +0100
Message-Id: <20260211135549.14135-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Unfortunate signal timing can result in tripping over count_canaries_eq
assert in run_online_client in set-breakpoint-sigint-debugger test. Skip
canary check in this case, as it is not important for this testcase.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/xe_eudebug_online: Skip canary check in
    set-breakpoint-sigint-debugger

 tests/intel/xe_eudebug_online.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.34.1

