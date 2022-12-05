Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3810E1D4
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 12:30:01 +0000 (UTC)
From: "Kumar, Sinjan" <sinjan.kumar@intel.com>
To: "Srivastava, Vikas" <vikas.srivastava@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 5 Dec 2022 12:29:58 +0000
Message-ID: <BN6PR11MB16667FB6583C11250773D1C090189@BN6PR11MB1666.namprd11.prod.outlook.com>
References: <20221201053226.629748-1-vikas.srivastava@intel.com>
In-Reply-To: <20221201053226.629748-1-vikas.srivastava@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_isolation.c :
 Increase MAX_REG
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

LGTM

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vikas
> Srivastava
> Sent: Thursday, December 1, 2022 11:02 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_isolation.c : Incr=
ease
> MAX_REG
>=20
> From: Steve Hampson <steven.t.hampson@intel.com>
>=20
> Increase MAX_REG from 0x200000 to 0x400000 to support new large MMIO
> base addresses such as to support GEN12+ platform base addresses.
>=20
> Signed-off-by: Steve Hampson <steven.t.hampson@intel.com>
> Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_ctx_isolation.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolatio=
n.c
> index dc52a9a03..ec6935714 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -27,7 +27,8 @@
>  #include "igt_dummyload.h"
>  #include "igt_types.h"
>=20
> -#define MAX_REG 0x200000
> +/* MAX_REG must be greater than the maximum register address. */
> +#define MAX_REG 0x400000
>  #define NUM_REGS (MAX_REG / sizeof(uint32_t))
>=20
>  #define PAGE_ALIGN(x) ALIGN(x, 4096)
> --
> 2.25.1
