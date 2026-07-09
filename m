Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E36C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 06:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E3810F38C;
	Thu,  9 Jul 2026 06:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0H2rNKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142E710E58B
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 06:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783578280; x=1815114280;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fnDxz8Q6kdHVa7HTIjwwnI+iVEcpCkTDvxtjbnTzK1w=;
 b=E0H2rNKruU9CiY7pGmgSr/VDKUwEBAtMJOx/lFIMzGOdEnoXPTQlunF1
 UqyKXcnbVEOGRVnadTBrANmvy4Uid4hM3utk4OWTLGWmK1/e7OxSt0Vi5
 UcSMkEe4+gRm0Z5lFZ0DOEAdqvPoDByQE+nFa05zCl3ijRO+suScpan0g
 dQuoSyiNsPmlQaFMdwqnjCAbtOUZ/VYg7PmmfKFqdLOuVd6CfNkDnFhCO
 KczpR65Q/Kcfa0k1+dODDcUsG6EELSFDlDfKaF2pIGYFPDadDzRli0J9S
 fy0xRK6S/nhP5XhHztLC4Yf2yRIhp2ySUhq9QkmgZLCbkyWjUAsbvgV+4 Q==;
X-CSE-ConnectionGUID: F4AD7wRiRfq3yOJ71daP5w==
X-CSE-MsgGUID: 3EjudfgCQfudEjZEWFizvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84350745"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84350745"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:24:39 -0700
X-CSE-ConnectionGUID: Y796K6njQ06D+C3c5Jsguw==
X-CSE-MsgGUID: QozLa0qjTIeYbFClXvUvKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="292688817"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:24:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 23:24:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 23:24:34 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 23:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfHiWaC0NdOxNazDGoDY+sX5ERFhHvbS0Kvqego/lHiYGwK88rRSF3xZ5K964V/DWlSKgU34EnG+p5KZZJVLcaaTeUxUZqnU+knDcw2skj8YYhgZ92k3YG/ODE1Fzua2tDWmcnGzF6C6Yc1OsepJ3DZx+IvCJ7TpQdngkYmH/ic92lKnfvzXw0FvPSNTDmzRoJYVfj5KuCu/B7vZt8/Z80QVimaFVSrDt9i9bmCBmfqvbfKPeTv+xw0CrjOq9Wb24nud5xNQKVlPvuDqii87UJUHKx0l7sVyYJ9JVoj2L/yxe1wIl589dSL4DPwX3hr9u6/KdhNgtg9gWdbqbYK1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkdmIDtDS3O7311IOxWE6UH39lAE/IA0Mtd1GRVk3Tg=;
 b=gIYJ7x7JnayYa7m04lFk9su8kreig6NsNheJExUbEuq1viaTbSn5rrPy5KANeBGCdv0Df4Q51f2XPkvzy8wMNsqRDjmZFFOIb5ynMg28xBNCZaYpnZ0310rVcahFUbDU7qPfdbXm1o07hTbGVG6gZmBaIgxHz/OTnvO6lkhWyTnKuFoLtjdQEcYiIVnD9TJOGttouZPGXhGApVwuLUQ5eaMxajlKVJL5jkTJfD06sadmLrTdrhXjJkyiYOmkFLS/CF0TwLBqNymN/gfUUAQq/k5PgVjYK1+/nGgn696+aCAMJPxJm2AJW+Azxc9mhQ60af5boDYFjKAihAr0jIPQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 06:24:31 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 06:24:31 +0000
Message-ID: <7f1530f9-6883-4beb-8489-7ccd4da63e36@intel.com>
Date: Thu, 9 Jul 2026 11:54:25 +0530
User-Agent: Mozilla Thunderbird
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_feature_discovery: add HDR, VRR and DSC
 discovery
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260613195901.2675666-1-swati2.sharma@intel.com>
 <20260615100628.os6kuvldgzhzejzp@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
In-Reply-To: <20260615100628.os6kuvldgzhzejzp@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::16) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS0PR11MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7aa8ca-1760-4142-cc3a-08dedd82bca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|5023799004|11063799006|4143699003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: ZG+kFbloZ0IhnqzHkG4jLW3icaziZioUrpmq+ayC7Sn2k6Gt1+361LM1WudwH1EC47iYCXlmkgAphe6CsCBkTTrMHGeNT2pHQK87Rscw5c6QEsPbrjiDTmMr7+3zGrquxsUSxSqCMQ0IVsYyOUoAyB2nvOLCY+CtiK8ZKE3xOu5aZ0l6h5a0AKfY55pNlyFZYhG8YG8BvsZjuiPKf1pQ126W1nT4SGtWSS2tB/tgQe2fgE7a5g5pXctxrBTTYPlEXboWJTVeiR9Um1wJK6Uzh4zfTQ2cDQbNZp+GbC7G5Ql7nuUWoDU5wOhUzZ8x1JhXVzFb31vuiONh3xRBmM3AHGQJfYWTjxUZkbvkfflljbKkzC3DnFxJwCYuSzd2Q/bJb8Teds3AJyekldFLtAqgmFMxTH5vM+A13LR2esLl16ZcncEX9FKV/VQJGTFythMA3Q8yJbgaydx5tXBw5lAySpgM0DxsF38rgGTo0GEL6gb4NQlou8d5Mu/bXT4C+CpMgbDtke0VsE5f4mEdRdG2oy3q/BMOb3ZhrTLvQK90vlZWlZNt9h06bZubfZGbYDO/w2NqxA8xzvagAGo6JqyzWDIB0TagjfgM3JMABg+CDX59JsGN9yhuEcd8e6fhL53BakJxeiIIS7jJMGUPOVKUMogwZBl8ZqLY8n2nyboT/L4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(3023799007)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDZiM0dpamtqU3BjMmQ1U29vK0hXeGl3ZFR0cnB5RDJjbUdQVUtJdXRyQTBr?=
 =?utf-8?B?ZmdtZWhmYzRkV0lJNXR3NnE4ci83bmV4aG1aNG0yWk9jMmlaS0hrUWJvUzJr?=
 =?utf-8?B?NjV5Rll1ZzdUa2pHWlJkaWswZkN1TThuZWl2UFZzV2U2cFZBcTByTmZyWkhO?=
 =?utf-8?B?SkJGcnJhMVpxeUlPK1pqNkpWS0NaWDFVaTRLWkdRSWNHYTJtTWFiekRxYzBG?=
 =?utf-8?B?SnBpMmxOdnYxMldXdmplRE1SNFlhRUlVdU1ZVi9QUUtVWXhqa2xBY2t0bXBB?=
 =?utf-8?B?OFl4MjM4RW5FQkhHL1NpQitzbkYyQnpTWFZwVWlpd05OYlFmU3FmVlZwWm1X?=
 =?utf-8?B?WlFXckVJTlM4dVNGelpoMUFzS0UxZHYyUldaaVRLSWJ0bXU1K0JrZXVKU3E2?=
 =?utf-8?B?cklIY0ZnZnVxL1BiekpKL0RJSTYrWC9kdkFNeldQNlNNamxDUUsxdEw1VE55?=
 =?utf-8?B?RE9FSlloeERlQnBXNVd6VGdSa0ZWWlk4UjVONFFjMmNOWFdmYllwY1k4eXZU?=
 =?utf-8?B?ejdvNU1CWFZRZUhVTSs0RzNiT0dIMVhUVmFSNGxzV2NvcXdhZVUrVjhTakhF?=
 =?utf-8?B?VHcyY1Q2RGI0aCtzVVdVR3pEK1NwWS95d3ZlOFo2ZkRUcVJ4YmV2RHppYmtp?=
 =?utf-8?B?OUxXN2svU3E5cSt2MzAwY09wbnF5MGt6OXU4K0VpRDhIN0RlKzZGSWQ0ZHZV?=
 =?utf-8?B?TDc4WWM2RjZ5YVlIeHRLcXQvVDV1ZTQ3bmh6YWtJamNKdEVpbHJnbDhqcUV2?=
 =?utf-8?B?QU5oQXRVZ1Y0c3pJZGRDaTNGZk40dG5EUU9HMjVPbDQyTWkzYmtZTHZmbklH?=
 =?utf-8?B?NWNPYVIwTUhCNVdvbW43akdjWEhOTGpscS9JRGl2ZVdReVdpeklLZ3JlWEc4?=
 =?utf-8?B?bnVDL3g4QWc0ZElFdkVFRkNyY0J5bUtTNDVHcUdlWG1COXZuaHdpZjYzVU5s?=
 =?utf-8?B?STYwcTdQSkh3Y0ZOVXpYQVJzVTVqVk1LUnp2S3FCaUdFMnBIN2s3THFteWlS?=
 =?utf-8?B?ZnV5SklleTh1bG04REw0V0R0YUJTYnE2Y2pBQU9paHBaTGt0clhPb1B5bE01?=
 =?utf-8?B?ZE5vQWRjR3lFUVFpcjJhcTRyTWJwVDlXelhQbjlGelRrdUVPbUNha0NOaHUw?=
 =?utf-8?B?d1dXTWl2QWZ3bmtiT0RFKzYxUkluMDdlNzBQOGxlS2ZZb3Q1b096cWNGWFFl?=
 =?utf-8?B?bUc2aG5NQ2J5NmhOZUY4NjFYbHlDQ0JLRW80Nm9IQWdsemREa3R3LzhaUTJ1?=
 =?utf-8?B?aGlrdlREUUk5TnZXd1JkU3pURGRHSXhsWkJkelViRG9CR1RYZVdIN1BwSTI0?=
 =?utf-8?B?eFVCekQ3WGNZMEJXSmJkSkVxWm02dlprcysvK1ROM2cvTXV3NVl5bDJBYXBY?=
 =?utf-8?B?ZmVtUEVSRXEydVErNFl6TnFoNzhwSm44QjVRTTBKWTFJTEFUQXRGb0w1NTBN?=
 =?utf-8?B?NHY1OFhMSm1iT3BLQkRGLy82WUFuNzdWS3RoMGFpSENoTjhpUVMvdFJGU3pD?=
 =?utf-8?B?K1E4Qk9RRVFJeUl4VFRpMm5PZ2cySHNsOEpuL2wyR3VmTVVJUzYxeTROMU1W?=
 =?utf-8?B?SnNLTGhVQ05xR0JaM2NXOWgxY3o0aThtejRpL0dJZXAwOTB0Rk9obk9CcXlG?=
 =?utf-8?B?VVZ3Nmczb2FUV2d6VU5TNFNlSVFMenZJbDJqdm5kUEtFdFdmM0J6ZkxJQmRK?=
 =?utf-8?B?S0Y1eDVwYjFXQVU2QTdFcTFvRC81ZUhaTUFRY1Q2VzJrSVNHQ0tycVdzZWlB?=
 =?utf-8?B?WEJYQVRsRDVGN0dIK3pqZEFtcVV3czlubzc0MFd6SVdrR3FlblRkTmtDVEJS?=
 =?utf-8?B?UWY1VXVDNkhnblNxcWxaWVc5aFhBSW9rRFdGbjh2bnFDeHRuVk5XOGpnb3Nq?=
 =?utf-8?B?R1NqMS85TnZKcFVTMlduVnpGNnRnUWN0TTZVZGdRRkkyTnZGbmdIV1NoV09i?=
 =?utf-8?B?QWZMeDExUWltbXRUV2xaWFJrRHVzcG96T3hGU3JRTnowc0tTUzRzNHFFeDE0?=
 =?utf-8?B?VUd3Rm1OL0l1TFAreEhvRWF1eit1SVEzTWo4NG9UQ21zSFJrMUorT0RlM01Y?=
 =?utf-8?B?WjhhcFRHR0hUTzhPNVRYUE9NbXNnWlV5cmt6S3RSLzNUOUV3YSs0Tml2STRx?=
 =?utf-8?B?VmcrMWJnODc3dnA1aGJjUm1GREJtTmVwSEdMWFA3bTM3bGcwYTd4dGFhOEhG?=
 =?utf-8?B?b3RsTFl0bnh6dGozdit4ZUt0M2V0dlV5RzhTb2VuK3NKODVTeElIR1lSbHlV?=
 =?utf-8?B?M0N0SmF0dTlVdVI5cnZoRmVFcnI5YnpCR29Uc2Q3dG11cTlGUlo2SlVVZmxj?=
 =?utf-8?B?SlhIaWM4eGVBZkJpeXNxcXp0ajBMTEJkRjZaMWJCM1VTb2dZVEM5bXk2ZXVi?=
 =?utf-8?Q?IsH4ciFFWT+C13NQ=3D?=
X-Exchange-RoutingPolicyChecked: JCaSHgPGw3HsIy5LnVcXdtCGhmmRckMTO3vLswVl5zFE/nIRhx/G9izxopAV82J9BssKPs7fUEUe09LxVmf+Q7NdrImUL6mwVqBcUqbQNbkbuwAMEkhg/83eqMcRrZ7P9pt4Qghwcu9HVODCKTj8bLxyDTLQSWxXu8jrHvsRcrVPah2CLEVQR8v5zsNbw4l8D64FcoZyOSba7aFyPofOEdDgEcxi00G3tIbTsO4CfABH5ZFFWphnUDxIdBpaejUudbaGzR852PjYI4Oqp61xhP4NTbO5FqlDs36zgD3aOlT5xp1IqEg1kM9DFncZ4yLMmnr83/aEW8do1hPXe1Zpzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7aa8ca-1760-4142-cc3a-08dedd82bca0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:24:31.5489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyC//SjUEL2Y0dbsYGKGyrQ23yA/Wnwg40N1XuNbsRBUvkVyPdKcdUuXFf6MpFalsx/M2NX9A5HHxe3p+ZTDKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
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

Hi Kamil

On 15-06-2026 03:36 pm, Kamil Konieczny wrote:
> Hi Swati,
> On 2026-06-14 at 01:29:01 +0530, Swati Sharma wrote:
>> Add display feature discovery subtests for HDR, VRR and DSC.
>>
>> HDR requires:
>> - IGT_CONNECTOR_MAX_BPC with max bpc >= 10
>> - IGT_CONNECTOR_HDR_OUTPUT_METADATA
>> - EDID HDR capability via igt_is_panel_hdr()
>>
>> VRR checks connector vrr_capable support.
>> DSC checks sink support via igt_is_dsc_supported_by_sink().
>>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
>> ---
>>   tests/kms_feature_discovery.c | 75 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
>> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
>> index 28ec89c55..07a0c5e16 100644
>> --- a/tests/kms_feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -36,6 +36,7 @@
>>   #ifdef HAVE_CHAMELIUM
>>   #include "igt_chamelium.h"
>>   #endif
>> +#include "igt_hdr.h"
>>   #include "igt_kms.h"
>>   #include "igt_psr.h"
>>   #include "igt_sysfs.h"
>> @@ -63,6 +64,18 @@
>>    * SUBTEST: dp-mst
>>    * Description: Make sure that we have DP-MST configuration.
>>    *
>> + * SUBTEST: hdr
>> + * Description: Make sure that we have at least one HDR-capable panel.
>> + * Mega feature: HDR
>> + *
>> + * SUBTEST: vrr
>> + * Description: Make sure that we have at least one VRR-capable panel.
>> + * Mega feature: VRR
>> + *
>> + * SUBTEST: dsc
>> + * Description: Make sure that we have at least one DSC-capable sink.
>> + * Mega feature: DSC
> What about adding panel- and sink- prefixes to tests names?
> For example:
>
>   * SUBTEST: panel-hdr
>   * SUBTEST: panel-vrr
>   * SUBTEST: sink-dsc
>
> Up to you, maybe in separate patch?
I guess panel- / sink- not required. Other tests are like psr/psr2, etc.
>> + *
>>    * arg[1].values: 1, 2, 3, 4
>>    */
>>   
>> @@ -174,5 +187,67 @@ int igt_main() {
>>   			}
>>   			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
>>   		}
>> +
>> +		igt_describe("Make sure that we have at least one HDR-capable panel.");
>> +		igt_subtest("hdr") {
>> +			igt_output_t *output;
>> +			bool found = false;
> Could you add a counter for how many outputs were checked?
> Maybe in a separate patch, not this one.
>
> Something like:
>
> 			int ocnt = 0;
>
>> +
>> +			for_each_connected_output(&display, output) {
> 				++ocnt;
>
>> +				if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC))
>> +					continue;
>> +
>> +				if (igt_get_output_max_bpc(output) < 10)
>> +					continue;
>> +
>> +				if (!igt_output_has_prop(output,
>> +							 IGT_CONNECTOR_HDR_OUTPUT_METADATA))
>> +					continue;
>> +
>> +				if (!igt_is_panel_hdr(fd, output))
>> +					continue;
>> +
>> +				found = true;
>> +				break;
>> +			}
>> +
>> +			igt_require_f(found,
>> +				      "No HDR-capable panel found with max bpc, HDR metadata, and EDID HDR support.\n");
> And here print ocnt, like:
> 				      "No HDR-capable panel found with max bpc, HDR metadata, and EDID HDR support, checked %d outputs.\n", ocnt);
Sure, will do in next rev
>
>> +		}
>> +
>> +		igt_describe("Make sure that we have at least one VRR-capable panel.");
>> +		igt_subtest("vrr") {
>> +			igt_output_t *output;
>> +			bool found = false;
>> +
>> +			for_each_connected_output(&display, output) {
>> +				if (!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
>> +					continue;
>> +
>> +				if (!igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
>> +					continue;
>> +
>> +				found = true;
>> +				break;
>> +			}
>> +
>> +			igt_require_f(found, "No VRR-capable panel found.\n");
> Same here.
>
>> +		}
>> +
>> +		igt_describe("Make sure that we have at least one DSC-capable sink.");
>> +		igt_subtest("dsc") {
>> +			igt_output_t *output;
>> +			bool found = false;
>> +
>> +			for_each_connected_output(&display, output) {
>> +				if (!igt_is_dsc_supported_by_sink(fd, output->name))
>> +					continue;
>> +
>> +				found = true;
>> +				break;
>> +			}
>> +
>> +			igt_require_f(found, "No DSC-capable sink found.\n");
> Same here.
>
> Regards,
> Kamil
>
>> +		}
>>   	}
>>   }
>> -- 
>> 2.25.1
>>
