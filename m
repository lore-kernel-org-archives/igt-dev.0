Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF2B10E421
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 08:17:46 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
Date: Wed, 07 Sep 2022 11:17:07 +0300
Message-ID: <87czc78upo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 00/17] tools/intel_vbt_decode:
 Improve VBT decoder
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

On Tue, 06 Sep 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Sync uo the VBT decoder with the kernel code and
> improve/add the decoding of various things.

On the series,

Acked-by: Jani Nikula <jani.nikula@intel.com>

I didn't read it in detail, glanced through it, it all looked sensible,
and for this tool I think that should be enough.


>
> Ville Syrj=C3=A4l=C3=A4 (17):
>   tools/intel_vbt_decode: Fix mipi sequence block size
>   tools/intel_vbt_decode: Validate fp_timing terminator presence
>   tools/intel_vbt_decode: Use hardcoded fp_timing size for generating
>     LFP data pointers
>   tools/intel_vbt_decode: update vbt defs from kernel
>   tools/intel_vbt_decode: Introduce panel_bits()/panel_bool()
>   tools/intel_vbt_decode: Remove pointless variables
>   tools/intel_vbt_decode: Extract lvds_config[]
>   tools/intel_vbt_decode: Extract panel_fitting[]
>   tools/intel_vbt_decode: Parse HDMI FRL rate
>   tools/intel_vbt_decode: Decode the "use VBT vswing tables" flag
>   tools/intel_vbt_decode: Decode eDP/DP max lane count
>   tools/intel_vbt_decode: Clean up driver features block decoding
>   tools/intel_vbt_decode: Decode AUX CH
>   tools/intel_vbt_decode: Adjust DVO port printing
>   tools/intel_vbt_decode: Dump the compression structure index as
>     decimal
>   tools/intel_vbt_decode: Dump all panels from MIPI blocks
>   tools/intel_vbt_decode: Print panel_type2
>
>  tools/intel_bios.h       |   8 -
>  tools/intel_vbt_decode.c | 712 +++++++++++++++++++++++----------------
>  tools/intel_vbt_defs.h   | 348 ++++++++++---------
>  3 files changed, 622 insertions(+), 446 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
