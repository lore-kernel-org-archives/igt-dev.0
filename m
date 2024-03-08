Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91EC54E5D
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 10:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897D310F93A;
	Fri,  8 Mar 2024 10:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJ1sSUZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C4510E9D0
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709892578; x=1741428578;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=HRqNQPDCc6gM1jCxAyi51U6N4cDooIDAA4RoeLrV64o=;
 b=WJ1sSUZYjzRaPuBYr0hFMlp1ghPsWRQJ/ckd2Vk/eQplzzuqqzkJXTxD
 9OmlqEjE2QWIlM4tJODxD4nDMpRrBkARzbw4C9UNKXVhKsIfH9InMc0OB
 d5bB24inrlix3VoadkutS6Pq171VAxKpEpETaYxHeaU7UcudUowK3rjUX
 SvQFwxP1tW7XjegM86QRmQ45J38Bu7jgKmtOjQEgYnPfvvW82xeFDNfYL
 /eBJLi4EugKbReubW6Eb/39NUKKvjmUgcD76niL/Nt32EpVgCEnkUqZe+
 TJilZsyo1jcIhk3WHoxu4snQzx0vEdytJ9aB6H8Li5NTZ8/fQbof9MPHu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4465409"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4465409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14900003"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:37 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D49E6580DDD
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 02:09:36 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1riXAU-00000003pHo-3wv1 for igt-dev@lists.freedesktop.org;
 Fri, 08 Mar 2024 11:09:34 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Fix scripts/xls_to_doc.py
Date: Fri,  8 Mar 2024 11:07:41 +0100
Message-ID: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
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

Such script is not used on normal conditions, as it is meant to be used
to mass-change test documentation. Due to some test_list.py changes,
the script is not broken.

Fix it and sync with more recent test list changes.

Mauro Carvalho Chehab (3):
  scripts/xls_to_doc.py: make the script work again
  scripts/xls_to_doc.py: remove some dead code
  scripts/xls_to_doc.py: ignore fields filled by lists by default

 scripts/xls_to_doc.py | 73 +++++++++++++++----------------------------
 1 file changed, 25 insertions(+), 48 deletions(-)

-- 
2.43.2

