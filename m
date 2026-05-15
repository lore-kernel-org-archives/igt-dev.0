Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A338CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 06:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3659B10F3EF;
	Fri, 15 May 2026 06:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVDJ086R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4E610F3EF
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 06:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778825917; x=1810361917;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=67vd3gcPq+46KYySOEHzRF76opuxT86R6xO4meu14xo=;
 b=DVDJ086Rwyhr4j4ft0VMwRhVWt4l9rSLOmm49gvVbMEd5f65tQhgvj/B
 7pjFWKC6Pw6kq19EEY3N8XFqFidpcr14IdjxilSKjb1CpwAkOkvrXDIcC
 omcWlSIpH04wmdjnLkGzAhpbLl/zGl8G4lhwhzbvQbegVxSu7HAlbMez4
 b+wMNMG8nlHxK/gEZ5NNkORTyJT6lka8aowrp7thEf6WokHgQNwj/Ovgr
 Cxhfa06Rz4LSKMurxXwfdy3NwPtlXf+8y49lgfMJ9H/yfioeUe1ZWuRGi
 dnlcCyaDkR6rLA4MAJJWYQQ2K8YirXLhpvrUZxEjyI1uVIrPMcqDi5Jf0 Q==;
X-CSE-ConnectionGUID: jyoScausRKuAvSoiUWjxvQ==
X-CSE-MsgGUID: w4J1FGwtRNa9DcOqMBdOGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78803309"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="78803309"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:18:37 -0700
X-CSE-ConnectionGUID: oSntf+VMQr20gRHyhaD7gA==
X-CSE-MsgGUID: yX28L0qFSTinuHou8yo6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242601802"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:18:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:18:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 23:18:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiDOHsQcFdRuNiRSwKTnsEWebikXkK8X4HLhn36uPAEI1wqWW79jFR+VMZLvvepEq8kiikIwm17uQBpHoC18NassJmv8ftbG18EFJUOWFiMA+ydiR/+64N6fa4wFTgqPeVL48OmJLT7ZrPHvyls0+ygBTdO5e1Yx8Q51UM67Lttv4vfdHJhzindhuVOIEmkEccscSaAl3K0AtHQyd2tD9susQ+Dbgpo1eh0B2mAF9XDq49muNNJVIyh47mi6E07V6Z7nbhbcec/NRCUP6+SC9UCAWKB0sID8gh4AUpRfKwT/NuevUzDI+oaPH08hZksCvvEiNV64Ayn6qm9DSBFPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qe8YDEXUZfQFpA3JShmu9ooPAbuZpQ0tlb6JZY5vcN4=;
 b=m1TsaWJ9MWE3IecT7yhONXlp4KufUhe20XC/2L7UUSFSB6oCnw8fFSlJLYU1aNHnm1/GYYZWM58El/VwNSX2Q0iZTO3MlC15qcE7geXIsPU+bA1LeeCUmjphj4LawVjP157qDydh1xF2MpykKTnMY1cFA/zrK/pRBRsFj5av4B22NE0sdhl6Zhsiv3ZW2ErWBTHleTuOes41XGRlAIvjmjbNhRY84jJJ6nUkRxAG/ZwLlL76vBSc2VjdrtZxiHNk1ApeOX6mFamd1qvYsJ1OsvpRwtdc07oKHfJCgj9llHnu76pLloXolXyZBKOnZqhNBovEeC9c2Oh6iwC5+4rliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH8PR11MB9505.namprd11.prod.outlook.com (2603:10b6:610:2bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 15 May
 2026 06:18:31 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 06:18:31 +0000
Message-ID: <37d09072-23a9-4331-8c06-1409ebac00c1@intel.com>
Date: Fri, 15 May 2026 11:48:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v6 2/4] tests/kms_joiner_helper: Add
 igt_is_joiner_supported_by_source()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
 <20260430190947.2347314-3-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260430190947.2347314-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH8PR11MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ac6894-69a8-4f06-c455-08deb249c962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|376014|366016|18002099003|4143699003|11063799003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: I9PjlWjG9/pcNzflXbT3Nw31WDTdMmKN+p0bP1NrVbKXSCsSA73j/nv9FVQ+0vJpiloAyZqOTqBmwIk0KDsnIE1r6Gf/06KU65yHVrZijzc7WAou1nriRbDv6yvXaDHfA8NbAclqEUioclLhgV6i/+19XGWS0tCSp1D4sXLf9FTdQbQLTQsAVPWy768AjVHLf8YSiEfzynG/NHQwnehOhO0jSj8AeAS11dOuW2FRkPCQ8LGhvO0PA2IJI5ZGXMEVHKm0K7fBMv90OGXBo1fO7xhyja4fmSX2l4H9xdWO9IAwp5kjZkk7/PqvRf/vaxS5znwPzrWsWMchn2DUjBvaHuTqk8mY+nRAyYTxHi9O1UeD9qlP6zDfTe6f8zhd64SqzopNHVoucX6nxgGg3UeD+PWeM5Nsx4H2qzmgdNW326l+NYlGfn+E7JNF8fMrkFJaLftTk3JC0z/jmk9xuBEeTwggBAQe48sotnZh5glocS9F2r1OafTDJPb62cjiW0DuKfBT+WLkxV9Ixubd/iD0MGWJ3ngdlWdtyohtDqqIRpKwJPTb7ktv5bQKcuyp3DAowbIIYVzUwJ6twxZo0fIPSAEeUA4B4nceOBbdVDoxfxo/KbdGZlIJScPC5ebLZK6xNs3q7CvZiAPgVqhWF4v3/T9zaC9ioWt8SnUWC9vILMGouHXhQUPjZxj4HzPx/eCK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(18002099003)(4143699003)(11063799003)(56012099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2JFTitFaDJtVng3eHZvMmtnSVdnQmtFWTZ3bVZ2VE1TNlVQWW0zZklhTWQ5?=
 =?utf-8?B?dnNFMGxzOFZUNTNlUVdXZ1ZaUVVtbnhZYTNZald4TlllSHVRMmxNMkRaZW9j?=
 =?utf-8?B?Q1NpeFFJaWQyejZwWUlCVVJqbG82VUpXMUhucG1rdjRoOEk5cU8wTnE3dk9M?=
 =?utf-8?B?dzRyek1zeCtRUGZEbEZrOG1xM3JvbWpFRDBZS2lNY0g3VTF6VExJQ2M1NnJS?=
 =?utf-8?B?aG9XTjdFdUdyWTdYcXgvcHJLVjdTUUtUMmRTeERFRW9YdWxqb2ZaNWlkSzdn?=
 =?utf-8?B?bndWUXMyNlYwT2lnbTFNS3o3cHBKMk8rMXN2aGRuRXM5QTRWcWJTcjVra0Nv?=
 =?utf-8?B?OFhuamNMaFA2aHVWeE9KcTdra0lBU3IvOXJHbkZWUHh3ZmU2UXU5MXRsS3BT?=
 =?utf-8?B?cG4rYnNyeENnMGZySGF1RjZkcjZYS0xPZVYxNnVQd3NoeXl1Y2JtUnE0bGNp?=
 =?utf-8?B?eHg4Y3RDTENYeDAxUCtraGFERGM2NWpzR2hJRCtiK3J1czFZeUpJTVhxSG40?=
 =?utf-8?B?bWpmQ3NUTDdXaEVFb2RIeDZKekErZ25ZRTJoT3dhRnRrNXNoOU9DRHBtc2p6?=
 =?utf-8?B?Q1NuRDd4UmFlY2g0WmtadEJhQ0hIVEFrYlg1bm9GeDF5S0l5TUZpejdZTVdI?=
 =?utf-8?B?ZThBa1ZNYWw3a3o5RTFxd2x3WWdNTkZvSU9XR21mL3Iyei80Y1RoMDhNdkxW?=
 =?utf-8?B?OVdsY0U2MjNLcHBzTXZjZGU1YVpWUm96N1pRUkdEWFh5aHpldk9lNFZYT0U0?=
 =?utf-8?B?T2pHUlBFNWdkZGgxazlJcXAya1RNaEVXZzY2NkpwNXF6UEoyaDB0b2o0WWFs?=
 =?utf-8?B?Sm56Mi9GVDJhYVNVd2VZSFhRYXNjTENGRmxJQU03dlBtMWUwTFFmNnNpNi9m?=
 =?utf-8?B?UXI4R0phOEoydUVnN0JXMUl2UnkvTjFKZTQ1aWpLWmQwRWlGK0Q1c1gyNjJB?=
 =?utf-8?B?dFBSbDJjZkY1WElXZ2g3UGlHMEFSdzNyMXhYSlRwS2ZUZjFiSzBXZ2oxclF0?=
 =?utf-8?B?WEt1Y21SSXZYck1ML3d5VFc0TFlZSlY2MDdPSDBWMExCM3M0RG1EZUNtR3Ez?=
 =?utf-8?B?dHdpOGVUcU1DbEg3Ky9vdUE5OVNUaUhObVZEY1FMTlhqYWhCdytnSHJkZTlC?=
 =?utf-8?B?RUVzQlFuMmc1ZWczQm0rMkE3RkwvNURjWWgrRGZHblM2VkhPbEoyRjFNVlVG?=
 =?utf-8?B?Ni85Und1ajF6NDY5YlZra3JwYU5nZHpUQ2VDWVo4b3hXNTBYOUxyckozZm80?=
 =?utf-8?B?REk4S2Fhcmc0QVFndVNkS0pSVWtYTzVKQWNYeFpHUldmYUdYUktIbjQzbk82?=
 =?utf-8?B?NU9sZUw0SVVnQU13OVk5NU1DSnFmSHJnQ2lCZndoeUNQYUVMR0tNaTZocFlL?=
 =?utf-8?B?TXF6ZzZqcnFMWXdpejhObFNvYzhJb1hSVEh2emREbHNNMXNEeFFpVzQ2N3Bt?=
 =?utf-8?B?RDI0QWZjS0g2UUh6UDIvbk8vaEJOWjFzZWQ2dFhrWnNPV1ZpaTBqZVl1TnVm?=
 =?utf-8?B?QkxlOUtYaTNCYVVaUHZ4b3JFcFp2WHVscDd6K1h2d0p5akozbXhZZ0VuZkpl?=
 =?utf-8?B?MDQ1a1M4WjZGT2I3ZnRIQW0yQ2FyNXJEbFc2OHRMT3RJZS93cXRsM3NRTnNq?=
 =?utf-8?B?TGdCSEJvamVqS1BCV2V5cnBsTkhWT3Q3YSthR2pUd1V6VWI1MDhZQ1pRK21y?=
 =?utf-8?B?R1E0eHU3VTFLd0gzN05BdG56ektLVzV1dkZBUW5NR29FdzVzMmNjRDRGcjcr?=
 =?utf-8?B?RmtmdjFlRFBsSjBjMHhEeXJMTGVFQzc2YThRQjJaczVqZUx3ZTZidkE2QlFU?=
 =?utf-8?B?NVp4VGtqUU9JL0tEZ00veDN2dWhySUZEbmpYMFN4cVFBMWFmK0hZMHpKdlY5?=
 =?utf-8?B?S0RRby9kRmtmRFRhSG1UMGZWd0VLbkNuYkVNUTFWaVFIL2hZOVp3SWVramMv?=
 =?utf-8?B?eW1HSjZ3VHR6ZVdXMXN1ZkZGSzRLTGdLeTRaTmdISU9Wa3JaaTcxTW5qektz?=
 =?utf-8?B?T2NJYkRtN2tvak0xZkk2Z1U3L2tvMnZuY1FMbUNEemJ4VlZtbnNnK095Q0lp?=
 =?utf-8?B?U3hHbitINEZmMkJaV1c0R0ZNME15SHB4aHdxWmNLNVhnRFRhbGUzS2dKUEhj?=
 =?utf-8?B?V2pRSHJDMVdsbStDd0E3aEFVbW1scWMydzAxd3QwRUdUYkc3NzhMeEtjRm0w?=
 =?utf-8?B?M1RTVzJqbmVOVTBGTUZFN3VranVHOUN2Y0ZjdXo2dk1pN3lpUEVCR3RBMlBn?=
 =?utf-8?B?YldzNXJhVkZvb0M0ZEpidkxnSVk4Z1BnT0pZRGxRZ1VuZkxuYkhmd25nS0hJ?=
 =?utf-8?B?dDFoOTV3NWtpNWdCT0htazZWc0xSMTRUL090TzRlY2w5SzkyejQrdz09?=
X-Exchange-RoutingPolicyChecked: uk9mI6LWR7IcJcwwomPoU61lsRsg3f8Nxj+JUHXldC14S00YLIRcb3hq8FZqtQ39LQhXElAnEPUxl0Ii4g7BwSxSeg89spMnG2BUNQNQ2vvA4N0sFjFs7YKDaOvYZ1kYRf2ijAbZ9GXn8qzU6oOWvoRIdbQv0P3fVT17Di6fpg/A0dORR1AzlEgU2Y9kkK5b74ErDJgo5IhipNHNCik1WWqGhgK12ZuSd1lF/rR8uIWrhDT4R09gIkBbtmexUhydDBG5lZT0UZJCsN3ypCpYmGCbugzNis+bU8+yE76TPyfzc5TtTYxh03ZNmfSnxXeupQEi69yo+h20QcMdulGmLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ac6894-69a8-4f06-c455-08deb249c962
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 06:18:31.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5I4fKh6xri5SrGtU4zC8ZG5exsY2Zg3UlwXNqcI9gPMAuOYS7ad1qyEdpjs+euD/o3oItjzOdoRcFVnFUl6YNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9505
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

Hi Swati,

On 5/1/2026 12:39 AM, Swati Sharma wrote:
> Add func() returning true/false if platform supports big/ultra
> joiner and use corresponding func() in related binaries.
>
> v2: -Moved func() to joiner_helper (Jeevan)
>      -Use common func for ultra|big joiner (Ankit)
> v3: -Rename param type to joiner_type (Ankit)
>      -Fix ultra joiner condition logic (Karthik, Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_joiner.c        |  8 ++------
>   tests/intel/kms_joiner_helper.c | 33 +++++++++++++++++++++++++++++++++
>   tests/intel/kms_joiner_helper.h |  2 ++
>   3 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 86226a3ba..2cd0d7276 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -33,7 +33,6 @@
>    */
>   
>   #include "igt.h"
> -#include "xe/xe_query.h"
>   #include "kms_dsc_helper.c"
>   #include "kms_joiner_helper.h"
>   
> @@ -619,9 +618,8 @@ static void test_basic_max_non_joiner(data_t *data)
>   
>   int igt_main()
>   {
> -	bool is_dgfx;
>   	igt_crtc_t *crtc;
> -	int j, display_ver;
> +	int j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
>   	data_t data;
> @@ -644,9 +642,7 @@ int igt_main()
>   		igt_require(data.display.is_atomic);
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
> -		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
> -		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> -		if (is_dgfx && display_ver == 14)
> +		if (igt_is_joiner_supported_by_source(data.drm_fd, JOINED_PIPES_ULTRA_JOINER))

Would be to add a check using this helper for big joiner as well, but 
that could be handled outside this patch as well.

>   			data.ultra_joiner_supported = true;
>   
>   		for_each_connected_output(&data.display, output) {
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index 0aa409ac2..d51aa77e5 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -184,6 +184,39 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   	return true;
>   }
>   
> +/**
> + * igt_is_joiner_supported_by_source:
> + * @drm_fd: drm file descriptor
> + * @joiner_type: joiner type
> + *
> + * Returns: True if (ultra|big)joiner is supported by platform, false otherwise
> + */
> +bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes joiner_type)

IMHO, the function also be called igt_is_joiner_type_supported_by_source?

Either case, patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> +{
> +	int disp_ver;
> +	bool is_dgfx;
> +
> +	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
> +	disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
> +
> +	switch (joiner_type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		if (disp_ver < 12) {
> +			igt_info("Bigjoiner is not supported on D11 and older platforms.\n");
> +			return false;
> +		}
> +		return true;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		if (!is_dgfx || disp_ver != 14) {
> +			igt_info("Ultrajoiner is supported on dgfx with D14 only.\n");
> +			return false;
> +		}
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   /**
>    * igt_get_joined_pipes_name:
>    * @val: joined_pipes enum value
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> index 1ea871a3b..7ede624c6 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -7,6 +7,7 @@
>   #define KMS_JOINER_HELPER_H
>   
>   #include "igt_kms.h"
> +#include "xe/xe_query.h"
>   
>   void igt_set_all_master_pipes_for_platform(igt_display_t *display,
>   					   uint32_t *master_pipes);
> @@ -17,6 +18,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   				  uint32_t *used_pipes_mask,
>   				  uint32_t master_pipes_mask,
>   				  uint32_t valid_pipes_mask);
> +bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes joiner_type);
>   const char *igt_get_joined_pipes_name(enum joined_pipes val);
>   
>   enum force_joiner_mode {
