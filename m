Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BB1CFA749
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 06:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0212610E798;
	Fri,  4 Oct 2024 06:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBwtsWg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B553010E798
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728023336; x=1759559336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q/p7uln0+YviU6wuYaevaBt9sP4p1xG52GRBWcZlBfk=;
 b=kBwtsWg/1QnnnfevOPo4jtqJFG9wVsEHlej/fnusrPJHjPgeBLDUaV0o
 44wZWRvKMYie+nn97pa1CRSKYCxSi6JgvBn4tLr3X4FsLBDiFS/s91HiM
 QWmvFSE+KpxLuut1gYxFcjO7lKQNqe+H6NcnFF465umQoDHa/L9P94H9s
 qehPtnhWr3MEqfK4v3/4mVQ9djyoglUCmOfgVs0chIgVauHvDvYnKYYVW
 ElPp8ApYN/Ws9al9B/tlH8yrXVTSp9nY/wL3X+2mhlj2d0hEDHO/wWsGF
 Ts+YCbKDgmg40XE1tkgf+8g/gK+vi758/FH3/dgwVFGfwqKyFVNuKgKvB A==;
X-CSE-ConnectionGUID: ivpuvkUmSxeghfjqlHQRsA==
X-CSE-MsgGUID: 9GqU/noDTV2V/MUFmUS9KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27323796"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="27323796"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 23:28:55 -0700
X-CSE-ConnectionGUID: wZQQlMZ1QE+0tYjZyxkEBQ==
X-CSE-MsgGUID: rwuJpFJEQoGcQuLf/sMgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="74605634"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 23:28:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 23:28:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 23:28:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 23:28:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 23:28:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN5upCAo2Sa9/HGiRt8YM+WNGu6AQwGHXeYlnUo/usTPpGH9bk5MLuut7Cj/+ybkjHhvx1mBcOG6pWoCSoMWYZERB7R9pc5Wp3QHZdgekkC30d/HkZkMSgr9uRuZARhhWq55KjfFUF/vz/B8JwwRMk/450DS7Bh+Y0WN3aQSIoqbvNLZzU/kqPrEeSGO7HgoHggx8H48prCz97elMN/N1yKsfCxdNieXkdbCaU7q8ts7z0qLTTXvMmHE9QGribGfKezteKyLDuymn8RvY2KsDlDxOvA7j73pghtbH4yoz/rk6FJ10mA2/CF19Y42b597Dpc/wT+2/PSfvsegi4MNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZkiNuue5yX/e6ZYIbWFPRELVEyiw/TSBaRaB7nRf94=;
 b=FV/aYwMM02tOkn/opq41F6F3Prf3zGi9y51So75wmD+SWkq2zZfJW21kk8P2DcVV2fqZiQIfu74Z6xZdAnfXPswAOaBkKlyArN/wfikobf5N67lsX7mNifChzqDudmnde85BwjHmJaZXvwP30W/zUNYYEQ8TiKJdYkKGdBkWouKD6RDbqNqYVYxAYDcehmUb4eU2Dg/QNKRKq24u+rC9lkU5rRrgPgfB0PlvnIrWysdnZljK6llcplfv/cL6Tm2dijm5BPEaqORxmCEs4LEyfKaHpD7EY4W5mR9FlKNuVwAJsmnNb6631sHC3qOprwyOGhF4ucvCD/B7sbLL9rx2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB6200.namprd11.prod.outlook.com (2603:10b6:8:98::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.18; Fri, 4 Oct 2024 06:28:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 06:28:50 +0000
Message-ID: <45f132f9-aea6-4718-be28-f9bd8aa39b6d@intel.com>
Date: Fri, 4 Oct 2024 11:58:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: Skip on igt_power_open
 failure
To: Jonathan-Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
References: <20240930232720.1496539-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240930232720.1496539-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8c4c9e-d3b4-4b81-2ed6-08dce43dcf80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0x2QlNyVHpSQlhsSDd0NmtESHFLZ05ZTE1FRlpXbUtWNUFNaFc5YjhCcllZ?=
 =?utf-8?B?SExGcG5LMzJWd21KRFhZdElHRzA5anU3ZnpYVm04Y3JoUUp6UTBTdkhkNSt6?=
 =?utf-8?B?Y1pMQjlzd2VVMkt4M3lDdy93QVcyY0JrQkQwT0NvYnREbUdWYWhSb1d1eGUr?=
 =?utf-8?B?TzB6SnFsTUI5MGhkcmdOdkdUVEpsTjUwamdneHlNYjBVeldveUFuNEMrbVA4?=
 =?utf-8?B?WDdkQW5YZnc5OW11SnFWQUFTNHNMcUQ2N3RtUXVYL1U2bWhRMjNsaXpUSjFR?=
 =?utf-8?B?UUMvYmZETG0vWklQckdlWnVNYUVUNHg1cGtVMzJDbE01Z0pjVHlXdHhqMDJo?=
 =?utf-8?B?VkpRTFA5cktDb0RkREc0eGwraUJxekF0eU5hcWxGNG03dDJOOUNyanBvLzFW?=
 =?utf-8?B?U1c5cThmcEpYemxuUC9xdzQrWUp3QXpBV2VMNEdjS2lnVlQwZ3NkRERKSU8y?=
 =?utf-8?B?SnNUa3A2My9wUnQvd3c2dnB0RmMrdWR1ZlhLZWlqckRONlEvUGsxUTdBRUJn?=
 =?utf-8?B?VnhZK0JKV1VtTCs3bWxCbUxNbWNDK01RR3pWS3BtUHRKRXdjMnZIMUZpeGtR?=
 =?utf-8?B?SDc1VGR0ZCtvMFplc3ZwZjNBU1pKMTZMMG1oenVoNEgwZFo0VVhJUThmWGF1?=
 =?utf-8?B?eVhGRGx5dUJEblM5alNKQ0JIZlB4VmVVNCtSMEFYSXowTmJZYVVDbFozSUVD?=
 =?utf-8?B?VUMzaGxQa3JURnNlc2pKYW1pckxNa2xjRnNLNThEeW9WNTZ2QTVnM05KRENJ?=
 =?utf-8?B?aVlCcU5Ybk50d1NRRDFYcjM0RmpGY1hDSWdUY05Zbys1amRJTC9ITC9lN0pi?=
 =?utf-8?B?alAzMFUyOXNMQjIzVGFXemtucVFDZnNkd1RhU2c4OVpXQndXa1czNFRhT1JV?=
 =?utf-8?B?L0hZTld2YWk3MzJoOXZDOE1PSDVXVkt2NDh6M2hzblBlMSt1R3BVVDRGR2I3?=
 =?utf-8?B?TTExYllmQy9lRDloMlAvaThIOHlpNUlDUGRkUDc4WHFlNlFwSC9VZXRXK2E4?=
 =?utf-8?B?SGQvOFZQZFU5UjBCWGNrSEF1RUdZc2pWVGoyc2tQcmtib29PME4wMFhreUlW?=
 =?utf-8?B?RDN2bkt6dzRVOGtlVmx1NVFKUEV0VVZUSTVzSVZPSS9lSWdmR1RReTJsS2E4?=
 =?utf-8?B?NUw1Q2VEVFB6bHlTNjlHenIySzJBKzVMajQ5eXhoMWFCd0tpMWdTSWt2c003?=
 =?utf-8?B?RXpPRzM3QUs1d3NKVTBrbEpwb3d4dDdPcGtpamZGakxtdUFMeFk1TWxlY2JF?=
 =?utf-8?B?bklOaG9tM0tCZ2lxQUtEVnRqV2wzUy9HR3lRazRGMGpIUmlKR2RnRWExMnRX?=
 =?utf-8?B?ekVSVEphKzlZbTdqK3V4Sk1CcDB2a2xhUmUzbTBaSE5GNXZHUXJ2Y1cyNks0?=
 =?utf-8?B?T0s3NjBhcDFiTDVDYXBBa2NUOWNySGhtWGdFSnVxQnBKTHNFZGRseGs0blkx?=
 =?utf-8?B?MXdKNmdVcFo0bWd1T0VkMXlvZ3F4R1dWQkhRQ3FzY2NTMm0vSjRFcCtrWFZr?=
 =?utf-8?B?WXh4Zm1DVFUzQjZRalZuaEZhOXhuR2crUTZ3d1YyK2pIV2ljblRUNSt0U1V3?=
 =?utf-8?B?Nm1JUEp2T0FsYmsrS1B0eG5KRUZpcVRVQ0UrSEdqRkFUazlHTkwzWkNSU0N4?=
 =?utf-8?B?Y3VUR2FKQlhOd3V1U3QwSFN3emROQm5PTEdGclVyRHhxQy9DM0lCUzRoRjJO?=
 =?utf-8?B?dmtkSTlQRE9jMEI3ZVBtUkZDSXdxWUNrZXQzcDViSnV1YWNQSEwrSURnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRZVFdsTm4vOHJaMlQ0MXh2bzBKOWU5SGxGbmFla0o5N1ZqYzRhUVFFMzE0?=
 =?utf-8?B?RzhwM0o5OVRhKzY4a3ZqTVEyZitiaDYxSjNrTmp6RnUxaUwwWVB2a0M0U25q?=
 =?utf-8?B?MUNnZnBYeWtXZWFHWllPbHdYYTcySEh5OGFYL1RoZkFpUTNTTWxXZms5WDhl?=
 =?utf-8?B?V0NJUjF6NzhTSGJqMjQrWXk1cDZuRDMrQlhET2Z4RE1WbHA3TkExMUk5TlFh?=
 =?utf-8?B?Z0NvNFRCSDZwZGxaTVpJODc3MU5OZnNPSHREbjdEL1ZHQWdJa1k5V2JubHhD?=
 =?utf-8?B?a3FUYjdpL0RVK1BRS0xrS0NYbFVKdFV4ejV1VTJWUmU4YXNZY3BZR0NSNmpz?=
 =?utf-8?B?Yy9wc25ybUcvVDJNN25BQ2U2TGxGQ0wzekdQTHBFOGJnTlo4UG1pY2V4Tktt?=
 =?utf-8?B?dVpjeHo5MnllaFArSFhLcjJvbUE5Qk9JL0NuWVI4RVgvUDhCYWFQejNuWHJq?=
 =?utf-8?B?b0hubVFGZGtKN085STRLWVJaMjY2c3lacDJUOW1zaUJycGd6dW8wbm43WEVW?=
 =?utf-8?B?UjY3eGRiOUN4dFFpa1gzS3E1d2lZWWZ5ZlJRZVlQdHhNNUdpbVpoTFNWL0Vp?=
 =?utf-8?B?QVNnMENXNXg2WE9xMFlGM01RdElMcTdVVmEyc3ZnZklldDBZNGRVZXhLRlRY?=
 =?utf-8?B?VFB1SHdEcWRzbjJyOHljQ0lRZ2w5UGQ5NDU3WVVoOTFMa3dnSGdMU29BejFF?=
 =?utf-8?B?TTVxb1A0K2NNSGtDVEd3L2FsbmxsSy96SElWeWhKRFJ2MEtITXNjQ05UR0ds?=
 =?utf-8?B?WW9vcElMdEFOK3NyQ0ZNaHdYOHNneHpsSnljeWE5SkgxaTRGYmFaMUVXT3ZI?=
 =?utf-8?B?UmpDZVd5Z3MrOHEyQW8wWDJ4L0IxQWwxUUtpY1duVmFmbU9TcUpnam1UeTc3?=
 =?utf-8?B?Z0VML2pyK21zSE4xbnRwQ0U3VVpuQW1JcXJmK09qWm1mL2Vkdk5Ga21uK3di?=
 =?utf-8?B?Zld4Sndoc2dtZG1DNGpWU0dSN0dEMG1kNFk4d0VIMWozMk9Wc2Y3SHFoRkMw?=
 =?utf-8?B?ajJ1UDE5NU5TY2dDTE1Xc1pka0U5Z1lXTW1FYW1Pa3h0SjJsN0sxT3FJc0JJ?=
 =?utf-8?B?NUdOYVgvU2tEbVQwbmtaSk1IK0lQQ3lYb1R1MlBzQS94MWZjR1E5WEYxc205?=
 =?utf-8?B?YVZFWTRwSHk2TURLK3lpUEZ6UDBzRi9wODhhSjFNRXZjdzFER01MQlNuNEls?=
 =?utf-8?B?QnhHQkpPNG9mVnlhL3RkYmE5RHFXTXk0VXVOOEpJY2UzVGR1QVRwSFZycHI1?=
 =?utf-8?B?N1JZZHVxaEg4M2V6dG5QbmwzYUhDQy83ci83VTlwV293bUpCV3owaFEycDcx?=
 =?utf-8?B?ZVVSQ1diYnAvSy8wNEY0VElQakNwcXBDa2k1bkw4ZHU5MVA3YWEzOWd1K1po?=
 =?utf-8?B?UUtiZXVVZDFnWEhVNmY4NmxoZ012TklQSGU0aUFHTy9nWnZHcHZxckNaSmZC?=
 =?utf-8?B?SHhiSlpLTzVDRmJTano5QUhvRWx5MkR0R0FxMHVGZlVFUHd6azUyOEx4aUY0?=
 =?utf-8?B?MWlsZG5VU1RJVHpzWE55b1dKbDJBMk9NT3J3dkNTMGtvNEhXY1lSdG0vRFlm?=
 =?utf-8?B?OE0wQkFzd0ExN1M0NlgwZ0pXOFROLzZ4UDR4aTBQRXVqNHdCY2FxV3JlWWVE?=
 =?utf-8?B?dzhHR1NKeGg5WHhwd3hqY24zQ2sxQ1RTVzJiaDJNMVVJa0RtV0wrWjFXRjgr?=
 =?utf-8?B?elE1Y0N3NkR5Z2Z1STdMZkZMTkM0Vk1CZlB2NElBUWVka2xPY3dYUDE1TFJV?=
 =?utf-8?B?Y2NoM1krK2tBOU1hRURBN0dqbmhNeTZpTE00cmh6UU5lbDM2ZW1STHJmU21k?=
 =?utf-8?B?RmRBY0RlRDB6YVpNbG92UWFTdFF0dThYekx3akR3OWtoTWg0akNYVGY1cVRS?=
 =?utf-8?B?L2xrOG9NWFZhTXUvVEVuSFpZRWpaTzcwYnhhVnJKazAxV2QzSDV1QnFpbnp4?=
 =?utf-8?B?WUlKTEszUU1vd1haOUhMTU5CYXUyaG54N0pHTldqSlJjOEVSZnNoN3Vvc2to?=
 =?utf-8?B?WVk4Y1VQalBBMVhoQzJtQmlXV2IrRWRxNC9EYWF6RVh3cUJUNjhRNkRKREpm?=
 =?utf-8?B?YVhtUUdNQU5IMGkxYWlYclhsVFdSMlJRSFNNUGxVMnVDM2o3elhibVlzSTJx?=
 =?utf-8?Q?TgzzWhpSrSXeBLYIR4YTHtjix?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8c4c9e-d3b4-4b81-2ed6-08dce43dcf80
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 06:28:50.8789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fO+FVCGco2BQCiQIsq971+smZGO23JuIgyaiN9/0knc8z7LoUqploi6sZTV/9PLAVj7JvqmxdZRAii64req8cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
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

Hi Jonathan

Do not skip the entire test, check the condition before assert or
for the power check.

Thanks,
Riana Tauro

On 10/1/2024 4:57 AM, Jonathan-Cavitt wrote:
> The xe_pm_residency@toggle-gt-c6 test fails when
> gt_c6_power >= gt_c0_power.  These values are reported by
> igt_power_get_mW, which will always report 0 in the case that
> igt_power_open fails to open either the hwmon_fd or rapl.fd.  Since the
> expected result will always be a failure in this case, skip the test to
> end execution early.
> 
> Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 0e687558b1..36ed46cfc5 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -276,7 +276,11 @@ static void toggle_gt_c6(int fd, int n)
>   	int gt;
>   	struct igt_power gpu;
>   
> -	igt_power_open(fd, &gpu, "gpu");
> +	/*
> +	 * igt_power_get_mW will always return 0 if igt_power_open fails,
> +	 * so skip the test in this case.
> +	 */
> +	igt_skip_on(igt_power_open(fd, &gpu, "gpu"));
>   
>   	do {
>   		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
