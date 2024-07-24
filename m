Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3969EC3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 05:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8224110E00A;
	Wed, 24 Jul 2024 05:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlrhNsXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FE710E00A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 05:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721797947; x=1753333947;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eSD2oH2iXbOMGVJNAVjp0GQq93DVxHRk/hQBH5VqEDc=;
 b=SlrhNsXUi9TUcbaVhLcuSQUpVQORsFAYRC82Bd3hmopfuH4kVwdXVFsa
 428s5z8oDDwyNwLKNBGhyn1me43nE0jHIgdtoEmMKOu4oIXf0KYYzglk3
 yYyL6gJk+3TbAMzSYxZkWMZFawgQP9X730yrG/eNszPuzsh6srBidjqpp
 Hk/L0UWVNmNGCU6o4hTddhtrH2wJoYe6i6J2uTqgim0ziEIw47srbaMAj
 uzHWl1dRpZrNPjz7QAcfelzB8qmx15zPVooue9dLJza1cniAK0pLtlfUY
 opQNE30N5B9W54utuKo29nSUHZyDhX73Zdmq8IWWe8zdsmr12hatWEGm2 Q==;
X-CSE-ConnectionGUID: 4UkG8x/fSZygwj2u2Mr0uQ==
X-CSE-MsgGUID: hU5HIcXrTMub+4pYcpw++A==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30042713"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="30042713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 22:12:27 -0700
X-CSE-ConnectionGUID: q4WuxsrbQNCMUbPEjMexSg==
X-CSE-MsgGUID: guX0OPbaTByqGlrgUDCP6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52489619"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 22:12:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 22:12:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 22:12:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 22:12:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 22:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qh9nbD284YUNDMNgGCIbV0PQOmoQMDFPAFE1PkD/8hcIL1Wdnx8H5Qk8dCOlYS23h4E2L88BzWt9+YXi1WX2qau6hyEcbbESo3yBTRVL+zgmrnMuC5PaNJ6s0B7NXqOl6pyptfdrFgT3FH4jK9zzJEpVA4gkApbBP+P6OETbRH/ySsBcosr5/qK78786OavkdTJj+WhO7f/A8pu/Z6EBjlI41hadGPxDRSz2CODl/eQXyDkbIsdDar9QSCGBCIyEPFAelJY6XnbAcPx//bIDNQj25NSvppZxX6qwvyPhjftv0vqMirVIXjKLdfu/veyg7PObqNMCDMTLxM84DDMYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKdXttJOty3h1oknJfM8NkaRNg28RQi1Tbx4aoqSNYA=;
 b=FybO8RgXHiZSTJqIAdppNTd+mgIVVeuDjxVfta8xQIgiJ/yspDF3X+R8U8scHtKg3j0/doWeBMt4yqEH3PZafotdL89m0DxJDDPz+t+FkClAd/KWfJZZRTqsph9j8a31voYceYF7+aBAUQ239S/zeRhiPdmfYcJhYI6XSiiRVL3gkk+ErHi05LyuhxdxU3T45bIteXmXvvaUVNNauuv5bVchHkS40u6buc45qsLWUuwvg6xys4lbl0uQP5V7jiB4Sf7EJOd1ocphYACadiXwGkmG1X7nhyZk9UEVqikx4yI8G3SPRN6lUTF6E3/gH7W7nyvaj8CwHr+kKGU4+X/oAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 05:12:18 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 05:12:17 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] xe_exec_reset: Enhance spin test
Thread-Topic: [PATCH] xe_exec_reset: Enhance spin test
Thread-Index: AQHa1KgtJaktxCjuqkCQNdsqDPwkWLIFZpxg
Date: Wed, 24 Jul 2024 05:12:17 +0000
Message-ID: <CH3PR11MB8434BA20A26B4078DC557CD88DAA2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240712221001.1279651-1-matthew.brost@intel.com>
In-Reply-To: <20240712221001.1279651-1-matthew.brost@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW5PR11MB5812:EE_
x-ms-office365-filtering-correlation-id: 5240ed6d-e071-4b3f-5fda-08dcab9f304f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BQ7okqgj1P/Mjw3TuGMHsnl+UOTIdRyRsCeCuPmV7moe+VXV8UTWs5O33yUO?=
 =?us-ascii?Q?gx1FgtIcjup2v5OlxmbG5mqoQ3WJLonXhBe2XCJTtgrqw2zNcZbNsDIuIwz2?=
 =?us-ascii?Q?IqLyf+V0HZBBX+xiUc6hDAETtnuhZ1jcYk5dvoHjTs11n/5TuWJskExBc/MO?=
 =?us-ascii?Q?k7O0M895RbjBmPKQZ2hB2mqSAQKA5ve37S2fd2lc+VLB+38GTNRLI1U3gWRl?=
 =?us-ascii?Q?4sqBvQTC57quZXwCFg1r0EgpPcjM1G3/TuOMWjvTDXBsNqGYzKG69P/LJxmu?=
 =?us-ascii?Q?JbVZBCgPQ/9MYzclZMlnvadj9jiV72fegj4jUcfysue/oO7/lWk//Gg3lYu8?=
 =?us-ascii?Q?C9s/WyXqcJ6K3qdqR9LB1NwgCJlyN0f3Uwx89ePeSMPpm8A+AOPdQVkdsCHH?=
 =?us-ascii?Q?A/dvnl93mNx+hVZZZq/hEjD4Cy4UDwLjb4/+HP6zPxk/C6IPW57uoVNICFBF?=
 =?us-ascii?Q?8V6NPSpezHeaokLgO43HweXM9hnJ2zAkKZl5jn8x4MrBfJoafXtOsqKpTL4y?=
 =?us-ascii?Q?j9CT1j9rGIJExOaib+QPC74506yBAtp5VhXEAV+PV4DAb61Eiw31k51xpSd1?=
 =?us-ascii?Q?3xz2IfNo5N5b9Q9uftvKW1/8AFk6cKtq4r1qjDShMXU5e3oI33mnHBWrnN0i?=
 =?us-ascii?Q?yqgnkXZBWiVw3jIMeHxt193NZFykBdLNb+R0HK8S/r8s4jXl16aWaheFPJcf?=
 =?us-ascii?Q?UNcmaT4XxPBSAWiMAFoTyPadg3R+FJaRmHczFHFHfeAJe5IMTpDD9ofzLgtN?=
 =?us-ascii?Q?PdCRSHVg17tEFO3oLfc2Jg8FEkeerkB7M8i44vPTE7hYCA2sNqg+JlKcSl2X?=
 =?us-ascii?Q?eAhhSaU9tHPHd5nC4ZbDCdF4/LfGAsBzFVGSmPLcPiqcnx50L75BRgqE6xZw?=
 =?us-ascii?Q?cGTw4DwyyIAR+FEc3PQeQ+vSgxb7HPMTMP5WYSKFgw3EosdH35GhpGiNLN2t?=
 =?us-ascii?Q?FvOHR/ISvz5H8fyW/VKUhVdOKFIhyCoKyDT7xatPQUmrOdfvgZsi3fLVXk3h?=
 =?us-ascii?Q?YJzFvrvk6VxeQ0XtDClvbqoWirxWIwlkHmQ4rCUUpkL8yN5I+DHAGf5eL8Vv?=
 =?us-ascii?Q?M8z3U2brRXOqEWXWoi3ECoz1hyEGdAaPVnCL9ogwwcivy9gPsH3cyGlo2/GP?=
 =?us-ascii?Q?VcOtmCaMreWkcJ4ey+vMAqvafV3Xa6dQry5+NTr/6IbgbjeaPhL2xE4RY/p7?=
 =?us-ascii?Q?AMSSuoN1fQAbVhNCUWMwIsGuUu1unEBSYfI/iqir1RxpdxcLEL31Dvggm4Of?=
 =?us-ascii?Q?KRhUDf9O/43eRm5wNvOAo51yeo//Rs8BO+wohWkrk2UW5BBirp3lEApXsPbN?=
 =?us-ascii?Q?uGbu7Qyq3OtTLgKgQI4uKshEAwp7FOqcm2hlbXY/kg5eNhgP+Aaak0ME6sPE?=
 =?us-ascii?Q?aAGLMGB1FWey4fwrIa+PBjylkLrB6gw+0/KmpG0Bq2hTuxIgOw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T1I4X3ccDA3uRgkrrOAOEWPOe0TejG8RsqdLZMpzJI+nJce5/h9FqLUYaG35?=
 =?us-ascii?Q?sgTeKvLZ58g0FNwPS+5zgK2f43Zjb9XUexJQA0Alm59bwtvQWK009V1OECU0?=
 =?us-ascii?Q?hIzDYggB7DliQxFwuOIz/rkno3MFuKPTormWgxYm1EJecDm2dEAq4rcJqDr4?=
 =?us-ascii?Q?uhvReCjrwZznnNC4L0jdFbVmMOVhPB1jlOQ+1Dg6EcQejJt+1UngNcumjtWS?=
 =?us-ascii?Q?0vV8Qh1rKf1GbOK0aznmtqQeGb18+15bG3/1BtFyGxiVf1xcR9cvwFZ5sG83?=
 =?us-ascii?Q?KuiRU25gszPa8cs7m66kfBKebtxJWGS4NkbVygzuYwLpmIS7uc2/HZNTXNWD?=
 =?us-ascii?Q?pNc/66BTl99tQcKMKsS2ex1hajpzjWvdO7nei4HMmoq5ZicdnpuHgjQGYGEC?=
 =?us-ascii?Q?bfAViq01b5zLm0U4cK8raN12nsTdvEe8ziCnzk753tctMOn36Hm0EDvLrGR4?=
 =?us-ascii?Q?6I+kKqXRD1ReqiD7LwJeLxrgWwM+vG3PBQkp1MN0VLDq+2mNMHmAT51m19av?=
 =?us-ascii?Q?XQWE3pQlwHVcWcKi499Ds6IcZEGpL3RyTQTi/i7sQ3y2I3N3pFnmxeAf2cWd?=
 =?us-ascii?Q?1mkN0zOjw6rQj6zeeM7aPPpAqBziPx5WyKLfrFedXdBX1L/CJUYQ02JTsHMb?=
 =?us-ascii?Q?K8SiO1NnlOmcGQVo6PTzr7yi+QeXXy6nL/pzwv3xb83sEny7pn78b28X4j9M?=
 =?us-ascii?Q?Y3k3S6a3W3oNUUnCEZv8YTfyCsGN8vDcL+eQSUhyRvdnVTRSSWKZ3npQOJYT?=
 =?us-ascii?Q?vH1upwSRnN4HCG2AHYW7gFw1RVqjwF0ssLi/VXeaxQSS8o2AytX3o84qLvcv?=
 =?us-ascii?Q?40lOQFu5taBDNfyaXureldw3i/op9ObPlSMQ3C28Z4SbCAzCTyHq7J3kdgfC?=
 =?us-ascii?Q?WcyO8cDOT+pm3DEh3F+3E1E6txd34AibY5U1rrXlhRtezGz49bLmQoS8pyxX?=
 =?us-ascii?Q?Io+9xCDR0wAoZOwLFVYcMEzAxwRM8I19PI3ygW9r5+ceVPWjyGDMpnrvJj50?=
 =?us-ascii?Q?V+SC8oWu0QyJtzO8wF/VoZ+YBKXW0N19Udn0FkPrP8NfPF/g26lUydzgRei3?=
 =?us-ascii?Q?H1h7gKNL4/xgkg3cQR9gKZOxUeF1fXP8bXZVN/ldp2dFg4FEm40wMZBJXRJS?=
 =?us-ascii?Q?GqRp/uoQYPvM/VVnc4uzGWjmEPUcoV2tdKy6WdtDev5BF/RZS8bdS1LLMzKM?=
 =?us-ascii?Q?BinS+3egG1Wht+pdjisi2zdN3XVQnlWJ6oufTL++HBOhlC8fKfDyLOTD9JGe?=
 =?us-ascii?Q?L6B3ewzdwCGmXlNBLQei8bWzCyWBZmT83nftG+Cs0sm3+7zZLASE7HQGnFQI?=
 =?us-ascii?Q?lf0QeesLE35P020Cw5d3ew4QfE+yLoFTgQITDnwAj/i+FnFqc3VKMX7xL1Xf?=
 =?us-ascii?Q?vtfwzQL0rDdJV5XlCKpOF1E4wUTF4rKVSwL/j8oudHpKkird5ZKNCzdQ36Ih?=
 =?us-ascii?Q?67JUp+zKreeljGj3U3sHYWsjXa9V+jiS1BsPiBtcSfj0lzwgZOsroYzHY9Ju?=
 =?us-ascii?Q?XBlSQxzHSPyo3JrEqvVek/4rd/Kl+zyFcFMwqJ6ZThe4BLpeiGjWCIOZKjd/?=
 =?us-ascii?Q?8tEIjV3PV/aVNt6j5Yg8wkUY3NE+lI6V9ZIDRxWJhzFPK9q9LqyH+kSkr6l7?=
 =?us-ascii?Q?xBuiooii8qeCjRRe/uOgCojomgXH6X4P5j9LSK6pvDoJHUkUUuXLV0m7DO+d?=
 =?us-ascii?Q?mHKU6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5240ed6d-e071-4b3f-5fda-08dcab9f304f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 05:12:17.8315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCDZzAwWyC7FyntcTqPHRF6IDm4gGqUHTGVPJm4i8Us+2NoLQcopnLGZXDVbyMJeaDCoD+LyLs5HKcLYduxyh9B9lAG8CaXmIxvQcUj70C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w
> Brost
> Sent: Saturday, July 13, 2024 3:40 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH] xe_exec_reset: Enhance spin test
>=20
> Let's make spin test a bit moe robust by doing multiple iterations and pa=
ssing
> in an already singaled sync-obj.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 48 ++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> dcb22f275f..87661a950b 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -22,11 +22,17 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>=20
> +#define SYNC_OBJ_SIGNALED	(0x1 << 0)
> +
>  /**
>   * SUBTEST: spin
>   * Description: test spin
> + *
> + * SUBTEST: spin-signaled
> + * Description: test spin with signaled sync obj
>   */
> -static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
> +static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> +		      unsigned int flags)
>  {
>  	uint32_t vm;
>  	uint64_t addr =3D 0x1a0000;
> @@ -45,6 +51,7 @@ static void test_spin(int fd, struct
> drm_xe_engine_class_instance *eci)
>  	uint32_t bo =3D 0;
>  	struct xe_spin *spin;
>  	struct xe_spin_opts spin_opts =3D { .addr =3D addr, .preempt =3D false =
};
> +	int i;
>=20
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	bo_size =3D sizeof(*spin);
> @@ -56,28 +63,33 @@ static void test_spin(int fd, struct
> drm_xe_engine_class_instance *eci)
>  	spin =3D xe_bo_map(fd, bo, bo_size);
>=20
>  	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> -	syncobj =3D syncobj_create(fd, 0);
> +	syncobj =3D syncobj_create(fd, (flags & SYNC_OBJ_SIGNALED) ?
> +				 DRM_SYNCOBJ_CREATE_SIGNALED : 0);
>=20
>  	sync[0].handle =3D syncobj_create(fd, 0);
>  	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>=20
> -	xe_spin_init(spin, &spin_opts);
> +#define N_TIMES 4
> +	for (i =3D 0; i < N_TIMES; ++i) {
> +		xe_spin_init(spin, &spin_opts);
>=20
> -	sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> -	sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> -	sync[1].handle =3D syncobj;
> +		sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].handle =3D syncobj;
>=20
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D addr;
> -	xe_exec(fd, &exec);
> +		exec.exec_queue_id =3D exec_queue;
> +		exec.address =3D addr;
> +		xe_exec(fd, &exec);
>=20
> -	xe_spin_wait_started(spin);
> -	usleep(50000);
> -	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
> -	xe_spin_end(spin);
> +		xe_spin_wait_started(spin);
> +		usleep(50000);
> +		igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
> +		xe_spin_end(spin);
>=20
> -	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0,
> NULL));
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> NULL));
> +	}
> +#undef N_TIMES
>=20
>  	sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1); @@ -729,7
> +741,11 @@ igt_main
>=20
>  	igt_subtest("spin")
>  		xe_for_each_engine(fd, hwe)
> -			test_spin(fd, hwe);
> +			test_spin(fd, hwe, 0);
> +
> +	igt_subtest("spin-signaled")
> +		xe_for_each_engine(fd, hwe)
> +			test_spin(fd, hwe, SYNC_OBJ_SIGNALED);
>=20
>  	igt_subtest("cat-error")
>  		xe_for_each_engine(fd, hwe)
> --
> 2.34.1
LGTM
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
