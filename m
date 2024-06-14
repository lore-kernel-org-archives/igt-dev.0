Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC09C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 13:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D416510E04E;
	Fri, 14 Jun 2024 13:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEkau7+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7306C10E04E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718372246; x=1749908246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+b4MP2bff0Y1XI2z326TfwexAqYIDIqNsrts4yEMgt8=;
 b=LEkau7+anfK10WnoA8yNwPHnfHOjs+3/hOMwDSkgnH94CqdnaixOR0Nz
 5Qb3CXjew6yyDqT1QqRuJzRmlGGWuQ0lfVPevNx+iDLMn92lYpC5Ym+l3
 gF7YGA/VrYaQhayjlpsTD+hd7iADsRDHLBQhQAH5cLk4rwbsPzs0FXLSg
 xYtlODw7lVC10NnaquCv06EpbfADOiW39WC1I3k6KGHSFBf8WondJiYiM
 YyUzUV2LOnzll6KA/UFylXPvWhTyKG6J6imrtT9c8Drh0pedbvwHSQel8
 37DbF/lO+NncX1ojIKd2OrcajH6wqkIW2p0ud6sDVD+WgEOAHgWIU6csw g==;
X-CSE-ConnectionGUID: yUb+X6TkTSGc9DrOC/3K2w==
X-CSE-MsgGUID: cFS2f2SCQf+dTF+ljiswgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="37779302"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="37779302"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 06:37:26 -0700
X-CSE-ConnectionGUID: kC74s2yiT1ytLdJ26KKgXg==
X-CSE-MsgGUID: /tkexHemSpGmRatimTfDog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="40592004"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:37:25 -0700
Date: Fri, 14 Jun 2024 15:37:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>, vinay.belgaumkar@intel.com
Subject: Re: [PATCH i-g-t 2/2] "tests/intel/xe_gt_freq: Fix freq_low_max test
Message-ID: <20240614133722.6ok4fvliugt5pd3b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>, vinay.belgaumkar@intel.com
References: <20240614100712.38276-1-badal.nilawar@intel.com>
 <20240614100712.38276-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614100712.38276-3-badal.nilawar@intel.com>
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

Hi Badal,
On 2024-06-14 at 15:37:12 +0530, Badal Nilawar wrote:
> Intention of freq_low_max is to validate GuC PC flow when max freq set
> to less than min freq. Validating cur freq is enough as workloads are
> not being run.
> 
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Instead of revert and fixing revert, please send one patch
and add there which one did you fixed.

> ---
>  tests/intel/xe_gt_freq.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 24333612b..b3562181d 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -277,7 +277,6 @@ static void test_freq_low_max(int fd, int gt_id)
>  	rpe = get_freq(fd, gt_id, "rpe");
>  
>  	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
> -	igt_assert(get_freq(fd, gt_id, "act") == rpe);

Why ot writing comment here why "act" frequency is not checked?

Regards,
Kamil

>  }
>  
>  /**
> -- 
> 2.34.1
> 
