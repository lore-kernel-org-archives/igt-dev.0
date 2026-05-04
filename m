Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DBACD3423
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 04:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2BC10E0C8;
	Mon,  4 May 2026 04:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UM/FAQU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA4010E0C8
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 04:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869133; x=1809405133;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S4OuMRFwqNXtFN5qcbob5JVR2XC9Orep9258TvEUgzo=;
 b=UM/FAQU6jetRuisj/kZOdmhsGKFHRKnI1Yc2+Aen5DZBnKE4yuqbdmnu
 FN0Gyhycg4PxABMPUm0doqut7VN41I94sx8P9gU2mw71wKUnUtEb6BfTi
 NQPR7t4BB7pdjfTPeglzIuDgweuWPtKX45p/i9MkZ1+/f2IDTH65zifMz
 ssjcHQbXRkuFOl1fcPxsA7znVL65YKuSWoh+FwEKtzOKR62Y+JAUvAonf
 SpjmQN8ZYRmLAqRMlHYhtbC9ULN+8CwWrL8ykGYrosATrzDxm/tOnBEKs
 mRE5XZaDAHGd4IlkhXLJ5B4/or+B1w7Z0Y7ZcNqsK8LiwzFzbgkv40F7T Q==;
X-CSE-ConnectionGUID: 0YZwYOzXS/uUNt0TB87mAw==
X-CSE-MsgGUID: Z2kxudhnRDG2M7zz6dCtNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78774326"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="78774326"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:32:13 -0700
X-CSE-ConnectionGUID: m9fMEN3YSie4G1hNXk3IaQ==
X-CSE-MsgGUID: VBqKJiVtSL+2mU20n6DI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="234390580"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:32:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:32:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 3 May 2026 21:32:12 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOaY/wrb6wYRWoeYzdTcYB9TWdJmJnWgbXruBpn8grWaWzdLD6GxdB3O9VxAEUmi1MDYyYmeVtwUp4gqh7+IrML4E0hYBHYNB1zwjkS7dDvRk58oxX3dFV9JpfO1hhf4dlBuuM1UepTmdIuM4C0etyD2dmzwDqHz6R5N6V8alCNX7WL/umpYjNKcBAK/NiPqmtkkkpKc//ZMWQRbDji6VOV0b3cUQ+0jl2+GxXTR35V+mCX+wxuUspiJrm1mxw0CTTpLLjOSHqFka5lfiV6Rui5f8B1SjcJpaEMbsoh2GwPf6CzC7N5wOf0M+TaazsNg2CoVF4GPSa+PG8Ik0hbOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzOuLxOlKfLmDEK37oSm9i2M1VdENIOKZCrviKf138Y=;
 b=C7oNYAVExzOjQ8UmaM0nWJuGqE/7qeu2v8HEouQ0SpaTH0sFRQk7TTfQDK1N8o/cUxTJyuUJkky81UuSVWZJNJ/QAsVINxWw5uxKAp2tUcow9AvrpANf/s1+BTjJ/zmiKtCDhciRYPHJwukNYpIl+HttpM3nqTsIFFlPw7CezBpIhlGGEyb+iy2uON6nA2gD41km8hLJx7wm22qS17k82naFwuyY0UAtJaAbIww1jsT1Spc8oUBE2BoiH/4BfLIMqxk1HH1VxMZElag9f6bkkJ9hYDmtpT9ImfoRT3pPQl6zbX3KIyPm7nTfiIVVbwT8qcVFYhq8cyOZUjLe/nSMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by DSVPR11MB9578.namprd11.prod.outlook.com (2603:10b6:8:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 04:32:09 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 04:32:09 +0000
Message-ID: <20f229fb-f337-407f-8799-dc1b3d1e706f@intel.com>
Date: Mon, 4 May 2026 10:02:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_madvise: Add atomic-cpu subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
 <20260423063904.3944005-5-varun.gupta@intel.com>
 <a6ba9e79-cdd6-47ce-848c-4866034e65ef@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <a6ba9e79-cdd6-47ce-848c-4866034e65ef@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::13) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|DSVPR11MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f330690-959c-429a-8e1b-08dea9961abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: fiRmF7JJtgC3mR/rxayp1AvzZhVneEfZNuSaC6eJ/+FEbvQLEQiGkDfs7+4rMn2b+Kv05sySd7L8aZ1VnaBjgO3F+pvJonHZw3nyHXdqkMWta49FA8oQzHEgj3crhiFjryr042JCg80irrXTbp1p8FSbMYWi0brnLzZSCioqE2cUV6ZB7hyYZLLt/nDo5AmxYHpThaAe8KUXgrBIDJ39NbPR8u7kRrdNPd1BcsJHQQwj/E/L3R740xFeTD6mO46SI5BiAQ077YoARKatK6xFC3DKUpMqIKQsdcSZYyayRKsDhIR3HNSWi80llBFYAfLwdOWxz2vYwShkin9mMIswrzOOGbfsNIiQrs8g8mD/S14ZsNaWTbaszUucp5PHEc4sCpFUeZBsdPbz1axV4etts1YRu81JWpTtvzBmUmDGMkQP19liSY79ZkYx4MjQgUW2nn65u8UFldrVk0BAQXSkQai5qLDSdM6VP4YIYONdbCL6pWqVI/RhfsaJKY3HUQqcULrkTD+YVxcFY6wQhBuyRUy2qIrUH8qL81oYv2ohc6IzG/Se+eRAvBCM4zUqWyXC0+VEBoUTwQINAVfLCg1VjlMc/ERfXEwVN1GRoo7vtbDquYUCTrQAnfa837DcpBfpbOwHeG32gpl7a7GY6TG7aJFq5UGMLd4I7nED8fom1GWj252dZogW8g2bsnE1v1PI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1J1UjVCeGdHVUpiZ3djMXpoVHoydnhqcFBBYlk0UERWb0p3Wkd3dWJ4Y29u?=
 =?utf-8?B?WFFyS2kyemVxZWZSZUp4OHloZTVqTGNWajkvWWJOOTNkNzNUV2lzc2cwUDIz?=
 =?utf-8?B?L3BNWHkvdnZ2c1lDVHc2ZnNuN1Y2OXpHZ0ZscGFQcTZDRzBsVFc1VjZPK1k0?=
 =?utf-8?B?cHZidlFDMVRsV0REZmg0Vllya2VXMEp0YjBlbE9pRzA3Y2dBN1lMRUVxSEtj?=
 =?utf-8?B?czh6djFzQk9hZkNHSHZYc2ZaMmorMmZnbWNqWUxoWlpOL1lGUUEvcmh0UXRB?=
 =?utf-8?B?NmIyS1JncnVpbmR6enl2V2JSUklPWS9EZ012alM2bXc5MTJJU0x3ZGFUek8y?=
 =?utf-8?B?MVVkZWVQaFhpWDdtMU9jVldlZUttS0UyMk1SZ3BrRUZrSnNZd29uZmNFVWdy?=
 =?utf-8?B?amtLZVR5djhCR2lsYXUzK2REazBmZiszbTA4dVRiemI4RzVxaEkwR3RHYTJV?=
 =?utf-8?B?ZVVQcjhBdEJmUjQ1d3oxRkduNk1WQ1Ixa2o5bUNwampxcDhoSVVlRnVMMGk2?=
 =?utf-8?B?emZpOWZ6dGc1ZlMyMlF6UlJ1SXlmUTh1MWNKTU9OZkhRRzJZWGFHUFBUZ3F6?=
 =?utf-8?B?V2kwZlgrajZBbUdSNVRQRE0xTkwzTlJGY2hpNElGNUI5Mkk0SFNMMmQ0bzFC?=
 =?utf-8?B?VTZEMEZLaDVkSXJnZVhSSGY1akRoUFdBK3dhMCtGYUt2WVhKdEpHbjNiV1JM?=
 =?utf-8?B?MWx6Smptbk11Qm5USVBqY1QyUUoyZjlrUzU0Yk5POGRMVDJaZ2ZmTmdMUmxX?=
 =?utf-8?B?YVVDMi9WMFRlSnBqVmZLOVA2NnQ3d3llTU9Sb0s4dCtiS0dnL2Fudkg0Lzgw?=
 =?utf-8?B?a3lEQ2xMTU5tSU4vM0hGekIzM0VnNVlxbVpKOWNJazZIakRVS3puNkMzb2Vk?=
 =?utf-8?B?Wk1ScmlPTjZrUEdCQW0wMngrU3hRa3M2WVg4c1pNc0IvSWZNQXNsbUoxR3hB?=
 =?utf-8?B?QW9ySkNzSU9VejJzWEVhWldvV0ZUNTdHRjNBOGEzTlMycDRXRENHZmhYdloz?=
 =?utf-8?B?NHFJKzRzd2RsTVZYVDVtM0VkTzUxekNJU1hrNS9ZV1c3Y2ZEc0NMUHp6REpm?=
 =?utf-8?B?dEZraUNzNHhYdXRMSVV0NUU5MXdJOHhVdVl4bk9oVG1nVFNta1Y5NlFJZzd5?=
 =?utf-8?B?cC80Vm9xaEsvS1BoOFR4R3IwMTd1L25VbndMWmVxL3lZMEJOUy9MeGw5ZkNz?=
 =?utf-8?B?bVV6ZWFvMCtnYXU5NU4rSHd0TGltQ05XWjkvNHRDY0Nqay9XSjBvY1V2UEla?=
 =?utf-8?B?SVVBRWpPcDZ3djBjRkNDMENMSmxtdmZzY09qZUN2UmYralV3aTVMSHBHNVBS?=
 =?utf-8?B?bTZNSWFHU1U2d25zVDhsck85N1ZVUGJ1dmVubHJQL3l0L0RvK3pJbzhmdkVa?=
 =?utf-8?B?dFBOa0NoWS9JZ1g3UE9TdTlSRUFQaTh2WC9wR3dnd3pTemZaWEhTTmZ2VUl2?=
 =?utf-8?B?MFI0Y21TTUVGaXc3ekV5STdCaHFoSTJkemU3Qk1yVVFwT2Z4M0Y3T0o3K2Y0?=
 =?utf-8?B?WEovL1lYQTN2b2p1Rmo4cUxqVGxsS3M3WS9kd05yZmtmMTlkUSsyaXZjbERr?=
 =?utf-8?B?WWtxUDU4Y1YxUnBLZCtDSE1lRlhpeFFxQTcyQ3VhaU9DNTNnUDdOSzhMRVgz?=
 =?utf-8?B?aHFoRy9JZGRDVkdGM2JicWVXVTIwTXlRQ0U4elgzckhaaWV6dVMvNFVZem1K?=
 =?utf-8?B?ZzdaNTR1NkNvVTNWRG0yYlhNMjd3U0E5c0M1TUFvcVkwVXNEdUhURzBGUWtT?=
 =?utf-8?B?YmtsNzdMQnBsS0NWbmhVOWo0TUthSDNycDBYelUvMlVidHJKQjJ5ZGNGR0ls?=
 =?utf-8?B?ZFJQZmliRzdxNFZsUVpHQmQrYTFVa3ZpYXNvSDlaZzJBVzY3MG5HV2pCaWEz?=
 =?utf-8?B?TkdHUG0xYTczQk84SmxOMjBSdXRsSjlTRE5iY25UQy9jbTFYc3pMWUkvUjhR?=
 =?utf-8?B?SGh4OWFFYzVJdDRYQytJSmhKUDZJK1NZSSt0MHRPeDErTEZ5NkNZajBMTXlF?=
 =?utf-8?B?VGZkMnpNZG94eTdNbU1TRWhVa3IwbWlvcUFGbVlSSEVmQlJTYmJUczhZK2FE?=
 =?utf-8?B?MXJXSlNqNDNuNVlJOFdEMnM0bElUUWYrQ0FNREZCVk1EcEdYS2F3Z2dSNmhC?=
 =?utf-8?B?WlhXaktjYkU0MjBuUmk4OTRUeWtaMlBQYU5VRmh4clFZRldBTjhUdEl1TTdO?=
 =?utf-8?B?Wno3bEhWKzEvSUVOUTBlMVQvdEczTmdsTFl6Q0d0Q3c1NmFPK3VMdGxoRmw0?=
 =?utf-8?B?b2ZVZjV3eEMvZVpSa1U4TTJOa1Z1K1JzVjM1czNPRVF5WXFUbnpKZ0p1WjNE?=
 =?utf-8?B?MnhmSmV0Qkl4cW5tdndZV3ZqMXltR0pWQjR4Z0tJay95Y3JCRnJLdz09?=
X-Exchange-RoutingPolicyChecked: RomyU0ufaztHbhbgBlJGsex8UlgPnxT4SqtPQgszdErXu5Pg9SgPrZEACtwKr6v4UvQG9AaydRGTXqxeKc8KjtoqJrnIuDm+dXnooiCDYd/Hb2xFEesd4xJMuqSj7j8PndJap3a2rFCqMzlQwNZQFYDsjthkpQRuPs5bIjZXqdNz0VXNQ/sFRHTGwNgs4uj1+NIByrY9QiU2KsAjI/7Wwv5UGjibZ+O9ynNI2ZzV+Cr9TtMA90akmWG0yUW1gj7nSRSs1nnczIxijMJ9dN3KBVp+a4QgjtxgHu7vWBMBarUDDWNXXK9Z9CXiCDZ6O7H+y7Cf4/osbfjzdmhhQ7DNTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f330690-959c-429a-8e1b-08dea9961abc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 04:32:09.5360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBT5blvSUbekkHoIu24PTU1SzKtYHUtSfxNg9GpHtBlBMEmh9TbPeRjOxtKihfeSEIAOO8H9bx6HvgjqevaNDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9578
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


On 29-Apr-26 6:55 PM, Sharma, Nishit wrote:
>
> On 4/23/2026 12:08 PM, Varun Gupta wrote:
>> Validate that madvise ATOMIC_CPU blocks GPU atomic operations on SVM
>> memory.  The test sets ATOMIC_CPU on heap-allocated memory, then
>> submits GPU MI_ATOMIC_INC which must fail because the page-fault
>> handler returns -EACCES for CPU-only atomic mode, causing an engine
>> reset.  The fence wait times out (QUARTER_SEC) and the counter must
>> remain 0.  Only the first engine is tested to limit CAT errors from
>> repeated resets.
>>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 77 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index c251186d3..3411a6f3d 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -936,6 +936,77 @@ static void test_atomic_global(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * SUBTEST: atomic-cpu
>> + * Description: madvise atomic cpu supports only CPU atomic operations,
>> + *        test verifies GPU MI_ATOMIC_INC is rejected by fault handler
>> + * Test category: functionality test
>> + */
>> +static void test_atomic_cpu(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>> +{
>> +    struct drm_xe_sync sync[1] = {
>> +        { .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +          .timeline_value = USER_FENCE_VALUE },
>> +    };
>> +    struct drm_xe_exec exec = {
>> +        .num_batch_buffer = 1,
>> +        .num_syncs = 1,
>> +        .syncs = to_user_pointer(sync),
>> +    };
>> +    struct atomic_data *data;
>> +    uint32_t vm, exec_queue;
>> +    uint64_t addr;
>> +    size_t bo_size;
>> +    int va_bits, err;
>> +    int64_t timeout = QUARTER_SEC;
>> +
>> +    va_bits = xe_va_bits(fd);
>> +    vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +              DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +
>> +    bo_size = xe_bb_size(fd, sizeof(*data));
>> +    data = aligned_alloc(bo_size, bo_size);
>> +    igt_assert(data);
>> +    memset(data, 0, bo_size);
>> +
>> +    addr = to_user_pointer(data);
>> +
>> +    sync[0].addr = to_user_pointer(&data->vm_sync);
>> +    __xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
>> +                DRM_XE_VM_BIND_OP_MAP,
>> +                DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
>> +                sync, 1, 0, 0);
> Same comment as in Patch-2/4


Noted.

>> +    xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>> +    data->vm_sync = 0;
>> +
>> +    xe_vm_madvise(fd, vm, addr, bo_size, 0,
>> +              DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_CPU, 0, 0);
>> +
>> +    atomic_build_batch(data, addr);
>> +
>> +    exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>> +    exec.exec_queue_id = exec_queue;
>> +    exec.address = addr + ((char *)&data->batch - (char *)data);
>> +
>> +    /*
>> +     * GPU MI_ATOMIC_INC must fail: page-fault handler returns -EACCES
>> +     * for ATOMIC_CPU mode, causing engine reset.  Wait with a short
>> +     * timeout — the fence should not signal.
>> +     */
>> +    sync[0].addr = to_user_pointer(&data->exec_sync);
>> +    xe_exec(fd, &exec);
>> +    err = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
>> +                   exec_queue, &timeout);
>> +
>> +    igt_assert_neq(err, 0);
>> +    igt_assert_eq(data->data, 0);
>> +
>> +    xe_exec_queue_destroy(fd, exec_queue);
>> +    free(data);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -1007,6 +1078,12 @@ int igt_main()
>>           igt_subtest("atomic-global")
>>               xe_for_each_engine(fd, hwe)
>>                   test_atomic_global(fd, hwe);
>> +
>> +        igt_subtest("atomic-cpu")
>> +            xe_for_each_engine(fd, hwe) {
>> +                test_atomic_cpu(fd, hwe);
> Mention why single HW engine is enough to validate atomic-cpu operation


Noted. Thanks!

>> +                break;
>> +            }
>>       }
>>         igt_fixture() {
