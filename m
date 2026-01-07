Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04CDCF6BE4
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 06:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D1B10E00B;
	Wed,  7 Jan 2026 06:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXb2x60W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01C010E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767767153; x=1799303153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xb5rMJBA/YcqAMBVNO3+UQOgGt3l8WJK2HWrqO6voow=;
 b=RXb2x60W6CNj5jlTTmuIP3tmmq1LYY4PxWiplE6ONGX5ZJf7HmFCoq+n
 ZgB24jVRHfftAyXkERjFEqMTPd7jv9+5f2t7X8R7UdytJePSmiahwP00L
 VMiDi6wLCC5uPTV4Wf4edUu33T9Qz8oj32Y5Lsw7WjDLUJsN1g1J2xV5t
 O0cMku2gVjdAThSu0gyJXZrr5z+dAiI9FTR3g4fvEk3+2RttWGbsYnafw
 XzWt56XpV8uqX4yjCEH4GTQ5vtdbvAoB+Ebp+QRcnRs4+6n50AcYXsX1h
 O11g+HIX1mLDC+JkDas5oL21zJhGSZbuDx76tBvF1hYpTEY/tcRG+ZshN w==;
X-CSE-ConnectionGUID: ENli7f1tRAWINQOKvsbnlw==
X-CSE-MsgGUID: 2GA8y9XCQ3mbvnQF4WVY/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69181422"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="69181422"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:25:53 -0800
X-CSE-ConnectionGUID: My42wODuQcCW744/4q+qUg==
X-CSE-MsgGUID: FnAue5fnRU+Gox+sGP45bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="206990397"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:25:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:25:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 22:25:51 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:25:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLhZYsiWr6FwLXxo3xbQlvVKkAxHVBBV9tkf3IU8XC+ml/VVHYIPjlUDEsnyTgg27vVPIK6DPmy4XtJ8h9/h3f/bpk7YKagRZVHupBWzhNcQFV/6LkYVhBjShjQRpiPC2zQwr4x0RMw/gR8A1qOWaXVAPYRQm96bQfY5c66xwrRFNUhm4HnCXoz7kqD1rxWyFaQHXdjsWnUnGsfZjenPrPsji/h/5puGzYX+k5h1O/FkFxWfpNFOZyRR8o/UrlkJZv0EgOWwfU2st1jFmVX/VolqNNSCUdi5sVZ6TKlX+SN5ag1vARDsNvVINRWbplyMSB0TYaqS4rWhzQNOnrKfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0eSY/07tY/nd/Q0xnq7zGkQ9aSzM/GpVpdRTVCEF8c=;
 b=Z4Ky1/8SFPqbgsfOOrPTAW+Gt/joeFDCYY9r8ZyPUW1vIuxGtOZV9SXiK26sRBNnKte7qo7MHjFss8mYBmdI74JN9QnboVTTdzXU+68KIydLT/rkVpJEbEkuCxHS0ywoPkn2Y01uJ7AKvcJXTx8KQ3JxZ4j18v2psr1GjMPQJdUR+yWIPsN2pzXJgcuE+KCk7H91khsTHLTLK8cunoCDfaQ3uURQGIK0vqMLk/11z97i+w4cj3QzxgoZSsci7IzDpLJiQKbkhxZYYLkEsdTJByL8TJvXK/ACb9sOiq32PnLVmvxBiud4qqHuqetpSarQO4sooH5+hpf/XnKqkxCr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 06:25:44 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:25:44 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/7] tests/intel/xe_evict: Add basic multi queue test
Thread-Topic: [PATCH i-g-t 2/7] tests/intel/xe_evict: Add basic multi queue
 test
Thread-Index: AQHccN9lwOi0SfQrAUqfPQf15mGW8rU8h0eAgAnTnVA=
Date: Wed, 7 Jan 2026 06:25:44 +0000
Message-ID: <CH3PR11MB8434CB3646D08DBDFE69720B8D84A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-3-priyanka.dandamudi@intel.com>
 <aVW972BYDfDXJMXz@nvishwa1-desk>
In-Reply-To: <aVW972BYDfDXJMXz@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS7PR11MB7886:EE_
x-ms-office365-filtering-correlation-id: 8057c5b4-647a-4f98-3ca1-08de4db5967c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?p/HTOFm/zAGtDeYZK0uPqCT5Pn+9y/4B/QmpPszf5iAJ3piBKjKkKE3fbYeD?=
 =?us-ascii?Q?cMJ0wqAcoLYgOj4WlBww8t61h+jOrGxEzaJD+4IFu2kXUIAeh9l4A6J0Qsjq?=
 =?us-ascii?Q?6sWGgjGs/nHhaOMS5pqOT9e4pPhhE7JxQjzw3bIyRJHoZm+fv6sikQPUIA79?=
 =?us-ascii?Q?asIIKadVymYg0658zymqjE16dE200/AuuKBcz5oeEV72Q4W4WXqW1TnROOe3?=
 =?us-ascii?Q?ED15fgh0CwSpwYP+bfxAJondarxApgVo4DXPvi4hSGEpR3DsNJYe4Zznkhr2?=
 =?us-ascii?Q?zV/jjeDMp9JwLeZzm53d0GN5t8tKTEI1YAt+slDmFWBUD+XZincRvgxEHvhn?=
 =?us-ascii?Q?4SoUCNwYNtdV/Y97R8MjKl2sPirf1ivsVqJFZdNg6fm5aWyClBHhMmtBDe0e?=
 =?us-ascii?Q?IwL4vgjsjtzIG/vUadXtDrILG41CsWiJkT6VWj7TrQoXDSOhQegwjjP4psL2?=
 =?us-ascii?Q?dc8dtLdPYnVLDnCk1vLopnvh8q63l6HsxZucbcbLERs1QD09PDaJppdMX/vj?=
 =?us-ascii?Q?+mv7RvtdohGH9schBmosnltYxDWHq9I9DYKqAvYIH080hnP9JOLu7yskoZZn?=
 =?us-ascii?Q?8v3kltZMEk4rfo/UVTv69PbuqRLOr6HpLtSBcp8sQ77HAoMwsUnb5m/ZQ7OM?=
 =?us-ascii?Q?BgemRhl70zoOprcvO92u3szbO1rh5RgP4V5iuY5Gx7PaA3ROSY5lcczjyyH0?=
 =?us-ascii?Q?oz5TLzvoI/oPXv6ZrYCcSHkW2RgK5zETDYvCMW8+ejvYq73ActZJ6a47S7xl?=
 =?us-ascii?Q?zGvrlENuPdO7JXMm/Nh4mBbR/LQAcZOKxP0co38XFuYvBkIqNAkuTc2DRYx1?=
 =?us-ascii?Q?DHWMx8P3THxrfprWsmn4LtLK6xGhVEFhmUmeeKwwbwyhHWJRo0moxZYD9sNz?=
 =?us-ascii?Q?NiStmAhEILfxJSNtHbwFnMqjUFv88lcNy8cI1b8lf2EywD6DkaO3xRgSbHdJ?=
 =?us-ascii?Q?aEuaMg6ZBe4IRZSHqZkhZcaQ3YB1jXrVOoy6Pin8KrTP7tXNcp1iIzfj6y2w?=
 =?us-ascii?Q?Tf1NHKljszMvIYm3pnom9uxMh6Jv5K5RvR4+B7CM2iip34Gsl7uy5hmrjwhR?=
 =?us-ascii?Q?THaV2+iUysF5ILMhaW9gDPHlZYMnO7QX4AFUIaxXa83P/osMls+tx7cU0ict?=
 =?us-ascii?Q?zfhmpXQw8wM4qSEH3ieySskOPSSbCNpruJ2p+I/uNZzA8Lx9vGnbDSTjwjwC?=
 =?us-ascii?Q?0WMIaow9xy7AWl9pGvjYowDzb2eL25264zbUwpLnwB3SXL0d2HIAFSyr09sd?=
 =?us-ascii?Q?IBmRk/X0mr5E3T3drpMiLSsV1sGleFJTkiKefWU9iC3KZ2reNO32O22oHMdf?=
 =?us-ascii?Q?X+mRuZT+kgUUk+s4ZRfgql7ILD4j3+kB9+uWf7vhTMicwsrI/Pw7bF5+XMNI?=
 =?us-ascii?Q?uYmBZkAhR8THbaTOI89D3oN4lPXLhcRUeLwHbPElLBT1QOSWLusurHqJg/AP?=
 =?us-ascii?Q?TavMNv2nd4QRgwVs1i/KIL5vup73+0yuSr4hmaBvVqCcx6km3QNAg+N5NWmX?=
 =?us-ascii?Q?PIogOBH8SkB+LAhrkajiLyjYqTZiCsGOCMH3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pE9CNurZHSJysEYImAuvwMdhM2kNDkTKveg1QylnPAteTSPT8lGO5vVmvqRs?=
 =?us-ascii?Q?26WTFyb/+dFMPcGzJu6VwrwRe2Mz6BqlIHR9vMG3imoEUHYL2eh8iF1+D4r2?=
 =?us-ascii?Q?nSsaya5SCKbtEx4fHRDXIJfZLBpyk9XJe1P9vJixkFJblo5RTxGXrqYlBAPK?=
 =?us-ascii?Q?wZAcI7w0WhnBVoRkoA/8V9ZreFtsUrKN8uCpfe7nwck2uWtM8c520tXrDCIG?=
 =?us-ascii?Q?vr+artry1pHyfbhw7nYPwMn50N9vnKhqxBM6jsjfjbe1nVTFYZkHlmyZks0N?=
 =?us-ascii?Q?eymwoGV1Nb7yXF5Ly7la4iHMoHsvUI1c76Qyi+30NAOUGcoOdVj0HGCedM6B?=
 =?us-ascii?Q?D01E+Mcf4+lurtJ6RpMjHuHAvC9tl4H+06BjPCXfnnZ5AxYFexeFaLfNiKNW?=
 =?us-ascii?Q?dhH+ueg93rONbO8z2BgItiqEaAV6uk4whZuwvbQhvq7Noo9OeSZMEXpcGqCM?=
 =?us-ascii?Q?BXyMZPRx8rNEJlBDWntWxWL6YWqkp+M+78ow7SxzWh/EeWJZ32b7OCZ5YFJQ?=
 =?us-ascii?Q?i67uLK9UnfyzCUaw5YYA+zM+kd362RPZxWbjbuauMiWWKStt4CE59OlqNDFw?=
 =?us-ascii?Q?ZCcZ+bsk7fnMxBW96r2fh7BLX/IOJnjppa9tamVpq0opodP29Ldwky8VFPGH?=
 =?us-ascii?Q?pBKaIFh5T6cL9fTQ3YDc2RjB9OIC4AHvcchuANYRQrDR38lzAsBNtPtEteey?=
 =?us-ascii?Q?cJcFR3D5eu4m2LWN3yT8aIRRaTi204rBx6F42hi2GiTq3G+y91beRSor781W?=
 =?us-ascii?Q?iwBj+Lhgk45z0yKzyflANfvWL3XEi9DqhX/9jAUsBL/xC/X4QdMUPGaZFBk2?=
 =?us-ascii?Q?etiEcfBFGqV145HPAuh2Wus3CWjX9w88UOj+BOCBd+A+MUyarC/aCnvAHzQe?=
 =?us-ascii?Q?0+EUF2T25tPJePNOTs05WuevQ6PnivaRBfrieevh8CPo/iePzWZTfiFl55KY?=
 =?us-ascii?Q?WgQt4oiYlkm2SDEROSuNg7eaalvdLve6IlJ8tv7Xpw7Qotf3MhhdoF5YN86E?=
 =?us-ascii?Q?I3LsO5hD7YtNfsDzQJIBnVHUqrFvJLFh3MlhBYEVIuiWEdYXtdq5WlozldBi?=
 =?us-ascii?Q?HQAvdxJ3pCI1fmM+6s9jSiMS8jsp8PmxKyitUlBRTsoWXHG8QUwCkM8gqx/N?=
 =?us-ascii?Q?evRgCqRVvRPtwsocvAqUVUBVL5/XweaXDmSCN3aLUyhIgGAPAqQgARM5SBvv?=
 =?us-ascii?Q?Yt5J/64lNXkWvvl19tVKx6uKkF0RJYSDJzLEQqNU6OAwotswbWSFAa9F8jDV?=
 =?us-ascii?Q?YzyudRZKQemcLudPp2gLZXon2zVoNwRvTpIMm9MwdU6wnjwzWB4MscuUEZYq?=
 =?us-ascii?Q?7XXenLDhQ2DHB/UfjRuStD69bVkQlcnwV7KTb9y7DfEFEGSoKIYfB0+a6Rt4?=
 =?us-ascii?Q?36xYy31v3K6zt8TOcd5mIKFNbaZe5bGc3DGoExXC9zauiD+SvefAtQYecggx?=
 =?us-ascii?Q?HM5e3rACRrcd1oVhGKjbM+F77JVNcF2RejkWaKQM70I8o885sT4tdwi+wPX4?=
 =?us-ascii?Q?vyH4knWy8LHSdyKpUFIXi3QuNtPc2dbM3ZXFYpjuUtksDLyEzrtinogMcFdZ?=
 =?us-ascii?Q?kTp5wOxB8jmHF9jH2uUx/SZ8vgltFKX1XZYU4Wt6MrI6rYbScLr6IwFHqYCg?=
 =?us-ascii?Q?8oOOW/zQDUp1N+ILUJ2BNN0/BpRyLrgwDSMbIG2qSjhV56XSGKFZPyme+8HB?=
 =?us-ascii?Q?JrRMEzOIHK5aWJyHIffFTN47bsHHDpE1RjWjJiwPLbXKTZ2LKEpxf4tbhidg?=
 =?us-ascii?Q?kLXerWr2wLmv4m5UdLFFiHUS0+63O5w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8057c5b4-647a-4f98-3ca1-08de4db5967c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 06:25:44.2062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IW9dfZyaC/1sLSm9jEN8YlOfxzYiniwlQTKkcv+liNi/WwSTMKGACenXbARhB1wHQlRZRREygFEGXPAi0JZ5uTwxmiYofN2i1yjHeiZYOzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 05:51 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 2/7] tests/intel/xe_evict: Add basic multi queu=
e test
>=20
> On Fri, Dec 19, 2025 at 05:31:49PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> >Added basic multi queue test for small buffer objects.
> >
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> >---
> > tests/intel/xe_evict.c | 62 +++++++++++++++++++++++++++++++++++-------
> > 1 file changed, 52 insertions(+), 10 deletions(-)
> >
> >diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
> >2350487c8..a62230ec6 100644
> >--- a/tests/intel/xe_evict.c
> >+++ b/tests/intel/xe_evict.c
> >@@ -29,6 +29,7 @@
> > #define COMPUTE_THREAD		(0x1 << 4)
> > #define EXTERNAL_OBJ		(0x1 << 5)
> > #define BIND_EXEC_QUEUE		(0x1 << 6)
> >+#define MULTI_QUEUE		(0x1 << 7)
> >
> > static void
> > test_evict(int fd, struct drm_xe_engine_class_instance *eci, @@ -80,7
> >+81,18 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> > 		if (flags & MULTI_VM)
> > 			exec_queues[i] =3D xe_exec_queue_create(fd, i & 1 ?
> vm2 : vm ,
> > 						      eci, 0);
> >-		else
> >+		else if (flags & MULTI_QUEUE) {
> >+			struct drm_xe_ext_set_property multiq =3D {
> >+				.base.next_extension =3D 0,
> >+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >+			};
> >+			uint64_t ext =3D to_user_pointer(&multiq);
> >+
> >+			multiq.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1,
> eci,
> >+							     ext,
> &exec_queues[i]), 0);
>=20
> Do not use name 'multiq', instead use multi_queue to be consistent.
Ok will add it here.
>=20
> >+		} else
> > 			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> > 		syncobjs[i] =3D syncobj_create(fd, 0);
> > 	};
> >@@ -259,7 +271,18 @@ test_evict_cm(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 		if (flags & MULTI_VM)
> > 			exec_queues[i] =3D xe_exec_queue_create(fd, i & 1 ?
> vm2 :
> > 							      vm, eci, 0);
> >-		else
> >+		else if (flags & MULTI_QUEUE) {
> >+			struct drm_xe_ext_set_property multiq =3D {
> >+				.base.next_extension =3D 0,
> >+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >+			};
> >+			uint64_t ext =3D to_user_pointer(&multiq);
> >+
> >+			multiq.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1,
> eci,
> >+							     ext,
> &exec_queues[i]), 0);
>=20
> Same here.
>=20
> >+		} else
> > 			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> > 	}
> >
> >@@ -516,6 +539,7 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  * arg[1]:
> >  *
> >  * @small:			small
> >+ * @small-multiqueue:		small multi queue
>=20
> Same here and below. Use multi-queue to be consistent instead of
> multiqueue.
Ok will make the change.
>=20
> >  * @small-external:		small external
> >  * @small-multi-vm:		small multi VM
> >  * @beng-small:			small bind exec_queue
> >@@ -546,6 +570,7 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  * arg[1]:
> >  *
> >  * @small-cm:			small compute machine
> >+ * @small-multiqueue-cm:	small multi queue compute machine
> >  * @small-external-cm:		small external compute machine
> >  * @small-multi-vm-cm:		small multi VM compute machine
> >  * @beng-small-cm:		small bind exec_queue compute machine
> >@@ -678,7 +703,7 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  */
> > int igt_main()
> > {
> >-	struct drm_xe_engine_class_instance *hwe;
> >+	struct drm_xe_engine_class_instance *hwe, *multi_queue_hwe =3D
> NULL;
> > 	const struct section {
> > 		const char *name;
> > 		int n_exec_queues;
> >@@ -688,6 +713,7 @@ int igt_main()
> > 		unsigned int flags;
> > 	} sections[] =3D {
> > 		{ "small", 16, 448, 1, 128, 0 },
> >+		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
> > 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> > 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> > 		{ "large", 4, 16, 1, 4, 0 },
> >@@ -713,6 +739,7 @@ int igt_main()
> > 		unsigned int flags;
> > 	} sections_cm[] =3D {
> > 		{ "small-cm", 16, 448, 1, 128, 0 },
> >+		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> > 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> > 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> > 		{ "large-cm", 4, 16, 1, 4, 0 },
> >@@ -820,6 +847,9 @@ int igt_main()
> > 		xe_for_each_engine(fd, hwe)
> > 			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COPY)
> > 				break;
> >+
> >+		xe_for_each_multi_queue_engine(fd, multi_queue_hwe)
> >+			break;
> > 	}
> >
> > 	for (const struct section *s =3D sections; s->name; s++) { @@ -829,9
> >+859,13 @@ int igt_main()
> > 					     1, s->flags);
> >
> > 			igt_debug("Max working set %d n_execs %d\n", ws,
> s->n_execs);
> >+			if (s->flags & MULTI_QUEUE) {
> >+
> 	igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+				igt_require(multi_queue_hwe !=3D NULL);
> >+			}
>=20
> May be also assert that s->flags do not have MULTI_VM flag set.
> Same applies to below sections as well.
>=20
> Niranjana
>=20
> > 			igt_skip_on_f(!ws, "System memory size is too
> small.\n");
> >-			test_evict(fd, hwe, s->n_exec_queues,
> >-				   min(ws, s->n_execs), bo_size,
> >+			test_evict(fd, s->flags & MULTI_QUEUE ?
> multi_queue_hwe : hwe,
> >+				   s->n_exec_queues, min(ws, s->n_execs),
> bo_size,
> > 				   s->flags, NULL);
> > 		}
> > 	}
> >@@ -843,10 +877,13 @@ int igt_main()
> > 					     1, s->flags);
> >
> > 			igt_debug("Max working set %d n_execs %d\n", ws,
> s->n_execs);
> >+			if (s->flags & MULTI_QUEUE) {
> >+
> 	igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+				igt_require(multi_queue_hwe !=3D NULL);
> >+			}
> > 			igt_skip_on_f(!ws, "System memory size is too
> small.\n");
> >-			test_evict_cm(fd, hwe, s->n_exec_queues,
> >-				      min(ws, s->n_execs), bo_size,
> >-				      s->flags, NULL);
> >+			test_evict_cm(fd, s->flags & MULTI_QUEUE ?
> multi_queue_hwe : hwe, s->n_exec_queues,
> >+				      min(ws, s->n_execs), bo_size, s->flags,
> NULL);
> > 		}
> > 	}
> >
> >@@ -857,9 +894,14 @@ int igt_main()
> > 					     s->n_threads, s->flags);
> >
> > 			igt_debug("Max working set %d n_execs %d\n", ws,
> s->n_execs);
> >+			if (s->flags & MULTI_QUEUE) {
> >+
> 	igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+				igt_require(multi_queue_hwe !=3D NULL);
> >+			}
> > 			igt_skip_on_f(!ws, "System memory size is too
> small.\n");
> >-			threads(fd, hwe, s->n_threads, s->n_exec_queues,
> >-				min(ws, s->n_execs), bo_size, s->flags);
> >+			threads(fd, s->flags & MULTI_QUEUE ?
> multi_queue_hwe : hwe,
> >+				s->n_threads, s->n_exec_queues, min(ws, s-
> >n_execs),
> >+				bo_size, s->flags);
> > 		}
> > 	}
> >
> >--
> >2.43.0
> >
