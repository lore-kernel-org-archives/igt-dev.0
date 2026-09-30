Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED5FCA5FC4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 16:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC70A10E26B;
	Wed, 30 Sep 2026 16:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dk0Yim0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9129310E26B
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790786740; x=1822322740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7Kdref08+O74ZcgFldRN+aDr7s8KzF4JJHQtZrp2IRI=;
 b=Dk0Yim0sw9H34aBGloRM6BQMJKbRcB2X/X9NQA4svL/TvkYN3Zv8aulW
 cLkxgpZM1XXpKZXmYBScHm0Djcas0h0TKTark+3wTIs+BPMtCoApNa3BR
 7NihPQ+OGb6mjllFtqBh9XZpHMIG70qXsnypCW9QE53Nb7rDRgoTtD+JH
 BHdAJNVEoc4B6+Ch97zxXpYilUzhZDy8wCQFA3AJf69NdPwe1x7DfAYgN
 gzer+5x+CJnwfFHr6Y+WUWwU3wB8Eip3CegXIn7GpQO+/CwfwIEO2K1hU
 JcjCnOdL+2I0t+q4WGXRF0o+0Wk8W/gA9xpPmYqWK33GVsx1QSyMgncbw A==;
X-CSE-ConnectionGUID: QGV2dWSRRfKnlG0VcDPWDw==
X-CSE-MsgGUID: 8/7iHuYmSjSlEAQ0yfDoMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90662156"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90662156"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 09:45:39 -0700
X-CSE-ConnectionGUID: WR0N3tpOSK2SuIao5yQWsQ==
X-CSE-MsgGUID: +wV3vK2JQziFuG1q2NHBPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="272181972"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 09:45:38 -0700
Date: Wed, 30 Sep 2026 18:45:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/1] lib/intel_compute: Enable thread-group
 preemption on NVL-P
Message-ID: <entgd4h73kp2wtu64uccix6vltbvkb4psvjwptjkagcdzopj5w@mjakizsukrvo>
References: <20260930141309.228834-1-jan.maslak@intel.com>
 <20260930141309.228834-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930141309.228834-2-jan.maslak@intel.com>
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

On Wed, Sep 30, 2026 at 04:13:09PM +0200, Jan Maslak wrote:
> NVL-P (Xe3p_LPG, graphics IP 35.10) supports thread-group preemption.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 409799bc8a..02aa3cb425 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2842,7 +2842,7 @@ static const struct {
>  		.ip_ver = IP_VER(35, 10),
>  		.compute_exec = xe3p_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> -		.preempt_type = PREEMPT_WMTP,
> +		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,

Right, LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	},
>  	{
>  		.ip_ver = IP_VER(35, 11),
> -- 
> 2.43.0
> 
