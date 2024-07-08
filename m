Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F307CC3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 11:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C58C10E0D1;
	Mon,  8 Jul 2024 11:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpmRI6qW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C6D10E0FE
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 11:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720436623; x=1751972623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XPEk0IETYtVnbVWrbfV9E1VNj5ufaoLA3jgZJQ+NNUQ=;
 b=GpmRI6qWfCN88qem6y5BxBlDrNAxKtqt+YrpF7sNrEZPkLohqxa+149+
 Ts5VtJLMep8BrBFn7MiOOoHptSZoBDX/fC70Vf1lK+ByXtn88bWhPAMVk
 k6AVJmaFe4KOQEQAjYA9VqHvq/1ox9oAS9I6qOKY29560ooXpNI20sI68
 2O4qH2QQ87DPI5OFar09kSP7oZfIyvuzmy+G+IuaJSXDz2m5P+8gdzmB3
 Ldn5QeB9EbkIFLfV7IPGHGwMov62XbpnV0jyErngrDmUruqoKmI6oYN+4
 Pe2WVcoRcsbD/o5VlnD6L+j7CT24FRHH/lK9DgWSYsiSQDo7rzEai30qn g==;
X-CSE-ConnectionGUID: x30Az7ppSFm1h7Mj9NkLCw==
X-CSE-MsgGUID: vdELXk3WRxarzzD6CffCkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21499598"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="21499598"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:03:43 -0700
X-CSE-ConnectionGUID: S5KOHhWPQIyg5USHzmqjbA==
X-CSE-MsgGUID: gBFGh+EmSrSnwb5NWilSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="78214533"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 04:03:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 04:03:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 04:03:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 04:03:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 04:03:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjFQVyNARVqP9nbcC3wOjYWsEfveC9Clce/lB4bN9M6xuCeh3dmtieV3Ze00dhb0FOt60LYnA+xY61+3qlLBOgLeZvPihMMnzFsnQ6ZsgtdccTw3H2a1qhgzpJtbvf6zob2BUuiJwxyWJPUaWVgeItrq3VD54+S5LVNga1hRx5eEljc0VA0TiC48dym1C2qo5QrfNehiddOGF8Kc3oesQZCoVEK0QjFz9JY8WoCbxFXIQQJMTDsqZqfoKGEoqsmLrHbDKtMLapK04N6ggpZSTUmv/1w4qlnbaQvpaKWWaxR74zQ9VnCjK3IiqNScMWschi0urw8Qej3JryFCrGbrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUu8ACfHwMgXlMTNShZsLoKipktLIJeNgp7+B0+IWiY=;
 b=YgRse0jLK+JLArYwd3UjGfVnthhr+0iix3jjoA54vNcWG3aIpYQo9Kj8Q39IbHbvN1DcYD07UvwPKQQ86NV5Pv2tiWMON1cxFSlJbg43AOEclzzLzNIqCKfwbYUdEcNlQb70C3Kh2yt4FXWcyOg/NE30c4ubKQqZFUpumysuYch4d0Xf/Ssg7UF+EBF+2noLo7N2j405mPSopF9NpAeSpvalybtQjaZImYFl1lQOQT+Q18rmRaP6VzbH/zCtUTfExxelolIDWcAcvHV12DckVqaUqc/09Atl8+88Bjt9ZmyS9mHh4BdVBs7X9IHfIbNZ/CbCM4sWq9oSzzDYze40lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:03:40 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 11:03:40 +0000
Message-ID: <d6f3212e-e408-414e-9b9a-7cc00a8563b6@intel.com>
Date: Mon, 8 Jul 2024 16:33:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_sysfs: Implement dynamic adjustment of
 debug log level
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240707150457.715471-1-pranay.samala@intel.com>
 <20240707150457.715471-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240707150457.715471-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: b301bac1-82bb-4b73-4e3a-08dc9f3d9fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkRqcDdyLzNjNGRYYnpLeXg0VnVrWUg0ZXl5amNZL0ZIVnNJQ1k5RndiUUc1?=
 =?utf-8?B?UjFGZTJIVnZQNzhVU2krSUNWemZZUlp6SExlVER4Qjk1NFZ2dDlZMVdiTWMr?=
 =?utf-8?B?YW5qWmluS1FCZHl1TWtkdDZIbEZZZjc1K2tjRmtsbzBPaC93Q0lpV05Vd2FJ?=
 =?utf-8?B?RWd1VjJ1VTdiSEF5dlNSNHRFN1IxMWpnYTY5VkhiaFJTRWFmY2JhZW9ZTkhv?=
 =?utf-8?B?aHU0cGEzNTBYcEFZK1FuYlBGZUY5aVpWdVdLMTBxS3MvbE8yZHJtRVF3cDFD?=
 =?utf-8?B?ek16WFNwb0NoNG05bk0yUzJCUVF3MzZ0dU1EUGJiYlFyRW1BWVMwNnJPS3lG?=
 =?utf-8?B?YmY0L211ZjdNMG4xbHB5S3J6MUFmSXIxTW1zQkF5MEtMaXBCQUlPWWFyTHBs?=
 =?utf-8?B?QUJxSm0zbmRNT3kvYVBhS0FVeUJJNjE5UWxzanZoai9PalVEVEJPWGRHemI0?=
 =?utf-8?B?WDRQYjlZQ2s1L2lBc3g2bzNob0xRZ1JxMXR3VTNTTWV1WVFBOFVhcDU1bTlo?=
 =?utf-8?B?MnFudVBXQkFxK0RGTWdyM09NUk1uQVhiZVJ5L2VSYXpMZmNya3JZR3M1MTVu?=
 =?utf-8?B?bUFHNDVKVWkxcHFWdmxsY1AwcDhCTHFTbFpzdXdyVkJZWWRTdS9XUjhZVk1X?=
 =?utf-8?B?UFNjd0pYQmhYek1SZE5NckFJQU5HUE91RDZ4eTV6Vlo3WFdxVUI3Y3dLY01V?=
 =?utf-8?B?MytKdE4xQ0pPWjNUdjI4N0JMNVNLSGk2V21xV3Arb1ZZck1DQTBKMHZ0b1ZH?=
 =?utf-8?B?M2FKQUI5S0xrRUNzZC9Cb0dNN1l0NkQrQ0x0ZmJFdzhydURIVDJ4WXlKVFlG?=
 =?utf-8?B?QmRFVG1iNGM1Nm1kR2t3L01Hb0ZSOWZvUGJudWxQdWZoeHRMWmppanRRWUIy?=
 =?utf-8?B?cmxhTWJvYkVyRkF4Q1N0VHl2bFluMXFBa2tILzRCc2JLQmVkRlNSdWQ1M0Vw?=
 =?utf-8?B?Wmh5TVdDOEF0ZEVkdzRTaUVGRjRwdHdvUFBYNWRCczVEV2lEZi9zSGs4a0d2?=
 =?utf-8?B?ZXNjcHVVbCtvMVI3ZnplRHVML2xiQ09IS2V3QnpVbDU5RWJPaVJWMzdmblRM?=
 =?utf-8?B?VmU5RUNDbWxUZWhVZ051RGpQQ1BMY3JJbGxZVmdObE1BRlZkeHdmclQvSnBQ?=
 =?utf-8?B?V3hJczJYYlJqRDI2QnIxOTkrK2x3ak54UTEzbnZUZko0ekh1SXhyWkc1dTBp?=
 =?utf-8?B?NkN4QlR1T0RRNDUvbWxybklPWTBRTW51bXhRS0FhRjlISC81NzkyYysyV2tM?=
 =?utf-8?B?bTNiRm8rK2J3N3NjSTRhaVJDM1dIT2tvQTY2ZXgyR2t5SkNBTEswTG5tNW5z?=
 =?utf-8?B?NjFwU0tSMTZkM1Fid09RcDlhZVNzSDB2ZmNVRjQwZjNBdXhNZVNTblFDcVBC?=
 =?utf-8?B?cm44aW1SeFFJcjgvZTZVZnAyWGpIKzNpeXhHMzU1eTBzVjdnWXA4UyswS0pV?=
 =?utf-8?B?QXo3dnNJNFFNUVRIaWEzQ0tBc3paSzNNcXJZSzBCSVE5UythZk5ZZjY5WmxN?=
 =?utf-8?B?V0xhOWowZ2wwVkJJUGFLTmVWdE9sLzlUOG85ZnpQbWtWQUMvSG5iQ0d4QUts?=
 =?utf-8?B?ZldnRzVSRDFWbHhjNS84a3pqQnd3RzZZKzZncDAvUjUwcTMxUmxxdk43bTlX?=
 =?utf-8?B?VG5WUUF2SS96WTZRbGJpOXY5MHF4dEhhWDJvclI1RUE0NHNyRGpoYVl2RjUv?=
 =?utf-8?B?R2p5eG5lMUxxcjJDbmhTRWIrbThsUGVsR1hkTVQ4enlsOGo5SWEzRFIyNk1u?=
 =?utf-8?B?T3dBZFFtSXpQd1NqSlRyYm1pc0x5U2NPTzhUZzBiVFhCTmhST2lNcDRvTXNp?=
 =?utf-8?B?MngvdFZZZGZLbWR1Mi8vUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1JBWGFBTkxrQWg4QVA5eTBSRWZ0TE52cUUwZHdkZFR4UHRYMG9YOGk0MTNU?=
 =?utf-8?B?aXYyRFcxNEg4NlB6TkgzKzZCdUkvMEp2UmJPajVrYUNwQjRIQlAwcGhlUXNo?=
 =?utf-8?B?WHd5eURzQXk1MkppWDVFSUNnZTVtdkNDTW81WHU2YnFpdDI5NVZFR2VhQU5H?=
 =?utf-8?B?OVVxdUxidzNJSU9kWmJSTCtSSy9UZlQ1S1RHelViTWdmeFFPa2ozTHBVVWsr?=
 =?utf-8?B?eEpyWXg2a2hGS2g0VnBjYWRHUTZqbGZBUlV5WSsxQUxiZnRPSVNmTWpDMWFH?=
 =?utf-8?B?dlpHbmcvNVlPYWRGUGdVK2s5Vy83dXFSNUhJcTNMQ3I5K1MxLzI5bVhvQlRX?=
 =?utf-8?B?MjhGYVlURjFzUW5pY3N4bWdCTFEvZWY2R0lJMUswbmp0ZkxwU3NEUWw0MGdK?=
 =?utf-8?B?bFlINUxFdmo0TFI0ZDJ5MWp3ekRjb2R4ZUxMSmdDdjFWSU43LyttZ3Q2R0Ez?=
 =?utf-8?B?L2xUYmdqdnJPNG5tUTJVNFY1Z1VVRnR0UmtnSzUyYm9zdm9iSVBUeTNYenBN?=
 =?utf-8?B?Y0hoWHAzNVJUU0RvSHh2TWk3YitqRXFTM3ZhTkxvTmNIdCtvNkp4MHhvNkhv?=
 =?utf-8?B?SWVzRWo5QVEvbkU4WHlLc3FDbE5Qenhic1VmSjlNV3pIdW5QdnlDQllpdmQv?=
 =?utf-8?B?TG5XNTNmV3VQS1V2UmpHTVQ0ZWVoTXJrYmZ0VkErUlVZYXlHTHVWZXdpWTJE?=
 =?utf-8?B?QzFnY1NQRmlaTjZwU09FWWVyakwvSk0reXh0aE9JSHphRWp3c3NmUVFGdmFo?=
 =?utf-8?B?OWlhYWdFVDNzaERXRkZkWTBETWYxWmd5NkQzZmR5SlpjbjBjK0pOWGxjelBQ?=
 =?utf-8?B?bE0wZFYzTExUL0pIQW5TWUcva2l5UXZmVnk4bHlNSDFwUmxyWTFDd3lNM1NK?=
 =?utf-8?B?NFJJRVdhKzBadkFnRDY1L0RkSjZrbjFvcFhXM2UzKzZ2ZzlPYXdrSEs5SzJJ?=
 =?utf-8?B?K3U5SzQ5V3I3ZVlqZEhhbGRtNCtOUVlLOE15K3BGOVV3QzdEUXVORFNFQXJ4?=
 =?utf-8?B?RWRPOTlqamF1ZHZzdVhseCt5RkF4VVhsL3hKN3hEMXNxQXI2Y1RES1pIaEND?=
 =?utf-8?B?dVg3dTdGcUlYM05vVUlVSmxXQXhkeUJJNW5VT1Z6WEZPOGpETUlRb2MxRjVX?=
 =?utf-8?B?Q0kwWGVQTVZEQkxrU01EQk8vaWR2cGdZL1pocEordEFvZnd6SFYyYmEvakhs?=
 =?utf-8?B?SjQyc214ZmdvakZVQUJIUDlrcjBsbEduN2U2U2dNWnpDOTI4NVU0eWJQMDNM?=
 =?utf-8?B?YThlR0lhQmJaMFAvTDNtcm14emhKckNTRWRvVVJnTDRCZ1JERkZ5bHhrM3lr?=
 =?utf-8?B?dmxzSFlNK2QrMUpzVzFCTHlKRzA4K0FxYVJZOVpNZG1oQ2pFekN5S3p1VWVC?=
 =?utf-8?B?cERoSnFaTVQvZ2FUT0d2dGsyRGNIYmhhWkMwWjZzeXRsUi9ib0xHbExvZHNV?=
 =?utf-8?B?SDg4aGxtaTUwdFRUaThubk1uN1Q4L0NDMTBDZXA5bllqM1hQeSsyVlp0YTNt?=
 =?utf-8?B?cG9uVVNGWVhpTVArR1huRk9zQ1Z3ZitWR0Y4TGduKzZjSkVzNXlhRHNKU2Mr?=
 =?utf-8?B?NjA4amFpNmRFTDA0TkVrbGUyei9lY1NVQUtNaWpFZ2Uyc05MTU90UnN0RnRX?=
 =?utf-8?B?REw4cG51L0xVbkJrZzU5enpRQmV2VnZ6RG9rZHlMUkJBS3pTRFVzOCt1T05q?=
 =?utf-8?B?NXV1d1UxelpwWFIrUFRjN3NQcUtDdGx0NjdBZGZTdzlXNzFkcmlXZEtuN2tt?=
 =?utf-8?B?QkhPc082QnRvOVBzMEZodGRHRDhXWWI0V1Q5SjVBUEd3UllSY1lXUThnWVJ6?=
 =?utf-8?B?V2s2M3JsMTVKUjJ0WDNZVmNvQ0xxRGhyWjQ1cE5nOEZaUkcvWG1wUk5YNlpL?=
 =?utf-8?B?MWYrcFN0dUFENkNOSWtZMFpCTDhPTHJrWXBoNmVzUzdTeDNqd29zZ3Uwa1hl?=
 =?utf-8?B?QjNZWEZVWHJ6eG4rVjllWU1ZMllBQ1hqeWJCNVNJSzRNOStPL2ZYL0FqRkF5?=
 =?utf-8?B?NmdHbTFYaGM5THNWNFJuZTNDREtNQnhqUElHSGcxVkZVcGRzOTc3eGFqSEpD?=
 =?utf-8?B?WXdJM1RIblFQc3c3a0VrdE9Qa00zamFTTWFaUFdMWWVUdmNsY1BwaWFzNWJ5?=
 =?utf-8?B?cjk1V2YwZFVjdUdKRWZzdk15WFBsVDFyQXRYSGpNZ0w0bFlNaVhHQkZhMWZ4?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b301bac1-82bb-4b73-4e3a-08dc9f3d9fc7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:03:40.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2998FIh0FImuYXt0Jz8c1kD6id9javqjzs3e2+0IX5RWhOrDm3MF78jr+g5OJbJNGHIRVULMoXagRKLISScMCgQEO9nL/zO3qlmw3YK2OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

Hi Pranay,

On 07-07-2024 08:34 pm, Pranay Samala wrote:
> Adjust debug log levels dynamically to prevent machine
> disk overflow during excessive test debug logs.
> 
> Introduce function to modify log levels as needed,
> with an exit handler restoring default settings post-test.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sysfs.h |  3 +++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index ffeec1ca2..c256f0ae7 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -412,6 +412,51 @@ int igt_sysfs_get_num_gt(int device)
>   	return num_gts;
>   }
>   
> +void igt_debug_reset(int drm_fd)

Better to use proper name to represent it's functionality, ex: 
igt_drm_debug_level_reset().

Also, documentation is mandatory for all non-static functions inside the 
lib.

> +{
> +	int fd = igt_sysfs_open(drm_fd);

Why do we need this check?
Basically, it'll search for the sysfs: "/sys/dev/char/<major>:<minor>".

> +
> +	if (fd < 0)
> +		return;
> +	const char *buf = "14";

We can't assume "14" as a default debug level, instead we must read the 
initial value and preserve it.

> +
> +	const char *path = "/sys/module/drm/parameters/debug";
> +	int debug_dir = openat(fd, path, O_WRONLY);
> +
> +	igt_debug("Resetting Debug value\n");
> +	igt_assert_eq(write(debug_dir, buf, strlen(buf)), strlen(buf));

For better handling, always prefer to use igt_sysfs_write() or 
igt_written() apis.

> +	close(fd);
> +}
> +
> +static void igt_debug_exit_handler(int sig)
> +{
> +	int fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);

Why do you need drm fd, as you are directly playing the full path of 
sysfs file?

If drm fd is really required, then why it is restricted to Intel only?

> +
> +	/* Here we assume that only one i915 device will be ever present */
> +	igt_debug_reset(fd);
> +	close(fd);
> +}
> +
> +void igt_set_debug_value(int drm_fd, unsigned int value)

Please check above comments.

- Bhanu

> +{
> +	char buf[16];
> +	int fd = igt_sysfs_open(drm_fd);
> +
> +	if (fd < 0)
> +		return;
> +
> +	const char *path = "/sys/module/drm/parameters/debug";
> +	int debug_dir = openat(fd, path, O_WRONLY);
> +
> +	igt_debug("Setting Debug value to %d\n", value);
> +	snprintf(buf, sizeof(buf), "%d", value);
> +	igt_assert_eq(write(debug_dir, buf, strlen(buf)), strlen(buf));
> +
> +	close(fd);
> +	close(debug_dir);
> +	igt_install_exit_handler(igt_debug_exit_handler);
> +}
> +
>   /**
>    * igt_sysfs_write:
>    * @dir: sysfs directory
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 6c604d939..abc9c1739 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -138,6 +138,9 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>   void bind_fbcon(bool enable);
>   void fbcon_blink_enable(bool enable);
>   
> +void igt_set_debug_value(int dir, unsigned int value);
> +void igt_debug_reset(int dir);
> +
>   /**
>    * igt_sysfs_rw_attr:
>    * @dir: file descriptor for parent directory
