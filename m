Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869B1CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FF410E244;
	Thu, 11 Apr 2024 13:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZT03ibKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125BB10EC4A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841016; x=1744377016;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=eceNHlh1xL2tc7V23m7V/cVDMc+W2ktEichXDrpg+OA=;
 b=ZT03ibKFpk3Rtv7HU8MM4fqolhS+8v0ahqTJVsGCRNcOHOi9MQ4oxPN4
 bH1Vym3fyBQ2bJ4tBLfMILnJIF3saD6crfphOIsgj7SKcXt/ZQ7uSrAhL
 1R5eeOcypArR3FH9bxNo2yGAezfxQTpHnxaQOOEWeWpEae8A75SDJ7LZ1
 IyWjAN0uTydZ8tNG6LrEwtfe0+zev/rqkHksOeVBe6tcBntvpgqOIsnYS
 o8AHkA443YXYRzkC5SJxVdETBWKmt+t8h0N3B7GHkJsTFGOWQMZL7Uu9Z
 t6SZFub8wOyxE2sNIjkCXvYM6fQiYH8A1LHP/VC6va+eZg1h7gGJR2ljW Q==;
X-CSE-ConnectionGUID: AbBdL6E+QUyGp1KBML8UXg==
X-CSE-MsgGUID: wHoey1m+TSW5tPcmTzTFkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8377607"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8377607"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:10:15 -0700
X-CSE-ConnectionGUID: TXbh+zSoQa6VArte5x2p1g==
X-CSE-MsgGUID: rwxTmSjJTlWemM2HYzk4uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21336739"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:10:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 12/13] tools/intel_vbt_decode: Decode all the
 driver feature bits
In-Reply-To: <20240322204125.17212-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-13-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 16:10:11 +0300
Message-ID: <87le5k59l8.fsf@intel.com>
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
> Add decoding for bunch of driver feature bits: Hpd wake, ADT, DFPS.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index aa15dbb5e3fd..f6549d6e0f76 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1574,8 +1574,14 @@ static void dump_driver_feature(struct context *co=
ntext,
>=20=20
>  	printf("\tPC Features field validity: %s\n",
>  	       YESNO(feature->pc_feature_valid));
> +	printf("\t\tHpd Wake: %s\n",
> +	       YESNO(feature->hpd_wake));
> +	printf("\t\tAssertive Display Technology (ADT): %s\n",
> +	       YESNO(feature->adt_enabled));
>  	printf("\tDynamic Media Refresh Rate Switching (DMRRS): %s\n",
>  	       YESNO(feature->dmrrs_enabled));
> +	printf("\tDynamic Frames Per Second (DFPS): %s\n",
> +	       YESNO(feature->dfps_enabled));
>  	printf("\tIntermediate Pixel Storage (IPS): %s\n",
>  	       YESNO(feature->ips_enabled));
>  	printf("\tPanel Self Refresh (PSR): %s\n",

--=20
Jani Nikula, Intel
