Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5487CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A95E10E89E;
	Thu,  6 Nov 2025 11:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2gJ4f7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1898F10E89E
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762427569; x=1793963569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QPEl3FCIh1P/GsLoyIEqyC0ub4xUAILIb42FnnuK/aU=;
 b=T2gJ4f7BXHXpK9b9Rn+7IA31tqPJTNWka2Ey8M9cJn9CqeaNmAXvke/X
 Dp0zWvgbBF6RjjZitoBz13Zfv6DP0ZrcD+TQx8AgWyACxM/ArGTzJM4Yl
 JtLHk+PXbb/0BlxsbnElXr1Qlxsm2UVIjUNOJbu5X5QERpJdZDBesoqCC
 /KgM7KLddOPXJEk5owOu0JVMZpakUnm4HGYnlq4lJHBAI0frzD3BONJel
 y8vgyhFz7Hx82Hx8VcQR3lPe9SL+ssfQHfP+70GSvdTgHpd7U3B0COVTy
 VTUohe8rN2ES95V2azHW/k9uzPiuv58yB1XhMID03Als9tXHIOol2K/ae Q==;
X-CSE-ConnectionGUID: WYUaMLUiSUO3kxlvC9YHog==
X-CSE-MsgGUID: 2Z1nDFJmQHO2lroeY1kD/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64711761"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64711761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:12:48 -0800
X-CSE-ConnectionGUID: 8Ev6TjzYTa+9oL5SrixOXg==
X-CSE-MsgGUID: CPeylQY2RJC+2mI1SAw6yg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:12:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:12:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 03:12:48 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:12:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpP3rgkGp/N6OCsWQ8b9KVrU4LlKApepkwadZUKBrZ0pX5Qo2EVy1jQh4AZJZ9j0fc0Gy05RpQikIZYRl10FfVaJW+N800JZMBY9+w+wRMH4iof9wsN0dOpGKmCLI6CGW6KupH7Q6cNxZQMYAP1XXe7dyFESRsX2PpYfNsmjAy+TubK/x9TLF4zZ59+t0GA/JidHwZtdnl6iOCNTIl34PatvFFtCySmLD9/VaCPtNNC5ns2sK1TSGuTmDuxfhCPsqiB/OQuM4jGv+7rdZSLvidCBWT63ek810qcV4dPqQqLmwbgzYNxPdd0Wkg8MbtlO3lLCcfuj0tH5iHfkIjNhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X/sT+oUBvuqWdYYIO8Hjx237yXYxOuZvrqFLJyELiQ=;
 b=fJuoDl3HdnNkV9YS7aR0SYkM4oY+HKTfoaQ68T8pvTWLfwBg1ASSpG9lTceNv0nZ8HTcammyKyYAPHDHuKwu0eIxtRFZtF2F1Pj88yrDgE/3At27bnqmZrbxrSJmz9iTN+hRdRjQnfeErZF1a99vuZMmQ1QXJB7hkjC3DLXANIEqepdy1TwlJVgWHyqUbMUBywUOV7I05Xdv+p7Zsk7RmXi8tHtXFFe82UmFxBgUYFZjwxDqWyh1PEkKcUGWlfrSHUJY11/dXKRP0EOApaOC7ODTTKi/4yMkUmH8sUHxNpUZJnkAKvKuq1Nf6YigFJ9O9zWC7LqVCUXpTHYnd1GJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:12:45 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 11:12:45 +0000
Message-ID: <3bb1d55b-eed7-45bd-8a11-77e74375fe68@intel.com>
Date: Thu, 6 Nov 2025 12:12:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] lib/xe_mmio: Introduce tile-level XE MMIO
 access helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <piotr.piorkowski@intel.com>, <jakub1.kolakowski@intel.com>, "Jan
 Sokolowski" <jan.sokolowski@intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
 <20251031125633.1374273-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20251031125633.1374273-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|LV8PR11MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: e79c15bb-755e-4fdd-6da4-08de1d256920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDNPdkd2c21ya3libjNISk9uZGwxaEpRQU9jZktEalBrelc3WmdCUnZkRzZy?=
 =?utf-8?B?RGFOS1ExSyt6cHJmWTJhQVRGMysvVnBIOFArZUpteTBZQ0VvS01yZ05oM1A3?=
 =?utf-8?B?VU0wb1l5SnVlLzhQbE9PMXJwQ2lTdnhWWjh2dVUzNEwxd0JjTlJjVTQ0UUNu?=
 =?utf-8?B?bHZDMGVuZTN0NzZ1NnVCL0VqSDN5YzNoRlAxcjhvNExscWptNGEzMGRFaHN2?=
 =?utf-8?B?QWk4Ym5zcTgrUCtzR2xkblZWL2tUV2tlLzVlS2ZIbDR6d2dFTE1OQnZJMTUx?=
 =?utf-8?B?b1haK3FONjBHUXgwajZrWHZzcy83d285THY0OU4zQlQ3VzNZUVdoV1NGeG92?=
 =?utf-8?B?T2pOMTArTE1VRHhIcmJOWUN3bWhsK3hVZCtqa2Qxd0lRNURyUHdybWFrWXMy?=
 =?utf-8?B?SlM0d2sxd2Fyc0ZwWFY2VkxlT0VxRllOdU90aWhKYUlBSHpHMlJKcVRCbjJN?=
 =?utf-8?B?RXdxalIxRHJmNW5IamloajRPSjBRc0p5NDI2ckFvRGl2bFRrV2d2R1pPMHJP?=
 =?utf-8?B?ZzZHVUUrN0c5cTFwVDVBalVFVndTN1BRVUhkZ01jK0Z1REppaWJzeWNKNXpn?=
 =?utf-8?B?WTdCaW12amdFdkdZdUx4K0pOR0kxK0s2aGNqMEZ3YnpYbU5SQXJ1SG9rVG04?=
 =?utf-8?B?eVRSaEtMUlFlT2JuTFdIa0haM1daVEJuOGNzeHhhQnBmTHNHbHgwMDAyT0N5?=
 =?utf-8?B?RkdFZkdsdnlMZUE3WHRwRkprSlo4S055MU5tMUNZdkRzTGw3ZHVKMnQ3L3I0?=
 =?utf-8?B?Uy9IUTNnVVpKbTF6SjZGdWJlNVhMYktoaG9PVTJmd05ZOTIwNHQxeG0xb3VS?=
 =?utf-8?B?aE5JNFhiZFZoeWxVRGxKMUZFSnBYelgxWlcvV05mRjFnei9LRHFlbkpXYjJE?=
 =?utf-8?B?WFJyTm5iMzB3K1J1TDZyZjhVQ2J3RStBNWdKVWhuK0pOVmt0WXhuOSt3dmll?=
 =?utf-8?B?RmIwSTd0OXljRFM2VWtsdkEyTFZHUFRLaHl6UmNyS3l3Um9Kb2Y5T2ZGZzdw?=
 =?utf-8?B?OFFYN1hqMVpGSkZZS3Vhd3Z5NWhCbWh4UDNRaU9RUnFYdW9nVytFSkJ6Q09M?=
 =?utf-8?B?eHZYcm5NN1Z0MDQzdDBYcGpxMk5sa1BtN3d6dElMTkdMamMvNG96OVVsd2RN?=
 =?utf-8?B?blZsdXlNQmhXdnBwbUc1Y2J2Nmw1ak9tVFBzcXpISFZMaXJZRXozdjBma0Ru?=
 =?utf-8?B?RG1rSjUwWVAvOWpFTDBnRTRDeEJ2ZVgwb1JkTDJsVXZ1NnlCbUlMbzRKTmZ4?=
 =?utf-8?B?aWRUVE5aNmxWUStrdE9rVTcxSGt3NHlmM3BGQlNsNitUNDJFVEwzS3l6VWFU?=
 =?utf-8?B?SWtVN0xHZkpOZUVzNkFMamhSWERzZkcyV2dtb1lGREQra2h3YTE1dWdlUXM5?=
 =?utf-8?B?aDNPKzFHTG5hRDZYUVlpZjRtYmZ5Vm85ckxoSVltTjNSZFhhL3FCMWloY3lu?=
 =?utf-8?B?ZUNPeVJCQ09SN1c4bEdjQ1BwZ21qMzNxTDk3MXgvZ0hDd29VN3poQkYwekM2?=
 =?utf-8?B?MExwdktYWG9TdTJGM3FsUWU3bmsyVEFJUldRWkc4anJvSUhtNEM5U2U1RUI5?=
 =?utf-8?B?ZzkySSszU0VIMjhIR1plY2JSTFRITWJlRVV2VU4vSEM0TmlROE1POXBhTGdN?=
 =?utf-8?B?TUpQaW9yYUh1dmZyUitwNkdPalFkQkZjZVJva0Z6OSs4c2tXZlRzTy9yWDZ6?=
 =?utf-8?B?TTE4WWRBWVpnSW40S08vVk9mbk9OZElVNlZydXRrNVRFWXFINW1RT0luaGg3?=
 =?utf-8?B?cnQ2Tm9iRFpnN2JJZEYrcDFnL3o0aUhzY3JpQUxEbFh1NDNEKzBCbGtuNld1?=
 =?utf-8?B?R1pSek9SckRFdEMwbjl5MWdjanhTRjBjeUZPTk9UWmFOemRHbHpnYnIwNzFz?=
 =?utf-8?B?N2V4TU9jUXpzamVXMmc5ZUZvZVE1bU1vUDZ3UWZyNjVhS01vM3JqUDVubzZI?=
 =?utf-8?Q?ePFhepWaOfU1YxF0/9aQlgMvUElksEl3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmhHNEF4cHdVMFBLc01hTTRPRW9OaEN6QThaR0s3dVV5SDhyUm1xb2MrZndr?=
 =?utf-8?B?TzUrclRmUzR0VXVLampUZDdLZWV3NmRqa1ovUTZ1dHdDcnIvSmlNdW1ZN05i?=
 =?utf-8?B?SGZyY2ZxTWlZazRXRjNTVUFJUzVJZ1ZHWmhSTGNnd0dIQ2RMREpJTVk3UmVa?=
 =?utf-8?B?NG4wNzFnc3NCN2lmdEtwN0FwVlJjQWZDbHM3WTZQOTZwWlJRcjdlS0tOTklM?=
 =?utf-8?B?bEF3ZUZJaXAxY1JYUUs0MUI0Yld4TzVzWkJyZmxlUWRtdytWdDEyR0dha1lo?=
 =?utf-8?B?U3hkN0R0RmU3UWRmYlFJRkRKbS84UVExMmhZOVQ1Y09XcVAwK0dlSlRuUWFv?=
 =?utf-8?B?ZDgwRDdWREJQY0FEUFlmSWtVT0piTWQ5TEdhakU4c2lIOWh2S2VyQkk0a3A3?=
 =?utf-8?B?djRJb05udDE1UDBWVmF6TnE0enBTUWlqN1lldTRKM0c2NVZELzl0Ym9GSXVZ?=
 =?utf-8?B?L0pocUpCYUlvVUJLZnhBNFBsS1lzUjZ6L3l3WHIyWnBTV01rTEtQVXR6U2RP?=
 =?utf-8?B?Y1ozWGpheWt5dFU3bjRvQ2pYbWJLZzhrVUNqQ0lPTXZlSmVyd2xmZUpiRDJp?=
 =?utf-8?B?aGVobklXN0Q2S3k2MjZGQWV5NWh2cCsyTy80Mks2ZGpnbzRZdVJla2JORkdz?=
 =?utf-8?B?MDhpQjFSWENSZXJlNytkREtMY2NJd2VaZmQ4OWNrbTJmeWlXRjZqcWR0ajQx?=
 =?utf-8?B?NzBMQmZsc25EemtkTUJMRXF6TldvbXhJYlpoVVUyTWYvTno1WHgzQUxmcWVY?=
 =?utf-8?B?NWVLNUNKNkljcTZCaUJ2cVJxaTZjN2hnTXQxanZCbEFSdGlPMWRyQ2UrYUpI?=
 =?utf-8?B?cG5WdnJJa3VFZytNM3dmUlcrZG9uZUQvYncweUREdWM5dUhzZWdyNXd6RGJL?=
 =?utf-8?B?OE9EK2tHUUxKMThIMy81SjJ2WnNHVkZMVk9LZVQ4aU5YMk1NT1M0UUh5amc3?=
 =?utf-8?B?ZEFJc3V5c2dCVmgyaytmRVFmcjVRK1hUeWxsU2d4alF3WGRnVFZzcXdhaTQr?=
 =?utf-8?B?ZXpvOG5DUFJ4eXlFNk1yOERocUY2cHBJNXBPNmZjQUNHa3hNNUxiRDdIWGZp?=
 =?utf-8?B?LzI3MTJsMWdQTjRLcVZTUmxMbHhnanpQbUM3eEFJVmtKRzlZNm15Kzl1SS8z?=
 =?utf-8?B?amg4bks4RkNDdVhiVWRTbjFHT20wMmRZYlQ5Z2NGL3Y5WGozRUpTbjZvcVFO?=
 =?utf-8?B?Ry9BdU1nVElrMEJrL2h3NXJXYUxqemtZcGNYeU96VEp2STFmMmxZcXVtTVV3?=
 =?utf-8?B?Zk1TUjNHOHVnTnU0RU41ZVRYTjFnbWxuU2tuekcyQW1jNEJ6UEM3ZUNFVXB4?=
 =?utf-8?B?Znhlb2llLys2bWE3V3RyUU9EcCswcHJhTEFMeXJ3UXQzR3EvdmQ4Z0hEdEpV?=
 =?utf-8?B?dFI3K3M3MmdpUEJzelFMeEdUSkpJdFlXaFZrRTNQTHc5eFBMYlduN1ZpTTN6?=
 =?utf-8?B?bkhFcFU5Wk1KVjVxL0pvR1EwaVE2VlJwemJlZDVXOXBWbnJPL1JRRnd2Rlg2?=
 =?utf-8?B?UDljRlVFTGt3bVVHblY2Njk5eHF4MVFvSzM3NVVVTThaNE5jRWUwZWtBeUhR?=
 =?utf-8?B?cjI1ZzJLSWlnUUxybUFHZFZIZmtkM0NnWjlZdmpIQ25FYWNKSjErVVI3NWdm?=
 =?utf-8?B?VEVvQmcyKzkxRFFoT0tTTyswbTRTVXhpcmZicXE4VWt3aml1L09TYXowTDBX?=
 =?utf-8?B?dHhWQmd3SXR0ZlE1N1drWGM0eEVHOERURXVwcXZncDZtSzRHM1F3c3Y4VW1Y?=
 =?utf-8?B?ODMwY3FOLzgxUnp1OTQrZ2ExRHZsZ3N3OUo0cUJ6Y1pYVFRVaktyclFFam9l?=
 =?utf-8?B?bnRacGxucmJmRWU1dXlXb3ltTUY1MG83ZzBucE4rRTZsWU9mQ0VwdXl4YXM0?=
 =?utf-8?B?V3dqTUhZbDVHcHgzbnJlMGNLLzdqYW1qaTlyc2hoaXBYYUdRcit4ZGt6dHJz?=
 =?utf-8?B?SkpvL0ZlRTF6UFM1SmlBdFZXSDhwaGNzRnFYbjgvamZKWHNWM05EMDZ0UkhJ?=
 =?utf-8?B?QWtJTEtZRkhLVzE2cEJnd1hadUxPS1NEWlUxbytaeEhtbFBLV1hQYWUxV2E1?=
 =?utf-8?B?aXd1azhNcDFwWk5TMjZDb3hyc3NDZW42K3VHeTIzWHZrZ0g5Y1dxTXB3VStN?=
 =?utf-8?Q?miPaj06yqCJR2qmGCNzM6woMs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e79c15bb-755e-4fdd-6da4-08de1d256920
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:12:45.0098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIGhprE2xKJiyGrnsmXKtptuifSCYuRCHsczw7mScz+lrkt4M6XWLRyHIDiCJtE57cGqVDD9e0qRgVOxAmf3tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
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

On 10/31/2025 13:56, Marcin Bernatowicz wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add new helpers for tile-based MMIO access:
>   - xe_mmio_tile_read32()
>   - xe_mmio_tile_read64()
>   - xe_mmio_tile_write32()
>   - xe_mmio_tile_write64()
>
> These functions provide explicit MMIO read/write operations within
> a given tile by applying TILE_MMIO_SIZE offsetting logic. Existing
> GT-level MMIO helpers (xe_mmio_gt_*()) are refactored to use these
> new tile-level accessors, simplifying code and improving consistency
> across MMIO operations.
> GGTT is also a per-tile resource, so let's adjust the GGTT access
> helpers to use tile IDs instead of GT.
>
> v2:
>   - find the real tile based on gt instead of assuming root tile
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Jan Sokolowski <jan.sokolowski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/xe/xe_mmio.c               | 94 ++++++++++++++++++++++++++--------
>   lib/xe/xe_mmio.h               | 20 +++++---
>   lib/xe/xe_sriov_provisioning.c |  6 +--
>   lib/xe/xe_sriov_provisioning.h |  2 +-
>   tests/intel/xe_sriov_flr.c     | 12 ++---
>   5 files changed, 96 insertions(+), 38 deletions(-)
>
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> index 834816133..8bc446fb9 100644
> --- a/lib/xe/xe_mmio.c
> +++ b/lib/xe/xe_mmio.c
> @@ -107,6 +107,62 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
>   	return iowrite64(mmio->intel_mmio.igt_mmio, offset, val);
>   }
>   
> +/** xe_mmio_tile_read32:
> + * @mmio: xe mmio structure for IO operations
> + * @tile: tile id
> + * @offset: mmio register offset in the tile
> + *
> + * 32-bit read of the register at @offset in the specified @tile
> + *
> + * Returns: The value read from the register.
> + */
> +uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
> +{
> +	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * tile));
> +}
> +
> +/** xe_mmio_tile_read64:
> + * @mmio: xe mmio structure for IO operations
> + * @tile: tile id
> + * @offset: mmio register offset in the @tile
> + *
> + * 64-bit read of the register at @offset in the specified @tile
> + *
> + * Returns: The value read from the register.
> + */
> +uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
> +{
> +	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * tile));
> +}
> +
> +/**
> + * xe_mmio_tile_write32:
> + * @mmio: xe mmio structure for IO operations
> + * @tile: tile id
> + * @offset: mmio register offset in the @tile
> + * @val: value to write
> + *
> + * 32-bit write to the register at @offset in the specified @tile
> + */
> +void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val)
> +{
> +	xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * tile), val);
> +}
> +
> +/**
> + * xe_mmio_tile_write64:
> + * @mmio: xe mmio structure for IO operations
> + * @tile: tile id
> + * @offset: mmio register offset in the @tile
> + * @val: value to write
> + *
> + * 64-bit write to the register at @offset in the specified @tile
> + */
> +void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val)
> +{
> +	xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * tile), val);
> +}
> +
>   /**
>    * xe_mmio_gt_read32:
>    * @mmio: xe mmio structure for IO operations
> @@ -118,9 +174,9 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
>    * Returns:
>    * The value read from the register.
>    */
> -uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset)
>   {
> -	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +	return xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset);
>   }

I don't see any benefit in having GT-oriented helpers. Especially 
they're not implemented for the GSI register range. Currently they 
duplicate what the tile helpers already do.
Additionally, the naming is misleading as it implies GT data access, 
which is not true. I'd recommend removing them.

>   
>   /**
> @@ -134,9 +190,9 @@ uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
>    * Returns:
>    * The value read from the register.
>    */
> -uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset)
>   {
> -	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +	return xe_mmio_tile_read64(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset);
>   }
>   
>   /**
> @@ -148,10 +204,9 @@ uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
>    *
>    * 32-bit write to the register at @offset in tile to which @gt belongs.
>    */
> -void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint32_t val)
>   {
> -	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> -			       val);
> +	return xe_mmio_tile_write32(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset, val);
>   }
>   
>   /**
> @@ -163,38 +218,37 @@ void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t
>    *
>    * 64-bit write to the register at @offset in tile to which @gt belongs.
>    */
> -void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint64_t val)
>   {
> -	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> -			       val);
> +	return xe_mmio_tile_write64(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset, val);
>   }
>   
>   /**
>    * xe_mmio_ggtt_read:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + * @tile: tile id
> + * @offset: PTE offset from the beginning of GGTT in @tile
>    *
> - * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
> + * Read of GGTT PTE at GGTT @offset in the @tile.
>    *
>    * Returns:
>    * The value read from the register.
>    */
> -xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
>   {
> -	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
> +	return xe_mmio_tile_read64(mmio, tile, offset + GGTT_OFFSET_IN_TILE);
>   }
>   
>   /**
>    * xe_mmio_ggtt_write:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + * @tile: tile id
> + * @offset: PTE offset from the beginning of GGTT in @tile
>    * @pte: PTE value to write
>    *
> - * Write PTE value at GGTT @offset in tile to which @gt belongs.
> + * Write PTE value at GGTT @offset in the @tile.
>    */
> -void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, xe_ggtt_pte_t pte)
>   {
> -	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
> +	return xe_mmio_tile_write64(mmio, tile, offset + GGTT_OFFSET_IN_TILE, pte);
>   }
> diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
> index f144d4b53..f15017c96 100644
> --- a/lib/xe/xe_mmio.h
> +++ b/lib/xe/xe_mmio.h
> @@ -29,13 +29,17 @@ uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
>   void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
>   void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
>   
> -uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
> -uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
> -
> -void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
> -void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
> -
> -xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> -void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> +uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
> +uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
> +void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val);
> +void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val);
> +
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset);
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset);
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint32_t val);
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint64_t val);
> +
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
>   
>   #endif	/* XE_MMIO_H */
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index ff9d1f7d2..2ca73d2ef 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -90,7 +90,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
>   /**
>    * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
>    * @pf_fd: File descriptor for the Physical Function
> - * @gt: GT identifier
> + * @tile: Tile id
>    * @mmio: Pointer to the MMIO structure
>    * @ranges: Pointer to the array of provisioned ranges
>    * @nr_ranges: Pointer to the number of provisioned ranges
> @@ -106,7 +106,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
>    *
>    * Returns 0 on success, or a negative error code on failure.
>    */
> -int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
> +int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
>   					       struct xe_sriov_provisioned_range **ranges,
>   					       unsigned int *nr_ranges)
>   {
> @@ -122,7 +122,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
>   
>   	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
>   	     offset += sizeof(xe_ggtt_pte_t)) {
> -		pte = xe_mmio_ggtt_read(mmio, gt, offset);
> +		pte = xe_mmio_ggtt_read(mmio, tile, offset);
>   		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
>   
>   		if (vf_id != current_vf_id) {
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index e1a9d0a63..1e1dca866 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -92,7 +92,7 @@ struct xe_sriov_provisioned_range {
>   
>   const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
>   bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
> -int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
> +int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
>   					       struct xe_sriov_provisioned_range **ranges,
>   					       unsigned int *nr_ranges);
>   const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index aabbd8c05..077ed15af 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -493,20 +493,20 @@ struct ggtt_data {
>   
>   static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
>   {
> -	return xe_mmio_ggtt_read(mmio, gt, pte_offset);
> +	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
>   }
>   
>   static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
>   {
> -	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
>   }
>   
>   static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
>   {
> -	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
>   
>   	/* force flush by read some MMIO register */
> -	xe_mmio_gt_read32(mmio, gt, GEN12_VF_CAP_REG);
> +	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
>   }
>   
>   static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> @@ -548,8 +548,8 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
>   	igt_assert(gdata->pte_offsets);
>   
> -	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, gt, gdata->mmio,
> -							 &ranges, &nr_ranges);
> +	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
> +							 gdata->mmio, &ranges, &nr_ranges);
>   	if (ret) {
>   		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
>   				gt, ret);
