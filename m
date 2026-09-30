Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B6CA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 12:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204CA10EA09;
	Wed, 30 Sep 2026 12:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP/6t9hS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988010EA09
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790771425; x=1822307425;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=WiJRlqkPL80AF+Hb6FZJ9kVvCwdCR007aVgimV9kp0o=;
 b=jP/6t9hSm24B2Z+6SbItBHdaoXzkgVhJmmoNdSYCFsCqWzuV+UEzMezs
 PwqUl3AmyHTCBnbIePm2yM92Ljl4j+nJWQg0/6VVbqdblEufouG381243
 IXHCBZ/BXTMrKLWilEEAHCINhMKxn7S0L6XvSHTHUw0hGejsOXxuBVHaQ
 n4an2J6pxfpQ2OShvPx/wtaLA4zRv1V7zdTdKbGikxRsbJfv3D3CO+7N+
 mzOOM1+05uYAHyPYU47ejhcz3/DGKvto01nPxqrozhhO2hD0Hj4EKissg
 hsyXbBklhcv+2JVxq06DB2QppL0HjPzBDXdHi8JizWH6ejR0/kVV8IjWa w==;
X-CSE-ConnectionGUID: EIMfuCuzTbOBnfYdTVu2ZA==
X-CSE-MsgGUID: aTbYy9qASjma6tjLhjIXpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91524759"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="91524759"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 05:30:25 -0700
X-CSE-ConnectionGUID: AcP/wtOJRTeXxk6+GotEDg==
X-CSE-MsgGUID: oS9c4iPcTRCIeqK/d2oY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="273763470"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 05:30:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 05:30:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 05:30:24 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 05:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2VgBnkUoAJibE8p6xDK6F8JR78gsW3On0Y2I60eV7Af4Mh7ELHsNovQCNGYXYMhztvHR4snJzKPr/L1o2IY+wakINDi7ggcTz4iMcLIETByeo4u5D8/BWH1dgwT3npoa37OyCLGd8kcrztJOVjeWZprwarz+L+S9jqsjlFGkDJ3VL0Ks2EkYiu+r4x6L+P+X/05aJqDjyww0MOa7eV7FEECWpfXNwSntSPlbkYfincjv6shdQc7gTuHiWsA/ljiVrhVZ9qwMkQSVw9Fq25HjpkfsZed9MyO1pW9S9UFip48m/a9VTVm1DDHja3jFbTXPpA1XDBDbYXyvNHdNAQ17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUwZX4slzKJ5kREmYRlKKO8M7Mi8sMS+3a7fdePMqVI=;
 b=nwYhWhdfZh0G9LcI+H3opaEufc4c8Y752+72LAGK/Kx2TRKOzKuzhqrrWvl6aZEcX1FdfnNz/SMxR6k6s3h/ouxKFcjC/9Hs3B8k/ZSvK8m4SFaon24ZNIfUWZVysVwLLIEi9m5pUjGf2D35yw+05zkJwKJuzrLBBPtuA2Gh5GgC8OrbthAxULkdSDOrshatQEBbQwG7+qvWkZYaRl8wLQ4KHpeasDcc1CjQ21heIt5fF4NL8srRewWFRXrNq9nP2VHlRdHLToObzj6Od1nqtOV2pRyikBk0wogwBA6/iLApxRgmh9PKFBA8R6WiLLsW8lpdiWmzMuenWPwHugukyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 30 Sep
 2026 12:30:18 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 12:30:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Sep 2026 14:30:28 +0200
Message-ID: <DLSNHP88FJSD.36EMO2RGBKGAB@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 1/8] tools/gputop/xe_gputop: fix struct layout and
 PMU read
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <a839f4c50d30389830ea3436c5bc157770d81620.1790331690.git.sebastian.brzezinka@intel.com>
 <cvzmslku3u4tnyljjwtzeocdz2mkxopxpi6amy7n4icjbrmtqe@svjtvfgg2ii5>
In-Reply-To: <cvzmslku3u4tnyljjwtzeocdz2mkxopxpi6amy7n4icjbrmtqe@svjtvfgg2ii5>
X-ClientProxiedBy: VIVP296CA0115.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::9) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6eb2b0-e061-4405-783a-08df1eee959d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|4143699003|22082099003|18002099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 1PnbqhrDisLS9JhPVXLtqA4sxMUS2dxvd94PzDBM2Xc8QcRREfAPtJ7t0Jo9OqCAU8JqyClGoBkJ3OM83XZIxWOEu05n1u1WG+4oeC59CJnFeblpOqwVb1tMSJWpwHMg2vJnV9MH361UeKRIxeJmgHa9giB5LkqSxTFKH1aZ6wr7ZG4EC6oRubGYf1NHP8CqA7Ffg7pN3n+vkrrjuVfmSZxyDxn+aETg0nGecWZ4bSPNiDgj2SHFsgL6vqxcg7q50iadngUsQzGBukgWuPmmt2sAgl97psdbXZaS3pbH/5mTmvTy43G6qON0njhhUJYAGRl48EaqjpCGwkknJufxLa72zAkyWasDo5Wn3TxWr6Zo1V1d75ljm26PbooMXFU4IbVB+O/HLNFgqUl1lbX+E7BK5+hB3CyaVEebRMW8hG+dfGj/0ZIsiyqlEn9A+zYIrVa8C0UUNX8WUPCGmBfUAMQn1uZXi7fhgeAQEvxeTZbDJrjeOfYmR1c1oZNLfFfrRit840tqHlU2buX/Q8QKFH+q5tSaua5ja9QDv3+dFfF7Ge/en31laCzCZMyvyfA67iCWnm9ARn3AfIXTA9p8a754bH/DB5OWOY1K+A9Zl9NJHYogRqUd2r4ss2h1RzAsVX6Q47b4V7JAIOG7ZmsM3Xa+V+Fqrcl2aaKjN+cR/tg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXZ4THV3SDBMTUlNaXZ3dGNnb2wyaWZCSWFrbjlZV0hHM0xSWW9MV3NGQ0pY?=
 =?utf-8?B?a2ttdllHM2JWa2VQcnV5RUROYmxPMzczQ285Qk11RWZGUmZSdXFSYnVNQ0dO?=
 =?utf-8?B?bjdIV3lzd0tvdEI0cXB6bDhxMWY1c0p3bytzUGx3SjFjQVRLZzZUZDRPaW00?=
 =?utf-8?B?MFZkaENaampUd0tHN0ZJUGo2MkE0R3ZnK05JS21pd2N5SkNHVEhhQ0tld3F4?=
 =?utf-8?B?cGdORDFVNVFKMmNQdTNCdUJJTTdVRmFEbUEyQ0RxVjJvZUdRMHVLNFJ2M1ov?=
 =?utf-8?B?Wm9iRGRvMGFNcURDSUlxajZPWm9PamFpdllJNDBHOGF4MVh1UWp4V3A4b21H?=
 =?utf-8?B?Z28wMnlDSnJOeHgwcWZYNVhSbVFpbmJjYUFDd3hrZEU4UUd1TGw0cHY3MEMy?=
 =?utf-8?B?Snk4eFdZbHA4b21jTHU1OG96dVZzdVBVcld0R3U5TGlDSjRORUtTMEhDQlBv?=
 =?utf-8?B?bUNtbjhKNXl2T3JNNmJkSmRkN0FlQ1hLSi95dTRhSU5JWnJJcnFUaWh0WEp3?=
 =?utf-8?B?Z05GWXlNdURJL21aak0rTXQ2ODZqVVUyd0xmWldUODh2Y2V6VHhHSStWdmpX?=
 =?utf-8?B?aDVDWFdlRk9jMnlwQzNVZFRLWUF0bEJBWEkzcXhiU1Z6SW1PYVlPNDAvSENQ?=
 =?utf-8?B?Y2xxTzExV0FIdnRrWEtLMkltUmQ1RzRKb2w1YlFrUE50R29sMjViUnF2MU9W?=
 =?utf-8?B?MFhpL2tSWUZWcyswMmwvUDl4NWJHaVFwS3J6dElLeXpxZzJZMm1jemRTaE4w?=
 =?utf-8?B?d1laNHZNdDJrOUhqa0IzZVNnSW93TUsva0tsNThDWHpvUW9seDBRTHNYVmNx?=
 =?utf-8?B?SnE1NGs5azBWeng4TWlMbTVRelRTM0V6Mll3b2JIUDFVRVdmNjVXZm5UTjh0?=
 =?utf-8?B?bjBaSkVQdXZBZU1lSnlCNXRJc2xzeU45SWc1ME9MZVcxcUEzaUtRMCt3VDJz?=
 =?utf-8?B?WStRNFBtcTQxb3VXenRmbmRoZlUyQzJlWERuODZDY2Y3TnpIcWxwSm4vK0F5?=
 =?utf-8?B?a1Y1M0hWK2ZuMzkzR292Q1dtWmVDaVJOckp2VUJwU1A4NnJ6elZ5cWlPNk52?=
 =?utf-8?B?VHJSS2pwUjdldVd6MWdlTEdySmJOZ1ZlVlhKVWYxdFJHdzI4Wm1YdmczSGV5?=
 =?utf-8?B?ck82STFCaXh6cnpkM3dJdkgwLzdlaVZaNG9wdjlueUxPVmNieStaY0F3ZTNm?=
 =?utf-8?B?THpwamx2SElRdVprU2ZxK3g2QjIrdUtlQXNlTVJEcE9CYThLa21iWmx2b25S?=
 =?utf-8?B?NTYwUlMxL2RZbndlalhyTit1OEwxQzE5dGI3bzNsNEJaODNHcWJac1VxbVlG?=
 =?utf-8?B?VkU5SnhmZmlHYVMwYm5DdEZwVm9DbFRGZE92U1JlckovK0FJVHp2WHpQRkIx?=
 =?utf-8?B?WURVTEVKZTlGbEY0eSt4a0d1RWthQ3RVaXJ3SU8vM2s3S2M3bElvcHNxUnph?=
 =?utf-8?B?alFKUlRGUUxjQjV4MEpZM3luMTQrMTkvTmlmOGgweUVMd0ViR2NlT3FwNDZC?=
 =?utf-8?B?Q2Z5Ym5kZXRGK3dncElIT3prYVI0aFltSDdEUHJ0WHpvTFNheURDdE5zU0JQ?=
 =?utf-8?B?K0kzWFJKdURUOTRJMm5oWTRmT3NTak45WWVyR1pwc3NqZXJaZytlaVRMOHNS?=
 =?utf-8?B?ZE5MdlhpVGpETGlhUzV5c2hFc0JtVDhpRVMvUmo5YmR5VzR2WFcyTGRSK3c5?=
 =?utf-8?B?OU5TRGd1eWFMOVp0YkFObnJ3VittM0FndmZRYk4zZTFLRVozam9wZ1cvRnJQ?=
 =?utf-8?B?cXNqY2hHdFpMSWZEa3ovUi9ld0pYSjhIQzBCeENZY21aQWZJRkZxVjE5dFdV?=
 =?utf-8?B?M2pRaUNsekdETzFFdjdBQmNVb3JFMVd6V3BjcHpGcGREZUxaMTFkaWpTMDkv?=
 =?utf-8?B?bGF4eW90cjNCR3JDUlJ3VFZzK25WcTUwbTdMZFpmNzd2TUc5b25lempUY0kw?=
 =?utf-8?B?RHdneURLdUUyMDlsWDZHWExIWnBDOEVEeldnWXFlWkZ5dkVxaElGTFE3Zksz?=
 =?utf-8?B?YnM0WnFiVHpUZitLcEVVRk55Y3A1MS83UVdDNUNPOW1lQWlQM3A2ZCtONmhh?=
 =?utf-8?B?VUtkQnVKR2JQOWZWeVU2bldJcGFRUHFUY2d3YjdMYVZtSzFseXpiZXZXcEoy?=
 =?utf-8?B?azYyMEh2ZmNOcnViWDBac3h4eVBGcnVUUXRsaFB4MndVMVkwb1Z4OFJ5Y1Qw?=
 =?utf-8?B?dW9YYWQrS1FQa2pGL0hUeFgxcjRLd2xSTnlJQ3JaSkhNMGo0VHBPLzZ1eTYw?=
 =?utf-8?B?M2N1SGVwWjNlYXFUUURjczQzaHJRYURXWHFYcXhScUVpZThwM25zUkxjMHRx?=
 =?utf-8?B?S1hmMmZZY3NkUEZHSTZxalMyQTRRbUZzMnRUWDRGVFA1ZWhoc2FtSlFhMGZR?=
 =?utf-8?Q?FpUmv1e+oGubrMmU=3D?=
X-Exchange-RoutingPolicyChecked: bRaJg51LDX+Visekswo9jqSUgTa5ZIXk/khH1kV6yVdt8qb5RegZ7WklyVQ1RrkGNMuQK/+gL8GG0kkgt93dz45NnOEiHgKyh3PhJb+1/pij/PVjs8GmJwGp5eApbUD5p1a58lrEjZ8IF8u3ZfAZsRPKcfvtpTKK4B0Vje/0igbUrgyX++SaN237Da2RXe8mZG+GCM3Y3KIi47D9NcbT07GaPJQVqqi2n5R/slltsh3VPNPKqy0c57E1D+k8JLONjgAxkV1niuWtCq44mxr+l3bvdI4hZhnTsUIHw6ACrNR9qxYiW80a4O/F2Q43mU9WulCUY5dQMJatmooaB/xTPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6eb2b0-e061-4405-783a-08df1eee959d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:30:17.2631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAYTI4b+GnJ77RJnIOgijSBEzw+smhuKozHVpC2eM5AEtxwEkBovWYjdpzwTPexfdunLO6MN0/WpCVdJ0iwDGQN+HY6ACSIKlye0vjhdtYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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

On Mon Sep 28, 2026 at 10:49 AM CEST, Krzysztof Karas wrote:
> Hi Sebastian,
>
> On 2026-09-25 at 12:57:41 +0200, Sebastian Brzezinka wrote:
>> struct xe_pmu_device ended with a plain 'struct xe_engine engine' member=
,
>> but xe_populate_engines() reallocs the struct to hold multiple engines
>> beyond that member, which is undefined behaviour. It is replaced with a
>> proper C99 flexible array member (engine[]), and engine_ptr() is updated
>> to use [] indexing accordingly.
>>=20
>> pmu_read_multi() and xe_pmu_sample() also used VLAs (uint64_t buf[2+num]=
,
>> val[2+num_val]) which are forbidden by -Wvla in IGT builds, so both are
>> replaced with heap allocated buffers.
>>=20
>> pmu_read_multi() aborted the process via assert() whenever the perf
>> read returned an unexpected length since a monitoring tool should never
> There needs to be some separation between these two sentences:
> ...read returned an unexpected length. Since a monitoring tool
> should never...
>
>> crash on a I/O error, the assert is replaced with an error message and
>> a graceful return.
>>=20
>> An explicit #include <glib.h> is also added for the CLAMP() macro used
>> in pmu_active_percentage().
>>=20
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> ---
>>  tools/gputop/xe_gputop.c | 35 +++++++++++++++++++++++++++--------
>>  tools/gputop/xe_gputop.h |  2 +-
>>  2 files changed, 28 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
>> index bb2caa6ea..119545c75 100644
>> --- a/tools/gputop/xe_gputop.c
>> +++ b/tools/gputop/xe_gputop.c
>> @@ -3,9 +3,10 @@
>>   * Copyright =C2=A9 2025 Intel Corporation
>>   */
>> =20
>> +#include <glib.h>
>>  #include "xe_gputop.h"
>> =20
>> -#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
>> +#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
>> =20
>>  static void __update_sample(struct xe_pmu_counter *counter, uint64_t va=
l)
>>  {
>> @@ -212,29 +213,45 @@ void *xe_populate_engines(const void *obj, int ind=
ex)
>> =20
>>  static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>>  {
>> -	uint64_t buf[2 + num];
>> +	const size_t buf_size =3D (2 + num) * sizeof(uint64_t);
>> +	uint64_t *buf;
>> +	uint64_t ts =3D 0;
>>  	unsigned int i;
>>  	ssize_t len;
>> =20
>> -	memset(buf, 0, sizeof(buf));
>> +	buf =3D malloc(buf_size);
>> +	if (!buf)
>> +		return 0;
>> =20
>> -	len =3D read(fd, buf, sizeof(buf));
>> -	assert(len =3D=3D sizeof(buf));
>> +	memset(buf, 0, buf_size);
>> +	len =3D read(fd, buf, buf_size);
>> +	if (len !=3D (ssize_t)buf_size) {
>> +		fprintf(stderr, "xe: PMU read error: expected %zu bytes, got %zd\n",
> Please remove "xe: " prefix from the message. It may suggest
> that this has been emitted from the driver somehow and other
> tools do not use this convention.
I removed it at one point and brought it back, since it's useful. It
only goes to stderr, not syslog/dmesg, so there's no risk of it being
mistaken for a message from the kernel driver. It's a simple way to tell
which backend failed without needing more elaborate logging.


>> +			buf_size, len);
>> +		free(buf);
>> +		return 0;
>> +	}
>> =20
>>  	for (i =3D 0; i < num; i++)
>>  		val[i] =3D buf[2 + i];
>> =20
>> -	return buf[1];
>> +	ts =3D buf[1];
>> +	free(buf);
>> +	return ts;
> This value is ignored (currently as well). Maybe, convert the
> function to void type or add the return check to
> xe_pmu_sample()?
>
>>  }
>> =20
>>  void xe_pmu_sample(const void *obj, int index)
>>  {
>>  	struct xe_gputop *ptr =3D ((struct xe_gputop *)obj) + index;
>>  	struct xe_pmu_device *engines =3D ptr->pmu_device_obj;
>> -	const int num_val =3D engines->num_counters;
>> -	uint64_t val[2 + num_val];
>> +	const unsigned int num_val =3D engines->num_counters;
>> +	uint64_t *val;
>>  	unsigned int i;
>> =20
>> +	val =3D calloc(num_val, sizeof(*val));
>> +	if (!val)
>> +		return;
>> +
>>  	pmu_read_multi(engines->fd, num_val, val);
>> =20
>>  	for (i =3D 0; i < engines->num_engines; i++) {
>> @@ -243,6 +260,8 @@ void xe_pmu_sample(const void *obj, int index)
>>  		update_sample(&engine->engine_active_ticks, val);
>>  		update_sample(&engine->engine_total_ticks, val);
>>  	}
>> +
>> +	free(val);
>>  }
>> =20
>>  int xe_pmu_init(const void *obj, int index)
>> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
>> index 1e3856071..c26db0e7e 100644
>> --- a/tools/gputop/xe_gputop.h
>> +++ b/tools/gputop/xe_gputop.h
>> @@ -41,7 +41,7 @@ struct xe_pmu_device {
>>  	unsigned int num_counters;
>>  	int fd;
>>  	char *device;
>> -	struct xe_engine engine;
>> +	struct xe_engine engine[];
>>  };
>> =20
>>  struct xe_gputop {
>> --=20
>> 2.55.0
>>=20





--=20
Best regards,
Sebastian

