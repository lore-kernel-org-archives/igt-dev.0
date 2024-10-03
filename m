Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA74CF34A2
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 12:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCA910E82A;
	Thu,  3 Oct 2024 12:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X80RU5tK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C34410E82A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 12:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727958328; x=1759494328;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RmrpPTk8YCkuoTQ+G0MDlA8w6Dy6HEL90J4rRAj2/Bo=;
 b=X80RU5tKRaLNfhIZW9yf5t89G8zPNIoGJWrhrfCveB4krB72FF16hMGG
 tZDviGK8kV/JHb99Idd/hnaLaMsf4gY1+1edEaC36wVL43KWWiuiJ07Wy
 6/aaNEE+0JvZBXhRnYJIDCR75anty4iyZfVIgeJYrzFa5TtELMoK6slzQ
 pMklHg7BbUspvJr9NML3lgeRysenmJRUBicHayqkzd7wnrQzCh7zBQgOm
 FHGqL8volQDSQQNHkvAbGkfnChLmmSfSv7cPbAfuWPm3aBMaK67X6yPQp
 7bSgPa4AZ8abPrr1QJ72g+bt2VYup/ZdTM/QmY9fQ/O4BB0Bt6/b6v3Ki Q==;
X-CSE-ConnectionGUID: C/6jYDwAQU+J6+jjtq0DYg==
X-CSE-MsgGUID: IrULu/ZaQACZmmXn75SLGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38507308"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38507308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 05:25:28 -0700
X-CSE-ConnectionGUID: 22yLaVudTbqdO6f5NKgCqQ==
X-CSE-MsgGUID: qagARCIuTJGdf4RczwydKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="79298178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 05:25:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 05:25:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 05:25:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 05:25:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 05:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yav/IrG2vtxm7R1j++WR43ZOfXpPWvYxf5PnRM7hdR6m8ipOXMy0HH6/r1BBYYxG7JFdaPmZXE9ZT4Vn1sM8RA+nTwYbvY+JPa2EDOp1QdmoCh2U0ZdTRxe/uGx07nO9lJ7DtVLn+1WeD9Z/94feRP4ol4hDqgjEbnOu0S8C9xAHicvKA5vaAHPt4xeUdFIvEW10mf3501d9B9ryEPYKtclXtGmZPV93k0kyMIT28YZ9M6MddDRS/G0SRcoI5Zq0QR1wb2IVmaEB+VgQeJg0XB3+Y2eVRxLux0gmzLlI5+EgEplbqYdRxS8sWLIWxZapVjO2qVKT3W5lIZdYnD3qHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDfgnoa8heDVxOJtRkiQnPiD6/lIekvnVZgV5XSkBmo=;
 b=j5+qW1g1ebcVMzr3mKb6jQu5aTBj3IHjG4NpO8OcmCnxygSw3xxlwD2mMG3Fy0WFpEcHr8VXXphXKMiEjRcRY3ZkDr1oOhKwcLU7CKtQl6n9E6x5db4mArV/wmdDx32E2zxTxiyR58RtlaxzccmFq+All7/D9A4pd3u9VDy6Hqx9B6jPL1dZs4wpD7VmSPjI37sXQe2FanKxNDFjMIV+RxX6wGdGIWcll8v8vYRKLNybnI5oiylwKdvUGDZE7ubcdAc3dZ8qN4Tu98rhoGSKf4W9jcb3AnrmACRnDu9f/R6UlAKr9tQIxbJ7XlPZzEtdHl2zZMc8YqlpkozjfMLivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.18; Thu, 3 Oct 2024 12:25:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 12:25:25 +0000
Message-ID: <0d0cab70-0ba4-4c50-b7a9-ad580ee14db2@intel.com>
Date: Thu, 3 Oct 2024 17:55:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_oa: Check gtidle before rc6
 disable test
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20241003115741.119720-1-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241003115741.119720-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9cf304-08dd-43c2-8392-08dce3a6750d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dy9Lc0VZdWhqWjNHZVRLTDNoR3gyVzVzZ2FmdGRGVmhVemlOR0puNVBoUkpC?=
 =?utf-8?B?Y2Vtc1p2TE1Femxxb0tpZEtycGpuREhScFJVWERYbCtPakU2M0Q2aUdDWDU2?=
 =?utf-8?B?dWEyZWhJUXVZZW9KaGM3QWNvbzhLeXltVFRyWHJIS3hYRitoQytJVmlxN1Fr?=
 =?utf-8?B?S294TGEwcDc5YVNtWSt0cjZYVmFyNXZiNnh0VXhYQnRPaFdjelZsbXNTb3VV?=
 =?utf-8?B?UDEwRURVVStWZmg5TXE1blZRS1J3YlJmTk4yQ1IvU2RiNEc3WDc5cFM0Z29H?=
 =?utf-8?B?UUFINFcwanZqYzhGbUxCVHFKekhjRk9kM0E3T211VEt1Yk9FRlpXUVFqSmgw?=
 =?utf-8?B?SDNNakMvanR5ZGVPc01ZbkwwdWtKU2FQZGlrd1VSUTRnZG4xYThHK2N5ODNX?=
 =?utf-8?B?TmN6eFdoUEJsWFZlRmt2VXlKUWVlemRjTGxFWFgybEhMQ3FSUTZ2cmpwaHEv?=
 =?utf-8?B?TzVGTGZSNjl6RURWOC9BTjBiaGhEMHFMUTdZb2FmaldaNFZmTjBISW9sOFpD?=
 =?utf-8?B?U1VMYis0a2Q3MzB0cFRlRDUvMXZqRFh4UFRqM3JEaEw3blhqK1pqUW1pTU1j?=
 =?utf-8?B?ZEt3UWxyaWZvSlRhVG5ZS25Wc29SbU1WODAzeUZFYllaYWJvbU5qa21lY2hy?=
 =?utf-8?B?aUgrWlkyNm15b2lYajQwV0JGNHNSQUl5Qm5iVVJGbVhGTE9MU3U1cGR4MFht?=
 =?utf-8?B?bHRKZ3I2VGw4dlpmdnpPTTN3WTRkdTRLZUpLL2M0Zkl1N2FOcVhMcXg2aXJM?=
 =?utf-8?B?eG44V2xTV1dYbm9UWWY1QlFNYkp0REcxUlpKVU1RRVB1c29jZVI3U3QvNlRR?=
 =?utf-8?B?TzJZeUF3VXdRaG1UNDV2MjNxeHZkN3BtVFMwODZleXNTTGJJUjJVVkxtd3ZV?=
 =?utf-8?B?YTV1R3VZUDRodC92Z0NZNTNvbWsyNzlGeDZpRHF1cHl0bnduV3hXOFgwZGVi?=
 =?utf-8?B?MUxRUkZYc3ZBcitVaERnVXJOWmIrdjdaaWE2Y0YvemJ6SSt3ak93RnZUZW1r?=
 =?utf-8?B?cjJxMUp3eHBvVkxGTUgxWDJFN3piVWtQSi9sUmV2UWIzTE9TTEduUWVjZnRP?=
 =?utf-8?B?TXNLZ05oSFFvd0lxRnBRVEhhVmRSZnhHYU02Wks5dmtkb3YrSkRxNHRGVlc4?=
 =?utf-8?B?N0kyTlkwT0dXZGxBSTU0RUVwbjRjV2xMMjFDYU9NVndFOFE0NjNlMjU4YTlF?=
 =?utf-8?B?Ny9XZ3NJbzVqU1oxYzBqclY1eUFoVEoxNjhHV3FVMDNmbkRITnByMUFaODE3?=
 =?utf-8?B?RkJQWVBxQkpuREovRDVnT0c2WTdMS29zMUFxQVRlMks5aTJEaThKWnkxdzdx?=
 =?utf-8?B?aTVGb1RJQXR5MU5scHdaZ2ozUmZXTUpXWVNpdnh5TG0va2w4bjJQL1lkVitH?=
 =?utf-8?B?elRoZ3orelpsQng3TDZLaFgzVElnaEhtUi9CTGlWOVVXSjhZUGtGVnkycWI0?=
 =?utf-8?B?ZzBVWDRnSzJOdE50QUROSTdpWDhzeDF5Z3dHME9QaFB3ZkVrb1phTW5hWXJk?=
 =?utf-8?B?UjBocVdjMXVOYVNpK0doSDQwOTBQRlJYQ2IzTm1KQUFpb0VtazdkcjN2V2dP?=
 =?utf-8?B?alVnTmxOTDlkREJDSGFXQXpSbWMrQW10aUs5cFI1TTNHdGx4WWNSYmR5VE8z?=
 =?utf-8?B?RENwQ05qWXBBbENmSUFpbldRVzg0OW0vZGNJcGRuRVhmdlEvUHNQR25xUVBK?=
 =?utf-8?B?Y0kySDdIaGVHdnFiU2Q0anAvRUtpcVZ3RDk2MWp4OUM0Vk4wQUFCamhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VCsxNnZTTlYzczZpU2NYUTh5eHdMY0k1cVlQOHFvWUc5Ym5rS21wSVc0V2g5?=
 =?utf-8?B?WURpRGJkdmRLNWFxdWRtZ29SL203TFQ0dkNPUUcrR1dRRmhuWkRINkdCTVlX?=
 =?utf-8?B?ZStCV1VvKzRuTG5EOHAxRzhqMFAxaGVERUIxSFRMaFVMNWg1TTVqekY0ZDda?=
 =?utf-8?B?YWNKbkZ0WlZuRFZna25MaDJMRHJORTNGMEF3ZGo2TGlJZzBRSUorOVkxbk5L?=
 =?utf-8?B?bmluYUd6YmhDbExROFlnZVk5Tk1FZ2Uyc2cvaTJaaW1YTVh0dmRuVi9aNGZw?=
 =?utf-8?B?M1JIeU1PQWM5bFpBNHpGc2JPSW1HL3VmdW5TYVZOeXZqWjdZeTlGbVBiVWVC?=
 =?utf-8?B?SFVuZEs2QU52clVZd1VBRExWQWZweldaVzJwMk5DNjBZQjFaY2NMWkVaay9t?=
 =?utf-8?B?Sm5BMENTbEM5VXhGRnZXSjliU2VNUnNrRTc4ODNzSWVMeVY0bmdZODdjQ0gx?=
 =?utf-8?B?UTV4TE9rRWtkVFR5WFVObXBHYjE5QTEwSmE4eUc2b3FCSFc3V3NacVZyZVVu?=
 =?utf-8?B?cDdFQ3lGSE9ja3lvSVdvTHlZWE5KMEJPeVRMWWVhVnhjeHBMNTI4NlRMd05O?=
 =?utf-8?B?NlZvVnBDWHdoRzBtNDZ3MkxQUmpPOHkxcElyR2ZuN0VEUnk4T1ZvTmdYTlhp?=
 =?utf-8?B?Sk5xQnVlV1MwcjR6Zkhpckh1YVR6SVowdEVLZTZVRlVHWUhWZkVJMVk5TFk5?=
 =?utf-8?B?U0lJTEdVaXZoZVBEZkFoNEtoRnhkWlJhSTcwNFg0MFJkeGJmMjlWRzVmOUow?=
 =?utf-8?B?Qy92QnlsL0V5SEE3bXNPOEg0c3hhRkQ0NnRuWkhEeVBJVFdqNEdjcnFndFFJ?=
 =?utf-8?B?QjlWdm8rVXcvejd3YkxDNW8rWlBhSHBiYm93S1ppRGd0NktLcm9JSzlUc2tz?=
 =?utf-8?B?cFhYck9tM0NEcDN5WS9RU1NvYjllekd6K2laZC94MnJnN2NSNU52NmNIRHB1?=
 =?utf-8?B?KzU1djZMZHlacUlZd0xJeE4zSzdlV2xORitjN0VDOGJtTUtBNlZ4Y2VNbFFp?=
 =?utf-8?B?eHgyNXdSRERhci8rRllSUnNLWWxvZ0tEbzdtdSthcVBtNDFIa0FSUHYvSFVH?=
 =?utf-8?B?SVJSNUlJWnUxdkhQOHBjQnpkQytjZUQyY3FUVHoxOUl2T3VSR0Z5TDU4TUp3?=
 =?utf-8?B?WXhCcGQ4aUhHUGN1bC9xc252OFkvZUJzN0RRMVR5WXpyVW1kVldCb0hINk10?=
 =?utf-8?B?MStmMFZ0Qjl6T0djSDNXUStaVDhnMU93RkExWXl4UVFPWXpOeFpxdzBobmFr?=
 =?utf-8?B?M0gvakd6WGhvbmRxSXV1bUQ0bmlUTHcyeWQ5ak5wSTA0cUtyd0p5Mjl1aXBs?=
 =?utf-8?B?M0xJdkEvWWJHdVRxMWcyaHVGWEMvbzhoaUxYTVJidzFGRGl0c0RPcDc5a0dE?=
 =?utf-8?B?UTFOQU1EdHNwd2hpWG5pVGpIZzhOY2owOHNrUGd5bFJzcitiSWZOaXlwZDBI?=
 =?utf-8?B?MXdzcXZxS2lxUHRCRk9DMVhxdTlIV2x2K1YvY1UxQlFJdkc3Rlo5WEE3RGJj?=
 =?utf-8?B?VkVYUmhlVmxtRWFVQSs1cmI0QXoxczh5TVpkOHZram9uYmh2dzM5TXBRSFFD?=
 =?utf-8?B?ejFpME1UTUtjSGV2OUpMVnBDZUhXL0ZiZUlDcnk2czZFa1AvaWMvcUczdXJl?=
 =?utf-8?B?TnFMemMrRVVoR0lRQmdyejF1S1gxcVBZeHBRL09IbWpPTWJtVjNaK0pCcS8r?=
 =?utf-8?B?TWNPUXgzVW05OVRjS1hsU3R0N0lBOENGMXpXNXA1T1IwSGs3TkFpQnNyQTVv?=
 =?utf-8?B?S01McnM5NDcrYSszeXV1TFVCcE5iZ3NGSGp0ak9za2RuY0dFT1laR0hJTmIz?=
 =?utf-8?B?UncvUTc1YTd5bHJoRVY1dzRxdmpmdDVaNlRRdUJSK3NxRHMxRFBQbXBjSHRz?=
 =?utf-8?B?bEdicktUTTdFMFI5VTBIQW1mcUdCU1NjblhLQWpIUmF5VStVSnlrcVcrZjVG?=
 =?utf-8?B?akpLM0YrWDlJSVZxSDl1UHR4ZzRKcmpFbU9rTWYyTk9lLzJ2VEp1bG1XV1hB?=
 =?utf-8?B?a0dsNmhwZ2FGYmw2Yk5tdk5kT0h0Y1RQMEpDUmhYaFUwSTFxQys4Umo4bzVV?=
 =?utf-8?B?ZTdiNDVyNWphd0RzZmJFNWFOYTdPK1F3TGdGNlh0SkpRL1JsUnR1RlprenV5?=
 =?utf-8?Q?/BftWJMpw0qHaRmEsJ5dZvUdJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9cf304-08dd-43c2-8392-08dce3a6750d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:25:25.1410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRDlU+XpvZshUWjmmfdVv+FiDbsjFJC2+Yt2Up14lXFJM6/sLy61DkxcfLDiV1gGMT1Y3ooezHowHEva9dS4EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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

Hi Soham

reword the subject

On 10/3/2024 5:27 PM, Soham Purkait wrote:
> Rc6 disable test has been modified in order to check the
> presence of gtidle node in sysfs gt0 path through the following
> code snippets :
> igt_require(xe_sysfs_gt_has_node(drm_fd, 0, "gtidle")).
do not add code snippet in commit message
> 
> As of now only Render GT (gt0) is used for rc6 disable test through OA
> activation. Standalone Media (gt1) is not supported yet for the same.
reword?
  OA is supported only on render gt.

add version history
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_oa.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 9be4fd633..6538d6323 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4644,8 +4644,10 @@ igt_main
>   			test_oa_unit_concurrent_oa_buffer_read();
>   	}
>   
> -	igt_subtest("rc6-disable")
> +	igt_subtest("rc6-disable"){
space before {

Thanks,
Riana
> +		igt_require(xe_sysfs_gt_has_node(drm_fd, 0, "gtidle"));
>   		test_rc6_disable();
> +	}
>   
>   	igt_subtest_with_dynamic("stress-open-close") {
>   		__for_one_hwe_in_oag(hwe)
