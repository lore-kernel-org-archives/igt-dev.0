Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BB0C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 13:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B480A10E403;
	Mon, 31 Mar 2025 13:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XD9dAHiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186DE10E403
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743428191; x=1774964191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PiSVa6JYE5VrBMhRi9faknqzwJOPVItesarNm/FL0Jk=;
 b=XD9dAHiAHWQbvLmlSlDRu8hX2t4xNpR94ESZqScnj/i735D0F9srDrZC
 mCR9IYqESGv6jJmriL+UmmPBGtof9aXUxvNyeCqbvAVH7YVaikrCOZsOC
 lyFcblquCWkT8d23xSZlUJrPDR1AnPQ8u2lTAC5kfV56lwqHWjvPrF0dt
 wHtD0kuFVBSfGH54fGzQLPjq2kGMcJrybchvzOiDa3GdXJFdN6sHaFOTC
 MEFOcw5LXLAFYbN4rSGHvOzjlGDGs4/m5BZOo6EOoH5OvrTFXDUh223IN
 8UFvAhv3XW2st3Ss1gOg5rTej080QgUyMufSEKqLqiDHug8Sd2l4t1PRV g==;
X-CSE-ConnectionGUID: 5nBMY/ebT1q3i+llbWmBFQ==
X-CSE-MsgGUID: G+Jdmut+RZ2qCU3vUdtMaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43862907"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="43862907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:36:25 -0700
X-CSE-ConnectionGUID: C0c1nsVkQEGmMlTx1vMSnA==
X-CSE-MsgGUID: i7Xgew4dRXCbA92+dgySpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="149267415"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:36:24 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] CONTRIBUTING: Add subscription info,
 patchwork link and lib guide
Date: Mon, 31 Mar 2025 15:34:22 +0200
Message-ID: <20250331133424.35873-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Add info about subscription for igt-dev mailing list and a link
to patchwork where sended patches with test status could be seen.
Also add some general guidelines about libraries.

v2: rewritten second patch about lib functions

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  CONTRIBUTING: Add subscription and patchwork info
  CONTRIBUTING: Add guide about igt libraries

 CONTRIBUTING.md | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.49.0

