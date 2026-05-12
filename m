Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C28CD343F
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 19:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A7810E5BB;
	Tue, 12 May 2026 19:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNOgdV6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B463510E5BB
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778613527; x=1810149527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PeaT4Al/FMUy/MTwPFnVcm2BZTLU5LA6aX7LywZxciM=;
 b=lNOgdV6wuP/akVdBbaUGBJqX/8dYct7eLZOaYUmUZpXY8CGcfaQS2gfN
 z1jPT62THTzHeflHQMXBLJeQPXo0CHWPwf8G3q0XvJaoSdMATImcG46q9
 1uq3/2w8aRxah7qAZ+ikXVjgVKl+SwiY5QBJBQIShKNofmQzLFpwTE2Pz
 8e4Drer8qbRfzRSQDFrlgu13rAGIzNkXEZ/odPWd9hovZyWKCuBT1G0wo
 NBQcrvjN7zLKA6Z39GA8aiFom9sXdkxK/XnxDRKdhcMsIITgY1eLbQhFg
 5n6AuCaxLpswPQArponO33j5sHtV0LlwC18LoXW3HHppHGdLCCLi1GoNg Q==;
X-CSE-ConnectionGUID: PIB4hjOsRXCxH2gH6XAsVA==
X-CSE-MsgGUID: uAWNtiUITVqCByDXd+VYlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89835468"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="89835468"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:18:46 -0700
X-CSE-ConnectionGUID: dkbslzYERFWADtuHwA489Q==
X-CSE-MsgGUID: SSGO15ARREm9EuSuoHAx5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="241870799"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:18:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 12:18:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 12:18:45 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 12:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN8KQU0+/oeza/F/abYh3/ZDiKyW/tiSZGtEOP5v/KXUOnTN0feWtxR1vWsPM2WrtGc8DofBh2QfIvc8KT6BsuZCP8a7WAo7SablS7ei1wqt8Znp6EjUoa7j4zBnPlyLTodiNQrUjqZoACr0uefVpG7xyFhp1Fxf6hWuyZtm5OjUG4cFpkcMg57VUr+cnNKwn3prqveMwoxTAyx639/IMINcd62XBrPkFsiYKt0EbIgpmK60px005rBj+EEHMggkYT0JsS7Zbelis4by8966tFxsXLYVVPD4AwQV6zcoBECJyrq9nXrbTxdnuEJv2WEZ+/yzFwFRmllQSEIzLE1ILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/GC+NP+xfV19vw1TkzFsdUexN+nR/vik9Ya94gh6eA=;
 b=lCuWkN9ygMZf0mhLSW0i6X5dhD/Kmsk8TSUPGAcbsXxRMepn8jfk7H9VWll5QgBCI0VnwkoEwE+QQ7L/vTPmn8tKezwFSiB7CK3Tcd+MryJa+1/5l7APKHD6eVMSApEb2TG/2WRdENWfkEvvfuhcVlaDEkFgDD50gCwpkZ3zbhaMJX5qLawL1n9QAyR1qwGFHMFz8//8Rf2kgK8AvqvoPIl8JEBm9JXL+5nLjbPyByAqbQNi07pGpsT5sMMvM8jgkGDyCFQj6/zl5Ud1KMOnw8gqQ7zFxXMBmDmYbqfe0BSjLX7g6S+PLk2p8sAbmQx9h2AQIC9ynK4lNb/HRscjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DSWPR11MB9715.namprd11.prod.outlook.com (2603:10b6:8:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 19:18:43 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9891.020; Tue, 12 May 2026
 19:18:42 +0000
Message-ID: <7225a744-f1e0-4060-a7ed-d11a38adeab9@intel.com>
Date: Wed, 13 May 2026 00:48:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t][V3] tests/kms_hdr: Add visual HDR verification
 subtests
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>,
 <kamil.konieczny@linux.intel.com>, <jani.nikula@intel.com>, Wayne Lin
 <wayne.lin@amd.com>
References: <20260507211330.2640022-1-alex.hung@amd.com>
 <a6ed9e4f-96f5-4aaa-8a46-659677ab0deb@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <a6ed9e4f-96f5-4aaa-8a46-659677ab0deb@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0264.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DSWPR11MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fffaa38-9428-4c84-6f2b-08deb05b4782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: cT3XG1Eykm+3gC2NSYr6m01WWCywlCtxQ/5D/+bWmwQxeEmM4pZXJnkGlpyK/+cpu2G5CEYDCBlOZs1zX0dP+NDvFHexZWrY0NI0cA18e4h1KX/HY/v6tbNWNnPTvLMO/gxqJ09rzhKiXULRGcdMQgMSKQDy9+R31BmCOVi/4/slaayrxKZ3KMRG00KZJ4ucI7o+3N02uSQX8cVqv4+MrrfcUMUkXt0caay0PPEok3hlEqa0j4MC9nn+aKivZ74igJbZfFc+N7Osj8/yDa7oRoM/MvizWdcYLDXWxWGJPUf68zjjwniVn7GKD7+3qxHKgUYH5PxLfAV8IQGcELmgbiDviyg/ltyqAS1Gw/AtyaUQhA/OQMJMnSUUIjvY7MyXh0s8rlraNx+7AWK59WD64182AYmG9yxdJHVIqm/xPIEjUZ0mTeiL01nlZnRRlrmH8ZxdHPw+iUrqro4VEYAxPzo0lfSjyaOxHTIWGV/f/n79uBLIZfSb9uHVBS3kNs50qwIGWtMIX0RJxo2qp4x3BDc/kvOl7YWx+liiOgUn6wmaL/q52t/OwoP3tecNkIVoijGSdjDnwMYYGn8JsDXrOTG5K+wKScXGUqlUz6jKu4Yy+xeEEo+7cVAxkJAOkN2l9F9ExZCcn97MNt2Dk/TnWwrosRcHtRnQsHYSPshMpbDJJCCwKFnsvWO7CeJ8K4BT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdiY040R0E0VW9PN1ZuM3JKT1RIV1g4MXJnUVN4ZW11SmFJVU5UK25TMjI0?=
 =?utf-8?B?SitNaE96WVdrZGJ2RjhNYSt6eU91aHFNSi9HNlZhWktRdWR0ZmxWQWo5S1JQ?=
 =?utf-8?B?Unh5bUtzYUJBTStLWW5ycE1MVHlnNEdsSVVnSDBuMkw5SVhhVHo2MVEreXVw?=
 =?utf-8?B?NmNTaEw2Q0VVMVRpSE1YWVc3WTlmaVlXeTRoMFpjSGUzRW5jbXp4bUxOWWd6?=
 =?utf-8?B?ejVjaU9WRlJEWDdVQlU5Nm0vVTY1MmxrTm4vUExMNXk2dHFRV0RYdTAyQmZ3?=
 =?utf-8?B?TWF5VG9zQnhIcXFPRXR2V1dUWUdmL1gyNyt4YVFkcngyTWxyc3UwaW15blNL?=
 =?utf-8?B?OEduaGN2eXo2aGNvWWFNcEs2NkdyVGJhYXZ5NkFkeWNGTkM0VWNlWHg3SUUv?=
 =?utf-8?B?Unc1RXVOd28yaG5hcDdVQnQ3bXRaaERFUkQ4T1FsTURYakVNM0tuWHFTQ1FM?=
 =?utf-8?B?Y2tPVkp3Q0JneFZoR0Z4Zi96R0Y4UFZUUzVndGVNcCtoWk9FTlcvbXZqM2la?=
 =?utf-8?B?R1h4M3YvQUt0K3FhTVREZ0pzbzc3TUcrbVY0VmtzZDc5SlNEbTB2VEZaWEpv?=
 =?utf-8?B?Mk1wL1IzRTk2VEplUkljeXVLNW1ySlhaY1JZdFc1SmNhWjM4R0xlclpsaHFF?=
 =?utf-8?B?RklQT0NmQXJxUlRWZGR4N05QaTg0SHJqRXFHMG9hMjB2bWh2MDlsNFp2TTZ3?=
 =?utf-8?B?L0hMK3NIMUQrSGJsQW9NaDEyNXMvYzZKK0pIK0Rva0RsR1k3S3crUllnWXFR?=
 =?utf-8?B?UEdySTNiZ0JPRVF3Z1V1VFdoQksvcjRzbEFaUktldUxIODd2S0Rxci9zNHY2?=
 =?utf-8?B?ZFJnc1pRMGFxekhWditwd24zRTVqSENLOXdKclJOSER6bkdxc2hWVnBad0V1?=
 =?utf-8?B?NzJoK1M5bXpneWhRQXlJYUd6U0lWeDRiMURsK0VyalNjdFRha01rMVEvR3lK?=
 =?utf-8?B?TDRFQTRmc1RQRTRaWFJrYXZJeThzU1hxSFhLazFIR1JtdkVhbGN5U1RScFNY?=
 =?utf-8?B?VVUwZjU4WWwzMlJPMlUyczQ4d1FKeHlQSlNvbEI1aDVjallxQlRzVEFwcDRn?=
 =?utf-8?B?MUxRdXNySm9Wek9XQ3dWN09FaU1TTkQ5QU42RmxHTGVQN3VySjBZSTNFaU9z?=
 =?utf-8?B?RDRiSUNOSGZ4YmpWTFlSWGFocGxENjN3WEduZTJOUXlyQ0l4a2V0U015QlFv?=
 =?utf-8?B?dHRqaWRWbFB0eUFoQlRTQkQwdUlxb2lraHBpaWRYck96NEF6ZlJOVCs1eXBq?=
 =?utf-8?B?ajl0cGJQcHpKdHM3RTBMK1lHNmFvWkdPc1NFSzRDd1FoZzlTYW1vTXpaYVVv?=
 =?utf-8?B?K2djT213VGN3U1lkdEJSRUc5ZkZRcm9lN00xV0JsMFlGWlVIMlZhbElhY21E?=
 =?utf-8?B?bldyUHlnWnhrbkRuTDZnSWQzT0xFSy9qcmRNUXZzRExqNXJlSi9jM2xJb0dm?=
 =?utf-8?B?M0l4ZjRvK3VORjkySS9oblBKTHdrRFJack4vL1Y2USs4UE04TEJrRVVFTkN2?=
 =?utf-8?B?NlF0Rlk4akYvdWdkMVZlb3lXakxydXpiNDVPUVZlWGVKQVNPNzZqQlVjWFFy?=
 =?utf-8?B?MkdEZmlhcU56UUNYcVpKalhQZVc5Z0J3S2grbUNPWVltdjJ2bTRvdzVjOFFn?=
 =?utf-8?B?Sit0NUcwZXFyRkZPb0VONFcxU3F4RUl4dTc4WnpSL3lvY2dLditwYzQ0UXAr?=
 =?utf-8?B?R1dIS1pvVWIxc21JTG9kajRjT0dTKzdBaW5XTGx6bU9obk5qZ1JWcVRmZGNR?=
 =?utf-8?B?aEc0Q2FIVmFkM1V2dkVWN3EzbUk4S0s4V2ZhZ0p0RXdVUk9sbStEbXU1UkNS?=
 =?utf-8?B?VmZNWjBNV0pjRm5WaHdaY3ZYYU1IdUlPVzBJb0xFRkZERW1OVm9WaGp2bjNE?=
 =?utf-8?B?UVZBOEZRdmVyS2xGSU1TdGVOWlBBdVdwM2dvclhFZEtrY3ljM0ppai9hTkps?=
 =?utf-8?B?RHpSSWVycjJGaTBqemxYWDJ5QXNOK25JR3lweFhLS3FuUVVjTUpDUVFxbk93?=
 =?utf-8?B?bStLRTdGVnVvRVNtQ1p1bnNHMHNINGJTQ1dHZ2NPU1FXOFhyZHdXZG1xeUc0?=
 =?utf-8?B?YnhtZDNzZlB1L1N6bTdySnh2ZzdNR1cvVFZNSHI1WDE2d1MyRCtLYWxYWHEw?=
 =?utf-8?B?ZkZnWXg1eVM5MHBnMmpCMW12WUEwL1hEV3lKd3NCRkVWK25hbmpIS1kxeFhN?=
 =?utf-8?B?YW01UHhNZ2JlVnIzbGhqVFV3UE1XbjZNc3JzUlhrQmh2RHM5UHkweU1nY0du?=
 =?utf-8?B?TE5HU3pLdUphUVZSZCtvd3JCb0hPOFdBQmh4UkV0bis5QjFEOUI3UlAydk9v?=
 =?utf-8?B?OXF1UU5sb3dwVmxkOXpRZDYwL0ovdDNINjJjWVkyRkZrSHJGb28vdz09?=
X-Exchange-RoutingPolicyChecked: WEbGnxrBEgjf4bT1PHufZa/TooL8NrqqUaFtU60SYfbZTcbv/2cBqQyeWnqM9ZmYuY8VsoFposXuCF11XLnO8KO1OIociNTcgLwxaHsyldAXMEda9M0A5yDf+qI3S7xslkFBkbUd68nHgV2hosXxV14y87kvy6doLxF9pGNy+K840s3N0nq8SHLvzBMnDX0PbHkfk631wNKwYLwP2cRIOzmtiwhcGCD2VkdQ7zgbD7BNh/tBEQgzdVnbj9fZW82gVjhGJb5UJc6CoAAzyrNJQaPPGtGFP04GoqiQs1j4BPaClvGT0g86PnlW+i0EsmY6shVr2KDsQ8PFY4fg1ADtCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fffaa38-9428-4c84-6f2b-08deb05b4782
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:18:42.3264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TlMuCyBVwYp/156YuQIiZ2bmFdGpL+saWg7G0KKEAUBkAYJ++tl/TmbftZOGcx3eorrRLrzlhasbU224TWHKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9715
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

Hi Alex,

On 12-05-2026 06:06 am, Alex Hung wrote:
> Hi,
>
> Does anyone have any concerns if I merge this patch?
>
> On 5/7/26 15:13, Alex Hung wrote:
>> From: Wayne Lin <wayne.lin@amd.com>
>>
>> The new subtests display an HDR test pattern under a given metadata
>> mode and pause for user confirmation, enabling manual inspection of
>> HDR output quality on a connected HDR panel.
>>
>> New subtests:
>> kms_hdr --run-subtest static-swap-smpte2084 
>> --interactive-debug=smpte2084
>> kms_hdr --run-subtest static-swap-traditional-sdr 
>> --interactive-debug=traditional-sdr
>>
>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
Is Co-developed redundant?
>> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
>> Assisted-by: Copilot:Claude-Sonnet-4.6
>> ---
>>   tests/kms_hdr.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index 876c1c03a..c13e985e1 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -67,6 +67,14 @@
>>    *
>>    * @swap:                    swapping static HDR metadata
>>    * @toggle:                  entering and exiting HDR mode
>> + *
>> + * SUBTEST: static-swap-smpte2084
>> + * Description: Show a visual HDR pattern with SMPTE ST 2084 
>> metadata and
>> + * require user confirmation.
>> + *
>> + * SUBTEST: static-swap-traditional-sdr
>> + * Description: Show a visual HDR pattern with traditional SDR gamma 
>> metadata
>> + * and require user confirmation.
>>    */
>>
>>   IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>> @@ -647,6 +655,79 @@ static void test_hdr(data_t *data, uint32_t flags)
>>       }
>>   }
>>
>> +static void test_hdr_visual(data_t *data,
>> +                 void (*fill_metadata)(struct hdr_output_metadata *),
>> +                 const char *mode_name) 
>> +{
>> +    igt_display_t *display = &data->display;
>> +    igt_output_t *output;
>> +    igt_fb_t afb;
>> +    int afb_id;
>> +    bool found = false;
>> +    struct hdr_output_metadata hdr;
>> +
>> +    igt_display_reset(display);
>> +
>> +    for_each_connected_output(display, output) {
>> +        igt_crtc_t *crtc;
>> +
>> +        if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
>> +            igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or 
>> IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
>> +                 igt_output_name(output));
>> +            continue;
>> +        }
>> +
>> +        if (!igt_is_panel_hdr(data->fd, output)) {
>> +            igt_info("Panel attached via %s connector is non-HDR\n", 
>> igt_output_name(output));
>> +            continue;
>> +        }
>> +
>> +        if (igt_get_output_max_bpc(output) < 10) {
>> +            igt_info("%s: Doesn't support 10 bpc.\n", 
>> igt_output_name(output));
>> +            continue;
>> +        }
>> +
>> +        for_each_crtc(display, crtc) {
>> +            igt_output_set_crtc(output, crtc);
>> +            if (!igt_crtc_connector_valid(crtc, output))
>> +                continue;
>> +
>> +            prepare_test(data, output, crtc);
>> +
>> +            afb_id = igt_create_fb(data->fd, 512, 512,
>> +                           DRM_FORMAT_XRGB2101010,
>> +                           DRM_FORMAT_MOD_LINEAR, &afb);
>> +            igt_assert(afb_id);
>> +
>> +            draw_hdr_pattern(&afb);
>> +
>> +            igt_plane_set_fb(data->primary, &afb);
>> +            igt_plane_set_size(data->primary, data->w, data->h);
>> +            fill_metadata(&hdr);
>> +            igt_hdr_set_metadata(data->output, &hdr);
>> +            igt_output_set_prop_value(data->output, 
>> IGT_CONNECTOR_MAX_BPC, 10);
>> +            igt_display_commit_atomic(display,
>> +                          DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                          NULL);
>> +
>> +            igt_info("Displaying %s HDR pattern. Press a key to 
>> continue.\n", mode_name);
>> +            igt_debug_wait_for_keypress(mode_name);
>> +
>> +            igt_hdr_set_metadata(data->output, NULL);
>> +            igt_output_set_prop_value(data->output, 
>> IGT_CONNECTOR_MAX_BPC, 8);
>> +            igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +
>> +            test_fini(data);
>> +            igt_remove_fb(data->fd, &afb);
>> +
>> +            found = true;
>> +            break;
>> +        }
>> +    }
>> +
>> +    igt_require_f(found, "No HDR-capable connector found.\n");
>> +}
>> +
>>   int igt_main()
>>   {
>>       data_t data = {};
>> @@ -698,6 +779,14 @@ int igt_main()
>>       igt_subtest_with_dynamic("invalid-hdr")
>>           test_hdr(&data, TEST_INVALID_HDR);
>>
>> +    igt_describe("Show HDR pattern with SMPTE ST 2084 metadata and 
>> require user confirmation");
>> +    igt_subtest("static-swap-smpte2084")
>> +        test_hdr_visual(&data, igt_hdr_fill_st2084, "smpte2084");
>> +
>> +    igt_describe("Show HDR pattern with traditional SDR gamma 
>> metadata and require user confirmation");
>> +    igt_subtest("static-swap-traditional-sdr")
>> +        test_hdr_visual(&data, igt_hdr_fill_sdr, "traditional-sdr");
igt_debug_wait_for_keypress() is a no-op in CI — these subtests just 
duplicate static-swap with no added validation.
Instead, add igt_debug_interactive_mode_check() calls inside the 
existing test_static_swap() after each metadata commit. This is CI-safe 
(no-op without terminal) and provides Y/n visual verdict when run with 
--interactive-debug=all. See tests/intel/kms_dsc.c:90-92,216 for 
reference. No new subtests or functions needed.
>> +
>>       igt_fixture() {
>>           igt_display_fini(&data.display);
>>           drm_close_driver(data.fd);
>> -- 
>> 2.43.0
>>
>
