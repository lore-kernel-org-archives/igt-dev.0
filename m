Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43426CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7DB10E19D;
	Thu, 21 May 2026 11:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT9qcViP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9010910E19D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779363240; x=1810899240;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=4+CaEC37HlTiIF5fVJhd8YErUk/fusGdg5A0cIlupzc=;
 b=IT9qcViPS1gk4ScIaU2TAu/j3MmA6f4BOAw6D8hxGRaZMC9VRdX9Fqk1
 h3WGFmstH2zMyiz6dmrWyoWEzT4YSLbtcRG2uFFf+/NJqO8MbykZyrxP7
 jlfTBgHkFV7CO2gMSVEZNYsuNt64BocBQxGtJ/EMQF0yP9H635Q23ltkZ
 gzBrIIkYW4+bDGsa2Ha6vRDCcSWdKasvZVI265LCfdJAeuR7Wvoy/OcLz
 KT6EAWxjhnfzK8CY1vvhgoYpUozSpw+ymMWdfldOLCTBKENoAUxWCpEi2
 Hw2ZDignH/2FVwTTVVvf0+CQVvVFIagugxplUbqefnmeqoF9FaghMPQBi g==;
X-CSE-ConnectionGUID: 6pF69g/9Q6mDbHVKulBW6A==
X-CSE-MsgGUID: VXJD00hRQfSdoJj49DvDhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80312762"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80312762"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:34:00 -0700
X-CSE-ConnectionGUID: RNeJ7bPvQriqEuwf3qBGhw==
X-CSE-MsgGUID: 9L720KNuSCW++TO1ovuFSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="240370775"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:33:59 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/2] lib/intel_batchbuffer: prefetch fixes
Date: Thu, 21 May 2026 13:32:18 +0200
Message-Id: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELtDmoC/yWMwQrCMBBEf6Xs2UAa2ij+iohk09Guh1iyrRRK/
 72JHt/Mm9lIkQVK12ajjK+ofFKB9tRQHEN6wchQmJx13vauNcL8eMoKdcZeeh/80J07DyqDKeP
 XFP92/7Mu/Eac60M1OCgM55DiWKNlUtr3A88IbpCEAAAA
X-Change-ID: 20260521-ibb_fixes2-0856a6d4746e
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=597;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=4+CaEC37HlTiIF5fVJhd8YErUk/fusGdg5A0cIlupzc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDu1cHsNng+jNpUI+ehurHwl5JgGuVcHvSvq0i
 tX4+QWe2zWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag7tXAAKCRAjYrKT3hD9
 16iyC/9fI5Nu00a0yu6Yxw8E26EtntUmx5R7xC2usz15wB44LG+nmBYDnDa1WGQCWToaROl376s
 BcYi2airnB3uE7LL/8p8zzGw1mjuewT5Uy+5D7lC/Uk27A+s4W8dYatTb/1ydpRhH9gt184KxEQ
 w3mSY3N1P34bwk+ObRQmHVg+mbBKQ6L7Y0bEGg3LLdCkjUl1Qi6msr1Q1d56bctU2AYZhMVGDux
 frLtBBML97w2w5FsEoKFxI/7nlfZdy10v0M0hHaYjws7k+zaIZ7Z/iHah024QdHZuZizrMHUtcZ
 DntJSdqJnitudE5122uOJyzqseshX9MpJVkBs4PPfLMXU/lXs4A7Tv1DFr4wWLJjG/xvifvWhN6
 QSifmdRPIMrnCk0xP6xbU3SaEOvWat+Az3jPTtD7cfd04XRVqHIdRnwCr1hrE/E6bg9dNbW9Ie9
 slnO0lvVvtVKGpTUv1QWa3rgNdM/PW6rwCk2dUhxt87nqFTaV9aHcLXCx3Qoe7PXwTj9Q=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Two patches fixing batchbuffer prefetch handling.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (2):
      lib/intel_batchbuffer: assert on accessing prefetch area
      tests/intel/xe_exec_store: increase batchbuffer size

 lib/intel_batchbuffer.c     | 3 ++-
 lib/intel_batchbuffer.h     | 7 ++++---
 tests/intel/xe_exec_store.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)
---
base-commit: 636a3d128f10348488b47da605c49b775911fd89
change-id: 20260521-ibb_fixes2-0856a6d4746e

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

