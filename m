Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB25EC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 15:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D03F10E310;
	Mon, 27 Jan 2025 15:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfByy9lW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F53310E310
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737991929; x=1769527929;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=USN9yYEWRAuQkLRI25K2cz322uUwFH8Dx6GQF6N3T7k=;
 b=SfByy9lW1zCPp0aP0mfa95vH7xy7UPeu5gngI2C8v6Fn5uQ5LaHGlQjm
 UfqdrOq3ac9Ypcf51In4EAOMaFSJDiwOLALQFFJu1yN709oE/w3gdkHgL
 dEmmR70URdQeFhMNBQ3cldG9cEq2zcA7BvSyRUjvcSlmeeeWYcKgVyfdS
 PA0BEqfHKXkasVKdQxuDNgbDxbBjf9tvvyULOr5GnbpXDqXT1qeIQdFxU
 /KcKn11GBmn7FNIH101G6u7EueGQ+vrAmCHCpp+Of6SxzB+A1C/NC78kI
 +E3pQgUM7o9ZbuXR/PHERq76ausC00h3/bzQLxr0eHhnSHgkWzLEh4biU A==;
X-CSE-ConnectionGUID: J2pFlc8HQC6A+jZsJmEq0Q==
X-CSE-MsgGUID: b5mGKy0RS0CQ+X2NGjSYFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38489564"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38489564"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:32:09 -0800
X-CSE-ConnectionGUID: 5aGiS1hjTUab6yldtb2Xpg==
X-CSE-MsgGUID: N5/G9KTISGSCdhYS9M/rDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="113494909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 07:32:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 07:32:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 07:32:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 07:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0oEFXKaeHTECC8etbzb/qNcQr6vf9lYEROYDM7xUaE/1MEysNODHZHJElWHtajg4mjabyZKdLtUL3IPTc2abfBl42LB3li3vKs2cYYxSYy/+gHLhkwFoeY+63LTB8hN4Jazv8PneZG9LlNKiJacqOO136XV8uAa+UaSIMxEzhfw3UW8DUIeWpeP4REdbVNTRSjlMr/mcg7wsLXnbcQAcAViJYE0GR7BPCqV4lE5HBb6y8gvdRZvQFjidqowo8Rv+Jn8p8yQ0F4d20+MST0/iLLw+DV41B0S/dpTKzumkTyOWo6qItTHsPZpLorcVF7RUzXzHa8IKe0R8KAoYOLTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osaSPDLzLYUWNUC0PevlHP/37YU79c9xPKESbrpS3yU=;
 b=GMzWW/TwC8uvp52fiFty3j+7xdw2q8gfQjxyMFM77pVXAGk4rhICs30oLw2DMc3Zh1hkAhO2uqm7dQHDLk5sUg50QVObj2kYWbWqMblk9ycGcQJCjfUSc9jrfR+F+mQTivclbBDIbt1nhpylTexAaDwPTIV2n9J3me9KeFUlhCVR1nwl5BZrBlco7wB4bP9ucz7VuqxyMGAUaFuzrjPPIZKtARJrY0Uh6T4LOxbKWGvg8H7r67T9Y3uFsfIuEICoIaC8482QtLia9EU8UKbThU+c0jr0Clbk1FuQDHJcEAGfMSWqQINH0/loOJHb9mSmeOt3VWw3VKKH02ZRraGFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 15:31:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 15:31:49 +0000
Date: Mon, 27 Jan 2025 09:31:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/3] lib/igt_device_scan: change device list
 variable visibility
Message-ID: <rjrjaq5o2c5ip7ejg22vqzntrnqvhztpvozufv6yvwmlvzygue@t6t6wtmmwcc3>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <20250123095208.72984-3-zbigniew.kempczynski@intel.com>
 <20250124162625.2lz3spps6vgfmie6@kamilkon-desk.igk.intel.com>
 <20250127044915.izkpkskylqw4gdyn@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127044915.izkpkskylqw4gdyn@zkempczy-mobl2>
X-ClientProxiedBy: MW2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:907::30)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aac5f5c-17d8-42fd-a87c-08dd3ee7b76c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDNuQUNxcXFXeU1RRFdPb2hHS2xUNzliOS9XeGY3YkFidHVZS3ZqYTRsUkpH?=
 =?utf-8?B?QS9JYzRYUVdsL3l1TmVadzRJY0dFeVY5MkpqZm9YUVVhQytUWnZhd0dxMnFj?=
 =?utf-8?B?N2ZtWXd4YjJFOWFKNGhLajJ6M2ZtUE1uYW43ZjJobHErZURNcER5ZUJqMTk4?=
 =?utf-8?B?ekdpZ1RqOGs3WWhKWTAvc2JPa2ltUFR3by9ZMEVjVTFUSFFRUnVCZHcrT01B?=
 =?utf-8?B?RGtQdE1mQnd5WlNKVTdJbmpBeHFJRFI2cmtrZ2NiZ1RJT1k4SXcwQUxuRFpK?=
 =?utf-8?B?Wms3dXJDQnM4WjR6dTZ0anVHZ2VQK2hGazRKMUh1c00vTXEwMWcrSmZFWFJj?=
 =?utf-8?B?NWdxQng3cUtBRzF5MVZhVDBYUWlVbVJuczFtbjFsV1FDc3AwTmNOSWRUZ1hX?=
 =?utf-8?B?S0xQMmhKeERqL1JVT2crOXlaekZFK0JlL3RUbmpKQ3hEeDZIQWEydFBiSlhT?=
 =?utf-8?B?eW5DZ29mZTU3RmhGL3lhcVE0Z2JhNUNRUXE3WFdBZ3VKSnl4YjAwTFBUeGZQ?=
 =?utf-8?B?WnlxZlkxcExnbGRuNWk0MU9SRTA3NEdleE5WcWxDTFFmcnY5bHdlczlsUzNS?=
 =?utf-8?B?TWRZUzBUWkdkZE5GLzBkSHJZcy92NjJVaGNpNWJZUG96THVGakVSTm5KL3F2?=
 =?utf-8?B?TC9DN2N6QjZEREtucmJNRGV2Rkptbk84Qm5YKy8yZ29HdERQQmFYSTFkeWVp?=
 =?utf-8?B?SWNibzlUM3FXeDJVTmszd2ZKckJmQnVLdDQ4Y1g3d1pJMlVWRHF2UzVJOG90?=
 =?utf-8?B?d0FZb0ZtUjBVM2hZY1cyTnRBdVl3RStwcVIwMHJqV1BJNmdvNGlqRFZPUFpS?=
 =?utf-8?B?TGp6ZlhFb0xmQTBhc1NrbUo2Sjl6OEdDUlcvQ2NPY1RxaDRZa1ZWVmdkUkRE?=
 =?utf-8?B?c0pIdWZDYlZwQ3oySzloVnZJWkdxK2xycmFXRGw5WXBVeUplQjZCKzBpc05h?=
 =?utf-8?B?UFdDL0M0WFNpRDBlLzZiTlJTODBWMVhPZjN2VHpkVW14WHNheklLbXZGcXhI?=
 =?utf-8?B?dG9jTHVWakx1RmNjaWlNRjU3QjVJUnZTODB4YW9yclVkaDEyTmJuMlNwZm9F?=
 =?utf-8?B?TEVPbjBkbFBiajNGUWh1bmQ5ZFUwUHBDNU95cXI3Syt2aHBnWnhkVXNodGIv?=
 =?utf-8?B?dE5aYzEvRUQ5dGUzU3RBeHNyOWY1WXJuazNjR2NsQ1BZbmt1YzBhNGZrVEIv?=
 =?utf-8?B?cnNINGhtKzBIaTkvL2pCeXk3bzc4bGZ3c3NVNUFWUW4zWGk4MjF2NWhLb3hR?=
 =?utf-8?B?aGR6a3BHTXpVbW5ld3luNjUrYzF2VDN5UkFLVEdLaHdGVUo0OHlmQTJ3aXF1?=
 =?utf-8?B?Mk1DWkxJRk5qalo4aElRM0c3SEd0cWtyM0kwRjJwaXJDbll3ckQwb0Jzek5i?=
 =?utf-8?B?U3FLYk1CblVNVzZ2Qytwemxod3lWNEJ6OGt5alhycmlrTUg1Z1BZZUV4RFBV?=
 =?utf-8?B?WDR2VXpMOXlXZ3huWGJrMEs1WmFETCsrTnVIQUhIeDNBOFArcXUvM1FvYXdJ?=
 =?utf-8?B?aGd6VC9ZVU5hUGVsLzhMV0NBaVNHaGhmY0tsUjgyQlB6dEkyUHpQcm9zQWIy?=
 =?utf-8?B?ZlhuZEVrQ0Vtc3A5MUcwT2xTQmhET204ckFyNFNoOTZaQm80bnJvYzlsNUlK?=
 =?utf-8?B?TU1uTkJlMXJ5ckxYZUV4NitkcE95Zll2dzhjUStDUTQ5QXZKZE5sdXcrMzE0?=
 =?utf-8?B?N2dDdkd2Zlh5bW9WMUF6VW9pbXdzRmhiTTg3L2RCeFV2NWRCRE43N05VYXlQ?=
 =?utf-8?B?UkRSSE9jcVU5dGRibTRLRVhVb2hBU2hxWG5SaXlhdjdIZzlJUmVGL3JLYlh5?=
 =?utf-8?B?aXJwTjNkNllIaEtYMmw3TVdkNFhUZjJSVW1jR1cyRXNrY0JUQ20vYUpOOXAv?=
 =?utf-8?Q?8spwIh82bXAoF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpiNWs2aW81OXRvcWREUEFjUjlBbExKeFRtVVRLQWxoUnNEV1ZmOXFOWnJ1?=
 =?utf-8?B?a0dqbGNVRXFoVkpSMGw5WUhDeDMrRTZQd3NBenZ1aDI0djFYRXRKejhVcFJP?=
 =?utf-8?B?UG4xcFBpd3l1Z2xndUFQQ1J6cmdXbS9CM1N6SmNXa250WXhYdElCT3lrS2pv?=
 =?utf-8?B?V1BPVERUczA4WVVhczBEaHZTUTRtdkU4RG9BekxUblVWa0dSZ2JsUXlKWW5D?=
 =?utf-8?B?NWxSdzZTdlhwWVdoS2k1OU93R1ZpZHdpZWExTkU0QjkwblpMNzM5YzN0SG9L?=
 =?utf-8?B?cEh1Qm12WmtZUmZEVkEwUlJab1R4OVVYR080Qm82SEJlc1hERG40S2RNWjUw?=
 =?utf-8?B?MW80eDhuMmFDdHY2aFFrOVM3a01IMUNOaDBCODJTbUNHRGFtVGpPdnVkVlk1?=
 =?utf-8?B?OWFZcTJ6STZsZnp6MzZBMXpYKy9mR0drWkFjYUE1dlM5MXhmOFE2aDNTOWsw?=
 =?utf-8?B?WkdvZVc3SzY0MktvSmVIQjFwUmVjSFFVU2JiOXRvM1VWWGxrUUM3TWdlamQ4?=
 =?utf-8?B?RHlQNVFTOWNZamlNRXZldmpmb1JGaUZsck1abGhOMUhIN1J0SUJxRzB6L2JE?=
 =?utf-8?B?K3BVYlJsWGs4QWZFWDlBeE1RWTlWVTZGR3JSYmRMUUt1dElZUkdQdytWcEdk?=
 =?utf-8?B?K201REJJWEpmam5oYjFhZU5UdU5JTDlpVitCUkdSaXlmMjYyNFJtLzFWUlIy?=
 =?utf-8?B?bGx1ZXNWd0lrM3BrUDQwTDQ1SXhrVkFKOVBwR1AzTktSZGozblNYbE5HUXVm?=
 =?utf-8?B?VUJSVlhvNWp5ZzcxN3BNQkFiczBsY1N3L0dBZnZIYXlMVGgyYVdwRW92alF2?=
 =?utf-8?B?ejVPMnRmMENNL2c0VFd0bmdtMTRBSks1MkhsYVJCUU8zWlF1K2FSNEdHaUl2?=
 =?utf-8?B?cnRZNm44TFFaeHVnMW9hQUlkbjZpdGFXMnA4RHQ1blo5dGVXZmtWYmZRZWd3?=
 =?utf-8?B?T0s2dk5pWW1HVnpvTUVBZ29wMzdhQURxV3lUWEJOWWhRSW11MTFtMkVpUDlZ?=
 =?utf-8?B?V1pFTXRraEI0ZjBkZlVNQ2hPQ0dCYmtrem1XdHpGa0tjVTlmK1oxRDBublVx?=
 =?utf-8?B?T0oyQlhOTE54OE5OMGVTRUV3VDNEOE5tZFo4M2VIVFlneVI1MG1td0dsL2E3?=
 =?utf-8?B?eEViclE4VTdSM0FNUDdzK1BHS1I4Vm9EYnhyWjRlM0ZjZGVHczE0TWNvSktj?=
 =?utf-8?B?R3FLblhWVlhYQVRmK2lFcSt5bGJVOEdQZVp6eGU1RnRsdGQwU3phNk91Z0pY?=
 =?utf-8?B?WnhTRVlNREVUWTVHY2JZbkZ4VEpKdjhTUDVuSjVJdWxEZjh6TWxHbHU1SlVo?=
 =?utf-8?B?Y3pmcDVRY0lmUlh6R29SRDdNa3duRjRabzI3S3Qzc2Z3dXlJcjU1VS90TWwr?=
 =?utf-8?B?U0JNRnU5S1pXajZBL2ZzZ0hPVDRZRDFpVTZkWENDSGZyTS9PUFVUTWMxZldm?=
 =?utf-8?B?Z3p1dDBzeHVOUUdXT2FWRVRjL3JLd2JaZ1Z1NlF0YnRPOU1tbUxwd3FzVHZy?=
 =?utf-8?B?SE9aUzRTME52Qkl1b1d6NnV5L3AzcHg2VXJxV0V3ZXl6Q1hTdWt6cmVZMFNW?=
 =?utf-8?B?S2VWbG9HdWRnYXBxa3pIdTlBRlJSdjFNallFNG1uYUFodi9jYXJzSTJKL0Rp?=
 =?utf-8?B?enN0cFFocmVSVENjd2pmTXZsRnFUOWdLK0UybFVtT2VoNmkwRTd3V2FlM3lK?=
 =?utf-8?B?ZlUzbFhWclkrQlRaTEgyTGdud3NQdHFkM2Qrb1JZZlpkRVZhRi9CcittYmFz?=
 =?utf-8?B?SWdQMVhmZGFmVCtteWd3V3QwVmZqeERYVkYwVG90ejdYU2JYWCtsZ0M3YlBP?=
 =?utf-8?B?TjJzSXV4RFBTcGNoOU41eHFFVzhVT09kaVU2K21ldzQweFBlOXRES3RKaUVO?=
 =?utf-8?B?NERLcElBWk9aUGxpSExTVUYwTlFsdktVZTltdmczbEkzWVdqM0VYSW5WMDBM?=
 =?utf-8?B?M2JXTm56OXhobnhHZUt2L2pvY3NPUFQ4ei84ZUsvUE5oQ1VFcUxOTGF3Y0k0?=
 =?utf-8?B?L3p0R0RpcVBSelEzRVVYS1AvRDl3WEpGdjlENmpNanUzTG1uVVZpMXZQVGZE?=
 =?utf-8?B?d2JyMzRUaVc5dDlJQnVCWFZvZ2tydE9SLzV3TEhKK09mMHJHMFdsalNDOTBv?=
 =?utf-8?B?N2c3ZmF2QURYYlZybkVmbDN1S1Vpa04xbld5MjZldnhuSUdZN1g2dkNrcWQ1?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aac5f5c-17d8-42fd-a87c-08dd3ee7b76c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 15:31:49.5144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdyT09kwL8do+aW+GM6/f1TERc+OTf+iKYSVZBeR7Mm0O8ySFsa2w5dbbzT5ODQBA+NjnN3xBBwPaZdpBqgcG/+xFsdsi0axuPSPqwYKOPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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

On Mon, Jan 27, 2025 at 05:49:15AM +0100, Zbigniew Kempczyński wrote:
>On Fri, Jan 24, 2025 at 05:26:25PM +0100, Kamil Konieczny wrote:
>> Hi Zbigniew,
>> On 2025-01-23 at 10:52:07 +0100, Zbigniew Kempczyński wrote:
>>
>> could you improve subject? something like:
>>
>> lib/igt_device_scan: Fix multithreading for Xe
>
>Yes, I can change it to sth like
>
>'lib/igt_device_scan: fix multithreading support in device scanning'
>
>because it also affects i915 even if there's not used there.
>
>>
>> > In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
>> > to avoid corrupting global data) I simply changed tests which
>> > corrupted device list global variable. i915 didn't use opening
>> > devices in multithreaded tests but this changed with xe.
>> >
>> > Device scan is now unconditional so we may change device list
>> > variable visibility to TLS. With this reverting of above commit
>> > should be safe (but I'm not sure is it worth to do this).
>> >
>>
>> What about adding Fixes: tag? It is not a kernel so no strict
>> rules here, up to you.
>
>I don't if any freedesktop issue was created for this, maybe Lucas
>knows about it.

fdo issue would use a Closes:, not Fixes:

We do have some issues in which the device "disappears" after certain
tests. They are usually created and closed as "cannot reproduce" after
some time.

I don't think we can point to any bug with 100% confidence it actually
closes it - there may be other bugs lurking around on either kernel or
igt.

For this specific commit (not the one before) maybe we can point to the
commit first using multiple threads, but I don't think it's really
accurate.

Lucas De Marchi

>
>--
>Zbigniew
>
>>
>> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> You forgot about:
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> LGTM so also:
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> > ---
>> >  lib/igt_device_scan.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>> > index 44b632008b..c36b0efa90 100644
>> > --- a/lib/igt_device_scan.c
>> > +++ b/lib/igt_device_scan.c
>> > @@ -247,7 +247,7 @@ struct igt_device {
>> >  };
>> >
>> >  /* Scanned devices */
>> > -static struct {
>> > +static __thread struct {
>> >  	struct igt_list_head all;
>> >  	struct igt_list_head filtered;
>> >  	bool devs_scanned;
>> > --
>> > 2.34.1
>> >
