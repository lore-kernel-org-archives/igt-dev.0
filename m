Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5126CA1015
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 07:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC3E10E997;
	Thu,  4 Sep 2025 07:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qz2+rrQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFD310E994
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756971159; x=1788507159;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xhpSoQB590K9Uz0TPawpQvBsgMJVGOqGyCnKIZ97SlA=;
 b=Qz2+rrQOLH6A1R1pK60CkDZaKWXX2DQoRjSQqUNh/Aha+GvdcVMJZQSH
 WTJqC57KvxuRDrsnkpuC8t5FOmFeK/y56Qlxs05lvt5qxOOtl46+oL4PF
 8ptCYeFRRltk4HcO4SaSJnvqw1TTI0/wmdafzPhtSFFH3D4fF15Hue/Tq
 hksGbOhLWYW/jXO+wfRM38DXJ6MXViEe6pY2Iux5ca0S/Iw6DuvU9K4P2
 Fdl5t3YH4qlJBKDFRSfQiEfAtPLRolKRYAVcUaxt19GolSpj6FRvNHusF
 TXEWO3t273e7eUTz8Jbqp4xBBaodKjL/8XdoRpZcpj9DDfJ3NP0/sbbUf w==;
X-CSE-ConnectionGUID: PerHDC57QXuhJdHJpz0dYg==
X-CSE-MsgGUID: eaoJUn+tQ9avE9egBGIVUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69915762"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="69915762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:32:38 -0700
X-CSE-ConnectionGUID: wWofrIbuS+2ELU0/zmnH+w==
X-CSE-MsgGUID: o63wkJuvS12kW9sPMOTCZg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:32:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 00:32:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 00:32:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 00:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnljsuKsD1lXR+UuKU92Z2GLUO47tB7gw4FXusw1iLxcxF2Ti5m7Bnp89bHPQj4TlwWFp86kkklTPFkR+I9GqnnnDvZoYZDsXHVyeplaud+s6hYRj3yCDbs67Mn6h2l87oliIBIgFa2WyTnBiB+u9bHmfjw/OmS0KTUtLmRc1Ycvk2V1y2iQR+1pfwMWtnk/+tUCuTRzd6K5/pYLlfu913Sna+LUNP8dS60Fj8PGxjqdLiqDO+29aWpFE4iZLcC/7IvSp9VX1EDX4NgseJ8A1JfgfR41Eae5nkx+Db766MevmOB6QvJWVMAW+ne2ZICk2Ipyx+Oldw3dbLHhU+9NrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIr85tOqFOLR5+0H0BJ6Ik0oRgzmHlGrkguTmm9MZuM=;
 b=KBLECblcFvvA+kx9YW/y2kcnVRVTgXDEAhkXzWMgSQGgpHgNSxQrKvLnXYuq+cBbfl6PNxzuFTGYRV0IwBYLC8aDn/3Y8/sf76FwbqYTcp3Ya8z5Oum/eFdhH39pY/y5nHabUxdUxpxEQEb3vF3axGi+Xb7sfVyh17v9hSqBsv1RR7awspPZD4RLFK3ANHwvfXmaGXCwEPK+IZTrZY8pPimL/Nf0LCbS163FEXgP8N909GZ/4desQzqCiSMYrdw38CL8bKALfc96KOyyYYXmVfsueIwJFWYmUaCErh9RQT+FxyTMPHf6ZwSOqVODWEucn2ulG7eXoK9I6uG38r1AnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7333.namprd11.prod.outlook.com (2603:10b6:8:13e::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Thu, 4 Sep 2025 07:32:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:32:34 +0000
Message-ID: <435c0693-f49b-4d1c-8a15-88f66c14dcdd@intel.com>
Date: Thu, 4 Sep 2025 13:02:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/xe_wedged: Add new test csc-wedged
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <kamil.konieczny@intel.com>
References: <20250903124455.3616608-4-sk.anirban@intel.com>
 <20250903124455.3616608-6-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250903124455.3616608-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: b938346b-8266-4f97-ee5a-08ddeb853687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlRIRlJFSlVxS0haWlYzaHBnT25nS01Qa2FjSE1EQmViNHdPMFN3MEd1em91?=
 =?utf-8?B?ZXhwZWRLZVVPaEkxYWc0NlVGTVFOOEU1T3V0QWQxUjkrN1ltUjhvSWYveWl6?=
 =?utf-8?B?SmJqRnp6ejdwN3BMeG1VWXBwQndoaG9YY2JQSmYxaENkRnJ0NTBPTjliRjNk?=
 =?utf-8?B?SmdMUDM5MXJRMHBkYlQ3VzFyKzdYazNiWmtPTk1HNWlYMmlINXYvcEVoUkIx?=
 =?utf-8?B?TWx5RzYwR0ZmY1grU1VvSmdObnBKK29hWVh3RU9qQkpVTXRQVzJyK2VVZGE5?=
 =?utf-8?B?RzE0V2NtYVQxbUhTOUFVdHpyT0lxNEhJN0JTSG1nckpkYm1JTTFrMG9rUUZK?=
 =?utf-8?B?MndzWlRWN1NkQWhyQzZaT0dVa3htVHhESzVqUDB1cklwdlBxTDBNT2dxbjBC?=
 =?utf-8?B?L2MxOC9PeVJaYzNlSllWT0ZFTEtmaGdyWXZwQzFPKzg0QVJKRE5OVkZuMDlo?=
 =?utf-8?B?ZkcvYitOb1hRMHRWd0M1YlNCU2t0Mk9YU1Bnd0gzVzJMcGw1VXVLcGxMcUpa?=
 =?utf-8?B?d3VjTWdHREk4QlJvVDRWNC9uZk45STFhOEhpY05BNzJXdGdROUU5MENHazVo?=
 =?utf-8?B?alZ3c01Wa0Rhd3daOGdtWFNudWl0Wmtsd2xJUkQxRVRvOXdjNUQ3bWRWbUxk?=
 =?utf-8?B?MGJuS05sNDZxMVFXSWVVenI2NzlUMEMzcDFURDFkdHdaVHhUcnV2WVdLQW0x?=
 =?utf-8?B?aEJtQm9neUYvOVJFQXk1V3BKVVJJMXZBS1VpV3BnenpGdXc2cFhmZ1Jlb0xv?=
 =?utf-8?B?VUxvZXI0U0JVQVh3cmFESURvSlhRcTBmRVcvREpIUDN2d05HV2o3RkF3WlJM?=
 =?utf-8?B?Q1V0RjFBOE5TTHJBbnBFQWQzUHhMUENvejh0UTVQZHBsZjBZZitpY2dlVFFU?=
 =?utf-8?B?VlRNTmsvZUpSV3hXWHdIcTB5VXVoYTB3WTErSHhOZExYdUNBSXgvNHZEc3hI?=
 =?utf-8?B?TFRoMXl0ZVNRWkpGZ2s3aU1CNzVlcWlKUWtaSHpSc0FLdFE0QnVNR044aDRZ?=
 =?utf-8?B?YkdENXJjYmFiZmFvWE55amx5c3pNTWgwVGw4cG1uSk5KOW1UM053Wll0WGln?=
 =?utf-8?B?Y0Z1K3hBSjFpQ2VGd0FaYmVWZWExK2NaY29wWm95NENmV0RkMVg4bWF4KzVp?=
 =?utf-8?B?RzZvQmFvUTVCTTFUYWN2cFRod1A5RVVDWFVPdGZqWjlMR3Y0akQ0RDkwVit2?=
 =?utf-8?B?QnEvVzRCZWJOWTduZnhtSnNFbnJNN2tHZkFSVEZNemdjbGdxOTlEUVJhdld0?=
 =?utf-8?B?NjUzMFRxb0cxQ3FSTkYwblNidGtQMjY2NlQyYS8vMnZ1Y3B0OWJYT1FjdlI5?=
 =?utf-8?B?ZTRnVTR6Tmc2UlVLa01wM2VZRE0ralhRRXhiOW9VRVpkZUZaSVVqd2FZK3FP?=
 =?utf-8?B?akZUd0VGVlU5dmdnT3MvMlBpZWdHc09GZEVTUVJZVWZUa05PQSsxOWwwbllx?=
 =?utf-8?B?bjVUZ3BEenNGTlplRnFjN056Rkw1c09Fa2NNS29XVmtnSVlnN0xxM2ViQ01J?=
 =?utf-8?B?SFRoaG1kUDhrUUZMcFpYLzNBSU5uamFSY1FuS0ZwaXhLcW13WHRKU1dlcVN1?=
 =?utf-8?B?M1YxdXE5RVFNNmhZMnhlcXNSSGlPbFh3Q3BzOHM0TW1UTUxYU2JSdVFjYmVz?=
 =?utf-8?B?ZStiNktzZ2xUdy8vRXg4dkZBdWJ1aDRjWnBMQ25oOVpHY2d4YmV1KzZqRHR4?=
 =?utf-8?B?dnlxdlpNSzF0Wlc0Rk42MTBvL2hEclBsdkkvYmxmRW1zdk1YM3ZDTSthTXNn?=
 =?utf-8?B?ZFhzclEzaUpwaUcyTlQrNitkcStyQVA3Z085K3hwRG01enRBZEZZc3IzSWJQ?=
 =?utf-8?Q?ZHB1ZuO6eUBQXtSe5IwX8Y3Gf4fvN74bS2qqs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUsrODZ2VFJhRTBLSERJaEVFb09XcDBETUZ6ZlFQNTVTcjRITFlwU3hUeGJB?=
 =?utf-8?B?NXhQalFLYjhaRVdNY3Q0em5UN2puSHkySGV3dXdlSndSazVqRXVXb2ZxT3pB?=
 =?utf-8?B?bkVGNUVwREpqbTBJRFZCQlNObS9zVGJMSmRNRjAxSGo2eXp5YlRvSTRZUXFT?=
 =?utf-8?B?dGo4eUVERWJsbWV4T1NxdlM4NG1tdmV3RWMzQkpCeGpIYjZkK1F2czFIREgz?=
 =?utf-8?B?MERZZEdnWjdaOGRtRWFxTVdKRjlBNVVCdWpWbmZORVJxZmNZenVySU4xZmtN?=
 =?utf-8?B?d1FCNFQvNmkrR0V5bDJweHdIUTFEb2pXUHVZaFRiOVh3ZkNNYjVob1FtMGJ2?=
 =?utf-8?B?Qm9IQ2o2bE5HNnNPL2NHWnV3ZC9kblBUTUZnVGhGVnhBRGZNU2ZWTGo4cVpD?=
 =?utf-8?B?RlVvc3phdzNjVC9OVC84VE82YUhCZTBza0ZUenVLVUxzdVd2Qk5uTEFhVThN?=
 =?utf-8?B?MXVlMWFnOEpib0tPSmszUzZvNUFqZ01ZWHZmL1B6cmYwVGQzKzE0ekJ4RmVK?=
 =?utf-8?B?UGtYSFg0UzhOQWN6TkFFbnFGVUd6UHN6aWtEbkVkejE1T3M1c1duSU1sOHMv?=
 =?utf-8?B?WnFrbk5tV3RLcklSdCtLRGQzWVpyWGlKdDFXOCtFbUc0cHNuU2JpamhrVDhv?=
 =?utf-8?B?S2FOczI0R1FMRm9CZ1pmalBFZXh4UVlXTk42NWMrK3BHemlBUFkwcmVFQVpM?=
 =?utf-8?B?cjRhS0ZpQXU4MWVrTUlwRU5UenZBWEl1ZlB3dlpHRURVRE9mQkNsYkJHK1ox?=
 =?utf-8?B?YUVlc2RHVWxYTjRFb1JWYWFxclYxTW9IYzQrNndGVytDWHFhTmMrR0xSN1FL?=
 =?utf-8?B?TCs1SjVKVDFpRURWMW4yem9RcXBWalhXL3B3UDFweFdQcmY3TzJ2UDRhdkZn?=
 =?utf-8?B?MFUxTE9YSGo0d1l0cWl1VGpBRVcxeXdqYnpzcDkxSmNkV2hCL0FtalRYTGhU?=
 =?utf-8?B?N2VCMk9NaVZ1bHRvYUFEZXNBOVNWZFQvSVZKayt5V0NzcUNuZFR0dkdGZHkv?=
 =?utf-8?B?bStTTFFkY3JYMExGcTVPcGhLZHQ1dURSWkgyUDJSd2U4SFZGVjhURlVZK2No?=
 =?utf-8?B?TnI3OTlUbUhmRlJwVWQ1NW1jOVFvb01IamZWeHVxNDBPaS9sbEoxNVBrR0RF?=
 =?utf-8?B?cG5scGRWdHpMNVNiZHhVNlJHMFYrbWlVaytDaHMxS1hNTERWUlk1eG9pd2dT?=
 =?utf-8?B?UkNZY1hKdjlMa2x3SmFBZkl3VHUyNktoaGkxeE92dEZPWExxcnd6bDJ6dTdL?=
 =?utf-8?B?Q2dQZGx5TURybld3QmErZHFGYzh5ZGkwZEQ0QUNlL0lQTlQ1eWZqU2E1ZEt3?=
 =?utf-8?B?Vk9hbnRjMldTcVplaWpDWmFZUDhkbkY0SUl1dTJMWUMyR3lQc1RJeEhQNnpW?=
 =?utf-8?B?L1oweUhDN0VjNTBLYlcrSVo0NmtJRUI1dnU0YmNGdVA4dVpxc1ZLTDVoYWZV?=
 =?utf-8?B?K1ROOVJOZlNORjlVMUdVUGFnVlhjVTJPK0VyekhCQ3BZSTd2RU12eHJqRXJZ?=
 =?utf-8?B?aXIvVWYxbm43LzVnSHA1elZLdEh1T0dWeTgvU0IxbXQ4ZmZ5a0NjMjlkbS9U?=
 =?utf-8?B?b0JzTVdDZ1BkRU9rTmJhRjc0TGxzM1hoeHZ0T3V5R2RIc1dlSU9RVUo4TEsw?=
 =?utf-8?B?MmFkYXFQNFRoU05xdlYwWThsZ3FKMFMyZUlqNHVBdmpoYm1MbHgwdG4vRzN1?=
 =?utf-8?B?bVozc0s0QmVST09UVzN4S1NReFIwenpDMzdielU3V3RnUTFseEpjcE1JUGc3?=
 =?utf-8?B?K0RuY2FnQXFMQVVzWGZRaWFIbTlXWFRzL2FjMFlHRlZRSXZ5cDJTd2FBUUVz?=
 =?utf-8?B?NEl1MlBGbkRGUW5TelhFYkV2UXJjOW9OdWpYRkZldTBzLzJicGNMdWh1bWVV?=
 =?utf-8?B?cVNXTi9MdDZHRUlsaW4vcUUwMDJjN2NjVVBvcFBEck82S2xnT2tLeWN3cndv?=
 =?utf-8?B?blVwOHlLcDFBTWIyaTBwcDl1WXJEZWhBc3J3SjljOGdaeGNycHNLdk1kajA3?=
 =?utf-8?B?ZVB3S25qdzZYOGd6NVJFckUrSCs0cS9MRzNHZGZVVFpQR2VLRFh0SzNzdDB5?=
 =?utf-8?B?b2liVVZTckNjYnVBNHBjeDE4amxKRUtmWDlvZGp1ekdpMWdoNEZhL1oramdh?=
 =?utf-8?Q?BoJgCbbelGmeohNbXjT6c+Ioz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b938346b-8266-4f97-ee5a-08ddeb853687
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:32:33.9351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVnJ41w9bwaLPb0yCyGqhLqjbylUS0f2+/aV7bX/X3N/xHjQnPiJNnFdLixJZ0/qqz0lbpUhGqTCYZNo0UyEkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7333
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

Hi Anirban

Move this test also to xe_survivability and rename the test to 
runtime-survivability.

Also add a HAX patch to make sure this runs and we get results
with latest build

Thanks
Riana

On 9/3/2025 6:14 PM, Sk Anirban wrote:
> Inject a CSC error through uevent to cause the Xe device to enter a wedged
> state. To return the device to a normal state, reload the driver, as
> the wedged state can only be resolved by rebinding/reprobing the driver.
> 
> Check survivability mode to validate that CSC error injection correctly
> triggers the survivability state transition.
> 
> v3: Update commit message (Riana)
>      Modify the uevents interrupt handling (Riana)
> 
> Related kernel patch series:
> https://patchwork.freedesktop.org/series/149756/
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_wedged.c | 79 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 7fc7ca9eb..750796414 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -12,6 +12,7 @@
>    * Test category: functionality test
>    */
>   
> +#include <libudev.h>
>   #include <limits.h>
>   #include <dirent.h>
>   
> @@ -46,6 +47,50 @@ static void force_wedged(int fd)
>   	sleep(1);
>   }
>   
> +static void force_wedged_csc_error(int fd)
> +{
> +	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
> +	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +
> +	xe_force_gt_reset_sync(fd, 0);
> +	sleep(1);
> +}
> +
> +static char bus_addr[NAME_MAX];
> +
> +static int check_survivability_and_uevents(int fd, struct udev_monitor *mon)
> +{
> +	struct udev_device *device;
> +	struct pci_device *pci_dev;
> +	char path[PATH_MAX];
> +	const char *dev_path;
> +	const char *wedged;
> +	int dirfd;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +	dirfd = open(path, O_RDONLY);
> +
> +	if (mon) {
> +		device = udev_monitor_receive_device(mon);
> +		dev_path = udev_device_get_property_value(device, "DEVPATH");
> +		wedged = udev_device_get_property_value(device, "WEDGED");
> +		igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
> +		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
> +		     wedged);
> +
> +	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
> +		     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +		     bus_addr, dev_path);
> +	}
> +
> +	return dirfd;
> +}
> +
>   static int simple_ioctl(int fd)
>   {
>   	int ret;
> @@ -208,6 +253,10 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>    * SUBTEST: basic-wedged-read
>    * Description: Read wedged_mode debugfs
>    */
> +/**
> + * SUBTEST: csc-wedged
> + * Description: Force Xe device wedged after injecting a failure in CSC
> + */
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -300,12 +349,42 @@ igt_main
>   		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
>   	}
>   
> +	igt_subtest("csc-wedged") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
> +					       O_RDWR));
> +
> +		igt_assert_f(check_survivability_and_uevents(fd, NULL) < 0,
> +			     "survivability_mode sysfs available");
> +		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +		force_wedged_csc_error(fd);
> +
> +		igt_assert_f(check_survivability_and_uevents(fd, mon) >= 0,
> +			     "survivability_mode sysfs not available");
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		xe_for_each_engine(fd, hwe)
> +			simple_exec(fd, hwe);
> +	}
> +
>   	igt_fixture {
>   		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>   			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>   			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>   		}
>   
> +		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
> +			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +		}
> +
>   		/* Tests might have failed, force a rebind before exiting */
>   		drm_close_driver(fd);
>   		igt_kmod_rebind("xe", pci_slot);

