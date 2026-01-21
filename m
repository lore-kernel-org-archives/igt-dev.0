Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77DCD262B0
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 04:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893AC10E0CE;
	Wed, 21 Jan 2026 04:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqH8n/83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A404210E0CE
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 04:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768971507; x=1800507507;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3IeRV1DWGRNs2MLJTaFA7w3+021hipvNTXkwLLbrklA=;
 b=jqH8n/83ALjR7m5J0suhfIGMBGCq7Mg8VPMYl8gm/FWiW8uEGbxlAxKk
 kJLCT/lxz8FVfTOu8gQ3AaMy3HEbr4YF9dTeXvE6u4ukDyBqWdHA4/M12
 BRS73v4LXr7IcDEZLPrM7hjE8mjuCRdql2UsJzFDrW/kD/ads8up9ojIf
 OxVraHbe8UP4+Rhpk3fFud5Whl5fN3Ha1JRHKsKTi2elOpJS/2sEY7rdY
 mG/bYX1oGMaTrKWtEKc2KzrnauqrTZ8ajoMGyLe6J/ST2diAgQhTDsWqV
 fM2ruwLOMDuvzGL/Vx29WtiWZk97sUKT7pxvCcstMnJFFAIz957WPev6X w==;
X-CSE-ConnectionGUID: Xvp3hx+OTkSPqvRPUiSkWg==
X-CSE-MsgGUID: orJD20wCQGqMid7FcjuKww==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69390513"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="69390513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 20:58:23 -0800
X-CSE-ConnectionGUID: t0tF07lRSUGkpHuu3iPRpQ==
X-CSE-MsgGUID: fUPk00MbS0OVFMMl5FrQxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="237589474"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 20:58:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 20:58:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 20:58:22 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 20:58:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGO3xc9BMTEp9L09QJhiUCQyr8PcmHjk6tNtc8sCExUAxF8B05CtYtwBB8w8pQCHzJRoCiurjj2nuWJoLkt8+/xsBUb2xpxquU+8967/l/1N8tKCtPzVcrRQYQmQL0fYAHNMHkHiNxA7apzw6SItYWpFvcMbJfmDaJjrg2AtDtmHR4O3W6bIFiMrIlHBRRkMZH+4/PJGMzo3iGpHUDh+6wxc7FQgz8V0ukpjY0EZgjr4sB19F1krIm+nh3PR6nKX97I1ajGI8XAJvqdNdqtnzZMeX+ImT3DUdC9jS07FeonuCvaKmH0YdFaKiuSCJD+Ls19XfYRdcbevVqTaLPkF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQMZBATDouiso1uesUwkr/ixP/1PUtDKkDNN1hBrwH8=;
 b=ANg+88P/Pr3p3Ex92THeP6c0ue9t4j7reJ0/yJJM/EmbLP/F7RDdJ1VmhK5Y67VPlfnaZYOhmDnqxYPplJWJLb95k89Yw+KjsrvzeDBDl8B4r12Lr8p3/jFT6YkB2wI9tp0OfMSN2PsJFotdAQ+GSZUTvPx19aytYyiy49ttz8A7V5zbVNDAC8UY7oe35uN+3h3VCHIEb9xxq/b6gCjNUST+l5PHpV2C6FdUp4kzgqG/Il0NIzAm0jK2wcYaQUmRSE0n6FxED0142289EyptAMvFGhMT6F/PZI8fCd3BDJDGXN18stCVrkYfi90F8KoLhs4Mn2tOIpP7gAZCLDBjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 04:58:20 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 04:58:20 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability
 subtest per output
Thread-Topic: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability
 subtest per output
Thread-Index: AQHcimq5hEpvM5/ggkOTMD5OCQrYiLVcCpeg
Date: Wed, 21 Jan 2026 04:58:20 +0000
Message-ID: <PH7PR11MB6796402811960601C074E56CE596A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|CY8PR11MB7084:EE_
x-ms-office365-filtering-correlation-id: 3c1bb1ee-bb44-4fad-d2c5-08de58a9b2f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1uK+lKCCBficyxkqtkdWur9bYHRyRxGGZCq+yWVCq9iifhRuVXkic8yge7aT?=
 =?us-ascii?Q?5Wwlv2wqPqbNJNeydMSFmPBJcpWtOArw3ihCme9SfEZD3jUoFp7IKMl14HQx?=
 =?us-ascii?Q?5NrDLpUFJfpqZbHsMtjg1/LyDcxwpMulVhK0DRBzqDRlNir/CsCZWiEpDXh/?=
 =?us-ascii?Q?uSQuVw8xTFId0bUkbjiD8hTMlpZrTNTC6DycnUqDohxzf3ok5ooow2PMymFd?=
 =?us-ascii?Q?JoHxcwzCZYKyw2exT+VkKKlHQhnnDea+Rn6o9nipJc+FhiY1anPvh9z2x00+?=
 =?us-ascii?Q?PCkKcqgy0PJRglcfkj+DMFNkw/7dXne/Webwhncb3nSUz4uN+FHLMzlXlSg1?=
 =?us-ascii?Q?fK3WMh5C7WKbEJaY9AHMUQWdL7pEexSVpIAy9EkIpK2e4Wekqq3YlxReyB2E?=
 =?us-ascii?Q?dSK7k7hey+G1gwNlJHQeRkw5i/jDZk0mVHsZ1gXIYtVEKUF3CEAJsHRaIaot?=
 =?us-ascii?Q?nKEXNb9mj2nMCgiaiHjBtZFZE5W7XLEY26nSt8Qt02vFiINkuAsHkqRSC6e0?=
 =?us-ascii?Q?B6PWW1lagM0JHrw9TQCTsDHglEIy5pIIBUuezYvxBWLCT/EOSMOYjlh1WQYy?=
 =?us-ascii?Q?BD8LIiQk58DWE89bZcVlvNPcto82rcxPLKgeTHhhx5xFwKNL4b+EoOpJzYFb?=
 =?us-ascii?Q?0VAvZD07fWE9PigmHHGjXFo7S1X48ABC7vzOidzg9uSzH7lmDM/u2NvsxIsD?=
 =?us-ascii?Q?aqR76+tgX7FCQGz2os98EKVv0cEoQQUcUdpuP9keslJZbGytjzXRBHEFp8Hu?=
 =?us-ascii?Q?ENo1STXdClY4t8aRqo8QB2OtjBt+aCwjc9BDOzT++UP/Pg7Mg0J5eb4Qr8Q/?=
 =?us-ascii?Q?kr4TzbLodQiHX3lAYV+YEldmOhuy1IH+3cM6aEnkNlCcTU5P7BZfIiTpcsYl?=
 =?us-ascii?Q?WpTpGI5QzY9wM8wzGLcaTPc6Ymo4ItCuECLVExCv8aGnRDIGmDcysQkw23Lv?=
 =?us-ascii?Q?NrzZgPyP7WuF+Ei36FuR2fOU4zLfxulXyGxMlYvb3LofwXBN+Kzp4IhjZVhX?=
 =?us-ascii?Q?6mttciuo3axbxWsZ6L5zrxcEZ8/dbWFYsKcUvR93z7bi3cQJyh4prmiItCp+?=
 =?us-ascii?Q?p10OkJwP9U2ovEMbsnBXrxismrvJ46KLB70YBinEnY7H+pN+mvW3a2e1Aaxx?=
 =?us-ascii?Q?dEE+gr1PdQ2u7XPo0pyubT6drNTyiF+OEmh7cR0jrsdOg4yF2tBAp+7JRSKF?=
 =?us-ascii?Q?0mE5Eh04sN6VMPbFKYSvUyFst62hNdcTsN7xP2EYFe0vDcvhUJwrdpMK4rVr?=
 =?us-ascii?Q?g4zgUCKq5uyEa1CtY3TL816m+Ee74ZI7TnvqyAQmY7BZUxwF9PmPHkkze6Hx?=
 =?us-ascii?Q?IHvfa3Lyagw5bSnFeiQ0pUxMEEZvSZqdzEeeIjbE27SEl49Vh6nlO+RAncLK?=
 =?us-ascii?Q?GtwmLFvqmcI5qEnmWE51V8V2kgn7xb1rEezNs6Usp9RgsZHOhvZMpnT97wvm?=
 =?us-ascii?Q?/6ww6f8Df5mCcZMAQdJ6fxS52t/2Etk9SsSlnNKwrNcy45nnDL6c4Mf9/DyE?=
 =?us-ascii?Q?c2cJyGej8lB7gek+A5idyF0DOyg/x0DhzbxfGKVuXGMF0zIfzKpMowGrtenk?=
 =?us-ascii?Q?9PD9fHVnAY8wIcbNTCwT2qhLaP6JDGgcL+xrdFRwHCQ1vJpnwQUKRZ7pS8AH?=
 =?us-ascii?Q?wlYVGN9YBJzSRcuQRhFDBaU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DQ/MvKsa7tUoMae+JEjVt6yXDBopqkjlUxMmpGie43vx2JbPt0xKLJkCUO3h?=
 =?us-ascii?Q?iiA0wtRcwGD2SS6ORcdMhbYaGYkFoqTuRbrUWZ+wsw4Q3XYByOzkMtXCWClC?=
 =?us-ascii?Q?+YV6ImQxcEMbMQdN4Oj8K0RjBnMz58aMtUgXWRHSZ8xbru+8wrz2dAugzL9y?=
 =?us-ascii?Q?5qsqYcEUboS8Wqh/yQ7aljZIF7A16S28vNDrJif0Xq9bvCkEGUAbllZMGMk9?=
 =?us-ascii?Q?Xf6iRxEYSnGbUBEF01FLY1aRuJP0DwFGl0IqfG4Y9B1UZjfnY4bNYmHCmAsy?=
 =?us-ascii?Q?/GVlkYL7TFKsOyX8tkNAP65e0MWT4ZVoEmijuNx5q3w2E0QqFp8jGjZ/xFO7?=
 =?us-ascii?Q?H38iCzUMGNRzDGF7YIIdcp0epATIbe0+EgBclA+AsLCv5TLzFv5t5NFXDH8E?=
 =?us-ascii?Q?UMgfAdp5JuzHSHtZx2qPwkOiNvnX/AcjNZ7+vE1y3I46a9cbgOluN887dKI+?=
 =?us-ascii?Q?3Nqb2BXvpAAfYqsZE/xxqFUNitPXEHFmDe0fLEEWulBwKvogeq02jdxi0wOr?=
 =?us-ascii?Q?1KJm1XgcqtEI7ZLAQ4l7ScKh26g8tJOv1tYT35VidluJHK8022c4WKy4NlvE?=
 =?us-ascii?Q?/i1HvB1r9xG2eO992oCFTwRXRiIQWNdT+77PRQjGtz80oKfmSuCJ2Z3H3g93?=
 =?us-ascii?Q?FTOdzyUA1hsX/GPgu+INNtuG5AHuVGH6/08NpQ6FwuV2tPlhjXFHnD57CTgp?=
 =?us-ascii?Q?qjUSNe6Rhgi8WDNKF0jIVn+lbaDal3SdK9fSJVuyvyvbNTBDuMyf+6JT+khd?=
 =?us-ascii?Q?dtsEQ1dYnSDuD4JTHJxHwXTuDV5RnzmjwYvYDbqekC1/yVdSPCRYuWdJC/K1?=
 =?us-ascii?Q?l1BjhABsAqZuTm/l8HT0Ng5NWDqO1DCcQJ2vj2tqlJMCrT1TRrTByuXQ8Nd6?=
 =?us-ascii?Q?dlN+kb1p/J/E2pAIJWsiCI3cuertnHtn/T9GNGsBUgYeVea2KlqqYjF4HmVd?=
 =?us-ascii?Q?9Koiz0njFM2Yx+WKkheSLXasdyGxrmCuxnNgktkK0gGMJkYvdqDOdFLiTbiL?=
 =?us-ascii?Q?ayzQg+XNeRpj3bGhdA9c8/ikiriZTiak4gNVgVsHZXmz4IhfG3O4EYOVscz3?=
 =?us-ascii?Q?NF/YDzgKkB5FxUT90CRpG7aB+trBgDtKa/g7/pjVlSrVWgyla4ck/jwPRdM+?=
 =?us-ascii?Q?ZFEnGbxsfPyhPSd+Cym3M85yQqOKn+HeLGWGVWbSysfwJGF/EuYkTUDsmMy3?=
 =?us-ascii?Q?RHCXeeoajv1/w+Vz/L9nKOn/0QOC3BOE6/6AoPVQqNvXi/qwQg6/9vGmyRPd?=
 =?us-ascii?Q?Br6JQXGpdO/yC0Q0KtEWVGyH2cXlK4R77HOcR2a1SAtlgk0hrACVTYpDi4HG?=
 =?us-ascii?Q?9C2725g9VcyDlEBSgDuz4s6kKAs6+x6+vwk02bUMKV0UVa13us/pPJDkOg3i?=
 =?us-ascii?Q?aglaqCREX+MrcWyh6Yn+srLMU/mQHpXnjAJfxvimaDkDEpbNUjUYfi/2x9aL?=
 =?us-ascii?Q?PdgxLlZGB8ipctzMs3oGyCDvHD3e0Sl5dBKTMn8ZTVZBt1dnlsmuX8mmbwoO?=
 =?us-ascii?Q?DVkBFeucGogA7g0+5oYwRtIWIydycn40SzfNX3O2i1L+stY9WkCGGoH4XIOJ?=
 =?us-ascii?Q?EUV+N9FCnVmBu6OR0BAf/ZKpBY7K7B146LRsoWK8NrvmLdvEdbHjrTGrfCV5?=
 =?us-ascii?Q?qtYxqjp9uGnBi3ir1dX4MczDGhzfPGTg+3DwMWzjhUvC6vDt/4tq3ha6yidf?=
 =?us-ascii?Q?mFg6JNov6sFUZICR1KX5ZkzklVUZbyCTP9isaoBjWFIwmiiR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1bb1ee-bb44-4fad-d2c5-08de58a9b2f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 04:58:20.7953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRQnkhYcriJv1apbsVZNRRzzvj0a/+KfHOKLnyVGeHrveXWMvsnQJW2pizODKy1cRYny8RqNToH0pmigcw1F3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
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

Hi Ramanaidu,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: 21 January 2026 05:43
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability subte=
st per
> output
>=20
> Add a dynamic "vrr" subtest that checks vrr capability on each connected
> output, skipping if the driver or output lacks VRR support.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_feature_discovery.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.=
c
> index da80ecf66..bf36740cf 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -60,6 +60,10 @@
>   * Description: Make sure that we have eDP panel with PSR2 support.
>   * Mega feature: PSR
>   *
> + * SUBTEST: vrr
> + * Description: Make sure that we have VRR support on output.
> + * Mega feature: Adaptive Sync
> + *
>   * SUBTEST: dp-mst
>   * Description: Make sure that we have DP-MST configuration.
>   *
> @@ -155,6 +159,21 @@ int igt_main() {
>  			igt_require(psr_sink_support(fd, debugfs_fd,
> PSR_MODE_2, NULL));
>  		}
>=20
> +		igt_describe("Make sure that we have VRR support on
> output.");

Use igt_skip_on_f, so only the current dynamic subtest is skipped, not the =
entire test.

Regards,
Sowmiya

> +		igt_subtest_with_dynamic("vrr") {
> +			igt_output_t *output;
> +
> +			for_each_connected_output(&display, output) {
> +				igt_dynamic_f("%s", output->name) {
> +					if (!igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE))
> +						igt_skip("Driver not supports
> VRR.\n");
> +
> +					if (!igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE))
> +						igt_skip("Output not supports
> VRR.\n");
> +				}
> +			}
> +		}
> +
>  		igt_describe("Make sure that we have DP-MST configuration.");
>  		igt_subtest("dp-mst") {
>  			struct kmstest_connector_config config;
> --
> 2.43.0

