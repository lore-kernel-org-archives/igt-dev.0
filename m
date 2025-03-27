Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7DFC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 15:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB8A10E90E;
	Thu, 27 Mar 2025 15:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsyJxv3x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC2E10E90C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743089512; x=1774625512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nc4wmhP6nQAbS1yzIsmcnwA8hFIhhwN13kt4a8+0Ew0=;
 b=RsyJxv3xWJXS2gzLo4G3eMoV/Dl9qJAKYymrL8twh5cFMhUEs8OqqXVW
 s5u/nWSt36OCxrpJ6hBMQkbbxNY5B1iyJaBwa7r6aoT3cUfWPzuImjiZN
 DAyBL0JHLfnCDsUavicPtE1csE29gzL1XQXP77q/J71IjWCaEpdgUttVc
 cPwuH/Pso1GEr2iHabriSOE/nR5BoHhBcokQ9cGV1VN39yZnCajCgLlkc
 GHN9rDRY35/ctXYw72ER/JXDGegsQPBQMVfzt6G6L0Xkgc342MKJc8Q2c
 dA2462aDxAFPBCLYdVB04LBeRUtl/wxQMyYvpAvTxMq7PusIhmL/WsUBr Q==;
X-CSE-ConnectionGUID: W+j8fxFzRu2dFAo+kFECRg==
X-CSE-MsgGUID: yD2JSf3SR1qwq/Y0hmhLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55087555"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55087555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:31:48 -0700
X-CSE-ConnectionGUID: mxqBzHPATBaAxq5T3UbUHA==
X-CSE-MsgGUID: B4wc6IUTTMKZt//BWsmFyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129875535"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:31:46 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1 0/2] CONTRIBUTING: Add subscription info,
 patchwork link and lib guide
Date: Thu, 27 Mar 2025 16:31:28 +0100
Message-ID: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
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

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  CONTRIBUTING: Add subscription and patchwork info
  CONTRIBUTING: Add guide about igt libraries

 CONTRIBUTING.md | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

-- 
2.49.0

