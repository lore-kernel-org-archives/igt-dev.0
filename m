Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3063DC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 08:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A9410F84C;
	Thu, 25 Jan 2024 08:00:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C35510F853
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706169646; x=1737705646;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AJZyaoAZ4SrK3MPjlCgEaqj3f/0nGudgZSJdShN1N6Y=;
 b=h9fBeOvkNjFqjP2ixinaV9s3b9URKUTo5X640ISHyflmxaCcFxyRNwi7
 FCHHP/anDlGlDcX1GOFmKTF9sv5nfC/B4yEebL2SzonwlWLsPcz01Mdgj
 7kUcZtKxfHlOaeiyLnTJCiP7mZTnOoLuuE+4IyQt7SET8yZs55ZOHYGFX
 1Bvqb5jnXqD0KHwDdtEYmWgtv/UWkGo7tCn/NzwXxSQ1BYYbe2piBZtfS
 mp6dg+Cxs/QtSg767MQmWSeyl+yjl34ZezQQ5iVw+vIitEMstzcxgqh07
 dB8wDPkh1pzqfjngK3K5x0uudfNLcEWoVrTw4+l1l3VCmhwS3t5IsQSM7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15623944"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15623944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 00:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35040718"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 00:00:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 00:00:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 00:00:20 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 23:59:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFSAs2VUgbqh0qVd20eN00tPudiJP/UaAdmnn2m9ONyRKviM02UjVIz+ToixcxTnFzr9nKb5F/aJ6n/qxXUQHilhJWaE5EBDKoZwjmXAkxNGfYi3TptHjrwS5ry82vcB6EIg8/eO9HwarJAB0fkUivfXYMxMegc/vQe93ZLAXE1y0zGV04F7MWmmbVuUBaEqVh2Yg3JkPtSUob4uY+dgqM8UsT/ct1a9Qwa00KlpJ3RxlCBo2DEU26BBAssivsve/u6z13e+xu83wMhKkur1LzLvo7q8NsyeFsOokm+pHgFkW1Z/MI0YgwBnUtrX4eV3HFzTw/smfxffuIRq20DBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5Yqsu7QOCsPKFSYgVOm6WgUGF8nauuPu8o+7a69E38=;
 b=iUEHaM3TTAG3R1/8I6RAPuO4iOURLbgXBmNNM2cqn05zooJzmILwgI1DkMRDKZenEZ/tjX+5YM+fh9KvbcMnFJVKY3xesKPEvCEdrmpRcb+DTqsbVAA3Telc0Ivjr7GxDkUwaUvJBnJY751O5ONbt0vJlO3Ktkorvq/3NGe76S90zba+cBoL0uArXyYmrQGl2iiWWxxutn+bKKxnN6BCFL/rc6z1RFKh75Z7ri9NWJUKuHqQx9PdbRtp3BS398TZdNEITJSSVIfRaw0k0XhGjsPyp77NFJvjMF55s63wuGYYvmLTShbfdphXYQtT1wEKRD3uiwMrGgShe2I38qDafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.38; Thu, 25 Jan 2024 07:59:37 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 07:59:36 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 8/8] tests/intel/gem_mmap: add basic multi-GPU
 subtest
Thread-Topic: [PATCH i-g-t v2 8/8] tests/intel/gem_mmap: add basic multi-GPU
 subtest
Thread-Index: AQHaTwXdVVXg/iNBfUGgkna7UeMVWrDqKm4Q
Date: Thu, 25 Jan 2024 07:59:36 +0000
Message-ID: <DS0PR11MB72646840AD739A311B2482EBD97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-9-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240124204134.71451-9-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CY8PR11MB7846:EE_
x-ms-office365-filtering-correlation-id: 0bee0fdd-bbe8-485d-27a3-08dc1d7b933b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jIkmMYTkSyVFUVsXidJtFgq4VgMSGIqKIRnoOq3zY5vFFbVVQvtqHe+YDOaxlt/6KJE8RkuyQ0cZkfZFwHCwHhhmmM2QQbl7/1elrDv3pkxJ2DtW934VwziCge0hfwl3opmO3uIwJvQKbMhioTQ3RMSPW7usbwDRWnMAFEus4pmmB6w/uW5IAxYqnbWtAVvUIjDiNiV3RWu8vmzrJybYHvxp4YfL6uQsMuLk4Ac0u+uuHN15tPJ+vseXVbHOP6QhtnXwqfgzmRADTEmkAUdYPkBmBBtoqlWB2i5hvlbE5mdwfFVsmO+nijMOCK6LXLBTQokK89TfcOSZ3RK0HN2D6PuODPArVZSwkh84Uam/DO1Oczt40DpQnZ81WKBx4FSz9tuhD0fh5ZZwLTEsK/U5tR6g1U7xwK3jctgKNHai5JEun+NOm95EuCVG2A8COgtacy+9loDlg068SqcLqSCjzTm3WM8kZ4Zrn0FDjeUToiMpbSSR1CHx4i1j1ZN7mGTA1zcRfweJuk/zGYMtx8jqH1tXIgWol641Cma1ed4d7WBHQ5i3bjZVO/9DcO5R7UkgOzS6NCo0I5JCHG6f+vdEOWY6UF90G9GchmGfbaDiLaPma40gWkegj46iz1xjtoiJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(9686003)(83380400001)(52536014)(66946007)(26005)(38100700002)(66574015)(122000001)(8676002)(5660300002)(8936002)(66446008)(53546011)(478600001)(7696005)(110136005)(6506007)(2906002)(76116006)(66476007)(71200400001)(64756008)(66556008)(316002)(41300700001)(38070700009)(33656002)(86362001)(82960400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?CrSFhnEM8IE/Oz4RMOejW2pZ+tg7AEgDPtvHmBw+6EJ18Llg9VY3KC7Ug3?=
 =?iso-8859-2?Q?OlGCOOrtwnd6gKXEEYmw4P4drqaLY4k7cEJp2cxYmoUSbsFtG/6xFvWjbu?=
 =?iso-8859-2?Q?ebGuN0zfjJBEOSo/34YdAShxiQdvEMFWOYTSRgwVqNkgNICdLY3bLfhHrN?=
 =?iso-8859-2?Q?Y55rZBcJ7pbkFUCqeutQdvEmNYSQJRk1dv3sS10aSfrPf8ZI7XFARrnoQF?=
 =?iso-8859-2?Q?YDktq/jyMVcmTNtEFRiwi2bwhvr4Bj4PPONhdLG3j0zYGyEWYLKR1Cf5np?=
 =?iso-8859-2?Q?8Pn+r6c/BE+B0lxqRpzzXWchfIRzqTnCwcJiBA8UjDvpEGymObbQwr3+bp?=
 =?iso-8859-2?Q?qjdVQ3v/g6b0Hic08ydqt9M6mUZUVWzFS9txGvNIFOuOQvDGpK51UppMH+?=
 =?iso-8859-2?Q?Coss7Ayi1M7m1yRNNGPxz0fmvq0bOLO86Zs00MxQE9rJI1r9HbLY7ENyar?=
 =?iso-8859-2?Q?nyAgtJ06P5+YTIe9k2IlEIJ22EShX9gAg+3jBT9Y0jMjo3yW2U2CdfqKCy?=
 =?iso-8859-2?Q?De1yXLlLvTDHFfOqG3n3indVLSsKr3XeYcxVwJQ3KcU+lbzidPqeSrUmvD?=
 =?iso-8859-2?Q?Dx5pD4iJ1H87bE3Quc5KOrxiSBbj7akM+X0ulsaBtJWrVCKA6MtaJ0LMX+?=
 =?iso-8859-2?Q?lP7US1bJia8ZgYffK9b6HOpcF57CNATO4ecl32suH8NzihbTd/hBP68YKw?=
 =?iso-8859-2?Q?e6YZ5ONKRRqgospw4n2/oFoVsGmDUbroHRBm92pChKLh/pahmP5n2jFs4R?=
 =?iso-8859-2?Q?Pa23cLFA/QSN9AQWtudAWB+LGx8SWaVm8niQJILK/V+zhzzQ+BH/xCaL2i?=
 =?iso-8859-2?Q?N+u7ZjvYTG6EKgd9gOppuHqEu+BfyXn4vOEGyQVz2fbbydad4r8nkFiXXN?=
 =?iso-8859-2?Q?uf/4FHxP4hqKZQSPgw/NoELu3rPrhJjynTjElTyvjCAkbC2RsZcxP0EEKm?=
 =?iso-8859-2?Q?5J3oScthPHK4GCgtB9xqSNE9eqYciSatfDgkh8GeeJxrHBtY34fpVB2gyv?=
 =?iso-8859-2?Q?QlwUoPinexsqVckO1KuK78/2UJBdadygbABj4PyIzEKgF/5MY+PpryJb/h?=
 =?iso-8859-2?Q?uIe6ret6A121QU4X1zneD9uk3bOa8KlydAITLLmLMuUu9E37Z9/zZL95or?=
 =?iso-8859-2?Q?yGsHynJ5mM62ShpLA0lwfqNehxxSIMa16WV9PYcHzODzIcKfW4tQ+6R/MP?=
 =?iso-8859-2?Q?vYMWqADyOMcEmn0WwaRlee1+gWeETUxm5wef2uKMEAncANXPTrGW9ksWrE?=
 =?iso-8859-2?Q?pYOa1Mp1OiC9vUIdXvGsrEiPis+dPsBrvfvliObSowjiwB5mghSyQrcnbX?=
 =?iso-8859-2?Q?ob+Lot96QK5d0UvCDzAZMPpSRwcRBdUXM4Uq43LY2iZpQrOviLI5xPhHPX?=
 =?iso-8859-2?Q?Y+mErosCuXeQ8hYd/ddUnyHAViLeLEoYUc/aFr1v4Xj5NG3JPDQA59dceu?=
 =?iso-8859-2?Q?x9EnagGz8XJlp9MUujmxj+8vw/aZPzDtVa3Mg1NBa4wJPbzltKife8yGmh?=
 =?iso-8859-2?Q?qwouCz49IfEm4MmUU/5b6eFISirG4453hii2FDE4zVmaTTXiQujwij1MGO?=
 =?iso-8859-2?Q?nLnLuSusC8mtwni8EiGoUmG/XS6Ek+8jbpGfAIJaE7a435jazG9GZqyKmF?=
 =?iso-8859-2?Q?PT3Am34/5W1a91hSUirvdyIpqTTMsWnjBRiKg9t3poioafXFzJrQi0Sw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bee0fdd-bbe8-485d-27a3-08dc1d7b933b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 07:59:36.7486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9Pf62gt4VMr47g9YFvUgu8V86I8kJSoO3AUr5/h8yonStJ7o2jb5b6MQ8bDsCchL0voQftnykJxSyIlgqLYHibd8/sWnH2cj3sZXhyOrF30rDfTNv5soZ24puSD6n+O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Kamil,

LGTM.
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Wednesday, January 24, 2024 9:42 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t v2 8/8] tests/intel/gem_mmap: add basic multi-GPU
> subtest
>=20
> Test basic mmap for two or more GPU cards.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_mmap.c | 77 +++++++++++++++++++++++++++--------------
> -
>  1 file changed, 50 insertions(+), 27 deletions(-)
>=20
> diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c index
> d4ca1eda7..90bcec7b0 100644
> --- a/tests/intel/gem_mmap.c
> +++ b/tests/intel/gem_mmap.c
> @@ -38,6 +38,8 @@
>=20
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +#include "intel_multigpu.h"
> +
>  /**
>   * TEST: gem mmap
>   * Description: Basic MMAP IOCTL tests for memory regions.
> @@ -61,6 +63,11 @@
>   *   mapping existence after gem_close and unmapping.
>   * Run type: BAT
>   *
> + * SUBTEST: basic-multigpu
> + * Description:
> + *   Test basics of mmap on two or more GPUs.
> + * Run type: BAT
> + *
>   * SUBTEST: basic-small-bo
>   * Description:
>   *   Test the write read coherency and simultaneous access of different =
pages
> of a small buffer
> @@ -209,12 +216,40 @@ static int mmap_ioctl(int i915, struct
> drm_i915_gem_mmap *arg)
>  	return err;
>  }
>=20
> -igt_main
> +static void test_basic(int i915, int pat)
>  {
> +	struct drm_i915_gem_mmap arg =3D {
> +		.handle =3D gem_create(fd, OBJECT_SIZE),
> +		.size =3D OBJECT_SIZE,
> +	};
>  	uint8_t expected[OBJECT_SIZE];
>  	uint8_t buf[OBJECT_SIZE];
>  	uint8_t *addr;
>=20
> +	igt_assert_eq(mmap_ioctl(fd, &arg), 0);
> +	addr =3D from_user_pointer(arg.addr_ptr);
> +
> +	igt_info("Testing contents of newly created object.\n");
> +	memset(expected, 0, sizeof(expected));
> +	igt_assert(memcmp(addr, expected, sizeof(expected)) =3D=3D 0);
> +
> +	igt_info("Testing coherency of writes and mmap reads.\n");
> +	memset(buf, 0, sizeof(buf));
> +	memset(buf + 1024, pat, 1024);
> +	memset(expected + 1024, pat, 1024);
> +	gem_write(fd, arg.handle, 0, buf, OBJECT_SIZE);
> +	igt_assert(memcmp(buf, addr, sizeof(buf)) =3D=3D 0);
> +
> +	igt_info("Testing that mapping stays after close\n");
> +	gem_close(fd, arg.handle);
> +	igt_assert(memcmp(buf, addr, sizeof(buf)) =3D=3D 0);
> +
> +	igt_info("Testing unmapping\n");
> +	munmap(addr, OBJECT_SIZE);
> +}
> +
> +igt_main
> +{
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_INTEL);
>  		igt_require(gem_has_legacy_mmap(fd));
> @@ -306,36 +341,13 @@ igt_main
>=20
>  	igt_describe("Test basics of newly mapped gem object like default
> content, write and read "
>  		     "coherency, mapping existence after gem_close and
> unmapping.");
> -	igt_subtest("basic") {
> -		struct drm_i915_gem_mmap arg =3D {
> -			.handle =3D gem_create(fd, OBJECT_SIZE),
> -			.size =3D OBJECT_SIZE,
> -		};
> -		igt_assert_eq(mmap_ioctl(fd, &arg), 0);
> -		addr =3D from_user_pointer(arg.addr_ptr);
> -
> -		igt_info("Testing contents of newly created object.\n");
> -		memset(expected, 0, sizeof(expected));
> -		igt_assert(memcmp(addr, expected, sizeof(expected)) =3D=3D 0);
> -
> -		igt_info("Testing coherency of writes and mmap reads.\n");
> -		memset(buf, 0, sizeof(buf));
> -		memset(buf + 1024, 0x01, 1024);
> -		memset(expected + 1024, 0x01, 1024);
> -		gem_write(fd, arg.handle, 0, buf, OBJECT_SIZE);
> -		igt_assert(memcmp(buf, addr, sizeof(buf)) =3D=3D 0);
> -
> -		igt_info("Testing that mapping stays after close\n");
> -		gem_close(fd, arg.handle);
> -		igt_assert(memcmp(buf, addr, sizeof(buf)) =3D=3D 0);
> -
> -		igt_info("Testing unmapping\n");
> -		munmap(addr, OBJECT_SIZE);
> -	}
> +	igt_subtest("basic")
> +		test_basic(fd, 1);
>=20
>  	igt_describe("Map small buffer object though direct CPU access,
> bypassing GPU.");
>  	igt_subtest("short-mmap") {
>  		uint32_t handle =3D gem_create(fd, OBJECT_SIZE);
> +		uint8_t *addr;
>=20
>  		igt_assert(OBJECT_SIZE > 4096);
>=20
> @@ -373,4 +385,15 @@ igt_main
>=20
>  	igt_fixture
>  		drm_close_driver(fd);
> +
> +	igt_describe("Test basics of mapped on two or more GPUs.");
> +	igt_subtest("basic-multigpu") {
> +		igt_multi_fork_foreach_gpu(gpu, DRIVER_INTEL) {
> +			int pat =3D 1 + rand() % 128;
> +
> +			igt_info("Basic mmap test with pattern x%x\n", pat);
> +			test_basic(gpu, pat);
> +		}
> +		igt_waitchildren();
> +	}
>  }
> --
> 2.42.0

