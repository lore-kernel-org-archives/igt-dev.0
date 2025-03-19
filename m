Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CF0C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 12:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC8C10E35A;
	Wed, 19 Mar 2025 12:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FffcEWtn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B1810E35A
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742388506; x=1773924506;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=PLtwgi7bkqLtiVuU7KWUkwHkL8SjLKxROKsY3dsJv9Y=;
 b=FffcEWtnrngLI6lSgU01lDW19+iH96wvvJhPt1RfqaWoAge2HkJNFGyL
 GPt7t5iLK3ohHqenzkVF0QV55zrP77JQx/Iye9eaB5WS62ynE/DbjhBwA
 c3sTqRI8jZnPwplnPTR1d0iZkYodwURw5gF9583djWvEA2CDAjxw9l7z8
 2hl6ZM+IWD9LH/LDOCdT9Hx39YIn0mLf4kdQs6+CtNDGQqSZSH7Qp8Vla
 wz0hc07pdNhEP6VKGuJE63mAqZHS0J8Pc4eoFvXyLnSW8Oo+kXEh56gc/
 wTh8c5yDhpDak/l+COO8BX1PATJrxzmyBQo8yT3DemK5ZA1YvY/M1GqNF A==;
X-CSE-ConnectionGUID: qDv4BRh4SaSMLBfLwK7qxA==
X-CSE-MsgGUID: vxGzk8HATt6fEdpA7WCIBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43307613"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43307613"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:48:25 -0700
X-CSE-ConnectionGUID: KTNr/yoDSbmPohA6X82HYA==
X-CSE-MsgGUID: xU37SHagTheAJZ7Ja7hjJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122783141"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.26])
 ([10.245.246.26])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:48:24 -0700
Message-ID: <e80c7bfc21bbdcf36f8a331f1f2f4103e5cd1cb9.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_render_copy: Expose render
 duration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Wed, 19 Mar 2025 13:48:22 +0100
In-Reply-To: <20250305090743.16894-5-francois.dugast@intel.com>
References: <20250305090743.16894-1-francois.dugast@intel.com>
 <20250305090743.16894-5-francois.dugast@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-03-05 at 10:06 +0100, Francois Dugast wrote:
> If the argument duration_ns is provided (not NULL), render() writes
> into it the duration of the rendering execution, which is only a part
> of the overall function. It can be used to observe the relative
> change
> of rendering duration under various hardware stressing conditions.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0tests/intel/xe_render_copy.c | 10 ++++++++--
> =C2=A01 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_render_copy.c
> b/tests/intel/xe_render_copy.c
> index ffe5f7ef1..2125e0667 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -260,7 +260,8 @@ static const char * const testname[] =3D {
> =C2=A0
> =C2=A0static int render(struct buf_ops *bops, uint32_t tiling,
> =C2=A0		=C2=A0 uint32_t width, uint32_t height,
> -		=C2=A0 enum render_copy_testtype testtype)
> +		=C2=A0 enum render_copy_testtype testtype,
> +		=C2=A0 uint64_t *duration_ns)
> =C2=A0{
> =C2=A0	struct intel_bb *ibb;
> =C2=A0	struct intel_buf src, dst, final, grfs;
> @@ -271,6 +272,7 @@ static int render(struct buf_ops *bops, uint32_t
> tiling,
> =C2=A0	int compression =3D testtype =3D=3D COPY_FULL_COMPRESSED ?
> I915_COMPRESSION_RENDER :
> =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0
> I915_COMPRESSION_NONE;
> =C2=A0	bool is_compressed;
> +	struct timespec tv;
> =C2=A0	struct posrc {
> =C2=A0		uint32_t x0, y0;
> =C2=A0		uint32_t x1, y1;
> @@ -329,6 +331,8 @@ static int render(struct buf_ops *bops, uint32_t
> tiling,
> =C2=A0	render_copy =3D igt_get_render_copyfunc(devid);
> =C2=A0	igt_assert(render_copy);
> =C2=A0
> +	if (duration_ns)
> +		igt_gettime(&tv);
> =C2=A0	switch (testtype) {
> =C2=A0	case COPY_SQUARE:
> =C2=A0	case COPY_VSTRIPES:
> @@ -404,6 +408,8 @@ static int render(struct buf_ops *bops, uint32_t
> tiling,
> =C2=A0	}
> =C2=A0
> =C2=A0	intel_bb_sync(ibb);
> +	if (duration_ns)
> +		*duration_ns =3D igt_nsec_elapsed(&tv);
> =C2=A0	intel_bb_destroy(ibb);
> =C2=A0
> =C2=A0	if (write_png) {
> @@ -491,7 +497,7 @@ igt_main_args("dpiW:H:", NULL, help_str,
> opt_handler, NULL)
> =C2=A0				tiling_name =3D
> blt_tiling_name(tiling);
> =C2=A0				tiling =3D
> blt_tile_to_i915_tile(tiling);
> =C2=A0				igt_dynamic_f("render-%s-%ux%u",
> tiling_name, surfwidth, surfheight)
> -					render(bops, tiling,
> surfwidth, surfheight, id);
> +					render(bops, tiling,
> surfwidth, surfheight, id, NULL);
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}

