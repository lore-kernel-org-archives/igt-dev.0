Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5DEF8E491
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 06:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0AC10E954;
	Fri, 17 Apr 2026 06:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3zXKcIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD6310E174
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776405822; x=1807941822;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E1QKk29vXUD76DDWktQuZd8kxVGiQxLlvV9S2taBcWc=;
 b=g3zXKcInHeOxcqllozZNBSeymV0N/+rnBM5pImTpibOz1VGpz9CY9Atq
 nfCnonNyv2sRKgJcF/M0X3nVRQak8O3DOzUH+CnsvuQZ4B90EeSvvW9uw
 S3eR8EzTKQvYLp7zAcJS/R5H9a224Y1WyXo1f7cCQuZ8yIlqg5lHVHN3p
 RFvn1cZlZYNNr+COX5XUlP1+V+wKPHAYxa/C+038KPtxeLnITa5aS2ebC
 7JouyvMYChLR4OYpufWHqkkhf6E3lU7bg52DIYINPuXYinW9hOUD7nUKb
 TRBBIiC7kyDF/+y536pLjRB1dIS3GEd61mc9sE8ZQK1pZhPYH+XCKhIj9 w==;
X-CSE-ConnectionGUID: nmuMO3S+S5SMxLglzaCF6w==
X-CSE-MsgGUID: kUKVZT9dSeKjbKpVk+EGug==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77287505"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="77287505"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 23:03:41 -0700
X-CSE-ConnectionGUID: ybK3O9H9RNqCeuo+KiVhDQ==
X-CSE-MsgGUID: YfdAz/7RRH6aLH4z5Wq8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="227806851"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 23:03:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 23:03:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 23:03:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 23:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlGesg781DFIM/iTZPEipux8GRM53hPC2LZVl+wdFCaFWUv49Ff0yXvltI+RdbqQc3p7PqStoduLVpH+2kqcJmGyWpfucvPZB9SIbmMJL8zFyRV2lFs4qgEB820YYWlvCjEaD/dCbSSg1+A5g9ieqj7zPwj/+5t7BvrZ9XWvfzloAG22YCaD5afp9lP07tdpqSk58y47y//IlvBfo7TqPdYxl9NXrjIJqwRmxazwfCr4jAYXqMEqSc2OCDv2AucdCISxsRAyPAx5gPzAnnnQI+NPtcrBjsZzEbzdZb0iQF4ZlfRVOQSUq0y+RplCBXArTlFmWqiBciuQj6v9kccQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+T+s7EDZfnTkVkpL4GiBDIrmzI2m0/HERtotYPwHHc=;
 b=JORywtTgLkPWDiRd76KKizhXkq5vojkyzKcP7W/CBcaVvL1rCnHvTFKf5BEMVQ3bUE9KoPiORgH2iAR+Qv4PpbQWDxaYp9ofTNYxWFPeRwZR6UAjSg0s4te2lgMla9d4Hrgk+o0liw6fd/JDpTvZTBxZTVH9yuBsJ1YsFLIAJm9YJ8Qv2RvWCOT8btfYDYB609SYKaT5aRq2eDVlcTiyYouT4UaNesQpSWHm8daQJamK7sk3BGkt2yuKPNxvLHO2ZBGEvpNyGRi+0J2ZAubXy5EevGp+LDzj4jnbivsoQnz82nrgKGORr+fjW0WgXzHUndKKcn3JVh5bMzIeGTNfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS0PR11MB7765.namprd11.prod.outlook.com (2603:10b6:8:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 06:03:30 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 06:03:29 +0000
Message-ID: <416e4e8e-45c9-4979-a57d-7f2330096738@intel.com>
Date: Fri, 17 Apr 2026 11:33:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_vrr: Revert "tests/kms_vrr: New
 subtest for CMRR"
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
 <20260417053620.3685837-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260417053620.3685837-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS0PR11MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: cefce0a4-cc43-4157-6c78-08de9c470be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: epAntzCv8Lx+k7kUm+c8dyPL6+vEpARHUmFGorZL4TjFjih10Ozbxcy10pNsrq1GJIDkNB3E0ibM6Ywz9tuwppYJK7ebKvkYViS1KZ/xdstGrv+GwAfJqLooKGP9UQWN37ARzRQemh/E50ePxbks1ygJLxlKMcuXpWPyvSXEX6N6JwNCRQ18lqJkhBr7Dsl35sBkOiCoPcrcq1Qesf4VhD0Y306cSqJH+Reo/JJtt/VoCxPjRaolBzTAPuKc/rMb9eSGQdPbUa4yscT9/RGXo6pl2KQiHJb1yB260Y4a26C/s5up9hZslK9Ui0tmXhZhbxmoaWh/doiimVSNK/UlWX6ZnGU3GHJdyPm+ACYWBwSH/0b5zx5sSRjM8fp7lAqbtsMNwbwTASyETSVuzY+3KIwgVa2BVg6pmUFbHQM14PeT3UoHlxSDJ+UMhXZhaFC9yR3X43fwobHwEKgQHmgs9+x0upCnGrrk+rL5QEKJ6HFNg0gSFVAFdOP0j2VuYyzt8WgJ8MlAkQDAMieUqatgg4NJhEC66yYa4v0UNkULVMZS41yki0yG9syqZ6YycYAqRtUWTmI7I8kc2Q9l7iC1L0MWk0mhhmx+e4a5vWnaV+Nh6xxw0VD2uRlVigLdj1Q5tyRO8pEoNIQknmB7OZLlgXiiIW/h5ikVjZkMOCbpf2cKADnpZGOHwj9/Eo0QToubzF7nKdLQjsj4RVhddRds6+7uQ8cdcvcEeU3i5fLKmbw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzA5S3c0NFhLY1F0VC9scnllSjdUbXphbW5qMHJPN3N6bFJadlROYjNudExp?=
 =?utf-8?B?UzFYM3Y0NDlhc3ZJSEdWemp2ZHB6UEM4U2VUTkZwR2VJcmNTWC9nZDJIQ1k3?=
 =?utf-8?B?V0dEaWc4ZjdpRmMxbkoydnFPRFV5a1FQQmJldE5ELzczK1FpZEhtR0p4T25p?=
 =?utf-8?B?WFZQa2tyakROakNMRTZXbkpiQUUwZ0pQcEd2V1BVaDlqUlQxQWFCUXZoaDkr?=
 =?utf-8?B?N2NVSEs4emVSd0VMeFlGSkNmZ0ZLcmdHZFJpQ3pvZ0E2SlpXTENlcXZ2VTgz?=
 =?utf-8?B?bDQ1VnUxMFpuL1NuM2I1UEJOaEF3anZVQnFRVFUwTXpJTFpBdXFvZ0EzSWQw?=
 =?utf-8?B?V2x3cTBGK3lIem1mR3Z4dGpZMVBKclRwcW1QWDFVUVVnZjl0TTl6Vk1JUTlY?=
 =?utf-8?B?RnFPbG81bEgrS091enh0K2ZmZlJodDJRa29SZVN0WUpkZ3JmNlg4a3gyZ2g3?=
 =?utf-8?B?U3ZUcXFqWW5Tb2FlbDc4amhCS1p2Z1FPY0hXYmR4em9qS2dnOTNmOFc3WDl2?=
 =?utf-8?B?Y3VjSUNDUHIxMlFGQ3dTQWsxUWVVWWdkN3ByRXk5U3liMjVEVEJVaitheURq?=
 =?utf-8?B?NzlZb2RNczI0aHA3dUh0RnA5N2pENHdpL0hDNWNkMmVOUlJCOGxkOFRuYURG?=
 =?utf-8?B?SFM1SzhYTXorQUNjNllIelU2SVJtTWxpZnZVN0o1NStUL1ZoWXpwekxCWU5v?=
 =?utf-8?B?ZDFLM3AvN0pPWk5RcjBNWFlrSTJiVlJBWklFQzNPaTRKZTA2NWxTQUJIQllx?=
 =?utf-8?B?MTZudUpVSzNsUTNJRzFWRmRpa1ZRMk9wWGMxSVRrNEFIZGpXdkE5NWh3WFlR?=
 =?utf-8?B?ZndjeHVQa0ZHdzNUOEFjS1lmRjVrWVBXM0R3TGtOdHhiZitDZ043UU5MMnlO?=
 =?utf-8?B?dnJOc0pGVVlYY1VuTmZHNWl0N1R4dEk1Q0kvZHo0YlhjWEI1WWJKSEJ5SCtT?=
 =?utf-8?B?NWtyNXh5aDY4bWFBRGZFakVnT0QxVnQ0STVTd0ZCMys0RVdublA2Q2dWbzIr?=
 =?utf-8?B?ZS9vZ0VlZFRYSEVFMVRNMlhBUjE3cmsxd3Ard3BIZGRrL1BOOTFUenk2WVVt?=
 =?utf-8?B?NC9PZmhONHc2SU15NFZwV0FiUGQzZUJZS0ozMXl6ZmRrN285VEZuZ3pQWnBi?=
 =?utf-8?B?RWhqTjlDVXBuT2poLzh6QW5NMitKLytxay9pV3dPUkhDQzF0ZEdERjVSbWxw?=
 =?utf-8?B?c1k2bFFMdUNBTlh4Ny82Y3c1LzE5azlTdmVyUDhaQ1RpQVFQeGgxYUhPU1Rt?=
 =?utf-8?B?WXRDM05oSmJLWkhGT00yVEdtYXJ4RXJmaFdGWTJnaEtQQTBRejhXaEJsd201?=
 =?utf-8?B?aEFIbHJ6amZzRUNtbytVdEkvWlowL3dXQWVrZUVZTDR3M0t0Y1JNY2xQNlpk?=
 =?utf-8?B?M2w2TmNkbU1lamEzUmh2REhJTTdrem5QQ3BVWEUxQVFCdXlWUEFVRThIei9Q?=
 =?utf-8?B?ZWF6VHdrd0JKak5NOXlUSXRCYXFGb21lZmhZUVA0OVpheGF1L05FcXFxeXNz?=
 =?utf-8?B?WElGWk5DVWM0QS9SUkM0dVZNWEtTSkZWVTNBL0xiVHB6dkRUdnRteFR0QkxP?=
 =?utf-8?B?M3YzajlFQjZVSDIzeTRwRGRNTzBqQWE2WVVqOGtIditPSG1ncEZYWkZ2S0dm?=
 =?utf-8?B?dUxCeXhRQ25kakNwS0NXNDJPQWZlQ0JOQmpiS1hscitlRXZvYWI4OWxSWDVv?=
 =?utf-8?B?c3o0SXNEbUs2WFJnYVNDWHdrWDJqWVEzL0g0dHluZlhld1RBc25VcFQ4SjV0?=
 =?utf-8?B?TVdUczd1VUlML0pXYlVJekprTmJHSGVVWGk3MHNMbDllYy9SWElxRWRKTjdO?=
 =?utf-8?B?OE05RVRZdnpWWlo4TUpBcFlUT1FsUVBtdzZraHQxZWtxdHl5UGEwT0ZxUlJD?=
 =?utf-8?B?NHpyWS9HWHNPZWRMUkhDNFhvU1VoWDZsd3IvTEcvekFhSnZ0R2Q2OU5zOHFn?=
 =?utf-8?B?b0VwRFpnK1NGNE1EWHQ2Y1pCcjJOMFJmRmxDZ3VVbjczeW1qakl1QkpFNmxi?=
 =?utf-8?B?YTNaSlZXM0hQU21YZ3o0VHIrcVRlRHJmVno0WWVHc3hhR090QVVMbVlyRmtt?=
 =?utf-8?B?Z3V2SjhFSW4zd3JlQjc5UHlOb0NPRWptbGFpUXNZcEhWY3IxV2dSeTJoSVd3?=
 =?utf-8?B?aWQ3M0VERk8xNDgrYzdCdHp1QkpvbkZQVFNNcUpHdEgvakZwQ2phS2RCVUNG?=
 =?utf-8?B?a3FLSXNpR0c0WlJpUzVRU3lUYzd1cFIvY09QTGFqcWpDcEExa0ZHZ3Z5OW1B?=
 =?utf-8?B?OFRDclkzcUVadC9CV1B0Q0x6Yk5ldzZKVE0zL1p5V1hqNWIxbXl4bys4dzhy?=
 =?utf-8?B?M0VkbHNzZGIvcXpvL2RLNCtYWkRLZVhsUzVtWm9Hbm4zRkV4VzVwZz09?=
X-Exchange-RoutingPolicyChecked: FfmKsXsBNl/B4gv1bcGCwy0FzKhv8F9IjxtRN8MRCqUV4amoEZ19qasFVwlFfJd9rIMXwwpIr4t4RZ6udEdlu019vaUuPDECWFaqiygtcZG4dvspmaSC98clcfqfXodLJh9QPvzw+RH3IWcEwAgDFa2obi/0yWiOauvKtSG5oMekbwTDD39w3GiNkn26azIpN6O0X1exeAomAeL0Dt+EEGIp2hZFVOrOaC4EiiQd16kFVmDwaQIlS6QcYCmBWg7FT+g8MBCiKlEGrJUaBzPY6v92nhtKFx6QnaQZJc3MW+L/gVz4o5bgtzSuzZ71lsy82OHKYOl9KF6pi24+XaGKVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cefce0a4-cc43-4157-6c78-08de9c470be0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 06:03:29.5356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqqZJKV5OWZbe9ngMuUpxwA72Dbb480gB3YZHrewzpMtlr/1bdEioKNLZ26vbKBFzldR9iRgf3CgRchfodikTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7765
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

Hi Ramanaidu,

In the subject please remove tests/kms_vrr. Subj should be

Revert "tests/kms_vrr: New subtest for CMRR"

On 17-04-2026 11:06 am, Naladala Ramanaidu wrote:
> This reverts commit 7f0a262891b7888a09e4a1838eb688ad9c676324.
>
> Remove the CMRR subtest due to a change in test approach requiring
> a complete rewrite. The subtest will be reintroduced in a future
> patch with a revised test methodology.
>
> rev2: Update the git subject and commit message. (Kamil)

Also, lets keep versioning as v2 instead of rev2

With these 2 things fixed

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Please get an ack from Kamil too.

>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 132 +-----------------------------------------------
>   1 file changed, 1 insertion(+), 131 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index ec0692b2f..01f078d2c 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -36,10 +36,6 @@
>   #include <signal.h>
>   
>   /**
> - * SUBTEST: cmrr
> - * Description: Test to validate the content rate to exactly match with the
> - * 		requested rate without any frame drops.
> - *
>    * SUBTEST: flip-basic
>    * Description: Tests that VRR is enabled and that the difference between flip
>    *              timestamps converges to the requested rate
> @@ -90,9 +86,6 @@
>    */
>   #define TEST_DURATION_NS (5000000000ull)
>   
> -#define CMRR_PRECISION_TOLERANCE	10
> -#define VREFRESH_MODIFIER	0.1
> -
>   enum {
>   	TEST_BASIC = 1 << 0,
>   	TEST_DPMS = 1 << 1,
> @@ -103,7 +96,6 @@ enum {
>   	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>   	TEST_FASTSET = 1 << 7,
>   	TEST_MAXMIN = 1 << 8,
> -	TEST_CMRR = 1 << 9,
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> @@ -252,21 +244,6 @@ virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
>   	mode->vrefresh = virtual_refresh_rate;
>   }
>   
> -static bool
> -is_cmrr_mode(drmModeModeInfoPtr mode)
> -{
> -	int calculated_refresh, actual_refresh, pixel_clock_per_line;
> -
> -	actual_refresh = mode->vrefresh * 100;
> -	pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
> -	calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
> -
> -	if ((actual_refresh - calculated_refresh) < CMRR_PRECISION_TOLERANCE)
> -		return false;
> -
> -	return true;
> -}
> -
>   /* Read min and max vrr range from the connector debugfs. */
>   static range_t
>   get_vrr_range(data_t *data, igt_output_t *output)
> @@ -600,57 +577,6 @@ flip_and_measure(data_t *data, igt_output_t *output,
>   	return 0;
>   }
>   
> -static uint32_t
> -flip_and_measure_cmrr(data_t *data, igt_output_t *output,
> -		      uint64_t duration_ns)
> -{
> -	uint64_t start_ns, last_event_ns, event_ns;
> -	uint32_t total_flip = 0, total_pass = 0;
> -	bool front = false;
> -	drmModeModeInfoPtr mode = igt_output_get_mode(output);
> -	uint64_t req_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh + VREFRESH_MODIFIER);
> -	uint64_t exp_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh);
> -	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
> -
> -	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
> -		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f Hz)\n",
> -		 req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
> -		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
> -		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
> -		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
> -
> -	do_flip(data, &data->fb[0]);
> -	start_ns = last_event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> -	do {
> -		int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
> -
> -		front = !front;
> -		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> -
> -		event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> -		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f Hz)\n",
> -			  event_ns - last_event_ns, (float)NSECS_PER_SEC / (event_ns - last_event_ns));
> -
> -		diff_ns -= event_ns - last_event_ns;
> -		if (llabs(diff_ns) <= threshold_ns)
> -			total_pass += 1;
> -
> -		last_event_ns = event_ns;
> -		total_flip += 1;
> -
> -		diff_ns = event_ns - start_ns;
> -		wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) * req_rate_ns;
> -		wait_ns -= diff_ns;
> -		target_ns = event_ns + wait_ns;
> -		while (get_time_ns() < target_ns - 10);
> -	} while (event_ns - start_ns <= duration_ns);
> -
> -	igt_info("Completed %u flips, %u vblanks were in threshold for (%.2f Hz) %"PRIu64"ns.\n",
> -		 total_flip, total_pass, (mode->vrefresh + VREFRESH_MODIFIER), req_rate_ns);
> -
> -	return total_flip ? ((total_pass * 100) / total_flip) : 0;
> -}
> -
>   /* Basic VRR flip functionality test - enable, measure, disable, measure */
>   static void
>   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> @@ -946,54 +872,6 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>   }
>   
> -static void
> -test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> -	  uint32_t flags)
> -{
> -	uint32_t result;
> -	int i;
> -	bool found = false;
> -	drmModeConnectorPtr connector = output->config.connector;
> -	drmModeModeInfo mode = *igt_output_get_mode(output);
> -
> -	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
> -		 output->name, igt_crtc_name(crtc), data->range.min,
> -		 data->range.max);
> -
> -	for (i = 0; i < connector->count_modes; i++) {
> -		if (is_cmrr_mode(&connector->modes[i])) {
> -			mode = connector->modes[i];
> -
> -			found = true;
> -			break;
> -		}
> -	}
> -
> -	igt_info("Selected mode: ");
> -	kmstest_dump_mode(&mode);
> -
> -	if (!found) {
> -		igt_info("No CMRR mode found on %s, try to tweak the clock.\n", output->name);
> -
> -		mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh + VREFRESH_MODIFIER)) / 1000;
> -
> -		igt_info("Tweaked mode: ");
> -		kmstest_dump_mode(&mode);
> -	}
> -
> -	igt_output_override_mode(output, &mode);
> -
> -	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
> -		prepare_test(data, output,
> -			     crtc);
> -		result = flip_and_measure_cmrr(data, output, TEST_DURATION_NS * 2);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> -			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> -			     result);
> -	}
> -}
> -
>   static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   {
>   	igt_crtc_set_prop_value(crtc,
> @@ -1013,7 +891,7 @@ static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
>   {
>   
> -	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
>   	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
>   		igt_info("%s: Connected panel is not eDP.\n", igt_output_name(output));
>   		return false;
> @@ -1226,14 +1104,6 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>   			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   
> -		igt_describe("Test to validate the content rate exactly matches with the "
> -			     "requested rate without any frame drops.");
> -		igt_subtest_with_dynamic("cmrr") {
> -			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
> -
> -			run_vrr_test(&data, test_cmrr, TEST_CMRR);
> -		}
> -
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
>   		igt_subtest_with_dynamic("lobf") {
