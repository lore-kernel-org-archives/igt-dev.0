Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A080FD49225
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 13:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4426010E72A;
	Fri, 12 Dec 2025 13:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6KUkHI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BF810E57D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765545300; x=1797081300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DhiWqrdpXuKWPOAb16elzUjfXwNtWVg+qLZ/ydpfGeo=;
 b=d6KUkHI2gbZpKbCG8STdY099y4aIkS07r2jRSg0y6EtgitrdghmmDnWZ
 TI91xIWaDKsKwS0WbrTogEzeQHUs9TF2R8S+yz4ov3hWV8SwAScz313ZZ
 DbRKnTswsjMpHI5Z3G60GobYmd61LHi0/6gbWoYfFAARpipq9tJKeekGy
 a8OnAwNuIMVCzk2iBCtswSj3+u6plCbUxP5ya5toreU0OlVAuAa8m7fTF
 3I8NumEykjUSUEn8JJCRLX5CzmSk5c8fYfnis9UQV8wozFPIYeWKiBwhu
 mtmXbh4d3V0im9DfNeXe5G0WfpyZQrxyjmnHHuCft9gipidCXTHgrEN+2 g==;
X-CSE-ConnectionGUID: 1vAy8i/gQ0GlUHUjjpX8rg==
X-CSE-MsgGUID: 8RVpqqfjQHKcOXWHjY6YHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66718311"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="66718311"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:15:00 -0800
X-CSE-ConnectionGUID: Akcxf2PqRU2o9CO7HZKMQA==
X-CSE-MsgGUID: wHrBVx8CQymqH2LBA03C+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197914187"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:15:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 05:14:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 05:14:59 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 05:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVA1xLDYKJ/L32DDeji06hKsJreaAJJevIXG1O37nHnvjy05gh3WB7BBiqOlZuD6JrJaXe0DjEEy+P1qYoBMWLwyJ24Q4MlFzt4vWt/tG9T0URm25vsABtLYjDIZm4lV9HrmWiejQL6cYYtENvwhGEAxz0eRliFukF9n9fnOsWRX8VkV7tunor/GLY+JFCLDA0O7srLUeYOyVlQLP3QtOSlt2Mf4uxMLTs+3fKKf3B+aMnjULt9L30JurXGyZAXhzAwQe9mfuFJ3FRxvBQ1tHwtRobndAh6pkijN9svbiT486uJB2sUcKXbS3carEDfP1dUaO+/TO1RhS9FiyB3SMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpW/5MKiQSQORKxnM0Tk8EJ9hgy8BhDxmslIsvyzs78=;
 b=hW0YsCdcImbaUQrwtJwFKlSS1Tup/7kMd57G2aI8C94iRMr1gQW+NDnRmaVAhtzX9yadwpIcnIlYmYimtLoJHYEt3s3Hwf4wM8rPg7xGhHwPFed3jjbSS/rjh4dZBWPgC1zJqEOKXAtYP+MuRlTSj94PEuh4scmdGOrWSEkbmK7GSv1j9sVyO6qz/agotQX6M4lcw/q1ESso6wxMv70i7wZE5m6/lcd08TBzkxJJtYcV15zmsc7oinwr50v+q2IEiX1/wY66bBOeqCcovrZUPz3e7ekmflDhjH/0TM8o/MntekErYBYOzv9xkBLWTG1NZIGe061LxRMeO5QHSVoOJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DM3PPF960565C2F.namprd11.prod.outlook.com (2603:10b6:f:fc00::f39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Fri, 12 Dec
 2025 13:14:56 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 13:14:55 +0000
Message-ID: <d4bee9fa-6155-4b3a-9206-3719a34f65af@intel.com>
Date: Fri, 12 Dec 2025 18:44:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/2] lib/igt_device: Add API to get pci device
 upstream port
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <kamil.konieczny@linux.intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>
References: <20251210104400.4141969-1-karthik.poosa@intel.com>
 <20251210104400.4141969-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251210104400.4141969-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::9) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DM3PPF960565C2F:EE_
X-MS-Office365-Filtering-Correlation-Id: efa6c63d-d738-4022-1105-08de3980710b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2ZPMnlxaE5JeVRDdkxyc3pGRU8xV21nYnVTVHJIV0s4Wm5WU2QrUjQ3aTNG?=
 =?utf-8?B?bm5CZkhodHZYVG1TY1Q4VVdFRlFvR1VBZ0hXcnA5azNoNGRycngvaXJ6YVIv?=
 =?utf-8?B?OVBWc1dqMjlsMkRJSDNza0diVDFzK1U1N2FqRlo3cVlkT1lLcUVPMnExb0x4?=
 =?utf-8?B?R2pMTmdaRWF2VTBkVjZnak51NCt2bkNDQXZKdDhnaTdjUk9RdWE2Y3NneVhG?=
 =?utf-8?B?ZGhRVjltYVljanEwRUdUbTVDTzB0UStBVnlpQlBhUTZSWnQ1ZE1BdnUxa2xU?=
 =?utf-8?B?Z2VTOHB6UndlRnhkSG9aVnRzUEtMdCtnQjU5UndISWlLMGJ5SHl3T0YvM3dS?=
 =?utf-8?B?V3NrbUtkQnl3S2RjZDBzdlpPUzBuYTJ6c3E1VEgyazRoTkdPYWd5Ty9yMklJ?=
 =?utf-8?B?NG1QUlRWQ1Z6bEZIbVk1NHM2TXFtZXJ4RW5VNmRBbWFRSGE2L0FySkdsWWkx?=
 =?utf-8?B?V1ZVeXREMU5VdkRrdVFoVTJHSFlKNno0YjZLY2tlbVRZSnRqSjArcVRmMU9z?=
 =?utf-8?B?NVRpc0ROWEI2V1QxczhzMDlTSU9RK3VDdUVXeW5Xd1BIU0ZTZGVUdXhDQXJv?=
 =?utf-8?B?RitXWHRaLzBsNmc4aDdKVzZmdWRaZk96UDV1QWp6OUp6REVST29HZVhNb3JS?=
 =?utf-8?B?SmpFMFZnWEl6WjBDQzl4bmtOVkExRHZuQjJZaXo5dVc2K3NWbW5xMVZQLzR1?=
 =?utf-8?B?TlVjaGpYQkkrT3JGemJlNDVua0xvdkdVbDl4ZWtvZmJiRUczc2Z3dU9mUy9L?=
 =?utf-8?B?VDFZd29TYXNhY08weldCakxDWU0xRVVEZGZodFpYaHp3dHNoSHVCVjVKR0Rv?=
 =?utf-8?B?RWc2Wm91NFRMQloveVlDYjVUZDd6QXA5bVI1MVRteUJSZSt4dk9DMVRLQzdR?=
 =?utf-8?B?OGI5SERKVkZMYjlkQ3pNaDAxeS9pUGxaaTZ0Qy9pcytxYllVc1V1UVVPekZC?=
 =?utf-8?B?SHloS1cyUG5VcGRlTmNLL1dwaVY2N0JQR0Njam1ydTQzU1dNb2dPNnFsckRO?=
 =?utf-8?B?RmFxaFpMZ1VPcnRQRkFFQ3p6SFpKVDRrMnlEME5PT2dTWjZoa0NEeGtjUmNW?=
 =?utf-8?B?dmlxY2dlZmF4czdnd2w3OEVjNVdDWG13NEpBMXJzdzFRQWVqQmZ2M0Y4Wjdw?=
 =?utf-8?B?NUJudE9GZEsyWUVjTHdLTGZVWUV1UTlhS2JzYUhVdnF6MmhndXJzRDFZSzNG?=
 =?utf-8?B?RzlhamRGU3E5THJ0aFZLdytWanNUbTRLNlR2Ui9lVWdGbzRxZzNQek4xRTBN?=
 =?utf-8?B?Q1pDU3AzYmJIWWpDaDZrWG50OENjODBURUZ4ay9ZbTBtcGQvZlJmVExDU0R6?=
 =?utf-8?B?bEYyOHB3ZzE5TE8ySDd3NEZpa2JOc0FXNDA0VlpKSXJlUHhTTVJOT1JXOWpF?=
 =?utf-8?B?VnQvdGVjdjJ2dlZET1RKM3E0YXVoeTlVVkxpU0w1UWZmb2pZN0FESWRWY0tk?=
 =?utf-8?B?Mzk5QXFUelFURW1iN0hISURram9Jdzl3WnNGc3RqdlNKVzlLYWgrb1RFU0Ft?=
 =?utf-8?B?VkJHbW5LS1U5UG52c1lmMXRxNy9VMnFaK2toeFJFK0JUdGg2QklWQjdpalN5?=
 =?utf-8?B?Zm9VREVvQjBGRTMwTlBOa0JlcTdHYTNnQ2FqY2lpc2dIODkraC9vU3RwQlV0?=
 =?utf-8?B?bTdmVkxpSjJ6em5JcS9Ib0VIQUN0WGVtZzZTbm1jWnpKbU81RGlmN29vUHFv?=
 =?utf-8?B?WFI5ZjN2Qkw1THJxSCttVWhPY0JUVXorT1Awbk5yUVJscEtIdGlCZTFNeDVR?=
 =?utf-8?B?Z2xQeU5Da1Fub21zcG5nK0dQOGtVa0RYT1NuUm51RGxrb01ZY3hkZjJ3RlFL?=
 =?utf-8?B?K0xhVUgvT0JrQVlwV1RUOEQyWVQwL3FmTTU1Y2VBRlRseWJlZCtrUjFyZ2lP?=
 =?utf-8?B?b1IzNi91UkF6Y1N1YkVLNnU4aEFxMml1L1pSQm1rSEROYTdKZm9udmVudGJR?=
 =?utf-8?Q?IQsNF/xwYWMse410uzGpUfFjtyJUKkT4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUx3a1dPY3FMT2dsL1psckYyQjQ2LzhRTkJueXJ3bUdSYkVYRzRHSG9iNDV6?=
 =?utf-8?B?TnBmYzE0N0U2TExNM2xialcvWVczY1VTb0tNOHM0OGMrUnhBT0tpWW52UDVw?=
 =?utf-8?B?ZHZYN0U5Wkl5aTVxbE4zSS8vdEJUSU43aVVBZURJWUhrdVVsV2dqeWJmMGIv?=
 =?utf-8?B?alJwZkV2MjBaaUtPcTMrUHdJSkQrK2t4c3pIVHZBQUM5SWZvcnFLMG1BL0s4?=
 =?utf-8?B?TTRaSjhwWjlHTWtkQUNySE5KZlp4S1hTZTgvL1Z3UEVKWEE2N1NSWWNWclNM?=
 =?utf-8?B?eHVDRmxsemFPc0hrNWZnV3dJbFczL2x5MjJCQkRKT0IzejludXQ2UlNXOUZ3?=
 =?utf-8?B?K3UvZmdFODB2ME4yK0hkaEJLU0VleFdPblBWYVkvVnF3QkZYUUM3aXQ5SHhR?=
 =?utf-8?B?NGpEamZvSEU1ckJlMkZhL3NwZnFobVZhbFVQcFl4N3NXWmRrUXhXWmRPQjNV?=
 =?utf-8?B?Yk8rTnpGWm96aFY1ZXhRRXBTa2hVK1lTWmRzcnBURi8yeW1wOU4raUlEN1ZX?=
 =?utf-8?B?TjRGL3pxb0N5K2VHSlkzYW1sTWZSTWpDK3VHazl5OTZLT0FhcXJyM2NRMmNt?=
 =?utf-8?B?V3FLOTd1bXo1YWRXckpWdU5vaW1OS2NHOEZsbVBCSUJNZkp1WUVVTm9TU01X?=
 =?utf-8?B?U2RtZUlVeEV4YjRCWDNxZDVIU2JTSWgxdWZPbmd3ZXUzbFE0Y1pZWmNIUGha?=
 =?utf-8?B?SzJpdDlPNFNvTi82akJUbEdXcitUZCtVTllQdUpRbXQvWXZTQTJqUi9pSmF3?=
 =?utf-8?B?cXNRZVQ0U0NzbGFLQ0l6a2ZITGpOUFpHRFNUSVgvRXZudEIzd2RYcTFSN1hJ?=
 =?utf-8?B?ak52K09LcC9IYm91SDNGaW5hZzhwVllITmdiYU1ZRnR6aW4xaTBNU1ovc1gz?=
 =?utf-8?B?YXp0bVN0K0NZTElsR0YrTGtXcXZLdWx4dWx2VWtCdEswU2RWWVVVa0M0Syts?=
 =?utf-8?B?bm5OTEFGYnk4ZVpLWjlwWGo4RVdpNUlaU1JaK2RDQXpCZ1RTcEhhZjVkTmdt?=
 =?utf-8?B?ei9oM3Y5ajdaMjJNQ3B5dVNyc1NITHRtZHlWWFdQWGlwaXI0bnB2ai9TRUtu?=
 =?utf-8?B?b1NVNGdSTTFvZk1EM0JISUswYTljM0ZXWklpRDNvRUNCajVjSlpodGdRckor?=
 =?utf-8?B?TXpoQThaOUt1SExROEV5NnFxUHV2QmhPT1ZrTXVyU3Jwcm9KWDdEdFgzMXZp?=
 =?utf-8?B?R3puV3dBNzlXeHQ1aEc2UWorbm1zSXV6WlBudjZhaUVQZVZGbjdOMTNLcjlF?=
 =?utf-8?B?NVg0L3MzRis5S0U3V1FwT1NQeDdTSG5zR2JmOWlINjM3ODRJTVdhTVJXRkpw?=
 =?utf-8?B?NWQrSFhOSi9OeWtzcVFZR0ZCeDF0TFh2Y2NvQ2JWSUFaYldzblZGMXNWYlVV?=
 =?utf-8?B?NElxN1dyTmZiSFEyM2RwUFJkdWpaL0lCdS91UkhVNDc3TkF4Qld1YnYzeXYy?=
 =?utf-8?B?SnJuUEZwN2swQ2FLbmo1TzdSelhLL1p2MUYydzQyZnVmOEJOUXBJcWEzc3RB?=
 =?utf-8?B?ZGozZGZtODhSMDVPSDhVYWJ5Zks3TzVmTmV3VnRJQ2NvWVZBY1lkcVpZaE4x?=
 =?utf-8?B?cUNQWWZGaXc5UFlDckJITExhUzAxWG5HMDBmY255UG9GeXNDcitpazVxNURX?=
 =?utf-8?B?S1BoMi8vY0RoN2JIcE91U0wyM2hWUWRpK1k2c3d0b0QyemNJYkErT2tJclpt?=
 =?utf-8?B?OWVmS3luaGRXekVNeU1WNFY3N2c5T2lMU1pkT0NUMDN1N3JibEwzRks5eWhS?=
 =?utf-8?B?eC90NDlZQjdFVXpCa1BYUTQ5MjFkS2Q3VUwyL2RicXdGTlhGNWl1a24vd0JG?=
 =?utf-8?B?M3ltWTRWSTQzTXQ5VmJ5R3h1bkI3T1RGWWZwL0hUb2UvVUEyZVZtVkJLOWR5?=
 =?utf-8?B?ZHNhbWlTMnVjUnRXays4TWRtd1RLR2VZOXUrMEkrVS9KM243MVpKa0pDalAx?=
 =?utf-8?B?alNTNENTVVZ2ckNrb3V5YTV3M25GVEVpcHU1amdIMDIvbUdyMEl6djV4T05I?=
 =?utf-8?B?V1JlcE5NSFpNSUpBQm51aHRGVkNqSFFQZUxuc2NpTkdPUU5UeGdrK0FxaG4w?=
 =?utf-8?B?ZXFNaHJ6bFZYdllTUTF1Wm9wYlJjRjZ1Mk9SZnFHNXBGdkNGSzJJa3hCa0h3?=
 =?utf-8?B?YUpWQWZCUUN6K3lWak5jRG5sa250MWk4OVd1NThKK0JMZDZ5aEpQM0VPZmpp?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efa6c63d-d738-4022-1105-08de3980710b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:14:55.7499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAMk5Iao4uV+WqAm/UtmIS++gsbu25Mhp4HQlLzW3EZCUIb1T/Sd/CVHckdF19qU9GN9e0YE9ZjS80j+JjU4jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF960565C2F
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

Hi Karthik,

On 10-12-2025 16:13, Karthik Poosa wrote:
> Add API igt_device_get_pci_usp() to get pci device's upstream port.
> This API returns struct pci_device* of the upstream port that is closest
> to the root port within the device's hierarchy.
>
> v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)
>
> v3: Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port(). (Kamil)
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/igt_device.c | 30 ++++++++++++++++++++++++++++++
>   lib/igt_device.h |  1 +
>   2 files changed, 31 insertions(+)
>
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index c24f6a58d..f46af746e 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -308,3 +308,33 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
>   	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
> +
> +/**
> + * igt_device_get_pci_upstream_port:
> + * @fd: fd of the GPU endpoint.
> + *
> + * Looks up for the pci device's upstream port using libpciaccess.
> + *
> + * Returns:
> + * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
> + */
> +struct pci_device *
> +igt_device_get_pci_upstream_port(int fd)
> +{
> +	struct pci_device *pci_dev, *prev = NULL, *parent;
> +
> +	pci_dev = __igt_device_get_pci_device(fd, 0);
> +	if(!pci_dev)
> +		return NULL;
> +
> +	parent = pci_device_get_parent_bridge(pci_dev);
> +	while (parent) {
> +		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +		igt_debug("PCI device parent %04x:%02x:%02x.%01x\n", parent->domain, parent->bus, parent->dev, parent->func);
> +		prev = pci_dev;
> +		pci_dev = parent;
> +		parent = pci_device_get_parent_bridge(pci_dev);
> +	}

The above logic works well when only a single card is connected to the 
root port. However, since the root port can support up to 64GB of space 
and BMG requires 16GB for VRAM, it’s possible to connect multiple cards 
via an external bridge.

<6>[    2.007178] pci 0000:00:01.0: [8086:460d] type 01 class 0x060400 
PCIe Root Port
<6>[    2.007206] pci 0000:00:01.0: PCI bridge to [bus 01-04]
<6>[    2.007218] pci 0000:00:01.0:   bridge window [mem 
0x80800000-0x80afffff]
<6>[    2.007235] pci 0000:00:01.0:   bridge window [mem 
0x4000000000-0x50197fffff 64bit pref]   //64GB

<6>[    2.140664] pci 0000:03:00.0: BAR 0 [mem 0x5018000000-0x5018ffffff 
64bit pref]
<6>[    2.140679] pci 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 
64bit pref]      //16GB

In that scenario, instead of returning the upstream port, 
igt_device_get_pci_upstream_port() will end up returning the bridge device.

To find the upstream switch port, while traversing towards rootport from 
the endpoint, we should verify the Device/Port type field (0101b: 
Upstream Port of PCI Express Switch) of PCI Express capability register 
of each bridge device.

PCI Express Capabilities Register (Offset 02h) [7:4] Defined encodings 
for Functions that implement a Type 01h PCI Configuration Space header 
are: 0100b Root Port of PCI Express Root Complex *0101b Upstream Port of 
PCI Express Switch* 0110b Downstream Port of PCI Express Switch 0111b 
PCI Express to PCI/PCI-X Bridge 1000b PCI/PCI-X to PCI Express Bridge

lspci output of USP

root@DUT1104BMGFRD:/home/gta# lspci -s 0000:01:00.0 -vv
01:00.0 PCI bridge: Intel Corporation Device e2ff (rev 01) (prog-if 00 
[Normal decode])
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 16
         IOMMU group: 16
         Region 0: Memory at 4060000000 (64-bit, prefetchable) [size=8M]
         Bus: primary=01, secondary=02, subordinate=04, sec-latency=0
         I/O behind bridge: [disabled] [32-bit]
         Memory behind bridge: 83000000-840fffff [size=17M] [32-bit]
         Prefetchable memory behind bridge: 4050000000-405fffffff 
[size=256M] [32-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA+ VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
                 Address: 0000000000000000  Data: 0000
                 Masking: 00000000  Pending: 00000000
*Capabilities: [70] Express (v2) Upstream Port, MSI 00*
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ 
SlotPowerLimit 75W
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 16GT/s, Width x8, ASPM L1, Exit 
Latency L1 <32us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; Disabled- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 16GT/s, Width x8
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP+ LTR+
                          10BitTagComp+ 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS+
                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
LTR+ 10BitTagReq- OBFF Disabled,
                          AtomicOpsCtl: EgressBlck-
                 LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS+
                 LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: Upstream Port

Thanks, Badal

> +
> +	return prev;
> +}
> diff --git a/lib/igt_device.h b/lib/igt_device.h
> index dad7bb047..781a72235 100644
> --- a/lib/igt_device.h
> +++ b/lib/igt_device.h
> @@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
>   struct pci_device *igt_device_get_pci_device(int fd);
>   struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
>   struct pci_device *igt_device_get_pci_root_port(int fd);
> +struct pci_device *igt_device_get_pci_upstream_port(int fd);
>   
>   void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>   #endif /* __IGT_DEVICE_H__ */
