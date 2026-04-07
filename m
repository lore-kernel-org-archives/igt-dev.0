Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6F3EDB7D4
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 08:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F84610E310;
	Tue,  7 Apr 2026 08:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4Vjvdjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564E610E215
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775551811; x=1807087811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5tXs+l57K/z6bYGC46Wm5WU2z52nPjypPChRua+0LkU=;
 b=G4VjvdjxR5kxN3wZWV76j2UhWtqMAxZXxXs32iBMFkg7Npz4dB/CZ2zT
 uVsU1az2XqpHFDJtgtZnsmL5wX6z+tZ6vvvaGOUDxmAu1JbniJM2cC7JE
 KtRrSer7oAo6Gr/5UBr3WFdeKtmuJ4U5sLtCc827ddSG9QYKdLivw1MgR
 oR30yTWel5wd/VbkoIuPB7difHUQa6MJnNRwQ4gsfS0+3ghYLq/nRkMqC
 HO3Ru4yDR9/1mcXi9OlQnziqG5gMxD8xnDzerpwnYhSqn4MrDc0u8kfvN
 QIGg7ohKGDhW8OY4My0Kvv0d4aUKhpkqC1WOZT/360QyiUq47fxhbwaXz w==;
X-CSE-ConnectionGUID: YoFjwKiVTeadOj25Gqfo5A==
X-CSE-MsgGUID: M5z5aUxOR6ixu5AH+4ZwRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76392352"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76392352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:50:11 -0700
X-CSE-ConnectionGUID: 6uMhfE+UTXCV/+0wxLbX9A==
X-CSE-MsgGUID: ZfL7Id8gTS2JmhPIBFQJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="224915190"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:50:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 01:50:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 01:50:10 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 01:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KocpPvGi1sEjC/iwK+rWmX+LBVH5wSd66igHNxURnjamntLe+nC4TD+6YMCiyVcpghkRafvU8fmzHVqrUxC/uqSGhFVP6W+2nrx3IvBFayPB6UFUKHewk8dm4SXTR5UPUVCx9RxLkjEksk+hVPp9V9Z+AOTetB/jWPzOM1d0PxweYxWvOJ6Gct0zZQlWieCkuHMGCRwecucMXWwErm71HRjVGU1me3sSJ+f4pd5M/k2/7cikqKZpiLuq41hHbMTjWVG7a8MhtO6gN7fotTwdBUMiu68k5iy2s153Tl1J7l5Dxg9BNZyNm0lBBpeWBuj44qn6uHi5ocR5yH/dU+9APA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYyuT3nWOhJcHc8fZ3E47A/MExmmXsGU9n98hsHizoc=;
 b=HkAZCiH8sdwUEV2xzG3FIX5FhWgidtbk7yEDE9s6JGdHYzS1VMCpKEuwwFdY9Zn/Esk8CzdWG0CPEHRQVHDRKGDxtGiKLPN7VK2Z4mIEYUiAhg+WgZ6Xx1Gtci9E3EsEJt5lohVPCnmAAKFyfgKjWhFwoArxJHeUclerMzCioYPl0vr3ziIFPbOzZjsn6tVY/VsBeKeyo4rU34zJLbBvRplbOXS79X+asqy4jnuYp5RKp8XZtZnTSxjfRfbc/s1Iz3BnvzLwXrTzHN4FPpuhJqxJ01n1ZFniAQwbuld/VKD+i5+BNR0CjOTwjhPD6ai7Iiwn45dFo7AAHQhFn6CtWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DM3PPF1FCD3EAF0.namprd11.prod.outlook.com (2603:10b6:f:fc00::f12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 08:50:03 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 08:50:02 +0000
Message-ID: <3b658876-1b61-4168-a942-b0e1d3fea8fb@intel.com>
Date: Tue, 7 Apr 2026 14:19:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 8/9] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-9-arvind.yadav@intel.com>
 <e04eeb95-5d8f-4828-9a4f-f4bd5555f8ef@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <e04eeb95-5d8f-4828-9a4f-f4bd5555f8ef@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DM3PPF1FCD3EAF0:EE_
X-MS-Office365-Filtering-Correlation-Id: 261c5f8f-5d15-4b5d-06e1-08de9482a849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: TmhrzaQxQ3S6wVYUc27KG4a0DV/ip2knfYvJ2RUclYk4TXjkP3JBzU+2wzKpEalTBZxkSfqQAFr3Dful8O1srZdmCZ3j/LfarNeDjoQucbyNGjzlyNc3vqyas5tgpKqnLOXkfB6UWbe1BpyvRJOKN8S39sGFD1++gNOuZ6T9tHnefkOgxqw/D69bFUVulORVmVxekQpAhVYv8Ur46kr+vanEIHXrCoRXauF64uZP4OpLLq6+MhRJvpvBLAKE/3BPbqvnzD0rIZNJe9YhJQbhgadlWC4JkuiTJyKfKPBQ1UNJieXNuWyqcZxw/t3LRmmnO1j58+9zbCjcT+IbYRAD8i7yTmOiLAPMFiZvCkTB2/tSsyiG+EdOnwf3uFrPmCVfaoyZU2yK7nIo4R/ry4dZPD96B2y+0H/IazPCoLP272fFUU2y0tYu3sp0pp2HJ1oWy+HF9B41KzlWJW1pkEccSzp95c+oL66aeq0rJlA4D3fqWLmUDzp2QjO1PROPmRAlxhekEwEKIrFwR/iW/5YgKpM8K5Z1o2K9BiT0oXIsJzk/f+ENqIvp0jsR00nrlU0xHXNSLgqNCcZspfjtPLjLY8VIS1lhBLJb3A4anyMKIxop2NMmHXIbHW6iIZPQEsWwR3VEyS7+nvn8y+tqe2avFI/WPsvRLafTbBkzLeS5iuE12i/795xO0U/pv7qkqUn3v0DSnrbhiBxlEZAAEY8YjIS7+ID2Xii4yBYYF0B/Ja4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE1iOUxYd1NuMlQxWmlTMFdRRExGOUo2Um52R1FpS2NpRE5naWdUd3QxeUpm?=
 =?utf-8?B?cFdreVl6SlJFSEdKTHR4ck01OStaMjlhY1VPTXFpa3RnMzBOa3h2QlllU21x?=
 =?utf-8?B?aWd3UHV5SjYwYTVHYWNOaFhDYmxXcTkyWjh5YWUrUjVlc1I0NHFneVE2NEdj?=
 =?utf-8?B?bU8xaXN5Y2RocE5iWVlhOGRKaEhuclEveWJkVUhsSHRWZTJ5eGlKc3NTVGdy?=
 =?utf-8?B?S2VhTVd5cW91UUw1MXJGVjhPTUVaWVFYdTZBNUROT2M0WHVBb3cxVXRDdkdL?=
 =?utf-8?B?VWlLQ3JkL1VSK0hBakhOOFM3M3JOUHEwaGlPN1NRVFFaZ3FUTnJ2czBNTnQ0?=
 =?utf-8?B?YmFiRXFRWW91a3VHd3ZlOTRoa2cxR1hROEtJL3BDcW4yckxTbDFSdGhnQ0hW?=
 =?utf-8?B?WDVKb1NJRmxKdVR6TmJJRXdITHFKLzBZMFRiOHZVNGs4MWpkZ004aTZ0a3kr?=
 =?utf-8?B?bVhGVXIvUlJBU1dmbzhNak1HT1NiWnNuNDlOVnhrNDdVemlSR2tFOTBGcUVR?=
 =?utf-8?B?aS9QOHJ0WDQ4NVQrNjdJSEpGbWhEN0VnNi9Nc09lK2RpS1Q3T0RTYUl0Qkpy?=
 =?utf-8?B?UGNVdHBWNGx2b2F1TGRoMC9oNFRQc0gvNDZacTVhbU83a3RQUC92ekhReTlL?=
 =?utf-8?B?MWc0d2hPZC9zZDhObWJSeFdESzZtMjRKWXJrQk9rem5wa3FEOEdIUzR1Unhv?=
 =?utf-8?B?VmFXNlRKd2JibEdsSFV3UnNlbFU3VUNMelQ5K3hoQ1BjQlRLWGVtT25XUlpQ?=
 =?utf-8?B?ZmxVUk9Gd1Boc3pHS1B5V1NnQjRTaGF2WWdSTVZ4b1FieS9IdU9SUmV2VytS?=
 =?utf-8?B?ZG1PWEhnOUpUSnV0VmFkRldwQnZhOGtwQkoyUEt3V2NqNmY1MC93NlJaMklD?=
 =?utf-8?B?MGdTd0Y2WmhnM2p1OS9PTWRJWXI1WFY4VEdnR0hGZVlOaFFPU1BFMm1QY2Vl?=
 =?utf-8?B?RmdTenhTTUVlQlRMdXdxeVRRRmpVK1M3YUFBTHRuNkV6V1MwSU5vY2t1WEVj?=
 =?utf-8?B?VUNMcWdmTWVOVXpuSzFYakRPRzN2YWZWNnVOVS9tcWcwTHZRSXlMMUhsT1F6?=
 =?utf-8?B?QXI3MmpidlVhd3gwTmFqYjkwNVZMRnQvM29XbGNzL29nK213cTd6K1F6SlM5?=
 =?utf-8?B?RWtKVGJmdis4K0R3MGFSNlNwQWx1Z0E3VUo3ZXNQV1hTbWNzSWp3aHJpRDEz?=
 =?utf-8?B?T0d6UWJtSndJMndyUGI1ZzA0eUU1WklBdHVocmU0U3E0OTFBZ2VSR1JkdUxw?=
 =?utf-8?B?QXdZS3ZPckQ5QjdYTjlXVXNKblVtbzhpMjcxdU5kaUF5WUNMTHViTXBCWWRu?=
 =?utf-8?B?TUo2bXNYcGc3MVp4cUdSLzVYT3lSanJ4WmMxTU1GZHp2YjNuM2NhbTZQTU1B?=
 =?utf-8?B?R2V0bVJKYkRWMkF4aGQ4c0RWK0ZyZ1N4Z1RYY0lJNWFaQmd6RDJQQTNsOHFi?=
 =?utf-8?B?cVZaV1VDeUI0U1dBOCt2M2pNUEdSTGtHTWZqZVczRi9qL2tiQTJPbE1ab3dG?=
 =?utf-8?B?VW1KM2pqU3FOKzFDaU9DWGVHSkExYnpnZmdtZlhuNktWMzlTRDJ0TmVLV3BQ?=
 =?utf-8?B?VVJ4SFVPbGxGWWxmNnhHT2tOaURmUDcwSnVUSDgzcVhjYUZKR2w0aFpHaytu?=
 =?utf-8?B?NmlWODVJOUpuRjRZdTFheGgzalRZSWxSS3RzNmpYSzZjbW5pNVl3cHhERUl2?=
 =?utf-8?B?VDBTRWNiQy80R1lyajZhTFpReDd2Y0RvdlliZXNvODdHbXNZdVRDaHdTVkJE?=
 =?utf-8?B?RXJYRWhPb3QrdEFCVnpJNWFpTjF2Z042cmo2dmZEMzBmSHRtOWFQUEFnWDdM?=
 =?utf-8?B?QXFUc1YwNGRpV1IwdnpLbXJvazhqYXRJMkRmUHRTOWZabkhWaHRWUDVnZ2g4?=
 =?utf-8?B?SGZnTGh1cnJHcGtvMGg0OUdZRzdoQ0FpRHI4WXd5VHFId2ljUGFwL0pDYkZx?=
 =?utf-8?B?eG5RYnhTeVRlMW9TZTJORnQwdkJPYjZwTzlpTWx0M0ZMVEpId0pQYTFock9V?=
 =?utf-8?B?N3UxV3ZObEg4cFRNM0I4MVRHZ2Frc1RwSmRYUlN1cEl0V21NUm51bnAxZ1dL?=
 =?utf-8?B?ekllV0lzdFYyWWJoTHBIT3dUTzJ5Zkw2NHA3ZjQ4eE91NXdYR0lKZ096S0xo?=
 =?utf-8?B?VlRsczVYZlRHNk5LOEY3ait3TEhmRGE3bkgyZFJJZElLSWRjTmN4UjA0d0hs?=
 =?utf-8?B?L0UrcWF1K2JrbEYzK1JkSVZUUFZ6dVl0ckl0eWZBSkd0YWx1a1haZjkyVlJD?=
 =?utf-8?B?ZUxJd3Q2bGhMblcwMUJ5YzRpYVhsZHdVclN2bnAyNVk5T2s2eCs2V21HM3R1?=
 =?utf-8?B?WW5PWE1Hc0F5cEdKSVU5TndOL0pObHFjelpMdzVpTGxpdE5DbFpHUT09?=
X-Exchange-RoutingPolicyChecked: ij0ncSZk1cmgBLaO6xl5qnFm/rd1YSXdoyfR5vrm62eCTCqxj0IOaW9LLVgQuDNUAUwOa5TxqJFxDzQ1U3UQ4uKrLBpWjy5W4PHsC/mAlBOgbf+r5MAyjCcfR8c0OHLFhVQoFhgien6iIxZxh6f/3hL4Hk/G8fZ8g5p9kaoBQU+S82X5feyd0yfro60IPMPjAMfGklE1yPHWV+MWMWnh4DhF9tKWnUgeiiSK2GnM4Bl5PgaBlYIGBD7ZvKNStqYuuhWPL/StzXgxkJPWUuaBdqx9JPd0EZGNz7CIzjD2wXUyg6F57vq0LyO7GhoKUaam9LyoX8jZZO4nuw3agJvFEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 261c5f8f-5d15-4b5d-06e1-08de9482a849
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:50:02.7176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZXf/ZFARJL7wrf+RQewMrdTvRmQLjXp+YM/6RZsHgqc14B++06KcoZKKSIxq165H0UaoPH1OnSa8zTXMmdE/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1FCD3EAF0
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


On 07-04-2026 12:50, Sharma, Nishit wrote:
>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> This test validates that purgeable state is tracked per-VMA when a
>> single BO is bound in multiple VMs. The test creates one BO shared
>> across two VMs at different virtual addresses. It verifies that marking
>> only one VMA as DONTNEED does not make the BO purgeable, but marking
>> both VMAs as DONTNEED allows the kernel to purge the shared BO. This
>> ensures proper per-VMA tracking for shared memory.
>>
>> v4:
>>    -  The comment now clarifies that triggering pressure. (Nishit)
>>
>> v6:
>>    - Move resource cleanup before igt_skip() to avoid leaking VM and BO
>>      handles on platforms where memory pressure cannot be induced; 
>> replace
>>      igt_assert_eq(retained, 0) with a graceful skip. (Nishit)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 114 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index 28ea81442..6c0a563d8 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -28,6 +28,7 @@ static bool xe_has_purgeable_support(int fd)
>>     /* Purgeable test constants */
>>   #define PURGEABLE_ADDR        0x1a0000
>> +#define PURGEABLE_ADDR2        0x2b0000
>>   #define PURGEABLE_BATCH_ADDR    0x3c0000
>>   #define PURGEABLE_BO_SIZE    4096
>>   #define PURGEABLE_FENCE_VAL    0xbeef
>> @@ -267,6 +268,58 @@ static void purgeable_setup_batch_and_data(int 
>> fd, uint32_t *vm,
>>       xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, 
>> NSEC_PER_SEC);
>>   }
>>   +/**
>> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared BO
>> + * @fd: DRM file descriptor
>> + * @vm1: Output first VM handle
>> + * @vm2: Output second VM handle
>> + * @bo: Output shared BO handle
>> + * @addr1: Virtual address in VM1
>> + * @addr2: Virtual address in VM2
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag for VMs
>> + *
>> + * Helper to create two VMs and bind one shared BO in both VMs.
>> + * Returns mapped pointer to the BO.
>> + */
>> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t 
>> *vm1, uint32_t *vm2,
>> +                           uint32_t *bo, uint64_t addr1,
>> +                           uint64_t addr2, size_t size,
>> +                           bool use_scratch)
>> +{
>> +    struct drm_xe_sync sync = {
>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +        .timeline_value = 1,
>> +    };
>> +    uint64_t sync_val = 0;
>> +    void *map;
>> +
>> +    /* Create two VMs */
>> +    *vm1 = xe_vm_create(fd, use_scratch ? 
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +    *vm2 = xe_vm_create(fd, use_scratch ? 
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +
>> +    /* Create shared BO */
>> +    *bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>> +               DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +    map = xe_bo_map(fd, *bo, size);
>> +    memset(map, 0xAB, size);
>> +
>> +    /* Bind BO in VM1 */
>> +    sync.addr = to_user_pointer(&sync_val);
>> +    sync_val = 0;
>> +    xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
>> +    xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +    /* Bind BO in VM2 */
>> +    sync_val = 0;
>> +    xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
>> +    xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +    return map;
>> +}
>> +
>>   /**
>>    * SUBTEST: dontneed-before-mmap
>>    * Description: Mark BO as DONTNEED before mmap, verify mmap() 
>> fails with -EBUSY
>> @@ -546,6 +599,61 @@ static void test_dontneed_after_exec(int fd, 
>> struct drm_xe_engine_class_instance
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * SUBTEST: per-vma-tracking
>> + * Description: One BO in two VMs becomes purgeable only when both 
>> VMAs are DONTNEED
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_tracking(int fd, struct 
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +    uint32_t bo, vm1, vm2;
>> +    uint64_t addr1 = PURGEABLE_ADDR;
>> +    uint64_t addr2 = PURGEABLE_ADDR2;
>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>> +    uint32_t retained;
>> +    void *map;
>> +
>> +    map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +                        addr1, addr2,
>> +                        bo_size, false);
>> +
>> +    /* Mark VMA1 as DONTNEED */
>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +    igt_assert_eq(retained, 1);
>
> As per description  if VM1 is set to DONTNEED it'll not purge untill 
> VM2 also set to DONTNEED. So retained = 1 is expected which also verifies
>
> BO is purged or not, if returned 0, So below VM1 WILLNEED check can be 
> dropped.


The WILLNEED round‑trip is intentional. It checks that the state change 
from WILLNEED (default) → DONTNEED → WILLNEED works correctly and that 
the BO is retained during this process. This ensures the DONTNEED to 
WILLNEED transition happens smoothly.
Only after that do we mark both VMAs as DONTNEED and confirm that 
purging occurs when all VMAs agree. Removing the WILLNEED check would 
miss coverage of this state‑transition path.
It will never return 0 because both VMAs must first be set to DONTNEED.


>
>> +
>> +    /* Verify BO NOT purgeable (VMA2 still WILLNEED) */
>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +    igt_assert_eq(retained, 1);
>> +
>> +    /* Mark both VMAs as DONTNEED */
>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +    igt_assert_eq(retained, 1);
>> +
>> +    retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +    igt_assert_eq(retained, 1);
>> +
>> +    /*
>> +     * Trigger pressure and verify BO was purged.
>> +     * Using vm1 is sufficient since both VMAs are DONTNEED - kernel 
>> can purge the BO.
>> +     */
>> +    trigger_memory_pressure(fd, vm1);
>> +
>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> Expecting 0 (for purge) here, right? Can we put a check over here?


Yes, we are checking this below. After cleanup, we verify if (retained 
!= 0) and skip.

Thanks,
Arvind

>> +    munmap(map, bo_size);
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm1);
>> +    xe_vm_destroy(fd, vm2);
>> +
>> +    if (retained != 0)
>> +        igt_skip("Unable to induce purge on this platform/config");
>> +
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -588,6 +696,12 @@ int igt_main()
>>               break;
>>           }
>>   +    igt_subtest("per-vma-tracking")
>> +        xe_for_each_engine(fd, hwe) {
>> +            test_per_vma_tracking(fd, hwe);
>> +            break;
>> +        }
>> +
>>       igt_fixture() {
>>           xe_device_put(fd);
>>           drm_close_driver(fd);
