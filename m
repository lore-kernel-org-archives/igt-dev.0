Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3F606A33E
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BA6Qb5I3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639FC10EC25;
	Wed, 18 Nov 2026 16:38:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BE210E7C1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795019825; x=1826555825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kb+bsqDESNfKDtM/hYeDibLgLjGSQ9CLlheRcKbBbIs=;
 b=BA6Qb5I3chCHjFH92+F65RYg/n4BDpUyCq1uLWcfnk15WSiPPW31dDoD
 TBAabPhgvH+aDkGXXkvNFwnRKlGzQe29qRcZfkGLXiPjhBV5K3WDdDnhd
 o4jJRajI1IqU9L2UN9qEg9DgGqPWsThXWHkEbyJdHBsYreIK3/m8apKj1
 8YnSuzZHf+fg9ZOULM/mQ0VDOFNQ3kLCulZ8KRk0Bg91Y4MJ54Ro1SX9R
 kIjpEU7xy5R6qD5HDHYVAgwxOkNGFzQJ41I1GjUGy3Y/zF/xG28SjJhk3
 PRD49q5Mkf3U6KZzcv7ecH8EEWCZ4DUf/yZhQdmqhRBPfFdxptjDLVXrk Q==;
X-CSE-ConnectionGUID: WCPD+Vi2QFalb11BO8YaFg==
X-CSE-MsgGUID: WGPm5LlbQy6H28GHlof0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3698009"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3698009"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:35:17 -0800
X-CSE-ConnectionGUID: vnOGN73vROm8dMNiyAzysw==
X-CSE-MsgGUID: 1IKuFOx+S7i0p5MDacrGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9981401"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:33:55 -0800
Date: Wed, 18 Nov 2026 17:33:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ray Wu <ray.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 alex.hung@amd.com, sunpeng.li@amd.com, chiahsuan.chung@amd.com
Subject: Re: [PATCH i-g-t v2 0/6] tests/amdgpu/amd_replay: Fix state and sink
 status checks
Message-ID: <jljckd4yqnspdpxoc3ueapppvsfdo27zg7sfuon556turgo57u@ixg6erjm6dqt>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org,
 jani.nikula@linux.intel.com, 
 alex.hung@amd.com, sunpeng.li@amd.com, chiahsuan.chung@amd.com
References: <20261116022447.3981877-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ray,
On 2026-11-16 at 10:24:41 +0800, Ray Wu wrote:
> Most checks in amd_replay can never fail. Fix them one per patch, then
> check the sink Replay error status in DPCD 0x378.
> Tested on an eDP panel with FreeSync Replay: all four subtests pass.
> 
> v2:
> - Split into separate patches, one fix per patch (Jani)

No need to adding me to cc, as this is amdgpu related.

Regards,
Kamil

> 
> Ray Wu (6):
>   tests/amdgpu/amd_replay: Read DPCD at the target offset
>   tests/amdgpu/amd_replay: Fix test_mode checks
>   tests/amdgpu/amd_replay: Fix inverted Replay state range checks
>   tests/amdgpu/amd_replay: Require REPLAY_STATE_3 after settle
>   tests/amdgpu/amd_replay: Fail on page flip errors
>   tests/amdgpu/amd_replay: Check sink Replay error status
> 
>  tests/amdgpu/amd_replay.c | 92 +++++++++++++++++++++++----------------
>  1 file changed, 54 insertions(+), 38 deletions(-)
> 
> -- 
> 2.43.0
> 
