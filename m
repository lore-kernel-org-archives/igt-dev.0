Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F6210E0B4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 08:54:36 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 08:54:32 +0000
Message-ID: <DM4PR11MB6312EC4D066E83AC30010DDA90559@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-5-kunal1.joshi@intel.com>
In-Reply-To: <20220926185321.2897136-5-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 4/5] tests/kms_invalid_mode.c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, September 27, 2022 12:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
Hi Kunal,=20

Correct subject.=20

Thanks=20
Jeevan B=20

> Subject: [igt-dev] [PATCH i-g-t v1 4/5] tests/kms_invalid_mode.c
>=20
> -> close drm_fd
>=20
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_invalid_mode.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> 0ae98a31..f1c38669 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -306,5 +306,6 @@ igt_main
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		igt_reset_connectors();
> +		close(data.drm_fd);
>  	}
>  }
> --
> 2.25.1
