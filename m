Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0F606A32C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ASpZUQC7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD6310E13A;
	Mon, 23 Nov 2026 10:33:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427AF10E6EE
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795429928; x=1826965928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ANg+/G/fchUVl7U6XByXeHyGYq+229/29BfHRmsIk80=;
 b=ASpZUQC7ktM0OymLd8a/SUM/Y1GJ59teSsMKhW3LT9FaRLSvSXo5VCn6
 SpKzgwZROrK21MXgPrDPtyOr51+v48sA1/1WA7qR3EeYXebvPS0gF1CmE
 fz6lq+uu4SI4e9/XeFAWq5o9F4eCT4U8p4ZhaUYGmzDyXrtJTkIyxJbXM
 FpXBH+Wb0GYL0Cnar5JJFmdaKmByUAaeB3kcFAy8MO4HTAMcnhr7HWUAO
 HciQCdCO1mleq7A+YGPvqQW/Zr9mIi7R/t9jp9ujceFJBsPBsY5GUDQfO
 muRus6SyMrj4spg9RQSvMMC51sicxr63QK78wmAIiicKAwIkXoQfI8/IN Q==;
X-CSE-ConnectionGUID: x1iGsxHhTvaX5HdnFtj6kw==
X-CSE-MsgGUID: MI+CqHsNQJemEfEgY8G4ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4267227"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4267227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:32:08 -0800
X-CSE-ConnectionGUID: Xh1YgEJCStW0L1oMHikDYA==
X-CSE-MsgGUID: 74YyTybiRG+loriQY7ZUjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11626268"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:32:07 -0800
Date: Mon, 23 Nov 2026 11:32:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Li, Yuling" <Yuling.Li@amd.com>
Cc: igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests=2Fkms?=
 =?utf-8?Q?=5Fplane=5Fcursor?= =?utf-8?Q?=3A?= add native cursor test with
 multiple overlays
Message-ID: <bnvcygbxlmj7sla6rpqm6g56iinzbmvpd6o43bhsgat5bstj3a@62qj6lwq7nb3>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "Li, Yuling" <Yuling.Li@amd.com>, igt-dev@lists.freedesktop.org,
 vitaly.prosyak@amd.com
References: <20261120073049.91138-1-Yuling.Li@amd.com>
 <179532717060.65319.2573542902043083133@9ac1b63fe3ea>
 <BY5PR12MB422875725C2B45D58B6619CFF6452@BY5PR12MB4228.namprd12.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR12MB422875725C2B45D58B6619CFF6452@BY5PR12MB4228.namprd12.prod.outlook.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yuling,
On 2026-11-23 at 03:38:01 +0000, Li, Yuling wrote:
> AMD General
> 
> Hi CI team,
> 
> The new introduced kms_plane_cursor@multi-overlay test passed all reported configurations. The CI status change comes from unrelated tests.
> Can you help check if they are existing/unrelated failures? Thank you.

These are non-related changes, you can tell it yourself as they
are different from a test you changed. Apart from that, please
cut you reply after 'Known issues' unless you want to comment
on them. For example, look at end fo this message where I cut
it.

Btw please subscribe to igt-dev mailing list or expect a delay
in reaching to ML.

+cc Vitaly

Regards,
Kamil

> 
> Sincerely
> Yuling
> 
> 
> ________________________________
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: Sunday, November 22, 2026 1:59 PM
> To: Li, Yuling <Yuling.Li@amd.com>
> Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> Subject: ✗ Xe.CI.FULL: failure for tests/kms_plane_cursor: add native cursor test with multiple overlays
> 
> You don't often get email from patchwork@emeril.freedesktop.org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
> Patch Details
> Series:
> tests/kms_plane_cursor: add native cursor test with multiple overlays
> URL:
> https://patchwork.freedesktop.org/series/179205/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16190/index.html
> CI Bug Log - changes from XEIGT_9200_FULL -> XEIGTPW_16190_FULL
> Summary
> 
> WARNING
> 
> Minor unknown changes coming with XEIGTPW_16190_FULL need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_16190_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in XEIGTPW_16190_FULL:
> 
> IGT changes
> Warnings
> 
>   *   igt@xe_evict@evict-beng-small-multi-vm-cm:
>      *   shard-ptl: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9200/shard-ptl-2/igt@xe_evict@evict-beng-small-multi-vm-cm.html> (Intel XE#5764<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764>) -> INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16190/shard-ptl-4/igt@xe_evict@evict-beng-small-multi-vm-cm.html>
> 
> New tests
> 
> New tests have been introduced between XEIGT_9200_FULL and XEIGTPW_16190_FULL:
> 
> New IGT tests (25)
> 
>   *   igt@kms_plane_cursor@multi-overlay:
> 
>      *   Statuses : 3 pass(s)
>      *   Exec time: [15.97, 22.67] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-a-dp-2-size-128:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.20] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-a-dp-2-size-256:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.17] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-a-dp-2-size-64:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.36] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-a-edp-1-size-128:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [1.50, 1.52] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-a-edp-1-size-256:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [1.54, 1.57] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-a-edp-1-size-64:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [1.47, 1.51] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-b-edp-1-size-128:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [1.45, 1.59] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-b-edp-1-size-256:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [1.52, 1.54] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-b-edp-1-size-64:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [2.24, 2.26] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-b-hdmi-a-3-size-128:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.20] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-b-hdmi-a-3-size-256:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.20] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-b-hdmi-a-3-size-64:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.24] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-c-dp-2-size-128:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.20] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-c-dp-2-size-256:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.20] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-c-dp-2-size-64:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.27] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-c-edp-1-size-128:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [1.46, 1.52] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-c-edp-1-size-256:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [1.48, 1.50] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-c-edp-1-size-64:
> 
>      *   Statuses : 2 pass(s)
>      *   Exec time: [2.21, 2.22] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-d-dp-2-size-128:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.20] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-d-dp-2-size-256:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.20] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-d-dp-2-size-64:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.26] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-d-edp-1-size-128:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.52] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-d-edp-1-size-256:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.50] s
>   *   igt@kms_plane_cursor@multi-overlay@pipe-d-edp-1-size-64:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [2.16] s
> 
> Known issues
> 
> Here are the changes found in XEIGTPW_16190_FULL that come from known issues:
> 
> IGT changes
> Issues hit
> 
>   *   igt@intel_hwmon@hwmon-write:
> 
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9200/shard-bmg-4/igt@intel_hwmon@hwmon-write.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16190/shard-bmg-5/igt@intel_hwmon@hwmon-write.html> (Intel XE#8583<https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583>)
>   *   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
...cut...
