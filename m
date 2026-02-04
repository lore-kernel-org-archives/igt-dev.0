Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DC0E83EF9
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 09:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B957D89496;
	Wed,  4 Feb 2026 09:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlaUotE6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2653E89496
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770197228; x=1801733228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ELFzS4RttSN721E+QcDUvhj3cDKOqfKzr0BvtVmJiWc=;
 b=mlaUotE62cGfF9VM8OdQAWjTRw+O6avCwPMFhdnRhOCAghFaGxuqJxSz
 bTL+nN7yQE3CO7o4p9Sh8AtuBxdhlXB8xrwuuQkoy4sXBTizWcgbc3/QD
 hJaIniqkKE5x3FbqcUK/pC2+KInIrmpinPO4NBUAYdBvEkSZqkRExT+X2
 7kUY4bmfCfo0tkBrzxtEOSraCAul9XZKj+GKi5RNhjWVxrOU3Tyik1CXq
 3N0xVvBkF/tf7HT2TL0vZByBiT3q+1FldZCPpFp+yyxXhdZxIAnmqFtIi
 uH/Iv81XQl4FEyp6LiVP0q35LjHCXMg8wdvZy8xaFLkLO+Hm5L+lwozIc w==;
X-CSE-ConnectionGUID: jhDpO7oCQPS+AxOB51UJyw==
X-CSE-MsgGUID: Pre18yJ9Tdqm7lruEV83OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82813024"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82813024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:27:07 -0800
X-CSE-ConnectionGUID: YwhHpA9oSia+IbTtuwk6vw==
X-CSE-MsgGUID: FrsY0LnZTuK2JxB8dQe9mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="247703068"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:27:07 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/1] tests/intel/xe_exec_multi_queue: update test doc
Date: Wed,  4 Feb 2026 10:26:52 +0100
Message-ID: <20260204092653.112994-1-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
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

Dear maintainers,

As 'Hardware Building block' is not being used elsewhere,
change this documentation category for the test to 'Core'.


Kind Regards,
Pawel Sikora

Pawel Sikora (1):
  tests/intel/xe_exec_multi_queue: update test doc

 tests/intel/xe_exec_multi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.51.0

