Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681DECD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0760A10E9DA;
	Fri, 12 Jun 2026 11:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxYmp6fH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3501110E9DA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262057; x=1812798057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5qRLjOYGpirGDcuhZVrnlJ2t3YucnUlGgSp6386vMGo=;
 b=SxYmp6fHQz2wnt+ipQe9oaMop6QKIL59hzB1B+z7i7LpKeaMfn6zO1UK
 7x3OAo8AFML6Fe4rbMl2EB/WyNO840vwHKq0ny+UD6TmeUAuGOwerw+Rp
 aIIlgPzdPTfvjFTpfpgIL6gWA+dFfprJFKHNifoMYdVbg4ljBSlQI63W/
 tkt8SbH7kDLxtGvmHVGWrx9NQBk3p07AQjjn7cs6sSXrjX529q8o50Ykm
 gTXipTQ26edaB45AO18M1xnieTIHrVAIIReLgZFRhh93stTS0RCh56Ws8
 8CTNj4Y89GGLAopyPVrXQC6qC49lZltmi4zj4U07Ab5d3VWhQH6yq9fon Q==;
X-CSE-ConnectionGUID: h2LSWFGeRviY6gzTRu3Sxg==
X-CSE-MsgGUID: Ln9OkuyGQgW6VifazHvRPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93580802"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="93580802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:00:56 -0700
X-CSE-ConnectionGUID: nCpd8eOzSn6MOX8lRY3aTA==
X-CSE-MsgGUID: TmMV8g7FRdWRoIR6IN9Buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="245902897"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:00:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 0/4] intel_vbt_decode: fall back to guessing PCI ID from
 VBT signature
Date: Fri, 12 Jun 2026 14:00:40 +0300
Message-ID: <cover.1781261899.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

This is inspired by Michał's patch [1], and I got kind of carried away
trying to figure out how to infer the stuff from the existing codenames
in intel_device_info.c. I didn't mean to do it, but here it is. :)

BR,
Jani.


[1] https://lore.kernel.org/r/20260608124121.3131410-6-michal.grzelak@intel.com


Jani Nikula (3):
  tools/intel_vbt_decode: store codename from VBT signature to context
  lib/intel_device_info: add a helper to guess the PCI ID for a codename
  tools/intel_vbt_decode: fall back to guessing PCI ID from VBT
    signature

Michał Grzelak (1):
  tools/vbt_decode: return 0 from get_device_id()

 lib/intel_chipset.h      |  1 +
 lib/intel_device_info.c  | 75 ++++++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_decode.c | 35 +++++++++++++------
 3 files changed, 100 insertions(+), 11 deletions(-)

-- 
2.47.3

