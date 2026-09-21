Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0546BC982EE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C88B10E715;
	Mon, 21 Sep 2026 12:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HowliFdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EDA10E151
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994589; x=1821530589;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EPW8oYg7pRvpBtFaReefwK4EYlBPe8SdUsTPU/ZCIjU=;
 b=HowliFdX1Z6dMYnVDNmwgs582e7d2zoCBn6H5uFEfsRWYFPmJQg7ihfM
 /DhHBBhsd2Qp7nZX5EQE6EWR9y48zPWRkKzOfEQTqd4XA3FG/WlDzFHFH
 HYUcuP8g66gTA+dpnvyek/zUDZaHE3vs8mg5zSabel5iQhYK/iquDfnNN
 VeZNzMP3Po90BT9cuidk36WRlc9lLFzCbXjuaKU+KvdCRZyBodvtWANqW
 X4FUhHXUUW3p/73LaKr6texK2nVXaOdR60JgM/qotGvCNjYh9/NADGfm8
 ttWJuZNIINMEe9q0I3Acvd5XPiTw+F+xpI/x1G+uazoWvgDf+q4Dt3Z5S A==;
X-CSE-ConnectionGUID: nTXc9luRQ4ijeWGP91lfwg==
X-CSE-MsgGUID: 75bWufa2R76gQCpWwV8PYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90369859"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90369859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:43:08 -0700
X-CSE-ConnectionGUID: qdlTIvfOQHma+lfJ0aanhQ==
X-CSE-MsgGUID: DnLreO7PTKa6cDTpGmGyow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="269154256"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:43:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 05:43:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 05:43:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 05:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwJC0U6WHkvoniPODS8hZR3QDNqg6YaRJd+JK9fzAK1AIfR/CUfgCXseTgRSr2XkKuK2ge90kEl+ETZQCwfLYrKQ3HQPURKsGLd0jlfUk4P45RAkUQJKHgeQ5HYDRNauyOMLTb41Ku7GtW/DZf3Y8YE3+jfklpzKBWSWLCSl/AUhPA6BFLFye5QPKluD/NPBhYN8cVSpZjnErMCyKvLAlgYrTwwzey04mcq4m+EYeVkR9yvEIVlxTaPOJ5wFCud4138alN2vm4elU8q8wcXpitEPXhQzUG8o+rI6KgRv7Xav6QN/EqAcTLtPfvjcUR56cgZny/Pf9vMgG4X+RqCh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPW8oYg7pRvpBtFaReefwK4EYlBPe8SdUsTPU/ZCIjU=;
 b=iqroeKV3I5DEVEbE+7jGSgq44WqzngO9M16HVnDDvvpI4aqcGobPJEUKAus0pjhWSqXqZURk/nz/vfGS0nohNZSI7E7dEt+zQQDz0NCsXmdH++hLbX5VKveSc1LEMbAhr5/w/UM1xYlrhY+NBGCSTacpaKDZtFf/PPxZZLfq9kLom12mpfJZQkdMsRHwJKdvnbdaOCxsk6jSj3MRSqGhUAKKPYSriQyky+B4AerWRcZwCQp3i/Qtj/dCjcOq0bLO7pbfRaIC+t1PCJuTd8/ICk4NLgelWJ2Abyvi3nNNGdN6CRPIhitmO1zsTKIpJwSU6BXv3WgdvnR9HHipsA01QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 21 Sep
 2026 12:43:04 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 12:43:04 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "adrinael@adrinael.net" <adrinael@adrinael.net>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t v2 0/3] Bump debian version to bookworm
Thread-Topic: [PATCH i-g-t v2 0/3] Bump debian version to bookworm
Thread-Index: AQHdScZl1p9ue2Fdv0qjpdGIUHtrb7bY+e0A
Date: Mon, 21 Sep 2026 12:43:04 +0000
Message-ID: <ca5b321b191fb1a16e8ad65409f56493a791d83c.camel@intel.com>
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|CY5PR11MB6367:EE_
x-ms-office365-filtering-correlation-id: b296e5c0-285f-4f29-79db-08df17dde143
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|38070700021|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info: 8x/amvysUEYJ8e8dtwlAoUwNk0u9k82gCP/3PoIqHTngONGmLA23465HBvcU9CHbfCycht/ZBTkCmBtBYzoWcFVxPiYuqbAKEgT1liVp343UruNNGUBANoRvZlxDiNK1HgVOUOJ5S2RmF4rkxP8MJQu2u4KM9fuEz7scEt2YjKC4lfh+3eGvOGelRHa+oE+8rJkcHS0bWZasrrkstrsoTjurIT7Yb8JJEMjZcP8+KbsPCS/oHlWdx5pqBB/khIflbjLw1raXknSZUCdWgWhmRX1n7igcSFyJ2WSt2DpS37XPk7swcdx47WFrVdTog0oi6EZHdKt4qCLICZKmFDJSx131WOO4krn9tXUu+VefPDM2EfnPzxB5j+uqOdonhSOtSvZac+W5vd80LN/82k2xnuV24Y+m6VOSs1ccDxJBce0Sr+lsdxopkb8WPqyUsT7xo7P+Z4XfpEEHXD+bgGWiORik7/j1pRQlemTHLs2ONO8ZZAM1vgmPNT/2EzlD2V/oYlQXEVClgriisGl7NkhsBhXCZPuXWLMPgaDPBWhy9+6J6uiLlla5ga3EJzZKwWTljWXL+rbmNjlex6mFsq59+DcHIR8mNh1YRyRjQBznS4CgEiqlrXG5kqTZMciBPcsoZ7JIpoofCD3D2ydW3LjPExc6QpPNsDmKxV7NY71CIMDcouJSMEAhMaOb+Rvk90IfCd7joEdQiY41/34bDxRcyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGVWcWJJZ3Q4WGFvVXlQa0JpUnNNQURiM2M4OU5IdTM2SGNhYnhxMmNEUWxF?=
 =?utf-8?B?TXpLNmhHQlFJb1hTeVVHT0g2dWtQZEs2TWVsU2dpRkVuY09jNkluZzNIN0JF?=
 =?utf-8?B?WDI3T1F6d2k1Wk1KVXRnS3Q1NHd6VkZja3RtVk9IOHcvZVo5cVhnQkhDb2lk?=
 =?utf-8?B?aHZEZGVNc0s5TnU5M0lMdGU4UG9wV1k0bmlNTElmSUNuaGdVSzNrMjdNa1BU?=
 =?utf-8?B?aEJaaENsNHZ6MXVBN2h6OXZvbDlCUlVsb3Y5TnJJRERXNGRkVDM2Q3h2Smt0?=
 =?utf-8?B?VnFFMXdTYy8xZnpJcXh3OGtLUXNZQUFxLzgrUGFzU3UrdFVFWmtwS2RBVzIr?=
 =?utf-8?B?T01DdTJMOUx5Wk1ZL0s2SCsxUS9XV01XSVVrU2kweXpyWHBOemh0a1NIc2Vl?=
 =?utf-8?B?L0ZtSUQ2WFNueHdWdE1HUVFhN3dMV2NnOVVFMFc2UlExQ0pYOWppT3gzU0oz?=
 =?utf-8?B?MjhpejBNdys5TUVHYVBNT2U4b2Q1L2lHcm53Qk1RVXJLZSsvb09uY2t2QTFO?=
 =?utf-8?B?MFI4V3JlcWwyY1cyMVdiU1cyYndtWE1SVHFaSmUvV2FUOEFVamVmSnI1d0lV?=
 =?utf-8?B?clFPcTB0NmZYWXNqU29lMG84c0ROY1dRaVZ3Z0l3SXdmMW1lL2toTDJOb2Fx?=
 =?utf-8?B?UmpoNGh2TGIwTGgzWUJJZ1FMS3llUy80SkRjblFrTmZjOUR4RGE3ZlF2MWUr?=
 =?utf-8?B?akQrOVJadGhXVkF0YVBHc2ttbUk1LzQzZXdvS3lNT0RnbXZiVllIMFY0K2Nv?=
 =?utf-8?B?LzZmejZVejBtSW9WeWFNRFljNy9lMlJoK2RTb3I0TERLV2VFSjRLTDhHNTUw?=
 =?utf-8?B?SkFjSElYRVV4VEFxeVIxdU1GNkdQSzA2Uzc2aTJjQzllc2VjdUJOWDdISlFl?=
 =?utf-8?B?ZWhBcXg2dHN3dmMyRi9OVk5lZStUR204YUxLWXBDUlgzZmxRSUVaNXZ6bzIr?=
 =?utf-8?B?eFYrNHVXU2k4UVJ1VUJDaThLU3BoOUZ1MTgxV2hVOWllTzQwSDdEdTR6MzdZ?=
 =?utf-8?B?RkY5RGdRU05OYmhNNTlKY29hQlRnUlBuZjVNZFpYSkxvNkVmZ0FVUEdSNk1I?=
 =?utf-8?B?ditPUjk4eUJmZE9Vbi9zdmZjTEhQN0U4WlZzVlE3Z2pKVkRndlA3cWd2Nmdw?=
 =?utf-8?B?WWprUk14RHFUdG96MHlacTA2b0VEZzBKUnZWN2FJMVZFMHlQcTVrdHd2dDBD?=
 =?utf-8?B?ZUMwZHcvVEY4QnphdnM0Q3JEL2F3RGxtTE41am53Z05YbExTV283ZUlYMnRE?=
 =?utf-8?B?dklZSUIvaHJ0ZHFUN1ZzejlEYTBoaEhyQy9QdzQrZnYycWRWYVYvdzVuRFhl?=
 =?utf-8?B?UkhjdUozOXd3QVpDUnROMzZPdklWU1BvMTd5eVRxMERVcWRxa3d1azVka2VW?=
 =?utf-8?B?MmY2Ris2RGhqbDhJTlMvOUJIbDZjZjJlaHRvbk11bDJSMlhKb044a0pXMk9t?=
 =?utf-8?B?ZUg0Q3AvOGpkcjJJRVBndERLNFErRE1SdDZxYW5RWisyd2hXZWU0ditnUEV3?=
 =?utf-8?B?R1ZYUVFJZENBSStEWlN3Z3BLa3BSMHhrOGY3Ty9mTGxiNUdEQXJsWE5DN2No?=
 =?utf-8?B?R3pPVmdCdDFQZGZxSFAxUkNJU05jcUl4SlNBRHZQSWxSc2Z0eWIvcXM3d0F4?=
 =?utf-8?B?eU1SYnpWZlN2U044b1Q1R2J4djhmWjBWWXY2OWVkQ1J6SXQrU3kyWjljYi9w?=
 =?utf-8?B?NU4zcHFJTGRmY21ic3pwcFdsMHRobjdDWjZqSmZEZ29MdHk0M0FtdWxqZ0U1?=
 =?utf-8?B?OTdjYUx0eGtQQlNNK2NjSXdhWFY3MkNTN01mLzVvV2RyWWZmV2Z4Q2tvdjZG?=
 =?utf-8?B?R3ZtOUZRdEFIRVZ0TGxvdUliVUVXN0NYNFd2cWFlVGs2d053UVdPbDg0eVNS?=
 =?utf-8?B?WlhDcCtLaUsvOE9GbXNhZk1zdE8wMzdiVVNTN1IzczVmNko3RDFOR0VRNDJH?=
 =?utf-8?B?Ty95M25wem5NSm5FUXBpUldnWGtkVWFUNytjNktSRkUwRHBYL3ZRZi9FQzlp?=
 =?utf-8?B?d0d1WFAyd0ozdlpiMjZSa1dhQWoxYmtaV09Dakl6VXE3SWVDb3ZidURQbEdV?=
 =?utf-8?B?RVZHbVpic1M1VWhwdUw0RU9qRklYZHpwYmZLbUI5bVBMaHRHWEgvZkNicElk?=
 =?utf-8?B?b3h0UGRnR1dXZW5HVThha3FWd3ZCR2xhLzc2YUJjUUZISldhVWprTEhqaWZi?=
 =?utf-8?B?SExmaFRzWk1lbnRZUlNMTHZMU2YyR29pTGlwZndkSnV3SGVoM0tQdnhyc1Zx?=
 =?utf-8?B?RkY0OTh5Z1g3aGkyTStuTGo1MGFBbkQyeUZ2QkdlNW45NHRuN3R4ekZWbW9o?=
 =?utf-8?B?eHFIWHdya1BaVHgwai9oUWFVQUkzclNPWTRTbENmQ0dtZUpjbEtkb2Y3YUR0?=
 =?utf-8?Q?0AxwTXeDwJ2AZ934=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96A297A692B08F4B86076F5BCD399B5F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CGz4UgDkpiUvdyQjoeK5ktgs62SMcJ+lP0ZcBn1NE3eRDn7TCYgXExspeDTp8Di51PFJ0ApLnoo+WcmeYbwOHpWCgLeAxIoDW25KZbomECGvnbEQJpIsehSeCuFzgrP/fAQlT3CUuShLDvi0ozJGm13LLuqe0ddj7G/OAISK5xpR+jYxuI6iVTvzG05HhzYXAZSUIcyZj6jsjs+T39WzXpbRM1mCazrVIHJdK1Yf4tWVCyXYXxVUm+HUeUyIJC6vU5owo99MFRI1+F/y6cZ8EWOqU/soVXmACNV3a+2zrzBcpTKrsJziCKiw/T2o/jPUatYKGwGSRGy/JsIS6nFEAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b296e5c0-285f-4f29-79db-08df17dde143
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 12:43:04.3821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BG+MnBOmZ9zinQyNIKuOItpdqa6U2X0dlOnTZL/LfAKFEPQtWbWCWJBZvrOjT+EQslfUYKkGTP4CO9XmdHMFfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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

TEdUTSwgYWx0aG91Z2ggSSdkIHByZWZlciBidW1waW5nIGl0IHRvIHRyaXhpZSByaWdodCBhd2F5
LiBJdCBkb2VzIG5vdA0KYWZmZWN0IENJIGRpcmVjdGx5IHRob3VnaCwgc28gdXAgdG8geW91Lg0K
DQpSeXN6YXJkDQoNCk9uIFdlZCwgMjAyNi0wOS0xNiBhdCAxMzoxOCArMDIwMCwgS2FtaWwgS29u
aWVjem55IHdyb3RlOg0KPiBCdWxsc2V5ZSBpcyBFT0wgc28gYnVtcCB1cCBkZWJpYW4gdG8gYm9v
a3dvcm0uIFRoaXMgaXMgbmVlZGVkDQo+IHdoZW4gYSByZWJ1aWxkIG9mIGRlYmlhbiBjb250YWlu
ZXJzIGlzIGRvbmUsIHdoaWNoIGlzIHRoZSBjYXNlDQo+IGZvciBhIGZpeC4NCj4gUmVtb3Zpbmcg
YWxzbyBsaWJwcm9jL2xpYnByb2MyIHBhY2thZ2VzLCBhcyAvcHJvYyBwYXJzaW5nIHdhcw0KPiBp
bXBsZW1lbnRlZCByZWNlbnRseSBpbiBpZ3RfYXV4IGxpYi4NCj4gDQo+IHYyOiByZW1vdmluZyBs
aWJwcm9jIChBbmRyemVqKQ0KPiANCj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFA
aW50ZWwuY29tPg0KPiBDYzogUGV0cmkgTGF0dmFsYSA8YWRyaW5hZWxAYWRyaW5hZWwubmV0Pg0K
PiANCj4gS2FtaWwgS29uaWVjem55ICgzKToNCj4gICBEb2NrZXJmaWxlOiByZW1vdmUgbGlicHJv
YyBwYWNrYWdlcw0KPiAgIERvY2tlcmZpbGU6IGJ1bXAgZGViaWFuIHZlcnNpb24NCj4gICBnaXRs
YWItY2k6IEZpeCBjb21wdXRpbmcgc3VtIGZvciBkZWJpYW4gaW1hZ2UNCj4gDQo+ICAuZ2l0bGFi
LWNpL3B1bGwtb3ItcmVidWlsZC5zaCAgIHwgNyArKysrKystDQo+ICBEb2NrZXJmaWxlLmJ1aWxk
LWRlYmlhbi1hcm02NCAgIHwgMyArLS0NCj4gIERvY2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybWhm
ICAgfCAzICstLQ0KPiAgRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tbWluaW1hbCB8IDMgKy0tDQo+
ICBEb2NrZXJmaWxlLmJ1aWxkLWZlZG9yYSAgICAgICAgIHwgMSAtDQo+ICA1IGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCg==
