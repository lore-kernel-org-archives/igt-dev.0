Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E448BCEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 16:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A38C10E052;
	Mon, 17 Nov 2025 16:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+j6oIsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62B810E052
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763396304; x=1794932304;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IvRHYfXV531c4++Hujo3qnz6NhFezQgdTv0aqf60Zdg=;
 b=j+j6oIsd0BXv8CoKiqreq7P5l1xL18Z5ZsnD2kkvfJJoiEli7bbRiliq
 vBed1vYnUXkta/pc9K5ZJkySrqyo73hIbeBs3G9h7ubkrr1b35CY4beWr
 NEdKGgtUzUeVB890LJyjyYUuPS12f2T/pl0lz4sS6VFgoBLkvKUhXDAu4
 XcZfPQ8G5tdPZvv4jTxuZO0gpfluUsYBvFspywYSqnUQMqvsmH30vMbJt
 4ggrvWK3IHSU8FjKnY4lKcsshluJ/lZD1auzVflbaNEvcQYWGBV8Djo3q
 ghunADOm2mfzjSmfsSTeW7ZHMn3ypO6y5COoCRQCazgYXxNyoVfcZVKPZ A==;
X-CSE-ConnectionGUID: uD1I4NPcT0mt3M21+DSCBQ==
X-CSE-MsgGUID: IQQap+5iRQ+4dNObhbFswA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65336132"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65336132"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 08:18:24 -0800
X-CSE-ConnectionGUID: gHn3CpOyTPaNbL2Q/6qALw==
X-CSE-MsgGUID: OHULKXSfRUST2M8F16ghLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="191286246"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 08:18:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 08:18:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 08:18:21 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 08:18:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swEwb8XPvUghqfb9+wEUxwYO0Al+VCjZpXIKQwcVy6nAixXEZTUVbhovaF0qwdcjsaHBbAoS6JRozPJsYwMdhRrTMP9U9+ALLLjGub9Eqgc98PVLLNPiKy5e4/+o+TDu5vF5B2cPCe1ujDjcuKS+8NG9VcAZPKDtswDtXo6Wv3eu307TUeGzbNQ/XOz7KnHoRZMWSivo/7tGJRPM+I2nxaEtlzzmqoMEfwXA5YA/xLPPclGG1b6Y4vqWRjhbdR0j+KMU1ow8Ap6uTrtALUtgk343KnBUsjfuApd1FH92DPxUan9cNN/go82hXTS6rAgpbAFT9uP0KlrEZQtJbTrirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bla3Tu8AKwh3GcNM/SJ5HEWCTArmQZZ4ZuB6JugSjjU=;
 b=WitumT4RyWYRMSTFpVCljjVkSGPtHSWLv31ME1GV0Wf6kLWJ6nqZIdZBMFrpZfXGf7nUstB4Cr1qVcw2FIs0qeHdE9tglAeDIKf1WQ9SGvI3thWKYhTymjfvkgluCZQ6/i60fMI1sRxwx6lJlv0l859PFm7ARpAiDK6JLkLHlxoyl/cuznVPGuDbMxbu8a33ZgmcWjfWowJSq5sV9hyuGO8zyTlln5U6MWuJp8XBFB0iXR7YPhctrqN1KMN+sTOOpCQdnbGx/tXGdd5pusPxn2c4K4SxwmRMuz3lZo9efRY+HPPVA1RmSREzYoCjfpIh/OTX7N3QsIekmaFMfMm3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 16:18:16 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 16:18:16 +0000
Message-ID: <1082ec85-74e5-4541-acbc-b9a0d8c4c4d7@intel.com>
Date: Mon, 17 Nov 2025 21:48:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 05/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU coherency test
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-6-nishit.sharma@intel.com>
 <c14d068ad4a7a6bc6ab4f1ca4622c492619f557f.camel@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <c14d068ad4a7a6bc6ab4f1ca4622c492619f557f.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e8a663-223a-438b-90e6-08de25f4e9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdBenNOT0YvNTh3dEJqMHozcGVIOFhZTmFrSmszL0h0SU5oRzdPNXZNZkNa?=
 =?utf-8?B?T3BVZWN0anFsQnRjSE5Tb0RzZGZaTHhFWGlZQnJ1MVlJZzF1YWh1TVdxa0xF?=
 =?utf-8?B?aldPdjR3M0dBY1Y0T1JqU3RMU2Q2U1grTExmNWlacE9XcmI4UVhxVVF1MGVu?=
 =?utf-8?B?ajVEcGVDelRPNVpFREJKTnlGQUxmU1d0MXE3dFVGeWxPeVRxbkk3NmdiRDZp?=
 =?utf-8?B?ZlpoZ2FsYVk3aDNaeFJDWlllWlhIL095V2ROdDJ0eVlWWkYzaUJaVzloOEI1?=
 =?utf-8?B?QUJVS0laU3V1L2hCREdJWGRVR2VPcjZqdXNwYmNDaFd6UjhyR2xacHV2Ukg1?=
 =?utf-8?B?OUNTaWhaY1c3MFZtb3duT0lZSmpDcEdEQWtrVEJBS0NKaXd4OHpwY29qYzFy?=
 =?utf-8?B?LzRrQWxBdE81ckNRWTFkdk5ObjRTMGFacTlJeE5sc2hCSWJqQ0tob2k0UE53?=
 =?utf-8?B?ZTI5MWdlOHlydXRWWWg2ZXNXaENUZ2wvcllkK1dCQ3A5cksrc1NSeW1iM0lY?=
 =?utf-8?B?SWFQUVpmM002Tlh0MkthVTl0SzhGMHRLQzhsaUd1YzhHd2RTSTZzdUM3bjZ3?=
 =?utf-8?B?dXg1Sy9vR2d3eGoyUHZvS1E2SXlOckVYYmhzOVFkMkFVVVBLYk9qYWhXRUFJ?=
 =?utf-8?B?TENxYmZLSTV0SUJoM1NublJ3KzhtM3dCYXJTcU1MWHZnQVFMZDNRV0cwQ2ta?=
 =?utf-8?B?RjBRczhWZHRmcWdPQTNHc1h0RDdkUjR0Y2R1VnE2OEpCa1hoNUgrZHFoaTd3?=
 =?utf-8?B?OVZENEY2VkpIYkNoZ01xRXUzNGtvWDc2cjNNVUpIWCtXdDAwNDBDZjVweXQ0?=
 =?utf-8?B?V1g3M0IzVkpJNExvbm9OcWFpcTFpbTd6VmNJNmZrUnZETjdDb0lxaWJQbTFS?=
 =?utf-8?B?Z1c4Q1V2aTVKbmVzeUx1NDcvd1BXWlNseDJSTk8yTVQwRnpoNjREQjBkdUNj?=
 =?utf-8?B?QzYra3pLVWVBdThDRC8ySTRIRnhTTjVneWQzSTZrWmxpeW5RZmtUZGY4VjZO?=
 =?utf-8?B?NDR4TCtiSXhEeTlibkwzVmdNZ0VoaUI5ejFPZmVzRyttclA0NlRMd0M2eFdh?=
 =?utf-8?B?WG13L01nd0E4WDVJWlNCUmJaRlpLMGpKdHprQlhlK01UL1diNE5jay9lNE13?=
 =?utf-8?B?MzRFNGQrV3BLWVJ5RHZvelg5aEdtbjBzYTRoblVZZ0pVaExOZUFPME91dU1P?=
 =?utf-8?B?NlhUOUIrWXJ1Y2xGVVBscHl5eXFMSHNwaVp3Qy9ucDI2NHhQMFdUenRUNXZ2?=
 =?utf-8?B?R01hN3AxYXEwMHEwdXBjQ0kzV09EUXdYcGp4ekE3VEI1Wi9vYUpJb3ArblNu?=
 =?utf-8?B?cmJIYy9qemd4M3VEQU9UQVBWNTNHOUUreFZYWTBiYloweUYzTjI2ODB5RHUw?=
 =?utf-8?B?OG1RdjFQN2VTSTYrTU1kMStOWmp5WGd3L29BRjhQSlBtUW80Sm9vdEY3SFho?=
 =?utf-8?B?QjNNUWptdGhXdlFSeEFmNFVWVTd6VVR5R0xjWnpDM2k2dnpaUjZraDF6S1By?=
 =?utf-8?B?KzFiSm5rWVBVSmpZNlY5Z1FiS1NGd2VMMGcxQ0FvaGVmVjNrQ0w2NS9yRHM1?=
 =?utf-8?B?c2Y5S3JBYk5ORFl6TklFUTVwZmxmK3luTVNaQ3QxRlNZWHlrUlQzZ0pTSFg0?=
 =?utf-8?B?K0lxdEFOMXZGUU9sUUpzWTRYQkN3WllBYmdWUDBFQTlMcW5waFlQeEhlNytR?=
 =?utf-8?B?MEU3YTNSYis1b0VhQncrOTlNY2Z2dEI3STRFK3RWWUtpZ0FQTkdsRXpQTlZs?=
 =?utf-8?B?SmpLT2VUc2NNb3VjOHJBT1RuSEplOGdscDR6cTFtcmdjVVhSYnpobUJiUzdU?=
 =?utf-8?B?Um9PU0N3RG85c2g1SkVVbDJZdnU1RFJiOVdZZUJKbVhpa1hlMUJuL3p4V3dG?=
 =?utf-8?B?WUY4dkg0NHFTL3NaUnN6M1NSaGxBdmJVTGRrWmVSaXhEV2krNVQwQjJkNE9a?=
 =?utf-8?Q?jZZ1tkhltKO2t/Vs3UghcLo862BWrNSY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzRObU5yOFJMQUp3WUNzZUF3Q3ViODJkWU55Qi83TDVkeVJTZlVyay92SkJU?=
 =?utf-8?B?bTZ6M3IyU25LcHovNi9iRUVyajhuSnNFdlo0alJSaE1TdlAxV0JWQlF1RVJa?=
 =?utf-8?B?Wkp0WkFoN0VjblF1TG1TenZXNXgzajhRYXB3bGVpZlh2M3B1VUNaMGVVU2NS?=
 =?utf-8?B?ekp1aHI3SWNuMXNhb0VBRUZYNVg0Skxqd2JFeEhCcFJlTjJrUEhROTg4UXlB?=
 =?utf-8?B?a2xSN3hHeTRHWE95MU81ajkvRkRjNHRlcURvL2swNlRTcDRmR0F3UzVnVmpq?=
 =?utf-8?B?VzJNUTJORkM0c080VjQrcEtmVVZDOXBxTndxWVZDczB4TzdYNmxHUGJIcmJK?=
 =?utf-8?B?aTQ3dlBBWDUzRXAxaEdsTERYUHk4T3dEYUQ4ek1KZ3NsMzFPSTA5RXVpdTlK?=
 =?utf-8?B?UHZPd1NCcmcraVl1R09SY0V1VC9VMmhhTXZUck1CZnRDYll2bEFiSXBaRDdI?=
 =?utf-8?B?MUFKQ2NDY25icG4zN09QM2M0Nng5STFvTk4ydkIraVdjeUJCRGdNS3k1WjNW?=
 =?utf-8?B?L3dOb1Y4b09Hcm5BVEdJZUlxZXRRRCt3Z2pxWWJtTEMvRi9rV3RibmpUU0pS?=
 =?utf-8?B?TDAyanNGVy9pVy9JOTRhVU9OMW9QR3hLOXJPUHV1WHVwUWhkZEJnVVcwZ1h4?=
 =?utf-8?B?NHF2dm9adlZZNmJON1BmRmxwNWJTN3FZWHFuSTY1UXpvRUltVFNiMzRvaUtw?=
 =?utf-8?B?THAwUTNReXlCUHFJY291Y3VPMk9FaGZCbmIxdkVlL0E5VnlWMVFLSlFwVzBR?=
 =?utf-8?B?aDVtL1FnMWRNUytYcXRNakJjcDN6dmdPanBYa21xSHNVU3IvWVBrNldQc0NV?=
 =?utf-8?B?bWxESkNWaFdnVEpMN29ndk9xTkt6Y0lBVHZaUkI3ZkNPRjM2L2Vjd3lGNm1F?=
 =?utf-8?B?UnF3SmMrK1l6UW9mVW1PUEo1ZHBtTkNJYzU5ZnZIOGpvVDJuOElEZWp4R0RW?=
 =?utf-8?B?U3ZtMytvYUU1ZWlrWjV5MUNkQnFjalR4T2lQL2pJMGlrSXN0eVJpRXNlQnJW?=
 =?utf-8?B?Slh3VUdkc1RzOVhEcHZodXZ1NmQ4UHQvczlhbmoxYnpjVldUQVdrQTljTXBt?=
 =?utf-8?B?dGJ3WjZEY2tmQS9zUzl0eVNZdEIvM2ZrenBwcUJtTW5QTThKKzh0ekd2cjhT?=
 =?utf-8?B?L2xvcUphRktGazdndWhCZzZZeUpJVDdZQ2xkbnZFQ0VKMTRINnl2cDZMYXJz?=
 =?utf-8?B?Y3VKWWlhNEJUcWlCUGVxQTdYUGNpQ3lqUDBEamh5bzQrWXJIWElPdk9wNEl1?=
 =?utf-8?B?YW9Za2duRmlQdTZac2phMEZBZmZKMWVVTnRQc2twcXhlN2hzaUlSL3FKNC90?=
 =?utf-8?B?MWdtL2hCRTlZZmFOR0RmUGZxanpFUWl4Q0FGUmY4dU5SUHVRUVlmOVZMWFNI?=
 =?utf-8?B?eDVreGh0SlJxWTNaTkRlcWhkUUpmM0FnK2pLTUZnM0FMODg4WWF0Y3lIK2ZJ?=
 =?utf-8?B?WGg0dnRWRTFZd1FRcko3Q3JvdnY0VC80dXpQN0N3TFFJVVN4QnFwelo4dmhk?=
 =?utf-8?B?bVo1MG5BblBYZUZIVTZXdkNNV0VuNEhFQmtKS2FqNU1rQlZjY285SjJ1Z1o4?=
 =?utf-8?B?ZVduY08wUzNvdXJGTm1DL0J2Q2lGcHlobE52bVErbFJ6QnlWaHRpd1p3MDRS?=
 =?utf-8?B?SHJ0NVJrUGQxdXpJdk13NnU1UTZsTXJjY05XN2NVc0NJWHNrYlNlK211SGlB?=
 =?utf-8?B?T3ZuYjIrNTJPZ0laWlZTZFMvdTBRZ2QrRms5dTd2bzZqTVJZRkd1VmoyZmEw?=
 =?utf-8?B?WUp3YmxMODRMSVFlblR2dHpUNVdueUt3eFVZLzBlWmhEQkFKeTB1YldJbXZI?=
 =?utf-8?B?Q2Jmdi8wWE5sYy9qbzkwUU1wZVF2TEVUVHJORVdWbStIYTFWYmg0N1h6eUYv?=
 =?utf-8?B?R3dhcmZha0RzZWlGdURXQklpa1FMdlZNUTFKRUVUMzBkaHcrSlRQazRIU2Rs?=
 =?utf-8?B?ZGdGcUJrSXgrUHZIejduYWVhZHJJZlpqeVo5aW85QmFodklqWnJaYzRLYmNw?=
 =?utf-8?B?TlpNTWpSNnlaUXZoRjhZQTFCcGZFaHhYVXJ6UGs1N0VqZnJFU05FNzExaU1V?=
 =?utf-8?B?c016TGU4dEZiZkNoQzQwMklHREtjQ2FuOVdFb0tQczhNTEpXYnVXM2U1Y0kv?=
 =?utf-8?B?Y3ZNcW9lZC9jTC9MaVMxZDJjUDdUdmMzb0MxNndoQmcweWM1K0J6K3hsaHNZ?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e8a663-223a-438b-90e6-08de25f4e9ff
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 16:18:16.4406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9m+o3v7A12x9OfJcB+BuGJ23AKvH20a6grH9O0KntKdmkXlpbkI/4Uw+deujmJZhmu05CEy75y3jIJdCAlxc6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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


On 11/17/2025 7:32 PM, Hellstrom, Thomas wrote:
> On Thu, 2025-11-13 at 16:33 +0000, nishit.sharma@intel.com wrote:
>> From: Nishit Sharma <nishit.sharma@intel.com>
>>
>> This test verifies memory coherency in a multi-GPU environment using
>> SVM.
>> GPU 1 writes to a shared buffer, GPU 2 reads and checks for correct
>> data
>> without explicit synchronization, and the test is repeated with CPU
>> and
>> both GPUs to ensure consistent memory visibility across agents.
>>
>> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
>> ---
>>   tests/intel/xe_multi_gpusvm.c | 203
>> +++++++++++++++++++++++++++++++++-
>>   1 file changed, 201 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_multi_gpusvm.c
>> b/tests/intel/xe_multi_gpusvm.c
>> index 54e036724..6792ef72c 100644
>> --- a/tests/intel/xe_multi_gpusvm.c
>> +++ b/tests/intel/xe_multi_gpusvm.c
>> @@ -34,8 +34,13 @@
>>    * SUBTEST: atomic-inc-gpu-op
>>    * Description:
>>    * 	This test does atomic operation in multi-gpu by executing
>> atomic
>> - *	operation on GPU1 and then atomic operation on GPU2 using
>> same
>> - *	adress
>> + * 	operation on GPU1 and then atomic operation on GPU2 using
>> same
>> + * 	adress
>> + *
>> + * SUBTEST: coherency-multi-gpu
>> + * Description:
>> + * 	This test checks coherency in multi-gpu by writing from GPU0
>> + * 	reading from GPU1 and verify and repeating with CPU and both
>> GPUs
>>    */
>>   
>>   #define MAX_XE_REGIONS	8
>> @@ -93,6 +98,11 @@ static void gpu_atomic_inc_wrapper(struct
>> xe_svm_gpu_info *src,
>>   				   struct
>> drm_xe_engine_class_instance *eci,
>>   				   void *extra_args);
>>   
>> +static void gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
>> +				      struct xe_svm_gpu_info *dst,
>> +				      struct
>> drm_xe_engine_class_instance *eci,
>> +				      void *extra_args);
>> +
>>   static void
>>   create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
>> drm_xe_engine_class_instance *eci,
>>   		    uint32_t *vm, uint32_t *exec_queue)
>> @@ -214,6 +224,35 @@ atomic_batch_init(int fd, uint32_t vm, uint64_t
>> src_addr,
>>   	*addr = batch_addr;
>>   }
>>   
>> +static void
>> +store_dword_batch_init(int fd, uint32_t vm, uint64_t src_addr,
>> +                       uint32_t *bo, uint64_t *addr, int value)
>> +{
>> +        uint32_t batch_bo_size = BATCH_SIZE(fd);
>> +        uint32_t batch_bo;
>> +        uint64_t batch_addr;
>> +        void *batch;
>> +        uint32_t *cmd;
>> +        int i = 0;
>> +
>> +        batch_bo = xe_bo_create(fd, vm, batch_bo_size,
>> vram_if_possible(fd, 0), 0);
>> +        batch = xe_bo_map(fd, batch_bo, batch_bo_size);
>> +        cmd = (uint32_t *) batch;
>> +
>> +        cmd[i++] = MI_STORE_DWORD_IMM_GEN4;
>> +        cmd[i++] = src_addr;
>> +        cmd[i++] = src_addr >> 32;
>> +        cmd[i++] = value;
>> +        cmd[i++] = MI_BATCH_BUFFER_END;
>> +
>> +        batch_addr = to_user_pointer(batch);
>> +
>> +        /* Punch a gap in the SVM map where we map the batch_bo */
>> +        xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
>> batch_bo_size, 0);
>> +        *bo = batch_bo;
>> +        *addr = batch_addr;
>> +}
>> +
>>   static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>>   		       uint64_t dst_addr, uint64_t copy_size,
>>   		       uint32_t *bo, uint64_t *addr)
>> @@ -373,6 +412,143 @@ gpu_mem_access_wrapper(struct xe_svm_gpu_info
>> *src,
>>   	copy_src_dst(src, dst, eci, args->prefetch_req);
>>   }
>>   
>> +static void
>> +coherency_test_multigpu(struct xe_svm_gpu_info *gpu0,
>> +			struct xe_svm_gpu_info *gpu1,
>> +			struct drm_xe_engine_class_instance *eci,
>> +			bool coh_fail_set,
>> +			bool prefetch_req)
>> +{
>> +        uint64_t addr;
>> +        uint32_t vm[2];
>> +        uint32_t exec_queue[2];
>> +        uint32_t batch_bo, batch1_bo[2];
>> +        uint64_t batch_addr, batch1_addr[2];
>> +        struct drm_xe_sync sync = {};
>> +        volatile uint64_t *sync_addr;
>> +        int value = 60;
>> +	uint64_t *data1;
>> +	void *copy_dst;
>> +
>> +	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
>> +	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
>> +
>> +        data1 = aligned_alloc(SZ_2M, SZ_4K);
>> +	igt_assert(data1);
>> +	addr = to_user_pointer(data1);
>> +
>> +	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
>> +	igt_assert(copy_dst);
>> +
>> +        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo,
>> &batch_addr, value);
>> +
>> +        /* Place destination in GPU0 local memory location to test
>> */
> Indentation looks odd throughout this function. Is there a
> formatting / style checker that has been run on these patches?
>
>> +	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
>> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>> +			    gpu0->fd, 0, gpu0->vram_regions[0],
>> exec_queue[0],
>> +			    0, 0);
>> +
>> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
>> +	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
>> +			     sync_addr, exec_queue[0],
>> prefetch_req);
>> +
>> +        sync_addr = (void *)((char *)batch_addr + SZ_4K);
>> +        sync.addr = to_user_pointer((uint64_t *)sync_addr);
>> +        sync.timeline_value = EXEC_SYNC_VAL;
>> +        *sync_addr = 0;
>> +
>> +        /* Execute STORE command on GPU0 */
>> +        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
>> +        if (*sync_addr != EXEC_SYNC_VAL)
>> +                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr,
>> EXEC_SYNC_VAL, exec_queue[0],
>> +			       NSEC_PER_SEC * 10);
>> +
>> +        igt_assert_eq(*(uint64_t *)addr, value);
> This assert will cause a CPU read which migrates the data to system, so
> perhaps not ideal if we want to test coherency across gpus?
>
>
>> +
>> +	/* Creating batch for GPU1 using addr as Src which have
>> value from GPU0 */
>> +	batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
>> +		   SZ_4K, &batch_bo, &batch_addr);
>> +
>> +        /* Place destination in GPU1 local memory location to test
>> */
>> +	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
>> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>> +			    gpu1->fd, 0, gpu1->vram_regions[0],
>> exec_queue[1],
>> +			    0, 0);
>> +
>> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
>> +	xe_multigpu_prefetch(gpu1->fd, vm[1], addr, SZ_4K, &sync,
>> +			     sync_addr, exec_queue[1],
>> prefetch_req);
>> +
>> +        sync_addr = (void *)((char *)batch_addr + SZ_4K);
>> +        sync.addr = to_user_pointer((uint64_t *)sync_addr);
>> +        sync.timeline_value = EXEC_SYNC_VAL;
>> +        *sync_addr = 0;
>> +
>> +        /* Execute COPY command on GPU1 */
>> +        xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
>> +        if (*sync_addr != EXEC_SYNC_VAL)
>> +                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
>> EXEC_SYNC_VAL, exec_queue[1],
>> +			       NSEC_PER_SEC * 10);
>> +
>> +        igt_assert_eq(*(uint64_t *)copy_dst, value);
>> +
>> +        /* CPU writes 10, memset set bytes no integer hence memset
>> fills 4 bytes with 0x0A */
>> +        memset((void *)(uintptr_t)addr, 10, sizeof(int));
>> +        igt_assert_eq(*(uint64_t *)addr, 0x0A0A0A0A);
>> +
>> +	if (coh_fail_set) {
>> +		igt_info("coherency fail impl\n");
>> +
>> +		/* Coherency fail scenario */
>> +		store_dword_batch_init(gpu0->fd, vm[0], addr,
>> &batch1_bo[0], &batch1_addr[0], value + 10);
>> +		store_dword_batch_init(gpu1->fd, vm[1], addr,
>> &batch1_bo[1], &batch1_addr[1], value + 20);
>> +
>> +		sync_addr = (void *)((char *)batch1_addr[0] +
>> SZ_4K);
>> +		sync.addr = to_user_pointer((uint64_t *)sync_addr);
>> +		sync.timeline_value = EXEC_SYNC_VAL;
>> +		*sync_addr = 0;
>> +
>> +		/* Execute STORE command on GPU1 */
>> +		xe_exec_sync(gpu0->fd, exec_queue[0],
>> batch1_addr[0], &sync, 1);
>> +		if (*sync_addr != EXEC_SYNC_VAL)
>> +			xe_wait_ufence(gpu0->fd, (uint64_t
>> *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
>> +				       NSEC_PER_SEC * 10);
>> +
>> +		sync_addr = (void *)((char *)batch1_addr[1] +
>> SZ_4K);
>> +		sync.addr = to_user_pointer((uint64_t *)sync_addr);
>> +		sync.timeline_value = EXEC_SYNC_VAL;
>> +		*sync_addr = 0;
>> +
>> +		/* Execute STORE command on GPU2 */
>> +		xe_exec_sync(gpu1->fd, exec_queue[1],
>> batch1_addr[1], &sync, 1);
>> +		if (*sync_addr != EXEC_SYNC_VAL)
>> +			xe_wait_ufence(gpu1->fd, (uint64_t
>> *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
>> +				       NSEC_PER_SEC * 10);
>> +
>> +		igt_warn_on_f(*(uint64_t *)addr != (value + 10),
>> +			      "GPU2(dst_gpu] has overwritten value
>> at addr\n");
> Parenthesis mismatch.
>
> BTW, isn't gpu2 supposed to overwrite the value here? Perhaps I'm
> missing something?
Will change this logic
>
> Also regarding the previous comment WRT using the naming gpu0 and gpu1
> vs gpu1 and gpu2? Shouldn't we try to be consistent here to avoid
> confusion?
>
> /Thomas
>
>
>
>> +
>> +		munmap((void *)batch1_addr[0], BATCH_SIZE(gpu0-
>>> fd));
>> +		munmap((void *)batch1_addr[1], BATCH_SIZE(gpu1-
>>> fd));
>> +
>> +		batch_fini(gpu0->fd, vm[0], batch1_bo[0],
>> batch1_addr[0]);
>> +		batch_fini(gpu1->fd, vm[1], batch1_bo[1],
>> batch1_addr[1]);
>> +	}
>> +
>> +        /* CPU writes 11, memset set bytes no integer hence memset
>> fills 4 bytes with 0x0B */
>> +        memset((void *)(uintptr_t)addr, 11, sizeof(int));
>> +        igt_assert_eq(*(uint64_t *)addr, 0x0B0B0B0B);
>> +
>> +        munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
>> +        batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
>> +        batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
>> +        free(data1);
>> +	free(copy_dst);
>> +
>> +	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
>> +	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
>> +}
>> +
>>   static void
>>   atomic_inc_op(struct xe_svm_gpu_info *gpu0,
>>   	      struct xe_svm_gpu_info *gpu1,
>> @@ -472,6 +648,19 @@ gpu_atomic_inc_wrapper(struct xe_svm_gpu_info
>> *src,
>>   	atomic_inc_op(src, dst, eci, args->prefetch_req);
>>   }
>>   
>> +static void
>> +gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
>> +			  struct xe_svm_gpu_info *dst,
>> +			  struct drm_xe_engine_class_instance *eci,
>> +			  void *extra_args)
>> +{
>> +	struct multigpu_ops_args *args = (struct multigpu_ops_args
>> *)extra_args;
>> +	igt_assert(src);
>> +	igt_assert(dst);
>> +
>> +	coherency_test_multigpu(src, dst, eci, args->op_mod, args-
>>> prefetch_req);
>> +}
>> +
>>   igt_main
>>   {
>>   	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
>> @@ -519,6 +708,16 @@ igt_main
>>   		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_atomic_inc_wrapper, &atomic_args);
>>   	}
>>   
>> +	igt_subtest("coherency-multi-gpu") {
>> +		struct multigpu_ops_args coh_args;
>> +		coh_args.prefetch_req = 1;
>> +		coh_args.op_mod = 0;
>> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_coherecy_test_wrapper, &coh_args);
>> +		coh_args.prefetch_req = 0;
>> +		coh_args.op_mod = 1;
>> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_coherecy_test_wrapper, &coh_args);
>> +	}
>> +
>>   	igt_fixture {
>>   		int cnt;
>>   
