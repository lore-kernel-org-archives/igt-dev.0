Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C254C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 13:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0BD10EAE8;
	Fri, 17 Jan 2025 13:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB3amUPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A0E10EAE8
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737119953; x=1768655953;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vqqQOpO58GIbfoZTbb8zApj2HnEUBLXrATvFQvEu8po=;
 b=CB3amUPVPrEY990dwbSeK/606o60jF2a6kjshmd2Q7sAdABeKnKp8y0B
 3DUJeCYAFYDHtEND9YGRQpMS1kE1eNHawmieoa319lkle4hcZvHG+vSeX
 6cryB2817tYqCdw5r3eEk7S/VMjlCBQAUtWCTgLtGzHWot+Im/RXZvsoI
 /cA7bUA23lKF0bqkKiuvkvLwWWcRzGXYOCRec+bOxRGrz0cuCugadYJmM
 w2ylpAT4FQJ1l1Gs8UX/4vXu0xklIMNkubZ2Qe160Y2f5RzoZxjOj4cmZ
 3rd1AHrNzvjFXYwuFwYr5NPEMjf8d7rZrKZg9beDslaL6GexzzsnN0mgs A==;
X-CSE-ConnectionGUID: 0qAIPUuaSKWTQ8iEkwpJ+A==
X-CSE-MsgGUID: pDFDo1hKSrmoAPFsshQlzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36829390"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="36829390"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 05:19:10 -0800
X-CSE-ConnectionGUID: 7Y00dDY3TJCvIx5zAEE3uA==
X-CSE-MsgGUID: TeVfPsrjSnmRRM7jpqLIWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109866227"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 05:19:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 05:19:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 05:19:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 05:19:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhudOYNYjmoqZKKxfBMO9m5iVKrHwSJsjJShrLXwhndeuFUgeMWU0iBTfIQZHG/3FuJ7stoHOKMpAFFew0KY6p86W6dQGobr5eemv7acVVtmePllD8Q5bOH19dRtXJrrlY5wiaAothGw21sCvu8zb5P3GIxPD8TCBATqnpOUmRbu/6WZK1O3ka8dhYaDRpTNIyhV0HbWM+hkNW/WMKeMme8ZOvZYzyqxOisov7Az3kbKh2StRt82W3H8cXywwD29lPUknCSxQLrv5sdbCJPKGkNs+wZx7syUzkL9d3IfjhFdSx6ZfRMOa1ned7P1pduimLZtIIjlEeHXmZCisLJ1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNxw5kLeVfLkFjDtIVN6YXXA0/3l2G6LZ4MdVfUoc30=;
 b=fhP1Z5zdQwmXeUuxZhVgQF5YU9ENOfvKhhOQfS93c6/61d4HGOcisiURNfe78iTtBKylmWGhBhuGMRzq0LxkfZ8M/JrG3shm5DabvH677vzLSbiCQ0XH6+pPTIR182SAbjb/0sEIyQIEbM4xy+cZWebXBJdYJWIDBqX1d2jY0zGPC8jVmUvSLpT1ZAUsXvbJSquYuItvaChm59BfgEU/gwjdN7AZ7+6ScsD185UfOXAlp5iJmyGDC2S6+jp52cuElyocruEvAP/jjogjVETXc0TTQ0Jd4M3671VCZuacBbD9ptYJBiUXLlEtMq/Kmw8sYW3+E6WzV3yEdgV33H8KpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 13:19:07 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 13:19:06 +0000
Date: Fri, 17 Jan 2025 14:19:01 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] tests/intel/xe_fault_injection: Inject errors during
 xe_guc_ct_send_recv
Message-ID: <Z4pYxbKSaEGQXKNF@fdugast-desk>
References: <20241230084451.17488-1-satyanarayana.k.v.p@intel.com>
 <20241230084451.17488-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241230084451.17488-3-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI0P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW4PR11MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc360ad-8207-4fb5-d0e0-08dd36f98541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0FKKzF6K1Y4VlZWMlozQ1MvdFJWc0JXTWJJYW53V1drNCtncFZMN014cDhn?=
 =?utf-8?B?ckdMOXN6NGU2T2JZYUJxZDRNbE9tVTN3SFRGTzBDOGpjSWx3eUpnMGRZUXp6?=
 =?utf-8?B?R1BrVEhQZk11bkY1TnphaTFjdGNDcFdaN1hYLzVNUFVGVE5aMnIwMGNMdEUz?=
 =?utf-8?B?SXNULzdUMlA1dTFnRjJLYUF0ckVnRW1wYUNPYTFZQVRvbklyaFhQRG5zRzZI?=
 =?utf-8?B?R2EwMFNCWCtxWGVSWlcxQ3J5UHVnNzByV1NPb2o4TmRPdXdNZmZNUUJHOHdk?=
 =?utf-8?B?NUdTa1JrVEdVSDFjcXRWQ3FTcW5MdW1kdVB3K01aYUh1cFlNbzJGc3h5UEJz?=
 =?utf-8?B?Mk4vd09rYzNYR2RPamx2OXpOUGEwalZocnlWbUZTeFFaZ1VGZ09lamszWXJY?=
 =?utf-8?B?ZDRWQ283V2FEbzlvRUw1Q0p6TndDc2J3QTVCUVYwTmVydndubmFJd29zQVNW?=
 =?utf-8?B?a1lqbDk0UVdBM1ZsSURIYmFZSHZhbmZNVjZWK1UySDBQeE45UHdPUXUyQ2Vi?=
 =?utf-8?B?VnRUaEZPMWJHUVdocHBzMXJ3WVZrcFdVSWVOaG92dEcvZjJpUjlJanpJWVN3?=
 =?utf-8?B?TEQ3aHFnSmRxdWFKSmVjWjQ4KzRPcnRxejI3ZVZhMmpPelVNZjJLUG53d0l1?=
 =?utf-8?B?Mk1RcXpHOWNselhRZUNxU2krQUg0ekV0dVEyUVZkYUxJaGhGUFhVczRKbjBD?=
 =?utf-8?B?S1ZtMzBpeStHcm1QdzdnTXlsUFRzK2VFYVk1eVZwdVBSYXBsZithcjJpenBM?=
 =?utf-8?B?TW5oeWtKT3p6dUZ4dzlsY1YzdFRiRGRWOFI5L1Jpd1NLazZQSnRLbzhPT1Fl?=
 =?utf-8?B?dGVQaml5TS9WZDBxd2hydnIvOUU5TWVqZk1IVXNWR053aHA3V1U1Rm52elB1?=
 =?utf-8?B?aUEvZWtDaEFKT0Y2R3IyS1R4dUNzWDBwTG5tNWF0OHRPV1NtWG9KcUZQVFdq?=
 =?utf-8?B?V0pQcHN4b29KTnA0ZDZUeTViZWJhUHF2S3JmcTdIL0w2b3ZkWnV2aGtKVjM5?=
 =?utf-8?B?VVNaU3lTZWJtOEUvUno0U0ZjVmVBN24wNWFsTllyNWVFS0xKcGFsOWQ0bEo5?=
 =?utf-8?B?ZWMyQkRhdks5WUc2YnFZdm9wQm9nSlBocjBDSWtxYnEzWi9RdFg4cXlKT2pD?=
 =?utf-8?B?Z2FvMEpHZVI3TDJja1IxalAzNGhJR1J4N3Y1WWt3bThWMUtWNkpMVVFFSkUx?=
 =?utf-8?B?TXRvektPVkdvQXlybGJxWEZ6ZTkzUTNDYXlJTElyMnpWbGxEQXh5czJ2cHE0?=
 =?utf-8?B?VXkyYmoxSUVHZktObEJTQmIweTBDZU1KcUJ6TStocmNSZWRkVmFxVnF4aFp1?=
 =?utf-8?B?TmNqSDdLNEhENjB3cTZEcnRNU2FjaWJDcU1OU1MrZlVXOVY4dlRFTHJLWFZC?=
 =?utf-8?B?cUtMYklhYUorMlhyZUJWaDFQMU5OTHlRZFIxNWliYjE2Y2pWUng1a0lieTds?=
 =?utf-8?B?aW81Z1RYS1ZDLzY5ZFBJRmpUdTlaamhiYjBxVXlZWFp3dHM2VzI5RDg4S0Z4?=
 =?utf-8?B?RXMxRnBvK0hxdUJydTFRRnZvN2plenhmcGppOG0wR1owNFVRcmhjaytlRXc1?=
 =?utf-8?B?QU1tc3VUTDV2YmQzWEF0WVJtZnVUcW9ld2RNVUI4SkNsLzZ4Zlk5U3ZlZURP?=
 =?utf-8?B?bTJ2WExyck5rdklHZHE0VGFaNzVuZENhS0ZpWGUvWWFxUGpGa0dFdlZwRGFT?=
 =?utf-8?B?cDJXbURzSHRxanBIYmJnVE44NHBJMmxQQWhpNGhqVURsL3cwVzBZbHhkR0lM?=
 =?utf-8?B?OEhJR0l5TWtpZHdFRmN1RGE2SzFLY1FES1J6SjNEeVkwV2t3U0ZmZHY5ejIz?=
 =?utf-8?B?TEJJK3pDY3NmazBGWU12YmJPNFFKMzVoV3N4TnZ6NlNvZnBaODhFQXEvZ2VE?=
 =?utf-8?Q?guJTUNXclHh05?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RklJTzZZTm43bjlPaFpjNFpXaVpGUzJ6R3F6anVSU2E4VHN2NmxzZDlpdGt3?=
 =?utf-8?B?eGlTTEpuOFBYL0hrS1hjakVsVmVMRXA5V3ppUVpBOGs4a0YreWIyak13bjJE?=
 =?utf-8?B?SzVmUUc2RG1NV08zZUV4MHRRWENmM1o5TU5LbFh0WnZHN0NwQlRQSVFFakpv?=
 =?utf-8?B?eERsMXh2UmxmZS9JQnA3c3Y1MXgreGVEUy9Ba1hwYVZWeXVsQllFTEgzcFJ0?=
 =?utf-8?B?blpXb1ZQTHdJM3NsQ3NtbE9EaHRGV0VzbktJcFVMM1V6b21jdzBNZGU5blZO?=
 =?utf-8?B?KzhOandQYmpMMld5QXkzb3F5Z01XczVqYkdveUQvb0wxRDdQNVNFMjNQSnM1?=
 =?utf-8?B?cVFLMlgrUXlsV1lBL2FPOXFyMURUalgxY0ppQ3lRVlhNeGJyY1o2U09iRDdy?=
 =?utf-8?B?L0dpV2gyWHlWYTQ0NGxvd3RrSFhZRjlmeUh3VkN5WGpPSDhScnBrMElWNk5P?=
 =?utf-8?B?OVN6amswVEM5Q2hUUXMrWDUzRTZyVlZSY2ovdGFiOWtBVnFoS3BKRkx0ajBC?=
 =?utf-8?B?TXJVdmpnRGVEanFYWTR0bWFZbTIwYWlOSlRmSXBaOWZPdXJvSlM2VWRYN1dR?=
 =?utf-8?B?QkVvOExZVnNiQUFFZGY0Ri9vVXBQUXVQRnh4NEhmRFJXaHBjSy9zdjkvTWll?=
 =?utf-8?B?YlkyL1NrVTRiODhZSVY3cVZkd3plOXV0bXFSdmhBRXpLSUFUU2wzUEoyMEI4?=
 =?utf-8?B?c3ZGSG1Yd1RjNGZsRkNMSlZEY3JINlRBOUF2ZFFVOElxYVpkTTlZQjlMSlM0?=
 =?utf-8?B?Z0JwZXhIcExBcWRqU0swNXkwYW9qVWJ2OVI3RFR5SjJLSEp3T3ZCSjlTL3pk?=
 =?utf-8?B?b0FKdFdDdmpMQmZjU0drYXNGdlF6Q0tRT3FoMTJtSDY4OUpvMUdTRXljUVdR?=
 =?utf-8?B?V1hNdndZRHkycHhXMzcrazVQcEZWb3V6b3NCRFJwY2twdkEzeDlQcmRkWjA0?=
 =?utf-8?B?Q3RQWEpza1ZTUTMxUG9venpKV0MvaWVkdmxTdHVENXZxSXdhOG5QZjZoOFR3?=
 =?utf-8?B?ZjFnbFg4SDFEN3liT3h3Q2JHcG9SbERYRnZwL2FtVStzczZvSWttQ0VxOXhw?=
 =?utf-8?B?bzdaenYzR05DOG5YdU11K05QUXVGSk5BU2J5S3NTcnI3Qk5QMGI0TjFWakdD?=
 =?utf-8?B?b2JUOS9neGhTSTJEbDE3ejJRVXZOd3Y2S2M0TDliUzBTU3FsODZlY3ZtN0lr?=
 =?utf-8?B?R0g0ZXdrTys3Uk13Q1JiWGxpZWJzcytVV1YrL3NLZXhlbzBKczErNHdGMDh1?=
 =?utf-8?B?SGVqVm1RLzlaRzNrcEtXZzNieXBQaCtGOFRiTlQvS25tRjVEb0Zpd25VMzR1?=
 =?utf-8?B?TE5pS09mYTkvL0hvcy9Va0tFcUMwei9LQSthWUVoZmpRcWROTUJUTjZleVRU?=
 =?utf-8?B?Vkp1M21acHlXSitiNlRvWmw2UlFRN0xOcFFTZmJwMEhTT2plOXpZazRYZkpR?=
 =?utf-8?B?MnFCNk9HTTRDYkIyYXprVFgybE9nb3JkRTBtRXByZlkrUzAvRUhkUFRJZ290?=
 =?utf-8?B?NlRmTW9JVkxwVmo2cUp0VUdRSFZSVTcwL3FYaEo1eXZVOGdDT0xSNjNVSyt5?=
 =?utf-8?B?UjczQXhMekV5dklKL05PM3B2Tm9rcEFSdXRML2RKZkd2aHdVTlgxL20rbmxO?=
 =?utf-8?B?dkVkRjNRaWFvdTQxSUx4Y2dWTUZJcmZvT3k0SUxhYjNBTXlXTWgzaWtWMUJt?=
 =?utf-8?B?SnI5SzMvOGl6dlYvUkg0dVIrVVhOcG04dFBWN3FILzVGNzB1T2JNVW9Ud1lY?=
 =?utf-8?B?TXJZUFF4UXliMGdNa1ZrRkVWc2RrNFYwOUZXZ01iYnJBTVlIZXM4S2lhaTN4?=
 =?utf-8?B?RlloVEFQVHk1NUtlVnRzV0s5QXh6N3V3clR3TTFPL1kySUdnSzBtdENLWW5L?=
 =?utf-8?B?ZnlmYnltMjFqL3BlTERSMzFRRS9wcjNpWG42S1d3am44eGpHMi9MS3oyM2Rl?=
 =?utf-8?B?RlZYak9MOWIzZGFFMXBXM0pta0wyVkpBR1VocjZmVjFwYjRCcHFJV3RVbnBa?=
 =?utf-8?B?OHN2UmxXbHlmQ3VJdHJ4UjlLV0NDZW9NSzhPZVhwMktTNkd6WTQyOFp5L3lX?=
 =?utf-8?B?cmcvOTA5Z3A1Z001SlpVTFYrNjNZSUpsSy9OWkxnaGtSSHFvMGxWeWZTd1hj?=
 =?utf-8?B?TmZqU2JrSmZEbXRNbGl6UlRlNUFwL210SzN4b0JmRG9KZUFaUjIyVmJaQldr?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc360ad-8207-4fb5-d0e0-08dd36f98541
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 13:19:06.8047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smsb0fK9GcQ+TmYPSw5Fn0Q9griasmRoxa+s4bSiskPifN1dQe6LoIiX3Y3aSlcjel1U3oothqC+oKF6xJ16JWofgFVJEp5gUvhg2cVs2Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
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

Hi,

On Mon, Dec 30, 2024 at 02:14:51PM +0530, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at enabling of VFs stage when executing xe_guc_ct_send_recv()
> so that more code paths are tested, such as error handling and unwinding.
> 
> Error can be injected using:
> ./xe_fault_injection --run-subtest guc-fail-xe_guc_ct_send_recv
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 59 ++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index ef3bbb7ec..fce8d2846 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -19,12 +19,14 @@
>  #include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_pat.h"
> +#include "lib/igt_sriov_device.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define NUM_VFS		1
>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -281,6 +283,55 @@ vm_bind_fail(int fd, const char function_name[])
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>  }
>  
> +static int sriov_enable_vfs(int fd, int num_vfs)
> +{
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(fd);
> +	igt_assert_fd(sysfs);
> +
> +	ret = __igt_sysfs_set_u32(sysfs, "device/sriov_numvfs", num_vfs);
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: guc-fail-%s
> + * Description: inject an error in function %arg[1] used when xe interacts with guc to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_ct_send_recv:               xe_guc_ct_send_recv
> + */
> +
> +static void
> +guc_fail(int fd, int num_vfs, const char function_name[])
> +{
> +	bool autoprobe_en = 0;
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +
> +	autoprobe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
> +
> +	if (autoprobe_en)
> +		igt_sriov_disable_driver_autoprobe(fd);
> +
> +	/* igt_sriov_enable_vfs can't be used here as it is causing abort on any error.
> +	 * Since error in this test is expected, we have written our own static function here.
> +	 */
> +	sriov_enable_vfs(fd, num_vfs);
> +
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	if (autoprobe_en)
> +		igt_sriov_enable_driver_autoprobe(fd);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -319,6 +370,10 @@ igt_main
>  		{ "xe_vma_ops_alloc" },
>  		{ }
>  	};
> +	const struct section guc_fail_functions[] = {
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());

On my setup other SRIOV tests are just skipped but
guc-fail-xe_guc_ct_send_recv crashes instead of skipping. Maybe we are
missing some igt_require for SRIOV?

> @@ -335,6 +390,10 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>  
> +	for (const struct section *s = guc_fail_functions; s->name; s++)
> +		igt_subtest_f("guc-fail-%s", s->name)
> +			guc_fail(fd, NUM_VFS, s->name);

To be consistent with other tests and also the commit message, I would
emphasize what is being tested from the user's perspective, which is
enabling VFs, so rename:

    guc_fail_functions -> enable_vfs_fail_functions
    guc-fail-%s -> enable-vfs-fail-%s
    guc_fail -> enable_vfs_fail

This way if we have more fault injection points to exercise while
enabling VFs, they can be added to enable_vfs_fail_functions, whether
related to GuC or not.

Francois

> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
> -- 
> 2.35.3
> 
