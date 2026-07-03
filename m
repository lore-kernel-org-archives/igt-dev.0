Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6A5C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8DF10F93D;
	Fri,  3 Jul 2026 21:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOvxMjDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E81010F939
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112811; x=1814648811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MyCUdkr083IRlxJXPgWnOkR17O/zPLqi4skf1AHL9IE=;
 b=dOvxMjDjKVHLpzPSh/TJdusrBj6BqbSbd5o9Kwxi9rfHazEh1Z2U5eXJ
 vn1jPvSkox4BZs30GRRyQMVwaSQmVIQ5Dw/coO7htd6eWC4rKKy+MO5Qv
 LETX4sYrDPXRFAzeFwl0lNhBjdVkg50ql0V3yvcSwUDtzpXNSJNHoqCNP
 yAkWcrC5eco/TlK4E4CpTd7yp0B0W8/D21ONno2HhPMU32EiUkjHRKaHV
 jUIxl6RpV+pzkVYELSw9NU16MNBoX4mGHNsLQG4Ikk8LaX6PFHJfh9adE
 MRfhxVOeCPAsgetMJJG9PMt2Hm2TsfwkPqERpEAg7wnfYhBL+rtaITz0w g==;
X-CSE-ConnectionGUID: GKUvJN3aQI+K6HtXzukhSw==
X-CSE-MsgGUID: Spc9LEcGTJqVqvqIpOdobQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95366350"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="95366350"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:06:51 -0700
X-CSE-ConnectionGUID: NtIkC/QnRQC5nKh1kH/jfA==
X-CSE-MsgGUID: JxxG23HRRpWA0ZbP0zcnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252719144"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:06:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:06:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:06:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:06:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlgdE83oibQvD1RDi1R/KtvfSMCIuMM9K9+pLOjI8ARUzMYsoAL0zbDOttTqVMW0T2iej7ishcKE3xYCi5ZwBvP8CGZ1v4JwTAvI2urXeXYtzkfaELN7TJFXPwAFggEQuA9tdBrjIvBlfXuBIMi9ytrT12naCS6NkFhOQN+UtfiCqb6w1iQRhV0WqE/HCku1tLssSGpqQorDxawR6DRz8kfhOHYEsVRS3sOSzaIdlXMhtzvTl/O2Hw+nXNejZnnPLhDy3KUVOlcI44lv3h2pw10qa0/jJDA5aoSLUziwR7Vtsc7xka6g6XTy438P5hu+qzJ9K2PE/ps6RrurXDOPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/wQi4idt5aDqhKw0J9mXOGt1+64cg7g/HBmrYlbalc=;
 b=Z8JRLknBr7L02UEnonKKUjDWOJX0dt9+G3I+9W0KnWtPvoV4vVBvzs76YH4J0gB8lDsoQY6Y96oAthsLXSogS8j34JfQS/lbEXQN61bAgHTC7TohFAqmFg3PM02NTkP8uZxJCUCwfrXwYUOP02TFCXp+tiT6gIM/djB/z8oWvCfb25LCK7REEpie3xWi2E7FQSVKWrmJQi8r6epN3jBcfDhELM8D/+kQkvIEk+8yAWLIaAc+qGJqn1UF55DudtuWvBMd8PFlxkcJ0GIWsV0PcpCG7nriY8w+xJxm4R6phfn/biX5g8KhaBydtnxlIvKeK9bawh701fiKyxy933pHog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:06:46 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:06:46 +0000
Date: Fri, 3 Jul 2026 23:06:39 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 23/31] tools/intel_forcewaked: link with minimal
 sub-libraries
Message-ID: <hlbdghl536lrhdz5nc5i2g5fmawshv6bndqdpvf4hvm42j5dv5@w2lx6mxl2un7>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <5aae7a25f6c0ea82c1f9cf6f8c760a901bd70901.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5aae7a25f6c0ea82c1f9cf6f8c760a901bd70901.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU7PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::14) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b656c87-9b41-4de8-24e1-08ded946fdf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: xfXCV2i/qw0N0/k5iOqyPMV7yVSAqQi91YnwCgOiFVxGT4qG7ohZr1O9FP2z4qqb+hVMi3xAasc8Dl5KaSWGpdUEgYWnK8CzClnywKpXg1VxxKwq8WDt6K39byJBZ9MeyXVBnU8XeKZqet8CIbC0P2wdtmLOqGFeI1MpUecrXVGXLDcIJRl+dbsQzIiDnXUQ8sL3x/RviXZL0BxP7b8ahiulLa3wcs01GsjVIqAi5GNjtelONuic33rrV9u+LNvkf7s86jgL2mqFOlTwRuLZ3Ud5QD6QKyMY0XXxo7LCaK2zItrmO1mc0jdHgPWee2H3rKCDcUhspivIBElqU0Uxg7jC89lzoA5YYfIc3irl1tRoegDiD7F7PekG8dp+UxRA1P+WiogZGljt2qOxlBKwRBh8ba6QPdiZ2viCy8G6eGRoWPH2pIPlnwFbIN9nV4jJBj9oth5SL3gu4+EmOQSAZVl0eOrIqatwdeLHiWHmhv6YkTeRGrfdyyUrYJILRkxFCoZzrSy5zRlglB/VC018G9aLioOGtuE+as7YE5EBsljohL3mvCEsLTWaVs2GLMutRObAZ9r2ea+d/3DgyKBO0uraNMvDH7CRoGj7lJE8D2k8mTcLHSKMuOUecWakI2BgT4bLgg2dMJWyUch6bJB6SbOaAzVkNOHqOSrzaiLi8sk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWl0SFkzRyt5NkQ0Q3huNUNjOEwrRUgvdzRoV0tUUzU1aEdXeXd0Mm9Ud0xq?=
 =?utf-8?B?aXN2bGEvamU5S280bjRid0kxdVk5OFlZK2ZlTjJWa2FlenZrN2ZlN0t3cFZw?=
 =?utf-8?B?cklYejhNQ1d6dVB1OEgvbzN5aDM2WitNY3hCRmV4WExycGd0a3UyQm5Wd2tj?=
 =?utf-8?B?a1V3VU1rcWY1UUhpaFR5K1hBbkF0eW9raVU5aVB3YzZtQTgyeGplY1loT0lI?=
 =?utf-8?B?TGtremRyOUROeWlDVEJBWCtKZ1NuMFdLbU5iam00T0V2RFlWaDZWb3JqWXgz?=
 =?utf-8?B?L3NDeUFBT3JueGpsMnFLYm5KSDZDQkN3WHpIb2ppNXhXa0pqcXkwelJjd0Vi?=
 =?utf-8?B?aDhUT3JBem5XVDdtWUhHOVZqRlFqc21pQzRyczRQcjdOMlNPWmF0emtOaGFW?=
 =?utf-8?B?c2NWWDMzdWpIUXgzUzdPeVdNcE9LNWJVOWc5Z2VHQXUyZGVhSU5LN2cwTXc1?=
 =?utf-8?B?OW1EaXF4QzFzRjFDeTZ5QjU1TkNsMG9kT0tzcmw3VkZpRWdlSFVXanRXblFy?=
 =?utf-8?B?amlMQTZ1VjZ6V1BFd3BCM3hkMXNqbGRrYjdUb3FOYXNqaWpLdjk5MkFwVkx1?=
 =?utf-8?B?a3FnTlJ5NERMTTR3Z1lQaWllMUJJR0dOYTloZnhmY1NJME9RbFRhUW1jUXpr?=
 =?utf-8?B?NGJHeGpFUjZyMFhTdk9wYWhzYURucHh2QTNOWkc1OTRDLzVmejA0L01IZ1VG?=
 =?utf-8?B?K1hRUHpYdExPdWlmVUZyWlNxc2RyeXpBNUNocU83aWpqM2QrU1ZaMy9GN3Uw?=
 =?utf-8?B?ZWh3dUtkeHg1NnBYMGxFZmh0WGo4bEJzMDAvb0tXSDlCUUFyNVdPNFA4aWcw?=
 =?utf-8?B?S3I4YnZUYnBVUTh4Mi9HZTB1MUJaSS9Sb3ZiVGtWZUNRVnkvUzFGM3FwSmox?=
 =?utf-8?B?c3B0WFJhYm0yUk9PdURrRmVNeUoveEVHZ3FEWG1PbWxoeU54dDRxUWI1NlpM?=
 =?utf-8?B?R2xWVk5rcm9zMjVLL1V1MG9mZmNFSHNVeHptdjd2TFp6Vng4TnAyc0Y3bmNK?=
 =?utf-8?B?VGQwZWdlNHhzZHJyUW5GOVJjK0VFUGRJOHpNbUNpckd2dkJPNG9DaXAyMnFn?=
 =?utf-8?B?OWZ4WWZDYzhxQngwRXQvOFl1K21GSmt4WC93aFRVelhpVFI1R3l6QVpDNTNs?=
 =?utf-8?B?bWZ2Z2RBeFFJSE1RNy93cFZBdnk5a0tPTzFwNW9BODZuV20xVElESHdEZTJL?=
 =?utf-8?B?bDUrWTVzaDM3WUtxUlBKc1F4OEY1MGdEOEFFenJMMkZZVWdzOWlCU3VDNStN?=
 =?utf-8?B?TnBueU5MdWJUbTFkdDlNajhJOFhDZ1JBNW4vMVhpNmM4dW04bEdDTGJVc00v?=
 =?utf-8?B?MlhDRnRSM2NsL2FQMW04RkF6Q29SWDNNdjVXWDhxUkwwb05CNTZsT1B5Zmhv?=
 =?utf-8?B?U25GQkVxYjBTaUkzMjVqRzN3bXpUODA2N3p3SjY5aWVYTTBtcWJyZ2dobHoy?=
 =?utf-8?B?RExKbnZLN0YwbThZOHh0c2I5ai9CbFFPQkNIOEhPc0phbGJYdVRZRFlZZ3BI?=
 =?utf-8?B?S29vNEF6MzVCbGhwcXJsYTBkVCtaNEN0eTlkY1VVU1prY3kxZkQ1V0VsVlQ0?=
 =?utf-8?B?VkFkTjViYjJUci9UTU96YndVc0ROY1BuVnN2S2lFOCtYL2RueGd0OFZDRTNQ?=
 =?utf-8?B?ZmZFOTB4ZWJKaFhCaHFZeEZMR2JoOFFRelRNSUFBeXhMYmZCcDVDOStqV1ZB?=
 =?utf-8?B?YlcxdEt4emZoM3BDeU9qd09sRjFFTjVrOS9Mb3lQWFBYcFpJSFBkWm5RY00v?=
 =?utf-8?B?akd2ZUs1T2J1S3lTYjg2ZzhXVkE3V214UjQrdVVQV21xcjduMFRxRWZoS0R1?=
 =?utf-8?B?TFBMTlZYSmpXVmIwMmNkUm5VZmRjVFBremNkN3UzU25jVkZLYkltczZCMTlW?=
 =?utf-8?B?NktMQVRpeHJUcGdDQkVHVk53aXpOYmo0bS9heWhvRlE5OG11ejFDNlo1ZGFX?=
 =?utf-8?B?NWh3WTVWZWRqNU4zc01yTVRSbmxjcEI3dVJKaFhmcTI0M0FXQldITE4welNp?=
 =?utf-8?B?Y1dHSUFtQzlGc1lacUk5TDhnZEc0QTNuaENiRi9GS3Y0UVhqWUVQWlEvSU9y?=
 =?utf-8?B?MU94SE8vUkNTWWU3UUpnMEU4UEUvMklDQlJQUW05V1JWRGY5Y3JoMVltY3Bm?=
 =?utf-8?B?ckllb2g2UnAvcy9FckdFenh6QjR5MDkxMThaUmRVTW1JVndGbkkzMGFHTEVI?=
 =?utf-8?B?YWFUY3JMZklhZmQ0TGRmYVl4VVVyVlo0OEFERjNnU0lobENlVFFJVUVWa1ho?=
 =?utf-8?B?c1RsallZY3lESER4bFVLWFBpNE5TTHRVR3I0SlhuV3Z0KzBBZmFJWjNGaEJO?=
 =?utf-8?B?R1UxV2pGamM2Y2lPcVJ0K2l5K2JwMUJ1WTVnakhYZUMrZ2VyWml6MTVyczQ4?=
 =?utf-8?Q?3Bz/KnXe4LrMInSLZ5T0eUU4iG3jQUrhh/KGVVEiUCW3b?=
X-MS-Exchange-AntiSpam-MessageData-1: +cHQBl7/GyOqAJ0O7+k3rogSEEHm6b1dfB0=
X-Exchange-RoutingPolicyChecked: WBz3tXUmpYKSJc6h9/o8fWCWCaI/9SzvUbGZ81qwUKcr0EOFD3nd+ovuoPdLjjU9eCdW3SDZ0LLMYAyqGoIfm4GfP4MKvNW0H3JeXEiB4ZjMymm8z2zD8O12V6dR19FwJ1+KHXmPVFuhWTq2AYmQ3GsFjYzsyYYpUaBCVNpHjF/d/d3jGN+HTwgecZMmioHSIKrD3xlshdVQrreQKzDzBhD2i4UcjXByd74L0uW+Ecr3AyHcaP9HnifvqPPP2on/TgyzuBuIH58EVRbEHekzzI3/nEEUXaWO3+ykTEUcgSeGcap/V8d9P0NrD6OGGsLeheyhO5waoHC3vfHPGmbBaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b656c87-9b41-4de8-24e1-08ded946fdf0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:06:46.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwCYTRHTMVkbYijb2QOgjSJUXSE9aa+XHOrWypnIso0wFjnFLi3UeDcvPeVL1CesHCOzV4l58gAJYiEjcuEVXrTxdkTMG0SHx/Px507h/z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:57 GMT, Sebastian Brzezinka wrote:
> intel_forcewaked only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index f9bbb41a9..15bd40dec 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -18,7 +18,6 @@ tools_progs = [
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
>  	'intel_display_poller',
> -	'intel_forcewaked',
>  	'intel_framebuffer_dump',
>  	'intel_guc_logger',
>  	'intel_hdcp',
> @@ -108,6 +107,11 @@ executable('intel_audio_dump', 'intel_audio_dump.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_forcewaked', 'intel_forcewaked.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
