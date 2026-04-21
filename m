Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4C4F8FA6A
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 12:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444810E897;
	Tue, 21 Apr 2026 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d20SG/Fw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B06710E897
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776775280; x=1808311280;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=33ZEB5qiETOwgM9i/VGRUFd5e0HLnCVYQdQ31qWHCYU=;
 b=d20SG/FwxEieJ++O9gjFftI1TrPg6wlKUMAPXNTxZ9PDtDrAmSEZ22T7
 SNXN8BK578TJcantp7pS3Fegulr0f8cC30KhcDnZbwtoLsPG3mKfPmEmp
 VyaTP4OTcTxSO8YGuic2oNCMDysDEGy5t7LscjCul7SF0W7cqyJ9MRRA3
 lCWGt4txNFyiccx6w4Rg+S+bVrg1EbSUTqBXi+bZT4EXIoqfIf4FdZGll
 b2YuX/G5z977H/0Rg8GK+LjEsTwQFLTl1NCFEapSG0/zv11CZ2+IkmGg+
 pZfhOCZUzqdlCo2sjMLdcRio/cIgve6xslEfrKHyluaTYIrdYi1DI5DUb Q==;
X-CSE-ConnectionGUID: W6lSH6HRRCKY/UjucRCUew==
X-CSE-MsgGUID: le2eZtgmS/ikxZPfj31K4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89086714"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="89086714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:41:19 -0700
X-CSE-ConnectionGUID: tl7PEzbiT06FvfLHnxePHQ==
X-CSE-MsgGUID: bwz+ExPBQF+jPd+tPdKLaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="255493222"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:41:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Swati Sharma
 <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t, v3 1/5] lib/igt_hdr: Move HDR helpers from
 kms_hdr into shared library
In-Reply-To: <20260420184633.sxlkomq6m4u2y65k@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417213818.2050571-1-swati2.sharma@intel.com>
 <20260417213818.2050571-2-swati2.sharma@intel.com>
 <20260420184633.sxlkomq6m4u2y65k@kamilkon-DESK.igk.intel.com>
Date: Tue, 21 Apr 2026 15:41:14 +0300
Message-ID: <033657672987bf60eab2d60756c105a8b8010f2c@intel.com>
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

On Mon, 20 Apr 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Swati,
> On 2026-04-18 at 03:08:14 +0530, Swati Sharma wrote:
>> Introduce lib/igt_hdr.{c,h} containing metadata fill helpers, EOTF enums,
>> ST2084 construction, and blob programming utilities. This allows
>> kms_hdr and upcoming tests (e.g., HDR support in kms_frontbuffer_trackin=
g)
>> to share common HDR code.
>>=20
>> v2: -place igt headers in alphabetical order (Kamil)
>>=20
>> Co-developed-by: Claude Opus 4.6
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>  lib/igt_hdr.c   | 217 +++++++++++++++++++++++++++++++++++
>>  lib/igt_hdr.h   |  33 ++++++
>>  lib/meson.build |   1 +
>>  tests/kms_hdr.c | 297 ++++++++----------------------------------------
>>  4 files changed, 300 insertions(+), 248 deletions(-)
>>  create mode 100644 lib/igt_hdr.c
>>  create mode 100644 lib/igt_hdr.h
>>=20
>> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
>> new file mode 100644
>> index 000000000..5feb1d917
>> --- /dev/null
>> +++ b/lib/igt_hdr.c
>> @@ -0,0 +1,217 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright =C2=A9 2025 Intel Corporation
>
> Year 2026.
>
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_edid.h"
>> +#include "igt_hdr.h"
>> +
>> +#include <fcntl.h>
>> +#include <termios.h>
>> +#include <unistd.h>
>> +
>> +/* HDR EDID parsing. */
>
> Should this be in lib/igt_edid.c?

Well, should this just use libdislay-info, like I suggested in another
series adding more ad hoc EDID parsing [1].

There is no point in reimplementing full blown EDID parsing in IGT. It's
more than likely to be wrong. Like, just at a glance, the current HDR
parsing doesn't look at CTA data blocks inside DisplayID extensions. It
doesn't understand HF-EEODB. Etc. Arguably it's more work to fix it than
to switch to libdislay-info.

BR,
Jani.


[1] https://lore.kernel.org/r/57222f9789fda352ed26606c1f80e35fcdeb3d37@inte=
l.com

>> +#define CTA_EXTENSION_VERSION		0x03
>> +#define HDR_STATIC_METADATA_BLOCK       0x06
>> +#define USE_EXTENDED_TAG		0x07
>> +
>> +static bool cta_block(const char *edid_ext)
>> +{
>> +	/*
>> +	 * Byte 1: 0x07 indicates Extended Tag
>> +	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
>> +	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
>> +	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
>> +	 *	             ET_1: Traditional Gamma - HDR Luminance Range
>> +	 *	             ET_2: SMPTE ST 2084
>> +	 *	             ET_3: Hybrid Log-Gamma (HLG)
>> +	 *	             ET_4 to ET_5: Reserved for future use
>> +	 */
>> +
>> +	if ((((edid_ext[0] & 0xe0) >> 5 =3D=3D USE_EXTENDED_TAG) &&
>> +	      (edid_ext[1] =3D=3D HDR_STATIC_METADATA_BLOCK)) &&
>> +	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
>> +	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +/* Returns true if panel supports HDR. */
>
> All public lib functions, this one and following ones, needs
> a description, see for example lib/igt_configfs.c
>
>> +bool igt_is_panel_hdr(int fd, igt_output_t *output)
>
> Or maybe it should be in lib/igt_hdr_panel.h|c?
>
> +cc Karthik and J-P
>
>> +{
>> +	bool ok;
>> +	int i, j, offset;
>> +	uint64_t edid_blob_id;
>> +	drmModePropertyBlobRes *edid_blob;
>> +	const struct edid_ext *edid_ext;
>> +	const struct edid *edid;
>> +	const struct edid_cea *edid_cea;
>> +	const char *cea_data;
>> +	bool ret =3D false;
>> +
>> +	ok =3D kmstest_get_property(fd, output->id,
>> +			DRM_MODE_OBJECT_CONNECTOR, "EDID",
>> +			NULL, &edid_blob_id, NULL);
>> +
>> +	if (!ok || !edid_blob_id)
>> +		return ret;
>> +
>> +	edid_blob =3D drmModeGetPropertyBlob(fd, edid_blob_id);
>> +	igt_assert(edid_blob);
>> +
>> +	edid =3D (const struct edid *) edid_blob->data;
>> +	igt_assert(edid);
>> +
>> +	for (i =3D 0; i < edid->extensions_len; i++) {
>> +		edid_ext =3D &edid->extensions[i];
>> +		edid_cea =3D &edid_ext->data.cea;
>> +
>> +		/* HDR not defined in CTA Extension Version < 3. */
>> +		if ((edid_ext->tag !=3D EDID_EXT_CEA) ||
>> +		    (edid_cea->revision !=3D CTA_EXTENSION_VERSION))
>> +				continue;
>> +		else {
>> +			offset =3D edid_cea->dtd_start;
>> +			cea_data =3D edid_cea->data;
>> +
>> +			for (j =3D 0; j < offset; j +=3D (cea_data[j] & 0x1f) + 1) {
>> +				ret =3D cta_block(cea_data + j);
>> +
>> +				if (ret)
>> +					break;
>> +			}
>> +		}
>> +	}
>> +
>> +	drmModeFreePropertyBlob(edid_blob);
>> +
>> +	return ret;
>> +}
>> +
>> +/* Converts a double to 861-G spec FP format. */
>> +uint16_t igt_hdr_calc_float(double val)
>> +{
>> +	return (uint16_t)(val * 50000.0);
>> +}
>> +
>> +/* Fills some test values for ST2084 HDR output metadata.
>> + *
>> + * Note: there isn't really a standard for what the metadata is supposed
>> + * to do on the display side of things. The display is free to ignore it
>> + * and clip the output, use it to help tonemap to the content range,
>> + * or do anything they want, really.
>> + */
>> +void igt_hdr_fill_st2084(struct hdr_output_metadata *meta)
>> +{
>> +	memset(meta, 0, sizeof(*meta));
>> +
>> +	meta->metadata_type =3D HDMI_STATIC_METADATA_TYPE1;
>> +	meta->hdmi_metadata_type1.eotf =3D HDMI_EOTF_SMPTE_ST2084;
>> +
>> +	/* Rec. 2020 */
>> +	meta->hdmi_metadata_type1.display_primaries[0].x =3D
>> +		igt_hdr_calc_float(0.708); /* Red */
>> +	meta->hdmi_metadata_type1.display_primaries[0].y =3D
>> +		igt_hdr_calc_float(0.292);
>> +	meta->hdmi_metadata_type1.display_primaries[1].x =3D
>> +		igt_hdr_calc_float(0.170); /* Green */
>> +	meta->hdmi_metadata_type1.display_primaries[1].y =3D
>> +		igt_hdr_calc_float(0.797);
>> +	meta->hdmi_metadata_type1.display_primaries[2].x =3D
>> +		igt_hdr_calc_float(0.131); /* Blue */
>> +	meta->hdmi_metadata_type1.display_primaries[2].y =3D
>> +		igt_hdr_calc_float(0.046);
>> +	meta->hdmi_metadata_type1.white_point.x =3D igt_hdr_calc_float(0.3127);
>> +	meta->hdmi_metadata_type1.white_point.y =3D igt_hdr_calc_float(0.3290);
>> +
>> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =3D
>> +		1000; /* 1000 nits */
>> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =3D
>> +		500;				   /* 0.05 nits */
>> +	meta->hdmi_metadata_type1.max_fall =3D 1000; /* 1000 nits */
>> +	meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
>> +}
>> +
>> +/* Fills some test values for HDR metadata targeting SDR. */
>> +void igt_hdr_fill_sdr(struct hdr_output_metadata *meta)
>> +{
>> +	memset(meta, 0, sizeof(*meta));
>> +
>> +	meta->metadata_type =3D HDMI_STATIC_METADATA_TYPE1;
>> +	meta->hdmi_metadata_type1.eotf =3D HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
>> +
>> +	/* Rec. 709 */
>> +	meta->hdmi_metadata_type1.display_primaries[0].x =3D
>> +		igt_hdr_calc_float(0.640); /* Red */
>> +	meta->hdmi_metadata_type1.display_primaries[0].y =3D
>> +		igt_hdr_calc_float(0.330);
>> +	meta->hdmi_metadata_type1.display_primaries[1].x =3D
>> +		igt_hdr_calc_float(0.300); /* Green */
>> +	meta->hdmi_metadata_type1.display_primaries[1].y =3D
>> +		igt_hdr_calc_float(0.600);
>> +	meta->hdmi_metadata_type1.display_primaries[2].x =3D
>> +		igt_hdr_calc_float(0.150); /* Blue */
>> +	meta->hdmi_metadata_type1.display_primaries[2].y =3D
>> +		igt_hdr_calc_float(0.006);
>> +	meta->hdmi_metadata_type1.white_point.x =3D igt_hdr_calc_float(0.3127);
>> +	meta->hdmi_metadata_type1.white_point.y =3D igt_hdr_calc_float(0.3290);
>> +
>> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =3D 0;
>> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =3D 0;
>> +	meta->hdmi_metadata_type1.max_fall =3D 0;
>> +	meta->hdmi_metadata_type1.max_cll =3D 0;
>> +}
>> +
>> +/* Sets the HDR output metadata prop. */
>> +void igt_hdr_set_metadata(igt_output_t *output,
>> +                          const struct hdr_output_metadata *meta)
>> +{
>> +	igt_output_replace_prop_blob(output,
>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> +				     meta ? sizeof(*meta) : 0);
>> +}
>> +
>> +/* Sets the HDR output metadata prop with invalid size. */
>> +int igt_hdr_set_invalid_metadata(igt_output_t *output,
>
> Do we need this function in lib?
>
>> +                                 const struct hdr_output_metadata *meta,
>> +				 size_t len)
>> +{
>> +	igt_output_replace_prop_blob(output,
>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> +				     meta ? len : 0);
>> +
>> +	return igt_display_try_commit_atomic(output->display,
>> +	                                     DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +					     NULL);
>> +}
>> +
>> +/* Returns true if an output supports max bpc property. */
>> +bool igt_output_supports_max_bpc(igt_output_t *output)
>> +{
>> +	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>> +	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>> +}
>> +
>> +/* Returns true if an output supports HDR metadata property. */
>> +bool igt_output_supports_hdr(igt_output_t *output)
>> +{
>> +	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>> +}
>> +
>> +void igt_hdr_disable(igt_output_t *output)
>> +{
>> +	igt_hdr_set_metadata(output, NULL);
>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
>> +}
>> +
>> +void igt_hdr_enable(igt_output_t *output)
>> +{
>> +	struct hdr_output_metadata meta;
>> +
>> +	/* Fill HDR metadata and enable it on the output */
>> +	igt_hdr_fill_st2084(&meta);
>> +	igt_hdr_set_metadata(output, &meta);
>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>> +}
>> diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
>> new file mode 100644
>> index 000000000..0df1ac5ed
>> --- /dev/null
>> +++ b/lib/igt_hdr.h
>> @@ -0,0 +1,33 @@
>> +#ifndef IGT_HDR_H
>> +#define IGT_HDR_H
>> +
>> +#include "igt_edid.h"
>> +#include "igt_kms.h"
>> +
>> +enum hdmi_eotf {
>> +	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
>> +	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
>> +	HDMI_EOTF_SMPTE_ST2084,
>> +};
>> +
>> +/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>> +enum hdmi_metadata_type {
>> +	HDMI_STATIC_METADATA_TYPE1 =3D 0,
>> +};
>> +
>> +bool igt_is_panel_hdr(int fd, igt_output_t *output);
>> +
>> +uint16_t igt_hdr_calc_float(double val);
>> +void igt_hdr_fill_st2084(struct hdr_output_metadata *meta);
>> +void igt_hdr_fill_sdr(struct hdr_output_metadata *meta);
>> +
>> +void igt_hdr_set_metadata(igt_output_t *output,
>> +                          const struct hdr_output_metadata *meta);
>> +int igt_hdr_set_invalid_metadata(igt_output_t *output,
>> +                                 const struct hdr_output_metadata *meta,
>> +				 size_t len);
>> +
>> +bool igt_output_supports_max_bpc(igt_output_t *output);
>> +bool igt_output_supports_hdr(igt_output_t *output);
>> +
>> +#endif /* IGT_HDR_H */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 0e7efadf3..d76a0d332 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -111,6 +111,7 @@ lib_sources =3D [
>>  	'igt_vc4.c',
>>  	'igt_vmwgfx.c',
>>  	'igt_psr.c',
>> +	'igt_hdr.c',
>
> Can you move it down to more proper place along with igt_psr.c?
>
> Regards,
> Kamil
>
>>  	'igt_amd.c',
>>  	'igt_edid.c',
>>  	'igt_eld.c',
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index b215b0e6c..eb336f14d 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -33,6 +33,7 @@
>>  #include <termios.h>
>>  #include <unistd.h>
>>  #include "igt_edid.h"
>> +#include "igt_hdr.h"
>>=20=20
>>  /**
>>   * SUBTEST: bpc-switch
>> @@ -70,24 +71,8 @@
>>=20=20
>>  IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>>=20=20
>> -/* HDR EDID parsing. */
>> -#define CTA_EXTENSION_VERSION		0x03
>> -#define HDR_STATIC_METADATA_BLOCK       0x06
>> -#define USE_EXTENDED_TAG		0x07
>> -
>>  #define BACKLIGHT_PATH "/sys/class/backlight"
>>=20=20
>> -/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>> -enum hdmi_metadata_type {
>> -	HDMI_STATIC_METADATA_TYPE1 =3D 0,
>> -};
>> -
>> -enum hdmi_eotf {
>> -	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
>> -	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
>> -	HDMI_EOTF_SMPTE_ST2084,
>> -};
>> -
>>  /* HDR test formats: 10bpc + FP16 */
>>  static const uint32_t hdr_test_formats[] =3D {
>>  	DRM_FORMAT_XRGB2101010,
>> @@ -154,59 +139,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>>  	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
>>  }
>>=20=20
>> -/* Converts a double to 861-G spec FP format. */
>> -static uint16_t calc_hdr_float(double val)
>> -{
>> -	return (uint16_t)(val * 50000.0);
>> -}
>> -
>> -/* Fills some test values for ST2084 HDR output metadata.
>> - *
>> - * Note: there isn't really a standard for what the metadata is supposed
>> - * to do on the display side of things. The display is free to ignore it
>> - * and clip the output, use it to help tonemap to the content range,
>> - * or do anything they want, really.
>> - */
>> -static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata =
*meta)
>> -{
>> -	memset(meta, 0, sizeof(*meta));
>> -
>> -	meta->metadata_type =3D HDMI_STATIC_METADATA_TYPE1;
>> -	meta->hdmi_metadata_type1.eotf =3D HDMI_EOTF_SMPTE_ST2084;
>> -
>> -	/* Rec. 2020 */
>> -	meta->hdmi_metadata_type1.display_primaries[0].x =3D
>> -		calc_hdr_float(0.708); /* Red */
>> -	meta->hdmi_metadata_type1.display_primaries[0].y =3D
>> -		calc_hdr_float(0.292);
>> -	meta->hdmi_metadata_type1.display_primaries[1].x =3D
>> -		calc_hdr_float(0.170); /* Green */
>> -	meta->hdmi_metadata_type1.display_primaries[1].y =3D
>> -		calc_hdr_float(0.797);
>> -	meta->hdmi_metadata_type1.display_primaries[2].x =3D
>> -		calc_hdr_float(0.131); /* Blue */
>> -	meta->hdmi_metadata_type1.display_primaries[2].y =3D
>> -		calc_hdr_float(0.046);
>> -	meta->hdmi_metadata_type1.white_point.x =3D calc_hdr_float(0.3127);
>> -	meta->hdmi_metadata_type1.white_point.y =3D calc_hdr_float(0.3290);
>> -
>> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =3D
>> -		1000; /* 1000 nits */
>> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =3D
>> -		500;				   /* 0.05 nits */
>> -	meta->hdmi_metadata_type1.max_fall =3D 1000; /* 1000 nits */
>> -	meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
>> -}
>> -
>> -/* Sets the HDR output metadata prop. */
>> -static void set_hdr_output_metadata(data_t *data,
>> -				    struct hdr_output_metadata const *meta)
>> -{
>> -	igt_output_replace_prop_blob(data->output,
>> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> -				     meta ? sizeof(*meta) : 0);
>> -}
>> -
>>  /* Prepare test data. */
>>  static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t=
 *crtc)
>>  {
>> @@ -308,13 +240,6 @@ static void test_bpc_switch_on_output(data_t *data,=
 igt_crtc_t *crtc,
>>  	igt_remove_fb(data->fd, &afb);
>>  }
>>=20=20
>> -/* Returns true if an output supports max bpc property. */
>> -static bool has_max_bpc(igt_output_t *output)
>> -{
>> -	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>> -	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>> -}
>> -
>>  static void test_bpc_switch(data_t *data, uint32_t flags)
>>  {
>>  	igt_display_t *display =3D &data->display;
>> @@ -325,7 +250,7 @@ static void test_bpc_switch(data_t *data, uint32_t f=
lags)
>>  	for_each_connected_output(display, output) {
>>  		igt_crtc_t *crtc;
>>=20=20
>> -		if (!has_max_bpc(output)) {
>> +		if (!igt_output_supports_max_bpc(output)) {
>>  			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
>>  				 igt_output_name(output));
>>  			continue;
>> @@ -375,92 +300,6 @@ static void test_bpc_switch(data_t *data, uint32_t =
flags)
>>  	}
>>  }
>>=20=20
>> -static bool cta_block(const char *edid_ext)
>> -{
>> -	/*
>> -	 * Byte 1: 0x07 indicates Extended Tag
>> -	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
>> -	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
>> -	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
>> -	 *	             ET_1: Traditional Gamma - HDR Luminance Range
>> -	 *	             ET_2: SMPTE ST 2084
>> -	 *	             ET_3: Hybrid Log-Gamma (HLG)
>> -	 *	             ET_4 to ET_5: Reserved for future use
>> -	 */
>> -
>> -	if ((((edid_ext[0] & 0xe0) >> 5 =3D=3D USE_EXTENDED_TAG) &&
>> -	      (edid_ext[1] =3D=3D HDR_STATIC_METADATA_BLOCK)) &&
>> -	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
>> -	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
>> -			return true;
>> -
>> -	return false;
>> -}
>> -
>> -/* Returns true if panel supports HDR. */
>> -static bool is_panel_hdr(data_t *data, igt_output_t *output)
>> -{
>> -	bool ok;
>> -	int i, j, offset;
>> -	uint64_t edid_blob_id;
>> -	drmModePropertyBlobRes *edid_blob;
>> -	const struct edid_ext *edid_ext;
>> -	const struct edid *edid;
>> -	const struct edid_cea *edid_cea;
>> -	const char *cea_data;
>> -	bool ret =3D false;
>> -
>> -	ok =3D kmstest_get_property(data->fd, output->id,
>> -			DRM_MODE_OBJECT_CONNECTOR, "EDID",
>> -			NULL, &edid_blob_id, NULL);
>> -
>> -	if (!ok || !edid_blob_id)
>> -		return ret;
>> -
>> -	edid_blob =3D drmModeGetPropertyBlob(data->fd, edid_blob_id);
>> -	igt_assert(edid_blob);
>> -
>> -	edid =3D (const struct edid *) edid_blob->data;
>> -	igt_assert(edid);
>> -
>> -	drmModeFreePropertyBlob(edid_blob);
>> -
>> -	for (i =3D 0; i < edid->extensions_len; i++) {
>> -		edid_ext =3D &edid->extensions[i];
>> -		edid_cea =3D &edid_ext->data.cea;
>> -
>> -		/* HDR not defined in CTA Extension Version < 3. */
>> -		if ((edid_ext->tag !=3D EDID_EXT_CEA) ||
>> -		    (edid_cea->revision !=3D CTA_EXTENSION_VERSION))
>> -				continue;
>> -		else {
>> -			offset =3D edid_cea->dtd_start;
>> -			cea_data =3D edid_cea->data;
>> -
>> -			for (j =3D 0; j < offset; j +=3D (cea_data[j] & 0x1f) + 1) {
>> -				ret =3D cta_block(cea_data + j);
>> -
>> -				if (ret)
>> -					break;
>> -			}
>> -		}
>> -	}
>> -
>> -	return ret;
>> -}
>> -
>> -/* Sets the HDR output metadata prop with invalid size. */
>> -static int set_invalid_hdr_output_metadata(data_t *data,
>> -					   struct hdr_output_metadata const *meta,
>> -					   size_t length)
>> -{
>> -	igt_output_replace_prop_blob(data->output,
>> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> -				     meta ? length : 0);
>> -
>> -	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_A=
LLOW_MODESET, NULL);
>> -}
>> -
>>  static void adjust_brightness(data_t *data, uint32_t flags)
>>  {
>>  	igt_backlight_context_t context;
>> @@ -484,7 +323,6 @@ static void adjust_brightness(data_t *data, uint32_t=
 flags)
>>  }
>>=20=20
>>  static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>> -			       igt_output_t *output,
>>  			       uint32_t format, uint32_t flags)
>>  {
>>  	igt_display_t *display =3D &data->display;
>> @@ -500,30 +338,30 @@ static void test_static_toggle(data_t *data, igt_c=
rtc_t *crtc,
>>=20=20
>>  	draw_hdr_pattern(&afb);
>>=20=20
>> -	fill_hdr_output_metadata_st2084(&hdr);
>> +	igt_hdr_fill_st2084(&hdr);
>>=20=20
>>  	/* Start with no metadata. */
>>  	igt_plane_set_fb(data->primary, &afb);
>>  	igt_plane_set_size(data->primary, data->w, data->h);
>> -	set_hdr_output_metadata(data, NULL);
>> +	igt_hdr_set_metadata(data->output, NULL);
>>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>  	}
>>=20=20
>>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL=
);
>>  	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>  	}
>>=20=20
>>  	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL=
);
>>  	if (flags & TEST_INVALID_HDR) {
>> @@ -537,7 +375,7 @@ static void test_static_toggle(data_t *data, igt_crt=
c_t *crtc,
>>  	}
>>=20=20
>>  	igt_assert_output_bpc_equal(crtc,
>> -				    output, 10);
>> +				    data->output, 10);
>>=20=20
>>  	/* Verify that the CRC are equal after DPMS or suspend. */
>>  	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>> @@ -545,23 +383,23 @@ static void test_static_toggle(data_t *data, igt_c=
rtc_t *crtc,
>>  	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>>=20=20
>>  	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for=
 exiting. */
>> -	set_hdr_output_metadata(data, NULL);
>> +	igt_hdr_set_metadata(data->output, NULL);
>>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>  	}
>>=20=20
>>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL=
);
>>  	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>=20=20
>>  	igt_assert_crc_equal(&ref_crc, &new_crc);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>  	}
>>=20=20
>>  cleanup:
>> @@ -569,38 +407,7 @@ cleanup:
>>  	igt_remove_fb(data->fd, &afb);
>>  }
>>=20=20
>> -/* Fills some test values for HDR metadata targeting SDR. */
>> -static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *me=
ta)
>> -{
>> -	memset(meta, 0, sizeof(*meta));
>> -
>> -	meta->metadata_type =3D HDMI_STATIC_METADATA_TYPE1;
>> -	meta->hdmi_metadata_type1.eotf =3D HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
>> -
>> -	/* Rec. 709 */
>> -	meta->hdmi_metadata_type1.display_primaries[0].x =3D
>> -		calc_hdr_float(0.640); /* Red */
>> -	meta->hdmi_metadata_type1.display_primaries[0].y =3D
>> -		calc_hdr_float(0.330);
>> -	meta->hdmi_metadata_type1.display_primaries[1].x =3D
>> -		calc_hdr_float(0.300); /* Green */
>> -	meta->hdmi_metadata_type1.display_primaries[1].y =3D
>> -		calc_hdr_float(0.600);
>> -	meta->hdmi_metadata_type1.display_primaries[2].x =3D
>> -		calc_hdr_float(0.150); /* Blue */
>> -	meta->hdmi_metadata_type1.display_primaries[2].y =3D
>> -		calc_hdr_float(0.006);
>> -	meta->hdmi_metadata_type1.white_point.x =3D calc_hdr_float(0.3127);
>> -	meta->hdmi_metadata_type1.white_point.y =3D calc_hdr_float(0.3290);
>> -
>> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =3D 0;
>> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =3D 0;
>> -	meta->hdmi_metadata_type1.max_fall =3D 0;
>> -	meta->hdmi_metadata_type1.max_cll =3D 0;
>> -}
>> -
>>  static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>> -			     igt_output_t *output,
>>  			     uint32_t format, uint32_t flags)
>>  {
>>  	igt_display_t *display =3D &data->display;
>> @@ -622,26 +429,26 @@ static void test_static_swap(data_t *data, igt_crt=
c_t *crtc,
>>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>  	}
>>=20=20
>>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL=
);
>>  	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>  	}
>>=20=20
>>  	/* Enter HDR, a modeset is allowed here. */
>> -	fill_hdr_output_metadata_st2084(&hdr);
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_fill_st2084(&hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL=
);
>>  	igt_assert_output_bpc_equal(crtc,
>> -				    output, 10);
>> +				    data->output, 10);
>>=20=20
>>  	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>>=20=20
>> @@ -652,21 +459,21 @@ static void test_static_swap(data_t *data, igt_crt=
c_t *crtc,
>>  	hdr.hdmi_metadata_type1.max_fall =3D 200;
>>  	hdr.hdmi_metadata_type1.max_cll =3D 100;
>>=20=20
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>  	if (is_amdgpu_device(data->fd))
>>  		igt_display_commit_atomic(display, 0, NULL);
>>  	else
>>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NUL=
L);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>  	}
>>  	/* Enter SDR via metadata, no modeset allowed for
>>  	 * amd driver, whereas a modeset is required for
>>  	 * intel driver. */
>> -	fill_hdr_output_metadata_sdr(&hdr);
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_fill_sdr(&hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>  	if (is_amdgpu_device(data->fd))
>>  		igt_display_commit_atomic(display, 0, NULL);
>>  	else
>> @@ -675,45 +482,39 @@ static void test_static_swap(data_t *data, igt_crt=
c_t *crtc,
>>  	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>>=20=20
>>  	/* Exit SDR and enter 8bpc, cleanup. */
>> -	set_hdr_output_metadata(data, NULL);
>> +	igt_hdr_set_metadata(data->output, NULL);
>>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL=
);
>>  	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>=20=20
>>  	/* Verify that the CRC didn't change while cycling metadata. */
>>  	igt_assert_crc_equal(&ref_crc, &new_crc);
>>=20=20
>>  	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>  	}
>>=20=20
>>  	test_fini(data);
>>  	igt_remove_fb(data->fd, &afb);
>>  }
>>=20=20
>> -static void test_invalid_metadata_sizes(data_t *data, igt_output_t *out=
put)
>> +static void test_invalid_metadata_sizes(data_t *data)
>>  {
>>  	struct hdr_output_metadata hdr;
>>  	size_t metadata_size =3D sizeof(hdr);
>>=20=20
>> -	fill_hdr_output_metadata_st2084(&hdr);
>> +	igt_hdr_fill_st2084(&hdr);
>>=20=20
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_siz=
e + 1), -EINVAL);
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_siz=
e - 1), -EINVAL);
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_siz=
e * 2), -EINVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, 1), -EI=
NVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadat=
a_size + 1), -EINVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadat=
a_size - 1), -EINVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadat=
a_size * 2), -EINVAL);
>>=20=20
>>  	test_fini(data);
>>  }
>>=20=20
>> -/* Returns true if an output supports HDR metadata property. */
>> -static bool has_hdr(igt_output_t *output)
>> -{
>> -	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>> -}
>> -
>>  static void test_hdr(data_t *data, uint32_t flags)
>>  {
>>  	igt_display_t *display =3D &data->display;
>> @@ -729,20 +530,20 @@ static void test_hdr(data_t *data, uint32_t flags)
>>  		 * set MAX_BPC property to 10bpc prior to setting
>>  		 * HDR metadata property. Therefore, checking.
>>  		 */
>> -		if (!has_max_bpc(output) || !has_hdr(output)) {
>> +		if (!igt_output_supports_max_bpc(output) || !igt_output_supports_hdr(=
output)) {
>>  			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR=
_HDR_OUTPUT_METADATA.\n",
>>  				 igt_output_name(output));
>>  			continue;
>>  		}
>>=20=20
>>  		/* For negative test, panel should be non-hdr. */
>> -		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
>> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output))=
 {
>>  			igt_info("%s: Can't run negative test on HDR panel.\n",
>>  				 igt_output_name(output));
>>  			continue;
>>  		}
>>=20=20
>> -		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
>> +		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output=
)) {
>>  			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
>>  				 igt_output_name(output));
>>  			continue;
>> @@ -772,8 +573,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>>  					     crtc);
>>=20=20
>>  				/* Signal HDR requirement via metadata */
>> -				fill_hdr_output_metadata_st2084(&hdr);
>> -				set_hdr_output_metadata(data, &hdr);
>> +				igt_hdr_fill_st2084(&hdr);
>> +				igt_hdr_set_metadata(data->output, &hdr);
>>  				if (igt_display_try_commit2(display, display->is_atomic ?
>>  							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
>>  					igt_info("%s: Couldn't set HDR metadata\n",
>> @@ -796,7 +597,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>  				else
>>  					flags &=3D ~TEST_NEEDS_DSC;
>>=20=20
>> -				set_hdr_output_metadata(data, NULL);
>> +				igt_hdr_set_metadata(data->output, NULL);
>>  				igt_display_commit2(display, display->is_atomic ?
>>  						    COMMIT_ATOMIC : COMMIT_LEGACY);
>>=20=20
>> @@ -811,13 +612,13 @@ static void test_hdr(data_t *data, uint32_t flags)
>>  						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>>  						test_static_toggle(data,
>>  								   crtc,
>> -								   output, hdr_test_formats[i], flags);
>> +								   hdr_test_formats[i], flags);
>>  					if (flags & TEST_SWAP)
>>  						test_static_swap(data,
>>  								 crtc,
>> -								 output, hdr_test_formats[i], flags);
>> +								 hdr_test_formats[i], flags);
>>  					if (flags & TEST_INVALID_METADATA_SIZES)
>> -						test_invalid_metadata_sizes(data, output);
>> +						test_invalid_metadata_sizes(data);
>>  				}
>>  			}
>>=20=20
>> --=20
>> 2.25.1
>>=20

--=20
Jani Nikula, Intel
