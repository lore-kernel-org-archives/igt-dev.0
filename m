Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5A2C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 12:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970210E995;
	Thu, 22 Jan 2026 12:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8UmgzcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5880010E995
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769084186; x=1800620186;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yen245jYOk5gxmOU71tPMfdHinkZKN0fRBHAqztxUzI=;
 b=T8UmgzcSZ4PkT4khj++CGNL8aZed0sosxbDSYsZGa5U53Ndctbdjm5W1
 MswLAbc2yY2S1KS0xrwSYgGmfAInWtgGROpmLmlGcyl0hoeXBq9n7Er5w
 iZ4ZcLrqhD/1bDTLaCntAhlZ3tb1ntyWYkKE0Ton145SXGqCN1Buuus3g
 0GhhM00iBSWR3ozU3f2VjkOmG3tTxofC95v/1HRGZwqS5i0+VfG2AyJc3
 n3LrdIJTMwgPOONFnUZqs1XWgDdNGxfR5Y9e4cJiqXMMjAkPNALxqz7Sa
 GAoGFxZCdnRqAPz+ezKHTdt0Iji4nHTkCwT0//Tmnmiagl1w8Retjea0k g==;
X-CSE-ConnectionGUID: 1tKFrNpHT7CwyXYPEOtOFA==
X-CSE-MsgGUID: z8tNYXswQOyWTijsyHw6GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87900995"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87900995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:16:26 -0800
X-CSE-ConnectionGUID: 8G97H6VzT7KprxIfS03Evg==
X-CSE-MsgGUID: n64ub6qESE2BSKZe8xHXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211737661"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:16:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 04:16:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 04:16:25 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 04:16:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnxBBiK6ly90buYyYLZH1wPGf5lFqf47MC+AsSHsNxQr14UodvVt6xeI3+r21MY1GxcwEWtStFoyi2dblmwOIVRdRf8wZijzuVocf5PO5ePAkv1ff4SC5ZWgwGnvbHOjzwkAAKHa8j866alf/fyvdDLQllxgYR64Iilk0tAExBivHQbe0eLvpJ8lkH/MTsI/EAFFrTO+d0Ms9G+WDJxMZMyEm0d64u2T+IbA9lPgneOFRWRzwpRT+oIEuk96YQwxTVA/GlcUw9PhITV6xKOr4QsiV38wAKMWJfHeHmcvklV8qjITaePFRafqCga9CfJDMhvr1crCYUWRUtTzVeKg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX80uXJ4NfYJueDPTBrWlj1AuFQzgefnl3xOoDopEXg=;
 b=GihI6zvKVKdYWRnQ35VxBgQ1RPRX6iuph8Mjc3baEMGhTlULtOfKTDGFQ5zzTokUYdm6gWiGntmr6m631SblaiBeC4YfSt3TqOcIyZ7H8kPoTJ7NAVBNAqHMxtmBOgiYiObyDr1peAiJ4nhJKmNFKxzounE1I8gRvIEt/ad0XgMwKcQEOajz0JR18sVSPyhwMZdK4j8Y/NuZwbW8t0HrhMeyqEcB2ylghlLsywn45G2ITZdCXoAxYEW/b5pc1D+M/BFastVRCfP6WLNEnnkB2XbKmIpWzDliG4pgt/lRx3NVJGB+3l8jup4VVHm1k25CLnZHLTV7nQ/fUh53wv4Xyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.10; Thu, 22 Jan 2026 12:16:22 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 12:16:22 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
Subject: RE: [PATCH 1/1] tests/xe_eudebug_online: Extract workload start
 helpers
Thread-Topic: [PATCH 1/1] tests/xe_eudebug_online: Extract workload start
 helpers
Thread-Index: AQHci41s30Uw8EITLEex6ia8Hf5EfLVeF17w
Date: Thu, 22 Jan 2026 12:16:22 +0000
Message-ID: <DS0PR11MB72642FE85FFBFC06954D3463D997A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20260122105645.3920549-2-piotr.rudnicki@intel.com>
In-Reply-To: <20260122105645.3920549-2-piotr.rudnicki@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CO1PR11MB4852:EE_
x-ms-office365-filtering-correlation-id: 87bea687-e481-451f-5fdd-08de59b00e6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?Gyt0H2//d+0fPwnSsLjidhHWg7upP7QJdotIkpdkoioFG6iFihiCfAqPsI?=
 =?iso-8859-2?Q?jVgNdSH/uj9V9IYfto8ZLar8boouvcsxdiAojcomxBVRWijZ46OGdMTr4z?=
 =?iso-8859-2?Q?Z2Xahs8ArRfKCPUkdjdWCPTFQZ4BqszW9UJ0A1FFKWjY4LJNRJc7qB9hq5?=
 =?iso-8859-2?Q?5cy+5d+LIOoRMeiHvrK7SqAu4V7iuVsKsNI1u4XS3wC1aSH+kRoaDMxHB4?=
 =?iso-8859-2?Q?iLQBRzVOk0FxcRzkq9Tg+/oLizXejEFjEf692yQhJsIdz0HC7rxARUcXWt?=
 =?iso-8859-2?Q?xsSwNj0M2CAWb5LV0+zKPlkbnyDSXq7/4zwBwEubdXAErdvQv+99iIs21h?=
 =?iso-8859-2?Q?tkG6jWNZIbEvTpiXwvRiL0xIfgc03/fMdjD/LM6cvNe55EyDhVZ5Tw5f0o?=
 =?iso-8859-2?Q?fl46QbQX3uMZopvasJaIytc9f+vh2FR4ofT1ngTUW4DveersTrf3zfTtXH?=
 =?iso-8859-2?Q?P4wie9DqeR7miqIe9wyS1qaoHIChaj9Ua/cclr3laxcL/6RwClOCDgvwQ4?=
 =?iso-8859-2?Q?vVtc3OucdXiEdnBDxKZWyDt8Alszh1dTtTWd7Os30jGLIQutPeLmITi0wf?=
 =?iso-8859-2?Q?B5DU2+HlT35pPE6znuObDTBvofeAVoewX3T3NGI1FfkkDcKjG+B7bDxpW3?=
 =?iso-8859-2?Q?eO1+tn2GJ6uA283wgsrWLDVU0BzaZ4k24/qZxpdSlvWB0z9JVUsIj6O1f3?=
 =?iso-8859-2?Q?aC8Z4hQKEEEuEjn/X90sTMarnkOpDhSx/0xNa5jGwCdlmX4bdd3DJWk6bP?=
 =?iso-8859-2?Q?bjvEOV/beVSDQvvN07x9MQSu7sd0ETmswb95DrLHKSo4ox2QT1hOdm76kL?=
 =?iso-8859-2?Q?E6ZgLV3uIf5z9q8wXrpcCFp+hpOHgKflS2YceWbqFHl/vWdJzVbta6q0RV?=
 =?iso-8859-2?Q?kchVpeSdkFk4CEyq0v/b5NWhfZj+5rPhGczNBj/EZizl4SmZtMQ+ufSf0b?=
 =?iso-8859-2?Q?ZT969V+/UVtTGdy+9UW+oiuISRjpaNIgcQmMnwpeTkBw4kHLejRzjnXyhB?=
 =?iso-8859-2?Q?v0POjPNiecpvp3qwYZ2it8SBKU4AILD4qxdS59UC5ZX9+fafDrsUW2aEtT?=
 =?iso-8859-2?Q?5wye1COchuTUpyPOEr7mPo1YsNELCxHIjUjorwwwsUjTfGHfGbGd8ZWDBb?=
 =?iso-8859-2?Q?XwYYvpM5WEccLS3dz4TXyuBPz0c1jihzHa8N9Uo3pxSlZgV1P2t5pi0261?=
 =?iso-8859-2?Q?8x5mowxEha4Xq0tExk2kW630+JaRHMfhF61uIzMUIDJG0ZtiwHfELT7gA8?=
 =?iso-8859-2?Q?wMhBJqxExp5b5ZBCVEM/xAAGY1PsnLdTvXjvTgLG4byN3LZlbcDGhqO3Hg?=
 =?iso-8859-2?Q?lE8OSShYAlvkINFQ6Pdhzt1dVe+jBIV/chK3V9v30pI/KJZjrTy1MiWASs?=
 =?iso-8859-2?Q?UODhZ4+k6VI8SnywF12YNSE/KAK9uomG9jE9v+dSPlPRAdDCL5KqozDdmC?=
 =?iso-8859-2?Q?B9bTq1JI45lX3m+4sn7rVv8GiqmfFY3n1NUkkz7xHGYNDikbi4qec/HHXN?=
 =?iso-8859-2?Q?WjoaYdiHjCwrf3YjtzNZwXWIxEyi9tctsnu5rETsMoChFiLKhGi5QV8cv1?=
 =?iso-8859-2?Q?18UuMhjtc+dox4MkElhCbGFMO35HB2AU6JLeivbo4RY9hZhy+XdWEAivys?=
 =?iso-8859-2?Q?CyetOeUGjzayn9DDRfj35J3ppY8aieN2i/CjwDzRn9RjEejznEDxEk/Asf?=
 =?iso-8859-2?Q?AhnV6nEucDJSAWAL5dY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?Pe0mLLYoiO3xUq3czrwRhpUz05XaWRZ4/JRqmeJUwuooai9HoNAoHHNljp?=
 =?iso-8859-2?Q?Mf7T02NBqggBgTcTDrjaYT2t1sQ7jKWlAklVJJMIraHMx9ZqQppikI/Ces?=
 =?iso-8859-2?Q?nyeLB9nFduUInlQDvGtdJYnM05jHMO/AB00cV7psGLb8OOn8vNZysvDkAY?=
 =?iso-8859-2?Q?hBNbXt99HxCfGNJDc9XOmkb6tXWHbJRCvehHEVcLO1xaVKL+ftRgl9PWgz?=
 =?iso-8859-2?Q?XgMV4OjRXX0o9m30LxLJpB1NQTrhHmDB9PxhhU4a0F/Jh9PHESqyustIAK?=
 =?iso-8859-2?Q?yIgmgoFQHzZbRIMkIO50BvWOtVi8bb2y2lWOG6X18dJhUpz6yjZvAi+No3?=
 =?iso-8859-2?Q?agzav203nxd+QYiLMS7PLGtcf1wvy7ctR5VudT7kF6lW5mgMvnq5Kj5XGA?=
 =?iso-8859-2?Q?9xq/omrx900DaD+Qlj/JJWi/5PK+8DDOogHP37JE8t0VGg85e50TGsSyXb?=
 =?iso-8859-2?Q?RVxLDYHvjP+i8Y+aXUFjz69W2F6bBSGCARKaEIT+/qooWy5OQWrCxRDpld?=
 =?iso-8859-2?Q?ZXj3usOAbH7yDxM8uX3XuCb8ZvqFNj5FabCkpidmLQ52IwL5ysL9lkJBrJ?=
 =?iso-8859-2?Q?R0duIO+jb7865OhVcVK75sibUuICWDY2kiTsZjUIPeGBK4kczX/cS/6otl?=
 =?iso-8859-2?Q?UI3GBHadtYfmp3dn9i0wLhM+3OevLmbzIFIebFqTD9KsJk9EuWbmTllrc0?=
 =?iso-8859-2?Q?UlsNUIcES5ood8hzvkUAoHjNgtyaMhyTBqFURMiAMTVu1N/Cl6ZHgPLCLl?=
 =?iso-8859-2?Q?vfSFlHaZAFmLLl712FU4l61v4f/smSweUn2uiALdIbLRiEiXj8BFVSOjhS?=
 =?iso-8859-2?Q?cOY00CN+hYmuvD0zlshdAKYHsqvKzRtePP54ZtzlfIc/U49Ob1Kho475MT?=
 =?iso-8859-2?Q?M6JUePaVGWCqtVg3uN8A/7g4by3kBPbJDcRxTbgriswF+ZDkcI+xr7gB/J?=
 =?iso-8859-2?Q?cOTXAzAfszmWZV7o6OsOLBYiAFgOMKa+sbVaxxoK21UfAj6/EkpSr/2K85?=
 =?iso-8859-2?Q?q+iL6MwDRlrFbZshXflKsSEo4dJ/ilNRrvAX2jsUczFeYB69gkOjMO+PQg?=
 =?iso-8859-2?Q?mSWBzmP8CKKCwCz3UM7V8eBHG+09tzcR3yNGaFWuQ5TBC41ZoH9qpULiMI?=
 =?iso-8859-2?Q?lCcTT0FDqfcD/voycHJLNX6A7WPzAtqpx8XEkJAV2LyhsMDxDZm+XzwfMS?=
 =?iso-8859-2?Q?QrK1csva7N+Mmh801JlKhKPLMFkwBBsUPdYjaRzdZaQBSk78xUza4OiKmj?=
 =?iso-8859-2?Q?7BoJRrpwdH2sQU7og37Vgxx7zfiqyThwXUSHG9b4m9KmbjVSk6V0EVUI9U?=
 =?iso-8859-2?Q?fu9aAMERHduuwlMEksGU7+mBHUbD7ZSuDOTj3VXylOhYnHe1wpEOr4PD1W?=
 =?iso-8859-2?Q?5PCCe2QQSujkwaVWSo8WwDFGGu2zZMOlcxoDItH98ggj2IR+Y1AxJpy8UK?=
 =?iso-8859-2?Q?4aq71sVw9lT9vW/Ij9y5E7dx18ARWG1DLv4RdEqBQF/dniyqe5DyElnfbR?=
 =?iso-8859-2?Q?15WzWEoA5/Tg5+9Eo7EtNykUvzvkcfd1Tq8qln3h0tfXG268on3MHa9WMm?=
 =?iso-8859-2?Q?XVcqQ6K0UN8j5uLx9TEOqRSmeLaK3om58YYBEoLSM4gThzIZ+4Laizk15L?=
 =?iso-8859-2?Q?ilftYZ29/d/MtPdAeOggi0q8TmkE1TyFX3HnbHhNMVisOV3Z+FYgqpFpPY?=
 =?iso-8859-2?Q?FIBJMtjA30YdLbiLatJg7ybF3XGAe63hPrWWBhrhavXq/DRIUkCo6D2YFe?=
 =?iso-8859-2?Q?vS30kM5aYf35I3DVbQWHfSBf2Wy7nwCBunBYJhnQOwk3zjuwvs7uhKJugB?=
 =?iso-8859-2?Q?YyKD4sqt4MxH9g+bh0rfWlZjRzzXfa8=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bea687-e481-451f-5fdd-08de59b00e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 12:16:22.4262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnFbtAeHRt4NHq9qsV/aLT876h90+erf/fiZMO5f2MqneAdoz6isScQAweakOjpBXyewlcLlmg7yGPpjhQU8xRUy3Twgf5HVyN4eU8u9zuNt3cRy2zr/IJVutt7iBGI2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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

Hi Piotr,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Piotr
> Rudnicki
> Sent: Thursday, January 22, 2026 11:57 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Rudnicki, Piotr <piotr.rudnicki@intel.com>
> Subject: [PATCH 1/1] tests/xe_eudebug_online: Extract workload start help=
ers
>=20
> Extract duplicate workload start wait logic into reusable helpers
> wait_for_workloads_start() and wait_for_workload_start().
>=20
> Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 78 +++++++++++++++------------------
>  1 file changed, 36 insertions(+), 42 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index ff6c5ff19..7e885f31f 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -470,6 +470,38 @@ static void online_debug_data_destroy(struct
> online_debug_data *data)
>  	munmap(data, ALIGN(sizeof(*data), PAGE_SIZE));
>  }
>=20
> +static void wait_for_workloads_start(struct online_debug_data **data, in=
t n)
> +{
> +	int val;
> +	int count;
> +	int i;
> +
> +	igt_for_milliseconds(n * STARTUP_TIMEOUT_MS) {
> +		count =3D 0;
> +		for (i =3D 0; i < n; i++) {
> +			if (READ_ONCE(data[i]->vm_fd) =3D=3D -1 ||
> +			    READ_ONCE(data[i]->target_size) =3D=3D 0)
> +				continue;
> +
> +			if (pread(data[i]->vm_fd, &val, sizeof(val),
> +				  data[i]->target_offset) =3D=3D sizeof(val) &&
> +			    val !=3D 0)
> +				count +=3D 1;

count++?

> +		}
> +
> +		if (count =3D=3D n)
> +			break;
> +	}
> +	igt_assert_eq(count, n);
> +}
> +
> +static void wait_for_workload_start(struct online_debug_data *data)
> +{
> +	struct online_debug_data *array[1] =3D { data };

*array[1] can be replaced with *array[] in this case

Other than that, LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +
> +	wait_for_workloads_start(array, 1);
> +}
> +
>  static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
>  				       struct drm_xe_eudebug_event *e)
>  {
> @@ -1928,16 +1960,7 @@ static void test_interrupt_all(int fd, struct
> drm_xe_engine_class_instance *hwe,
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>=20
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		/* collect needed data from triggers */
> -		if (READ_ONCE(data->vm_fd) =3D=3D -1 || READ_ONCE(data-
> >target_size) =3D=3D 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset)
> =3D=3D sizeof(val))
> -			if (val !=3D 0)
> -				break;
> -	}
> +	wait_for_workload_start(data);
>=20
>  	pthread_mutex_lock(&data->mutex);
>  	igt_assert(data->client_handle !=3D -1);
> @@ -2014,16 +2037,7 @@ static void test_interrupt_other(int fd, struct
> drm_xe_engine_class_instance *hw
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>=20
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		if (READ_ONCE(data->vm_fd) =3D=3D -1 || READ_ONCE(data-
> >target_size) =3D=3D 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset)
> =3D=3D sizeof(val))
> -			if (val !=3D 0)
> -				break;
> -	}
> -	igt_assert_f(val !=3D 0, "Workload execution is not yet started\n");
> +	wait_for_workload_start(data);
>=20
>  	xe_eudebug_debugger_detach(s->debugger);
>  	reset_debugger_log(s->debugger);
> @@ -2082,7 +2096,6 @@ static void test_tdctl_parameters(int fd, struct
> drm_xe_engine_class_instance *h
>  {
>  	struct xe_eudebug_session *s;
>  	struct online_debug_data *data;
> -	uint32_t val;
>  	uint32_t random_command;
>  	uint32_t bitmask_size =3D query_attention_bitmask_size(fd, hwe-
> >gt_id);
>  	uint8_t *attention_bitmask =3D malloc(bitmask_size * sizeof(uint8_t));
> @@ -2110,16 +2123,7 @@ static void test_tdctl_parameters(int fd, struct
> drm_xe_engine_class_instance *h
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>=20
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		/* collect needed data from triggers */
> -		if (READ_ONCE(data->vm_fd) =3D=3D -1 || READ_ONCE(data-
> >target_size) =3D=3D 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset)
> =3D=3D sizeof(val))
> -			if (val !=3D 0)
> -				break;
> -	}
> ++	wait_for_workload_start(data);
>=20
>  	pthread_mutex_lock(&data->mutex);
>  	igt_assert(data->client_handle !=3D -1);
> @@ -2237,7 +2241,6 @@ static void test_interrupt_reconnect(int fd, struct
> drm_xe_engine_class_instance
>  	struct drm_xe_eudebug_event *e =3D NULL;
>  	struct online_debug_data *data;
>  	struct xe_eudebug_session *s;
> -	uint32_t val;
>=20
>  	data =3D online_debug_data_create(fd, hwe, flags);
>  	s =3D xe_eudebug_session_create(fd, run_online_client, flags, data);
> @@ -2260,16 +2263,7 @@ static void test_interrupt_reconnect(int fd, struc=
t
> drm_xe_engine_class_instance
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>=20
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		/* collect needed data from triggers */
> -		if (READ_ONCE(data->vm_fd) =3D=3D -1 || READ_ONCE(data-
> >target_size) =3D=3D 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset)
> =3D=3D sizeof(val))
> -			if (val !=3D 0)
> -				break;
> -	}
> ++	wait_for_workload_start(data);
>=20
>  	pthread_mutex_lock(&data->mutex);
>  	igt_assert(data->client_handle !=3D -1);
> --
> 2.43.0

