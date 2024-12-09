Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34A4E77180
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 14:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D73910E4B7;
	Mon,  9 Dec 2024 14:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W11gHBj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F9D10E4B7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733753678; x=1765289678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J1VldF+4s/kGPFmPcCWtlfAgs5UrFyEGKVi0z1UDE/U=;
 b=W11gHBj/Xf/BOLbJZ9XFZMkT5amZZ4jhrQUXoYyEC6H2wgZkmIXMZ3Py
 ud9yUw2nv85ZuKdhSVKFjhBISvGdMSPZJJNboygNa++J9jWvelqjdrh96
 +BO+Kw63ERn4IS8R5wbTjqA7FxJu69vQYGdKZan8U68lJDq6H3RA6z6Fg
 lh2qdVw3l5VE/aPn2k0ki3UrsLmPdF2+6zw81A/9J/Pn48Y7enNYMvOMw
 gxg3D+5nOIpvc4ht72u1Fwc4V5jTPHm4h0d4Q7vBtNqAdhGl3T1ca0zIa
 74CBXuTYHvr53wJw/6RRSuhRu2iMhyA+kKWy7Q7c4TMLojPqvYIHTN3Av g==;
X-CSE-ConnectionGUID: bQAwIqf7Snm+sUYEMTEYJw==
X-CSE-MsgGUID: M2IinOJrR/+v3HG27BMFjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34187305"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34187305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:35 -0800
X-CSE-ConnectionGUID: DyZxTxquRVi6rWOcloKJHA==
X-CSE-MsgGUID: xCiHBPG/QzeG1obp0bi4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95544029"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.170])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:33 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel/xe_eudebug: Introduce additional ufence
 testcases
Date: Mon,  9 Dec 2024 15:13:56 +0100
Message-Id: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
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

Introduce 3 new ufence testcases:
- basic-vm-bind-ufence-delay-ack: Give user fence in application and
  check if delayed ufence ack works
- basic-vm-bind-drop-debugger-before-ufence-ack: Give user fence in
  application, hold it, drop the debugger connection and check if
  anything breaks. Expect that held acks are released when connection
  is dropped.
- basic-vm-bind-ufence-sigint-client: Give user fence in application,
  hold it, send SIGINT to client and check if anything breaks.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (3):
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-delay-ack test
  tests/intel/xe_eudebug: Add
    basic-vm-bind-drop-debugger-before-ufence-ack test
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-sigint-client test

 tests/intel/xe_eudebug.c | 126 +++++++++++++++++++++++++++++++++++----
 1 file changed, 116 insertions(+), 10 deletions(-)

-- 
2.34.1

