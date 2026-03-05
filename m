Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5BAEEF334
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 09:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5330B10EBC2;
	Thu,  5 Mar 2026 09:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoNw7uFm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92E010EBC9
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772701549; x=1804237549;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=etpxFdYVzbkh2vc0oeQ6WPD46cVkfCOcVXl5QiI3eno=;
 b=OoNw7uFmV78BWAuFuBxp0PAArrojo7dDWVEhH34YDeu3UWLcPV5D3RA6
 kl9PL1gmZCFPbSbCfpWt9xiIv5TUWG+RT6B1eVteTyVaZR218rH/6p0QG
 8cLuOkKLJgK+xRfxCxyxvYZkql80DHBu9J683ZI2YcA5t0LZBJ9hEvyzu
 TDGl9LXvnBiC+DxnzhUAav+lDGF5rxx5HuVwISR+bgJ13V15ZHvGoGK2k
 eV1kop850NSUxUv9zgue24M/sy+IK3dvz5IjBlSnUcFU56lr4PQ+X3nxz
 9aNShD02FuVdYUb/2e0hPMFw8obvGiDQibsBWNHM8t9NofZxPkDZnpnqW g==;
X-CSE-ConnectionGUID: vVymamNvTN6D63Vq7xCGcQ==
X-CSE-MsgGUID: zFkMApjHSbOFT+4PxIlgGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85254291"
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; d="scan'208";a="85254291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:05:48 -0800
X-CSE-ConnectionGUID: EbBnPCYURumbBCop327HxA==
X-CSE-MsgGUID: 5FzdvdSjQKOQMkTEqG6AeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; d="scan'208";a="218568117"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:05:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:05:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 01:05:44 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:05:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcJJh8onufTbXkKWczv1LznLu1Mrbp/Ku1HlHGcYbe59tnvIdwQ051Iyilee+N1bL/0T1/uUDSxf8RUsuCa6uvzvrv8tjBIbWqumNBpv86RBbKXlNQgoe8rSwUps2VShrveBJLi8zA/Cf4+FhxJeZxACpO446AntA6NW22JLpsDhlRvGG5MvUQwSFiIi9hLdfChApT5sy1tHVshHjGAfKzQtcAQHG5BFv4QiDM5DPnUTepsH4qfDuDhyjL3HJb+47DE4jN1V9iAcU6vXb2+lwLoWuQ1ueGJR5CvIDY0oA5UWzm9dF2doz4ioncC9cKrhmWcz+HmATktTAAUzgx8BcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6gIK3X8yDjB5xJ5Zcar2543SddjO1xJrtMm9neAvMQ=;
 b=zWMPilhQm+yZm2neMkmfs+MOKa7KOAa6gj4Nroj9oZyjWnwo3MIl1BKSRb9N/IqB9vuPIgvu1tTCCh/6zqQ6pn++B9Fgq2fbiCxWUeDE+mN2vA/tEeeCy6ZTUnzYKweTZPSr47AL9aCJy44kJ9lhDp58uZSXWxncSo3ZL6HCmUEw4fQ119ozw6BMRr1XVCTb4+BhUL7oI0ZekNPbmRi84koxAT94AXoMt6ZARvVABQ0iQqNUeBoxCW00zq3SuAl9gfFdLwrawp+j8sc5v3j8tTE93yrmw/EMMaYulxrW+SqA/2vGQH9zcEmjtypm5e9S/HP2bP6JRRPrE38qtqi6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 09:05:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 09:05:35 +0000
Message-ID: <509f640a-42d3-4c57-9b86-8775c51fb196@intel.com>
Date: Thu, 5 Mar 2026 14:35:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6] tests/kms_explict_fence: Add Test for Explicit
 Fencing
To: S Sebinraj <s.sebinraj@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <carlos.santa@intel.com>, <krzysztof.karas@intel.com>,
 <kamil.konieczny@intel.com>, <zbigniew.kempczynski@intel.com>
References: <20260304114958.959180-1-s.sebinraj@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260304114958.959180-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV3PR11MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5644096f-533f-4d76-bd90-08de7a965cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|1800799024|376014;
X-Microsoft-Antispam-Message-Info: xzQwlMuo7xCvhYIdLwuWj1KQjpvcyEAwZTOfa+E7Vaky++vGAWFt/N0OQEaOP5FK3csVBd4+m3GLOaMGQFivwqaulTHhZg/7+k2u4D1akjaqf3YEU4tqbfp3J7Gl9N03j02ktoCIvkFRB4fcZG6u3x9Vqq7VhQLKqh/9aAcnrAWchBuqIZohDrCP46CxxYgq7KKA4MTzDudZpui5vsotMlvtKem1BnOk0gzu8D+QiUtvcQUcyfnXTTJtXF0yjB55BVo1KqSC6GWzVVtjuDeGWk6s44V0S6tDiD4V3SF9L09/fDSIJyyrJCJRYhnRHeMEkxbj++s3b/VtjOxsjUE3FcW7JLCreWrPbZvJ2n6Gc60ovh9aqXVMV9ZSLYV13xN06GPV+vyRTYrpRO39XZgkWhdLEM8AQ9GFymJfIX1ffyfhQjhYWWqWKxrx0AU/6ZyeNXrMcd3bjOAxqIn+vepXKBsEAB7WCs1+Y3B95R/ANwpQ/E4HVpM8DbjaLTPNvMaZHY5EhJnz7bt1itD2K0qjj1EnhZPO70cY4H1+Yar/zdcyvLnZt4WlUwXAUQJRRL2s7Yl1wJwOQjy2unvj65VML+BgNwH4HFYGH0SNgm2AiZq1wY6+57L/EwpW7SpEwUhafodQCJd8UuMR50sNVlUdb9zNZVgnSXL2Uc45Qf42zmEtTfZtSJcDGpN8JYWRP7nJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGp6SlJYZ3lhVUwxZEpZWDBKMGpMeDY5WXhJU1RWa3ZaU0svYWZwOUxVVUdi?=
 =?utf-8?B?WnN3NkNCRWc5VWtvRmtsQ0xMd1dGSmxoYVdleHdTQUhTM29jUVRTNmdWd2Vj?=
 =?utf-8?B?U01sRGRiVkJiMElWZHhjaWcvNkdRa3FHc1Zvank0RDlBdXQzN3BqaXVmaERw?=
 =?utf-8?B?NmRPUFNZalVMWndDcUgwTkhvZ0VyNzFWK0tTVXZySTNqdFNwZ05Wd2dMRThj?=
 =?utf-8?B?ZHVvRUFQY2g0cmc2UlNYQ0lVdytreGVvVzFwM2JNdGZwR0FWckZ2eFV6dzJr?=
 =?utf-8?B?QjdsSS9XZXQ0RUhxYUFKbGZLSEE1cFVsRjM5QzlpSDI3b0tZZE9sS1Y2b2Uw?=
 =?utf-8?B?VmxYaGFjd3J6K0FLRUVKTnZJNGllN3dGU0FrOU9PZVVYbFVHZWZiTGNraWpO?=
 =?utf-8?B?Qm8rdm9mdGRzenlFdVM4TE9pT3orRU11SE9UN0ZJaHZrNUk0T2VOOVFvakt5?=
 =?utf-8?B?dDJESEV0SEhibEFGRWV2TGdqMzhRRnRVUEVSM3h4T0pqdlRPbmwvR0dTM2xR?=
 =?utf-8?B?Z3dxLy9seXdaM0hEUXA4ZkEzdzk1aUdmZGk2Ym0xTk9COGR3Tm1kTUl1ZFE0?=
 =?utf-8?B?MVVHMjZjTDVndmFQTzhzWXRVMitvWVlZRk5Cd2RTZ3VlTUpOd2pVWVB2SjBK?=
 =?utf-8?B?NGVZdWdnL2N6eXZrbk9JMklaZzF1N1RxNm9LRXp0VWpPSFUxTitpOVV3MXdu?=
 =?utf-8?B?elVsWk1Pd1pmNE43MHdGR3RIamI0L0I3UWNYWE1YMWNzWGE4MGZLdGNZcHNT?=
 =?utf-8?B?S1BRcjg0dG5ocGNaQmNQNCtSWkFhVlZhZDNiQS9PZlZpSzhvM0NzLzJ6d3JZ?=
 =?utf-8?B?WmFXSXV3V3dmSVNJS1FwNExIVjhLZ1FFdVRNMVZwYlZyRE50VzZWenY3TXdC?=
 =?utf-8?B?eVhpWVBJdXV6SnBMSk5sVkVLeldCcHBRTnlEVUNtaWVBVzJlUlFINnpqdHcz?=
 =?utf-8?B?VzZpM0dMZHJEYkJNcEN2dUhOeTJLdWVHZzFwMVNkWTFlNkRCd0NZSTB6LzFU?=
 =?utf-8?B?UnhyTVZLbEkxOGo1TGlKdXdYU3RXaEExS0RLOUlCU3M5cXNXN2ZONC9nMFMz?=
 =?utf-8?B?OHNGb1BuaGgxRUttczJOa0lDbUZIVG5uWllKMUdZdHpUMWV4c0lDRmUxRVJi?=
 =?utf-8?B?eVlKeG9QOGdBVlVlbnZNbXJLcmxhZzdJTlRwVmhiODdrTVpLY2JkOGxmOVU1?=
 =?utf-8?B?NEVCaEM1SnB0TDhkanM4N1pTcDc4L3VaMmtraWxHNWY1ZHNhRWJFRitPdG04?=
 =?utf-8?B?RnQrSDlxdEVXeDVUL3hCMFFmai9xQi9GOUFid3lidldwbnFDY2hiTHFnUVor?=
 =?utf-8?B?MjBkdW9paG9rNHV5dlJxeTM5MU95S0JkTGRHSmp2V1JmTUZ4YVpmTkxXUVFj?=
 =?utf-8?B?ZUtZTnFWNzF2bVEwTFNmRnYvdXpvR3ZhdUN1dmtwNWx1NmNTb09oY1dVSVBu?=
 =?utf-8?B?ZDNFREI4R3RMajZYZ040TnZSTTRNZkF2WmdBZWtKVDlNQ2lkdmhOdTNyM0xQ?=
 =?utf-8?B?bHVqOUhpM0lGQ204MUprUnZsK0JsMUl5by9vNE92S29DQWJINmhMYTUxQnBZ?=
 =?utf-8?B?MnFkbUlyZHQ0cjdPTlZLbk9ZZ2x1ZkhTWkhxaFhEQUZhVDRXdmlXVXUxTXpY?=
 =?utf-8?B?OTEwREdQVnR6N1VGTEdjQTlLalRMdEVDRkxiUlhiWlBQZ2ZzVVNISUNBcU5C?=
 =?utf-8?B?eHNMZWpjUGExY3hXSitxeUhTdWUxeTNYY1huN0VmWUwyK0hGUDJ3SUZvZE1R?=
 =?utf-8?B?bFc0NXRZVXA3OWs1QU9Fcnd3bnl5NGNPOXJjZ2RIbDJBd2N0Y1FKQ01LaDI1?=
 =?utf-8?B?THU0V1FSc3hySkl0WmxkcnVCOEx5SjRIWDVRWmVXd01jUVhWZUdVRzB5S2xJ?=
 =?utf-8?B?blFqbTFrRVcxL2ZGcktyZlZVV3N2M0FPM3M1dEYvUkMzdUw1bnJhT1A3S2tM?=
 =?utf-8?B?ZGJTcEJualQ4ajlURHZuTy9BU0JZQm5WUFpIUDdXdTFrYkZsL0NzbHhjMHVM?=
 =?utf-8?B?TmZudDU2eC9wOWZ3SUJ3bmN1NkYwdW1Ic1M2ZzdldGtldnkzdmdqUzR4SVoy?=
 =?utf-8?B?Yk9GVk5QVmJ6eTBYM0RFWVBhR0p6Z0pIUFZjTkh4RWoxYU9SOWFUNkhmVm53?=
 =?utf-8?B?K1grTUdrSTlUTkY1ekVad0k2OFpWY0UvU1FRTEV4bHJjQ0hnbmoxdS9nQzFC?=
 =?utf-8?B?d1ZadjFrMUJzZTZLYVYzOWF6MWRLclVaRTN4MTRVNzNISjdTQlJpZVRrYUNL?=
 =?utf-8?B?RENMNktEbnBrQW9RZXVoVWpVZld3QmxwNWttUytocjI2YW01TVA1RzBaRlFj?=
 =?utf-8?B?MWZyaWY0d2FXeVo3M3VaWjBFMmtjbnNlenU4ZWtJcVNaVTc3R0hqZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5644096f-533f-4d76-bd90-08de7a965cbe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:05:35.8476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZI1+2qkqw4itQv7uvAmMLnHYsWRsQDNO12RJbXef6wYynPtw8CFxsXwzIPzsFOUStQ5cLTq8l9yOmjOECsZXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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

Hi Sebinraj,

On 3/4/2026 5:19 PM, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>     - Primary plane:   signaled fence (simulating completed GPU work)
>     - Overlay-1 plane: signaled fence (simulating completed GPU work)
>     - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>   - Planes with signaled fences update prematurely before unsignaled
>     fences complete, breaking atomic commit semantics
>   - Fence states are mismanaged across multiple planes causing visual
>     glitches or corruption
>   - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) display handling
>    of explicit fences when provided two or more buffers at once,
>    with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>    https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>    use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Changes:
> -v6
>    - Add crc check of expected frame with
>      reference frame
> -v5
>    - Make overlay plane validation scalable with
>      overlay count.
>    - Modify commit message.
> -v4
>    - Fix build errors as per latest API name
> -v3
>    - Add crc check on display update
>    - Adding proper License entry
>    - Reduce test description
> -v2
>    - Add crc check instead of visual inspection
>    - Reduce debug logging which are not needed
>    - Add a function for initial modset
>    - Make test not specific to Intel drivers alone
>    - Sort the included libs in alphabetical order
>    - Modify set_output func as we want only one
>      output per pipe
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 373 insertions(+)
>   create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..a61ae9889
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fence states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple planes
> + * are updated in a single atomic commit with different fence states. This is
> + * critical for catching fence synchronization bugs where the driver might:
> + * 1. Prematurely display buffers with signaled fences before unsignaled fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitches
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include <errno.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence states:
> + *              2 planes with signaled fences and 1 plane with unsignaled fence.
> + *              Validates that display waits for all fences before updating any plane.
> + */
> +
> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT (NUM_PLANES - 1)
> +
> +#define FENCE_TIMEOUT_MS 2000
> +
> +#define OVERLAY_SIZE_DIVISOR 3
> +#define OVERLAY1_POS_X 100
> +#define OVERLAY1_POS_Y 100
> +#define OVERLAY2_OFFSET 100
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	igt_plane_t *primary;
> +	igt_plane_t *overlay1;
> +	igt_plane_t *overlay2;
> +	struct igt_fb primary_fb;
> +	struct igt_fb overlay1_fb;
> +	struct igt_fb overlay2_fb;
> +	drmModeModeInfo *mode;
> +	int width, height;
> +	igt_pipe_crc_t *pipe_crc;
> +} data_t;
> +
> +static void setup_output(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crtc_t *crtc;
> +	igt_output_t *output;
> +
> +	for_each_crtc_with_single_output(display, crtc, output) {
> +		int overlay_count = 0;
> +
> +		data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> +
> +		/* Count available overlays - we need at least OVERLAY_COUNT */
> +		for (int i = 0; i < OVERLAY_COUNT; i++) {
> +			if (igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY, i))
> +				overlay_count++;
> +		}
> +
> +		if (overlay_count >= OVERLAY_COUNT) {
> +			data->overlay1 = igt_crtc_get_plane_type_index(crtc,
> +									DRM_PLANE_TYPE_OVERLAY,
> +									0);
> +			data->overlay2 = igt_crtc_get_plane_type_index(crtc,
> +									DRM_PLANE_TYPE_OVERLAY,
> +									1);
This styling fix has not been done. Please recheck.
> +			data->output = output;
> +			data->pipe = crtc->pipe;
> +			data->mode = igt_output_get_mode(output);
> +			data->width = data->mode->hdisplay;
> +			data->height = data->mode->vdisplay;
> +			return;
> +		}
> +	}
> +
> +	igt_skip("Need at least %d overlay planes for this test\n", OVERLAY_COUNT);
> +}
> +
> +static void cleanup_crtc(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +
> +	igt_remove_fb(data->drm_fd, &data->primary_fb);
> +	igt_remove_fb(data->drm_fd, &data->overlay1_fb);
> +	igt_remove_fb(data->drm_fd, &data->overlay2_fb);
> +}
> +
> +static void create_fbs(data_t *data)
> +{
> +	int overlay_width = data->width / OVERLAY_SIZE_DIVISOR;
> +	int overlay_height = data->height / OVERLAY_SIZE_DIVISOR;
> +
> +	/* Primary plane - Blue background */
> +	igt_create_color_fb(data->drm_fd, data->width, data->height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, /* Blue */
> +			    &data->primary_fb);
> +
> +	/* Overlay 1 - Red square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 0.0, 0.0, /* Red */
> +			    &data->overlay1_fb);
> +
> +	/* Overlay 2 - Green square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 1.0, 0.0, /* Green */
> +			    &data->overlay2_fb);
> +}
> +
> +static void setup_initial_modeset(data_t *data)
> +{
> +	/* Initial modeset to establish baseline (no fences) */
> +	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
> +	igt_plane_set_fb(data->primary, &data->primary_fb);
> +	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay2_fb.width, OVERLAY1_POS_Y);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/**
> + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence states
> + *
> + * This test reproduces the critical scenario where multiple planes are updated
> + * in a single atomic commit with different fence states. The key validation is
> + * that the display does NOT update any plane until ALL fences are signaled.
> + *
> + * Test setup:
> + * - Primary plane: buffer with a signaled fence (already retired)
> + * - Overlay 1 plane: buffer with a signaled fence (already retired)
> + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running operation)
> + *
> + * Expected behavior:
> + * - Atomic commit succeeds immediately (non-blocking)
> + * - Display waits internally for ALL fences before updating
> + * - No plane shows its new buffer until the unsignaled fence completes
> + * - After signaling the last fence, all planes update atomically
> + *
> + * Bug detection:
> + * If the driver has a bug, it will either:
> + * 1. Show the primary and overlay1 buffers prematurely (before overlay2's fence signals)
> + * 2. Cause visual glitches from fence mismanagement
> + * 3. Fail the atomic commit
> + */
> +static void multiplane_atomic_fence_wait(data_t *data)
> +{
> +	int timelines[NUM_PLANES];
> +	int fences[NUM_PLANES];
> +	int ret;
> +	int out_fence;
> +	igt_plane_t *planes[NUM_PLANES];
> +	bool should_signal[NUM_PLANES] = { true, true, false };
> +	igt_crc_t crc_before, crc_after, crc_reference, crc_final;
> +
> +	igt_require_sw_sync();
> +
> +	setup_initial_modeset(data);
> +
> +	/* Setup arrays for loop-based processing */
> +	planes[PLANE_PRIMARY_IDX] = data->primary;
> +	planes[PLANE_OVERLAY1_IDX] = data->overlay1;
> +	planes[PLANE_OVERLAY2_IDX] = data->overlay2;
> +
> +	/* Start CRC capture to verify no premature display updates */
> +	igt_pipe_crc_start(data->pipe_crc);
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_before);
> +
> +	/*
> +	 * Capture reference CRC of expected final state (swapped overlays).
> +	 * This allows us to validate not just that the display updated,
> +	 * but that it shows the correct content without corruption.
> +	 */
> +	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay1_fb.width, OVERLAY1_POS_Y);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_reference);
> +
> +	/* Reset back to initial state (original overlay positions) */
> +	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay2_fb.width, OVERLAY1_POS_Y);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	/* Create timelines and fences for all planes */
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		/* Create timeline */
> +		timelines[i] = sw_sync_timeline_create();
> +		igt_assert(timelines[i] >= 0);
> +
> +		/* Create fence at sequence 1 */
> +		fences[i] = sw_sync_timeline_create_fence(timelines[i], 1);
> +		igt_assert(fences[i] >= 0);
> +
> +		/* Signal fence (first 2 planes) */
> +		if (should_signal[i]) {
> +			sw_sync_timeline_inc(timelines[i], 1);
> +			igt_assert_eq(sync_fence_status(fences[i]), 1);
> +		} else {
> +			/* Do not signal this fence yet, 3rd plane */
> +			igt_assert_eq(sync_fence_status(fences[i]), 0);
> +		}
> +
> +		/* Attach IN_FENCE_FD to plane */
> +		igt_plane_set_fence_fd(planes[i], fences[i]);
> +	}
> +
> +	/* Swap overlay colors to detect scanout changes via CRC */
> +	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay1_fb.width, OVERLAY1_POS_Y);
> +
> +	/* Request OUT_FENCE to track when display update completes */
> +	igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
> +
> +	/*
> +	 * The atomic commit should succeed immediately (NONBLOCK mode),
> +	 * but the display should NOT update any plane until ALL fences
> +	 * (including the unsignaled overlay2 fence) are signaled.
> +	 *
> +	 * A buggy driver might:
> +	 * - Show primary and overlay1 immediately
> +	 * - Cause visual corruption
> +	 * - Fail the commit
> +	 */
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_NONBLOCK,
> +					    NULL);
> +	igt_assert_eq(ret, 0);
> +
> +	/* Get the out fence to monitor completion */
> +	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
> +	igt_assert(out_fence >= 0);
> +
> +	/* Verify overlay2 fence (last one) is still unsignaled */
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +
> +	/* Verify out fence is also unsignaled (display hasn't updated yet) */
> +	ret = sync_fence_status(out_fence);
> +	igt_assert_f(ret != 1,
> +		     "OUT_FENCE already signaled while overlay2 fence is unsignaled - "
> +		     "driver did not wait for all IN_FENCEs!");
> +
> +	/*
> +	 * Wait briefly and verify display hasn't updated via CRC check.
> +	 * In a buggy implementation, the display might update prematurely.
> +	 */
> +	usleep(100000); /* 100ms */
> +
> +	/* Check if out fence signaled prematurely */
> +	ret = sync_fence_status(out_fence);
> +	igt_assert_f(ret != 1,
> +		     "OUT_FENCE signaled before overlay2 fence - "
> +		     "driver updated display without waiting for all fences");
> +
> +	/* CRC verify - check if display has not updated prematurely */
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_after);
> +	igt_assert_crc_equal(&crc_before, &crc_after);
> +
> +	/* Now signal the blocking fence (overlay2) */
> +	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
> +
> +	/* Wait for overlay2 fence to be signaled */
> +	ret = sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
> +
> +	/* Now wait for the display update to complete (out fence signals) */
> +	ret = sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(out_fence), 1);
> +
> +	/* Verify display has now updated (CRC should differ from baseline) */
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
> +	igt_assert_f(!igt_check_crc_equal(&crc_before, &crc_final),
> +		     "Display did not update after all fences signaled");

This check is redundant with the next one, so should be removed.

With these updates, patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thanks and Regards,
Karthik.B.S
> +
> +	/* Validate final CRC matches reference (no corruption) */
> +	igt_assert_crc_equal(&crc_final, &crc_reference);
> +
> +	igt_pipe_crc_stop(data->pipe_crc);
> +
> +	/* Cleanup */
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		close(fences[i]);
> +		close(timelines[i]);
> +		igt_plane_set_fence_fd(planes[i], -1);
> +	}
> +	close(out_fence);
> +	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
> +}
> +
> +static void reset_display_state(data_t *data)
> +{
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_plane_set_fb(data->overlay1, NULL);
> +	igt_plane_set_fb(data->overlay2, NULL);
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +int igt_main()
> +{
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +
> +		setup_output(&data);
> +		create_fbs(&data);
> +
> +		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.pipe,
> +						 IGT_PIPE_CRC_SOURCE_AUTO);
> +	}
> +
> +	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
> +		     "where 2 planes have signaled fences and 1 plane has an "
> +		     "unsignaled fence. Validates that display does not update "
> +		     "any plane until all fences are signaled");
> +	igt_subtest("multiplane-atomic-fence-wait")
> +		multiplane_atomic_fence_wait(&data);
> +
> +	igt_fixture() {
> +		reset_display_state(&data);
> +		igt_pipe_crc_free(data.pipe_crc);
> +		cleanup_crtc(&data);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f356de9b..eb7c8b13b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -36,6 +36,7 @@ test_progs = [
>   	'kms_dither',
>   	'kms_display_modes',
>   	'kms_dp_aux_dev',
> +	'kms_explicit_fence',
>   	'kms_feature_discovery',
>   	'kms_flip',
>   	'kms_flip_event_leak',
