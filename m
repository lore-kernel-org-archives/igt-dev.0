Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CC610E69B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 08:31:25 +0000 (UTC)
Date: Fri, 28 Jul 2023 08:31:18 +0000
To: =?utf-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <K4cmpjO20z_cvNP63T2Ihn2eLPSopWBkrxkLC2hMJH1vcpwSajGBR3qtIYXaoRpa6dfNE3zOekFpEusdkFGrRNC72CjqUU6wjPoDTDSRfkI=@emersion.fr>
In-Reply-To: <20230728082150.pz267tg26xgltqow@zkempczy-mobl2>
References: <20230727174311.327796-1-contact@emersion.fr>
 <20230728082150.pz267tg26xgltqow@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v2] drm-uapi: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Fei Yang <fei.yang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, July 28th, 2023 at 10:21, Zbigniew Kempczy=C5=84ski <zbigniew.ke=
mpczynski@intel.com> wrote:

> On Thu, Jul 27, 2023 at 05:43:17PM +0000, Simon Ser wrote:
>=20
> > Sync with drm-next commit 52920704df878050123dfeb469aa6ab8022547c1.
> >=20
> > This is required for:
> > https://patchwork.freedesktop.org/patch/547602/?series=3D120551&rev=3D4
> >=20
> > v2: drop redefinitions from lib/i915/i915_drm_local.h
>=20
>=20
> I was pretty sure we're doing verbatim copy of kernel drm uapi
> files but it looks due to two issues there's not possible at the
> moment.
>=20
> I've copied all drm files to igt directories and two definitions
> needs to be added locally to work:
>=20
> 1. in drm.h
> +#define __user
>=20
> 2. in i915_drm:
> #define __packed attribute((packed))
>=20
> (change 2 requires removing this definition from tools/intel_vbt_decode.c=
)
>=20
> I think the best would be to replace in kernel uapi i915_drm.h file
> __packed to attribute((packed)) (this is used in single place).
>=20
> Simon - what do you think? I think to avoid manually comparison of
> drm uapi header files between kernel and igt would be better to
> introduce #define __user in drm.h each time we sync but rest of
> the files would be intact (but this requires merging 2.).

This is not what the README says, and I don't think it's a great
solution, because it requires more manual steps and is difficult to
review.

I don't see __user anywhere, neither in the old nor in the new headers.
