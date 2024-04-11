Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9D4CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C139410ECBF;
	Thu, 11 Apr 2024 12:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsK+EDqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A8910ECBF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712838329; x=1744374329;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=3ljzzJSlcFWkAD26eTxMXdBwGqJLZgSqHYakzXH5KOU=;
 b=bsK+EDqmfh9VmZOhUfe1Crq1Rh5zeXRmfU0/s0LW7qwJA8b/srUQBGcd
 aH/Dm85LUTHR2T8/ZFYRPVX0qTNK8fE4QAYpXMOBGs30t8UNzSN5xlO8A
 KOQKnwzhziFC7lgHA7cn40c9JFXT4nf83dVo8KH1+NkBZ8uilwIiHugjp
 si9RdxUqDkmch7WndaLUFs0wF63oIlBepn3d0yeINk0EWtPAyV/YYZZtI
 gu5twFYg3vE9GYtCGza025WvDvR220eDDVQAT86YEUQJTfSnZ39k254fR
 xWGTJzIYiJBlA2zCnClRwW02qDkuMMHsVDQfpjTJOdKE6sQY3Gtq42bBX Q==;
X-CSE-ConnectionGUID: TzZWfRPZQd6sH0wHI/BTlw==
X-CSE-MsgGUID: mk4FaYyQTWu3hMrm7/ODSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18846351"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18846351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:25:28 -0700
X-CSE-ConnectionGUID: +gSx+KNITge+fcKFyySJdQ==
X-CSE-MsgGUID: zNVXFQ3cRVeUE74DgfgPIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20847609"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:25:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/13] tools/intel_vbt_decode: Dump AIM offsets
In-Reply-To: <20240322204125.17212-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-6-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 15:25:24 +0300
Message-ID: <875xwo6q8b.fsf@intel.com>
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
> Dump the AIM offsets from the header. I don't think these should
> be actually in ant of modern VBT, but no harm in dumping them out
> anyway.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index ead3dd6450e9..9c0774248e56 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2734,6 +2734,8 @@ static void dump_headers(struct context *context)
>  	printf("\tVBT size:\t\t0x%04x (%u)\n", vbt->vbt_size, vbt->vbt_size);
>  	printf("\tVBT checksum:\t\t0x%02x\n", vbt->vbt_checksum);
>  	printf("\tBDB offset:\t\t0x%08x (%u)\n", vbt->bdb_offset, vbt->bdb_offs=
et);
> +	for (i =3D 0; i < ARRAY_SIZE(vbt->aim_offset); i++)
> +		printf("\tAIM #%d offset:\t\t0x%08x (%u)\n", i+1, vbt->aim_offset[i], =
vbt->aim_offset[i]);
>=20=20
>  	printf("\n");

--=20
Jani Nikula, Intel
