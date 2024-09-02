Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D0CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 11:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6F10E2B1;
	Mon,  2 Sep 2024 11:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEgg5bnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AA310E2B1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 11:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725277869; x=1756813869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lBseMI6/iA9oQu9+AI83DHPAqrywngcYwvd6BIC9f9w=;
 b=UEgg5bnl3eYmHtd03llL3r+PXcMYgKvAU1nGXbBQUPKsAI8fWq5tgJoK
 XPVdBQ7dw+7m3kt4Irg4vFG7Lv6Nclq08GG5mqeP4H7zl+m7VYA+Yz1Cn
 iWVLU46TG0dv9e8GUX2Kyr6QJEOq3G6rA4yALPF/r8R2yvcBpYgGjX6q3
 fruMU6n5M7nuGL+Lb1sQUVGjo2u5w5umUSI25jCrh/1fQPDwvYLrys2De
 696mwg1I6dOtFm5r/aquolGr22/4OjwfIGT2gpfqNjsSLWkerxQVdNhIN
 AQo0hxrqDn5vcymxN4voHxoKoFW0qLplMEzhv2tfHnuQNqLAFhT/6/V5c g==;
X-CSE-ConnectionGUID: H4c+XSu4Tg6HzK0dGi1zog==
X-CSE-MsgGUID: JIi5pmwjRcKjBrl76Qt4Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23370221"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23370221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 04:47:12 -0700
X-CSE-ConnectionGUID: sScQvkioQCCey8WFSTKKlQ==
X-CSE-MsgGUID: Pg1NMPGPRf2ZWeIfun5OWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="69390041"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.240])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 04:47:10 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] lib/intel_batchbuffer: Introduce
 intel_bb_create_with_context_in_memory
Date: Mon,  2 Sep 2024 13:46:55 +0200
Message-Id: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch extends __intel_bb_create to take memory region as argument,
making it possible to create batchbuffer in non-vram memory on GPUs
that have vram. Existing helper functions preserve original behavior.

To make use of this extension, intel_bb_create_with_context_in_memory
is introduced, that creates bb with given context in given memory
region.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  lib/intel_batchbuffer: Introduce
    intel_bb_create_with_context_in_memory

 lib/intel_batchbuffer.c | 48 +++++++++++++++++++++++++++++++++--------
 lib/intel_batchbuffer.h |  3 +++
 2 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.34.1

