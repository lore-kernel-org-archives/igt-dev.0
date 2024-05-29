Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E9BC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 11:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CADB1138C6;
	Wed, 29 May 2024 11:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4IcyL+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3741138C6
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716982463; x=1748518463;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jG8VqVfYSwLtARxNmi1PvbwMFmo5vjtctd03YDInCH4=;
 b=j4IcyL+sng2DW8OpIaj1csSRmwcfd5C+g5sLzxrQkE/OO1j0SpkMptkd
 J9WY0PE66D/zFo/hmJRrsE8v7zZRQSZZ+5MyyRZy16zHT8YE1Bl5JpSbp
 PLgmfhZErMiutVwN75QNsXo3HHfgg0QoZ/kSLD/IPxWSzTaeOydvgxlJW
 Bxc0cFZdVimMVY1OPmc6g6X2xAo0nCdB4yvC62xbqtIAUolX50Ti2rDeg
 iQFmGeEOTWSAfr2ZS7GZdQnoYq+xop79XiV8pC2E6Jg982gCBIfMtLdw5
 d2cPvUlnUOX6nJcSrmLMEUZFcRfvzOL/ChTbEwbJmRo2/yK/7/ZusOuav w==;
X-CSE-ConnectionGUID: p6vn9I4YQnm+x2OU2YbFBA==
X-CSE-MsgGUID: kZzKwuowRAGuIPoCQn87dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13507001"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13507001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 04:34:22 -0700
X-CSE-ConnectionGUID: jIZXpTnATMuOxqFQR8YdOA==
X-CSE-MsgGUID: d1ikMI4wSAuiFpqqBviPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35378911"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 04:34:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 04:34:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 04:34:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 04:34:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 04:34:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpIUfFpyMpuLpu7rAiAJbrNxv4eJlPdYUk4OSpgCzft7iOp8nnw/p5X6sxICZYIbvexq/jrexgKboJdqcXnxU69jx7niht9nK+Asmv+UGeVhOarJdqPHpaU8l+erF76xBSAu/Vzl3Mi05uMLcAz9j8oSffPX9rSBQfJRhfrDzJHi3Qv7QdDDCShqKIZ9sgPu9b2C3Qqtsmc/K95m9DTeiXurQnuvkLzfn46/3YbyVstjevhXpIWojG7Qe9Kf3C0+AHI+BO2wWYs3EvBbde/kygSTOXFpfAc+ZAmRjB0Sms9SHTwM/ovX4gqcfzuSJp3pvXCVsVwPCYUida/sV+WuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZYONcZIaNbYyOPOHMeV/JioUNy32G4crA3Vl/77pW0=;
 b=Vlvu2YLeiFlB8e7RQpUqLTzTiv1mgQ9Oit0lmPNlDxEbrHDg3mfQyXNpOjhsiNduG2Py/pyNkeZmppGe4pjHCYknHnF/Z7mUlnzVKevGP8RBanWrnfPSFuVJni7WsDnZwBjZhwSfyBlj/P7tZGc3Bt1NzJ0bS5Z+yul4f8YFpzVexQMAieX9kGq0/TsLaSKMJpZpxf1ZGXRC/kI6Jh9Gs+m14upPWNHhPcyTHmo+DBp0uK0cN+l+xQFMfEdyMmJf7Ilvit62HIJabgibk8oi7bHbLR6anGrXHmG739nnbXXm1I9Xf0mQp2h2oLKldyte/YDQR/taw2mgS22Latylgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.28; Wed, 29 May 2024 11:34:19 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%6]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 11:34:19 +0000
Message-ID: <b0ed31c3-c492-41d5-a88d-4f47c611991c@intel.com>
Date: Wed, 29 May 2024 17:04:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] tests/fbdev: Add testplan documentation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-3-bhanuprakash.modem@intel.com>
 <20240528153918.sndsnr4k3vn2r526@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240528153918.sndsnr4k3vn2r526@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f532d03-7a74-4396-ace4-08dc7fd3475f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVJ0bGwwUUwwLzVSQUtNVi9xSjM2aFhFMkgxaWkyRURuQUM5NjRTUjNOdys4?=
 =?utf-8?B?WTZKWEcwMmJYTHBlVHlVd3lxVlc3YXYrenRkVXZKR0NQc01vdFo4VEVReW45?=
 =?utf-8?B?QU1EVkVGRjRhcVFnVW1jQUQ5RTRQcmVCTkE1ZnhqNlBEWEJqT0p5MlhsVjQr?=
 =?utf-8?B?azVxWXAyL1p5RzZzalZRSlVRRmppd0wwcVhGcGRNRDJ5d2ZPeVU5R1Q2VVhm?=
 =?utf-8?B?SjRGYk5aUnhEZ2ZGdlZQYSsxbWUyc0VRRTVMYnc3Q1VZZkVPTXBVbXByVXNi?=
 =?utf-8?B?TmxWZVBWS2ZhazAzbnNKelZYRkZaWkZ3RUpuWmdIQnk1c0hidzRlem1EL2s4?=
 =?utf-8?B?Nkp6b0xVdEdLRGFleGg1ZnV6U0NYZ3h6U3dRQUJOUEhJVVVUWXlrZzgreGY1?=
 =?utf-8?B?VVBHdFNDcjB0Q1gyaXlsRytFMTcveXI2TmdsR09yeEY0dkRvWUM3VHNiN2pU?=
 =?utf-8?B?Q3lEbEFPOUlsQWhPSEpMdUFQeFo1RWQycUlPZkZ2cXRvZ0NkbGMxbGdYN25X?=
 =?utf-8?B?QXViWGkvZ2JYa2s4WDJCRFNiVUplRW5rQm13ZWlIM0I2cWl4dWtxSVlMMkNO?=
 =?utf-8?B?T1F3Q1FUaEdjT1dSeHVhVnl6RkVVRzF4S0NyWUQrT3dQamkvWjB6VXpwREp6?=
 =?utf-8?B?S2E3SGRNTGhiVXpjdVcya2NSdzdzSGVHWG9hQlRuekxwV3lLY3JDbzZQc2Jm?=
 =?utf-8?B?NklEU2VQNW5IdExUc1JYQ3UvRTlkQ2lpTFcyZm5iZjI4TlJuanFkeUFvcUoz?=
 =?utf-8?B?UVBCKzFEcGdZbjVkWnJLaG9ReXh1Ym8yU2ZiSjRWQnoyMWJMcjJsVS9Cdk9U?=
 =?utf-8?B?UWN1eHczRVVEaDVvcVZTUjlyUXpieURMN3dLeHZ1anlFbUthWU1FWmp6Vjh3?=
 =?utf-8?B?YkdmQXJnNVB5TWRxMnJKYU43emk0M3hwdVpVOXpRZWhFeThEcHY0eWVybkY5?=
 =?utf-8?B?bUNINEhiVG9hZDVwZHFUSVhvZGFoNUVkRGVKV0xmeFloRnlkUXNTdTJoOHpr?=
 =?utf-8?B?bHNhaGhtUWJiS1lOU1V5Y3VPdDcvZ0V1L3dZQXZKeU5teCtQdmlFM2xPTGo0?=
 =?utf-8?B?cURhZ0lkVTFxVWVaTVZmTlhRMUJ4aGw5NGhVdStjMitJZ2M4SVhmZE5nb1JC?=
 =?utf-8?B?LzNHM0R2Ti9DUGIrcStuZmhUcmRSQ0JOU2hPT1RzVzRMUkJxOGR6R0N4blhz?=
 =?utf-8?B?dHIraDJFazQrU0p4Q05XMktPUi82T0xBT1hpOG41R1Jkc3diVGVYMjl5WGpN?=
 =?utf-8?B?WC80TW91S3V6V0lZTGZFWlIzYm0zd2dZbG4rTnRRamE5QlhTeG1hQkJMK0pa?=
 =?utf-8?B?N2ZJamtLekJFZDJLN3VXYUJaaGViWkFBVEE3Q01sLzZYQW1LdXVVU0hwWVhh?=
 =?utf-8?B?UHJ2QlhBWENIMXdFMEpqcWFHNGxhby9rKzZHeUV2S3llZ1ZXSW9scDJzUHFE?=
 =?utf-8?B?V2pUVzJJS3NiWnBreDV1d3E4aUNoVGJpWlMzNlNhZTRJUE1SeGlvVGRaZW8r?=
 =?utf-8?B?bStxcXBLOXFoOUNSc0RzTk9tOUE0VjhFOEtBQ1p2MnV1Um0xalY4UW95Q2lD?=
 =?utf-8?B?b3B6Tm5EdnE3bzYrU2dhcG9ldzR1OEM0aGhlelEveSsrT242ZThrTXNoOFdB?=
 =?utf-8?B?OXRlOGRhZ1h6S2hPdUllcVBKVkxubkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0R2SGpBUHQ1UGpxOEtXUGFPN0tDQ01qa1IvdWhYZ0ExK1diVGJQTEpST0Z1?=
 =?utf-8?B?SWx1QjUzM0JtZm1pMS9qaXZ5SCt6cWF3WHJOTFB4TGJxY2dFcHNIekZpQjU3?=
 =?utf-8?B?OU1yMlZEWk9jeWlZbFNVS3BlMHJ1aGh0a2VLV2tYTHJFMHRwL3NjeG9XRkU0?=
 =?utf-8?B?c2JIdE5rMjN4UDZ2SCt0ZmJtNEEyQ2pWSzkrZzl2R3M2TEdoVzJXd2UxaUNI?=
 =?utf-8?B?NkNJa3ZzTTMzMU8yWFlQNnhHS1hEOFhOdEhrSlo0NTJ4L0VPMzI0WjRSSXBY?=
 =?utf-8?B?YkE3N2RvY3J4YVhvZHI1SnFWWkZWOUIveTNEQVY1OTRHQ2RKS2YyRXN6cWtw?=
 =?utf-8?B?L2w4cFVRZVhVczVVTWpEZTlrbGZVMlU4R0Q2ZTRDb1RyeE9XQ0R3NkhuYlhR?=
 =?utf-8?B?RWFDZWpEaitnQjM4TXQ5SWZLUzNCdkEydEg3K1JjdVNFSkwzMVYrRGJGUDla?=
 =?utf-8?B?elBTUTB2aFpacDhuNmZWUHUxdGpabGY5N0RXb3ZXWlRqYTFKRDlkMzBJLzJs?=
 =?utf-8?B?TlhIVnVFb0ZIZHRIVVdDQ3dLOTlGV3ZPZmdXT2FCeXJyTlovS00wV294RjE2?=
 =?utf-8?B?dFZTZzVTbzhnQk9jKzlnelpINGh3ZmVpU3dVQ3dDenMwK2hIUE5ZeHFKeW9i?=
 =?utf-8?B?U0lSRzlha1ZKOUVsTWJ5dHBxTGVJVWdBVWRyRFFLZTFUbldVdEd2bjE3VnV5?=
 =?utf-8?B?dlZhWjU5ZXMrdVJzU3lUanlValZDWXIvTzkzQVRnbVVKc3AwNE9OMUVaSTlI?=
 =?utf-8?B?S2R6K2NMdGg2amdxbjVZaWlHWXhWU2FkT1czOHgwQjhkcHU4MlpaSUJYN0JB?=
 =?utf-8?B?dTVaOGRjMitySkJCTWwxcGJyeFQyQ3IzeFg2aXRobXcyWXVWSFFwaDBiN2dt?=
 =?utf-8?B?dUxrVTFscUJCVUxPcTM5Sjdyb3J5SlFDdW5OSmF5aVBxY0JiRnB4R25pWnp2?=
 =?utf-8?B?VThVazZURVdTekdwMzNpSnNQQUhhMlY0cHRMWVZ6NkVtQmtJQ1NRSnN2Mkpi?=
 =?utf-8?B?N1NpRTZMdmoxU1d5dVloYjY5SVVsdGFJMjk4ek5DRjQ3U3B4cnhtUHJnbVFR?=
 =?utf-8?B?RHd0VWtsazg0TUp4b0puNHZMWkZZdlVJb1h3QW5ldzV0dWJmSGJXeTB0V1pO?=
 =?utf-8?B?YithbjQ0aUFGZEVyVmpxNnBYbmhTNEo4c1NFdjVXQi9OSUg1MzZ4dVdadk4z?=
 =?utf-8?B?R1hLSWZPVWkrb2REdEt0UHB4QjNmWUNkU3I1eXNrVDB1b3lSTVEwYUF4MWNr?=
 =?utf-8?B?MUN6Z2lZNnpNK2NxcjdmY2hjdC9XZ1ZXdVlBcTh2ZWFIdS8zUE4wdzcwNHBk?=
 =?utf-8?B?N0c0anVRUlk1YWdyM2hCcE9rd1B3SDlGUjBoNE9Tc0w2K0NuSFU3Tm5GSThU?=
 =?utf-8?B?YVZxdzB3SkFMQ1pNaXcyTkJteUYyUmU2UWpDYW4vV280MGFKSndpSWR4UTZJ?=
 =?utf-8?B?WHEvajgwc0JtL2xUa0hJZGFEZ3BIbkV3K1g5LzJBcERONm1FUzZIaUMxSDV5?=
 =?utf-8?B?TlV4QjdEbFpyMXhwcmhHUFFqUzg5ZTJ5N1pZcWhRTDljT0VaZVZqZjQwcU54?=
 =?utf-8?B?NUM0RFRlNmZtV29ML1FOTjN0RnBWOWtpb1ZqUGFjakx0b0htVlAxNFp3dTRP?=
 =?utf-8?B?TWY3aU54VVF1eDd1RnlYamMwSEtoM09NSEUzc0tQazNzcVlBR0JJYmFtOVhN?=
 =?utf-8?B?VE5xZUpMSXRlRTZFY3NJUDA3UmQ3K3pobkRFaTk3S2Z6MmRuRnZmanZmd3Fo?=
 =?utf-8?B?L0FxRGRaVXpadXFtNDFJdnBQcVdwcGJsRWVTVXBGWXExYzZ3NCt6d0haWStX?=
 =?utf-8?B?a3kwc3VKZGU1RUk0L3VxYm9BZGhaT1pLL3c2ZWdnYWhYK2hHbldJaFJ3enVG?=
 =?utf-8?B?bmJFWll6QzFzam9oM1AvUE5McW9ta2hPQzVFZjVCYXQ5YUx6djFURG1RazJ3?=
 =?utf-8?B?eXFQeGlpZU45UTk3dHI5ekQyc2FhZm9OZ0NhaG9JRkN6YUtPZzI4R0kweEdU?=
 =?utf-8?B?U1gwejJpZnBDVjNkUndwUktVSnk1MEVoMVJCNDk5aXNZSStTVngrNGhDNERw?=
 =?utf-8?B?MitnazlsYWdLeWplMk1NVFFmVWhseGlUckNCRHE3ZTAyRHpoT0lwdUdxanBQ?=
 =?utf-8?B?dmw1eUFBTDVPM0pnSTRjSlVwY2xERFBjeHRrQlQxcnhBaWV4VktlNDZsNUlF?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f532d03-7a74-4396-ace4-08dc7fd3475f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 11:34:19.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdEoE6UHD2K6rvPnEpAyQsccTRUCVRkO74Tdf0T47lamg32JTP+C9IfehSf1D02HVKU6+l4cPiEua4c2Xod5VyfWpzENR+PtxvdOXcOyRMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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

Hi Kamil,

On 28-05-2024 09:09 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2024-05-28 at 11:12:20 +0530, Bhanuprakash Modem wrote:
>> Add testplan documentation to fbdev tests.
>>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/fbdev.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/tests/fbdev.c b/tests/fbdev.c
>> index 794882a6a..f329e6ac6 100644
>> --- a/tests/fbdev.c
>> +++ b/tests/fbdev.c
>> @@ -21,6 +21,15 @@
>>    * IN THE SOFTWARE.
>>    */
>>   
>> +/**
>> + * TEST: fbdev
>> + * Category: Display
>> + * Description: Sanity test for framebuffer device.
>> + * Driver requirement: i915, xe
> 
> I am not sure we need it? I mean it can run on all gpus,
> not only Intel?

"Driver requirement" is Intel thing to differentiate between i915 & xe 
specific tests (As few kms tests contains both i915 & xe specific 
subtests in same test file).

> 
>> + * Functionality: fbdev
>> + * Mega feature: General Display Features
>> + * Test category: functionality test
> 
> Please sort these fields after other tests, see recent Kasia
> patchseries or look into other kms tests.

These fields are already sorted alphabetically. We are using the same 
style for entire KMS tests.

> 
> Could you also fix this test? After merging locally your
> patchset I got errors from 'meson test -C build':

This issue is not seen in my local/CI:
https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59210298

Ok:                 423
Expected Fail:      4
Fail:               0
Unexpected Pass:    0
Skipped:            0
Timeout:            0

> 
> It turns out test uses in igt_main:
> 
> igt_subtest_group {
>      mode_tests(fd);
> }
> 
> and then defines subtests in functions. That is causing test failing.

I guess, that kind of implementation is legal in IGT.

- Bhanu

> 
> Regards,
> Kamil
> 
> 
>> + */
>>   #include "config.h"
>>   
>>   #include "igt.h"
>> @@ -39,6 +48,36 @@
>>   
>>   #include "igt.h"
>>   
>> +/**
>> + * SUBTEST: eof
>> + * Description: Check framebuffer access near EOF
>> + *
>> + * SUBTEST: info
>> + * Description: Check if screeninfo is valid
>> + *
>> + * SUBTEST: nullptr
>> + * Description: Check framebuffer access with NULL
>> + *
>> + * SUBTEST: pan
>> + * Description: Check panning / page flipping
>> + *
>> + * SUBTEST: read
>> + * Description: Check read operations on framebuffer memory
>> + *
>> + * SUBTEST: write
>> + * Description: Check write operations on framebuffer memory
>> + */
>> +
>> +/**
>> + * SUBTEST: unaligned-%s
>> + * Description: Check %arg[1] operations on unaligned locations in framebuffer memory
>> + *
>> + * arg[1]:
>> + *
>> + * @read:	read
>> + * @write:	write
>> + */
>> +
>>   #define PANSTEP(panstep_) \
>>   	((panstep_) ? (panstep_) : 1)
>>   
>> -- 
>> 2.43.2
>>
