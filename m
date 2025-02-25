Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B05DC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 17:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E182910E78A;
	Tue, 25 Feb 2025 17:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+tHvS7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E4C10E788
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740505439; x=1772041439;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZBMPAFTyi9IzhJ+dowxjK8hV28Eh51TWbfjuUi+cCSk=;
 b=D+tHvS7uqUPludc6ALMees6asxHvMfqTMLe6eDyZuAUUQa5WKuJChs8M
 opXwkq+fh3lrOWhNiP/7nD1nst4bQyPvRy0bBFA2XD4R3SXGXmS13il7R
 YZ5v4x08AYVzBUgVOZc5TTfKGy2TU8iVAHnVQW5L6psnj3YiEZ8lrmUx8
 nOgVrWMHe2oHp8LOu31pnxbxzjr/bM23VUG3Q51bEWtC7LxifQGmB0YGs
 x/oOih2yZ/PbcDxV4hWXCc85/LQ3C46Ggoo//qVKwrTDgTU3DHSY1Z+FO
 k8W4gvNboazRx6H/IkLXleJAfX55uUjLZrGooIMmviPF+hAuppRD2DptH Q==;
X-CSE-ConnectionGUID: lH+UNFO2RPi2IExWpeTUjw==
X-CSE-MsgGUID: dVl48H7MSU27GFVOtDM+hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41344026"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41344026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:43:52 -0800
X-CSE-ConnectionGUID: emJIAU8hRQa7tpr+DJppRg==
X-CSE-MsgGUID: gLUPw1rPSL61cKjIAzyqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120569777"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 09:43:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 09:43:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 09:43:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 09:43:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMZMsz11x8hB4j9OeUm/48hgLLMFdhk3uT/75fHgFGhBcKIBrK3Y1JnzSAS44kmcqA8N99hleTxc1BN6nl44xHAXZDrWTW5oSCJ60v48kErXSfohhEscqfVE+bxVuevOa+tblT9wFwl3kiS5RY4lF7RsDXsNopkeN994CB9w4jeE6WOsOczdpfkfw6mx+vqccdSUAhxMUo5OSSOhvZESHQk+blBJcXikUFwfc3omZ+epmB6ZCLWAGU7BAFVH2TAQ5NYp7puHsVr58j2BNdhDwiXiUMdyd7rdjXJVd6BSjFCGr1j0Ge8h+ewjVRytX1L8eCkn8AmRPicYHaq3ayqfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezuBmiOdd+KBG61jywxw1RFopg7NyZrJSglUNs65bdg=;
 b=RkGYj66Q0FxJAy3wYeI5F0EyduiuSf9OFMUBCXTs6wWPYCYJ6P57oAj6AjJThqR7g06tTRMy/lPHMzT2UA1LwyTR+Q0pNR96bp8FiX+FWvvIbBjodXH7fc/Wqv5kiKB/Lj6fG82ymMAUH55vqP7P4SRwJF+mpfomOqE/HhJKWN5R8cQXSQWTQfs0Q4cEBkP5aomG7XZEBJg9UBjVwGrBrZapUWhRyU4hmZyxHUlvxkCCcI34xqKYl/lcnkOJ2h4UNwli5pSpB1h8gI1ECitwKTJ9Hr5ESyosduKSCls31kONV/NFnWwYnLp8Bj2WER/dCXljQi+pw0/ZGKnnhwaJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 17:43:20 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 17:43:19 +0000
Message-ID: <7b0b553d-c05c-4afa-8696-3d72cf260073@intel.com>
Date: Tue, 25 Feb 2025 09:43:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/7] drm-uapi/xe: Sync with PXP uapi updates
To: <igt-dev@lists.freedesktop.org>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
References: <20250225003140.2738645-1-daniele.ceraolospurio@intel.com>
 <20250225003140.2738645-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250225003140.2738645-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: d793ddca-67ef-430f-590c-08dd55c3e45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlJ1Uy95THBMMklUczAzMmJFTi9BUi9zQkNXMjhRYkNncnBMRmZGTGFUQk9y?=
 =?utf-8?B?cDZITU1RZW4zdndjcDhQeVdLYjlsdGhlM0JNVXhGRm9zTERTY0hDZHR2SFNP?=
 =?utf-8?B?ZjBPbnZaN0Z2QXY4bU5nY0l3UmVNUUFlR0FVb1g5ZVRjNnhndFlXRjlJVG1h?=
 =?utf-8?B?TTkxM1k4TXFMeWV4TnBEMWtXMzZ3YzRIUlY0UUNZWTFzWFBUY2ZNeUFqdURY?=
 =?utf-8?B?YWxoOStsdFEyZ3ZYNzJnbUp6T2ZzYUtIVnBuRy9tYzc2ZTlYUXptWWxYQmpo?=
 =?utf-8?B?enhsNlhtZHcvNENuQ3hyTDYyT0ZFWmN6OFkyS0t6dmFtUnJtdXFNTFZJcFlD?=
 =?utf-8?B?bDRLVExDMDdiakk4T0h6Vnl1MGJMdUw2Snh2bHFBMEo5aThCMHArMExqME1J?=
 =?utf-8?B?TVFHZVQxVnFDSjFRTG5od3dxY0ZGK1ZnZ2ZEZlI1V2J2UlJDcVdmSCtaaVpR?=
 =?utf-8?B?Z3ZwSHhnaTdyQndMcXE4U3lxVlQwdFZIUUptTHlTNjNNM096azgwQmNZdEJw?=
 =?utf-8?B?SHFyQ0R1bFM0TnArS3d4djFHV2htd0M3bFRzbFAwMGRZekRyMHRReEUwVThN?=
 =?utf-8?B?bU5LcWhGMlF6dGRWMEsyNVlPVWg1SmJ5amQ4bE1RUk56SkVOMTlZa1BJKzJn?=
 =?utf-8?B?VTZRWml3K0UrZEJIZUxEbmtIeWVaS3ZPNW4rc0ZncTlMb0RxWUtPWjllK1pB?=
 =?utf-8?B?TlZhOFBrT2xFMTZWSDFyVkZ6NTFoeGJLSWc1WGxzdXVaOXNoY3V0TFI2dk8y?=
 =?utf-8?B?SXdJdjh3VmllKzNva1l3SFpxZFp1eG9CNDVHRlZNMUFyaGEvY2RUTjhHZ052?=
 =?utf-8?B?ZnN3OG1Lb205VnVPTm42Lyt3OWVGUnlqaWZHbys1MW5YM0NuMEwvcW83SEI3?=
 =?utf-8?B?VDBuamRuUytxaDRRT0VjYk5ueXprenN6ZWVYWi9jSnRPWVhQMGZYRG5vcmRT?=
 =?utf-8?B?NWVISGtTOExGOXhpeVNCMUlJMTArcGYvQjM5TWtDRE9vY2FncDdjUlhpd2pj?=
 =?utf-8?B?bUw4eVVnYnlIcmFDQWM4V3N6Q0plSzRYejcyUHpPMFhIWG5LTlc4b0FWYkdm?=
 =?utf-8?B?VWYzRFhPUlZwMWZBZ0luOUk3UmhkNk1lZGtRWWlRWlNaam4zWm5vUk55UXRw?=
 =?utf-8?B?NlZVVFZjeUptT2RtYUdKRU5wbjJSN0E1YmVpZWJFVDlFamNxNERUZ2dPT1Zq?=
 =?utf-8?B?a2llVVVTM3dVRjdyVGV1Y0JuRjIzazhFY3phOVIrZE45UXAwc1Q0M1NJR0p1?=
 =?utf-8?B?S0JlbExWRm9OL3h0SHNKVFNESVlPZDdVKzRXa284SVU0TFVBdi9DRnljVFRP?=
 =?utf-8?B?Yzg2MXJrQ3BGejNxRmNKZ2RrcmUrYVhISUx3OWpSWTFqdzY0YlB4Sk1XK0U1?=
 =?utf-8?B?dEtreHhjTGVqalZ3by83M3VsazYvaEtVMW14aDl4OHFtRTk4STU0SWdxdzE0?=
 =?utf-8?B?L0lML1AzOHNBYzBhR2l0OHo3WVhaUitCNzNVeURZV2dwWmk1TzBwamJucUdI?=
 =?utf-8?B?TWNNaFF1SFZ1U2RLWFVjczJhT1g4MGhOK3lUWWd1V2JqVWRwYW1oY3hqN3Y0?=
 =?utf-8?B?c0UybjM5SGtqbzR0OW96d1VhZEk0MlY2NU1SMU41V0pXYmxLNVhSdHVTTmR2?=
 =?utf-8?B?ZDdiWUJHQjVySm0yazJwVDVPcXEybEwwa2hVMlRPc0JkT2lDQTF2MGVWWDFW?=
 =?utf-8?B?QmJzN0FneEFqTGdXTWJIcVpUV2NJKy9KMDhwWkYwR05ndHNJNVZCb1R6aVdn?=
 =?utf-8?B?bU5VQ2RBanlOdXVVMm8rdHFvV0lkbGtWaEtka1p1N2ZZYmRPc3I2TXUySUVF?=
 =?utf-8?B?ZHo0TjErd3MxazdzTXU1ajRkMlVocmh1WnRTNFIzbHd1c0h6cFl2ZlpHeHFL?=
 =?utf-8?Q?CnFKxdtDhMnku?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUdxN0MzVHVJM0N6UDRLbEczT2NwVTBDcHNtVFI4NlZCQktCK0FrYUdyOUtL?=
 =?utf-8?B?bEJxQS9HbnMyYVRSdmhzZk1YeE1OZWpkMHZSQ3FEZ3FkeUdLVVVOMlNUWS9h?=
 =?utf-8?B?bmZjZi9WeHNFR0FobllwbkZYYVVCWnNvWGFCdEdpNXVha1lIRmNyUW8yUmJz?=
 =?utf-8?B?K3ova05pSHB4MlVLQjROQWxXWVplK3g1MWxJUVo1K0ZoS1BaN1VpZ1VwR2Q0?=
 =?utf-8?B?ZHdlTVk3TEFmOTNTYnlDbGNDQmtxRW5XNW91VEJSeG9ISkRmbmJYbi9hMldx?=
 =?utf-8?B?VVNmRXRrakd0dHJQMGwrdFdoRExDcWJGak5ZMy9HZ2d5Tml5eEljUnRnNUVr?=
 =?utf-8?B?QUNOUVJ5L3dNckhOazRVZmZJVWdja3hLS0RqL3hhMHB1TEZncFJiTUNYaXhD?=
 =?utf-8?B?c0RFdndnaGpZRi9WTU81UFFnc3JRbkVtK0cwbTE0Vm5PclR2S1NITGlWNGdO?=
 =?utf-8?B?SWR5aEsrZkkxbUFKTnVOUE40ZlY0bVVvZDNLeWZCZVVSTnBDbnd4T1Jnc1cy?=
 =?utf-8?B?YXlmY095S0xmN0dldXN0RWRTa2xQcmsxcXBVL0taTnNSY0xIaGViTE9tRC9D?=
 =?utf-8?B?aDU2NElwSGpNOGFEMzVHNTZSQWJ5cEF3ZDg2TkhzRTU5TlRsMWhXdlhWTFJs?=
 =?utf-8?B?bWJidDR6cGZWOTJCNDRydkRWSjNXV2sxamh1OHQxL2FHbC90d2RkVUJCNXQ4?=
 =?utf-8?B?eGdmZldCY3hvMlAyNkptenlhMVRRL2dSOURkWmxSQStLWGpnYkIxd3dzR0E1?=
 =?utf-8?B?aFJsSmlpUi95ZWppNGpuaCtWRUJJM0RJdTlOMnN3ZGE2SXl4cmhwblcxdFRn?=
 =?utf-8?B?NmswdlRpWi9WdUx2dXB6Kzc4S1FHbXo2YXVySm9MUk1uY3hnLzRwZnBaK2dy?=
 =?utf-8?B?ZU02RTlsMm80c0xZeUhvZ3U1K0RYTjBHWjdTSkFnQ2FZbjRCSFRCemlDc0Zy?=
 =?utf-8?B?VVlnWUF6aCtKaW00SmhGZU1VOEJndFFWbHdYZDlZNzRTWGYzVHFMMW1KSDVl?=
 =?utf-8?B?S05XTDMxdVl6ekdLRk9lYyt1OGhUZGI2T0FzUUFQNkZmTk80NjF1S3ZzcGs4?=
 =?utf-8?B?TmFEa0FGRXY0V25kTzFaU2xad2RuSFFXbHlkUE9rZXFka0VnMG0ybThIdWhK?=
 =?utf-8?B?dGlaL0taUnZ1NTBrQ1F3cGdJbDY5MXJPVUFxdDZpclBrRmoveHQ1ci9RNnNj?=
 =?utf-8?B?VXVpL0EvTEZxUTgwazNYK0xVOWw2djhKblNWeFZCdXB5Y2RjUHRhL0ZnVkFT?=
 =?utf-8?B?SXRsYkt1WDlmc3dobC9GMXI1UExUMU5tYmR5L29uZjN6elRSUlZ3VmhHTkhw?=
 =?utf-8?B?Z2JTWEl6WkljN0tGT2ozZmNjY2I0cUF5MGx1VS9oRkNFSzIrbjZEZ1FpQW9S?=
 =?utf-8?B?RkRydHlEWk5ZSDBiVkVkcWwxMGJpN3VHWk1Lbmdkbk1tTDQxeXk5WFo0SXdi?=
 =?utf-8?B?c1dwUkJpZGJQblNHM2xFUkVTMEVuTWk1UW5hNGhFNFFncFpob1o4V3hiK0ZG?=
 =?utf-8?B?S1FiY2VzeXZUbEZJV2IrYnk1Ry9OSURtTW1VSjFFUWY2c0FiSTZSb1VSWVdO?=
 =?utf-8?B?czBleTJGK0drK0wzZDhBcjJocm5WSE5zK3ZHQlZpaTAwUS9NTVEwd21YcGZD?=
 =?utf-8?B?WDl6YVQ2QlhrYVR2RkEwMUNZVzVoYU1McUZ4YVF1MnpVTWo4RnhXS0FkMTVo?=
 =?utf-8?B?TGExa0hZQzR6bXBwRi9HVWMyNVNhZ3lyTFRaemJXWFU3SHh5QlZOK2Zqajgw?=
 =?utf-8?B?WWxQTDR5c1BPZGFrbnJvN0RVMk5UTUY5dnNJamh5OFB3Y0NCeTR0blY2bVNR?=
 =?utf-8?B?ZjZWSzgzaFJHR0NSTkZQT2h6V0JEU0Z4blR5WUhOd0VIZVBhd1dNek1KbVZT?=
 =?utf-8?B?NDBwdEo2VlZ6V1d6Z0NwMTNqWlhKS0YxZ08rMjN3NnpWQ3Q0a2k5dVZGZFk4?=
 =?utf-8?B?YVIxQlAzWitmT0xEeHAvVVNTb2UyTGdMa0M4K3J3bnFLZU5TUmlZa3ZxY1B5?=
 =?utf-8?B?aGt3Wkd4V3h4TUVhbTRNQm82eXFSREF5U3RNN2Y2dkxmdEVHWmcvcnVKN012?=
 =?utf-8?B?L1Y5UUc2dGVjaGFzVlZITkF6Tk51eC9ZQzExRCtzQnA0NG5PUHVUSUxaWW8w?=
 =?utf-8?B?T0FMQW1iNHluR05yZytoNk4wU2lKQ09PbVVjUVgzTkFJeDV5K3VPemxwdDJQ?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d793ddca-67ef-430f-590c-08dd55c3e45c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:43:19.7991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SysEnqK9XHb8eJMk283y4DSE+eE3xqa6xyS6fdwuudOcnXOhWd2FYY3i+7LmlH85I5Q+GWbboRh9NRdAKPB0nY5eG8BiBP2VPUOj2od2T8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

I forgot to port the r-b that was given by Alan in v3 (the patch is 
unchanged):

Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele

On 2/24/2025 4:31 PM, Daniele Ceraolo Spurio wrote:
> Align with kernel commit 41a97c4a1294 ("drm/xe/pxp/uapi: Add API to
> mark a BO as using PXP")
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   include/drm-uapi/xe_drm.h | 123 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 121 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 08e263b3b..f0a4e0a3a 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -629,6 +629,39 @@ struct drm_xe_query_uc_fw_version {
>   	__u64 reserved;
>   };
>   
> +/**
> + * struct drm_xe_query_pxp_status - query if PXP is ready
> + *
> + * If PXP is enabled and no fatal error has occurred, the status will be set to
> + * one of the following values:
> + * 0: PXP init still in progress
> + * 1: PXP init complete
> + *
> + * If PXP is not enabled or something has gone wrong, the query will be failed
> + * with one of the following error codes:
> + * -ENODEV: PXP not supported or disabled;
> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
> + * -EINVAL: incorrect value provided as part of the query;
> + * -EFAULT: error copying the memory between kernel and userspace.
> + *
> + * The status can only be 0 in the first few seconds after driver load. If
> + * everything works as expected, the status will transition to init complete in
> + * less than 1 second, while in case of errors the driver might take longer to
> + * start returning an error code, but it should still take less than 10 seconds.
> + *
> + * The supported session type bitmask is based on the values in
> + * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and therefore
> + * is not reported in the bitmask.
> + *
> + */
> +struct drm_xe_query_pxp_status {
> +	/** @status: current PXP status */
> +	__u32 status;
> +
> +	/** @supported_session_types: bitmask of supported PXP session types */
> +	__u32 supported_session_types;
> +};
> +
>   /**
>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>    * structure to query device information
> @@ -648,6 +681,7 @@ struct drm_xe_query_uc_fw_version {
>    *    attributes.
>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>    *
>    * If size is set to 0, the driver fills it with the required size for
>    * the requested type of data to query. If size is equal to the required
> @@ -700,6 +734,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>   #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>   #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
>   	/** @query: The type of data to query */
>   	__u32 query;
>   
> @@ -743,8 +778,23 @@ struct drm_xe_device_query {
>    *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
>    *    is uncached. Scanout surfaces should likely use this. All objects
>    *    that can be placed in VRAM must use this.
> + *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this object will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. Objects used with session of type
> + *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP invalidation
> + *    event occurs after their creation. Attempting to flip an invalid object
> + *    will cause a black frame to be displayed instead. Submissions with invalid
> + *    objects mapped in the VM will be rejected.
>    */
>   struct drm_xe_gem_create {
> +#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY	0
> +#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE	0
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> @@ -811,6 +861,32 @@ struct drm_xe_gem_create {
>   
>   /**
>    * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> + *
> + * The @flags can be:
> + *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special offset
> + *    for use in mmap ioctl. Writing to the returned mmap address will generate a
> + *    PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
> + *    to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> + *    instruction.
> + *
> + * Note: The mmap size can be at most 4K, due to HW limitations. As a result
> + * this interface is only supported on CPU architectures that support 4K page
> + * size. The mmap_offset ioctl will detect this and gracefully return an
> + * error, where userspace is expected to have a different fallback method for
> + * triggering a barrier.
> + *
> + * Roughly the usage would be as follows:
> + *
> + * .. code-block:: C
> + *
> + *     struct drm_xe_gem_mmap_offset mmo = {
> + *         .handle = 0, // must be set to 0
> + *         .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + *     };
> + *
> + *     err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + *     map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> + *     map[i] = 0xdeadbeaf; // issue barrier
>    */
>   struct drm_xe_gem_mmap_offset {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -819,7 +895,8 @@ struct drm_xe_gem_mmap_offset {
>   	/** @handle: Handle for the object being mapped. */
>   	__u32 handle;
>   
> -	/** @flags: Must be zero */
> +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
> +	/** @flags: Flags */
>   	__u32 flags;
>   
>   	/** @offset: The fake offset to use for subsequent mmap call */
> @@ -906,6 +983,9 @@ struct drm_xe_vm_destroy {
>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>    *    implement VK sparse bindings.
> + *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
> + *    reject the binding if the encryption key is no longer valid. This
> + *    flag has no effect on BOs that are not marked as using PXP.
>    */
>   struct drm_xe_vm_bind_op {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -996,6 +1076,7 @@ struct drm_xe_vm_bind_op {
>   #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>   #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>   	/** @flags: Bind flags */
>   	__u32 flags;
>   
> @@ -1087,6 +1168,24 @@ struct drm_xe_vm_bind {
>   /**
>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>    *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
> + *    CAP_SYS_NICE is required to set a value above normal.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue timeslice
> + *    duration in microseconds.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this queue will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. When a queue of type
> + *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    Given that going into a power-saving state kills PXP HWDRM sessions,
> + *    runtime PM will be blocked while queues of this type are alive.
> + *    All PXP queues will be killed if a PXP invalidation event occurs.
> + *
>    * The example below shows how to use @drm_xe_exec_queue_create to create
>    * a simple exec_queue (no parallel submission) of class
>    * &DRM_XE_ENGINE_CLASS_RENDER.
> @@ -1110,7 +1209,7 @@ struct drm_xe_exec_queue_create {
>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> @@ -1729,6 +1828,26 @@ struct drm_xe_oa_stream_info {
>   	__u64 reserved[3];
>   };
>   
> +/**
> + * enum drm_xe_pxp_session_type - Supported PXP session types.
> + *
> + * We currently only support HWDRM sessions, which are used for protected
> + * content that ends up being displayed, but the HW supports multiple types, so
> + * we might extend support in the future.
> + */
> +enum drm_xe_pxp_session_type {
> +	/** @DRM_XE_PXP_TYPE_NONE: PXP not used */
> +	DRM_XE_PXP_TYPE_NONE = 0,
> +	/**
> +	 * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content that ends
> +	 * up on the display.
> +	 */
> +	DRM_XE_PXP_TYPE_HWDRM = 1,
> +};
> +
> +/* ID of the protected content session managed by Xe when PXP is active */
> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
> +
>   #if defined(__cplusplus)
>   }
>   #endif

