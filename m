Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6E8C3DA49
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 09:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA1E10E02E;
	Fri,  2 Aug 2024 09:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEx3hyWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BD810E02E
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722590889; x=1754126889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i0qdANqawcWRZkx+eX6lP2XIzCvnk/jq56VHUi3ozMY=;
 b=kEx3hyWjzV/4YOQyGPxlYNTrPRj8whCEX69RVlV8p4bLHIDp+hkk7DUM
 eA6/LbS/h2ysRuZNjeKZDl3kn785Ter98nwnFmjaUBI4lCd19ukAg14+A
 mv2bfoe7h65OG0UCLmZunqEq0oOQn2lM/O3yd9RU8sIA8XN4givPFMCmg
 RWvFjb/nRgENBQ+OowxndNSCB0ABIOqlHfWHgGVLNUmLxUAmUAbxJSU/h
 EguR7N+obEG6DbTMXHX9WgHLdmVp9LoVgfKxyNgFBwpaPGZHk/G8TEGqO
 hxW16ph6RcKWIJjxfqawbsx9rUCQYANRVOnIvHUaCpWw/WhvqKh0O+Q08 g==;
X-CSE-ConnectionGUID: +82ZRWGOSZKSVXcU+tsR1w==
X-CSE-MsgGUID: OK9n0B/vSf6Z32+mF0v2HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31750486"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="31750486"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 02:27:59 -0700
X-CSE-ConnectionGUID: Wjj7qAQZTuG7GTcOZVozdw==
X-CSE-MsgGUID: VtvJyE2eTZ6l9THToIGnkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="60165682"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.94])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 02:27:58 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/1] Print version in lsgpu tool
Date: Fri,  2 Aug 2024 11:27:44 +0200
Message-ID: <20240802092746.22001-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Add version information to lsgpu tool so we can guide users
to use recent one.

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (1):
  tools/lsgpu: Introduce version printing

 tools/lsgpu.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

-- 
2.43.0

