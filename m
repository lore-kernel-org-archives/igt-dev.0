Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8459AC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 04:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD6010E027;
	Mon, 29 Jun 2026 04:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZ4DB2lZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078D810E027
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 04:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782707687; x=1814243687;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5Dz22nkHYMdtfm+GZl8hRyqkSJWOs/1iRVBothj9uMI=;
 b=WZ4DB2lZG+o76w7IKYlJjLAqINWNiPICTMMHuvfeiLjSv/S/uK4kspEv
 gQFtcwvvhKpVdSShSJauI+Jdj1P+xhQUt9XUtAHYvlxinKLdsot9lIlEM
 CQRFp4T3gSk0TVXJHQLx68lqUTZ/5pr/zn2P30XdEu5TmFzfEKzdqW4x7
 o0ObeJlbtbqsWvmTjOrnjsQgsijb10QTBXmzf3Q9FGntU9rFMvcyecYKI
 VgqThRIUEL/7eQmd5fYi4b+FeEc5V+UovbZ7o6wTVnAM9rN3MUSc3wPkd
 yIGcqYkFjD8BhyEkCzS2dai4qjFVdWQPNgrYSj1leXcJ2BEiFykuD9frg g==;
X-CSE-ConnectionGUID: jXT0hHB3SweTmKg5r3uEgw==
X-CSE-MsgGUID: YwQxBfUMRDebjz+4doM0hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83443018"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="83443018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2026 21:34:46 -0700
X-CSE-ConnectionGUID: f5ZZNP+TTKenGH6jwHFjBA==
X-CSE-MsgGUID: mUTG+c9mT52Z9FAbzZvFNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="253755922"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2026 21:34:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 28 Jun 2026 21:34:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 28 Jun 2026 21:34:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 28 Jun 2026 21:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f28t54KireP8ux5xijeNfS6v9cJFoFsIYN0DEXvyFTqB1KGClcHssREj5FvKi6U54MYDIl0bHlEFa4zlc+J78LLZ3p9qr+4kmLr4KOLkL86iSsrTrDTcea6KGvUA2zsZEiieXqPvjPWFa44px4nZR0TD3PSfInmoVgED35wy6tdrNGh7/UpOE1D39LKWjwT5hdKKxAjbRpg67TJZH8Na5V3RPRo950LVsb4oGW35B23501le2GjfwH7Z2otB8ZsjTM3PKDFSkL7BiGLrO/9KBX/ZpUT2AYkhzeIiXfN0DAEcq8aru11uRqR6l/vVsTeGqKAqua7dxT0OJEFtGXGNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBsCgpmFuncCHucQuVpK4YdZ6orWOPQiHlfoHbtJkmI=;
 b=WxfTv/X1ydtOY7kKgXDLcPh27w/Fbrjf80cXhhD3qu52tZXwjQ0eUY1gRg3p5z6OCsulV/afHfge9I2yQ3vo+UXmVCvcrDKR4upXWhFY4fF0UMhcqpYSyl2WQedGzDOopFFDum10wf5xAUKZ8PjPnh+JkbUeOoFgbwX/zHwFQvcUtggJpO0TY3IEEU78MVoGfJR/XCuuzYmqWSCGziZGEr2UK+yYiX5oYTCKnsAXW58l4rfhiwDvVD1vjNx1Dlra6NDm/YPIytFGiRNfd8Lvf2RBH3Q9lvl5UJTpwlGSmPjD/l5KGgq2GMChxqro6wwitDYpPckAtVzBV46erOVEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 04:34:42 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0159.015; Mon, 29 Jun 2026
 04:34:42 +0000
Message-ID: <8bcf2224-37f6-43a5-be16-8b3f3c06be68@intel.com>
Date: Mon, 29 Jun 2026 10:04:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms, tests: Update joiner comments for
 clarity
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260622061449.3030039-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260622061449.3030039-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0306.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: f910cc18-8793-4dc0-6ea6-08ded597bcb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|42112799006|376014|23010399003|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QJ0OGrvFegbX57/gIa2nbk09KOaVYz42EjxDjsvgAXX+uLFnPzTQoM0H+V6SoaPQY3iOet34euCqfPDGudVYQraUtfG1nJqH8i2g1uCoJwQyWfOUsNT7pbnaYfe9wcDRdCR8kMYPk8v0sttZ+ea8g2oYlgkkm/q7m+d/pb657JopJPAjCsmMETVT7UJLqwtGgOYWsxjRnbJzQ+S3OpW5PxgdX0qJf6thdZpPY5ZHit0VW8bZ6bA/eYtT4EHyNZTpm56qNxn3t7wbuiFawqXrOzQdEKTr0y7fk5t2VnyENhOsVRa+UEhZTOpZvykRSvUklqxiOA8aBz0C3DBLvc7w7h6zqpUbDN48VItJK3iXyCiumMI5oLq5n+TvASEd1WmYIv8fCw7eRWnPku1+N+msKJamn0IIQe6mQMd8Yvm4atrKqNe33pvvx+udOMAO3pYJ41nCGYcMFp9gxmremFz9hGRvCxb9AmrhlAu9OtZwRqE/NzHCCNqOlyPBHxoZjvFf6GpkBT/ErXzf377vh6LUiebfV2+qPEuEnWaNgA3rZOnrtTQ+HZSGwCNh2wcn8qIXIKCNrD/e1LSdeVZj9ybmj0uiJb0PXcyqjeGZjKYzsdzuaKmskisnhnRJc8zIfKQnF8TXpNxNNQ5Vcdt7JFIpowLgU3SpoCUUHxBY6icuPgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGd5ellVbkd4UnFSY2xNM1IxSytmVUZ4Y0Fpa0RxbmlCSE02a2FRYkpjZDIw?=
 =?utf-8?B?eU9WcWhZNUgydHRHUy9seEhTL3Q0d28wSzdXSmdFM3dFcDdKRVB5emNrK3ZJ?=
 =?utf-8?B?ckljak83bjRZeXhPRUo4UXMwQ0JMVCtRTWZJYTlqZkxlay9KSC9SSnoxaVJl?=
 =?utf-8?B?NDNuTldmcEl4YitwZTFkYTRSVGJJZ2lHeWhpdWxsaVYwYVRQMmc4THNRSzh1?=
 =?utf-8?B?cG11UURXSFh2ZVhqbDR0aGtqc1AyOG5ORTZ5V3hUeTdYcEVlbXZhTFNTNXFt?=
 =?utf-8?B?dW5mTmhQOG9tbHhaRzRnTW1oaW1YRDRUcUF3V3N2VHhtZUU0LzVuZEJ3ZDUy?=
 =?utf-8?B?K1BYY3BSanZwRjF0ZWQzSDJyMEVJTmczOHdDTk02RDQyZitaVGNmNktia2cy?=
 =?utf-8?B?MXh3WGU5QTBnazNsbXhjcmc0aFhJeHQ0ZGpzQ3drOFBiK2N1akZxZlgxeDZr?=
 =?utf-8?B?U21Rekw4czJHdDlTTmNva2hYdUdwZ2JIM3c4STJjMmRoRHN5OUd4cUsvK2Y1?=
 =?utf-8?B?TjJXK2kvb0xUMmIveFVsYW1FTU1xaURKc2drYmFwdHhiWE9oTjdMS3l4aGRU?=
 =?utf-8?B?S3RlZEo0ak5jSEFOT3BpVW9TUkV1aEZNb0tQd0k0alZYM3RKZTUzMk1PMUV2?=
 =?utf-8?B?M1B3RmcvZ3RpS0t4SC96ZWd2UTlWWWZPZzZQVzBhMU1pRWdBKzVtc0s0dDVJ?=
 =?utf-8?B?SWtKRWVWdFI0VGtPb05lSDdkc0NBeWhJS0dmcThwZFg1cTFjTXdZTkVBTUxm?=
 =?utf-8?B?WnN0bWtoTEpLQmFObldIdDY1Wmk1dWV6bjA3VHJmc25Yblg4UDJhNkUrdXNP?=
 =?utf-8?B?WDdFWktYMTVCaTE4TzdXQzdQZGFTOTZVdUFLcHhRNEVXWFFLenVYWVYzdW5n?=
 =?utf-8?B?YmN2SUhnUGIzazNMN09jT3hNK3dxR0tXakxtU1NxODdnR2RLSWt6bkQ4VU9x?=
 =?utf-8?B?cjJRUmFnVWZMd3E1RHpsMkNUYzVLajlXczFUaXZzcWZTWUdCQmF5VkNPbVpq?=
 =?utf-8?B?Sll5b0lZSFRvbVhYOXJneDliNmRldGlzWGJvM1BjcmFqandJY2orVC9zK1VU?=
 =?utf-8?B?TXhRc2xGZ0VObzFaL0RKSlA1ZXEzRW1nZ2ZMNUREajJNVEV3UmdEU0svZGJw?=
 =?utf-8?B?K21vbUROWUdFSzR2bzkvMWFZa09KNFRlalZ6ZlQyZEhhdjNXRXFucjZBS1ZL?=
 =?utf-8?B?RHpNSDU0SU1lWmRPODkwUGI0UTNMNHpMOFlON0VLRmZzd1UyZ2ZSME80WEVT?=
 =?utf-8?B?ZjFlRFQ4QXRKbGhoOE05UENseEtqaXk4NXVsd1FQMXBpb2FnZlVobnM3OTA2?=
 =?utf-8?B?Nm12citIQm5EQmpZSzV0VGRFc0lEMkgwV0xzS1FmL1lQQjJSVjJJeFRXcWhV?=
 =?utf-8?B?d0pxbEIzNWtjMUpIb3ZpeUFlcGtud0V5NjVrRWo2eWJLM3FWcVpZOVZneGhw?=
 =?utf-8?B?NzRLTEV2TENOYTFTS3pXN1hkZzdzMlAyNXYzdjI4dllGdXJsNEQzcDZPT2Y5?=
 =?utf-8?B?M2lYN2VIV2xONEpzY2Z3Qjd3VG9EdGx3Sll5V2FPMVFYYU4vZGpJclFIZDAv?=
 =?utf-8?B?ZWx2RkhqN01oSThUa09YQXduditqV2NCdUdEY3FBR3NvaXgyUFFmaHcraG83?=
 =?utf-8?B?M3NOOThIeGhldG9abWlkOW4xRGhyUjBlR3FJbEI0NHRSSmJ4VTluUVpUYUpN?=
 =?utf-8?B?elpjOFhtSkJFS044ZVBqNzFleFE0b1N3dGY0dTY4UCtNbitDWVQ1UE41QWdS?=
 =?utf-8?B?QW13MFNiaDNhNkJyN094UG50QjhUU0FCNlVsMldVclRNZDdPODNaWVpYNW1r?=
 =?utf-8?B?emlMdVFNR3cvZ2ZTdGxHZmx2U0hKS0dpTjA1QUlZS0M3ZnRiejgyM1FYYjU3?=
 =?utf-8?B?QzlSZzhkTWVQbCtiTHIrS2QrVXBKL3AwSmVuZUcwYmRyUmFuWTRHa0ozME42?=
 =?utf-8?B?VGMrTDdDTXhYVnM2RVd0S2h1UmFZYm9NMnNORFVtT1VoTUtHcW9Zcno0amw2?=
 =?utf-8?B?VE12Y3RJSGE1Ry9JRlo4VWF6Y2RITUtZanh2Rk1GcExCcXhjR09aZTRWWE80?=
 =?utf-8?B?R3JtMDMvUzFNbTNMUXlTMWZ4c0dNNW4yVVdyTS9mT3FrRk9TOXd3UDZZVlg4?=
 =?utf-8?B?VUJrUWpOOVFQTDU0ejd3SitwWS9yb1pLZE8zd3lha2RXYnQvUnFSRXB0YjVX?=
 =?utf-8?B?M0FMUVZhT0hLd3p4cGpFYk9lV1dnNzlsRFlCQU9pbllEZ09ORnBaNUhmTHBC?=
 =?utf-8?B?Lzk2aDdGTWNzTFIzOWxhWmRZamgxOWE3VkxJTXczdHRROVM1aWtycWVYRDFO?=
 =?utf-8?B?bC96ODA0Q0FyaTBPVnFZMXd3ZjBHR2FBMlFadzhUcEpQU3NVbU02UT09?=
X-Exchange-RoutingPolicyChecked: iYgTjeAHmV7zq+gffchaMlS9+jiZAJ/SM5PixWuh4uo9pWRXWxctj4kptk+lEO05LSdQv7o+sqzCgXT4KOSXg0wKJc2gQtog9W7TqIGksi6URJMnE+hagMC88QhQ7hj6YeeklYUBMlifnkwZImIqEffT+uatp2yRpiQqTkU5NX8y1z2U3O4kspnC6B1Vyv88sYPr69vHyB2y/0YKNBEH5aSGGQ2o32GNGXplspMRYhQFlltyrk5lugr+pcaGtmCOcODORI/1zbYD3eoqCIk7OGFoiVXGSdziYwSnl91TsCMvV3rvgJj5tklOdzl4KdiHjUe0fnTLKEEfbNnZ9DggUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f910cc18-8793-4dc0-6ea6-08ded597bcb7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 04:34:42.0906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 613lebXZny5XM8guAMOiDvyEzZVDGNAqbyl2dqP8Q6QqrDyC1sDYh7V3dmuRP0wyIWQ/bGfdMLWiHu1xzvHRGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Hi Jeevan,

On 6/22/2026 11:44 AM, Jeevan B wrote:
> Clean up joiner-related comments to match what the code actually
> checks. Remove hardcoded 5K/10K wording and update comments to refer
> to bigjoiner/ultrajoiner helper checks.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c            | 17 +++++++++--------
>   tests/intel/kms_joiner.c |  8 ++++----
>   tests/kms_flip.c         |  4 ++--
>   tests/kms_setmode.c      |  5 ++---
>   4 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e82d32130..8f45397f4 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7047,10 +7047,11 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
>    * @mode: libdrm mode
>    * @max_dotclock: Max pixel clock frequency
>    *
> - * Bigjoiner will come into the picture, when the requested
> - * mode resolution > 5K or mode clock > max_dotclock.
> + * Bigjoiner is required when the requested mode exceeds single-pipe
> + * platform limits, i.e. hdisplay is above the platform threshold or
> + * clock is above @max_dotclock.
>    *
> - * Returns: True if mode requires Bigjoiner, else False.
> + * Returns: True if mode requires bigjoiner, else False.
>    */
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> @@ -7065,10 +7066,10 @@ bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>    * @max_dot_clock: max dot clock frequency
>    * @mode: libdrm mode to be filled
>    *
> - * Bigjoiner will come in to the picture when the
> - * resolution > 5K or clock > max-dot-clock.
> + * Finds the first connector mode that requires bigjoiner support based on
> + * igt_bigjoiner_possible(), while excluding modes that require ultrajoiner.
>    *
> - * Returns: True if big joiner found in connector modes
> + * Returns: True if a bigjoiner mode is found.
>    */
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode)
> @@ -7385,14 +7386,14 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	max_dotclock = igt_get_max_dotclock(display->drm_fd);
>   
>   	/*
> -	 * if force joiner (or) mode resolution > 5K (or) mode.clock > max dot-clock,
> +	 * if force joiner is enabled (or) the mode requires bigjoiner support,

Nit: This could just be " the mode requires bigjoiner". Same in all the 
below comments.

With this updated, the patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   	 * then ignore
>   	 *  - if the consecutive pipe is not available
>   	 *  - last crtc in single/multi-connector config
>   	 *  - consecutive crtcs in multi-connector config
>   	 *
>   	 * in multi-connector config ignore if
> -	 *  - previous crtc (force joiner or mode resolution > 5K or mode.clock > max dot-clock) and
> +	 *  - previous crtc (force joiner or mode requires bigjoiner support) and
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	for (i = 0; i < pipes_in_use; i++) {
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index e6039cf9f..d26eb3b01 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -651,10 +651,10 @@ int igt_main()
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
> -			 * Bigjoiner will come in to the picture when the
> -			 * resolution > 5K or clock > max-dot-clock.
> -			 * Ultrajoiner will come in to the picture when the
> -			 * resolution > 10K or clock > 2 * max-dot-clock.
> +			 * Bigjoiner is required when a mode exceeds the single-pipe
> +			 * platform limits checked by igt_bigjoiner_possible().
> +			 * Ultrajoiner is required when a mode exceeds the limits checked
> +			 * by igt_ultrajoiner_possible().
>   			 */
>   			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 1ef9492ba..d6514637e 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1787,12 +1787,12 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   	/*
>   	 * Handle BW limitations on intel hardware:
>   	 *
> -	 * if force joiner (or) mode resolution > 5K (or) mode clock > max_dotclock, then ignore
> +	 * if force joiner is enabled (or) the mode requires bigjoiner support, then ignore
>   	 *  - last crtc in single/multi-connector config
>   	 *  - consecutive crtcs in multi-connector config
>   	 *
>   	 * in multi-connector config ignore if
> -	 *  - previous crtc (force joiner or mode resolution > 5K or mode clock > max_dotclock) and
> +	 *  - previous crtc (force joiner or mode requires bigjoiner support) and
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	if (!is_intel_device(drm_fd))
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 3adc4534c..1db9a6830 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -795,14 +795,13 @@ static void test_one_combination(const struct test_config *tconf,
>   			/*
>   			 * Handle BW limitations on intel hardware:
>   			 *
> -			 * if force joiner (or) mode resolution > 5K (or) mode clock > max_dotclock,
> +			 * if force joiner is enabled (or) the mode requires bigjoiner support,
>   			 * then ignore
>   			 *   - last crtc in single/multi-connector config
>   			 *   - consecutive crtcs in multi-connector config
>   			 *
>   			 * in multi-connector config ignore if
> -			 *   - previous crtc (force joiner (or) mode resolution > 5K (or)
> -			 *     mode clock > max_dotclock) and
> +			 *   - previous crtc (force joiner (or) mode requires bigjoiner support) and
>   			 *   - current & previous crtcs are consecutive
>   			 */
>   			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
