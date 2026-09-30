Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12847CA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 14:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9515310E14E;
	Wed, 30 Sep 2026 14:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Whteeawz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E7310E14E
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790777604; x=1822313604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4g50LGa1Pyp20ekAVbhJp1Gw0x+wlJLWf+DjJzK6lu8=;
 b=Whteeawz5GkpqipeP8+q9KsI3DzZQRv5ubh55aPbAs5rtAo6SlO/wRUE
 7otFJC5Dn9DMqAxON7vcnemIUScd9CKdaUS/0oWRQHZWw0OJur83yQ9FX
 PWRJFhWl0JI2OuIWeSanMyPpIBD18ZWUs7gb87WApCHNyyW5MVhrKJ3Tc
 HVXOLYSVgwUZpBgZyuOtZWk6AtMNdIf+FZ3uJ81YNVmjw41KIb1WBSOam
 TWV1vaGdBNVZg383sSvm1jTqMvDRRchPP7srCY+Xu2zIrhxJSduDJH5J5
 fNA9h/44SfqFxkHiXky7nR2iUvHe0OHH7DK4K0ZpDkTXOe9HnHNbAAZ2Q g==;
X-CSE-ConnectionGUID: +wBcYkfzRNWlBB52wW6Avw==
X-CSE-MsgGUID: BIkPdCF5Rl66ipt0KtcH0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90375618"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90375618"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:13:24 -0700
X-CSE-ConnectionGUID: xt64z0nURcSGwwzugmJfSg==
X-CSE-MsgGUID: 91VenYh5S7+jF60VAzWaJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="301973380"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:13:22 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 0/1] lib/intel_compute: Enable thread-group preemption
 on NVL-P
Date: Wed, 30 Sep 2026 16:13:08 +0200
Message-ID: <20260930141309.228834-1-jan.maslak@intel.com>
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

NVL-P supports thread-group preemption - enable it so that
the compute-threadgroup-preempt test is no longer skipped

Jan Maslak (1):
  lib/intel_compute: Enable thread-group preemption on NVL-P

 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

