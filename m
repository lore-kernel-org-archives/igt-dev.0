Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EC1C83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 03:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD7C10E692;
	Thu, 17 Jul 2025 03:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYNcTmDy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F86110E692
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 03:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752724756; x=1784260756;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+5aT+R8fmERFrghvaihqITDBdHwmU6wCO/5G7bj9TfQ=;
 b=VYNcTmDy8BceL3ykQyNH2J7YbNpU0RrHzTyWgp6K837tciuWNpV39+6D
 laEd5Hl3jxgfcwBe7b2uOTnZTqJw701ga+D31H0++CpIilHYWI6CCeFsf
 6VKZgYl+pi6XXafQPwwT3KleE5+qZ5uEcbL5lMcFqspGec7BoP9NRcmJx
 aj8EBax3c8+c06SqG98bsbzWHXB/rc0P6eQEi3BYWqnopHWYkgABbjFOh
 1oHIwyH1Xul0g07/TMyzF4xR6S05TigtVCALbGUx72IzmHr9vJXAEl/Xv
 DX+2sGJIIwei/m7GilvABgmGxwVXnVidNTHL1c+a5czPD7Xwpe68nQJTu A==;
X-CSE-ConnectionGUID: IKE5Plm1R4uPbwzNsD0Bzg==
X-CSE-MsgGUID: ztg/YqqHTlubW7Os4awjTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54703808"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="54703808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 20:59:15 -0700
X-CSE-ConnectionGUID: T8n6iyJXQAijrQbuGz/i0A==
X-CSE-MsgGUID: xbxhxO7jR22SOC9a/ylEpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="158034529"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 20:59:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 20:59:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 20:59:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 16 Jul 2025 20:59:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogRrBhOCH7D5xIsrwZv6HqgChMUQp1TMZJKWkvZEuQCbDh5JGB90kN/5GP8zvnMpcykEY237k9CYt7EH7aT5UNeNw0zTETw2/Xy969FNAHSzWRiL5CCA8yQLNLXjkmeCvqElCWC7DHNS9gT1n9p3gtfVD7/2O768F11Up95cE1dO7UFuZZTBaa/kVq6NkpVTodQNmiX2vhtUZHzyim/wh1FvQeG2IK0w53b4eMl2I4zWDyQIHok1Je1AaQ4NZqJPl9vsx2KOucAPQdn5ZPTqwDQT/Yfs2xAxQ+sszrJdx3Opr7V68UDWxBv+UteHfCb5FPSzjCC71KRkOt6J+E3+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0ct6PotGI/I6QQpiShff8JrVHMZ+egsk7EkIPUlsLU=;
 b=F4GDCWoC0tVbwl8WLKnPW3IG+6kvpM5LB/uPwnkxpzwlxy/RbnOGwe356agseKk9+z3b4eRvAtd27q9Vl025PQ/SL+hvuQ+EPS1yDDZf7XbhnC+MYTdfOtpKIGTle4jXuJrMx8g16V4Rzj6v1YxDB+bHhT8tifaHx8kFmHJcP64UmMUcI5punfaKmYnfrgzSz984wHJWRBbQsmPb5oFJTivx3ChZFgxYEtC9o4W9ZnPNwU5aXVwaW+zpQOmaFylgeQhdjtMov2sVoRT0XTSxtsYbwgaoS+oTIaXRUXrbC5ar6nObGXDl6FXYeYRFS5VBsBym+K4ESdSKqX5d2KZR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 03:59:12 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 03:59:11 +0000
Message-ID: <dca7d17c-17e7-4433-984c-b4bfdd8a7507@intel.com>
Date: Thu, 17 Jul 2025 09:29:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_fb: Add helpers to identify planar
 and packed YUV formats
To: <igt-dev@lists.freedesktop.org>
References: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
 <20250715220810.287204-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250715220810.287204-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 35954ab9-f47b-4395-068c-08ddc4e649ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVc5TjJHUk9uVHE5cUlzYXN2MTBLdXo4cmY5Mmgzd3RZVlh5K0cxNW1UTGk5?=
 =?utf-8?B?bWNvMG0rczFRdHFmay81cnBNQlVRemdkQ0lhekNwWC9NdHdJQzk3VlNXeWMr?=
 =?utf-8?B?UzI4MjlBNW1TaG9QdFp5UE5OODdRRmJteVZoKzJpUFpTZHZvOWhUajJyNVVu?=
 =?utf-8?B?empmanlWUldjbitzV29TbWtjeUFEbGhUV2wraHorSHlrbHR2MmlGRzdQMlJt?=
 =?utf-8?B?UDJYb1JEKzFaaTRGNUZYK3A5cjFJU3FOU0JQN2xxM2NMWC8wM2JsK3pxK2Fu?=
 =?utf-8?B?cnV5ZjVLVUVDVVRiZFpDWGVuekJCT3ZjbHU5NnIrZjlsdVBIRDNIckQrVGpP?=
 =?utf-8?B?L1Axdnl5V2lGUExJRkRkQ3drM1AwclB5V2NaWitOaUQwTWhQenp6dGVJRTFJ?=
 =?utf-8?B?eUpOYzJtWkxsZUhKTlRJNUhuNHVkd3Z0MGlhM0tSRkdvVUdxQVZHRGJta0JK?=
 =?utf-8?B?Wkl1aVdFelhCdS82SGsydUlEUkxobEtCZXQ1SEdxTmxIQ3l5REc2UEdkMUh0?=
 =?utf-8?B?WHQ0SE9EZW9HYmZ5RGl2T1EwWUZkUEtsWnNjWGcyTUZOOUh3aUZZUUorMXhT?=
 =?utf-8?B?dnNvSVRETnorUnFjWmNCYnNPOFd1QlRwZGcvYzhvT0tzY2hMa3AzNzBKc0pB?=
 =?utf-8?B?Z0t4TzdVNW9ROThOK0NLVTRYR3lmRkRJeHlUeDNIb2hMYmhlSURKN1p2Slhq?=
 =?utf-8?B?dEhFbFpTV2xreUlSbDJjUnR1U3Bjdm5UTFc5dmRaUzNiamlBeDNrRDY3bDE0?=
 =?utf-8?B?dFF1SlVjVU5uR1lvelY0MXBpV3NXbDl6QVRVYmRpSExldlBmamtnUlZaUXRZ?=
 =?utf-8?B?UGhOMHhmcXZnTjlBTkFFLzlmQ1pMKzhRejNhZ1Zub3ZZblAxU3ROa2JaWk5Y?=
 =?utf-8?B?WVpSbk1Pa09wSklQNS9NZ2p5RkwzNWx1a2V6UVBUbGNwVTgramJ0WDhzS1JS?=
 =?utf-8?B?Vjl5UGtmMStYWTNyd1Y3Z1NlUzh6cldKTkFyTjMwd1Bka1JicmFXeG1OY0k4?=
 =?utf-8?B?eXV2b3FIWUVUSnV6c1NISm55dEk4SVBocFlnL1dYS3p0TWxhTlpUQUx4VlJ3?=
 =?utf-8?B?SnRXNFRPYldOekpFb1BDcll6NmYvZyt1M2Jjdk9UTmxUZU84NWVGeGNZdEJh?=
 =?utf-8?B?cUcvTFFmdHZwcGVZN1FtaG9WcUt5NW1ubVdOVXM3MllFRmx1OTZMOERlRGJC?=
 =?utf-8?B?VlltTEZ1M3JvdjlublRxOEVyWTNzSmFjc3N4Ujg3OUZDV0w4T2cxSGhBUWxX?=
 =?utf-8?B?N0h4cUZqejc2ZkFJZnRZWDFObjJEdFEwb21WV0VZMFZrUTZHWWpJT3RMN3Va?=
 =?utf-8?B?NWwxUGg1OGt1bG8vVGJ0cDF2Z2Y4Q2FTdnRRRDdDUVFuVVcvOVBSQmpnT3U0?=
 =?utf-8?B?S1JFTnlUL1llWWxqRk1EZUE0ZmtjMXZhSlBPdUthQ3h0Yzg1dy9DbzJZc2lz?=
 =?utf-8?B?SkkvUk0yOHNaZ1JCUWdEeGdUSXgvUDIxakxsMjl2UEZ5bzY4VTBObTNaTndH?=
 =?utf-8?B?citFZDVuc3BHai84QTA5MEljSGJZSUsvQWFJY0Vuc3Jlalc2K1FnaFh4azkw?=
 =?utf-8?B?YnZxZkYvRUM3eVhvamVTa2MyNmdmMDl6bGtubTJzVytiOUkxd1Q3MjZWa2pE?=
 =?utf-8?B?WTRqK2ZjUi9uUXl3RjE5dlFkUVdDWFVzdXBGN3hSazJXTjM4KzFjV0p3aTdm?=
 =?utf-8?B?R0hWTWU0bmRrcTFqTCtmZ2J1UGxHUzN2dU9kalZKbFNDSkdNWkxPTURmSFlY?=
 =?utf-8?B?Qng5bWhqM1BZRnc1QTYwUmtaeVlkMnoxM3AxZE9pVEJtTzhVbC9oNngzenF3?=
 =?utf-8?B?MVZUQW5jMElZZ3Yxc2t2Q3JEQ1Q1ZDBJeHB5dFFxV1RoZHhIdUdkYURhdzZS?=
 =?utf-8?B?M0EyUHdjZnBwb2Vhcm4raFN1M2NyVTMxc1FXc2ZlYk44M0VPTWxaSEoyVGlx?=
 =?utf-8?Q?OFmAAh7uq7c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWg2SERoSEFDVmgyS3pyaGxZUUo3YTUxNnNGZG1hc3Jtb25NNHpjQUI2aVgz?=
 =?utf-8?B?RzZjT1RlWklrc3d0dTJzRlhFTnFCemh6dHIyVXFTRWVZamdsMDZjNDRhYmN6?=
 =?utf-8?B?TTQzWi9NTE9UL3dtdlZMcnJONWoyTHJ1alZTbWF5YWlxeExGcngrUHk0Nmtr?=
 =?utf-8?B?QVF4Sm4zb2ExWHdod0hqOUpaajNMbjFheXNNSUl4dHgxcm1xK2M2R0J5WWNr?=
 =?utf-8?B?clpXS1EwU2JkdjRQcFMrREZMWG9VSGxESnVDNzJPQWw2VUJKRW5HYy9KaHg1?=
 =?utf-8?B?NXhQdUxlOXkvL3J6VE9tZnk0UEhQWDY5dmV3enZBY0daZVZDVE5ITUNFYXd3?=
 =?utf-8?B?eHNqdlVkcDZIckZicGYwcjh6bHUveFdvZDFMVDVqbEJmVmJpdGRKVGxoNTk5?=
 =?utf-8?B?ZWlSMSswMCtYc2Ura2c5S2NNQjhQRzFrbHY2U1kwTE9Ec3pqeWpUazNwSmF6?=
 =?utf-8?B?MHMvUkI3OUQyMWRGVHdZekdLZWRiT2VQRmNpZTFOa1JiK29HcnVSUWxpenZC?=
 =?utf-8?B?SkRQd1YycHkyMFlIdlhhbkIva2I5VXdVdEVzMU5kTzhjT2hJNk9Db3V3KzBo?=
 =?utf-8?B?OW9ZNVNqdDI2RitGYU5HVGxLWE5IeFBMMFRjRkNERkFPTlRVdG1pcVd2YU5o?=
 =?utf-8?B?TlpZdjhMT3ZLcW8ydnVCbWppQWpZK244WWRQaWF0OGdKQVduZlJEaGNZcnRi?=
 =?utf-8?B?VE5nOVJVenNGNXk0bVlVYkdiRC9GbDZxakF3RU5CbUJIQ0V6d3NZVm56ZDdW?=
 =?utf-8?B?bHRtMG1lbmxFWWVRWmprcmx6YXg1T3p1c3N5enJFWDI4ejRBOFZsUEZEck01?=
 =?utf-8?B?QlFyTEhZUE9WWU5uby9abk9ZSlgvWUxNZDFCZ3FQc2twNW1CTkd6bHBCSHly?=
 =?utf-8?B?dEJDWkRXbzNIT0xsaTI3S2ltVTNDVEdEODkvaG8yR2JSdzFMbW04QnpiaGdO?=
 =?utf-8?B?UzZJMnllVWgwY1BET0xrbVRIVEpJZFFQQnZuL0N0OVUvS0NMQ3AwaXg0MTFE?=
 =?utf-8?B?aGtSS04xdXlwd3J2Vi9iNDZWYTg2d1hhdnRlcndlVnN2UFJMdXpBWW1ONkE5?=
 =?utf-8?B?YXQ0U01jTGlraUlabDBXVndmbTEvc0dtQlBsUkJIU1pMbVlxVlNkTkk0YStY?=
 =?utf-8?B?L2JqeSs2b2pSSm9lZzdTTjBKK3ZNbUgxMUl3RmlreFJuN1JPbkRvUkpOcjF0?=
 =?utf-8?B?WjZVbFFjMmJPOFNiQXU3Vk9ja1dPZExOWWxMU2RpdkZRVkNuOXlpSkNSaXln?=
 =?utf-8?B?UHRrYlYzdHRPdzBLdURxSFNLVmNiQ2FVYWxCc2N6Ui8yUU9KeElGMGhIMVVj?=
 =?utf-8?B?Y2Z5MjFoR1RIYVkyWHdtNE56N2xmN3BpWm9LWGdhT1U2SGxNbXd6Uk85dzF6?=
 =?utf-8?B?cFQ2bVdSbDJHZU1YbGp4Qlh4RGZ0WU0rQ1pOUU5vcE5kRlJwSHhZaFNwVlJ3?=
 =?utf-8?B?NUhEaWdxZWV4SjNZWVg1bWRUKzNVaEc2NDdsNWJFLzUxTWw4MnpHaVNoT2wv?=
 =?utf-8?B?Y3lqMUxhcm0wVGU3KzZJWVhVMXZDYjBMRGZYNU1zcDAvNDg4eW9MdkdEdVZa?=
 =?utf-8?B?N0F6UVhyVUpXMC9EdHNBU2ZXL3VQL2xUc2RDa05yZThjQjY3V0lLcXkyS2JB?=
 =?utf-8?B?SHBBWTlWZkNmRGlJRksvT2ZtNjMwNHFKUm45ZWFIWlV2cHJMaXJiODJiUlBy?=
 =?utf-8?B?b2xxRlB5Zko5UXdJVXVucGVUR1NtSFRVNmNaOEtMWTBhakRKWTdPbHlqbHp4?=
 =?utf-8?B?c2VZQkVNQmVaUisvZkJDUWZDK2FxU3V0N2g0Mm5WcUVLSXI3Q0w5c0FKSlU3?=
 =?utf-8?B?MkxVV1RlTVlBeVdaUDZqUHE2QWJUZnlmYmZTbW9xVUdkRXhIeHhiUzlra2lm?=
 =?utf-8?B?NlFkZk9QajB6MzFDYWxmTGRiTDdROTRQRCtxU1p2S1lIQkFvMzRzZ2IxUVB3?=
 =?utf-8?B?ZWkyNU1JY21STmZMeFd3dmNuSkFOd01YZ3I0UXRVK3VWQXQvVUJKTkJkbkpn?=
 =?utf-8?B?N3puU2ltenpMWVV4V0tUeFpleExmSU40MGhaNlBITnIvNFZGMEpxaFh0T2Vs?=
 =?utf-8?B?b2lqSTNTRW9NU1BzRDRNZFZZNHBmWDlYWkhpS21lTkdBMW5UdjBrY2ZwT1lo?=
 =?utf-8?B?MjJwd2NYUHcxV1J4dnR2OEN5aWdKclEwdUtPRW9hSXZkMTd6QUZ4aGF5Qjky?=
 =?utf-8?Q?mb+Iiugb8RRiYY3KDggYkjg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35954ab9-f47b-4395-068c-08ddc4e649ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 03:59:11.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TDf+OL0FGPy9PHL2c7mBeTjuRnuZe+uDJV1Ii50cqxqhHuZBJdOXKnXQX6ifa1z36a/DIVFZtP9EE4iSCQre7sK4jjCPv5QDMdyURLL8jX7r55JvQ4Srt1jc17IzUrj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
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

Hi Rama,

On 16-07-2025 03:38, Naladala Ramanaidu wrote:
> Add new helper logic to distinguish between planar/semi-planar and
> packed YUV formats. This classification enables more efficient test
> coverage by reducing iterations in IGT, allowing tests to focus on
> relevant format groups based on their memory layout.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_fb.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_fb.h |  2 ++
>   2 files changed, 59 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 9fc1bfc65..f68aeaf42 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -5044,6 +5044,63 @@ bool igt_format_is_yuv(uint32_t drm_format)
>   	}
>   }
>   
> +/**
> + * igt_format_is_planaryuv:
> + * @drm_format: drm fourcc
> + *
> + * This functions returns if @drm_format is planar/semi-planar YUV formats.
> + */
> +
> +bool igt_format_is_planaryuv(uint32_t drm_format)
> +{
> +	switch (drm_format) {
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * igt_format_is_yuv:
> + * @drm_format: drm fourcc
> + *
> + * This functions returns if @drm_format is packed YUV formats.
> + */
> +
> +bool igt_format_is_packedyuv(uint32_t drm_format)
> +{
> +	switch (drm_format) {
> +	case DRM_FORMAT_Y210:
> +	case DRM_FORMAT_Y212:
> +	case DRM_FORMAT_Y216:
> +	case DRM_FORMAT_XVYU2101010:
> +	case DRM_FORMAT_XVYU12_16161616:
> +	case DRM_FORMAT_XVYU16161616:
> +	case DRM_FORMAT_Y410:
> +	case DRM_FORMAT_Y412:
> +	case DRM_FORMAT_Y416:
> +	case DRM_FORMAT_YUYV:
> +	case DRM_FORMAT_YVYU:
> +	case DRM_FORMAT_UYVY:
> +	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_XYUV8888:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   /**
>    * igt_format_is_fp16
>    * @drm_format: drm fourcc
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index d5aa1e88a..ace02a960 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -220,6 +220,8 @@ const char *igt_format_str(uint32_t drm_format);
>   bool igt_fb_supported_format(uint32_t drm_format);
>   bool igt_format_is_yuv(uint32_t drm_format);
>   bool igt_format_is_yuv_semiplanar(uint32_t format);
> +bool igt_format_is_planaryuv(uint32_t drm_format);
> +bool igt_format_is_packedyuv(uint32_t drm_format);

 >> to be consistant with existing naming convention,could you please 
consider renaming to igt_format_is_planar_yuv?>
>   uint32_t igt_drm_format_str_to_format(const char *drm_format);
>   

