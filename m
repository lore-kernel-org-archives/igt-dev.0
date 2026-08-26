Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF23EC61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 07:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD3010EC18;
	Wed, 26 Aug 2026 07:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAFKbRXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8433F10EC18
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 07:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787730122; x=1819266122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+wj7d8OMjPWSNSu1rDf3aQMMHflN4TnpFw09GJQm5EY=;
 b=UAFKbRXjlgHWF5CuTorYPWX7r4DdM0PHWSRaGYDW0e8pq7wymavzQq61
 6vPonG+Rd57iX0+25de2D8HrA5sGMyIKM8pE5mYMPKee4HSlKypMIQMZQ
 6omB1VNbxsMct90ekDuvoGaT83n6XFqkBj0rxSMeZiPOaDNkSZ5w5lJCt
 OXnlevJptr65rjSMbL+qDNiz6tEyS60OxzA9Uq+Wl68G/lgsTtHfas8Ys
 kvH8AS8DRYu/8dwdn3U45V68SwArIgpsFtOWpUYkSNJBkx0niXjJhlQXC
 9xdsRPrxUYxCxQ3pZr0vGy1m9JqStdqiKoKZ4TTGqU27oKT/uQU8B353E g==;
X-CSE-ConnectionGUID: DKZiAEZdT9ej7irzsORWSg==
X-CSE-MsgGUID: mxarWccGRdWB2ivuvw8rpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99365308"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="99365308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:42:01 -0700
X-CSE-ConnectionGUID: iHZHN9n3Q7yTSMsb6mMMTg==
X-CSE-MsgGUID: ZOVHH/7lQwyepscq+0Htcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264911287"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:42:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 00:42:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 00:42:00 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 00:41:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaoe/Ts4nlIerQ2AjjnThuN8Q0sTgUvGYiteI59mccWtp2q7TjwenF85GXA7I3LqDz4Gl3/juhVv54o9OKkEyvI889mxNT+UQNsw4TB5zmMOuc9rkhGmeU9Nsr6T6uy9u4sr1ENwNWNRfcDY5SkE+avCsW7gjJ7lasPl/2Sxy5bzjp00DSFRM+EVQQnsw7LNDdp81LS8FsZV5DrswDiV+dbL6LygvLjeGb4zEnVTJV4t5ni0C+M3C0SVgteeSzFnb4ANRQN8cgPeC7cOft9b/CF7hpmnUsgWv/Bg1RpvqedipjWNC577yG3986um5AcVWFguA8EYk3jwiQ2s6FeBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94kS70Or4u7mPsaNJsZT6+Fl+kmF9OvBjiGAF4go7BY=;
 b=ClvlwlYXDLxxD03DBzatZTSW4LS1vG6f3N/LC248XAvoXWuXi3ztCcU1k2SrcRL9dLi5238qXyfda2UA0YOqor7Y+rNWWPLZZhVYFQBfzd/MDaJc5HoNRD+AJEtKnwNzXb+dLruAOstH5U1tbCtwPvVbNgmKiTOQQraF5hLmbjuEFcgFWjtoqWq8aWfYa8O8n9CPtVSnE/hAiZGLJhV9c+NC4tr1bPldq7j+vDfdd1NI+AebhxO3UfpuPfrkelmeDODxHTHzy+Q452wphASOjv9qWdIi/13LS1pd30zfr1526HSrRoLM7KbxRlSJiJvkDJyPWp3oflfYtLCpSr16Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 07:41:55 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 07:41:55 +0000
Date: Wed, 26 Aug 2026 07:41:42 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
Message-ID: <rgysxjgtb7rurtpf4hnk7x6aw5pce3izhm36qrzku2tq5x52aa@5j6gy6tfhxvt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
 <gda37yz65qif5ugay37oko4xj57emhqznqaf2imil5k3z25w7y@hbpp5mhzkqs3>
 <aob1Jdrp54F491Je@kniemiec-mobl1>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aob1Jdrp54F491Je@kniemiec-mobl1>
X-ClientProxiedBy: TL2P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::13) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 187045d9-757a-4ced-f1a1-08df0345802c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AVIRh+SVJ4ORAyoH8LpoP7NDnpTeTFDl4HO84CohoHNBIaH5VTdSmaKPRZza3GcEDGIGQmUFaMkE+ADcR1MqnDFfBHJ21QzKva7hGFacp7FbV2AzotwOP+fYlc4pdSgLDIYS26xjVly5chV9PJo+MNCbsBz43mQLkz/eMWNpvyy5kqi4pu/SGqsfCX9CQuUQ+vl0pOjzdIQILSMtp0T7tM2u2CgZee4UGDTHRed7PPk1skUmf7W13VxVInbOzrePTRQc0nNav0c9bLkly7LsoE24XMbBqQAdd+ZkOxNqeTHyImXwQy0F1gDaf5j4/tXnqoNlVHEZHrsmIYGCf1PYtMOxgJ6VapfCwq5pBSLx1A82T7nFbmh6faPtxSSaExjFcGs1n0JquQ9i3SwoZ98A7QinIZ+pv5l/1OeEUVT0bO3ZUoZFAnPsFK8b5hPh1HworVGJECFv3dwe7XV2FESvFYQIKN5JHRgPPgZcfOODI3upJCTvCaJVwSbCFodgzt3X30mq97K89qV2o/Zns4lKOaLOUEdh3zyLGwdf2mQVI+9il4dNngsyeaSKJzVqXmcj8gTXqIQaeoRTjquxITY74nuaNXQoPcysw6jyzdeaLO9YKTV3Ag9bZ+Kff8d0AYkR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R242N1A4bjUzYjlKNEY4ZHNvQ055WnRDRlNKam4wcUFjVXBZKytKTGFDQ2dJ?=
 =?utf-8?B?Ui9MSmFwNGhWclArS2ROdE9KOVBqQWhnNUUrQ3IzbjZLZndLM1RMZGEwNHRP?=
 =?utf-8?B?RXcwbGRTc1F5MFZKTXlJOG8yTmdCUjBEem9hVWtsUjBMRElGNTg2aWg0c1Fh?=
 =?utf-8?B?dlB1c2MvUWYyWVRvU3d5bjAwOWQ0QlBHaTk3bEYxMkwxZHFtUENKUjEwK2oy?=
 =?utf-8?B?YitYS2plWEIxb3l4NWZleitGV2lpUEFsMXEva0pwWXF2dUJQMFZLMmxRUWNk?=
 =?utf-8?B?eGtBNWpCN29zTWZQdnRNS25vOFpNb3VyOG5ZMDJkRDFDeUFxajJBcGJyR29y?=
 =?utf-8?B?cU0yK1dTeXoyVU95cFIvb0piZ3VzQjZrblFFOEZacHU3N2RuTWpjOHRwcVVv?=
 =?utf-8?B?U05jU2U5VmtPSDc3LzdNVENBSTR3bkZ6Yi9XY0tPRXAvRnN6Rzk2L0I5SUJr?=
 =?utf-8?B?WnBRVFg2YjF2QXdlaUxZRks1L1BrWGZxeGRJQlpTT2g4b2N3U1hxTmhEejhU?=
 =?utf-8?B?VHBLeHJ1cWJnTHlFRUplTDI1WW82OGtvOEkydXEzalI2bjJNUUtjSGUwUUM2?=
 =?utf-8?B?YUpDVy9Xc3hoaHhFN1o2Sk1kRGdPZm9Xb05RRkg2QkFZcEFSTW0vd3JxTmMy?=
 =?utf-8?B?RXhMbmFDV3BUVEhkclVEMmtLdjhEUS9MK2pKR3prNkxacWFrcm5TaE9DRG56?=
 =?utf-8?B?aXlEczZBSmZsTmovcml0YjRqQUNoeW1ORW0yRUovOTE2YVNEOTlXdjU1d3Fu?=
 =?utf-8?B?MlpYQWRTc05CYVBvTzN2eEFrR3U0ZXdML2x1R3Z6TmNGVXB3dkQzaDVyYXE5?=
 =?utf-8?B?VEkrMmxSNDYzbWF5NFJkTDIreWZhNUtHZGh5eEVYRkxKNS9JbDBsK2NUemNa?=
 =?utf-8?B?c2QwL3VyejVmRWpVQjE5N1lYWlU0N0ludlZadHdsdTVuVGlBVG4wdE1RNytw?=
 =?utf-8?B?ZGc2MFNRR1hHYWt0dXgwZDcvMXVOWXUvRjQ1NVhrcUJSYlRNNXYwL3ppZnpD?=
 =?utf-8?B?dVFXaitBY2NnNTJ0MW5ma3RjYW9Nc3l5NUlOUUQvekNzczNkVGlpR2ZhVlhl?=
 =?utf-8?B?WnJDUHNmSVQ2b2I5bTNCeE1TUlNHOUU1QmQrU1o2WWRQaVB0N1FwcmtpeVlJ?=
 =?utf-8?B?WmlQRE9GZ3cxbE05ZVI4OUdTeHlQRlNHV3lGR3dhRkVUZVpWNHJ1VVVZZXJr?=
 =?utf-8?B?TGdCZVRHbWVZOU5peDZsTXR5MjRYdmRDaTFmV3VsUFdYc01EOFNMQWZWN01P?=
 =?utf-8?B?czZ2aUhoaFJ2WFB2NGEyeEVUR2tWanRmOGN2ZlBpRnlWbTE3VHdUZzRXZzA1?=
 =?utf-8?B?MERnUkVtUDZTa1psSndVcE5qcHZRQmRrRWJ5V3pjUmN2SGlFaUdZWUVWVVE0?=
 =?utf-8?B?R2JSU203T3p3bEhUQk5pd3QxdXJvVW1XNG1rdUc2dDdxN2JoRzd0TWNlR2ZX?=
 =?utf-8?B?Tmpaa0NjcG5WeXpxaGhSMjFzSEx5cnlNSXlRb0ZmdnFreWdSYUJML0ZQcE5x?=
 =?utf-8?B?OTRsb0lpZDBRMkIvMThHQlU4MEV1Z1VhVWtTMERid2Y4V2RhZWVCNXE5RWJ0?=
 =?utf-8?B?RnpmY3dVOTBzUGhiQ0M4eVVqbUVuRDU1dkEzY0hCdGRJdkllT3VQZkY5eXdv?=
 =?utf-8?B?empIeERjekVVMUlnRUlqUFVaWEI5b25ydEkyRi9KU3E5SGxUTWhzVVBZUnBk?=
 =?utf-8?B?QXFrZjFrZVZ3SFBCN2YxY3BKNzFtY2xKOVNScGtkQUFjMWFqRVRvUlRuS21Z?=
 =?utf-8?B?TkNqU0xYdDJQdHcxSVhmRGl4QldwL253N3lkdkFVNUtSYW1JKzd3cUdYNUpx?=
 =?utf-8?B?NlJ0NjBMajhyVGhjTW9DMGw1Y0ZwYy9UVXlXUzRNYm52NmVqamN4bVZvRlZF?=
 =?utf-8?B?MGdMaU1LUzNHRURtRWk0eUZhK2RoRWprMHZDUERsSERnM2JlNkJJRWVOZ1k4?=
 =?utf-8?B?WE8zdTl5SWllbUo5dXdkZ2k5THJiUEplMEtNSUs2ZWduNzNLMjYwNXhGeDlC?=
 =?utf-8?B?VUI4ajkwVDQ0VEFnV0R4T0o0S3lmaEt5SzlzdDZlUlVtS0JEd1pGWml3WGs5?=
 =?utf-8?B?NlZoajMyK1J4YVU4QjNnY1hhVzlIelcvYUp5VDcxbWxubld3M1dQMEthdFor?=
 =?utf-8?B?eXcyZ0dMejRxMkRNK0ZOVjJUZ0dIZ3JORUNRRmdzZjNPaCtQai92eFRpeHFx?=
 =?utf-8?B?V2R4UVAvSnYzTHUzV0NwRFZjN08ya0xlQ1dpZFV6UXcvZ0JtZk5xYWxBT2Qv?=
 =?utf-8?B?YnF4S3JEd0JoMFJKTW5mL1M3Z2dzN1FVL3cxN1pGeWxoOTdVZ3k4bWNRRTZp?=
 =?utf-8?B?aWZ3ZmNtTmkxaGRqb09EdDJFRlJSNGdFVFZTTzVxaDgvTFhENCtHeWEwOUVq?=
 =?utf-8?Q?yi6soIZnGhribz1M=3D?=
X-Exchange-RoutingPolicyChecked: x6i6j2ZIQYU5nnDOw+uUdc1pBogd7tloXw+4Yptpkb43IJZnv7WOOugF7BXL+QSG9Re/9nAuVCxjhtQWHJfCsjeUgI4hSLUSpyOUyyKslsw4RUYn9zqMtNYxYllibFrBM5dIQ5C0VeaLCzlmbey5taPiwORQ/I0Q6NPLp0UQxv1iZN9JP5Iv+MjWOjboEChoGvBMU/o0Hd91L8vrmFnxvW1aGkWgGmGTIHvDa44RWsWVyRGVlHhJCuFnXiWxny41jSpZPO0wqMWo0EOQ7ZVbk6Qd+Y+301kZcyxQdKtvrmSrCx9edsmpUcW810u4dfhFcr1Cn9A+3Hd1twqkItsxgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 187045d9-757a-4ced-f1a1-08df0345802c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 07:41:55.0852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2O9fHhGZADWqv3grwMYk8USsl62B2gkjl35FakjVa9F7JT6har+0/NqeBcZMEA/Gi62no3XSNgAT0qO2RHF8n6FovWHMpQ4n0IDiDyowDxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

Hi Krzysztof,

thanks for explaining, I have no further issues:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

On 2026-08-20 at 15:17:37 +0200, Krzysztof Niemiec wrote:
> Hi Krzysztof
> 
> On 2026-08-20 at 07:15:23 +0000, Krzysztof Karas wrote:
> > Hi Krzysztof,
> > 
> > On 2026-08-19 at 17:21:09 +0200, Krzysztof Niemiec wrote:
> > > Add coverage for the case where the batch start offset is invalid with
> > > multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
> > > ("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer")
> > > 
> > > Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > > ---
> > > 
> > > v2:
> > >  - Reword comments to be more specific (Krzysztof K, Sebastian)
> > >  - Get rid of the context id parameter (previously set in rsvd2, which
> > >    should have been rsvd1) - which turns out isn't actually required to
> > >    trigger the correct error path (Sebastian)
> > >  - Capitalize sentences (Andi, off-list)
> > > 
> > >  tests/intel/gem_exec_params.c | 50 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > > 
> > > diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> > > index 3ba4c530b..c405190a0 100644
> > > --- a/tests/intel/gem_exec_params.c
> > > +++ b/tests/intel/gem_exec_params.c
> > > @@ -85,6 +85,8 @@
> > >   *
> > >   * SUBTEST: invalid-flag
> > >   *
> > > + * SUBTEST: invalid-offset-multiple-buffers
> > > + *
> > >   * SUBTEST: invalid-ring
> > >   *
> > >   * SUBTEST: invalid-ring2
> > > @@ -404,6 +406,51 @@ static void test_invalid_batch_start(int fd)
> > >  	gem_close(fd, exec.handle);
> > >  }
> > >  
> > > +/*
> > > + * This test is checking for a NULL deref in eb_release_vmas()
> > > + * (see 4fe2bd195435 for kernel fix), which happens when multiple buffers
> > > + * are submitted to the execbuf ioctl and some of them are invalid.
> > > + *
> > > + * The __gem_execbuf() call is always expected to fail with an -EINVAL,
> > > + * because the bug mentioned above is in the error path, which is
> > > + * deliberately triggered. Affected systems, however, will not handle it
> > > + * cleanly and will crash with a NULL deref.
> > > + */
> > > +
> > > +static void test_invalid_offset_multiple_buffers(int fd)
> > > +{
> > > +	struct drm_i915_gem_exec_object2 exec[2];
> > > +	struct drm_i915_gem_execbuffer2 execbuf;
> > > +	uint32_t size = 0x1000;
> > Why this particular size?
> > 
> 
> gem_create ioctl rounds up size to "the largest of minimum page sizes in the
> specified memory regions" (in this case simply PAGE_SIZE), then checks
> the alignment to PAGE_SIZE anyway. So this can be anything as long as it is
> not 0, and most of the tests I see default to 4096 byte objects with no
> additional explanation.
> 
> If 0x1000 is less readable than 4096 then I can change it
> 
> > > +
> > > +	memset(exec, 0, sizeof(exec));
> > > +	memset(&execbuf, 0, sizeof(execbuf));
> > > +
> > > +	exec[0].handle = batch_create_size(fd, size);
> > > +	exec[1].handle = batch_create_size(fd, size);
> > > +
> > > +	/*
> > > +	 * To test 4fe2bd195435, we need multiple buffers submitted and
> > > +	 * eb_add_vma() to fail. eb_add_vma() checks whether
> > > +	 * batch_start_offset + batch_len is smaller than the vma size, and
> > > +	 * fails with -EINVAL if it isn't. Submitting two buffers and setting
> > > +	 * the offset to the size of the first batch will trigger this
> > > +	 * error path.
> > > +	 */
> > > +
> > > +	execbuf.buffers_ptr = to_user_pointer(exec);
> > > +	execbuf.buffer_count = 2;
> > > +	execbuf.batch_start_offset = size;
> > Would setting any large value as offset trigger the desired
> > error path? Is using "size" here significant?
> > 
> 
> batch_start_offset >= size triggers the error path. The actual check I'm
> targeting [1] uses range_overflows_t() to check the interval
> [batch_start_offset, batch_start_offset + batch_len), if it lies in [0, size)
> (both right-open). AKA it checks if what we say is the batch is within the
> batch's vma.
> 
> Any value of batch_start_offset >= size will fail the range_overflows() check,
> triggering the failure (see [2], "Any range starting at or beyond @max
> is considered an overflow", batch_len needn't be set with start_offset >=
> size). I think this is the most straightforward way to fail eb_add_vma()
> 
> [1] https://elixir.bootlin.com/linux/v7.2/source/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c#L608-L614
> [2] https://elixir.bootlin.com/linux/v7.2/source/include/linux/overflow.h#L235-L268
> 
> Thanks
> Krzysztof
> 
> > > +
> > > +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
> > > +
> > > +	gem_sync(fd, exec[0].handle);
> > > +	gem_sync(fd, exec[1].handle);
> > > +
> > > +	gem_close(fd, exec[0].handle);
> > > +	gem_close(fd, exec[1].handle);
> > > +}
> > > +
> > >  static void test_larger_than_life_batch(int fd)
> > >  {
> > >  	const struct intel_execution_engine2 *e;
> > > @@ -705,6 +752,9 @@ int igt_main()
> > >  	igt_subtest("larger-than-life-batch")
> > >  		test_larger_than_life_batch(fd);
> > >  
> > > +	igt_subtest("invalid-offset-multiple-buffers")
> > > +		test_invalid_offset_multiple_buffers(fd);
> > > +
> > >  #define DIRT(name) \
> > >  	igt_subtest(#name "-dirt") { \
> > >  		execbuf.flags = 0; \
> > > -- 
> > > 2.55.0
> > > 
> > 
> > -- 
> > Best Regards,
> > Krzysztof

-- 
Best Regards,
Krzysztof
