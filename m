Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B8C10F16
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 19:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5F4112964;
	Fri,  3 May 2024 19:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1Y3c7Qj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446BE112964
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714765956; x=1746301956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=INxRtxAw2+2AYgd96dg1gIvX4t6Cd+rtnIEmNuN5kR4=;
 b=X1Y3c7QjP3uK11GhUWWUqi+Qu8q4TeVHPj/KxS8+QjZM9vZ0QpdweT1c
 H2+XQ+3Lg8FFivKbPjHKuOA5hS+LFeF6+DurrrwBy+brcsWuVUzgq/2Gc
 OpR7UHTAcY4w4A68OfSJD3fj8FMjErRu2fNRRVc6wIJdbIQCXltGxmOfH
 X45M24aZQUdUhQHluidn2eWK/UThkhp5GegU4SsIOF7hcSlrZH9AEq8qD
 Yy19Uw+z/kDzGE3bgCRtVTxoJUuQgFs9VmM8q8cT/bRoTbZZcfFsf2FCd
 e4AxvgmgDH+tTQps6fhKnuzATrL5dyXUl76IxpsbOvM2ytPiYE4F3SQLe Q==;
X-CSE-ConnectionGUID: kQZLc7URRQKwHywQGQezgQ==
X-CSE-MsgGUID: 0QZEUPWyT72IeZP7feVMLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21270016"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21270016"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:52:31 -0700
X-CSE-ConnectionGUID: W522l8PARu2jM/LF+9EUEg==
X-CSE-MsgGUID: 51j9iBY7RhaDjg2oB41Fjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27632604"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:52:31 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com
Subject: [PATCH i-g-t 0/1] lib/xe/xe_query: Wait for xe_supports_faults 
Date: Fri,  3 May 2024 12:37:13 -0700
Message-Id: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

It's possible for xe_supports_faults to return false if the system is
busy with multiple running tests.  This is because the check looks for
all active VMs and searches for VMs that do not have faults enabled,
returning false if any exist.  Recently, this check has been changed to
return EBUSY when the check fails in this way, so wait for up to ten
seconds for all the active VMs to flush out before proceeding.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1562
Test-with: 20240503190138.1958302-1-jonathan.cavitt@intel.com
Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Jonathan Cavitt (1):
  lib/xe/xe_query: Wait for xe_supports_faults

 lib/xe/xe_query.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1

