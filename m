Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C86CD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 09:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E5510EDBA;
	Thu, 11 Jun 2026 09:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5Hyp3sk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CB810EDBA
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781171228; x=1812707228;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rPK+LE32xii/7bcQzTt5M+na0KLOfwIOZaTiJY8LQtQ=;
 b=T5Hyp3skgqoSAZmYHYzsM7cv1RAG3Lb9WxPslSLEnHXVT4Vs1npeY5C7
 xbxmM6/6ZfYeQXhamsFQMkQyBd1d8w9CfiiUn+73lf9njcAFhb/2E502D
 bAAYvNfIZKJMFWiI1452MLBsNPM1SzupIsuZtU9y1rR9VsExfX/vCLG3P
 Xkr8T+4PakLow1UYHgulZRjR3+55SIaqhs6ezdS50QhupJtdS4e6+gg5O
 Wi3HidoFZh1AS+nn+/AtxGnJVD68AILBk/LEr4zpIDgQZlQg0KLCgPJPU
 Fndi7jTps8zPWGKeWX5pUx+f8rmzvHjSap2zqBsjkUpaVGr9S/mAfYoTl A==;
X-CSE-ConnectionGUID: 2ob2UnxCScO7UeZG+tZlKg==
X-CSE-MsgGUID: WImn/lJITnKEnnnCmzruLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85609482"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85609482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:47:08 -0700
X-CSE-ConnectionGUID: sqqSfRz2SQWdC8GjWZCANw==
X-CSE-MsgGUID: LA2eJrPQTA+UhA77QbqdKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="246457214"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:47:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v2 3/8] tools/vbt_decode: return 0 from
 get_device_id()
In-Reply-To: <20260608124121.3131410-4-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
 <20260608124121.3131410-4-michal.grzelak@intel.com>
Date: Thu, 11 Jun 2026 12:47:03 +0300
Message-ID: <192121754ebb1046a28fcafa5875e906a26ec2d1@intel.com>
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

On Mon, 08 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> This function returns -1 on errors and the caller checks for 0. This
> leads to -1 being used as the device id. Return 0 instead of -1.
>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 5b7a6a49e9..6a9c1de7b3 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -3700,13 +3700,13 @@ get_device_id(unsigned char *bios, int size)
>      int offset =3D (bios[0x19] << 8) + bios[0x18];
>=20=20
>      if (offset + 7 >=3D size)
> -	return -1;
> +	return 0;
>=20=20
>      if (bios[offset] !=3D 'P' ||
>  	bios[offset+1] !=3D 'C' ||
>  	bios[offset+2] !=3D 'I' ||
>  	bios[offset+3] !=3D 'R')
> -	return -1;
> +	return 0;
>=20=20
>      device =3D (bios[offset+7] << 8) + bios[offset+6];

--=20
Jani Nikula, Intel
