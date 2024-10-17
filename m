Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BD8D37483
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 12:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E9110E7FE;
	Thu, 17 Oct 2024 12:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUzGSyCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885A310E801
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729167547; x=1760703547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pb+Zy+JbH+K12/PQ1h/9/uDu/w356QHCvKLnGNM9aMk=;
 b=CUzGSyCCtVxH+OCVoW07qbQ7H5BA/4joesVVYlgRwb6pnx7IP6yTBnqX
 lvVKngveFT7YiNNvchiDgohFJXRN2irlwd5fLsJdh93jr8bFtNWWvRjLl
 rUyjf1D7zFfKfJUDPRyc15mSa3KKfICUlTlLZXKUA8jHovcG2Mz1QlioO
 Jvb+UIhMPS8mLnw3rBI+ANOyOBAznMLmKXvKeQG/j7fAzoqg7Tj3WFlQA
 fpVTN/+vaO1GKuykKiyD7AU3+tNXVhwkh1/kQ6XHLK6spKqFiYm9FxUBq
 4MzJtWYWPCBoR3K/i3at0xHFojNwbR97o4cDMiV9EcOKMFxA/zT0uPiJ0 w==;
X-CSE-ConnectionGUID: o8vM8prYQYOsi5oRfn/9jA==
X-CSE-MsgGUID: cGyrFcqMT/W6U6HRSXS3Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="39285483"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="39285483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 05:19:06 -0700
X-CSE-ConnectionGUID: 1T+4VY93TMqSndiDiPggCw==
X-CSE-MsgGUID: iLcCu6OYQ+yhczjkNV6AjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78569298"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.100])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 05:19:04 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] MAINTAINERS: Change Bhanuprakash's email address
Date: Thu, 17 Oct 2024 14:18:52 +0200
Message-ID: <20241017121852.45488-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

Current one will become inactive in few weeks.

Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a310ef26..90c3c0880 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2,5 +2,5 @@ Petri Latvala <adrinael@adrinael.net>
 Arkadiusz Hiler <arek@hiler.eu>
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
-Bhanuprakash Modem <bhanuprakash.modem@intel.com>
+Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
 Ashutosh Dixit <ashutosh.dixit@intel.com>
-- 
2.47.0

