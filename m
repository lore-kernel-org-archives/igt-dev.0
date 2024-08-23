Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3A9C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 15:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992EB10EC5A;
	Fri, 23 Aug 2024 15:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGAN1ZF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294B10EC5A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724428677; x=1755964677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ag/jFIKk6A2J/f+4sUViRkmi65/E5m9DZgU5c9e2ilA=;
 b=NGAN1ZF42WwdyEyuBV7ltzR772OMjO4Ea7+O0OTmaZx+yok/vsB3KqKu
 T2Jdc9wxi87DkMYrj5d7ZdnvLaWt9FsHIlTX0cHfS4tpLxneGpYbsSyUc
 ipUZjx6k6c1cszuJ/F87f+r+y4c7QpCC0+EeHNIivA9fnskMdC2X+DFuA
 wFulqMwIHiNGsRM2XY03s1nKQ8ZPkCiOQSr+U7urAwmsTckwnwBz/HA9T
 bShfq6zmhwi8BIqHRoLlVfrn/JbvUfQ0kbylgWyEYW12/XD0spmx+v5Uw
 zJvf92EHGJ8vXWPL+PXgotWiOFgN48FvhP22MU/lrcGiy0+oauolh6WfI Q==;
X-CSE-ConnectionGUID: 7aaJbL/eT7GPe6z7cvHJkg==
X-CSE-MsgGUID: gP6hpPsyRD29BS1AxkzV3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34318445"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="34318445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:57:57 -0700
X-CSE-ConnectionGUID: 8dTGI/B/STKjMV3YlCHXbw==
X-CSE-MsgGUID: VHO0M+RWSzyAe5jcmknGig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="99358321"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:57:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/1] Fix compilation for musl in
 intel/kms_pm_backlight
Date: Fri, 23 Aug 2024 17:57:46 +0200
Message-ID: <20240823155747.69745-1-kamil.konieczny@linux.intel.com>
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

It was reported by Yuka that there is missing POSIX header.

Also while at this I sorted out other headers.

v2: sorting two more headers: unistd and sys/types (Janusz)

Kamil Konieczny (1):
  tests/intel/kms_pm_backlight: Fixed build on musl

 tests/intel/kms_pm_backlight.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.43.0

