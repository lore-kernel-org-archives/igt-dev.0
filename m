Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195EEC2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 05:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A843B10E0CE;
	Mon, 24 Jun 2024 05:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1YrVo1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81C010E0CE;
 Mon, 24 Jun 2024 05:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719208465; x=1750744465;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CB2VL5ezaC8R/s6ImoUE/h2LRqO3YdSOYlMXq8ycMnI=;
 b=l1YrVo1slgXu2trdb+PkX97m7ZJfthO7u+JGef/Z/gsHbI/58rA+Orti
 Lq152H50AFoG2VNX0YBXcW2c7X261ZLmFd4zFtmr6JpFPwIlNUCOI1HPO
 zdtlFsEtcaUw/1uPgZITMTY0NF+6d+Sv+w+Hw32HcZcgOyJRFOTWpXmXH
 P8PNRVWhTz7PU+CkbFWvK/Q82aQDn+HGgs30QI6e/9PxuFrNRNFun2kbe
 m62D7xMqnXRIkN59SY5PKNBr0duHfnOqMOyO59M8fDHEv7PQldVD5nmlU
 yUBGuDGnzHPY+GUDSXIvzGuKlhEaaeJtAexia5jZo1dE7b2/dLJkerVjZ A==;
X-CSE-ConnectionGUID: UaaMggplT0ScA92X76dJMQ==
X-CSE-MsgGUID: 4TfNme5iRPuyU+BrV+/Lug==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16391445"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16391445"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2024 22:54:24 -0700
X-CSE-ConnectionGUID: KzRXjaTeThixCcmxc6uQtQ==
X-CSE-MsgGUID: kL1eIlOJRN6Gs6jPQmjwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43629492"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jun 2024 22:54:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 23 Jun 2024 22:54:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 23 Jun 2024 22:54:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 23 Jun 2024 22:54:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 23 Jun 2024 22:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lilua6M/rJ79QU+uSAyqUCdWjofUaNPjBb6SGnCZjnELMhyxUl9O5/nXIHCYS0zAlp3wgvx/NQvgu54zw9kjmwz1zhrTLT+IY9YpApQ6eOTWoJFDGX7i2emnZPJMoAMCNLftr51PrTh7rWo1lxx6y61odNYwWsikYmomPdppOfei6JaTgrWc+oECQVXr+W7iZe8DjBm8sQnW0UhXieFajV0gmvkoSHz1PPbsm6hcMoghQwxltZ9rPvOhXEp1WjWVsUYr8skA6SBkN5y4X27P/GcbLnTPSwal9G+/Sg336NecGkJn5vniMkaNAyRD0EUEQr9BIXq8FzUudGPFLyMNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwTnwe0mDB7t7Uc4d8yTemt2KiC6n5ZF+gezwo6BxJw=;
 b=HVv8NCkXt6l3upHvjkpkWrVXasl0iB035afepEsBeCBWkTPPLA11gDDxxQdvfsZ5buqj/5q3UZmlKiB3L0gHuplxKCyShAhCS/J+WJKoI2g6FqAtTSWByjKvcl12Jm7aln+srs0pkRVlw23QQvTpxT+KoLXyCsLAlAxuTCmc5n+I5B3LYs3fSAheAntx6phygT5BwrZYTKLpwefJOCIZIpyU76nZBAx3SD0mxvHKz3IKkri5yqpQMdTQUTx30+m9IjPKCCWt7JQ4bdR+fA/T0lLMgtDoM6KAo1d1HLNElmZGOYgbacFSyH65Z5xSYO4LqI+C0Mhrhyk2J4LewrG6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 05:54:19 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 05:54:19 +0000
Message-ID: <455203bb-b181-4d05-affd-b12b0aaaceb5@intel.com>
Date: Mon, 24 Jun 2024 11:24:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: igt-dev Digest, Vol 79, Issue 251
To: <igt-dev@lists.freedesktop.org>, <igt-dev-request@lists.freedesktop.org>
References: <mailman.6857.1718859304.10844.igt-dev@lists.freedesktop.org>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <mailman.6857.1718859304.10844.igt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 131e241d-7fa3-4fdf-8fb8-08dc94121653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|4022899006|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE5uOUxXc3pyMSsvUFhsN1F0L1l4TnJFalRGZTBrZTZneGN2eWl1VjVScmxn?=
 =?utf-8?B?VDk3bGpnWW1BNXpMQ3FGclVVZENpUHhETFRpckFZdDdQNFFUVzQzNmtnNlZH?=
 =?utf-8?B?Nm4zSVQ4dnEyMlcybDk0UkxhTVN2bW8xaklheGhYV0hjTzZiaS9XSGhROVND?=
 =?utf-8?B?d0draGFPd1Y4UFR6eW1kU29abE5CSEltdlQ0SmJBbDNSODBvaFRXWDhoK2hY?=
 =?utf-8?B?dm1PYUJDbndZLzV1QklZS3VpVVVpMHhqNjFQeDYrTlBZNUdxOFNudHFGT0RB?=
 =?utf-8?B?MHo4dkRYTElzaUk4TmJPaVMrS2EybDNZaVhxUWkvL0dYa0Q0a3JLTHMxSjVT?=
 =?utf-8?B?UHU3K3B4YWxoQjJQQlkrU2JjcXgzOXh2NW9BQmdHbUU0d2lmYXVxZlRVcDd5?=
 =?utf-8?B?eEFoZzRuRXNaUk5NeElDZjBRWVQ3Q3NwblhyTHlNdzBaTTE4WDlHSlB4K0tL?=
 =?utf-8?B?Rks1R1FvbHN3K2hmMG1lanB5aG13N0x6YU1oVmNVNkVCN2VWekR5SXJKcEVu?=
 =?utf-8?B?OCtZOWx3QU9WVVpMcnF5Rys5N3RLQ3psc0Y5UjZTblROM2FPYUJ6OTJOSmlo?=
 =?utf-8?B?Zmg2M3FibDhHZ2ZhNWdNdDcyNTRpTXlrSE5KemdhMUdqa1AvdlRoZTB3cUtx?=
 =?utf-8?B?dm9WUkRnQWV5NTd6a0RzL013cmorbmQrU3Ezcm1nQ21Ybk83eWZwOUtXODZM?=
 =?utf-8?B?d1VwZTlOVGdMbVAwTE1VbExVcVhKV0VxNlYxMXp2blc4Tnp3WGp5RkF5eDZy?=
 =?utf-8?B?NmZlQXVQUUlHTFJRY2djWjFDditkczVDTTAybHJOMzRlN0d2NW5HYnlmdUNz?=
 =?utf-8?B?ZlN1KytFenllbUZSRHNqNUI2bHFiNVp1dE1CNDhSK2ZWeXJkYWh6STBNeWNH?=
 =?utf-8?B?akpwQStTZlV2aWppZ2Y1MmppRWNMNTd0b1hWRmZxSVVYRXVaVFJOOUQ2bllN?=
 =?utf-8?B?TXRJVWhBNDMrckI1SFR2bG44UFBweGdManRBMEhGWGNWZ1FQZ0s0TFRJNnlk?=
 =?utf-8?B?bk5ubmxUa1JIWEZGaUFKRVdDV0R5T3V5ZWVON204OFdwQlBmeVVxMUxuVXd6?=
 =?utf-8?B?cEJsTWVrdlZqM0xBTUZrK1B3ZHoyVGZiZ0xvK0gyTjN0NUdISStjZFB2TTlw?=
 =?utf-8?B?OFJHR3dQbFh2NEFmeFhmZ2xHTXYxQmRyNTRzODBNK1VzU0tGNTJMc0Y0a3Y3?=
 =?utf-8?B?TkltcWd0V2g4bkdZb1FnQXJraHhLVW5QbFBzUFE5SGU2ZFB3Z1lTeHc4cWVu?=
 =?utf-8?B?c3B4aDE1NHBVRWtkRWJ4aW42eWlnVnNuNHJkcVY5WnpmZmtVNldBMlNNOWEz?=
 =?utf-8?B?TVBhbHBjbmljU1BlZ2lEQkQyYW1VNWhoWnZ6MzFTcFR0Qy8wc2tBbk1rTW4v?=
 =?utf-8?B?UTJoL0hhMDVPZFNSWVlLVGhpYWpSYTVQbVNHOXJxd1VONW02T0VZNk9aY1dB?=
 =?utf-8?B?NVBXNUc3TUNtN1pocXlzbUdLTDJqWk9tNURPWDRtblhGSXB5OTdoYWhWcG1T?=
 =?utf-8?B?ckpqVFA5L1pKeEVEZzNvMWN6TjdrVFdpQnVwV241aUpyMUxEbUphUXErVTRi?=
 =?utf-8?B?L3dubldud1kzTTZtWkE4NWhqYXA4Z3I0Wm5QME5BNURvSm0rdm9JVy81UGhY?=
 =?utf-8?B?TEQ1QXBOR21idHhBOUhuamFxQkV5ZndqWFkwK1loRUUvbjR4VDkxSUZGRkg0?=
 =?utf-8?Q?2r8KdNnZvZhUd0nTZxq1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(4022899006)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkc1ZHRlMThWNWlNZG1QOHJ3NldTT2pRZVhsa0FseVF1MkhzeUxjM2tTblRk?=
 =?utf-8?B?b2ErM3QxZ0s0TTBERWNEOGpuZHNRaHZyWDd0ak5TaW1iODdnU1RKYkRwRW91?=
 =?utf-8?B?QU1UVk5sNm9CeXBFRDBhaXVwcm1tbG9mcTVDK2E3UEs1WjlwWWgvQVYvaVph?=
 =?utf-8?B?ZTF1N0J4MEc4aVNxSTQvRTE3bnJNRDFsZHRlajEzZE1pQ3VodFhLQlpSVEJH?=
 =?utf-8?B?R3g5cEhvNjVPVGNTS2pRUGo4NElwVUlpZnF0dzlmdzR4NjM2dlV0RTJSZG9r?=
 =?utf-8?B?SjRTT3c3a0F5cHZKRUJMUTQ0ajZ2cEl4MndYd3orRnhrUFZhSVhGRkxabll0?=
 =?utf-8?B?TEd4SVFDd0dNYWozSkhuV1h1YnhzS0JzaGdvSDNrQklobGR6RDhHOG56czFS?=
 =?utf-8?B?eVNwVTRVaGppL1NXRjZPdkpHRnVkMVRSLzRQUzBRUkRuSXk2NWxMYmdFdE5K?=
 =?utf-8?B?OUJmYjg2dGRjSE9IT0Z3YzMxOFlxck5HanZucTA2K1FjYVYrOUFrNlRCQ0Fr?=
 =?utf-8?B?OVhLUnhranA4bFFkNmFieDBaZVEvUlBKRDAvaXJxOHZ2YmhqckZQOUEwbjFp?=
 =?utf-8?B?Qzk2SzlRQXYrMHVCbUY1b200Rlkxb050dko5STlsRVlxZlhIZmFVaUpwNWpQ?=
 =?utf-8?B?MW05MUxuUGpxNGorMHVkbjROSDdobFZqRVRQUkpWMTkyR245UW5JWktIbkU2?=
 =?utf-8?B?OS9NdTE5YWMvOEF2NnMvYzhCNjFVSzZDdS9vYUoxcGpvNnJZU3E0RlVmZ3JZ?=
 =?utf-8?B?N0ZkNE4zMU16U2ZGQjAyK1A4TzVkS25lT0tYTGE3eTdqQXlaemNaQkRGVFdN?=
 =?utf-8?B?aFJjcXlpMEJ4R29zK3FFWGpScytCUWcyRklrQ1laaEl6R0cxZmFpRUsvMFRO?=
 =?utf-8?B?Z1BFeGxSUXhsak5GaEh5V2FLUWkyQVAyUWJVWTZGNGJaSFU3VzVnNlBhR0h4?=
 =?utf-8?B?WEhaRVphQTd6c0l2Z3I1aWN1Nm1OVnhjWDhycml6dHo2MG10dnBVUGp1NXZN?=
 =?utf-8?B?YllQcXVMK0h6eGFiUEo2bTloRDFtM3ZRdmd0ZFRyRVc1aTFQM0ptNnBYemRq?=
 =?utf-8?B?WTI4UElac0wrZ0QzTWtUdUFzbkpRTUhCbWYvazAwUkg3dnpJVlp5WVRoekFk?=
 =?utf-8?B?Mkx0TGlnZWNqVzhxUWZQNlJmNk91aEpDWkFhZjRoaHBkdDhmVTVYNmZNcS84?=
 =?utf-8?B?aEtRR0xrTXFNcHhTY3d2TTN6VllMZ1h1eFY4bWNQK0txNkQ5VElOdzFnb1Y2?=
 =?utf-8?B?VVBFM1lOMFI5cndweHVNSGxINkwyN3VSYm01elY3b25VbHpxamRGY3VzNWRF?=
 =?utf-8?B?SXIvM2kwV3ZCY2FIbm9FcDJqd2NnWXZSM2EzblFnb3FjQ1Y0VG1yMWVzUG93?=
 =?utf-8?B?bXFYaldyUkkyNU9SNEtrUmcxamFMNmhSSlU2TTR2MnowdU0yTXhxdXVLUHZs?=
 =?utf-8?B?V0hSa1kwTUh0ellDVHl0RFB4aGROMDV0UnhVbXN2dW05NEZzcDRvZHpaV1Rh?=
 =?utf-8?B?SGV0ckNUcEVOdnE4S3I3dms4aURaVGRFZEF3U0xsUzUvdlM4NC9VN2NaRjFw?=
 =?utf-8?B?RExqOFg2T2FYU2RPZnNReVpXNWlwVVlmcFBLeVlBR0VieDZlcDg4eVNVT1ZT?=
 =?utf-8?B?eGMrd1poWGx3emEwamsvY3p5VVlUcFFoWTlwWDA2elFLN3RhN2xwd2lIS2gv?=
 =?utf-8?B?cHhtNU9RdW44NzhEYnJTWmpOY2VlQ01abndGNE5SQVMxSFg5TU85Rm9FMFJs?=
 =?utf-8?B?R2tIVitYYkw4YmtkMFFyUDZlWnlqQzFxME81KzVYa0lCS1IvUjNhQzVUZGZ2?=
 =?utf-8?B?TDhTRThWYS9pOEptOCt5UWwvMkd0M1lGRW5PVk5kcWY5UEZIMjRhSDVhUEZJ?=
 =?utf-8?B?Kzk2WkFOU1RGRG1sc25NTHhKNUR4TW9hS09nTndQdFRNR0t4VVE1Q3hUOGUr?=
 =?utf-8?B?QTgyMWxqclJZc1J5Qi9LbXRGY0hGN0ltVnVmd0VPVWszKzhhQjA0SXhLS1dI?=
 =?utf-8?B?Yk1WMnBZZTVteis3aGNERlI3RWh3bkVxN0ZkdkpDeFc1a1pvcEVHQ3VtRklz?=
 =?utf-8?B?VHJXV3VlMGJabmY5QlZWY3d6WHY4dlBIUUhGbWlac2YySm53a3diOWhWUFg5?=
 =?utf-8?B?SHZoTUN0cXNoM3VoelU2ckNlTGZGdUxaeE02d1VFa0w2MTJsT3RHb05HeVNJ?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 131e241d-7fa3-4fdf-8fb8-08dc94121653
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 05:54:19.1293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEDLk7p1GAZbCq0+KqvGkW5/YQVz3YRl9yeud/ZFmoGRagbINByBpdS3M9nurGZKyeMwBgV9TBANVLkjAcxfOcE9jSNxv3+x2pIZpfLgMkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
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

Hi Jeevan,

In below line check and Change the string. Correct string is "Sink 
support: PSR = yes [0x04]"

 >	case PSR_MODE_2_ET:
 >		return strstr(buf, "Sink support: yes [0x04]");


On 6/20/2024 10:25 AM, igt-dev-request@lists.freedesktop.org wrote:
> Send igt-dev mailing list submissions to
> 	igt-dev@lists.freedesktop.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.freedesktop.org/mailman/listinfo/igt-dev
> or, via email, send a message with subject or body 'help' to
> 	igt-dev-request@lists.freedesktop.org
> 
> You can reach the person managing the list at
> 	igt-dev-owner@lists.freedesktop.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of igt-dev digest..."
> 
> 
> Today's Topics:
> 
>     1. [PATCH i-g-t 0/2] Early Transport Support (Jeevan B)
>     2. [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for
>        early transport (Jeevan B)
>     3. [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for
>        early trasport (Jeevan B)
>     4. ? CI.xeBAT: success for Early Transport Support (rev3) (Patchwork)
>     5. ? Fi.CI.BAT: success for Early Transport Support (rev3)
>        (Patchwork)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Thu, 20 Jun 2024 10:03:39 +0530
> From: Jeevan B <jeevan.b@intel.com>
> To: igt-dev@lists.freedesktop.org
> Cc: jouni.hogander@intel.com,	Jeevan B <jeevan.b@intel.com>
> Subject: [PATCH i-g-t 0/2] Early Transport Support
> Message-ID: <20240620043341.1438736-1-jeevan.b@intel.com>
> 
> Add early trasport helper and checks to validate early trasport support
> on the supported display.
> 
> Jeevan B (2):
>    lib/igt_psr: Added library functions for early trasport
>    tests/intel/kms_psr2_sf: Add checks for early transport
> 
>   lib/igt_psr.c             | 14 ++++++++++++++
>   lib/igt_psr.h             |  3 +++
>   tests/intel/kms_psr2_sf.c | 18 +++++++++++++++++-
>   3 files changed, 34 insertions(+), 1 deletion(-)
> 
