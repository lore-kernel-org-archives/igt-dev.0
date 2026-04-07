Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F105FEEF49
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 14:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B625F10E093;
	Tue,  7 Apr 2026 14:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1mQV8sl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660DD10E093
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775573523; x=1807109523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ur9j+bGcir4DyCjwhEV6TEbdpFm8HQ9Xu4bQogrJ+Bk=;
 b=D1mQV8slekrd2OJgX5yySD/5nm9w0aNMQj4uqqzgqMRkpEHG+8oOzTvX
 6byt1MkEKFlxuBB7wj6Lpm0EqDd4H7yqkMx0jhzEcsCxOkvYxKbeFCWiK
 9LakV1APG1ANH1tu/zQWkbKZUHKG/fW3EgjXP4eLyzR7f1oBMg+ime87c
 ZUlPnebkkNqT4Wq2eiH83Nwa3eoFEpJKXffE88MdTbDChyTr5gJkwheI8
 mEXxfGTxBwE76L2u6/LeYK097uRrf3nMJIUptiL8sOtHvWfUtQHYrwYCj
 DgfGvdAyhcXn9GH1a0Qr5xSc9c//0ANfL/Z6zqrw6zaJCzPZX5YXL1yII Q==;
X-CSE-ConnectionGUID: AqQ3pZG7R5W/AAzbOqeqAQ==
X-CSE-MsgGUID: Igu4s1zUQ0C1XlCGZucl4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76609554"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76609554"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 07:52:03 -0700
X-CSE-ConnectionGUID: YC7dRlHfR7etzCy13Uctzw==
X-CSE-MsgGUID: tyr5U1ofQ5Sbabfb5tKGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="227182097"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 07:52:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 07:52:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 07:52:02 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 07:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVrTfaRPjUbrGd58CbWDtNWsTYHJxBsJBEL/adzJAFqyQRAkGxREIOFLSBIiFGvvI9k1U55tqBmO5dH9ffjszReqteZ1qekNetlH+rMaZ7qLDTCuh+GFO8Rm88zYSSq4NCX+bu8QKg+35dtzBDILhl9RTt60n76zkjYAaD8JK6T/VkAKAMIW9B0x/jpoa5Ib5usrZemS7Yz+xdMvzVHAuAv0wXcilfui7Pf/kZ9tK/BRozzNIlg4AGVqnaIt0AjbqqSuKVnUkM3esPQbx7leb1xhCeWzh+BXUnU8U9h3LLlpgujl9aOSf09XwUf08bn5Fkr0TNQ8+IHHYuwWVxTQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz7+iY/2EUgnPvLS63uqUvXu46tTffSQkBJ5sv0ELLg=;
 b=fnCCzUI8eRAqXlA5QTYn0GPmsJ/5CUijcCR1DKKh9vQkaWe42PIvBBktZq/pyH0HI+TsBE8ezKowQYLhE9H65850qZ7wRQtvaEPlj9jb312OP9dGncebqAq/J8z+IHvGjKLeP5hw6L8bGNis3L7Vtcd4y15kWXqM3t9R7RQS0lBbGOpgFaF9O3t+CsUViFhEY+7GMiQtVRz2LNnGE+S1P1GBTi5Y0fiSl8cIsLvOWNvmNxUZ6xO3nTR/6aNJtx6XpmYrY04BJlHuBa3E7xE/ZgI4YQoGVAVv6nwqTumH1QxipYoOilNbPB4dVNbMUFMV8YUh0AQmGnf1Cam2+D0Agg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 14:51:59 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 14:51:59 +0000
Message-ID: <1ee02fbb-b190-4b35-8fb8-e9e9cfdeab6b@intel.com>
Date: Tue, 7 Apr 2026 20:21:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 7/9] tests/intel/xe_madvise: Add
 dontneed-after-exec subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-8-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-8-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::7) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aedc3c2-6a78-4f52-69a5-08de94b53860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: lUINWYvgMFAoOFv9Hv1XaRMahEaUeOrimjLA83cYQ0l04uS9bqf+8HA6tuKjItrndljj3XCu8Gr+ihHe+FjBAwkk9gp6B3ei8IGnVcjejbDK4QSRTvYTDlt9p43yxBhr8GAwABTpcMNcCGqX8hDRrkxOoE9C8+P+PPNVmYMAND/sICyU1bfiEaDhfPq78luldQH2+vild5r9YWnVB2hf5X+7g6ZCQ176FtKcPfKqYDcVouI3fPY/Ic+UzUwzE5sqwHicI8qeHevruaiK0FFAUaJn0gaUaJ96HaWiehA3HET4Z8oL6TlxJFv8C3pUH+qO3gLS4SaYRNA4JlHxfWL5PQCmeSQibDL32WOc/xUSMLJpaZXFIdj/a8P8LA34fGXNf5Mgyq8UxynRnbOOHFTQEPW7R+cKpthXhlWvUk/ijBiVQGKfGZaenOrBidHXVebdTcO48rG54Hh9vr3fk5W/1wvTNg+2Jfwe79mn1U/55fN1Gs7vqGf1XjBNoDSo/G750GPd1cXMfIKkXcRMyen5lIwoVeIB/fcbroWeCxL4JH8BjYmRm+8jKJ4+tlnAF/N7eyKv2Wca/jBMEyUGOrAjlzdnbpT6cNhnzyzC+gf4gCbYjoSBCe5u49Az9NE0taWvACVrUcrQM4VRcGxiZdOvupqfMipg4N3KmR18LgyX5aU2i2CORWoBIWHIT6C+FTSr1YjQ6pz+FGguHM4L7p81A5p/YSyo3zvVxc/PcUnHef0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlhZUwvQTFwakhRY3lIejlZNGJEWFEyd0tTT2xyb0hibDlicTNyek5uM1Zz?=
 =?utf-8?B?RnVtRXZCRVFucDVhSit1aC85OGhhanVib1pEeUNFVlZoYUNuQ3VnakNKMzFF?=
 =?utf-8?B?QWVKRmlHcnBaOEZHQUpXYzgrSlhDUlN4NmNkeGlqaVJaOEZhVkRUMXVwNTkv?=
 =?utf-8?B?K29vVDZOazloRnc5UUZlaXJMd0FyU2xnUEZQQjEzWFUzdU1Hc3NHdmhzR2NI?=
 =?utf-8?B?bDhrTEp4eUhFMUowNTJ1MGdrT1VlOERDNk83YVgvMWdYdUR0RDZqTk4rVDFh?=
 =?utf-8?B?K3IrMFJ4bUppUnJoRlFBZFgvaGNOVHRLVzgzUVdSdTNGSlhSMXhjUVhTRFhk?=
 =?utf-8?B?ZFFic2JlMW5NNDh4K3hoMlRCMURoSXdVODZiN3NmOGFPUFg4aHYrMTJETVBy?=
 =?utf-8?B?OG51RDVyVmZJUjYxT1Z0UmxuUTZiZFJjTVpVREljQ2JoK0c1anFpN1JQcXBh?=
 =?utf-8?B?L3pubmo5aGpRaFNlUCtRclE0Q1RSNzArZVNWelNzVEVHamxsUWcySDFwSXFM?=
 =?utf-8?B?N0V1d2IvZERMazEzcU84c0ovTXNqR2dHVi9oRUc0NkNSQzhDTlJabmprTVZU?=
 =?utf-8?B?WXMzb2ljamcyZUxRbUc3c3dpN3ppU29WU3JwbWpPczcvRlhZL1VZdnpwUiti?=
 =?utf-8?B?MjZCV0pxUkNBRjBGOXFVN0VCS0FubnpxZVRhMkkrOFlMeXdVc1lJOVliWitm?=
 =?utf-8?B?VHdSMnM4U3YzcFNuZU0wdjQ1WUVxQW9sL2JkQUM0alJLejh6cnVaUk1weXJ6?=
 =?utf-8?B?QXN2UU5HaVJJdWFNZ0s3YTAvd1hFMFlWcHl2Y1dSQncyY0MxZVMvbGV3VEhy?=
 =?utf-8?B?N0RIQkRhcVJpRmt6RENrNEIvQ3ZKZ2l0Sm0xTHcxRnJMcEFDbC9NelR1ejdV?=
 =?utf-8?B?em5FLzJGdEpnOS9zSzJpTDhXU3haRFVlVXRUeGJ4RUtXRTBwTHE4MVNqUTAx?=
 =?utf-8?B?dTEyM3J0UjN2OEVHU0dUaWlHNC9McUFVTTA1K0JTelFNM1ZhLzQwbUtuUmhj?=
 =?utf-8?B?NnpndG5SVklnV0RNSUlLTVhTQ0pLOTEyY0lhajgyK1lhbUhteTJ5eFBsUEYw?=
 =?utf-8?B?eHNjaitBNjZqSGRWTDRzZkRzMjVrWGNMblhKUCtoakUxWWVkRUZJMmN3NzEv?=
 =?utf-8?B?a1FKVXdYcHNETUlMMTQ1V25rUXhoVkp5aklQWGlkdmNxRU1mMERkMXBCcFJa?=
 =?utf-8?B?TFZGZ29ab2IrYUJSYlkvNDZ4YllxRTFXb3BtbWtMaTdyY29VeDB4YmJXeVU2?=
 =?utf-8?B?UWsvcUNtRk9tWFdLbmxTMkdCSUxJbWVmbUovUHZvbWVva3NrZHlVZ1VzQ1Bm?=
 =?utf-8?B?MklkaFRhSFlJckJOQ3FSRkNMMnNPdWFpRTZRZC8rWVFZQVEzTDhqVzZXMVAw?=
 =?utf-8?B?REJoYjVpS3NyUlNMNGpXQUFyeHdscFEyODFTU1VNUGM1RFdrYVlJRy9vT1Ni?=
 =?utf-8?B?RUJGQ0lNWjZuNllJOXNLZm1HVHByUzVUQVFVUFg2bG1MdmR6cGNZamZ0MTEw?=
 =?utf-8?B?bWVqZ1hMNFlXbUF3amJmUU0wVytCRkZVT1p1NXRPQ1VMMEppUVYvYTF1QUtH?=
 =?utf-8?B?Q1BEb3ZrSi9WT2E3a0NkQXY1a0N0bENiQldYWkJVVHM5VlJKdWV4MlZ3dHAx?=
 =?utf-8?B?M1R0dWIybk1yeTNtVHNyQ3BPUi81ODhJc24rVnJuSXRXajBRWVF0RDc5R2N2?=
 =?utf-8?B?Tlpzckhsc2NTWDlmalptUm5QZVJYRUR3SGtkV2ZvMUthd3Z5WEt3QUtTSnM1?=
 =?utf-8?B?dk5tZEgrL2dHTlBsaDk2Nm9URUxMWmdsclpEQ3ZkUGNrNjU0TGhxQ0E2Q2pG?=
 =?utf-8?B?YVBkakdJS0xkRFJTT0pralZQYXVXUDRVeHlFT2hOQk9OYU5XSmt3YnFWcWpl?=
 =?utf-8?B?NjRlVWc3dDFkR3JiOHVDNFF2N0VQVXdqRTAyUTI5ZklvSE5SRTZKOVZGa3da?=
 =?utf-8?B?M2R5WWdCSlkyMnVjbXZpOUR6T0FqVnRNa1ZCSEUxVXNnbEZmMklpM2oyeUdq?=
 =?utf-8?B?R3Z5bGNVSWpmOGN1L0NSUlIyeEU2K041Y2hMMWhqdFdkc25udVhjOG1MTzNo?=
 =?utf-8?B?dDZKMS9YRGtoUGVGU0hBQXUrUm9xbkMzS3IvZkdiQnR3YXJpYlhyN2tLTzlO?=
 =?utf-8?B?b1lQcXFiSzVkL2swQzJBTEl2dGVCQURmRkpiT2xya3VhUFN2Z0pGdkdUVVZL?=
 =?utf-8?B?T3lGVzduTTVNRWlDTGNWVWk0Sm5aRWl3dVl2alVYR3UvK1VUQVh4K3RTcWY0?=
 =?utf-8?B?UHpvN01TMnIzQ1dTWW9SRGliUjloTkplTTRXeVlUbjliSUhJWmhJU2k5WlV4?=
 =?utf-8?B?L3ZMc2k0cEE4cXV4MFNqM1RCZFVDTEZNeU5iYUFsOWhvbmthRkp1TU5Pbkdz?=
 =?utf-8?Q?fkqEFQcx56AZ/q1U=3D?=
X-Exchange-RoutingPolicyChecked: H15IyOoOL2D+b5CN06oMohyloQiHil6glXc85Zl+xmrCLgNXyLY4/8IQRrXDvhbU2upetzuV+ydLjbhjQeY6u2besJ3BaALekxkPfHD6zEf8f/HALfyb12cMHEHv/AYyQhjiNUxaPZrqyZ86KO+1obQRAno7/ULBii/1oguFRGQAUlM+STf/CG3i12fzIUNA91bbCcgZCfagh6R0LjFSATdvapDhNZoxvzsaqUWFdlSJtVY53kzQyWuhTYwC4FJb6l2cdouVm1SV+vGBkjsVMIwy/OTNxFqO1Fc4krCdsMksXs3QMWjzUdTfPhvjzT2G5XNjnNDlwyR6L4rzl6KY+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aedc3c2-6a78-4f52-69a5-08de94b53860
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 14:51:59.3391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf6FPcL47RGVUCAnJJM9KRNQXjyhKRaQB1retiBtSAPDt9hmv0AemXzpr3xFije1gzpMQcok1xHmCt2DHxwpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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


On 3/25/2026 6:14 PM, Arvind Yadav wrote:
> This test verifies that memory can be marked purgeable and reclaimed
> after successful GPU execution. The test first executes a batch that
> writes to a data BO and verifies the result. It then marks the BO as
> DONTNEED, triggers memory pressure to purge it, and attempts a second
> execution. The second execution may fail or succeed with scratch
> rebind, validating that the kernel correctly handles purged BOs in
> GPU submissions.
>
> v4:
>     - Added proper resource cleanup before calling igt_skip(). (Nishit)
>     - Added assertion for xe_bo_map. (Nishit)
>     - Now using sync[0] consistently. (Nishit)
>     - Added clarifying comment. (Nishit)
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 108 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 108 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index d126db9ed..28ea81442 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -16,6 +16,7 @@
>   
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "lib/igt_syncobj.h"
>   
>   static bool xe_has_purgeable_support(int fd)
>   {
> @@ -444,6 +445,107 @@ static void test_dontneed_before_exec(int fd, struct drm_xe_engine_class_instanc
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: dontneed-after-exec
> + * Description: Mark BO as DONTNEED after GPU exec, verify memory becomes inaccessible
> + * Test category: functionality test
> + */
> +static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
> +	uint64_t data_addr = PURGEABLE_ADDR;
> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
> +	size_t data_size = PURGEABLE_BO_SIZE;
> +	size_t batch_size = PURGEABLE_BO_SIZE;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = PURGEABLE_FENCE_VAL },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint32_t *data, *batch;
> +	uint32_t syncobj;
> +	int b, ret;
> +
> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
> +				       &bo, &batch, &data, batch_addr,
> +				       data_addr, batch_size, data_size);
> +	memset(data, 0, data_size);
> +
> +	syncobj = syncobj_create(fd, 0);
> +
> +	/* Prepare batch to write to data BO */
> +	b = 0;
> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[b++] = data_addr;
> +	batch[b++] = data_addr >> 32;
> +	batch[b++] = 0xfeed0001;
> +	batch[b++] = MI_BATCH_BUFFER_END;
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +
> +	/* Use only syncobj for exec (not USER_FENCE) */
> +	sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[0].handle = syncobj;
> +	exec.num_syncs = 1;
> +	exec.syncs = to_user_pointer(&sync[0]);
> +
> +	ret = __xe_exec(fd, &exec);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +	munmap(data, data_size);
> +	data = xe_bo_map(fd, bo, data_size);
> +	igt_assert(data != MAP_FAILED);
> +	igt_assert_eq(data[0], 0xfeed0001);
> +
> +	if (!purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size)) {
> +		munmap(data, data_size);
> +		munmap(batch, batch_size);
> +		gem_close(fd, bo);
> +		gem_close(fd, batch_bo);
> +		syncobj_destroy(fd, syncobj);
> +		xe_exec_queue_destroy(fd, bind_engine);
> +		xe_exec_queue_destroy(fd, exec_queue);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
> +	}
> +
> +	/* Prepare second batch (different value) */
> +	b = 0;
> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[b++] = data_addr;
> +	batch[b++] = data_addr >> 32;
> +	batch[b++] = 0xfeed0002;
> +	batch[b++] = MI_BATCH_BUFFER_END;
> +
> +	/*
> +	 * Second exec with purged BO - may succeed (scratch rebind) or fail.
> +	 * Either is valid, so don't check results.
> +	 */
> +	ret = __xe_exec(fd, &exec);
> +	if (ret == 0)
> +		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
> +
> +	munmap(data, data_size);
> +	munmap(batch, batch_size);
> +	gem_close(fd, bo);
> +	gem_close(fd, batch_bo);
> +	syncobj_destroy(fd, syncobj);
> +	xe_exec_queue_destroy(fd, bind_engine);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -480,6 +582,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("dontneed-after-exec")
> +		xe_for_each_engine(fd, hwe) {
> +			test_dontneed_after_exec(fd, hwe);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

