Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5BCCD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C108310E0A0;
	Wed, 20 May 2026 09:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfjwY11F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B22910EFDC
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779269978; x=1810805978;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HvcsKPiLrO+zttB6VFsH8ikDUPdSkjqHDj1+zzWPaYI=;
 b=BfjwY11F1bctHAsc+WyyXaSivoUUjg6cQbS4xasPpnbi1ohLSSTZI3JJ
 a/Y1KVxHngUhG0Hufh/QoFMg7twHEhpdKGN9H9H5Ag/R/nAzqCiupy/xE
 hz0uO6W5cfGot3VtwhmBTVyfVxijUF9/u1HOu87BHp+hRH7TG8g0H8gnJ
 AC29t4UrDsoFeQin6gBUHk5H4lDu9GIZVckvb6TPHiAGdZKpdW9DNbhf9
 /joBIHeG9X7+2QzEqQAxlblURlzhXaqHYs3D1ePqX+AzOLe9e4OA2ARQC
 6YqsK4CZwaexHSzbB+4UU0+kZCMzjwn9MjheI41KptSPHWthJdxtXDjjt A==;
X-CSE-ConnectionGUID: ZQJhbZY4SH6Sv197U6Pf5g==
X-CSE-MsgGUID: znNqMWBlQGq3i6dZ49nyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82741296"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="82741296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:39:37 -0700
X-CSE-ConnectionGUID: 2Sw6rBqtRmeOSnjYAl2Yog==
X-CSE-MsgGUID: 9qLmL/fORRiyTJUiMkL7UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="244103537"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:39:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v1 4/7] tools/vbt_decode: nuke get_device_id()
In-Reply-To: <20260507012821.527453-5-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260507012821.527453-1-michal.grzelak@intel.com>
 <20260507012821.527453-5-michal.grzelak@intel.com>
Date: Wed, 20 May 2026 12:39:32 +0300
Message-ID: <ebc334e4b8d670d9a3191ea321db05c9947135d7@intel.com>
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

On Thu, 07 May 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> VBT dump file does not contain device id. Stop calling the function and
> remove it.

Ah. I think I told you the VBT does not contain the device id. Which is
true, but there's more to the story.

On the older platforms the VBT was contained in the PCI ROM, and you'd
just ask for the whole PCI ROM dump. Which did contain the device id. So
the tool would scan that for both the PCI ID and the VBT.

With the VBT being moved to opregion, we introduced the i915_vbt debugfs
file which would abstract where the VBT originated, and only contain the
VBT.

The VBT does not contain the PCI ID, the VBIOS does, and the below works
if you pass the tool the entire VBIOS, which is very unlikely nowadays.

> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tools/intel_vbt_decode.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 6879bd7a7e..f7ba4bc3d5 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -3699,26 +3699,6 @@ static int get_sdvo_panel_type(struct context *con=
text)
>  	return panel_type;
>  }
>=20=20
> -static int
> -get_device_id(unsigned char *bios, int size)
> -{
> -    int device;
> -    int offset =3D (bios[0x19] << 8) + bios[0x18];
> -
> -    if (offset + 7 >=3D size)
> -	return -1;
> -
> -    if (bios[offset] !=3D 'P' ||
> -	bios[offset+1] !=3D 'C' ||
> -	bios[offset+2] !=3D 'I' ||
> -	bios[offset+3] !=3D 'R')
> -	return -1;

It's a problem however that this function returns -1 on errors and the
caller checks for 0, leading to -1 being used as the device id.

BR,
Jani.

> -
> -    device =3D (bios[offset+7] << 8) + bios[offset+6];
> -
> -    return device;
> -}
> -
>  struct dumper {
>  	uint8_t id;
>  	uint16_t min_bdb_version;
> @@ -4324,8 +4304,6 @@ int main(int argc, char **argv)
>  		if (devid_string)
>  			context.devid =3D strtoul(devid_string, NULL, 16);
>  	}
> -	if (!context.devid)
> -		context.devid =3D get_device_id(VBIOS, size);
>  	if (!context.devid)
>  		fprintf(stderr, "Warning: could not find PCI device ID!\n");

--=20
Jani Nikula, Intel
