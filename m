Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B1510E133
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 04:32:30 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Date: Mon, 15 May 2023 04:32:25 +0000
Message-ID: <DM6PR11MB44921040042BDADBC113E90A8D789@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230512143033.3830748-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230512143033.3830748-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_evict: Update beng-large
 subtest
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> janga.rahul.kumar@intel.com
> Sent: 12 May 2023 08:01 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_evict: Update beng-large sub=
test
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Add missing bind engine flag.
>=20
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/xe/xe_evict.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c index 5687cce3..7f=
ef4efc
> 100644
> --- a/tests/xe/xe_evict.c
> +++ b/tests/xe/xe_evict.c
> @@ -564,7 +564,7 @@ igt_main
>  			EXTERNAL_OBJ },
>  		{ "beng-small-multi-vm", 16, 256, 1, 128, BIND_ENGINE |
>  			MULTI_VM },
> -		{ "beng-large", 4, 16, 1, 4, 0 },
> +		{ "beng-large", 4, 16, 1, 4, BIND_ENGINE },
>  		{ "beng-large-external", 4, 16, 1, 4, BIND_ENGINE |
>  			EXTERNAL_OBJ },
>  		{ "beng-large-multi-vm", 4, 8, 3, 8, BIND_ENGINE |
> MULTI_VM },
> --
LGTM
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 2.25.1
