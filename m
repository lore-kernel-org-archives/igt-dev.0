Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64071C021AB
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 13:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030CF10E164;
	Mon, 17 Feb 2025 13:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eO5f2VNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10210E164
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739800349; x=1771336349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LhnABSR+GPRL6Qx1G2hXLdMWJGg2rsuzahe+VA6dvOI=;
 b=eO5f2VNEKUCMWXvjkUegLpHTiQN42H6SoA9tvTvsuEnLE3s4ZkcBzEZ7
 ICbKEFAHdIFefnaASbntlRN/MmyZO9lDgYAI3tAJofDrEV7Pq7BCUVk9Y
 eU3k8gmmWtm0VO0GQ6B5JU2yacmf+Z783T438fM4W+RFNAMZq6L2SpgK9
 ob43MYf/iObWiZsCSLfuvBOoxhLrhBWY+MRSdYFQLCCH4/lDsNo34R9ny
 IkBdMhPTGRSkzQwB9LflCBk259wJDF/F/tfg9NDzBAKkMvzngxL9uZnAP
 Awbc3bqse9mz6um3prRnezw08Bno0D2k/ywpJETfD+AzIFpd8Mn9N7fnT A==;
X-CSE-ConnectionGUID: yBn0RcX7SmuPrcterZMv2Q==
X-CSE-MsgGUID: CE0g5GYkQaqlUohANsUdFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44409933"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="44409933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:52:28 -0800
X-CSE-ConnectionGUID: pHLeRugGSGqt6YJ67O0Dcg==
X-CSE-MsgGUID: z7iP6zNvRx6Kpchs5nkuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145041547"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:52:25 -0800
Date: Mon, 17 Feb 2025 14:52:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/kms_color: Disable CTM at the end of CTM
 tests
Message-ID: <20250217135212.os6p64dg4y6rn2kk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, igt-dev@lists.freedesktop.org
References: <20250214-disable-cwb-v2-1-d01f7a100748@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214-disable-cwb-v2-1-d01f7a100748@quicinc.com>
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

Hi Jessica,
On 2025-02-14 at 15:59:01 -0800, Jessica Zhang wrote:
> Currently, test_pipe_ctm() enables CTM on the primary pipe but doesn't
> disable CTM after it finishes running the tests.
> 
> This can cause resource-availability issues in drivers where CTM-related
> hardware resources are shared between pipes.
> 
> To avoid this, explicitly disable CTM on the primary pipe at the end of
> test_pipe_ctm()
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thx, applied.

Regards,
Kamil

> ---
> Changes in v2:
> - Add igt-dev to email list
> - Link to v1: https://lore.kernel.org/r/20250214-disable-cwb-v1-1-65ff578ef983@quicinc.com
> ---
>  tests/kms_color.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 4b71d3dd3..83e64229f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -599,6 +599,7 @@ static bool test_pipe_ctm(data_t *data,
>  	 */
>  	ret &= igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
>  
> +	disable_ctm(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit(&data->display);
> 
> ---
> base-commit: 7187a77fa2c4f1e0ea355cbc719dcd1f270148a8
> change-id: 20250214-disable-cwb-72da185ca3c6
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 
