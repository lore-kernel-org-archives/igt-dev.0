Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E9EC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 17:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E0F8992E;
	Mon, 13 Jul 2026 17:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMcTB3jD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93C710E619
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783963763; x=1815499763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KppMQQSYMc77g+rEXPJjYUlPWNVbBbIK/SXP6zu1daU=;
 b=gMcTB3jDlzy/NmqQN/AhyumEKHIvyP9mh3kT7Y/AnSZmyiwUVu9anHXh
 x8QzemzcvTzHVXKDR0Bv5WVC6wApEc5+A+gJWAbzlkD5RBf9jQh0CbvTq
 lBgCizfm75CA6DJHgcHQz7k15/pvDcd21z8yHU2eFgN9/SRak4MtJ2PM/
 KMl2EnDKvj+0B+sqY18OS3lkVjiuCOgMgvD3FVCzrxjExqXHwq6PiH7rQ
 PcQIMz2KeOk5s0fZlvLvwA9XBdiJIAsBSBbsldVRBiKECqP/IBBfrrLlf
 /vEEYuN69U0BE0Ww3XI0vFNwCzYbPRfwKdXjkK6uhss7NmDiHeysFDkEK Q==;
X-CSE-ConnectionGUID: aUwrxA3kSU6+cUDNWVB3IA==
X-CSE-MsgGUID: C5PbEtTMRzelLZmGOMEdIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95182077"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95182077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 10:29:22 -0700
X-CSE-ConnectionGUID: xb/sI3EPQpC1K0y+764m3Q==
X-CSE-MsgGUID: imuULBSdStiH5BIsO3eeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278875478"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 10:29:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 10:29:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 10:29:21 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 10:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fl2PbSXNjTZYMrN2Pg8vaVWpmTXvabNVQ9GrVC96QUn3gdXzEsgA2Vjj9YpW1kAB69N5nbzsVJiNcav0DPubYtRF0JSgONoD448YlwYn0N2scl3r8gwRsRp6mySOTsak400d318Q5BC1YcysWhjunJ9Uqm8mE16CacmrDa3IjDkrXoUK5qdLLZwhEZ63RElvIXmShnhMH2L2Gdsdm2DrkcNi3LTCQVj7nNys51/Ha/wzGO6DEC2qx75FK/YuachP41uJ9qNi5nKalGoLhpaiYE2BdGtBHuFWF/WreUvNISIy8vPyzlS+ay1OfWn/QAfz2leA9ypfYfB3nziJntb3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tylD8/BQNk/Bj07w6MJMP8s7ApkVzETrx5BqfjksAzY=;
 b=HaH2Iw2cTR9F5acu3sR0BGkwwrxaixbxjqEUcKEhxtCpmyrv2DRj16TOuDtb+XFRlweTkca/U2XeiF9nZpRhGhVow8vt5Quo6mnRgDazB+dAXm+ppPI8RCrBhvfrNoEMszK4gY9ZWske4ei9VlYvSZusOJbd3QBRQtBuLVsYe/1yxWqlJWda6fe7ElPtc/53F+zUdhD/vfMEoykUN4bfFedItD9cnkFTVqiInXxEHtn7Qph+O64M6Y7uFuWIudDIDs08M+xuphfrKp0zMRY3s39V359REfvS/T4lPdGQ0ifl0rIQk4Sl6iabWDa9x4E3YgwPyeimXv3f7lBHJUHwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 17:29:16 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 17:29:16 +0000
Message-ID: <e563df48-ab6b-465e-9ca1-c2841976931f@intel.com>
Date: Mon, 13 Jul 2026 22:59:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260709070905.405108-4-sk.anirban@intel.com>
 <20260709070905.405108-5-sk.anirban@intel.com>
 <20260709151204.fzvhu4voxtu3wv7e@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260709151204.fzvhu4voxtu3wv7e@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b55a159-0983-4459-094e-08dee1044379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|6133799003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Co55Z2RdI4Rpsz1ip9tmS7PSDkRnBbFJhspv+oXUTV9uei0UmeRNMi0zEmLcFt376rHTAhMxtPVHSpDj9boN+4i5MGxe5uHDERKdXlVkE31a56/wlCrd7IIfH6Il3S8Pvxan05lv9aVIXzB2qi68iFg1pwFcmcTzY3m0bmjBJ+bpy8rggLc3ZaW7ffHFKLnYgnq5lQU5P10IcimwBH+0Q02rfk/8JmnveiG/M0v2aQj6yTlsafkiB5ZN/vDjkACWqybdzCsJjqH4wus53HnOLdc30V1ZogBmSwr9xP5vY2j8CHdlCZ1y7wIlBli7xVwUS/A5653kUBt/5eKGl+gbtriyB+PVggvoZtT3Yp2ndUwQdlOyDlUWZaGXkUAeDMlhqovRLKdTWejQcD01haGDfYHYK53PVnus2Rw7qwEULhCfbCU4WswwxbyQLVjrBumIJXNZkv2N2DnhczJbrtNlYcpPvJwEzGkmiqQFVs4ksJ9aNeszqfZT3trdhtgRaqXtY02aGaQpPgiebSjNsFGATpDi2K07Pgkkbei9zMerXEcD0Gq8iab4NRQH+VGefLtdEkfPN1xaEcR7hJeQl6xLPSXw8VPEqEjPdP7kZCVsLXLuCzYTP4ZkGtaJGU/dDebJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(6133799003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnFML1A1TW9MTkhZemR5RUNJZjRsS2liaEpXNWdaaUZGNWFRakxWRnNpampp?=
 =?utf-8?B?RVJUaW1XTFZ6TWZ0YzJ2Q05TVHlFWk1KRTNhVU8rbkM5VFBtZXVUUlV3Z0JN?=
 =?utf-8?B?YUIxditXRk9ETzg2cmVuVDlRdHljT2FEMjJzdVpZeUlKdFlDMllHRkQ2R3dx?=
 =?utf-8?B?TkI5SzZ1YVRQaEpTNDlCT3J2QnFWVjNyVk5XYytJYlpZc2pIQTltZFJ0cXZw?=
 =?utf-8?B?TnR4RUJtSmxYUTZIczRCN0hwWkF2dUwvbFNLN3FraEhHYnpJMzk3NnBRZ1Rj?=
 =?utf-8?B?VERNRlBTZTVyV1dzNEI3Zzg0SHUvZmt5K2RtQXhubE14dkNpcFkvV3BYNzNv?=
 =?utf-8?B?SmlXQ0Z6bGcrZTFETHFrcEc4NUJ1WTZWZWE3TmZXUmlGQlluVkRoMzZvR1B2?=
 =?utf-8?B?cW9wT1hxS1ljNmU3NGxXN3U5T0dSOEVTRkVlUHdIcFZ1NGNVMzZPTC9nRXIz?=
 =?utf-8?B?dFNyc1RTbkFEQnZtWWEvazFEZ3pZWnA4N1J4SE5UWHdDN0wweGRJWDluSHIz?=
 =?utf-8?B?dGw4UHh3bEhzdnZrcEVoOTN2ODhidHRCVUh3Sng0VmdoNjlaMHg1K1JGYjBh?=
 =?utf-8?B?WXluU3A5MHptekp2MHlBbEVSbVVWRDlQcThtTkNVUXNQN3M5ZmIxbHhrWkNo?=
 =?utf-8?B?TlZXRnE5cWhtdDFzZjQrSmdwckRVVzRPdHVaZ0xvRTJIVmpKRWlzMFlyY2Uz?=
 =?utf-8?B?TXZzMGE0VHEwWVE2WlF4OXo0QXFmWTBrWEhhb296a0h0MGZnN1FUVTJ2cjRj?=
 =?utf-8?B?d1hTbGgwN2FpekdxN0FuUjFsY1VGV2VSeFZyRjQ4MWg1TmlleFgrNXg4YVVl?=
 =?utf-8?B?R1pUNnJsNnd0Wkk4dTZGOXJIWGJQaUZGN2VxcnRldjFHQzAxRGxMcEwwTElj?=
 =?utf-8?B?V1NnNktYUmNDZVlERE5wL1phYmsrcmJqSFY0ekpiczJ6UmFBbFZPR0l2MkJk?=
 =?utf-8?B?cVlRUjA2K2ZndWpqdzBOcnhFQ3RsS2M1WGNSVTJXMXpSNnJpNGFCOUo1VU1S?=
 =?utf-8?B?Z0owVU94TWxKcjlQT0FJLzBQSzNibmdKcFpNNDVsV1VaQjQxamY1MjJYSnkr?=
 =?utf-8?B?NTAySVBrQW9xQ3VwaHZQK2FUR0tYbzhTcjh5eHhwQm45Y3dNY0p2UGhnSFpr?=
 =?utf-8?B?VkVaRTJiVjF6ZHViamdJdGNNZFJnd2JsVlNmZTdhbVF0VGNZc0dhcHNteG1i?=
 =?utf-8?B?alI3Nk1XMVpaTlNSSFBwSnJ1WDJEK1NJd2RLaGVrSDNWdy82QU4zN2hsOXZP?=
 =?utf-8?B?VjNucnhuc2RhdnNQQSt6aXZraTRnL0JDYXFRemhmUnhVUWJlQ2ZNQlBSVGF6?=
 =?utf-8?B?dHROd01xY3dod3RjNW8wTzRpSHZwRUc2VlIraElnVnFieEtMVWtDanRSRG9Y?=
 =?utf-8?B?NVRTQTR1dnpWRjUyZ29VSU5iUkx3UERybitRSUJKQmNlZ0NDUE9WQ0hyRnRt?=
 =?utf-8?B?b2RSLzRpbEorZGpTeWR4dGRPa3BNZUtjVmRQSnBFUGV5Wk9SOFYvTFdhQVUz?=
 =?utf-8?B?cnVxbGlDZWUzY2FpOFdzbEhQeHRsUStTai9Odm5icm5uVzRKY05zZ1E5V3Qw?=
 =?utf-8?B?Z0dKRXJWc2dqamJOYzZ6RnowdEhaN25FVDg0bU1HZGRNbmVXaE1QcXEwN2Ry?=
 =?utf-8?B?SzVzcENzVnlTNkIzQzNIYVFPanB3VXMyZlBkb2ZDRVBnVjJxdUJBNi9zZkN3?=
 =?utf-8?B?a2FmeTVVWVFYaU5tQ3F1bytrcnN6ZG8xdVIxUWVvV0w5RWZwMXVtdUNnUDRZ?=
 =?utf-8?B?TlhVcWNnbzUwRDRzamkxZTZrN3BTSXNPY1J1MllBMHU0bEJQakc0NFFrUy9K?=
 =?utf-8?B?eDdmUzIrMUxmOW43bWhKYmw4S3FSQ0k0RDBJb2xHSXE5WGNzREJJcU1kbUJD?=
 =?utf-8?B?N2FLenN2WmRnSEkydmJ3WGpKY2g1SzdOcWdlYjMrakViY2FZU2s3NGgxOG5u?=
 =?utf-8?B?T094ZmFnbHk0N3UwZUhVeUt5ZG82c2VxSm5xSHVYbC9vNVk1SDJQbHBkQUR0?=
 =?utf-8?B?US94bzFYT3ArYnNLbTUxcDJpd3Y4MDU2TDFqdEpZNFBRYkJKd0NoVjkwR0Nz?=
 =?utf-8?B?SHVZZ0dvUlV2Zml0THY1bThEVXRrcUNrQnUxNjlvc1RJbFhFK1lKVzI0WlZq?=
 =?utf-8?B?Y0tYWjNJdXcySkRQelJhRWk2UFYvSXVXU0J2VnVwTUtPUVhsdUVud0pWWTY3?=
 =?utf-8?B?S25qUk1Yd0ZkcktxSlVxWDBqMlM4d3VVYUx5Wk9aQVovTkhFOTB4TUNzOTg2?=
 =?utf-8?B?VmdqVmpjTjN4c2N6Umd5Q2ZGZERXRHRUdUF6bHZwSnB5WFBuajFudHdicDNl?=
 =?utf-8?B?VjJIQ1JsdVlvLzJ6WVpkSUl6U3dyWWpFWEdZZEN1OE9JSmlSam5LZz09?=
X-Exchange-RoutingPolicyChecked: I3CL7SOjcAQRd4GTO69ANx0CV6cWhrUqoJaDoJDnQ7CvEOzE6qL5exSNO0uviftSypOMwqhqoSpRuBGPWKFgseTp+hHMBzMDPUNqVAZ5ufBdAp5I/Xgu7W//mvDDz+aG7WQ7bPi8IFYxJJ+jeywWz+2V5wWL0ZiQY7bvZETnN/60pgtWiheO/luOL/yfYfb3vFq80OWlM6xBNIPXNG4UlLvgcZOPpu3hZCH/eLqHiFv4BeKOhc0LONNjRnLKorsNuL+6rWoGXLbEzp7JHyp8qoZd25AG+zFbs2doB4Ms8BGUUF506P+LO6rdynQ3oAvAeRCD4I7NdeUQwTdaL5ux/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b55a159-0983-4459-094e-08dee1044379
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:29:16.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oFjyxhSu2c/q4M3b+ADS7GvZhbQ/VAycQxIUhiO2hk49H2+3p+EI6rXDSFB16C61Aa5FI4p/Pl+w394MOhgYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
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

Hi,

On 09-07-2026 08:42 pm, Kamil Konieczny wrote:
> Hi Sk,
> On 2026-07-09 at 12:39:07 +0530, Sk Anirban wrote:
>> The kernel now reports -ENOTRECOVERABLE when the device is wedged.
>> As runtime-survivability deliberately wedges the device, update
>> dmesg regex so igt_runner does not treat the expected error logs
>> as failures.
>>
>> kernel implementation:
>> https://patchwork.freedesktop.org/series/168780/
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_survivability.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
>> index 74488bbea..cc54b37ad 100644
>> --- a/tests/intel/xe_survivability.c
>> +++ b/tests/intel/xe_survivability.c
>> @@ -43,12 +43,13 @@ static char bus_addr[NAME_MAX];
>>   static void ignore_wedged_in_dmesg(void)
>>   {
>>   	/* this is needed for igt_runner so it will ignore it */
>> -	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
> Please keep old value for some time (a year?).

As kernel changes are merged, we may no longer receive the same error 
code (ECANCELED) in wedge scenarios.
Additionally, if there are any gaps in the kernel patches that still 
result in ECANCELED being returned, we won't be able to detect that 
issue using IGT if we keep the old error codes here.

>> +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ENOTRECOVERABLE"
>>   				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
>> -				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
>> +				    "|GT[0-9A-Fa-f]*: reset failed .-ENOTRECOVERABLE"
> Same here, keep both.
>
>>   				    "|GT[0-9A-Fa-f]*: Failed to submit"
>>   				    "|Modules linked in:"
>> -				    "|__pfx___drm_");
>> +				    "|__pfx___drm_"
>> +				    "|-ENOTRECOVERABLE");
> Do not add such, it could made to ignore errors in unrelated context.

ENOTRECOVERABLE is intended to be returned only for wedged-state 
scenarios by the kernel. I think the test should ignore any failures 
that return this error code.

Thanks
Anirban

>
> Regards,
> Kamil
>
>>   }
>>   
>>   static bool check_survivability_mode_sysfs(void)
>> -- 
>> 2.43.0
>>
