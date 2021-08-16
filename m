Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEFA89B62
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 16:56:07 +0000 (UTC)
Date: Mon, 16 Aug 2021 19:56:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YRqYoyZYLCVn4K9+@intel.com>
References: <20210803110934.970874-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210803110934.970874-1-ayaz.siddiqui@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/1] lib/rendercopy_gen9: Program
 platform specific MOCS index
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 03, 2021 at 04:39:33PM +0530, Ayaz A Siddiqui wrote:
> Since Gen12 onward PTE based catchability is not supported to changing
> PTE index to UC as safest  catchability.

That doesn't make any sense to me. Without a PTE MOCS setting all
buffers that have the potential of becoming scanout buffers will
have to be UC, which doesn't sound particularly great.

Also we do have the PTE MOCS index still programmed on gen12 AFAICS.

>=20
> Based on further need, we may move intel_get_uc_mocs() in some common fil=
e,
> so that it can be useed for providing uc index for other modules also.
>=20
>=20
> Ayaz A Siddiqui (1):
>   lib/rendercopy_gen9: Program MOCS value based on platform
>=20
>  lib/rendercopy_gen9.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.26.2

--=20
Ville Syrj=E4l=E4
Intel
