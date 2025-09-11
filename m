Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD18CAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 04:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638A410E29F;
	Thu, 11 Sep 2025 04:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp6HOwZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCFA10E29F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 04:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757563456; x=1789099456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HtRCBR68pkXvQpljiYk35DXX8FeHynEW7XiBbt4Vyao=;
 b=Sp6HOwZs1pePvJ14kMjNS07rNEuxgYLsSo67uMR9MyuJIjc+XATO/uKE
 tPh782QEhwkjJoCz05y+Wt6dc+o7haWD2N6FNE4/pOHpzYN3r099YQUmg
 MHFTyUwIw+cMY0002Iy1s8V602bjihcPnbnIIxopPxpmttIvdnIQ1xPWB
 yOy95YjDrEJi1NPCLeEw5ZrbGrxA5WJHD+t98GTCSJKOOT6aCgXC9+7lV
 A2AgYsiEOPCmEB30cR3SjSmjsqyCTqObE018e/OILxN3ffyJNySwzuQ3w
 ywIFvgGU0txsrOxF1NNJI833vCfdMELCVtWH95akZ0HzvQlzIx24IUQjj Q==;
X-CSE-ConnectionGUID: dWKLGEihTruzHUGi50FQkQ==
X-CSE-MsgGUID: YoT4n9zcTJ2V14mx2pKCeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47458576"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="47458576"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 21:04:16 -0700
X-CSE-ConnectionGUID: shuO9rt6RT+XDYkiK5dA3A==
X-CSE-MsgGUID: C77M8jpvS2O6KLJuUWm4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173646882"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 21:04:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 21:04:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 21:04:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.41)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 21:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHDvbAn+l7yTr3M0RXELNE7g9mA4rJ5FLuq+SGVNgn/dLAysjoMiciYoAQLoChK/amJ1VcSLG9t2qZMPoFOm3fbzO7L5DUbbw/g0MQLxbqLewT60eQS12FZ6dgaxoPkihAdshFXxLQJhfNSi/DNHcpnTHvfIdTDuK2VhfzcxAGZehLDsIQ55xw3EYZRYKg9OqROeec/0pVp8kkj06LGi6Jl3GSv9lZuoXuUvMH8kmyh06BUOuWA6AIm+SwZiiY/jUfoFZVEu+Ebpp2hxy8ePUjIFvroPycZdoOxkccdXPhLKrUFUMYV2sKtflWbSX4NntH5JFexQ5fuPL8Po27iOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzWQI5FbSvKuAV3x/O5HTsi0YAVRs29HeWGPGpiTsJ8=;
 b=n0+5zz/RQHBC9XTuDllCCkfUwukcVKMxi7X3F2ide3isTNE6NGoz8/2OecJ2xYOHQn+9xhn+CODHclreJxG5SGPzElmf5l9upoc9qNCbN5uS3FQ7Ci6y9qRGGdzPVqFRsnYzb5o3blS7MrC+DGTQeISfWaTqtVbqOTg1EkOgEKhQ7JZR8LhL/r/1aiUGPx0uQUhe87IwDdNJUh1MXEOkxrpJb3+Su+CYomZB47ew+Cpx2z0mGRzkx3IdPotloB4uhH3/afx72AWMTNfkt5/Li3mCQrcGhMzfJNyAdNBNS1jXvVZYfyNPZ42W3qI8EV/IhqKyBHyjpVZ94eWLcx7MMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 04:04:05 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 04:04:05 +0000
Message-ID: <a86918ae-f756-4f93-aac1-a11d4cfd2c81@intel.com>
Date: Thu, 11 Sep 2025 09:33:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4 2/4] tests/kms_joiner_helper: Add
 igt_is_joiner_supported_by_source()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-3-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250905210816.319104-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c96b47-46ee-4af6-3995-08ddf0e83fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnVNSHdXbUY3S2E3b2pQTS96U2k3WDg2dWtpa0lCSjcrZlVGSFZhMkpta0h4?=
 =?utf-8?B?VGh6RW1aZ1g5L3psQm1aMEw0OXpmRGxYSXBtdk5TcWRIdC82Zm5ZaDViSkFN?=
 =?utf-8?B?cVdGbU1qbll3dXByUmNkdUNacm5Kd1dvM1lEalNKZ2RGRVRoV3BlODNrdUFp?=
 =?utf-8?B?WDFiZUpkZE1OeXRwM0VidmNEZmVWVHEyUGtpTWtNbXcwc0FYVWxaZmVITmJk?=
 =?utf-8?B?K1lMRlVnLzVqSVpvQW1zeXdQZUY3R3M3MXM0SkFuZ09ydWQwcTlwdU50b3RI?=
 =?utf-8?B?UHgyUWRMb2ljTlBRR3hKcnErUlZGNDFhYS9IQmU3VVA1STlRdVJDY0h3RWZK?=
 =?utf-8?B?Qnk4NVc2ZFh6Z3puUXlwWEROZWRiK2ZFSzlhWHVtVnpGeHlWQTkyZTMrZmJq?=
 =?utf-8?B?RGRiMDJrK0hHSGZoUk9FbURFcC9kNCtxZG5SbFB0bnVCSHdiYUdJT0V2cHRu?=
 =?utf-8?B?T0YrWmttWmVSWDlGcFNMb1k3RzFENzFGRFNpeUZHRTkwcW5vdWNSaVAxbzhp?=
 =?utf-8?B?Z1lDcml6cVFGVkdhWStReXhBTXBpVVIxSVNOMkIyS25KRjJ6RzJudU5yVHZM?=
 =?utf-8?B?TDRseE83QW9MUTlncVpQWGJMU2Z4WXZhMWFYQTR5RCtwWDdTNkVoc3JPc3Nz?=
 =?utf-8?B?b0tFRHBreGdHVGhFRllVN3V5Q1FPdUQvelJSeDZPREhvaEdlYXNpSUdXV0NT?=
 =?utf-8?B?aDZ6VS9HMlBlNmI1amNCd1RoV0pCV1ZjSnpCRGdGaEJvMS9FQkFGNU1Kb1Z3?=
 =?utf-8?B?L3d0dmlhd3RIVkVqME1iUGh2YkZpSGt1RExaa2ZzZ3NkMVl4MlJmYyt5RWhZ?=
 =?utf-8?B?ZGw3ZkFaM1NQODhYNFlkSlNWMTg1SEkyemdacG10djVGdnJRSytodGhRQy9H?=
 =?utf-8?B?VGFRQjlyL0hJNldSd0h2OGZ6TnE2OEQwTFZmRFBYeEhiYWlXTkZGWlZrRXZG?=
 =?utf-8?B?cU41VFhETy82dTlZOXJ3bEFOcVBESUF1VXJoc0NhSHhUeGNydE5IWng4ek50?=
 =?utf-8?B?V095NEpWUVRhNWhrOWVPYk1wZVdsck1mQXVpOW5OTldBa3R1QmEvdXo2clZL?=
 =?utf-8?B?bWdOYUZ0TDJTT0pzU3o5RXhmVWppWExNb2VFSXlYdkoxMTFXYWZSSmk2NDlO?=
 =?utf-8?B?Q2pkSUJmYVNpbzMvMzRGdkNQUmVUSU5wWW1tZkhRUEljZno2em9tQXdES2lt?=
 =?utf-8?B?dnMzWVFlbUNzbTFybUNiYmNaMHZad1F6RmtvRXYvWGU3UXVDNGNWOXA3bmhV?=
 =?utf-8?B?RnFrb0FjZXRNZzFnc1lsNmRzK2EzdlhwRE9yNkN5cXlNSmg3Znh1Z2wrOC9i?=
 =?utf-8?B?QXlleDc0eFl3WmhOVDBEeGt5N2JHdmUrbzVCMVpFR2xZbzI4U0hqV21BQzBy?=
 =?utf-8?B?aXJiZy8zaFd4eW1LVFk0WUpJSmc3TzRSQjNQcmxSanQ4bTM2WE9LdnVuR25w?=
 =?utf-8?B?b1pmRjZuSXNpTjFrMmd0V3pCRGl3dGc0VmVJbzVjRG5kcXFFQ2ZIUkVzYnJr?=
 =?utf-8?B?V1BTdjMxVWhPVitEUW9TdDlTdzRFSzBWYlNuai83bXNJVVFZY1BpaTliK25E?=
 =?utf-8?B?ZkhIWWJqWTdBQnFLK2dSbHNzTUVrN0NDaHNZeUdZYnQ4aDJFdzRaTE1Za0pX?=
 =?utf-8?B?Qmd4bnhUYzEvU01rdVdmcVZ6Tk1wdTlDM3h6SWZ3bzRQY0ZFMnNzMEg4WG9J?=
 =?utf-8?B?b3kzcW1FVlFVL0RwaHQ5SHl5Smw3MVhoZzc4QjZBSW9kYTFHdG5pd1pUa3Jr?=
 =?utf-8?B?cjBiZENRVWgrRTZLdTdjZU1aczh4S2hRaS9IbTkvZCtRWVNQWDhWZnBWTk5X?=
 =?utf-8?B?bzl2RnRFSFk5bGFqdHJkTklZNGZPejZaQWNFNWhFdkVGTVByYmowRFdUK1FP?=
 =?utf-8?B?cnRTQmltKzVlalgrWis3d2lVd2JocFdlYnVHWVI5L0k5REF2VEhkaTdjVWtU?=
 =?utf-8?Q?p0DSEZ/J5Zc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGN0ZXozbzU3Wnh5Z2RsbzRqQk1wWGxkeHd4eU9oK0tPWUtkemE1N0syd3ps?=
 =?utf-8?B?TUxFRWNGdWI3YjYrUjQxYWFKQ3FYekY0MVR1VWpkNDFpNUhuUFFZTU5wUVpt?=
 =?utf-8?B?S25XcFRiMGhOVjQ3cnQ0R0o1MUp3K3B1M0ZKbklva0lOaE9WZ2hFdlkwUWhQ?=
 =?utf-8?B?cTB2cFFMeWZ4d3lWbU9WNm82MTRYSjVXUyt6VXQ4YkwvVXpyYmlHL0JTTnF5?=
 =?utf-8?B?QXlzUlZ4LzRNZEt4eFNZVUU0alhUdVRZa1MrdmExcFZiM0xBbXgrNWE4RCtk?=
 =?utf-8?B?QlRnZ2w0ZmozTXMreEUwOWVQWlA3WkxFbmcvb0l2RFVBMjRpcnk4dXg5Mld4?=
 =?utf-8?B?TUtWa0FlL242eHR1VlQ5b0Q0bDdPejY3ajJUOFJ2V3JpektNSGdwNVpnNVVL?=
 =?utf-8?B?SXNsWXF2Q1FjY1gyMTJ4Q3RwcXJ2S2N4eUczMGZpQ2haZW0rVXR3U1podTRU?=
 =?utf-8?B?aTFQR1QxTDhSbDdVc2tRenhwWUdZbXBoQXZMWEhyMS94d3hiek1zZGYzMEo3?=
 =?utf-8?B?Y1lUTytQdFAyR3pES2hlUHdkWFRUYjFjT3l1VFcvbzVHQ3gxdmh0U3N6Tk93?=
 =?utf-8?B?RjFXclpFeGQxNWlIUGNlQlIxeDU1QXV0Wk5HVXQxRzNPSUpuUXpJOUh3anU3?=
 =?utf-8?B?NUFPVGlEZzJiY0xqT2FDbDNBZnhpZ0FuNzE3TTV0S1RCZkFsVklORER2Um9a?=
 =?utf-8?B?LzBXd002dkV4ZGlHaDhmT2dMTmpCWUg4WXRlTHljYkZId29rWEN6N0R1MHBi?=
 =?utf-8?B?eTNrL3NzZS9hOUFFTkY3NUhjQ1NIY1BwdkhYQmpZNTZQVzV5T0p3WWZ1Uk44?=
 =?utf-8?B?TUdWcTlCLzh2c2pIQTRySjVieExEV1N4RSt4eGRPeElDS1ZBbmRwKzd2UTFU?=
 =?utf-8?B?OUlXaDFqWHVGc2ZLNmpVY3luTS9jMGprQzVhV05uZXRISzArUStCRjM5SThN?=
 =?utf-8?B?NFFWSGowdEhZSi9ZSjVYRmZCWDRXaEpCcVNIR1JXZFlRZHBITmJxaHlvdmhV?=
 =?utf-8?B?U3lGeGFZbTlERDgzZlJQK0lFUjFJbzV0d1Z3M0xXcUZGS0V6cFZyR3ZkK1d2?=
 =?utf-8?B?OTZZT3JjVVdraDVGSWQ1andtN0tNVDltYkRyY2lZcFVVbEkwU05zWmdONVFx?=
 =?utf-8?B?eVJmK2NNdTdYRG94K0s0dE5oYTJjQzV4NDFCQVk1WVNkS1BOUDdrWEdndzgz?=
 =?utf-8?B?b1R1VEhqSzluc0p6aUZML3lJT2RicVRDQ08yaFhuMFh4d1RNRUU5RzFsQWlJ?=
 =?utf-8?B?MWxPWUhFcXV1bm1jZGVOZkw4NGplVUxKZldCMllSQmdSSzd2MkErdzBDSFVl?=
 =?utf-8?B?dHo1M0FTbHJJYzFXci82aGJsU1EyNGdIOEhBckE0c2FSMTd4eVp3R0FiUlEx?=
 =?utf-8?B?aDN3MlYrd1VWb1ZNcmg2MlY0NUVNNDJHdzc3S0RLWGFLWVA3SEhEZUVlZWFu?=
 =?utf-8?B?RzVuNTV0K1JwanVSUVB5c2cwM0pIaHhoRzhwamsxMmFvNURzeWQyMzRvemtC?=
 =?utf-8?B?TTE0b0FZVTU3NVg2NWpRWlNqWUIrdFE5S21mcklsTEc5ZmZ1ZXJycUM2Z0l5?=
 =?utf-8?B?YklNU3lZWGZMM09BQ0U4T29jaFdFT3NkS2RxMjNKL3h3d2wrbW55RVNwaWdO?=
 =?utf-8?B?bnY5NXFJQkxmZGJ1aXNSL21IUnBqNjNSZGUrbXhHaUVoVXJBY3c1dlhzNU9B?=
 =?utf-8?B?VEx3T0Q2YmlXS1I4U240Sm5weUNMWEozRWluNE5tKzFSZVo3SkxVWUZQMGtM?=
 =?utf-8?B?L3poS3hMLzNvQkVuNmk2WUU5UjluZ1Uxci9rNjFtdkc1RXZNMHU1ZTJXMk1U?=
 =?utf-8?B?RDJ4ZzNHcmlUMkswQjRvMi9EQ0xMUFZWdnhFeEJuS3U4amlVbTlBUld4QXgv?=
 =?utf-8?B?TkVialZtazhYbndnNXg3L1JnWUlheXF3cXNhY2JtZkFrQmlhVnh0SXRDWkth?=
 =?utf-8?B?ZXMzTVY4dWFwQWt4Z2toRFZOOHVxRWV5QlZtV1N5VnpBM2JBVVN0YXJiSWVS?=
 =?utf-8?B?eG9SZWtoY2dQWG5HV2M3d2JDSlNlNlUvV1MreFk4dE82bVQzL25UL0pIa2hY?=
 =?utf-8?B?UlBIN3VKZFdPUkdrWnF6d2RHNTU0TlVOVmJRSVZtckk4SFpyV2VIc3Y2V0xs?=
 =?utf-8?Q?Q/wAaKkILAMAxs9X4F7ZEf+SW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c96b47-46ee-4af6-3995-08ddf0e83fe9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 04:04:05.5607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dlud/Pfubo9+2sY/Vw1Hghcyv7GhCyNwJzZoI6ParQLX6ZUvjb2Di7cdL1ucrM04kcKCMLdJkrkhZ9skvJxF+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

Hi Swati,

On 9/6/2025 2:38 AM, Swati Sharma wrote:
> Add func() returning true/false if platform supports big/ultra
> joiner and use corresponding func() in related binaries.
>
> v2: -Moved func() to joiner_helper (Jeevan)
>      -Use common func for ultra|big joiner (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_joiner.c        |  9 +++------
>   tests/intel/kms_joiner_helper.c | 33 +++++++++++++++++++++++++++++++++
>   tests/intel/kms_joiner_helper.h |  2 ++
>   3 files changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index d1ddbeb60..e5cd33ef3 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -33,7 +33,6 @@
>    */
>   
>   #include "igt.h"
> -#include "xe/xe_query.h"
>   #include "kms_dsc_helper.c"
>   #include "kms_joiner_helper.h"
>   
> @@ -546,8 +545,8 @@ static void test_basic_max_non_joiner(data_t *data)
>   
>   igt_main
>   {
> -	bool ultra_joiner_supported, is_dgfx;
> -	int i, j, display_ver;
> +	bool ultra_joiner_supported;
> +	int i, j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
>   	data_t data;
> @@ -570,9 +569,7 @@ igt_main
>   		igt_require(data.display.is_atomic);
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
> -		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
> -		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> -		if (is_dgfx && display_ver == 14)
> +		if (igt_is_joiner_supported_by_source(data.drm_fd, JOINED_PIPES_ULTRA_JOINER))
>   			ultra_joiner_supported = true;
>   
>   		for_each_connected_output(&data.display, output) {
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index 17a22d34a..8f77ccde4 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -179,3 +179,36 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   	}
>   	return true;
>   }
> +
> +/**
> + * igt_is_joiner_supported_by_source:
> + * @drm_fd: drm file descriptor
> + * @type: joiner type
> + *
> + * Returns: True if (ultra|big)joiner is supported by platform, false otherwise
> + */
> +bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes type)
> +{
> +	int disp_ver;
> +	bool is_dgfx;
> +
> +	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
> +	disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
> +
> +	switch (type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		if (disp_ver < 12) {
> +			igt_info("Bigjoiner is not supported on D11 and older platforms.\n");
> +			return false;
> +		}
> +		return true;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		if (is_dgfx && disp_ver == 14) {
> +			igt_info("Ultrajoiner is supported on dgfx with D14 only.\n");
> +			return false;

We should return true here based on the 'if' condition above, please check.

Thanks and Regards,
Karthik.B.S
> +		}
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> index 8a6f8e5ad..5f55fe4be 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -7,6 +7,7 @@
>   #define KMS_JOINER_HELPER_H
>   
>   #include "igt_kms.h"
> +#include "xe/xe_query.h"
>   
>   void igt_set_all_master_pipes_for_platform(igt_display_t *display,
>   					   uint32_t *master_pipes);
> @@ -17,4 +18,5 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   				  uint32_t *used_pipes_mask,
>   				  uint32_t master_pipes_mask,
>   				  uint32_t valid_pipes_mask);
> +bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes type);
>   #endif
