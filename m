Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56173D0EE0C
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 16:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB0F10E542;
	Tue, 25 Nov 2025 16:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StH/5Xma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D855410E541
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764089452; x=1795625452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RDM3dyVq7o/VbEs7otTx58lQHpJiMP2pB3jlntCmm00=;
 b=StH/5XmarM0+a8SB1JqB/kGgaWOzkseI/ZlufyukBImwQilVL2UPlXSh
 OP8uB5xwqdsDSnFcrUdaC4JLEuwZESBQ5Mffcr1POhQJIP1SG0esfLdXx
 QW1ucoAVixSTIpBnksYkzMRdI88appHCNm1NRGowIT2AMBc03e2VjJLbP
 4G/d0OuggPTKLWRVafkp5CAzoosYORaqqSwkgvL0CFm6uhUiH2JrpjEvt
 glLXfBuglMFDOuA8UmIL67LYdKpLz1zGR6EHWZzVT9+OtLHKT4Eb0Syz1
 33ehvqgiaubhDCtKuf+WBvhh6+/jC6w6o058QGJdtvI28H6sGSUg0nsMz A==;
X-CSE-ConnectionGUID: z8tRGsSXTlivVPbJ5LV9Hg==
X-CSE-MsgGUID: p8cEoEnHTky10D5BjG/+Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69975610"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="69975610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:52 -0800
X-CSE-ConnectionGUID: r4WhfOMYT0iM1xGJVYcb9w==
X-CSE-MsgGUID: ZEMJdqVVT8Gx2INZNd4ddg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 08:50:51 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJETIlB4aQ6F5noH9onAQ58zJdj5mNBW+8m2kv/zDrJSeaF3QbZ8vPFAMBfKuvVJNkLtZmV9ZORskJ0KcAsGODYYed3/004ks9p1UoLv3j4dTzzGk43m+7oAPv1n55dIMmNeB6yAfxPcrH8YCeKjS/YENKEHYhzfHZJF9sVpR/VmXHzDegQlpfuJoN323YM7odGAQnj6rYEzLFBOnWrc4PluGnUIEl1jlQTUKumJY8x7uotZ19gdDh4XizJ/fA935SR4vn32Nn6F3h11D86g7CeF/BLBRWCIqsmxBYLO85eKwZ0TAyzw6bmVWysKa/K/PFLj5dyvk8Uk/lvFTQsYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ8NaWKJy2+0nIPmtp3JsABXx9f7iybZp6yn+qVlWR8=;
 b=Iu8xvDWf792xoBwQO0sXaYnsPX2VCR+nip9Da40+m9q7UVLjykSudv9v+QgsG8Gc2MXhe5TDY4NrjkLOWwNr1rqcSujnn2gJuaa90ZAYHRERY3RCaCy7uH+SyFQv1vwUvwIZznpvAHRJ0zWYhoG7SLFsl8lkUHeEEZufg0lHIvko1ig4DIuuI+ZgCjEqr4TsNO6T7iP14meEuYad8KaccDziFZTmRFUDgYsTTHP+6BCiUhmponeZNgJz8/w1gJLArMhCGoliNSD2JfBv07UUCrCiBUaHY/ImzAT3tFdwgdAwEQ0d8LqhypCfLRD2GVwuez8UFa/OcdZ8qjK0PUnEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 16:50:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 16:50:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 2/5] lib/debugfs: Add debugfs helpers to open tile directory
Date: Tue, 25 Nov 2025 17:50:25 +0100
Message-ID: <20251125165028.36533-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125165028.36533-1-piotr.piorkowski@intel.com>
References: <20251125165028.36533-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0038.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afe29e2-d3c6-4225-19ef-08de2c42c8c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTFqR1VraUkySC9CRUJnYzNHSHArVTc1MUhLYlJ5bDNOQ2l3V3ZPMkxJYXZT?=
 =?utf-8?B?dTFPSi9pREpBZjA4NVB3UUxIOXVXaEx1T2hQakpPTUVMMjJpQXFveUJIdG53?=
 =?utf-8?B?ZXRISW9aaGMzOVlLRVgxaFZtemZXd1J3Q0hiNGxka2RwT0xzQUl2Zkp1RU53?=
 =?utf-8?B?OXBlbjRadmZ4OFJuRkVIdjRMWUprNDlPaGxhMEkvTlR2UWNzeUNLUXJVcmZI?=
 =?utf-8?B?SDJVNTMxOEFtWlZLdXNSQVRnNEVUSGp6NmtGL2FUcm4wUEwydkxNTWFFWWcv?=
 =?utf-8?B?RXM0QnAxaXlzYlN6Y1cyanJWYXF0aXFKR2JKNXY5K0pNbXpkSkxETDdVam5D?=
 =?utf-8?B?ZFFmUjZhaWNjYkZMRWRQbmNvZkpGbTNJL0M1S0N6UGF4UGE0U1lhUVVKNEVQ?=
 =?utf-8?B?ZHExREhTVHBxQ1JFODNaNWUxMjRreFE5VWlUcGNaSlRNVlRERk5Vc1hHQmJu?=
 =?utf-8?B?c08vVjRJbnA1TzJSMkpNLzJZOXExbWEwa3QrSzVWYTVnK0ZzelFVU0dDdjRB?=
 =?utf-8?B?UWxQV0JKT3dLanFhc3krT0lSN2pNS1Q2TEQyeXM5Ni93MkpkR21KSnJLSG12?=
 =?utf-8?B?cldHRDQwOFpSMGlkSmFNT3hBOVZxbG9NWDNDZktIR2hzYVNQOGxLUnprRW90?=
 =?utf-8?B?YWE1YlJpMnZDMVNiY1pMMWhPLzhDekVicHVZd2hueFVOcFV0TUFvT2dQcXNm?=
 =?utf-8?B?elJiYmVZNk5MRWp4d21kUU9TRzR3RHJEd0YydnRudDkrTlRkY3RSMHd2NE1Z?=
 =?utf-8?B?YzJPeHpFT3plcUpzdGVtSENKSWFEOHkxTWJ6SkZxVGpwSDRpVUxtakZuaFEx?=
 =?utf-8?B?YkV6UktNeUVDdjZmb2xOdjEvVmIvTHY5RVY3a1R1UVBQckI3QVpNaFF1b3ZJ?=
 =?utf-8?B?WjRZT0pPeklPSk9iemJ1SmJ0YStMWUlnQXJmSHJ6WmpRN2R6amhJc1lQcTVS?=
 =?utf-8?B?YlNNY0QzdGdqNmtVZm02TDNCdHdCWVdveWY4Kyt2K2NXbUVXOS9HcFRBVFZn?=
 =?utf-8?B?SnZ2dGtpKzZwUFJrWU15QjJ0WW9ySWRqRGJCN3dOdEJoYUFBbzRFZkl0OG55?=
 =?utf-8?B?amhvVzQzaFBSNk9xUVlWemk3eXNVeFZzOGRHdkNNV0xybml6SkY1bUREdVNI?=
 =?utf-8?B?UENmNzRhNTdjQnNGTzlhdmJuelo1NVhGZU1ZTFNzUzBab3NPWCtNVXNIb2Rl?=
 =?utf-8?B?VVlwc0tyTlpqbTZKSjdCcXFhMmFvMUsxa3pFR3VhcS9Nd0NNNlBjTTJOZ3cw?=
 =?utf-8?B?ODZrbXQrNE0vbkxtMldNY2ZRZmZ4QVBzZ09VV1k4THB5MlNtZ1J4RG8zTUo2?=
 =?utf-8?B?VkpwdUZZTlJhUjVpbUYzNDNqSUcxYk5Td2NBSGhqWEh0OGV0V1I0VjdqTlNr?=
 =?utf-8?B?UmtINExpTEo0UkxrM1duUVVnZ3pBK2cxSXVndU1uZFhtNCtkQ1hKREdOOXI1?=
 =?utf-8?B?VUxiVHYvRVNLRVRxVERxODZtdWQzb1BEUFZPdjJzM29Ga2J1c1lITVJ6QjBI?=
 =?utf-8?B?REUzZ3p3UjBieUp2Mlk1RnVzazJsTzdRSCtBRmNSZ0NKU0pOUVFrYkJxS3FD?=
 =?utf-8?B?V0xvSWE4Wmx4VU9oRlFralBIQlJ4NktDeklCS3YzZkpwRGE3WVdiay9HcUdM?=
 =?utf-8?B?OGhKRVlHbmxZejZoY0FkVmptQWx3cFhMbnFtaFBkRjNKREQ1aHNtT1lsQkNK?=
 =?utf-8?B?Tm1lWlhScm5lSkliZXBTR3RKREszaGxtNHAwNW1rRmJJUDU5a2wzQmhIalpp?=
 =?utf-8?B?RURGa3VrRXJZNGxPL3lKNHRTdUJweEhqS2VtbE1lbHVxaE1VSG9JZGdOSTQy?=
 =?utf-8?B?aVdiSG52UWhleFZlejZuN1BnVjlsc2F0disvdUhpSjRaeE1qOFJGenA1WVRj?=
 =?utf-8?B?T0lsYlEyU3Uwa2pCeDVYWnRXemRBRUlyVTJyaDNrMXNTOU84ckVyZER6V05S?=
 =?utf-8?Q?jYWdtPeFWEgpsq2ph23MhnmhE66S2X7i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3pzUEZ3QmtSQXVSd0x1c3ZoZ25JWE1XcjZFcEJWUE54RnRNZzNkWEFlRWp5?=
 =?utf-8?B?UVk1bDVaQnpiMWxDRThIQ3VQVS9UVmJvWWsyd3VMSDdBWnFraGhOR09YaVA1?=
 =?utf-8?B?K3pKcGpjK052WmQ3TDN2S0pXZSt0MXBOYjdEa1RNTy9zVUpnaTc1aVRDd0Z4?=
 =?utf-8?B?aXNPdWJPNFl6Q2FHNlozM1pwVlRKMXNTZjQ0bTc3UUFMejk4UXB6ZE40by9F?=
 =?utf-8?B?TWpUVm1TeWxiRjJHbEU2anBWTVk0dG1ZbFBtcWRHRkJWQlNpNGk2enk4MlJL?=
 =?utf-8?B?ZmxIOUhWbnRXVE9UbWkxcVVMYVpwNXg5RGo1UUJuYlUvM1VyK0EzL2NiZ0hh?=
 =?utf-8?B?NnlTWENjM2RQVzR5RjVBRlJJMXhjZ3FKWmZwWVgwSXBpTENHbjJrRDNXcVh0?=
 =?utf-8?B?OGhkdFlDZ2FIeUtuRit1cHJpdnV3VGV1NDRkNlo2T1prZHBIOUx4UGFGM0Vx?=
 =?utf-8?B?NFBIb0R1aGtRUUJUN2NoYktmVmowQ1hQM2xaZHdORWFDOEsra3hNbnN6Ym5v?=
 =?utf-8?B?RVIvSUswT09jbkN1ZDErNWluVldkWWtIQTd3dHZjdjA2OVpRQW9XUEl0alFU?=
 =?utf-8?B?ZW9BcHJMOVRjTE5IcFpnSklKcTYvMUZDZ3dneTBvNmlpQTIwU0trSFI5a3BC?=
 =?utf-8?B?Sm9rUzlVQUpzcVhLQ2VZNW5yTVlxbm5saUx0Y1V5YXM0ZkFhOHJZTW5UQnRs?=
 =?utf-8?B?dVV5WEZFWjZtS1FLVFB0Q0JQK1p5c21KZTRjV2NFdFRMR2h2VnRwbFpZV2dz?=
 =?utf-8?B?YitBb1BKakNlSHlpNjlKN25QTGFhZmZHY3RTeS8yODNFN0FoUWxMdFVKRVVM?=
 =?utf-8?B?OE5HUFFUZFdoaUxIUDM5UjZHcVRsSUxSNHFtUjJuelMxTFI0NDltY3hzREIz?=
 =?utf-8?B?eVp2Q3BnU3RYalcxMlgxbFNUWTVDVmhROHlFekNCRisvK29SS1BOTXBoZzRa?=
 =?utf-8?B?N25nQU13YjhBdWpFWERVRFVCYWdpRk9veVVJQ3ZIYXM2S3BlbE55ZkV3UHVP?=
 =?utf-8?B?L3JoWmZnK2NHSlh3RVJWa1hMR2h5ZTI0bUJkUENFQ3oxbE1NeG5oanl3YU9w?=
 =?utf-8?B?RlNHR3JrbXhUd09IK3ZZakdOblNTdTc0ZE5lV2srMTh0TTg3d3gyWG15RWho?=
 =?utf-8?B?Sm1ST1M0TCttWGxSeFpRaG9vZ0JBMlBqa29LZUZQVU9zYytDREoxS3hVSGR5?=
 =?utf-8?B?NFlpVFVvKzVvZUllZ21DSUJEZ1FtYURGVWVmREdFUWp1QkY3V25tZUJzRW1y?=
 =?utf-8?B?S0l5MzF1NU8wOTYzelgwbW1qL0NWdkZwWjVnMmVHdklIZkNTZWlpVTdFS1Ru?=
 =?utf-8?B?c1RVcVpkWkdnSExranNmTUZURzFLeWdyRlBUaVN5MHBKQ2hKQTJvQ2IxVSsz?=
 =?utf-8?B?SjVMWTdFOVNNQ2FPOVBEbXg0OEFTS3pzKzkwQ094dXhISUJsMm1ISEZWWGhH?=
 =?utf-8?B?cTBMVG9kVGR0aXNqM24yVmNPRXRpSi9mazhjTkFMUm1kQUNsY3Y4cXZtT1JN?=
 =?utf-8?B?ekgzREhYWnhrN1J1MzhnR0J3UTg2UTd5azRzR2FJZHcvSFJ1SVNsUFVBbFZB?=
 =?utf-8?B?RFJtUVdSV0xQWWRvNmxOS2RaMGc4Z25DNUVSbVBTZG9EbFg1NVM5UTNWQTh5?=
 =?utf-8?B?V1JwTExlZ0dZQmh3STBPMFp2S0R2VExza2VxQzgzenk0aFFibzRhR2MyMi9t?=
 =?utf-8?B?Vk90ZE5Manp3WGh6SzdrSzM0RG1qSnEyN2JJTkVwMU03cFQ5VlNKVWVrUmdU?=
 =?utf-8?B?R1IxOXNtUTM0RGtzYzhUaW5wQXphM3JBN0dJT0FGZkxhUmhMSmZBMzdIVkVi?=
 =?utf-8?B?Rkd1N2JLck13RjZFL0xiQjIvNWdZR0xsWEJxd0hiaXB0QVh1RzNEd3ZocG0w?=
 =?utf-8?B?UFpBbEhTTld4R3dSSU02NWVkbXFCUlRlUUZ5MmtkdERLOXNBQ0xjNkxnUEFN?=
 =?utf-8?B?N1JTRitweGtvZTZHWHlBS3J6c1dTVFR0QnJ1ZERwSFNUK0pkTE1HRk8xbkZh?=
 =?utf-8?B?Q0ZOaTd0Rkd6emF5cTRTVmNRampPbDVtSHhsc0phcitSbytDQklpMWlQNjQ1?=
 =?utf-8?B?ZHNyK2cvdkNKazBxenpRZFcwZVhtUHBBVHFPQS9udEc1dUZKcnRCY0hMZzNq?=
 =?utf-8?B?Y1ZXS1JNOTlZaTR0bU11Z25FSzV3emU4NFU5bFZhOTZRd3pld1QvcFJUd2ZQ?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afe29e2-d3c6-4225-19ef-08de2c42c8c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:50:48.2645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jrYajW+we4wOuLx1FIEJCXPl6TKPpgAALxA5UmRhtAv59jWD8W6hiQusjT6E4Fv4Bw3Nc/enaaSJxGue7tlqUXlXJNIpoTIEKhlqVtI0/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's add igt_debugfs_tile_dir to open the debugfs directory
corresponding to a given tile index.

v2:
 - rewrite use of snprintf (Marcin)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_debugfs.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 210a9cea0d..e95c4ce682 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -226,6 +226,37 @@ int igt_debugfs_gt_dir(int device, unsigned int gt)
 	return debugfs_gt_dir_fd;
 }
 
+/**
+ * igt_debugfs_tile_dir:
+ * @device: fd of the device
+ * @tile: tile index
+ *
+ * This opens the debugfs directory corresponding to tile for use
+ * with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_tile_dir(int device, uint8_t tile)
+{
+	int debugfs_tile_dir_fd;
+	char path[PATH_MAX];
+	size_t len;
+	int ret;
+
+	if (!igt_debugfs_path(device, path, sizeof(path)))
+		return -1;
+
+	len = strlen(path);
+	ret = snprintf(path + len, sizeof(path) - len, "/tile%u", tile);
+	igt_assert(ret < sizeof(path) - len);
+
+	debugfs_tile_dir_fd = open(path, O_RDONLY);
+	igt_debug_on_f(debugfs_tile_dir_fd < 0, "path: %s\n", path);
+
+	return debugfs_tile_dir_fd;
+}
+
 /**
  * igt_debugfs_connector_dir:
  * @device: fd of the device
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index f4044d5458..76dbff3e8e 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -49,6 +49,7 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 int igt_debugfs_gt_dir(int device, unsigned int gt);
 int igt_debugfs_gt_open(int device, unsigned int gt, const char *filename,
 			int mode);
+int igt_debugfs_tile_dir(int device, uint8_t tile);
 
 /**
  * igt_debugfs_read:
-- 
2.34.1

