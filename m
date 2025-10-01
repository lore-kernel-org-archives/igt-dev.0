Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA10CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 12:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ECA10E6B7;
	Wed,  1 Oct 2025 12:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRfLtHoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E74710E6B7
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 12:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759320358; x=1790856358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Cli5gQWY3opBFHt83wO/MkJ8zE+4zY8Dh3kxXQPjEKg=;
 b=PRfLtHoScsj2QI00jCgBoDNBKLn27Uacg54cca1yuEYcvBx5qPmaee1J
 3+Q0kzwkT5ANtwSMri6zfyUTEwfQmueKyi11B2vNG97vV2AUeb7T7wEdv
 qzzQG4ihGVTc2vpOsBpj4iFPDeP69TAo3/rvlU+Tep8wxwqdjQwmRPygz
 U6TTX2txijRY0BPi3Loqv0Dzn3ux9irRU1hyD2AHgoFT6Y9y8o+6JaP5M
 gEdXbRv75dA1sJJyzlMdByS1rNmfIfLEWDKRhEn6SHlJYx0O9NCMlOBFv
 7DCdBMjQfHGaQdUlI33fN7d2wShHrqDPFKlRlFOjafPWLCtkxKKsvo9C8 A==;
X-CSE-ConnectionGUID: abqSFlQKSCOVELOxSg/AKQ==
X-CSE-MsgGUID: YJX6Ofm3TRqMpO10HRN+Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60805414"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60805414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 05:05:57 -0700
X-CSE-ConnectionGUID: RhKtxjLdR06K2/tGdhkvYg==
X-CSE-MsgGUID: IX5mchYESBaASmrtX6jZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178714638"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 05:05:56 -0700
Date: Wed, 1 Oct 2025 14:05:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v9 i-g-t 06/10] lib/xe_eudebug: Repeat poll in
 debugger_worker_loop if interrupted
Message-ID: <bdlwvoisv5vrhguhl2jrxl5gztdcnpom7q7uiwbhidl3k6myax@ykw7jcr7izwp>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
 <20251001115447.11843-7-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001115447.11843-7-dominik.karol.piatkowski@intel.com>
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

On Wed, Oct 01, 2025 at 01:54:43PM +0200, Dominik Karol Piątkowski wrote:
> If poll() fails with errno set to EINTR, repeat the poll by restarting
> the loop.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 614f327ae..3656a20f2 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1104,6 +1104,9 @@ static void *debugger_worker_loop(void *data)
>  		ret = poll(&p, 1, timeout_ms);
>  
>  		if (ret == -1) {
> +			if (errno == EINTR)
> +				continue;
> +
>  			igt_info("poll failed with errno %d\n", errno);
>  			break;
>  		}
> -- 
> 2.34.1
> 
