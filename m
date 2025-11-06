Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9A9CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 03:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED5D10E312;
	Thu,  6 Nov 2025 03:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUTArkYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186F110E312
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 03:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762401338; x=1793937338;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cPWbBQrFZstiPPNySfI1LfFl0UPXS1I8HuIFP/QAR44=;
 b=PUTArkYS0ELdcPd2ooSxXPvFE1udthkpnf6yFkoTQD3NHr9Iy2jHikO4
 4Dx/PD9AwDTCo5gSy3E9Mdd5Wba7iHLMdTsZ376iJ/o5QhXViLOIRuUpc
 DrRS9iBZLyW63NmtlCteFYOgwlzBVfvAB3R+842srB9JvROLZ0PgwBBUE
 oeLdqLMP79MPYcKJeuG78o5kDMDJ1twhN0fhMrkUq10jsmuYPicuB4rG4
 Oxjme7c7hsGbfcWRUCVELWfrjdHtqGYWuVib6ZkVLbbAjP91kdz52+uzy
 yo3u7xlwXe4IVYkuUAOTZif3+C4mxElVeTg6x0SREDJVLPXha5uALHez6 g==;
X-CSE-ConnectionGUID: eRwUWTZwTDu07myCIBsv5A==
X-CSE-MsgGUID: ZUpwYazYRKG8TBlcWlIUBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63734508"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="63734508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 19:55:38 -0800
X-CSE-ConnectionGUID: NnoZ3/QlSoGEkqhMCqz0Cg==
X-CSE-MsgGUID: oyUi2ChqRX+JkNHScNhBWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="187590895"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 19:55:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 19:55:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 19:55:38 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 19:55:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5SDH4CrDWUlXHnuJz/8sve1uZUBbbAqIBPMNYEsfRc8Mj4PQpKzuDNLHk7JGPVx4Zn5F75+56NCIh82MVTgioJgazbbXXE1kirpC8SIEBC58tvXFaG5BzDsKVOxtUBGhGz1Bh3sLOTSyqnYSlhGBnc3IhIu1iAx760chTrrciI+c9T+7TlySR86rDOOvZdO1Ye2CGiggHJ160TupUrpyrYuG6+GHcNoNlisnWwbJrq1ttXyZpGBpmA11QrQNWL0lWLK/+0kglH8yrwrjttEL34pYYYS2XzGwaSJ+xq+S83oq2N8kqLO8BWu2IHA31ezo0shuHHYG7+/BHClShs8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz9DtkQzM0vf/9hkcLTDezXiDYQh/mZgy2I2fa4FDsE=;
 b=k0+/79Gi/SehFNjy8I5F8df+pg/7KAy2gASR9iAbYSFPEfI29p53RhAZ4vLScnXJqS9kLbgrZlf/1wtAKKLcZvfZBpVPTtEb1+DcOEXCz+TRnAE8Mn5Nw+Ufg7SUzdb0weU7VyocoZprVt8KAC5pvdPjcZSzZGhHhzMcwxecPff6YVwS5yKLOHihlkyWqzu7Ft84OWqXh0TUxCvkbokd6c7Yp+Gw7Ay6GLVL4G7Iu/t7YXvriw5bNBndkf+8k31tUGNYUka3QLdv0U/tER7MOh7w2in/MKxwMSioEbaiYBnysqpEGsmydNLi2wmFR9Km20whbaLCpEC2bADa+y4E9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 03:55:29 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:55:29 +0000
Message-ID: <a5821991-4ac6-418d-9654-faf368ab6631@intel.com>
Date: Thu, 6 Nov 2025 09:25:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback
To: <igt-dev@lists.freedesktop.org>
References: <20251022185510.1099036-1-ramanaidu.naladala@intel.com>
 <20251022185510.1099036-2-ramanaidu.naladala@intel.com>
 <65a053b0-12c3-4fb8-a8a2-837ba8c10c44@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <65a053b0-12c3-4fb8-a8a2-837ba8c10c44@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0199.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::12) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|CH3PR11MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f40144-88cb-4671-1425-08de1ce85385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWdSWjV3Y1NMZ0pCdXdCVHpHOUJwOXgvZ0N5cHVzb0xMUEZnRWREWW1kMnVC?=
 =?utf-8?B?cXVxakc2cExBY2hPSVhwSG9TTk4xdVlXUk5OWWpwL2IraUprcHM4OXgvaWt5?=
 =?utf-8?B?TG1zM1FkV3FwSVVWbytoTjFYRktGaDk1ZmZwRnpGai96blN0YTdicjVQN3Iv?=
 =?utf-8?B?OWdvUlp3K3UvZlRxazBwZ1N6b3BEWjEzOFdNYWszZXF0MDZ5S291R0ZJdGF4?=
 =?utf-8?B?aWoxQ1QvZU9ONkxzaVB4MGtEK0t4c0dLbkcrMHZkekI2YWZLVi9nd1REVmo3?=
 =?utf-8?B?dVdSWnk4WTVRa0ZuMlB2L285cWdBMEVtQXU5OEpPWHNhUk1ZWnNGRnpuZXdB?=
 =?utf-8?B?VUEzbmIvOVdnaVlxckVSRk1GNXB3YXVBZzJNR2NVYTd4K2dZWEFHaWtlaUFL?=
 =?utf-8?B?TWJTZVVVQTRGN09zREZnTEl2dUwyWmFFMHFrRDhpRyt6WjYzNHhqR3lDdmpx?=
 =?utf-8?B?Zmt5Qk9OdDcyM0o1TzVKVUJicjlJenp6RHQwZktiS1hTK0tnbUYvN0ZqZVFP?=
 =?utf-8?B?dTQ2cUFMRXZSaGZQd2ZDbmE5VTVTUHAzRDR0cnlPUCs3RGNuc3d1d3NmZE92?=
 =?utf-8?B?VS9YbXFqdTBteUg2VVVnWXhaRXlabWQ2R1FLYkpHZkptQzBkOUlreHJNdnlQ?=
 =?utf-8?B?alZxaXhVY2N2aUgwTDBiSDloZkttYVZRZG55NjgyT1ByTlJBTnZLRzBYOFdr?=
 =?utf-8?B?WWlBd2JKZ2pjanRPSkdpbHMzdCtDL0Q4Wm5ZRStXR2hFcEJ4OHpJTHltaHY5?=
 =?utf-8?B?TzF0ZFZ3QStZVjg1UzNQYVBiTGM3OXI2N1ZhdVhYc2x2REJaeFBoeUFQQ1RS?=
 =?utf-8?B?L2pxcnN2blpkd20vZ01FT2hNY0YxZEZKRHYyZU1xTnB5NlVEUnM1SnAxSXRl?=
 =?utf-8?B?NlRUY292L292R294VXJmcVpxYXFDNkxUSnM2bVY2T3Rqb3dKZG8vZldsaXhr?=
 =?utf-8?B?QVAvQmtGNU1KMWl3WVV2NEo4TThFMTJ1RkZTY3NaQ0JJNXNRdGNrRG1OeG1k?=
 =?utf-8?B?RnZBY3hhRFpQVFhxelY3ZlJrbjZPcTNIeDJoV0JGdXB1aHpPWjV3RzA3cGtW?=
 =?utf-8?B?Qk5ITTBQc0FyODdocVR1d0E0MjZjWkEyaFVVeTR2STVuTk1xV1BDTFFObEFp?=
 =?utf-8?B?UUtkUTNEREdEbUl3L0l5N3BUN2VLV0dyTTYwakxJTUZ6eEkvNFphVWJKVWt6?=
 =?utf-8?B?WEE4K1F5Uit4Q2JTRjk1RzZkc2c1bEptLzdhaWJPdWJRS0hNdnRnVW5ldktN?=
 =?utf-8?B?clpzY3N0djZwMmNXQzZjbURYMjNKM3doK21xUDJkSjZnM2tuM2xmeitkRElR?=
 =?utf-8?B?NzFtZ3BzUDRyM3hnWHM0N0ZQN1pjckZmWDczSE9GT0ZVdEhEd3BWZmoxUU9y?=
 =?utf-8?B?KzYyak8zNkxKa0E1bFArcUpQWDRzdkk4clNRVThjaTVDOXo5T2puUnhEeTZM?=
 =?utf-8?B?L2Q0ZjgxNnBkSk5wRzVYaW52QTUxRE9xRDVKRmZWZExISXhUUytMR2czZmVB?=
 =?utf-8?B?dnBoeE5ONXBaWnFhQVFaSWhLdmMwTEN3UVQ4OFl1SkwwUEE3MnZ5QmNHcEwy?=
 =?utf-8?B?ZkVNS0Q5M0ZKTGRuQ25VUlN5ZFdneGJFNFNSQk1DTUxaVHlRb2RGaDN1Zmh0?=
 =?utf-8?B?VXU3SFRmeGFvVjJHNE9MbVZSang0c0EwSTJHeTU3SW1sV1dNSFIwUjQyUzNV?=
 =?utf-8?B?bE1vWm5kTnBUUHl1SXRiajVUY1duZTk2aWJVRWMyY0t5bnd4SVlKK0M3VDVt?=
 =?utf-8?B?dnYwQ25pT3FYUnZCT0Z0V3d5V0VhamVtbGw4UVdweEgyaGszWld1Qkg4R21G?=
 =?utf-8?B?QTlJYkZhSEJXTHE3UHI2YlVVT0U3dUNtU1JORTZLaVRocGZ2NGhobTgveGow?=
 =?utf-8?B?TXpENXRoOGUwZTFBa2QwY3NmM2trcjBJV3UwS2g3bG1rajR0bFBLeUV0K2Fk?=
 =?utf-8?Q?yC9PEIiDCb0MlW1WMoFKWiBsDSNJfjst?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RMODRSay90KzNzRnRLbXhTeStOZWxXT0FiOUFQNmdhL20xUXVpQlFPcm1H?=
 =?utf-8?B?T1NLaFdWMmZxeHV3UXpNd09qK0craSsrd3VURUZuMnYrZi9JVmZPUTN0dVdI?=
 =?utf-8?B?RzRXMlBqamNkaE1xWFNQak1KMzNQU2RGbG9hUUZTRlZaV3BhdUFWWUV2U08w?=
 =?utf-8?B?YU5vK0x6NjRWUUpWVEI0S1lmRHB3SFp6T05ma2h6eTF6WUhQQ0FUbGlvT1Vk?=
 =?utf-8?B?N245UFNVMnRvZTBacXAyS3hRRXV0VFZlNStKZXR0SUVMejh2dnh3SG1ReFN3?=
 =?utf-8?B?eU4vUWl6UEdYbW03b0E4ZWdCYkw2YkRxK1UxK0s4Z1hKUlZ1K0lpL1duTUdq?=
 =?utf-8?B?bDN0eWxDaUNMMkcyYUtlY3Y1VXRFMGZ3TFNFa3lMZEhWL2tKUDBMUXdVOG9C?=
 =?utf-8?B?S3BnS0Iwa0ZyekxXVXF4MWdscGphaDJiNEFWYTNDLzRpRGJuL0JZc01PUjlo?=
 =?utf-8?B?TmpvS1lOdWJLMFhyQTZXd3c5clQrVlNsL3I5d1grUVlqSHgrQ0p3UjJTSlND?=
 =?utf-8?B?UDNhK251ZE9kMy9MSzRWMlZkbndldkRDS2Y2ZVNYUmlHelppaXA4YjNGWWl0?=
 =?utf-8?B?R3h2aU9pV05mbFRzSDVDV0NPUWkwTWpqNko4dkMwQlFwYW9iWWJhTnJTU1hK?=
 =?utf-8?B?ZGtpWFQvdFRtaVphRitPYWhrNWROZnlrcW10anFJdWpNTGdDMExJemFvNEZ6?=
 =?utf-8?B?NzljUDFCeEN2ZnhIRHVwT2RzbFlMU3FuT0pWRC9rbDcxU2VKLzZtcFRaUWpR?=
 =?utf-8?B?TUtpQ2xBSTRCMzVIdXQ2NTdqVDRTMmhpaGJ6WHlFTGp2R0xwUHVnT0ZOS2Zj?=
 =?utf-8?B?b1RTVDYrUldVZnRqR09kaDhqSkczNCszOHdQc3N4Q2hNa2g1djc1NC9sQ01h?=
 =?utf-8?B?VlRyQ3FhSHhnWHpnT1kxQVo4NHNMcWFNT2tjSHpNTGMrdzNDQldGeDJWUWp2?=
 =?utf-8?B?WjVmMW1XY2NPS2ZQVk9XcU5nNGtUM1lJRU9VVWh3T04xR1NqaVlmNjdNK2FO?=
 =?utf-8?B?UUl5WFd1ek1Qa25tTTNtbHE4RVk3L3hNTFBjbEtzcGg2WG9BUmdXOEZiMlVV?=
 =?utf-8?B?L3Rqd05mVCtGVlpSUUdnVjEydEp0Mm0rdFZRNkJyNU5rdUVBaC9LRjhqTDAx?=
 =?utf-8?B?QUdMc1pWY2lqeGthdEhuenpHN0s3bzY5K1dnZ3VaRmtMbTB4NVVwSlZiYU9p?=
 =?utf-8?B?WnR4TWVlWmd1UnZpWEo2QmxUbjlOcEtVWllDSWh1ODlQR0RUTDViQTlXL3dw?=
 =?utf-8?B?VTVNaTdLcnNnUTk3c0xMSmZDSzRWVDFwTldoMVVCL0hrSmlBSnJxcEZjM2tl?=
 =?utf-8?B?MVBadC9WR2tRTW5tTVZQMDVVRFFBblQxVUh1UHkrWHR3TlRtd2JzN2pLQmpy?=
 =?utf-8?B?Q3FwT3hOR3hHbGNoSTY4U2dYSUl1UFpBRXNOMm82Q05RSDdnUVprWVNQSjBk?=
 =?utf-8?B?ekg0WDlPaUowRkt5OHhiUUJUSjVTQnJLZ0pnT3pFMG1zaXNhUDllRGFxT2lo?=
 =?utf-8?B?OWh3V1VmVWtWUTA4NUZWVVJtaHVGdGxUd2VJQk1RNGpKR1dHLzlpWWJZTHl4?=
 =?utf-8?B?SC9aYndUb1NNT0VGK1FjQWlZN015RXdUbk15QjdkdlBMMDdzbmprMUtDNUVW?=
 =?utf-8?B?UjQ5WHhITWd2L21ONVhKWGlWN3FMWEJUMm5pSkhyL2lpYXg2eHFoS3piUEha?=
 =?utf-8?B?MytNUmZaRFBJQlRGTkVKV3Btd1h1V2Y5M2NxbFlxd1pCTHFveW4yejVIcElU?=
 =?utf-8?B?VS80aDBzR1loVmtLS3g3azdzSVBkdjlUeVhNM0Y5czVWOW9PU3p1QTZodit3?=
 =?utf-8?B?eU9SaXlBOGNNNysyNTNQc253TTdaRjM0dGU0aGdkV1BvRVBYY0p2RXFNRzNy?=
 =?utf-8?B?REtocG1Rc1NyVHpJcU9PTnQ4SjhpZUIzTTY3RS9LeHFENllVdFVyL3pvUjJt?=
 =?utf-8?B?UmNuR0swY09UenIweStYRXF3Tk91bHpJbW8vLy9tU1BxVkhkTmpza2pnTHgw?=
 =?utf-8?B?SldtUjZud29mUVN2S0dVd3NQYllRdHVYcTVnUEwvbWpXZUptZGJLYTBiOTBE?=
 =?utf-8?B?M2czdUdxRWJZYUVseE5UMTdWdGR6UDJ2c2hFZGZQNjZXZjVBWG14aUlVYjk0?=
 =?utf-8?B?MmRyeU1KQUpwRFpnbUpUWFpaMlByTE1raVFFZVhra0krbHBab3FiR2M4djUy?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f40144-88cb-4671-1425-08de1ce85385
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:55:29.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9Um85WQkjvmuT5Ssc7oTa5VVDPoCmXfz0gj95vGKFr3csG/W/yCorvrUWjJ5uQQC2aobA+/sy6l1BAEYhfJ1MpchKIbRza2l+5ZAl/ppms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
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

Hi Santhosh,

Thanks for the feedback.

On 11/5/2025 4:16 PM, Reddy Guddati, Santhosh wrote:
> Hi Rama Naidu,
>
> On 23-10-2025 00:25, Naladala Ramanaidu wrote:
>> Starting from low_rr + step_size could cause the driver to fall back
>> to a lower physical mode due to proximity to the lower bound of the
>> VRR range. This results in an unintended clock change, which violates
>> the expectation of seamless VRR behavior.
>>
>> To address this, the test now starts from above the midpoint of the
>> VRR range when multiple modes are available. This ensures the virtual
>> refresh rate remains safely within the active mode's VRR range and
>> avoids triggering a mode switch.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>> index 1d9e579b0..b90d0f3c0 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -850,7 +850,17 @@ test_seamless_virtual_rr_basic(data_t *data, 
>> enum pipe pipe, igt_output_t *outpu
>>       /* Switch to Virtual RR */
>>       virtual_mode = *igt_output_get_mode(output);
>>   -    for (vrefresh = data->range.min + step_size; vrefresh < 
>> data->range.max; vrefresh += step_size) {
>> +    /*
>> +     * Start virtual RR testing from above the midpoint of the VRR 
>> range when multiple
>> +     * modes are available. This avoids the driver mode adjustment. 
>> which can cause an
>> +     * unintended clock change.
>> +     */
>> +    if (output->config.connector->count_modes > 1)
>> +        vrefresh = ((data->range.max + data->range.min) / 2) + 
>> step_size;
>> +    else
>> +        vrefresh = data->range.min + step_size;
>
>> +
>> +    for ( ; vrefresh < data->range.max; vrefresh += step_size) {
>
> nit, please consider calculating the vrefresh_start before the loop 
> based on modes and use variable in for loop.
>
> vrefresh_start =  (output->config.connector->count_modes > 1)
>     ? ((vrr_max + vrr_min) / 2) + step_size
>     : vrr_min + step_size;
Sure. i will update the logic in next version.
>
> Also please check BAT results are failing.
Yes all are expected failures.
>
> Thanks,
> Santhosh> virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
>>             igt_info("Requesting Virtual Mode with Refresh Rate (%u 
>> Hz): \n", vrefresh);
>
