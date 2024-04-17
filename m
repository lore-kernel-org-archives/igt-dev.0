Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23212C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 11:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8B81133E3;
	Wed, 17 Apr 2024 11:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kn2BzLdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63C1133E0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 11:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713352415; x=1744888415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HkUaJ4agJW6lUzXwHDKbVPoTGgYJUiaiXKfm9e0A5pM=;
 b=kn2BzLdn/QAm8Q6fAZzrxO7k5qXQWRDmLMvZkj8uiyWR2uOohKjEYRqK
 rO/gP7NnOVRdby3CYKBajOP93D555DSXf7jA7pjP7zGxwbkjyXghFu0Mw
 CB+4eezZpG9zCScWo/C3GzVAFIPiPqyqizyRipJe/PUh3AVIzx735MUNG
 2OCpoxQVgHFHjpEswxW38wWF4OaMMmJtKhN26lA8ht/mfxRtdIXOxoUED
 ArDQY2dBiSuR+AhEcoiCAzNkjRF1KI9O9gwW8p9OdnxMeFo/n1vCWjjQi
 TT/FwCAzpchtbK2xRhBokrZILro3Twqo9PqWX+BjoNRUp8hY2XjkvKj0G Q==;
X-CSE-ConnectionGUID: /0k1plE1Rym0D+NRdJrzFg==
X-CSE-MsgGUID: ulw4wsOrQPuOrNLW0FxXcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8699108"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8699108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:13:35 -0700
X-CSE-ConnectionGUID: Jk8hlFwNQZy3VVsUDzPGmg==
X-CSE-MsgGUID: ypz64ANkR+K9wul+Nkud2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="27384045"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:13:34 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 0/1] Put "Run type" highest in documentation hierarchy
Date: Wed, 17 Apr 2024 11:13:23 +0000
Message-Id: <20240417111324.3231762-1-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
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

Let's put "Run type" at highest place in documentation hierarchy. It
will be reflected in html generated documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Katarzyna Piecielska (1):
  tests/intel: Put "Run type" highest in documentation hierarchy

 tests/intel/xe_test_config.json | 66 ++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

-- 
2.34.1

