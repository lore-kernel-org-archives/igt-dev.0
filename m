Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F15D68B35
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 16:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F17210E2CB;
	Thu, 14 Nov 2024 16:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEGbm85e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B61A10E2CB
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731601776; x=1763137776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zJI67hY4U5UJ8ExUMsTixIX+V2PLC43rS83ZWUoQ4RM=;
 b=UEGbm85e/Yh6N5q0qtON7dmotP6G6eu7Xf01O1X0dXJjWaoKHI8FT1ti
 8G/N1ZtIPJWJqa+LirVcLkOTDHgUWYQAKI4CNaDn3mJhbHQhwno7QzZFp
 cGhQ+Kb0qDvy4kJLJWqZtS+PjyhYwh3ffH6YgesXACjESVid8VHcKeaN9
 M6HTbnM3/ezIt6zc7Iuz786FoB85SPNc2NE722X4P1DJT/bkv2aF0gH8Y
 336OLjyI2acul2Kb/poFkCssBkEq415eL32yb/P2AASEDK7mDgBZiEsfU
 NNHPdFcT6+F681rJdva9qB46f3sAa3aWLmCiqewvmyg0qHeQhFD+nWip6 A==;
X-CSE-ConnectionGUID: B+3xkWO5TbCWsMmLWdJjyA==
X-CSE-MsgGUID: XyXDCmvfQRaCX5oqSr+iPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42180174"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="42180174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:29:36 -0800
X-CSE-ConnectionGUID: rmqRMoM6SBmQE/+DC5gD8Q==
X-CSE-MsgGUID: KG+gxqFGQyy0ohuc4lE0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93334273"
Received: from art-dev-395.igk.intel.com ([10.102.138.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:29:35 -0800
From: "Maslak, Jan" <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com,
	"Maslak, Jan" <jan.maslak@intel.com>
Subject: [PATCH 0/2] tests/xe_eudebug_online: update thread count handling in
 query_attention_bitmask_size()
Date: Thu, 14 Nov 2024 16:28:41 +0000
Message-Id: <20241114162843.1210570-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch series adds a helper function to lib/xe/xe_query for looking up 
the values of hwconfig attributes and updates the thread count handling in
the query_attention_bitmask_size().

Maslak, Jan (2):
  lib/xe_query: add xe_hwconfig_lookup_value() helper
  tests/xe_eudebug_online: update thread count handling in
    query_attention_bitmask_size()

 lib/xe/xe_query.c               | 56 +++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h               |  2 ++
 tests/intel/xe_eudebug_online.c | 11 +++++--
 3 files changed, 67 insertions(+), 2 deletions(-)

-- 
2.34.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

