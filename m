Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5872DCF6495
	for <igt-dev@archiver.kernel.org>; Sat, 28 Sep 2024 09:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AB010E360;
	Sat, 28 Sep 2024 09:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFSBsyW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EFB10E177
 for <igt-dev@lists.freedesktop.org>; Sat, 28 Sep 2024 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727516702; x=1759052702;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ca27sboXih4bqX+OaVR4+rKfpI+25gyKBUVJ8irvMdA=;
 b=AFSBsyW94YTtp+qksMJtPQ4bCYyT2pBYUs3bhQuZrFeMhb/5i5/Rwf75
 kB7Icl5SVuqNER1CCUO49kkzLJuGAo8BmwS/LtFtHip28XuN5yv9tfLCZ
 iaArcP2+Mei46QTIs9xPgMmOL877k3H3g0+nzFkHXAB5sRvlAcWS67PZz
 7uQp6XxeTnGizZMMT1FddqhoJrJaKOWBSO22cfwd9wJlv9uTwhdf78LgX
 z+swBfqBoE2oIjTCmMAj1zaTmsvSgQyX8RcwaWImaTxDU3+XPsusekWbu
 dgtauqgw1ymbQYDfE3FF5qnNn2hb6vh33Y2sPYqF0IdL6LaT2afl/7GCN w==;
X-CSE-ConnectionGUID: loP2AKTDT6ifohytA/XVcA==
X-CSE-MsgGUID: Nw0LtinlSIOHm9rjcMGU7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37335304"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="37335304"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 02:45:01 -0700
X-CSE-ConnectionGUID: cEzA2SJUSGq9yPLFWPTddg==
X-CSE-MsgGUID: Sa5mkw8jThq0+HodqvDWwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="77166424"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2024 02:44:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 28 Sep 2024 02:44:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 28 Sep 2024 02:44:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 28 Sep 2024 02:44:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 28 Sep 2024 02:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VARjqTLWOCPj4PT+0u2vFWnh+/yBvb5/ykpAGCcYbbAWa0UW132MHrISjPleb/4dDBJIM7nrAMzdzxnVrwf5v9otKZ9lHyUUplEilprbmNA9SICY3BMcO8lAHzMuS//ZFtlJmY7GCEbtiPDu5CkBCmWIPCDx/QLtROZz/1QqUEcqgNRyywpfaw8KXGyKc4aQt935yH8Y4zgPps5AYrZWJFzley0CMJ3Vmycqc/ii165lFCNcBibwd/PbMnnJ4YErY/gIOXfFT9fZhH/HvU/RSn3lW6pgo5GGLIT3GNAI7qbHFoPYTtoVpfoN+J1p4n7HBZ6L9Z1OSjWSuCG4SSfSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKve/UbOlPRJmTfbwN2m65I42mRjfyD7GSiaTRd7PFg=;
 b=t/XGoJWKpSX5WJFlgUiyGBSfBNgqt3B4wDLryjAmVp5QZhMzaMbf66B4LagZ2zN7NucDK3mB+JWvUdb9htqLI6FH/UNulrPH0UcTeNe48eCuHzF6Xv4BFinx+ukKwgVfAfiRLW8NyMDXPX5tFfUHKzz99uO6I6t2IGB9R1Xoz9QFq1LDnbu8R8+nNM2c8y5ylzYMzHXFSuQy6YAleaNAbC+/mikRePWWc2C9mnhBVf9ECwVCHDLCx8ZaOZcaLAXA7FrT5eLkSJ24WqpQDjb6481sO4qixWOmmWfora0BJ+Xf2dMTzLMKyABcvsYCY3kCSLqcF1AxmQcoc+aTQ6Kcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Sat, 28 Sep
 2024 09:44:41 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.8005.020; Sat, 28 Sep 2024
 09:44:41 +0000
Message-ID: <32a02169-e2a1-4225-9756-3ff013e65de3@intel.com>
Date: Sat, 28 Sep 2024 15:14:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_backlight: Brightness test
 during DPMS on and off
To: <igt-dev@lists.freedesktop.org>
References: <20240704113102.2762-1-mohammed.thasleem@intel.com>
 <20240926193838.698648-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20240926193838.698648-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|SA1PR11MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e878baf-15ec-4150-ba51-08dcdfa22cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm5IMVIzN1hzb3FIRjlmaWQ5dUl3WEZCRlBUUCsrTjJ2bXdTUlVRTmc5cGpU?=
 =?utf-8?B?QkM0eG1ZQUx2WG8wK3VPaWUrNDI4TklBNXBpc1REYmI1ZzAxRFYyUXFKZ3Bl?=
 =?utf-8?B?TmwvUWdUWFRUdTZHOVQzWkNMM2xGVG80aTM1ZmFlNDBhampJVTVQcHQyU2FO?=
 =?utf-8?B?MHZQSXJ3eDcvbUZ6aFgyTGFrYm1sck90aFRpbTdSV1JaUFY5WXlEc056Q2tE?=
 =?utf-8?B?SkI3OEpIMG5uUTNBYVJ0SmpmY29BQlErcngzb1lpS050QmNiSnpoaDBBWlpM?=
 =?utf-8?B?ajB2bld4Y0NnRkRwUW85SlRMbWZFR2IxeFo1TmhqZkthR3F2OGt6dmM5U1lu?=
 =?utf-8?B?N3V1cHVpZmRhd2hFQUpQSU9ybVdFKzJpTm1uZVF0SzZLL1ZPZ3VjSHF0SzRU?=
 =?utf-8?B?Nndwc3JvMmdEK0RDZGhBU0Z2SEpmOXJhN0NMTWtDaFBjazNFNU9rWXBscHdF?=
 =?utf-8?B?OGlLa0ZmS2tWSENFcjVTWVlwbER4OVpmV0ZEYTBNc2lLbWdSUGJsMmR2aEN0?=
 =?utf-8?B?N0FEdXZpbndsWkxQdi9SOXVqYUpRRG52TlpxMmw5WVJNN2p1cElLdUhsZGVi?=
 =?utf-8?B?Uk5NdWdJcUZmOGMzdGZYY1Rpd2VtdnhxQkZNcmpwUm13b01aTHROTnd0YWp4?=
 =?utf-8?B?bmFyYzRzOU1vdUNmSElQY3JGa3o2YWQ3dk9FS3B4eW9BL0dCM2RKUGloek9m?=
 =?utf-8?B?Y0NSc1ZwNVpmWkRHNXlQM0licldzM29CM0xja1E2VCtJanYzWFFQdHlmWG92?=
 =?utf-8?B?eW5QTktML2NUVGdvN1hISzhXUGZJaU5keUlueXZMa1p1R0sxU3dLbkhBUzNP?=
 =?utf-8?B?d2xIVFQwSWRSVHMxZ0ErZmx2ZWNBWStFK1Z3d3NaWlhwUU5TdXphV0puSFRY?=
 =?utf-8?B?dHZjS2F6d0NPaEg3a1FVT2NNbzQ2dkxlb0RlMFlOT0Z2YVdXNTdieWVjWXk1?=
 =?utf-8?B?N0pZUERVUXl2VHBjVkRGNjBjeldTK3IyNmwzb2hSK0dVZUJxMFlxV2dyaU9D?=
 =?utf-8?B?YkxjSUQ1b3Q3b09rRzZwWWo5d2h5TlpheExDR2tYK3JEc1YyT004czNyYTBw?=
 =?utf-8?B?QVhTNmx3WjVBemtkL3ZjMDI2UGhjYzEwWWhpQzJ4KzJVUXpFRVRyOVEyWjJQ?=
 =?utf-8?B?RXp2aVArN2d1OG9DY2xkSktpczRWUXliYTFvSE04djVKNytpZzRDbUJNWUta?=
 =?utf-8?B?ZGlWdGsxd3VJbVBFekpmWVUxVGlDa25iUllnTWh6REtiOWNLdTFWSTFHWm5m?=
 =?utf-8?B?TXF1eTdqOEtnL0oxSWo5SEhDY2ZqQUZGTnJxNlQ1YkFlbDNnNXJIeUdoZTk4?=
 =?utf-8?B?OWpvL0FSOGpUTW5obUc2c2c1ejM1WkNHaFdiVjZLVGtZdnFzV0NUWVgwWUVs?=
 =?utf-8?B?NFh5ZC9rT3BTVmttMkhmRHZheUF4M3cvbElpNVROWnE5aS8zYkZSVk9JbHBo?=
 =?utf-8?B?RkxSbVlPOEFxM2dCQi9kTHM3QmFhODF0YldrcGQyRVFQMUNkWE5ESEhjNGFk?=
 =?utf-8?B?eGxQbHdGckdCZ3hEbjZQb2FmTkxNOThleDVEMDVSQ2N5MklFSzU3UkxtZ1Fu?=
 =?utf-8?B?MW1adTJiUXl4MnpWTmZib2RhY2x3RHlxd2dYZm9qZmZQR1Z2S05VZGQ2NEl2?=
 =?utf-8?B?SjA4YUVrRVVBbkdqb25hQzY3aVlBNHhJS2RsdGR5TEI1Szl0WFRWdDhKRlZB?=
 =?utf-8?B?U2JUdU1BamFXUzFJbE1CSEJOUS9KeWl5Nno2M040VTVQbWtsaTJFUkxnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFpQdGx0b01IaUw1elFhMXJvM2tFQlViZHFxSXVnMEFzbFNuNGx2Y2FudWZE?=
 =?utf-8?B?T2Q1MytuRVNCTDIveE9RQ3pCbDBxT0FDdGFLNXd5MU9Ibkl3b0NOTnJ3QWVp?=
 =?utf-8?B?V0dtUnRuZnE3U09ZM2ZRaWRpelpTbEZmbTcxVjE4TkgxRGprcXE4NFR6ckZG?=
 =?utf-8?B?bUQxbEZBS1ZNSGRvc0JyaE9lRmlucGcvb1cyeEFtbno4QkpiNUZacnFIT2RB?=
 =?utf-8?B?K0FSSjBHM0xRTllySFBWQkRNRjlWdUFnNUE4ZFJvVEhmNjFmb2J6QkdvSzVD?=
 =?utf-8?B?azd0MkhlbG9TSERBcTRMQkV3VEFXbzlIYlhXc1hDSFVKc0trNGNOZStDYzJj?=
 =?utf-8?B?SkticTV4aGIvWExTazVmdUFUdkVaaUpRYUc5dXdEMkg0aFp2WFRVSGJOb1d5?=
 =?utf-8?B?eGg5WW5Ud0lHdnVYRFBCMDFzcU0rUU5DSGFwV3ZhWFdGWUdOOHcxRERJUlBl?=
 =?utf-8?B?N0IxVmNzTXFSVmRadHNMNWR2MWl2OUZMb1ZRendVbmVhQmZlS3FRN1h2dCtv?=
 =?utf-8?B?OStrUnFacGYyaW15NGdzVDRaazRaNEZpRzI0dUY3eTNPa1NOWDRjeEV0b3RY?=
 =?utf-8?B?Y3orZndhQWVJR2ZadnlYQjZYWDdoZUtVWFF6WVpjUXFqTWxUQWU0S2tzWEgr?=
 =?utf-8?B?bEVlbTVoZkIwR3JRL3ZXV2Y5Z2J2ZUxCbE1nbW5qdStYdU4zS1hPSFg5VTlL?=
 =?utf-8?B?c2FRUHBpZWpsZ2JVVERxQjQycGhqWmprOXJrSUlRTlQ3bkVOVGxvekZYVThl?=
 =?utf-8?B?bDhlV0JMTHlockJWcUFZc2tVTWhVU1J3eml0R0VOdVN2SGVSL29PZDIreTNC?=
 =?utf-8?B?eXpsUmJKb05oNEtleWY5dnAwVmlpN2JEZFFtOU9DUkxnUWUwZ2xJbHk4c2tP?=
 =?utf-8?B?ZE1lZkhDeGt0V2QwSlBSUlBjS25HVGtsRjRVTWErVmI0VDVweXJzdkQ0S0xk?=
 =?utf-8?B?TGtQZ3NtOUtiU1lTekMvTGhwN3FuZDBTZVNuRVEwelU0SnFMaTFpSVhIRGRa?=
 =?utf-8?B?NC9pemV2WUNaZmUzT0UzbmFXZTJtU1BFdXdUZkVOUDdiZTlrZThyZHRZV041?=
 =?utf-8?B?ZlZIN3MxUk5VN2N3WTFKVHZ1SjBFN0loZXIzMXE3ekFtQWgrYTNPNCtDNU9w?=
 =?utf-8?B?V2JKbXFsdm03RFlnS1cyTUNSYmdQcDhTR0NJTm9DY2Z4WEJBd3dUenU4VUtH?=
 =?utf-8?B?Z1Vlc2JBRlgvaXVxcjRqRlJYeTJmb2Q5MDFxQUFHKzFCTFVuSmxKamdFWnpr?=
 =?utf-8?B?R3NnR24vWmQ0YXhjSWJ5bzBsOWZnbGZzZGhNSTlCbE0yQU1YKzhnN1I1b3Nm?=
 =?utf-8?B?Mk8xWGg0czlwRzlBdnFoNi9PbENtQXY1OFdtNUZNby9HVlE1ZkltUGtXUEox?=
 =?utf-8?B?YXBObjA5QjRPeDZjdlpoU2ZPQkNwbjVORjBFWkMwTnlTdm5pUWdqVW1rVkdE?=
 =?utf-8?B?YkVrK2RydWRsNG5EVm44MHdHRCs1cStOZ3c4MjVyTms2ZzMySzdrNDk3eGdY?=
 =?utf-8?B?NlROWFhXRnd2Yk5hMnZ2ZEpHb3k3a0FKRlhsSDlIbDJHVlBTTFhyRHNpbXNm?=
 =?utf-8?B?aERQR042TXVMVjBrdWJIOW1nZWk1cUlrckRQK2JhKzRHbFdXZHloYzBtNWh4?=
 =?utf-8?B?UHRjeFFud293STJOMlRZOVpIb082em9LWmNJZDdzQks4aC8ralZUTVlnVzNu?=
 =?utf-8?B?MW9xaTdubXo3Uk1BSlNUbEhYVkZQU3c2UURPbTFUOWVTcFNKSXd6SjNCVTFi?=
 =?utf-8?B?WkRlSW1LWjl5cTl0SFVvZm1TWlh2bzZEczZ4dTQyZnNJL1hIdm0wMERKSnRw?=
 =?utf-8?B?ZEl3MUF4d3IrMktzcEVac3ZpVnI2Ui9vRWRUdWJweFFXOEZZdlZSSFd6Q3VW?=
 =?utf-8?B?Qkhpb0tkcEMrQkJndzhVeDJqQy9jV3BHYU42cVowQXNad2F3dGwzTi9zK1Q1?=
 =?utf-8?B?MzdjZyszKy9wR0xJS0tqS3RGUXNuSTlNeXV3enM3cU56Uk16RzVkeC9FYmFH?=
 =?utf-8?B?UEtaaDZJS0xCeEgwMUZtVHQ2VG1Pd2x3SFIrQ2hqalVTZitmM0lQZ2U3NS92?=
 =?utf-8?B?SzlCS2xrc3NacktpQ2tWVUZzdU1ldHR4UDJwQ1RYTFBVaVh0NzdGb3ZTM2tB?=
 =?utf-8?B?Smczelo2MjhCTVB3SHBKNUtYNkVQQXlQRFVkWDBMUWduR1hYQlA1UE01RnNX?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e878baf-15ec-4150-ba51-08dcdfa22cb9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:44:41.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIXUcIWMosBOSHfxZwkZvnkvDOUamMFc1NkW+zvcAro4OonRyE3b7EYWHwntn1MrvL+2bamtxwgEyftTTJcL/KTUFfdXenrvCDezgEDYXa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
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

Hi Thasleem,

On 9/27/2024 1:08 AM, Mohammed Thasleem wrote:
> Set brightness by deviding max brightness, store and read it back.
> The actual brightness should be same during DPMS on and off cycle.
>
> v2: Update test path and testplan documentation.
> v3: Check backlight for all internal panels. (Jani)
> v4: Minor changes.

The change to check the backlight for all internal panels (Jani) appears 
unrelated to the current patch. To maintain clarity and consistency in 
our commit history, please update v4 to reflect the patch changes.

Code changes are LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 140a95bcc..c93e5b357 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -66,6 +66,10 @@
>    * SUBTEST: fade-with-suspend
>    * Description: Test the fade with suspend.
>    * Functionality: backlight, suspend
> + *
> + * SUBTEST: brightness-with-dpms
> + * Description: test brightness with dpms on and off cycle.
> + * Functionality: backlight, backlight
>    */
>   
>   struct context {
> @@ -78,6 +82,7 @@ struct context {
>   enum {
>   	TEST_NONE = 0,
>   	TEST_DPMS,
> +	TEST_DPMS_CYCLE,
>   	TEST_SUSPEND,
>   };
>   
> @@ -213,6 +218,22 @@ check_dpms(igt_output_t *output)
>   	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
>   }
>   
> +static void check_dpms_cycle(struct context *context)
> +{
> +	int max, val_1, val_2;
> +
> +	backlight_read(&max, "max_brightness", context);
> +	igt_assert(max);
> +
> +	backlight_write(max / 2, "brightness", context);
> +	backlight_read(&val_1, "actual_brightness", context);
> +
> +	check_dpms(context->output);
> +
> +	backlight_read(&val_2, "actual_brightness", context);
> +	igt_assert_eq(val_1, val_2);
> +}
> +
>   static void
>   check_suspend(igt_output_t *output)
>   {
> @@ -276,6 +297,8 @@ igt_main
>   		{ "bad-brightness", "test the bad brightness.", test_bad_brightness, TEST_NONE },
>   		{ "fade", "test basic fade.", test_fade, TEST_NONE },
>   		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
> +		{ "brightness-with-dpms", "test brightness with dpms on and off cycle.",
> +		   check_dpms_cycle, TEST_DPMS_CYCLE},
>   		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
>   	};
>   
