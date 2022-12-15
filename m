Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E927410E098
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 15:29:12 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
Date: Thu, 15 Dec 2022 15:27:38 +0000
Message-ID: <DM4PR11MB6312FE12B18DC9470B93BF6A90E19@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20221215081934.13919-1-jeevan.b@intel.com>
In-Reply-To: <20221215081934.13919-1-jeevan.b@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Change MOCS settings for
 MTL
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

We are seeing at BAT failure which is not related to this patch. Can you pl=
ease help with this.=20

IGT changes
Possible regressions
igt@i915_selftest@live@guc_multi_lrc:
fi-kbl-soraka: NOTRUN -> INCOMPLETE

Thanks=20
Jeevan B=20

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Thursday, December 15, 2022 1:50 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] lib/igt_draw: Change MOCS settings for MTL
>=20
> On MTL, we want the table entry labelled "UC (GO:Mem)"
> which has index 5.  This means that the MOCS value is 10.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_draw.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c index 975d65cd..d8cc60f9 100=
644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -703,7 +703,10 @@ static void draw_rect_blt(int fd, struct cmd_data
> *cmd_data,
>=20
>  		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
>  		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
> -		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
> +		if (IS_METEORLAKE(intel_get_drm_devid(fd)))
> +			intel_bb_out(ibb, blt_cmd_tiling | 10 << 21 | (pitch-
> 1));
> +		else
> +			intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-
> 1));
>  		intel_bb_out(ibb, (rect->y << 16) | rect->x);
>  		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect-
> >w));
>  		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
> --
> 2.36.0
