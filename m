Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94974D3B7DD
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 08:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6F910E11A;
	Mon,  8 Dec 2025 08:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNzC4Vph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4D810E11A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765183184; x=1796719184;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=InR5ILWaCcnQpU0wPYjrHqZsY2u8tpNN292ebLqz+LA=;
 b=DNzC4Vphm1wYxLvfTpIT0zpgWPNcXBFMlnT7Q5qbTmDlaU9mbCe5qm1N
 N37zdmrLB02zmMftX+GG4VeAl2/pO8Wgd4+yjXqOPtU45Ls9lzI2s+qAU
 I4ZpWJ00vD2B3T2qozpj0xKeQOT6odqw3jpL9C5MometenjxcNixn/rnZ
 OidzutdJ5pybd+sjxortFYgQ4s6S78ZZfjjGp5w9A9fw+jd9jUGDKsZCh
 xLC9xDA/ngNrmG+SjD460ctUayEw7lhUus6iGdLiZk52ds8Ta7GyTCdXB
 onXBzlCKZjNPrPwDGNh0kXpNIN2ZWpLzRTmss+MUr6hpduyV0mZeyYPzJ A==;
X-CSE-ConnectionGUID: 69QQnskWTkG8woYYUi3VLQ==
X-CSE-MsgGUID: G+f4KCsmQ0K4IBTCvu0NSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77804405"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="77804405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:39:44 -0800
X-CSE-ConnectionGUID: 2eww8LiZSJuS81dZ1VLHzw==
X-CSE-MsgGUID: enb1QRQMTlOUzRZX5X7RZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195783465"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:39:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 00:39:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 00:39:43 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 00:39:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGtdXDLj2nTtXSeRcCgN6FKTUwqOgRuK9pX8ssAP7R3GpHuwBaIbjy0gDLO/foYwMTI0Eq0NO/3lGC4ej6RS8o/dl8ZRJo+K798jw2FysQAys/UrLzYyCI+PH7YL15Y8leKFbniwbAfUOokULFkeknMlZXGU7JTCm4zDZSb1NGEPYcw+5ePcJ9AElT0GqvUMK8BvAAsx15uPVOj1DwuARro57vsgETS8++fetvDoC3h8kmzAwynRgMcBsfW/ZrRNnvIyei3nehhTnCvPUFNy9eWNL/epk4PuS5MAn8yWOP/QKsWH9kS4erVOZlU4RGmCk1knTcXqkcbnUIZr+gm8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVsp007ampsfpVjcnXCp7qzK0IzIgTfcOUiTm/ROI9s=;
 b=iiySb5SkUHbHhl238j5cPPswbSogmL2WKAaYWy6frfHBcN+Ga7QGYOxKxg2VaGjne71cOfo6kDz5HUgiRQiRKlmEMU2NZYl45NlqfsXWOAf1VYTb/7bq9YsO4vW4u1kxD5G74fxff2+74ojKwAeFe16AuKWHIStDvjCw0RkmYpxON3haFus2nes40Lj6Cl2DiE+Z4eXqdnVSypeMMJGVQb9E0F6YNIiBAWgNB4VrBxVEOX9RVe+aIgFr/P2SPhcta8FKI9Fw1wGJeABa5196lsA/wF6X4cNxHTb8uTqTgEeK4+Y9nluZbM0RVzAKA91HDB6ottsxWNTCgSaDom4RJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:39:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 08:39:35 +0000
Message-ID: <ee4a7c8a-c6c7-4e99-9822-273cd590eaa3@intel.com>
Date: Mon, 8 Dec 2025 14:09:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_prime: Fix display pattern for xe
 discrete modeset
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20251205085944.1037410-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251205085944.1037410-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0135.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 362f8811-364e-4650-7668-08de363550b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnlHS0tweGgxbkM4UHBRZTR6NXdEdVduT0FCanQ4SXdMRERZOGE5UFZDYVlN?=
 =?utf-8?B?V1RJZmVSekhZWElSY3hTK1lZQ2RLbVlIejNKaWZNeERWak1aaWx3bDBqQThn?=
 =?utf-8?B?amsxTkNVVVdjRXZxZ2tUbUVWK0UxTmtTSGRwbVUzby9tTHZNRkRYMG9LREhF?=
 =?utf-8?B?bVorcDI1aDNBWUJDbzdPQ0tpOEJaZ3FLZVBWZFZESm9QemRFZzA0cWVGZi9s?=
 =?utf-8?B?OGczMXozdHFBQktDTUJPYUxWdmVhckMzMHN2UkZNL3NDOGFlY0FjZ2JWQ2Zw?=
 =?utf-8?B?bDd1YU40Z1VpWWZHQlBNZFpyeDdSeE9jMUN1OTZVZ2RtOTVhb2xMNndqYTg2?=
 =?utf-8?B?SjNOTFJxbFNxaGVxeU1lbkhuUU56RjRqZ0JjMUV2ajZvVE1SWDZxclRtM1li?=
 =?utf-8?B?SkV2YUxIVndIV0l0ZWdaMVhFcldZSmZGT1pCSWZ2dForcmNZYWxhT0RzUWZm?=
 =?utf-8?B?Zkk0aHoya1F3aHE3WFZBcXRIeWFKV0ZwZVY4WVNZOFl6UEM0U0s0Y24xU2FM?=
 =?utf-8?B?OEhDVzZlWk8ycGFBdHg4a0xCR3JtaWxuU1V3a2tmbmNvKy84eUM5TDRTbzBD?=
 =?utf-8?B?UnBQTEVzL0N5aTVnZS9yMWlEOVQzYktnVnAxVUkzT3ZCbkM0c25BYjNienVP?=
 =?utf-8?B?akwwL0MyeVM1NDUrcVdQc0c1bHdtRzN2V1lHaDR4YkJOVjJmMGY3ZjNlTk5E?=
 =?utf-8?B?bGVPa2hObFN6Y28xWGVqQVdUcnVkRGl1cGNDRE5aSEdWNmRKM1EzVTZ6QmN2?=
 =?utf-8?B?Z0ZWU3dWQlMycE9GbHZYYmN1bC9TdTVtME5NMVlNSEsxZ3JJSHJrWkFRUWk4?=
 =?utf-8?B?M3NmSTJHZ2hUVVRzaGQwWUpUdUxjMGhWaEo2TGJmY20yUkhoS0lpYnBGK2Q0?=
 =?utf-8?B?S1FBanRCZjY2WkkxTTY3NGFyVEFXbjVSa04vSlBRTXRJMlNuS0NJKzhwSWx2?=
 =?utf-8?B?cUt3cHBkUDYvR3J0cnQ1UGp2aEQ0YXhFYXhSRkUvOFlpM1gwZkVRcE9sZHhn?=
 =?utf-8?B?TjRFSVU3UEJLOWlzcDhCOG1mZFpGOTdsc2FHclcwdkhOWjJoalZ0NHl6MGt6?=
 =?utf-8?B?QVcvdVcyU3QrZ25OYm9lN3BGOUovcE1zdjZrOWFVbVV0cmo2QmZBR3o1OHE4?=
 =?utf-8?B?VUZyUWJRUVZsY2RXa1Vad0V6V0RyWTE3V09qaFJtUXN2Y05kakFRZVlkSHU4?=
 =?utf-8?B?YnZDUWsyZUZFV2NxamlGbFlwK052ckxxMHl1bnlkMlB0cTVTSWhwSkxvcUQw?=
 =?utf-8?B?S1NSNEhvYzNUTTlhbWR0U0VSZWdGOThPaUFBWGZkZVJJYWlGaFh3OXVscFJv?=
 =?utf-8?B?aUpoY2ZsbWo5aVNVeWZRbzdwNmFTMWhVS1F1RjJUK0p0WG1kU2g4VklUTjVL?=
 =?utf-8?B?K1YvYktkL3BPZEdObi8xa1N3WkxYK1kzQStoOE10WXpSUGY5d2dsYzZrTEV1?=
 =?utf-8?B?cEUrSklZMDhmNEprMUlDbHpkV0s3dmh1cFpYTFZjd0xoc2hrS01MTnAwcWRR?=
 =?utf-8?B?T0RVUmNrMGR4TTNOVW1GeUZsejRwbFNBbVVxTlp4MC9sMjF2Q3FYZGZlSWdD?=
 =?utf-8?B?RjdlNitSQ1AzWmd3N1R6SjRxMUtXR25yZGptWnZBTHRXZVd2K3BGVnc4QSs2?=
 =?utf-8?B?YWVZRGRsYTl0MkNoMXNINWRmbGxNV2o3ZW1CME1FN3hoWjJ1VXJiOUkxRGN6?=
 =?utf-8?B?UnVHMDRoYjVsdDhIa2hBM3hwVGlvVE1aT2xpT3dHVEtldWVQYXFnZjR0S1p0?=
 =?utf-8?B?MndQM3labHN4UTZjNkJVbk95LzJsZkFuL1dDdGVtT0Q2MnoxUnFCaXFZY3hJ?=
 =?utf-8?B?QlFndUg1ak1aOWUrWEVGUm5hUnJUMEJmdko5aGllOU5NRG43UDExMUJjV29k?=
 =?utf-8?B?YUVQd1UwTWNCWHB0REVqS0dia1ZEalpDenNZSnBTcmFXckVsMHc0dHBKM3pE?=
 =?utf-8?Q?0+CZVCdHZT6MhwWUuB9BCbHdAnnOjCIe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHRHcDllVHFLN2hJQnNNYjFaVmppTzNLMHl1bzlVMEptY3oyVDhHTmswN1BF?=
 =?utf-8?B?OFF4dGpSSFZMc25BYjREcjZlaSs5SzhOL3FWZXNCblMwLzhGcC9zUnVIZjgx?=
 =?utf-8?B?L1VDSWlCTDlKdzNDR3hodmI5NDRwZU5FbmN4TnpsNlhvaVNxQTQvQUhRNU5l?=
 =?utf-8?B?dFd2U3M2OGRHY2xjMlQ4T3ZmanlMb0N6SURGemJFMGpqNWsyYmU2OHNCTVg5?=
 =?utf-8?B?UHIyc3lhamtWTUNKdFdyRVlLNXhTQXM5RU5IZ3RFanhUbFdTb0NTTkJJVW02?=
 =?utf-8?B?QVBTMkFHQVVPelV3eE9ZNi9RUkU2cFpmc2J5UStERXFsdE83aitSVG04ZzMv?=
 =?utf-8?B?TkhrNXJRRWVKeDh5SFROQ21Zd21GZTA2elVLUUg2cURSUUNWM2R4LytTUXAx?=
 =?utf-8?B?ZGNwK2J4VjdFM1dDZ281ckp3ZXZHRUIrVVB4akxPaEVyencvbm14aTYwWlph?=
 =?utf-8?B?M05xb3lyeklzOE0yVTNUZFB0b08wMGl1QTJkS2ZqWlJ3S1h6YWEybExLWlFD?=
 =?utf-8?B?bmYvMHBTRHpLdU9SV1IwRHhoZGxRdlZwWG83eGFhbmhIMDRwM2FZdWVPVDZy?=
 =?utf-8?B?a0c0NjZIYm83YlJaT3hWeFQvOW1PVVFobnJCVHI0RkdYVThhNnhXaEN2aE9O?=
 =?utf-8?B?UHFmK2x0Mjl6T1NFSFl1eERTa0daWDl2WXpZMjVkVU4wcXh6aldwSlBQSGg2?=
 =?utf-8?B?WXQvZ3puOHFoNGxqRlRSZUtBZWtqU2ZFY1JxTGVFdHRpUHNSTytFYTV0cVQx?=
 =?utf-8?B?RzI2aExNUzNxWEpidkZwM2l4UkF0TDZ1OW5WbFFDWlVnQ00wOUJZeXVlTG1Y?=
 =?utf-8?B?VmZ5eUNLOXFJN0tFZWZ3cTEvYXJHTXgvVUhtRnluMzRJSFVNV3VsZ1ZhcnpJ?=
 =?utf-8?B?bUdubldoajFabkVmYWNXOEdEMmk3U1dPaEhyQjRCRWw0Q21ocnFEQm5VcWMr?=
 =?utf-8?B?YmhHV3dUbWFhOFh0anY1bXE3REVuUHhJM1M4aW1mMk1hWm9sZlY3SXd1Z2x1?=
 =?utf-8?B?UXE1MkxZVkgxcm0zcnh5RzVKbTJJVjY0bjhBQU1WWlh6V3JkV0NBS2VRd1Ez?=
 =?utf-8?B?VytPUTNPUDJBQzBGNTBFRm1JKzlCUkpPSHhlemcvWmVLcURtTHVUamtiRXVr?=
 =?utf-8?B?VWp5eEU3S1R1RkFBT3VOYmV4N1FKMDFFZ09hZEVMQTU5VldaWEhYK29yRy9S?=
 =?utf-8?B?eWFBc3BxdHlOVVZ4Mzk2TlZZcktlWFpwWUJtd093YVdCWmpuRmROeWt0T3RQ?=
 =?utf-8?B?Y1dQOWx4WnNnbGduNlF3WkkrY2lZS0FYTlIrOVBqcVovWUhVT3dDcGxnRWhE?=
 =?utf-8?B?a2l5NFpBdXFwMU50WDNBNnNsYkR0TVpkRFdDU2syZDdGaStLN25aOGkycnhB?=
 =?utf-8?B?OWM3VUM1clV0RWpib3FIa21ndzk4RmJ6NSs1Q0lkbThFZU5YemMxT0lqMTlS?=
 =?utf-8?B?UjVrM1BnbE9qdDJQL3kwMHZveDZDTzByRnVNVTRsbDB5MUpFeGhNYjdKSFpQ?=
 =?utf-8?B?YjFXWmNtbytjMzF0V2liY3dGblRvRnVpbXA4S3Bzd1FLY0F5SVliR2xnTXRx?=
 =?utf-8?B?R2hILzZ3VjJrSG1EQzBuTHNFeTN2ZnFmR3hFaXNRcW10Y0l4WnlVNXJYcW5a?=
 =?utf-8?B?anlzcUhnN2Jvb3BER3dUVmhSNE9YVnhMK3lkMk1tMnZjeXhYNXZ5c05KU1lt?=
 =?utf-8?B?TU8xTXpGYVB3NUJHUXdFK3U3QkM2dEFhSkpxaE1odXB6OVZER21vTnVzM1pO?=
 =?utf-8?B?bTFWOGpPRktCSDRZUXdEeHlJOUZQZEErRXUxNktnSjFFcnZrSXFFZnlPWTJL?=
 =?utf-8?B?QnI0Y1VkOUJZSXpzWDFvNGhoWUJGcGtDckFnci9tTCtJcWV3ZEQwelNZajA4?=
 =?utf-8?B?bXZCZmJQUjEzTThKWmgvMVRQL24vQmRaT0xtb2phRldZRHplRXJrRWwrNnZF?=
 =?utf-8?B?OU9wRkN6Y05hem5xSm9CVTNjb2ZkdjNHRk1YRytoR1QxYUdsVHZlSTc3MitZ?=
 =?utf-8?B?dXd1SHFJV01KS20wcmVoK3lnS1BDalg2QkdVMnJpTGk1VitMSmFzQkJmTTdW?=
 =?utf-8?B?djZsOHVvNUZGZXBTZHpUZ0ljUFZxNTFJNExhR1FQbmZZcHlLQ01GT0owRTYy?=
 =?utf-8?Q?q1QEBzVssJbbyrWv+AFZ/01t1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 362f8811-364e-4650-7668-08de363550b5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:39:35.1538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLa8st3kWbe2VULbHMN6HiJe7YonmODI4iHkRpVlICE6j68PXjNhofX4fA6PsqaaLbDFtvVN9Lbz/N9Wmr5iEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
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

On 12/5/2025 2:29 PM, Santhosh Reddy Guddati wrote:
> Keep igt_create_pattern_fb() call in test_basic_modeset() XE discrete
> path to properly draw pattern into the framebuffer. The fb remains empty
> and pattern is not displayed on screen during modeset on discrete Gpus.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_prime.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index aa3cc386c..4e486a1b0 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -491,6 +491,9 @@ static void test_basic_modeset(int drm_fd)
>   				  DRM_MODE_FB_MODIFIERS, &fb.fb_id);
>   		igt_assert_eq(ret, 0);
>   
> +		igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &fb);
> +

This would be overwriting the fb created previously using the 
'__kms_addfb'. Could/should the 'igt_create_pattern_fb' replace that call?

Regards,
Karthik.B.S
>   		set_fb(&fb, &display, output);
>   		gem_close(drm_fd, bo);
>   
