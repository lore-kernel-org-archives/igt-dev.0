Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045CD10E0D9
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 06:41:08 +0000 (UTC)
From: "Kumar, Sinjan" <sinjan.kumar@intel.com>
To: "Srivastava, Vikas" <vikas.srivastava@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 6 Dec 2022 06:40:55 +0000
Message-ID: <BN6PR11MB166630413E30A03D75825A4D901B9@BN6PR11MB1666.namprd11.prod.outlook.com>
References: <20221125094134.256669-1-vikas.srivastava@intel.com>
In-Reply-To: <20221125094134.256669-1-vikas.srivastava@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_caching: Used
 XY_FAST_COPY_BLT for executing this on MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vikas,

You can update the commit message like below, better not to use past tense =
for commit message description.

Like:- Enable XY_FAST_COPY_BLT for MTL platform.

Thanks & Regards,
Sinjan

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vikas
> Srivastava
> Sent: Friday, November 25, 2022 3:12 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_caching: Used
> XY_FAST_COPY_BLT for executing this on MTL
>=20
> From: Arjun Melkaveri <arjun.melkaveri@intel.com>
>=20
> Test case uses legacy command which is not supported on MTL.
> Modified test to use XY_FAST_COPY_BLT.
>=20
> Cc: Prasad Nallani <prasad.nallani@intel.com>
> Cc: Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_caching.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c index
> eb0170abc..a818a53c2 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -82,15 +82,19 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src,
> struct intel_buf *dst)
>  	intel_bb_add_intel_buf(ibb, src, false);
>  	intel_bb_add_intel_buf(ibb, dst, true);
>=20
> -	intel_bb_out(ibb,
> -		     XY_SRC_COPY_BLT_CMD |
> -		     XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		     XY_SRC_COPY_BLT_WRITE_RGB |
> -		     (6 + 2 * has_64b_reloc));
> -
> -	intel_bb_out(ibb, (3 << 24) | /* 32 bits */
> -		     (0xcc << 16) | /* copy ROP */
> -		     4096);
> +	if (intel_graphics_ver(ibb->devid) >=3D IP_VER(12, 60)) {
> +		intel_bb_out(ibb, XY_FAST_COPY_BLT);
> +		intel_bb_out(ibb, XY_FAST_COPY_COLOR_DEPTH_32 | 4096);
> +	} else {
> +		intel_bb_out(ibb,
> +			     XY_SRC_COPY_BLT_CMD |
> +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			     XY_SRC_COPY_BLT_WRITE_RGB |
> +			     (6 + 2 * has_64b_reloc));
> +		intel_bb_out(ibb, (3 << 24) | /* 32 bits */
> +			     (0xcc << 16) | /* copy ROP */
> +			     4096);
> +	}
>  	intel_bb_out(ibb, 0 << 16 | 0);
>  	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
>  	intel_bb_emit_reloc_fenced(ibb, dst->handle,
> --
> 2.25.1
