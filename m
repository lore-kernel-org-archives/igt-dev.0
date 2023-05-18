Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD7610E53E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 May 2023 19:16:01 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Date: Thu, 18 May 2023 19:15:53 +0000
Message-ID: <MW3PR11MB4748297AFDF35CDB5A73318BAE7F9@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20230516165058.4047595-9-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 08/20] tests/xe/xe_gpgpu_fill: Close the fd
 before exit
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
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: 16 May 2023 22:21
> To: igt-dev@lists.freedesktop.org; kamil.konieczny@linux.intel.com; Kumar=
,
> Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 08/20] tests/xe/xe_gpgpu_fill: Close the fd before exit
>=20
> Close the file descriptor before exiting the test.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/xe/xe_gpgpu_fill.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/xe/xe_gpgpu_fill.c b/tests/xe/xe_gpgpu_fill.c index
> 5bca19c87..28ad2382b 100644
> --- a/tests/xe/xe_gpgpu_fill.c
> +++ b/tests/xe/xe_gpgpu_fill.c
> @@ -131,5 +131,6 @@ igt_main
>  	igt_fixture {
>  		xe_device_put(data.drm_fd);
>  		buf_ops_destroy(data.bops);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> --
> 2.40.0
