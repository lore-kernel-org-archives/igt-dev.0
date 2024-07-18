Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AB7C3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8372310E806;
	Thu, 18 Jul 2024 12:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9VqLvFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3897910E806
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721306962; x=1752842962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Pd/zzS6bfaGd5O/ghz+iiDjCPI4hZYX7J8vvXA3tbI=;
 b=Q9VqLvFDCCLDhWtAs2bocVCBU8evAwR6PjAe0sAPqKBQXq6PoEQOMjhB
 z6DEZpt++lseXLrHzgGcSrCJ7EHbsuJ1ucuYWhNXPIF9nW9hi332j8l1J
 VvtKwuHEZOMrk7Jjihiz0y2UNFkwUJHyLkd6/BcjUAeLM5foxJ6hnZ9WE
 pKOa57nsk5TZwXxndbl1CewY+DaHLEiEcW4POzlIeB9mmBDpUC/VxFbBI
 qoo2qJ5pb/9n7N8zvKFvgSVdkRUQoOtA8wJ+hbDxUnLhDUOcIC3WTJ94/
 tiVme8xI8luCIhsCYSj9MGEYY3vbZrG4YAYddIKODpNPIoFN83A2Su8IC g==;
X-CSE-ConnectionGUID: Ma/QfzncQa+euKfYwxaxuw==
X-CSE-MsgGUID: TOrM7VIGRaqZsXYHMXyNlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22634424"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22634424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:49:21 -0700
X-CSE-ConnectionGUID: yE3rbpxSRUi7dBV0uBulBA==
X-CSE-MsgGUID: i0Gg3ETyTDmNA+GLdxiJ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="81404309"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 05:49:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:49:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 05:49:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 05:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHc9RfgRHTKcF/Du1qxn+nl+3CR7g3IsQYhr5pRYrnoHcYY7nDjlksKqIVxFxGVYotnrQg+EXmBg/d9LSeSG0iHEDxFYNqk1VFek4Kuekx3XjVQXwkezgt6dGTGM9tQADZ3sXUo6ZJEDirCSKxKKv0jbDA+mSHEbqDJ/zM4+cS7ALfr1I7erocQ9au9vR251a6JykYyhCHdH/mNj1WdZwz8gKiyyJXjPz+BAhR5rW2UNUhG8KUeMEZcedUCwL9hD9PiEH1Evafy5AfEgWJV3UE+/r5Txu6aphGvDRTbx1OKSXe5UP8RK2Aqcw7wBeF2Z0JtedH46OBtCYTgDPu5bQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3UpHeI4Ex4PIgQ5Q83Jx5oclNbiaLl5Kx2Saco82+g=;
 b=JrE+FcOw8wYd3PLeosNA9CEWARP9veiVRgKStrb8cl8bqTE+orzgQyjl/xYXqOGqA2avyOt9wgaeHqrIPj9BETPs6b5THNLQTTMsCVOMA/pPnGGHKRqs48A2zxbL38TDetZR4LjMCVmGQ6FaqYzB5jBEH550uSl08X5tYJQF22vpznk280qxIn/nwW4aTwASiECcVntYXfYoBrYvFRdyHnEOjhSCOh/nS/7Q5bl6FDvpuXIAo5iIASyz/cTnXTzNZM+KJlbW1qrVUfagQ0eLotn9wP8aYWg5a9XhTjaFI8l/H3rhK82nLALVLs40wAkn9YPE0DhCWh48uJVtelI7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 12:49:17 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 12:49:16 +0000
Message-ID: <b6997395-2434-4f7c-acde-d3c7e36a5544@intel.com>
Date: Thu, 18 Jul 2024 18:19:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 4/5] tests/kms_plane_scaling: Find display mode
 fitting in BW for rotations
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
 <20240718111146.665240-5-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240718111146.665240-5-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b08ae9e-c943-4d09-d103-08dca72808d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHQ0VEJqMDdxV29UVllSaDVsdWlJUDl6Zlh3NjNvQ3BNa3d0UHEzYjZVSi9R?=
 =?utf-8?B?YUhBVGE0cWJsZU5tMjNCaG16cFQyN29JZk5ieDAvZlNjSVV5U2QxUmZyRkVU?=
 =?utf-8?B?ZnFOVjVVVFljeXR0MWJ3MWp4dXlkdTFHWkIxeHkrQlpUNmI2ZVNRaXB1R1hZ?=
 =?utf-8?B?OXNXNjI5R1FERi9OU1E2R201aXFtV3FZOUR5TllhdjR0OFRleXl2Sk9jamMv?=
 =?utf-8?B?UzJ4Njk5VUZzai9Mai9HNVRXV0RxL3lVQTdwQkRnQWZHV3IvS2QyZWtMemJK?=
 =?utf-8?B?TUZUMzJwSTNwcVZucnczN3hqMEN2UWlGTGZwZmZ2QU9Ydml2L3dFTGYwVk44?=
 =?utf-8?B?NGZBd1pNU0lpMjlZcGtwVk4rSi9aeDc3WnNVQVRHblM5LzJBTlViUnpJNnZX?=
 =?utf-8?B?b1Q3ajRaWk9XN1p5bTRkeEZTRFhUNlA0bXl1cWhuS2RuMXJ5Sms1a0JwYVRv?=
 =?utf-8?B?V1NCaU8yUlJBS0NPeGpncEEvMFBWaGxnbGsxRUVqdStQaXBiTzZwLyszSHFz?=
 =?utf-8?B?bThhb0w1YWs1YWFRZFo2Zm8vUWY5ejlUZ2d5TEo2ZVZXNGx4ZU0wbmpXTFBZ?=
 =?utf-8?B?VzlyM1ZrMEdNdmszYVJCekVwbDEvMTB5L0lEMEdLZG92R2dBWGZ1YkY2dnZW?=
 =?utf-8?B?UW52b1QxYXNIOFpGcXBVMHkrMUtmd1hDYUtnYk4xNFl0KzZxcTh4NGlzREIv?=
 =?utf-8?B?R0hHZ2JLMFI2N0duVWtOUXo2d2lrK0lmUG1YR3dXOHVuU1hNVmVNMUlCYWl0?=
 =?utf-8?B?M0VFNXBqRnhaaFdqeHUwV2JPYWo0U1g4bEdTSzFVTmZSSzhQSUc1UzNscjVj?=
 =?utf-8?B?MzJDaWhhS3NFdDBkVjJQeW5VOVZPM1FySDBZa09pMFk3eWlrU05zaHRsT0Yx?=
 =?utf-8?B?YVlpam05Q2tDNHZzNUluVjJaZ3lyK0tKZXdJdUhFMzdZWUVYNmNUeWppd29z?=
 =?utf-8?B?VUw4WituV0hoelVNblIvV2htVXVJbU4wQmYrMzN1LzZ2SWNsT0xWUHNJVXd2?=
 =?utf-8?B?cVNqME9UZTJxN2pCRWNBaWQ0SytyWCtKS3lxZUxtc2JQc1k2VzVGZlY1cGJp?=
 =?utf-8?B?L3pqeVdTb3dob2Fibyt1MndFamU3dHVUQVRDSmp6SGlrZmp6NTMwYytrd1c5?=
 =?utf-8?B?SnpCaFRTeUEwTWxOWFBIc2xiSTY0SU1OSzlEbU1XSTBOMzJDek5zaS9qYTlD?=
 =?utf-8?B?WUNVSFFyZmdCenh3cG5ZYlpGZ0hYazRyc01TYjlrNkcyYzlDQUFwYjE3ZUpN?=
 =?utf-8?B?ZXB3eUVOWG5Wd1ptcXQrSjVTMUFON3lPbmxsNFdueTJmMDJURDRxQVdkYWU1?=
 =?utf-8?B?OHBybkpWSnhlSzJjbmRPWGl1RjY5SlBHakVlN1NoR2VHbjh5MlNHOXdnZk9o?=
 =?utf-8?B?SjFCU01xVHUwaXNQdUdlcHNsRGJPVnVCZHVNQjBOUmN5dk5QbmlHZUN1TXpz?=
 =?utf-8?B?cGhyVXgrcitaaDBqczk5dUpZS2NKUUc2Wisvb3lWTWNQT2wveWU3VTI2dStj?=
 =?utf-8?B?NWtnb3ZLVm1XQi9hRmhuRWlLeUNWT0F3NGRSRGtncXd6QVREcjFMTTJETnVR?=
 =?utf-8?B?eUZBdld1cUtGK0Z0dU1wcXNjZFZpTTRzcDJuOHdzQ3pYWmZSZXNWc2xiUEVJ?=
 =?utf-8?B?U3NPWURLd2R5VlVOQXh4enFxNjI1ZG05anl3VzNyNlR0c2xUY2ZUOWlUVXZT?=
 =?utf-8?B?bkFqSTVCVWRlS3hwcTd2SHd4VncvU1prdjNrTnlsMzR1NnljWktvL0ZJUFNy?=
 =?utf-8?B?V3pPZjQzRVhpb0JSeitSVmVRWTNHQ3dzdjh4di9sYUd4Y0RlelJiYU1WcmlI?=
 =?utf-8?B?alY3QmxOU2dVT0IweFlCUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVRneHpGOGNPZC92WnlJL05Icmd5TGlTVThITWVkUFNSakhYZytIci9xZVB6?=
 =?utf-8?B?RUhQT0FXeEJsRlJQclkzZDlBWXBaTEhiZXdzRzF2MWZHczRsMWFFeksrTHdS?=
 =?utf-8?B?SEJGZzIySWVMMUJpbHFDbWFpeW5pNDdTbHN0U0Zkbi9BQ24rOTBLeGI0VHpm?=
 =?utf-8?B?M2dzZDF3Y1FYS204dC9hUlRFL2RHUGdWZU9rU0RoOWlXbXhQazhScTJDWkVB?=
 =?utf-8?B?NXUrVTB3UlpSdE5rRWtkVm9uem1PSlYvWk9FUml6UmlxQzRGRUJyY2pFREk0?=
 =?utf-8?B?aDdNQUdHcFJOT0xvZWJld1lxSUFsM1pDNWFIYk5WYWtFYnFwSjU1UThLeGxx?=
 =?utf-8?B?THJsSmRjRWdjd2UwUjd0dzd1eXJpeGNBRFhDMXJZUXdsMDdZU0RDYWV3S09X?=
 =?utf-8?B?UThqd3lvaHNtUGRmbEpFS3JJUDNHYjREa3EyWnIyRjlCam5SUmI1eXdrYUFh?=
 =?utf-8?B?UzRycXZFVGtoSjUzU3dzcTd1S1o0SnJWU1czMEUxV3pOdy9kY1ZnU2xlTm03?=
 =?utf-8?B?anJENzduRWRxVW41eXp4MTRmeVBGMGR5WXNWSWw2ZUNHMUhjcE9aVWpkZWU0?=
 =?utf-8?B?TUlsQmdRQlRoa0dWZjdsL2hsby8wVEcxS29FZnM4OFFkbHR5TTJvOG93OVFN?=
 =?utf-8?B?djVjSkd5dnR1Q3pCWWlpeDY4VmtsN0ZabDB0WWlTeDNFSDZnZXF1VVlkWnhX?=
 =?utf-8?B?UTRwemZ3dGRGVVJwYWV2QWIwVEFrYzdzQ09GTE1zSVRJV2lIQlBjWHgxUndn?=
 =?utf-8?B?ekIvY2x5RlUvU1p6ckw1NnFodmZ5TlZya3ZzRU9OdmNZMXQxSEdtdFBxUVhu?=
 =?utf-8?B?Tk9nVG1XTEpRNjg5V3VlMHA4ZkVGS1pvZktDWlIxM21CVEJEWWhvRnVSZ3Ar?=
 =?utf-8?B?R0JwbUJDbFpJN1VVWmZPU3Q0MTUvVHJqYjN0OGM1dzhXL1hteU1yRUNOdTFU?=
 =?utf-8?B?dks0VSs0N20yV1BSYVdoV0RNWEFwRUhNcWZ6TnprTCtvUVlWK2c1ZTBVNnh3?=
 =?utf-8?B?bGpMWlFWWW41dkZCaTBkTFA3VExsaG1BWFZwcVMzOFFJWVBFWVBaamJraGpU?=
 =?utf-8?B?K1dROHd2cWc4VHlYOWVYdjByZFhmTmpidmZxRmVzaDFXZ09kdUpJRC9Ub2F1?=
 =?utf-8?B?ZVZCUkJKZUc0ZFRaUWtPSnBBQWwrR0xMUlYzT1ZuVzN0aE4wVkhjbk15ZGZZ?=
 =?utf-8?B?WjdvYkNZOVdiV3ZyRlcvOTlxbDlTWHpVbEx3aGtUS0VLMmxoMmJkZEpBSWh2?=
 =?utf-8?B?cDRrVFRiK1lKNXJKMjBwVGN5RnNaSE1VVEVWUzZmRXBCc2x3dTRXVkJ5V2NX?=
 =?utf-8?B?aExwU2ExZDM0NWVYTEtDSkFEZUpieE9KYVBEeExNR0RkMHpmUDAzaFJQSGJm?=
 =?utf-8?B?NmQxNFd5L3RvL0xlVnVZNmJCdWxtTFFWQWhoYTdSMDB3bjBIYVdrRVRXbmZj?=
 =?utf-8?B?Ly9ZOWVDNjRuZ0F2MGNhOEZNSnFRRlp2d1pka2p5Q202RnlKN0RVRFRiSU1M?=
 =?utf-8?B?NjRxQWIyZVlzRkRacXZZOXA0dFcrcldXQTZDTi9FNWliVmFRVHNRL1B2WlNj?=
 =?utf-8?B?NWRZVmhvdEN4Ry9lamduK3V1cXZ3UnVRUWdiclFKT3dONS9TOWorVDlmQXZx?=
 =?utf-8?B?eFBYZjdCTjErYmpKeXlUc2VrRnU4NFUvTnZFMCtQb1FlMGJmNkd3Z2F0L2Jm?=
 =?utf-8?B?OGhzaVZDN0ZRUEdHT0JDa3RYbHNpL3h1YTFGcW4yVzhrNkxEK3AxLzBpU01k?=
 =?utf-8?B?QlFCdkNzMEJCdHA4L1AxcnEyNFZpblNxSnExUUVUMklyajhpeE9RbEExZkV1?=
 =?utf-8?B?NTlmaG5iL2YwRWVQSmhPNWdWakJudXhMcE95K0ZId3U0ZU1seGQraXB1SmRw?=
 =?utf-8?B?cytHaVBCYmNoZDVjdWpXaEkvdzF5K3NSRWZ3NUpmVGsyYlptYzR2ZnJqSXdh?=
 =?utf-8?B?YVpWOWpuRVBhVEhWdjVpbW9NeUZqdHBwZGVpS2t2eHJyMDhEc0dUakdMM3Bt?=
 =?utf-8?B?Qy8yVWJBYjZ6K0Z5dmNIdVhRMVRpTzVOOUJOQ2xaNUpaN214eFZWNEg2S3RY?=
 =?utf-8?B?cW13UFVjSDBSWWIvSjRVcWE5RUhOUE10RWgxMkoyNnJOSjZLYTdjNnJPU0oz?=
 =?utf-8?B?MER4bGhVOUNzc1FxWmI1d21Db0JRYkxCeWltTEZETFNiQ2tjU0dubVRGYjhS?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b08ae9e-c943-4d09-d103-08dca72808d0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 12:49:16.9181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHPe99IqOd43S2whmeyuyk78QH90D7QfOUL+ddz+faaRDDwMMrgqmDi0nLPRXCGFc58YdvN1IQlSz2Gou6IuCh+ZknMfVE/JSW3XSwDv2WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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


On 7/18/2024 4:41 PM, Naladala Ramanaidu wrote:
> Anticipating bandwidth issues, we expect many tests to fail. To
> address these failures, we will switch to the next lower display
> mode. Some higher display modes will be identified as insufficient
> for downscaling operations on plane scaling. As a solution, we
> will implement a fix: When bandwidth is inadequate for current
> modes, the system will automatically attempt the next lower
> display mode.
>
> Example for failure:
> [drm:intel_compute_min_cdclk [xe]] required cdclk (1066500 kHz)
> exceeds max (652800 kHz)
>
> v2: Fix some styling issues in the patch (Ankit)
> v3: Split single plane and multi plane scaling
>      functions arguments in separate patch (Ankit)
> v4: Split single plane and multi plane scaling
>      functions in separate patch (Ankit)
> v5: Update check_scaling_pipe_plane_rot to handle
>      scaling mode failure by trying next lower mode
> v6: Update commit subject/message and add driver return value
>      in igt_debug and igt_skip print   (kamil)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 101 +++++++++++++++++++++-----------------
>   1 file changed, 55 insertions(+), 46 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 2c4490fd3..6cd7ed35d 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -582,55 +582,64 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	int w, h;
>   	int width, height;
>   
> -	mode = igt_output_get_mode(output);
> -	if (is_clip_clamp == true) {
> -		width = mode->hdisplay + 100;
> -		height = mode->vdisplay + 100;
> -	} else {
> -		width = get_width(mode, sf_plane);
> -		height = get_height(mode, sf_plane);
> -	}
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		igt_debug("Trying mode %dx%d\n",
> +				mode->hdisplay, mode->vdisplay);
> +		if (is_clip_clamp == true) {
> +			width = mode->hdisplay + 100;
> +			height = mode->vdisplay + 100;
> +		} else {
> +			width = get_width(mode, sf_plane);
> +			height = get_height(mode, sf_plane);
> +		}
>   
> -	if (is_upscale) {
> -		w = width;
> -		h = height;
> -	} else {
> -		w = mode->hdisplay;
> -		h = mode->vdisplay;
> +		if (is_upscale) {
> +			w = width;
> +			h = height;
> +		} else {
> +			w = mode->hdisplay;
> +			h = mode->vdisplay;
> +		}
> +		/*
> +		 * guarantee even value width/height to avoid fractional
> +		 * uv component in chroma subsampling for yuv 4:2:0 formats
> +		 */
> +		w = ALIGN(w, 2);
> +		h = ALIGN(h, 2);
> +
> +		igt_create_fb(display->drm_fd, w, h, pixel_format,
> +			      modifier, &d->fb[0]);
> +
> +		igt_plane_set_fb(plane, &d->fb[0]);
> +		igt_fb_set_position(&d->fb[0], plane, 0, 0);
> +		igt_fb_set_size(&d->fb[0], plane, w, h);
> +		igt_plane_set_position(plane, 0, 0);
> +		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> +			      "Mode fail with  %dx%d\n", w, h);
> +
> +		if (is_upscale)
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +		else
> +			igt_plane_set_size(plane, width, height);
> +
> +		if (rot != IGT_ROTATION_0)
> +			igt_plane_set_rotation(plane, rot);
> +		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		if (commit_ret == -ERANGE || commit_ret == -EINVAL)
> +			igt_debug("Unsupported scaling factor with fb size %dx%d "
> +				  "with return value %s\n",

Please dont break the message string as mentioned in last patch.

With that fixed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> +				   w, h, (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +		igt_plane_set_fb(plane, NULL);
> +		igt_plane_set_position(plane, 0, 0);
> +		cleanup_fbs(d);
> +		if (commit_ret == 0)
> +			break;
>   	}
> -
> -	/*
> -	 * guarantee even value width/height to avoid fractional
> -	 * uv component in chroma subsampling for yuv 4:2:0 formats
> -	 * */
> -	w = ALIGN(w, 2);
> -	h = ALIGN(h, 2);
> -
> -	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
> -
> -	igt_plane_set_fb(plane, &d->fb[0]);
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, w, h);
> -	igt_plane_set_position(plane, 0, 0);
> -	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> -	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> -		      "Mode fail with  %dx%d\n", w, h);
> -	if (is_upscale)
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	else
> -		igt_plane_set_size(plane, width, height);
> -
> -	if (rot != IGT_ROTATION_0)
> -		igt_plane_set_rotation(plane, rot);
> -	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> -
> -	igt_plane_set_fb(plane, NULL);
> -	igt_plane_set_position(plane, 0, 0);
> -	cleanup_fbs(d);
> -
>   	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> -		      "Unsupported scaling factor with fb size %dx%d\n",
> -		      w, h);
> +		      "Unsupported scaling operation in driver with return value %s\n",
> +		      (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   	igt_assert_eq(commit_ret, 0);
>   }
>   
