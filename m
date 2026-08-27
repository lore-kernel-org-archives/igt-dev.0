Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF34C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 14:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A956B10F0AA;
	Thu, 27 Aug 2026 14:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwhNfwuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD6B10F0A9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787841243; x=1819377243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IncK9eZAoI7twkpWGs1S9wtUnhQeL9h4e3jpPIZGWWc=;
 b=VwhNfwuBmjKY1nYp5B9H85ZqoCwl1uG/iU01Rqomzgrs5vW8muP6CJSt
 V4nbPZfNRp6CGq6hAlUnFFoKTuyKw3YeToyqFxkT34Y6UsFUdPJHJVofR
 5w9hvyaTDNds5tY4P7QJawC9vh4DApfqK52bEJ+A4ad/M0xXVB/P0MKZW
 kMB/Up/rc29lYecgYU1OiuRrveCLBMwcr4UazjcFJePd1jHnKK1I3Punf
 C8I85sFiUKwP31iStN6oZtW2v54WTMc2LFx4inGV5VCoVv6wf07+84xt8
 SSZB9wAAh3Q+z9dXrSnohTBNSLy15UcUIVfqHRY0va1d4Ig/zkgoGFULR A==;
X-CSE-ConnectionGUID: F2xgcTWHTsGkP1NKFfDrKA==
X-CSE-MsgGUID: aLfq7SU8R5S6ZXdQdCMItg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88360601"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88360601"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 07:34:02 -0700
X-CSE-ConnectionGUID: CtCNj6b8Q8CyIw/FiO5EXg==
X-CSE-MsgGUID: V9wi3Z8bTLOz6fpkkx5jNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="272127834"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:34:00 -0700
Date: Thu, 27 Aug 2026 16:33:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 dwarakanath.ramadeva@intel.com, nishit.sharma@intel.com,
 kamil.konieczny@intel.com, katarzyna.wroblewska@intel.com,
 sebastian.brzezinka@intel.com
Subject: Re: [PATCH] lib/igt_core: Avoid stale errno
Message-ID: <20260827143344.fr35uh6ff3lxqedy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, dwarakanath.ramadeva@intel.com,
 nishit.sharma@intel.com, kamil.konieczny@intel.com,
 katarzyna.wroblewska@intel.com, sebastian.brzezinka@intel.com
References: <20260827130002.374419-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827130002.374419-2-sk.anirban@intel.com>
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

Hi Sk,
On 2026-08-27 at 18:30:03 +0530, Sk Anirban wrote:
> Commit <e311ed2c7> ("lib/igt_core: do not reset errno in igt_gettime")
> removed an incidental errno reset that used to mask stale errno
> values at subtest entry. As a result, the errorno left by

s/errorno/errno/

> g_key_file_load_from_file() reaches future tests assertion failures
> and is printed as a bogus "Last errno" hint.
> 
> Fix the root cause by clearing errno.

imho this is not a root cause, any call to system can end in
setting errno, most common place is drm_open_driver(). I also
sumbmitted a change which tries to solve this but it was not
merged yet (myabe not a best solution).

Why not just setting errno = 0 at a test?

> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---

Please add here a link to case you would like to solve, and just
cite few lines from log which seems to you wrong.

>  lib/igt_rc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> index b7f1731fe..f00840915 100644
> --- a/lib/igt_rc.c
> +++ b/lib/igt_rc.c
> @@ -58,5 +58,7 @@ GKeyFile *igt_load_igtrc(void)
>  	if (!key_file_env && key_file_loc)
>  		free(key_file_loc);
>  
> +	errno = 0;

imho this is a wrong place, also not sure if these will help in
your case. More proper place would be at end of init sequence
in igt_core (at a caller to this function, not here).

Regards,
Kamil

> +
>  	return file;
>  }
> -- 
> 2.43.0
> 
