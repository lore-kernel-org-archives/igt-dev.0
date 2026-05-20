Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C06FCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 06:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E7D10E07F;
	Wed, 20 May 2026 06:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BweS176D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8EE10E033
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 06:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779258551; x=1810794551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hsLce0PWY7hBBIZ+eaP7DWu7zDkosSh6FV3rh3iOVU0=;
 b=BweS176DiwJcLOUqbiR96UdAtg6LoW7D3R7KK9gg7I9kgECzIAlrQUOs
 8Tf3Vt8VrG2P2FY5mGw86uFOTEvTecRmOls8iW9ELBgnNELOogzTckG7F
 C2dLxjXvxyWYzTZ6g3KFCx9aMrPmQwGNSFA/tKGLxF4ikO7lQjRH/+yJA
 xJqs5GEhFyQPq7/UeFdJXD/H/cLvivTx5Z33sQeC1NYsyC2Rlm2Wd07oy
 DAUM8v3pIRarjgzfmfwD0O1dCSPTox84eHjTVHFuM8Pfdbd+6Bxt9M0Bx
 bcEUqJwjq8WhuDUE4xaWOCDhAJ6Ojp9UP43RnNWENF7S+YHk9cQJyhgOs g==;
X-CSE-ConnectionGUID: /iePphgDRqGPptiz/6GSog==
X-CSE-MsgGUID: msLD7bUIQK+kQfotXLVjWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82719569"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="82719569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 23:29:11 -0700
X-CSE-ConnectionGUID: Kmbmgic4Roy3vJBhOkrQiA==
X-CSE-MsgGUID: IR0jMEL/Q7akMTQVuyyU9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="237060684"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 23:29:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 23:29:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 23:29:10 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 23:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOjP6MElSoYZMyUcWvP4y8c7RIBfkSXGVT3ImwHwdtErfUqbj7dXXEjfPgBprDKvQG2SB91mbNry7tlSVmiOusza3JeQJJmiOisxT9Ei+Cnl5jhso9byXp+CS7zo8jJ2VZxOg5+yq1+7gvpFKQ8hj1+c9sSekbPgI3+dKiZgxoKjVp/BNMzsqEmrCjGTJlk27ICvOWTHfJYNJRgTAtGFYaM/A1BZaIs0hlA8sYNZqs8zIcV0HvnKfslXAw9t7yV2dkIf8sl5fXG4CmZjodKFKc9rz/Z699NpR08g4wFXm5R7/vPpaPIwg5xy378eHhrn8KwbUSsDsBYs29+QcgHQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUe8Y2blgNxFbDujeTq1jKVu0ByROSvYWDYRa/lx3zs=;
 b=RNmJgEVcvbqNasafRAvv34NX2BF6VxXWgbyhw0f5LFb5Kmch2H/LH6dfxFUeeMFWsUmVveHKkciJjOMG5vGlXmWZIrKHW5DSmB/iLhXFJBmE/1uqrQRiYtysLui8Y7Sl6oQas+SO89oi7vyK2w9oS/bHcM0aiwUf3wNmWvTP0DPfKbmXjDVgRdIY/G2XpBmKskXxJSHNooVo18tR/EWBndrNeMe03AExQltIf5K7RjF5oQG447aJIWIeVXHA/ONBNON6QXpokeyR5XvmAQKybWG0Wx9f+AHS+jrR5uzWaz6bU3CVhUDdOfljtSCmc6UKXBHIMJ0oIVCnbrzuOm5xDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SAVPR11MB9551.namprd11.prod.outlook.com (2603:10b6:806:4e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 06:29:01 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 06:29:01 +0000
Message-ID: <ba161e33-81a8-4b5b-b97c-9cd161ab1847@intel.com>
Date: Wed, 20 May 2026 11:58:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dsc: Fix retry loop for non-RGB case
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20260519041409.2479630-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260519041409.2479630-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::11) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SAVPR11MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: f7608ef9-371b-42f9-914c-08deb6391479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799007|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: j9PYSJ42AfRmN7CEYks0C9C2vSfz5lg33/WqtYtTRolSAa3rsa/xzAinuLUUFEtTj9SbT+gMflGmUa6cNqhpxw6v+sJX7b27U4Q5KVXWDYoOTSJmpFzIefN2s7kOV9DSnOnBvU4ZT2GvETXT5dTk6S+BMjAf6KKNSrNWC1TPQjXASucUyj4Nt6d7k947qKvfBqzLJaAKy4NOf4cwj37zEmPTUeKT/r5bobd2x6xp3BMvkrd+NlXAj1k0wxR4BX5gldi/1QPyFIi+EutB869UtCam28CzJJK6AY3Uk3TWSeTp0hRTScca0eHojNXRHy0nL23Rk2AXltLgkMRYxYiZuzg6CW/HnJ/wfzbzQ1RUmlEmt6NLyBk9iRRc03pHUJxMGi4U3vvJx/GCcZivb6zBW0cR6rJj6B3u5f5wwLtwbWYel5oVjr9ggYz4rtFi6AmPY4gAJtdZ2diSeRR4nIwHu6hMtJoxhSgl3qg1YMAGCOeqnHVgUYhGb8UxtBagb6FKfGBl2mbwwmFmyzkERlB6a+2UFQYem98Tm87AuHe3jGcNRxJwQVo1+gCZLhYDIXLv9zQcYMO3ogrocnOnVnI0PSecPBy246iImSBatlxJAEuVvbpTp5NM5KNDr92eWf3GnyzpW8lU8DhyRp5kqPeXZtykeRqLzHi2mJoXheUZY3digE93w1qEosDCo/+rLuac
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799007)(56012099003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1VHblpUTEFJbTRHQkNSMUdSRTJ1aXNLYXZZWFE3M3hDVFhVWTI1VVJocVFq?=
 =?utf-8?B?K0lOaG5FNzF2VEpuSTlXUDg5TWxieis3SFhjRjk5MTZJQWN6bFRZM0owQ2dD?=
 =?utf-8?B?bEVFU0hibkJMd3luQ0syOGVJVVpJZjdwRjNURElORlF2WmJicnJyNDNtKzBq?=
 =?utf-8?B?YVZ0Y2FWSnZvS2hyc1lZS0JOZ0lhTVcxK0wvcWdxOUdHWFFQRzhCQ3kzOVVh?=
 =?utf-8?B?UWY3S2xTMHA5dUJDeHcrYjBrQkVoandScURMc1ZWNWMvV2ZwekpDMDNRRXRF?=
 =?utf-8?B?T2dMbkc0d2hGSVhhWmdlMkU5dWMzM2lVYVRHTkhvbzExa3M1YjBzSFdHbnQ1?=
 =?utf-8?B?MVVBMDJJdkU0QkNQV21Iek5US01vNUhFLyt4UGl4c1pMNUNvQzQzZ04xNEZI?=
 =?utf-8?B?M3BMdVk1VnBRdm9BUkJ4UGNJeGY3YUtGSERPcWo2bjkxWDFISkNKdmhNNWZK?=
 =?utf-8?B?cWx3R01RcXhtMDFwQ3EvL3dHQW52c3hWMXQ2ek1xZzBaV2xoQ1ZGVDEydzR4?=
 =?utf-8?B?cDNBVU0xc0VUU1hJYVhzVFI1eXFaTHQwSGQ0QldxNnl4UG55N1VkK3Q1U0lS?=
 =?utf-8?B?NmEyZGdSeG52RkZ3bWcxVXRhM0lCaU1NNUh4SG1SZkoyTXFvNWZZbGhOdkJ0?=
 =?utf-8?B?ZnR4Q0pZMnVBK2hqcnZ6NHBtNEFjdmtjOGNWNGJqSjQ2OHQ4TjBWK25DRjJ3?=
 =?utf-8?B?eFRLN1p5MC9FeE9QemxoZ3h3ck5sTXVNc1NUTHFJcVZCcUNUOXNNakt4QitM?=
 =?utf-8?B?Vm94dW50NCt0dkhiL1dsV2dPNmtFd0x3WDhPYUNjd1BVWUhyUFFlMG5qM1hV?=
 =?utf-8?B?SVpieHI3RmRhYkJZU0dTTDNob1U5YUw4Y2RxT2FqdktWN3FpanVDV0VxMmxo?=
 =?utf-8?B?cE5QNnd6UTlRYURjTXgybFpuU2xSM0VjaVJ3L1ZORUtxeENiaCtmOGlVYzA4?=
 =?utf-8?B?bWthU1hYeFVBZy9xcUQzUklpNHJORnZSRyt0b2p3MEo4N2treHFoS0pTUUx2?=
 =?utf-8?B?WDYxNFBoQjErVjJVc1V6NTJqUkdkUkVyWEJoR25QYWFYSDM5aUR2T0I2L09h?=
 =?utf-8?B?TWlkT3NRRWwvR21PMVplOHk2RG5NUWpLNCs2SUpJM2VsWlZpRjE5eUV2ald5?=
 =?utf-8?B?eHY2Vlc0Y3M2WnVYZG5jRVV2Q0k1bFIwU2ZURlU0U0dkM0ovTnUrbTZWVXNk?=
 =?utf-8?B?c0FzODZmM2IrOEpTNUpuRnp3NThkemoyUFlIUWRTSEhvL08xYytiSjlWQzNz?=
 =?utf-8?B?MUwvV09vVzNHTlhQWE0rVi9MMFN6NEQxc2RaeU41VklFTkwxanZjQ29qMjZr?=
 =?utf-8?B?bFJNeGsvZnF2SE45UnR5TlFKNGpxbHpSYXFUdXhiR1ZXVEt2bm5vY1VKWjl6?=
 =?utf-8?B?NkIrbklTbXd0OFhrVHNqMXNEc0ljM0wwbjZYa295UXRmODU4bW9YSE1pVWdq?=
 =?utf-8?B?S1M1cEdpTGc5dHpDeGNaQ21uaThtMEdRakpKWWRKVW1ycVNoMzNhY083WU9Q?=
 =?utf-8?B?K1NTWktpU1YyUlRxNGhObTQvUG1CMFZWYW5abStwRzdGS2ZVRlRhOVhBOWcv?=
 =?utf-8?B?YlprWHd6VU1OUUsvNTlaVDdEeHZucWxNWElYcm5SVlRlVnZUQUFJd0M0elRZ?=
 =?utf-8?B?Rk9mU1NtT1ZZUjEvUTNIeVBIVmhLdkxxa0lDNDBHaXNRYng0cUE5UFB0cUNi?=
 =?utf-8?B?Z2tKcTdwRDBFOTFFNHZ0RnVxOEltajN3bXpPb21iN0JVdDZjMDBVR1hxMUJO?=
 =?utf-8?B?N1JVSytWUFlEdnkraU53VFJYeXB4bmRTZGpCYkgrTWZMa0xCdXhzeU1TS2Nj?=
 =?utf-8?B?aHZZdWs5NDNqenhuNkpxVXByUmZycjZwM3J6RDlxSnpySmtyU3MxU1RqSEZH?=
 =?utf-8?B?U1NuTHZlWEJsanRmc1o4QXpyWVVMWTV3cVU1YmZxNTg2VmgyeGgzRjVGSHRG?=
 =?utf-8?B?NDBJWG53dnVUNzJrYTRVa3RKQmNIS1VRRXlBTXR3aUVQQXNZUFU3TkNMYzRR?=
 =?utf-8?B?ZFZnMk5vUlZod1hHbW5LUEJFbCtlM1UyZmdiM2dXOHhOOHpIckdxTm4xbmNE?=
 =?utf-8?B?dWFsampNRUFvdUNpVWRxYVZneGl2SFljTDkxbWlxcXFsYTh0Y21SL0VzL09Q?=
 =?utf-8?B?ZjRQQkxCYXVMWk1sU2o5SEk4Wk9vUExvckNpTlE3SDBXSkZVdEpXaUdUVjlq?=
 =?utf-8?B?dXBIeUlkRjNMNStnWFo5UUQzMmoyMTl6cnFHZS9wL0hWbzRWNVZhazlpM25Q?=
 =?utf-8?B?K0pQNzlwNXZISWJYRHV1VG9lTzNiSEdpWWFnWE11ZEFHTUczZzlZYWFTcjlV?=
 =?utf-8?B?cGtYN1hlYmdsajI1Z0hKSzJGZm50U1pmUitxR21xRk1jRnhnYVg5dz09?=
X-Exchange-RoutingPolicyChecked: BnT9tFZJOlLweuX4v+qZuMiMjLlXK1bmb7LdGV/iAkKdmstb/02ocZbR/iSYH7rKv9W6wKYMCJWpnmvveHzVCbHUkfxd0MMd70X4TKIvUZpfmJbzbEDRY/deIRNerkUj445loPkhrM/HSKDngUBXu6L27O/uNLygNRIgwQCXGz8hlkbNAZtL+cTNlzfcmd/g9RluC2kdlUyE7wo79UfDBZUP9ZchSduVGUuABmD+4wryREh5ZM2NXz7Gb+yPLZjc1/ql9rKnmE1WndqS21fZXQ9xxYrhC0xPPm4yi5BOiKMFf7eihW0aEKyv8IFUvQUMbIZzcYq7/wqU0p9Jd5RTzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7608ef9-371b-42f9-914c-08deb6391479
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:29:00.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsRvLXNxegi6us1VteBkFxm6RarM+3+8KH/p+lSKjJQl5lRHDJD4fbRgHF5NH994N1f6hfh7wfaZrtesBvAiDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9551
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

Hi Karthik

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 19-05-2026 09:44 am, Karthik B S wrote:
> When the first selected mode is invalid, the non-RGB retry loop can
> re-test the same mode repeatedly because the mode index does not advance
> on the first retry path.
>
> Advance mode selection on each non-RGB retry so the test walks connector
> modes until it finds a valid mode or exhausts the list.
>
> Fixes: 93a5298ac980 ("tests/intel/kms_dsc: Use high resolution mode for output format subtests")
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_dsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 605ad2d5c..4c41c6a3b 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -178,7 +178,7 @@ static void update_display(data_t *data, uint32_t test_type)
>   	mode = &output->config.connector->modes[0];
>   
>   	do {
> -		if (data->output_format != DSC_FORMAT_RGB && index > 0)
> +		if (data->output_format != DSC_FORMAT_RGB)
>   			mode = get_next_mode(output, index++);
>   
>   		if (mode == NULL)
