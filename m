Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB64CD8CAA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14CA10E53E;
	Tue,  9 Jun 2026 14:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2xBp3DV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B9A10E52F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781016843; x=1812552843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zip26gzjaRFNyOmdCP3cyH6tbgpPf+8MPsbwiGl8wQY=;
 b=L2xBp3DVKgZfMLMWX8K+5W6KhS1Q2hlKRzo/3trbITeoyjvwQsUA4o5y
 /S/OexMxD2qhMs18Sf0eb44KdzfJ+4Ad3G86mpCWzodTYE6VJlUfHLvmw
 FvCWpwTVV/6ZNxA4dmZDI0cRykHe9N/LSJtItgHVfTOvoCHXLdmaZ0GF9
 KFq1n8svZ8AcvMXEIsy19rl55bVhXfJYpjtSOtoAyjLEwcRqmHhHD8GQU
 nvaMeHcHPsbRO3n9gdC0Dtv8QUyKwQEQHII/DbJRAeoO1yBvoU9q9cKJA
 1zc2ykmN3sj4n9SAsPnuyQsHPLDtkX7pTBKEZFXZUVro97HtrHrcHoxfc A==;
X-CSE-ConnectionGUID: 5Ez4Vn7dRYmJ3h077I7lxg==
X-CSE-MsgGUID: PISHvZ9zQlilCa3gcKvk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80799937"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="80799937"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:54:02 -0700
X-CSE-ConnectionGUID: d/J5TyTURlC4po7DOr5eXQ==
X-CSE-MsgGUID: 1izh4nNTSaqr54YzGOHWLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="283962940"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:54:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:54:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:54:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uu9G9FS32gYm0QvsKdBagguJ/+Pt63FwqOrxbQpVcYNUZ3d0bbaxMiDRtV+6CZOjJeaCt2HKNZvnWXURNEnuyAXVlnM8gja7ylhnR5jyuBnxvhrp9oysgMtX2G3dx7gqXejtXRFLq8ViLbQqMpY+c6nRz1nuFOO1K+xsv5w9iCn8oejQK1FUw6zAfirfwUjMRGKlyzSYoq94siXrhSz6YHbPUsY9/PSiK41ANKmusHe1HV59PQ5if3y34spcPqX6PtlFsAHRuGGWa2oTStwa2xfCmNrJj8oTY5PNzRyHIr+Z/XUeSYoY7tOfKN06duvRxoo5d5JLnhLU/MHlgdikPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuy9dfaDShDmOQ0R3Ken/Lh6/fQTA92VR8YuDLQ/y34=;
 b=wAHKtOr9uxngoBWhsU7EzXGHYzMRuPygqC1HWbj0yf0c7gL9hMAAtEBDkbMHXRfY4UN7jdvhOLFoYPBTGFxTZtllkQbszmtVjbpDFp5mCnIdMKKczaXLBx2B0zERlz0lPiWN302jK4Y8ikoL6YjTo/RJAdFPsvFsuscy9Y/SamXUI0BZ/OLju5rtahbQpOq3RuqtTu1nYkaCIqJrdOFg2B/dHx7RR+rAno2MJ0r3SBXuS3xOqVm5UYJVKoYmnzczdN69FkOQcP7Z+VXap96cMYOPfHKrPnllFzO9+ZLYJtyXMqJa5/Id2DHyXGSiAZhCV9Pwv5c8xGaDqgTnPZ4jSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 14:53:46 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:53:46 +0000
Message-ID: <89fec9eb-5efa-4c1f-b28a-7ca1eb0d2734@intel.com>
Date: Tue, 9 Jun 2026 16:53:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/8] tests/intel/xe_sriov_scheduling: Add PMU-based
 verification helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-5-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0121.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::14) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c07fadd-bb22-4624-5f9d-08dec636e83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xMfA4mUSHIyg/QgfllTMf2msGxmVm7eMGTWacl0ytDvrkwU/AINtOtgmT5xOfYxDvn6/J77Pxri1c1PQ556E7MbP8fJ6eRO/J7XvAqldK8wvMf1i1fCpFkqrje/s0agln/79IiQ54+OD+E6NoKk3La7p7whJJ2MvkQotcB/8FVkpSDmh1e1QFRuISTuXVLAShY/ILNx96dfM2QIZF08Czb4XjxHmkgBaC9IMpiTdN3E5/JZ7J2ZfroDXaNnvf6iOJAz+IO1DVEDEbGOTu0mHiPr9nxdKJZYGPkpTP5NqNsV1FMbzZZUGUjaEQUe/GkAMiqAjHM/zUrxaHwcEUe7gR6dfC2yvS+A35qZfxD1vyjUoJPv5rdIwKcVeAU6uERonmN4cnSVY73DiFkynBpQq4Rr3wtJGP8exdG/F6CBl2PHd1vFwbB5IlVGXeRSMA6zusRRoOPHwGLqCysvJVq0nfrMQFdbZE2JQiFuTeTWgY0ES4aIzi4aAvg8vzrDhNKi4w2OYo4VKfgmZka8HdLj3xfQ2jROuDLs3/jYTuIzvstyLJEmRerFarj+VMEX0XnPHRrXcPV7rKnCD+76wD8z82h43TzeRouQzQs4dzoVPdt/sTbJn4FB1Kbl6XwcAvvMkBKuTKyGpPOPuoIH0zlzbBg/dlIAIG+40nstrqhQPQKngISEVMamoEZNGKgfHdOHN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1I2bFcxK3VjVjNyeVljc21maHZOeXAwMVdVcmJ6RFFFd3NONlVQTERFSzdE?=
 =?utf-8?B?NkJZNDBzN3Fibkk0Ry9VTlcwMlRYUEhKaHk5TUFDUW9OYVhPc0xDMGQ3WXY4?=
 =?utf-8?B?cXVpSGlDanVtalhzcHk0YmF6aXk3aWMwOStwZWd2SWV4d2dpUk9nc053SE1M?=
 =?utf-8?B?alZhT053UDk1UHVQcjNrQ3hMTWRXVnFoQ2hKNHFuVTFzbktJZ09lVzY2U1Ax?=
 =?utf-8?B?Tkhja0tacjRLTU9SQXNIL0MzZ1RKYW0ySXg3a0ZFM2ZrOXRZdHFPVElBTlpK?=
 =?utf-8?B?MXR4bmJURmlGV0IxMkdWRXdOZ09aWDlBbGZlS1RhZW5yUVhzSy9EMlZjd3ph?=
 =?utf-8?B?ZmZTV05kdDNwS3FFSnVSRXNQaTZwL05JcXpnV25UUFQ1YjY2WEZLR0FJNnQx?=
 =?utf-8?B?NnIzcG9FNDZWMVp6NFNjaWhtekphdUlrTkVTNG1FcTZEWnJIWk05ZzI1Q0J2?=
 =?utf-8?B?cTJjc0Q5ak85MTYvaUgxbkQycjU1cFRpUUxCWnAzNlRPamhSM1doeHYydStU?=
 =?utf-8?B?OTZuWFFZa1I4WVlRb3hsenNJN055OHROTEw0anNQWGlzUTllbmNUZURqQUo4?=
 =?utf-8?B?UURGWTN0TXJoZFBtaDhpa3VNRkhuSnNJMWtiWVlRWHh5cE1sZ1dkbzNna1FS?=
 =?utf-8?B?Wmd6WSs4RVFYTkQ1d01VU3pYRTBQbktiSTdEb1RaaFErZHBKbDVFVzNiUG5Z?=
 =?utf-8?B?eXlnRHNQRzZKSDdRMUtLbEFlZ0t5aFgyZlFKdGwvRm9NbGRTbjdUcW9wcDFu?=
 =?utf-8?B?bkVzSlg2SWN6aHIxaFhjQ2UwL0FybnVKNk1TU04vSkl5TGI2OURpSXZqUFJG?=
 =?utf-8?B?Rzg4cWpmdm5qNWRBcTN0ZmJ0YURuWGk2NWVjRk4rdHdUZWM2bUkvdUFGY0lO?=
 =?utf-8?B?S0xYcXJobkI1N1J6OWNya1lUU1c5dk9qSHNEWW5SVFY3ZGVvUE5MYXBhZ2dF?=
 =?utf-8?B?NmdzRDltYTdwVitmVWVIQWxPWGNRL2c0TzlSVVFNa0phQ3BkeXVmOFRnOXFk?=
 =?utf-8?B?YWQzUnZoMlI2WVV4M3hHNmluTjJwWit0cDc2YjlNZlVGOTR0blZMLzg1bmxQ?=
 =?utf-8?B?cm1GNks5b0NRM0pIcDZ4NDd2a3ZXK3NiTWR4ZFgxSk9aQjhEYTUzeCt2bjBO?=
 =?utf-8?B?UXVNVGREN2NGWGV5blF2dXY0dFRWVEpMaVhLZE9OMldha1h0UXJad3laY283?=
 =?utf-8?B?TW0xWTJQTlh3eGhzUHp2UUlSMllkdWJjclMyalcxcGFlckxGUXpURkxVbkJo?=
 =?utf-8?B?SjVCdEV5NUw1Ylh2djE3QXJoMkZYY0RIQmJTMDFaUUJuL0Vkc1hUbjc4ZFBU?=
 =?utf-8?B?Ylc1Mmt2cXR5MVVRK0dzMFdwR2tqcXZUQkE4ekpscXdINXhIVExxc3Y4VDJO?=
 =?utf-8?B?YkhmaFFqR1Nidm1nTVdvaXhDUVNvVlY0OTlUczZmY2FKbnRMZkQ2S1kySmUr?=
 =?utf-8?B?T2w5TlFXVFBLcWZnRE9CL1FtTWh2aG5GaFY2M2lSNU5PTDJIbDcyZnB4eW90?=
 =?utf-8?B?Y0FYUGphK0hmN1dhUy9OQ3VXS1lYSFd6aS9qcVJ6bTJxUko5MWJSc1BYcXMx?=
 =?utf-8?B?TjBMbmo2dGxtR0VyVEtmT0lzRm9tSXdibklMcUNWeUdvVTJWQzV4T0NjRFZ3?=
 =?utf-8?B?NXBYeGxpRWZFSkdIT3VUV0tZN3JmaWJYRG82c0d2NVp5RUI3aHdaWit3Z2w4?=
 =?utf-8?B?Nll6WjAxLy9sdWtaWUpUTmJQQU5NelhBRi9wWTdzK1ZHR3B6NGMxM1lRKzNY?=
 =?utf-8?B?QmlwWnhDNWc5TmdsUjJmRm5JdnFjc2pCSVpFUDRUVmVQMzNXeTFIM3JER0dw?=
 =?utf-8?B?R3RnUk4rZWdDK2MzVXIyS1FPKzVsSUtXZU5kWmgwbHJUeldLZmNrWnN5TmlZ?=
 =?utf-8?B?ZlhGanpwOVgvL0Exc3RicmFRQnpVOTVxYmJ3UDdDRU9jQmVFcWRRZjJheVJx?=
 =?utf-8?B?UW1tMVJxeDF1SldkRkw4TGVIUjlMOFJpSFhOQzdKdzJKZS9uWkVYMGpBTkVP?=
 =?utf-8?B?TWRWMllJa2lMU2RVcEdTNEdpdFZhZ3VYbFRGSytTQnVQam9RZFlyc1VScVBm?=
 =?utf-8?B?VGRhNUh6L1BNZVVRV1dobEJybzU5MnZwVVBFdHRuVFZyeXFSZ2JQRDZhRUNu?=
 =?utf-8?B?Y2h2ZjA3VjdVeXVNUXlIM3JWZGtNVEFib3RSK0FIakM2MUlPeTVuSWtLREla?=
 =?utf-8?B?clZBOEdoUytBMDBoRXpUWTBLREFRSFlGK0xwTjNzUEoxL0RqOUg1VWNLZ1hp?=
 =?utf-8?B?bkZNRktvYUphdHpMNjlSS2hBVmwvNms1Y3JYMk9CVWpjRFM0Ni9BbkZKYUhm?=
 =?utf-8?B?RytsYjRNQ3dyVHFJTkoxU1N1L0xKbGlaMC9icjMzajQ0SEdVOW5kQT09?=
X-Exchange-RoutingPolicyChecked: icr6KJOlSInfnaR1s6Npg850inG5Oq/Gb8erqJxdTQ9TEcRmHsW5WrcjMOfjNm7UDKuQUdqOfwvTk+pWQxb4a82fyV0z3eNSm/a2UA2UOQYWsKcFMK0fuROJKbBZ+8brittBC7nNu8QxfB39DThcQXdbF5bjS8PB75Fx5Hq186vlwkopKr4qutyL5JAqphn3nxWwFMv+4n1Y+uZ2hQn0A0NPsi+rkNjW8G6HmpN6g8Admf5pB5N2gvyYJQn2HYBUwiS7F9a0+SnoA2EElOWrnMCMzsJe6tVqNjm681RJ4YiPr8h1PhZcKmzZVXXiNqhJwlDr9kHN1TSu+53yDItQJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c07fadd-bb22-4624-5f9d-08dec636e83c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:53:46.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeEiYjAk0njVAB3n+ZPcIsnt5Z56Owj3UchJ5g6Mzw8VNvOJyzGJjqAjXHoVKg1D51X7WxhtRVMh+h7DbpHLhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Add Xe PMU helper infrastructure to collect per-VF engine-active-ticks and
> engine-total-ticks over the workload measurement window.
>
> Use the collected counters to derive per-VF runtime shares and cross-check
> them against throughput shares computed from workload completion
> statistics, strengthening scheduling validation.
>
> Keep this verification optional by enabling it only when the required
> Xe perf events are available.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 433 ++++++++++++++++++++++++++++++
>   1 file changed, 433 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index f7cca95ae..6d8b7640d 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2025 Intel Corporation
>    */
>   #include "igt.h"
> +#include "igt_perf.h"
>   #include "igt_sriov_device.h"
>   #include "igt_syncobj.h"
>   #include "igt_sysfs.h"
> @@ -660,6 +661,438 @@ prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_
>   	return params;
>   }
>   
> +struct vf_config {
> +	unsigned int vf_id;
> +	struct vf_sched_params sched_params;
> +	bool run_workload;
> +};
> +
> +struct runtime_metrics {
> +	unsigned int vf_id;
> +	uint64_t engine_active_ticks;
> +	uint64_t engine_total_ticks;
> +	double measured_total_tick_share;
> +	double active_to_total_ratio;
> +	double measured_throughput_share;
> +	double expected_throughput_share;
> +	double expected_active_to_total_ratio;
> +	double expected_total_tick_share;
> +};
> +
> +struct perf_counters {
> +	int pmu_fd[2];
> +	uint64_t before[2];
> +	uint64_t after[2];
> +};
> +
> +static char perf_device[NAME_MAX];
> +
> +static bool has_perf_event(const char *device, const char *event)
> +{
> +	char path[512];
> +
> +	snprintf(path, sizeof(path),
> +		 "/sys/bus/event_source/devices/%s/events/%s",
> +		 device, event);
> +
> +	return access(path, F_OK) == 0;
> +}
> +
> +static int perf_open_group(int xe, uint64_t config, int group)
> +{
> +	int fd;
> +
> +	fd = igt_perf_open_group(xe_perf_type_id(xe), config, group);
> +	igt_skip_on(fd < 0 && errno == ENODEV);
> +	igt_assert_fd(fd);
> +
> +	return fd;
> +}
> +
> +static uint64_t perf_read_values(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +
> +	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +static uint64_t perf_add_format_config(const char *format, uint64_t val)
> +{
> +	uint64_t config;
> +	uint32_t shift;
> +	int ret;
> +
> +	ret = perf_event_format(perf_device, format, &shift);
> +	igt_assert(ret >= 0);
> +	config = val << shift;
> +
> +	return config;
> +}
> +
> +static uint64_t perf_get_event_config(unsigned int gt,
> +				      const struct drm_xe_engine_class_instance *eci,
> +				      const char *event)
> +{
> +	uint64_t perf_config = 0;
> +	int ret;
> +
> +	ret = perf_event_config(perf_device, event, &perf_config);
> +	igt_assert(ret >= 0);
> +	perf_config |= perf_add_format_config("gt", gt);
> +
> +	if (eci) {
> +		perf_config |= perf_add_format_config("engine_class", eci->engine_class);
> +		perf_config |= perf_add_format_config("engine_instance", eci->engine_instance);
> +	}
> +
> +	return perf_config;
> +}
> +
> +static uint64_t perf_get_event_config_vf(unsigned int gt, unsigned int vf_id,
> +					 const struct drm_xe_engine_class_instance *eci,
> +					 const char *event)
> +{
> +	return perf_get_event_config(gt, eci, event) |
> +	       perf_add_format_config("function", vf_id);
> +}
> +
> +static double expected_total_tick_weight(const struct vf_config *config)
> +{
> +	return config->sched_params.exec_quantum_ms;
> +}
> +
> +static double expected_throughput_weight(const struct vf_config *config)
> +{
> +	if (!config->run_workload)
> +		return 0.0;
> +
> +	return config->sched_params.exec_quantum_ms;
> +}
> +
> +static void init_perf_counters(int pf_fd,
> +			       const struct drm_xe_engine_class_instance *eci,
> +			       const struct vf_config *configs,
> +			       size_t num_configs,
> +			       struct perf_counters *counters)
> +{
> +	int leader = -1;
> +
> +	for (size_t i = 0; i < num_configs; i++) {
> +		uint64_t config;
> +
> +		counters[i].pmu_fd[0] = -1;
> +		counters[i].pmu_fd[1] = -1;
> +
> +		config = perf_get_event_config_vf(eci->gt_id, configs[i].vf_id, eci,
> +						  "engine-active-ticks");
> +		counters[i].pmu_fd[0] = perf_open_group(pf_fd, config, leader);
> +		if (leader < 0)
> +			leader = counters[i].pmu_fd[0];
> +
> +		config = perf_get_event_config_vf(eci->gt_id, configs[i].vf_id, eci,
> +						  "engine-total-ticks");
> +		counters[i].pmu_fd[1] = perf_open_group(pf_fd, config, leader);
> +	}
> +}
> +
> +static void fini_perf_counters(struct perf_counters *counters,
> +			       size_t num_configs)
> +{
> +	for (size_t i = 0; i < num_configs; i++) {
> +		if (counters[i].pmu_fd[0] >= 0)
> +			close(counters[i].pmu_fd[0]);
> +		if (counters[i].pmu_fd[1] >= 0)
> +			close(counters[i].pmu_fd[1]);
> +	}
> +}
> +
> +static uint64_t start_perf_counters(struct perf_counters *counters,
> +				    size_t num_configs)
> +{
> +	uint64_t values[2 * num_configs];
> +
> +	perf_read_values(counters[0].pmu_fd[0], 2 * num_configs, values);
> +
> +	for (size_t i = 0; i < num_configs; i++) {
> +		counters[i].before[0] = values[2 * i];
> +		counters[i].before[1] = values[2 * i + 1];
> +	}
> +
> +	return current_timestamp_ns();
> +}
> +
> +static void
> +init_expected_runtime_metrics(const struct vf_config *configs,
> +			      size_t num_configs,
> +			      struct runtime_metrics *metrics)
> +{
> +	double total_expected_total_tick_weight = 0.0;
> +	double total_expected_throughput_weight = 0.0;
> +
> +	for (size_t i = 0; i < num_configs; i++) {
> +		total_expected_total_tick_weight += expected_total_tick_weight(&configs[i]);
> +		total_expected_throughput_weight += expected_throughput_weight(&configs[i]);
> +	}
> +
> +	for (size_t i = 0; i < num_configs; i++) {
> +		metrics[i].vf_id = configs[i].vf_id;
> +		metrics[i].expected_throughput_share = total_expected_throughput_weight ?
> +			expected_throughput_weight(&configs[i]) /
> +			total_expected_throughput_weight : 0.0;
> +		metrics[i].expected_total_tick_share = total_expected_total_tick_weight ?
> +			expected_total_tick_weight(&configs[i]) /
> +			total_expected_total_tick_weight : 0.0;
> +		metrics[i].expected_active_to_total_ratio =
> +			configs[i].sched_params.priority == XE_SRIOV_SCHED_PRIORITY_NORMAL ?
> +				(configs[i].run_workload ? 1.0 : 0.0) :
> +				(metrics[i].expected_total_tick_share ?
> +				 metrics[i].expected_throughput_share /
> +				 metrics[i].expected_total_tick_share : 0.0);
> +	}
> +}
> +
> +static void compute_perf_metrics(const struct vf_config *configs,
> +				 const struct perf_counters *counters,
> +				 size_t num_configs,
> +				 struct runtime_metrics *metrics)
> +{
> +	uint64_t total_engine_total_ticks = 0;
> +
> +	init_expected_runtime_metrics(configs, num_configs, metrics);
> +
> +	for (size_t i = 0; i < num_configs; i++) {
> +		metrics[i].engine_active_ticks = counters[i].after[0] - counters[i].before[0];
> +		metrics[i].engine_total_ticks = counters[i].after[1] - counters[i].before[1];
> +		total_engine_total_ticks += metrics[i].engine_total_ticks;
> +	}
> +
> +	for (size_t i = 0; i < num_configs; i++) {
> +		metrics[i].active_to_total_ratio = metrics[i].engine_total_ticks ?
> +			(double)metrics[i].engine_active_ticks /
> +			metrics[i].engine_total_ticks : 0.0;
> +		metrics[i].measured_total_tick_share = total_engine_total_ticks ?
> +			(double)metrics[i].engine_total_ticks /
> +			total_engine_total_ticks : 0.0;
> +
> +		igt_info("%s actual={active_ticks=%" PRIu64 ",total_ticks=%" PRIu64
> +			 ",active/total=%.4f,total_share=%.4f} "
> +			 "expected={active/total=%.4f,total_share=%.4f,throughput_share=%.4f}\n",
> +			 igt_sriov_func_str(configs[i].vf_id),
> +			 metrics[i].engine_active_ticks, metrics[i].engine_total_ticks,
> +			 metrics[i].active_to_total_ratio,
> +			 metrics[i].measured_total_tick_share,
> +			 metrics[i].expected_active_to_total_ratio,
> +			 metrics[i].expected_total_tick_share,
> +			 metrics[i].expected_throughput_share);
> +	}
> +}
> +
> +static uint64_t stop_perf_counters(const struct vf_config *configs,
> +				   struct perf_counters *counters,
> +				   size_t num_configs,
> +				   struct runtime_metrics *metrics)
> +{
> +	uint64_t end_timestamp = current_timestamp_ns();
> +	uint64_t values[2 * num_configs];
> +
> +	perf_read_values(counters[0].pmu_fd[0], 2 * num_configs, values);
> +
> +	for (size_t i = 0; i < num_configs; i++) {
> +		counters[i].after[0] = values[2 * i];
> +		counters[i].after[1] = values[2 * i + 1];
> +	}
> +
> +	compute_perf_metrics(configs, counters, num_configs, metrics);
> +
> +	return end_timestamp;
> +}
> +
> +static void init_vf_configs_from_set(int pf_fd,
> +				     const struct subm_set *set,
> +				     struct vf_config *configs)
> +{
> +	const struct drm_xe_engine_class_instance *eci = &set->data[0].subm.hwe;
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		const struct subm *subm = &set->data[n].subm;
> +		const int vf_num = subm->vf_num;
> +
> +		igt_assert_eq(subm->hwe.gt_id, eci->gt_id);
> +		igt_assert_eq(subm->hwe.engine_class, eci->engine_class);
> +		igt_assert_eq(subm->hwe.engine_instance, eci->engine_instance);
> +		configs[n] = (struct vf_config) {
> +			.vf_id = vf_num,
> +			.sched_params = {
> +				.exec_quantum_ms = xe_sriov_admin_get_exec_quantum_ms(pf_fd,
> +								      vf_num),
> +				.preempt_timeout_us = xe_sriov_admin_get_preempt_timeout_us(pf_fd,
> +									    vf_num),
> +				.priority = xe_sriov_admin_get_sched_priority(pf_fd, vf_num, NULL),
> +			},
> +			.run_workload = true,
> +		};
> +	}
> +}
> +
> +static unsigned int count_window_completions(const struct subm_stats *stats,
> +					     uint64_t window_start,
> +					     uint64_t window_end)
> +{
> +	unsigned int completions = 0;
> +
> +	for (int i = 0; i < stats->samples.n_values; i++) {
> +		uint64_t cts = stats->complete_ts[i];
> +
> +		if (cts >= window_start && cts <= window_end)
> +			completions++;
> +	}
> +
> +	return completions;
> +}
> +
> +static void compute_measured_throughput_share(const struct subm_set *set,
> +					      uint64_t window_start,
> +					      uint64_t window_end,
> +					      struct runtime_metrics *metrics)
> +{
> +	unsigned int completions[set->ndata];
> +	unsigned int total_completions = 0;
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		completions[n] = count_window_completions(&set->data[n].stats,
> +							  window_start,
> +							  window_end);
> +		total_completions += completions[n];
> +	}
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		metrics[n].measured_throughput_share = total_completions ?
> +			(double)completions[n] / total_completions : 0.0;
> +	}
> +}
> +
> +static void compute_concurrent_rate_share(const struct subm_set *set,
> +					  struct runtime_metrics *metrics)
> +{
> +	double total_rate = 0.0;
> +
> +	for (int n = 0; n < set->ndata; ++n)
> +		total_rate += set->data[n].stats.concurrent_rate;
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		metrics[n].measured_throughput_share = total_rate ?
> +			set->data[n].stats.concurrent_rate / total_rate : 0.0;
> +	}
> +}
> +
> +static void run_subm_set_and_collect_metrics(int pf_fd,
> +					     struct subm_set *set,
> +					     struct vf_config *vf_configs,
> +					     struct runtime_metrics *metrics,
> +					     bool verify_with_perf_counters,
> +					     uint64_t *measurement_start_ns,
> +					     uint64_t *measurement_end_ns)
> +{
> +	struct perf_counters *perf_counters = NULL;
> +	const struct drm_xe_engine_class_instance *eci = &set->data[0].subm.hwe;
> +
> +	init_vf_configs_from_set(pf_fd, set, vf_configs);
> +	init_expected_runtime_metrics(vf_configs, set->ndata, metrics);
> +
> +	if (verify_with_perf_counters) {
> +		perf_counters = calloc(set->ndata, sizeof(*perf_counters));
> +		igt_assert(perf_counters);
> +		init_perf_counters(pf_fd, eci,
> +				   vf_configs, set->ndata, perf_counters);
> +		*measurement_start_ns = start_perf_counters(perf_counters,
> +							    set->ndata);
> +	}
> +
> +	subm_set_dispatch_and_wait_threads(set);
> +
> +	if (verify_with_perf_counters) {
> +		*measurement_end_ns = stop_perf_counters(vf_configs,
> +							 perf_counters,
> +							 set->ndata,
> +							 metrics);
> +		fini_perf_counters(perf_counters, set->ndata);
> +		free(perf_counters);
> +	}
> +
> +	subm_set_close_handles(set);
> +	compute_common_time_frame_stats(set);
> +	compute_concurrent_rate_share(set, metrics);
> +
> +	if (verify_with_perf_counters)
> +		compute_measured_throughput_share(set,
> +						  *measurement_start_ns,
> +						  *measurement_end_ns,
> +						  metrics);
> +}
> +
> +static void assert_share_matches_expected(const struct runtime_metrics *metrics,
> +					  size_t num_metrics,
> +					  double tolerance,
> +					  bool use_total_tick_share)
> +{
> +	for (size_t n = 0; n < num_metrics; ++n) {
> +		double measured_share = use_total_tick_share ?
> +			metrics[n].measured_total_tick_share :
> +			metrics[n].measured_throughput_share;
> +		double expected_share = use_total_tick_share ?
> +			metrics[n].expected_total_tick_share :
> +			metrics[n].expected_throughput_share;
> +		const char *share_name = use_total_tick_share ?
> +			"total tick share" : "throughput share";
> +
> +		igt_assert_f(check_within_epsilon(measured_share,
> +						  expected_share,
> +						  tolerance),
> +			     "%s=%0.4f not within +-%.0f%% of expected=%0.4f for %s\n",
> +			     share_name, measured_share, tolerance * 100,
> +			     expected_share,
> +			     igt_sriov_func_str(metrics[n].vf_id));
> +	}
> +}
> +
> +static void assert_throughput_share_matches_total_tick(const struct runtime_metrics *metrics,
> +						       size_t num_metrics,
> +						       double tolerance)
> +{
> +	for (size_t n = 0; n < num_metrics; ++n) {
> +		double expected_ratio = metrics[n].expected_total_tick_share ?
> +			metrics[n].expected_throughput_share /
> +			metrics[n].expected_total_tick_share : 0.0;
> +		double expected_throughput_share =
> +			metrics[n].measured_total_tick_share * expected_ratio;
> +
> +		assert_within_epsilon(metrics[n].measured_throughput_share,
> +				      expected_throughput_share,
> +				      tolerance);
> +	}
> +}
> +
> +static void warn_active_ticks_mismatch(const struct runtime_metrics *metrics,
> +				       size_t num_metrics,
> +				       double tolerance)
> +{
> +	for (size_t n = 0; n < num_metrics; ++n) {
> +		igt_warn_on_f(!check_within_epsilon(metrics[n].active_to_total_ratio,
> +						    metrics[n].expected_active_to_total_ratio,
> +						    tolerance),
> +			      "active/total=%0.4f not within +-%.0f%% of expected=%0.4f for %s\n",
> +			      metrics[n].active_to_total_ratio, tolerance * 100,
> +			      metrics[n].expected_active_to_total_ratio,
> +			      igt_sriov_func_str(metrics[n].vf_id));
> +	}
> +}
> +
>   /**
>    * SUBTEST: equal-throughput
>    * Description:
