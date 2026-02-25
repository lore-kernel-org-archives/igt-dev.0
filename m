Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8B2EFD20E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 08:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5563210E70E;
	Wed, 25 Feb 2026 08:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLMgaV+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B0010E233
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772009518; x=1803545518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HoRbhvR8KxXxDXMJCkfr4TZfshmBgcAtDZ3tj+4QbcU=;
 b=nLMgaV+EJb/SD4XR8w7lUcfx10mha6+vaB3mCfMq4UEHkoOXBMX0Bkve
 8Q9oIArzTW2OhDvYrwctucAK3z2A6cCHweuv8Iw0ybOiRsVHSVq2c0eje
 OtIlGfCYhjYDCWEy/vzn1AxvRNEBi/YbN9rV/Xk9ljkU9A/mZ9O2LVNyx
 lnc/q2naCC8IHoaSJmrNDsr9r/v4MiZ9pK2F5jpf9Efb5nRnW4IARryCk
 XEXAAPf16F1RV0kvazJ4WH8qU9IetvaTewGrcwe6NW0KtyrkqYStbJr3l
 gNEQs+s1/pXLuhTubjeNT48xsvj4wrbJqLhdnus47ipbGNMrf3G4pyEhs g==;
X-CSE-ConnectionGUID: D5zm7be3SCmXI9Fvt/uvbA==
X-CSE-MsgGUID: h3Llf9A9QkSuPGsMyDFi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72917765"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72917765"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 00:51:57 -0800
X-CSE-ConnectionGUID: y6pJzEuhQuGwGG6ThOY5RA==
X-CSE-MsgGUID: 6BuZA4o9QEWV7WsL+0TYPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215280368"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 00:51:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 00:51:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 00:51:56 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 00:51:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjppfMYSzBmQBySY61RXUoaqEu6nev/Mx7NDt3UXO9sJhNNMSxyQRwjmDpU+cH9D6r0E1UCYf8Cps5Ay/2TPw//5YY3xkjPsEqcLPXwmbkOQpnw/fvIhpCcTOJeKnRZU/sdGOpyFL0u9N9G+ZJGu/edl8hqBXDZrIMCg+ue87mDrsZG/gJAu4ZXB9uOArelaCs1cgsy+BerIFJTER4e/Pedt3ZzBr/tryzhwOcnCWzcH84ujLfSDIAoqHKq7ePlsB7tijmz7WSOKNR+xhSOGnndR0UvRnkgyT7QzNzstY3P4IioqcwUWLBUDlzBtsj4mdXKHJDQHay5yIEQzeSWNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzukZrIrER5iv38JMbCB3WiRk1TE4bYv6wvXA/c01Co=;
 b=eWa58l5zbnGWJvefhBLJmA8m3+aB+uNaw6UumAOEKUNqoFxZmRRHKBzmUO6HbJs9qUjM4DI/2EvZ9AOTIIoP0GUM378LLacAAA/u//ASUL0Avt2N81ehxMYxPCfMhUMpEkd3so2mOaNhfbJDRZ3sUXMggm4WRaC1/UivOtcBWJ74KL+Bs/TQH8CrpLTrQi4JrkBmmzQTU80kVVqV1UnNQ0bbbkZbhnY+zjekj1JU7EHDApBfca12yBp93Q+sNfHyQAC6U10px8t5Wd9V7KX3/S0IlM8Omm10o40aOwKvOQIt8t27+5h8/Zlt7mqgcsw0SXujz/AJ5n83x70L+hy2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by LV4PR11MB9466.namprd11.prod.outlook.com (2603:10b6:408:2e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 08:51:54 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:51:54 +0000
Message-ID: <bae3e7d4-4f8c-4331-bbca-92b823d24154@intel.com>
Date: Wed, 25 Feb 2026 00:51:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] intel/xe: use fd-based graphics/IP version helpers
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Ravi Kumar V
 <ravi.kumar.vodapalli@intel.com>
References: <20260122071530.1629046-1-x.wang@intel.com>
 <20260122071530.1629046-4-x.wang@intel.com>
 <20260204185601.GY458797@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260204185601.GY458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|LV4PR11MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cad704-13ce-46b5-724b-08de744b1fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWlKU09kTWNyd0VmRUE4WkJrOGMrY250L1c4QkFMZWtCQk1tRTY5NFhpbVlk?=
 =?utf-8?B?ZkxoS0htcXMxS3krNWgyM3M1TURpRmdnOFNLaTNSYTRnR3BxOWY4YkdKbHF5?=
 =?utf-8?B?TzhwZkhPRFhTRlNKeWFiMjdGT0ltY1JWVlBPMlRUeFlvRmFkUmNmd3hSS0FP?=
 =?utf-8?B?SHVVZ3ZBT01VMVlxaER6NGRjUHdIRDIxL1VyamFkQThZV1N6am03clIvYXVz?=
 =?utf-8?B?cC9VWHUxc1FXVWNxeHJiVHpjS2NWcEUrN0s0VGM3T0EvdHJQOEwydmJzZG1R?=
 =?utf-8?B?NnNUUGliRDFrSmxFOW05RGpudXlGbU1XUC9Cam84SEFhdTcya2d1TnNDT0tJ?=
 =?utf-8?B?Q28wMmhpdTVQS0daL25iQnZFTjF0bFkwU2hEVEl1eHBkZUtJMGVJeUFXS2gx?=
 =?utf-8?B?T3F1UVdpSnhZU2FVZndHMTBxanEvajNYUFA3S3BWUGVEV1I5RGJxb2pwN09z?=
 =?utf-8?B?U0toQUVBZEpCVThHa08wV08xYitBVXFkOVVOaEVEMVBPUko3Z09IZ3MvaEpR?=
 =?utf-8?B?a2tVTmZWQ1RlTm96RjIxU3IvUFZxTnZRcWdKL08yc2wxcGlKRkdIb0l6UEtN?=
 =?utf-8?B?K3J2a0lwUElnL3hURDdFeEx3T3lacWJ1QUlDNGUwYzh0clJadXN5Qy9DcG5k?=
 =?utf-8?B?cXhMZTdOUDZBajBtRnU0cWcxSnpoMHdyZUttQVFjTjU1dm44V3A0bTVFMFl5?=
 =?utf-8?B?MG5DTmdMUTl6YTdUMFFkWWZxeXYxbDU5Q0t6a05hcUhDUzVHRnNDZWxWd01H?=
 =?utf-8?B?NlIrUG0yRDBkZ1ZCYUxYZU5aVDdBL0N2ZkZkejB6NCs0b1dVbDRRUXhoRkpk?=
 =?utf-8?B?WjB2YUJadVpMVmt3R1BCY0h0dS9wYk1pbFRldlFpazBlRnh3T3JsQk9CdVJt?=
 =?utf-8?B?MEhoZEJ6emNoN0dNNVlJejRubVFvK0dxb1hRdHZQVSsxZ1FDOXFYSmlxRmxB?=
 =?utf-8?B?cnNOYWJsc21oUE80dUJKS1BjTkd4WDZsNmNWVmRIZ1RmN3RxU1NueHRVUFB0?=
 =?utf-8?B?NGhqc1VtSjQyMzk0a3BPNzJ4U3NTalhhOFhCWEdLVHZ4V1hCQnZHeDQ1blFl?=
 =?utf-8?B?dEh4b0NwUWMyVkFJQzQvU25yTzFDNndQSkhkTklYUVl2eXBvdDBaVmJ4aGJr?=
 =?utf-8?B?N1hOcEVvbVlGL2dNaDJjbzBGRXdZQUp0Uy9hWTVmREV6L0xNcU5CT2NZRHZh?=
 =?utf-8?B?dzVyN2xiMDVjKzMrUzZ1c0ZZMW8wejI0ZTZ2d09EaWVNM0tTUnVnaVdxeG45?=
 =?utf-8?B?elBmL3gvYzlHL2h5TW9WSmhiMGVGYXo5U2svZjJBTUpheTRvQk1sV2xJRnp4?=
 =?utf-8?B?Nkt6cnRPbGI4Ykl0NzRXbnUyckNteFRKL0ZlbmNOeWxRZU1kT3NXNGRWc2M5?=
 =?utf-8?B?RTFDUzNzYm5XOWpXTkFKYVNLanVobGhxWCtKaE5ibXRTREc5ZTd2Y0VFV29T?=
 =?utf-8?B?c2lJR2w5V3ZUaDBXWHVkbldPWDZ0Ync3MkloT2VyVjI2Q3ZVVjcxUjZWQ0dw?=
 =?utf-8?B?d1FmcjdRZTVoOXNhWW04RG9Nd0E5NVhYRnE3eWdzQ013NjN1VWs4ckI1RHhl?=
 =?utf-8?B?VkdGcGQ5NHNyamI1bVJQVE9zd3VXRS9jTUthUUVvSGVCT05rTXhMcE1sSGhO?=
 =?utf-8?B?NkplOGg1cExVNTNEcTdXd2N2bVlRTUJ6clFKR0RmRDVpTFFsbUlzMWhvWHpl?=
 =?utf-8?B?ZUlMYTJMM1VwYldodHkwSFdobDM1cHAwRkdxLzcxWk9MN3I1L2tVUVYzeVQ4?=
 =?utf-8?B?TG14MVBVbkN3M1dHZjMwRTZqdWF4V0dKY3NlZ09FMGRSTXVVRStpVFZGZHdu?=
 =?utf-8?B?NkpMci9jSzJ6ejdVTDgvNmZrNzBBM2V6NXBWaURlOG5lVmtKNmxIVFN3K1JE?=
 =?utf-8?B?dGFpUUZlRE5yWWpPTjgzV2xSSStZdE90emRWV1kvZ3ZzcHVXZk81ek9kL2ky?=
 =?utf-8?B?TlcyYTNhcGxJcERHODREaHViRGdPNjRFandXV0R4MEdDdC83WkVrNkdxQlJK?=
 =?utf-8?B?L2pkTXhmTjNUSk9zWERBVG5Canp4N1ErYzUyeEhXa0pOYVNJOGNQK0c3bGtV?=
 =?utf-8?B?MFpCejhPSFUrWm5ZVzYrek5HTXpUaG1Sc0xzbjdQenMzc2dnOW5scmtTQWxy?=
 =?utf-8?Q?xNIw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXVaWERWYithUW5vOUZkWldwZFVvbDNCa0ptdnJLMzVsZVlodnRnZ0o2RnNK?=
 =?utf-8?B?TEo4K3hHc2ZGMHYzeUg2RHRUaEd3dHdNc2tjSU02ZmhoYXV5RGs4cnl6VUZj?=
 =?utf-8?B?Q2wxdlcwUlNSYVE1Q21zbXMyd2xaRzE5VUxqYUNaRHhWckk4djU5OVlnOVRz?=
 =?utf-8?B?cm1SaFJRMm9oT3lTc3ZBMW9EdllBeXNnckRUOHdiVDhqLy9OblExRERlb2ZR?=
 =?utf-8?B?dlFrSk9mbHNETmFFV3dQcUJIS2xvejFTUDI2V2JCRjZFMFJlTi83V3R1amxN?=
 =?utf-8?B?cnkxNlIvOHhvYjhlMy9IR2hCSDdjVUdldUc4c1N0MDNLTEJnVEpDVjkrN3VG?=
 =?utf-8?B?TXJldGZpZjh1bVR0L3dYNHoxTlpTMmZvUk5nTGJMekNYMVdZYWgyYk1VLzd0?=
 =?utf-8?B?Q0FXTVhlYndCeUd6OGJ4dE5SYUVwYXRBVlVmSERpSHByN3NXQ3JhcE14OWdK?=
 =?utf-8?B?S3FZUjk0dEFkaXpEM2NPTnFEMzhzd2ZYaE5XMkhiQTQxZlErN0VPeDRmZ0FI?=
 =?utf-8?B?eDNQUHdiL1FwTzBkKzJKNXV2VkZPMW4wZE10YmR2bDV0eTVKTEFSK3U3TVAr?=
 =?utf-8?B?YzRnL25leHhYT2UzL1JBTDN0dldiQ1JDZ1pNNVI4T0hFTHQ2Q0VaVHlWYmFV?=
 =?utf-8?B?UEZLZFl1NXNob1lnNEttL0pJRTIveUM1c2pUdmVKa2ZRcEVQcVU3RGNsOCtu?=
 =?utf-8?B?aVNMVUVPTXRKK204VGc1ZWFid3QrU1o0aTRnbHZqYWVaNHFKOWxGTDV5aUVm?=
 =?utf-8?B?Q1VERnd5OEYwWHBMMkZ5VEpEcm5jNU91K1hMdnRsR3krK1dIUGlwaGtkUjE4?=
 =?utf-8?B?U3FvTjh2Q08zVVBYUmpHV0JlUWV4QVZjUHJiT2I4WUFYZFdTUUorUlBidWNj?=
 =?utf-8?B?Wjc1UDNNdUNKKzMwbk5WTU0vUVJndFRGdFdNQ0d6eUZEWWVQeFgzcUZMTGZH?=
 =?utf-8?B?M3pUSC9NSXhHUEhpeDJJQlViMzFmNjVQdVladkVQZ0h0ek1WVGpjalNvd3Zk?=
 =?utf-8?B?bHBHOGFPOWVZNGFmT0pEWGM3K3RodTRra2FlK0ZBaTl6aUdWRURWd3pUZU1O?=
 =?utf-8?B?dVN0U0lDbGFjVnF3aVRBZnNnc0pBcXllNVpOWVlkUDdlR2FzLzR2bmNuc3Zx?=
 =?utf-8?B?UUwwdUtwbzdDODMyUDFZYkJrcExRL1Z6S0tIVWZMamV5ck8yL1FvSk9HRzl4?=
 =?utf-8?B?MSsrYXdzUkNGcll4Snl4Y1E5RTM3bExDQ0NRcWs4YW10SlV1aEJvQ01qTjU2?=
 =?utf-8?B?ZjkwRjRvYWxSSGlXR3VUVHdkWm9kNXJnRVZDMkJrQ2lTVElFb2x0TlN1UDBh?=
 =?utf-8?B?TGdaRjhnQmJqeStCK1NLQkJYQkRVREd6cUpGVG5zVXNCUGxwcTBFa29tOGI4?=
 =?utf-8?B?bjhVbkFXejI0VUNaVC9yL29YZS9MMVZiNW5RV213RjVOdGFEVG1qR1BoQ3VD?=
 =?utf-8?B?VVZaY1pDMHpzNDA4L1hRTHRSaFV2bDVMTnpPblFzQS9pTWVsRE52R29iSkll?=
 =?utf-8?B?OVliYXk0TEdVSVBTS0NCbjdLSFZ5SXFRMEU3RGRpRkRJZFhOVnB2MXVaTGFy?=
 =?utf-8?B?REozbENEZ05jQkp5WGJRS2JKNndiQnBZQ2pWYys5YzNHSjZrRlQ0ODlpQlo5?=
 =?utf-8?B?OW5taEFHTmE5MUE5VVJ3eG1Kd3dlNU0rMkx5NEpnbHFLUmQySUVwMGlkenNE?=
 =?utf-8?B?Y052N01QQ2ZQSmFJK1d1eVVrS1RmYXJIU2ZjMGYwZ01pc0xUYUtwb011Sm0w?=
 =?utf-8?B?Zy9ySjRSOGtndnRaWWYvL2lIRHh4STVEblFXN2NiYUpjc0J2Nnh3SXdWdy9L?=
 =?utf-8?B?S2NvSElobDZyaHJOb3VydXJIa08yRFRxeE9MMWJLZUVzUkFTeVhETHd0WnA3?=
 =?utf-8?B?S2MrZTdiVHV0SDVuenJrZmVYdFExTW15NUpRODFGVWx4S2FvZDBjZnNucWtK?=
 =?utf-8?B?RnVEbWorb2tQZWt4c3ZCaFBmenZ2UkE5VitSSWdBcnVzWEhMa3lrWWRtNFdH?=
 =?utf-8?B?RWo2UlY2Y1ZMOUh5eDdySllnL3Yyd2Rvem43RzJuVkNpdmlxamhETUhNTmtE?=
 =?utf-8?B?NHFIUXdiMTlCcHVsMERVdmIrM3B3VkJFUkp1c1B1V0xLUmlMOUkzTkZWdHp6?=
 =?utf-8?B?N20xVG1FUjJZMGRqMkJQcWhrQ3JhbXkvVllmdVZFU0xnNnVCaGZHU2VCRzk1?=
 =?utf-8?B?L01SbkpWaHZWNHlyM1ZMbUsyaHExalNBSWJXVEdmdHp3NFplUlYrVzl6bVlP?=
 =?utf-8?B?VExKd20yM0FGdjRUUlh4WVlsNzVFT3AvbTEwamgyYmd3UzQ1dUNRVEVlbk9l?=
 =?utf-8?B?QnZLTXlHeWRZWDk1QXB0MU51bWFuRTJXaUxDV1F4QitPS0hPTFFVdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cad704-13ce-46b5-724b-08de744b1fed
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:51:54.2448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Uk2b8R5qn6X0S0Icao16CQeC5aQrtZ32Mrmxokakz832jmJrRmaEnyWXmtL89ZaErI375HDwromYji8FHEFrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9466
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


On 2/4/2026 10:56, Matt Roper wrote:
> On Thu, Jan 22, 2026 at 07:15:30AM +0000, Xin Wang wrote:
>> Switch Xe‑related libraries and tests to use fd‑based intel_gen() and
>> intel_graphics_ver() instead of PCI ID lookups, keeping behavior aligned
>> with Xe IP disaggregation.
> You might want to mention the specific special cases that aren't
> transitioned over and will remain on pciid-based lookup so that
> reviewers can grep the resulting tree and make sure nothing was missed.
> I just did a grep and it seems like there are still quite a few tests
> using the pciid-based lookup which probably don't need to be; those
> might be oversights:
Regarding the i915-only tests: this was intentional. For i915 devices,
the new fd-based helpers simply fall back to the same pciid-based lookup
internally, so switching those callers would add overhead without any
real benefit. Additionally, much of the i915-specific code is in
maintenance mode and not actively being updated, so I preferred to leave
it as-is.

More broadly, there are also cases (e.g. standalone tools that run
before the DRM driver is loaded) where the pciid-based approach is the
only viable option. So I think it makes sense to keep
intel_gen_from_pciid() / intel_graphics_ver_from_pciid() as
legitimate APIs rather than treating them as purely transitional.

Does that reasoning make sense to you, or do you still think we should
aim for a full migration across all callers?


>          $ grep -Irl intel_gen_legacy tests/
>          tests/prime_vgem.c
>          tests/intel/gem_exec_fair.c
>          tests/intel/gen7_exec_parse.c
>          tests/intel/gem_linear_blits.c
>          tests/intel/gem_evict_alignment.c
>          tests/intel/gem_exec_store.c
>          tests/intel/gem_exec_flush.c
>          tests/intel/i915_getparams_basic.c
>          tests/intel/i915_pm_rpm.c
>          tests/intel/gem_mmap_gtt.c
>          tests/intel/gem_softpin.c
>          tests/intel/gem_sync.c
>          tests/intel/gem_tiled_fence_blits.c
>          tests/intel/gem_close_race.c
>          tests/intel/gem_tiling_max_stride.c
>          tests/intel/gem_ctx_isolation.c
>          tests/intel/gem_exec_nop.c
>          tests/intel/gem_evict_everything.c
>          tests/intel/perf_pmu.c
>          tests/intel/sysfs_timeslice_duration.c
>          tests/intel/gem_ctx_shared.c
>          tests/intel/gem_ctx_engines.c
>          tests/intel/gem_exec_fence.c
>          tests/intel/gem_exec_balancer.c
>          tests/intel/gem_exec_latency.c
>          tests/intel/gem_exec_schedule.c
>          tests/intel/gem_gtt_hog.c
>          tests/intel/gem_blits.c
>          tests/intel/gem_exec_await.c
>          tests/intel/gem_exec_capture.c
>          tests/intel/gem_ringfill.c
>          tests/intel/perf.c
>          tests/intel/gem_exec_params.c
>          tests/intel/sysfs_preempt_timeout.c
>          tests/intel/gem_exec_suspend.c
>          tests/intel/gem_exec_reloc.c
>          tests/intel/gem_exec_whisper.c
>          tests/intel/gem_exec_gttfill.c
>          tests/intel/gem_exec_parallel.c
>          tests/intel/gem_watchdog.c
>          tests/intel/gem_exec_big.c
>          tests/intel/gem_set_tiling_vs_blt.c
>          tests/intel/gem_render_copy.c
>          tests/intel/gen9_exec_parse.c
>          tests/intel/gem_vm_create.c
>          tests/intel/i915_pm_rc6_residency.c
>          tests/intel/i915_module_load.c
>          tests/intel/gem_streaming_writes.c
>          tests/intel/gem_fenced_exec_thrash.c
>          tests/intel/gem_workarounds.c
>          tests/intel/gem_ctx_create.c
>          tests/intel/i915_pm_sseu.c
>          tests/intel/gem_concurrent_all.c
>          tests/intel/gem_ctx_sseu.c
>          tests/intel/gem_read_read_speed.c
>          tests/intel/api_intel_bb.c
>          tests/intel/gem_bad_reloc.c
>          tests/intel/gem_media_vme.c
>          tests/intel/gem_exec_async.c
>          tests/intel/gem_userptr_blits.c
>          tests/intel/gem_eio.c
>
> An alternate approach would be to structure this series as:
>
>   - Create the "legacy" functions as a duplicate of the existing
>     pciid-based functions and explicitly convert the special cases that
>     we expect to remain on PCI ID.
>
>   - Change the signature of intel_graphics_ver / intel_gen and all
>     remaining callsites.
>
> That will ensure everything gets converted over (otherwise there will be
> a build failure because anything not converted will be trying to use the
> wrong function signature).  It also makes it a little bit easier to
> directly review the special cases and make sure they all truly need to
> be special cases.
>
>
> As mentioned on the first patch, if you're using something like
> Coccinelle to do these conversions, providing the semantic patch(es)
> used in the commit message would be helpful.
Regarding the suggestion to use Coccinelle: some of the changes in
this patch cannot be handled automatically by a script because they
involve function signature modifications. For example:
   -static void basic_inst(int fd, int inst_type,
   -                        struct drm_xe_engine_class_instance *eci,
   -                        uint16_t dev_id)
   +static void basic_inst(int fd, int inst_type,
   +                        struct drm_xe_engine_class_instance *eci)
This requires updating the function definition, its internal uses of
dev_id, and all call sites simultaneously, which is beyond what
Coccinelle can handle across function boundaries.

Xin

>
> Matt
>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   lib/gpgpu_shader.c                     |  5 ++-
>>   lib/gpu_cmds.c                         | 21 ++++++-----
>>   lib/intel_batchbuffer.c                | 14 +++-----
>>   lib/intel_blt.c                        | 21 +++++------
>>   lib/intel_blt.h                        |  2 +-
>>   lib/intel_bufops.c                     | 10 +++---
>>   lib/intel_common.c                     |  2 +-
>>   lib/intel_compute.c                    |  6 ++--
>>   lib/intel_mocs.c                       | 48 ++++++++++++++------------
>>   lib/intel_pat.c                        | 19 +++++-----
>>   lib/rendercopy_gen9.c                  | 22 ++++++------
>>   lib/xe/xe_legacy.c                     |  2 +-
>>   lib/xe/xe_spin.c                       |  4 +--
>>   lib/xe/xe_sriov_provisioning.c         |  4 +--
>>   tests/intel/api_intel_allocator.c      |  2 +-
>>   tests/intel/kms_ccs.c                  | 13 +++----
>>   tests/intel/kms_fbcon_fbt.c            |  2 +-
>>   tests/intel/kms_frontbuffer_tracking.c |  6 ++--
>>   tests/intel/kms_pipe_stress.c          |  4 +--
>>   tests/intel/xe_ccs.c                   | 16 ++++-----
>>   tests/intel/xe_compute.c               |  8 ++---
>>   tests/intel/xe_copy_basic.c            |  6 ++--
>>   tests/intel/xe_debugfs.c               |  3 +-
>>   tests/intel/xe_eudebug_online.c        |  8 ++---
>>   tests/intel/xe_exec_multi_queue.c      |  2 +-
>>   tests/intel/xe_exec_store.c            | 18 ++++------
>>   tests/intel/xe_fault_injection.c       |  8 ++---
>>   tests/intel/xe_intel_bb.c              |  7 ++--
>>   tests/intel/xe_multigpu_svm.c          |  3 +-
>>   tests/intel/xe_pat.c                   | 16 ++++-----
>>   tests/intel/xe_query.c                 |  4 +--
>>   tests/intel/xe_render_copy.c           |  2 +-
>>   32 files changed, 135 insertions(+), 173 deletions(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 767bddb7b..09a7f5c5e 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -274,11 +274,10 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>>   struct gpgpu_shader *gpgpu_shader_create(int fd)
>>   {
>>   	struct gpgpu_shader *shdr = calloc(1, sizeof(struct gpgpu_shader));
>> -	const struct intel_device_info *info;
>> +	unsigned ip_ver = intel_graphics_ver(fd);
>>   
>>   	igt_assert(shdr);
>> -	info = intel_get_device_info(intel_get_drm_devid(fd));
>> -	shdr->gen_ver = 100 * info->graphics_ver + info->graphics_rel;
>> +	shdr->gen_ver = 100 * (ip_ver >> 8) + (ip_ver & 0xff);
>>   	shdr->max_size = 16 * 4;
>>   	shdr->code = malloc(4 * shdr->max_size);
>>   	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
>> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
>> index ab46fe0de..6842af1ad 100644
>> --- a/lib/gpu_cmds.c
>> +++ b/lib/gpu_cmds.c
>> @@ -313,14 +313,13 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>>   {
>>   	uint32_t binding_table_offset;
>>   	uint32_t *binding_table;
>> -	uint32_t devid = intel_get_drm_devid(ibb->fd);
>>   
>>   	intel_bb_ptr_align(ibb, 64);
>>   	binding_table_offset = intel_bb_offset(ibb);
>>   	binding_table = intel_bb_ptr(ibb);
>>   	intel_bb_ptr_add(ibb, 64);
>>   
>> -	if (intel_graphics_ver_legacy(devid) >= IP_VER(20, 0)) {
>> +	if (intel_graphics_ver(ibb->fd) >= IP_VER(20, 0)) {
>>   		/*
>>   		 * Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 'bpp' value.
>>   		 * For bpp 32 this results in a surface that is 4x narrower than expected. However
>> @@ -342,13 +341,13 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>>   			igt_assert_f(false,
>>   				     "Surface state for bpp = %u not implemented",
>>   				     buf->bpp);
>> -	} else if (intel_graphics_ver_legacy(devid) >= IP_VER(12, 50)) {
>> +	} else if (intel_graphics_ver(ibb->fd) >= IP_VER(12, 50)) {
>>   		binding_table[0] = xehp_fill_surface_state(ibb, buf,
>>   							   SURFACEFORMAT_R8_UNORM, 1);
>> -	} else if (intel_graphics_ver_legacy(devid) >= IP_VER(9, 0)) {
>> +	} else if (intel_graphics_ver(ibb->fd) >= IP_VER(9, 0)) {
>>   		binding_table[0] = gen9_fill_surface_state(ibb, buf,
>>   							   SURFACEFORMAT_R8_UNORM, 1);
>> -	} else if (intel_graphics_ver_legacy(devid) >= IP_VER(8, 0)) {
>> +	} else if (intel_graphics_ver(ibb->fd) >= IP_VER(8, 0)) {
>>   		binding_table[0] = gen8_fill_surface_state(ibb, buf,
>>   							   SURFACEFORMAT_R8_UNORM, 1);
>>   	} else {
>> @@ -867,7 +866,7 @@ gen_emit_media_object(struct intel_bb *ibb,
>>   	/* inline data (xoffset, yoffset) */
>>   	intel_bb_out(ibb, xoffset);
>>   	intel_bb_out(ibb, yoffset);
>> -	if (intel_gen_legacy(ibb->devid) >= 8 && !IS_CHERRYVIEW(ibb->devid))
>> +	if (intel_gen(ibb->fd) >= 8 && !IS_CHERRYVIEW(ibb->devid))
>>   		gen8_emit_media_state_flush(ibb);
>>   }
>>   
>> @@ -1011,7 +1010,7 @@ void
>>   xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt)
>>   {
>>   
>> -	uint32_t dword_length = intel_graphics_ver_legacy(ibb->devid) >= IP_VER(20, 0);
>> +	uint32_t dword_length = intel_graphics_ver(ibb->fd) >= IP_VER(20, 0);
>>   
>>   	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE | dword_length);
>>   	intel_bb_out(ibb, vrt ? (0x10001) << 10 : 0); /* Enable variable number of threads */
>> @@ -1042,7 +1041,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>>   	intel_bb_out(ibb, 0);
>>   
>>   	/* stateless data port */
>> -	tmp = intel_graphics_ver_legacy(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
>> +	tmp = intel_graphics_ver(ibb->fd) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
>>   	intel_bb_out(ibb, 0 | tmp);                  //dw3
>>   
>>   	/* surface */
>> @@ -1068,7 +1067,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>>   	/* dynamic state buffer size */
>>   	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw13
>>   	/* indirect object buffer size */
>> -	if (intel_graphics_ver_legacy(ibb->devid) >= IP_VER(20, 0))	    //dw14
>> +	if (intel_graphics_ver(ibb->fd) >= IP_VER(20, 0))              //dw14
>>   		intel_bb_out(ibb, 0);
>>   	else
>>   		intel_bb_out(ibb, 0xfffff000 | 1);
>> @@ -1115,7 +1114,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>>   	else
>>   		mask = (1 << mask) - 1;
>>   
>> -	dword_length = intel_graphics_ver_legacy(ibb->devid) >= IP_VER(20, 0) ? 0x26 : 0x25;
>> +	dword_length = intel_graphics_ver(ibb->fd) >= IP_VER(20, 0) ? 0x26 : 0x25;
>>   	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | dword_length);
>>   
>>   	intel_bb_out(ibb, 0); /* debug object */		//dw1
>> @@ -1155,7 +1154,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>>   	intel_bb_out(ibb, 0);					//dw16
>>   	intel_bb_out(ibb, 0);					//dw17
>>   
>> -	if (intel_graphics_ver_legacy(ibb->devid) >= IP_VER(20, 0))	//Xe2:dw18
>> +	if (intel_graphics_ver(ibb->fd) >= IP_VER(20, 0))	        //Xe2:dw18
>>   		intel_bb_out(ibb, 0);
>>   	/* Interface descriptor data */
>>   	for (int i = 0; i < 8; i++) {			       //dw18-25 (Xe2:dw19-26)
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index f418e7981..4f52e7b6a 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -329,11 +329,7 @@ void igt_blitter_copy(int fd,
>>   		      uint32_t dst_x, uint32_t dst_y,
>>   		      uint64_t dst_size)
>>   {
>> -	uint32_t devid;
>> -
>> -	devid = intel_get_drm_devid(fd);
>> -
>> -	if (intel_graphics_ver_legacy(devid) >= IP_VER(12, 60))
>> +	if (intel_graphics_ver(fd) >= IP_VER(12, 60))
>>   		igt_blitter_fast_copy__raw(fd, ahnd, ctx, NULL,
>>   					   src_handle, src_delta,
>>   					   src_stride, src_tiling,
>> @@ -410,7 +406,7 @@ void igt_blitter_src_copy(int fd,
>>   	uint32_t batch_handle;
>>   	uint32_t src_pitch, dst_pitch;
>>   	uint32_t dst_reloc_offset, src_reloc_offset;
>> -	uint32_t gen = intel_gen_legacy(intel_get_drm_devid(fd));
>> +	uint32_t gen = intel_gen(fd);
>>   	uint64_t batch_offset, src_offset, dst_offset;
>>   	const bool has_64b_reloc = gen >= 8;
>>   	int i = 0;
>> @@ -669,7 +665,7 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int fd)
>>   		copy = mtl_render_copyfunc;
>>   	else if (IS_DG2(devid))
>>   		copy = gen12p71_render_copyfunc;
>> -	else if (intel_gen_legacy(devid) >= 20)
>> +	else if (intel_gen(fd) >= 20)
>>   		copy = xe2_render_copyfunc;
>>   	else if (IS_GEN12(devid))
>>   		copy = gen12_render_copyfunc;
>> @@ -911,7 +907,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>>   	igt_assert(ibb);
>>   
>>   	ibb->devid = intel_get_drm_devid(fd);
>> -	ibb->gen = intel_gen_legacy(ibb->devid);
>> +	ibb->gen = intel_gen(fd);
>>   	ibb->ctx = ctx;
>>   
>>   	ibb->fd = fd;
>> @@ -1089,7 +1085,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
>>   
>>   static bool aux_needs_softpin(int fd)
>>   {
>> -	return intel_gen_legacy(intel_get_drm_devid(fd)) >= 12;
>> +	return intel_gen(fd) >= 12;
>>   }
>>   
>>   static bool has_ctx_cfg(struct intel_bb *ibb)
>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> index 673f204b0..7ae04fccd 100644
>> --- a/lib/intel_blt.c
>> +++ b/lib/intel_blt.c
>> @@ -997,7 +997,7 @@ uint64_t emit_blt_block_copy(int fd,
>>   			     uint64_t bb_pos,
>>   			     bool emit_bbe)
>>   {
>> -	unsigned int ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	unsigned int ip_ver = intel_graphics_ver(fd);
>>   	struct gen12_block_copy_data data = {};
>>   	struct gen12_block_copy_data_ext dext = {};
>>   	uint64_t dst_offset, src_offset, bb_offset;
>> @@ -1285,7 +1285,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>>   				 uint64_t bb_pos,
>>   				 bool emit_bbe)
>>   {
>> -	unsigned int ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	unsigned int ip_ver = intel_graphics_ver(fd);
>>   	union ctrl_surf_copy_data data = { };
>>   	size_t data_sz;
>>   	uint64_t dst_offset, src_offset, bb_offset, alignment;
>> @@ -1705,7 +1705,7 @@ uint64_t emit_blt_fast_copy(int fd,
>>   			    uint64_t bb_pos,
>>   			    bool emit_bbe)
>>   {
>> -	unsigned int ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	unsigned int ip_ver = intel_graphics_ver(fd);
>>   	struct gen12_fast_copy_data data = {};
>>   	uint64_t dst_offset, src_offset, bb_offset;
>>   	uint32_t bbe = MI_BATCH_BUFFER_END;
>> @@ -1972,11 +1972,10 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
>>   static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
>>   {
>>   	uint32_t *cmd = (uint32_t *) data;
>> -	uint32_t devid = intel_get_drm_devid(fd);
>>   
>>   	igt_info("BB details:\n");
>>   
>> -	if (intel_graphics_ver_legacy(devid) >= IP_VER(20, 0)) {
>> +	if (intel_graphics_ver(fd) >= IP_VER(20, 0)) {
>>   		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
>>   			 "[copy type: %d, mode: %d]\n",
>>   			 cmd[0], data->dw00.xe2.client, data->dw00.xe2.opcode,
>> @@ -2006,7 +2005,7 @@ static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
>>   		 cmd[7], data->dw07.dst_address_lo);
>>   	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
>>   		 cmd[8], data->dw08.dst_address_hi);
>> -	if (intel_graphics_ver_legacy(devid) >= IP_VER(20, 0)) {
>> +	if (intel_graphics_ver(fd) >= IP_VER(20, 0)) {
>>   		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
>>   			 cmd[9], data->dw09.xe2.dst_mocs,
>>   			 data->dw09.xe2.src_mocs);
>> @@ -2025,7 +2024,6 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>>   	uint64_t dst_offset, src_offset, shift;
>>   	uint32_t width, height, width_max, height_max, remain;
>>   	uint32_t bbe = MI_BATCH_BUFFER_END;
>> -	uint32_t devid = intel_get_drm_devid(fd);
>>   	uint8_t *bb;
>>   
>>   	if (mem->mode == MODE_BYTE) {
>> @@ -2049,7 +2047,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>>   	width = mem->src.width;
>>   	height = mem->dst.height;
>>   
>> -	if (intel_graphics_ver_legacy(devid) >= IP_VER(20, 0)) {
>> +	if (intel_graphics_ver(fd) >= IP_VER(20, 0)) {
>>   		data.dw00.xe2.client = 0x2;
>>   		data.dw00.xe2.opcode = 0x5a;
>>   		data.dw00.xe2.length = 8;
>> @@ -2231,7 +2229,6 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
>>   	int b;
>>   	uint32_t *batch;
>>   	uint32_t value;
>> -	uint32_t devid = intel_get_drm_devid(fd);
>>   
>>   	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
>>   					  0, mem->dst.pat_index);
>> @@ -2246,7 +2243,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
>>   	batch[b++] = mem->dst.pitch - 1;
>>   	batch[b++] = dst_offset;
>>   	batch[b++] = dst_offset << 32;
>> -	if (intel_graphics_ver_legacy(devid) >= IP_VER(20, 0))
>> +	if (intel_graphics_ver(fd) >= IP_VER(20, 0))
>>   		batch[b++] = value | (mem->dst.mocs_index << 3);
>>   	else
>>   		batch[b++] = value | mem->dst.mocs_index;
>> @@ -2364,7 +2361,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>>   		if (create_mapping && region != system_memory(blt->fd))
>>   			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>>   
>> -		if (intel_gen_legacy(intel_get_drm_devid(blt->fd)) >= 20 && compression) {
>> +		if (intel_gen(blt->fd) >= 20 && compression) {
>>   			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
>>   			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>   		}
>> @@ -2590,7 +2587,7 @@ void blt_surface_get_flatccs_data(int fd,
>>   		cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
>>   		ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
>>   
>> -		if (intel_gen_legacy(intel_get_drm_devid(fd)) >= 20 && obj->compression) {
>> +		if (intel_gen(fd) >= 20 && obj->compression) {
>>   			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
>>   			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>   		}
>> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
>> index a98a34e95..feba94ebb 100644
>> --- a/lib/intel_blt.h
>> +++ b/lib/intel_blt.h
>> @@ -52,7 +52,7 @@
>>   #include "igt.h"
>>   #include "intel_cmds_info.h"
>>   
>> -#define CCS_RATIO(fd) (intel_gen_legacy(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
>> +#define CCS_RATIO(fd) (intel_gen(fd) >= 20 ? 512 : 256)
>>   #define GEN12_MEM_COPY_MOCS_SHIFT		25
>>   #define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
>>   #define XE2_MEM_COPY_DST_MOCS_SHIFT		3
>> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
>> index ea3742f1e..a2adbf9ef 100644
>> --- a/lib/intel_bufops.c
>> +++ b/lib/intel_bufops.c
>> @@ -1063,7 +1063,7 @@ static void __intel_buf_init(struct buf_ops *bops,
>>   		} else {
>>   			uint16_t cpu_caching = __xe_default_cpu_caching(bops->fd, region, 0);
>>   
>> -			if (intel_gen_legacy(bops->devid) >= 20 && compression)
>> +			if (intel_gen(bops->fd) >= 20 && compression)
>>   				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>   
>>   			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
>> @@ -1106,7 +1106,7 @@ void intel_buf_init(struct buf_ops *bops,
>>   	uint64_t region;
>>   	uint8_t pat_index = DEFAULT_PAT_INDEX;
>>   
>> -	if (compression && intel_gen_legacy(bops->devid) >= 20)
>> +	if (compression && intel_gen(bops->fd) >= 20)
>>   		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
>>   
>>   	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
>> @@ -1132,7 +1132,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
>>   {
>>   	uint8_t pat_index = DEFAULT_PAT_INDEX;
>>   
>> -	if (compression && intel_gen_legacy(bops->devid) >= 20)
>> +	if (compression && intel_gen(bops->fd) >= 20)
>>   		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
>>   
>>   	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
>> @@ -1203,7 +1203,7 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
>>   	igt_assert(handle);
>>   	igt_assert(size);
>>   
>> -	if (compression && intel_gen_legacy(bops->devid) >= 20)
>> +	if (compression && intel_gen(bops->fd) >= 20)
>>   		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
>>   
>>   	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
>> @@ -1758,7 +1758,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>>   	igt_assert(bops);
>>   
>>   	devid = intel_get_drm_devid(fd);
>> -	generation = intel_gen_legacy(devid);
>> +	generation = intel_gen(fd);
>>   
>>   	/* Predefined settings: see intel_device_info? */
>>   	for (int i = 0; i < ARRAY_SIZE(buf_ops_arr); i++) {
>> diff --git a/lib/intel_common.c b/lib/intel_common.c
>> index cd1019bfe..407d53f77 100644
>> --- a/lib/intel_common.c
>> +++ b/lib/intel_common.c
>> @@ -91,7 +91,7 @@ bool is_intel_region_compressible(int fd, uint64_t region)
>>   		return true;
>>   
>>   	/* Integrated Xe2+ supports compression on system memory */
>> -	if (intel_gen_legacy(devid) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
>> +	if (intel_gen(fd) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
>>   		return true;
>>   
>>   	/* Discrete supports compression on vram */
>> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
>> index 1734c1649..66156d194 100644
>> --- a/lib/intel_compute.c
>> +++ b/lib/intel_compute.c
>> @@ -2284,7 +2284,7 @@ static bool __run_intel_compute_kernel(int fd,
>>   				       struct user_execenv *user,
>>   				       enum execenv_alloc_prefs alloc_prefs)
>>   {
>> -	unsigned int ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	unsigned int ip_ver = intel_graphics_ver(fd);
>>   	int batch;
>>   	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
>>   	enum intel_driver driver = get_intel_driver(fd);
>> @@ -2749,7 +2749,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>>   		bool threadgroup_preemption,
>>   		enum execenv_alloc_prefs alloc_prefs)
>>   {
>> -	unsigned int ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	unsigned int ip_ver = ip_ver = intel_graphics_ver(fd);
>>   	int batch;
>>   	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
>>   	enum intel_driver driver = get_intel_driver(fd);
>> @@ -2803,7 +2803,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>>    */
>>   bool xe_kernel_preempt_check(int fd, enum xe_compute_preempt_type required_preempt)
>>   {
>> -	unsigned int ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	unsigned int ip_ver = ip_ver = intel_graphics_ver(fd);
>>   	int batch = find_preempt_batch(ip_ver);
>>   
>>   	if (batch < 0) {
>> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
>> index f21c2bf09..b9ea43c7c 100644
>> --- a/lib/intel_mocs.c
>> +++ b/lib/intel_mocs.c
>> @@ -27,8 +27,8 @@ struct drm_intel_mocs_index {
>>   
>>   static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>>   {
>> -	uint16_t devid = intel_get_drm_devid(fd);
>> -	unsigned int ip_ver = intel_graphics_ver_legacy(devid);
>> +	uint16_t devid;
>> +	unsigned int ip_ver = intel_graphics_ver(fd);
>>   
>>   	/*
>>   	 * Gen >= 12 onwards don't have a setting for PTE,
>> @@ -42,26 +42,29 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>>   		mocs->wb_index = 4;
>>   		mocs->displayable_index = 1;
>>   		mocs->defer_to_pat_index = 0;
>> -	} else if (IS_METEORLAKE(devid)) {
>> -		mocs->uc_index = 5;
>> -		mocs->wb_index = 1;
>> -		mocs->displayable_index = 14;
>> -	} else if (IS_DG2(devid)) {
>> -		mocs->uc_index = 1;
>> -		mocs->wb_index = 3;
>> -		mocs->displayable_index = 3;
>> -	} else if (IS_DG1(devid)) {
>> -		mocs->uc_index = 1;
>> -		mocs->wb_index = 5;
>> -		mocs->displayable_index = 5;
>> -	} else if (ip_ver >= IP_VER(12, 0)) {
>> -		mocs->uc_index = 3;
>> -		mocs->wb_index = 2;
>> -		mocs->displayable_index = 61;
>>   	} else {
>> -		mocs->uc_index = I915_MOCS_PTE;
>> -		mocs->wb_index = I915_MOCS_CACHED;
>> -		mocs->displayable_index = I915_MOCS_PTE;
>> +		devid = intel_get_drm_devid(fd);
>> +		if (IS_METEORLAKE(devid)) {
>> +			mocs->uc_index = 5;
>> +			mocs->wb_index = 1;
>> +			mocs->displayable_index = 14;
>> +		} else if (IS_DG2(devid)) {
>> +			mocs->uc_index = 1;
>> +			mocs->wb_index = 3;
>> +			mocs->displayable_index = 3;
>> +		} else if (IS_DG1(devid)) {
>> +			mocs->uc_index = 1;
>> +			mocs->wb_index = 5;
>> +			mocs->displayable_index = 5;
>> +		} else if (ip_ver >= IP_VER(12, 0)) {
>> +			mocs->uc_index = 3;
>> +			mocs->wb_index = 2;
>> +			mocs->displayable_index = 61;
>> +		} else {
>> +			mocs->uc_index = I915_MOCS_PTE;
>> +			mocs->wb_index = I915_MOCS_CACHED;
>> +			mocs->displayable_index = I915_MOCS_PTE;
>> +		}
>>   	}
>>   }
>>   
>> @@ -124,9 +127,8 @@ uint8_t intel_get_displayable_mocs_index(int fd)
>>   uint8_t intel_get_defer_to_pat_mocs_index(int fd)
>>   {
>>   	struct drm_intel_mocs_index mocs;
>> -	uint16_t dev_id = intel_get_drm_devid(fd);
>>   
>> -	igt_assert(intel_gen_legacy(dev_id) >= 20);
>> +	igt_assert(intel_gen(fd) >= 20);
>>   
>>   	get_mocs_index(fd, &mocs);
>>   
>> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
>> index 9a61c2a45..9bb4800b6 100644
>> --- a/lib/intel_pat.c
>> +++ b/lib/intel_pat.c
>> @@ -96,14 +96,12 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>>   
>>   static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>>   {
>> -	uint16_t dev_id = intel_get_drm_devid(fd);
>> -
>> -	if (intel_graphics_ver_legacy(dev_id) == IP_VER(35, 11)) {
>> +	if (intel_graphics_ver(fd) == IP_VER(35, 11)) {
>>   		pat->uc = 3;
>>   		pat->wb = 2;
>>   		pat->max_index = 31;
>> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
>> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
>> +	} else if (intel_gen(fd) == 30 ||
>> +		   intel_gen(fd) == 20) {
>>   		pat->uc = 3;
>>   		pat->wt = 15; /* Compressed + WB-transient */
>>   		pat->wb = 2;
>> @@ -111,19 +109,19 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>>   		pat->max_index = 31;
>>   
>>   		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
>> -		if (intel_graphics_ver_legacy(dev_id) == IP_VER(20, 1))
>> +		if (intel_graphics_ver(fd) == IP_VER(20, 1))
>>   			pat->max_index -= 4;
>> -	} else if (IS_METEORLAKE(dev_id)) {
>> +	} else if (IS_METEORLAKE(intel_get_drm_devid(fd))) {
>>   		pat->uc = 2;
>>   		pat->wt = 1;
>>   		pat->wb = 3;
>>   		pat->max_index = 3;
>> -	} else if (IS_PONTEVECCHIO(dev_id)) {
>> +	} else if (IS_PONTEVECCHIO(intel_get_drm_devid(fd))) {
>>   		pat->uc = 0;
>>   		pat->wt = 2;
>>   		pat->wb = 3;
>>   		pat->max_index = 7;
>> -	} else if (intel_graphics_ver_legacy(dev_id) <= IP_VER(12, 60)) {
>> +	} else if (intel_graphics_ver(fd) <= IP_VER(12, 60)) {
>>   		pat->uc = 3;
>>   		pat->wt = 2;
>>   		pat->wb = 0;
>> @@ -152,9 +150,8 @@ uint8_t intel_get_pat_idx_uc(int fd)
>>   uint8_t intel_get_pat_idx_uc_comp(int fd)
>>   {
>>   	struct intel_pat_cache pat = {};
>> -	uint16_t dev_id = intel_get_drm_devid(fd);
>>   
>> -	igt_assert(intel_gen_legacy(dev_id) >= 20);
>> +	igt_assert(intel_gen(fd) >= 20);
>>   
>>   	intel_get_pat_idx(fd, &pat);
>>   	return pat.uc_comp;
>> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
>> index 66415212c..0be557a47 100644
>> --- a/lib/rendercopy_gen9.c
>> +++ b/lib/rendercopy_gen9.c
>> @@ -256,12 +256,12 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>   	if (buf->compression == I915_COMPRESSION_MEDIA)
>>   		ss->ss7.tgl.media_compression = 1;
>>   	else if (buf->compression == I915_COMPRESSION_RENDER) {
>> -		if (intel_gen_legacy(ibb->devid) >= 20)
>> +		if (intel_gen(ibb->fd) >= 20)
>>   			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
>>   		else
>>   			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
>>   
>> -		if (intel_gen_legacy(ibb->devid) < 12 && buf->ccs[0].stride) {
>> +		if (intel_gen(ibb->fd) < 12 && buf->ccs[0].stride) {
>>   			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
>>   
>>   			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
>> @@ -303,7 +303,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
>>   			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
>>   
>> -			if (intel_gen_legacy(ibb->devid) >= 20)
>> +			if (intel_gen(ibb->fd) >= 20)
>>   				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
>>   			else
>>   				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
>> @@ -681,7 +681,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
>>   	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
>>   	/* The length has to be one less if we dont modify
>>   	   bindless state */
>> -	if (intel_gen_legacy(intel_get_drm_devid(ibb->fd)) >= 20)
>> +	if (intel_gen(ibb->fd) >= 20)
>>   		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
>>   	else
>>   		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
>> @@ -726,7 +726,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
>>   	intel_bb_out(ibb, 0);
>>   	intel_bb_out(ibb, 0);
>>   
>> -	if (intel_gen_legacy(intel_get_drm_devid(ibb->fd)) >= 20) {
>> +	if (intel_gen(ibb->fd) >= 20) {
>>   		/* Bindless sampler */
>>   		intel_bb_out(ibb, 0);
>>   		intel_bb_out(ibb, 0);
>> @@ -899,7 +899,7 @@ gen9_emit_ds(struct intel_bb *ibb) {
>>   
>>   static void
>>   gen8_emit_wm_hz_op(struct intel_bb *ibb) {
>> -	if (intel_gen_legacy(intel_get_drm_devid(ibb->fd)) >= 20) {
>> +	if (intel_gen(ibb->fd) >= 20) {
>>   		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
>>   		intel_bb_out(ibb, 0);
>>   	} else {
>> @@ -989,7 +989,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
>>   	intel_bb_out(ibb, 0);
>>   
>>   	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
>> -	if (intel_gen_legacy(intel_get_drm_devid(ibb->fd)) >= 20)
>> +	if (intel_gen(ibb->fd) >= 20)
>>   		intel_bb_out(ibb, kernel | 1);
>>   	else
>>   		intel_bb_out(ibb, kernel);
>> @@ -1006,7 +1006,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
>>   	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
>>   	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
>>   	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
>> -	if (intel_gen_legacy(intel_get_drm_devid(ibb->fd)) >= 20)
>> +	if (intel_gen(ibb->fd) >= 20)
>>   		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
>>   			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
>>   	else
>> @@ -1061,7 +1061,7 @@ gen9_emit_depth(struct intel_bb *ibb)
>>   
>>   static void
>>   gen7_emit_clear(struct intel_bb *ibb) {
>> -	if (intel_gen_legacy(intel_get_drm_devid(ibb->fd)) >= 20)
>> +	if (intel_gen(ibb->fd) >= 20)
>>   		return;
>>   
>>   	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
>> @@ -1072,7 +1072,7 @@ gen7_emit_clear(struct intel_bb *ibb) {
>>   static void
>>   gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
>>   {
>> -	if (intel_gen_legacy(intel_get_drm_devid(ibb->fd)) >= 20)
>> +	if (intel_gen(ibb->fd) >= 20)
>>   		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
>>   	else
>>   		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
>> @@ -1266,7 +1266,7 @@ void _gen9_render_op(struct intel_bb *ibb,
>>   
>>   	gen9_emit_state_base_address(ibb);
>>   
>> -	if (HAS_4TILE(ibb->devid) || intel_gen_legacy(ibb->devid) > 12) {
>> +	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->fd) > 12) {
>>   		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
>>   		intel_bb_emit_reloc(ibb, ibb->handle,
>>   				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
>> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>> index 1529ed1cc..c1ce9fa00 100644
>> --- a/lib/xe/xe_legacy.c
>> +++ b/lib/xe/xe_legacy.c
>> @@ -75,7 +75,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>   	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>>   
>>   	if (flags & COMPRESSION)
>> -		igt_require(intel_gen_legacy(intel_get_drm_devid(fd)) >= 20);
>> +		igt_require(intel_gen(fd) >= 20);
>>   
>>   	if (flags & CLOSE_FD)
>>   		fd = drm_open_driver(DRIVER_XE);
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 36260e3e5..8ca137381 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -54,7 +54,6 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>>   	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
>>   	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, timestamp);
>>   	int b = 0;
>> -	uint32_t devid;
>>   
>>   	spin->start = 0;
>>   	spin->end = 0xffffffff;
>> @@ -166,8 +165,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>>   		spin->batch[b++] = opts->mem_copy->dst_offset;
>>   		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
>>   
>> -		devid = intel_get_drm_devid(opts->mem_copy->fd);
>> -		if (intel_graphics_ver_legacy(devid) >= IP_VER(20, 0))
>> +		if (intel_graphics_ver(opts->mem_copy->fd) >= IP_VER(20, 0))
>>   			spin->batch[b++] = opts->mem_copy->src->mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
>>   					   opts->mem_copy->dst->mocs_index << XE2_MEM_COPY_DST_MOCS_SHIFT;
>>   		else
>> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
>> index 7b60ccd6c..3d981766c 100644
>> --- a/lib/xe/xe_sriov_provisioning.c
>> +++ b/lib/xe/xe_sriov_provisioning.c
>> @@ -50,9 +50,7 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
>>   
>>   static uint64_t get_vfid_mask(int fd)
>>   {
>> -	uint16_t dev_id = intel_get_drm_devid(fd);
>> -
>> -	return (intel_graphics_ver_legacy(dev_id) >= IP_VER(12, 50)) ?
>> +	return (intel_graphics_ver(fd) >= IP_VER(12, 50)) ?
>>   		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
>>   }
>>   
>> diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
>> index 869e5e9a0..6b1d17da7 100644
>> --- a/tests/intel/api_intel_allocator.c
>> +++ b/tests/intel/api_intel_allocator.c
>> @@ -625,7 +625,7 @@ static void execbuf_with_allocator(int fd)
>>   	uint64_t ahnd, sz = 4096, gtt_size;
>>   	unsigned int flags = EXEC_OBJECT_PINNED;
>>   	uint32_t *ptr, batch[32], copied;
>> -	int gen = intel_gen_legacy(intel_get_drm_devid(fd));
>> +	int gen = intel_gen(fd);
>>   	int i;
>>   	const uint32_t magic = 0x900df00d;
>>   
>> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
>> index 30f2c9465..a0373316a 100644
>> --- a/tests/intel/kms_ccs.c
>> +++ b/tests/intel/kms_ccs.c
>> @@ -565,7 +565,7 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
>>   	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>   	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
>>   	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
>> -	uint32_t region = (intel_gen_legacy(intel_get_drm_devid(fb->fd)) >= 20 &&
>> +	uint32_t region = (intel_gen(fb->fd) >= 20 &&
>>   			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
>>   
>>   	struct drm_xe_engine_class_instance inst = {
>> @@ -645,7 +645,7 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>>   	igt_assert_eq(0, gem_munmap(map, fb->size));
>>   
>>   	/* randomize also ccs surface on Xe2 */
>> -	if (intel_gen_legacy(intel_get_drm_devid(drm_fd)) >= 20)
>> +	if (intel_gen(drm_fd) >= 20)
>>   		access_flat_ccs_surface(fb, false);
>>   }
>>   
>> @@ -1125,11 +1125,6 @@ static bool valid_modifier_test(u64 modifier, const enum test_flags flags)
>>   
>>   static void test_output(data_t *data, const int testnum)
>>   {
>> -	uint16_t dev_id;
>> -
>> -	igt_fixture()
>> -		dev_id = intel_get_drm_devid(data->drm_fd);
>> -
>>   	data->flags = tests[testnum].flags;
>>   
>>   	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
>> @@ -1143,10 +1138,10 @@ static void test_output(data_t *data, const int testnum)
>>   		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
>>   			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
>>   			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
>> -				igt_require_f(intel_gen_legacy(dev_id) >= 20,
>> +				igt_require_f(intel_gen(data->drm_fd) >= 20,
>>   					      "Xe2 platform needed.\n");
>>   			} else {
>> -				igt_require_f(intel_gen_legacy(dev_id) < 20,
>> +				igt_require_f(intel_gen(data->drm_fd) < 20,
>>   					      "Older than Xe2 platform needed.\n");
>>   			}
>>   
>> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
>> index edf5c0d1b..b28961417 100644
>> --- a/tests/intel/kms_fbcon_fbt.c
>> +++ b/tests/intel/kms_fbcon_fbt.c
>> @@ -179,7 +179,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
>>   	 * For older GENs FBC is still expected to be disabled as it still
>>   	 * relies on a tiled and fenceable framebuffer to track modifications.
>>   	 */
>> -	if (intel_gen_legacy(intel_get_drm_devid(drm->fd)) >= 9) {
>> +	if (intel_gen(drm->fd) >= 9) {
>>   		if (!fbc_wait_until_enabled(drm->debugfs_fd))
>>   			return false;
>>   		/*
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index c8c2ce240..5b60587db 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -3062,13 +3062,13 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
>>   
>>   	switch (tiling) {
>>   	case TILING_LINEAR:
>> -		return intel_gen_legacy(drm.devid) >= 9;
>> +		return intel_gen(drm.fd) >= 9;
>>   	case TILING_X:
>>   		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : true;
>>   	case TILING_Y:
>>   		return true;
>>   	case TILING_4:
>> -		return intel_gen_legacy(drm.devid) >= 12;
>> +		return intel_gen(drm.fd) >= 12;
>>   	default:
>>   		igt_assert(false);
>>   		return false;
>> @@ -4475,7 +4475,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>>   					igt_require(igt_draw_supports_method(drm.fd, t.method));
>>   
>>   					if (t.tiling == TILING_Y) {
>> -						igt_require(intel_gen_legacy(drm.devid) >= 9);
>> +						igt_require(intel_gen(drm.fd) >= 9);
>>   						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
>>   					}
>>   
>> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
>> index 1ae32d5fd..f8c994d07 100644
>> --- a/tests/intel/kms_pipe_stress.c
>> +++ b/tests/intel/kms_pipe_stress.c
>> @@ -822,7 +822,7 @@ static void prepare_test(struct data *data)
>>   
>>   	create_framebuffers(data);
>>   
>> -	if (intel_gen_legacy(intel_get_drm_devid(data->drm_fd)) > 9)
>> +	if (intel_gen(data->drm_fd) > 9)
>>   		start_gpu_threads(data);
>>   }
>>   
>> @@ -830,7 +830,7 @@ static void finish_test(struct data *data)
>>   {
>>   	int i;
>>   
>> -	if (intel_gen_legacy(intel_get_drm_devid(data->drm_fd)) > 9)
>> +	if (intel_gen(data->drm_fd) > 9)
>>   		stop_gpu_threads(data);
>>   
>>   	/*
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index 914144270..0ba8ae48c 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -128,7 +128,7 @@ static void surf_copy(int xe,
>>   	int result;
>>   
>>   	igt_assert(mid->compression);
>> -	if (intel_gen_legacy(devid) >= 20 && mid->compression) {
>> +	if (intel_gen(xe) >= 20 && mid->compression) {
>>   		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
>>   		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>   	}
>> @@ -177,7 +177,7 @@ static void surf_copy(int xe,
>>   			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
>>   				igt_assert(!strcmp(orig, newsum));
>>   				igt_assert(!strcmp(orig2, newsum2));
>> -			} else if (intel_gen_legacy(devid) >= 20) {
>> +			} else if (intel_gen(xe) >= 20) {
>>   				if (is_intel_dgfx(xe)) {
>>   					/* buffer object would become
>>   					 * uncompressed in xe2+ dgfx
>> @@ -227,7 +227,7 @@ static void surf_copy(int xe,
>>   	 * uncompressed in xe2+ dgfx, and therefore retrieve the
>>   	 * ccs by copying 0 to ccsmap
>>   	 */
>> -	if (suspend_resume && intel_gen_legacy(devid) >= 20 && is_intel_dgfx(xe))
>> +	if (suspend_resume && intel_gen(xe) >= 20 && is_intel_dgfx(xe))
>>   		memset(ccsmap, 0, ccssize);
>>   	else
>>   		/* retrieve back ccs */
>> @@ -353,7 +353,7 @@ static void block_copy(int xe,
>>   	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>>   	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>>   	uint32_t run_id = mid_tiling;
>> -	uint32_t mid_region = (intel_gen_legacy(intel_get_drm_devid(xe)) >= 20 &&
>> +	uint32_t mid_region = (intel_gen(xe) >= 20 &&
>>   			       !xe_has_vram(xe)) ? region1 : region2;
>>   	uint32_t bb;
>>   	enum blt_compression mid_compression = config->compression;
>> @@ -441,7 +441,7 @@ static void block_copy(int xe,
>>   	if (config->inplace) {
>>   		uint8_t pat_index = DEFAULT_PAT_INDEX;
>>   
>> -		if (intel_gen_legacy(intel_get_drm_devid(xe)) >= 20 && config->compression)
>> +		if (intel_gen(xe) >= 20 && config->compression)
>>   			pat_index = intel_get_pat_idx_uc_comp(xe);
>>   
>>   		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
>> @@ -488,7 +488,7 @@ static void block_multicopy(int xe,
>>   	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>>   	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>>   	uint32_t run_id = mid_tiling;
>> -	uint32_t mid_region = (intel_gen_legacy(intel_get_drm_devid(xe)) >= 20 &&
>> +	uint32_t mid_region = (intel_gen(xe) >= 20 &&
>>   			       !xe_has_vram(xe)) ? region1 : region2;
>>   	uint32_t bb;
>>   	enum blt_compression mid_compression = config->compression;
>> @@ -530,7 +530,7 @@ static void block_multicopy(int xe,
>>   	if (config->inplace) {
>>   		uint8_t pat_index = DEFAULT_PAT_INDEX;
>>   
>> -		if (intel_gen_legacy(intel_get_drm_devid(xe)) >= 20 && config->compression)
>> +		if (intel_gen(xe) >= 20 && config->compression)
>>   			pat_index = intel_get_pat_idx_uc_comp(xe);
>>   
>>   		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
>> @@ -715,7 +715,7 @@ static void block_copy_test(int xe,
>>   	int tiling, width, height;
>>   
>>   
>> -	if (intel_gen_legacy(dev_id) >= 20 && config->compression)
>> +	if (intel_gen(xe) >= 20 && config->compression)
>>   		igt_require(HAS_FLATCCS(dev_id));
>>   
>>   	if (config->compression && !blt_block_copy_supports_compression(xe))
>> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
>> index 7b6c39c77..1cb86920f 100644
>> --- a/tests/intel/xe_compute.c
>> +++ b/tests/intel/xe_compute.c
>> @@ -232,7 +232,7 @@ test_compute_kernel_loop(uint64_t loop_duration)
>>   	double elapse_time, lower_bound, upper_bound;
>>   
>>   	fd = drm_open_driver(DRIVER_XE);
>> -	ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	ip_ver = intel_graphics_ver(fd);
>>   	kernels = intel_compute_square_kernels;
>>   
>>   	while (kernels->kernel) {
>> @@ -335,7 +335,7 @@ igt_check_supported_pipeline(void)
>>   	const struct intel_compute_kernels *kernels;
>>   
>>   	fd = drm_open_driver(DRIVER_XE);
>> -	ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	ip_ver = intel_graphics_ver(fd);
>>   	kernels = intel_compute_square_kernels;
>>   	drm_close_driver(fd);
>>   
>> @@ -432,7 +432,7 @@ test_eu_busy(uint64_t duration_sec)
>>   
>>   	fd = drm_open_driver(DRIVER_XE);
>>   
>> -	ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(fd));
>> +	ip_ver = intel_graphics_ver(fd);
>>   	kernels = intel_compute_square_kernels;
>>   	while (kernels->kernel) {
>>   		if (ip_ver == kernels->ip_ver)
>> @@ -518,7 +518,7 @@ int igt_main()
>>   	igt_fixture() {
>>   		xe = drm_open_driver(DRIVER_XE);
>>   		sriov_enabled = is_sriov_mode(xe);
>> -		ip_ver = intel_graphics_ver_legacy(intel_get_drm_devid(xe));
>> +		ip_ver = intel_graphics_ver(xe);
>>   		igt_store_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
>>   	}
>>   
>> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
>> index 55081f938..e37bad746 100644
>> --- a/tests/intel/xe_copy_basic.c
>> +++ b/tests/intel/xe_copy_basic.c
>> @@ -261,7 +261,6 @@ const char *help_str =
>>   int igt_main_args("b", NULL, help_str, opt_handler, NULL)
>>   {
>>   	int fd;
>> -	uint16_t dev_id;
>>   	struct igt_collection *set, *regions;
>>   	uint32_t region;
>>   	struct rect linear[] = { { 0, 0xfd, 1, MODE_BYTE },
>> @@ -275,7 +274,6 @@ int igt_main_args("b", NULL, help_str, opt_handler, NULL)
>>   
>>   	igt_fixture() {
>>   		fd = drm_open_driver(DRIVER_XE);
>> -		dev_id = intel_get_drm_devid(fd);
>>   		xe_device_get(fd);
>>   		set = xe_get_memory_region_set(fd,
>>   					       DRM_XE_MEM_REGION_CLASS_SYSMEM,
>> @@ -295,7 +293,7 @@ int igt_main_args("b", NULL, help_str, opt_handler, NULL)
>>   	for (int i = 0; i < ARRAY_SIZE(page); i++) {
>>   		igt_subtest_f("mem-page-copy-%u", page[i].width) {
>>   			igt_require(blt_has_mem_copy(fd));
>> -			igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
>> +			igt_require(intel_gen(fd) >= 20);
>>   			for_each_variation_r(regions, 1, set) {
>>   				region = igt_collection_get_value(regions, 0);
>>   				copy_test(fd, &page[i], MEM_COPY, region);
>> @@ -320,7 +318,7 @@ int igt_main_args("b", NULL, help_str, opt_handler, NULL)
>>   			 * till 0x3FFFF.
>>   			 */
>>   			if (linear[i].width > 0x3ffff &&
>> -			    (intel_get_device_info(dev_id)->graphics_ver < 20))
>> +			    (intel_gen(fd) < 20))
>>   				igt_skip("Skipping: width exceeds 18-bit limit on gfx_ver < 20\n");
>>   			igt_require(blt_has_mem_set(fd));
>>   			for_each_variation_r(regions, 1, set) {
>> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
>> index facb55854..4075b173a 100644
>> --- a/tests/intel/xe_debugfs.c
>> +++ b/tests/intel/xe_debugfs.c
>> @@ -296,7 +296,6 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
>>    */
>>   static void test_info_read(struct xe_device *xe_dev)
>>   {
>> -	uint16_t devid = intel_get_drm_devid(xe_dev->fd);
>>   	struct drm_xe_query_config *config;
>>   	const char *name = "info";
>>   	bool failed = false;
>> @@ -329,7 +328,7 @@ static void test_info_read(struct xe_device *xe_dev)
>>   		failed = true;
>>   	}
>>   
>> -	if (intel_gen_legacy(devid) < 20) {
>> +	if (intel_gen(xe_dev->fd) < 20) {
>>   		val = -1;
>>   
>>   		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
>> index f64b12b3f..961cf5afc 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -400,9 +400,7 @@ static uint64_t eu_ctl(int debugfd, uint64_t client,
>>   
>>   static bool intel_gen_needs_resume_wa(int fd)
>>   {
>> -	const uint32_t id = intel_get_drm_devid(fd);
>> -
>> -	return intel_gen_legacy(id) == 12 && intel_graphics_ver_legacy(id) < IP_VER(12, 55);
>> +	return intel_gen(fd) == 12 && intel_graphics_ver(fd) < IP_VER(12, 55);
>>   }
>>   
>>   static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
>> @@ -1222,8 +1220,6 @@ static void run_online_client(struct xe_eudebug_client *c)
>>   
>>   static bool intel_gen_has_lockstep_eus(int fd)
>>   {
>> -	const uint32_t id = intel_get_drm_devid(fd);
>> -
>>   	/*
>>   	 * Lockstep (or in some parlance, fused) EUs are pair of EUs
>>   	 * that work in sync, supposedly same clock and same control flow.
>> @@ -1231,7 +1227,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
>>   	 * excepted into SIP. In this level, the hardware has only one attention
>>   	 * thread bit for units. PVC is the first one without lockstepping.
>>   	 */
>> -	return !(intel_graphics_ver_legacy(id) == IP_VER(12, 60) || intel_gen_legacy(id) >= 20);
>> +	return !(intel_graphics_ver(fd) == IP_VER(12, 60) || intel_gen(fd) >= 20);
>>   }
>>   
>>   static int query_attention_bitmask_size(int fd, int gt)
>> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
>> index 1d416efc9..bf09efcc3 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -1047,7 +1047,7 @@ int igt_main()
>>   
>>   	igt_fixture() {
>>   		fd = drm_open_driver(DRIVER_XE);
>> -		igt_require(intel_graphics_ver_legacy(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>> +		igt_require(intel_graphics_ver(fd) >= IP_VER(35, 0));
>>   	}
>>   
>>   	igt_subtest_f("sanity")
>> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
>> index 498ab42b7..9e6a96aa8 100644
>> --- a/tests/intel/xe_exec_store.c
>> +++ b/tests/intel/xe_exec_store.c
>> @@ -55,8 +55,7 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
>>   	data->addr = batch_addr;
>>   }
>>   
>> -static void cond_batch(struct data *data, uint64_t addr, int value,
>> -		       uint16_t dev_id)
>> +static void cond_batch(int fd, struct data *data, uint64_t addr, int value)
>>   {
>>   	int b;
>>   	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
>> @@ -69,7 +68,7 @@ static void cond_batch(struct data *data, uint64_t addr, int value,
>>   	data->batch[b++] = sdi_addr;
>>   	data->batch[b++] = sdi_addr >> 32;
>>   
>> -	if (intel_graphics_ver_legacy(dev_id) >= IP_VER(20, 0))
>> +	if (intel_graphics_ver(fd) >= IP_VER(20, 0))
>>   		data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
>>   
>>   	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
>> @@ -112,8 +111,7 @@ static void persistance_batch(struct data *data, uint64_t addr)
>>    * SUBTEST: basic-all
>>    * Description: Test to verify store dword on all available engines.
>>    */
>> -static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
>> -		       uint16_t dev_id)
>> +static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
>>   {
>>   	struct drm_xe_sync sync[2] = {
>>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> @@ -156,7 +154,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>   	else if (inst_type == COND_BATCH) {
>>   		/* A random value where it stops at the below value. */
>>   		value = 20 + random() % 10;
>> -		cond_batch(data, addr, value, dev_id);
>> +		cond_batch(fd, data, addr, value);
>>   	}
>>   	else
>>   		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
>> @@ -416,23 +414,21 @@ int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe;
>>   	int fd;
>> -	uint16_t dev_id;
>>   	struct drm_xe_engine *engine;
>>   
>>   	igt_fixture() {
>>   		fd = drm_open_driver(DRIVER_XE);
>>   		xe_device_get(fd);
>> -		dev_id = intel_get_drm_devid(fd);
>>   	}
>>   
>>   	igt_subtest("basic-store") {
>>   		engine = xe_engine(fd, 1);
>> -		basic_inst(fd, STORE, &engine->instance, dev_id);
>> +		basic_inst(fd, STORE, &engine->instance);
>>   	}
>>   
>>   	igt_subtest("basic-cond-batch") {
>>   		engine = xe_engine(fd, 1);
>> -		basic_inst(fd, COND_BATCH, &engine->instance, dev_id);
>> +		basic_inst(fd, COND_BATCH, &engine->instance);
>>   	}
>>   
>>   	igt_subtest_with_dynamic("basic-all") {
>> @@ -441,7 +437,7 @@ int igt_main()
>>   				      xe_engine_class_string(hwe->engine_class),
>>   				      hwe->engine_instance,
>>   				      hwe->gt_id);
>> -			basic_inst(fd, STORE, hwe, dev_id);
>> +			basic_inst(fd, STORE, hwe);
>>   		}
>>   	}
>>   
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index 8adc5c15a..57c5a5579 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -486,12 +486,12 @@ vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
>>    * @xe_oa_alloc_regs:		xe_oa_alloc_regs
>>    */
>>   static void
>> -oa_add_config_fail(int fd, int sysfs, int devid,
>> +oa_add_config_fail(int fd, int sysfs,
>>   		   const char pci_slot[], const char function_name[])
>>   {
>>   	char path[512];
>>   	uint64_t config_id;
>> -#define SAMPLE_MUX_REG (intel_graphics_ver_legacy(devid) >= IP_VER(20, 0) ?	\
>> +#define SAMPLE_MUX_REG (intel_graphics_ver(fd) >= IP_VER(20, 0) ?	\
>>   			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
>>   
>>   	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
>> @@ -557,7 +557,6 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>>   	int fd, sysfs;
>>   	struct drm_xe_engine_class_instance *hwe;
>>   	struct fault_injection_params fault_params;
>> -	static uint32_t devid;
>>   	char pci_slot[NAME_MAX];
>>   	bool is_vf_device;
>>   	const struct section {
>> @@ -627,7 +626,6 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>>   	igt_fixture() {
>>   		igt_require(fail_function_injection_enabled());
>>   		fd = drm_open_driver(DRIVER_XE);
>> -		devid = intel_get_drm_devid(fd);
>>   		sysfs = igt_sysfs_open(fd);
>>   		igt_device_get_pci_slot_name(fd, pci_slot);
>>   		setup_injection_fault(&default_fault_params);
>> @@ -659,7 +657,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>>   
>>   	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
>>   		igt_subtest_f("oa-add-config-fail-%s", s->name)
>> -			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
>> +			oa_add_config_fail(fd, sysfs, pci_slot, s->name);
>>   
>>   	igt_fixture() {
>>   		igt_kmod_unbind("xe", pci_slot);
>> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
>> index 5c112351f..e37d00d2c 100644
>> --- a/tests/intel/xe_intel_bb.c
>> +++ b/tests/intel/xe_intel_bb.c
>> @@ -710,7 +710,7 @@ static void do_intel_bb_blit(struct buf_ops *bops, int loops, uint32_t tiling)
>>   	int i, fails = 0, xe = buf_ops_get_fd(bops);
>>   
>>   	/* We'll fix it for gen2/3 later. */
>> -	igt_require(intel_gen_legacy(intel_get_drm_devid(xe)) > 3);
>> +	igt_require(intel_gen(xe) > 3);
>>   
>>   	for (i = 0; i < loops; i++)
>>   		fails += __do_intel_bb_blit(bops, tiling);
>> @@ -878,10 +878,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>>   	int xe = buf_ops_get_fd(bops);
>>   	uint32_t fails = 0;
>>   	char name[128];
>> -	uint32_t devid = intel_get_drm_devid(xe);
>>   	igt_render_copyfunc_t render_copy = NULL;
>>   
>> -	igt_debug("%s() gen: %d\n", __func__, intel_gen_legacy(devid));
>> +	igt_debug("%s() gen: %d\n", __func__, intel_gen(xe));
>>   
>>   	ibb = intel_bb_create(xe, PAGE_SIZE);
>>   
>> @@ -1041,7 +1040,7 @@ int igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>>   		do_intel_bb_blit(bops, 3, I915_TILING_X);
>>   
>>   	igt_subtest("intel-bb-blit-y") {
>> -		igt_require(intel_gen_legacy(intel_get_drm_devid(xe)) >= 6);
>> +		igt_require(intel_gen(xe) >= 6);
>>   		do_intel_bb_blit(bops, 3, I915_TILING_Y);
>>   	}
>>   
>> diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
>> index ab800476e..2c6f81a10 100644
>> --- a/tests/intel/xe_multigpu_svm.c
>> +++ b/tests/intel/xe_multigpu_svm.c
>> @@ -396,7 +396,6 @@ static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>>   	uint64_t batch_addr;
>>   	void *batch;
>>   	uint32_t *cmd;
>> -	uint16_t dev_id = intel_get_drm_devid(fd);
>>   	uint32_t mocs_index = intel_get_uc_mocs_index(fd);
>>   	int i = 0;
>>   
>> @@ -412,7 +411,7 @@ static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>>   	cmd[i++] = upper_32_bits(src_addr);
>>   	cmd[i++] = lower_32_bits(dst_addr);
>>   	cmd[i++] = upper_32_bits(dst_addr);
>> -	if (intel_graphics_ver_legacy(dev_id) >= IP_VER(20, 0)) {
>> +	if (intel_graphics_ver(fd) >= IP_VER(20, 0)) {
>>   		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
>>   	} else {
>>   		cmd[i++] = mocs_index << GEN12_MEM_COPY_MOCS_SHIFT | mocs_index;
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
>> index 96302ad3a..96d544160 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -119,14 +119,13 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
>>    */
>>   static void pat_sanity(int fd)
>>   {
>> -	uint16_t dev_id = intel_get_drm_devid(fd);
>>   	struct intel_pat_cache pat_sw_config = {};
>>   	int32_t parsed;
>>   	bool has_uc_comp = false, has_wt = false;
>>   
>>   	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
>>   
>> -	if (intel_graphics_ver_legacy(dev_id) >= IP_VER(20, 0)) {
>> +	if (intel_graphics_ver(fd) >= IP_VER(20, 0)) {
>>   		for (int i = 0; i < parsed; i++) {
>>   			uint32_t pat = pat_sw_config.entries[i].pat;
>>   			if (pat_sw_config.entries[i].rsvd)
>> @@ -898,7 +897,6 @@ static void display_vs_wb_transient(int fd)
>>   		3, /* UC (baseline) */
>>   		6, /* L3:XD (uncompressed) */
>>   	};
>> -	uint32_t devid = intel_get_drm_devid(fd);
>>   	igt_render_copyfunc_t render_copy = NULL;
>>   	igt_crc_t ref_crc = {}, crc = {};
>>   	igt_plane_t *primary;
>> @@ -914,7 +912,7 @@ static void display_vs_wb_transient(int fd)
>>   	int bpp = 32;
>>   	int i;
>>   
>> -	igt_require(intel_get_device_info(devid)->graphics_ver >= 20);
>> +	igt_require(intel_gen(fd) >= 20);
>>   
>>   	render_copy = igt_get_render_copyfunc(fd);
>>   	igt_require(render_copy);
>> @@ -1015,10 +1013,8 @@ static uint8_t get_pat_idx_uc(int fd, bool *compressed)
>>   
>>   static uint8_t get_pat_idx_wt(int fd, bool *compressed)
>>   {
>> -	uint16_t dev_id = intel_get_drm_devid(fd);
>> -
>>   	if (compressed)
>> -		*compressed = intel_get_device_info(dev_id)->graphics_ver >= 20;
>> +		*compressed = intel_gen(fd) >= 20;
>>   
>>   	return intel_get_pat_idx_wt(fd);
>>   }
>> @@ -1328,7 +1324,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>>   		bo_comp_disable_bind(fd);
>>   
>>   	igt_subtest_with_dynamic("pat-index-xelp") {
>> -		igt_require(intel_graphics_ver_legacy(dev_id) <= IP_VER(12, 55));
>> +		igt_require(intel_graphics_ver(fd) <= IP_VER(12, 55));
>>   		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
>>   						     ARRAY_SIZE(xelp_pat_index_modes));
>>   	}
>> @@ -1346,10 +1342,10 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>>   	}
>>   
>>   	igt_subtest_with_dynamic("pat-index-xe2") {
>> -		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
>> +		igt_require(intel_gen(fd) >= 20);
>>   		igt_assert(HAS_FLATCCS(dev_id));
>>   
>> -		if (intel_graphics_ver_legacy(dev_id) == IP_VER(20, 1))
>> +		if (intel_graphics_ver(fd) == IP_VER(20, 1))
>>   			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
>>   							     ARRAY_SIZE(bmg_g21_pat_index_modes));
>>   		else
>> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
>> index 318a9994a..ae505a5d7 100644
>> --- a/tests/intel/xe_query.c
>> +++ b/tests/intel/xe_query.c
>> @@ -380,7 +380,7 @@ test_query_gt_topology(int fd)
>>   	}
>>   
>>   	/* sanity check EU type */
>> -	if (IS_PONTEVECCHIO(dev_id) || intel_gen_legacy(dev_id) >= 20) {
>> +	if (IS_PONTEVECCHIO(dev_id) || intel_gen(fd) >= 20) {
>>   		igt_assert(topo_types & (1 << DRM_XE_TOPO_SIMD16_EU_PER_DSS));
>>   		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS), 0);
>>   	} else {
>> @@ -428,7 +428,7 @@ test_query_gt_topology_l3_bank_mask(int fd)
>>   			}
>>   
>>   			igt_info(" count: %d\n", count);
>> -			if (intel_get_device_info(dev_id)->graphics_ver < 20) {
>> +			if (intel_gen(fd) < 20) {
>>   				igt_assert_lt(0, count);
>>   			}
>>   
>> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
>> index 0a6ae9ca2..a3976b5f1 100644
>> --- a/tests/intel/xe_render_copy.c
>> +++ b/tests/intel/xe_render_copy.c
>> @@ -136,7 +136,7 @@ static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
>>   static bool buf_is_aux_compressed(struct buf_ops *bops, struct intel_buf *buf)
>>   {
>>   	int xe = buf_ops_get_fd(bops);
>> -	unsigned int gen = intel_gen_legacy(buf_ops_get_devid(bops));
>> +	unsigned int gen = intel_gen(buf_ops_get_fd(bops));
>>   	uint32_t ccs_size;
>>   	uint8_t *ptr;
>>   	bool is_compressed = false;
>> -- 
>> 2.43.0
>>
