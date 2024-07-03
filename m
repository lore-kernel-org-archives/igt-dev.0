Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD82C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 10:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4624C10E785;
	Wed,  3 Jul 2024 10:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSKXkE/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD36410E799
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720004102; x=1751540102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/senUSxwLvmRBIpEf0QasNBx4jDaHe0+LfJdX6JptyY=;
 b=QSKXkE/OTiAiu2Q0BXz81MGKIpPs6MLr0WZqd60BdNWmwTKP1b8ZYFYy
 KWkjhR73xUUD9Fxxxt6CyGiundxJCyrQjyGmB8zRYkV0QOmMHQn7eR1+x
 LT2sMiGwGFYWDfKnkTHnWkaggW9Kl3TTeJWjC+wgjccnroEv5sTJeh7/4
 PCSHjo5e46XMT22S0JRUUbuEubhhfltM0IVZ/NiNAaIy1COx8r1NFIIS6
 qK5m4+IoYhhTgZskDD5GjPyGPSH/nVFmgBuhHM+5l5uaPcU84hF3rm4hn
 +YGrkEfiWR+/3/FAW5s0UuQam/R5ZXIc/Oil9uRRgGyywNEijuB/LZiA6 A==;
X-CSE-ConnectionGUID: rwEHyEogTviI0mQfL9b25g==
X-CSE-MsgGUID: uGW6Z+iGSM6wpe6duDgTig==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28365653"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="28365653"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 03:45:34 -0700
X-CSE-ConnectionGUID: hRfvJ9dRTjGL/GxPhZs4/g==
X-CSE-MsgGUID: UBWsXnaBRcCpBzekCZ2RUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="50826900"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 03:45:32 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/fast-feedback: Add SR-IOV tests
Date: Wed,  3 Jul 2024 11:12:21 +0000
Message-Id: <20240703111221.616274-1-jakub1.kolakowski@intel.com>
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e6..fc312a123 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,8 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-1
+igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

