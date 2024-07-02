Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259F9C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 14:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F6710E5FF;
	Tue,  2 Jul 2024 14:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Il5q9gVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031F610E5FF
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719931065; x=1751467065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vJrdFAyJhSCn9gWnBRv+gJBlJtVsiojxyK2Tjkdz5PQ=;
 b=Il5q9gVXs2C2vTp2I25rxwlUJRWbyYCcX9QgFtmqJ1OooosEspmD6rhx
 uxn256Yol6uNyGhAoD9IFFr/TPhU6xnl0TDnHxKS7atNWFkkd/kQyQ/L4
 qxkA0xrwwzWtkXEq0bojcUZ6v/BDbZk4XRJMOMBa7bT2cu5+xsEu4X9j7
 VxRpwRYS1g8UIOiRwQ5wiSMM1LhERz7H2OtdC2sg1f/2e2XG4gi2Ffhim
 k3WUXFDBUi8aw39fA+AQSOR5dVuhiq6nnC99VqhU+Vwrcx0EJ4SChA1ER
 E9nB8Z7XH3EBo0T+kIRKD35hKXH1w+lMbNMn60rkBQTZ1KxNu0GUQPciE g==;
X-CSE-ConnectionGUID: wQkAFu+3R/OFVnHu8/nHNA==
X-CSE-MsgGUID: Ex2A2DUgTSKtayNnjrElnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34648660"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="34648660"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 07:37:44 -0700
X-CSE-ConnectionGUID: zqRJECkGT3aWv1qNsRo+hg==
X-CSE-MsgGUID: hYUf1XNySvKFGctXc2lQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="50542989"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 07:37:42 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: [PATCH] tests/intel-ci/fast-feedback.testlist: Add SR-IOV tests
Date: Tue,  2 Jul 2024 15:07:01 +0000
Message-Id: <20240702150701.611426-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

This commit adds SR-IOV tests to fast-feedback testlist so that
they will be executed in BAT runs. Added tests are about basic
single VF enablement with and without autoprobe.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..d18625625 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -142,6 +142,8 @@ igt@prime_vgem@basic-fence-read
 igt@prime_vgem@basic-gtt
 igt@prime_vgem@basic-read
 igt@prime_vgem@basic-write
+igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-1
+igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
 igt@vgem_basic@setversion
 igt@vgem_basic@create
 igt@vgem_basic@debugfs
-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

