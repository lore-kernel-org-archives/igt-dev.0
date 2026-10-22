Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEA2606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RSe+a33G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081A3112314;
	Thu, 22 Oct 2026 05:25:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEBE10E1F9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792646645; x=1824182645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e/Qv1/qiV5cwXs5CLMjlN7ZN91SwVdldcUCiLsLPpY8=;
 b=RSe+a33Gb9NIN1bUtYpXxy15u6hjznysapT3wr6c788ctSRLcM/5YRXG
 i+e5y/QtpzceD/z/1gUk8s4dHIFvx/vPwDwVzmyOSvpKO209QzQhPJHZf
 RJ221CaTNSu/OewEZEl87/9YjXnLQo5vSsd1stsIw8GRT1RqhP70aNoMH
 dytf72gQZkdWfKajKaysybF9LX58pLi3HpTXyUi/vpyB+WsMOgyW2duW0
 1Qu8Q9YhylFcx2fJEV/vQlSINDN/teRoe3tKirZxBj+xVps/yiOuR3Gqu
 GnEYyHM8vBCzEn49dwZtF19TuFnD6Gz9r2OYSc1x2JBfl+RCVFnWA1o31 A==;
X-CSE-ConnectionGUID: DCshazjOT8aa9RrSPQglYg==
X-CSE-MsgGUID: d6UIs5CZTYC+cKDJCajTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1285457"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1285457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:24:05 -0700
X-CSE-ConnectionGUID: mHXdg8W4TxaSjIa+xt1L5w==
X-CSE-MsgGUID: mFRhAMgKSce6bedUaekeXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3398392"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.163])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:24:04 -0700
Date: Thu, 22 Oct 2026 07:24:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/3] lib/intel_compute: Add missing graphics IP
 support
Message-ID: <sc7izkox3kvs3juzb7mt6zvoyyq7qals6ed66gsds6lsg4cwo2@aip3qapvcp2r>
References: <20261022044903.823091-1-jan.maslak@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022044903.823091-1-jan.maslak@intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 06:49:00AM +0200, Jan Maslak wrote:
> Add the missing compute and preemption entries for graphics IP
> 20.02, 30.01 and 30.05 so the compute tests no longer skip.
> 
> WMTP and TGP were checked on hardware for all three IP versions.

For the series:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

I think it would be good to add back-gen matching in the table,
I mean if ver/rel is 30.04 and we got 30.00 entry it should be taken
as matching. We would have lesser entries and new ver/rel like 30.06
would automatically reuse 30.00 (unless it would require a change
to sth new).

But this may be follow-up.

--
Zbigniew


> 
> Jan Maslak (3):
>   lib/intel_compute: Add support for graphics IP 20.02
>   lib/intel_compute: Add support for graphics IP 30.01
>   lib/intel_compute: Add support for graphics IP 30.05
> 
>  lib/intel_compute.c                | 33 ++++++++++++++++++++++++++++++
>  lib/intel_compute_square_kernels.c | 33 ++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> 
> base-commit: d40c5ca415f6eed36d83a752600a7d7c1f10f17c
> -- 
> 2.43.0
