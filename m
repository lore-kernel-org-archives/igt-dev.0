Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89A6CA0FF6
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 01:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFD310EB25;
	Fri, 29 Aug 2025 01:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7YY4kdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE9810EB25
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 01:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756432693; x=1787968693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=skTj5Ti6dGQHPjOXcU/F1pcjPRQ8m74tiBEQh6me55o=;
 b=f7YY4kdFR3mJaOQzi18ywula1/9QVF5EDQjyn0KRZjTbQbf3LCcg5DKD
 6rYF0B/1+NYca3wl3ixuS2behNtTSi6HviTg1EzIxufLafhnsg/7lP23x
 JsJO74SMOFNXOlMPzUtafwpboBgrNNBrmoVx0noE+kHfInyOP9WhOOOCT
 Oc771IIQcakXjSQ0GYDuz+Adh4Kqzbj5HKBhIjndIsUgbZGXOxMqwiSqa
 lpeP3i090AVGAnShDBxYs4njvdiu6+Fy4DTSKAJRxEilIlsp0jZjB3g3F
 u/39cVUhKOYRf3kMn3vHj8E3P+cPf2EA9ElYOWw3aKHDkP2N6fzk1y6oM w==;
X-CSE-ConnectionGUID: 6rcxjJq8SASv+T1NOoAiMA==
X-CSE-MsgGUID: rQQJLlb2T7eTYXOJIL0TTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69310916"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69310916"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 18:58:13 -0700
X-CSE-ConnectionGUID: AK7MRlyjRiKx1FO6iwUF4A==
X-CSE-MsgGUID: 7Aa/HE3HQROpccNrZb85gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="201206202"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 18:58:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 18:58:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 18:58:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 18:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvkDLxCbK9MSQqIDASi94N3AwKNXXCuOykQ9MiZd5BHSg440LC7+3JrIfHqtYWDpZoqqbHNAv6Rwa+cBLktBZwxWMfkm43BMKYQfwuw9Ax8gEzmQ4sFgTzH3scCcPWwdpAhGU421Yx7UcW5qi/DU3oVV1LeiYZEl5TxfDH81ZCla0UVCdMmy81chFe8EKkZKpQ1+ujJPEgggdPIhpaLIJphorKOZ54KCJR91b9FQdCn/Ox2SfcvFJsJuPAElsbPRVvsYEaCcjx84jmWH4z4YSr+eh48m/bNb7vyiYfMlskkWfQ4s944GsA3rGyH10R2D071MnJW5qxnqrc+t96WINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLSbXULzB0wkMKvKj1HbqDhuQpJ8PbCijVYf3NWGCGI=;
 b=RCmzw66Rr8oBQW5EAw149hnbw/ZYfqbm8+wnXFZZUjhmzMF0PYkP+ffWui1ajXZQsIc5DYmM+jRmtkTfbejr6bqNgGn6dNykFHSSNQoIBWEONFncBoEjglMmsUgc2mKpSBvX7hcAKK9MWKClauo20d8Ni4srGogxjLaDo6kblkFzr1HE6SJivWFrH5BCP4oQMK50M6eSBcxy9Kdx/bRkpY6qMrnmLmh2HIroYRvIhCkP5sGhetBySRq26JdI7ngvj3/FcETmoQz2jj4qqOfvI7O1YwxqWkdKNQ00Qwg+izQppKEkPnYgsrGji0DwNH9ZJpzvxl5CtfwoztcqGP4akQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 01:58:05 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 01:58:05 +0000
Date: Thu, 28 Aug 2025 18:58:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_oa: Add a test for tail
 address wrap
Message-ID: <aLEJLJ8JqHAxkVk-@unerlige-desk.amr.corp.intel.com>
References: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
 <20250828214907.94311-3-umesh.nerlige.ramappa@intel.com>
 <87qzwv124g.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87qzwv124g.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0082.namprd04.prod.outlook.com
 (2603:10b6:303:6b::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 3427163b-6f4e-4e91-5c40-08dde69f7e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STRLdCsyenk3eStNOVVqeGZZUWd5bFJkMjlhK0h2Ly9zYmx5SXk5WFBoa2Ji?=
 =?utf-8?B?L3VKQ0hZdEQrSWYwRjRLMUMzN1ZJSmNzbU55a0xoVHl0Z3J1MFZpOTJjelJD?=
 =?utf-8?B?aDRrK2JabVVNZFBRTjFxMno1MW5MWjEwb2krY0dCaE9JVEptaG1acjlMTStH?=
 =?utf-8?B?VFhKQUJEUFFEakZYTHI1UXhQSDBxY3JnWHJ6Y0tUUmZidXBEV1dCYzU5b1hS?=
 =?utf-8?B?dC84UnYzUTJCVlo0TXVuOHYvQ1JrK1JETDVSdEhYdXZQd2Rpd1Vwc0ZNZHJw?=
 =?utf-8?B?U3BIbmRqdUN0dzVPQkZwaVk1aGxwTVBOZWpsVlZJUEd2Nis0NG9tMk54RWhC?=
 =?utf-8?B?ZTVRTzNmTHk3NHZxMlIwZHNRM3ovR1BwcHBqTGwyWDVVUVFTSFllU2dOWldz?=
 =?utf-8?B?ck1WcDNJNURDdkJ5Z2xmNzBwcHhMcW5WSFJjb2ZGcTFBb0R3UzQyc3JTU3VV?=
 =?utf-8?B?MFFPQlZMNGJJc29YMDBHUWFGWGdHc1JUaVNpa21jUVZiRDAzWnprTkgxWjll?=
 =?utf-8?B?cVduZS90NXdwY2JvR2taeTFsdXdzOFhBR3Q5eVIySmxvL1hMSi9lRlBvTzcv?=
 =?utf-8?B?a0YzWm9oL3R3cldLSHJrbTNDRStCbU5jbHltcHhoRmludTcvZkxTbk91R0Ix?=
 =?utf-8?B?WTZzWnFOS3ZoK2JhU2NKQU5UbzlTQmtCKzIwcEpPTlE1MkhUV2JXUitRbm1u?=
 =?utf-8?B?QzZsVkU3N0JKOXNtOVQwNEtjd0xoUEUrUkpqNVRQRjc0M0xrUE5wekdsZkdT?=
 =?utf-8?B?NkRzL2MvZTlWMWhsbmJwb3dSRnlKWGxpVVpId3prNzEyZlVyUmplaWJ5WjZ0?=
 =?utf-8?B?U1VFaTh6WnZ4TFhXYURIT1BqVGJQKzJmeTVkVG4xN0lndDhPckpQa2MzeVlp?=
 =?utf-8?B?K1dmam03QTEwNzFqYmh6WWpFaG83d0ZCcExlaGdvZVF1R3AraFhwdXJHVXZV?=
 =?utf-8?B?WmNxeDdLcnNNaWFiYlNWN0UwbEVaMGJlV3B4QUhqdGhacHpTZWQ1WjIzOXZi?=
 =?utf-8?B?dk0wN3B6V1o3MkFyOE5VWFhoT052ZEVHSEFYUUtMaW5NWmRUTUVxVmIzSGRn?=
 =?utf-8?B?L3NXdHJKM05Ca1BINjczS1V0cW5LeW9MZmhuTFRURHQxUXo2VXRFbTFDaUN4?=
 =?utf-8?B?WXJFUGNUWmlzMlpaOVdaeG5BTTRmR0Y0eG8xTlovcFZYYmIwWnJyZHVCU0pw?=
 =?utf-8?B?UitqTCszUnNva1NnMUlneEdPRnAxZXFOalg5TUtya2ZoMUVXMXpweHdhUVd6?=
 =?utf-8?B?UjB1dzdJditBeHRaeFIzZkcvbHNOa3diTkdLWVBKYmwrMzFyTUF4TDRkU1l2?=
 =?utf-8?B?MkFRL3ZwbmlYTUszZHBXdmk4Q29ENTFpQTUzemVrOUkxWlRGaVRFL0wySzU4?=
 =?utf-8?B?VTBsTmxld1o3MVNSdG4wZ1FnTkVYdWFndEdrczA0RGRXVnExMTRvNzJUTjl2?=
 =?utf-8?B?YTVtc3JtMFozUjdmRHFuQURSMDB3YWRlNldRL0NWRUxpM25aVHRVNkdseEpp?=
 =?utf-8?B?aDV4Ykt4TUFjZnI4emNSbEJrL3dYWW0zb3k0ZEtGaXFqTThEelozRi81RHI1?=
 =?utf-8?B?aEFBamovREdYV1p6YzBUdm8ycmtic0J5OGNBNUMrVzZIUURzR0pHN1NkS0dJ?=
 =?utf-8?B?dG5TWmcya2Q2RlFXazhtVE9KcVVOVzVpSTU4a3ZOWlBMM2swS0VVZWp1ZVlL?=
 =?utf-8?B?YXV3TjYvMm16RzhZSlVBU2oxU0hTQlBKRDBsY1lCcDUxT3dqa2FkaVBsT1o2?=
 =?utf-8?B?bXpKb1lCamFBTlJoNnliSEVEMWI0SzRWTGxZYlJzTjBIeU1qMFBFWFJNOHho?=
 =?utf-8?B?Wk4zUjMwQURERld5WmNqeEJhaWpEVzJLSVFDWjA3bnhzU1BVTkJGM0tKWGo5?=
 =?utf-8?B?SnJWeDRCNkdqVUpYUytSZFhOdGNCekVHN2lwQ2JUOFZQQVZPS2NRanNYWlo4?=
 =?utf-8?Q?C72YGyHlb40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGxvdE5NREhQS1hhSkZ4ZEc5cDR5QVNrbncvZmJQZUpVdGl0NW1LeXl1Z3Zn?=
 =?utf-8?B?NXVYNWlJL2ZwK1drMG5XbWRYNzI3M2c4REMwSWxpcWduanVzM0JOS3hscG85?=
 =?utf-8?B?QjlhaXZEV3VSN1h4MmhLK2dxd045NFhMNkRLb3ZxS1ZaY1JrRFdLOEYxVjBW?=
 =?utf-8?B?ZXNWU0xpeGh1MG5nZWFwN1pwZ3lOT096RXpTRHcyTzltc0hFVExZTkZLSVJW?=
 =?utf-8?B?VUhjQ09jSWJaZXJiQXd2WjQydStFemlsWW92U3JHOFhhbVNrTU9zdEVacEVX?=
 =?utf-8?B?aFpxMTErQ2xZR1owY2RLd04zdlhJVlgwVXdhd09vWWdlc2ZXcFVIZHI3VXRK?=
 =?utf-8?B?eGRNMThCT1lvRFlDMThnRmV6SUVlTWNWaENsTWVMN0pocHFaY0E4d0cwSDZI?=
 =?utf-8?B?bjFQQUpWMSt1WjBMYTNjTkF2VlYybDN2cTVUUWJPRk1jdmFjY3VYSE9rYklu?=
 =?utf-8?B?cTZqODJMRTJxQ2RralhkdlM4Riszd0gzVzdWemg4cVZKMkpDcmlIeDdBb2pX?=
 =?utf-8?B?YStwK0VMa2RhL3N2azNGYlZFZElQT1J2SGtrVm5WcUdHaHFuTzlOazJKV3I0?=
 =?utf-8?B?TzI5blBkOExXMG12TERCb3FYVGNxLzFoMCtMWFdteFJ1a00rWDJ5NzdnckMr?=
 =?utf-8?B?bmVCSnIyczFrbnYrWk9ObVNwZ3E4TkxZU2g4TCt6YWpnbGd6UE1uVEZraCtO?=
 =?utf-8?B?ck0yWW01UkdrVGY4aDhwZ2pzcnZweWxTVU9IRzY4akVzaEc4N09meXlubU96?=
 =?utf-8?B?Sm84RHhhbVZFRVltVkRrQnptREw5ak5lQ084bGs4SjFVNThrSTdxclVqTHBj?=
 =?utf-8?B?TkQvSllycTBvdnZjeXg4NlI0N1hkWWJ4SzlEbTYxU2xRNEE5YXJKK292WEgv?=
 =?utf-8?B?OTh6c0RPUlFZZm1NMFVtTHhrYUVDL252c1VlcmNDZ1h6QnpqMG11Z2gvbnFW?=
 =?utf-8?B?UTB0bm54R0R2dGxvN0VDYVo3VDVJa2gwVVR0S0tWME5xTjdiY044ZE1JeUFr?=
 =?utf-8?B?ZE91bW5pU1hXS3ByMWRsOFg5WndFOTF2OWg4LzYyS0hmUEFLTVlMQkJIdmpR?=
 =?utf-8?B?aENhdUUvMW1ic040aGpwK3I5QnhaaVR0dVRySHFpS2ducFUxOEg2UG5vMXlu?=
 =?utf-8?B?d2tQbnFWMi96RDV0MlRXMnlPVkt6SzR1d1ZTYlJhaFdHVVk5TFpnQkx5UDBS?=
 =?utf-8?B?RHQ3a0hNVzl2eUdaNlVqZGx1b3Ezc1liSlMrdUs3VGFybksyTmlNeklPQVE5?=
 =?utf-8?B?aUlXQkZ5bXhWUHZMZkxGS2U5bVpiZnA4T0kwY09xbEE1bFAxdFNBWXVWckVx?=
 =?utf-8?B?NklZVkpEZDZNSlFQYU1uUDBBR2JmWDQxbTNMWksxOTBFRnlvZS95Z2loRVNI?=
 =?utf-8?B?TjhmZ3F2K2xiK1FKd2gzNUovL2ZmNnV0eUp3aXIzWkpUUXV5QlVnTDl6clYz?=
 =?utf-8?B?d3U5Sm5CamNJL1oxTS80TXk3WWJkVzk1VUQ1Qnl2cjZmZ3owei9RejR6M01H?=
 =?utf-8?B?dG1uMmF6Y3hQZFI1VXZENVo2UzV1Nmg2Yi9SeUEzcCtYNmxGVW5Pd0MyYitV?=
 =?utf-8?B?K1lZR3E0cnhqN2x0NmFMeHRFbTVibkZhZzZlNndxTDhNSkNEOEdoL1U5Z0I2?=
 =?utf-8?B?Z25JNU1VbmdyRlI0Qjk2RzA1UUp3UkV1L0lKUlNYS1JJRHlQNFJJQnYzSlpq?=
 =?utf-8?B?TElldjhjS2NidjA2by85dnhRUnhMU0Jpd0JiWjdFb0hzZmI0R09LOU52UVZh?=
 =?utf-8?B?UEZUZS8rcmNQamRpam1Jc3VoVkRqVld1NTNvQUZka0lSbnZnNnVkK3dQbEs3?=
 =?utf-8?B?OEgvdWpudG9ETlU5RXlqS3gzc1JKSFp0TnJFSDdKZFBpclJNeEwvQzB0NFdy?=
 =?utf-8?B?aG1vNnVWbFJrb3lYVkpuNGF6ZWhxUVVNaU1oVFBvUDdQVkRFVkM3TGtVU1V1?=
 =?utf-8?B?Nnp3bkxGSDFCV0h5MWFzVkxuWWJJR3RKMWNWRExhcjIwSTN6TFQvNld4dDNQ?=
 =?utf-8?B?RWwwdzV2YXZPVXdDbmpCWDhSdWJGTS9vRHIxTkdjS3Y5Wml4RWgvU3BpM0Vy?=
 =?utf-8?B?enVtL1JJazNWZUVEVjcwZjJnMjd5enQ4blRtMkFETXpXb1VYZUM1S0RvY3h1?=
 =?utf-8?B?ejlPUkxKcGFYSEY4WDZieGUrUTJPZHNWZ1hxdTBrbW9IOEsxbzlmRnlWWDVZ?=
 =?utf-8?Q?VpoIT37s+DX4BC2YIEAY5/E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3427163b-6f4e-4e91-5c40-08dde69f7e97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 01:58:05.5901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5u1YYwHJz37m1/DjmLaxkGurKpFe6oG4vOFE7RohM1X5CvN4i3hMMjZ124mBpviVW2I+XntOypRtsEoRub18oAhvmUjZh2Gk/9e93UWPVL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
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

On Thu, Aug 28, 2025 at 04:02:23PM -0700, Dixit, Ashutosh wrote:
>On Thu, 28 Aug 2025 14:49:07 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Add a test to verify that the HW wraps to start of the OA buffer when a
>> report does not fit in the remaining space in the buffer.
>>
>> v2:
>> - Make test more robust
>>
>> v3:
>> - Just wait for buffer overflow status instead of reading reports
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 3b3cdf9314c2..443e0b1761ef 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -4541,6 +4541,63 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
>>	try_invalid_access(vaddr);
>>  }
>>
>> +/**
>> + * SUBTEST: tail-address-wrap
>> + * Description: Test tail address wrap on odd format sizes. Ensure that the
>> + * format size is not a power of 2. This means that the last report will not be
>> + * broken down across the OA buffer end. Instead it will be written to the
>> + * beginning of the OA buffer. We will check the end of the buffer to ensure it
>> + * has zeroes in it.
>> + */
>> +static void
>> +test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
>> +{
>> +	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>> +	u64 exponent = max_oa_exponent_for_period_lte(20000);
>> +	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
>> +	u64 fmt = test_set->perf_oa_format;
>> +	u64 properties[] = {
>> +		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>> +		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>> +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>> +		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>> +		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_size,
>> +		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>> +	};
>> +	struct intel_xe_oa_open_prop param = {
>> +		.num_properties = ARRAY_SIZE(properties) / 2,
>> +		.properties_ptr = to_user_pointer(properties),
>> +	};
>> +	u32 fmt_size = get_oa_format(fmt).size;
>> +	u32 zero_size = buffer_size % fmt_size;
>> +	u32 *zero_area, *buffer_end, *buffer_start;
>> +
>> +	igt_require(zero_size);
>> +
>> +	stream_fd = __perf_open(drm_fd, &param, false);
>> +	set_fd_flags(stream_fd, O_CLOEXEC);
>> +
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> +	wait_for_oa_buffer_overflow(stream_fd, 100);
>
>OK, this is a neat trick. If this works as expected in all environments,
>this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>
>Is this enable/disable really needed? What if just open the stream as
>enabled and leave it enabled after the buffer overflow? Anyway, ok to leave
>as is.

Hmm, maybe I could drop the enable/disable. I had added it earlier to 
account for the first check that verified that the buffer has not 
overflowed to begin with. Since I dropped that check in the earlier 
patch, this is unnecessary.

Thanks,
Umesh

>
>> +
>> +	buffer_start = mmap(0, buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>> +	igt_assert(buffer_start);
>> +
>> +	zero_area = buffer_start + (buffer_size - zero_size) / 4;
>> +	buffer_end = buffer_start + buffer_size / 4;
>> +
>> +	dump_report(zero_area, zero_size / 4, "zero_area");
>> +	while (zero_area < buffer_end)
>> +		igt_assert_eq(*zero_area++, 0);
>> +
>> +	munmap(buffer_start, buffer_size);
>> +
>> +	__perf_close(stream_fd);
>> +}
>> +
>>  /**
>>   * SUBTEST: map-oa-buffer
>>   * Description: Verify mapping of oa buffer
>> @@ -5099,6 +5156,14 @@ igt_main
>>				closed_fd_and_unmapped_access(hwe);
>>	}
>>
>> +	igt_subtest_with_dynamic("tail-address-wrap") {
>> +		long k = random() % num_buf_sizes;
>> +
>> +		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>> +		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
>> +			test_tail_address_wrap(hwe, buf_sizes[k].size);
>> +	}
>> +
>>	igt_subtest_group {
>>		igt_fixture {
>>			perf_init_whitelist();
>> --
>> 2.43.0
>>
