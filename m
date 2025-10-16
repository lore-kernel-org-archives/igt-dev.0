Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF25CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 06:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A95910E94E;
	Thu, 16 Oct 2025 06:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXNMiB32";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AB310E93D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 06:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760595534; x=1792131534;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c/oFw768K9puqj9vLlGAx/rRlcY5+4dfismm97kMsNg=;
 b=mXNMiB32eXMV5PZDk0DwkTNbEEp8fxjXkYZFmijYrGHaPDHY61YKMdt/
 R1tjcBIwIiOryJflHTRWfS9IYOg5Ak9IimuNayGxcFtml3A/VXqzhdgIh
 M/9HM9gPPQlIjAgLnuQRHeeVm6xE2TYgcvoWD9gTwhi3dxAlRr4UfMI+2
 x84kWHM5fTkyoogqX2cvPoOTY5RmtsgP7Px/BCXOyr0vD6NIr6aS3FHmV
 pPGp5Jko2EJyiQWK0gUXh/brBVZ+kVSfg7XnJCgqD7SATcuxjG5/uMbMh
 9pt57Zg4Uc/CXzRJ1MJGF8kDNe+aZRSD2LMw/hyyi8txOYDnc4SZT+NIw Q==;
X-CSE-ConnectionGUID: NYEM3eOhRTeh8l5BiYP6wA==
X-CSE-MsgGUID: KwxyprTXTZuj+RDTeTYvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73062742"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="73062742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:18:53 -0700
X-CSE-ConnectionGUID: NItXO8tpTo67mSoqtcNgHw==
X-CSE-MsgGUID: qqtejDiMS8qYxKRhmdnhyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="181506612"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:18:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:18:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 23:18:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2Qs94OGRwFcGrKiD2xQ7aax7tRIXd85Zu/vk2ut88d2kS+bFUX/dGXS8csqOQDqHE4sPnmBGjUPzO00+Goa0GzZUMOIy2klLd9vQJg8iSUIHPCKjiEUC5O8SfC7FBg5H6GTVbddSsfPt5VCrU0t0zH+ES/EKdKOBN+zH7wboQVxKJmOiXn+FuRQNTYQQtdV3/VuekrW7dar7Ik5cE1mjNJbxOj6hYWWqFxUsEnBFSX3NDPkj4n5iVi0NK8lsgLONbYedQowbiWxl/iOV6UhGjnl/vCf30/ZSG0XUQCQbZo/4ij9kqq7GJmAc+QvwqheTm/QOK88cl5zSqsdkwYgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRr/DXO2WYnQf6cF9V8Ok8mmzl4ENZWp15wrs0RjgmA=;
 b=LCGg4G6JKIbdM5lpaIA2j1tTKXfWsGoQ88psle1xMRGcQyaY6I0RuJ0tde6SfiA4Sz4R5T4kA9HqVOfWRsNW1t58QgrTGCUYcSEq3hRjcPV46Lud5c3hxIDDHL8nL8pVrUxjCAEak9jHnmlZj7MI22CYqopN0RhD2imWlIooh8tNkBb26UzHL9HxNIg4e+GtZVSzfRLaWxDmNVAVzExRuO1AMVrpD4d4JDCzHKJfwRwP7zyM4QtGRunWyEv9+B8Oey10q+GJeZ83mrTK9W+IKGlVrxze3+U+I7o8xIkunIxzXm91yULSJyW1YD1A5IrwAZMfUj4JJeJt4FpFdtvW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 06:18:50 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:18:49 +0000
Message-ID: <d1a6e5d4-3823-4daa-bc23-e7a7b3cb42d7@intel.com>
Date: Thu, 16 Oct 2025 08:18:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_vram: Skip the test on devices
 without VRAM
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@intel.com>
References: <20251013132708.20990-1-lukasz.laguna@intel.com>
 <20251015155101.gnvwza75sjdkxtdy@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251015155101.gnvwza75sjdkxtdy@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0036.eurprd05.prod.outlook.com
 (2603:10a6:803:1::49) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f58d364-864a-4004-0158-08de0c7bdf1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUpqbWZyM0JuaCtkSTVXRyt4OUc3LzlNWmlVaVNkOSs3VHZpY0t3ZWt5dEs5?=
 =?utf-8?B?aklYWU5GcTVXVlFHQmg2L2tzVk1VdzZHbW8wYktMazVXNHFocUV5Rjc5R3dq?=
 =?utf-8?B?cnQ5dTJmd0lNd3I5dGc4eWNtSzhscmFpNTRJTFJwd1dhZXVaWk5aN1RrWk12?=
 =?utf-8?B?cWRhVm5GUlJlSjQ5MkxFSUFKVWN3YU41TlY3M000VXY5NWpidi9xMHp1c25u?=
 =?utf-8?B?WW1JVEZHRjRFdTEzMXNla29QbEdmbTVleCtxc2hEQm9yOTBpa0ZJZFppd2VU?=
 =?utf-8?B?cG91cTlERXE4Z1c0QnJoaHB1ekN2MERXQ1M1NUU2RC9iRFdTNWtFSXJKSGJz?=
 =?utf-8?B?dHFBR21zcSs0RGt0RlJvRXVxRVNFYUsyanEvZGh3Tkx1ejVNZGx4UFhpT0px?=
 =?utf-8?B?RVQ0dFkzK1IvRVhwUnlxRGxlZDZYY0FNVkZ3azQraEFVU0VkUSs4TDhVQVJn?=
 =?utf-8?B?V044U1YxeURmTW1jb0V5WWEzT2dZYk1SZHJJSGszSTFuMkZBS3NuOFdiUmVu?=
 =?utf-8?B?eFZadDFuL2d3RWhxSHlVS2ZnSnRBbkE5K3NoazlLN0g5SVVaVlZwdGoxczZN?=
 =?utf-8?B?MDlFRWpQT05zQVBUSnc0SktDNlNxcjdXNGpSd1JNZjFTdnp6VUZiUE51ZE4x?=
 =?utf-8?B?dTJxK0gramhWcnAxSnVnOVg5bnhqcHBDc3pwQUNCZ3ZVMTcxNVNIYWJDQmtx?=
 =?utf-8?B?TE9Ma0hZRmJERTdkd2lsY1BQaHlnTWxoWjBDZk5tamJwemZ6M1hvOEJLK1di?=
 =?utf-8?B?Uk1iZHhOenNQS1NHUHdjeTI1cEZHQVRGRWJrT05FQUg3NTdrOFJEYVBSdSs4?=
 =?utf-8?B?SjIzUGtPM0NXMmR3WHVZVzAyQ3RKT05kOVF1WW9US3J3U3haWDZPaS9KRzdX?=
 =?utf-8?B?eHpnckJhUGEyM0FDYzZ1c1Q1MjRqMWxkdXRXYXVlaWQvSTBTc2lldTVVanZn?=
 =?utf-8?B?d000V0thcHluVDdDY1dIMlNUNWVNOTRySHZLMjVMN0s1RVdCaUJka0pTalJh?=
 =?utf-8?B?OE5BbE9LRDA4ckxKckd3QWErRytMNUk2UkpQR29peThxa21aSnUxV0VXL1J2?=
 =?utf-8?B?dGxWelZHRWNNaFhMR0FRb0YralBUZ2hiMzRMSlprOFY5Yi92cHM4dWZoZHoz?=
 =?utf-8?B?RExXZFkvZzVEZVpiZFJHWmU0ZUxlZGpuU2R3RnRHSlErTExaOUpmTHV6RWVs?=
 =?utf-8?B?NVJqeU50U1dTcUEwYUN6ekJaNS9qWHZBTWl5Q21hOEMxZ3JNWjRRODNrWHZh?=
 =?utf-8?B?TTF0SG1mbzJYZmMrejZLN2twNHhHTWhwRmE3cXM3RXlZUkdKNG5rYTFkelhn?=
 =?utf-8?B?UDFpWkFyTGdWbU1wSytNMXFVWER5RjlnOXhydWorQ2ppN29MVzJOanJHS2FQ?=
 =?utf-8?B?NWlvcGJLV21KVjRKY09hbXpoVndjMXp5Q0hyVDl6S0dNOVkyL0ZJbDNjR2FI?=
 =?utf-8?B?WEpDZklHQjVPeThlTTRIWE9wZjFudGtrODc4UE40WDE3aCtNTkxhVUg1Wmx3?=
 =?utf-8?B?M2JGdVRjYlljMVU0WWMrWFRLOW9MKzZQVGVFZEFaQ05LdzI2alM0WHNHRlNO?=
 =?utf-8?B?VDNOMHJKMFpwZklmS1U4WmtXQXg4THFGL1FtRnlsTGU2MitKN0Zucjl6S2Rk?=
 =?utf-8?B?a2I1NU5SaTYwTUJWS3hHNWU5UHAvK1BXUnZpSmVCbnNkSnZyN3JXdlpnTC8z?=
 =?utf-8?B?Mzk3dkU5U0pQTzJFa0x5Yk1veTlwZS9EclR6NDhIOVp2K2V2Z3JDVFdjZFhk?=
 =?utf-8?B?OVFOVEFqY1A0RkJDd2dJVmRLREtHOWNmQ251c2FZWXJVRmUvS0lTNkVTeVdv?=
 =?utf-8?B?NzlrOWV0eGdzR1lqTng5eldFeFN4WVUwZlNwQllwRkJpRVZtU2dhQUg3WHpU?=
 =?utf-8?B?clAyeFRzYXR4ckM5S2ZxU0g3bThLT2piTGpxdkxhYkJCRXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBxYU1ROFU3Y3ErWkRYWWtIZC9iUkhxUjFLTDRmcEpsVDJ0amxZQS9BUFUr?=
 =?utf-8?B?VGdmOEVLK2xxOUxjVVpDbTJRMWRYUDUzOXc3aTNBZmZsVzBwekE4NWd4dEsz?=
 =?utf-8?B?NFF3cHQ1MW5taGc1MVdMR204dTFYS0lTS25yc3J6MHBZVEplcDNJMy96akNZ?=
 =?utf-8?B?bjJlcGR0SEJQK1NySDZhME9BeFVEdkNsYUthaDVRY29BL0FJZFhoR0JOdi8r?=
 =?utf-8?B?R1ZUU0RRaUc3bXhWa3g5NUlid1dIb0h2QkJPcjJyZVFqM2FDVUdGZWJrOVky?=
 =?utf-8?B?Z0M2V3VvTjhWUzBoUG5WRlJFdms2UllLdnVjbk5NdllXQTBiMk5CUWFLenNK?=
 =?utf-8?B?cTBHZGxLSlprWWlHd3ZBWHlKWjgrTnpFdS9GQmRtWU1rNkI2bWhBUE9raXgr?=
 =?utf-8?B?czlndm1lUUZuS3Y0YW1mNWpzdnMwU05RS1hONCtUM1g4WnN5ZjZPcUdXdnNG?=
 =?utf-8?B?NnlNQWtDMHBybThQYnZySk9OMXZwUkNCZStyaGFnNjRRWUxUNEh6cUZiTldr?=
 =?utf-8?B?Y3Z4bUlqeTNOcitUck9id2VoTlRPZGtOUngwbUpRdENmWlZyWjJPb0xVYVZR?=
 =?utf-8?B?dWR6bU5Tc0c2OGo3U2I1RzdXcDJaTy80dkZra2lBQm42clFYSHZzZlRrSXhw?=
 =?utf-8?B?QVFiaXhaaDVwakx4KzFrWTNpUlM5OW00Nys4MVozb1JORDFZTkdieG5WV0Jv?=
 =?utf-8?B?L3Jyc0c0akMvZEh3VkhvSWJhU2VvQWtTTWcxZVQrSTg1ZEFmb25zQ0Y5Yzhm?=
 =?utf-8?B?MWZ3K2xPZzdVL0hwVkVybW1QaTMwbHZPZitVT01VbzZBR0owL0lwbXFXSzJL?=
 =?utf-8?B?YVBnME5JajNrYS9hbERpaXZVRENzWlRSNHl5MTc4aHNTaU9VOXdwSlZBRURi?=
 =?utf-8?B?UzAzVkNGMThkdVRWY0xadlNzTzlUNzR5MjVYV21PdVNzK0lxWk1ha1FQdHdz?=
 =?utf-8?B?dGw2RCt6NU43NHI5UGlDanE1M3lMSStQeFAvVGsxSjIwbGVldjFaWFREUS9U?=
 =?utf-8?B?bjdKbGVBQVBKbTVpOHZKemNxMmRRYWJFUW42ZElUTGpvbFlyNklTbFNhM0hq?=
 =?utf-8?B?aGcyaWtNMWI5T3BPS281eEJtSlJjdUZOYWJKUUpCa1RudVFrUDF5ajNmYmpi?=
 =?utf-8?B?ZHVQNWxXTDBzdkpjaUxRd3NDeTliSG9hdVhRZXZQT0ZqYzJnNnlQMW5namQ4?=
 =?utf-8?B?b0JJQ2hTeTFvT0hhS2poSHJWM2tsWHZRZGlYUGdOaUpReDMvTkR0QVFMZGFP?=
 =?utf-8?B?ZXFCMUZvZE02elUrSEp4NmpZVTBsT1A3RXRJQWVneVVxRUVsMWRpV3NGM0xF?=
 =?utf-8?B?MmVxUVdXeXNNZlh5TmpHdnEreitTbDNRYzRJaWJ3VzFyS1pGamJTRXNqZHNL?=
 =?utf-8?B?TGhXUDRJM0FTSkkzUlRxUHBoTEh6ZjczaktjbTE4M2J4TTdjNVpHZWZDMDYw?=
 =?utf-8?B?Z2tJVjlxZjB0WlI5SVgwK0E5SHVIVmJMU3dpRTJybkp4TS9LUDF2QW9IdjBZ?=
 =?utf-8?B?NDBqSFRTS0RsMG4reTd6d1lzMmxmVDRidk15OWM0REpJaVNqaTJvNlVIakk1?=
 =?utf-8?B?S3psQzlSQTE2YnBMZXh4Z1FsWnlMQjBCYlo3aUhIUTJOQVFaS3NrcmVMaHlu?=
 =?utf-8?B?OVNPUGpBSEZFT29Ja1ZYVmVobTZTcm9PV1pBOXhsbmR5UGF5YVBSbVVYbEtH?=
 =?utf-8?B?VFJKSTg4RmxsZ0MyTjdOSVd1TjN3L01SUHV1eUdkVzl3bDA5Qmh2STQ1QUhq?=
 =?utf-8?B?QlJBNElUbE5JUEJYQ2cvMkM0QzdPY0p6YzJ1SWhBL01iZGl3UnhseFpyaTZa?=
 =?utf-8?B?YkRBTTB0WFR0UGFmeEdCcmU3aWJBOW9OSXZnVkhwcU1TYVRMUnplaUo1ZFVY?=
 =?utf-8?B?cWRMYWFkQkxTMklnWC95U3k2NFRFZ1BkRnd2dXhBNWlJSEJSNnB2cFlXWUlR?=
 =?utf-8?B?UlJmYUFKYjNkS0tFR0xwTmV0Rld4L3RGdzF1ekhKdTFHWldkNlQ3TktGdStJ?=
 =?utf-8?B?UjRTM3hkbHNoVXBGTjE3VFk1ODl5YVZWWTJJaGhjbEJqNm9rNVdkQlJHeEdQ?=
 =?utf-8?B?Nkx1TFdJWFJlQkNTdnIzK3dnSGh1RWxqU3p5bGEvYmdwenNBQUs3T1kxdjRp?=
 =?utf-8?B?RHJRRi8xQ24zMW5mTGZjMjE5Yld6b3ZvMVRleE5BaHh2ZlVxOGgrQnNTV0VX?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f58d364-864a-4004-0158-08de0c7bdf1a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:18:49.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTwACWUqzQnOJ+h1zsLmidQk1RcnZdBbaSJpopTOkt4hEAFqh3RsicpiSRHc0pukAAOapiLH/3Hcg6QfDsvTXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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

On 10/15/2025 17:51, Kamil Konieczny wrote:
> Hi Lukasz,
> On 2025-10-13 at 15:27:08 +0200, Lukasz Laguna wrote:
>> Add a check to ensure the test runs only on devices with VRAM.
>>
>> Fixes: 0ef6c917ab1e ("tests/intel/xe_sriov_vram: Add test checking VF access to VRAM")
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6320
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Hi Kamil,
Thanks for the review and merge!

>
>> ---
>>   tests/intel/xe_sriov_vram.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
>> index 74e7dffe9a..6c3c8e0314 100644
>> --- a/tests/intel/xe_sriov_vram.c
>> +++ b/tests/intel/xe_sriov_vram.c
>> @@ -346,6 +346,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>>   
>>   	igt_fixture {
>>   		pf_fd = drm_open_driver(DRIVER_XE);
>> +		igt_require(xe_has_vram(pf_fd));
>>   		igt_require(igt_sriov_is_pf(pf_fd));
>>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>> -- 
>> 2.40.0
>>
