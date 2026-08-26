Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E001AC5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 04:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B2A10EBD7;
	Wed, 26 Aug 2026 04:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjQcgz6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CB910EBD7
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 04:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787718549; x=1819254549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5E4qSArTiloU1qTcOuvyNXMRXSZo1ixyprHxSfsqSdI=;
 b=hjQcgz6at126axdiZeNUyF5qBV4IFdawSBzdgGnPBaks/w2LsY10tRi6
 xdCWsVy1R++K6tH8fPThs9U/7WH+aHoiZunNRmDpYzjLBq1avhJ56/8qF
 Wet9pzJ07onT2Amy8mfpMxMrie2OJag9DcH0btGFCJe4R97lFhLzfntEZ
 QcoCYa3RFEhDebNveNbEfXCXO+NRRyKVAle07jACMCUUOrwA56v7elH3X
 FTQAx1Rz3spjZd3ybDjkf50oVPpBn1k3EShQujic0Rt7O/9r71p0qnN4E
 e+WaVBgGapGqJpzjZhWlWJV1UVApjco0SQDGdIehLaJcD9wQJub1pv8GM w==;
X-CSE-ConnectionGUID: aET6xPU3Sq6KM/eeiHGz3Q==
X-CSE-MsgGUID: nxkwe9lYRfCTVwGHGo4LEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105719354"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="105719354"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 21:29:09 -0700
X-CSE-ConnectionGUID: VMcIv9N4RNyoS3JUDyFdIA==
X-CSE-MsgGUID: 0QyVo4qnR/qu8kTK2qL47w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="269418343"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 21:29:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 21:29:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 21:29:09 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 21:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+sJSWqoU+ChFWSCPFwnMrIMEWIW/9hsRS7bL1O5lkv+hWM+JV4mMq4/bwyw9IKLFJITGz5w0S4BLmDKypcPuA8N37NR/+LdQAh2IMqgou46d1wKrOxY4Ox8aJ59tECidGmlKKRqbAitxeqXQ6fsKp0tOwPl30eQrHA/BoTr38IeKexoV6HbdKKxNdn16+UOKz+UKCAvqOS4E3IsjpCuhHt+nXvmA/KfpzX66JF15JVM1e9TQtcyPf8Am7YDO1dPc1QqM+dxE9R3FrS/VEYeXByg16Vp/NMLgz0gN6MAuhP+GXhMI7hHXqA6ZgQVJ4xs0r+Pq5lXltJ9xS/qRzN/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyv8eQPEq7Gh4ICMAloWxbS9xzzQRVgIl1w+JeqEkRc=;
 b=SJEQohawsO1edweB6Ae5wFr3x7AvdMozOCF93hcgyGfcbEUmYpGg/IOQ7uicC4gNdjvUVcbUzIBMMHcfCz1oCj0Q6YRu3N0sdfeBrvYX3gAWvP6zf/5iDCe/M+1HP1rKbc+GB1C/EJiA3qfQXg8OpKFcHW9d5GYhAH6BC1ZpobezLlGbegkWxYcfs5ISBG2PuFw5FPMe1EMnptoVa8ApBVydYL2bAgR2H/KHQl+bM8LRCuJPjnZBG2un/0m9UikOvrgZAQUHcaVVPAnfTUiVHPN5lajK0hq+l/giMLPIj2Kl6q5GTRqqW/7NoVuMqsqsRyrizKNvt1xJqzYEX+Eaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 04:29:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 04:29:05 +0000
Date: Tue, 25 Aug 2026 21:29:02 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_oa: Add test to ensure entire report has
 landed
Message-ID: <ao5rjuOlddVbX70E@soc-5CG1426VCC.clients.intel.com>
References: <20260821175835.1044076-2-umesh.nerlige.ramappa@intel.com>
 <87y0dvc6a5.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y0dvc6a5.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:303:8e::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b52019f-2998-4cd6-19b4-08df032a900d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: XGYVpfHwTpSyO363W9dWznWipkbGP3j1cYCnCXhLcuKE+5eMPi99wz5FKFmeeKQmT9Ubuoze2hjkB698HkH1jNctCytfGCm4xRqbJJ54pBSlTjpQsRnDZUMfAifj5gwobHVlQYZ6IYO5prEy9/LWA94EldNRxvWCUJVplG4zKUUMhScT66SjlkKFAzoEHTmqlv7eubFEUUxKAAf4ACdz64m0YT/xk74/Fkyme7t9G1OvoEQtJaZifqCn+4J2Z6B0n+Gasnw15CHoRPCDq+eYvu8HR3EMVU7dH5xC/7sMiH9qzes+zDf5+xR9KQp1d3VytcRTnfee3QebDRtDQC+VzXxflcxVHKvCr0X++GIAOvOtJg7tTOVrSMzV5/TY8YAObJRsAJ7j1d60Fy8UuC+BQixpcqEfNY5uIEEyD8vglF8KNgRuCGPWHn076idhK+c2vs8yyrmjFydMAui0gaD3YGN0c/OVtGFs4Nm12ct+UhW+XsAaqznH3yNf+tBy83In1ZjPIhquGq4BlhzLjHDL3YCwHJupxyy0eWc7uSOgD2q4tOPv3c1BzEsvzXUGsjT0QcHKFPQlZO3AstxTmysT+M9A4hWGP1o1jSM1VhA7CAAunrO5yjEKkBfLVK+kbHcrIKxQ8g8aCXg7ovAxAGnykTCb2SS6hzk70f+h9f3Fwh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5BdDUvb1J4eFh0Z01TbzdLTVYwSlNNLzlVQ0pjSXhGaEcrQ0FxVVprYy9v?=
 =?utf-8?B?cDJTZTR0WGE5QmNlS054aUZTczBMSnRqR01tc04vSk05VnlhWjJKa2RYUXJC?=
 =?utf-8?B?Q05hVWNSVHVXYTl6Y0ZISW1nNVhHdU55RUx6bEtYUGMvVVY3MmI3SXFOODh5?=
 =?utf-8?B?RHBpRjBOWUhCVUVZNWJNUG56L01VaHZoRUtuNTZOODY1elhrNjl1aFQ1b1Bl?=
 =?utf-8?B?QmsyOTR2M1ZrbXIraGJCUFBpZmFMb3lnSFVWTEUwcGVzeFdKQTJOYlRyaGZq?=
 =?utf-8?B?WnBpQU5SZndkeUtsZTk1a0d6ZnZhU0h5STYwNU42UnpZTGszU2t6QVBBWklC?=
 =?utf-8?B?ZmgwNDJIMU0rVGJVK3NuMm4wMCtCYzRpdmZmTkZyQzhzQ0hoendGbUltZUFY?=
 =?utf-8?B?M0lIRGlJMStlMWh1UXI1a2hhcVRVTEpRY3p5bXlMVzlTZjNGajBLRXlYSTZh?=
 =?utf-8?B?d041U2lUUTJMK3J1T2cvRlhWZEc4ZTNqbzhxY2FOQmE2U0c3V3NiR2ZlMHJD?=
 =?utf-8?B?N1M3RmROVGEyVlNZcllyaHRScEFSamJhUXJqSlUrTTAvc3VwSmZIaUFqUFBM?=
 =?utf-8?B?VFpPcFFScE4zeitnMFFURXZEdWtMazJwWnpkSWVkbERYVlBkZHY0di9YM1B2?=
 =?utf-8?B?OVpJd3NQb2hwaFh1QkthMis2aTlweGpUTUdINmdacTgxQXEvUiszd25YRFI3?=
 =?utf-8?B?cVFiTks0Z1JvMHJJWVNxMjdmbEUwUFpNcGJCK1lGSHNZNE9ycFNaZWRaQlJu?=
 =?utf-8?B?VTJjQytVWC93REEzR1pCdCtLeUJZYVlzeDV0QnV4alN2eG14S0pkUUpxMWtu?=
 =?utf-8?B?ZFdxQmVpdFdVU0VQUnk2SUlQRzhwcEV2ZGFEemQvSWpZUUVpeDhZazZIMklV?=
 =?utf-8?B?SWhZTFpmNkpDMitIN0ljM1NjS2x2L3FpWkRZMFRMRWxvMFJnenpySVVXVVp6?=
 =?utf-8?B?cXpZSjdaV3hTbUNoS1R5Q1dtODZZWHo4alNoblBkbUtTWEN5VGpWSWxyMjZM?=
 =?utf-8?B?em13bjdqTXZodkZoeUt5bDFGMVBQdUZrZTlJb09wYjZQTFhHMzJTOVhpRmZP?=
 =?utf-8?B?WGtaM21wSHNVUGRkd2hFMWE5bHZZb1pVbEdKTmN1NENnSzBhK3grZzFHa1VW?=
 =?utf-8?B?YmtUOGxJNGxLb295bGZ6WTdhMU1hdzVpNzZPbzh0b21sTk0rVlptT0lFOFlL?=
 =?utf-8?B?cVl4TnAwNXdvdTJjZWV1c1BORjJuekFHNlJPeWtraitRdE5EeGtiMk9XY2RB?=
 =?utf-8?B?a0tIeTM3RVNnVkM1eWN6WEUreFpJYzRtbGlnSXU5S0lzWVpYRzlvOHRJR2ly?=
 =?utf-8?B?TnlwaGVHa0FEVi9hdFpSN3ZjdVRXdFpuN0g4RnFTQU1ZNDZweFdUMys0NHRk?=
 =?utf-8?B?VGcvanNCM1hucEptZGI2ZnJEb2RIWnI3VElrV2hWRUhQOGF5dFNvaWVMK2Jk?=
 =?utf-8?B?ZTc4VjhJVm1hNWlDMkwxMnBoWXZ1UktCK0dPa09mMkttUk9PQzV5ZUg2REZq?=
 =?utf-8?B?Nm0xTmNoNjI1ZmI3M3RaRTYrcysrR2dQS0FZWHVMdCtCWVh6RjlnTXlTcDRz?=
 =?utf-8?B?Q2Z4MFhKZmUxKzAvZDF1QjVvQXNUTWNMbzJzSyt5M1FJUld3bW1DTXRwTHJD?=
 =?utf-8?B?TEppdzcvS1JSMENZZVVGZkdvNGx2N0VpTDBqdFRwVk04NW1xd3JrRUhRQmFl?=
 =?utf-8?B?eGNGN0xRV0JIWCtqTEs2bCtjYkl5Wlg3N1c5TXhpZmNleStncVM5RVl4elhE?=
 =?utf-8?B?eEJJeC83QWxiaC9iSVpyc2k0Qmo4b3BvcmRZbjhtZWtUM3Eya2haVnZrVXY3?=
 =?utf-8?B?S0k0d0gyQ1pTRnpTUVprTEhoMXgyYkduc1FpQ1VRZUpnekZna1JjVGM1UUdL?=
 =?utf-8?B?SkI5VWh3Y3JpM3V6YkxLOGdtYzZuKzZIZk12UGt1bWphZmVGazdwanRLKy9k?=
 =?utf-8?B?djBrMTVDUzhZM2l4cVB0d2l6cWJpSHB2cU5Ib3JVRVE3RVhHTTAxY1VLZVBH?=
 =?utf-8?B?Znk3MzdSQXJQNDd0OVIwSk01NENyaElIODg3Sm0rRjV4V3hJbFUvMWU0YlhU?=
 =?utf-8?B?ME5kcUFaZXhSaS9jcVBkRmZtR2RLbkpVcndCeGFhT1Y0ZWtaYmlYK0g0TDFz?=
 =?utf-8?B?cDF4YzNvS3NveU9lQmJxeG81Y0hUZ2lSdFY2VHQ4RjIwakgweklHeksycXR1?=
 =?utf-8?B?WEVIVy9PayswUURQeVlRcFFkZVNPNkZJWGVMb0NBMjVtSy90a2NHNlpMeHQz?=
 =?utf-8?B?clh0WWwyL1U2QU85NVpXK0RhNzFGd0Q0OFNoQ2kxb2gxNTFHaFI3R1JMd3lC?=
 =?utf-8?B?eE93cG16RkZQaC9WeHluR2FGL29vUzhDZDZyaXRFbDJGVEpDaUpNSXNEaGhV?=
 =?utf-8?Q?JCOmnwKJ6UE0gFp4=3D?=
X-Exchange-RoutingPolicyChecked: WPs1MIVPxoYruP8sTIOO+BXcNKEvk+kFVgZ25+jkWHuwmpomIT+CFyDzd3HdhGmVVjJA7dYJIMBd1nxg6mJqREFzoWhztyPaiaXjgygHxkRbDcI18lmL/G+ogRPLYZntG+ojGrsVmmWGlKfdSKp6Nm0KQ3Cxj/F3onBsfDvJWOzRdgzOhXSKAaFbF2c/Vy1agVd9EahQDYbL3NK0XMmIuHfRp6WTwUqi3J8dm95k95ef6RM4oTJDm1Gx+oXDFONLTewDWRcCtOaRuD5QfInNcQjQSOyHtriqrO5UbziJVIk6chYre22P/1us4mwyQ0+cOKfPCUNB/eiwPJbAXiDZlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b52019f-2998-4cd6-19b4-08df032a900d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 04:29:05.2490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6TeXi7QFa5ZzyHupicqX0YjtIzR4nrO6j6FOVLVDrTqTVTz0vdm+yX0QaykXFllOm/k2vvWVcX71mn/Buzvl/zle+zqImAB4iHFN0Ze2BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
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

On Mon, Aug 24, 2026 at 06:56:02PM -0700, Dixit, Ashutosh wrote:
>On Fri, 21 Aug 2026 10:58:36 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> When running the load helper with a fast oa_exponent, sometimes the OA
>> reports land out of order. Ensure that the kernel fix for such issues is
>> working by configuring all OA counters and checking validity of the full
>> report.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 211 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 211 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 9ebb18690ec7..2c3ef16e9921 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -336,6 +336,80 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>>		.bc_report = 0 },
>>  };
>>
>> +static u32 test_oa_full[] = {
>> +	/* PES L0 */
>> +	0x13000, 0x3e00, 0x13004, 0x0000, 0x13008, 0x3e00, 0x1300c, 0x0000,
>> +	0x13010, 0x3e00, 0x13014, 0x0000, 0x13018, 0x3e00, 0x1301c, 0x0000,
>> +	0x13020, 0x3e00, 0x13024, 0x0000, 0x13028, 0x3e00, 0x1302c, 0x0000,
>> +	0x13030, 0x3e00, 0x13034, 0x0000, 0x13038, 0x3e00, 0x1303c, 0x0000,
>> +	0x13040, 0x3e00, 0x13044, 0x0000, 0x13048, 0x3e00, 0x1304c, 0x0000,
>> +	0x13050, 0x3e00, 0x13054, 0x0000, 0x13058, 0x3e00, 0x1305c, 0x0000,
>> +	0x13060, 0x3e00, 0x13064, 0x0000, 0x13068, 0x3e00, 0x1306c, 0x0000,
>> +	0x13070, 0x3e00, 0x13074, 0x0000, 0x13078, 0x3e00, 0x1307c, 0x0000,
>> +	0x13080, 0x3e00, 0x13084, 0x0000, 0x13088, 0x3e00, 0x1308c, 0x0000,
>> +	0x13090, 0x3e00, 0x13094, 0x0000, 0x13098, 0x3e00, 0x1309c, 0x0000,
>> +	0x130a0, 0x3e00, 0x130a4, 0x0000, 0x130a8, 0x3e00, 0x130ac, 0x0000,
>> +	0x130b0, 0x3e00, 0x130b4, 0x0000, 0x130b8, 0x3e00, 0x130bc, 0x0000,
>> +	0x130c0, 0x3e00, 0x130c4, 0x0000, 0x130c8, 0x3e00, 0x130cc, 0x0000,
>> +	0x130d0, 0x3e00, 0x130d4, 0x0000, 0x130d8, 0x3e00, 0x130dc, 0x0000,
>> +	0x130e0, 0x3e00, 0x130e4, 0x0000, 0x130e8, 0x3e00, 0x130ec, 0x0000,
>> +	0x130f0, 0x3e00, 0x130f4, 0x0000, 0x130f8, 0x3e00, 0x130fc, 0x0000,
>> +	/* PES L1 */
>> +	0x13300, 0x7e00, 0x13304, 0x0000, 0x13308, 0x7e00, 0x1330c, 0x0000,
>> +	0x13310, 0x7e00, 0x13314, 0x0000, 0x13318, 0x7e00, 0x1331c, 0x0000,
>> +	0x13320, 0x7e00, 0x13324, 0x0000, 0x13328, 0x7e00, 0x1332c, 0x0000,
>> +	0x13330, 0x7e00, 0x13334, 0x0000, 0x13338, 0x7e00, 0x1333c, 0x0000,
>> +	0x13340, 0x7e00, 0x13344, 0x0000, 0x13348, 0x7e00, 0x1334c, 0x0000,
>> +	0x13350, 0x7e00, 0x13354, 0x0000, 0x13358, 0x7e00, 0x1335c, 0x0000,
>> +	0x13360, 0x7e00, 0x13364, 0x0000, 0x13368, 0x7e00, 0x1336c, 0x0000,
>> +	0x13370, 0x7e00, 0x13374, 0x0000, 0x13378, 0x7e00, 0x1337c, 0x0000,
>> +	0x13380, 0x7e00, 0x13384, 0x0000, 0x13388, 0x7e00, 0x1338c, 0x0000,
>> +	0x13390, 0x7e00, 0x13394, 0x0000, 0x13398, 0x7e00, 0x1339c, 0x0000,
>> +	0x133a0, 0x7e00, 0x133a4, 0x0000, 0x133a8, 0x7e00, 0x133ac, 0x0000,
>> +	0x133b0, 0x7e00, 0x133b4, 0x0000, 0x133b8, 0x7e00, 0x133bc, 0x0000,
>> +	0x133c0, 0x7e00, 0x133c4, 0x0000, 0x133c8, 0x7e00, 0x133cc, 0x0000,
>> +	0x133d0, 0x7e00, 0x133d4, 0x0000, 0x133d8, 0x7e00, 0x133dc, 0x0000,
>> +	0x133e0, 0x7e00, 0x133e4, 0x0000, 0x133e8, 0x7e00, 0x133ec, 0x0000,
>> +	0x133f0, 0x7e00, 0x133f4, 0x0000, 0x133f8, 0x7e00, 0x133fc, 0x0000,
>> +	/* PES L2 */
>> +	0x13500, 0x7e00, 0x13504, 0x0000, 0x13508, 0x7e00, 0x1350c, 0x0000,
>> +	0x13510, 0x7e00, 0x13514, 0x0000, 0x13518, 0x7e00, 0x1351c, 0x0000,
>> +	0x13520, 0x7e00, 0x13524, 0x0000, 0x13528, 0x7e00, 0x1352c, 0x0000,
>> +	0x13530, 0x7e00, 0x13534, 0x0000, 0x13538, 0x7e00, 0x1353c, 0x0000,
>> +	0x13540, 0x7e00, 0x13544, 0x0000, 0x13548, 0x7e00, 0x1354c, 0x0000,
>> +	0x13550, 0x7e00, 0x13554, 0x0000, 0x13558, 0x7e00, 0x1355c, 0x0000,
>> +	0x13560, 0x7e00, 0x13564, 0x0000, 0x13568, 0x7e00, 0x1356c, 0x0000,
>> +	0x13570, 0x7e00, 0x13574, 0x0000, 0x13578, 0x7e00, 0x1357c, 0x0000,
>> +	0x13580, 0x7e00, 0x13584, 0x0000, 0x13588, 0x7e00, 0x1358c, 0x0000,
>> +	0x13590, 0x7e00, 0x13594, 0x0000, 0x13598, 0x7e00, 0x1359c, 0x0000,
>> +	0x135a0, 0x7e00, 0x135a4, 0x0000, 0x135a8, 0x7e00, 0x135ac, 0x0000,
>> +	0x135b0, 0x7e00, 0x135b4, 0x0000, 0x135b8, 0x7e00, 0x135bc, 0x0000,
>> +	0x135c0, 0x7e00, 0x135c4, 0x0000, 0x135c8, 0x7e00, 0x135cc, 0x0000,
>> +	0x135d0, 0x7e00, 0x135d4, 0x0000, 0x135d8, 0x7e00, 0x135dc, 0x0000,
>> +	0x135e0, 0x7e00, 0x135e4, 0x0000, 0x135e8, 0x7e00, 0x135ec, 0x0000,
>> +	0x135f0, 0x7e00, 0x135f4, 0x0000, 0x135f8, 0x7e00, 0x135fc, 0x0000,
>> +	/* PES L3 */
>> +	0x13700, 0x7e00, 0x13704, 0x0000, 0x13708, 0x7e00, 0x1370c, 0x0000,
>> +	0x13710, 0x7e00, 0x13714, 0x0000, 0x13718, 0x7e00, 0x1371c, 0x0000,
>> +	0x13720, 0x7e00, 0x13724, 0x0000, 0x13728, 0x7e00, 0x1372c, 0x0000,
>> +	0x13730, 0x7e00, 0x13734, 0x0000, 0x13738, 0x7e00, 0x1373c, 0x0000,
>> +	0x13740, 0x7e00, 0x13744, 0x0000, 0x13748, 0x7e00, 0x1374c, 0x0000,
>> +	0x13750, 0x7e00, 0x13754, 0x0000, 0x13758, 0x7e00, 0x1375c, 0x0000,
>> +	0x13760, 0x7e00, 0x13764, 0x0000, 0x13768, 0x7e00, 0x1376c, 0x0000,
>> +	0x13770, 0x7e00, 0x13774, 0x0000, 0x13778, 0x7e00, 0x1377c, 0x0000,
>> +	0x13780, 0x7e00, 0x13784, 0x0000, 0x13788, 0x7e00, 0x1378c, 0x0000,
>> +	0x13790, 0x7e00, 0x13794, 0x0000, 0x13798, 0x7e00, 0x1379c, 0x0000,
>> +	0x137a0, 0x7e00, 0x137a4, 0x0000, 0x137a8, 0x7e00, 0x137ac, 0x0000,
>> +	0x137b0, 0x7e00, 0x137b4, 0x0000, 0x137b8, 0x7e00, 0x137bc, 0x0000,
>> +	0x137c0, 0x7e00, 0x137c4, 0x0000, 0x137c8, 0x7e00, 0x137cc, 0x0000,
>> +	0x137d0, 0x7e00, 0x137d4, 0x0000, 0x137d8, 0x7e00, 0x137dc, 0x0000,
>> +	0x137e0, 0x7e00, 0x137e4, 0x0000, 0x137e8, 0x7e00, 0x137ec, 0x0000,
>> +	0x137f0, 0x7e00, 0x137f4, 0x0000, 0x137f8, 0x7e00, 0x137fc, 0x0000,
>> +	/* FLEX */
>> +	0xe458, 0x0000, 0xe45c, 0x0000, 0xe558, 0x0000, 0xe55c, 0x0000,
>> +	0xe658, 0x0000, 0xe65c, 0x0000, 0xe758, 0x0000,
>> +};
>> +
>
>Need a comment above this stating what these values are. They are similar
>to TestOA reg/val pairs, but not exactly the same either. If these are from
>some XML, we can even add that XML (even the original, not the converted,
>XML) to the patch and merge it? And refer to the XML in the comment?

For now only 2 events are defines.

3e00 is "Number of GPU (gt) clock cycles at every clock period"
7e00 is "Number of GPU (gt) clock cycles at every other clock period"

The plan is to integrate the XML into IGT somehow, but in a future 
patch.

>
>Apparently these result in all 8 byte counter values in a report non-zero,
>correct?

correct

> Or is it at least one 8 byte bit counter value in a 64 byte
>cacheline?
>
>>  static bool oa_trace = false;
>>  static uint32_t oa_trace_buf_mb = 1;
>>  static int drm_fd = -1;
>> @@ -3740,6 +3814,137 @@ test_whitelisted_registers_userspace_config(void)
>>	xe_oa_remove_config(drm_fd, config_id);
>>  }
>>
>> +static bool oa_report_valid(u64 *report, u32 report_size) {
>
>Maybe cachelines_non_zero() or such is a better function name?
>
>> +    u32 blocks = report_size / 64, i;
>
>s/blocks/num_cachelines or num_cl or such? Anyway, maybe just changing
>function name to give some hint of what it is doing is sufficient. But
>better variable naming won't hurt either.
>
>Assuming OA buffer is cacheline aligned in the kernel, what we should read
>here are actual cachelines. So alignment we specify in the kernel is 0,
>which means 4K aligned, so we're good.
>
>> +
>> +    for (i = 0; i < blocks; i++) {
>> +        u64 *block = &report[i * 8], or = 0, j;
>> +
>> +        for (j = 0; j < 8; j++)
>> +            or |= block[j];
>
>So checking here for at least one 8 byte bit counter value non-zero in a 64
>byte cacheline, correct?

right, renaming for clarity

s/oa_report_valid/cachelines_non_zero/
s/blocks/num_cachelines/
s/block/counter/

>
>> +
>> +        if (!or)
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static uint64_t oa_full_config(void)
>> +{
>> +	struct drm_xe_oa_config config;
>> +	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
>> +	char path[512];
>> +	u64 config_id;
>> +
>> +	igt_require(has_xe_oa_userspace_config(drm_fd));
>> +
>> +	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
>> +	if (try_sysfs_read_u64(path, &config_id))
>> +		xe_oa_remove_config(drm_fd, config_id);
>> +
>> +	memset(&config, 0, sizeof(config));
>> +	memcpy(config.uuid, uuid, sizeof(config.uuid));
>> +
>> +	config.regs_ptr = to_user_pointer(test_oa_full);
>> +	config.n_regs = ARRAY_SIZE(test_oa_full) / 2;
>> +
>> +	return xe_oa_add_config(drm_fd, &config);
>> +}
>
>OK, this is basically following pre-existing code.
>
>> +
>> +/**
>> + * SUBTEST: non-zero-reports
>> + * Description: Test that the entire report landed.
>> + */
>> +static void
>> +test_non_zero_reports(const struct drm_xe_oa_unit *oau)
>> +{
>> +	/* ~20 micro second period */
>> +	int oa_exponent = max_oa_exponent_for_period_lte(20000);
>> +	u64 fmt = default_test_set->perf_oa_format;
>> +	u64 config_id = oa_full_config();
>> +	size_t report_size = get_oa_format(fmt).size;
>> +	u64 properties[] = {
>> +		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>> +		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, config_id,
>> +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>> +		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>> +	};
>> +	struct intel_xe_oa_open_prop param = {
>> +		.num_properties = ARRAY_SIZE(properties) / 2,
>> +		.properties_ptr = to_user_pointer(properties),
>> +	};
>> +	u32 buf_size = 2 * buffer_fill_size;
>> +	u32 total_len = 0;
>> +	u32 oa_status;
>
>Can we please move all these u32's to the same line.
>
>> +	int len;
>> +	u8 *buf;
>> +	char msg[32];
>> +	bool report_valid = false;
>> +
>> +	buf = malloc(buf_size);
>> +	igt_assert(buf);
>> +
>> +	igt_debug("Ready to read about %u bytes\n", buffer_fill_size);
>> +
>> +	stream_fd = __perf_open(drm_fd, &param, true);
>> +        set_fd_flags(stream_fd, O_CLOEXEC);
>
>spaces instead of tabs here...
>
>> +
>> +	load_helper_init();
>> +	load_helper_run(HIGH);
>> +
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> +	while (total_len < buffer_fill_size &&
>
>Is this total_len sufficient to detect out of order cache-lines? I though
>we'd need a few passes through the OA buffer. E.g. does this test reliably
>fail if we reduce LAG_REPORTS in the kernel to a value < 32?

It fails the first iteration itself on BMG without the KMD changes. The 
3 buffer fills, IMO, is not needed since we rely on multiple CI runs 
anyways. The 3 buffer fills was more of a 'catch corner cases during 
buffer wrap' thing. That is handled in other tests.

Thanks,
Umesh

>
>> +	       ((len = read(stream_fd, &buf[total_len], buffer_fill_size - total_len)) > 0 ||
>> +		(len == -1 && (errno == EINTR || errno == EIO)))) {
>> +		if (len < 0 && errno == EIO) {
>> +			oa_status = get_stream_status(stream_fd);
>> +			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>> +		}
>> +		if (len > 0)
>> +			total_len += len;
>> +	}
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>> +
>> +	/*
>> +	 * Since we are lagging actual hw_tail, there should always be data
>> +	 * after we disable. We cannot risk reading in a loop since the code
>> +	 * will block once we have drained all the data.
>> +	 */
>> +	len = read(stream_fd, &buf[total_len], buf_size - total_len);
>> +	igt_assert(len);
>> +	total_len += len;
>> +
>> +	__perf_close(stream_fd);
>> +	xe_oa_remove_config(drm_fd, config_id);
>> +
>> +	load_helper_stop();
>> +	load_helper_fini();
>> +
>> +	igt_debug("Read %u bytes\n", total_len);
>> +	igt_debug("Read %u bytes after disable\n", total_len - buffer_fill_size);
>> +
>> +	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
>> +		const uint32_t *report = (void *) (buf + offset);
>> +
>> +		report_valid = oa_report_valid((u64 *) report, report_size);
>
>I think, no space betwen the cast and the variables in the above two lines...
>
>> +		if (report_valid)
>> +			continue;
>> +
>> +		if (offset)
>> +			dump_report(report - report_size / 4, report_size / 4, "previous");
>> +
>> +		sprintf(msg, "failed report %08x", offset / 576);
>
>s/576/report_size/ ?
>
>> +		dump_report(report, report_size / 4, msg);
>> +		break;
>> +	}
>> +
>> +	free(buf);
>> +	igt_assert(report_valid);
>> +}
>> +
>>  #define OAG_OAHEADPTR (0xdb00)
>>  #define OAG_MMIOTRIGGER (0xdb1c)
>>
>> @@ -5040,6 +5245,12 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>>			test_non_zero_reason(oau, SZ_128K);
>>	}
>>
>> +	igt_subtest_with_dynamic("non-zero-reports") {
>> +		igt_require(!igt_run_in_simulation());
>> +		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>> +			test_non_zero_reports(oau);
>> +	}
>> +
>>	igt_subtest("non-sampling-read-error")
>>		test_non_sampling_read_error();
>
>Thanks.
>--
>Ashutosh
