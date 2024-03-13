Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71741C54E69
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 07:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84E910F6CC;
	Wed, 13 Mar 2024 07:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ig4koaPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FADA10F6CA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710316713; x=1741852713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=9OjdKL9WPmQ6R3QMsKT+rcA9FWZxAByxqWmaoqRueKU=;
 b=ig4koaPAqhrpz/H+gZ7k6hfvkPdgTRTskEV5WLcr3+IFTyPmHS+ucV1L
 7i0tq2PP2Fh14jKVpi2jqvia/9/D4RZDD6sGUsm0q2xd8/voJ3R9ti5Hd
 7TPHvETlT8zpxy6vn5d7VMIyqsVzdbuJFk4Az7VPfLUlohduTq2fmThqN
 TtvH02BkfI+OzVsOuGgjLTKQFyEuptFHH3I+weNsaZh7dBykERHu6YWeJ
 OSkpfh3sCpJqZsu+nMsnzgxsjEcM9YvDbMB8Tx3V7mXfMeDhhpxfmL5vn
 hQHO5AVQAB0h6A5kz9ZQDFedTor3zEgrm/MVSqO5LOemLRGBIYh3R6fJm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27538842"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27538842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11921918"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:17 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8C050580D79;
 Wed, 13 Mar 2024 00:58:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkJV9-00000004frZ-2gse; Wed, 13 Mar 2024 08:58:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 0/6] Do several cleanups at scripts/xls_to_doc.py
Date: Wed, 13 Mar 2024 08:56:03 +0100
Message-ID: <20240313075813.1114081-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Change the logic to use a main() function, helping its class to be
called on other modules. While here, address coding style issues,
do some sanity cleanups and reduce its default verbosity level.

Make pylint happier with it.

Mauro Carvalho Chehab (6):
  scripts/xls_to_doc.py: use a main() function
  scripts/xls_to_doc.py: beautify its coding style
  scripts/xls_to_doc.py: cleanup argparse logic
  scripts/xls_to_doc.py: fix issues with python < 3.7
  scripts/xls_to_doc.py: document all functions
  scripts/xls_to_doc.py: don't be verbose by default

 scripts/xls_to_doc.py | 155 ++++++++++++++++++++++++++++++------------
 1 file changed, 110 insertions(+), 45 deletions(-)

-- 
2.43.2

