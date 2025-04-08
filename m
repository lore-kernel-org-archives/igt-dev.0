Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99649C369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 15:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454E110E6CD;
	Tue,  8 Apr 2025 15:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPJlqEQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD3B10E6CD
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744126356; x=1775662356;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WNoV9adkpy2gXNJDAQEY4/mHBHa+7DsXGczAE9jiElA=;
 b=DPJlqEQAV2IUH6uSfjAastOn5uwRzYwJ33f2vAy/BIHFtOUyqimlyF7+
 evO1AxJ6NVram2d/HnAKW+3jwqTxi3P7AW1D0Zv1LZKePTasKYlsYhPGX
 e8lWqhnKYj9cT7xH4P8TkAsyKqIdeg1J9GHPn6lmxqKVRWOE4p6qWX+UI
 FEEQaOh2lSkqAjEXS9Kw5N7KK+8sKE3CoHBvvxiYkIEL7WV2GeRzAtFNw
 zbFVZST7LNYx+UYvbPLPi7kETUqKljTiHyu1riV/zUnw/56vnzdStlwwz
 IpJW+Ex5Sn5/cgTioS91CLFJKiWrO+GjdEuvEzJOZjOuOCF5NmcvB3eJ2 A==;
X-CSE-ConnectionGUID: Uexn49ueRjGGkO+F0/fyAA==
X-CSE-MsgGUID: 3u4OufbuR4C2/bfpb45qww==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49412807"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="49412807"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 08:32:21 -0700
X-CSE-ConnectionGUID: K2wikOv+QqaCvGVf3LYYIQ==
X-CSE-MsgGUID: sg00lsTEQ22byZiD3eFKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128029944"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 08:32:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 08:32:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 08:32:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 08:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVHkQPpjtz+tVKSihaNvAurijK8dW8w60IApDfVHgLZrxuMUfbgPed3QlCXiFBYS2el9J4WQPVg0VnllWzip3166fHHr/NYbWGGkZJQ0wa1OQkO7HCMXOW3X6ccLsSR5BFy5v5vsEHsX1kG2FvO/3odHm3tGQtTCUTz3oR57E4kyzTMCr7wWEGMcD9icC650NLmVRBx0G0Z04Xr+MBTf2pI6SrYxcix7gaBQZeHXQbj7qJCVctUtl0ywATtSTTTmorNVU8lPsX2auEFXjVuzWnE56LzH/TgcWQZubASx1hjnbd4Owets/8T08gV/c3C4lm+u7wNCOuSc3bXtvzzsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeUDDIYn8LcxVLZRyQ2Dn/VHmylSytGnve+EGJUYu6s=;
 b=LylMTIzV+elSP3dbbmo+lkTkL2oF6roQVMETeMf8ofs8yaxav/RpY/w/yuV3nJvyunqrFZullvvNY+zoDi+yGoZw1Kp0tu5x86b83JJl7fwIM3f4wahc1Sy44XDkj3+K48dMCYM8O543P4hzr4H9F9hC5/XWkD89afs50t0iXTgGqRTTl7SmWoHxZN4S8NlNGzH8WtTNxh5TvGpWpqvxI4MtJlYiRTKox7Wy2rYZJtZs49vFgCFwnwL+kWOQdo1CVU9Ec4VsZ90lIT8wfuJDR+bIfMdNsQRDJlof0NujWVDt17V+Wr8ta/vzEt7/0HtsPe8siILafzjrXJ7B7JCiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 15:32:17 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 15:32:16 +0000
Message-ID: <ae8cd81e-e3a8-48c7-945b-590825090de7@intel.com>
Date: Tue, 8 Apr 2025 21:02:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3, 1/2] tests/i915/pm_rc6_residency: Use sysfs to
 achieve peak frequency
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250306185944.2581304-1-sk.anirban@intel.com>
 <20250306185944.2581304-2-sk.anirban@intel.com>
 <08b6bedc-99c2-434f-8e4a-01444d7b639d@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <08b6bedc-99c2-434f-8e4a-01444d7b639d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CH3PR11MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 86088977-a467-4b4b-2689-08dd76b28aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d25DSmwyMStLQ05vLzdQaFZUZ1Y0MGNFZW1zL3lkR05YaG82U05xU3czMkRB?=
 =?utf-8?B?aXB5MGNCcWg1R01ic212NHl5T3E4UkxwMHMzSnhYbm42dUFWZmR1Qm5aekpz?=
 =?utf-8?B?NEFEQlY3bVdFVGlVR0I4MjUvTER1ZzBoemhGUElIcXFCU1FLWHBiR010eVB3?=
 =?utf-8?B?RmwxQVFNbm5FaFErWGU3blNZKzNRNy9RMDlWb0Q2bW1oWDl3QnlGcWVnUVd1?=
 =?utf-8?B?dGIxRlJocVF3U2FtN0ZQSHo2U2JabTlXYVpwdWNqT3E0RDk4M1haOVV3cmd0?=
 =?utf-8?B?NVI2bG5CdTROc1FrNUhzWm80NEkxb3hqc0wvdU5oeTRCYkxvZHNNQU5KcGZs?=
 =?utf-8?B?Y2ZsWlF2MzlPSnlwL3lOWkZOZ01hZzQ4NG1WaE1wTElweTg5b1Q3Y1pRdFhY?=
 =?utf-8?B?elRmOEdnWDJJQmVabzBYTmdJUGlRQ2ZjNUZiZVlnMkdUcmh6ekcvcG5nV3pU?=
 =?utf-8?B?U05aa3RKVTFPdWUvWGJQaXRzQ3I2MFFUTHB5dDVZSC81Rmp1aHN6bTM5Z1ZB?=
 =?utf-8?B?RDhQb2JodHd6UzUrTU9sbnp5RDNWN2NXT2drMklZQmlqcFRhVUdPTWdwVVZI?=
 =?utf-8?B?RExwb0RUQi9MdktxZlVjTVhqTlNTaDF6NUc5VnUvVkRESHlJWkhGWmhkaUQ4?=
 =?utf-8?B?SFFSTWEvYVVnQ2JvSVJteXZhSmpiM2kzb01ob0ZmMjNCa3F1TGJEbHE2TEFS?=
 =?utf-8?B?ei9rMmRvOFZVc3QxTWR0clo1VTVHM0RXc05DNW9UMVZMelozbTZ5YWYzcEp6?=
 =?utf-8?B?V0tFSkxiSXNTMVZPWVdURGt6TEVVTzE4NkRlYUdUSkMvcmZEN3pPY1VpYlZv?=
 =?utf-8?B?NGVTRDNyTnl0MEpOeUZNQjRpOG1aWFRJU1BINlcvdlFHM2pyQTZYL0ZkSmtK?=
 =?utf-8?B?a25Ud0tMcWpPczNodit1QXB2bzdiN0ZXZERJZUsvTk1WME1iaTBrclhIYTJQ?=
 =?utf-8?B?SEx1RjFYMStidThYWjBqR1QvQ2hwVFZmRmhVdncwaHdoZWRzUmI1dVBDT0VU?=
 =?utf-8?B?THYwdHBsRWFQRDJRbyt3eFQwbFhJc0dKRTFIOHRDbVpVTG9kVW1MakUvbGx4?=
 =?utf-8?B?VG9Kd0JMMVR1WjhOWFpMRldGVmMwQ3d3M2t4U25HVFQxUERLVVk1cnVlTlFt?=
 =?utf-8?B?bkFiZWFwWkZxNEN2dE11bUZzOG1lSm1hdkljcURoRGdubjRNME1YUE8yQU1X?=
 =?utf-8?B?ZDdQYUo3WkhwMEZXMDJnV3h0QitBdksrOXhjNEl6eC85cmpiK2xIeGZncDB1?=
 =?utf-8?B?RDZEV2JKQXVHVmJJUEU5Mlh1QWhBajVjVGE4Y1RYMmRMeVdKTGk5RmFLYVJo?=
 =?utf-8?B?dC9yeXFuZ3J1amN0TjBiREJkdXA3cXpjdXh3dnZCcXpJdlZRSkw2dU9nMGRE?=
 =?utf-8?B?MVNqVXNWcUhIZGl6ZnQrOW5vYUpLSkxaY2xxVFEyNDlaL0dIWVgvU1ovb0pU?=
 =?utf-8?B?OG1iaGhqaW9TNTRTcXZOY0JsWTdGMGFtTHlodU5kZlVPTm91WkhYWFZBbnhL?=
 =?utf-8?B?S1NPdGdGOTNteGpiY0t6eHB5VmdOdlgxcitGZjlOcVUyR1lMNGZBalFhbkt3?=
 =?utf-8?B?YzY0cVNWWXhlTVNXVTZvMkVoZHd2aENGb25iQS80bnA3R0xKbUpaRnNwSDlj?=
 =?utf-8?B?R3Zad0dXWUREVWZieEVvTFFzcnpxWk9iK3RjaW5uSE1WK3EzOUw0OFpKeGFR?=
 =?utf-8?B?R05zRkhaL2lwZlliaW5JejBDN1dTd0pFbTBOb2VBaFc3NExTZUdKRjhtQzdG?=
 =?utf-8?B?TGVvM21BVlNvUWgrMVZBM0gxZlVIRTUxVE5ncXlvaXBodnpJN0FLM1Fzamxx?=
 =?utf-8?B?S21yN2VEeFZBRjVsNUN5Ulh0OWhValZ3bW9xZTcxMjlmb3B0MmlsZHlHUVhv?=
 =?utf-8?Q?/3v1xlnv0e0xa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBoWENXb1RMcC9uMUhXNmF2Q0hnRHZROU1ZWXpvSjliU0oyeGd0RUdRVGsw?=
 =?utf-8?B?NWord1pMTUdYS1ZsQ2NaYmV6RVozUmcySVNaWEFEMHV5VlRiL1FEVmZTK1Zz?=
 =?utf-8?B?aWlZUnRhZmhnVVptWENDMjFOaVpLVXNCTFgzQTVXREQxR0xjSGsxTzVjMENY?=
 =?utf-8?B?L0RKTmJJK1F0ajFzWVBQUWRYcmpTS0w3amNzYVYyZ2RYOFdlVE9DNVVLZEpj?=
 =?utf-8?B?eWd3UzU1L0x5bTlVanNHRmYyNGljV0J2clN2SGxWRmpLTHVrVEkxZ1VUVHRS?=
 =?utf-8?B?ZDM4VVJlQjhDaWlZTUIxL0ZFRXVIKzU0b3pJWXg4QTlsTG1CNm83RGR2QUFa?=
 =?utf-8?B?TTBXMmFRcVV6QVRXZWg1OFRFQURkVnFjU0NZZU54VTZWcjhvZkpmK2FRdkFK?=
 =?utf-8?B?RkhDM0JvR2pweHdra3hFWC90V1duOWx3U0RKa0x0Z1Vtblc2R0ZGR2xuTTJo?=
 =?utf-8?B?WGNuRVFFZGUvNXJLK2FUWFA3VjBBSzNwakh4YWNYQ21XZnZHWUZUQ3dDRFp5?=
 =?utf-8?B?U0dTeXJDdEJCeS9NenlNTVprbzVYSFNQSm9qVFExekUzYURucW9kaUEwcksv?=
 =?utf-8?B?ejRiTExEQlRBMzVHTlZNQzNpbGtLa1VGdFZhWSt2S0hjRjBnd2lTZVF3c2xV?=
 =?utf-8?B?MDF4WjZOL3l3WWJhbzFiaThKaE91WUVqNkp5ZW9EV2U0aFlWcjV0TUZoaHlK?=
 =?utf-8?B?ZnE3OU1uUno0RXMzQnptOXJwWkFKcVlkR1BlZEgyME1nUEhvMVUxTk5KTkhD?=
 =?utf-8?B?SFh4Yk90QW4xVnM3YVRKaGhZN0JHSVhUUU9icE16SUpNbm9GS0FGbU1XWGla?=
 =?utf-8?B?V2xucFRyeWtEbk5CVFp1ckZ6K1hvY3lPWTNtNkpLS0tQVXZrbE1MbGZxSENx?=
 =?utf-8?B?MVNGekNlajlUWURtR0d6NXBETTBvdnJzbzhvYi8vYTJGR0srMmtBOTdiaU9S?=
 =?utf-8?B?UUhQYTd3TzhrMXM1ekRjM2l6K0l2ZG9TYlJmUHdKc0R1VzF6MldYQ1JVNldS?=
 =?utf-8?B?clFYYVZ0SW95djJXWnhWUmd5UmlnVU1rN1BOazlKa1dibU50SFAzdmxjUERv?=
 =?utf-8?B?MGlrSFdIUFNIV2JHMTU0VGFKWm10ZVFtS09HRXBpUVhXOEM4d0pEakEwUjN2?=
 =?utf-8?B?RWxVM3FwK1RHV2hGREpLK3NBOExweHNZUElKdDUrSzFPcndjQUJtV3Z2cExY?=
 =?utf-8?B?VE5odHFUU1JyQW1FWUh3VWV5YmlEV1dFNzRCUUZUUmlvMHdkWTVadmtNQjdZ?=
 =?utf-8?B?OXBPSkVqMERaeG96bGVwVEllNXMvMUtBZDBCRzFibHVFSEhZWDlFdldtejRE?=
 =?utf-8?B?MGRpL0Fzbm83YmtXQ25GM2UvL3ZyekJ5Q3FkUk5IeFhvMnV2YzlDcm1SVmNM?=
 =?utf-8?B?RmlNSTlDUndjaENoZUJWWVAvNE5wUVNOaFBaVmp5c3poSVpiREY0R25PMnkr?=
 =?utf-8?B?QWo2Q1cwSmpseVg5LzhWaHY4bjhTakFKN3NBR0w1K0NrZGFNckViYUJQT2Zl?=
 =?utf-8?B?emwveGVjU3kzeGlTSko0WnZtWTkrNG8wV0twWlpadExSVHdmWm9TcVBGUkwy?=
 =?utf-8?B?aTRMK2hEZ2I0L0pVUXRIYVBxZDRkTXJTQm96SjRKWE55RmJGeHFSOG5rdGpa?=
 =?utf-8?B?eWFneGNHQ0dCdUcwbFVmZGZiYmxadnNDM0cwVXNJMmJDbXg0dWh0TVhNY0ta?=
 =?utf-8?B?eTNJeE5QMW1OVGY2S3ZXa3FNNEo1NElyZitMZndGSmoxUExhSWllb3RYemRs?=
 =?utf-8?B?L1Z1aXB6U2ZqdTlHVFBTeXQ4SCtUeDd3Y0xEcmw0SW5IWlI3Vlh5THBYVXla?=
 =?utf-8?B?NHVleVdxVkJ5bzdzTU8ybzdZcmpPOGlMZDRjaGMxNmwzdWxROGVBdjBUeUk1?=
 =?utf-8?B?MGI4cEZoOEwrQnNMMjFYd24xNGcxZitwYXhjU1k1UmJJNEVxZjdGWUhnYXU0?=
 =?utf-8?B?eGFiZXhPL093OTV4djdYQ2syeFl6dXhsMHNYUWgwQnRYaCtnSTF6WC9nRmhR?=
 =?utf-8?B?WHNKSnp1OVZ5SHFNZWFYdnNjRTRwRyttc0NGaHhmZFpnYXUvRVRtN2tsRHU1?=
 =?utf-8?B?LzJsazhOYndxdzY4Nk1RVFdqTE8xamRVNUdOZWdTQmJYV0NLQWdCRmxCV09h?=
 =?utf-8?Q?kyrK5NcF0FOOKhy1Di6jspCsp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86088977-a467-4b4b-2689-08dd76b28aed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:32:16.7584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q01jkj/1W7IPvBhe8r9nT8i3KIrH4qykJwI+mEMjdCxjalXiKXD5EDXflKuN/O06k09APBB4Su2GVRfwgo4OHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
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

Hi Riana,

On 20-03-2025 10:59, Riana Tauro wrote:
> Hi Anirban
>
> On 3/7/2025 12:29 AM, Sk Anirban wrote:
>> Leverage IGT spinner to trigger frequency scaling and
>> set RPS minimum frequency to RP0 for achieving peak frequency.
>> This method replaces the existing waitboost mechanism used
>> to reach maximum frequency.
> Can you specify the reason for the change? How is it helping the test?
Utilizing sysfs enables us to reach the maximum frequency swiftly, 
ensuring rapid transitions to peak power for short durations.
This will be beneficial when handling multiple phases in the IGT test.
>
>>
>> v2:
>>   - Disable power consumption check for dgfx
>>
>> v3:
>>   - Implement igt exit handler
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/i915_pm_rc6_residency.c | 127 +++++++++++++++++++---------
>>   1 file changed, 88 insertions(+), 39 deletions(-)
>>
>> diff --git a/tests/intel/i915_pm_rc6_residency.c 
>> b/tests/intel/i915_pm_rc6_residency.c
>> index c9128481d..7d31e2cc0 100644
>> --- a/tests/intel/i915_pm_rc6_residency.c
>> +++ b/tests/intel/i915_pm_rc6_residency.c
>> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>>       return false;
>>   }
>>   -static uint32_t batch_create(int fd)
>> -{
>> -    const uint32_t bbe = MI_BATCH_BUFFER_END;
>> -    uint32_t handle;
>> -
>> -    handle = gem_create(fd, 4096);
>> -    gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>> -
>> -    return handle;
>> -}
>> -
>>   static int open_pmu(int i915, uint64_t config)
>>   {
>>       int fd;
>> @@ -286,45 +275,85 @@ static int open_pmu(int i915, uint64_t config)
>>       return fd;
>>   }
>>   -#define WAITBOOST 0x1
>> +#define FREQUENT_BOOST 0x1
> FREQUENT ?>   #define ONCE 0x2
yes, as part of 3rd phase of the test we are boosting the freq to max 
multiple times, so instead of wait-boosting I have updated the macro 
name to related one.
>>     static void sighandler(int sig)
>>   {
>>   }
>>   -static void bg_load(int i915, uint32_t ctx_id, uint64_t 
>> engine_flags, unsigned int flags, unsigned long *ctl)
>> +static uint32_t get_freq(int dirfd, uint8_t id)
>> +{
>> +    uint32_t val;
>> +
>> +    igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
>> +
>> +    return val;
>> +}
>> +
>> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
>> +{
>> +    return igt_sysfs_rps_printf(dirfd, id, "%u", val);
>> +}
>> +
>> +uint32_t *stash_min;
>> +
>> +static void restore_freq(int sig)
>> +{
>> +    int i915 = -1;
>> +    int gt_num;
>> +    int dirfd;
>> +
>> +    i915 = drm_open_driver(DRIVER_INTEL);
> Why reopen again? Doesn't it exist when exit handler is called?> + 
> for_each_sysfs_gt_dirfd(i915, dirfd, gt_num) {
I will fix this.
>> +        igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, 
>> stash_min[gt_num]));
>> +    }
>> +    close(dirfd);
> unnecessary for_each_sysfs_gt_dirfd is already doing that> +}
I will remove this.
>> +
>> +static void bg_load(int i915, const intel_ctx_t *ctx, int dirfd, 
>> uint64_t engine_flags,
>> +            unsigned int flags, unsigned long *ctl, unsigned int gt)
>>   {
>>       const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) 
>> >= 8;
>> -    struct drm_i915_gem_exec_object2 obj = {
>> -        .handle = batch_create(i915),
>> -    };
>> -    struct drm_i915_gem_execbuffer2 execbuf = {
>> -        .buffers_ptr = to_user_pointer(&obj),
>> -        .buffer_count = 1,
>> -        .flags = engine_flags,
>> -        .rsvd1 = ctx_id,
>> -    };
>>       struct sigaction act = {
>>           .sa_handler = sighandler
>>       };
>> +    int64_t timeout = 1;
>> +    uint64_t ahnd;
>> +    int rp0;
>>   +    ahnd = get_reloc_ahnd(i915, ctx->id);
>> +    rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>       sigaction(SIGINT, &act, NULL);
>>       do {
>>           uint64_t submit, wait, elapsed;
>>           struct timespec tv = {};
>> +        igt_spin_t *spin;
>>             igt_nsec_elapsed(&tv);
>> -
>> -        gem_execbuf(i915, &execbuf);
>> +        spin = igt_spin_new(i915,
>> +                    .ahnd = ahnd,
>> +                    .ctx = ctx,
>> +                    .engine = engine_flags);
>>           submit = igt_nsec_elapsed(&tv);
>> -        if (flags & WAITBOOST) {
>> -            gem_sync(i915, obj.handle);
>> +        if (flags & FREQUENT_BOOST) {
>> +            /* Set MIN freq to RP0 to achieve the peak freq */
>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>> +            gem_wait(i915, spin->handle, &timeout);
>> +
>> +            /* Restore the MIN freq back to default */
>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, 
>> stash_min[gt]));
>> +            igt_spin_end(spin);
>> +            igt_spin_free(i915, spin);
>> +            gem_quiescent_gpu(i915);
>>               if (flags & ONCE)
>> -                flags &= ~WAITBOOST;
>> +                flags &= ~FREQUENT_BOOST;
>>           } else  {
>> -            while (gem_bo_busy(i915, obj.handle))
>> -                usleep(0);
>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>> +            igt_spin_end(spin);
>> +            igt_spin_free(i915, spin);
>> +            gem_quiescent_gpu(i915);
>>           }
>>           wait = igt_nsec_elapsed(&tv);
>>   @@ -350,6 +379,7 @@ static void bg_load(int i915, uint32_t ctx_id, 
>> uint64_t engine_flags, unsigned i
>>           /* aim for ~1% busy */
>>           usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>>       } while (!READ_ONCE(*ctl));
>> +    put_ahnd(ahnd);
>>   }
>>     static void kill_children(int sig)
>> @@ -361,25 +391,29 @@ static void kill_children(int sig)
>>       signal(sig, old);
>>   }
>>   -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, 
>> unsigned int gt)
>> +static void rc6_idle(int i915, const intel_ctx_t *ctx, uint64_t 
>> flags, unsigned int gt)
>>   {
>> -    const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>> +    const int64_t duration_ns = 2 * SLEEP_DURATION * 
>> (int64_t)NSEC_PER_SEC;
>>       const int tolerance = 20; /* Some RC6 is better than none! */
>>       const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>> +    int num_gts = igt_sysfs_get_num_gt(i915);
>>       struct {
>>           const char *name;
>>           unsigned int flags;
>>           double power;
>>       } phases[] = {
>> +        { "once", FREQUENT_BOOST | ONCE },
>>           { "normal", 0 },
>> -        { "boost", WAITBOOST },
>> -        { "once", WAITBOOST | ONCE },
>> +        { "boost", FREQUENT_BOOST }
>>       };
>> +    int dirfd = igt_sysfs_gt_open(i915, gt);
>>       struct power_sample sample[2];
>>       unsigned long slept, cycles;
>>       unsigned long *done;
>>       uint64_t rc6, ts[2];
>>       struct igt_power gpu;
>> +    int sysfs_dirfd;
>> +    int gt_num;
>>       int fd;
>>         fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
>> @@ -409,10 +443,16 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags, unsigned int gt)
>>         done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>>   +    stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
>> +    for_each_sysfs_gt_dirfd(i915, sysfs_dirfd, gt_num) {
>> +        stash_min[gt_num] = get_freq(sysfs_dirfd, RPS_MIN_FREQ_MHZ);
>> +        igt_pm_ignore_slpc_efficient_freq(i915, sysfs_dirfd, true);
>> +    }
>> +
>>       for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>>           memset(done, 0, 2 * sizeof(*done));
>>           igt_fork(child, 1) /* Setup up a very light load */
>> -            bg_load(i915, ctx_id, flags, phases[p].flags, done);
>> +            bg_load(i915, ctx, dirfd, flags, phases[p].flags, done, 
>> gt);
>>             igt_power_get_energy(&gpu, &sample[0]);
>>           cycles = -READ_ONCE(done[1]);
>> @@ -451,15 +491,17 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags, unsigned int gt)
>>         munmap(done, 4096);
>>       close(fd);
>> +    close(dirfd);
>> +    close(sysfs_dirfd);
>>         igt_power_close(&gpu);
>>   -    if (phases[1].power - phases[0].power > 10) {
>> -        igt_assert_f(2 * phases[2].power - phases[0].power <= 
>> phases[1].power,
>> +    if (phases[2].power - phases[1].power > 20 && !gt && 
>> !gem_has_lmem(i915)) {
> Why 20%? and why gt check?
So as the time taken for each phase has been increased, I have updated 
the threshold also. In a multi-GT system, running a workload on GT1 can 
inadvertently cause GT0 to wake up. Since the tests calculate total GPU 
power, this unintended wake-up of GT0 can skew the power measurements 
for a single GT. Therefore, I have disabled GT1 for this evaluation.
>> +        igt_assert_f(2 * phases[0].power - phases[1].power <= 
>> phases[2].power,
>>                    "Exceeded energy expectations for single busy wait 
>> load\n"
>>                    "Used %.1fmW, min %.1fmW, max %.1fmW, expected 
>> less than %.1fmW\n",
>> -                 phases[2].power, phases[0].power, phases[1].power,
>> -                 phases[0].power + (phases[1].power - 
>> phases[0].power) / 2);
>> +                 phases[0].power, phases[1].power, phases[2].power,
>> +                 phases[1].power + (phases[2].power - 
>> phases[1].power) / 2);
>>       }
>>   }
>>   @@ -577,6 +619,8 @@ igt_main
>>       /* Use drm_open_driver to verify device existence */
>>       igt_fixture {
>>           i915 = drm_open_driver(DRIVER_INTEL);
>> +        intel_allocator_multiprocess_start();
>> +        igt_install_exit_handler(restore_freq);
>>       }
>>         igt_subtest_with_dynamic("rc6-idle") {
>> @@ -590,13 +634,18 @@ igt_main
>>               for_each_ctx_engine(i915, ctx, e) {
>>                   if (e->instance == 0) {
>>                       igt_dynamic_f("gt%u-%s", gt, e->name)
>> -                        rc6_idle(i915, ctx->id, e->flags, gt);
>> +                        rc6_idle(i915, ctx, e->flags, gt);
>>                   }
>>               }
>>               intel_ctx_destroy(i915, ctx);
>>           }
>>       }
>>   +    igt_fixture
>> +    {
>> +        intel_allocator_multiprocess_stop();
>> +    }
> unnecessary {}
I will fix this.
>
> Thanks
> Riana > +
>> igt_subtest_with_dynamic("rc6-fence") {
>>           igt_require_gem(i915);
>>           gem_quiescent_gpu(i915);
>
Thanks,
Anirban

