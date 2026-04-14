Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79001ED7B8F
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C1310E325;
	Tue, 14 Apr 2026 09:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFchoh2F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8579F10E325
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776157870; x=1807693870;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jfNv0bhGsVidYssRvXOt1D7+pCHjRPEhTY6zpXGtMdg=;
 b=UFchoh2FhVW5D06RPMxgH/pKsByrIEM45eqqF7dMzDj0rIkaFRzE3nIJ
 er9b+UuuZqIXtDIX8CwaMubk2aiPEq9Mc1xjzMAP9uXBtH5xW17CbNa1J
 ysAX0MJoSGRMwCmOyZge0GY+aLboCZ7DBo7Puk3wiwZofyv2PWjZbme0B
 YW1WPEAMUvFUO7KvziUhoQKKfLT9+NbMPOLVQ0h+hTtxkrVUE9HqUoYyK
 vnp7PxUYds8e8igaKm795WpGoKrmegewi6q3AF/ZCpI5vZ9SFIt11hKS0
 jIQwp/wOwPDPD5JHtDICiAR/bBR40dJ29MiI2bL07sPGy97Lj7H+fEOhO Q==;
X-CSE-ConnectionGUID: ifm4F0SwRMaoqGv90HfI2A==
X-CSE-MsgGUID: 5GIIPYEkRSqE+g9pgdg7gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="99753205"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99753205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:11:10 -0700
X-CSE-ConnectionGUID: G17mmF8bTQGSBDrtsSF8Ww==
X-CSE-MsgGUID: nysAJqEQR4Gep7XId5uwdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229973912"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:11:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Arun R Murthy
 <arun.r.murthy@gmail.com>
Subject: Re: [PATCH i-g-t 1/6] lib/igt_edid: add EDID serial extraction helpers
In-Reply-To: <20260409043714.284108-2-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
 <20260409043714.284108-2-kunal1.joshi@intel.com>
Date: Tue, 14 Apr 2026 12:11:04 +0300
Message-ID: <57222f9789fda352ed26606c1f80e35fcdeb3d37@intel.com>
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

On Thu, 09 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Add helpers to extract serial identification from EDID data.
>
>  - edid_get_serial_string(): extract ASCII serial from descriptor 0xFF
>  - edid_get_serial_number(): extract 32-bit serial from EDID header
>  - edid_get_any_serial(): convenience helper that tries ASCII serial
>    first, then falls back to 32-bit header serial formatted as hex
>
> These are needed by the connector helper and USB4 switch test suite
> for EDID-based display verification after dock/undock events.

Time to consider using libdisplay-info [1] in IGT?


BR,
Jani.


[1] https://gitlab.freedesktop.org/emersion/libdisplay-info


>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@gmail.com>
> ---
>  lib/igt_edid.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_edid.h |  5 +++
>  2 files changed, 96 insertions(+)
>
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index c68ccf671..e7fcbf0b9 100644
> --- a/lib/igt_edid.c
> +++ b/lib/igt_edid.c
> @@ -249,6 +249,97 @@ void edid_get_monitor_name(const struct edid *edid, =
char *name, size_t name_size
>  	name[0] =3D '\0';
>  }
>=20=20
> +/**
> + * edid_get_serial_string:
> + * @edid: EDID structure
> + * @serial: buffer to write serial string
> + * @serial_size: size of serial buffer; must be > 1
> + *
> + * Extract the serial string from EDID descriptor block type 0xFF.
> + * The descriptor payload is a 13-byte fixed-width field; trailing
> + * whitespace is stripped and the result is NUL-terminated.
> + * @serial is left empty when no 0xFF descriptor is found.
> + */
> +void edid_get_serial_string(const struct edid *edid,
> +			    char *serial, size_t serial_size)
> +{
> +	size_t copy_len, i, n;
> +
> +	igt_assert(edid);
> +	igt_assert(serial);
> +	igt_assert(serial_size > 1);
> +	serial[0] =3D '\0';
> +
> +	for (i =3D 0; i < DETAILED_TIMINGS_LEN; i++) {
> +		const uint8_t *d =3D (const uint8_t *)&edid->detailed_timings[i];
> +
> +		if (d[0] !=3D 0x00 || d[1] !=3D 0x00 || d[2] !=3D 0x00)
> +			continue;
> +
> +		if (d[3] !=3D EDID_DETAIL_MONITOR_SERIAL || d[4] !=3D 0x00)
> +			continue;
> +
> +		/* Descriptor string payload is 13 bytes starting at d[5] */
> +		copy_len =3D serial_size - 1 < 13 ? serial_size - 1 : 13;
> +		memcpy(serial, &d[5], copy_len);
> +		serial[copy_len] =3D '\0';
> +
> +		for (n =3D strlen(serial);
> +		     n > 0 && isspace((unsigned char)serial[n - 1]); n--)
> +			serial[n - 1] =3D '\0';
> +
> +		return;
> +	}
> +}
> +
> +/**
> + * edid_get_serial_number:
> + * @edid: EDID structure
> + *
> + * Extract the 32-bit serial number from the EDID base block header
> + * (bytes 12=E2=80=9315, the manufacturer/product section).  This is dif=
ferent
> + * from the ASCII serial string in descriptor block 0xFF.
> + *
> + * Returns: 32-bit serial number (little-endian), 0 if absent.
> + */
> +uint32_t edid_get_serial_number(const struct edid *edid)
> +{
> +	return (uint32_t)edid->serial[0] |
> +	       ((uint32_t)edid->serial[1] << 8) |
> +	       ((uint32_t)edid->serial[2] << 16) |
> +	       ((uint32_t)edid->serial[3] << 24);
> +}
> +
> +/**
> + * edid_get_any_serial:
> + * @edid: EDID structure
> + * @serial: buffer to write serial string
> + * @serial_size: size of serial buffer; must be > 1
> + *
> + * Convenience helper that tries to extract a serial identifier from EDI=
D.
> + * First tries the ASCII serial string descriptor (0xFF). If that is emp=
ty,
> + * falls back to the 32-bit header serial number formatted as 8-char hex.
> + * If neither source provides a usable serial (no 0xFF descriptor and the
> + * header serial is 0), @serial is left empty.
> + */
> +void edid_get_any_serial(const struct edid *edid,
> +			 char *serial, size_t serial_size)
> +{
> +	uint32_t serial_num;
> +
> +	igt_assert(edid);
> +	igt_assert(serial);
> +	igt_assert(serial_size > 1);
> +
> +	edid_get_serial_string(edid, serial, serial_size);
> +	if (serial[0])
> +		return;
> +
> +	serial_num =3D edid_get_serial_number(edid);
> +	if (serial_num !=3D 0)
> +		snprintf(serial, serial_size, "%08X", serial_num);
> +}
> +
>  static void edid_set_mfg(struct edid *edid, const char mfg[static 3])
>  {
>  	edid->mfg_id[0] =3D (mfg[0] - '@') << 2 | (mfg[1] - '@') >> 3;
> diff --git a/lib/igt_edid.h b/lib/igt_edid.h
> index be0ccf529..d9e396065 100644
> --- a/lib/igt_edid.h
> +++ b/lib/igt_edid.h
> @@ -457,5 +457,10 @@ void *dispid_block_tiled(void *ptr,
>  			 int hsize, int vsize,
>  			 const char *topology_id);
>  void edid_get_monitor_name(const struct edid *edid, char *name, size_t n=
ame_size);
> +void edid_get_serial_string(const struct edid *edid,
> +			    char *serial, size_t serial_size);
> +uint32_t edid_get_serial_number(const struct edid *edid);
> +void edid_get_any_serial(const struct edid *edid,
> +			 char *serial, size_t serial_size);
>=20=20
>  #endif

--=20
Jani Nikula, Intel
