Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0FFCD3427
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 03:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB6910E461;
	Mon, 11 May 2026 03:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NevJaSkV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C085310E461
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 03:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778470908; x=1810006908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zWTXGRwlgRe3lOMki9PmgW5P/GcqdrTwTExXjCSVhVQ=;
 b=NevJaSkVrN0b9IFy9zrHszYyxgSgY5OoyhnkbLU8JnIA83WflOhpfhj6
 BfrXPRAKj9hm9xUqjxi0KZvVQyH+JM0kOMXo+LI4Hk40osW/pWe471AdR
 bsiU5eo4TltFFJ7n/IOUtOSrCvCjxKepzeov8Z6n7CWVgMfdwF2VmBxKw
 wXAoBtgj0lOqLZtVQ0uhM8KSUzIc/tna+NbySfKC+iLJnCz8QvIH8cZkY
 p+r1crl7F19NNRfPHoA6re/yGVXU35PtPZ2qiLEFaY3lEI9q9BFH0cIU4
 eZos/WEOc4zEIL1CV4mYD9JuBvpF4oXA3y9R6ET46LQxHz7mQVPRk12yA g==;
X-CSE-ConnectionGUID: jYlcZSaNQlGg+6rzkIVySQ==
X-CSE-MsgGUID: hWUk1lnOT1CSpXGvBetnPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78380775"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="78380775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:41:47 -0700
X-CSE-ConnectionGUID: zquTlwG6S5qzqez3ys0qrg==
X-CSE-MsgGUID: JkI2k2DaRbyIdPDeUNtNaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242309098"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 20:41:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/2] Group all force_hdcp14 tests together
Date: Mon, 11 May 2026 09:11:36 +0530
Message-Id: <20260511034137.93127-1-suraj.kandpal@intel.com>
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

Group all force_hdcp14 tests together. This is to make it easier to
run all force_hdcp14 tests together and also to make the test
suite more organized.
Moreover, MST Dock ends up in a bad state after running the force_hdcp14 tests,
so grouping them together will help in avoiding running other tests after
the force_hdcp14 tests.
Only expeptions are the DPMS and suspend resume tests as they help
get the MST Dock out of the bad state.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  tests/kms_content_protection: Group all force_hdcp14 tests together
  tests/kms_content_protection: Group all MST force_hdcp14 tests
    together

 tests/kms_content_protection.c | 96 +++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 48 deletions(-)

-- 
2.34.1

