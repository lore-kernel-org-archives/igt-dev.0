Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826D8E77198
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 19:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CE410E318;
	Tue,  7 Jan 2025 19:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lskBnWNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F28910E318
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 19:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736279707; x=1767815707;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dQoT0aQj70EtYy5+GvKWg8YEN9iwQw37EbkSQ9qvGN4=;
 b=lskBnWNIhmUHIS8E37SsDL+ABvmthaOY/95Y0O+0/1XCYIqxt9AF9dwl
 Jd/Qsr/rtsC4eGDRKPoSgFXHBtRiOHy65yVkhsI/h6zR3qEa3mgRfV6Vc
 dszcLkVIfu87rKokl3XT5USfmaFH0JgnnuIvFrml7070FTVgkfVxGR1SN
 oT6rKLhUdjT8E8Lm9l1nyOfWW8AaNJU6znCKgYL5zhSWJe9x3vxaecoyy
 gGfYGwWP6WUJKoMyxsAoNmwqBXhX3wOCqwV0M9wtcP8iXDI9x4r/R0HLT
 D2QEy3Rz/uwrM0+x3U4RvDVwT5x4z7PFknZEfpmOP4itJtNXgN9VR7GwH Q==;
X-CSE-ConnectionGUID: 6h2fLCF1SOuR09oaAFC/dQ==
X-CSE-MsgGUID: mml4qDkhTo2bXLE4oZ0xrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36504840"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36504840"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 11:55:06 -0800
X-CSE-ConnectionGUID: 63BC926lTLKM8HxdBIf67A==
X-CSE-MsgGUID: 0HfYlYO9Tl28cmv44VVCZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="107738253"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 11:55:04 -0800
Date: Tue, 7 Jan 2025 20:54:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 DeX77 <dex@dragonslave.de>, Jim Warner <james.warner@comcast.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL()
 takes 3 arguments, not 4
Message-ID: <20250107195447.v5fvx2jbg2jduyxa@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 DeX77 <dex@dragonslave.de>, Jim Warner <james.warner@comcast.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
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

Hi Thomas,
On 2025-01-03 at 23:26:28 +0100, Thomas Petazzoni wrote:

I have few small nits (could be addressed at merge) and
one question to Jim.

In subject, you do not need to cite file extensions, so better:

[PATCH i-g-t] lib/igt_aux: since procps-ng 4.0.5, PIDS_VAL() takes 3 arguments, not 4

> Unfortunately, the API of procps-ng has changed between procps-ng
> 4.0.4 and procps-ng 4.0.5, with the PIDS_VAL() macro changing in
> upstream commit
> https://gitlab.com/procps-ng/procps/-/commit/967fdcfb06e20aad0f31073474cb94545c9bdea5.

Please do not use dots '.' nor commas ',' at end of links, so better:

https://gitlab.com/procps-ng/procps/-/commit/967fdcfb06e20aad0f31073474cb94545c9bdea5

> 
> This API breakage has been reported upstream as of
> https://gitlab.com/procps-ng/procps/-/issues/366, but in the mean
> time, the build of igt-gpu-tools breaks with:

Same here, no ',' so better:

https://gitlab.com/procps-ng/procps/-/issues/366
but in the mean time, the build of igt-gpu-tools breaks with:

And last question to Jim, do we really need an ABI break in lib?
Why not just make new macro PIDS_VAL3 with three params?
And change old one to drop 4th param?

> 
> ../lib/igt_aux.c:1358:78: error: macro "PIDS_VAL" passed 4 arguments, but takes just 3
> 
> We fix this by detecting the version of the libproc2 library, and
> adjusting accordingly how PIDS_VAL() gets used.
> 

+cc
Cc: DeX77 <dex@dragonslave.de>
Cc: Jim Warner <james.warner@comcast.net>

Regards,
Kamil


> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  lib/igt_aux.c | 7 +++++++
>  meson.build   | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 3407cc4f2..f5bf48da6 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1358,10 +1358,17 @@ static bool get_process_ids(struct igt_process *prcs)
>  	prcs->comm = NULL;
>  	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
>  	if (prcs->stack) {
> +#if defined(HAVE_LIBPROC2_POST_4_0_5_API)
> +		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
> +		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
> +		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
> +		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
> +#else
>  		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
>  		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
>  		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
>  		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
> +#endif
>  	}
>  #endif
>  	return prcs->tid != 0;
> diff --git a/meson.build b/meson.build
> index 8b2a2a64a..f3e645c4d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -139,6 +139,9 @@ if libprocps.found()
>    config.set('HAVE_LIBPROCPS', 1)
>  elif libproc2.found()
>    config.set('HAVE_LIBPROC2', 1)
> +  if libproc2.version().version_compare('>= 4.0.5')
> +    config.set('HAVE_LIBPROC2_POST_4_0_5_API', 1)
> +  endif
>  else
>    error('Either libprocps or libproc2 is required')
>  endif
> -- 
> 2.47.1
> 
