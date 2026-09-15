Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B659BC88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 08:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F236E10FB21;
	Tue, 15 Sep 2026 08:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfGBMUq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B1E10E5B5
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789462292; x=1820998292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VmftYi5rfmcJVkL1K5r1qH3lWYZhP15pvG32u46sShM=;
 b=bfGBMUq+Y0WSnJSQ1AZCZBzmX0cM59mMm7dPB1NM/YXj/JX1fM9a/385
 BN9ggLq/kmMqROzYuTCIYkaODTYbAkYzBfEph79Ku7jHmyYnklzjhBnKW
 liiy545L82fSStJqmOgADU0gTj1CSATqUa8zbfxY7RPYX9YqEAAFYhCTZ
 49/ciDUhEg2pM7psWDogWgTnN5+HQ5VARApeMeiTDcbxEQqV1kZioY24N
 f+AiHN/6RlZkcGgHK86GCKlzWq038PF004C5hMQYgcb7QhMEF/zzcOj3l
 3UNpRcAVetyxzG1myC4R2WzLx0HU1T94VGirbceYCfY/GuNY0+x+9dFap A==;
X-CSE-ConnectionGUID: cU2J7SRNQ9iqtCLVaEAJHw==
X-CSE-MsgGUID: twWSkg/9RZmNlGbAdhEHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101168171"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101168171"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:51:32 -0700
X-CSE-ConnectionGUID: Qs8njlD4Q8mrF6q5EiU1oA==
X-CSE-MsgGUID: zC8HpHRpQ4G5oCckqPN92A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1290376"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:51:32 -0700
Date: Tue, 15 Sep 2026 10:51:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected fault/CAT dmesg
 in wedged paths
Message-ID: <20260915085129.6hiyg3ceqfsa2wqq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260915050942.618218-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915050942.618218-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-09-15 at 05:09:42 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> The wedged test flow intentionally triggers hang/reset behavior that can
> emit a known multi-line fault dump and CAT error in dmesg during
> wedged-mode-toggle and related wedged scenarios. Updated existing
> test to extend ignore_wedged_in_dmesg with regex patterns that match:
> 1. Tile/GT fault header and fault detail lines (ASID, faulted address,
> fault type, access type, fault level, engine class/instance)
> 2. Fault response: Unsuccessful -EINVAL
> 3. Engine memory CAT error line
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_wedged.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index e1ac629ca..8c3c8bd36 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -30,12 +30,28 @@
>  
>  static void ignore_wedged_in_dmesg(void)
>  {
> -	/* this is needed for igt_runner so it will ignore it */
> +	/*
> +	 * The wedged flow intentionally triggers a recoverable GT fault/CAT dump
> +	 * while the reset attempt fails. Ignore the specific transient fault lines
> +	 * emitted by that path: the GT header, the per-fault details, and the
> +	 * corresponding CAT response.
> +	 */
>  	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
>  				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
>  				    "|GT[0-9A-Fa-f]*: Failed to submit"
>  				    "|Modules linked in:"
> -				    "|__pfx___drm_");
> +				    "|__pfx___drm_"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"
> +				    "|ASID: [0-9]+"
> +				    "|Faulted Address: 0x[0-9A-Fa-f]+"
> +				    "|FaultType: [0-9]+"
> +				    "|AccessType: [0-9]+"
> +				    "|FaultLevel: [0-9]+"
> +				    "|EngineClass: [0-9]+ [a-z]+"
> +				    "|EngineInstance: [0-9]+"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
> +				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
>  }
>  
>  static void force_wedged(int fd)
> -- 
> 2.43.0
> 
