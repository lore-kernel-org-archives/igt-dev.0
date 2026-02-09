Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C771DE7E0BB
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740D510E3BC;
	Mon,  9 Feb 2026 10:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORbAOFRv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308BE10E3BC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632297; x=1802168297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a2do02pHZ4YeMmB8s19Oc7o00ymtHU1cq0HsUXulVRo=;
 b=ORbAOFRv9XYFGAlnNgcXFau4fd2biZ+Y4Vek/md6albS5QY+aGzLL/Ro
 /ktDnOM8INZJVq/3zR5E/Ie6l9bcMDPBIckYjbEF4p1KGkYtHe4pESxPE
 XHVRUtJEza/f4C6XpTsxAFKzxde9TohJynHozkMBYCurCYy8wvemWSqD7
 jM3sUJjV1PJMemCBNHXekpIk0Wn3oJUwr8HN3kASKuO+IhkwnepkMAH4m
 7o2Rjy/gJt0CuIr9LKAfF3N227iiwZm+ryK2l973ppQHJS68eKVViCTsG
 vlYxC0KPbdFff/mlE8RAbXdFjKn7GobN2RC4BRszKXkMFMwaMV6yZjz8s g==;
X-CSE-ConnectionGUID: 1iuAKJQWQoanN8fToHrgyA==
X-CSE-MsgGUID: lSET/31JSTGeRjNRfcXESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="75589775"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="75589775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:18:17 -0800
X-CSE-ConnectionGUID: jRUiifyeSLapbzfxcfQ9eQ==
X-CSE-MsgGUID: 5s2+QjlMSwyL+rBRqcP1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216035261"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:18:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:18:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:18:16 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:18:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlA+4maM7j4wija9SESgZ3CzYpb/ojRMCXVN1z9KYmktjhqji+1R6nn6n+YGNF2yWGB++tp+D+G9ATEYrWgFXnotxagX63Td53+61somKSfEQTNyqm3XC4apTdpa3HphdVPSSFcBz02Cehrx/ZNK2xZpkAoPWfOwema3akmiRzlC2ZrTtnoWsP83GCiB6mDpORCxLv/5DQnO4ZrYF6VHW3JyWGsJfFz9XamO5HERaGKkWfZvRwUjF5Bv9j89FPwC26EJqbSItZ4yGAuQKiHKo9I+Iw/L96GtPhBqCNz9jvFCyVEdIMciMTjBcGfgbp22nshWiV/+Z+PtEbYKX+BwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30zej1wCLJU5p5MQJeQZHtHjUeu2HuiYe5sXty2ER0U=;
 b=nFmsuSwK4qmvgCz5Ieab563hsWeTlECJynrhHfUFxSx32cyvlIkrpXxr1OuShM10RJN60PQlJ7UdUHum4MxsSNm8gXyohbvpbycbhK12shrl8fuxMzPKTSl8SbgK4S7S1Xw7MpyGG625sf6tvYRttsHW+YLs2U2+cIniUJ8YtlrfLO5jbCQ2MtKJDk9UGaAHGgPjwDv6mcRjs66VfL+tCklfU13j76gOQAOknDHWOh4pG0YH/lWj7UztqCIusq7zKIC+4gYWoLzYn744wr8jVKPcImntyREb2pqObbyhF1ihD1ltGh33SYtWojZCzRf6TEjUbpAbOBTrniynXpunxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:18:13 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 10:18:13 +0000
Message-ID: <2b629a68-df68-46bc-a036-2a6e540b5b6e@intel.com>
Date: Mon, 9 Feb 2026 11:18:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 5/7] tests/intel/xe_sriov_flr: Add --wait-flr-ms
 option
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-6-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260204163217.121305-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0104.eurprd04.prod.outlook.com
 (2603:10a6:803:64::39) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1d873e-eae5-4ef6-93ee-08de67c488a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWRlcXc3ZUVuYnRCRURHRDBhazdhWE5MUWJ3QzA1NGFva3RJYjlHZFRLVCti?=
 =?utf-8?B?T1lqVW9PbkRhUGhPMlduVG1aMnZXanZQdHJWaVh6VjRmeXdvbjZlaWZ3bysr?=
 =?utf-8?B?ekRmTzRhR09seXAxS1cxbUx6VTFsK2czZkJrZjI1THhnMkgrdzcxeDIyT2lU?=
 =?utf-8?B?eThkc0NTSHVZbTJ5aGRELytqZXd3QXdaUEtrRjZhYVlqV05qa2FVZVgva3Rv?=
 =?utf-8?B?YnlWZ2NJZ2RNV1JlRDB1Ums1akI3QUpsRjF1S3VlSXB5bWZodnFGUVB2cHky?=
 =?utf-8?B?RjkrdlVmdVNiOXdtMWY2dTBjYUZGRWhDc2czbTQ4eWZYWEd3RnhMT3ZHMjU1?=
 =?utf-8?B?ZSszN0VPRzdkdjFHNUkzWElldUFINnlBK1VtZWRTNHppYUl6YWNhS2lkdHVS?=
 =?utf-8?B?MmtOS1hxOTZmTVZmcG1GOCtCM01Zd0FLcXhhVUpHM0k0TTFudzBxWkJrTkxR?=
 =?utf-8?B?VTJnRTRqaG5wL0lURzJGVU1ya1lScWdYRGhaZUJnNUFodzlrMkJRMzFUcEI1?=
 =?utf-8?B?RUxKZ1hFbWplMDRKZ05kN0xBaHh3VmV0UzlUcjFKR3hkSGtFZitYWEE1dUVu?=
 =?utf-8?B?WmJOa2hlZXREMFpXMDhCTGtaRFNCRncwT1h2bnNWdmViUXJoZlFLMHR0d3E1?=
 =?utf-8?B?ZjgvYTB4SmxRYnlRR0JYcW1ValZaL2ZML0Y5OGxxMVE1SW83NnVHZS9QakNa?=
 =?utf-8?B?KzhXemtzb3FhNmdySHM4UUpxbG1ZQ253MklTb3dlbWRjWGh6U0dXbmNHWWtQ?=
 =?utf-8?B?blo1ZnQ5MzNadzlqbGs0TWd6MDBoODVMa0JQY1liRlBGSHRpV1FObS95cUpn?=
 =?utf-8?B?NTZiVVN6alkxTlhaVkZidnNVWmZYREZ5elBITUdHNHBvVUhnRTVETmpGMGxk?=
 =?utf-8?B?SW1LN3lIc0huMnVzUXFkd1oyUVJJcmhXa2FpbEpZRWIrcTVsV2F4VHQ3U1Zs?=
 =?utf-8?B?Q2MxcWNyZ2MrN1E2eXZXY3YzdmgvcVQ5MUNjendsU3pGOSt4NFczV2l4azdX?=
 =?utf-8?B?Z1VvblpVQlpscmZEdWtJbk9GeERZTjJ3aTY1MEgxWmlRdExqYTVUZXZ3Ylpr?=
 =?utf-8?B?Q29TYTRMQVA2d2o3a1dtRURsQVF1TGtJNDd3ZG1FanRUa0tCcHN4SVdEbVFo?=
 =?utf-8?B?OCsvbitCMUdUeWNUWjJFajBQOXoweUNTUVFMOE9FTVMyN0QxeEEzdWg5aGRm?=
 =?utf-8?B?V1Y5MUdZYllDeTdvL0gxUTNjNmd3YWJwN1gvSjR6d2p5N0tuSHpNWHZwa1Mx?=
 =?utf-8?B?SXRkNnVvMm1sakVmTHlSVWtSeVlUb3dwTXRoRWduOEM1RndGbDRJTldEUnBP?=
 =?utf-8?B?VGZoOVpFcDNQU0xPMjBhcU5kSExqMTk2TzFFOUhhN1Q4dUtwYWt1RmlEc0I2?=
 =?utf-8?B?S003V2lZMEQvMVdPNjQ0WG1JUytJQy9Cdlc5T2tDckZPb1hmZ2d4YStFWlRN?=
 =?utf-8?B?VVpPOUpHdlppSkk5Sm1DNmVOWWRMM2lzcldOZnBZYTlqK1psMlhaZkg5M00x?=
 =?utf-8?B?TzZsd01wbzhVK3J3VERReEpkYndxWmtCaUpoeUtNd3VDZkZVbSt4emVjVVND?=
 =?utf-8?B?T0pFNWVRV0dJY0d2cjV4K3p1R2tUQllTRC82M2dnVXFwV2FGbGpyQlhVZDZw?=
 =?utf-8?B?cm91Smg3bElweDllbXk2VWFlaXludHVsK1UxUUJ4YU1jZysrNTZiVy9tdlQ5?=
 =?utf-8?B?N2tUVlBDNi83VFlYczVlZi9OYUFXNFNkY0NPcFNFWHZGdHdFU1FJMTc2ek5C?=
 =?utf-8?B?cjAvUW5ibmorMlZJUGs5amRPaC9NTmxQQjF5bm51RElWVnZjNFVGNXUwQ0h1?=
 =?utf-8?B?TzJNM0J6MEN0TWZzTDBaUTc3UFFPOFhHaU5YK1pJK2ExNGZ4ZmRCbHBydHM5?=
 =?utf-8?B?QkxQemh3eGE1ZFVwemR0dTZJUnB4N0tnbUgzZVo0Y2R0WUVCRGtFcm9iWEZT?=
 =?utf-8?B?UjJaQVRERVRTRkxxSkpLQVgwdk9lWUMvR015aWJEQW1wV0VOQTZZSDBDeXpE?=
 =?utf-8?B?V3E1MGFPOWxyWFA4VXNwRVlycldMUVRodDJuWkFDSjF5MmY3Q0JiQmZOM2Fn?=
 =?utf-8?B?TkJ4Nzd1Q1hydGNZWHFUTzNOYkFuY1p4ckw5bks1L2R3WnBDcDVkUXVRR2U3?=
 =?utf-8?Q?fvlQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJ1Ym93RlNSNW9jWjR0aCtZNTdRdTVSbXc0WDNBVkJsUTMwYlgrV2RxZmxw?=
 =?utf-8?B?V09pVlArWHhiMk9SVFZ1c1VsUE5kOGtOTm5GN0Y4NkVGTlJqQVhic2g4RjU4?=
 =?utf-8?B?clhVTmlmbkd0N0N1L1c1Y3loalZvSlFIOTNmYjYrdmxFWDVSeUFmamJ4c1c5?=
 =?utf-8?B?bXlJU3pTNlRWWWs2cVB6Y2poREc1WERpRWJkc0g4eWF3eU5FUXlQcFR6ZFlz?=
 =?utf-8?B?N1V4V1FJM1FoU0NYTVZvRjJGeHR5OVlVNVhzc2FraXBWUmJZV2lUOE94aEdF?=
 =?utf-8?B?V2VRU1M0UHJPZTZ1R2o1QVRCU2ltR1hDaXpFejZqZmJ4Vld3V0hQQ1JiaDFV?=
 =?utf-8?B?K3p5WDZqVFhPTDRTZkhzUWpRSi9qZnJOTkRyMTJLQ2hPdzFBdE9maTNISk1H?=
 =?utf-8?B?Nnd1bzdmYzVHai9LcmhtaTMwYzRjYi9iUXUvaTBVOW5yaXdrOUJZekJDRHRL?=
 =?utf-8?B?ZXhGSGFLWWhXTlo1S1pUTkRuM1R3ZzBxbFVqN1YrcEp5QlVQbGU1WnQxVVZv?=
 =?utf-8?B?Sjd1bDU1SEd1NkZNSW1tY3ZKSXRiRy9GM1RITXZRSHZnOThRbGlLaGpENlVO?=
 =?utf-8?B?QWxvNzMvaUg2WXNCR3BTRTNuYWtESlBZWDVGQXdYeHBwdHE4TGEzWlFCSVFv?=
 =?utf-8?B?K3hBSm8xM3JJU1ZOYmR3UkpmblN5NGorUmN3ckhweUFRSEdEZXFQWnVTRTB5?=
 =?utf-8?B?Um5hVDFpSTdyS2luajRFeGJHaGlIYUcxV1NnZmVscXFubmJrM0xENGZBRkNZ?=
 =?utf-8?B?NjNLZUVycjl5VStZRnZOdUJBak1jZmI0bXdEQVp0UnFJRUFkRmlCSFg5cnN2?=
 =?utf-8?B?VkFZRGpwVE5FSVJrc2huUnZNaGo1dzM3RU9rUHJONmpHU2x6UXdPUmJ2TWtP?=
 =?utf-8?B?d0VnYkpwMGlDVHV5RVVFTDFJR2FZRUN1R3BFOTBnZ1dJWjlOUnJEanBjekpT?=
 =?utf-8?B?WWVMTFU0bDZHSEo4Wjdqc0ZYMjRtS2dDT05GVlc0T1JRZnR4MVFPWTdzdnho?=
 =?utf-8?B?VTYzUFdDVkFtOGYvRklFejVCRVRJYUszYjZMeGFFZEM2YW5tRW5vbjdIVHZD?=
 =?utf-8?B?eVlHSDYyZ2UybWRYOTYyWTBHcHlmVmFrdmMwZjU3LzNJRjNOREp2Z0pKV296?=
 =?utf-8?B?U2lWbEE0S1dRSjhXUm80SGJ0cjVKV2pmcktybDBWSGtpSk51NStTTGo3dWFt?=
 =?utf-8?B?aEVEcSt6TDdXVzlGUWgwd2xzeUhjbEZweTdRRlRUd3lRSVVocG9aTlY4V3ZN?=
 =?utf-8?B?VlU3dFdFejNJWTRRenpJbXRUTW95Nm8rYzd1Sm9QSGFqOVY4ZzdySzNKK2Ev?=
 =?utf-8?B?NERNbTZDdUtDZjhMOEdxL0xLekN4TjNBM2Z5dUlnbklUWFBoU0hhNlF2WFZJ?=
 =?utf-8?B?TTVWVWxObzYyLzlhSUZsMVRBRlJDbVlTUTg3SXFwQVRibkI0WFpNQyt0Wmxu?=
 =?utf-8?B?WkFPTHo3ZnFjdmNDVTh1QlFQQUVPSmdtak5pYzJ3c3UwZXFLVlBCME9seHJZ?=
 =?utf-8?B?K0J6UERvYllDQThDSUtycWcvY2VIUnc2QXRrL0ZWcTQvelN5RERNSVhOOWda?=
 =?utf-8?B?QjZlMEE0ZXJyTnBkaVdoVG44Z1FHRXU0Z1huVHVFd1JodUhndVlWMmwybHg3?=
 =?utf-8?B?d3U0MlNzTFgrNmRrVGNBZEpuNXNtOVJKVGo4Vk1ObnlUaDJDZk96a2xDb3RJ?=
 =?utf-8?B?MzFSUnJPQUh1bndXeWRKSndadEVPSWZ5dWNkMXZLMWJUa3Y0TDA2UXdMNDNy?=
 =?utf-8?B?eWxGZk5SMnlPTTFsbC91NXhPSHpJMW5VT2xUQWNUdElCN2N4RTJQS0l2enFM?=
 =?utf-8?B?OFJXWTFhRGNMOW1mZitxTmtXa2tQNU80V29xTERhS3hVTUlrYkhweTdieTVN?=
 =?utf-8?B?SmhuQXdzc2g4ZkdqMjNGOXp5dzZXSzk2QmJXUGU4VktPNzNNMU0xRXRxQ0cy?=
 =?utf-8?B?aEpjeUZFTUIvbWtKVGlaS2hJZWR4NDE0VmZoUjI1ZzhzNVROUzMwSnFFWkRJ?=
 =?utf-8?B?MXNaM1NQeGNxZlljSUVOMDAzbXNSSkZqYkZpWWNSeUxUUXRxR1lnZlRtY25L?=
 =?utf-8?B?Wmt5ejRCdThFejBMcmdLYVQwN2RsWUIxa3NyajMyVWNCc09FMnd6Z0x5SnlM?=
 =?utf-8?B?SDVqU3FyallXRkE1WWc2cVFkQWZ1VDVVRXdKYk5UMkRyUVJubUl5cUpEczV0?=
 =?utf-8?B?R1JKaVR3b2NhWStTQ3MzNXErN1pEaTJMTGc0b04rc1hRbnU2QmdCVWJGM3RE?=
 =?utf-8?B?TytsL0FRSk9zZkZHenQvSmp3Tit4QTNUSE9qdmY4cmZ6eE9pRWpoWFdseTRS?=
 =?utf-8?B?VExJczM1SXZFZklvUS9tWkZ3V29uVC9vZXlxcDE1a3lvSEgzR2I3dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1d873e-eae5-4ef6-93ee-08de67c488a8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:18:13.8902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQKRqkLdRaNXdfZiY+eyL1Gmvv9IK87ZtRr+Ht9FEayEZaJrG60iHLyTw/ZgNObeE2afWETHwuaS9TayuSyTlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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


On 2/4/2026 17:32, Marcin Bernatowicz wrote:
> Make the post-FLR sleep configurable (default 200ms).
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 36 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 2f6b24cf0..951628159 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <fcntl.h>
> +#include <limits.h>
>   #include <pthread.h>
>   #include <sys/stat.h>
>   #include "drmtest.h"
> @@ -61,6 +62,8 @@ static const char STOP_REASON_SKIP[]  = "SKIP";
>   
>   #define DRIVER_OVERRIDE_TIMEOUT_MS 200
>   
> +static int g_wait_flr_ms = 200;
> +
>   static struct g_mmio {
>   	struct xe_mmio *mmio;
>   	unsigned int num_vfs;
> @@ -368,7 +371,7 @@ typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
>   static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   		       int num_checks, flr_exec_strategy exec_strategy)
>   {
> -	const int wait_flr_ms = 200;
> +	const int wait_flr_ms = g_wait_flr_ms;
>   	int i, vf_id, flr_vf_id = -1;
>   	bool xe_vfio_loaded;
>   	bool *vf_bound = NULL;
> @@ -1088,7 +1091,36 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>   	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
>   }
>   
> -int igt_main()
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	char *end = NULL;
> +	long val;
> +
> +	switch (opt) {
> +	case 'w':
> +		errno = 0;
> +		val = strtol(optarg, &end, 0);
> +		if (errno || !end || *end != '\0' || val < 0 || val > INT_MAX)
> +			return IGT_OPT_HANDLER_ERROR;
> +		g_wait_flr_ms = (int)val;
> +		igt_info("Using wait_flr_ms=%d\n", g_wait_flr_ms);
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_options[] = {
> +	{ .name = "wait-flr-ms", .has_arg = true, .val = 'w', },
> +	{},
> +};
> +
> +static const char help_str[] =
> +	"  --wait-flr-ms=MS\tSleep MS milliseconds after VF reset sysfs write (default: 200)\n";
> +
> +int igt_main_args("w:", long_options, help_str, opt_handler, NULL)
>   {
>   	int pf_fd;
>   	bool autoprobe;
