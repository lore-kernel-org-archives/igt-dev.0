Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91BFCFC503
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 08:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619510E3CE;
	Mon, 14 Oct 2024 08:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSGrueeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F3710E004;
 Mon, 14 Oct 2024 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728894910; x=1760430910;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hIUjKvGOCwSnjZEjkza5OSw3si06CnqPjS78qvfQ5DM=;
 b=dSGrueeGXpyrF7n2hV9ODRHaYmIdhPIAu5OJjHRfg6ilFBDdZULaOMfd
 9+3JGlPGzOKvlKwYT+b1DM0ZstAp5uUEyhgMeUqY7eMLbclHZgi1pbyRc
 ncIF6JtJjeJjLJd+Q0oDNqAj8DxePe1q/JnbnD72ZEja2ZXzdh64ZDF7C
 PvlUu8akEUpWaAVx8dp6CxKKXVQO8/jc/qRGaFJnN4KTjHnEPu81zlqED
 Jtlqj2CS8DRCr3B4s04Mwf1GT5tbcBoWYYijel1+C/wzaQXBH9EvN1I44
 6lsPZPj+QpxqPf497pvNRKDbjTZTLnbb7Z8Lx4JNQm/8P8xlJd9NYA5jl w==;
X-CSE-ConnectionGUID: oOYhmxvXQamT0sxcqqV1Bg==
X-CSE-MsgGUID: KY+mhKhaRCe2Rj3vZcGPEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39628816"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="39628816"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:35:10 -0700
X-CSE-ConnectionGUID: 7JPbfgoFRlC0XJcKampKOw==
X-CSE-MsgGUID: PQJA9NZYQeSlqi4ROAPNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="100841930"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 01:35:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:35:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 01:35:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 01:35:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvKcbR3Pu37RLwlidxslvIzHy3ucJ1uW41ul/IivqJL/3X09r8Lb83I8F3Yfv8i42I4CD551s0HeauiU/JoF1qi3+26qcgvPKFRwFc+AV8q+6F8tF1TEHkDtmOffNHBzA1U2j91IK62yHtURlsUx21u5kqMXsE2CpF8ORedtsAZOhHBXe9Mrej6XdWYBlAnMKCyjybIu9+CESNvl4X0OBe9q3+zdm6zumML7kzvRcrC0iC7aXV67lsv8D/jF8hxkpL0YdSxUun4esSD1iGUBCgt6JzZ5X5fYQwh/PkGO3pWxYz6E50uFInKwyU47jDHDybAIUOLty4w5FZfjivPcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpABvbYbeXFCwQBCSUVAxDolqx/ITrbCP6Sbr81UvA0=;
 b=glMM4iSeKn//IE8jb5uwwBjCKfCuLvE7MUx7+LG8J2J5pOvExMb6rOaHVkdMG2PyD9FPr3C4YcxG8whEMmktCCJFIGJB5nYEg4LgfEUwFnRECNAvqLFjrxx/OJdMPt4ZZ6GXO8uiQfgSMT4Mj8tbcIMfVZAksq4anzLUbHBY7KsfIZLXuF8y6vgbkhzUC3DB2TrcGHgdqf6O/gbyhPt0Ln0RIj2fMn5YkpmyJ+BRqyq6+t6/BQPC7BkET9nKHOduw3oCsMJq91uefUHChkiHG2GCfpxdJ/o04spM52D9JZDB6xNtygA2PQ3a0KSzcBNH3YQSzAfNUoqJqZo3EDhDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:35:04 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:35:04 +0000
Message-ID: <77850119-0f38-4958-b4de-12e0032075ca@intel.com>
Date: Mon, 14 Oct 2024 10:35:00 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/xe=5Fexe?=
 =?UTF-8?Q?c=5Fsip=3A_increase_timeout_margin_for_tests?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241011-xe_exec_sip_increase_timeout_margin-v1-1-7adc68a3fbed@intel.com>
 <172867890700.1242069.1313913703664699087@2413ebb6fbb6>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172867890700.1242069.1313913703664699087@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::22) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: b53b298c-6aaf-4a10-02c2-08dcec2b1a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0Vud1Q4ekQwUExRejdSU3ZVOWhmNHd6MzZWZUVyUU96ODA2c3BtbGF1TVlr?=
 =?utf-8?B?OUh0SXlqRCtFQ1JBR0pWTGlqUi9ndTFFV0crUWpCdzFUNVlvbnpDTDZESU5u?=
 =?utf-8?B?UUwyZzd2d3ZvQkppYitvVUZxcHZzY05qWVBNQTlKVGg1Um9lMVB0amRRbGJU?=
 =?utf-8?B?SGxFdGRJTUovb3JQMFJiK0hoRTlDZUlmdVJjVDVTeEwwZHVnUVI4cWtRN1F2?=
 =?utf-8?B?bVpZdlJMSFRWNHBucVNYTGRhZUdrNThrYVpBRkorNkFmTTJPVVFtWFJoMUFJ?=
 =?utf-8?B?VGZWRnVUcFhWbUtPbFZyUmZYempnYWQ5N0NTSm5DU1FlS05lbXVlVTl1N1E0?=
 =?utf-8?B?TmRpSjIzK1Y2TE1qejhmZnlYTklYL3lNNU85WG5zSUg5TXFEODgwT3NIOTB4?=
 =?utf-8?B?cm01aVArb0tibkMvUXlxY0VDYXdGSk1veGVtK2tLYTVpTWFDbjl2d05GbWJO?=
 =?utf-8?B?OElJOGR5MU1FZUxFRUU4N042N2ZFZURuUXB3R2NjTnFFdFA3dHc1RzVZU2lz?=
 =?utf-8?B?aTdFQzV4WlRrekgvKy9qR2NjYWorUFZ1ejVmTCtUbkkyVzJqcHdreDZ4NnA3?=
 =?utf-8?B?dlVsMWt6dmZOU01HWlFML2h0bFdDNTZla1IyczByVGdpMFlnanJFU1hoenkx?=
 =?utf-8?B?MHJ4ejZPbldFRG5kUm85eWNNNlA1c3ZNc3EvWWJwRHhNbEd5SktvM2xXVFZM?=
 =?utf-8?B?bjBpcHlkS3ZiN0kzZjFSaDIzZ1lDaHNnUjduNWgybVFWMGN3SnJIQ25wM2JS?=
 =?utf-8?B?N2ZIWmNKSE1GN3ZqdmpPd01aZkR4TzRqQVBrMTFBMFJ3clpablliUmdIL2Vp?=
 =?utf-8?B?d1NsL2pabW9PODA2b1VWNFl0MmNpbk1sV1lGNklRbTIycWJIcDBGSjVENzRW?=
 =?utf-8?B?YTNtYWhFM0VvdnBzVFdqK0EwbU5lalo3TG5ISURYWkw5UEo2RVlkS1RPSmN3?=
 =?utf-8?B?U25IVk1Hci8rbTRKQkF6NjkzY0VDTG5wUmxzaVFzd0gxbDZFMnpqQ0lwKzBl?=
 =?utf-8?B?RjRDR3JabnJMeHlJLzhvV0RSOG1JTStxQUhhY3ZDSXNyVDhNYTVDRTFEenY4?=
 =?utf-8?B?aXBhQy80a1huWURleEFWWVFQam4rYWd5ek00bXRqTHhza3lBdExHTmNKdHk4?=
 =?utf-8?B?M3Z4S0xQNUdRbjB5Nm1lQzlaS1YwRWx0eTQ0b3BJVmw2UVI4TFRnTHkydEhJ?=
 =?utf-8?B?NmhiOVB3V1M0c3Q5aXFnN0MvRzQ0dE84djFsaDdFUFlTMEZRN2QyUHQ1QzFU?=
 =?utf-8?B?dGsvay96dllkaWErM3gyemtER01BNFBqalpoU045V2ZKamFxN1JzOXhEZFI4?=
 =?utf-8?B?TnF0Y2F4Y2xwRjluNUFBMFovS1dvODlzVDF5NkFBN0hkdXRucUtXeENIbCsz?=
 =?utf-8?B?dGNNaHpqenRuRE9zalZZdjM1b1RmeERYbGxRQ1FHUlluN1FSMGloTDlmSG5h?=
 =?utf-8?B?dUNzK05RS2VhZDc3TlFqTWI0UXVDYUFBK3p4VE1USnV1YjR3UTNOcWdKaGsy?=
 =?utf-8?B?dGRUZzJVQ1hZMGNrNWtKUVorVHRHaGZrVkNrSkFVVnB0R3ErMUF2QXptVWZK?=
 =?utf-8?B?dEhwNGxtRDJjKzduem9jTG5YeGFNdE1ZSVZZSk1oMWt4SnczVTZpOFE5T3Ew?=
 =?utf-8?Q?L/ckOlC3nvbKK/MvZvHpBsI+Xf0/z8WEXs/1oi+A1q20=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGRCdkNIdnoySDVjcFpPalRWV213MHlHUXZROUdXWmJTVDVSTXp0dUM5UGpM?=
 =?utf-8?B?WG9OUmFMME03S0hOWmhoajdoa0lqNjJiL0w4a1V6VWhBU0hrQkJ2NTRjTllM?=
 =?utf-8?B?U0FJTkhpQ05QMkgvWEw0ZE9aUTZXMWh0bVlJNmQ3Q0FkMTZYVGkrb0ZZcWdW?=
 =?utf-8?B?UzIvNUR6RWpxSHlCZEo1Z0U2UUErUGllSUhSbEF6WGtOK29QRktMTTZKNlp2?=
 =?utf-8?B?d1grd0NldG92b2JkUC9LbXJJSER1cVBUbU5vbURCNEVONjNZTlZKU0FoSG92?=
 =?utf-8?B?SlpqVzRDRWh0RGJnMWZlNXRhdEZyZVZaSlpwaC9vK2tBQ1YrSFB3cGhhc3VF?=
 =?utf-8?B?MEZFQW1kNHJFTU1MYnJwdndTTFZQTllRaEZvVDd0RS9lUmFWWXEwSUZaZHgv?=
 =?utf-8?B?c2drTHQ2VzB4SzJPdU9yZFFWZS9xRVhlL1NDNmFCTVNVZUdzM2l1VXlIVzVH?=
 =?utf-8?B?NVVhOHQ5NmZGNFVITFFqVDF0T2R4b24vZWhaazdBaFJZV21mL04xa3JMTHpF?=
 =?utf-8?B?d3RkRjVYVEtYNGlkM3VGdG1wRkRLYmNRMUcrOFdsMHgyaUZBdVhjQVYxVWQ5?=
 =?utf-8?B?MHFCOTNKMC9GOVhNRkJoMmx4VmNubUNiemZicEdSWFhQR2RYNFZTek5PazBi?=
 =?utf-8?B?Qll1VUFXQ0N1YUI2UVR0UFZFSkVub0s0UTUyNk9ZWCtRQ05UT0d2cmVyWjdx?=
 =?utf-8?B?azRCY3R0VG5ES3plVW9ieDB6L25NNDdBS0VxMUVxVGJjd2JFOXl1dUJoZDFq?=
 =?utf-8?B?RzB6dFZTZU1DSERyenBSQWdkTGFOV1RSejBGV3FtZzNGR3VpU1VNdTRmNHBF?=
 =?utf-8?B?SFdNcnJyYS9jM00zWXMvUlN4SDB1bW90SEhUNUQ1clkzMGQwek80Y1h0T3lV?=
 =?utf-8?B?RFF4L3FlaEoxVU1qNjBYOFJncnZuYUtDSG5wb2Q2V3o3cGliRUZDOUlGMmox?=
 =?utf-8?B?L1JxRmJ0eWtHRUFtYkFzUytMbWhnSXNtQWNtd3NvU1VKNDJ2S3p0WHNsSzN3?=
 =?utf-8?B?OUlPcmFFY1k0R3VEc0RUL0FkZEYwWjFieWNkd05MT2pWTGhjKzZhQXUxV1hO?=
 =?utf-8?B?TjBKNlE5NGFKdVdTbzNhK1NDQ0lhL0NhMUUyUVUrNzFqQWV3ZzhRNDJXYU5F?=
 =?utf-8?B?ZTJWN2hKWW8xWkZKYXFGSGoxbjFwQW5ZWjZwOWJCcVc4Wm54OTFjKzdFcG1h?=
 =?utf-8?B?QnpJemFOWGhnbCttMXVvMFZCb3Z6bUoyelpzc2pFN1lXUHh0cUNuU1ZlM1l5?=
 =?utf-8?B?Wmt6Qm5MVW5nZi9jS2E0OG1CVGJLcjg3Tk5KQUlGMVE3QlR5cW5PbExmWURC?=
 =?utf-8?B?YTE0YmxZNlFZNjBYdkZpK1lPMHJCa054N2ZQRVN6SkYxdTg4Y0xOWWNob3VO?=
 =?utf-8?B?cnNHZnZyMFIrY2NwZGg2RDBob29HVW1yQnorSnRUTEgwOVluSVpUNzRrVURW?=
 =?utf-8?B?Sy9vL3hydVN0eFV0K1ViSjVsbWVjV1ZoTnF1MnhaSDhubGp5R3BubHBRb3Vs?=
 =?utf-8?B?dDdaOFQ4amFyOHNiK2FsSmpMY2o1NFJXb3FlZHhtWHVwYXlyMTNLM3QwN0lv?=
 =?utf-8?B?ZWNXSTdQWVcvR2N6M0ladDNaRU9PQWV5dDMwYjd3ZTZ6VVh1UEVlSVJPd1Vq?=
 =?utf-8?B?d0hKQmpiTzBITlJ0Y1dOMlZTeWlFZ1AxTEhIRGFBcjZINUpJYXlUZkdCUlRP?=
 =?utf-8?B?ODc1TjJPTDdVbVdEMmdZUnVRRExvMWJoZnNBRVRRZjlZR0M0RUNCbnFHbXFD?=
 =?utf-8?B?QzU1L1J2YVplUFdNMTRmSjdWS3JSR0x6VlhNSG5HaURlWFNHRmpZL2ptdGJK?=
 =?utf-8?B?RHJkSkVGNkdTYWUyMnptWlB5S2doS2pVdm14TnNpRlpERUl4cDA4SWg2emJx?=
 =?utf-8?B?a05LcmtKRVFqL2l6cWFBZDhMam05M2F2RzNUcU1Zc0dtR3dvZDZDVXhLQkR0?=
 =?utf-8?B?ZmFWeWpTSWZ5a1dzejY1TWRCb0NBbWNSVGJxUTVnVS9WWVdSdGwrNlhTLzdU?=
 =?utf-8?B?ZktEYXlEYkk1bkRqWUlhMkVHNHdVSFd6T0lwbkxLUXFVdUpRR3ZLV2pKWTlP?=
 =?utf-8?B?NmV4S2dvWGo1UWd2ZzU5VXdEaUo5UGhURUZraHRDSlRsWnNaVVRtSko1MlpU?=
 =?utf-8?B?RDBuNVRTWWc4ZTR1SVZsYXJ3VWphR0IyMWFzRUVHWmsyYmtMeDBTb0FadXZ6?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b53b298c-6aaf-4a10-02c2-08dcec2b1a18
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:35:04.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +itsOjHRbUubRPNt18m03N64oBOsLkf2GhDi1H4gjalx5OcTY/gp6PcA1acTz1rvd0btTX8tdz9rZ9RUh099Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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


W dniu 11.10.2024 o 22:35, Patchwork pisze:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_exec_sip: increase timeout margin for tests
> *URL:* 	https://patchwork.freedesktop.org/series/139889/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/index.html
>
>
>   CI Bug Log - changes from XEIGT_8065_full -> XEIGTPW_11903_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11903_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11903_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11903_full:
>
>
>       IGT changes
>

The change affects ONLY igt@xe_exec_sip@*. So all 'regressions' reported 
below seems incorrect.

Regards

Andrzej


>         Possible regressions
>
>  *
>
>     igt@core_setmaster@master-drop-set-user:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-5/igt@core_setmaster@master-drop-set-user.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-lnl-1/igt@core_setmaster@master-drop-set-user.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-lnl-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>         +1 other test dmesg-warn
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html>
>         +1 other test skip
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-432/igt@kms_pm_dc@dc5-dpms.html>
>         +2 other tests skip
>  *
>
>     igt@xe_exec_compute_mode@many-userptr-unmap:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-unmap.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-lnl-8/igt@xe_exec_compute_mode@many-userptr-unmap.html>
>  *
>
>     igt@xe_pm_residency@idle-residency:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-466/igt@xe_pm_residency@idle-residency.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-464/igt@xe_pm_residency@idle-residency.html>
>         +1 other test fail
>  *
>
>     igt@xe_wedged@wedged-mode-toggle:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html>
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html>
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html>
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>  *
>
>     igt@kms_psr@psr2-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_psr@psr2-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-dg2-432/igt@kms_psr@psr2-dpms.html>
>         +1 other test skip
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html>
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         +1 other test incomplete
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html>
>         +18 other tests skip
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-6/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#2329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html>
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11903/shard-bmg-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>
>
...
>
>
>     Build changes
>
>   * IGT: IGT_8065 -> IGTPW_11903
>   * Linux: xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16 ->
>     xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07
>
> IGTPW_11903: 8ee8da2b7ca829a8f6b1a92e68df029d02651f9a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16: 
> 09a8c322287e106dca33e28fa7f1475255a9ef16
> xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07: 
> d2577be8b969257afb5f76964afc16ae4f6f7c07
>
