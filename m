Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E53E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E761510E040;
	Wed, 18 Dec 2024 22:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGHfCGB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44C810E040
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559567; x=1766095567;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qg1SMPN/MLMzvoh5klW0KwM/9yhuGvd7j1h2nNeuOOE=;
 b=JGHfCGB5qPLNtI6K4930J0L7kiyQGjn9M25W9/Wo8E6QxLR9RJC8qTyT
 ktbgkxe2acsPlJeLqVElBhkzMa8sNJ43JQqrOn9Z9Cbyjn3uRGAib8Ofv
 uhDDXX6bVfnbebjsBbY8zFHEy1WRdo5j4TsuQ1XGVGE3qmzm8KEAmcInG
 YcvdpaLqEyKNHj5L7IhtHY3TR/OQbb/Ai80OTPSDxgxARbn0ca3hqvRQw
 1IFd0dEFQZujsfBggtZdMr+INID/yHM0zInsvukhr1cpGGpwlXfTArA8o
 GpdfM7SgCMyPFdv4jPJSDxSsiPmaFaLXOJbkZYoY0gFwcz6ky8YbhN33X Q==;
X-CSE-ConnectionGUID: K6j8nNx7TGCtXM7eppUbfg==
X-CSE-MsgGUID: vTANj6hDQRCyFEfz0hUM2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34778624"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34778624"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:06:07 -0800
X-CSE-ConnectionGUID: Hzzy1WEISvOJyidWn+4Wlg==
X-CSE-MsgGUID: DFOWcX68T02Lc2uh5+KWwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="102828852"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:06:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:06:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:06:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:06:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjlYSLXMSf2VgwsnramNmz/2BAX3GjRdX06PmieBFg+9JHvHRavShbffh3hGQRTfdGx7/79Hr5dkeqISEOjx1UIfAeL7zRXgN96NyiEmSHaxlS9sQXZcmXLOPImKN7WE7/SnFQ+MX7FGBhn8ZC8xz/DjxNvsjRurzyGEkkOzLPmZXhjWE4P5+3ARIzhT0pPn6H7AVX3SediUXol+JBuf3WjywyosrJOj/lm6PYpL0zfvbX7bFDQqS+pUIveAjEw2oTDVCWcX9bp0Y+ZL4KsyD/x4PRSO8OFBlwT4bgfm7BoOg+P374JvjjneuNh7wo11QlA+0evHzNv6okCVfMQ5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7iI0u8eSVBA7rGEVV+5wb1PNeOpbE6THknRHWBohNY=;
 b=XoFxihFsBIUfisEAa1PAsx+j++7TNdGbcdDUKBZAxakrSr0F/8iZ/DUuVgOXXQujsM4Fb8sK5sAQ+gHGepg+TPH6i9Cp/c2/LJHLkAsI6zTWKESE+VT53iJvTkHMq23dYIQ3TQbFoUOlaGM3Y5UOGrzkDRuRgME0tUXRtMrecVl0z7ZbAUHv/sQ4ZFYbA5zx+pTijJRdOcwc/yej+RUUJiHcLFRo8IT2h38rrnKHeMBdDEXwJtOVsz4xSraL04BY6+8dxlSoQnXgB5uHsjwbNlrvBeq1AZgbh2qnz4i548bUWdY0Ap2IeW3rvNObXFYff8nYoiIOJYb2Tx0nn9lvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 22:05:35 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:05:33 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 5/7] tests/intel/kms_draw_crc: fix x-tiled tests
 for case when there is no x-tile
Thread-Topic: [PATCH i-g-t v5 5/7] tests/intel/kms_draw_crc: fix x-tiled tests
 for case when there is no x-tile
Thread-Index: AQHbUZUGhp/Trc0uDU66W5/S8nZRiLLsizmw
Date: Wed, 18 Dec 2024 22:05:33 +0000
Message-ID: <CH0PR11MB544415E5565E1617C52BEFC2E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20241218213654.2734573-6-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-6-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6267:EE_
x-ms-office365-filtering-correlation-id: a367f6b3-7ec4-4bc0-d7a1-08dd1fb01809
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?W3Z/06hLQk3poceU8YxkrAtSzhDt4Al3ZXR69VoBKJW7kfsEUKWB9ngp0bBO?=
 =?us-ascii?Q?qnjYTww08GUhd58LfLf8unvnmaiFsD20CwstbZxFTiaRYAL5zMRFh6bTHvnk?=
 =?us-ascii?Q?awozlgrow+Tgfk2+3vjliyyyF69oSf0kmwBIZ8am1xVWS0T8fSmeWkAScHm8?=
 =?us-ascii?Q?WM72J7mCIE07WRzicfXH6HruigGLdVFvkW9CQ2atqtVm3QWJoL1k+U0wFJMF?=
 =?us-ascii?Q?LLV8RPZ2NC7209aroPQwqrccJlOYIqku82KWgvm5KGhMWw0n2JXiRI72aWsz?=
 =?us-ascii?Q?h3lMtqyRPRSgU54gFqU2zeEGjyaP0pOYhvdT9itZszRudrD1X7Qp5mqCWoXn?=
 =?us-ascii?Q?4Ssno5t1lKKdqdJrIeEibylPOqQrg4LuK52Bnl0lzywsIKrPu/pgTLUT+7DN?=
 =?us-ascii?Q?rBFYrrD6RR42i1IkPdwqkjsnTTI9t74X1b+2rLKoFcdP05QdgjOBD31uC5fR?=
 =?us-ascii?Q?mmYQAS3qMXdYaRw3Ttu1yEa7GDfzqZ6kIfFbj2RzTg1qd1F4bbc8jp09+rWz?=
 =?us-ascii?Q?MzT68jD7Rh35UCaC7zbR1H0IQ6nVPsj75JuUjGuwTYzDo926KdoAWQlont9G?=
 =?us-ascii?Q?YdXUz7a96nNZt03YmrrlzHkyvLl0edGQJsDSm3WUFkDaF9F9us7ExaeynZ3u?=
 =?us-ascii?Q?7zN0YwDqCw1N6en6UrskjPGjkQsdn3USTU0FzX9sxCPKPQYFK2asRU06EKrN?=
 =?us-ascii?Q?YopBQijm3BMR25vMxwssIKVRw80ZpwmKRYc9pdC475cJVWIfsW1ELTc9qV7f?=
 =?us-ascii?Q?xnQ2tr9sN5auOIqanvCrLizC6k526lCTcJZm++R5ow5b/kmONr9PeAmJ+ypZ?=
 =?us-ascii?Q?VabjomWaemj1SXTudmsjyGcSKF5wIJOuy3OeE6H2gYcGUX2nw6n1ra9gzM5B?=
 =?us-ascii?Q?naMvTrBQ25ho9ArBUqfLbVLbhRMU/fIfqLieGYJ7XgHbIhNBCTWesSQOcAN5?=
 =?us-ascii?Q?9Bkx56rBQC90fdE2s8yPjFQnXJgkCCFm5wDLHTfvqViFEw8c4pQgsfmgA8fy?=
 =?us-ascii?Q?4m537skrvoa/dET+sc5zi/M66Ghdt1UTRr2g+K++ee+4XVdPVRq7DG1SgXRu?=
 =?us-ascii?Q?WRuTPO3MWMHM/0eH6wSYnOsgayAFQspJ0jR3afakV6Yox/BiJyHhZgjIBBKT?=
 =?us-ascii?Q?GTanb8cUxDKTEf/uosbb40m0qSQC/QMMUbMqoSYLmd0ar5lXa/bI9Hf6nTuD?=
 =?us-ascii?Q?FDX5psEVAATgdi2L09ClMaAx16QLb3ukFeppgOwt3UBrro9H+tNM41d88mfW?=
 =?us-ascii?Q?InOfRhkkVHZ/hEN66KOaagOnX+gkOYfhhI/KvDBP0X8UJhyDicycAbzyCrpX?=
 =?us-ascii?Q?skvQXnaOmJV6bf8/mcQKtw6+1KIdwFH3aPpO4YKsxKATvb59ynoHIrv9eZvB?=
 =?us-ascii?Q?WxuZxDjefi8WzQcxjz3msNRa9WpZMu6noZz8FpOeDRiJsY0m/tKuWBglywSQ?=
 =?us-ascii?Q?VGRLjvxjPB/RgMoEpFAgCqSDCkTh9JGb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4Pb9Gs74w0YwZ/Wv3pdHy04iZsQpfEw4W8C4Kgst33jgK41TYIqYhiidv1Vh?=
 =?us-ascii?Q?YkuZvtxSYFVMMtXaobU/h4uis3pOLiWT4fqvD7fpYsJn6SlUmJUhfXkUILz3?=
 =?us-ascii?Q?wqAfiZVXXHCzrmLKwHLhUoSb/cFp+c1Zqg7AaFMRoKRE4xKxRyxwLkg4CcSb?=
 =?us-ascii?Q?uUDfATQJviZqfPXNH6AAYKpn9aXYqkKaHCWaO7CRxPBL0g4qsiXYXRAo+8C9?=
 =?us-ascii?Q?lQyhHoSJIm3noE5g0Nd1ywUIspGaqOpXVDeZqADlw5zKtGR8ol7K+9XRBedH?=
 =?us-ascii?Q?bmHPC14X5mcCEcKAkb/rIBbFAcXo64uUm4dmI+hzjl9Hr2mg18ETBF3nETco?=
 =?us-ascii?Q?HFDqZwSrUU/V28QvW49UeupYbM5kdrkYS4mwN6hV52iEv5mdwVYKqXOFggAu?=
 =?us-ascii?Q?VMRf77L5RwAkmvDAkKcKQd5t/azey2HX4K4cnTRuUw6aO/CF5rf+q1sTlAmS?=
 =?us-ascii?Q?81xB7OuKDCcoT2U6K/DIGSxlpm9hC8YiTifVA7pVgZf30a7zaCvV2Rp69npx?=
 =?us-ascii?Q?nv9/TUY5Hv4+RVH1mCmr3bObr9PRc3R0psJs06tr6R5qvOxVM9iHOpHUR/rA?=
 =?us-ascii?Q?YRWuK6BvPck73go/B+En9U4/4G7ffmr0GkwtBYueL0dAPArQtR9W19hGCm8d?=
 =?us-ascii?Q?sta9AaDU6W4N5vWw3VV+CAmoMq18+dCu/w54pCa447nLcXjBsmplV+MFdU10?=
 =?us-ascii?Q?FE94CyxNYzywKvq6OvKGaFMTY+SUUyuBxhfegaMlenEHIFlD/k4UCStT32mZ?=
 =?us-ascii?Q?/QCbu5ya944xdn+kXX8Z3A3RmpKi2rzCBCxtE//uaQ8dLwRCXa5Z6cJOTOMi?=
 =?us-ascii?Q?IM+T7LzKtRJFW+uXWtNiNc2aubkUiB4CKzR0YP1k72lB531d5TmqZKaMRVYt?=
 =?us-ascii?Q?j6hSOd6dQgbydGMLGQATaKqiVVyp4Pw3UvtPRag3zVOKc3dMkQPGZiV7nXTA?=
 =?us-ascii?Q?GnWlk44MMo0mqTQAi2ITsxJZM6z24+jwv9pNSDgev83bc0mU0JHrPrEpWjcF?=
 =?us-ascii?Q?lI+zTQZmyf+99g5ex0orWIpmsaHAVdVeyMe+HR1qw2snsDz9BHm3t/zfBs2G?=
 =?us-ascii?Q?340EujsQefYQkLQK83WuhkR8TTT7/ykU6bgeTandPhd/YOA2Bzw++Tq9L/rZ?=
 =?us-ascii?Q?V2S4hgy8jKyZHxkKXAdj/IFwb1lpIZoLmr9opQLuS3sv7nA+rXRQKBFu2x1o?=
 =?us-ascii?Q?JAZwhcgLRBrHciDlUgB1NMe9B0fpFIIIXJr0Sjk7gjAu5y5FZzI6EZPhDjX0?=
 =?us-ascii?Q?FwJAg6MRLgNqu0V0wGZzaJ9jSl72f5HPkt0/cI7mh39TOVgObZq8IhtSQHuo?=
 =?us-ascii?Q?zz8mlUamw9SuPoX3Yhqh3+0OVbe69x3JVmldLGc1A/MiKXxhXISBYFGNDgxH?=
 =?us-ascii?Q?bU0u9Vo6V0vpvuS/aENVcs8UqWsPbc3bgGWQSbe7Z/U7J523N8+k3DLFJI1q?=
 =?us-ascii?Q?07j8jiNuMMcPlMKeE0i5gXrdmp5JVQ2g298UOMqM6cENCq7iBZh7K1yKBvrg?=
 =?us-ascii?Q?s25ZK0pQMMdI68WcYlKGWORkaeHZLcTEMMjWFZeb2q7vm/no72hL4OaovOKj?=
 =?us-ascii?Q?Eb4HP428PfKtIOJ0r9W8Lor50jKUVL4xCuUOOQE6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a367f6b3-7ec4-4bc0-d7a1-08dd1fb01809
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 22:05:33.4201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P13mLnPyHyfau3VTTcu4z1VhlldTvFELKdaXqQ/Efh8dwqiz2iBxBSvB5JuTy7VKzsk9TfgEdUzh6yKyMA4oyAsGrS9Hc+Ilbs6kGnOIDZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Clint Ta=
ylor
Sent: Wednesday, December 18, 2024 1:37 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 5/7] tests/intel/kms_draw_crc: fix x-tiled tests f=
or case when there is no x-tile
>=20
> From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
>=20
> On Xe3 display no more support x-tile and will disable such framebuffers
>=20
> v2: Optimize display_ver check (Sai Teja)
>=20
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/kms_draw_crc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index e3d1c0ba9..7d1cc2da5 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -243,8 +243,10 @@ static void fill_fb_subtest(void)
>  	get_fill_crc(DRM_FORMAT_MOD_LINEAR, &crc);
>  	igt_assert_crc_equal(&crc, &base_crc);
> =20
> -	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
> -	igt_assert_crc_equal(&crc, &base_crc);
> +	if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888, I915_FORM=
AT_MOD_X_TILED)) {
> +		get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
> +		igt_assert_crc_equal(&crc, &base_crc);
> +	}
> =20
>  	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >=3D 9) {
>  		get_fill_crc(has_4tile ?
> --=20
> 2.25.1
>=20
>=20
