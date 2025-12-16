Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F011D5E14A
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 13:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C61210E0A3;
	Tue, 16 Dec 2025 13:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScTw7BmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5CB10E0A3
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765891376; x=1797427376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2oSIjflus8db5P/grNU0mCMpTapn4pnB31DLbNWp1E=;
 b=ScTw7BmJH+IY4PPr30xrwv/6aJD0Fo2Q00n4LKFsi/m/S8lJj2Kn6099
 NOmmmzeRPLdpGHlfiMGRDDPFwhdtW4kNNzfE2VgqIDighLP3IzJWjoQuP
 hXU4K1Ps7wTMUZ9JjAFpzVb6BL6CO5VqWY9GgZeSOX9nQLMEm1x5nLjRN
 z30eFehHrMl1eVqTtEwIn6xYSnp8WqtZbgTtEspdlMW2V3K13upOJm38Q
 QPMjX01+2QYrYhxZYxR75Hq3P/iAwCcPUn9NPD6X3e7fb5Dd3z6dI33fM
 /OS2ACO2RB2rpw3sy38aldMQOuhBpEcORIxJw2NsfS4CKBtw9uvGpAKDK w==;
X-CSE-ConnectionGUID: a5yfnx/PQmCGlhRcV9CiMA==
X-CSE-MsgGUID: 9fjDJ4RTQGehjTOij4+Rmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79176986"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="79176986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 05:22:55 -0800
X-CSE-ConnectionGUID: nVL1tV5eQt+dQzN8JW09aw==
X-CSE-MsgGUID: ecBbdZ7RTPqP2jHrorlDEw==
X-ExtLoop1: 1
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 05:22:54 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: [PATCH 1/1] intel-ci: add eudebug tests to multigpu blocklist
Date: Tue, 16 Dec 2025 14:22:50 +0100
Message-ID: <20251216132249.478112-2-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add eudebug tests to multigpu blocklist, as they are not yet supported
on Xe multigpu setups.

Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
---
 tests/intel-ci/xe.multigpu.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt b/tests/intel-ci/xe.multigpu.blocklist.txt
index 387c3413e..b4fe21d2e 100644
--- a/tests/intel-ci/xe.multigpu.blocklist.txt
+++ b/tests/intel-ci/xe.multigpu.blocklist.txt
@@ -1,5 +1,5 @@
 #####################################################
 # Blocklist for Xe MuitiGPU tests
 #####################################################
-igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*
+igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*|igt@.*eudebug.*
 #####################################################
-- 
2.43.0

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

