Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1790606EE95
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BAPsBicG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4B110F704;
	Tue,  3 Nov 2026 16:37:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369E210F704
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793723803; x=1825259803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=85bRbTrnJxKy9YjdfqPMHr/SnLsTMDsYCIGd6WkI9PQ=;
 b=BAPsBicGPwzsLuDwRwu5jS0P85zuSj1oXLvihZezJTubOu3EHms+wGMB
 Qd2e+qMim2RCt1OyTb5q/o0tf0V/sIa5fGiE2GEB4Sa2nIKNNbiBDbNjO
 BV37cqx7+zv65sfnPSf+WvShlqoMa4un1ffOJnAZJFbbaqHIy+A7Gtr+P
 pxYIc8rDXubcmJxPnz00TqSzT2x5SYfFM06yiLAiOl+n1/DD7yPEm2rhN
 0oZOstxVDi/z7X2k2/iA328Ib4D4Iff4pr8/McajSjIe5Wom9Hsc6nOvP
 oBi6uI6ESM4MoFM0W5PzhmEShSXGrgrAGPTpnMVLcj8mKe+pcRUKbe6WE A==;
X-CSE-ConnectionGUID: lr+C7JucQjebfoLCzHiTBA==
X-CSE-MsgGUID: RzmblMuwRjyKaOgFYEcupg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2331831"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2331831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 08:36:42 -0800
X-CSE-ConnectionGUID: lfaVWJBYRouL6uFEhXCwkQ==
X-CSE-MsgGUID: Or9FVOFPRY6G5IL/4k0DTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6832952"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 08:36:42 -0800
Date: Tue, 3 Nov 2026 17:36:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com, 
 akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t 0/2] tests/msm/msm_bo: Add mapping and free tests
Message-ID: <ieh7tzzmseusbhf4gqrguebvxk7zitkjdws5kggrc3ci6y5oj3@rs2z2hyxrstd>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Jitta Vignan <jvignan@qti.qualcomm.com>, igt-dev@lists.freedesktop.org,
 robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com
References: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
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

Hi Jitta,
On 2026-10-29 at 22:25:51 +0530, Jitta Vignan wrote:
> Extend MSM buffer object coverage with mapping and free operations.
> 
> Add positive and negative coverage for buffer mapping operations,
> including different cache modes, repeated mappings, remapping,
> different buffer sizes, CPU preparation, protection flags, partial
> mappings, and invalid mapping requests.
> 
> Add positive and negative coverage for freeing buffer objects,
> including multiple buffers, invalid handles, repeated close requests,
> and queries after a buffer has been released.
> 
> Jitta Vignan (2):
>   tests/msm/msm_bo: Add buffer mapping tests
>   tests/msm/msm_bo: Add buffer free tests
> 
>  tests/msm/msm_bo.c | 570 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 570 insertions(+)
> 

Please rebase on current top, resolve conflicts and resend with
applyed acked-by and tested-by. Thank you in advance!


Regards,
Kamil

> -- 
> 2.34.1
> 
