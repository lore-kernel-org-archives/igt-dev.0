Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FE2C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 05:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC6110E10F;
	Thu, 27 Jun 2024 05:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXXT5uyu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65A210E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 05:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719465443; x=1751001443;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BLqPXnCGUFQM//HQwcX8HtwTvabLvcircRQcyPalig8=;
 b=DXXT5uyupCvHGP0N0k67BcLZPcLatzS8jX9nY6HKlZ4DRmOos1Ssn3ba
 eeLZZx6+B+Jx4mpeudjaHuFcxNpkkLbasDEj4/uhLxfeE7rmetB2w9Bjo
 F956f88WUIdhRLt0VCEswZ5ur3v/Dw7ofzecZiDjFQ/tyF1KdO9fbRBhw
 3ay1OG3aOBOC13N5oHQ6xlBwlNtSSJiP1D6V8j37NarEHw9WESxanxOjS
 TmUsp/RFVqeNzVcP8CD1lMAmmZ/6b1FLp9Kkj9mhYigNxN1Krw0vAr4vk
 VJGAXaK7ADFzokzYuV6GyznOB3oGrOnPbNCEBQ4cso8AQILYwxCGDoP6m Q==;
X-CSE-ConnectionGUID: jK0PPbtRRgagwGFvcpDeyg==
X-CSE-MsgGUID: 8VaH5VbDScueXVs8JSM8Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16718630"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16718630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 22:17:22 -0700
X-CSE-ConnectionGUID: u9oIz9KiTvWCdwONncjrdA==
X-CSE-MsgGUID: H4FJ5cbaSu6KiBlviLN0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44154883"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 22:17:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 22:17:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 22:17:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 22:17:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 22:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+1X9Uqyxad56wHPxkdSQzyGO8ONtf//sJtHdafSz7d9aGhyNup2GE6OZF98XS2+Wj6yWDPwkM0Y8eARaN9YyBHbCF8hLLl/Nv/Itksmg8f+D8+ws75kB1tNgaaqoOiwbmU/VgNQUJIbbIbg6EmIwxQYd8CYRfNk+h3sTHV4hLDmvyZhPoxmgUjne8Jhs5IWSVP8Z1XRWkXCXqZZccO9tZ3HhiRIA+FS787pXRHS5649l+12xaHhEjh5kfgFeENk99I3XuSyI9W+bt0RwbYrQ9VuTkG5S6nWg5HE8acjGK+Y3G3Rdw8OeY0v1c/Hclmt0KENE1q0YcJvqugDV8vjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFHYJ1lJBB8mBi3++CTaHWoxTMfWz2ESxy0BS5CzHxc=;
 b=SUyakSWq8fwRqsKg9iV/tZc6vFuemsIQ2dIa35Tj3WUeHSUkwqdXRT32Hq//CQnjWtqpf6rYPNZDyJfJZz7CrBbEwLFiCQRZTvlkTt4c/crObt9CLfaEAFTlWTxRAm5hdo11i6uCPi6WRW+7sjVS3MWCOKa9I1ySdG057Z3v2EoK5LH/wQn2KosdSSGCBPQwPA0rf4wS9JyPZ24v56ReU0N658Hngw47eiYk5RG95LwKpsHX/LL7mSBsGXNL3GaO3N+hYQch8gw7ab+mM+DEKbykJYiyaPQVluDO1iMEfNGaesw8Go5uZ2xqJE31uwkcEhR/f0jj9PjUiSqvm/m/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:17:19 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 05:17:12 +0000
Message-ID: <9c150804-15c0-41e4-ab6d-f5abab2a1722@intel.com>
Date: Thu, 27 Jun 2024 10:47:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_color: Add connector name to dynamic
 subtests
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240524101202.2735010-1-bhanuprakash.modem@intel.com>
 <20240524101202.2735010-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240524101202.2735010-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9a64d1-2001-434a-d486-08dc966866b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXVpNERQMEFIbEdOUWdmYzdBL2xZSlJIUyttWm5XUmxncDZQci9aWDdieWNW?=
 =?utf-8?B?dVhKRHgyT1ErMkt2UlFEcTBlTU1IY3RCdVV3cllhWkRMdHVYRmNtSUcvYTdx?=
 =?utf-8?B?dmxnRG0rTXdZVlFlRmRHYmZPWG5pM1o4dkEyS0ZoQzNhUE9DVENXaGtybCtW?=
 =?utf-8?B?VXlvK054UTJDRjBxRWNrcnBuZVlMNmlYcS85QnBzL3kyOU1LSExDaEp6QUVu?=
 =?utf-8?B?b1hCSlZQdVZEcHRTLzBUUC9PZjZ0bFQ4ZDUvSmdrR2M0bVRXbjdmMmxoOHpn?=
 =?utf-8?B?clZGTmxlR2c2OFNZNHZGeW1HWTFSSDVPZ0Ewcjg1VkVvOTRFeUg4S2t1TzV4?=
 =?utf-8?B?QXNDODBmRUlEQmpXQ3BvWUd4aGhLMlNGYVlJL2N2c0tESU1JNS81R1FFWDlE?=
 =?utf-8?B?OElrZ2NpUlZBMTUzRXJwK0xtdGNiQnkyZDd5OWVSODdBZWlpcFJNa04vb0ln?=
 =?utf-8?B?LytRb1Q0bDVxYnUvelVPNlByeTFJejJlTFBFdVFhMVpkTlBoYXpSV1NTYnR4?=
 =?utf-8?B?RzNpMlc3cWNMT3dMTUI3QXFmVGpOalFscHRPZk84ZW0zWm1obDh4cHpPcFN1?=
 =?utf-8?B?UzJXREYxRnRQZjl6dGFsbVFCSzdDY29aWXJJcmhqTDZjdDB3eFdGaEdWcTFE?=
 =?utf-8?B?cWNWcTcveU02UFNaTEw0ZnBpYit1Ykt5TTVCN3FJRzNXQlh3RGYrU29WWC9S?=
 =?utf-8?B?RG9EeWJVdnJ1bEdXQVdiSUJzcXRSNEs5aXFUdmxKUVI1ZnNlZ1JycXo0UitG?=
 =?utf-8?B?NUtkbjJndG1TamE4ZStNRDJMYnExYVY2WlpoVFR4RHRneXFTRlYyOWdQVCtD?=
 =?utf-8?B?QzQ5T0NjNWR4ZUxDWGMrL1BQQjFVMXptc0dvS2xHVlcvYjZBMTlHZTlXK244?=
 =?utf-8?B?NkJHMkRNY00wWTZ5M2QrcllHcysyaVNXT2xiYmRRcWZGTzVIaThCV3g5Nk13?=
 =?utf-8?B?dm1JeGJVOVhxcUxWYktkSVpwbkR6ZkdXenBQeitTZHFVWXN1SmM1bU1hNkRV?=
 =?utf-8?B?cWRJd3Y5UmN2WTZFb1hrVWdIWWpHaWU1U3d1aFhFazZPSjVEMksxSS9PMGYy?=
 =?utf-8?B?bEphclpJTFl6TjhSSjQwa3RQN0RKVVMxNmhXYkZ2cVdkUVM3TU8vRktmbHQ0?=
 =?utf-8?B?OVhVMTFxbnFJMEJoZ3VPTTlqcml3ZjFkZXRMNGxvVU51SVdOY3BoK051b25I?=
 =?utf-8?B?RFJ3czdSRE1Tc3FLby9sdXUvYXRxZ0NGNFE0eEtlemd3TThodW9VM0NKdDl4?=
 =?utf-8?B?TU9YMG56Q1F2TFVOT3crTW9vVi9Hc0NmcnV6YmZ4eGJaOStXUGJUYm9qNC9p?=
 =?utf-8?B?emNraVBibXRVb0xTVGsvRlFsRFFXaFVWcVpiVkM0b2p4M3pldXgyU0ZOYlhN?=
 =?utf-8?B?MGlaK2xKbmZmbHJpMFJwenpkakhnblJxa1JPd2lUcldaTnpWMVEycnd0TmxX?=
 =?utf-8?B?OTJlTzFjd3JlZUwzVzRzSDRNb0hTQ21qMmxhdHRZQXhXV0VIdU5PQVIwYXQx?=
 =?utf-8?B?QnRZN0xpSUtZWTB4cG9IZkZ1TVJCQkpuVjEvNGMwelpkOHVjNSt6TkRmd0Nr?=
 =?utf-8?B?SVlYQ3ZHT3BIQk9lU3BjTmovQzBCcmhvL0RVbDZTbmRLaUl3NFdNdUlWRHpW?=
 =?utf-8?B?UHBGWWtLRjlpTDlOL1dTakZoNTkxL0htUDl1R2U4SnJYZVRVNzlvZVgvM0tG?=
 =?utf-8?B?YUFSbnVVL3h6aHplMFVVSXM4cnh0MCtidHdNbTVFM3MreUY4NnhROGRJM2xn?=
 =?utf-8?B?UURHZWd6ak50Ky93dy93Z0g3c1p3dDJYVnVQNnZBU3kydjNzMTVzaXZ4ek5O?=
 =?utf-8?B?YWJrN2JUanlndEgwN2VHUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0NXY2pPakVzdjg3anE3bk5MLy93RXMwTGhydjRMUG5JRUw4WDhURzluSDMz?=
 =?utf-8?B?YTZLTjBXZk1DVTd2aDF0OFJ3d054WEZ0K1FGQ0dxc0l4ZnpEN2hpZWJ3TTlF?=
 =?utf-8?B?M3YyaXI4RTRIemhmVHQ1Q2c1Vm93a1NtbVdiOVdjdWFlMm83dVZnVUtXMWVO?=
 =?utf-8?B?V05MNzRjYlgzVjIrM1d2ZnFlVTdVdEhPc09EL3U1V3Q0T0t1VkpKSWVISkhB?=
 =?utf-8?B?SkRkcUw1Tnd2RjFtUWsxZ2taaDI3cStJeTBPN1lCUjd1Q0NHZldId2J1cS9y?=
 =?utf-8?B?WlVFa0IwdW1EUlNITDhNLzl4QU9OUEJqYVdDRER3c1pac1dkcUxxbXRxKzZs?=
 =?utf-8?B?ckVzTlhOa1Zjdm5lMXVhNEpqZ3dTc1dGYk9EbUt3UmZIT2h6UklkVnlHMktZ?=
 =?utf-8?B?SXN4cFR6Rm9HbDNEL0hkRkFqRTJNVGh1UUNGRkI3THhpMTE1bFRTSEo1aVdJ?=
 =?utf-8?B?ZjFHc0pkWDdtaTR4dWR4R2x5alZES3h0M2s1RVlHTmR2dGlyY2VMNk9aSlpp?=
 =?utf-8?B?cGY2K1MwK01RdndBU0Q2RmxXYkIwdWhyTkZHR2ZidDNsWGlHa0ZyYVpXdGox?=
 =?utf-8?B?Y2pLSGZhd0Y2c0lkOSs4cjB4U1A0R0poemdQWGNTbXE4aXp2eU1WeFcvT21Q?=
 =?utf-8?B?TmZDWjM1OGl5UHZSa0JLMXJpdHY5MG9VQ1UrSnFOeUZjUStZUlZmRmNNT3Zl?=
 =?utf-8?B?Y2d1TjBLZ0NNSlA5ZzhvQTJYTlJqaEpkQ2VYV1ZOaW9wdXZ1ekpwOVpPUm5V?=
 =?utf-8?B?WnVjUVNlRUpZaXQ5N1M5OUJMQlFMWnZ5WFJraE1lQXpWbWRrVy84emF1Uyt2?=
 =?utf-8?B?S1ZRSitEaVBQU3FBSkQ5Ky9hWm1QM0dZaUMzZy9McjNyempjdlBCTjNwamZ6?=
 =?utf-8?B?YWwvZ2Y5WGtLdllmUzNUd2lTbTdyZ245OS9jQjlWZXBoKzFxRnpaaEZOTjlQ?=
 =?utf-8?B?ejIxUlNCMkJwRnVhRis0MmROVnNhYWlZemphenZzRXl4MjUyR0hoK0EvaFls?=
 =?utf-8?B?Zmg1VVZnQkdJcXpsRWN2UjExQ0ZGVzRQS3Q5Ly9FR3d0a21wUUdCdmRwVmY2?=
 =?utf-8?B?c2lKeWM3R2pteHljeHFhVmFCZFNZNUg1Z0V1TlZ4SzlVc0xPMmR5TXJORHpR?=
 =?utf-8?B?TTFtNDQrNndjTWx3cHZ4dXhybXo1eDJkTStQTUg4RHRHRzl6RDdvQjl2RUVp?=
 =?utf-8?B?TWpaRjZTbm5BbHNsaFdVTHUvVE91d0NrUHBkSlc4NGFiSS9kR1EzQnlZZWU1?=
 =?utf-8?B?ckZkT3kvTXljSFNSdGs4ZlV2Uk9SZHFsL3dWZjJSakZlcHdPU2xDbGdsUDV4?=
 =?utf-8?B?a3RFeitpRzVKaU53aVRWMmZadnltOWx2b0J5L21xTUtoQ0svZVpqV2dFZHRT?=
 =?utf-8?B?SFJjUU9LVGVlZ0tWZGlLeDhZZVAzcDZYSFJGV0xRTzdObzBBM09qMllSaTRk?=
 =?utf-8?B?Q3NGZE9qUHNGWG91eXljL2k0R3N2akR1Q3NJRjRzL1d1bUt2VHVZQzhiWUY1?=
 =?utf-8?B?TDRBWENMcDhaUzFoR3FGNEZGalB2NGc5NmViRXpTR3dIQ1UyeE9YblltL1hs?=
 =?utf-8?B?QW9udW9MNlBWdndhZGRSN3l0L2NOWkJ3OWZERnpCNnFlNDN1bnRhODIxbTE4?=
 =?utf-8?B?UjdFQmZ4eU5ITk5OdXdOeU0rNC96TmpzaDlXNC9FVlFlM0RBNUM4S1dpWlpF?=
 =?utf-8?B?R1ZoVFJiYTMrcWNuUy84WHhLVm9zK243OUZFNDhPOE84WGpGcHJaTXJtanBH?=
 =?utf-8?B?c0daS21wMHJsaUFBd2pKa255bTNTUlhiV3IvdE9YSEV5eFE2U0Z1VXZ2Kzlp?=
 =?utf-8?B?TDNjSnZvTFYwYjBhVFgrU3Bka3JKNEFtbUhwdlVaU3p0bDNNME5VU2tWdnRn?=
 =?utf-8?B?VHFiMXRueUV0OTVTbTZrQkROV1R5NEZJUjU5d2k3VXB1bEkwbDZuR0lhc29P?=
 =?utf-8?B?RXZGK1dMZUJwTWpTSEtrWm5mczZaMTZseVpFMkl2eGxsRG5ObWYyekhvM2tH?=
 =?utf-8?B?SDhJMFZtSlJ5R1VFeXVzbTdoWnpMVEpzYTdIaEtla1pWNVczaVB6VTB1aHpx?=
 =?utf-8?B?TGR1T0pDTFB4bFA4MTI1V2FjR0FDOFoyczRYc0FUbXFPbVVuYVZsRUVYMVJm?=
 =?utf-8?Q?bjfCYi6BtyGY4GMXeHLcwEck8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9a64d1-2001-434a-d486-08dc966866b8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:17:12.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGQOuE/EtOXs9YfKc4NF09GjzuYeUFkS/O7931RdECIwax26a0JREerNDzHhskRJEAy1jYxR7qPUBUTQRAPb/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
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


On 5/24/2024 3:42 PM, Bhanuprakash Modem wrote:
> Add connector name to dynamic subtests, so that it would
> be easy to understand that which pipe/output combo is
> selected.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_color.c | 66 +++++++++++++++++++++++------------------------
>   1 file changed, 32 insertions(+), 34 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index bdb80a4ad..645a03537 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -790,8 +790,8 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
>   	if (!pipe_output_combo_valid(data, p))
>   		goto out;
>   
> -	igt_assert(test_t(data, data->primary));
> -
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(data->output))
> +		igt_assert(test_t(data, data->primary));
>   out:
>   	test_cleanup(data);
>   }
> @@ -832,30 +832,32 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>   	if (!iter)
>   		iter = 1;
>   
> -	/*
> -	 * We tests a few values around the expected result because
> -	 * it depends on the hardware we're dealing with, we can either
> -	 * get clamped or rounded values and we also need to account
> -	 * for odd number of items in the LUTs.
> -	 */
> -	for (i = 0; i < iter; i++) {
> -		color_t expected_colors[3] = {
> -			fb_colors[0],
> -			fb_colors[1],
> -			fb_colors[2],
> -		};
> -
> -		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> -
> -		if (test_pipe_ctm(data, data->primary, fb_colors,
> -				  expected_colors, ctm)) {
> -			success = true;
> -			break;
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(data->output)) {
> +		/*
> +		 * We tests a few values around the expected result because
> +		 * it depends on the hardware we're dealing with, we can either
> +		 * get clamped or rounded values and we also need to account
> +		 * for odd number of items in the LUTs.
> +		 */
> +		for (i = 0; i < iter; i++) {
> +			color_t expected_colors[3] = {
> +				fb_colors[0],
> +				fb_colors[1],
> +				fb_colors[2],
> +			};
> +
> +			transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> +			transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> +			transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> +
> +			if (test_pipe_ctm(data, data->primary, fb_colors,
> +					  expected_colors, ctm)) {
> +				success = true;
> +				break;
> +			}
>   		}
> +		igt_assert(success);
>   	}
> -	igt_assert(success);
>   
>   out:
>   	test_cleanup(data);
> @@ -1129,10 +1131,8 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", gamma_degamma_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
>   			for_each_pipe(&data->display, pipe) {
> -				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					run_gamma_degamma_tests_for_pipe(data, pipe,
> -									 gamma_degamma_tests[i].test_t);
> -				}
> +				run_gamma_degamma_tests_for_pipe(data, pipe,
> +								 gamma_degamma_tests[i].test_t);
>   			}
>   		}
>   	}
> @@ -1141,12 +1141,10 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", ctm_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>   			for_each_pipe(&data->display, pipe) {
> -				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					run_ctm_tests_for_pipe(data, pipe,
> -							       ctm_tests[i].fb_colors,
> -							       ctm_tests[i].ctm,
> -							       ctm_tests[i].iter);
> -				}
> +				run_ctm_tests_for_pipe(data, pipe,
> +						       ctm_tests[i].fb_colors,
> +						       ctm_tests[i].ctm,
> +						       ctm_tests[i].iter);
>   			}
>   		}
>   	}
