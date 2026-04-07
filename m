Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBC8FB5192
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 05:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC09A10E222;
	Tue,  7 Apr 2026 05:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGBZNe6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80A710E222
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 05:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775538935; x=1807074935;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fRPuhHDtGWKbIRvmshEd6xa4jcHlc/kHfSyklsw7gnA=;
 b=iGBZNe6eM8lGVc1BG0glUKp1kNxWpvQqMWhsnoDrokTn042v58b79Isi
 5Q2sJgvoZ2GEaGyv+ACu/iseIapZdWywOJG6hL+UcX87HTn+4tGCT0SVF
 3RbO8/NV3T3zm9cnsVDUQFtEvykAJXvQyy8ldloSGvDnJ9TliV/nfJ4Vl
 zqHL3MKuIfOwld1Tc9oDs4OLhDaZaDBQhSuOl+hUn7y897SxAYndnBB+4
 qZ3b6ybmFzCd6l+pzyFyaDCBS4kl890CKwmMqPpSQPwERkgMHt6/9Lk+r
 nO3QAo6pU9gbtH9Ke2+EEdHCpF0DwOAo1/LcCKkvyCwTA5SJP9N4PFS4A g==;
X-CSE-ConnectionGUID: mBgeo6xAS262khUNwYxpaw==
X-CSE-MsgGUID: 2cBs9H+JTb2vU9NUnN9xOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80350813"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="80350813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:15:34 -0700
X-CSE-ConnectionGUID: rD7BD3L7QQGrCpCRL/mL3Q==
X-CSE-MsgGUID: o/HhMJo1QdGqq8vg23Ad0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="266047504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:15:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:15:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 22:15:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:15:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgrkvrusHcmfv3vaMaAW4QCj06GDypsuMbTUd3NX7u/kdqUKrtxRT7LuAk6yCTF3Lk7G8/2t+Tv9/DXif5Hh3JWjyGVcBxsw2dwS2R0usfN2XsDrILuPzWYKcLRDUP0D0pjro2Y07+4eNbjRK6CFLHvIoHoBcS0q1w2iCuG5RB+Y3mGTPULH4YWwJvxN9wjK2TBHl66HfTGj40iOU/if/PibawH0Ph7w2Fxech0i/5jO1uiqXgRKomFmgaSH86+KoMNtqlT76qJgIq01HeiK7z4gW5iHdR3TzNrPEYI7YBi3cEhYknDUxSL7HW9e5VJoay1FEI8sOK1MvvLpEEUVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLRi+7SMNap2UGJkbIceUOiJQDbm1HIi/YQvRqu00Ls=;
 b=mGuoljRBTTucwbHKGg+BB9Vwz049k0sOB0S7P4Graey4BKEP58CQfBH0rxudHqfLa0mlJ2Qdrld0fjQjYYoYz4RCjEciXKzxnEFCOwXfDN3mwSfJDYr49rfLaeWu86Z8AX8JQWg1gS+p9hj5QOUaO5cOE4PT+aiB8t5iLcpJdJ1OrzBP7PkIbxg0g/Hb8R/XpvpnOonYpLCUbLROdLts8e0D/Ppnb0aak5UHcMPQtjAsY9P1J2nTuYLA5ubUuCmWOwpYn2om0ltnVre683/XPO48LKBrcGcUSz3IUAxzp0NmMrVglXbR9cp1EapRCmFHvMDOCbSOSeeg/qOEWGwa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH8PR11MB7990.namprd11.prod.outlook.com (2603:10b6:510:259::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 05:15:25 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 05:15:25 +0000
Message-ID: <f20adf13-a01a-4a93-aa96-23cd8de2caf8@intel.com>
Date: Tue, 7 Apr 2026 10:45:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 5/9] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-6-arvind.yadav@intel.com>
 <928258d0-0e95-465e-9cc4-f1ca8846deb2@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <928258d0-0e95-465e-9cc4-f1ca8846deb2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::27) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH8PR11MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 55998650-2fc3-4b79-7b95-08de9464acec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: OBeMaHBFEm7yQpMTif2fsCMUZ52nMRcJzW0QcmdsG+wRDrSyGz+YM3q/cRMMW/GjapYi8h9pGwchkbdjCSryuBru7dOzBC7pk+StQVCYY9Lm+2jDuotjFz8vfJSKI1fO08VSsGRsvWug1sZOlql3zxNLuexLrXMZA8D5B0yAdUJipU/6UQXXzVsGcoXrgPyKcPlY3NU4CxNf4s/LJfxkWHMqYf3f4y51DLE9dzo1SLjBX/bs8cNm6i2uIGppvNvHAZOIRLHEoboZxA3qTj+6V7k2BGVJfRfVN1jhfxoIR2+gGh2C88H9CNpW4XP948EnW6gEJbiSHmKxTQSIS7yoTzR9j+coa8hsYFzZDHiNSdmA6cN9RDqZESrwI3aTYwhHdhv/Vwm0OU7pBvENDPuNLPJQPW97hSZxtZ+BuRsaK73cHfHd1Qo6ppISdIE7s/xz0yp7swRG+OPGGtxYeFGGz+QH15vk4Nm1DF0Knb/3wUOzDUVrblYpfcRtPN+NeFplnRbmcol9R2Z1BU/fD/hxBfmB04RKXA2JCU01a+I6FLzf5gcycM7938nMFuDFAcFWFak622cInULqZ6VUDP6jAbUTLy67auaNqfDpRHZ3MqAMCBrcxHCK8P54kSvALcN92MeMsCSiJvVyQWB1rJD5dr7cHkOItLSYENtCUfLw4UOBvpmDwKoIS9StB2jatDzZiz+LIPdSL9YpPaU1AVY+L2urn+REDFaOnRW72K252jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGdkTVpseUlNT3VxemhiMUlGUkloU0dPTjdaZzZlZzY2OWFSYk1pb1hRMHpl?=
 =?utf-8?B?K1BJbmZzQjRIckxCbFRNeEhvMnlnTEdoZGZvbm05V3ZQRXdxQ1hIR3hwbGUr?=
 =?utf-8?B?VnExTk1CQ0tNN08xQ05rRHAwYzdxTnhKeUluWjJ0UjRXcEJIM0pHZkc4U0xp?=
 =?utf-8?B?NFFLc2QzM2FuZWh1VG5vU0hpdDd4M0FabkdmdkQwYm1COGN6ZC9RMzhKS1dN?=
 =?utf-8?B?WXVBZjhsWkh3ZEZmZXY2bjArc0d1cnZFSVNPTGhjeHZIYWt1V0xjZlpXVWdo?=
 =?utf-8?B?UFFlTGJvRExKVWRQalRqTFJ6VlpSOXJsVE1lcDIzZC9UMGhVVDZXUjZmekp2?=
 =?utf-8?B?L01xbysxb21RYmVVVUVrSmRHUVBkN0diQ0xHYXNlS0ZjWi9kbkhQNGtNMk81?=
 =?utf-8?B?dUZRNHVpc3lpck1Oam1NUjh1b1JXRldGNHRBUEI3dGJQWHJOamdsS1NxeDBW?=
 =?utf-8?B?UHhtU1F1akQxZ0tHSXFwZG44WU9vQjJxMmR2cWNObGNQMi9PLzN1UERuaFRj?=
 =?utf-8?B?K01DZFgxeFRPMFB4dDgxbmRFekhHMmFOZlMyTHBiMjRyMGJTNEZ0encrNXh3?=
 =?utf-8?B?MFl2d1BiOTNhZm85ODVyb0RDK0ZUeXJaYlROMCtGWGQ4dWVqbm1reEx2eUJh?=
 =?utf-8?B?Z0EvcWllMkdhVGZnV2RWZGo3ZnJHZldyVkUzNUZkS1NNTWhvUk1Xei9PNEFs?=
 =?utf-8?B?SWRwTnRKbXljTG9ndFdNbjNSSTJJd25zQVE4bGZDV3dSTWhKempQUDhWYXdt?=
 =?utf-8?B?NjdLamlGQlFjeU93Mk1tRUgxVHFqWEVmbzhJalQ5SUFnQlh3MnJIMEpSb21Q?=
 =?utf-8?B?WmN3T1FWLy8wbGo3MjBsN21zMlNNWmkrRGovWjN6MXZ2S0NoRjN6dTZYa2tH?=
 =?utf-8?B?YVpNLzc4My9tN2QrbFhLMzh6andaMzdoZm9vSFBPYnJ2ZVFlTTduWmY2bURC?=
 =?utf-8?B?aGpycmpwK1JQUTVJOGhqS1A5ZFZ2VmF1bWw3ZzlVQmVCUlRyN1VPamhPTm5B?=
 =?utf-8?B?cGRhdFdiWUlkMHUzZmRlR3ZjVGFVbmVjR0pKT3g4MmM1SGRyZm4xWHM1a0dp?=
 =?utf-8?B?K0dDc2tZSnBwSlFwVnhKMGJyazU4b244TTJESk9vYzhUZUdwU3pTejVWMHhX?=
 =?utf-8?B?dzFpejVsUmVVUTNuSUZkb2RoYnFYODlCU0RzWjllVVNJTW4vZmdzSStGZ1A4?=
 =?utf-8?B?U3BCUGJtQm5OZGxZeXYybDRBZEdMTG5DZFFxekhlL2RHcWdpeVkzT3htU3lD?=
 =?utf-8?B?N2VOSVZBQmREdFFBMDRJcWxKQytkZHQ2QllibzVrWTFNOWoyY3UwRlFPNmFp?=
 =?utf-8?B?bXh2Mk5EQ0NHWXVUL2YzOURZeWZ6bnR4Yy9aTXhvL0t6VHBiQ21LeGxkL2ZN?=
 =?utf-8?B?ZEE3RkZYaDhkNTY4MWZNd2d4eWIwUXR3YW9DUkliNitBWXhGbS9ERlBHVlRP?=
 =?utf-8?B?dzlOZWpob2t2UDFzb1I5VGI3YjJqRVVleG9kbkxuOEM4Q3V3R1dOVXR2NGpv?=
 =?utf-8?B?NXRxMzRrZStkdXJuUkJjYTBOcVNLSVZnNmduM3c2dS84ZW9PcDFzTGhFNm15?=
 =?utf-8?B?a1BrTDNsWDQ3WVVDakhWVTB4cHIzdHJRSzhTQmM0ZFZERkI4L1o5aGFSTkl4?=
 =?utf-8?B?YkhSYjVXWkJsZC84T08zOFRISi94Zkdsb2o1V0dQaVNBOTNHeDBLK3pVUmUy?=
 =?utf-8?B?VEQxN1ZiTGQ2Yk54QzIvVlFBOEJZQVRrWGNweUFERWxoRGhWQ2tUSnQ4TWFC?=
 =?utf-8?B?VnZXbEttL0hWaUFmdTlTWVU1UTJrTDZkU0JJTnd3dWcrVU1oQjZqdzRSWTlp?=
 =?utf-8?B?RlFXaXU3VlBDa0N5SmJwVlBaQlNVRDdCaFNnYmpFY1RFQ1hoaDY4SXVHakZx?=
 =?utf-8?B?ZmVrT2g1S1YvY1Y1TjV3WXNSQk9qQ2RkOWZpU1g2dFNRSlo2Z1Myc0JFNXB2?=
 =?utf-8?B?WEJkcU1yc21TTE9TNjV2NU94SUltaGJoZ3BBblJWdGhpbUtYdTI3WFdkSllJ?=
 =?utf-8?B?bHJuRUsrQXp2cHFHczBUdkd1ZHgyNzBnUUVlWFZiSkpFL3R6L2lKZmdqL3A4?=
 =?utf-8?B?MEJ4RFpBVDk2N2o5TWo2SHQ4ZW1Ddnh4M2YvSUE4WENPQTFaa3h4SDU5WHA1?=
 =?utf-8?B?OWZWRlNidmZWNkpLSkZjL0xHYnBFNThyTzhxWmRtTysxbmhYYm9aNzRmK1d6?=
 =?utf-8?B?UlNjZm83R29uT1VPQ1NQOWdwSlZQcktTWVBnMHRrRTZqQjZIL2lOeUc0Z2pm?=
 =?utf-8?B?Z1VIbkw5eG9UcW5LbUJKU3V2TVlKUW0vdGZhdXljY2NQSFB6cGZXTTU4U2Rk?=
 =?utf-8?B?OHRJVXlYaHN0L2ZSTTl3b1BsVDlieHVCdFY2ZUxKM0J3V3VuTEZBUT09?=
X-Exchange-RoutingPolicyChecked: jUsutZiXd+qi+iu8Z9guEt+2mInLa/iC1YtEKwOI71N4rzwq0RbXaH76msyLqF2agE1CT9h6PxtEoU5q1KSMC4tmM/ftWG/rtCUA76LjaJN83Htwws+x8HT19pV2Cc+wfQ4YKBkA5hecIanyOdJ0gy4GEVBaBSkKftuEcgiHpjAH83yzKbnMzK8aL18swIIWde3j/fSjhQoaU8N3A1+HzB9NNyOWhNi2b5bmBAQDZGlEwu6QS7MLR4sFBHsPQpPUKOvFwiDRww91CGkVLFQ8+NoPr80QTi388OB9nvxdXTYqjqqq39p0Cf1ciEtCc+4HxM1kxQFes7zNrOJEkYR/+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55998650-2fc3-4b79-7b95-08de9464acec
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 05:15:25.4893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4DIiiqtSj3IT5fxgb2j7EQXYp1cqo2GnN+aMvUYXFBD605aaWNI3+XCq9oSo9+n9h55PO6MO3E/v9t9upLe3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7990
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


On 06-04-2026 19:03, Sharma, Nishit wrote:
>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> This test verifies that an existing mmap becomes invalid after the BO
>> is marked as purgeable and purged. The test creates a BO, maps it,
>> writes data, then marks it DONTNEED and triggers memory pressure.
>> Accessing the previously valid mapping should now trigger SIGBUS or
>> SIGSEGV, confirming that existing mappings are correctly invalidated
>> when the backing store is purged.
>>
>> v4:
>>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>>    - Added assertion for xe_bo_map. (Nishit)
>>
>> v6:
>>    - Fix sigsetjmp(jmp, SIGBUS | SIGSEGV) to sigsetjmp(jmp, 1). The
>>      second argument is a plain boolean savemask, not a signal set.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 64 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index 81e05b6d4..9a157de1d 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -244,6 +244,64 @@ static void test_dontneed_before_mmap(int fd)
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * SUBTEST: dontneed-after-mmap
>> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on 
>> accessing purged mapping
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap(int fd)
>> +{
>> +    uint32_t bo, vm;
>> +    uint64_t addr = PURGEABLE_ADDR;
>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>> +    void *map;
>> +
>> +    purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>> +
>> +    map = xe_bo_map(fd, bo, bo_size);
>> +    igt_assert(map != MAP_FAILED);
>> +    memset(map, 0xAB, bo_size);
>> +
>> +    if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
> same comment as in Patch-4/9


Noted.

Thanks,
Arvind

>> +        munmap(map, bo_size);
>> +        gem_close(fd, bo);
>> +        xe_vm_destroy(fd, vm);
>> +        igt_skip("Unable to induce purge on this platform/config");
>> +    }
>> +
>> +    /* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +    {
>> +        sighandler_t old_sigsegv, old_sigbus;
>> +        char *ptr = (char *)map;
>> +        int sig;
>> +
>> +        old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +        old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +        sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal 
>> mask */
>> +        switch (sig) {
>> +        case SIGBUS:
>> +        case SIGSEGV:
>> +            /* Expected - purged mapping access failed */
>> +            break;
>> +        case 0:
>> +            *ptr = 0;
>> +        default:
>> +            igt_assert_f(false,
>> +                     "Access to purged mapping should trigger 
>> SIGBUS, got sig=%d\n",
>> +                     sig);
>> +            break;
>> +        }
>> +
>> +        signal(SIGBUS, old_sigbus);
>> +        signal(SIGSEGV, old_sigsegv);
>> +    }
>> +
>> +    munmap(map, bo_size);
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -268,6 +326,12 @@ int igt_main()
>>               break;
>>           }
>>   +    igt_subtest("dontneed-after-mmap")
>> +        xe_for_each_engine(fd, hwe) {
>> +            test_dontneed_after_mmap(fd);
>> +            break;
>> +        }
>> +
>>       igt_fixture() {
>>           xe_device_put(fd);
>>           drm_close_driver(fd);
