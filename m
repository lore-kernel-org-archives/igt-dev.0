Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEBECD3426
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 09:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62C410E5F3;
	Mon,  4 May 2026 09:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CnW/kvmo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0A10E5F3
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777887645; x=1809423645;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zvkI9gByvQROyOE5uu9aP85A9W8W+LNmWqLyoCNSZ5U=;
 b=CnW/kvmoGFpXuMVqqMTn55+pZ17VeRL58xv35FPN5MkDZIZkwdgeSU/z
 7KCkT8qEelBZGfVXVqHMDw8tmr55CIPGQqOs4ZRvq847FTzU1rSV6+onZ
 8qGvkpbagrNUoYtXGAkzuhxp/PteJtcwm+VsBxxceuXz8R2xWBV1iy4WQ
 ljwAuKepHbc98i5EkhUbG6OMjKXKWL+oOlpSGZ9bkw1uC62Ny4XS5HSqt
 j7JYhiVWn9uTB9Id0QHga+oEvbtoHXcyzZ5ObGyMXh34By66lG0fJI2Vl
 iryFXDhZutHpVAnNKK5mHWZnG+eOhc70tTAeJW/xbe0X62XyZZKNYAPd4 g==;
X-CSE-ConnectionGUID: ANJdah6lQVKeo1xJUqwvJg==
X-CSE-MsgGUID: yKq/eU5sQAeEn70nnoHXFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="104192529"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="104192529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:40:45 -0700
X-CSE-ConnectionGUID: PpVDmWqZT8qEHRZ+wUU8eA==
X-CSE-MsgGUID: InzJaEB4Q/mz3vwTn/Sz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="239781778"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:40:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:40:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 02:40:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN9o9d+NewN27qomuhPnMRFb0w/rH2pbeNMLeSJcqlN2Nr4r32lR4A+G5ayQO3Ef2AGt7oUXnvAiaTe+spZN9bHjeIW9K4h3GgcpeUP0tJ0O/K1aFJrpUF6jvbZOY7Qxbye605yUQbDp3/ylPfWHGn44Lh0bG2o3yMpIStJ1IR9hnqXdi7kZ7917FNA/UToMYpDbbmp8ZqaGVf8Fmi11GfCUWJVr1QMgdCkZvz1S5P2kEbLtYzRy5fsG8ocyohFGFfGB2TUAPSCyo0F0oe3Rhu0GWH88Thv/07I9OG805qFolJu2RZuBGOjXWbznGgwlskkYg9pTcA4XZlMOenycEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXQOiOXYSy0pDiW3523x7ug1BPxm4ECL6okC97IHUZw=;
 b=VRhOTqlmEhGeXGCl1ldRNfm5d5qhjLDvoCI6xs9ggmUur28rVDnYFsCl6TFXuK+FJML7AC1N6QC69tmnPq9Cc0lt/a+fzo6K54t6H1ObSCps0k8w7Wm2F4dRRWaX7JogxrbWPDptZY3ewhkj8cmTJJ3nXm9j4UI+YgdNZW0HXN4XcysoLZWwceMXR4h9sPIBSToIGCPO7y15UH1hy8USrRw5BcZMePaLSE29RJtwzIcRuos4iiXuBPjbUK0T6oukUzUDLX5vMSlh32XbjQZ9S6mKaFxT/HJ3deXV0wZEpDw691V/h1ivg7HaVmj2KpygDdV5YzgrWqrF6eE/MhCnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:40:42 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 09:40:42 +0000
Message-ID: <68ab320e-dc0f-48be-bce3-7b58722b97e4@intel.com>
Date: Mon, 4 May 2026 15:10:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_hdr: Move capability checks inside
 dynamic subtests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260429093955.3726263-1-pranay.samala@intel.com>
 <20260429093955.3726263-4-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260429093955.3726263-4-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e594dd-7d05-4877-f655-08dea9c13540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|42112799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: u48vgBLHIYbLlzwmjThmvx+aVAc3TuNih6DKpkE9KAAIchM7TYpfGEsnPCqr86dBagTuHV5W+YBhn9sRwjQUUKrn+zaZ7pWNj2mIChdoOyDq3fOH6rYYGx9fmNRFYLLz2SpIUdXvoqosrxpxeaKE23GmbNcRnO0qSoUyTgWOzvNMTqmaJG+T/om8n/tuXXWcpi4bpzI28V9aswIhME5lMvLHT8qD60+r8GYrlyX1ueRPatQxTlfJ7ZWRx+8bI2ffCwLNTA5FTHYl4pmPcPa88GxuqELX3aXWyzuehZFb94QbfjgMPpedpMYgEguJ86Vgj6yqFoQ6Ofe23P6W+uYWS1lxkPcTRcvA+Y/Pfl3fJuhiq9d4ZuwGF1OOY9v1KKqf3BTP/Be8ZgrLEWW+gjtHBCjL7oj373CrZ3wd+kTEceREq7KNrhT2DuJPCPEraawYxpXiW4QB2FSm6Fc8Oi53Q226H0HDOzMw2r0nEL84FaPW5ZYoOEXAe4/BySHWaNteyrHezXpKAAAg+R2fxlpLyqiEwNjMuVyNiqPqGXZx28MM8eqD7ZCoSYMLOf/OVrIx/NHE/P0Gr6VeRhk5Fcss0I2XNRV9MRQl47RFVca6rPE/8JEX0uzsU2tPPgGdd9Ma71zaVUeRKK/0RVrI026RtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0lmazVTY1RYZDdqVWZ5TWVYYWZaRnZqVVlINXlhZVR6Mm52ZDhYVjdLTjZk?=
 =?utf-8?B?NlQ1VVgxTG1OcFNkWTVIRWpWdllRSEZKaW9VK3hCRmtPNW50OER6aTRvaW1o?=
 =?utf-8?B?WENDOUwzNWVVM2YrZWJtVFg4a0JQdm1Bc01TeXQyVXNnUjNMMXQ3OWVncncr?=
 =?utf-8?B?TExLWEk1NkxzTkxZQXM3a3JkZW03LzZVbUZJK3NMOU03cEM1VEdZT0VpdXk4?=
 =?utf-8?B?ZGFIOE1GUEx4YUZJU2lzcVpiaEkvMWdBWERPZGFEQXdjQUNBVHQ3T001dmty?=
 =?utf-8?B?bkU1NmlWVllPS0M3Rk1RZmludjRSOEg4RmY1VVA1RXEvamFzV0ZaVThqa1Fj?=
 =?utf-8?B?R0VUeUpUNGNEQ21hSDFjR2RlTEM5K1U0T1p5KzNUUjFHanJlZDl0Mk9SY1R0?=
 =?utf-8?B?Rnp0WkRaN2htd2xPNFZrVERvKzJUeTlkaTIxVEw3ZW9WRkFGbkhZUmpWM0tR?=
 =?utf-8?B?ejNTRVlROG1NRldBQ1hxSHBDcHB6NTdDL1JTdHF3bmlzalBBQm5td0FjM2Z3?=
 =?utf-8?B?TlVMMUtsaTl1RUlSSmFBZFRJZEE1NG1XSlpDUUpGN3M4RDNQbGJsRU44UW9n?=
 =?utf-8?B?TFIxVGlsamlNRGVpSFZ6MWdLWjI4aHJTbHlhNGxYaWVOdGdiRXk2a2RXN2Vx?=
 =?utf-8?B?R3I3WlQ0ZFlNa3NVNkMwOGx4eEloZ1VaaThEMXRMaGRDdHhiaHMwSk1GM011?=
 =?utf-8?B?Z2dQa2hKTVllNUcrZkJBWk9YQy9DbU0rWmxEL0d1SmkwODJsR3kzVDFPN2Nw?=
 =?utf-8?B?dytaTUxRUGNlTVFucmlpb2JYTzlpb1lGMHp1dlpVSmZSYWhFTjh1MVIrSGwr?=
 =?utf-8?B?WG1peWNwWUliT1JoSW1jZC9jSUNncXNIRWtWUGFQbmlhQ1VNaU5IY0k1WDhz?=
 =?utf-8?B?ektRVG8ybjAwNnVGRDZkaC9HQUFqR3hEMmNUYW4rZ0dtcFJQZG51aENZb1o4?=
 =?utf-8?B?aXNBeGpGemFCSVBuQWpJMCt3MHkrQWxHbFlvcjBtWTkrS0FCdjFyQ2tjYkd1?=
 =?utf-8?B?eEVQRzRpNkRUa0RqZ0RWTE9XVmV3akJyWWdveDUxV1o2YkFhcHE4UTVkTDVk?=
 =?utf-8?B?L2huVFlWWTM4YnpncnJzYmJvQWRvMURrbml2UE1ZVjJLVjdTQ2ZDalBKM0p6?=
 =?utf-8?B?bkdCVzA3cDFKajcxUlBuZzZCMDlzM3NGRFM0WVdkNVJIajd1WXdNRFRYK0Mx?=
 =?utf-8?B?YnZNUTRPbytsTGNCOGx0UEliSDMzUGJTcm0vWTl3OVRDUGpLaWRNWVBKRC9S?=
 =?utf-8?B?a1VhMlluWUdjNXpUUk9pTzJGK3ZSbXB5NHBCa01zYUpyb2dTWkthZXZvL0dJ?=
 =?utf-8?B?U0pFMkZuakIxS2RoM1c5WDlhZ3diVFdMVU5ZUEpzN2prckw1K1ZyNkpVY2ZP?=
 =?utf-8?B?SWxtODRLTWE5Z25rTTB0c3dpYkhTeTBUTmx4TzFsRGxOem53L24zeUhzY1Rx?=
 =?utf-8?B?aG5lOThIK3FtWkFTMmY1VUFUTXNtNUFnR1NJVW1YVlpCcldMeWphR0N0WUlv?=
 =?utf-8?B?ZlduS1JpMDRJSEowN2R3OTc2SW80ZG0vMGRUNnJUL3crVWdUZjUwWGNFTHV6?=
 =?utf-8?B?WUxSdFl2VjJndDZ0WC9yT1V4cWN5bXJwTFhVVUR3YVNlM01FSzVoMWw4ak9H?=
 =?utf-8?B?OUdWcG5vT2JmVU93MWFuYnZYOG1YR1dvZ2dnaVJVYzlZZGZlZWlEK3g0bmhG?=
 =?utf-8?B?OWxyYUhCZ0tQcC9SMlBaY2VnWHFHd243NlhocUNpTnVydVQxZUlKSzVFWC81?=
 =?utf-8?B?SWRZbEZxMXRKdm5CZ1IwVGNMaS8rVldnY0pjWVhPaEU2c200djd1YXNFaU1U?=
 =?utf-8?B?REJhY3JhQ1NFM1Era0lYVTJTakJQbVg5TXFQZzBYQlVSZ01oMlJ1eW5qK09W?=
 =?utf-8?B?cndSRFo3VVBqS1Z5WFUxS1dqNVAvb0I2OHdjanFRU2MraGpzT2JwdEVqWTZE?=
 =?utf-8?B?SGFCS0o2aERSRmNWVVowZGlaNjBFaG9EWU5YYTVIY3B3Z3M4UWp6MHpQYXFS?=
 =?utf-8?B?TWd6T2lqc3JtNHFVUkIwT0tEK2REV2w0UjlWSWxvbzVyKytPYWI4MTVyMis1?=
 =?utf-8?B?cngyWDZ6VFJhdmpJSEhGcFhNZ2pJeFAzKzhWb1ozUWJ1dVJ4eTd2Z000YUdL?=
 =?utf-8?B?WUtMcmtoSE45TXE5M1UyckVFN09aaVhjSlZoTlBsUU0yM3pCUXVSbW9DVndv?=
 =?utf-8?B?Ly9SNUQ0YTk1SWZobHFJeFpwd3Vpak5YMmd5eEdlM3VnWUNSSDhiZFZXK3Nw?=
 =?utf-8?B?L3NKRlp2enBHNm9QWmJTcDZBWU1YbStpRFdMeVhwNVRoV1VmNVFxVGNyQXZD?=
 =?utf-8?B?eWlLeHpwOGdVM01ERUtDMFNMdzJhWWNkb3R1NzBSa2J0ZG1rTTJoQT09?=
X-Exchange-RoutingPolicyChecked: ALvEZoy4JaVw/GLIvRu5sJPRBwKtZ/igBOoVooUcHUWMfjhnxm/l2jdVB/7rfF6zDiA6vb8/ai3JU6NGtNMigb0cZfQO5u5YbFlYZp/UOYskQ7H6zOxPWBbGWLckFJtXFW5SSdr7O98BrNsuZH8UvHrf3r5076qZcUO0hKbkH4hKPfMSo5yH/7aBVMjRn+kCmUXmF6e7vkP3LsmcVlUB60X8xXfRH7KUGD2hKjG4r6V8inGV0GhjHDwoZIDR+Bjpv+anrEWpaQzljPO90F+C1HaJ/M6VpsowpYljsP03elscni2zBb/y3d+NFa6s85FSXs8xy9YftPkKEL39qgJoOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e594dd-7d05-4877-f655-08dea9c13540
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 09:40:42.1774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qX9YJpg/BuRVTMSyaZh/KAeV/tKzHWbLnC4ZIByqmgdkoDClVnBOjg1ij5pyq32EasMqfffmJ9jMcT+YVzZhzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

Hi Pranay,

On 4/29/2026 3:09 PM, Pranay Samala wrote:
> Earlier, output capability checks were done in the outer loops

Comments on earlier rev has not been addressed here. Please check.

With this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> using continue/break. This caused a problem where if an earlier
> output (e.g., eDP) passed but a later output (e.g., DP) failed
> a check (such as reading bpc), the entire subtest would be skipped,
> discarding the earlier valid result and reporting a false skip/failure.
>
> Fix this by moving all output capability checks inside dynamic
> block. Each pipe-output-format combination is now an independent
> dynamic subtest that passes or skips on its own merit, without
> affecting other combinations.
>
> v2:
> - Consider other pipe if pipe combo fails (Karthik)
> - Handle test_fini wherever required (Karthik)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 166 +++++++++++++++++++++---------------------------
>   1 file changed, 72 insertions(+), 94 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index e880b280e..c9a0b1707 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -323,17 +323,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> -		if (!has_max_bpc(output)) {
> -			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		if (igt_get_output_max_bpc(output) < 10) {
> -			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> -			continue;
> -		}
> -
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -343,17 +332,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			}
>   
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
> -				prepare_test(data, output,
> -					     crtc);
> -
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> -					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> -						  igt_output_name(output));
> -
> -					test_fini(data);
> -					break;
> -				}
> +				prepare_test(data, output, crtc);
>   
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
> @@ -361,10 +340,23 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i]))
> -					      test_bpc_switch_on_output(data,
> -								       crtc,
> -								       output, hdr_test_formats[i], flags);
> +					      igt_format_str(hdr_test_formats[i])) {
> +					igt_require_f(has_max_bpc(output),
> +						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +						      igt_output_name(output));
> +
> +					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> +						      "%s: Doesn't support 10 bpc.\n",
> +						      igt_output_name(output));
> +
> +					igt_require_f(!is_intel_device(data->fd) ||
> +						      igt_max_bpc_constraint(display, crtc, output, 10),
> +						      "%s: No suitable mode found to use 10 bpc.\n",
> +						      igt_output_name(output));
> +
> +					test_bpc_switch_on_output(data, crtc, output,
> +								  hdr_test_formats[i], flags);
> +				}
>   
>   				test_fini(data);
>   			}
> @@ -718,43 +710,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> -		/* To test HDR, 10 bpc is required, so we need to
> -		 * set MAX_BPC property to 10bpc prior to setting
> -		 * HDR metadata property. Therefore, checking.
> -		 */
> -		if (!has_max_bpc(output) || !has_hdr(output)) {
> -			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		/* For negative test, panel should be non-hdr. */
> -		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
> -			igt_info("%s: Can't run negative test on HDR panel.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
> -			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		if (igt_get_output_max_bpc(output) < 10) {
> -			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> -			continue;
> -		}
> -
> -		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> -			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
>   		for_each_crtc(display, crtc) {
> -			igt_output_set_crtc(output,
> -					    crtc);
> +			igt_output_set_crtc(output, crtc);
>   			if (!intel_pipe_output_combo_valid(display)) {
>   				igt_output_set_crtc(output, NULL);
>   				continue;
> @@ -764,42 +721,63 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				prepare_test(data, output,
>   					     crtc);
>   
> -				/* Signal HDR requirement via metadata */
> -				fill_hdr_output_metadata_st2084(&hdr);
> -				set_hdr_output_metadata(data, &hdr);
> -				if (igt_display_try_commit2(display, display->is_atomic ?
> -							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> -					igt_info("%s: Couldn't set HDR metadata\n",
> -						  igt_output_name(output));
> -					test_fini(data);
> -					break;
> -				}
> -
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> -					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> -						  igt_output_name(output));
> -
> -					test_fini(data);
> -					break;
> -				}
> -
> -				if (igt_is_dsc_enabled(data->fd, output->name))
> -					flags |= TEST_NEEDS_DSC;
> -				else
> -					flags &= ~TEST_NEEDS_DSC;
> -
> -				set_hdr_output_metadata(data, NULL);
> -				igt_display_commit2(display, display->is_atomic ?
> -						    COMMIT_ATOMIC : COMMIT_LEGACY);
> -
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
> -				igt_dynamic_f("pipe-%s-%s-%s",
> -					       igt_crtc_name(crtc), output->name,
> -					       igt_format_str(hdr_test_formats[i])) {
> +				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
> +					      igt_format_str(hdr_test_formats[i])) {
> +					igt_require_f(has_max_bpc(output) && has_hdr(output),
> +						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> +						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +						      igt_output_name(output));
> +
> +					if (flags & TEST_INVALID_HDR)
> +						igt_require_f(!is_panel_hdr(data, output),
> +							      "%s: Can't run negative test on "
> +							      "HDR panel.\n",
> +							      igt_output_name(output));
> +
> +					if (!(flags & TEST_INVALID_HDR))
> +						igt_require_f(is_panel_hdr(data, output),
> +							      "%s: Can't run HDR tests on "
> +							      "non-HDR panel.\n",
> +							      igt_output_name(output));
> +
> +					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> +						      "%s: Doesn't support 10 bpc.\n",
> +						      igt_output_name(output));
> +
> +					if (flags & TEST_BRIGHTNESS)
> +						igt_require_f(output_is_internal_panel(output),
> +							      "%s: Can't run brightness test on "
> +							      "non-internal panel.\n",
> +							      igt_output_name(output));
> +
> +					/* Signal HDR requirement via metadata */
> +					fill_hdr_output_metadata_st2084(&hdr);
> +					set_hdr_output_metadata(data, &hdr);
> +					igt_require_f(!igt_display_try_commit2(display,
> +									       display->is_atomic ?
> +									       COMMIT_ATOMIC :
> +									       COMMIT_LEGACY),
> +						      "%s: Couldn't set HDR metadata\n",
> +						      igt_output_name(output));
> +
> +					igt_require_f(!is_intel_device(data->fd) ||
> +						      igt_max_bpc_constraint(display, crtc, output, 10),
> +						      "%s: No suitable mode found to use 10 bpc.\n",
> +						      igt_output_name(output));
> +
> +					if (igt_is_dsc_enabled(data->fd, output->name))
> +						flags |= TEST_NEEDS_DSC;
> +					else
> +						flags &= ~TEST_NEEDS_DSC;
> +
> +					set_hdr_output_metadata(data, NULL);
> +					igt_display_commit2(display, display->is_atomic ?
> +							    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
