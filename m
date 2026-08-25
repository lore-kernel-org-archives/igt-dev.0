Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981DEC5DF81
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 04:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1527410E178;
	Tue, 25 Aug 2026 04:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSi04Tyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126CE10E8B4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 04:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787633269; x=1819169269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=1HnqPV9x6S6wiaj+3cklTS7VGEHWJHl8wrIe5J3ceXs=;
 b=gSi04Tyj1TtKjq+ORcto4NXWku5TE1oE/9Tkdgq2xZyWJHn5HZu1Y7FK
 DwSjxzXFSnuD8g20nXbqzcXiOASj7yc5K4ky2kX9s1Prrk6rVvHmU7dSq
 aoJSmWf+JcppfWZxrbM+CwRAd96Tu1IZ2YgdeagxAy+h0dTlCf1dD5j0u
 MTZpxPAAklmwfh65Njq8pr1FmMUBIBYOFx/nqqByMdYk4Lxu54/5t8j5q
 5Q/cNva+rvKb8TElevPfBZoLkrSEOQcBZ2/na3CB1yLB14HKeUaPf/ehj
 1DvdyyoIeS8ifXmSsPZexZ7L8AbozXyR/SvLsOTLmn2USeM4Ip9oUI6Qm w==;
X-CSE-ConnectionGUID: 7wHW46vxRL+YEnGBmcLpEQ==
X-CSE-MsgGUID: RbzX5ywRTwaVzPg+XJYK7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91770470"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208,217";a="91770470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 21:47:49 -0700
X-CSE-ConnectionGUID: imC4TAieRridB60mgA0L8w==
X-CSE-MsgGUID: dXIj7cmkQ66YkIHw40/sWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
 d="scan'208,217";a="269130319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 21:47:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 21:47:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 21:47:47 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 21:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIg/2VTHz+NC2QytPkMZmR040U2MHlbHOu8CD+tcqt3Y5NYEg4p0cdJf65tNZ1f3yjLcoJrx6OBv0PJTnwWb6bLHmcO21ntiWCMHxvNt4wKoDFyd4kkd+zq5WnjAFPFqc5yBx66IydFSCb+dbrXhi0m54qgtl//RY/hkGzLwVO7MmyeVEubDQDKQGWgcLyRwbc96uu0hM6xr0gOz0dGJq6wN00fB9x2YaGdq9XtI6SFUgihg7qwEXNp5Aoc7rV2Fg1+XROQfG/V3WSGn3DSDIQmjWkU0LDm04bnbMKJTG/q8Q8i+Dt3J1StAMCA8hFx1/PZX4T0+IQw6Uq9eiqemdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4Jm8Qn8OM0XeTS6A4VBv+79jVziv0NjJ722jmgi9cQ=;
 b=IMsRmVyIcS4pKGyAdTTv8+zGbyn7xBRjKxe/TNAwVlADb9Yuje6hjWfq+j9GxbmtkH0sNDT9Ou6hroOHoR01LncmZwMPIeB+9EKpkO17PaEQy6CzmV2+zsFMLKch2HgKZO/ixGpBUDWtCRQ9cctuHR/96fyGE5lITN5RPbZaFVRx1uNELBQI1dUSfFYbsLZ4AdcwI7vxlGW0JTfv/g3X56Ujxy3DFiFI9Q4Ndm/ByMsDHujr7VFcL+HwKuLWSvRjblZHqzzC9j032b+yb0u+0F4V1voDTcC/4BO/L1bZ77qwmeGottkJMNiApRA/F09rzRXUY4hMSB2xQa+wF3x1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 04:47:45 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 04:47:44 +0000
Content-Type: multipart/alternative;
 boundary="------------CBDObkmWudJRHQs1Fg2AujMj"
Message-ID: <58fe784a-124c-4c3a-980f-13d2f9961147@intel.com>
Date: Tue, 25 Aug 2026 10:17:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
 <20260812130738.1242659-2-ramanaidu.naladala@intel.com>
 <e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com>
X-ClientProxiedBy: MA5P287CA0310.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::9) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|PH0PR11MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca91e53-7685-4144-a128-08df0264009e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|3023799007|6133799003|8096899003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Ms6LwuugbQrMflVs5edh4cOKam2/fkiGVCciH0tte7j6taLN76x6VrDPhQb1k4BODi6M+AliLrwFZ8fGJkTgRGfMd4CGDvIbmSzijMSM2PTYKFXF3gh1AUm68oJJHch78u/IeidCIUbhC+XVIIKsvCntuTpc3pQIZIXCjMKL9YCY3WQ0ZMytBCNFRCq3EqZhz4W16TIl31kE/igUcqI/sdlvbsa/AVAKaK+gpfjPQEUMrZN6zPGBdDtdnVPUBCa/dYTlw3BvsDQeOG9yUvkcxUgIf61KShH/DEvcfVuzFv2OgERJ/aVaP/sHgRS5YhkJMEg+y4LZsaFdv5LmJVXPfVPEC18YFi/tq4QLl9T6p7wFDcvZ40QN+n8zDtMg5aUUTW6EhwgtnYIaW+4txCw0CzELX3FiRP+21H9DYkqNPZZ0s0PKzCNaJWT4VdF8XIKJ93HCd4Arpz+yox9loo3g3+r0PpbB2uJg44TzBh6UkmMbak3oi3lsBGtgsvzN53e75rOgEG04IoQfsZigpwYi9n/470/T8ZpiWCgD7YymUDS4WRw1t6raD8NnPUQCL4wCcdEXiRR3i9NHRlRuRFoVKH+45Bk/GTJ+Jr+DjfiwG6tEp6jZxGerZIFzPeJ9DxHYEexo3znzAlQMYnK5YPvb3C6u8gvVDbQmh/PcQVLEEx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(8096899003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RURidlJGb2NnTjgzN0tUaHVTV1BFWXZPcXRhUm1vSnlZb0htcEkzb2R4TzJT?=
 =?utf-8?B?Y1NPdldZNGxmaU1KbnVzbkdMWEt3UUVORUlXOTIyY0sxbENleTlQd0NRd1dC?=
 =?utf-8?B?eTljSTNXVHIzWWZua2dPK1JaT0ZHVmdkVml1V3BET1pYT0lMVFJ1UTlnWVVQ?=
 =?utf-8?B?bWVMaWlpcTl4SEVCa1NSRmNSY2U0Q1FIUVdyMEtXK3J4SEM3ZUdLTVFPSXZC?=
 =?utf-8?B?azQzajdSWFlFNWF3dEhFK2orVGJGeUs2cWNPVVE3SFA1ODY3RTQ5VVYwRWhC?=
 =?utf-8?B?Y0FZcHJXYmNSaWpyc0s0WW8yUVRJbEdZK2poY0tkcHB3N1FDSU1qK2EyeTY3?=
 =?utf-8?B?dy9LaWVhREUvVXE3YU9OcW0vdzZTRlc0L0lqUGxhenp4d2pWaWpvSnFLK2Yz?=
 =?utf-8?B?aFkvUXJJb2dMWDFManJURG5YN0ZIanZwN29xZWFiQWJudUFTNnh0OGsxcUMy?=
 =?utf-8?B?U3FPU0M4K3VwOE83SHUyRjl5NVJCUEticGE1ZE1yNTRENFNyc0pwWG0yY3pm?=
 =?utf-8?B?eVArcHVIRm9td1VqZDE5UFBnRGJPYllZV1BvOTc0c1N3RFhiRHdGbWtIcFl1?=
 =?utf-8?B?ME9FV0lzbURHMmVPc1JhWWZRTnREWnkwZHpWaCttam80RzZEVXJOa1U2WHNj?=
 =?utf-8?B?M2xTdk56T094S3krY2xLRTRyUzlLYlU4VDFvNVdZZkFWeFBKZlZBTTlkY3Vv?=
 =?utf-8?B?cmJOQ1BhK2l0L1hhNldxaExHNmtqL3MrQzVkaTB5VlZJOEljczFYN2NmMnEz?=
 =?utf-8?B?ZGh4aFFuTzVtY2dVOXVuY0JrYWxyY0RzUkNqcjRoMjNzVGlZV3ZjWmZKY3JM?=
 =?utf-8?B?WmpMRDRxS1JXR3BrQ0l0a014RUl4ZHN4alB1OTBRRVhWTnl1U3hLTkpxQytx?=
 =?utf-8?B?QWJwMTdGbFhzN3pDd1Q0MzQ4elJnVFRYcTA0cVhsaGpFNmh4MSs2OURRcmFv?=
 =?utf-8?B?TWdSN01PUHJGazc0cG1RQ24vanltZW1oeTRUY2dsb2h4YnFYR0JSNjVLZVpX?=
 =?utf-8?B?NnpPS1k1M1k4OEROVDdZY2FWQzA5YjZhLzlMMmgyNW9vSElsWFAwblh5bG50?=
 =?utf-8?B?UldwUWdPZTRyZ04rOGg4QWM0Sm8vRjBENHIzNXFZK2laVmpweFhkUFBkdkc2?=
 =?utf-8?B?d3pxQm5PRURwdm1TeFc4ZGFIVjJYNXcrVFNCNVRhK1pEbE81ZFdGWmF2Y1hG?=
 =?utf-8?B?RkJwNVFGdDJTY0RrdG5qZEJvTEVmdEFRZjdyVEdmWU1tZno0K0FjRXRQZjZv?=
 =?utf-8?B?a0RxWkdLYWFUMnlrditSNkhsQnAraFhsN2FqZkVadmxZc21HQjZhSWJ3ZFBn?=
 =?utf-8?B?bWp2UEYrQ0RYWVlPZTYzOTdDWjIvWnFwYWYwb3JBaXc5NXlzVHgwS0N6M1Vp?=
 =?utf-8?B?dUVEWWpIMk9MMUNRak5GNSt4dEdUQ3RQay9WSytBNjRRNHR5dHBTZnowT3FU?=
 =?utf-8?B?SjREdlJpRzF6Zk1aM2p5YThyUDducE1ONmNKaFhUdnRGQzdYbml3akZPQmtH?=
 =?utf-8?B?WXlrSU9wTUFHR3NTaGFBNGhubmg2RnAwaVFPR0IrMVRieXc4ekFJRlUrTUxS?=
 =?utf-8?B?dHU3NXBIQkpPenJOaGhuQURiWGtUUEZyYlVaOG00M2dEcGIvb0FUNUtWZDFG?=
 =?utf-8?B?dmx5TS9yYlJSbU1YVk96T0VIaThydHNzdndyU0tEQ0hqVVpqNHN5ajBmKzJt?=
 =?utf-8?B?bzZqS0R2RzdzVUFGQXFzNENsL1Vkcjl2b1c3YllsZ0g1YzlEaDJnTGZjUEg0?=
 =?utf-8?B?d3RXNDNqK3lpUWM1eW1WYUUxak8vMDdBYXY1V1V0QTNwMXJQYlpHdkd0R0lM?=
 =?utf-8?B?SkZzZnBDL2tLQ2MrTVcwZ0dlZ29nTkNWZENjdTl2ZTNqVXRqeFdwK0pHTzJB?=
 =?utf-8?B?YXVNazVBU0szK2pCSDRwOU1jUHBRL0tPRTF3TVBqZU1FWVNOMGZjUzFNd2hS?=
 =?utf-8?B?V0NCbmhGSkQ5ZTROZStCL2V2ZDNOUms5eS90NWRUTkdSU3pHRkh3K09oK09P?=
 =?utf-8?B?MGloVVErZ1ROdlBBOERTbHdoRGt2cUl5L3BocFN1ZmFoQkdkQnR1bThNTldH?=
 =?utf-8?B?U2E4WXhDTGlYY0hoVHhaeHlhbmNWK0VnRldCMUQyNHp0cTR0UTloOWZzVEFh?=
 =?utf-8?B?WFBYd3NFdVArZExhT0xRWVdrb3E5TDR2N0RGc0pwM3RMalJRUWpKN2JhZVJE?=
 =?utf-8?B?UWw5NXp3ZnJzYXlNNzZ6MW5tRXZHUDNYZFBzZUp1azRXZ0hPbWhSZ3lLSTBn?=
 =?utf-8?B?clhuMkV2Ykl4K2N4ZU9XOGRha1hOazFUa0VYbm9ZWHJXMHNpVGhXRHNYdmdK?=
 =?utf-8?B?MnpIMUMwRkVaa3VoRENuYndoa0hjcjVqZndUcHFTMVRFRzR2U0ZsK3pPcFhL?=
 =?utf-8?Q?Mr2mN9xK42GFi5lA=3D?=
X-Exchange-RoutingPolicyChecked: IhsHrBG8ktM4RUG21KDW4GvT/g7xIHPJxAe886l0B2Fs+Q7+F/FcgWvy/PoKiav7vGkLj8+vEta/DmJGeFklM+Txxuz7LK7u0hs2C0TxxQBeQQHQiAfnFUfmiwjFPqH/WeIiYt/P8+Ji7ODqG7MMgkIK59g0cLfEwciAhEejlJkuJNFHrPNicJH6/2dkZI56RYtfe/JK1/pbhmYViZzcL4EWxuGYLK2M1f/A9mNXDBRv0gglahynJ0EeYd9+gy3U1sjoUN51l+xV/R72EE19IRtPPnTdHyrONz2p1JwjjiYDn6i1kpZMfFx70DLN4/cNJJn3yDpZmV30zscTdDaksw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca91e53-7685-4144-a128-08df0264009e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 04:47:44.3300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wB5mEeBfENxp23xrNt1BctTd0qK+d2+ViJ3q9+kUjs6LViAA8ox9kat8uAyGhCLMCqF8UOFKhO6K1Ux8QmHRsLiJ1d8UXCY+ecpbTOP1fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
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

--------------CBDObkmWudJRHQs1Fg2AujMj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chaitanya,

On 8/20/2026 4:38 PM, Borah, Chaitanya Kumar wrote:
>
> Hello Rama,
>
> On 8/12/2026 6:37 PM, Naladala Ramanaidu wrote:
>> Introduce a new helper library for Variable Refresh Rate (VRR).
>>
>> Add helpers to validate targeted refresh-rate testing.
>>
>> v2: Modify debugfs with helpers.
>> v3: Add helper to check cmrr support.
>>      Address review comments. (Mitul)
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_vrr.c   | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_vrr.h   |  44 ++++++++++++++
>>   lib/meson.build |   1 +
>>   3 files changed, 199 insertions(+)
>>   create mode 100644 lib/igt_vrr.c
>>   create mode 100644 lib/igt_vrr.h
>>
>> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
>> new file mode 100644
>> index 000000000..704eaa3a3
>> --- /dev/null
>> +++ b/lib/igt_vrr.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <inttypes.h>
>> +
>> +#include "igt_vrr.h"
>> +#include "igt_sysfs.h"
>> +
>> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
>> +    24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 
>> 200, 240,
>> +};
>> +
>
> Please cite the source/rationale for these RRs
Sure. I will address this in next revision.
>
>> +const size_t igt_vrr_standard_video_timing_fps_count =
>> +    ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
>> +
>> +/**
>> + * igt_target_rr_debugfs_write:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + * @vrefresh: Target refresh rate to program.
>> + * @numerator: Numerator component of the target refresh rate fraction.
>> + * @denominator: Denominator component of the target refresh rate 
>> fraction.
>> + *
>> + * Write the target refresh rate configuration to the per-CRTC
>> + * VRR debugfs interface.
>> + *
>> + * Returns: None.
>> + */
>> +void
>> +igt_target_rr_debugfs_write(int fd, int crtc_index,
>> +                uint32_t vrefresh,
>> +                uint32_t numerator,
>> +                uint32_t denominator)
>
> You can simplify the arguments to rr_numerator and rr_denominator. 
> Skip vrefresh.
Sure. I will address this in next revision.
>
>> +{
>> +    char buf[32];
>> +    int ret, dir;
>> +    uint64_t val;
>> +
>> +    val = vrefresh * numerator;
>> +
>> +    snprintf(buf, sizeof(buf), "%" PRIu64 "/%u",
>> +         val, denominator);
>> +
>> +    dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +    igt_require_fd(dir);
>> +
>> +    ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate",
>> +                  buf, sizeof(buf) - 1);
>
> Better to use strlen so that we don't send out any garbage to kernel.
Sure. i will fix this in next revision.
>
>
> Also what is the policy regarding using intel specific debugfs in lib?
> Should there be a wrapper to abstract it?
I will update the debugfs operations to be Intel-specific.
>
>> +     close(dir);
>> +     igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
>> +}
>> +
>> +/**
>> + * igt_cmrr_debugfs_read:
>
> needs update.
sure.
>
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + *
>> + * Read the configured refresh rate from the per-CRTC VRR debugfs node.
>> + *
>> + * Return: None.
>> + */
>> +void
>> +igt_target_rr_debugfs_read(int fd, int crtc_index)
>> +{
>> +    char buf[32];
>> +    int ret, dir;
>> +
>> +    dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +    igt_require_fd(dir);
>> +
>> +    ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
>> +                 buf,  sizeof(buf) - 1);
>> +    close(dir);
>> +    igt_assert_f(ret >= 0,
>> +             "Failed to read intel_vrr_target_refresh_rate.\n");
>> +
>> +    buf[ret] = '\0';
>> +
>> +    igt_info("vrr target RR: %s\n", buf);
>> +}
>> +
>> +/**
>> + * igt_vrr_mode_line_refresh_hz:
>> + * @mode: DRM display mode used for the calculation
>> + *
>> + * Compute the refresh rate directly from the mode timing parameters.
>> + *
>> + * Returns: Refresh rate in Hz as a floating-point value.
>> + */
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
>> +{
>> +    return (double)mode->clock * 1000.0 / ((double)mode->htotal * 
>> (double)mode->vtotal);
>> +}
>> +
>> +/**
>> + * igt_vrr_get_mode_with_video_timing:
>> + * @output: Display output containing connector mode list
>> + * @fps: Requested integer refresh rate in Hz
>> + * @matched_mode: Returned mode that matches @fps
>> + *
>> + * Find and return a connector mode that matches the requested
>> + * video timing refresh rate in Hz.
>> + *
>> + * Returns: true when a mode is found, false otherwise
>> + */
>> +
>> +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
>> +                    uint32_t fps,
>> +                    drmModeModeInfo *matched_mode)
>
> This helper seems to be only relevant to CMRR for now. So better to 
> move it to the test file? Do you see it being used elsewhere?

Currently CMRR is the only user, but the helper itself is generic and 
not CMRR-specific. I expect it to be useful for other VRR/video timing 
tests that need to look up a mode by FPS,

so I'd prefer to keep it in the library. If we want to keep the API 
surface minimal, I can move it to the test for now and promote it later 
when another user appears.

>
>> +{
>> +    drmModeConnectorPtr connector;
>> +
>> +    connector = output->config.connector;
>> +    if (!connector)
>> +        return false;
>> +
>> +    for (int i = 0; i < connector->count_modes; i++) {
>> +        if (connector->modes[i].vrefresh == fps) {
>> +            *matched_mode = connector->modes[i];
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +/**
>> + * cmrr_supported:
>> + * @fd: DRM device file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + *
>> + * Checks whether the intel_vrr_target_refresh_rate debugfs node is 
>> present
>> + * for the specified CRTC, indicating CMRR support.
>> + *
>> + * Returns: true if CMRR is supported, false otherwise.
>> + */
>> +bool cmrr_supported(int fd, int crtc_index)
>
> You can rename it to target_refresh_rate_supported.
sure. i will fix this in next revision.
>
>> +{
>> +    int dir;
>> +
>> +    dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +
>> +    if (dir < 0)
>> +        return false;
>> +
>> +    if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 
>> 0) {
>> +        close(dir);
>> +        return true;
>> +    }
>> +
>> +    close(dir);
>> +    return false;
>> +}
>> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
>> new file mode 100644
>> index 000000000..a317d4684
>> --- /dev/null
>> +++ b/lib/igt_vrr.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_VRR_H
>> +#define IGT_VRR_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include "igt.h"
>> +#include "igt_kms.h"
>> +
>> +#define CMRR_NUMERATOR 1000ULL
>> +#define CMRR_DENOMINATOR 1000ULL
>> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
>> +#define TARGET_RR_SAMP_COUNT 100
>> +
>> +enum {
>> +    CMRR_VIDEO_MODE,
>> +    CMRR_NON_VIDEO_MODE,
>> +    CMRR_DISABLE,
>> +};
>> +
>
> move these macros and enums out to the test file.
sure. i will fix this in next revision.
>
> ==
> Chaitanya
>
>> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
>> +extern const size_t igt_vrr_standard_video_timing_fps_count;
>> +
>> +void
>> +igt_target_rr_debugfs_write(int fd, int crtc_index,
>> +                uint32_t vrefresh,
>> +                uint32_t numerator,
>> +                uint32_t denominator);
>> +void
>> +igt_target_rr_debugfs_read(int fd, int crtc_index);
>> +
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
>> +
>> +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
>> +                    uint32_t fps,
>> +                    drmModeModeInfo *matched_mode);
>> +
>> +bool cmrr_supported(int fd, int crtc_index);
>> +
>> +#endif
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 3001b473e..8675bd4a6 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -22,6 +22,7 @@ lib_sources = [
>>       'igt_configfs.c',
>>       'igt_facts.c',
>>       'igt_crc.c',
>> +        'igt_vrr.c',
>>       'igt_debugfs.c',
>>       'igt_device.c',
>>       'igt_device_scan.c',
>
--------------CBDObkmWudJRHQs1Fg2AujMj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Chaitanya,</p>
    <div class="moz-cite-prefix">On 8/20/2026 4:38 PM, Borah, Chaitanya
      Kumar wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com">
      <br>
      Hello Rama,
      <br>
      <br>
      On 8/12/2026 6:37 PM, Naladala Ramanaidu wrote:
      <br>
      <blockquote type="cite">Introduce a new helper library for
        Variable Refresh Rate (VRR).
        <br>
        <br>
        Add helpers to validate targeted refresh-rate testing.
        <br>
        <br>
        v2: Modify debugfs with helpers.
        <br>
        v3: Add helper to check cmrr support.
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Address review comments. (Mitul)
        <br>
        <br>
        Signed-off-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; lib/igt_vrr.c&nbsp;&nbsp; | 154
        ++++++++++++++++++++++++++++++++++++++++++++++++
        <br>
        &nbsp; lib/igt_vrr.h&nbsp;&nbsp; |&nbsp; 44 ++++++++++++++
        <br>
        &nbsp; lib/meson.build |&nbsp;&nbsp; 1 +
        <br>
        &nbsp; 3 files changed, 199 insertions(+)
        <br>
        &nbsp; create mode 100644 lib/igt_vrr.c
        <br>
        &nbsp; create mode 100644 lib/igt_vrr.h
        <br>
        <br>
        diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
        <br>
        new file mode 100644
        <br>
        index 000000000..704eaa3a3
        <br>
        --- /dev/null
        <br>
        +++ b/lib/igt_vrr.c
        <br>
        @@ -0,0 +1,154 @@
        <br>
        +// SPDX-License-Identifier: MIT
        <br>
        +/*
        <br>
        + * Copyright © 2026 Intel Corporation
        <br>
        + */
        <br>
        +
        <br>
        +#include &lt;inttypes.h&gt;
        <br>
        +
        <br>
        +#include &quot;igt_vrr.h&quot;
        <br>
        +#include &quot;igt_sysfs.h&quot;
        <br>
        +
        <br>
        +const uint32_t igt_vrr_standard_video_timing_fps[] = {
        <br>
        +&nbsp;&nbsp;&nbsp; 24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165,
        180, 200, 240,
        <br>
        +};
        <br>
        +
        <br>
      </blockquote>
      <br>
      Please cite the source/rationale for these RRs
      <br>
    </blockquote>
    Sure. I will address this in next revision.
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com"><br>
      <blockquote type="cite">+const size_t
        igt_vrr_standard_video_timing_fps_count =
        <br>
        +&nbsp;&nbsp;&nbsp; ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
        <br>
        +
        <br>
        +/**
        <br>
        + * igt_target_rr_debugfs_write:
        <br>
        + * @fd: DRM file descriptor.
        <br>
        + * @crtc_index: Index of the CRTC.
        <br>
        + * @vrefresh: Target refresh rate to program.
        <br>
        + * @numerator: Numerator component of the target refresh rate
        fraction.
        <br>
        + * @denominator: Denominator component of the target refresh
        rate fraction.
        <br>
        + *
        <br>
        + * Write the target refresh rate configuration to the per-CRTC
        <br>
        + * VRR debugfs interface.
        <br>
        + *
        <br>
        + * Returns: None.
        <br>
        + */
        <br>
        +void
        <br>
        +igt_target_rr_debugfs_write(int fd, int crtc_index,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t vrefresh,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t numerator,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t denominator)
        <br>
      </blockquote>
      <br>
      You can simplify the arguments to rr_numerator and rr_denominator.
      Skip vrefresh.
      <br>
    </blockquote>
    Sure. I will address this in next revision.
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com"><br>
      <blockquote type="cite">+{
        <br>
        +&nbsp;&nbsp;&nbsp; char buf[32];
        <br>
        +&nbsp;&nbsp;&nbsp; int ret, dir;
        <br>
        +&nbsp;&nbsp;&nbsp; uint64_t val;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; val = vrefresh * numerator;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; snprintf(buf, sizeof(buf), &quot;%&quot; PRIu64 &quot;/%u&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val, denominator);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; dir = igt_debugfs_crtc_dir(fd, crtc_index);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require_fd(dir);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = igt_sysfs_write(dir, &quot;intel_vrr_target_refresh_rate&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf, sizeof(buf) - 1);
        <br>
      </blockquote>
      <br>
      Better to use strlen so that we don't send out any garbage to
      kernel.</blockquote>
    Sure. i will fix this in next revision.
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com">&nbsp;<br>
      <br>
      Also what is the policy regarding using intel specific debugfs in
      lib?
      <br>
      Should there be a wrapper to abstract it?
      <br>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
</style>I will update the debugfs operations to be Intel-specific.
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com"><br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp; close(dir);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(ret == (sizeof(buf) - 1), &quot;debugfs_write
        failed&quot;);
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
        + * igt_cmrr_debugfs_read:
        <br>
      </blockquote>
      <br>
      needs update.
      <br>
    </blockquote>
    sure.
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com"><br>
      <blockquote type="cite">+ * @fd: DRM file descriptor.
        <br>
        + * @crtc_index: Index of the CRTC.
        <br>
        + *
        <br>
        + * Read the configured refresh rate from the per-CRTC VRR
        debugfs node.
        <br>
        + *
        <br>
        + * Return: None.
        <br>
        + */
        <br>
        +void
        <br>
        +igt_target_rr_debugfs_read(int fd, int crtc_index)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; char buf[32];
        <br>
        +&nbsp;&nbsp;&nbsp; int ret, dir;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; dir = igt_debugfs_crtc_dir(fd, crtc_index);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require_fd(dir);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = igt_sysfs_read(dir, &quot;intel_vrr_target_refresh_rate&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf,&nbsp; sizeof(buf) - 1);
        <br>
        +&nbsp;&nbsp;&nbsp; close(dir);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_f(ret &gt;= 0,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Failed to read
        intel_vrr_target_refresh_rate.\n&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; buf[ret] = '\0';
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;vrr target RR: %s\n&quot;, buf);
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
        + * igt_vrr_mode_line_refresh_hz:
        <br>
        + * @mode: DRM display mode used for the calculation
        <br>
        + *
        <br>
        + * Compute the refresh rate directly from the mode timing
        parameters.
        <br>
        + *
        <br>
        + * Returns: Refresh rate in Hz as a floating-point value.
        <br>
        + */
        <br>
        +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo
        *mode)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; return (double)mode-&gt;clock * 1000.0 /
        ((double)mode-&gt;htotal * (double)mode-&gt;vtotal);
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
        + * igt_vrr_get_mode_with_video_timing:
        <br>
        + * @output: Display output containing connector mode list
        <br>
        + * @fps: Requested integer refresh rate in Hz
        <br>
        + * @matched_mode: Returned mode that matches @fps
        <br>
        + *
        <br>
        + * Find and return a connector mode that matches the requested
        <br>
        + * video timing refresh rate in Hz.
        <br>
        + *
        <br>
        + * Returns: true when a mode is found, false otherwise
        <br>
        + */
        <br>
        +
        <br>
        +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t fps,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *matched_mode)
        <br>
      </blockquote>
      <br>
      This helper seems to be only relevant to CMRR for now. So better
      to move it to the test file? Do you see it being used elsewhere?
      <br>
    </blockquote>
    <p>Currently CMRR is the only user, but the helper itself is generic
      and not CMRR-specific. I expect it to be useful for other
      VRR/video timing tests that need to look up a mode by FPS,</p>
    <p>so I'd prefer to keep it in the library. If we want to keep the
      API surface minimal, I can move it to the test for now and promote
      it later when another user appears.</p>
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com"><br>
      <blockquote type="cite">+{
        <br>
        +&nbsp;&nbsp;&nbsp; drmModeConnectorPtr connector;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; connector = output-&gt;config.connector;
        <br>
        +&nbsp;&nbsp;&nbsp; if (!connector)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; connector-&gt;count_modes; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (connector-&gt;modes[i].vrefresh == fps) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *matched_mode = connector-&gt;modes[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; return false;
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
        + * cmrr_supported:
        <br>
        + * @fd: DRM device file descriptor.
        <br>
        + * @crtc_index: Index of the CRTC.
        <br>
        + *
        <br>
        + * Checks whether the intel_vrr_target_refresh_rate debugfs
        node is present
        <br>
        + * for the specified CRTC, indicating CMRR support.
        <br>
        + *
        <br>
        + * Returns: true if CMRR is supported, false otherwise.
        <br>
        + */
        <br>
        +bool cmrr_supported(int fd, int crtc_index)
        <br>
      </blockquote>
      <br>
      You can rename it to target_refresh_rate_supported.
      <br>
    </blockquote>
    sure. i will fix this in next revision.
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com"><br>
      <blockquote type="cite">+{
        <br>
        +&nbsp;&nbsp;&nbsp; int dir;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; dir = igt_debugfs_crtc_dir(fd, crtc_index);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (dir &lt; 0)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (faccessat(dir, &quot;intel_vrr_target_refresh_rate&quot;, F_OK,
        0) == 0) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dir);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; close(dir);
        <br>
        +&nbsp;&nbsp;&nbsp; return false;
        <br>
        +}
        <br>
        diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
        <br>
        new file mode 100644
        <br>
        index 000000000..a317d4684
        <br>
        --- /dev/null
        <br>
        +++ b/lib/igt_vrr.h
        <br>
        @@ -0,0 +1,44 @@
        <br>
        +/* SPDX-License-Identifier: MIT */
        <br>
        +/*
        <br>
        + * Copyright © 2026 Intel Corporation
        <br>
        + */
        <br>
        +
        <br>
        +#ifndef IGT_VRR_H
        <br>
        +#define IGT_VRR_H
        <br>
        +
        <br>
        +#include &lt;stdbool.h&gt;
        <br>
        +#include &lt;stdint.h&gt;
        <br>
        +#include &quot;igt.h&quot;
        <br>
        +#include &quot;igt_kms.h&quot;
        <br>
        +
        <br>
        +#define CMRR_NUMERATOR 1000ULL
        <br>
        +#define CMRR_DENOMINATOR 1000ULL
        <br>
        +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
        <br>
        +#define TARGET_RR_SAMP_COUNT 100
        <br>
        +
        <br>
        +enum {
        <br>
        +&nbsp;&nbsp;&nbsp; CMRR_VIDEO_MODE,
        <br>
        +&nbsp;&nbsp;&nbsp; CMRR_NON_VIDEO_MODE,
        <br>
        +&nbsp;&nbsp;&nbsp; CMRR_DISABLE,
        <br>
        +};
        <br>
        +
        <br>
      </blockquote>
      <br>
      move these macros and enums out to the test file.
      <br>
    </blockquote>
    sure. i will fix this in next revision.
    <blockquote type="cite" cite="mid:e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com"><br>
      ==
      <br>
      Chaitanya
      <br>
      <br>
      <blockquote type="cite">+extern const uint32_t
        igt_vrr_standard_video_timing_fps[];
        <br>
        +extern const size_t igt_vrr_standard_video_timing_fps_count;
        <br>
        +
        <br>
        +void
        <br>
        +igt_target_rr_debugfs_write(int fd, int crtc_index,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t vrefresh,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t numerator,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t denominator);
        <br>
        +void
        <br>
        +igt_target_rr_debugfs_read(int fd, int crtc_index);
        <br>
        +
        <br>
        +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo
        *mode);
        <br>
        +
        <br>
        +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t fps,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *matched_mode);
        <br>
        +
        <br>
        +bool cmrr_supported(int fd, int crtc_index);
        <br>
        +
        <br>
        +#endif
        <br>
        diff --git a/lib/meson.build b/lib/meson.build
        <br>
        index 3001b473e..8675bd4a6 100644
        <br>
        --- a/lib/meson.build
        <br>
        +++ b/lib/meson.build
        <br>
        @@ -22,6 +22,7 @@ lib_sources = [
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'igt_configfs.c',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'igt_facts.c',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'igt_crc.c',
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'igt_vrr.c',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'igt_debugfs.c',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'igt_device.c',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'igt_device_scan.c',
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------CBDObkmWudJRHQs1Fg2AujMj--
