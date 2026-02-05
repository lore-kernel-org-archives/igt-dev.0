Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF05E91260
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 05:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF99610E0C0;
	Thu,  5 Feb 2026 05:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOcwpM0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0210E0C0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 05:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770270993; x=1801806993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rAN5eFiBfdeOqkdmpav3OsWWkx1hNgUxJZ6K4wBwqpc=;
 b=VOcwpM0W+m4uDfwy+8ytqLljosRDKjBIwSAjGFtPvJJD5DYY9Q56Zd7H
 hq/KrGDDEm46EG4DduGiPZ4tddMtbFVzqQrb14IX9LEoA4oVDmhV0m+qn
 vPpvK6oeMO1dFOckXGcerotzNlx0RtWfEiQHUAxnLVTKkvFelxSZ67V75
 ZugLEb+GsA4ttXRK876BbRvgm2rpHf2yfh2jO1MnzlND7gSbIYKNpfkWG
 Ad9WUY+1fzpZ219AquCqj9hmrUmbtQHtXbyjYlGIoNL0TKrR+knUx3epg
 aR24K94KxVvwXoSele9GHGsGXjuA+fQZd5+CMuxD++apE+JMeG5cu88FH Q==;
X-CSE-ConnectionGUID: BYhoxlfiTxi+btkeoMGdDw==
X-CSE-MsgGUID: PG2dOu2xQpe81aKrb5vXvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71364789"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71364789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 21:56:32 -0800
X-CSE-ConnectionGUID: qeRiJ8/DQV61uziLA1VeYQ==
X-CSE-MsgGUID: pK+MCf2JSaGBPbiiOgTJ3w==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 21:56:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 21:56:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 21:56:31 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 21:56:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifrG/SoVtmwTecO3cIdCJtqwFHLFdgUEGgwrPv1cR4Uc3pAg1+XEJYzaWUY1PXveqnAv7LEMMHElCU0ZicnRKYUymmss8H2hntwPJzzRFwrmtyGAllu25ja/yzLZ2fm7sz1GidyfpPF0qTRQV67BND59jH31xozPNmIyikERphUA2ZqLWOByc4ezExGrubjnnJRtaaAB+czKO6Qsdn3zNeRMS1SqMKchnrb6hIvXDWeSQtZB+99UzWMAVEaFXNUBA48LRfo/rvQxfjXeHL8LMMWdLHELSwIbi1wIYEwlwRhy7h1v861xCEcV/VYIoSYgy9V3ptYeV7yPjm94Ulduhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDN3lClToSAKRwU1mhaLa4Jhv6fJy9sTmiKUiYptIoA=;
 b=i5YKPPcVHlB5zaBhSbLa1iblQfqJZm2y6uTwy5aKo/6YPM7Z9JjfiqW1RR2TZffQIuTmMABNziFHCS6BkqiILSuxDQ6X4Ci+zFSPpSnTc7jZfPJlUx89EbgwHijaHCYym9K5PbDHYFDpLuJS35w5IXAijM9+9aQ0dRg0VVCAE/A1r8WKRc1SezsqymO9m+Nk+o4cLdPdlG+AsBaH2+f6kFc2ELbJUF+68kFBA4wnZVyWVCEd+l6L0slowtsNO/N7MgqE3U+jq54rstr5bItH8C086IceWk5HKb174lYhYf7ASqOTubygcGvg5VUtjscJ3FS1jmLeRouq9y2pm76TEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 05:56:29 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 05:56:28 +0000
Message-ID: <9c419555-b024-479f-b530-6a79300dce8c@intel.com>
Date: Thu, 5 Feb 2026 11:26:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_joiner: Add joiner modeset test
 across suspend resume
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <ankit.k.nautiyal@intel.com>,
 <mohammed.thasleem@intel.com>
References: <20260205033125.1422303-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260205033125.1422303-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 353731ed-4c83-417a-6a85-08de647b4d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHNNRk1EV2ZEd1VaWFg1SEJwZERjalBPc3haVXRBOGJ4USt4cDkwZm5IdmNj?=
 =?utf-8?B?WDRDNDhob25VN3FrbkpkbmdGUGhNWmdoZVJsT3BQVDJCay9GN1FqRm12bklK?=
 =?utf-8?B?WW8rMUEzZm1pVXQzT3RWcVR5cWdIZGN4K1V0WGR5clk0S1k2SnlqdHQrcE12?=
 =?utf-8?B?SVF3aGtqd2JaM3JMNjZoR0lnTG13T1lPRkEzZklCVmoyUVBuNFZZYVZIcnVv?=
 =?utf-8?B?clVQejY4ZSswZWg1WkRjUjlKVDFxdElzQUIyejVlMUxaYUtLZVd3WUlKZVZ4?=
 =?utf-8?B?b2lXZWF5UFphbHE0TER3NTlKUXlmdjg1WkRxSTdwS0tUT2F3UzVBMy96WFll?=
 =?utf-8?B?aXcxVkZpdXdCU3hBVWdwS3BNLzIxRmh0UDBmZ2RUdHk0bUJCeFJmd0RHMkZ5?=
 =?utf-8?B?VGV2eUp6YUxKOFdmQjZCcWJsNGZNdjdiVnIzdFFiL3BxRGhjQklIQVE0SGRV?=
 =?utf-8?B?QTZ4M0I3SmlkY0pGZ0pRUVdsNllNbk1HZGhjWHFVQks2UFFVY2RMUUtSZjNy?=
 =?utf-8?B?a1NPOHFRTnJ5U1FEU29RWGo1QjFpa1F4NHVqLzZuVzI5Tkx2dVIrQlIrR3VY?=
 =?utf-8?B?Z1B6Q0JPSGFFRGJZRmFSa1ZFSGcyb0lWOTIwZ1F5TW1DQmxWZVpoZXRlSzlG?=
 =?utf-8?B?L2xjckJQYkEwU2dkVFhRMm52emxzZWsxTGVJazdMNG1vUVhDQzNHY01tRkEr?=
 =?utf-8?B?ZG9vZnE0eGMzWG41SSs0ZlpLZWdyY29XRzllTE80eHQ1L3dkSFBFUXNDbERV?=
 =?utf-8?B?NFltcXZOanllY1VoNEhvN2VDSHgrZkxGVGpHbER3Q0F3UytYcWJXRUVkajl6?=
 =?utf-8?B?U3ZWRTdhSjluTHZzUUhPZklGcUV2REhOUFJlb3V0ak5YdVV5V1VoTTBYWWth?=
 =?utf-8?B?TSt4azJNRTRFdHN5c1VYeW5jcStvRkZtbVQ2NHNCRVQ3cnRHd1JiSjZjc2Rs?=
 =?utf-8?B?ZUoyUUhKL0xXN0pKcEEyYVBiWUV0WnBwaUxkQ2tkTnpGWUxpU3BoamJjcmh3?=
 =?utf-8?B?SER5VGxNSXh2RkhWazMzNW41Z0xHQzRTTjJGWEtGMFRKRXBhTHJGNVk2VzlD?=
 =?utf-8?B?Q3VSdUlPL2RaZ2VzdW9NT0hwamxvZnd4dW1WN1MvSCtHbzM0OVRvZzJnMitp?=
 =?utf-8?B?ZEhSbnFBMEV1dm9oV054SDJ4d3hoR3djSU16Q1oxOW1SME5BLy91M1J5cnZR?=
 =?utf-8?B?dTJ2c2VZY0tXSmJXMHBmV0ZOaE00aXN6V1NBNENEbGQ1N2VuTitiU1FIcmdm?=
 =?utf-8?B?MWhhKzVRKytYdXJLQlhZNUl1OC9TWWNGdTNyam1Hby9YcFpmOWI4N3VPSUpO?=
 =?utf-8?B?TWVmQ0hJZHdXNmR5WmhkQ1lLbCtBYjhhU05qVTNmOEZGKythUXdqVHNFV1RD?=
 =?utf-8?B?UGtPUWcvdEtEb1lzOGtoTFBuWFo5TUROV2x1dHI2U0JiMW0wZHY1YWtVR1VG?=
 =?utf-8?B?NWEzdXZhTjJ2ODNETzV5dDNzMkg3MmM1T0t1THg0TUxMTm10VjlydTl5eFpz?=
 =?utf-8?B?TjhRZFV2LysrdXhtUEhGcEJ6WUh5NEczT2tjMmdFYlhURUFiQnlJbUI1d1ds?=
 =?utf-8?B?K1JnRmdwVEpJenNVdUw5RSt1dmtTSCt2Z2diWGxGalllYTFQVDB5SEgrK0ta?=
 =?utf-8?B?dmJCU3IyVUpaTW5yMC9mSmpVZ1UrUUZMMnRUdVU2ZmZnQVZPM25RQ1hpOUh4?=
 =?utf-8?B?amlNcFJDbFZTbmZRWURzN1daZE9ra2k2ZFlHbHYxMk83V3FaMEV5djV6bWwr?=
 =?utf-8?B?TFI2Vng5SXFFYnpkNzRheDluYTJQeWgwNHdnb2s3TVdQa2dUaEswTWFoRlJ2?=
 =?utf-8?B?WVd3TkZ0b0pxUTNhN0RyMFhhVGoxTnBadXIyZlZWZUZ4TGRQWWZWRFZXS0Ji?=
 =?utf-8?B?cUtjSExSUEVHQkl0bW84WU40R3FxRjBDTnZjZHZnSHpoRjUwVXBKdC96eE1Y?=
 =?utf-8?B?M0NzTFBYK2ZYU0dBT0VPWk13SkFWRjVvTTltY1FqdVpWRnRGOUljZGpDRUd3?=
 =?utf-8?B?ai94S2tVTTd5a2FyeVQrWGU4dDNtOUtLMldieWttWjRxdkNGc0NjeDFFVk14?=
 =?utf-8?B?d1V1UkhWYjc3MUdqQ1didkk4VkJwUVY1L1VsclpTcFVPWnA4UVZnTlIrV0lW?=
 =?utf-8?Q?iaNs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHE3RDBOUUN0enJrK1R1ajRxaFJORU9hU0IwcUhqMTh2M3I2alZiYWZUSlQ4?=
 =?utf-8?B?c2tDcVNPaTdQdlNQSHhKdlp0bkxsSVZ1T25jZlZHaWJ5cVdYeXdrQnhCdTI1?=
 =?utf-8?B?cnpYdHZMSE4xRktvR0puSFZSWlJFT3Y4TmNrVlZ4akg3MHJ6Tm0xNWh1aTN6?=
 =?utf-8?B?SHRoaDlKUU9FM2VjMFZDS2hlSW9rTkZwNGxST0kxclN3cXk1Ny81YmN1b1FV?=
 =?utf-8?B?TkJScnJaZkEyaE5pRVFQbmM0ZmdiRHRLZnBRWnVEdHYrUjRuSXZUV25LQVBT?=
 =?utf-8?B?OFNjd3IvOXhrSWJWRVFFeVQ0RVpDTnBId1JLeU9MZkRJUkJ3SzVYZWQyZThS?=
 =?utf-8?B?TFEySDdRRi9vcHBwSlpFNDVvc3RzZ2psNjF3YjAvbjY5T2ZlNS9BajREeGxP?=
 =?utf-8?B?YklRaG1YM0toSkF4V05GcStBSVBHOUczVXg3U3FNSmlQZjB1OVF0U2RHQ0Nu?=
 =?utf-8?B?bnk4SDJiQWJWS0NUV2dIRU00QVptMnViVVdQcFVMTUxnVzk5eTB4Y0hmSmZp?=
 =?utf-8?B?dkFyYStUNzVkQ2pWQjhuY01XcVlVYWVWbUVTMlEwUU5NRHRQU3MrYS9SYVNu?=
 =?utf-8?B?R003bmJCdldSTHFKcnJlZjNUTXdidGhDZkM4K21vS2xXV1lKYkVqc1VJTm80?=
 =?utf-8?B?QlVMTWMvazhKV2FJY0NoWG8ybk5OUlJUUHJKZ3pTNDR3NEl3QVBhNmZVd0FG?=
 =?utf-8?B?VVdLNkFsKzR0anBIRkhBOG8yRGt3S00rRzcxakVVbWlyekNwZnplclJ3Qmdp?=
 =?utf-8?B?TUpCamlsQ2pxZjJ5aFN4bXFrWGJhY0M0cStKWThTRklDT3NlczRUVWIvZ2h5?=
 =?utf-8?B?bWxmNmR4MkloV1Rwb0xQazJCaDVSWEw0S1lvT2RmcEs5ajVBYmlCZEd1SDg4?=
 =?utf-8?B?TU85L3RlNFNaZ21TYXFza2YreFhQaTBoRVFTL3hSbFR6bllzL3ZaelBHVlBz?=
 =?utf-8?B?UGJlL2hDaDJYU2l1ejFLakVEV0VleDQvTllPS3c3ZklBc1hRT0RVUjVLcklP?=
 =?utf-8?B?NjZwL1pHaXdDVmZoOENUcVd1dnpCM3hIa3dTV1grL2k1bnFWWFBNenhVNVNN?=
 =?utf-8?B?NERFaW5EbTFpTGFqYWVaY3kvUlZFcWY2Y3NsWlozVU1tbTFBVmR6RTlLUERK?=
 =?utf-8?B?T3YvUHZPN3NUL25CVXJNRElPUmRGc2pWNEluSGtCR3BiU1JZcm0xa3BxUUMw?=
 =?utf-8?B?NFZ4SlRCZXd3V3UzQ3lPK0FlMXl4d3hQZ0ZGdGREK21FOFRqRDN6SjBMakE2?=
 =?utf-8?B?endBRGxLbWk4bFFPSFBUdWU3djBBL3lyR3FFdlJmVUNXaUQxK21rb3d1YU40?=
 =?utf-8?B?VEdTeFRGbUVuMUlldHdIWWFzNUgwRyswbUREcmlmY1lINlJrK25vRXBtTFpV?=
 =?utf-8?B?TmV6TkYzSGovdVdQc2ZOK2pjNVlIVlhYNDB5M21FU2xQa01tajBNRVUxMGk4?=
 =?utf-8?B?eDJwVDJhVk5yejIrZ3FqYmlnVTFpUGhIVEhNRVFTQ05EQlVaSjltUXV3QnE0?=
 =?utf-8?B?MzdxdWtadVZJejF2bnR4b2docE8vTWZ3ZDZ1UlZiODJEZTdBV0xvc3NQVk1y?=
 =?utf-8?B?MS9SaDVENWZMS3QyN0hhUzlEQ1JRcnNHVWUxSkF5dWpwRXJzRi9VOFBNckxY?=
 =?utf-8?B?YzFGNHB4UzdLQXd5RG9DeWRtRm1hL3VkaGNNSDVrY1N3cjZxTTNtQ2hlUmxM?=
 =?utf-8?B?NnRkSEdoeTlPV1NPY0F0WGpJelZYcFczUG50bVoxcnExMmtRNTlzcEhPc09R?=
 =?utf-8?B?S2RtZ21hQmlZV0hGM0QrdERmSWxScVE0cGtoTFRvQ2RaU1p1aXFUUDdTK2dH?=
 =?utf-8?B?OVQyOU4rcTBLM3NYY0FnK0hLbEQvNWFoaHFvbjh4c2RpV0dVSU5lcEMrMG9Y?=
 =?utf-8?B?dzJIY0NGM1JBUVhQbHZtMk9vQUlzTGl3YWE1bE5ycksrNmRzeVpRL1BZTGJ1?=
 =?utf-8?B?cC9kZHFwbzJiS3h3dDJzQnF4QUQ3QU5YeFNwM3BaSHh0Y0NMbGNzS2lsOUpU?=
 =?utf-8?B?TU43Q3VoTUdEWFptQUhiWWZQeUNOWFFIVVBoUXRRVGFvMjdCVUJPclFDNkdh?=
 =?utf-8?B?RGZPQUNSL2hrY2xPRXpwWVVJSTljckVwN0RWNTF1MTEwVzZQOUJjdFJmU1p4?=
 =?utf-8?B?N08rS01XZGxpRzdDcExZQ1pZZTF6VmxHeEZOai9mZkRjZXV4NGRhR3R2Njhy?=
 =?utf-8?B?cVYzdHNiUFNVRFpkME95U2VydHdGYWZYSHE5aXRjWjlHWGZLREx0M1V3STdn?=
 =?utf-8?B?a2VsNHNmZDdWU1JZcXVTRis0bTdzZEtQaUJxSERQUWVocmlrdWFFTWJpRGFz?=
 =?utf-8?B?VUM5c0pvWGdGUWZ5KzEyYnFEZlAvTWlHY3cvUThxQUNaUlhEYVdzQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 353731ed-4c83-417a-6a85-08de647b4d77
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 05:56:28.6722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mauHNzAsrwfmjpFPBxLCmb/hb2xH81ePmHdNK9EJFI7Tg/63E1Au9jMoRaZiv8GzEEkrVdZRPJ8aza7Ep5sUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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

Hi Santhosh,

On 2/5/2026 9:01 AM, Santhosh Reddy Guddati wrote:
> Test to validate the joiner mode is preserved after suspend and resume
> cycles.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 1f8d6600b..cba25924b 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -77,6 +77,9 @@
>    * SUBTEST: basic-max-non-joiner
>    * Description: Validate basic max non-joiner modeset by selecting the max mode
>    *		supported on single pipe.
> + *
> + * SUBTEST: joiner-suspend-resume
> + * Description: Validate joiner modeset is preserved properly after suspend and resume cycles.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -794,6 +797,40 @@ int igt_main()
>   			test_basic_max_non_joiner(&data);
>   	}
>   
> +	igt_describe("Validate joiner modeset is preserved properly after suspend and resume cycles");
> +	igt_subtest_with_dynamic("joiner-suspend-resume") {
> +		require_big_joiner(&data, FORCE_JOINER_DISABLE);
> +
> +		igt_dynamic_f("single-joiner") {
> +			test_single_joiner(&data, data.big_joiner_output_count, false);
> +			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +			test_single_joiner(&data, data.big_joiner_output_count, false);

IMHO, we shouldn't be redoing the full modeset after suspend_resume. May 
be just have a check to verify that joiner and mode is intact after 
suspend resume. Similar changes for below subtests as well.

Thanks and Regards,
Karthik.B.S
> +		}
> +
> +		if (data.big_joiner_output_count > 1) {
> +			igt_dynamic_f("multi-joiner") {
> +				test_multi_joiner(&data, data.big_joiner_output_count, false);
> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +				test_multi_joiner(&data, data.big_joiner_output_count, false);
> +			}
> +		} else {
> +			igt_debug("Skipping multi-joiner: only %d big joiner output(s) found\n",
> +				  data.big_joiner_output_count);
> +		}
> +
> +		if (data.ultra_joiner_supported && data.ultra_joiner_output_count > 0) {
> +			igt_dynamic_f("ultra-joiner") {
> +				require_ultra_joiner(&data, FORCE_JOINER_DISABLE);
> +				test_ultra_joiner(&data, false, false, false);
> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +				test_ultra_joiner(&data, false, false, false);
> +			}
> +		} else {
> +			igt_debug("Skipping ultra-joiner: ultra_joiner_output_count=%d\n",
> +				  data.ultra_joiner_output_count);
> +		}
> +	}
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
