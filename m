Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7333CE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 15:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2123510EEAF;
	Thu,  5 Dec 2024 15:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k04QqTUD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B183210EEAF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733410982; x=1764946982;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8mqV/+sVYEBAmjjz6Yqi7o49nPmo7l22BsF8e5YQhAs=;
 b=k04QqTUD5BMdHDS+1EwpMYRAEkja9UeZt4Lstbehory8EpBK6dmJWdGs
 y2tlT+4F5m01BFMy9j2gA8hfIgaQhKHj5xzddtamPUCeGZEm3P6nbfF2B
 zKXSQyKBc4dBINJunn//TxpYhIVh7F1g9YHE/JitzgQwx+SF868tje106
 AexG7Dyd1kPEaZtU2/eM+ph1OHEDxZ8n+O0gmW/f2N0G28eTYBHOSe0CN
 FddI9Sp+w0bg+HSqrSD8nWhpd70xr7u5sSocR2XjXC1RLOjZz7fVT5eAd
 92qHfph8ARTzZ48c9Sr7SEiYuJ2BHIX/X2U4lWU3SwXF4LxmMU+rmuKuQ A==;
X-CSE-ConnectionGUID: 3/QQ6bktTRK3jw1tEt+e2g==
X-CSE-MsgGUID: y/01Xz8PTf2pPwPe9fPpyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="56205408"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="56205408"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:01 -0800
X-CSE-ConnectionGUID: O4Jn/3xHTdyLDfe4GmZjcQ==
X-CSE-MsgGUID: ckhnPp3jTjOS9L2dLtp9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="125023947"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 07:03:01 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 07:03:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 07:03:00 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 07:03:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDZ+F7l9VQJSr4JTJ2e6W0vWpokMYV4Xj6UIMY/K7egVNDOgAHmGFKKwtxptrq0cLgHnFAHDBQ6fgvrbcIuLZxO0dJz4GadcmBN1d5T8tx5IIykbIHZdsgclVEpNfzVreTaRN/wD9wFtmfry1vdn9Jqire8EN/lJxB2MbcVGGRLHhN2j8mlBp8P2O5n/dvUe6/v5CIDU14obmQivV4PlayseM6Xs5aqQtBmmjSLqrZzvp0VezoAyLPBfu3IHDNmn2fPcQxCa0ciOL0Mr49a6yh+XKMZ+2afth4Uhk5c63ovNZBgRQHzV8LfWbXYloz0Ouzs8cnylXicPE6q221+3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfwF9YdjliAblZK0v27oUYEE+bONPLnib3+mzOwUMA0=;
 b=K5El5X6f7ZjPkP2/YxVC3T3vBVgYraXgSqd2GwcedwyIYFzkM9W7V0+zwXRMutlEMtYFetXo5IrlfjAlZv3kiJSrxmwObSUdIIMNq3j5LkdQ1bFrkNafmKZ0YesoHblzblsApJnYed80INzbJEntdpQtxBJNTDkqI4pujWZG34Gh8SKK10Lcig1l5IBPc7dXPQ1CDzEP2zIym3qXOLyKX2ChrAB7ms02LU0cRMIPZ6LQiy+j2UfTfe3PwMZXU31MjDjw63Fp2xFAdK+4VA7SgU4xsU5/JfhUuoRPPdHd331ztVzl6KDN8oY7gnJyvG2nkZEIifpTlcK2JCO9O4yvIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 15:02:56 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 15:02:56 +0000
Message-ID: <e06beb5f-1997-4cb0-a087-c48e6541a6cf@intel.com>
Date: Thu, 5 Dec 2024 20:32:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
 <20241205122528.3761118-2-ramanaidu.naladala@intel.com>
 <PH7PR11MB6053BE56088EC9B654006706E7302@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <PH7PR11MB6053BE56088EC9B654006706E7302@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::16) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e53d268-9f2f-44ad-e715-08dd153de66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkRzdWNMZnU1S2xydllYZ0MxcVhyWXltVE9TTDMzeXlUcWhtSjN6Y05CM3NV?=
 =?utf-8?B?TjJtTndkcmk2eUpsVXhwM1ZXek94ZWNZUHVsUmV6eERCOUJGVlBUblhGZzRL?=
 =?utf-8?B?QVVyUDBFTGZqNFFkSHp5TE50cm1KYTJVclZzWXNPTFlKaE9BcXBsM1pmdnFF?=
 =?utf-8?B?R2NyQVdDTmZuRTJDTnliaC9OMGlEU0hFeVhEeHoySldKU0RCb1BpS1JtZjI3?=
 =?utf-8?B?ZXRTR25IQVl2T0x3aVRGNFlKMTM2REk3ZDZuY0Q4MmRkckVXNjJ0WjFYM2xq?=
 =?utf-8?B?b3h2T1RTUzZ6MGw3WXdKc2tKVThySVovMVo2c3FhZzRmOWNJNVFPalZwVXBt?=
 =?utf-8?B?OWRXUWNGOEt1OUFvektmeVJLRTY5UUZubnR3RkYrbGg0ejIxNUZZN2Qrellh?=
 =?utf-8?B?RVlwR21pQnNmZE1SSEo4Z3FTRC9ybFRnUVJGb0NOVDRUKzlPalZPeS95Nnla?=
 =?utf-8?B?TldIbWVwN0VnWXdsd1pqMCtiR1F5VzBoY28raDFsS1FtbmNxWUF4UC9GS3pj?=
 =?utf-8?B?bSthRWRBRjYxOU1pMGtQckh6T1haZ2N5eTVTKzNkR2xMRTZoZFJKNUgxTEQr?=
 =?utf-8?B?MEVwQTg2Q1M0RGlnVHExMk9WcldUSG54VlUweEptRUVkRVg3aDNucDMzUjh6?=
 =?utf-8?B?b2RNanl6M2FRUDl5WWs2S1g2M2pKTVEzaENKRVVGSFp1c0dpYTZWL014NUh6?=
 =?utf-8?B?R2gxSGJ1ZXE1alh1SkRFaGk5OTRVTWVUQkNQR2Q2UVE4ZjNwWlpOWDY2M1pC?=
 =?utf-8?B?NGQ3a1ZmUUc5WUkwMUNLTnBCcHNVU0xSYlBPbXRVak9tNlkrTnFaOHp6Q3VT?=
 =?utf-8?B?VlNSQnpzUDVVQVJHV2QvMHJ4dld6emFJRU8wM3FYZTBKUUhzMWdjc2NSSGpm?=
 =?utf-8?B?U2Nyc0pVL1pYTjNEUDI4R0pTbmsvRTk3UEVpdjhOamlLNXY5cjU2OFA0RHpy?=
 =?utf-8?B?V0x5NXFOY0ZTa0pXbHRGcEJMeXdDbnJjNlZ5NXVhWmhqbDgreml2REkraEdq?=
 =?utf-8?B?eEVZdWpnUHlJYWVwRFlSWTRHOUpnKzR4SkMxck1kdjZtM1VrQVNMYU14bHUv?=
 =?utf-8?B?d0EySDhBZlhqRVEzN2Q3ckpWVHhKQm04OXczUFN0QlAxc1QybDAwbWlQK1Rj?=
 =?utf-8?B?b1BiajA2RzVRV0NybTdJWmNmaGpCZjZiSUxLb3NrV3lTa1FTSjFlODRESTdV?=
 =?utf-8?B?T3BPZnVUS0NucnVtZHRhR2dweVZUTmpiNk1teDRtQS9wQXpXallHbDF2QXJz?=
 =?utf-8?B?YVllMVdKQkZmKytrVEZSYjFhUzVXVU1qUkJYUnFJNXNYdWwrKzBKS0VoTlNF?=
 =?utf-8?B?d0c1NFd5NENwbnpXTk1BbE9wV2VwVnVrL2U0d0lGOXFEcmFFcStHMlJFT1Zo?=
 =?utf-8?B?V1hCQlJ4WjA3bjFORG9WTDdabWVYa0IyVHRNeWFuM2EvQjNzeUtZTWE1SDFO?=
 =?utf-8?B?WUQwNThzc2wrQVgvTXppbXRBcWtjSU9Ob1I2SDU2eGtHS1FMSG9qZG1xR2J1?=
 =?utf-8?B?cmNwdy9vYU9XRnI4RG5uTGkrRVVhRXl4dDVSNGNNWWRiZUhsUUpua2VmTWho?=
 =?utf-8?B?RU93Q0E4L2o3dGhZck9LMGcrRWczcVF1VnE0YnRyU1kxL2dRcHEzdHYwMlRw?=
 =?utf-8?B?cnUvMjU2dkFCWWZ5ditlbjgzdUZYZW1VZHhmVUhnOWJjWmVtWDgwZ0YrcFNX?=
 =?utf-8?B?MlJSL2xBcGkrUWV5Tk1HS25SMndWT3p4emliZmJGWkFQK0tJUFlrS0MrTGdr?=
 =?utf-8?B?WEs1enhRREV0SWpXdWJ4K0RTMzd2dHZ4WDhEejNTR1ZMaFFtSkRvWnpzaENp?=
 =?utf-8?B?OXVEb2RoTDlQY2hlTVlkUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklGQW1KYzlaTUtWc2pVSUw0SFRKeUYybFQrcUFLS2RldGY0NldzUVZnR01a?=
 =?utf-8?B?aEllZ05iZWQ5Mk11QTRYZkdReXBzeStKOXQzamN1c0hHczUweUhhMnVQNTJp?=
 =?utf-8?B?YnRRMGxpQTJ4NlR5cVIzV21mVzNvVDZZcFpMSG5CV0gwc1ltMnFLV1d2TjVr?=
 =?utf-8?B?ajFaNjV2U2QwK05BSkpPMDRETW1oSmYzcFdhK2d5b0RMQjVleFFrNU9PZmRK?=
 =?utf-8?B?akxUZUVQZ0UzOFg2MDZRcmUwWklDT3lzN3ZTRW81YlhPL0RoWXBGbk5wdjla?=
 =?utf-8?B?SEFQTlFLbVBjRXdva1lSa1VEQ1ZLaitTeUp6cmZEdHZ4ektSQjJWa3k0Zmxq?=
 =?utf-8?B?ZVJHV2JKNU5YaTJWVmtNcjdudTBWcVhxODV3YnZhdFFKaGQ2eHFhQkJLYXdQ?=
 =?utf-8?B?NEtabkFrRHhuM01hcXhnUzFFb3BjYWZXSm8xSTlrdlhaeDdYMFN5OVlaMnFD?=
 =?utf-8?B?VU82UVNFMUpORE5iT2I0MGRMbkJYd3ZVQUFET2RIa044MVVuMVdIbDZxZ1dk?=
 =?utf-8?B?Z2xuNGFpSTl4cjNMc3ZuU1ZndkxrMTdnQW02U3RQSEhtVVVsd3VBU2JiVTY1?=
 =?utf-8?B?Vm52M3NCRWNrM1d3c3gxZ1ZFWFVOVW9FY2diZyt2T3E2a2h4bm9mdzBrK250?=
 =?utf-8?B?M3dkaG5nSXExSlVNazlkMU5wd3VlOWVTdUQ5M25WVDZQdWdtbWwyNVgzQWRp?=
 =?utf-8?B?WWFYdXpqRVd2QnJaUEIrbzlHeDlMYnViNFZ1M3Zsd3VaREEzSFBkRURZZnJO?=
 =?utf-8?B?bmpPOHBJN2Rqdnh0bGt5UHVlaG80RUFkektUTGRPRjVLYjllQ1kyWmo1WUI2?=
 =?utf-8?B?M1hyeE94MGx5QU1sNjNsRDVlY1kyQXNBajFCZktZSkFnTUYzUmxualR4UGZ6?=
 =?utf-8?B?UjljcVg5UlhINWw4WHpCc2FUdDAzN1hOVk4yVFZQQ0tvOEdheFhxS3FtZlZN?=
 =?utf-8?B?dTZXM3RpbUYvdUQrMUY0N0crUkd5ckNEY2tORlVQRlU1Z1hCdW9DS25kajdX?=
 =?utf-8?B?YVBLMEMvclZ6NjlRaGkrUUxGanBjTms5SCtPcVQzM0JvUU9ZckdXM0NXOStF?=
 =?utf-8?B?dU9sMUxxNUNua0xsYzczQVYzc0U4Y25GYU16SEh3TVhFRWpLL2VOOXZUeDJ3?=
 =?utf-8?B?Ly94OTZ2OGxOekpqTzRiU2lyek0wdmJZRmlEZDVjZkg1UmEvRjk0cmhFblNV?=
 =?utf-8?B?dEljS1U1ZmJVNVFubVUzakUxeVZiaDlWQU52UzVMVGN5RW5FRjNXN21hUHJU?=
 =?utf-8?B?MGRRL1hWQ1RrOWtHY2VkNklNNWxhY2huVWREUjhHTjF5ZStwVk4rWVZ1a3lp?=
 =?utf-8?B?RGQxQmtyZ2ZTYjMwQ3h5QnVtYWtrU1JlT1kydm9EQ0ZOQTM1bVlyckxYUjRO?=
 =?utf-8?B?U3VYUkNxUWRjcHIvZTRlT2pWcnBWUWdqcjUxbW5DWHBkMkUwbXRkUXRrTjhE?=
 =?utf-8?B?VStwNmY4eEdXZjhreGdmNGFjZ0JHQmZGc2tYMTJJQlV2bTVhQitYTTVhTG5X?=
 =?utf-8?B?cmhBWi9YWFdyQ2w4Umo4ellSWUYvVmYzTnZ0NUlkU210SWJuaHp2c3IyQWgr?=
 =?utf-8?B?dld4eHlpT3lwbi9KeWtzK3N6ZEVESUdOOWZjUVNMR1VPbEJVb2o0Skh1RmVP?=
 =?utf-8?B?TDVMSEtmVXQ2c2J2MTh3YktXanZlWjJRZkJOR3JVNFd5ZUZPck1OVEVKLzVM?=
 =?utf-8?B?cXVjZVFnQ2NOQ2J4NE1Vb0tVVHVaMkFmYm1iZ1Jsd09HYTBIQ2tnaGY5UHFY?=
 =?utf-8?B?Wis1V2g2bVI4N216S2REc1dja24wbmc0NFB2MGxVMGh6anFUVk14c2k1UXV1?=
 =?utf-8?B?amRZb0kyZ2NzUXZjVzJPRlh3RjM5aGlUd2hUVS9lSjBkQU5wR1liN29wVlhv?=
 =?utf-8?B?Q2hFQXJTTlpLMTdSUVJNUWxFRnkwbHpQdzNOYzZuQmJHNzhsVEdaYm02d3k1?=
 =?utf-8?B?aWhVVGtNOTR6eUhsbUZQS1Nac1huSXowMC9kVHBpaVFQSENlR2tiMGJZSlMw?=
 =?utf-8?B?LzZBLzhRc0kwVnAwZnMxTWJWY3dwVW02TkdYYm1pYy9EdERRNVpSVmRrSXE0?=
 =?utf-8?B?RUt0YWpCWkpZeGZRNkRDbzlzREZXcVBxOUFHc0hNalprYVJ3VktpZ1pPWVdq?=
 =?utf-8?B?SVhsSHQ4U3FlUTRaUjNRNE5NQ3pjRVRHOTRzMGd5ekJGQU0rUmpycUt3akI5?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e53d268-9f2f-44ad-e715-08dd153de66d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 15:02:56.3318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb1y+i7W7lwGUC3WlhIpYSY5DoUuPMrZYJj9VwXeG4krZXG5LoCOOdDMt1MrGcN0kaN5vQrsiSsjJ6/r30yEIKWC9EfeybUqdObDOL750PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
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

Thanks for the review.

On 12/5/2024 8:20 PM, Samala, Pranay wrote:
> Hi Ramanaidu,
>
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: Thursday, December 5, 2024 5:55 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Samala, Pranay <pranay.samala@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v1 1/2] tests/kms_scaling_modes: Add informative
>> messages for skipped scaling mode tests
>>
>> Add `igt_info` messages to provide more context when skipping outputs that do
>> not support scaling mode. Include `igt_info` messages to indicate when invalid
>> pipe/output combinations are skipped.
>>
>> V1: Fix alignment issues. (Pranay)
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_scaling_modes.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c index
>> 5fd34c4b2..e8aeb7409 100644
>> --- a/tests/kms_scaling_modes.c
>> +++ b/tests/kms_scaling_modes.c
>> @@ -117,8 +117,11 @@ static void test_scaling_mode(data_t *data, uint32_t
>> flags)
>>   	for_each_pipe_with_valid_output(display, pipe, output) {
>>   		igt_display_reset(display);
>>
>> -		if (!has_scaling_mode(output))
>> +		if (!has_scaling_mode(output)) {
>> +			igt_info("Output %s does not support scaling mode.\n",
>> +				igt_output_name(output));
> Alignment should match open parenthesis
> i of igt should come below "
This alignment issue will be fix during merging. Since it's a 
non-functional fix, there's no need to go through the CI cycle again.
>
> With this fixed, code LGTM.
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
>>   			continue;
>> +		}
>>
>>   		igt_output_set_pipe(output, pipe);
>>   		if (!intel_pipe_output_combo_valid(display))
>> --
>> 2.43.0
