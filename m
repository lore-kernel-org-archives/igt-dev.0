Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28993C44515
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 19:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BC510E3B6;
	Thu, 16 Jul 2026 19:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R444oqpi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646CC10E3B6
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 19:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784228931; x=1815764931;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=77cyuJqDthq6BNUk3ufTaBrIMKMMmqK2MdUWBURgtxE=;
 b=R444oqpiRXBg2excxKWevSa2aob7R9/2LJg8b0Wy8z1iwTQYTv7MAOsA
 m3dKdpLqhnMaF+fazCdVbmwz6H4pxmtCXrKXsW8Y4+Sq9fHwzIyeegcgg
 pBeJzSxbL/Gkuy09Qy1UzkhLBEyh7wDw1jCjAOwpAfBTkYfzG655wompI
 LF9/UwSH+m2Nv8zpPNaLgastizfLcvfvujuV6LAyHOjNntuDv2PeEtA+i
 tkzoF5gctRgVQQcR+ZqrZL/Sp7B8vvy823pnuIa0WE1uq9tYlwA+m46Dg
 3b0PCAzpJ+c33YtjNL2nEbcG/rvu2TRs2D/euj2kkE8NmblaW6RpyHJnx w==;
X-CSE-ConnectionGUID: TZnZw9UBSsuHL8Pik//WuA==
X-CSE-MsgGUID: PQsgmATvTU+Tsc+1JlGn5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84927143"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="84927143"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 12:08:51 -0700
X-CSE-ConnectionGUID: E7GFaOM/SYO3uqpQBOMG1w==
X-CSE-MsgGUID: uzhKeiTrRN+mXh4pZZE7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="256642823"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 12:08:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 12:08:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 12:08:49 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 12:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asIXn4BU1sp0lSW71JyVICc861njTqND2Wrm7Q0L2zUQegxWGMt5k24Pb9fDFd23eyYqhFB64WObftQRVo9mLe4EyBOfWrG25KPmnkVih+NAayiIKIrlg0KsXpM6OBrKFDCIaXZWgYMByL+NdgIQg0EXucF/H+hVpE+gkDkgy1iXUdO6/gXgIg58qJSxAzVK5+w+VJN8gteLPngJbCc2vtf1MHE1DzWsiZ/ePZ2rkXaroCIu9kKzBwUniOv/jC2i2/IOWizD7I8aCcVO0uj04B7BArtc8Pp2kwNSGbkqWS6iWvFzEte1u98WmyzpKhnblhCQUBjsWpI+6oxwe8IEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCbpSlZB/yz6oLFZzDr4OeK2Y++3oGnlHp6fpnksvp0=;
 b=q6Uy+jf2eIB7At1SAs0Jm2RJr3T7Xgk1eJuhAui4ul9gvArv0CI0JFl7G0Ad/SFYf1TQzb0Np44nqzL4Imfxb56LnbONipis1tJkBMw0kHYFzlWkI+bppQcoRb3CoK1HtjuHMennsqSKpDJAYw2IZml+BvN2FW/mkRHHdhBvXuTcrSz0wcEGA4lDZJTb0YF5cjPxUK+Qe8ohlLSPvbb10idgpeVI3CBGICe6kxF1gOe35nRPzqRpsjgy0uaCZAT8dzMCommRX443Ln8nUPirGTzPqAV7elr6cRA5sJ6Tsu8VXUY554Bc6Va3Suq2aTYnZTpISVMSgBKzxZmJS4eMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 19:08:47 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 19:08:47 +0000
Message-ID: <92b4f328-8ccb-4970-9a47-a5299c21087e@intel.com>
Date: Thu, 16 Jul 2026 12:08:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2] tests/intel/xe_exec_multi_queue: Check PXP is
 rejected on multi-queue
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <a5d7b699ffcbd7b590f824f67a7ca162eb59bf37.1783969453.git.jagmeet.randhawa@intel.com>
 <alkndK_XLh5TKlem@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <alkndK_XLh5TKlem@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SA0PR11MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ba1e51-3d52-4f6d-3806-08dee36da9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: Uij9N8LQJgYQZMOxafPU1TmwzHUDhI79rupkd1fd85zFC/QxZD/QglRqAY+pOZq2hj06gD1CcLpb813LIfpGOzE6xgIcp+EmvGBDV7v0RerWaoElAJKbQN5MMUxosHjLyjY1CP8NW9L418kFF/uz1ft8HoMoYUlwSz15igM6HQeTxpsJbc3yPcIEr+ERaQf86ZH4oyInkrR2ac4ZqlH3pJan/gVQkEi05aYnXpn5ssVbLdRKQd4YnbqxHCed9TY4XD0xoKZNuzoqQcV/NLNv2TjlMxA2qRjxyfh7aYlW0cmkAkzJ7TgwVwkyL9dJr5dLDgvN+3STfgl+Hv0jXrvdZP1lu2PJqhoan/lMeEEPpwIIs4fO/G9V9rdbvr3LOfZLeRVd8G2KgJhwd7OGu0/idYgJM8jaVgNOMAfkI046qLX0kCM760k/xNIRkCI4d9Mv0olu82/Z9ediEHi4IX0xllmCDjWQxH9VUO8lpNZMeAMZrHKPo95PM2Ay/Pftnpl+DDxHZ2px5HPdOCv94MooyaeO88NCUhWkD3ZZkDZFGRimtybYamVfKLI5HphHAdOXfMN4390roYIQHtvh/KSGp7+Rw1dlcqwJQ18JCAbymUwelor2acOAHwbmav25lvaD6xuPtkwt61Ny97Cb8bqs8CRFc8vZnj0iS8RT51SowrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFBxS2pqVFJHLzFHMFBOWXFPVjZHV0pkdFBLTjNkeDArU2hqb2xPTjRuYzll?=
 =?utf-8?B?cEJOaWo2TTlGdDdDKzF1UTk1b0hXR2p0TUMyNWxXWnkxaUpKOEMvMCs2QjVB?=
 =?utf-8?B?SHFMN1cveTJ6enZ6ZXBEY0UyUGg3RXdXbnVFNk1PUlVIWHIzQWE5Nm9LbXZy?=
 =?utf-8?B?b3dtMWlhckdpa1BkeXZJMEVJU24vR3Q2c2tYc01iRlVRdjdjL0ZDRm9Qdk5u?=
 =?utf-8?B?SkpoVDdZMndBdWpodHRuKzNQVisrNm52OWVNU0VDR3BjbVJGaXV3Z01UM2tt?=
 =?utf-8?B?Z2c5QmdJanVuM2tWRWxkZVlya3lIdHlETE9IRFcrMldQTkw0WHE3eE51czVw?=
 =?utf-8?B?UU04Qk5wUTZ0UkpjWmVYV1dBNG5ZbzlVbTQwOHIvRW53SVpiNitGQ0c4dEhP?=
 =?utf-8?B?WG95SFlSQ3JhMU8xSFViWVhHNEcwaGNJZ0EwWnltZGt3VDliaXRVeVhBV0R5?=
 =?utf-8?B?cVRwYjlLUXVTa0llYTFzdk9oSkJTVytVY1RlYzgvSnJJNUhHdnFUOXJhTkk2?=
 =?utf-8?B?SWczWHZ6WXB3elkrcXAvUVVRbDgrVXh6a2RDSEozRnpBbE1TSjR6OFg4UWVP?=
 =?utf-8?B?U1NjUy9Kd3UzY2NpV1U2OHFpbTV0WlEyK0pmOE5ML1VENzRpWFJuclpCT0lz?=
 =?utf-8?B?VEQ4S0k4VGhUdXZrNkNXRndJNWt4ajhaRDN1WXFLUkl1MDBvQlVvYTZFTFJW?=
 =?utf-8?B?TGJaR2xSVXVIa0t2NmFKVGE2Z0VDcFQ1cnVKUmt4M2pKUUI5L094cGZZcGFZ?=
 =?utf-8?B?dWRuVzZ1d0tONlY2bkV4QUxGQjlTa1V2Z0FYK0tXR0owK2pyUjVFQnhtczNE?=
 =?utf-8?B?bWV2eTFpbTRqR3V4eTljQytpeUFRWmY0eGIzYkU4WXVFdEJqMzVPYUlrUGdJ?=
 =?utf-8?B?citlWmRsNkJ1QmtWdytleWtoazBYZFJNeW1ENHA5YTJKclhXbFNUV3B4M256?=
 =?utf-8?B?NTdvdzExUWRBdXRHTDlzU1RCcVlyZVFLU3dVeTJIZklVRVR6YnVHVFFLTjdZ?=
 =?utf-8?B?S24rLzY3ZUZMd2l0R0QrOFpSNHBhSjdSdVE3Yk9WaUViL1lyVWJLV0NJV1Bz?=
 =?utf-8?B?T1FTRXg4bkVRL283UDV4ZkNuODRlVWViREdSZEhDejBNTlhueFlLeng3T0Y2?=
 =?utf-8?B?b3lnMmppdDRVb2VTMktLUm9lNmpwbDVRZkdhb2hkYUNxY0U0V0tNSUdjSzRu?=
 =?utf-8?B?dVlqR0R5ejhNSUlvRFRnREYrOXhqY0xQN3VwQWJZcXVRWW9oRmNuZnBBVnV2?=
 =?utf-8?B?V3NsaXlscWRVdlJCSHFLVXBsaytjNzBMaVNtWDNLYWlVR0p6anpMU1RRSm5q?=
 =?utf-8?B?MGl0SHgxMG9wNkdSODA0U2JOR01nbzBHRUQyNk5VK2JZT3VzWTF4bmw4eXdR?=
 =?utf-8?B?RzRYR2xUTlVmVEFudDEweDY5UWkwVkt1UFhpQkpEZUtqZG42UlYzTVZzVkVP?=
 =?utf-8?B?M3F3WWdtMTA5Mk9nWTArQ1ozOEdsWkY1L0dxdkI5S0lDdUkrWkRDWGJSQ3JJ?=
 =?utf-8?B?aUVYeGUwVE5UeXBsbWY2RzRObEZ2dTNvM0ZuZXdhY0orREtjM0ZBdHVvL09l?=
 =?utf-8?B?VjZ2MzhZRWU2Y0pOQkk5UWV3RWRaYUZ2WUg2b3dpbGVqQlVyVVVuWTNhSHdo?=
 =?utf-8?B?ZW9maDhxeTlaRmZUWUJFaGU0TSt2WE5kVVZJMUZObXdHd29EekFEUmhSK0hu?=
 =?utf-8?B?NUk5Rm1TZWEwK1QzVDByN1l5UUduYlhCRDY5akJMQTREOXBTR1NMTzcxNWxi?=
 =?utf-8?B?d2xLMjIzOHJRQ1g4MnNDNWZxYUJXTGRSVFRyZ2M0UGV4T3djN0ZiTTZWUlRo?=
 =?utf-8?B?OVBWMVJXS0p2TWZnUlRtZnBzZmt0NE5jZTIxa1BIYWN5ZWtZYTZzRnc1RjJH?=
 =?utf-8?B?czBJdnRDZnA0YTJxSllCT2RDUVN3NVhkTm9ubU8rM1UzZGNZaFlWbjhialNN?=
 =?utf-8?B?b2hyTnBFdU5kbWNEek4yZjFSWER6QUJYd2lUa3lVUTF4UGhqQzFjakhrajhv?=
 =?utf-8?B?U3hZbXU4YUtEMkVGZENidVBERHJsbXZ3N3RRU0MvN1pxSlV6QTN3UVo5c3No?=
 =?utf-8?B?RWxKWlBody9JTVJVL2x4VmdFc2x6ZjlkWmpJTE95ai9DQmIrRy9nRjJPblYv?=
 =?utf-8?B?RkZQd0RBVUNOL3NQYmU0ZWVicjVSOUpDWk8rNFFUV3hkTEplUUhWN251MkZ1?=
 =?utf-8?B?Z201YS96RWhpOFc1V2RaY0F3RjVpQTd2dmxoSS9MNGwxVXlZQVVtMzhSdVBa?=
 =?utf-8?B?Rk9HdHVsbk5Ra0MzZWxhaDA0NkQ5UktoUmNqTzFjd3NER0RtZjRsM1ExYkt4?=
 =?utf-8?B?SVRKNUpEY3VXV3ZnTE1rdXhwZEJXa2FzWDdjSjdybmZ5OFZqejNGU01hSGtU?=
 =?utf-8?Q?iQt+SxLNkkhh8ibk=3D?=
X-Exchange-RoutingPolicyChecked: QRv8iO7OyvEt3fPdK6KHeuoCynKdyFmYHQYEoiEDfgxyKcNeOxgsoYa0GOkfWjdWxaQSEb4uGmfdr4oSYsSNranZl7E/c62yfOFa3jsqrWBcw6X+x0wngcVBPQScGnAZzQG75SyljyEiRCRu2yXlXqQCyB/Oe/zegHJugn6ehNqWe5O5jhZBZljGHb2UJTrgpqWY0xBq4cbrwsW1SCHJeAVsodMDCRSUVtD4upumGUuhHlcgQBal7GaYxzOHrJxQuCuB9nnx6zaEIX14B6cQbpe6pXdhG5l7gJjAYQGBXr7romqB8vPGjDFaiRPemqVfrMUdQk7bPQaC9WFC9P8JCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ba1e51-3d52-4f6d-3806-08dee36da9ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 19:08:47.4216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6IS8zADjfHWYPIOqoG/M0eWvd3q+dikcUTuxvcj0wacx+p9DjNPmHiqLKQ/1560p07zckMLKJ5iL/JPKaXG3RJtzA7RRVEsWf2vHHNGjLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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


On 7/16/2026 11:48 AM, Niranjana Vishwanathapura wrote:
> On Tue, Jul 14, 2026 at 03:05:37AM +0800, Jagmeet Randhawa wrote:
>> HWDRM is the only supported PXP type and is display related, so it
>> cannot be combined with a multi-queue exec queue group. Extend the
>> sanity subtest to create a multi-queue exec queue with the PXP HWDRM
>> property chained and verify the kernel rejects the combination.
>>
>> When PXP is supported the combination must fail with -EINVAL; when
>> PXP is unsupported the PXP extension fails first with -ENODEV.
>> The expected error is selected based on xe_wait_for_pxp_init(),
>> so the test passes on platforms with and without PXP.
>>
>
> Require 'v2: <changes done in v2>' tag.
> I think it is fine for now.
>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> tests/intel/xe_exec_multi_queue.c | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c 
>> b/tests/intel/xe_exec_multi_queue.c
>> index 9b41f87c7..6aa1fd5e4 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -65,6 +65,11 @@ __test_sanity(int fd, int gt, int class, bool 
>> preempt_mode)
>>         .property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
>>         .value = XE_EXEC_QUEUE_PRIORITY_NORMAL,
>>     };
>> +    struct drm_xe_ext_set_property pxp_hwdrm = {
>> +        .base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +        .property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
>> +        .value = DRM_XE_PXP_TYPE_HWDRM,
>> +    };
>>     struct drm_xe_engine_class_instance vm_bind_eci = {
>>         .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
>>     };
>> @@ -119,6 +124,18 @@ __test_sanity(int fd, int gt, int class, bool 
>> preempt_mode)
>>     multi_queue.base.next_extension = to_user_pointer(&multi_queue);
>>     igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, 
>> &val), -EINVAL);
>>
>> +    /*
>> +     * HWDRM is the only supported PXP type and is display-related, 
>> so it
>> +     * cannot be combined with multi-queue. When PXP is supported 
>> the combo
>> +     * must be rejected with -EINVAL; when unsupported the PXP 
>> extension
>> +     * fails first with -ENODEV.
>> +     */
>
> NIT...Missing some commas.
>
> 'When PXP is supported, the combo must be...'
> and
> 'when unsupported, the PXP extension...'
>
> Also, when PXP is not supported, I don't think it will always return 
> -ENODEV.
> It depends on the order of the extensions (with new change in KMD patch).
> more below....
I will fix the description. Thanks
>
>> +    multi_queue.base.next_extension = to_user_pointer(&pxp_hwdrm);
>> +    if (xe_wait_for_pxp_init(fd) == 0)
>> +        igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, 
>> &val), -EINVAL);
>> +    else
>> +        igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, 
>> &val), -ENODEV);
>> +
>
> With KMD patch update, given order of properties is multi-queue first 
> followed by pxp,
> doesn't it should always return -EINVAL? We should get -ENODEV only 
> wehen the order of
> properties is PXP followed by multi-queue. Right?
>
> Niranjana
>
You are correct, This used to work with both branches because the 
original KMD patch had the check in exec_queue_user_ext_check_final(), 
which runs after all extensions are applied. Back then the PXP setter 
always ran first and could return -ENODEV on unsupported hardware before 
the final combo check. Moving the check earlier to bail out sooner, 
  changed that timing, so the test needs to follow suit. I will send v3 
  asserting -EINVAL unconditionally for this ordering since it is simpler.
>>     /* Setting other queue properties are valid for Q0 */
>>     multi_queue.base.next_extension = to_user_pointer(&priority);
>>     exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> -- 
>> 2.53.0
>>
