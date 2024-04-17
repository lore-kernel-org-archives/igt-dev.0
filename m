Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B373FC04FFE
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 12:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0431B113496;
	Wed, 17 Apr 2024 12:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eim7MH1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41A510ECFC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713357569; x=1744893569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k/TJCuwCiQnmG4TJTbyIWYUifiktu+QdBMs7KN5hKG8=;
 b=Eim7MH1ktzeRgfY0pMUREBCHAvX64h0Smfr4CwDoqZAjdgctsfXmLIuf
 hafARW6lFkeKoYuKV/ZMH583fh7tZZy6OTmJh3byKIY3yTTaMUt2Hn/Ge
 eU/w9NFaZbEUyZkvqI7mgIUR2HBTCsk39OJE+NDzui3ha9wDvYWYQ25w4
 fTP6OmgvIpsepA+L78ncXCtIwCcWLPe4y6cpFt2eM5qUENEU1tKvs/5uw
 /AgjUqrzm8CSqoQZD57XAS+EAkVURQbDLHwfhK24BlryBYI4V2fcQtCPs
 9lL0KNiO/JIsyf+tKdgJHo7MaMxqGa7Y7LJ6AGDyiSQRRbIseJQqrxOiJ A==;
X-CSE-ConnectionGUID: /pmGuATmQfGMIscIjLcbkw==
X-CSE-MsgGUID: s/hBE8/ZRfqmCVxPiRMgLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8705514"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8705514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 05:39:28 -0700
X-CSE-ConnectionGUID: Ucn/OSb8Qp2g0wL7reg2Xg==
X-CSE-MsgGUID: SY8IglHsQZCkgy49VYFyuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23206406"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 05:39:27 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 0/2] Force joiner support in bigjoiner checks
Date: Wed, 17 Apr 2024 18:03:17 +0530
Message-ID: <20240417123319.610839-1-bhanuprakash.modem@intel.com>
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Bhanuprakash Modem (2):
  lib/igt_kms: New helper to check force joiner status
  lib/igt_kms: Force joiner support in bigjoiner checks

 lib/igt_kms.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

-- 
2.43.2

