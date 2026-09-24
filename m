Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0308FC98317
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 12:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42A10F4D5;
	Thu, 24 Sep 2026 12:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7dHVc52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0C410F4E5
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790251482; x=1821787482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HJ8eXpIzF6cfs3eU2qlXojj2FE+4PF1pHmmFk3xcX1o=;
 b=j7dHVc52bzpkR0MlDU1oM2D0fIT20nf0seAILK4BY6jwmCSasoxsKoEM
 WdxjZUw+kl3Py8S+aDCBXkzifnAhpCg0g0FTOM6boAEo6I5aUvaEElYKa
 uQqM+d6bejzW5Tv41ZcNThfs55evTpjGfhhOK3RkZLyv7C5mr7mRSHuoo
 r4U4cZXCghKoCyd1I0px0+4eYEOBSvs0L9cIBMCarf1IdPlLJrF/L08HL
 /aQCLNL7LHUOUXgiSKvf9JQbmkuPuLAGVG/CWrx4+YkN6/iwT7SnTTfAX
 o5spYzvGwL3EFYP7ovc3o5M3U3wlKicOMOdNg3kylDLJONsk0GEfI6fVO w==;
X-CSE-ConnectionGUID: bOIgbPdwQHKqZrHYjGd97g==
X-CSE-MsgGUID: o445p1grTGexiU7Pf3zY4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78572192"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="78572192"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:04:42 -0700
X-CSE-ConnectionGUID: nMifMG4OSr2FNBlIV992ZQ==
X-CSE-MsgGUID: Kp4oSxElQ0iZfTA4WOAE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="274122975"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 24 Sep 2026 05:04:41 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe: Fix exec queue and vm leaks
Date: Thu, 24 Sep 2026 17:34:36 +0530
Message-ID: <20260924120438.1485077-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
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

Some xe test create vm and exec queue but never destroyed them so
they leak on every run. Clean up them on before test end.

Dnyaneshwar Bhadane (2):
  tests/intel/xe_cw_post_sync: Destroy exec queue and vm on cleanup
  tests/intel/xe_exec_queue_property: Destroy vm and exec queue on test
    exit

 tests/intel/xe_cw_post_sync.c        | 2 ++
 tests/intel/xe_exec_queue_property.c | 5 +++++
 2 files changed, 7 insertions(+)

-- 
2.54.0

