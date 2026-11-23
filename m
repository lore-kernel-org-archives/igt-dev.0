Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143E3606A31E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IBBV6yk4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8CF10E6D4;
	Mon, 23 Nov 2026 11:24:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2169D10ED44
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795433032; x=1826969032;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i8ytHPS2oDmp79DlgDZZHPGjwmGo6j6TFs7YD5OkDjE=;
 b=IBBV6yk45+ATAaBQcHzv8CPLl0bSZyMuia88fvxDoamUIXCZLcd0Fr7T
 3KF7QjyzRF70NblSrBrKugvYT0M2jOZwfBZU6qIRfh1OaIt4IJK7GG9LW
 4C5eDLGrQTUgE6kjWXNzd5NkPjR5ztNaTTw4FsT6N62rB7pJfH0S+nFd9
 XX72XQ0Da1f7DluxvGFAGG6Tl94bG5PjXmSUYRWkWGKhudUkecUb6dlWI
 mFtM24ixd4UZ+8WVAtKS1ueVjF4ooRvVFux5nXtVXQZBvbJ2REGDwAKEj
 B3wR/Q2Ekg6zuxErUZAWNuQ4KTvoPSIx109NVk/pgyxKYaRSwFXC6ghq9 A==;
X-CSE-ConnectionGUID: 4AV6kxLERaGH+2jrnaA+0g==
X-CSE-MsgGUID: gbqvAr5qSPyJpGGBv8ye4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4123643"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4123643"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:23:51 -0800
X-CSE-ConnectionGUID: 8+uDXtfhQ76ibhRMARXNZQ==
X-CSE-MsgGUID: sUmDcw8YSe2ACxhddM053g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11291397"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:23:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
In-Reply-To: <20261121115236.124211-1-contact@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261121115236.124211-1-contact@emersion.fr>
Date: Mon, 23 Nov 2026 13:23:45 +0200
Message-ID: <cece9fefd08cd3c955901ffc4c45f73306743223@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 21 Nov 2026, Simon Ser <contact@emersion.fr> wrote:
> Replace manual EDID/CTA parsing with libdisplay-info [1].
>
> libdisplay-info is an EDID and DisplayID library. It's widely used
> across Wayland compositors. It exposes both a high-level API
> (with information collected across EDID/DisplayID/CTA blocks) and
> a low-level API (exposing individual parsed fields from the
> specifications).
>
> Using libdisplay-info will allow IGT to drop all of its custom
> parsing code. libdisplay-info takes care of the bitshifting and
> value decoding. libdisplay-info has documentation, a test suite,
> fuzzing, and a clone of edid-decode which can serve as an example
> to figure out how to use the low-level API.
>
> IGT has already quite a bit of hand-rolled parsing code, and we
> need to start somewhere, so here is a patch leveraging
> libdisplay-info for igt_hdr.
>
> As a bonus, igt_hdr now extracts HDR static metadata from CTA
> DisplayID blocks for free, because the high-level libdisplay-info
> helper does this already.
>
> [1]: https://gitlab.freedesktop.org/emersion/libdisplay-info
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Gil Dekel <gildekel@google.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Mark Yacoub <markyacoub@google.com>

I did not check the HDR stuff bit-for-bit, but at the high level this
looks really, really good, and a great start for migrating to
libdisplay-info.

Thanks a lot for doing this!

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  Dockerfile.build-debian-arm64   |  1 +
>  Dockerfile.build-debian-armhf   |  1 +
>  Dockerfile.build-debian-minimal |  1 +
>  Dockerfile.build-fedora         |  1 +
>  lib/igt_hdr.c                   | 63 +++++----------------------------
>  lib/meson.build                 |  1 +
>  meson.build                     |  1 +
>  7 files changed, 15 insertions(+), 54 deletions(-)
>
> diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
> index 114b9760d1f6..7a9cd1915825 100644
> --- a/Dockerfile.build-debian-arm64
> +++ b/Dockerfile.build-debian-arm64
> @@ -26,6 +26,7 @@ RUN apt-get install -y \
>  			libpci-dev:arm64 \
>  			libpixman-1-dev:arm64 \
>  			libudev-dev:arm64 \
> +			libdisplay-info-dev:arm64 \
>  			libgsl-dev:arm64 \
>  			libasound2-dev:arm64 \
>  			libjansson-dev:arm64 \
> diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
> index c6527ea1eb2f..375f3e185bba 100644
> --- a/Dockerfile.build-debian-armhf
> +++ b/Dockerfile.build-debian-armhf
> @@ -26,6 +26,7 @@ RUN apt-get install -y \
>  			libpci-dev:armhf \
>  			libpixman-1-dev:armhf \
>  			libudev-dev:armhf \
> +			libdisplay-info-dev:armhf \
>  			libgsl-dev:armhf \
>  			libasound2-dev:armhf \
>  			libjansson-dev:armhf \
> diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
> index 573bb5139ceb..1d326250eef9 100644
> --- a/Dockerfile.build-debian-minimal
> +++ b/Dockerfile.build-debian-minimal
> @@ -17,6 +17,7 @@ RUN apt-get install -y \
>  			libpci-dev \
>  			libpixman-1-dev \
>  			libudev-dev \
> +			libdisplay-info-dev \
>  			libxrandr-dev \
>  			libxv-dev \
>  			x11proto-dri2-dev \
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index aacc6a87c844..db7618325a67 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -14,6 +14,7 @@ RUN dnf install -y \
>  	'pkgconfig(cairo)' \
>  	'pkgconfig(libpci)' \
>  	'pkgconfig(libudev)' \
> +	'pkgconfig(libdisplay-info)' \
>  	'pkgconfig(glib-2.0)' \
>  	'pkgconfig(gsl)' \
>  	'pkgconfig(alsa)' \
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> index c0ed9e843163..b8175ceef1f7 100644
> --- a/lib/igt_hdr.c
> +++ b/lib/igt_hdr.c
> @@ -11,6 +11,8 @@
>  #include <termios.h>
>  #include <unistd.h>
>  
> +#include <libdisplay-info/info.h>
> +
>  /**
>   * SECTION:igt_hdr
>   * @short_description: HDR metadata helpers
> @@ -22,33 +24,6 @@
>   * output metadata construction, and blob programming utilities.
>   */
>  
> -/* HDR EDID parsing. */
> -#define CTA_EXTENSION_VERSION		0x03
> -#define HDR_STATIC_METADATA_BLOCK	0x06
> -#define USE_EXTENDED_TAG		0x07
> -
> -static bool cta_block(const char *edid_ext)
> -{
> -	/*
> -	 * Byte 1: 0x07 indicates Extended Tag
> -	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
> -	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
> -	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
> -	 *	             ET_1: Traditional Gamma - HDR Luminance Range
> -	 *	             ET_2: SMPTE ST 2084
> -	 *	             ET_3: Hybrid Log-Gamma (HLG)
> -	 *	             ET_4 to ET_5: Reserved for future use
> -	 */
> -
> -	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
> -	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
> -	     (edid_ext[2] & ((1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR) |
> -			     (1 << HDMI_EOTF_SMPTE_ST2084))))
> -			return true;
> -
> -	return false;
> -}
> -
>  /**
>   * igt_is_panel_hdr:
>   * @fd: DRM file descriptor
> @@ -63,13 +38,10 @@ static bool cta_block(const char *edid_ext)
>  bool igt_is_panel_hdr(int fd, igt_output_t *output)
>  {
>  	bool ok;
> -	int i, j, offset;
>  	uint64_t edid_blob_id;
>  	drmModePropertyBlobRes *edid_blob;
> -	const struct edid_ext *edid_ext;
> -	const struct edid *edid;
> -	const struct edid_cea *edid_cea;
> -	const char *cea_data;
> +	struct di_info *info;
> +	const struct di_hdr_static_metadata *hdr_static_metadata;
>  	bool ret = false;
>  
>  	ok = kmstest_get_property(fd, output->id,
> @@ -82,30 +54,13 @@ bool igt_is_panel_hdr(int fd, igt_output_t *output)
>  	edid_blob = drmModeGetPropertyBlob(fd, edid_blob_id);
>  	igt_assert(edid_blob);
>  
> -	edid = (const struct edid *) edid_blob->data;
> -	igt_assert(edid);
> -
> -	for (i = 0; i < edid->extensions_len; i++) {
> -		edid_ext = &edid->extensions[i];
> -		edid_cea = &edid_ext->data.cea;
> -
> -		/* HDR not defined in CTA Extension Version < 3. */
> -		if ((edid_ext->tag != EDID_EXT_CEA) ||
> -		    (edid_cea->revision != CTA_EXTENSION_VERSION))
> -				continue;
> -		else {
> -			offset = edid_cea->dtd_start;
> -			cea_data = edid_cea->data;
> -
> -			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
> -				ret = cta_block(cea_data + j);
> +	info = di_info_parse_edid(edid_blob->data, edid_blob->length);
> +	igt_assert(info);
> +	hdr_static_metadata = di_info_get_hdr_static_metadata(info);
>  
> -				if (ret)
> -					break;
> -			}
> -		}
> -	}
> +	ret = hdr_static_metadata->traditional_hdr || hdr_static_metadata->pq;
>  
> +	di_info_destroy(info);
>  	drmModeFreePropertyBlob(edid_blob);
>  
>  	return ret;
> diff --git a/lib/meson.build b/lib/meson.build
> index 3ed1369b53d1..cb861c472808 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -156,6 +156,7 @@ lib_deps = [
>  	libkmod,
>  	libpci,
>  	libudev,
> +	libdisplay_info,
>  	math,
>  	pciaccess,
>  	pixman,
> diff --git a/meson.build b/meson.build
> index eec131375e06..e7c685116b13 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -151,6 +151,7 @@ build_info += 'Valgrind annotations: @0@'.format(valgrind.found())
>  cairo = dependency('cairo', version : '>1.12.0', required : true)
>  libpci = dependency('libpci', required : true)
>  libudev = dependency('libudev', required : true)
> +libdisplay_info = dependency('libdisplay-info', required : true)
>  glib = dependency('glib-2.0', required : true)
>  
>  libtsi = cc.find_library('TSI', required : false)

-- 
Jani Nikula, Intel
