Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9ED6EB7E
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 19:31:34 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Tue, 5 Oct 2021 19:31:31 +0000
Message-ID: <BYAPR11MB37848640B55FA385D406A0E48AAF9@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20211005151022.2161424-1-alan.previn.teres.alexis@intel.com>
 <20211005151022.2161424-2-alan.previn.teres.alexis@intel.com>
 <YVykFyOAiKq20zsg@intel.com>
In-Reply-To: <YVykFyOAiKq20zsg@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v13 01/16] i915_drm.h sync PXP default
 session
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hey Rodrigo, apologies for this upstream-newbie mistake and I truly appreci=
ate you taking the time and explaining my mistake especially the pull-in of=
 the other non-PXP delta's too. I will respin this ASAP.

...alan

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Tuesday, October 5, 2021 12:15 PM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t v13 01/16] i915_drm.h sync PXP default =
session

On Tue, Oct 05, 2021 at 08:10:07AM -0700, Alan Previn wrote:
> Sync UAPI for to get I915_PROTECTED_CONTENT_DEFAULT_SESSION define value.
>=20
> Taken from kernel commit:
> commit cbbd3764b2399ad882cda98435b25144e9ea2124
>        ("drm/i915/pxp: Create the arbitrary session after boot.")

This is not accurate. The i915_drm.h in this commit has more changes other =
than I915_PROTECTED_CONTENT_DEFAULT_SESSION.

We should combine the patches 1 and 2 of this series and make a simply i915=
_drm.h sync and add some reasoning in the commit message saying that it is =
because of the PXP. But the new include/drm-uapi/i915_drm.h should include =
all the new api additions from i915_drm.h uapi.


>=20
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  include/drm-uapi/i915_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h=20
> index b9632bb2..f4691fcc 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -2990,6 +2990,9 @@ struct drm_i915_gem_create_ext_memory_regions {
>  	__u64 regions;
>  };
> =20
> +/* ID of the protected content session managed by i915 when PXP is=20
> +active */ #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.25.1
>=20
