Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2517DCF256A
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 02:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D6110E219;
	Wed, 19 Nov 2025 02:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHF0UOVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B928310E219
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 02:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763520882; x=1795056882;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AEsLIyN0U44rAK2a/GYHBQ1zq4vh9iRfaV/13lijygA=;
 b=EHF0UOVcuNbX2saRYryN/UxK6LLS06Qpe7Fhxbe80RE2qGadhxluQV7A
 hH9cuX2ISGB6dSXIVEHAY3HLTQtVkDKss2OaQHXWkfRJApNqhPMBsEgJg
 ThksOZ37VtZEkJwkGRrVARxAp6VmQE4b3pPs23MMHKWbP8bE7CkzRigaf
 3Vodk6RLpfGwysuIWyZZkldVl6GkB5u+vLPwyYBb8phoj0attQKCTinjy
 +koh4vohL0sgR9BMrk4LYYJ0cWijdh30Si/J/BbRxUbQCnM+eFINs9i91
 eS1pssVMKo9OGhxkv8agAaELcWsvoWOwih66sR8nfcvAERv71ZSxBC6E/ g==;
X-CSE-ConnectionGUID: bk4Y5wtgRga2Lbl8izLwpw==
X-CSE-MsgGUID: guX5LQemSoCEIaeh0wroQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69407288"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="69407288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 18:54:41 -0800
X-CSE-ConnectionGUID: +oPZiWgnTnKo8hx9q4uTTQ==
X-CSE-MsgGUID: QkeuOms3R0GpyklLJ+afjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="221567622"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 18:54:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 18:54:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 18:54:40 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 18:54:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqzsGz5HcO3zdFTxbaiKW8hQtNELHWUR6p1dhEPsh/9MfLgDRjuQuagrai7MX/Qilt6bkpId/adWZCSVWKHlyJInJD38Ai1sz6XDYUMjP6j00sdNY4OsXF5pkG/NNUAMskJY4KSABOe94a5RniLgToBiet5DArFy5cUbXIlb9o6LO4NkztBaxCtEC57qIxC3xfIdaTzrlA7uHeCSmpqRuEZw2yxk7bfo+5CH/DsBZzZkgWLUaykdooxaytFK6LtPgTXpgD0u6ouIIQy/GhRTOD/4megQZhLccfynjLLXbRX584XkMSamJESzFgYaW5JuIdaSPJ6Kewu3IZdInpbzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qkfvcs/+TfalaUs1pN0YUuEi181O4+jPrnZ+9yn+wM=;
 b=Pyg5c1bS7GShk7LHCmKIp7JVqijI28ACiyj9qt1PkgJ5o101L9b3ifvcjVTRlcYIZ+TEWbqLT1w1F5nlas6nAdD7cKHDPXRP1ayI3ANJJyg34HFkGM/Qdd191HHMMhBJoH6ZcmOs7W7JariG4ierQlhgfzMQmh7t+lqdGP8qsg7xE/ni2+Lf/VULWXWdpM+02x8gKO2s54tG2h1bDt61RmgvEMSl4D44s+iNjNMn48ktzNzLfNVPZaVWKgWuR18JQMFtkV6E1B5FjDWmaLWAnpel9X0253/ew9le622mwhwvlyjL+VBOh+ys9lj7awFdOzjbkJsdUotor4DZeq9Z4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB8895.namprd11.prod.outlook.com (2603:10b6:208:579::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 02:54:37 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 02:54:37 +0000
Message-ID: <e6350066-cab5-40e5-ad59-66bbc8627ffe@intel.com>
Date: Wed, 19 Nov 2025 08:24:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Cleanup igt_require checks
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <santhosh.reddy.guddati@intel.com>
References: <20251111041505.2438654-1-karthik.b.s@intel.com>
 <20251112180933.xbhdddbkx4iikvy7@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251112180933.xbhdddbkx4iikvy7@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd71559-6ad4-49fb-ccb6-08de2716fa1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTJEa3BQditKMGxacDNrMUtDenZnbHNRYWlFM0ZuVVBQZ1lCZGtsZnp1cVlD?=
 =?utf-8?B?NWFaS3ZxelcvT1M5TWw2amZRemE1dWYyV0dBTVVuWllaU25McXdFTXlkOSt4?=
 =?utf-8?B?M2pOMjJTUlV1a3hwWVpaQTJzZVhBelUzRlFobGEvM2Q3dHBRcDdiNmtIZWJq?=
 =?utf-8?B?eTNHdFVIa3U1aXZFU2ZiVFRIakl6WWc5UExUcTd0TTBMbHBvSC9DWWt2VEZk?=
 =?utf-8?B?VHJqcTZNMjRIdFhEcjRIQjBBN0FzRkMzTVJMb2dDRXgzdzl5Wjd1NllWQlpn?=
 =?utf-8?B?cHJLclBwS0Y5Z0xML2luLytlNDFndVRTVlQ0SWNtYUF4WldkdGlCd01ZOUlk?=
 =?utf-8?B?RURPeTk0V0pqaTJTS2lyUWcwQkV1dXh1Qnhqd1cvb2ZlTGJycWdVQXVZTk5l?=
 =?utf-8?B?TFJoMUVEU2VzcWtWbGdsQjdZUFpSSnhjS1NCbXNlZmhDa2dicW5NbFMvVFZP?=
 =?utf-8?B?WVVPNjJaY0UyUko0aTZhYzNSejByTS9vZjA5VkFpR3FONmpucEl3b1R0bjJ4?=
 =?utf-8?B?S2svSUtLelIzcDZBZTFxZnB0b0c4dzlZbFdHZ0hDblFjSHUwNVA3emxoOENo?=
 =?utf-8?B?U0t1d3VVSHJ4OFdYT3RYdkY3ZTA5UHJBeG9CRlN2UU05Uk1KUDdVWndYUm5y?=
 =?utf-8?B?QWczNGFpTzdrYVlZeHBZeEV5WDI5WlJIKzJ0cTM0djZpQzlwYzdhZThTYXI2?=
 =?utf-8?B?Y1g5TDY5d3QwWjhQZlpNSVBOUjFLV2FlV051aG4waGtiVGJwQks4cVVtMGIr?=
 =?utf-8?B?MWV5OHVoTEpIUE8wRlVNMFNyaStaZjhMWXNWS1JaRUFnL29EcGJlc0x5TmJI?=
 =?utf-8?B?UTZvMjQzR2JmQlZUQUs4VDdZbUx6VmVQZnl1N3hCeHIvZVUwWGd4TWZVUUtR?=
 =?utf-8?B?S0FDdnZKMVd1aEtZUUJkUFNnQnptdlF4MXFYV0tmbHJVZlF3QTZhUXBaMkZw?=
 =?utf-8?B?eFpJNVUvakU2RFdWQVF1Y2lkQytSeHRyaUpBV0RJUFNPelFMRWNRSlh5Q3pt?=
 =?utf-8?B?dXhiRFIzQWUxZ0gvVFBDUUZaaWVEQ1JCZkVpT1dLOWZlMXA5S0VrTmVCVUZm?=
 =?utf-8?B?MFEyWDdNZDV0WjZqMVQ3ME1oWGlDZkg3SFgrQ3FDRUhyK21CdkFNQmtvSkt1?=
 =?utf-8?B?R1d6d3dpZ2ZJWklRQjZrQzU3bnR2OG9vblFTb3BDWi9rUTlUbFNZbDI1dWM1?=
 =?utf-8?B?U0REWE5FMkRjc1pRZzVKVUlINmJoeXBhenMvZjVZVWF0TWJNcVo5QitaUmJM?=
 =?utf-8?B?S09RQ0VKcC9EelRqYjA5WUUzWFVkcHJLK3QweVFWR3JkK3lNdnNndmZYdW9w?=
 =?utf-8?B?eFZnWWVBc3Y0U0cyU2R6aE1Dc0RUT3VGQUMrWG5QUlo3d0tDaS9xRWhRVC9S?=
 =?utf-8?B?cEVsZTVtUFcvanlvOGVsZnAzbUxXbkdNUm5HY0tZSU42dzFhaTVzek9mYTZk?=
 =?utf-8?B?eVVVdlQwYVFVS25XOEY0cXlNaDNzMnJTOG5wNUtDNFlnbVRBTTByTUY1bFk3?=
 =?utf-8?B?U3hRa1VFbk02TE1KeWhFTUhodVJHa1F1TlFMLzBCZ1NQTEYrZWt3cXFZcTFV?=
 =?utf-8?B?aHEvRVdJTk9CR1plMVFlRzBSWjZWS1p5Y1VIUTVod1JMUVVYSndhNjhSM0Uv?=
 =?utf-8?B?NmpxS0gycklCdm5BeDRna2JkN0ZkN08wNXZiazJzUlRKTHR4bXExRCtFRTJF?=
 =?utf-8?B?YmZiYm5mSmpBQnIvSVZWRFYrTTdROEdzWGs4RUdodnRGVlQ1UkQ5dGJvMTRz?=
 =?utf-8?B?SnZDRUxCR1pudTJqRlJXYlhrSzJXQkVNTzQ2OTl2UURlSFlRNVVUQmtuaUlV?=
 =?utf-8?B?bEQ4akFaUDZQMUNEUXY3YjdwSkoxWjRZWnp2Wk5QUVlZVUEycjhvTWFwOXlY?=
 =?utf-8?B?TnhaQmVYZXR3dkJuTUFZVG52L2JNT0RHcW4rUFNXQWdGQzZvMWNYOEJjMXd3?=
 =?utf-8?Q?6dZTEtRZPIEji5Umcr1yKShAwnfUylRz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2w0STVNNyt4VW9Panl3OXpzbnVtVnVYQ1VSbTF5L3FiTmIyRDRSME1Cc01T?=
 =?utf-8?B?ZjhRcXlQRnNtSWlrVUZwdlc4bFpYN0FUODdtNUc0ZS9sUmFmbXVFNkt1UTdn?=
 =?utf-8?B?RkJkRS9qU1VhcE9NNm5uMFM1eTk3Zi9GNzcraTYrQVU5bzk1OXVWZktDb0N0?=
 =?utf-8?B?WFh0aWx4c2w2bEMveDl6ZWNJK2hzRk9GT2Z3eUdvL2Vmc3ZpSWNVTUhPWGdm?=
 =?utf-8?B?RjEwcGM1cTB2OUxnM1FMdmpzRUQrYTJiTmFxRGxFOUoxcVI2YUxKN1AyQ21E?=
 =?utf-8?B?aHFOLzFpOVoyUk9hT01iQTFWT1NtVmhJRjhDRWJpMVIxaU9sRmNnQ3I4emV3?=
 =?utf-8?B?NlFIU2lpd1p4OFgzYk5nSG5qYVFxSWVySWgxRmd1MTZEdHFjOHlmblpaZDVt?=
 =?utf-8?B?LzI3YUdZVkVZK1pZREhvQ3Y4ZmR6Q1ZORHZJbkVDVFNvc2dzV2pITkFYMFA5?=
 =?utf-8?B?aGxQWW5FU2lSczhUWFk3anNDT0h2cklDV2xWamFuaUhLakRWUTVVR0hjYnFo?=
 =?utf-8?B?MkFkNmV0RDk0SldBQnYzNW4wak1lcjBmYTlPc0twMDlRNHh4Y3FZSWZKY3Jx?=
 =?utf-8?B?dnd3SGQ0OVZkb2dRMGFzZjNlVzZDNHhQcnZoMkM1OEpjNXEvcm96VytmSVhv?=
 =?utf-8?B?WXQwWXZtcXVlWVcxeVpodURpM0U1S0x3dUlnWVVIRElmQlV5N21BTW43SXZt?=
 =?utf-8?B?bVlwRnJNdzNGWE40a0FMK3Q0dlNhazA0V2cyNWMrMkkyUjVRV2ZvODkrOTRn?=
 =?utf-8?B?Z0UrNitlWURwWHlxUGtiK2M3QWhrYlZXYVhXNysvRDE5dkh3dkg2QXJUTzF3?=
 =?utf-8?B?Y0Y1VjdpUURaWEd6cTZFeE43L3BxcitvclhnS3hLVlpSY0MyUUE5aGV5S2hS?=
 =?utf-8?B?bFJHR0E3WGQ5eGFYck5TUjFuVnRmZmpNZjYxR1UzTHVUSmRTRE8vVllTWEV6?=
 =?utf-8?B?Uzh3ZXpONTQ1WjN3azZZb3poajJ0d3ByckI4NVR4RUNXUWx6cjc2TkRoUEl0?=
 =?utf-8?B?OVV2ak9DaktJd3ZwR0NKcFJjQ3dUdTFwdHFmRU00bFlPU3J6SEU3WDM4NSsz?=
 =?utf-8?B?S3IyNDZodFI0L0k2WW5reXlnNjI1NFh6WTQzdXZOWUJLTUNXUFVZQXR5RDNo?=
 =?utf-8?B?WjZnSWR4Y1ZtZ2tvbkF1bnBLRUM0bHQ4OGxxVnYvdXlXenNOUUpWeGIvckNm?=
 =?utf-8?B?d3ZoMmMrNTdtMlFjSzBGamdVMDNvbDYxdmhtVnBwQ2ZIeStFcHhTQzlNQTg2?=
 =?utf-8?B?ZTJpVkE1UFJuQ0ZJMm5rUW84MGlXNE1DOFhkUFdSNFZqR3RHOWdLdEppQUlt?=
 =?utf-8?B?YXcxbkVhM0pwYXV5NUFWQjZ5c0I0UndULzUxR0Zpcm5wVVpSYWt1eFd5YW9p?=
 =?utf-8?B?MnhvYzlwcU5NdDRuZHdtcW54ci9haHhTZk1rVjBjbk9pOS9VN0VJSHB1Unhv?=
 =?utf-8?B?aE81MWk5b0lOM3kvVmhtNXhlaVB1Q1kvd3NvQ3c1M1FxZEM0dmN5TjBGRDNE?=
 =?utf-8?B?RVRWZkRNOUFpTDRsRWQwTWlxcFoxbkcwMVVMVVoyYjMyK2FlUGVrZlhDS3Yz?=
 =?utf-8?B?SGNRNDJtemZ3NVZnNDdGMFdibFFKU0N6cWNIemNTdjBQR3BFQlFlaVNGUjU1?=
 =?utf-8?B?MW1tNEluRDArUUFUdzRFTTJSZkliZmNNcVdHUGdpK2NEbS9RbDVxWHlYbHFy?=
 =?utf-8?B?WEFaZmkvSm81YldFeWxMVzJsdUVkelVkTzVTUjl0ZkppREtrRU0yWlhmbStj?=
 =?utf-8?B?ZnNjZ2FyUFVGWWsrN09CWFZ3cVhtUTROKzdWS2g2VWtPWndJQVkybmNZWEFj?=
 =?utf-8?B?WSs1cW1OeHQ0RjRJSzNQdEUrMDRtVUVJUndLb21yYlBFYnVyR2NyeHlTcWJP?=
 =?utf-8?B?dnB4ZitZdFF0UUFBaWd2ZGJoOThqMmk2SUhXOXBUbm5ZSUFpYXlpcWdKekRj?=
 =?utf-8?B?S3NveVRVT09PbUNUcmRQanVPaTdDMXgrNWlVQmt0S2dZdGtkYlR6cW5WaTJr?=
 =?utf-8?B?V0U5cVBMOGFzQTNsejBpak5wRjhXcTBtZ2JBem9KNVV4cEdxRGI2elZRRW9v?=
 =?utf-8?B?V24vTjFZZGtQUmtIeW9wQ3BFY3ZmWjhDWENiWTl2ejh2eXdjWnh5QnRrY1Jo?=
 =?utf-8?Q?Gw1pcXezdInqu5SI0TLG6B7ZF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd71559-6ad4-49fb-ccb6-08de2716fa1c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:54:37.6702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzsrxv5v/mW43D1yFREx9Dn3fkL4Q0A1rV+fTZZcqnmDMNMVuFM7IPZFWzHVSMQ49WGPdNwUArCE/jOBeum7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8895
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

On 11/12/2025 11:39 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-11-11 at 09:45:05 +0530, Karthik B S wrote:
>> Both the main and invalid subtests of each category require the same
>> igt_require checks. Add these into subtests groups.
>>
>> Also, the variable names used in igt_require checks are self
>> explanatory, so remove the duplicate print messages.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 225 +++++++++++++++++++--------------------
>>   1 file changed, 108 insertions(+), 117 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index d1ddbeb60..654ff8bed 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -626,160 +626,151 @@ igt_main
>>   		}
>>   	}
>>   
>> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>> -	igt_subtest_with_dynamic("basic-big-joiner") {
>> -			igt_require_f(data.big_joiner_output_count > 0,
>> -				      "No bigjoiner output found\n");
>> -			igt_require_f(data.n_pipes > 1,
>> -				      "Minimum 2 pipes required\n");
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			igt_require(data.big_joiner_output_count > 0);
>> +			igt_require(data.n_pipes > 1);
>> +		}
> This could cause some spurious SKIPs when test before/later
> could end with SUCCESS. Why not a function with parameters
> checked? This way there will be less code and also a cleaner
> refactor.
>
> Usally require are ok in very first fixup in igt_main, later on
> it could add noise to logs.

Thank you for the review.

Sure, will clean this up by adding a function replacing the igt_require 
checks within subtest groups.

Thanks and Regards,
Karthik.B.S
>
> Regards,
> Kamil
>
>> +
>> +		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>> +		igt_subtest_with_dynamic("basic-big-joiner") {
>>   			igt_dynamic_f("single-joiner")
>>   				test_single_joiner(&data, data.big_joiner_output_count, false);
>>   			if (data.big_joiner_output_count > 1)
>>   				igt_dynamic_f("multi-joiner")
>>   					test_multi_joiner(&data, data.big_joiner_output_count, false);
>> -	}
>> -
>> -	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>> -	igt_subtest_with_dynamic("basic-ultra-joiner") {
>> -			igt_require_f(data.ultra_joiner_output_count > 0,
>> -				      "No ultrajoiner output found\n");
>> -			igt_require_f(data.n_pipes > 3,
>> -				      "Minimum 4 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_ultra_joiner(&data, false, false, false);
>> -	}
>> -
>> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>> -		     "when the pipe is active with a big joiner modeset");
>> -	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>> -		if (data.big_joiner_output_count >= 1)
>> -			igt_dynamic_f("big_joiner_on_last_pipe")
>> -				test_joiner_on_last_pipe(&data, false);
>> -		if (data.big_joiner_output_count > 1)
>> -			igt_dynamic_f("invalid_combinations")
>> -				test_invalid_modeset_two_joiner(&data, false, false);
>> -		if (data.mixed_output_count)
>> -			igt_dynamic_f("mixed_output")
>> -				test_invalid_modeset_two_joiner(&data, true, false);
>> -	}
>> +		}
>>   
>> -	igt_describe("Verify if the modeset on the other pipes are rejected "
>> -		     "when the pipe A is active with a ultra joiner modeset");
>> -	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
>> -
>> -		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> -			test_ultra_joiner(&data, true, false, false);
>> -		if (data.non_ultra_joiner_output_count > 0) {
>> -			igt_dynamic_f("2x")
>> -				test_ultra_joiner(&data, false, true, false);
>> +		igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>> +			     "when the pipe is active with a big joiner modeset");
>> +		igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> +			if (data.big_joiner_output_count >= 1)
>> +				igt_dynamic_f("big_joiner_on_last_pipe")
>> +					test_joiner_on_last_pipe(&data, false);
>> +			if (data.big_joiner_output_count > 1)
>> +				igt_dynamic_f("invalid_combinations")
>> +					test_invalid_modeset_two_joiner(&data, false, false);
>> +			if (data.mixed_output_count)
>> +				igt_dynamic_f("mixed_output")
>> +					test_invalid_modeset_two_joiner(&data, true, false);
>>   		}
>>   	}
>>   
>> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>> -	igt_subtest_with_dynamic("basic-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "No non big joiner output found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum 2 pipes required\n");
>> -		igt_dynamic_f("single") {
>> -			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -			test_single_joiner(&data, data.non_big_joiner_output_count, true);
>> -			igt_reset_connectors();
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			igt_require(data.non_big_joiner_output_count > 0);
>> +			igt_require(data.n_pipes > 1);
>>   		}
>> -		if (data.non_big_joiner_output_count > 1) {
>> -			igt_dynamic_f("multi") {
>> +
>> +		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>> +		igt_subtest_with_dynamic("basic-force-big-joiner") {
>> +			igt_dynamic_f("single") {
>>   				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
>> +				test_single_joiner(&data, data.non_big_joiner_output_count, true);
>>   				igt_reset_connectors();
>>   			}
>> -		}
>> -	}
>>   
>> -	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum of 2 pipes are required\n");
>> -		if (data.non_big_joiner_output_count >= 1) {
>> -			igt_dynamic_f("big_joiner_on_last_pipe") {
>> -				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -				test_joiner_on_last_pipe(&data, true);
>> -				igt_reset_connectors();
>> +			if (data.non_big_joiner_output_count > 1) {
>> +				igt_dynamic_f("multi") {
>> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> +					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
>> +					igt_reset_connectors();
>> +				}
>>   			}
>>   		}
>> -		if (data.non_big_joiner_output_count > 1) {
>> -			igt_dynamic_f("invalid_combinations") {
>> -				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -				test_invalid_modeset_two_joiner(&data, false, true);
>> -				igt_reset_connectors();
>> +
>> +		igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> +			if (data.non_big_joiner_output_count >= 1) {
>> +				igt_dynamic_f("big_joiner_on_last_pipe") {
>> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> +					test_joiner_on_last_pipe(&data, true);
>> +					igt_reset_connectors();
>> +				}
>> +			}
>> +
>> +			if (data.non_big_joiner_output_count > 1) {
>> +				igt_dynamic_f("invalid_combinations") {
>> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> +					test_invalid_modeset_two_joiner(&data, false, true);
>> +					igt_reset_connectors();
>> +				}
>>   			}
>>   		}
>>   	}
>>   
>> -	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>> -	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "No non ultra joiner output found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum 4 pipes required\n");
>> -		igt_dynamic_f("single") {
>> -			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> -			test_ultra_joiner(&data, false, false, true);
>> -			igt_reset_connectors();
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			igt_require(data.ultra_joiner_output_count > 0);
>> +			igt_require(data.n_pipes > 3);
>>   		}
>> -	}
>>   
>> -	igt_describe("Verify modeset switch between ultra joiner and big joiner");
>> -	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.ultra_joiner_output_count > 0 ||
>> -			      data.non_ultra_joiner_output_count > 0,
>> -				  "No ultra joiner or force ultra joiner output found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum 4 pipes required\n");
>> +		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>> +		igt_subtest_with_dynamic("basic-ultra-joiner") {
>> +			igt_dynamic_f("single-joiner")
>> +				test_ultra_joiner(&data, false, false, false);
>> +		}
>>   
>> -		for_each_connected_output(&data.display, output) {
>> -			switch_modeset_ultra_joiner_big_joiner(&data, output);
>> +		igt_describe("Verify if the modeset on the other pipes are rejected "
>> +			     "when the pipe A is active with a ultra joiner modeset");
>> +		igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> +			igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> +				test_ultra_joiner(&data, true, false, false);
>> +			if (data.non_ultra_joiner_output_count > 0) {
>> +				igt_dynamic_f("2x")
>> +					test_ultra_joiner(&data, false, true, false);
>> +			}
>>   		}
>>   	}
>>   
>> -	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "Non ultra joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum of 3 pipes are required\n");
>> -
>> -		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>> -			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> -			test_ultra_joiner(&data, true, false, true);
>> -			igt_reset_connectors();
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			igt_require(ultra_joiner_supported);
>> +			igt_require(data.non_ultra_joiner_output_count > 0);
>> +			igt_require(data.n_pipes > 3);
>>   		}
>>   
>> -		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
>> -			igt_dynamic_f("2x") {
>> +		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>> +		igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> +			igt_dynamic_f("single") {
>>   				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> -				test_ultra_joiner(&data, false, true, true);
>> +				test_ultra_joiner(&data, false, false, true);
>>   				igt_reset_connectors();
>>   			}
>>   		}
>> +
>> +		igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> +			igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>> +				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +				test_ultra_joiner(&data, true, false, true);
>> +				igt_reset_connectors();
>> +			}
>> +
>> +			if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
>> +				igt_dynamic_f("2x") {
>> +					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +					test_ultra_joiner(&data, false, true, true);
>> +					igt_reset_connectors();
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	igt_describe("Verify modeset switch between ultra joiner and big joiner");
>> +	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
>> +		igt_require(ultra_joiner_supported);
>> +		igt_require(data.ultra_joiner_output_count > 0 ||
>> +			    data.non_ultra_joiner_output_count > 0);
>> +		igt_require(data.n_pipes > 3);
>> +
>> +		for_each_connected_output(&data.display, output)
>> +			switch_modeset_ultra_joiner_big_joiner(&data, output);
>>   	}
>>   
>>   	igt_describe("Verify the basic modeset on the maximum non-joiner mode across "
>>   		     "all pipes");
>>   	igt_subtest_with_dynamic("basic-max-non-joiner") {
>> -		igt_require_f(data.n_pipes >= 1,
>> -			      "At least one pipe is required.\n");
>> -		igt_require_f(data.non_joiner_output_count  > 0,
>> -			      "No suitable non-joiner mode found\n");
>> +		igt_require(data.n_pipes >= 1);
>> +		igt_require(data.non_joiner_output_count  > 0);
>>   			test_basic_max_non_joiner(&data);
>>   	}
>>   
>> -- 
>> 2.43.0
>>
