Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C13CD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B937810E125;
	Thu, 11 Apr 2024 13:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeuMZfGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B321610E125
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712840618; x=1744376618;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=MAKOIQhCJgW9ENBwtyrKJVtvC+3Uk+q5IptPj3nv8vE=;
 b=EeuMZfGBnFD7mF6lG0JsHPBvpO9MxeroBDVmy8YpkPqolQ4EWkEKKWIU
 QjW3PJ6VL5jRhp3gMbU7bmGcv+M2BdX2YzCCnAZBA7Shc60SUtOAKPKHQ
 BGBjVxrCnkhcvsHSc4PdQJdCVeLYqZuUiajxFTaucYSXlc1W8P4ci4+JT
 yc0+trrUPOzXedECRKizBl/mDW7+mnXynHZ22sSfIYg95pYdyfQTLKJ+J
 7BNI7ZBkAyeZgby6v+l03mAzdJT97EawahRdBe28EYedeJxxiTt0ENTzk
 didznR7i8fEb+W4YrX6gRAWQIIfMTreZB9KK8JZAtViF2iYLmDyH9j5b0 g==;
X-CSE-ConnectionGUID: 0DxjRwKrRpmSTx1a2D9shw==
X-CSE-MsgGUID: okIG/TAqQr2bnXl4Q+PFrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18849985"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18849985"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:03:38 -0700
X-CSE-ConnectionGUID: xrLK7AbNTryiMdZSZcrmvQ==
X-CSE-MsgGUID: rAhLjJuDSFyuuvgoj0IPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20965140"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:03:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/13] tools/intel_vbt_decode: Check version
 before decoding lace_aggressiveness_profile
In-Reply-To: <20240322204125.17212-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-9-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 16:03:33 +0300
Message-ID: <87wmp459wa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The LFP power lace_aggressiveness_profile was introduced in
> VBT verson 210. Check for that version before deocoding the
> information.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 7cfa357ac526..fa9c45920853 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1810,6 +1810,9 @@ static void dump_lfp_power(struct context *context,
>  		       lfp_block->als[i].lux);
>  	}
>=20=20
> +	if (context->bdb->version < 210)
> +		return;
> +
>  	printf("\tDisplay LACE aggressiveness profile: %d\n",
>  	       lfp_block->lace_aggressiveness_profile);

--=20
Jani Nikula, Intel
