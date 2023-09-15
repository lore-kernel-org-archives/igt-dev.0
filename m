Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3D710E643
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 15:39:06 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 15:39:03 +0000
Message-ID: <MW3PR11MB4748EE6A4799E4052FC45719AEF6A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230915144649.7-1-francois.dugast@intel.com>
In-Reply-To: <20230915144649.7-1-francois.dugast@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_query: Print
 XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY value
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

LGTM,
Reviewed-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>

Thanks,
Rahul

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Francois Dugast
> Sent: Friday, September 15, 2023 8:17 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_query: Print
> XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY value
>=20
> The key XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY has been added to the
> info array provided in struct drm_xe_query_config. It represents the valu=
e of
> the highest available exec queue priority. The existing test is extended =
to
> also print the value returned for this key.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_query.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> 9835b895d..5966968d3 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -381,6 +381,8 @@ test_query_config(int fd)
>  		config->info[XE_QUERY_CONFIG_GT_COUNT]);
>  	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
>  		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
> +	igt_info("XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY\t%llu\n",
> +		config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY]);
>  	dump_hex_debug(config, query.size);
>=20
>  	free(config);
> --
> 2.34.1
