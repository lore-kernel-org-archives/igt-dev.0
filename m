Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29883C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 13:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A443810E0C7;
	Wed, 14 Feb 2024 13:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5aFxipf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9388910E0C7
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707917261; x=1739453261;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m6zSMHHDKpcW5YGUICmXDy84/kaEB0tfSuFSv2c8WHA=;
 b=f5aFxipfCj0GFGyRweiUyFmLzxAHSX8ejOpQVvfcfaXE5WHtCdcbwBSi
 PZue6Vy61YePWE16DcnYWjiKnR906tgi+jwEE3Ut1s9lkdzIVb8ak4zPN
 dwWDbHjQUvwaEHZLazq736F3VMRg07COziqCj35ptWvug1DTDBvqO88vY
 uJhu1V6cweTHSsCvkPFJ1MxiCnzDBSyMas/vHf825ieyJ2McBtU7+g97l
 aVGpr2iioSfjidE6uLzrtCN4RJWCgOhcp0TWUdtxpUoUiEv1SY85Z0MU5
 FA4uupTV0E76l3o1j4mE7wghkl1tEY5qnpWnTa9a3bh3pCW6OFHi0dKgh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13349743"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="13349743"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3256975"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 05:27:38 -0800
Date: Wed, 14 Feb 2024 14:27:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 jeevan.b@intel.com, Samala@freedesktop.org
Subject: Re: [PATCH v2 1/1] tests/kms_plane: Restricting number of pixel
 formats for simulation
Message-ID: <20240214132735.5vslacwlxusf62ze@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Samala, Pranay" <pranay.samala@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 jeevan.b@intel.com, Samala@freedesktop.org
References: <20240214085328.2024-1-pranay.samala@intel.com>
 <20240214085328.2024-2-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240214085328.2024-2-pranay.samala@intel.com>
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

Hi Samala,,
On 2024-02-14 at 14:23:28 +0530, Samala, Pranay wrote:

one more thing, do not put non-existing e-mail in Cc, like:

	Samala@freedesktop.org

this is bouncing: user not exists.

Regards,
Kamil

> The pixel-format subtest runs on all pixel formats, reducing it to single
> format to reduce execution time on simulation.
> 
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Cc: B, Jeevan <jeevan.b@intel.com>
> 
> Signed-off-by: Samala, Pranay <pranay.samala@intel.com>
> ---
>  tests/kms_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 406aecc04..fbffc3cb0 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1081,6 +1081,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  		    f.modifier == ref.modifier)
>  			continue;
>  
> +		if (f.format != DRM_FORMAT_XRGB8888 && igt_run_in_simulation())
> +			continue;
> +
>  		/* test each format "class" only once in non-extended tests */
>  		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
>  			struct format_mod rf = {
> -- 
> 2.34.1
> 
