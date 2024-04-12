Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4B8C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 18:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D110F419;
	Fri, 12 Apr 2024 18:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2PEG6ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFC810F419
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712947487; x=1744483487;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lvI9xsgM79+NgIvirWllaoGWr9fdFEygtTM7rADXJPU=;
 b=B2PEG6urtapAZ6KWSlF1Qg580GnsyXlr1y+XVJ/omJc3p6OzTgKpmnV/
 rOG0l81DRkRfo2ZnHlNkTvyuPyzloFT6GE9PaL8qgCpmaw8ZUaHb0AloQ
 QK5CZVdqHELY3p2CWAuZgGqUOrfP/o3L9xXa/UTZfW1r2UJ10brg+QA3i
 s2peX3qmeBibqqii+cF2xD3BXfuOgvCDgCj9FNKdvsECdPYVUnV4sBuKZ
 IkMdcTkewibFih/j2utcWZeF5lVDrwb5/lIAOJRYHdGLndvbqbJ9WPXmi
 VDu5DKQ17O1gXv5CEanvGEbXSSBfNr7m0ICpAuSgoMLKq+FEMFBMvcC3M A==;
X-CSE-ConnectionGUID: ujt6WH6eQ/GK8YxCC76oUg==
X-CSE-MsgGUID: CerfLog6ReiyuXBIbDh0XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12264095"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="12264095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 11:44:46 -0700
X-CSE-ConnectionGUID: MchCFhgKRy2Om/5HVGK9QQ==
X-CSE-MsgGUID: 5djI2Sp5QfOIzCJvY9cjGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21294773"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 11:44:45 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: jagmeet.randhawa@intel.com, igt-dev@lists.freedesktop.org,
 matthew.brost@intel.com
Subject: Re: [2/2] tests/intel/xe_vm: Always have at least 2 pages bound in
 munmap hammer sections
Date: Fri, 12 Apr 2024 11:28:54 -0700
Message-Id: <20240412182854.2469564-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ba59280e-905e-4622-bbac-0c55b4d9cd47@intel.com>
References: <ba59280e-905e-4622-bbac-0c55b4d9cd47@intel.com>
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

Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

