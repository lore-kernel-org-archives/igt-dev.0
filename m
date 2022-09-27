Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B2210E0B4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 08:51:10 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 08:51:07 +0000
Message-ID: <DM4PR11MB6312AEC201C2214FBDE0E07C90559@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-6-kunal1.joshi@intel.com>
In-Reply-To: <20220926185321.2897136-6-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 5/5] tests/kms_hdmi_inject: test
 cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "Joshi,
 Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, September 27, 2022 12:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [igt-dev] [PATCH i-g-t v1 5/5] tests/kms_hdmi_inject: test clean=
up
>=20
> -> Free resources
> -> close drm_fd
>=20
> Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_hdmi_inject.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c index
> abae0ab4..0bb51165 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -219,5 +219,7 @@ igt_main
>=20
>  	igt_fixture {
>  		drmModeFreeConnector(connector);
> +		drmModeFreeResources(res);
> +		close(drm_fd);
>  	}
>  }
> --
> 2.25.1
