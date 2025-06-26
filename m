Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E603C7115B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 06:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0441D10E26D;
	Thu, 26 Jun 2025 06:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BScbxXXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0769210E26D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750918984; x=1782454984;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fvIlSlvAYsywdGVYyGR4q7MNAs0li9cjSwXtZjMhf6w=;
 b=BScbxXXK/Pi9hcKi9QJ0dcJEHXEtFLzubG0me0EfgUX+XtQZnyJXHOox
 NnmmBXMsI/XmjV8X0ohanTrV+z74SRyJ7zmQN3oYnM3XFQNZPFPR5ox1p
 6Zb23VUFs0AnHE830Qj6k65cGjeuDWsh/iDadvMDN07vRfRGmwqe7eMl/
 lr2cOcpfJ1p9TMehKODWvma+QW2OaeD7bHWyYoBG8zUHPVcE1okw397OS
 PRVde4vGCa7S0jYZqyvLpRpOHwZkPzeD9iZrGO4/b3c+zhpybtIUT+CPg
 p2l5YeC+EDINpPjx/F/xio57Tgd+OZrWd7OO5VfNfehdpKuUrHHABKyYX w==;
X-CSE-ConnectionGUID: bIjABl0wT3uPqNy8yGhKXA==
X-CSE-MsgGUID: Jz4AGi6tSDCjaadSKXSrgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53068089"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="53068089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:23:03 -0700
X-CSE-ConnectionGUID: eOaeyMUwQAaVvlN2a6HDmg==
X-CSE-MsgGUID: ouwKqnSQQ3+QUO42hYWl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="151941791"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:23:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:23:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 23:23:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVOOYrflErxl9tRtCobfjLFnQTqDRBkDVTQ+jhitebcEHmEUPhJEpURfqcoDcELETepFCUFhydX+ZzzTdT7UGVcSNeRn1M85Inu19u6N03UBGcMh/nSifyoDGqCces36FWj4Xa8VrD+58kgbbXDrhx8EfwKDJCVUAnXx4AMlYiSNOYj7XdL16LufqtO3LdeddPYzqHE0Kjl45gKe4IyVqXu6btOnOJsswWjty6cT6HrpeVg/xXXJzOz+nLmo5JQ9VZ1DypkjnO5vnc/qRA8a9wMq7s938BusGm6Ooulht3ezdpvPdGEUt02sb9B2XKKywu/YPUD1I1TrmYlIoFVSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50VMLjYbW2vZIycYAuFfGmA5RBticNkzQ9x3XmFcJCw=;
 b=f7tpm1/A0y1DtOcNWb9Id6PhcCZFeCJLbethdn5CY3x8BupN0xIQ8i21yxh2hg+YJ1SPekX/OflE+5Nr9ukWRBC155kjU8Tplg1W4zhMCqyKsHCxXfca+D22AI06KuMWv5kOB0MuPbDcxrbN2kBpoELfkUlXlUFV+OAdct4nAFacGTq4kyziHn8xr9weRCl4RYHiowsK+TMLDFMkhmXwgcOhHaMBuYxi/uAxdKLNWovUTNqGVNB15cZ6vE41NMnTGmeB2p4EtZV0SB+FS8+gpmhRTEfKOSuQydVOUoU7u/IWqwZDeO0hbh1Qpbj/PS3P4qJw5zUsBU5wwzzFhg+CCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN7PR11MB2753.namprd11.prod.outlook.com (2603:10b6:406:b0::23)
 by DS7PR11MB8806.namprd11.prod.outlook.com (2603:10b6:8:253::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 06:22:59 +0000
Received: from BN7PR11MB2753.namprd11.prod.outlook.com
 ([fe80::71d3:caa:b683:bc9]) by BN7PR11MB2753.namprd11.prod.outlook.com
 ([fe80::71d3:caa:b683:bc9%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 06:22:59 +0000
Message-ID: <e5214b67-d967-41a7-b488-14f035714a1a@intel.com>
Date: Thu, 26 Jun 2025 11:52:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Restrict linear-tiling subtest to
 HDMI outputs and improve skip logic
To: <igt-dev@lists.freedesktop.org>
References: <20250617063119.36344-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250617063119.36344-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To BN7PR11MB2753.namprd11.prod.outlook.com
 (2603:10b6:406:b0::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2753:EE_|DS7PR11MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 623e483c-36b7-4d6e-8904-08ddb479e53a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzVqaDZPUHhQa2dLRWNYd2lBNHc4L2I1aG1JaHppUW5PTnBraXJHN2ZoOFhW?=
 =?utf-8?B?bUNlSE9YWUlyc3BKc3JTem5aZ3ZoM2hkY2ZhVm0wVmJ1czEyeVkvMHJrUDNB?=
 =?utf-8?B?RXlDZjV0bDhxVDlwdk9icXhjUnQ1QjgvMlJWdDR4TW4wcmpDbkI5MmRvbHpM?=
 =?utf-8?B?bnNTVURBTU10T2hhYU81ODZsaWw3ZG41Tk9HR1RGcUIvY0RHOU9HU3dHUUVY?=
 =?utf-8?B?U0pQSWYycWhOUm43K3NtczExVUFiVWgyeHoyZStwU0RUU3BPa0ZFUFdXeVBn?=
 =?utf-8?B?dGlXb2sxdnFrZlBvaWVRSHV3OEJiaHBOZS9SNEVmbFFTaGVpRmZqdHY2cmR6?=
 =?utf-8?B?S28xaENyaWJPQmJrY0ZyUStycEpKY2tOVk5ZK1pJamJMaVFsWU5UTVh0eE1N?=
 =?utf-8?B?dWUrNE92UzRrZ3RCQWx0YW5JMC9UK1B4QzFWdWxKZE5oL1J1Q1NEd3dDSmpy?=
 =?utf-8?B?OU4zOU01YUladEZzUEVKdEczK25KT1VGRGV1Nk8rM0dOYzhMaEhQMnluWGg1?=
 =?utf-8?B?Wlp3YXRPak85YzBIbkFualBsMlB2UVFtR1BGNDQrelB2TjlVSE85SEdoQWxQ?=
 =?utf-8?B?Yzlua1dianVVYzlSUUtDRVFhQklZb2tncjRKeFAzYU1KZlhBQkk2S1FobXF2?=
 =?utf-8?B?bkhHNEVkSVZWbU9JV240QlBUTGhZY2hqSTZhYXVmeENwUFFYMjdBOXluaS9r?=
 =?utf-8?B?eFVWSVZ4Z2VaZmpESStwc0xsUTFnNGwvVWxsM2NLeDBpREpHWDlreTNPNi82?=
 =?utf-8?B?ZDNVd05qbXJwUURWOTh5OE5ITVQwUlVMTGJCRTdTWjY3NXVyQ0FrcU5YbmVn?=
 =?utf-8?B?WVExMjV0VFR1bGhUWG5yNlFEeGJoN2lHYW5qVXFNS1VTQkZ1UTV5WDJ3QXdB?=
 =?utf-8?B?RFUzMDVuY0dSSDNuRDliSW13a2cyTWY0OEt5SDMrTHNKMjF1T09CTURpSWVm?=
 =?utf-8?B?NTJNVDdaOUdXNFdSUE9nc1JQbVNXdk55UkVmOGpjK3dkMFJEYklXd09RZGJ0?=
 =?utf-8?B?eXRuWjUzUlZ0UHR0VTVISnYvcG1yQnJKTXJ0Q05rYWo1WnBWbmRWQUJRT2pH?=
 =?utf-8?B?SHdrcmViR3FiRjRERlBJTmJUKzJKZjBJMDJLMnF2N2lHU1hHZTZhOE1XZUlX?=
 =?utf-8?B?ZHBRa2VMUmdZNHpIVHRGUVAxbm9sOXBxMjd5dFVpS2JWUXRTNC9aa0NYcjAr?=
 =?utf-8?B?YUdvYzRXbVVVVncwV0pKZ0h6V3h0QjU2RWkzQk8zeGJ1UEs5ZUd3SVM1NERC?=
 =?utf-8?B?cmw3M2xuV0pReDR1TG8zT2RxNmFnV0l5NGxZUmEvTElBRlJUWG9sRExTS2VC?=
 =?utf-8?B?QmVFeDJVSGJqZ1VHVHlhVnN1M3dSK0F5bkllL2svY2FQVjdKSUJrNVA5d1RL?=
 =?utf-8?B?YjJ6Nk56RDRkRXdFTjZKMFhCZGJidzhHVC82c3JYNUhadEZlVUVZQnUzaWpy?=
 =?utf-8?B?WW1yQkpYWGtUczJOSlV0K3dNdWdwbFhJamxZaXFhTTlQWHQ5MUNqSzBqa1FM?=
 =?utf-8?B?aVRyL1pVWUg4dm1DT2lzTzJYdnpLMkhjU05ORk1xelFvRHA1Z29ncnoyWGdS?=
 =?utf-8?B?VHY1OS9YZkVwM1RpSk9wckFMTnNwTlpyNWllTzc3T3VNRjNCZzFIVjkrcGw3?=
 =?utf-8?B?dGJjY1ZROHhMbUlKKzBGcG5TVEZJc2pINVJRNDRTOG1HWVVuY3kxTkgwRHp4?=
 =?utf-8?B?eUVsS295Skl0SXc4STQ2ZmNubTNXZms4K2tkUkxvcE9ISjJ4RjNDSldLTEZH?=
 =?utf-8?B?VlVncWFjNmkyOFpQSjdidFd2ZkZzaVZLUWVzakR6c0hvalhtZjArOHV3MDlz?=
 =?utf-8?B?cmcweHJxOXRVaitaY3pOdEV3SVR1RC9PQjhIQnUxY3FKTWJxL1E4c3JqRzJU?=
 =?utf-8?B?THlCWmI3S1NzSkxNWkVBU3VsRkVoak82Snh6TXY5eHB5eWk1dzJiOEd5OGY3?=
 =?utf-8?Q?zkrDHBrWhLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBwc3U4dDFQTzRzK3Avd3FNK29lQTdkOUlnNVYrVFp1Q25PL1dYc3ZhOWlw?=
 =?utf-8?B?NlNHd1RLU0NnNVJWY3BBcmxrUFZTcHQ5ZmU4TURzQWYveXNhaEhGSGdaR3Jm?=
 =?utf-8?B?MmI0bVZQN2J3Y0J5alJmcTQzYkNoOEo3M0dCc3FuU1VFcTVkUHFYNWZHbmFC?=
 =?utf-8?B?MEtKMzZOejR1OUNXTUQzNkljWEYyRW52T3RHeS85aUpwcDRwdWFyV1NhOHFx?=
 =?utf-8?B?ajhRc2RuMTdkUUs1RkwrY0dtNzltNmo2WnVITkxmcS9uWkJEVVdzS0VqTDJL?=
 =?utf-8?B?Z1ZzdEx6Z3doVkJHR1Bta0lsOTVLQ1dpaGhGcHErcm9aUjNKcnZCS0JzRU94?=
 =?utf-8?B?bVVMbkhsb1JYaEFUYVYwSjcwRjRLdGFtbjEwUFc0RCs5VXJleWVXYzZ2MlhE?=
 =?utf-8?B?bmQ1bHBkTzcrUmNqYXpqRDFPWDF0QXEwMVM2OHBsS2ZzR2ZnWDdRc1dSTlAx?=
 =?utf-8?B?QWFzRmVWZjhsdXMyVElyZXllUmZ6M0lHOEwrbEx6VmV6R2ZUMXQvcHU5Q1ZC?=
 =?utf-8?B?WFhHUkc4aDZaNWRjVjcrbkZ1bitUTzVtcFdRY2ZHbXJ2ODZzWndHdnhZSzB2?=
 =?utf-8?B?dE1GWjNncHBYbmllNEhoUFFHdjZneEJWY1NRYlBaSnFQQURGelpBaHhtUmlv?=
 =?utf-8?B?UTBpcXJObkVaMU93UUR6aUVrcHBsNm4rc3R1S1UxQTJhL1Njc0tnejB4SGN0?=
 =?utf-8?B?RzZoT05Rd0U4MTdLalViYml6d1ZabCtpcWR4cktQTzdWRkJENmd6emQ2ZUNm?=
 =?utf-8?B?TU1FbW80OXFUTVlHSkE5SlllRm5zN0ZnZHBBTTBwY29ubnlnOVRsZ2V0Zzl6?=
 =?utf-8?B?WkhwVlpsTVJJTkdGV1BJb0wvQ0RBdEZONzJOcThKTnoydmZUa2ZTSzJpUENn?=
 =?utf-8?B?MlUwUkpKZEFXTnUra0FkMXVRNXRpam1rWHkvT2c3NEVEV1p5aGxFMThuVW03?=
 =?utf-8?B?NFhxQ0MyNU91YlZhNjZ2RjljS0Z1L1FxK0swTVBJY2JvSVZLNkV0T3BhcEJi?=
 =?utf-8?B?ZFdNZGVpam9HYTYvclo2Vm5qb1hOL3lUWUw2M1l2OGZXbUovY3VtZSs0Nk1T?=
 =?utf-8?B?YnpvWkNPRm4zUmVXb2NsYVNQUXkrV1JZd0d1Qk5KNHB4M3YwQVFTVUpVczk2?=
 =?utf-8?B?VWc2dW9NOUl5ZVphTHZESjl6clc4SW1hQ2ZZNVhRdHBtREVHa2dUZzhxa1hT?=
 =?utf-8?B?WUNIT1M0UE9vRkxhMVVrT3V3M0ZaM0VLVEkrZ1R1SUl2NHdjd1lOQlZDOTQ4?=
 =?utf-8?B?bmFjMGRnSzNBdHg2U3lPSmx0RGIveW5HSmhQaUhVVWtITmRsQ3dRYVdJTkwx?=
 =?utf-8?B?L2ZMU1ZCVHZML29PVlFLaXllYWsxSjdRamx5dVlsUGZhTTdoUnB3dkdQTkxh?=
 =?utf-8?B?eXgvMlRTeTMzaE1wL1RLTU80ZW5zbUthRDlwUnlKWER6NWtDQTJJNGQxQVhR?=
 =?utf-8?B?NjljdVMyUzJPY3hqWEsrNVRFampjai9HeUFxZmxweUIzWmZqSS9QUTl5a2dr?=
 =?utf-8?B?ZFVQVFhYNzdaQ0puNXdqRG80Vk9NTUNacHZMNlBEQWpxNlpIeHg2NFJMSDBz?=
 =?utf-8?B?NWJjeFl5UWJYZWFLcDdkUjloTHp4SHIyMTUyUStyd2ZjbmRKd0pGaXQ5WFZN?=
 =?utf-8?B?SURWbFoyU28zTjhEb0FuS1N1a0J0eEI0UHdMeHpvVkZkQ1l4NU1qM3FNNWM4?=
 =?utf-8?B?NEpYMzJySUxZYkxCNlBvUXZ2Sy9QSEZ1TTdOOHE0Ynp5WG5zVkRMRlVIQVNG?=
 =?utf-8?B?cytVcXhETUcrWWRwS0VHVFhJNXNsTFhzdWlBMjVwNGxia3pDcFZZRmVYbUN5?=
 =?utf-8?B?NmxDNkFqU3kvMjZTUkhwL0d5QmZvYk9vVUgyWHRlTTlaY2hjQy9yOWkxRnVR?=
 =?utf-8?B?dmJabEdzK1FpY2MrNmZDbitveTh1UEw0U3NjM092YkZyV2RkVy9JSGU3K2ps?=
 =?utf-8?B?Qm5BbStEOGxKQllhaXppMm8veVRIRVNLQ3NES2w1bWQxSGc5eGpZSk1kcVNs?=
 =?utf-8?B?N0ZadkIzSFFMR21GMjcvellXLytZWE9JbEdaeU1yYm43OVBQT1ZCb0tjRy95?=
 =?utf-8?B?M3g5K3M3YXVzcW5ySHltUnl0L2owTTBZRGhpcDUvWXJJcHV3MCtEMVorMUg2?=
 =?utf-8?B?cW5qVXlIWTFhN0FXMUYvNnNETWs1dTFFZlJ2TGxhZHVCS2FmcTRsYmd1a3ps?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 623e483c-36b7-4d6e-8904-08ddb479e53a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:22:58.9920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fujOaYogviWVhq0tEI2YocNbM1rPe/RBZMJ2Iup2nMK3mynHjXPibdePB86hnY1n3L1MfM3X8rY47oneju3EU0QQ1hrRnAerE3WqKygefA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8806
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

Hi Pranay,

On 6/17/2025 12:01 PM, Pranay Samala wrote:
> This patch updates the linear-tiling subtest in kms_bw to only use HDMI
> connector. If the platform does not have enough HDMI outputs to match the
> number of requested pipes, the test is skipped with a clear message
> indicating the requirement and the number of HDMI outputs found.
>
> This avoids attempting to force modes on non-HDMI connectors and makes
> the test results clearer and more reliable on systems that don’t have
> enough HDMI connectivity.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_bw.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index ca05695d3..042edf32f 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -194,7 +194,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
>   	int i = 0, num_pipes = 0;
>   	enum pipe p;
> -	int ret;
> +	int ret, hdmi_count = 0;
>   
>   	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
>   	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
> @@ -215,6 +215,13 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   			continue;
>   		}
>   
> +		if (!physical &&
> +		    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +		    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +			continue;
imho: Better to skip the test instead of continue the loop.
Because even though pipe A is not hdmi no point in continue loop to 
check next pipe.
> +
> +		hdmi_count++;
> +
>   		force_output_mode(data, output, mode);
>   
>   		igt_create_color_fb(display->drm_fd, mode->hdisplay,
> @@ -229,6 +236,10 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   			 kmstest_pipe_name(i), igt_output_name(output), mode->name);
>   	}
>   
> +	if (!physical && hdmi_count < (pipe + 1))
> +		igt_skip("Skipping test: required %d HDMI outputs, but only found %d HDMI "
> +			 "outputs to force mode\n", pipe + 1, hdmi_count);
> +

if add skip as per 1st comment no need this this skip and hdmi count logic.

>   	ret = igt_display_try_commit_atomic(display,
>   					    DRM_MODE_ATOMIC_ALLOW_MODESET |
>   					    DRM_MODE_ATOMIC_TEST_ONLY,
