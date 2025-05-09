Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B9EC3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 14:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4931310E26D;
	Fri,  9 May 2025 14:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCMGVcvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3625610E26D
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746800458; x=1778336458;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6jNYPe+jZRNmMM4mMTDfnVgKZ0+vMrSLIKTREpIzv8o=;
 b=VCMGVcvEFB2YngIaiMhkK7wWdne5Now8Qyh1mZTz/8802haan9PoME3Z
 IKhz/xtpOkMQcGB2Snr1WKRx63rmlZjk8v6wGckcm7GyUtSqGE7/yHkjA
 uYRcK6U3+ukw6Y5hITubsH1yh0DOy5gHuF1Gth7t3pLxEMV5R+ca1ls3F
 pJEpCobACiZqpTbIGmK5kIuqW3iPQkR9fCS/1x0nKawZqDFPXo3sS5W80
 PkRDya7aG4oidHHqTue2Al+nCf5hrCCLwhTFh3STkNyK5u3u8eElAu05x
 lJl0ApzeBVAw0NlXfR5nbDofbCyZlHFmoNTbpzk6o5P9/3M5RCCaC7HlA A==;
X-CSE-ConnectionGUID: k5KShzvvT7qtCl27S9zVtw==
X-CSE-MsgGUID: pseZq52TTdmu3AVDf4BpJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58853420"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="58853420"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:20:58 -0700
X-CSE-ConnectionGUID: L+IrVi2HQ/2VGfmN1yBE9g==
X-CSE-MsgGUID: cX6iLQ64SA6hSBfhOXV1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="136557779"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:20:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 07:20:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 07:20:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 07:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwDGaoH1aeDcPPvfj/uT+WFNF9uv7slhPQb6M7iodJA93ZYNo2UtHJhZifSWYnvydRlieL4Z7PfClL1/yrLX3kWw7+H/viNhftgxPr/nHaPVX2NCtGs01p+5FGyEXnTo+WMSMNcPc2bOKNnysy1DDHSrIuxWbYsgRhsRIVIAWOPaaxKma0ES467w2Tr//SjGMOfZ+T+SbNMQ8MpJ867frpNm1PzAzIe+Qh9qgnrMoHjJaHUQ7XogGfMB+wLquNQ8h6fdXo7j+/YXvGZY9ep4mFYLJrp+94oWihow+LvxHgeeCttdAjW1Rsisht86WAMkC/QeTQpKYJCuAgH7zOiLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpp8Rfdxixh80WA00RqrzVX2i2hrYmr8dcRITYcwx28=;
 b=blMDPEBPV1JRwQhpWUD3mjZ5J8tNIkh/7/Vr6CYmj8ZnHobUpvcJrHFAXzlmRRGKgbi3qUsvnRaHoGXnaukYu2U0uUpN53eBnKWB3gReXRakM239oupNYSwFgcCiBdaerhnVMQAc9PFkgB09ZyEY2A86AJyA0YBRI3SjwLkTlDGz5426yTi5826jsKgpGD045SjZuIhKtn93fu0cZmvigFtvHzoEr9xnBR6i4inMxuvlJfZlhydlYnv9jq/5DPRptu/rSaMtDlHKXrOuf+krqY3BVkMWFGREz3p4TFSPAiyL8DkJJ9xOEm7ly300pUHR7gKSox8IitqlwBHKHyeDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 14:20:54 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.024; Fri, 9 May 2025
 14:20:54 +0000
Message-ID: <a540854b-88d6-490f-a7e5-b534770b2fd1@intel.com>
Date: Fri, 9 May 2025 19:50:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/5] tests/intel/xe_pmu: Add tests to validate
 engine activity with single engine active
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
 <20250508055006.734259-4-riana.tauro@intel.com>
 <aB1B9tpjF2RUKyJd@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aB1B9tpjF2RUKyJd@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5eee42-052f-43c6-da13-08dd8f04b52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVhmNlV5dEdRdmlUR2pCeEU3dGJtcWU2akxNMG5XR1lXVzNXWk9CZzIwU1Fp?=
 =?utf-8?B?ZkxEeHVIWCtJQmFnZlo3UUJab2FJWjVsZjVrRFZYK0ZUTGhUUloyeXpaNFls?=
 =?utf-8?B?YUJvZ3NrNWlJdTZZbSt0OHdPazAzd2lhdWxjS2VVUXdrZERtZDdsOGJYbE16?=
 =?utf-8?B?N1BYZXE5VkJldVRxMWhndWZJQWRsWHk1SEFsYUx2bUZzdU5MSE00TlcyYndC?=
 =?utf-8?B?L3BudlZvZXBLc29sOGtYSm9Cd1BoTHlwVlZDRkRtdGthOW84UmM4YzJZWUZk?=
 =?utf-8?B?Mnc3U0ZoMWt6MHdudzhDZ3o0SHdWSm5qMVV0RUdycTdaOS8xalJkS3hHMTFW?=
 =?utf-8?B?Q3hLWDRjZTJWMzNQeWU0RjNUVjd6WVViWFdjVGJTaHZOUnJJV2FPcW5hV3dx?=
 =?utf-8?B?aHFWL2dXR1RGZVhwQm1CNnduWjdOY1NEUzNPY0phUHZ2Y05tOGJsOTc5aDE3?=
 =?utf-8?B?OE5odkUyMVQwaVdFejZ4U2dqTEZOcStRVEZpV2pSYXhMRHR3amFCYTJiTndD?=
 =?utf-8?B?QVRDVStQTkdYYzNDU2VlV1hJMGFNbHUyZFVXdWpXYnBLVHpMRFFVb0JUU2ZU?=
 =?utf-8?B?eE5YZCtiMzk5bkY3cThjVmxPSmluTDlESkpCV2Zzd1R4L0VpQUdCUUEvVVd0?=
 =?utf-8?B?eW5pRVBKeGNISWtnV1JzckE2NFFvZ0VvLy9ld1B0VVp6SGV0TEdUVzB3TDdt?=
 =?utf-8?B?WWxxZitnNXVLMElxQ1lOREFFcU1qQ2t3RS9RQ0RrKzQzVEtJS1pFbU56UUU1?=
 =?utf-8?B?bTV3WnVmNEtLS05QZks2eU0waE4xR1RnRjZZREN2ajNRbE9LbVRrK0ZLZnBl?=
 =?utf-8?B?SU1SZTBCNE1jY1F0bCtGaEt3akNCeXBERHZLRXZKU2FHOUp2RC9pVERXcnR6?=
 =?utf-8?B?TFN6akRnQ0ZUc1dwY0g1WkJCNnMxQXMxUFNua25kbjRjZzFnNkFWTlRLOFdH?=
 =?utf-8?B?LzcwMThxSnRFZ3NyckF2djJPSmVkTDZoYXdvRDF4STk3NUkvMFNoSE5mOWJV?=
 =?utf-8?B?aWlHZFp2OVdMTEcySXlvVGRLOXhETGdQa291TnFxSVliaWVQbnZEdGprWmtP?=
 =?utf-8?B?cWRaakZuMS9DWnJRNVZpWVhyZG5JeW5UNkcwSzRlZEpycTBBWHRobEZaeXFH?=
 =?utf-8?B?cjgyeHZlRkR1MlVlUkJlRHBvNWJFcGI0bXcrZG5EaXg1Q0F4U3ZQVDRHd0lZ?=
 =?utf-8?B?cTBvSDB3NHhIby9WZHF4YWl6cHdaVGZRSGs2MlJzZFU5UEdnMHBnVmJaQ2F4?=
 =?utf-8?B?VHo0em5MLzYwRUdtaXRMY1IrUTc4bzkya045NXBmOVF6VXFDQjlXd0xoYTNY?=
 =?utf-8?B?OWwvaUhkdFZEakFLRldaQmY4ZFVzZ1o0N3NoZWoyVnhpbmpBRVRlTEVvZzlk?=
 =?utf-8?B?cTlYdTdyeHg1anFCdndBOUZzMjllSFhqVmN6VDdib2RVenE2TStCZWRDODJZ?=
 =?utf-8?B?ckVOUUNWakRCYmw4RmZvOVdGbStOc0NRc2Y1YmJKY2pOS2hCWkl3bTZIM3BL?=
 =?utf-8?B?SFZkMkd5UEVkSEZDODA4UVYwdXVBNi90c2ViSEQwbjhpUThNWWNOVzNtWWtI?=
 =?utf-8?B?b3hsTTlQcjVrcXIwNWl0Y0twSDUwY2xUVWxqYWFsNUkybmZKcHVrR2YxYVFR?=
 =?utf-8?B?enJxd2NzNmVNa3JhV3hsVVVpSms3SENmZ3BOMWZhR0ZpM2d5Q1VYKysvSytT?=
 =?utf-8?B?RDhhbzVxaXdUMFduVUovN1RHMndTZWpQMnhPWTk1VVg2R20rNjdPVmNEMlBS?=
 =?utf-8?B?OFVVTTlNeDhNOWVjbUNXeGhPcUZ6TnAyTi9BaGo3ZVhQYUlkNFIxVnFGRnZ2?=
 =?utf-8?B?Sm9BZzQ4eUU0NU5ReVNHUDdOeHVFd3Z0SGczbk5UZCtjWExEZFNmYWFjRExN?=
 =?utf-8?B?dTBDUzEvcUZhZGVtaGJTVGtyRmd0dXJEemRCbVJ0bjZlV0tkM211akxQVFhr?=
 =?utf-8?Q?yVHJ42wFMxw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ppaXU3dmlxL2Qxd2U4ay9RTFVkV1psRGxPblVoZUsrWEh1bnVrcTVHM3pz?=
 =?utf-8?B?UFBoZXB1YUhhL1h0eHRTcndKM2w3dXFVY0t0a0c4YTJUNHlET0t6blhLYXk1?=
 =?utf-8?B?TXhtWVhjNlpSTUhhelhkaXN5by9LWlBGYWZuUDY0L29QdTZ4YzBpekVERUdj?=
 =?utf-8?B?Y2V1b0ZmQVhTUVZzWXdORkcrZVltTzgvR0FDUnZ4T1h0dlJIK0kxb3hhYXFG?=
 =?utf-8?B?NStrMnNjZ2RvOW1SQ0lOTmlsRWxoU1k4UVNYN1lhZlgrZysyR2puZ09yTDRF?=
 =?utf-8?B?NkxUSCtIS2RuTTdWeG5KRjJuMHVtZEFiN05vQ2VoUzFZaDFVSmM0QlQrZ1Uw?=
 =?utf-8?B?OXFMQXVoZzBnYnNhOEZqSVRBNVZodHRDbWpaaXBxcTBLVWlybTNtZjI3cWVy?=
 =?utf-8?B?ZkJSdXU5a01kL1o5cHdacTRsVzRWbGc5UlY0dHhCazZvdmhXRHl4RXR2WU9T?=
 =?utf-8?B?Mk95bmF5S3VQdTN2OHh0eGFQNDdvSzd3QlNlM3BlTytwYlJLOXl2UnF3TmpE?=
 =?utf-8?B?d1g4UEl5L3RBeU9zdjVFTzNPRjlGVzk4VjhJdGlNR3RVTHB6Sis3VXBJeC9a?=
 =?utf-8?B?MEdhZld4K0hSbFdkbWhUV1A0Z1l4T1ZublZSTi9ObEJZK1FQWUlnbUlTUEdt?=
 =?utf-8?B?WjBrVnpFNng5M3F0Yjh5ZDBuZ0RMZWVsRGlYcmdGZDdqOCtpTzZQVjZabHlh?=
 =?utf-8?B?VExaOFpRT0d1WFZBMFlSTTU0VnM1c3IyUTNNMkZVRlJQOHhZc3dDQ2VPbWsw?=
 =?utf-8?B?Q0g4SDhmVlViVkxtWDBCaWduMFRYYnJyQm9rMVlEc1g0MDR0c2JXdVBRS0U1?=
 =?utf-8?B?VVFmRnJWVGpKTlpXZzZxdkRlcSswUUxTaDJWR1NwL0t5bGFvS1JNUWMvM3ho?=
 =?utf-8?B?TFNEUzF6YWJ1cGJhNU13M0QvckJxVDNWTWdrdmVCYjExQm12Q0dENnpKcmoy?=
 =?utf-8?B?ZWFwUndJY254a2RWd1NmZ0MyT2tzMlUrY09iZTdpRUFaT3E3RXRlTG94K0g0?=
 =?utf-8?B?bVhwWjVEZGdVRGRIUzZFU2tLb2hoSWVYbkJzc2tRbmJBQnJvU0gyaEFMbnNl?=
 =?utf-8?B?UXl2MmNOSGY1WGt6OHE2c1NmQThKUU42bHN0WWVNclZwMXZQWTRkVVc4dXVB?=
 =?utf-8?B?UnFET251elVaT1o1NG51RGFQSSt3QkF2c0N0WkxLWFh2bmU3YS91RG1LSVZo?=
 =?utf-8?B?V1RaTmc1dGNpZXptbWVzbWdWYlRPQ2NoTFNZY2NpR3BsVkphb0FBVnNpVWhu?=
 =?utf-8?B?bjZQNk1jS05XTEQxUjhCT0NyT2h3YkVPNHFDTnVzemlwdkZHMUp0allEZENo?=
 =?utf-8?B?MlVYZEU2M0k4NDZtTi96NkY1YU1zcmsySFJuNUhEbDdHMjNybVFYbWJNYmc5?=
 =?utf-8?B?bVptRkNwYUxjQ1FKQWhSbXcrTmJyS0JUZW84NFRwU2d4dlpwYkhyWEo2ejNi?=
 =?utf-8?B?U09wTkFnMnorQU0zM0xQVzhxQTU0dEVibkRPSkZPZ292UDhmRUlFN25qbHZ6?=
 =?utf-8?B?RUF4cUVkSTZmZUhGcWZSQUVWMGIxQUs4bDFYTXFsaGhvLzY3REYrVUJYWW9L?=
 =?utf-8?B?RS9yM2tkRnhhYkswTVR1ZjFzRm1jSStIL1NnTUVVc0JRL1ZzN01USSsvakVG?=
 =?utf-8?B?OGNqNlRZNjdBNUFyWGgyVENBbkpjdVczSVdocnFlZm5OWEprTnJTNXVHVG1R?=
 =?utf-8?B?ZEZtMGliaVRVN2tuS3ZkOXZ1ekVneTJLSUlobWpsVjZVZzZKKzdMdFMwZ0Jv?=
 =?utf-8?B?VDZtMERvb3ZqYTc5ZTVTTW1aNmVqRnpxSjExTE4zVXgwclVDb2tPNTVVRVhF?=
 =?utf-8?B?SzRYZHNEalRYTzA4UkNPNmo0dU15Wm9XYi9RSmw4TG51ODI3eGExTGxZc2tK?=
 =?utf-8?B?dzFBNmVEVWVuaDV5MmFSR0pmWGtjaWdvMkJoRTNPRWQzdEg4UFBPZ1F6a3U3?=
 =?utf-8?B?UE0zYnN3cHlxZjlxQ1E5Um9RL2taaTVYSjZza2RqbjQ5d0UrYjVtZEVNRVAr?=
 =?utf-8?B?cG5IQkJleVZvWExyQjg1RzAySkRuRmdld293NXVRT21mUVRkYW8zUTdmcGxO?=
 =?utf-8?B?VWNQRE1DeTdjN1dnMkxUZ1NocmNVVkxqNEtJWWVHenpNeVhvNHhKNnVxTmVR?=
 =?utf-8?Q?5PIG1dX4wOZjuu0Pklm9KHYpi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5eee42-052f-43c6-da13-08dd8f04b52b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 14:20:54.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydIOri9z3PVE5uCn0uhPQC9ZDgEQP3IkEIOSjXRtSqcBFCiByffvKzq9MrAuV4bJGXw7Muo/gaqHEi+rwF/+Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
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

Hi Umesh

On 5/9/2025 5:14 AM, Umesh Nerlige Ramappa wrote:
> On Thu, May 08, 2025 at 11:20:04AM +0530, Riana Tauro wrote:
>> Add a test that validates by running workload on a single engine and
>> checks if others are idle.
>>
>> Also add a trailing idle test case.
>>
>> v2: use allocator
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 114 ++++++++++++++++++++++++++++++++++++++++++-
>> 1 file changed, 113 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 1ad927822..d78b8bea5 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -24,6 +24,14 @@
>>  * SUBTEST: engine-activity-load
>>  * Description: Test to validate engine activity stats by running a 
>> workload
>>  *
>> + * SUBTEST: engine-activity-single-load
>> + * Description: Test to validate engine activity by running workload 
>> on one engine and check if
>> + *        all other engines are idle
>> + *
>> + * SUBTEST: engine-activity-single-load-idle
>> + * Description: Test to validate engine activity by running workload 
>> and trailing idle on one engine
>> + *        and check if all other engines are idle
>> + *
>>  * SUBTEST: all-fn-engine-activity-load
>>  * Description: Test to validate engine activity by running load on 
>> all functions simultaneously
>>  *
>> @@ -51,6 +59,7 @@
>> /* flag masks */
>> #define TEST_LOAD        BIT(0)
>> #define TEST_TRAILING_IDLE    BIT(1)
>> +#define TEST_IDLE        BIT(2)
>>
>> const double tolerance = 0.1;
>> static char xe_device[NAME_MAX];
>> @@ -165,6 +174,43 @@ static void check_and_end_cork(int fd, struct 
>> xe_cork *cork)
>>         xe_cork_sync_end(fd, cork);
>> }
>>
>> +static void log_all_engines(int num_engines, int skip_idx, int flag,
>> +                uint64_t *before, uint64_t *after)
> 
> s/log_all_engines/check_all_engines/ since you are checking idle/busy.
> 
> s/skip_idx/target_idx/ or something else, since you are deciding if the 
> target is idle/busy based on the flag passed.

Will fix these

> 
>> +{
>> +    uint64_t engine_active_ticks, engine_total_ticks;
>> +    int engine_idx = 0;
>> +
>> +    for (int idx = 0; idx < num_engines * 2; idx += 2) {
>> +        engine_idx = idx >> 1;
>> +
>> +        engine_active_ticks = after[idx] - before[idx];
>> +        engine_total_ticks = after[idx + 1] - before[idx + 1];
>> +
>> +        igt_debug("[%d] Engine active ticks: after %ld, before %ld 
>> delta %ld\n", engine_idx,
>> +              after[idx], before[idx], engine_active_ticks);
>> +        igt_debug("[%d] Engine total ticks: after %ld, before %ld 
>> delta %ld\n", engine_idx,
>> +              after[idx + 1], before[idx + 1], engine_total_ticks);
>> +
>> +        /*
>> +         * If flag is load and skip_idx is set, then check all 
>> engines for load except
>> +         * the skip engine id and vice versa
>> +         */
>> +        if (flag == TEST_LOAD) {
>> +            if (engine_idx == skip_idx)
>> +                assert_within_epsilon(engine_active_ticks, 0.0f, 
>> tolerance);
>> +            else
>> +                assert_within_epsilon(engine_active_ticks, 
>> engine_total_ticks,
>> +                              tolerance);
>> +        } else {
> 
> Assuming this ^ is else if (flag == TEST_IDLE). I would make it explicit 
> here.

Will fix this

> 
>> +            if (engine_idx == skip_idx)
>> +                assert_within_epsilon(engine_active_ticks, 
>> engine_total_ticks,
>> +                              tolerance);
>> +            else
>> +                assert_within_epsilon(engine_active_ticks, 0.0f, 
>> tolerance);
>> +        }
>> +    }
>> +}
> 
> Overall, I would split the above helper in two:
> 
> check_all_idle_except_one()
> check_all_loaded_except_one()

I thought instead of duplicating code, can use a single function.
But asserts can be identified using test name

The functions aren't used by any other tests if i split.
I'll move this back into the test function call?

Thank you
Riana

> 
> or any other name that conveys similar meaning. I feel it would be 
> easier to read and debug once the asserts start kicking in. If you do 
> that, you could drop the flag parameter.
> 
> Rest looks fine.
> 
> Thanks,
> Umesh
> 
>> +
>> static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, unsigned int flags)
>> {
>>     uint64_t config, engine_active_ticks, engine_total_ticks, 
>> before[2], after[2];
>> @@ -216,6 +262,63 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, un
>>         igt_assert(!engine_active_ticks);
>> }
>>
>> +static void engine_activity_load_single(int fd, int num_engines,
>> +                    struct drm_xe_engine_class_instance *eci,
>> +                    unsigned int flags)
>> +{
>> +    uint64_t ahnd, before[2 * num_engines], after[2 * num_engines], 
>> config;
>> +    struct drm_xe_engine_class_instance *eci_;
>> +    struct xe_cork *cork = NULL;
>> +    int pmu_fd[num_engines * 2];
>> +    int idx = 0, busy_idx = 0;
>> +    uint32_t vm;
>> +
>> +    pmu_fd[0] = -1;
>> +    xe_for_each_engine(fd, eci_) {
>> +        if (eci_->engine_class == eci->engine_class &&
>> +            eci_->engine_instance == eci->engine_instance)
>> +            busy_idx = idx >> 1;
>> +
>> +        config = get_event_config(eci_->gt_id, eci_, "engine-active- 
>> ticks");
>> +        pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>> +
>> +        config = get_event_config(eci_->gt_id, eci_, "engine-total- 
>> ticks");
>> +        pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>> +    }
>> +
>> +    vm = xe_vm_create(fd, 0, 0);
>> +    ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> +    if (flags & TEST_LOAD) {
>> +        cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>> +        xe_cork_sync_start(fd, cork);
>> +    }
>> +
>> +    pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
>> +    usleep(SLEEP_DURATION * USEC_PER_SEC);
>> +    if (flags & TEST_TRAILING_IDLE)
>> +        xe_cork_sync_end(fd, cork);
>> +    pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
>> +
>> +    if (flags & TEST_LOAD) {
>> +        check_and_end_cork(fd, cork);
>> +        xe_cork_destroy(fd, cork);
>> +    }
>> +
>> +    xe_vm_destroy(fd, vm);
>> +    put_ahnd(ahnd);
>> +
>> +    for (idx = 0; idx < num_engines * 2; idx += 2) {
>> +        close(pmu_fd[idx]);
>> +        close(pmu_fd[idx + 1]);
>> +    }
>> +
>> +    /*
>> +     * TEST_IDLE is passed to log_all_engines to test if all other 
>> engines are idle
>> +     * except the busy_idx
>> +     */
>> +    log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
>> +}
>> +
>> static void engine_activity_all_fn(int fd, struct 
>> drm_xe_engine_class_instance *eci, int num_fns)
>> {
>>     uint64_t config, engine_active_ticks, engine_total_ticks;
>> @@ -544,12 +647,13 @@ static void restore_gt_freq(int fd, uint32_t 
>> *stash_min, uint32_t *stash_max)
>>
>> igt_main
>> {
>> -    int fd, gt;
>> +    int fd, gt, num_engines;
>>     struct drm_xe_engine_class_instance *eci;
>>
>>     igt_fixture {
>>         fd = drm_open_driver(DRIVER_XE);
>>         xe_perf_device(fd, xe_device, sizeof(xe_device));
>> +        num_engines = xe_number_engines(fd);
>>     }
>>
>>     igt_describe("Validate PMU gt-c6 residency counters when idle");
>> @@ -571,6 +675,14 @@ igt_main
>>     test_each_engine("engine-activity-load", fd, eci)
>>         engine_activity(fd, eci, TEST_LOAD);
>>
>> +    igt_describe("Validate engine activity of all engines when one 
>> engine is loaded");
>> +    test_each_engine("engine-activity-single-load", fd, eci)
>> +        engine_activity_load_single(fd, num_engines, eci, TEST_LOAD);
>> +
>> +    igt_describe("Validate engine activity of all engines with one 
>> engine loaded and trailing idle");
>> +    test_each_engine("engine-activity-single-load-idle", fd, eci)
>> +        engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | 
>> TEST_TRAILING_IDLE);
>> +
>>     igt_subtest_group {
>>         unsigned int num_fns;
>>
>> -- 
>> 2.47.1
>>
