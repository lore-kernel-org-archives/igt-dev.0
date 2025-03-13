Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8874C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 04:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C5510E061;
	Thu, 13 Mar 2025 04:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkRimAS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2EE10E061
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 04:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741838711; x=1773374711;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6/jv34BmmI84Ch53C7Ewy+xfaOnDZV4A7ldhTzev1N8=;
 b=QkRimAS6JtOxv6OcLe3p/WElb/No9B7CVh/YX6dJZDg7vQI3A/jQM1u4
 YN2l+dthtb3A97KBkbp6ALvjgKxIkNXkhKWiUuYRch1iHhsGZ7L78Cdis
 gQCv1vhX28uE3jVv0LRdoUqBC8VBQScR4Bg+rU+fZk71DqFr/l3Xq3j1f
 kTLXlsSdDHn6YU6RQdSysiw2ClAWbktpgjegi1A7t9Uy6Nbqh4Mvpz/4T
 jG8XdKw/1GR8268Vgq81lp0R/nawMn1SLO82yCSM47RTwmBUvzj0GhDtG
 PAq9s6Pabn4rlMbmNygRuF0y/So79AoOqZ2Z5uE6+H9oYLnmEp5Zzcgdz Q==;
X-CSE-ConnectionGUID: rJLdJh29QEahjLJTB4wNdg==
X-CSE-MsgGUID: FtGQaF8mRE6yMBOvSNGh7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="54311032"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="54311032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:05:10 -0700
X-CSE-ConnectionGUID: Rjd/t3nrTfCjU+ORcc/nDg==
X-CSE-MsgGUID: eeXXXiCeSraiqeIKHDIauw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="124991845"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:05:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 12 Mar 2025 21:05:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 21:05:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 21:05:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2OdaxiLUPxT0oHQtrZKK76yWtsidL98CIftZKkIbzwaRoltf8bL+Wvqpqc4Ucoym2hKw5dVg1fn5I1kd3uHK8bzU2fwBUbl/Yd2yOQ+bSfFjm3xR9z5pzV8etSvLrvjoU/IN5V1t6WvmHJPv7Ru1wT1A9RgSqP/1c9XwnybDQDzCw0PryMdEgixCy5ark1drTTyjOFeQ+Orm3+/M+BDLYUOc9pevGjnPEvtCoqRXi82aEkmCEmmmM1JzJAUMrIZS6owg76+lAlagv3svinEkuyNugIrmotbABE0kEOZAomgExkv1E+yrXYjOTOlO8bvf+NJ7vvyYrb77m1+Fi6qEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/jv34BmmI84Ch53C7Ewy+xfaOnDZV4A7ldhTzev1N8=;
 b=QcieUlwr/zhvNKcQS0d3cGec9O43cdPAOT6ktlPe28A2PdZlP8nyLke071FTGyLTOdalfcYn8cp32LJz2BTqhp4lQhWZzER0NmZsD+CD0baFp77eiSZ5bpIhJZMWxLFt4betTeueyjYLFQvcwHyI3YiXaVCsdgDkItdfAe0CG33VJifiTOS+WtdKmnhKA61b6Ddpan0WWdPyBof7QQgr1iyhAEMMz/Fp5+ul5nA5MXkFKuNIq2vWsiHAHI9rM4YIqz6IwKE0T2+27iuig6ydMF2E+QfnppJ8D52Nb7NA0IaqrDLe1qz8Qg91ue6YVTMiKuvAvuG6r45aCrSaQaVHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 04:05:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 04:05:08 +0000
Date: Wed, 12 Mar 2025 23:05:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v3 4/6] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Message-ID: <zg2bzlqm33ngjtskvhzricd3fdgukxbvvkmmw5vk6i7jjajnf6@wwjk2nm7a5g5>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
 <20250306101041.26827-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306101041.26827-5-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df18550-f865-4e4e-1ad7-08dd61e43e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YitJdTZoeHJkL1I5cGc2cjNueXRvVHpNWXlFbjhvQzE0N1IwNmZUR1dFOFdS?=
 =?utf-8?B?ZVczK2M4STN1alAwVVNUMGFTeDhvQVZ0ejVHWG52RW1RaitrNzJmSzh3YmlB?=
 =?utf-8?B?S0RmOXNGUjdqSG4wRmZXdmNiS2t0a0hDTVd2QWwzdDRuUXZ6Wm12NVNoa2Za?=
 =?utf-8?B?SVlLREVoSHl6TXlLUW1EbnprVzdyeWtWTVlzdldHNjhTU3RiVXJzcncyRGdv?=
 =?utf-8?B?OUxZeWhOamppelBqSkNZK1p1ckczcTBvNkdHTE9PV2N5Qkk4RWRpMEdEWC8z?=
 =?utf-8?B?ajBPSlh0VU5GRjdLWEpIUnJta0k2Lzd0eDZSYmNtdzVOU3BESjRJdU5odjIv?=
 =?utf-8?B?TjhNMittMXk3enExbGZTOWNqbDhZU3RXUTd1aWZoSW9vc09WNEFjOWxHTW8w?=
 =?utf-8?B?eWRRQ1ZLaFpQWituUUYxdnQ1NXlRMU9ySFFIeS9HdWtDeWdzdm9ZVmw1MmRp?=
 =?utf-8?B?ZVEyTFRTcmkydEgvOTJlQUwyK1QzekNaR2VBUVRwRmxXbk5IdTlodlUyVWF6?=
 =?utf-8?B?UzhEb2tTVittOFdBdHd5WG9rdWtCQ2pObC9ldGNMZ2Q3RWFVQkgvS3pmTHhC?=
 =?utf-8?B?VG1tdnRIN0oxUFRZdmFObUxuWk9oM2hOTmdQem1za1RjVUdRSWN0MkhaMExx?=
 =?utf-8?B?Mlk0eDViYm81MVNCU1JZcE1YcTN0cldqZEJtVGNGeTM0R2JFUitZSC83Z1dY?=
 =?utf-8?B?UzJ1d0NGOWtpd2wzRnhOM3hyd0huNnFJNFdUTFRXSmVRNzdMUnU4dERIK3pE?=
 =?utf-8?B?d1BSSGRFd2dBMWFETFUrRTRwL2RmZlE2U2htamQ3Um1CbHZ4bGdWSklURmdF?=
 =?utf-8?B?RnJrQ3ZGVHl2VmJodlJBbWtkRHF4SVZ4WmxKdjJJYzNKUVNFY3JVaXBoN3U4?=
 =?utf-8?B?SUZFWjVvaGlMcFFqNWk0aXdVNlVmaThaNi83MUdNWHBLc1VIYThPem0yNmZh?=
 =?utf-8?B?TUtQRytqSG5YSThoSk55RXU1MlVTdUVLVFNWZEpaellwcTNPR2huY0lxVmk2?=
 =?utf-8?B?Q1phYnJGV2VCK01hZjNodjZ1YVV0V1dJL2hXbit3QU85ZW1XSWY3TzA0OFJY?=
 =?utf-8?B?VDVtaHczK3d0bXRYcFpBT0JWN1lNSGt0TStTS2ZPTEJLNEJWWnFlVTFxRkFW?=
 =?utf-8?B?NzhKZXp2eUNjWWkvR1VzNnRBa1JrUjcvS2tqUjJmcENXbTdmZTczMk1uRWNU?=
 =?utf-8?B?N3Q1OVpDdVd5RmQ5THJkdW15WUs3bnNjZ3F5VVkyekxDN2JMRzlkcEJzSGNZ?=
 =?utf-8?B?MW5GNCtGTnZtTllHUFE0TmFJVmJCa0NuOUZqZXZ3S0dNV1VMK1hiUjNIMGE4?=
 =?utf-8?B?bm9VbGE3TzdnbENJd25MbFB0OTVCNVdBbGxtczdHTnZKcE12Nk9wRDE0dmp2?=
 =?utf-8?B?S0Evb1QrUDl3ZkRYUHNkKzE5Y3dhbEZKSDZEVXIyQ0FDaEVjUmQzeUxJL2Jh?=
 =?utf-8?B?NTd1ck5oWm9JMEJNSHRCOGFpK1pnQ0txa0ZNb0Jzdm1kTm5XeUxXM2RSR0JI?=
 =?utf-8?B?aEFrcjRqZGJGUTBQWHhsNnJVZW9ESzMwMGJtdGt0dDhrbWpGd1gxTFRzVkx6?=
 =?utf-8?B?c2JqZzVEbjJxVTlmcHFEOHpoWVpvY1VoUkZvOElLTlZSRWdkTzhwejNEOXhp?=
 =?utf-8?B?QzVkVE5Rd054cHJYNlpoKy9EeVozYjdlOE1oeUVheGJycXVIWThDVGFHcVBP?=
 =?utf-8?B?Q2plOTBIeTVLWDJlN0ZWeG1JQU9QVVhORnZYZlVBV0x1UXViVGExSDlrKzZQ?=
 =?utf-8?B?a2JWMHNuekNWWElwSlRPOXhnQTh3WVl4bk44aTl4T1pnTWNVcVRvTFRSRVNG?=
 =?utf-8?B?VC9CVXZHSFZjSkZ2eXI4U0owZDloOTFBdHczcUZRNktSVXZpdkZaYWZVVHNW?=
 =?utf-8?Q?I7zVb0NFGSyNi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG14akxoaGt0YitUQzZtZGUvbGt5MjMreXo5bm5nOGJNWFlnWTFaR25oYkRX?=
 =?utf-8?B?bVdCTitoNlFkbGQycVRlV1d5VDNmWE42WTZZbXlwZ1IxUTFBeEkzKzJMRWt5?=
 =?utf-8?B?TzlzbmMvaUtVRFU3RytiZTlYRHBPdDJub3NZVXNWWEhZOFl1NFlVQkdlMjND?=
 =?utf-8?B?ZnFBTWRXMHhaYWVSSityalQweUdFVFF4S2Vmd0JIRmdVNVdsQTB1RVVQL3h2?=
 =?utf-8?B?d0cwbHVWWHdUTVl5ZGxZNEUrdXZuNnZxOW4wK2JhMzd1Um16cXBjOGhoMTNJ?=
 =?utf-8?B?VnBPeUpOWDdoNEM0eXptWjZuU085ZUZVWk16aHAramRRS2ZWUnZ2dEZXM3Vx?=
 =?utf-8?B?NUdCa0JsOW93bmo1Um1reXM0MkZtaTA4SmpuUlovQUJHVlpJSi9KTUt4OGRl?=
 =?utf-8?B?OU1NSE8xZDlMNjlSRmc2d3Z6VWtKekQvcDlYMUhMNzg5Q0FQbkxvMDNJd1hC?=
 =?utf-8?B?eUlZS1RwOS9BQ0xYR01FOWZrQU5LMWkxejl6c1d3OEdFR0JQLzhXUTJ2WllB?=
 =?utf-8?B?TndxTTF0bXk4MWNaS2tKMk1FSzAyMmJHRWdob040M0J0TjF2ejNwY2dYRzBI?=
 =?utf-8?B?UkI1UlM1OE9pcFBoRFdSUmFaL08yd1FKeGFFbzRuYXV4Qzc0M3JLZTQxS3VL?=
 =?utf-8?B?d1BOQjcxajI3UDc1eHZUZnA5WG85ekFQL3dwNTlxZnVFU3llVkpMdm8vVWc5?=
 =?utf-8?B?S2NJelFncHVEYlBTcHdIYytmSW1yemo3TFR4Q2c4MkpKR3krcGxHVldvaWdR?=
 =?utf-8?B?R0pwNHczVHlhb3hubmgzK2FRc2RNWTNhclJjZjFGY3JQQ0Y1SnJpYytPTmla?=
 =?utf-8?B?eGlEYjJ3ZUR4T2V5dksrQm91cCs1d2hmUHhJWis3WU5oZ2xnS2kzRFhnNWNC?=
 =?utf-8?B?MXpydXpiRTJSK3Z4bE5Jb3A5MWx6RHd3aHJ3cXB6VTFyWTM5bWNpaHJZMjgz?=
 =?utf-8?B?UmVONXNnQjdIOHlWZVc2SS9OMWUrazhqVXVFWWx4aitkSDlGY0RkdG9SMFh5?=
 =?utf-8?B?Nm45VVY2bm9CTnFXWGxodGxkWWF2M3pTdTFkM1pzWjdBYkR2eDh4d2RPd3RJ?=
 =?utf-8?B?d3RlclV4MUxXWGRTOTltWGwxbTI4citMSks1aE5jZlFDY3JhVnZTZUZ5TnJu?=
 =?utf-8?B?Zzg5VkZIWHJBZ0ZDUytaR202WEQ2ZEs2MXVxbnVQdVNlYSsyeEF0STBhRDd2?=
 =?utf-8?B?L0JyeFF1Z3VXV2xBT1RpejE2UEExSWxWcXBFZ05RR2syVGJHbDV6MWNwZUsr?=
 =?utf-8?B?OTJkVmt3Y3pqQnFzRkFKR3cyZWVNWGdtUUxzODhZRWtDbzBWazJrTzAxOVJV?=
 =?utf-8?B?M3BKYXVCUUF4NitQRlhid25vUnVMYWk3bTZKRFY5WG5nbUpvdnFjcnhoWTVJ?=
 =?utf-8?B?SmVXMHh5aUo1UVNNWUJWditRbFFuaDZLZTdEM25heDU1SnZqMVFsdWsrWjNn?=
 =?utf-8?B?Q1VFR1RkaVRTdm45bnBKOHdiYVpELy9oa3FwT04zVEVrdjErRFROQjl4WmNK?=
 =?utf-8?B?TFpKV1k4SFRubitzMjhtZ3pyMk1CV0p6SnN0ZGlxSDhGSlQxbnBFeGk3VjUr?=
 =?utf-8?B?dUpoaG92aExSK0xLanFVMWxjTEhZSkVwczB6bk43bkUxVFNUNkJBM3d4anJJ?=
 =?utf-8?B?d3hwYlVWSHllQzRxVEpSTmVwUy93SUtUcUNISTFhNWxLOGp1LzlPT0lleHpn?=
 =?utf-8?B?MmdQc2xmcHcwTkpmNEpKeFEySStjUmltcUdPR3hFY3pwUGJYbmk4SHJxZ2Mx?=
 =?utf-8?B?UG9LU0FUMWZQekZKUkt0bTdOdDJjT09NMjZPVHJWSVZDRURoMXRqdWgvUzRy?=
 =?utf-8?B?WThlYTlvQ2ZaSjBwMlR6ck10TWpRMFNYdjRpWE5NYlg2aTRPUUVDZGM1TVRO?=
 =?utf-8?B?MlVnY2tOb3c5WjNPZVlqUzNUV2c4cEJkZklEOXV2SFdjRCtMMXJ3UVJNSmRj?=
 =?utf-8?B?T0c3dWZRcE1kRVJaUnlJVE5UblpmNVN1cVVyaG54NVB1MTAxMkt6ZlMyRDhp?=
 =?utf-8?B?aTc1S3NHZzBoSkc1MUh4QUhCUUVITkVkbkljOUltK2dIR25CZkxGcmVYazdm?=
 =?utf-8?B?L0s0L2FyWHEzN3NsZWI3T3dTWHZMVXVmZGhzNjhWdGpqTEV5NDhTakxSSEsv?=
 =?utf-8?B?WjNhbkpoVXd1KzJ3NFJEdGc5VlhJR0t5Q3NUMDRHSk5iN2JjMFRLUDRFTWY3?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df18550-f865-4e4e-1ad7-08dd61e43e2e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 04:05:08.2165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwgyjGJYKxKBZoz30E7d63zgaG1FqGJv2Fnd7U7sWQkD6E3GF0bbxcd8FCFS9rpw2ZYBp3v/zVdE5i3Ss4BQSWx6djbUNuRRIe24qClKF/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

On Thu, Mar 06, 2025 at 03:40:39PM +0530, Satyanarayana K V P wrote:
>Use the kernel fault injection infrastructure to test error handling
>of xe during driver probe when executing xe_guc_ct_send_recv() /
>xe_guc_mmio_send_recv() so that more code paths are tested, such as
>error handling and unwinding.
>
>All xe_init() kind of functions are called just once during driver probe,
>so it is sufficient to fail first/all calls to them. Driver communicates
>with the GuC multiple times, and the real failure can happen at different
>call, hence the need to inject failure in GuC communication functions,
>like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
>all calls, but we need to be able to select specific iteration to fail.
>
>To address this problem, the environmental variable IGT_FAULT_INJECT_ITERATION
>is used. If the IGT_FAULT_INJECT_ITERATION is not exported, an error will
>be injected in every possible function call starting from first up to the
>max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
>as 100.
>
>Error can be injected using:
>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
>
>Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>

this patch using the fail_function/space looks reasonable. I was in
doube if this would work for fail_function. Good to know it works.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
