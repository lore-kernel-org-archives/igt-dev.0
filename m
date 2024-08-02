Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9225C52D70
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 07:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9810910E99D;
	Fri,  2 Aug 2024 07:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXaldMd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D490410E99D
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 07:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722583984; x=1754119984;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=itvvibTl5rFmhXICE50ZuJQAnfy+jh3Jre3sJbiGSI4=;
 b=CXaldMd0i8ZpeU76yIS+jMKejgAV5HBymrUVaLUZN3Ryx0XrKb/vt8S0
 VqJV04v6D4s/drZfCWTJv2mG/EQWubcJEZyTHvGK6ZFXCt0fmT1OdgkuG
 +2RZyySe/xK7+6CCwLAu9JDch5MGCElnS7dfteWB+VaRFHe++BWrE4wqb
 7J1blcEq7iqYqFQUU16g5T7tGLA9qwushKMupP80yL8dieVCJSGFT+IhK
 zpY1R3aXwXTZpF8kHcjcjCo0MHkoTMqzRO5sdwTOirsmGFFE+jqGzkFCg
 gWmVlgGBO5M7U/G+1cGDDf4kirFAFnNkeP4BDJzNcZzYk8yn1tsSfY1Pd Q==;
X-CSE-ConnectionGUID: GRkiytM+T/ORLwiI3fe//g==
X-CSE-MsgGUID: NzSjgsPWSqeSxjCQS3N5yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="43103558"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="43103558"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 00:33:04 -0700
X-CSE-ConnectionGUID: P2RjCtCGRqWukQnXVVUnmQ==
X-CSE-MsgGUID: 1PnaNdDxS4+1pAIX2wS/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="59426284"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 00:33:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 00:33:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 00:33:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 00:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnvLMHfDfKfzI1/7E7vXvh0QRbh6X7jSLTXVPOYq7VZclf5ZHGqjGT+7zdX6GWZekAt91pyteLQU+fE/xp8/ob4uFpKWlGCxdaDGhqxjFiXP8cbl9JVTGJkWGdST5XO3043/zYX9PCaXTRNaYevoUcPTwy3xupZmPjkWtmY8chscAmO5RIAcmvjrD3r3CtOuQXp9ZEj8SnZgdKz6M4fm4djxBlwHe3ydn9hMxLqP9Fx2psOzkr3icYvOTYfP66jmDd2HmGhCyo6lCNHXu99y/1pUvqXoIz510/a96X9ZwkkrsdeD8QCsYbXEQIZDh1aivKa5oqWG+93/XCCXT0/wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XW1EwqKvNmtdtKtRUoeFeHwp6iLSFSSMvk96c6PSewk=;
 b=oTidEWRvfjvjtHxF9Oo7o/q66csNr+CwppM867uL9hKsB+zbXnQ2/8a/gflIL5x6m4a3bjo3K5pjRg4YD72vu1NgeNd5UwY8C10zmvrgu+QNcD4P+nOoNfxRxF5WXRXTnJMVL1t0vKsr28Om9qgadHBywZ2FDXarMHCvJUZlodwiTq3zgIAcgy5PY97NJBawirDbP9vrl+Ay7GuV9cSWR4ldyBzh8EgwzQu1x/ppeBUiev5h9MQ2l2EzsBt0wQw5bnzF1i/lLxUPBN2GPHog9Scf1sEdawTZZk2kNp6FdvALCQBqV3jToDicCn3tP79OrSMznBJ8T88ZEP+kOdEc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 07:33:00 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 07:33:00 +0000
Message-ID: <53c158a3-a5d9-46f0-bb70-505aeca36604@intel.com>
Date: Fri, 2 Aug 2024 13:02:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_gt_freq: Add a wait after gt reset
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20240730115058.1104767-1-karthik.poosa@intel.com>
 <122f5ae7-9b39-4e8b-9fe5-2ea57f72cc4f@intel.com>
 <90a2332e-5920-469b-820c-9c477b59b7c9@intel.com>
 <eb061354-afbd-4aa1-8cd6-5f238ab582fa@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <eb061354-afbd-4aa1-8cd6-5f238ab582fa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0023.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::9)
 To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: a0419a87-36be-4908-28d5-08dcb2c555f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2VnMkZVSmRjUjg5NnpkNFc1TzNzM3BpYTVKSTAyam9MZmVETWllMk1iWG4w?=
 =?utf-8?B?RU12NFNYN0FsU3czeVdILy8wVjA2bjhnR1dFSUJNaThVQUJ3d2xLZG11N3Rx?=
 =?utf-8?B?NmovQnhOODk4WCtEVDZQaFpCaWFqRE5wQVhFMVVKV2Q3OGQ4cktuaE1Tejhm?=
 =?utf-8?B?Vy9lL1pFNnViRUMydTFvT2dONUJ5VDQ0RjgxVmU2UmFNNEVDaENadVJiZitM?=
 =?utf-8?B?c0NrbHdXU2QzVlRXUFp2bkk4akhkaGlZMFA0dE9kOXRzZlJZWTBVSCtOMkYv?=
 =?utf-8?B?eDNDblZTNDhPUm5HOUc4MzhJdXJxazM0ZDhwSVk3c0Nndzc1NUtkb29lQUtl?=
 =?utf-8?B?eEY0ZUxxWG5LTGZiQm12VzB2UUp3Tm90bTNHQ2ltdWdTbVBINXVEQmJuSndj?=
 =?utf-8?B?bjFUUU5SS1ZQK2ZIR2dWQnFQTWZhSDRFZUhEN1VVMzV1aUI0aGViOXhGQkhu?=
 =?utf-8?B?dEZ4cDVYWWZhTmF0ZklJdHF0NVJIalRxbno3RnZqUDFkTzlqbU1mREZ6KzRP?=
 =?utf-8?B?ZFEwMEFFNXlvTjUxNkpaMXRMMmIvYmJ4Vy9RZmdlL214bmRUVDBoRmExN0tL?=
 =?utf-8?B?RUh2R0F0Z3ZxRk5VSktCbUowSVJ6NEtTbEdpWTJkVnAyQ3craTAreTlLY2Jj?=
 =?utf-8?B?YkJUNHNxR3FWR1JUck8yZDJPVjVHbWs1V0hEeXhSem9oRFRxU054UG8xNWx0?=
 =?utf-8?B?UGNkam11bytScW5EbDJENjVkRC9UTVhuS3lGcmlOQTVGK0t3Sklxbk1nT1ZB?=
 =?utf-8?B?ZFZMVnRVMTZkdkF4VGVhMmpGU0FEcUVYY09WemhFWWN6Tm1LQ2dDOXZhYzdr?=
 =?utf-8?B?dTIvNHVGeGNzT3RWTkFzM3BtTTdDemtqT05CNzZyUkpUUzQrb2dsaEgzSkhU?=
 =?utf-8?B?Yk5pb0RVMkFmNzFQTWE4TUR0dGRnZHRIRVFNT2RxdUlYVEdXVkNMYkRvM3BY?=
 =?utf-8?B?c3V0dTVDRlZCeHoyNHdSV3hOSEZ4dHI4OUlhMnpFMXdaVTNWWlVqOXloRkti?=
 =?utf-8?B?MVduZkpyaUJneWtxQU4rSzdjTGFjM1JnTjluZno5UmxLUWRORm1XelZBRXhT?=
 =?utf-8?B?K0dyY0xXY1Qzc29iRW54YklIcDVNaWJPQ2tQOXRNNUxGZWJETFl2Rk81dnp2?=
 =?utf-8?B?ckFqODh5TFdoeHZwOFl3QUNzck9SMkdXRkR1YjV5NzRSZUR6OGZqZ0VDTXFM?=
 =?utf-8?B?MkVpK09RaUhoRitMM2dtTXBqdDlnTDU2aWNCczdCRjFLdnJpK0o4TWFvZUNt?=
 =?utf-8?B?TmZqbEVCYTFaaVVCcUdZWWxTcXlUT0V5anRncGM1TjBiaDQ4QjNZeUJXQXRM?=
 =?utf-8?B?T0hQZ0tLajJKdHdSQVBpY2dyckg3QmVWUXM3b0tyOE1JQ3d4RTZ1Z1hXV3JK?=
 =?utf-8?B?dUVZRGVVRm9FN2dlWmgrdXRVN093QmM5OWs0RUhXL1JzZTRGd3YxTEg3emtP?=
 =?utf-8?B?V1Z5cnNsM05GUHh0RHZmMzBzZmc2VTZ5MDQ5MW1STTR5dHNERDk1elFDVUoz?=
 =?utf-8?B?YlFBQitvc3BFMjFzOHlLTm0zR3ZrUnpCRUNCbm1XK3A4M1ZaUDIyRmhmRGN5?=
 =?utf-8?B?Nk11WUFKVUdNblNFVi8zdENOeWN5L1Z4b1ltdytpeENqblorb2M0eHJmbVRw?=
 =?utf-8?B?ZnYzbDBpcnlsYVF5NFpqNjZVSXFlVGpuZG5VMldmcmtMSkpWY3RDN0FqNDkv?=
 =?utf-8?B?R3RlVFBOdFgzcGxiVjhzdGVtS3Z0R0JNY0hvdVJ6UEFTdG1PODVUTnRaVUFh?=
 =?utf-8?B?bTd0bU1yVXRLZGI1cU9HUFd4clhyUlJrM2dXNkhTbWVnbTlvbk5aRWVlOTNu?=
 =?utf-8?B?MTFGaDdETkw3eVZpaFVpdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmgwWDZGWjdQbTdJcDg4QTQ4YTdZKy9Dc0FkSjliSFpaeWtDeUJFYXI1MVNu?=
 =?utf-8?B?dzdEZS9XWUhxckFraUVaVVJuSElkZUpsa3YxbDV6bnpTSzQrZlVqVHVQOURH?=
 =?utf-8?B?M2ZQRDRqU3Z5T3RIY1pHV25qam9WUlFEdStBTnpEVWZweVQ2TC80cFJZMEVN?=
 =?utf-8?B?RW5aVWZrdFFzWUdsV0t3eTV4azlpZDlvNmQ3YmJ5SjNydUgyZzk4anlaNGRU?=
 =?utf-8?B?ZkZSSTVPUlZkNUdPWVpJLzNFN2h4QmU4ZWNpUHQyMVhnQTlDU0lKdi9WelND?=
 =?utf-8?B?L1lDbWtMOW1JaUpPb01vQ0toWUNmRE4yZ1Z6Rjh4WXlWYjhWQ1VMUVk4R2t4?=
 =?utf-8?B?WWxWTy9BSnJ0TVV0K3YyVWxlcjFPY2JkVWFNS0RCbUhmZjhlU0R1T2JzTjFs?=
 =?utf-8?B?RDJnaHlBWHgvUlc3SHp5S1VPOS9odUx4MFEwUWVjY1N2VzNKaHNvZFZEd2k1?=
 =?utf-8?B?N0l6Q0dacVV3YTBrdkZJY0k3bEVBUUY1WVlYZk0veVlOMkQyUXhJZTVkengz?=
 =?utf-8?B?emwxNTdLMWFxa0hXUlFBakt4ME1IbXFrbno3cmlUd0tGMjVINmkrL3o0VndJ?=
 =?utf-8?B?QkZSclVHYVA3VEZDVTVRd1U4a01XbG1UbkN2NDF4em5XRVJwMSsxWG93Mk9m?=
 =?utf-8?B?OFRrakUzWjhHS2xpUkR0eDc4K1JNVjFKNjJLczliYWZlYkV1REJuVWxtT21p?=
 =?utf-8?B?eU5yT05NUlBQWSt1TUMzUHdWclBXMzVsY3hackRvRTJDeUF5c2tuaEZ2REpo?=
 =?utf-8?B?UER6UXBmYVZyU29ZS1lxQVdob1cxVDZESG9ydnFwVU1IaGtrL2R4SEw3Y0lT?=
 =?utf-8?B?TDNWaFZxc0xrK0xjVGhXWUdnZHFXSTVLN1I5eEFzQSt4eDRYZVJxaGhSbERj?=
 =?utf-8?B?RzhHR1pqdUtyWUxvUkZhckVrcUdHdU9keVQyYTRYbnl3VnVqVmY0MzJUekk3?=
 =?utf-8?B?RVl0dkNGcGI1RjBVR0xpd0MxY3dkSmV4S0FrdVBSNlEraGYwTm9jMWpJMXcr?=
 =?utf-8?B?VlFFckkyeGMvajM4QWJZS01lNzA2dVRpcEtlbElrT2QzQUd4YWc5RTN2cHda?=
 =?utf-8?B?RktYSitob0E4YnB1cVllWVVDNFlDZEM2VTZGd0p0M2JyRFdzY3BYNDFNRkY2?=
 =?utf-8?B?Y1JWamJuMmEzblE3a3R1aHlkQjdTQ0IzTk5rZGRTWGxzejRRTXpwK0RVVU9U?=
 =?utf-8?B?blNVbUhlVW5qb3pGblBpenFKNlJHQWFROUsxYitaaWF4eVd1ZlRFMzZiOVd4?=
 =?utf-8?B?WUo2bFc0RGZCTTZMaUJmamNFejZFZ1d2K0JKei9TZGlzK2Z0T3cvckdvSldW?=
 =?utf-8?B?UkxZZjBSc2laR0R0czhRc21jSy9DUG15MTY5eGpZVDNPRTNISVB0NnpTdDEz?=
 =?utf-8?B?cE9XbnJmNHg1LzdmUXJ6K3VuTVV2NzFmNjRHMlFxTnhVbytFSnRQb0ZBNDFu?=
 =?utf-8?B?UHFNRlh0SUJRc2JrdnZqdTlhY0dhTjRKd3R2M1dNbUxxMUNQeFJzZ0FCOXhk?=
 =?utf-8?B?UEpPQlpFRlliYnNHOVRiNk5PQk4zbjRZUEFkenJzNmZEYlE4T0hPeXdBR2lU?=
 =?utf-8?B?M0NlWWgxSVFPdGtXeVh0NDR0NGYzSldlUWpoODVFSXIvYVRrRndzOElqb3hD?=
 =?utf-8?B?ckZPSTNveUo3dlpKZEk2cWp5MlFYUXZsZmRyMTczaCttT0c3UEFZNXZIT2ln?=
 =?utf-8?B?YVEyRHlFN1RNZ2pTbTZVWUxrd1ZBMUNzeUNMMnJzUm1Qa3llYWJPTGpGdkdk?=
 =?utf-8?B?bCthWnR2YUZoVUkxZXlIZk5hTHZ4eVpKaEcrV2Y2enNvWnVDNUFEQmZKYlZQ?=
 =?utf-8?B?YUt6V3ZSc1paTWRCc1RUOHM5a2hvNzE2ZEVaMitoR2JLVWFJWSt3YUpVdDBF?=
 =?utf-8?B?ZGpYQVl3Y3VacWR1Q1BmUWFET3lDODR6eW1Nb3hHL3RqdzZsZCtRNmpIaGlz?=
 =?utf-8?B?OUhueFdmcloyc1dpNXFIT1BVMWVMQW5nLzdMR3VtTXF6TFN1NlVKaGtFb0F0?=
 =?utf-8?B?aUV6MXhGSlcwUVZUaWM1c1VYdy83OHJpM0F6ZVBkQVlQT0pMUVF5WG42L0Fi?=
 =?utf-8?B?NWJyOE1XZjlxWXZQbGJ0MitSWDlXejU5cEJLSzg3NHdIY245VlA2VVNQVU9i?=
 =?utf-8?B?Ry9NWmZNemo0U2lKVE1FYlVQenFGeTZQVGp4R0kxK0RlbDBWenZDQ0JRNmJ4?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0419a87-36be-4908-28d5-08dcb2c555f4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 07:33:00.2779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iT5qaOXRvV8t+KSSKICoCym4Gr9KfM0gOz39GIGLsL3W8qsJu/AhbfPtTalpnJxu3bgQJbuhLCEUcdYltrEa9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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


On 01-08-2024 12:52, Riana Tauro wrote:
> Hi Karthik
>
> On 8/1/2024 11:50 AM, Poosa, Karthik wrote:
>>
>> On 31-07-2024 16:06, Riana Tauro wrote:
>>> Hi Karthik
>>>
>>> On 7/30/2024 5:20 PM, Karthik Poosa wrote:
>>>> After reset min and max takes sometime to get set to rpn.
>>>> So add a wait of 100ms after gt reset before reading
>>>> min and max frequencies.
>>>>
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> ---
>>>>   tests/intel/xe_gt_freq.c | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>>>> index 93ebb5ed0..718f720c0 100644
>>>> --- a/tests/intel/xe_gt_freq.c
>>>> +++ b/tests/intel/xe_gt_freq.c
>>>> @@ -33,6 +33,12 @@
>>>>    */
>>>>   #define ACT_FREQ_LATENCY_US 100000
>>>>   +/*
>>>> + * After gt reset, min and max freq may take sometime to set to rpn.
>>>> + * So adding a wait of 100ms after reset.
>>>> + */
>>>> +#define GT_RESET_FREQ_LATENCY_US 100000
>>>
>>> Both ACT_FREQ_LATENCY_US  and  GT_RESET_FREQ_LATENCY_US  are same 
>>> values.
>>>
>>> Why not rename ACT_FREQ_LATENCY_US to LATENCY_US and use that instead?
>>
>> ACT_FREQ_LATENCY_US is used between set_freq and get freq without gt 
>> reset in between.
>>
>> GT_RESET_FREQ_LATENCY_US is delay after reset, so kept it as a 
>> separate macro.
>
> Value in both cases is same. Can have a generic name and use it
> in both cases.

Even though value is same, it is used in different paths. So I think is 
better to have different names.

>>
>>>
>>> Thanks,
>>> Riana
>>>> +
>>>>   static int set_freq(int fd, int gt_id, const char *freq_name, 
>>>> uint32_t freq)
>>>>   {
>>>>       int ret = -EAGAIN;
>>>> @@ -318,6 +324,7 @@ static void test_reset(int fd, int gt_id, int 
>>>> cycles)
>>>>                    "Failed after %d good cycles\n", i);
>>>>             xe_force_gt_reset_async(fd, gt_id);
>>>> +        usleep(GT_RESET_FREQ_LATENCY_US);
>>>>             igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>>>>                    "Failed after %d good cycles\n", i);
