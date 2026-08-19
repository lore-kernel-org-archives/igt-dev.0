Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F86C5DF6D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 06:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25C710ED3E;
	Wed, 19 Aug 2026 06:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhP4NhRx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D0010ED3D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787122564; x=1818658564;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f+3evoRkCjX1jMqATz8E2RewQ47bGyRZbXvwRvWkH1I=;
 b=fhP4NhRx5LX5RkHd6dzYFMUtxPcnGMFsQpRdr3JbkdSN2Nb+3p/kH1Xr
 t9VVmJ0nCMrkZ+BSHSC1jaIq5AjwqG3mPhgUqtrpa3zWwpeHkHr6J7C84
 mPiyY3GPkbS7/SIXjyJpjnrHPuy9nYQdVJ0LDX3X89S1ZDe0h40aa62cK
 j2soeqIGJ3qZuUpjYK26bviJQkVtAz5QP4xxaPS+G+DZTwbT2uo+0K9M+
 g0DBKgiDrUgwbqQiuVKNXzqIUygFCJrA/1KF1mZQElbzevP8Abab52FyL
 mApugaPLqLL5/YI6JewCf3L5bPK5KaNJ1kSYC3HOO8+z68ZqYn3tfMoJ5 w==;
X-CSE-ConnectionGUID: d17+9252QGOtbko18lifcA==
X-CSE-MsgGUID: 5381iOLxReKBp6wW+9sH2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99152229"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="99152229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:56:04 -0700
X-CSE-ConnectionGUID: Q/2aaGlASXG6EGVDEQc06g==
X-CSE-MsgGUID: tGyHP6imTxm9o4Eqvi1g0g==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:56:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 23:56:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 23:56:03 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 23:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yG5cIi0rDRZ+B5d3u1TmnXBoYPoBJfTBbGSCuVuiLaJMngpkYEu3r/wy6Hd0qnXTWEjDggI6hV78ii1jJSWuH5gwuglx8ZdbExMVrPBh3YRd5Dx+byL0FqXe7mgkfFEm+BIXWUMIBa2fcdhTO2MVOgCyuffQmFhVw3EBWx+BUrn3FsNRh4Uzt9vUkJi8dZoBy+CN+H53A/wa8W/Wk+ozNB9SxLzpbM5ovFxCExnnbtNg0aa/C5X43NREIzMiLFIerLGK0twsU9SZ8T7R8usAui7m94SPvuaRgxfEInKOJgY6nZ8dT6z9170tkLssw8RTSWhh+AEitH1p1kQHYEm4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0k1HFA02hG+3qytw18BL0tBQos/trz0Rt6+TkUWfAo=;
 b=vlnAbzRoAxzGg66V2S02urwrNfj+ta4Aa4k0REWCXfbAWBAnMfVx7N7em2wFYXbUGtK2bKzbuqABfcw7bEssEZYkUjt5rgKtQBtHzGSNrYL9sLNK+RvJ/k1Os1kfoloiPHtPLGep2pkoq6t5wDeT0ZSqUJaKEXdbFG/nOAYiwp4VY++h70K/tnbXm2RgNUojTuC70RHvAL1kQwXq+jf3sI+MeN3FRs7HKF/UGiXc0p1Mwy/7d3ISEsPx8yl86+SGpfN8kUsfN8+YJgwh4m3wdDtrdrb5MoF1d7bxjIT9PNNvp5Jur98qWuh226C23ehfu5U0QASYBW+v1qSubzXq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by IA4PR11MB9105.namprd11.prod.outlook.com
 (2603:10b6:208:564::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 06:56:01 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::8e8e:1eb:d7f9:5d7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::8e8e:1eb:d7f9:5d7b%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 06:56:01 +0000
Message-ID: <ce733dba-55cd-46a7-8382-00cced14029f@intel.com>
Date: Wed, 19 Aug 2026 08:55:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 0/2] tests/intel/xe_prefetch_fault: Add L2
 prefetch fault tests
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <priyanka.dandamudi@intel.com>
References: <20260818171239.277897-4-varun.gupta@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260818171239.277897-4-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::11) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|IA4PR11MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: b450bc3a-c3c4-44b8-2e58-08defdbeee16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dZP0QadZvtZQQJf5Ycubej7oS5MI1OhMYOlMTVeNaA2aZOcgaGhDDQbvlEeOBglciJXAjqj7nQPRVakxuT/EhJxrTBI3Uu8g7TsFjnADO1CBdqpDRI0lDkOnW26s/1Ig3/5A9lYImZgNCXkb8FwILh7QoNQahpaP9Yr5oBwocQz5G3dzaan+k7tlNDgejbuhkmzUNu1cAw+KfhCHPnUvyICZjGXADRPyOMhYyqMTBDT5pdwJ9e/MurTI8jx3WZtPhw94zedQpJu1CD1ZuBxUQDOw4urf/ephkupcuqdpWYBRStVszvnTqzn+YojYDSx7LIN1u38GZ2NSPcL3E6yR6dwQPq74vg3s4/+YVq0tnKXPhmAuONP8Mqb7GZ5y6S76aApjAnG1SDUF414uSMSjapZkt2iG/25kErTSWF96aqlWmHqdXwrwhUCAWWEBqy3FA8DGHUOTcGlE4JKhQy7gzxd9UAvBiMQ5xI/L2J7gzmXSVRxRK74KVD0RoJibtyQandshv4sD8xizP0++5lLlVj/TN9el65ml7vGiwR4/K3JSOy5Pmf5sL7jIfBwPf6mFHtyzaSx7ZndHTmH/LugMjsTenSb/uEUXsezfuszvl7dZuSyPUCrm5UYDReTeYquCrTk8UZn44uig1tmaNUadoRoIY8QZyKlMf9L/ICn9HJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGIxQ3Ftcll1WHNGWHRGdWRoVTc3UmlBSVBub3A3QS8zdE9MZEZMNFY1dU8w?=
 =?utf-8?B?aWpZZTd6VmdrWE5YSnI2QkJFUGZmMEd4MVQxVk5vVENLZnExdS9CMHBvc3RI?=
 =?utf-8?B?RVBZRXdyTTZFT2VnS2RBMVNqK3dxaEtzSzk0Z1dYYXc3YkdIM1QwcG9USXdi?=
 =?utf-8?B?Y2YwaWhVZ01wcktYS1B4TEVMUmRKK05sYVBBNmVYM0tGb2dQNjhLdEpvdUhz?=
 =?utf-8?B?eURHb3Q5c1U2bUxEYjlweHplZXpkS1ptMXQ2dkN5SFM0Z3R3UlVyZzJ6U0xx?=
 =?utf-8?B?bjljWDByQlZNcnNZNFNMSGlIZW9wWEtzZzR3Wm54OWp3bkhVSmZWZ3BEa012?=
 =?utf-8?B?Q0FRTnVwSmd3NHVnY0R3dUJldEFoRnVGV00rVmFDQ3VYelFOdG04TFl1d3lQ?=
 =?utf-8?B?Q1NXcWR6UGJKTDljV1ZxR3cyZnhYeklDMjdCeTdROXB3Rmtkb1M5dUtxeFdI?=
 =?utf-8?B?b3F3bmc3S3MyNnlQS2lPdUNsUmUvVk5xSmkyM0ZtbURodTh1WFR0TVIwazl6?=
 =?utf-8?B?Vk8wK2JqVlgrS21pUkdsVHN1bk9uSmdjeFVtaU5OY0hZWWsvZ1l6RmxvWGFh?=
 =?utf-8?B?blVqVW1VKzlYZE9xc3BjbVBkd1VWWkpZNHdpS1I3TFBwaWExTzRaOWg4VGU2?=
 =?utf-8?B?TENkSG5Ja0Y5VGFKZXViR0Z1UysyR3Y5b0NFdGxnZWJ3L2xOTk13WG91aXJK?=
 =?utf-8?B?dWc5UkE1djduMDZoS2taKzVFdS9sMm82aUU1RFNmVFhpT0VHSFd2YzhJeGVG?=
 =?utf-8?B?azkrTDlCSGtQQ3B5dmE0L1J6ZUVQNi9CZ2hlclduaUR1VTVyL2RoWjl2VHJG?=
 =?utf-8?B?cWtHSCtsVzNBbDlwN3NZT2dWTHpDaUxEc2lOR3MzRlpFQnZFOUdmVElNR2dp?=
 =?utf-8?B?dzZ0SUlLVDhOSzluZGZKVGZ3TTg5RGNWc3VWOTJaZVI1d0p6WFhrZDdwYjkv?=
 =?utf-8?B?L0M1d0RCd1JmY0FxL1lLSEM2bFRVSDZGaXpKSEt3R2dVSUFUbDIvSDRkQVpu?=
 =?utf-8?B?MlFGMkMyOEwrL3NRd210RVkyQUptbXgrRVNJd1ZkRVdOb1hVd3dFQWdiWUdE?=
 =?utf-8?B?QmIrYnlhSkMybi82bDVVYm5jc1VCRk9VOVoxSzB4TEptMGx4amJOVldNbCtU?=
 =?utf-8?B?emNFaE8vczQ3UTFhZ0ZrY3lYRnFLSmRxMG1YdlFJeThCdjZLdlpmUEJmMHBL?=
 =?utf-8?B?UEZIWFpqSit2UGpNbDVzaHloMjhlVDBHWGl4MVYxM3BHQmJEeHpadTJOUU03?=
 =?utf-8?B?NTlGb3VyOTdScUhGd2NUb2Y1cThMZm5Xc2ptQm1ubU9Lb2FDamlzbnZKVUgz?=
 =?utf-8?B?OUJBbUZ4UVlqanpZL3BsYmZDTjR0VWo0dWJyQ2dUL2xFemtIbno0bFZlMjZj?=
 =?utf-8?B?ajRiTGNGZXVvRnE1SmRneDA2SFdqdm54ZkcvUEdGejhUMmsxZzR6TnNuaEpS?=
 =?utf-8?B?a2RQNGlhamZTa0tFbUZXSjQ2ak9FVkJCZTZXbEkyOGVDK0VYSmF2MlRZemRr?=
 =?utf-8?B?aHVwUkdYci91OFdqazM2OUtMdmdaZXd6SXFlVUJETlpMSGQyVFRDbjFGWmt2?=
 =?utf-8?B?K2tmRmpmZU8vUmFXblN4b2FEWGNmSE5jYmxkT3lKMGJEcWhoR0dxN0Y5eFBN?=
 =?utf-8?B?d0k2M3R3R0xkWDF2a0RHbml4bmcwK09DRDYyM2lLSzQ4Yk9CTFhlMjhrNUtH?=
 =?utf-8?B?N2cycmQ5SzhrOGIyQzNNTGRDRjdLODlyL0diZW53a1hpUzBxSlY3UWlPdTlX?=
 =?utf-8?B?ajlHNVhHNG1ZUzk2UUxNNldqUURFT0FBRXU2cU5kK0xZS05ibjlNYVFkSTVS?=
 =?utf-8?B?SFJ0bWlINUt2MldKTHNqTWk1b2wwemVyWmhOc0VWKzlETUZCb09rTUs3blBj?=
 =?utf-8?B?S2lLbExvNXFBakVTRTBJZVRINTZISVFpN2RCcDdPaG5EVHdMZlFKY3RIMk9I?=
 =?utf-8?B?OWFkZ2lNbXVhSFlOMHd4dDJ3UWd2NlkvTzR2Yll6MUlab1QrV0Rtb2FXV0Ex?=
 =?utf-8?B?TFhyV0Y0TlZwMGRyQUNjZmFVcEQzT3FwMUpidXhRYnJCL2dpcFIrZXFWQW04?=
 =?utf-8?B?U2FESCs2eGR2WjJta2tJM0Iyeng5Ry9NR29MQ3d1RmdIa0FHSEw4M3E5TkxT?=
 =?utf-8?B?dVpDTDBjd3RXbzV6Yi9xWW9NM1dIanFnRmJSQWhTd0FlaWJSbGNDQUxnTk9E?=
 =?utf-8?B?a29uNmpNUXd3bmVERDAxRmIxM3pvNlFUUDM4QXQ5dDg5T1NNT2pQR21jdUxN?=
 =?utf-8?B?NzZjOWhWcW5DQ1pLN1ZJL1FtbzFFcFFqQ1lvSHlqbzVDNWh1eFlFRjBYUjRv?=
 =?utf-8?B?dU15Smk5M1VFQm5xdFVPYWdSeGJqcGNSNXBQazlneFEzYnJVWDdTdz09?=
X-Exchange-RoutingPolicyChecked: gq5U4cD4Boe/eUQT9LCv1K5X9yaayUAHQFSXZHvVBy1yWP5PS6xqlIGH9tnNMWVXpJmUOozVD3D6HuZBCwIf8GR4CIWJmlQTAnpscr4JPN1H+Fx4UU6Vl3dFN6Lh3fI096EZMa3SYfv17H35LXM2T7QRxAPRxLZYO4XsLx/6UFOo0u2dsCPexhKWsjmj7ga4FyUg78g/MNN/62X56A/WtM8H+A5IygeOe4usFOUKXop6irtlFKG7TDs1EgaxoDOHjyXBZeckQiWF3wlbpQPEO4zZcshZxvvTL/2wjRGjEZJmJdWh784hs0ijNOmk+3MHF5CHedjvDu/LEVtTlKdbDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b450bc3a-c3c4-44b8-2e58-08defdbeee16
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 06:56:01.4599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zl98dANNf2/gKAb8bF+TbwKutuJ4/Lzu/8O+QXZ/RHcOfExikRnqbUUurY1sHbwQ2eSEwsd9LcdX61gtAl2w1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9105
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

W dniu 18.08.2026 o 19:12, Varun Gupta pisze:
> Add coverage for L2 prefetch faults in the xe_prefetch_fault test.
> 
> The existing test framework is first refactored to support different
> prefetch shader configurations. The second patch then adds coverage for
> L2 prefetch faults in both regular and SVM modes.
> 
> v2:
>    - Include generated iga64 codes for the new shader to fix compilation
>      failures (Kamil)
> v3:
>    - Drop the gpgpu_shader__l2_prefetch_fault helper and inline the shader
>      generation directly into get_l2_prefetch_shader (Andrzej)
>    - Simplify the assembly by removing handcrafted dependencies and using
>      the standard load.ugm.d64t.a64.uc.ca.uc syntax (Andrzej)
>    - Drop unnecessary IGA64_FLAGS define and GFX_VER >= 4000 check (Andrzej)
>    - Remove overly verbose message descriptor comments (Andrzej)
> 
> Varun Gupta (2):
>    tests/intel/xe_prefetch_fault: refactor test to accept shader function
>      pointer
>    tests/intel/xe_prefetch_fault: add L2 prefetch fault subtests
> 
>   tests/intel/xe_prefetch_fault.c               | 96 +++++++++++++++++--
>   .../xe_prefetch_fault.c.gen.iga64_codes.c     | 17 +++-
>   2 files changed, 104 insertions(+), 9 deletions(-)
> 

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
