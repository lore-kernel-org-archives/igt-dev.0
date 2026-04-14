Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E86ED7B95
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DE010E58E;
	Tue, 14 Apr 2026 09:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdTzShuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703FA10E58E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776160446; x=1807696446;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eIZ60CLHgKSJklef+M+bZlwdv/Dk+sN5tNZsnI+C2Xg=;
 b=HdTzShuQ7srbkxq3dIoBP3gBQrjRjmyTB0NRWUGLUBCeeKzDoRcvpc4U
 z5mhbYOTb79lAVTBZwJHeha+k4ZEPHWl4BKGPA9kQ+3mcvlynXdK/sPRk
 yuE2gVm+ARB4wR4GiumkGwTIU5wdoW3nAVasmfvL4eCwKpomwUfVuMTbq
 eLDNOwxmkawE/edFfGuWLIMIm394Wrr+kvH+mDffxm/yHczm4Unokgfk4
 dcwe0ofyWTNy1L3F4N9lTAu5rFmrwpgj5u3/odKhELuZ8n58qc4g6ZTyK
 vUAVZdbDmmZThp6nsnC77aHk1slIiTclmT+NU/grbZrE2u5X3/ApQmkXW g==;
X-CSE-ConnectionGUID: /sWA5UMdQ4yEbg+61RA0uQ==
X-CSE-MsgGUID: 8X0WeDQHQDKITYTUP38R+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87416884"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87416884"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:54:06 -0700
X-CSE-ConnectionGUID: Mlv5Pb6DR/CmFSb+d5fOsQ==
X-CSE-MsgGUID: 9eRJjrf0SqWePIAx7mwX7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229923889"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:54:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 02:54:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 02:54:05 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 02:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct5lB25QSUncVsy9UmfI+adZiXll+aoFzOWiD0b3dKDoGO96eGGYvaC1DJAXF7vSwIw8SiMRaX0DY8PyTaTPHNZR1ecw3c5reACU/ciirtoWc/B7fW+gUWSxe9HbvQ/0Gv1tiXrkeWL0s9PmAVJn9o8aucsgA+mR2GgrwxAQHPsiIX6+MekLhmjIX0mOTISrubaWzfio5Bg6OTm58luAnEpnZB0pd8MTUdSlgTL2UsEDsD9E3jiiDuPo04ZocdEWsK8Ilq7a+CvL9jPITg4cgbcMrVY9M/2eYbRcnrXxLceO+3AYKL5kruqaZrwHL1Hz4566+lxAULhUykd/ZlwtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6pg3Ab0xr5S9pygJWnBHMOyLLoo3qw8nM2hLpWHQpc=;
 b=CxIRHVkvFx7F7hsVPq+KTnU8ttITLCNsClVhKsDHyVT3GRIzB2sOaufyuSOCZfR7AAj9tur9cxjpnv94VQ2FFScrhdHkWV+NchVkQ/OFH2bvF571tFlW5n2uClYZoXvKsuMkAvs2UFy+Q1dY5iyM/F/1EpoEBltErglSRYjXGPExvOQlVgfBJe7XZchYnmy5vgjYSqT+X2/QtVr5ztvszUmuRc9QeSE2P6vSgHUPgmt1WccW0bFr5aat9E/RrkAbDHAGbyrda5Py9RhQwwabdsKeF/k6IyON0aHR3IE77w2QFx/z+3PgUrzZZJuGLfr7sMZ3sKgOuwIrQiywxrfHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 09:54:02 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Tue, 14 Apr 2026
 09:53:56 +0000
Message-ID: <120c46e2-ebbd-46de-8934-a3ceff89b0d0@intel.com>
Date: Tue, 14 Apr 2026 15:23:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_cdclk: Skip CDCLK bump validation
 when dotclocks match
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20260410124143.1015272-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260410124143.1015272-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5958b8-6074-4c85-d1be-08de9a0bbe0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: kkjmbWbyymxRJmjlEbhIaL3hIbK96PdQ9PXdD5JIof4OTiGb9dMsKYQU1s6uDIvIG6boIb23OQa/IFt77NRQ0XItSNK2T0DV0nBm/GySLaLAkmKU43Kdz9oG2e83EwPXQezoxmm2+z1hzxnLVAPQYkQd7mhYuY0BZ2jxMIYt6VMvea+cguI9O2yxWYMbcfOzGxm5UMKFJt/lfRGnUNwW8lUd9LLCjoc4Kbyebm4sARFjA2GHcZc2Rh5e03PNUOKn95MWVBNo5lBPsTbhqOGAsGQlymK4qv5Z7oIVi8giySv7F/L4SqqOZnqMbJWvMjsoZFG/KeZGxi6DWb/k7yoTaAvd8Svhza2jwUtTze2ylv6u3wmrlejjp2haQWGI5s0Wv5uyTG+4iUKpT0ZPblPg0rYXJ4y3x1HDYgjfKkvubuNjrmV8vKvtyNo7uQRiGqLis6C9uAJ/PqcotbYDNP/JXE1EIjZmB2KmLKRSNTLAGtoYcEfuwi8YK+QDihQT+Ar66AzTUIdct7D9Y1MIGZoOT4TUjejYtiJwn4nikQ7jvoH5VYFiPSZ8Gfuqk2Cw2JMEZWRMBii92Pp2f08G0Pc9aazaqKEk6U/l7NBzpDf3XLZuaq4QIVdD4qYg4+im7dykn1forr7QxAfeMOjLd51MYcDbaPJDfNiki2GTVOk+RAf5/snFXzxAjt7BYdP+mYn4REaG6VGaMqAox8+bb2M25R117n9iuLqI/QjD1DMvCu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ErcFd2VEVVWmM5ZlNZL0J3MXAzZjQvejhnUHdSK2l4WG5SeFhxa25DZVh2?=
 =?utf-8?B?VHExTGdsRnlIYmU3RXpjVjVTMytCNmJQTFpCZWpLQzF3dGFKMllEdGNMblda?=
 =?utf-8?B?SHlNZGhJR0pWYUduT1pEbm1hZEFNWEFxOWhWV0hSYzJXV2NLV2UzMXM1bk9z?=
 =?utf-8?B?OS9MVER6bkRHZmNxSW10eDlGczFnbnhlbm9lTG5qSWJBSGVuUEFWUERBS0tY?=
 =?utf-8?B?ZklYMnNyRXVKYzRlM2g1NjVHSmNwZFNDUjl2Rk5EdGRVQTgvQThXR1ZRV2VU?=
 =?utf-8?B?MjFJUWU1WHpWMVZuVkxZeWx1dHRvZWlENlY2dmFBM2lVR1hHN2d2SWpxdTJ6?=
 =?utf-8?B?bVFzb1JWeHpGOVlvWHh1ZGpWK3F5NzdUV2wvUnVlcVpuUnpHeTNtcklTYVQw?=
 =?utf-8?B?eXhtQklWUkVBWnFNcEFTQnJQa3RvVUZZeEpNZVlML0xQcTNtcFFpSkYwRzNw?=
 =?utf-8?B?ek5CWnFabnhralM2TUFxRWNDQ3hPL21DT01WU2tpOHlhVktUMHJDVUVLVUVI?=
 =?utf-8?B?eWZsRjVISy9Iam5xRXhHV0xTOVBLaXBaTHJHb0xpWTJyUE13N3krQnBvWkNZ?=
 =?utf-8?B?dDY2WmFWY1pvbVozVk04WUZ0Z1BIblpsRVFma1NFWEIyTW5MSi9aQ2YwY3Ji?=
 =?utf-8?B?dHFiNVQrdWxuK3l3NEo3VkVtOWVJNm00b1Q4M01aWVl3Q25rdnJhUVVUSm9K?=
 =?utf-8?B?ZVJ5UmpxSnFaVEViQU9idUFVcnpXbjVqdjRVV1NkQVZoWlZqeFF3YVZJbVVw?=
 =?utf-8?B?OVlYMkZadnB0ODBlL1kxOFRHYWpuNXoxbk00cTJuSjNXZDIyN1pqQ0FsUWlj?=
 =?utf-8?B?UXJsU09vRXRrSkQvL0x0QXJ1NkdBcElTajUrNnBZd1pEd0xrR2krNjVEYkVP?=
 =?utf-8?B?L0dhQm9IOEN6SlpYa1duS2xWeW5jaEJJMUVNSmxEMWZmTFJ2OStReXFWbWQy?=
 =?utf-8?B?S01ZQ2toQm5sS0JNZlBzR1RLZFNFOHN2SHpzTzNnR1pheHM3TWwyRGVVOTVh?=
 =?utf-8?B?QzFvUUZxK0NKWUhOM2xzYTRlT25Mc1QrNkZKQW9BYWpVYXhZSDFnT25hQ0o1?=
 =?utf-8?B?Syt6VmZTb2E2YXJxcm1NY3RDRitlSEV4NnExV1JEVUk0WFZrbUVkRzJsSC9Z?=
 =?utf-8?B?S1pra3dIMEVTWEd2YU9QdHdCY1BkOVFJK1JZZ2ErMDVKUDlvYzRsZGkyN096?=
 =?utf-8?B?R0haaUpSb3cvRmlkRlZYM3VmU1hMWVFXbjBMT1ZiaDRZK1J1M2d1NzdRTWdW?=
 =?utf-8?B?ZDlUcHAwcS96TUpsMnd1bmNham5GeSt0Y0NjaW5rdk8zdDI2ck5VOEswYnUw?=
 =?utf-8?B?V1dOY0UwS09yRGdwbFhycUtWNks5bzNINEFtQU96VzlWYmEwQ1pTNUtEbzFM?=
 =?utf-8?B?WFY3T25lbXllTERnUlNzL28ybnhFdTlsazZxU0g0MXl4ZmN0bjFFQzRiUzNp?=
 =?utf-8?B?L0ZKSWtYRVVEYmtEL0d6NU5sUkdRYkpkeld5eDI0ME81SVl4VGUwZ3dsUTEz?=
 =?utf-8?B?YmxNM1cwMy9TZUNseFMvN3dkbDZuTDlHMkV0U3pJZjFTRGhrdFF0ankyMWNn?=
 =?utf-8?B?emNCcVI0NVdDcDVKUWcyRm1pNHRqeUg0bno5Q05URVNibGVRL1JvUDhiK01l?=
 =?utf-8?B?c0x3QkhCR0NzTE01VU9CLzhTRFhuVlUrUlAycXNsRzZxR2RBa2xIcHlEN0xa?=
 =?utf-8?B?RlZBQlY4cVJRMGtvWW9laldEaDNvK3NUd2d5L3QrakEzcjlyb0NtNFlrRCtJ?=
 =?utf-8?B?UHR6OUYwS1pycVU5emh3NFNOTG9telZIWTBVREMzanUyclBaV0l5UUU0VWRV?=
 =?utf-8?B?R2NYUTNYK3lFY1FJaGU5NWFmblZNNjRDOWlJNlQ5OGV4bHZTK081TEU2cTVF?=
 =?utf-8?B?MmNxcSt1VmRiYVI1b3NmRmZJaHl6a3JnMyt3OHF6c1JMbkg2YlRac0tVRHZu?=
 =?utf-8?B?RkpuWFczYXZVazRaRGljTnVQdVFXb2dZR0J6dXJpaGJ5d2Q2MzFFWDdyUlFr?=
 =?utf-8?B?aC8rZVBMbTJsWEVKdmxGR0kvaWplVnA0WHE4R1FreVpZZk16RGFQc0RYSW02?=
 =?utf-8?B?TG1jQU01cGt4SXY1WVNrb2NGYmprYjlNQWszZmFES25yZWs4TkpCQWVMNTVM?=
 =?utf-8?B?NWVJUElYVFAxeWYrdkc0S284blFlRCtkOG9MaHVKY2NzVGRaeFBoNG81WEdU?=
 =?utf-8?B?RmptNkx5V3FzOXFpZFNjbG5UNEI2WGMvaTM5MUpDSFE0RE9ZOTRhVlR4cG5L?=
 =?utf-8?B?UjExU2hXdlJnMzdpMm9aRHJtRHFMR2NnV0RRWUs4V0N6SlJNNlBNNzArQ25C?=
 =?utf-8?B?SE1hdGtWWUFQYi9TZW9MWjlKRitlc1ZzK2t6VXlPMTVlY0ZtTFFDZz09?=
X-Exchange-RoutingPolicyChecked: fpXpnQiQv9Sqt2PcfbliwmDkvsRcbV7lRsZv0Rav9gIDkau18u469ww0JeC2rvoKsTfXOcBNw8YRopk2bCEbOZNWRyCcyhAi7DovJGxHU8F29asSWnKltAp0JPrjY1ZDOWGu3shToVjEFTo62SMrmii5jrH1VL0rqOy6jt/S/ke+YmXtsILT2V7Dl3qkKWIRRI4+BknPNucYOOWGiQ2pFXQwUjMyOaRnDnR6kc8GmlA9cpBEouZPDhp9pHPCsmHdedSUP8BqLR8rROmnLc4UG8WD5j1xIR94C8PhHncF7kDq2lzhfk1ylVcCdfo8TDpdNfxtwcW0e9mUFkFLAUDlUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5958b8-6074-4c85-d1be-08de9a0bbe0e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 09:53:56.1743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6xgp/xVDrDfVaVJiOiPWsdQFv5y3MgwxE/fSGbSm+eaCBq+vWKMVAwfy+zS1Bs7QDpoVhUJVf5SKs86TzWDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
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


On 4/10/2026 6:11 PM, Swati Sharma wrote:
> When the highest and lowest resolution modes share the same dotclock,
> no CDCLK bump is expected.
>
> Skip CDCLK bump validation when the highres and lowres modes have the
> same dotclock, replacing the previous resolution-based is_equal() check
> with a dotclock comparison via has_same_dotclock().
>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 662bdbe43..48bd7276f 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -84,11 +84,9 @@ static bool is_4k(drmModeModeInfo mode)
>   	        mode.vrefresh >= VREFRESH);
>   }
>   
> -static bool is_equal(drmModeModeInfo mode_hi, drmModeModeInfo mode_lo)
> +static bool has_same_dotclock(drmModeModeInfo mode_hi, drmModeModeInfo mode_lo)
>   {
> -	return (mode_hi.hdisplay == mode_lo.hdisplay &&
> -		mode_hi.vdisplay == mode_lo.vdisplay &&
> -		mode_hi.vrefresh == mode_lo.vrefresh);
> +	return mode_hi.clock == mode_lo.clock;
>   }
>   
>   static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
> @@ -204,7 +202,7 @@ static void test_mode_transition(data_t *data, igt_crtc_t *crtc,
>   	igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
>   	              igt_output_name(output));
>   
> -	igt_skip_on_f(is_equal(mode_hi, mode_lo), "Highest and lowest mode resolutions are same; no transition\n");
> +	igt_skip_on_f(has_same_dotclock(mode_hi, mode_lo), "Highest and lowest modes have same dotclock; no CDCLK bump expected\n");
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> @@ -278,8 +276,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   
>   		mode_lowres[count] = *get_lowres_mode(output);
>   
> -		if (is_equal(mode_highres[count], mode_lowres[count])) {
> -			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
> +		if (has_same_dotclock(mode_highres[count], mode_lowres[count])) {
> +			igt_info("Highest and lowest modes have same dotclock on output %s; no CDCLK bump expected, skipping\n",
>   				  igt_output_name(output));
>   			continue;
>   		}
