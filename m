Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D9FC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 03:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B2310E123;
	Wed, 31 Jul 2024 03:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvDp0TQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4B810E123
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 03:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722396928; x=1753932928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OYW/4bWbvrCcO0TJ0/ZxR6EKPAXfxV8fGr5oYFyBXck=;
 b=CvDp0TQjS3K0GtVOIjh2LkmVmpwg6qxaeF7AdqPttgyTFFvbxqzbFmBO
 jPFE/HsNxZQ0WbugSJfCCkmZ7fA5BGSHot/lrrN/3s3Sy/B/CyMEt07Pd
 UEq68hAcj9eVvHE25HbHkkspYgOd8VZPmrdt2ix2Ji8Vt0BdR6rXN8MIQ
 uD9CFM6dSk+zPtDofcvfImm2NR/qqZqeaklRv3SpsIaZ9EOFbUWMcmEvj
 /NZrT4wfi/yTfdf0PcSbRRk+sq22+/goh94h+PL5D5azAF9GfWiL1MeqH
 fkmhSsiIgV9LQjFUm2SM36euAHh32CbnBcFpV53SCcXqq+gufGbYvcj0O g==;
X-CSE-ConnectionGUID: 8kTG4b9FRGiFuzBuWF5Rpg==
X-CSE-MsgGUID: i2mMKju/QnKeRbuSZnWcMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30917870"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="30917870"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:27 -0700
X-CSE-ConnectionGUID: NeQECvOgQ/6VdUFrBAAotA==
X-CSE-MsgGUID: L+snNkncQ1WhdvKbZaXRFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="54538331"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/3] fdinfo doc and xe_spin fix
Date: Tue, 30 Jul 2024 20:35:01 -0700
Message-ID: <20240731033504.1426640-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Some minor fixes/improvements while studying the spin and fdinfo code.

Lucas De Marchi (3):
  lib/igt_drm_fdinfo: Improve fdinfo parse documentation
  lib/xe_spin: Fix xe_spin_wait_started()
  lib/xe_spin: Fix ending the loop

 lib/igt_drm_fdinfo.h | 12 ++++++++----
 lib/xe/xe_spin.c     |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0

