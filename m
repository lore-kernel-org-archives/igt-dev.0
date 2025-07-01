Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFC9C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 16:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE35C10E2CF;
	Tue,  1 Jul 2025 16:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WO00Ou/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455FD10E2CF
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751386428; x=1782922428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ql9YFKLwUW1m8954J+Lj2amGMgMdpfIo5vfZCFfrGfU=;
 b=WO00Ou/MPGM7MqB+Sx/8zWaPJnaylEkZkTzJzYZs58g3Wv+pVPrFppwa
 +Q0cwZNckAIMZPV6Yzw3zMMmNgyTZCZflmN2aAY2c0LSVnmR927oSUwpG
 j1LeY8wBt5901VNcPvf+sqJGYO6GY3erI5SahWKKyBtil0ONtyyK1xi5q
 zkDAWz4QMEaoYevxL6OPkuy5pIK6am05SURisk36Ck7CADzRPEDRoyMEn
 BXku9vc4OERX92bBj5ouOmS8vSnVKBNxhRB44+afLPrr45n4ip96t/WTa
 GSdJCSX1CMIyLiGZneqbQKeNNEI77FZ1o8F4/3H2QD06Pte99TQ+lQQq/ Q==;
X-CSE-ConnectionGUID: ssXTToS+QnqQIzOhxCEwqA==
X-CSE-MsgGUID: dxxswTbIRjiJdtFh0b7czQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="63908696"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="63908696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:13:47 -0700
X-CSE-ConnectionGUID: n9iVTbd6Qxq/8z2GoVm3Vg==
X-CSE-MsgGUID: qjvNP4yESBGiWa0vnaZBwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153898469"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:13:45 -0700
Date: Tue, 1 Jul 2025 18:13:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 4/9] msm/mapping: Handle BO names with spaces
Message-ID: <20250701161342.vy4t57rqx4k5u7e7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-5-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-5-robin.clark@oss.qualcomm.com>
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

Hi Rob,
On 2025-06-30 at 11:08:58 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>
> 
> Instead of trimming at the first space, scan from the end of the string
> until we reach the first non-space char.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index f536db82aba2..5afbcd081fc7 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -101,13 +101,14 @@ endswith(const char *str, const char *end)
>  
>  	/* Trim trailing whitespace: */
>  	if (p) {
> -		char *c = p;
> -		while (c) {
> +		char *c = p + strlen(p) - 1;

Add empty line here.

> +		while (c > p ) {

Remove space after 'p':

		while (c > p) {

Regards,
Kamil

>  			if (isspace(*c)) {
>  				*c = '\0';
> +			} else {
>  				break;
>  			}
> -			c++;
> +			c--;
>  		}
>  	}
>  
> -- 
> 2.50.0
> 
