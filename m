Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E952BC7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 18:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1C10E05F;
	Mon, 23 Jun 2025 18:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eK99pfCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6B10E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 18:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750705142; x=1782241142;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=69bQpRRYNlaEASPRcIX8sMpT/mLCgG5TxSPhxi4Ulqk=;
 b=eK99pfCKCurLgSccIRe8mkH6kp8mm16yu5Ff3ABAxXQusD/Csf4dPIG7
 J0CWzCKY51eJS+5Paz5SsArjyehYOnvhAChuBfVnmud9TkrJzAtihP7Is
 hCeo4fZ/LY2elo09QfpZrVub1vztUvuZ2RHItMsfi/VpC6UyYkpGwtxdm
 tUFzEKduaWzvPRoK5w4UzehCSeGH+fm145imO2/Zj2oQW9TsIVkNQPsya
 VXwFdPNINubeGIhjZF38QlU4m2/BotDBHnr64qgQEeYV8D5E87A0lnQW4
 J9yt+9NWmnC2D5JA7LgkPkwv5/VdcptfxzdQ7r3bRNmKUGy0seNSNYi4D Q==;
X-CSE-ConnectionGUID: jFX14ieSSLqPa6k2x7qBcg==
X-CSE-MsgGUID: FxbcLnwcSlSS1z0oOHbiNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63531652"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="63531652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 11:59:01 -0700
X-CSE-ConnectionGUID: VA1jH7zfRPm4PFDDrSduFg==
X-CSE-MsgGUID: XrXUzgOtQqaQ72NfUZKifA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151986910"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 11:59:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 11:59:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 11:59:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 11:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRnBU6gnN1j2LiqNCcQZuYKmrtddGaZMnRDpPngBKB8sPLDS79+FCoj1OxD2BaJDLAn362oJZJDZxnxHU4tiBNlOEK3l8/YTX850uOnOOg+ToXe2FBkgotK01bUmav2tLmHME8TmGIZT6gWmdTRUkQzOhv9MP/gdFKHDTQs9UZer9aYLwx/V1pG25HW7viJn61aHdbtL/CBko3uc5YROMZ5zVIH+okZuWnCZ9f+cM5f6/jbThYsGf6jFF55WUoD9ccXyMqhBX+pM7ZoUFz50AsIhb7T1Gj2mEx0nISj1q0e1dR928rxt7mKjtlPCqb/4HqpgFDcmtCXS1LWBcJOOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcKj5/9NTn8Wf3R0itzyfoNd6EEIH7/aCrb0ZpYqewg=;
 b=ejLzKTrBrtO4wuvZGfZHuera2tBE13LW5dGMU1+8JXO08mfKTjpUC0sWTou5O0Hptb2u9bim/txVxIB2taN+F+Lp74IcPe2vAJcU8eOZoZRQokEz2pe7s8EkMrFDtBVZtz3RnW5fA5x5b8qNL6fYbmfLxXUbwLn8WD/PegVkyZdGqXifIImJmB6r41C5rpKCxFkU3gDmtnp6SMrWTK8OsSoLDghVirpjn6vGcmPYLdsQlwSEY9bRQE5SM4S0aKuP96yKCwdYyxhLiAwple86ERRruKP7Ywk+tgy49d5WP5fA4yuYx91B4NkRg3rdk4NzXXLWUzs/NP2kGyi90D3LWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 by DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Mon, 23 Jun
 2025 18:58:29 +0000
Received: from SN7PR11MB8262.namprd11.prod.outlook.com
 ([fe80::2320:b2a0:cdb1:292e]) by SN7PR11MB8262.namprd11.prod.outlook.com
 ([fe80::2320:b2a0:cdb1:292e%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 18:58:29 +0000
Message-ID: <141d9d4f-d718-4df4-9ac9-ea0a222919a1@intel.com>
Date: Tue, 24 Jun 2025 00:28:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vram-sr through
 Mods during host s2idle
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>
References: <20250602110300.1324145-1-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250602110300.1324145-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To SN7PR11MB8262.namprd11.prod.outlook.com
 (2603:10b6:806:26e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8262:EE_|DS0PR11MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: dea6b75a-a7a7-4898-a302-08ddb287f10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVJSc3NORU5SQVdmcnAwS1dUM2pucldhMEFlSU45eEJ1eFVER2VjaVRoRERv?=
 =?utf-8?B?QjZYOXk3K0w5dWJhYUdsVGhVUkl5bWxZcWlBM3c5SUVoRm8xcmErZWx2ZkVn?=
 =?utf-8?B?bkx4eXIzNm1janRkMDVNUjhYM2pONG9mNUNpaFEySFQxRFAvSzhoazJKWTFR?=
 =?utf-8?B?bXA2UVJqbnpMYk02QjRwRHNsUG9abHJIdDNpOXU3NGIwZEd2cVF2aGt1MW11?=
 =?utf-8?B?elc3Z3lsRFRUdGZLUU9qcHFxT3dVNXI3dGJHQ013MzVMc0xYSytvdGMzRHNY?=
 =?utf-8?B?MWxQT0xKbWJ5VG1FNlh5aGN4QUdVOVZETlEySUJSMXNibXVBM1pMa3ZQMXAw?=
 =?utf-8?B?SExLQitoSDZPNmNDSEdjVERrcXgrYWNJeXgzU2VxV3NnTjZlUHZTT2s5WDNP?=
 =?utf-8?B?eE1aTlBCRy9RYWxCa3dOVlF1R2xpdW1iTHVRejRLWWtzVTNOZWN2Z0ZnVEFC?=
 =?utf-8?B?ZkV1em50UjVyeVZuREtKMjVrMERkUTNVRUtYTFZpUUF4WFNwRGJoZGxBcTNN?=
 =?utf-8?B?aWI4b1poWjE0Y0NHM3AxUTkwM1VtQmpwbTVZcEJ0ZGF1WTc2WHVCYVB3WENu?=
 =?utf-8?B?eU02Rm5ib0pCRTRkeWlSbVl4VTFTQXd5eWt6NDEzWlVIZXFMNlJLbGM4c0FW?=
 =?utf-8?B?MWx4K2dlMXhjQ2xsV21Fbk92d3FZYTZlRzk5Y3B1R1FXRXl3T0RiVFg3Nk10?=
 =?utf-8?B?VGVjTndwM1hvUys0akxra3d4Zk9VWENEUGhXU1VCcExDOVc5NXp3Y3Rwc3ZW?=
 =?utf-8?B?a2RLSGczWkpkQTdWQWxzOVBJRkhxUkwwU0ZnR2NYRnpGYkxEMTFpZzJkSUlU?=
 =?utf-8?B?K2k3TTgzWElNeFhLT3RYWGZ1aXJqbEx5bWVwUDFrN2tQcHlOb2lTNHpiSXhH?=
 =?utf-8?B?RGlEK3FPeUZCOVRzZHRlM3VqWWp4NjNlQWQwSnpoWVlHOVErQU40YWpWY1Jn?=
 =?utf-8?B?NGFTZnE2UUVsdUtPeDNad2U3d205T3d6SHlIV1V4K2VSUUVXeVB6dVdON294?=
 =?utf-8?B?RHZCNXJjWGdna1BFcko3Z0hiVVhxWUUvWlBVTms5czVuWkFjNjVDWGNNR0pY?=
 =?utf-8?B?T3JSOHE2ZVQ3cmo2eGJpOHVMeUt0NVJuR3Q1Zno1OG1zZFZyZ3FJbFl1ald1?=
 =?utf-8?B?WEMxZERZeHpnazZIN2NWL3diRS8xRSs1YzNZM1k0Ti9sYkN3TWNjTXJkNWlL?=
 =?utf-8?B?RXRPMCtoVCtwVUgrSVFmSGtHcHBUWTJodnNDOFBvZmJ5NHRLU1dMY29WWFlK?=
 =?utf-8?B?d0xxdFlRaXliU3VIQnYvcmhrTDNydy9UUW8zMVUrWWZmTnJWVDFkdlpzL3NW?=
 =?utf-8?B?ZXNKd0JvdlEzdWtLeGw2aGlvdlVJU0d1NGRlSU5abHdQcWFOYXlPb0RhUW5V?=
 =?utf-8?B?L1RsRVozdGc2YUI4Q2ZtTFN4OGNQazJVZVVLNmVuQjR3b2hHd0RvQ04xc25R?=
 =?utf-8?B?dzFrYS9NaWZLaWVpN29lQVdvWldkamRVSEVCNGVMUkxGc2U2WXppMG5PSk45?=
 =?utf-8?B?Q1FjQXBVN0gxU3B2dVE4MTl3U0dWMEgrVWZJVk9KckwxUEhURWduUzRoSThM?=
 =?utf-8?B?cThLWXZuVDBIeFFlNzRFb1pBZ1JsTFZIaEcyMWVNc3Mxc2NoYXJOcEk0Y0ow?=
 =?utf-8?B?N1AzejgvbGlEMnFSaG4xNHpLZStVY2pXSmxPS0JNdXZrUzhTVUoxYjF2WFBT?=
 =?utf-8?B?aGZqK0hnMGdPUkhoQkxYeW5ia3hsZjU0WU5oaTd6K05QRDl3dmlscjdlaE1u?=
 =?utf-8?B?NjZnUEtyeWhTYTJTMW9LODlleTNtY3RlL3lRQjkzTzRZVGhtbittSXY4azJP?=
 =?utf-8?Q?z+IOWlEWNpQwfpUSfHPNymPHFss5h2qvIMKN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8262.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1F3WDJQcEY1b2ZrOC94ZjdMYjZjaVRTZnN5U3VKTXRPOFhUa3p0ZDUvNlo2?=
 =?utf-8?B?cW5la2loZ3QrRGJpdlArWmw0eWMzZkZUN0NQekxzeWRXa3RMVk8vZW1Jbzlu?=
 =?utf-8?B?a1JqK3BNS3NQV1NaaUo0RitRTVE3Z1BqWm82TnpRRlBKWlc4cEF1NWFOeUgr?=
 =?utf-8?B?MlV1WmdKRlI0Tmc4VTNabmpwOWV4aHRJNFRMZEdobXVxRW5tOUVNUi9jcjUz?=
 =?utf-8?B?c1hYbFQ1bi9sT3M2OGttMDZka1loNmROcTlXRWRZZHp5Yk5uclZwM1hMYjRV?=
 =?utf-8?B?U1lYUWhlTG5tUTRXZElmWW0vdW9XNW91b0FIdDBpaG0vR3hXTE9qZFgyWm9j?=
 =?utf-8?B?dElFaTRIWmZJNHl6L1E1SHI4RForTTd4S09jOGFqU0VwTmtoZHF3SzRyMER5?=
 =?utf-8?B?Vk5iUHJQbEVEaG5mNmh5aVpCc3czUklTN096ank3bXkxdC9nTytxSjRkMG5C?=
 =?utf-8?B?cGpScngxOEFpRjhQRWVRWXpLaHIzY2w4MWxpaGs2MEtyclNpbDl4OVhyeFpU?=
 =?utf-8?B?ZU9KcGRhSGluK1h4U0c2YTlQT1BCREdIYVdOY2xHUGVkNGFmRlZjd3JpYnJB?=
 =?utf-8?B?bmVqL0JxOXpwVm9nY1RYang0SURnL3puK3RNVTZteGhYNVZXZFNMaVFUZ20r?=
 =?utf-8?B?eWQzZDk2dWtnNkVaRjFGQXl0TUZyQVFEbzQ0T0gyZHFaRWZIaGpyMEhqR2tU?=
 =?utf-8?B?WWJYdWVNTmpJWjRIQ2o1bVZGRXdqQnJsekR4OWcyTU5Tem1oN1FzVkV6Ymlv?=
 =?utf-8?B?SlVTVDBYMERSSUF5QS9JMnRHcFpDaml0bmVPZXdTYzVOOW9TcmE5ZXJVVEN2?=
 =?utf-8?B?NTF6V3FCUUt1cFMvRFozMm0wdlhtQkN6cGRyeWE1TU1IWFhmRk5MSHZwRlVT?=
 =?utf-8?B?OGFoS2MzSGNEVlI4eEowc0JFc0N3RThLc1BzVE1NYm5ycHhWU2lKbUlpS3lr?=
 =?utf-8?B?SzFnM2NxU3I4SEN6cm1rWlZreXpLa1p3RHUzYmd3VExUN3NocnFDZC9KSXVQ?=
 =?utf-8?B?V3dOOWR5ZXVQb3JWN0N2STQvQ09NRncwT0VXb2VneGtiRFpIVHB5NVN4S2oy?=
 =?utf-8?B?MWhiUU5uakljd1ZZdG1QV1BKdnA5SHBrNGVHOUZuREIwKzVQbGRDNWlSMkwx?=
 =?utf-8?B?c2xDYytNL25mT2ZMU2UwUkhwU1NWMHl3ckZsVWNKRHNkVEw3Zm9iNWROSXhk?=
 =?utf-8?B?ZU5LL3d0MG1NTDBsTXk1R2RmV25YZXc2cWUwQ290OVQ1SnNGU1hjZ0s1OGpP?=
 =?utf-8?B?bUxkcjNxZ3IrMGhzdzRKVXJvWjlmQnpJRWRsUWVYWFJGbjRDQUNSelF1K2ND?=
 =?utf-8?B?aW96WHJyRVJnQ1FZNU9nMTBoTVFsL1Z0aUNxRlpqNlJyM1plRjFpdHVqQmhK?=
 =?utf-8?B?MVJTc3JwcTN3TGFtdlFMMEtNcWl2RkZtSU81UFdWMzFlZk00eGxVSnl6MEVK?=
 =?utf-8?B?R3ZRMyswY2EyTGM5R0Zzb2V6RHFXUkdSZ0pFdnZMd1l2TjUrYlBUZmc4WlBl?=
 =?utf-8?B?NVNGWnhCbmM1YkRTb0M2NUFKeHVDNGF3czh2VHNBOHp5cmJ2U21sTGtEamlp?=
 =?utf-8?B?QllINVZ5c3psNFAyTGg5bkxQMlFYVWtoWTlGVnNWZmlibDdTSzZBWmZOcDVn?=
 =?utf-8?B?L1RVS1laUWxZWkpXc0ZWVURSODJoYzlYcEdCYklBOHlFN0FIUTZEWVhseUcw?=
 =?utf-8?B?ZGJpaVZoMVlrNnZ3eVo0T2l1Yys5V3ZrWkhjaU9neU5ERDZYU2ViMEZjVktV?=
 =?utf-8?B?ZHhtTWI3ck04UVBmUXI1bXQxNGFUZ2REUTAzczRVZ3dTenlFOFF6QTR0aHNT?=
 =?utf-8?B?aGVVMG1hcmJGYzhvLzdiZGhsdUZ0cVJLWDFrZmZDZmhVMzdhNG9BMnJZb1Vr?=
 =?utf-8?B?eW9jWVQxbDA2dGpYK3lVNFlJYmVHZWdlQllCVXJuMlNacklPWmw0bUNvUkRJ?=
 =?utf-8?B?RGZXUHJSMkp0c3NzWHRubHhsaWNUb3hJb0VvT254emRGR2RuTVllUTBVUC84?=
 =?utf-8?B?a1YxakJhZ3A5QlhkN1ExSGFWUzNqVGpzTWxiSmZ5d0E5OU9zdkdGZk5SZmZ0?=
 =?utf-8?B?NGl5a1JQOEt1WXFFR3FmZDZMSkFoc09hcGVRSXgycFpCTWljNXN5WTYxVWdj?=
 =?utf-8?Q?KRB2jMbaMkKAa3b6jn9r2LdKe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dea6b75a-a7a7-4898-a302-08ddb287f10a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8262.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 18:58:29.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5CYsBX5M3H6qdJRE01Ib4EQM6tGTqO1XBP3myjE/ycfY2tmiVEoicvq8YbGbkivMRNSj+LVvLD624Dp0m7niw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7262
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

Hi Soham,

On 02-06-2025 16:33, Soham Purkait wrote:
>      Add test to validate vram-sr through Mods during host s2idle. It checks
> whether vram self refresh capability is supported through debugfs node and
> then introduce host s2idle to check ModS residency to confirm vram self
> refresh capability upon success.
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_pm.c | 99 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 98 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 6eb21d5ec..322b22eb0 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -10,9 +10,10 @@
>    * Sub-category: Suspend-resume tests
>    * Test category: functionality test
>    */
> -
> +#include <ctype.h>
>   #include <limits.h>
>   #include <fcntl.h>
> +#include <stddef.h>
>   #include <string.h>
>   
>   #include "igt.h"
> @@ -413,6 +414,46 @@ child_exec(void *arguments)
>   	return NULL;
>   }
>   
> +static char *read_content_line(const char *content, const char *prefix)
> +{
> +	const char *line_start = content;
> +	char line[1024];
> +	char *result;
> +	size_t len;
> +
> +	while (*line_start) {
> +		const char *line_end = strchr(line_start, '\n');
> +		size_t line_len = line_end ? (size_t)(line_end - line_start) : strlen(line_start);
> +
> +		if (line_len >= sizeof(line))
> +			line_len = sizeof(line) - 1;
> +
> +		memcpy(line, line_start, line_len);
> +		line[line_len] = '\0';
> +
> +		if (strstr(line, prefix)) {
> +			char *colon = strchr(line, ':');
> +
> +			if (colon) {
> +				colon++;
> +				while (isspace((unsigned char)*colon))
> +					colon++;
> +
> +				result = strdup(colon);
> +				len = strlen(result);
> +				if (len > 0 && result[len - 1] == '\n')
> +					result[len - 1] = '\0';
> +
> +				return result;
> +			}
> +		}
> +		line_start = line_end ? line_end + 1 : NULL;
> +		if (!line_start)
> +			break;
> +	}
> +	return NULL;
> +}
imho this function is not required, explained below.
> +
>   /**
>    * SUBTEST: %s-basic
>    * Description: test CPU/GPU in and out of s/d state from %arg[1]
> @@ -777,6 +818,57 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>   	}
>   }
>   
> +/**
> + * SUBTEST: vrsr-capability-during-host-s2idle
> + * Functionality: pm - vram-sr
> + * Description: Test to validate vram self refresh through
> + * ModS residency counter during host s2idle
> + */
> +
> +static void test_vrsr_capability_during_host_s2idle(device_t device)
> +{
> +	u32 bo, placement;
> +	u64 s2idle_start_mods, s2idle_end_mods;
> +	int dir, ret;
> +	char buf[4096] = {0};
You can reduce the side, buf[256] should be enough to store data.
> +	char *result;
> +	void *map;
> +
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "vrsr_capable node is not present in debugfs.\n");
> +	igt_assert_f(strstr(buf, "true"), "VRSR capability is not supported.");
> +
> +	placement = vram_memory(device.fd_xe, 0);
> +#define XE_BO_SIZE (350 * 1024 * 1024)
define these macros at the top.
> +	bo = xe_bo_create(device.fd_xe, 0, XE_BO_SIZE, placement, 0);
> +	map = xe_bo_map(device.fd_xe, bo, XE_BO_SIZE);
> +	memset(map, 0, XE_BO_SIZE);
> +
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "dgfx_pkg_residencies node is not present in debugfs.\n");
> +
> +#define MODS_PREFIX "ModS"
same as above.
> +	result = read_content_line(buf, MODS_PREFIX);
Just to read the package residency here, you can use sscanf. For more 
details please refer to the function read_mods here:
https://patchwork.freedesktop.org/patch/660150/?series=149557&rev=2
> +	igt_assert(result);
> +	s2idle_start_mods = (uint64_t)strtoull(result, NULL, 10);
> +	free(result);
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
> +	munmap(map, XE_BO_SIZE);
> +	memset(buf, 0, sizeof(buf));
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
> +
> +	result = read_content_line(buf, MODS_PREFIX);
same as above.
> +	igt_assert(result);
> +
> +	s2idle_end_mods = (uint64_t)strtoull(result, NULL, 10);
> +	free(result);
> +
> +	igt_assert(s2idle_start_mods != s2idle_end_mods);
Maybe we can check if the end counter is greater than the first one or not.

Regards,
Anirban
> +}
> +
>   igt_main
>   {
>   	device_t device;
> @@ -936,6 +1028,11 @@ igt_main
>   		test_vram_d3cold_threshold(device, sysfs_fd);
>   	}
>   
> +	igt_describe("Validate VRAM self refresh capability during host s2idle");
> +	igt_subtest("vrsr-capability-during-host-s2idle") {
> +		test_vrsr_capability_during_host_s2idle(device);
> +	}
> +
>   	igt_fixture {
>   		close(sysfs_fd);
>   		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);

