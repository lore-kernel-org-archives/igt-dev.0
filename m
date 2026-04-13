Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B48AF531DB
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 22:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C4210E109;
	Mon, 13 Apr 2026 22:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBc6TyWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC2810E109
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776118382; x=1807654382;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=P2KDA5ROPerofjro5ToatH/MG4T8553PW0P0qieDomM=;
 b=HBc6TyWmN9Fx7LKdcqxqVUldEnum/O3G25HEXWY54lfmuZsHu+4JH9sY
 MErHJB8+ADM6uxQtSjjUdSo/h6bpbdwOLM6ljur5tUaCEPlS8Rqp3K5rq
 CBbv4lWBQQ5V4bHfDNNN75MwWJclZtAuPoIndNAPkCKzil7+3a+Ua+JZ2
 ha7iCOGhJ38AcJeOMkoSUVJ8/bhU1GSmbfp7PrH0Vbd8CuwFV/02VYrmR
 8wQHLyPMNN8YxpEVpjSXcFiyyTQw8BYp6zP6DFFP5b4P2mNh/jDsR+q4Z
 FEcWBSyTjFzLAqsBJP0dz6YgQHCwwruwx5fFPejFagk6ErZ7S9EfVpIWZ g==;
X-CSE-ConnectionGUID: dcTsubcfSGKMpNicxTOLUA==
X-CSE-MsgGUID: Ia+cEBJZTWu4lJhMdmagnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64598534"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="64598534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:13:01 -0700
X-CSE-ConnectionGUID: pYEvZ6GeRW2Wsru2Qjpg2A==
X-CSE-MsgGUID: wDrLOJy4RL+nxkFhttqphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253291544"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:13:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:13:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:13:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:12:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kU/8QwrLp1SCBJmKWWOgjH0kT68PiWrU0zsElee8pGHsj2SkM2d8n/VC3qugD0Ehv9xZvsWX7g/nAq5rfp+/FdeOj+dihEPck+Auv2hRca71ycG2x28bTsusMR3GlPumIm0MYtJALGjEoAWtU06JKCwOs4W8yEW6sBXUFNQXATqh0r8Id5bcxFiLG/AIb3bJ+zec6Z+H8l1VFsvmXSGlB/C4wEObfdELi8w0YdJc7NmPkc7tSiVNIhQo0Aqk1sjrwAwLVvAMO7RqhpSdAGxaPJza9aAJekHNEorpmTgzGXH8IxwS4IximNTMhLlMRSBFQj4+veo/FcJdRc19o1E63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m2PWOWa0KMVcNN5lXpOJzPuccZuTyzMLKt41QF+9vo=;
 b=Bgqt8IDudVwp4amUciUjrUgf2/h/FHs8dq5eGREdXTVp7j+lNChBA4O8Pg789F5dciu+aJcjsGSlWoDL84uvCy/3cs94KXPKa4oA13CxiE0GUJMvb/1vuUnoRsqeNV2HDGR9kxuBHabrPW4amXWVX0xFDHTYfRI/Y1hMMQusEcEPng29OaqvYV30KmsgWOEnXuXshUoY5bWfh06bQdBWvbDamMMFZBi4VnpAM5KoKP+9i3hy7H5aezF9eJX0yX7Cyjc4G7rgHYt4rc2WCzdP3auDS1lx+m6ZMFUWxKHIGA29nhVIYL/BSKLDQLC0NKIYjSffeiMyFjTQt9EJHwKNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 22:12:56 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9818.014; Mon, 13 Apr 2026
 22:12:56 +0000
Message-ID: <3e562204-5bf8-4a2b-a143-78a11a5e4d58@intel.com>
Date: Mon, 13 Apr 2026 15:12:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] tests/xe: Add xe_page_reclaim test suite
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
 <9e8c7eefbc307dbeb5553b26759ddd69120897fa.camel@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <9e8c7eefbc307dbeb5553b26759ddd69120897fa.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: fc18bf87-648c-4157-306c-08de99a9d072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|42112799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZwNi8h1NybCS3bLsC6p0VX3ig9em3mYGPPnT1TyprHGOGoDuJq/5NpW10QiGRZVYhYlng1qjWHMx7BcfvgKmBJL7k29VbsPWZVig8JF9oITOgAy99fQ+lH9znd5xnTJpo2kke7mz+DlHNJR/6b2hVfZXoRSiHHyIuGa4uGyTcKdoVqd+CF/26DVxGR7NqXNrboWTO3zOpKHcnGt34mwRpVLHj4qrSDHa0Jl6ebXNf0AHyRj0MsvnNAXEn3fd1eGviXcGL/27d9FHkxTglzmc418OBC+YcrgfsyRnY1+urS542NKNTMKDyN7kjcdh5NbKiEG6L7FFxrplZHwYLSGi9v2vb/kcooJjqnVfdjGEvCadZMbMZN1TmJuna342NIEK71zF7/S4O3/hVpxAgpWfGO4ZtCzjl4yIqdcxDZYKYbv6QOJh+IooebfDefuS+W16vwftcvYf50vQRvaB+iHPeGyW6L2huwCVtdDT6IorurEMmH8loFf13CPHu/pIuAOs++hQFHl9v7MGBX681Cx5cUrtgcG1nK0f5BUFbrv0TVJgGpx7V5g+pWze6s1HX//vDsy04WBvh5ZqpllWmW9jVLIajZZC8L2p+jybjBSdT+0vwKLIVflX52aC9RyBkldguAM4pOxHSSSTD/YeA+gWWKqo9rKM3zwViv6GAVm1wKq8afwYg6dcYJIY2QEGN9AYG30Zi66/MQ9dMWhHG2lfkAf3EdgrYsU3O8bBu1RWbIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmtkaFdEencyYlZxN0ozTlpxZkRNSzV3TVV1WTJtVmFBMFo5MERja1lIWi9E?=
 =?utf-8?B?NHJTOFNsMFBRMGJQc1d0WHNIbk5pcXA2dG9lU1VTeWdFV01GZzFmTHBjQXo3?=
 =?utf-8?B?V1RJeHZIRE96UG92OU91REhJcWR6M1l2YU1CMmVnYTdEV2RZM2hYZlkxQk8y?=
 =?utf-8?B?ZjQ2T0IyaHYrOWduL1liaUl5S3M0QU9VQWt4UzVFeFEyMlFWcEZLQ2lKYU9n?=
 =?utf-8?B?YTBlcFdFSnlyUnJvRnZuK1UvL1FuS1U2RzZxcDlPK3ZrNjZFOFdQWnBrK1Fa?=
 =?utf-8?B?Q2hKdXdDM28yc2xVcVV1UjR3T2E4NzVoR3M3Rk14TjFlWjdDMVhRYmtGMWp5?=
 =?utf-8?B?MzZ2ZDBieXJ5NFhJTGtuTkV0OXp6K0o0NTZuZFVtazdRUGJXVWk5ZHJ2RDl4?=
 =?utf-8?B?bE9Jdmc3NS9MZysrcytxb3VkWGlYVjNkMFMyQkpIUlczVlE2MnNMUEZTTUkr?=
 =?utf-8?B?amc4Z0ZjYjlrdDNmN3pnU0kxU1dZemVZeUVXdGYvS0JkYUNkZ2hub0Rhdm1W?=
 =?utf-8?B?cTJpYUx3OUF5cEcrM0JvNFdjZUZmUnBaTDI3SitSWWIwZHF3azVvczhFbGIy?=
 =?utf-8?B?NzR2ZTFrRFRzMTFtRkJpTTcyUGx4VE41VDVSUFVtdnNhMDZMU2dRUWJLZjAw?=
 =?utf-8?B?TFhpV2lreU8wTEUwd2RhMTVGNDBWOVpMS3VyYmxENmRIZnRNc29HTFVkVVlB?=
 =?utf-8?B?VlJYVnBMR3A0ZDA4QmVLeTd3V20zOUhTc1pHeUpCR3hMOXdIeVJzRVkwaEox?=
 =?utf-8?B?NHF1L1Rsdk45OHc2NTFXZVV1UE84eVVheDZIZHFwa0lzZWEwY0RtYUtmbUZN?=
 =?utf-8?B?ZGpvT2tvbjNtU1lVR2VnUHlNMXIxcUJHQytHd3d1M1R2Q1VtQ3JrVk9OUDJI?=
 =?utf-8?B?M0hzc1JmOW1EZFdEdXdTYldUK2NveG5jbWpwSWE0VERCWVhHVE5ONW5OOEZE?=
 =?utf-8?B?eWNxNjNZdkVWSXVjcTEyT0pWVTVLeVlUemVyN0NEdk5oZFk1SFVvbUNKODd5?=
 =?utf-8?B?OWhFY2VqZkJPWGJWdm5zdS9rTi96UGZZTUNIeS9yY2xrMjlPV1FQWXJnbTlF?=
 =?utf-8?B?eG9ENFVDMTBDL2ZzbFNUYUpybmI2bE5GSktKcnRVcGlHME9CRk9wT20wWWpH?=
 =?utf-8?B?SFg2S25oTi9ENHFNbjkrU3VqOElTTGRWRm9hQjBwd3oxcktNWWd6ZzZUZW1l?=
 =?utf-8?B?eWNtTGFvUzVxU1lIMG1CYm1PeXJDY2kvL2Y5MnNSbWk1SjNOTU54TGpLNnls?=
 =?utf-8?B?SGVuSXpBYisvSXpFT0JwUlc2VzM1cFJlYlBha0g0RUFyMXBnbUhiUWQzQmM4?=
 =?utf-8?B?bGcxN3krajNVSjNNMlpKQ0NkekhrWHRGbkNsNUM4cDc1WThzTm1ldnVWWU1s?=
 =?utf-8?B?WU1GcG5yek1WeHNZOUlzSUVzRktGSVRSTk5aQlhtZit5T0FYYWNLbkpJbE1E?=
 =?utf-8?B?VlFUU0loZEkrUlhzTWYrb0piZWh4bjFQcENkWkJKZkNtSDJHVHFxZytuOElw?=
 =?utf-8?B?OVRYTitic1QxN2xoaWRqcmlVVG1XeTdSM1pXOTJRVG4rbjdmWEdDMlRoSnNa?=
 =?utf-8?B?Y2dSREtpb2tRVTIranNkdDB6RUFIV0xTK1VvSU45N3Y3cnpQVTdJWFZlT1M2?=
 =?utf-8?B?eGZzekl0Q3I4THVZckUrSE5lV2hnVkprSWF0ZytTbmxxVWI5azI5K1ZlTjYx?=
 =?utf-8?B?MEEwNlcrL0l4bkl3cTRTZmNTUmpld2RmaXVHQUhENXNmSDFJWVpCMml4L2cx?=
 =?utf-8?B?eEZlVmhxWk5RMHBWb0tuM1lrMFlIS2dNejBxdWhHL3FOK01MQjdKb0xDY1N5?=
 =?utf-8?B?UnRucnIwRzdLK1I4aEtoaHQyUEtkRWlxQk8zdStHRDBENHJZL3crZ1pRRGQ0?=
 =?utf-8?B?K0pQV2U2dDlwRVZuc04zdUVMQ0dTZkFUbmtOaHp3TnFaWWRRdmtOYmZ5citU?=
 =?utf-8?B?UEUvUHNHeGtGMjF4SDZRQlJSMUV0TGRxRmNJcXIyV0l0d0pKeDR4M1lidTNO?=
 =?utf-8?B?QkhRdUZGenBEcjhMZDI5QUl4cmJqZ0VJcTJTOTA2L2tDZ3h2RjF3VzdSbS9V?=
 =?utf-8?B?OWdxMEN6SDNzZTBpRWlmNkZybTRlVm00UWNMbi9mQnluQk9WYkdnaWNVbmNw?=
 =?utf-8?B?Ym4rQjlqSGxHL1VmMUxpU243V0V3MCsxOVJ5TG9nbjVHYXJ5WVVCRlY2b1NH?=
 =?utf-8?B?cThlZDJ4SU1rMEFmZi80YWNrclg0WjhhM1hIYXRHVXRpMjd1QUkvbUJLSCs5?=
 =?utf-8?B?STNkZ1BYbEEybUtiY2ZrNEk3UDEwT2lucFY2M3BUN00rVitqdFhRUVhSK3Zo?=
 =?utf-8?Q?/kAJF23Jk5ptHC0FAB?=
X-Exchange-RoutingPolicyChecked: W622CNjyFaAEYgCgfpORKcWrSiGxeDw7+l7CKYbULVm8B+RSl2ACKCicIsZm7wbCKQ9WaJUu6UwufJA9TmzI4h6orMCEjJLYEq8ymvnJ2pbsUcNGDYVbnT/otntRPV8l0X8xIb0jGfEQbExPSFRYvHcuJML+WURKRMYaeRjlIVUVHtN6u9QfF9AthF3I/vVJC4X+EaO/3qmkKfW/il/PqPOvcVRszrZtnYWHxG51jGibkeibqA9yFv3axv8gTZXcAixQk3Nepz1iMDLbQ2FY/7tv+VGq99sWw/T9VSXFVB/U+G04Wci8j2uImrzSxg2ZDEDxeqN/Qo+cwKPK6iNJQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc18bf87-648c-4157-306c-08de99a9d072
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:12:56.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFwoyAiFuTBYqBMEK4OVk4CZaj1cWTNNvacJV64VPbZQU6u/Tk1Egl+baaLPDP8pKVmffXF8UrWtWjYX48ZJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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


On 4/7/2026 12:15, Summers, Stuart wrote:
> On Mon, 2026-04-06 at 18:42 +0000, Brian Nguyen wrote:
>> Page Reclamation is a Xe3p feature that optimizes TLB invalidations
>> by targeting only the specific physical pages being unmapped, rather
>> than
>> issuing a full PPC flush. With Page Reclamation, the driver maintains
>> a
>> Page Reclaim List (PRL), on the backing pages of a VMA range, which
>> is
>> passed into the hardware, limiting the flush to only the affected
>> pages.
>>
>> PRL supports up to 512 entries and beyond that results in a fallback
>> to
>> full TLB invalidation, and invalidating the PRL. The page reclamation
>> test
>> cases validate different combinations of the possible VMA ranges.
>>
>> The primary source of validation of these cases is derived from the
>> gt_stats in debugfs to confirm the proper PRL generation.
> Just a high level question here, assuming the page reclamation is
> happening at every invalidation and we should be getting coverage
> generally across many of our tests (e.g. xe_* --r *invalidation*),
> would it make sense to reduce the test scope here by just adding hooks
> to the existing tests to check counters - and this kind of
> infrastructure could potentially even go beyond just page
> reclamation...
>
> Or maybe another kind of related question, if we are adding some
> explicit invalidation sizes/alignments here, are we not covering that
> in some of the other tests like xe_vm?
>
> Thanks,
> Stuart

Hi Stuart,


Thanks for the questions.
The page reclamation suite focuses on specific VMA
configurations and allocation sizes to validate PRL
correctness and edge cases. These need purpose-built
setups with known expected outputs, so a standalone
test is more appropriate here.
Hooking PRL checks into existing tests like xe_vm
wouldn't give us reliable validation — those tests
have their own allocation patterns not designed with
PRL in mind, and PRL is already running behind the
scenes regardless. Spreading PRL logic across many
tests also makes future maintenance harder.

Thanks,

Xin
>> Brian Nguyen (4):
>>    tests/xe: Add page reclaim test
>>    tests/xe: Add random page reclaim subtest
>>    tests/xe: Add transient display PRL skip
>>    tests/xe: Add large VMA range tests for better coverage
>>
>>   tests/intel/xe_page_reclaim.c | 826
>> ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 827 insertions(+)
>>   create mode 100644 tests/intel/xe_page_reclaim.c
>>
