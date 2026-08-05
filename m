Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22BEC55822
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 07:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BD310ED5C;
	Wed,  5 Aug 2026 07:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joGFh8aD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5FB10E1CA
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785916318; x=1817452318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bl1Ajx2HApC9kAq+iYvLnagd6+kF8d0fMnmRfR0Hhac=;
 b=joGFh8aDrClQaLXZVCnQUpjdEIrt+5eKP3WomQ2YZs253X+odxaKm8jd
 OuO0L5iZCVAKWQDKyQ/VnmtLDOsLV4D5Vd/S6Wr9iMk+EYfoKxVHwu8c+
 8uKmP/0KQClrgKIC1V4gxwJXNOUs3z7rxTdbBoju57NT2zFdStrzmDcBN
 I+5k72gqVoMHXPiFRmHTDv+L9Hd35oqGl/iRP4LOsDbvV3DDeqRkwEihZ
 HPpKrpU7IBJElOfXA5RHLsjpLuxCmPcwgzKuJMT8MgNysIIv4PFNY/37u
 dc0M+HG565EoGv186uHhMfBZHRr0g0aHLH5aymdCi6xGNY3PjrRWdxfFT w==;
X-CSE-ConnectionGUID: M8z4MrGpQGyH1GWPC4P3CA==
X-CSE-MsgGUID: wElY0xFGT7ewJnHjKxRQlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86560480"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="86560480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 00:51:57 -0700
X-CSE-ConnectionGUID: dDuNGQDOStq1pnJyoqWwBg==
X-CSE-MsgGUID: qz6RSSNYSwqcex+4YLjCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="259115902"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 00:48:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 00:48:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 00:48:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 00:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie5Rw7178FNylii69AaZuKpIBIbmayXMJXBA/2BBB/ldDXderxBBKtsZFvAiznP+7rhHAEBvc3bSYWJ7XkAlfv0mBcKX/qwDmtzUOpqul0Va4G55Pu3fG33twRXxl2dMsB4WOAJcEQeeGhgIARM4go2gINmgO0qphAO1tTZTSnrd4TbA8EmzpN8ZuVL8iTGQpCsRVvWWgqNRBPTA4OZf3ghJM3fihRjBrei3MX4qG9xgLufs81R1phCyOVVIEaA60q1F/kWP/87yOzmLLKTz+TmoqalENa1ylFrghjAecnbiNC/MBOlDaBrSQZk9KuAO/Mq1rATjWDbqTJrhE9G5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj7InnTRoVm4DmbfvamFZEi/IoqxSIzLGkU4H7v16Jg=;
 b=CW+UeDZESomDDxp9RCdaefp50T4w/EpL6Xa45LDf1/b6Qr+Ay/wE23qx81wGeH8kpa7FPrVr7nWspwjsGh5quHr5THN7IU0sFB86YaWbVkfw/FyqCwerbJshJud1L7oPu60JeKGv9fPDFqEreWpGwrkXXQaaDJqroKjYo+x202SSPMOdch22er5UOKZRi4uD9MgvxRY3On0TqzZcq7FeLblPgaT9PlV5AsC01rq1xooSryY4wxFl81arNaMiF+ej6Fax7On7I+T93A4V7e+4loTRvwL88QsRHn3hccVa8Ob33vjbWftLuRdhF6kKnliAG/5MKhOyDQajyHvdA4xUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.15; Wed, 5 Aug 2026 07:48:26 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:48:26 +0000
Message-ID: <271f76d7-8042-4f70-9ef5-441f41d06904@intel.com>
Date: Wed, 5 Aug 2026 13:18:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] lib/igt_kms: Skip joiner exception modes in
 boundary non-joiner search
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260728060003.392870-1-sowmiya.s@intel.com>
 <20260728060003.392870-3-sowmiya.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260728060003.392870-3-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d153cd3-52f5-4aec-3eeb-08def2c5ee6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jKeflpNJh0F/otHvkMqIenhbsdnkFOBCaGgS20J3JoxaO7JB0m2nyl9dZmqce4T1crSWKLZu7ozZk3NBIrol22UqXxJUGCT6NcnCup5SHkKmawG3CpvQUTJvHXBnq1PjSqVsrTzitRIMIPhBj58/HjyR01+ukbFxAvGxzug+wZZ+R6T5DbFdU8L/z7muq2WhPm3s/OkcpY5TXfkMPB5XG6aBDqGVgOT/UaryRu5xfptck9U2M4ZIabZWP+N2N/1Yda0IVbgTHzOKbjFRmC/jjNWxHzHdOsKEaQlbk6WlAWYaU+fTWjojhC+R0JXf0b7ta0S8vDq9tZslGQdvGUS5jhS4PTrfmENIPu5ax1EBJE81BUqw5RlDIq6rKE6uHgjMpe/t/Jm2+AtTEX42GpDaYlhrr2cGJtuMtpl+lY/Dm7o2/4p7ryKeNn2Lfme+/1+JRo4bJo9pwB54BOTf1rT1qsgs0T9eyGPkPQR2lckkuuU7jocHspuhb32NUq2+4w+C6aekEqZofXOyHvvo3/fInO1BBLdFn5G+K31fvueHmNar89e6x1kPfT5OVF++1LZht2XFnyLTQ3NkoQ5xCzMnxZQyvJv7KRWMzGup4R+k+zupG2fY77PpHoiHCKNcgpVgOzVT11gDPGJVDkDH9CcNFBsc5orJISNZULTB6K71Eag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1B3N3M3MFpQUVZ6czFuRWN2b0J6WlZYWnFRQmJHWTA3TjZJSXh3dGR0T1Y4?=
 =?utf-8?B?YkJRM1JQYmYyVnhFZXBLN1NSZ2NsU0NxS3BLVWhnalovSW5INmZOUkVaNkFx?=
 =?utf-8?B?ZEUzZ0dwVUZ2VkY5V3VUQ2NDZXZVOUY4ZDEvbE9IeHpSY1M0L0pOUmY4L2RZ?=
 =?utf-8?B?MXhCNThwd1FrK1ZQTWVKUUdwcjhQZGk1dHFPb2paZndmYml6ZC9NaUl5c0Ro?=
 =?utf-8?B?NGlxbHZRWU9GaEFET2VPSFpNM255SGlzbmtlcHc2OTdBdk1sQWJycWRlakMy?=
 =?utf-8?B?TkUwcEFOcy9NcUlWR2EreWZsN2pZa253TEpqV0RCUkY3ZFJjWHV3WWZIbXFk?=
 =?utf-8?B?WGJyY1ExRnhWNW55Zk5iNnA4RzhJNWdtb2xKRlZFU1Eya1pZbEZqT2lYT1Fz?=
 =?utf-8?B?ek5ESlJhYi9KVVZNYXA2Tk9JTW9DejhnNzdXNGJOYlA4eEtrbGVmbTNLWUVw?=
 =?utf-8?B?a1FRM2E4aks2K3VGaG44TW9rdkRsWEtDR0tlNU9pYnlXZFNNWFg5d1JUMmdi?=
 =?utf-8?B?azlOWWNkMTBtR2kvd3hRUWx5L1B6NDdIV1RCLzAzTzh2QkVxbHYxSlVUWXNl?=
 =?utf-8?B?K29CMzVxVGVtVlZmWFJpL0Y3OEcrZTBjODdCUkxxTWVLOC9sb0UyNU9McGMz?=
 =?utf-8?B?bW5SSlJWSER6T3MwemE0dHZmdEQ1REhMN1QyektQV0lRMHlrd1BRU0VyKzVK?=
 =?utf-8?B?YW9Zbm1HSEYzMWJaOWI5NzdEZXZGUkpOSFBBdXcwVjcyWnVJV0xab2kyZG9i?=
 =?utf-8?B?STBCeDE0bDNZTmpWbUpxSnMwaFlNM0NJZXJxY2tRR0hiTUwxNFpZZDBDS2V0?=
 =?utf-8?B?MEdaMkRGK0YxK0x6TjliYTRRck5zWVhtM3Q4RkNXd3ZBR2ZEc0oydDI3RlU3?=
 =?utf-8?B?c3ZlbStPcndHUDJKUzZHYUVWQTNhMEtyKzhvdEJuOWY3L1NUZUkxNUxFc2V4?=
 =?utf-8?B?TEcvZGpXN0pkMWtYQUNYQm90T1Z1TjQzWWh2TlV1Mm1yd0dXcWtkajV3eVRF?=
 =?utf-8?B?a1ZvZnVrbkFYWDJya2dvMEMrNGRKc25lQlNCc2ZoQWMxOEYwL3FRcDhrM3Mv?=
 =?utf-8?B?ajZlMUFRYVZqM2VScnJXbTUvbXdCSzVYbmlNTlFEV3VKVGpnWmR1WnZSSzhG?=
 =?utf-8?B?THpRaEt0ZThBMU5VeS9PRnlhREs3OGdJTW5SKzE1eXlZTlNqNlZKcFlLU2tV?=
 =?utf-8?B?ckNFQ2RYaTFack5Od3F5cHJoWkNqdjJSQVBrYnRhTXE2MXBycmkxNWlqTjJO?=
 =?utf-8?B?UjNURnN1bThZdkQrN3FwajZsdTJlam1SOUxZZHFLLzBKcSswdmllaG5ONlli?=
 =?utf-8?B?dW5lQzI1UFNIK2k4TlNkWnFqdE91VWVRVE9LWGtGY2hLRmJmVklad09ITHZL?=
 =?utf-8?B?RHA4a1JCaWZBRjE2ZENBL2VtUFMrZWFRNXdDT2JKWXlKUG0reUNGRnNsVmxW?=
 =?utf-8?B?bXZGWlRnYjZLQjBIZ2FEVUgzTGV3VTdBaU45WFUrMVE4UEkxajFmc1VMRENh?=
 =?utf-8?B?b1hrU2FVaUlyRjYyL21taEQvdHcyenc3K0N6WkpLTTMzM0xwdE5qelB6SDZq?=
 =?utf-8?B?Z2Q1SThKT3pWd0RmbE5RNTNVSTEvM0ZqaWlLeldiY0tCdFZDVjMrTmFUZmZZ?=
 =?utf-8?B?M3ZFaitPdG14TEFjZDV5K3p4NFkvZ1hFcnRqWU1uNEdRWVlSeEVmZkE3RHpy?=
 =?utf-8?B?bmdZOHNyZ2IxOC9PS3N5ODZwVWVjeGVXdTFza0wzVlBONzllR3cyakwyaWFZ?=
 =?utf-8?B?ZGQ5ekFlZm9qOUxLY1d5SGlQeklzQnFOdzAzV0VldDdWbFhFM3VpRktoU250?=
 =?utf-8?B?VVJKbTFGQmNOS2NmRy9HL1RTbkEwdzZ4d1Evb2xCQ2lZelYwVlMxWWNybDZB?=
 =?utf-8?B?a1Z1YTRyZUZ4K3ZNNnNtQ2xlUEN2c2lnM1lkUmhyZEs0NUpMTFpRNnFjSXlh?=
 =?utf-8?B?SVVKTWZzb1BxaDk4Y1YvWHpKelhrd0J1ZjhPSzZRZmV0YUFOMVVyMCthRVFZ?=
 =?utf-8?B?cVFmUDhoVkRvODJGc1ZmVjg3UUZ2UkZqSCtPZkc1ZEg5YUlvMzAzQ0x2Uzd3?=
 =?utf-8?B?bC81RGxtWXdzR2hKM0xFSXVuM0VadXFqdWdhMlhNc3RrMmhkMUY5akdXc1Ew?=
 =?utf-8?B?MWJaYzFLdGhJajhqNUZlbmlFaTVuRHBLbkU5dXJuSHhnTk5wQlFmelZNMEFD?=
 =?utf-8?B?Wm13cmVRYVhjWXVzTnpnUEVaQjlydWFxdmoxWTJqYm56ci9iMkhpdEpnQWFS?=
 =?utf-8?B?QlZiV0l0emx1NUg5VDkyOFpubkRLdkNCcmxHVUovUkVHdUQxSDUyVVFTMEFF?=
 =?utf-8?B?OXdvTlVhdFp6aHE1RlFuS3dUVzZpVUJHTmttR0tJTVJsYnlNVE5CL2VLV1lZ?=
 =?utf-8?Q?BBqbIQXCwBhisvp4=3D?=
X-Exchange-RoutingPolicyChecked: PWhgrqmcsZrZipUTphD8azfsNvh2Ab8TP91X1/G8sGiCzHSwV0YgrYFnWmqxSvPPRjmG8nEmBxezQoMS9jFKhceyAWqDHlBy1IBfLsFvqcJa4R6CH+xh+IyjAVYrkrtV0la1y3S7OzVniGh/9iyu1xK9zM9LxRS1n5zXZCfl4ImiMMBRIOmAhJggvqbwkrXD020IKYfedP05M9N2DRVxzHib6c0iDc/NvVj3Ld9G5kWUuRe4mHp1AmqGrzWsmR1/qPzJHMqdawnGkiRA1Wso99dVlxia1SAJdQvknsbkbowIBOErnfxjtricn2J2Ldz7LY02yqVsDXLsYu9ly2/jAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d153cd3-52f5-4aec-3eeb-08def2c5ee6c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:48:25.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIy9FjIXTUXc2/z5fH5OHU+m0WLG4hTlKJHrudBjO7IWcALUwuHv8dOjRX5tU38RpWbUmA0TrXnLYYTbWZsGS/HQG+h0wzOapoKZlIu/pHQHX63BBTka0XilS85HB/+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
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



On 28-07-2026 11:30, Sowmiya S wrote:
> Fix intel_boundary_non_joiner_mode_found() to skip exception modes,
> preventing test_basic_max_non_joiner from incorrectly selecting a
> joiner-required mode as a non-joiner boundary mode.
> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   lib/igt_kms.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d591e696d..2475f0916 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7192,7 +7192,8 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
>   		drmModeModeInfo *current_mode = &connector->modes[i];
>   
>   		if (current_mode->hdisplay == max_hdisplay &&
> -		    current_mode->clock < max_dotclock) {
> +		    current_mode->clock < max_dotclock &&
> +		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
>   			*mode = *current_mode;
>   			return true;
>   		}

