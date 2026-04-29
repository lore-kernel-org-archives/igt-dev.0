Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F4FF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 09:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C544F10EEE0;
	Wed, 29 Apr 2026 09:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBov3vfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0F210E178
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777453893; x=1808989893;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RXubqWV7bvWmej6drOGiK82pV+K672VAJP78qcI6618=;
 b=ZBov3vfQATEdN+pu5pz1EH/p5rV3Q+pqEuahWuQMle0n8e7Y0qRSqBtL
 E7GIVTrC6DUNTRyLSvOEU+nLd2VJfuxCdMf9cSk+7Ejku4G13gIGu7hNB
 2QaleLxwcBtt3RTzjj3TYczrXcC2YX4ycAv60ALctVK2HIwBSWVs74hbu
 trrTfpB4sYLSeTFy8+4BvpfBnE/VMkjgD9vHFAYysXVgVTL287sd9jC5S
 qDIYMYivLVzu7xH2BJyoz/vQ51O5FCJgkbThFt97zxvbTxCIkfQJzAFte
 QQBwjEk85BInGMQ3As31r2tzbbtcuewhOKFwRAcaZ2KGY01cn4ljKKiqi g==;
X-CSE-ConnectionGUID: g+xz89uAR022OvDthmanzg==
X-CSE-MsgGUID: avvhvE3ZRn6Qo+QYOXojHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78364189"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="78364189"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:11:32 -0700
X-CSE-ConnectionGUID: cR+25dVOSEyDfE+IfiCjcA==
X-CSE-MsgGUID: fRbwRpPvRkK9PpZfxrKmsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="231560881"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:11:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 02:11:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 02:11:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 02:11:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0PekhoqsuQv/Lg4lPFF3bx8kxXTDgLYAMxFnzIxmhAbFsX61WBrZO30f3mMyFgKgyBqsZULrcdzhZlsn9vr9opRniKUNGiekWTpOJDhFksj/FNVjE10MGEOxs3BVv/hsc03ZJcAGFBxm4fk8/20bwyWHI52cF0r/j7DfYvNdI7yIhZZ6fraRunqBfkWYqKI/awF+VmDANm6Q7xU9wK0GRV2BViLEsB7Vi8cRkAwiPaphifrvSCHW2NGNFgR4lSVnGsdE5mvbmJYEQaE1MR3gnyfO72e6jLyb8RXyArGP7roYuOm6RMuIi8UKCfb1+EMSP6z0LWWAT63VE7vwV9HqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0JNgk2VlXF0qb7GF5it1mboD7rURPLqchq55kMlNpc=;
 b=XA86pKeybtP60ZcnIN26VWrHun/IFyjwyQLf9I8A5Lirr/Szn38wHFarrGR3WtcERULcGZvlGKkmh80lQt69t+K7npvK3+wageoc7vOOnN5pDxq/QnN/d5GxIY+c4Uw58HQnhZCy0729iRYbivWYwHfVVALkO00qohZ9Q07x8N/XqtQSHlXBOUfy1A7TKqJyEdCM6w719TjFFAPAoIc4dONnhsEHj1Th1yLbwPwzXAGgeXl7jltXQG7qQntdiX25bSTi2hbxabUJrrQtmtSDjcM5vEPb3myPYaIk1zRP8jvk2xKpM3oDN0UuF1ZeW5sOm6lLP1p1IW/hmtm2NZvDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7140.namprd11.prod.outlook.com (2603:10b6:806:2a3::22)
 by SJ5PPF92ECB6678.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::846) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 09:11:28 +0000
Received: from SN7PR11MB7140.namprd11.prod.outlook.com
 ([fe80::44ca:7e7f:5399:a520]) by SN7PR11MB7140.namprd11.prod.outlook.com
 ([fe80::44ca:7e7f:5399:a520%3]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 09:11:28 +0000
Message-ID: <2f50c46d-32b8-4f07-bc53-1598ba43ec46@intel.com>
Date: Wed, 29 Apr 2026 14:41:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_madvise: Add atomic-device
 subtest
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
 <20260423063904.3944005-3-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260423063904.3944005-3-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To SN7PR11MB7140.namprd11.prod.outlook.com
 (2603:10b6:806:2a3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7140:EE_|SJ5PPF92ECB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 0801b904-32a1-4e48-70f1-08dea5cf4be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: NozuDPj49gwIKiNcH+qmDurApoSmBrjKabOxNqi9dmnxAdxb/RGl+oHMljls/o5iGjOIjE5vFmll06hkkHDLUjQBRqPYV/ULuvfbkSL3tlk8fJEAiIa77WLd2n0dKEsgYlTX2of6uLGhnHlmCQlkcYIlZlW2RCaRB2vwH8rHj1sDr8xAPm58aYPS0dI6NqydQqYqInaJaR9VQB0Dya4J+qq1fRkEkMRwFaqe70fk9RMZHhjHZ80kdNU7fwVu8cnLtzopxzVQlc7I5wbfiA5N1RF922VgsTMoqnRvwZKfks0KiE1fpiMgiNeO5ntUmrZX6LcIlntgISdYl/pPMffj0FWy8deLP/I/U8VlCzXcuP9mmR192esdKQqjKAia5GPBPGsv0ayNrZr6l07u8XJVktlOQikfYKVsl3HM6svEI8C9iEMBz7/QlTx3qgbqjKXG91f/DFUOn1iS54ISYu2kvR0aIDfmoChvqzPxdfXyGP7wXdrmLnnftkcQFYlVgZlRO/v7bo5ynCHT5Xycimx7GZT6FW1m2Gq77ige43V4Fa+eMndKeOLHgyIA6yUNR816rqkNQnbW4pta/8e6dr1Ao5oF+5J7fq2/HyCV3so/wpiecMGdqfxT1xuIYBXaY8U3J0lC1BQsaqYh7/ZGazDQc9j+M4UbgHJgnAPlFk5I4bEZaEFl8Lrm5e510ZcIb8LvaFBd2S5dto5SeXLyejwCikmRn3tXg0zrYTNayJBcdNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7140.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1ZQUhad1djbDBWMFFEaDNsUzJ4OEtkVjRGQjZHMzQ1bEdZaTJwK2FTZ3cy?=
 =?utf-8?B?VGFILyt6V3Nha0lud2gwMjBGcHhIeFQ3M01zMVNNYUNHK1d3c1pockF2Ukl5?=
 =?utf-8?B?UXpjeXRXMU52YXRTcVB4clFoS0J0TEZ4RDR4SHVHUGp0YkowQmxXVXZPSVdB?=
 =?utf-8?B?WTdKdmV1S05SNjV5ODdwZVY5NFZ6WnRjL2JrQzBBNDBoakZzc21BckNYdDZh?=
 =?utf-8?B?T01YSldNeFlTd3lwSC85eVI5c0xmM3p1Qk04YkZleDRFeGVpMjlKbFY0Rm83?=
 =?utf-8?B?UmxNd3VsQkE1QnJTVDJONlZlRGplLzU0T2Z4WDJHSUlycWx1eXQ3TWV0SVRq?=
 =?utf-8?B?ZUpmWEJrT2tJYVU1eE9NUWxibWpRSUlOTkJmaDZIZDg3QVhtTjlWeTN1Uksr?=
 =?utf-8?B?b3hCTThuTE5aZSt5aEErektrUVZJSC9jbFBIUjlhSnp3VnhhSVEybk1HeU5J?=
 =?utf-8?B?RGF0WHBzc1o0ejR6by9aTmhJL0RtSmlYdW1ZU2tiK3JHYWM3N1ZuMDFiU2hx?=
 =?utf-8?B?Yi84VzZTNHhhUVIzTjQzcW03MituNmdnWjZaU0pUY0VtT3ZYUVVtOVdqYU5k?=
 =?utf-8?B?NGNoYWJoNmVwRmR6NEdpSzgvaFp4dktQK21VcGU2YkRMOVVCRmtvc0hzaGw4?=
 =?utf-8?B?VEgwNkF4UThIdDVXalFMRmtSd0hHWFdiOUFVZGVaYzJlTkxhQ1FPT0IwWWQ0?=
 =?utf-8?B?bStQbU9KMVk2cWR4S2tGSjFDNXBSOU1TSDlYeFhVcTFOZnNyODJvS0JuZExO?=
 =?utf-8?B?K3hsTHBPSUcxNVpReWVzZVJnYXlPMVVMdXhlN2lxNkJYTzZJNUJiS1V2cXA4?=
 =?utf-8?B?aUxacGVFVTZwVzBmd1U2RTRONW9BR1dEelp4b3lMS05sc3hDUXVnZnlMS1R6?=
 =?utf-8?B?Y3ZISXBLZDMwZmVNc3pMQTh5eE9NS3hIZk9rcm9YdHVpUVFLRWJwVG5CTnNO?=
 =?utf-8?B?SU9BaFR4S20yK0xKUjVPbHowSnoxejVNSEZUWjUzN1JXN2RYUDBZaExrdjl6?=
 =?utf-8?B?R1N4ZnM2cVVFd3RTVk5HS2s4S2kyU283ZjR4OXFHVDlXcW45SVpIa2Q3ZUNy?=
 =?utf-8?B?ZmdxUkxiWHhlZFk0RVNRQkJJbHZEdTZEeExlZmk0K1FIQ1ZFd3l2RnFwV2pJ?=
 =?utf-8?B?N1hoMlZWWTRmN0pZMVJBU3d4aDBJN1h6VktNUGRBWUh2QlVyMkFHTm1mMGMr?=
 =?utf-8?B?YXhyT05XUEVxRm5Ib2ZCR3IxeitHS0J0NkVVZ2tkRVM5RXRRNHh1V0x1Yk5q?=
 =?utf-8?B?N0tDaUpPVlRRdXRWR0dMemNmR1QwNzIyNHlBWitxcFAxQ3kzcEhQRHE1UEV0?=
 =?utf-8?B?blBBUS9melgyNmlQWUw1anE5NWN4azZEWTVCMGdMejNUTDRKSjZtZEtRakpm?=
 =?utf-8?B?M2xXeS8vdVJNS1JMVzZCamxtNEhhTjAybVd0Z0Vvd0Z4dU0vZU1OdWw2cFl3?=
 =?utf-8?B?SmpCdDFsN094akFHWTM5WjVpbGhuTmdJTCtFZVFlR3pCTC9jWjNveHA1MUNH?=
 =?utf-8?B?c1Z4MlBvclVtbUdVaGJTM3ptSHJiMzdPYjVpdWRSOWFqS0lFd1IxQ0xwZFZa?=
 =?utf-8?B?Wkc5NG1Rb2FsQllpUkoyWlFWcDBFVGRKUjFReTIzOEJESG52RytmT3VoNElK?=
 =?utf-8?B?aVV4d3J0cEdoNEk3NDdoMnhuZkd4bjBua2w2SlY1VnErOHpQdG9LWXFmSk9I?=
 =?utf-8?B?RVBFWEdFNXlKY0JLVkJJV2hSZ3NoYVJnaG1jOWJMRnkrS084bXd0bkM0M1lq?=
 =?utf-8?B?cXNBQ1hFUmhjRG9NeTVZRXN1NjJHWDRDbXhOMWxXZDNULzdlY3VVQWRhSHlt?=
 =?utf-8?B?TUdra3YzZDlONGh4ZmpzbzBhM3Z0TnFWb2F5RUNBenlUeG8yU1NpaUx5bHdu?=
 =?utf-8?B?TGdYaVZtTXNLMUZWcWVnaWRrZjZTK0JyS1p6Q2Y1YVNHZUM0cWFNVEZ6ZldW?=
 =?utf-8?B?QlBxbkJ1NXo3U1kybElNbk9ZWmpVRE84MWdLdUNTa0MzeXRZUHhGemRyZWNW?=
 =?utf-8?B?cmp6N1owVzQrOTRtazZ5SUtaRXBmcGZqVlJvOC95MlNPQjBvRkxyRDNjd0JE?=
 =?utf-8?B?UHZMYW00WXBPM2JwNzFyWmhUbWE5WWNnV21WNXhUZWxTaFdEREZ0a1lZdjlQ?=
 =?utf-8?B?NmpZWnlHNjAxWCt0QVNsRzhLSllWSzREc1NNZUFobmozYlhBbzlRcW1SVzZh?=
 =?utf-8?B?aTVXeHVreXB0UkJuOGRaNlBqMVN0MnZ4TXl1NFc3WDNkSjVQWUkzMVdKVVpy?=
 =?utf-8?B?YXRqLzRTbWc3R25OMnA2NmtNZ3V0QytYQWpxdVpkb1hteEZ5OEVPbzlXaHRV?=
 =?utf-8?B?cTVkelZsSXB3bG1Lajd1b0FaWXlnSHBVR0pocDNHY3hUYVNrc0VnTllITUZW?=
 =?utf-8?Q?ZaTNqumPd4Duh6nk=3D?=
X-Exchange-RoutingPolicyChecked: Iz30+9NQe7dNtjH5NZtQZZVHGvSXNjkvdLHRjC0V0fC0NFXhqP9o1ISnYxmcgOJ0Z79jBdQWR1hgXvFUoHIRO1zmjiBLWd4NbUCHORH0qJnQCYEGzqfYW8AHVluYlh1QubIOsufWMDSO2Qz8WHrzI+EbcOsv5ZQCQOjedvUAgelInx1GNX2D2YuTisi84Sw/V3J8ggzIxYaisua86yIP/IFoDUgYCK3RBBZPuhgf8VwwyJ15hGP7zaHTrzl9lvO2vj2LqFftkomZkiEhB0A0NVGZgyD3vwYitnhSsSbqUAdpcgXwEjj3km7gwMsCy1j2TcCalQqlIO4mm86Ye34O6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0801b904-32a1-4e48-70f1-08dea5cf4be5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7140.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:11:28.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Rhdx3RRh1vNpL+hrzQ8jVKgKO12Bbg6pMZ90YqGYEjgWC4PJdfu7bTj0rQnRpMF3TPMS0nytgIVbfLWEEeDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF92ECB6678
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


On 4/23/2026 12:08 PM, Varun Gupta wrote:
> Validate that madvise ATOMIC_DEVICE allows GPU MI_ATOMIC_INC on SVM
> memory.  The test creates a fault-mode VM with CPU_ADDR_MIRROR binding
> over heap memory allocated via aligned_alloc().  After setting
> ATOMIC_DEVICE via DRM_XE_MEM_RANGE_ATTR_ATOMIC madvise, the GPU
> executes MI_ATOMIC_INC through the page-fault handler which migrates
> pages to VRAM for device atomics.
>
> Also adds the shared atomic test infrastructure: struct
> atomic_data, atomic_build_batch() helper, timeout constants, and the
> atomic subtest group gated on VRAM and fault-mode support.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_madvise.c | 110 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 109 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index e79cafbff..1f4fb16b9 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -14,9 +14,11 @@
>   #include "igt.h"
>   #include "xe_drm.h"
>   
> +#include "intel_gpu_commands.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> -#include "lib/igt_syncobj.h"
>   
>   /* Purgeable test constants */
>   #define PURGEABLE_ADDR		0x1a0000
> @@ -27,6 +29,11 @@
>   #define PURGEABLE_TEST_PATTERN	0xc0ffee
>   #define PURGEABLE_DEAD_PATTERN	0xdead
>   
> +/* Atomic test constants */
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> +#define QUARTER_SEC		(NSEC_PER_SEC / 4)
> +
>   static bool xe_has_purgeable_support(int fd)
>   {
>   	struct drm_xe_query_config *config = xe_config(fd);
> @@ -768,6 +775,96 @@ out:
>   		igt_skip("Unable to induce purge on this platform/config");
>   }
>   
> +/*
> + * Atomic madvise subtests — validate DRM_XE_MEM_RANGE_ATTR_ATOMIC
> + * modes (DEVICE, GLOBAL, CPU) on fault-mode SVM VMAs.
> + */
> +
> +struct atomic_data {
> +	uint32_t batch[32];
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +};
> +
> +static void atomic_build_batch(struct atomic_data *d, uint64_t gpu_addr)
> +{
> +	uint64_t data_offset = (char *)&d->data - (char *)d;
> +	uint64_t sdi_addr = gpu_addr + data_offset;
> +	int b = 0;
> +
> +	d->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
> +	d->batch[b++] = sdi_addr;
> +	d->batch[b++] = sdi_addr >> 32;
> +	d->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(d->batch));
> +}
> +
> +/**
> + * SUBTEST: atomic-device
> + * Description: madvise atomic device supports only GPU atomic operations,
> + *		test executes GPU MI_ATOMIC_INC on SVM memory via fault handler
> + * Test category: functionality test
> + */
> +static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct atomic_data *data;
> +	uint32_t vm, exec_queue;
> +	uint64_t addr;
> +	size_t bo_size;
> +	int va_bits;
> +
> +	va_bits = xe_va_bits(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	bo_size = xe_bb_size(fd, sizeof(*data));
> +	data = aligned_alloc(bo_size, bo_size);
> +	igt_assert(data);
> +	memset(data, 0, bo_size);
> +
> +	addr = to_user_pointer(data);
> +
> +	/* Bind entire VA space as CPU_ADDR_MIRROR */
> +	sync[0].addr = to_user_pointer(&data->vm_sync);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_MAP,
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +			    sync, 1, 0, 0);
Cleanup/unmapping of VA for given VM should be done in last
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data->vm_sync = 0;
> +
> +	xe_vm_madvise(fd, vm, addr, bo_size, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_DEVICE, 0, 0);
> +
> +	atomic_build_batch(data, addr);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr + ((char *)&data->batch - (char *)data);
> +
> +	sync[0].addr = to_user_pointer(&data->exec_sync);
> +	xe_exec(fd, &exec);
As mentioned INC operation happens with GPU fault, we can check if GPU 
PF generated before and after of execution
> +	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
> +		       exec_queue, FIVE_SEC);
> +
> +	igt_assert_eq(data->data, 1);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	free(data);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -826,6 +923,17 @@ int igt_main()
>   			}
>   	}
>   
> +	igt_subtest_group() {
> +		igt_fixture() {
> +			igt_require(xe_has_vram(fd));
> +			igt_require(!xe_supports_faults(fd));
> +		}
> +
> +		igt_subtest("atomic-device")
> +			xe_for_each_engine(fd, hwe)
> +				test_atomic_device(fd, hwe);
> +	}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);
