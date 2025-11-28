Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD5DD116EA
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 09:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6CE10E75A;
	Fri, 28 Nov 2025 09:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfjyJEnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCBB10E75A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764322163; x=1795858163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iPOwWQADotEJUr/Ski0Duy9UAc+rYjZkjRKVpM7Up/Q=;
 b=VfjyJEnzyego7FbOf+pAIaqERiNmoc25Xwd9JreoIyNsTzJZSP1aJ9ht
 N3xzzgH0dZfvnOIweic9CfuzhiOaAmBZITHs7BEAKJdQbulj8OmpkKX1O
 gXDELnXFZKUPlu3UoFMKgOz9O1zud5YsjXNx2zDHeJ39/Gw6yFfT1ehBi
 Gdgh/3r4HMQ5bsn74w7h7nmcXxWXtM2RdYaDVzpXwjbLiazbqyC+nTic7
 qcMM9N51cNWxhGNeRApCOxZgYZ1Cm5tgyWQzi1mhzq+iJM4UUHFx7J/0l
 rJczSaLcAN3+YWCpld+1rtcMHhu/LD6vfu4aWyBM+Cy0kf4ao2vRiF6Th Q==;
X-CSE-ConnectionGUID: Un/upVXBQDiGjRcplC2sKQ==
X-CSE-MsgGUID: jHSpVtfMRrq8w+cI+pmfiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65543137"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="65543137"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 01:29:23 -0800
X-CSE-ConnectionGUID: 29npWApuSnyfSFNxkS/Rwg==
X-CSE-MsgGUID: wPjFiTcrSVKcb3PTsp/Ggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193520306"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 01:29:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 01:29:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 01:29:20 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 01:29:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LByfYaoDNoS++jnw8t2+gWzbNOW+G6ymJa5k8Ha8o7yYlKLPKcsI8HmKGcULhb2LTiUKq7ApyCil+uZpIciCItMCNvOI0EYByRqU8IDaxZp1A5APquQidYvT0sZcV0C0rZbvpt6tV1v9J50nCkyT3/QkFEmFKfTf2mVe5ZP+VSkET2IuyuHfxfdsMheHI4BgKRlJYj1c+meuwpG5FT74Rkw0BOG9GIQ491UcUqS4/lhBYV16OrjbbceLRBL/cy0zqgtIBzL762yC14dVz+H0UOIhXMKs+ttpgWn1uJKnUKQt7cZSpFDFOdJXhanx4dSXcvEpy8ZOdjZYzWErbpDh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KZoTN+32B3YV3PwpWG0/Xkhu/4LSKXeqOpJNr5hQmE=;
 b=KcZUlnBAs4sQzEGKVaSIJgdfPEGGKbY29tSkucfM2PucEcLycrZvPcgUNmFHKLeJdE/+XjJSvN+noaHAZ4C11TnE0Fer+2c9ybaIRQX6UcLFTGynUmzZxvx//TmOn5X+smBBF8CePkqM8/LrsAobilg5oPltM2bZzOE23L0Yw5iiXFvvilUjolGUp+lL0ApeJZqHLxXE2pC3jyCiQK4EM6ssWrJOBDxmjR204nNg5DEGXuy/+fLI8wT3vg3tA8+JDzMBzEYWaXsQd9Vlwo5W4b8tL/RGA2jrS5FJeULtZ+yuGEniKHEHcTQg6ixSzq2WXGqmMmVbwp2OV4pgBZqJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.14; Fri, 28 Nov 2025 09:26:54 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 09:26:54 +0000
Message-ID: <cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com>
Date: Fri, 28 Nov 2025 14:56:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
References: <20251113124936.3878794-1-soham.purkait@intel.com>
 <20251113124936.3878794-4-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251113124936.3878794-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0036.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::7) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 80837268-6f21-45bc-7600-08de2e604482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1VpSnBEREpLSEdKdjdvc25oRXBvS3BIVUM2WktrdEg4R0VxT0U0K3pyZWRT?=
 =?utf-8?B?b25LbXI0MVhMUTVseU5QalAxeTY4TmcvSk1ES1loQW11UEszQ2w3akdSOFg0?=
 =?utf-8?B?d05GUG5CaHpkd3RhT3dhanNZWjliSWxRKzJpdUVoamR6UDY0Y2dkZXJyU0gr?=
 =?utf-8?B?QXFMSC9oQUE4TWRxbTY0T0dyMUNHcVJ3WTloS0s0dXE5aytoOHptUWxOU2kz?=
 =?utf-8?B?ZnIrRGZwa1YzSmkwSGU5aDcvY2I5V08wTjNRNTRGQURTN245V09FTmQ5QUtB?=
 =?utf-8?B?TllQajZiM2lhZTg5VW9zY0xZdndLV0lYN2FMbDZDeW5EWmh3c1A4TFpmWkp1?=
 =?utf-8?B?MjhjcGhhSDFONUhrMWhlT3FCRk95V0ZsbWZXcEs3bU52SmVYZ09KU3ZseUNs?=
 =?utf-8?B?U2gvM29jb1VhcTgxcEJiV3NzaVFjRU9NTVFCN2RhNFJ3RkVQNUo2V1IzcGNw?=
 =?utf-8?B?UWhYd3loYmJhV0dkNkRJQUtaN1RBbm1UN0xNL1ZucDgxZVlvRk94aDBlOHQ2?=
 =?utf-8?B?a3hCQVJVak9tN0NJcWt1dXFZR2NITWhoTFBhcFBObVYxWGJRRVZIZFovbzRx?=
 =?utf-8?B?RXpnMTZpNGlBakxUU1Y0SG9CM2xzblJlbTdITGRwdllPZ25DWERQeS9OeFBB?=
 =?utf-8?B?b3ZxV0lMOXhLZzh0M0pvbjVIblFZNXh3VlRaWS9XeDJHcVQ5WE00c2VLK3o0?=
 =?utf-8?B?WnFtcEY4Wms4ZXU3YWFkY2c1cWZGa3ZnMERZR3NkUGU2a1diU042dHBmM0po?=
 =?utf-8?B?dC9MSVg1eU9nWFg1T1F1ZVZFMm9LWDhLZHVpWGMvSisvVkNMMUl6WCtJRHJk?=
 =?utf-8?B?UzRJL0ZxUUMvSFJvU0FQc1MzTGt4UWFhREVvd2R1VDloeEFBcU96NURVdDkw?=
 =?utf-8?B?VU1NUHFBQ0x1Tm9lRzBCK3hxS3lmTTZleFlKWE1tZmVOdm9DVk53cVVXZzhJ?=
 =?utf-8?B?bXRaVEVrRmwvY21hUlhZNU1lU0EwczJXdHNjczFZN0FTR2V2YjJlTU9WZENk?=
 =?utf-8?B?U0JwemplRUtFVmo1MW4zMW54NmVHeVp4Qk1KTllGdnA4QWxaL002R3VicG10?=
 =?utf-8?B?S296ZVZqOEZxVHpoeThXZHVCRkgyTWg4eGF3cURielRLMG95NFJOSXRIMjhj?=
 =?utf-8?B?Rjl3ekR4Z2V3b1lia2FBQm1CTEVHcUJqLzhQeHlsQkphU25oSXNwejZYYjJU?=
 =?utf-8?B?OWluZUZuYzFESm5RV0t4b0RlZkVlS3BySGlLVmRsWWlVVHNHbnB5SEJyaVI3?=
 =?utf-8?B?eG1RTDZuTnRibkxlZ3AzcnBBQTlybE5GRjRnZFpScm5iR2hJU29GZXdNTVVO?=
 =?utf-8?B?cE5WZGxUUklFWjNQK1pwdXBTT2dJK1NpbDI3TFhJSXlKY2t5UTZZaEpPQ0ty?=
 =?utf-8?B?cnB6ckVYVUY1L2cyem54cnZ1VXJEVkxWVCtqVEFXTmptTzVJTXVXbENGeVJL?=
 =?utf-8?B?Y1cxanIxOGEwSWJrWm1mUXR2QWxabVdMc0g0MEp4eXlJQmxkM24xMU9NSFNs?=
 =?utf-8?B?ZUcrV2dLNDJBL2VOL1h5UVg1MlE4U1BiMWpRd1FoUG16S1d1a01LbHJpdlJC?=
 =?utf-8?B?bllhZFEwZ3gvN3AyR3U5WXpsZXZudzR4b1ZuNDlJNFBBMjlhVnBYTDY2OHFU?=
 =?utf-8?B?N2hseGlRV2hJRHYwY3lWQnpXbmo0c1dRMTZjYms1amFoWnVtNWJONXBKTlk3?=
 =?utf-8?B?V2F0Z0VvS2cyOFl5cGJnMWpZMHpvZTNMUHM5bEg5eHdPaWhjL0U3d2VpUXVq?=
 =?utf-8?B?UmxodTQzOWdrSVZqU092RXQyMlJqcG9naDNlWVJYdEY5SmlSZXBUV0VsaEhv?=
 =?utf-8?B?anMyRnNTZThYeE53QXZIWjBaY2JUNm1PeDBIUkI5Wmxnakg5UUFDTnFSTXNG?=
 =?utf-8?B?QUtrRkdxektGbG94cFpBdXQyMjRNYkpVN3E0Smt2MEZPcWNNSStnUWxXdThE?=
 =?utf-8?Q?4MPS7vq8ZF0puqmB7sbYzc09ihouuoDD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdEdjlSdGxrKzRnQzl6K3YzM2J1clNseFFUejRiMUk2RmNZMDJUc0NxdG12?=
 =?utf-8?B?azJlRTJBdUFJV0NBcytFRlZySGUzOUlxMFdhRzN2L2dpWWFUbmVzZHlnTGVI?=
 =?utf-8?B?ZU9JaHArajhwSERwL3BPSE13dUtjZmxmK3d6b1JnUkVHTTVLRUFleXI0UTRm?=
 =?utf-8?B?ejhERlA4NSs0Y2ljSHJaT1RkWVJYK2Zld2x0Q2ZUOTdPT09Kc2JzRmdUdVF1?=
 =?utf-8?B?VWVHZ0U0NUhKd3VIMi9OSUdKQW9oanptYW9nVXRsL0J5Uk00dTZyMjN4eGds?=
 =?utf-8?B?TUZkNmRDQVR4N3QrUzNXTDUwMGdvcUhrT3gxM0RwTkhlMGNzWVAwbjBrWHl2?=
 =?utf-8?B?NTFRWE9ldy9HVkFjdzVLMUpDaUp5bCsyQUR5TWFQWStpK2xCNHVYOWgxU3RN?=
 =?utf-8?B?SHZCWkRqclhBZGNCY2RjZmRjQjBoTWY0aUdyak9MTFNNMmE1NnlKQWhkYXhP?=
 =?utf-8?B?RnZsTFBmc20zVGZFckJjcWVtenc0QXNVOW1xRkRKUGxRRTlSeitONHBIZUMy?=
 =?utf-8?B?M1dtM0p6TjhEaWlVSG94ZXpWYlovRVNDOTJLOElsWUJtVW1kZGJmN0xseHo0?=
 =?utf-8?B?VnlyVzFKSWtiNThiZlVtYlk0S2k3eDVZSlpFeTM3TUQrYVlPZlh1UlhBb1pj?=
 =?utf-8?B?RFUrZmlGMEc2ejV1V3JDWnBXMFhPRGlFOUFreU9LUzB6V0Z5QUpxd3VkN21M?=
 =?utf-8?B?SVN0YmVOMk16U01UWXp4eGpvRDJNNEdpbldwQ0hzT1RMbm14Tk9Za1ZMVVFT?=
 =?utf-8?B?UFlCT0RiNUxhcDNENUhqZkZOWkNwNzltZEw3emljY2VXemZXY1NWb21kWE9Y?=
 =?utf-8?B?ZzNkUlBMNC8xWkcrdGdpcjc4azRkOWcrUHhxWWo2TDh5M3paeURlUUdVM3Va?=
 =?utf-8?B?cURPS0xtdHpiNGp2dXo4aW43RWc2ZTYwdUNmUURmb2NPRUFTd2FMZW10TFZn?=
 =?utf-8?B?dklDTHVqWDNTbTV0RDFHd0dJL0VZZjJkazhENlpqY2F6NmJSRXV2VFN4UFVy?=
 =?utf-8?B?UUZmbXNpc3E4eDJvNGlhMTNWeFJrdlh5ZXRYOXg1TXhvWE1KdUJOMWtUcU9z?=
 =?utf-8?B?V1VXVTdRUmszcjdlRithbURRaGxYNUEvcWVVT1hMNnNidkNRMWdTSmJkdTJr?=
 =?utf-8?B?MTVqNEp6d0pNYnVnZktORzVyWWU4cHZWVERIVjM0S0dkazZtbW95TUFxQWpR?=
 =?utf-8?B?TWQxRm9IV3BLSG54SmVSZmFrdXI5TzV1MzJBMy9zMDJhbWUxWXJ5dWpZZ1RK?=
 =?utf-8?B?clhuTFdkeHhPNUJML3o4ZHhFek94ZzNZZ2I5bnczeVRNT3ByWFcxZ3hwQlhK?=
 =?utf-8?B?M3IzVUZBVitYQ2t0V1IxeXpMbWpKR1hIU1JyRG5Yc01COWhPM2pUYzYvZ2I1?=
 =?utf-8?B?aTZibGt6aXR6UFVaem0rTlBvdSsvTWxueUhib1p6eC84U0xtS1VxdFJZbU1F?=
 =?utf-8?B?d05yZ21jd3lHQnlyWkViMXNIaHpXNVgydkhseU44RXpObEo4YmlBNlVUSVlX?=
 =?utf-8?B?VTd5clU0UHNORnc4bXVZdzUxemhHV20xd09MaHhXVkcwRjNGMlIzdU9NRGR3?=
 =?utf-8?B?MWRPTDlkd2NCYVNJS2MvK0pSejBzT3VPbnpYRDFvMFZZVGpqMzRQUDFXMFph?=
 =?utf-8?B?R1FhMkVXVU8wS1NEV0JzMTBRNHVmc1ZTNHFkS3pEZHFrNllNenJwcERRQ0du?=
 =?utf-8?B?T0JGWVBWZXljY3h2bUwycnFTa1E5VU55TTBJRU9NV1BTZWw1WTdXKytHSlgw?=
 =?utf-8?B?aGpNaGFrOUtPU3N1OG5IQWVPaHhaRzBEUENpWDk2N1IxRG9EUVpaSnV4U1lF?=
 =?utf-8?B?eW9ncHJiQWZYUVZKSEdtY3M5TGszSmF6ZWZTeXBzd084TFhnSC9DRWlVOU5r?=
 =?utf-8?B?UnZ6b3JzeWxmdlN4Kzk2SVd5S1QvVDZnYmtwMytjRVBDZ1pGcFkvM3phRzRm?=
 =?utf-8?B?NDlBVlBQTTJ4b2t5T04vKzZwQVpwTm8zYS84QW5JVDF4L2cyRkdhWkhIdHNz?=
 =?utf-8?B?WHV3YmxVOGJ1RExPYnFBMjEzeFJ0QkVKOXA3U1RBQUM5VnBHbzdETVNGVFU5?=
 =?utf-8?B?K3daZElaYnlUb3BPT2YwRURNUi9EdkJ1dG5RS05kUE9DWGViRFJEUXBYVnNE?=
 =?utf-8?Q?gfkc6Ecxf7q9Lfddh8X9Ma9PJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80837268-6f21-45bc-7600-08de2e604482
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:26:54.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ef3Au6RQ9b/2p1HUkgMgSEZw4ljfq763h52KvDkRu/Jqn6/RqMrxlJlEGa/NJ1mbrNSi5JboGwhR2NyOj9tLWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

Hi Soham

On 11/13/2025 6:19 PM, Soham Purkait wrote:
> Instead of creating a new spinner during each pass, it's more efficient to
> instantiate the spinner once and reuse it by properly ending and resetting
> it between iterations.

Give an overview of the the issue and the links in Closes

> This approach reduces the overhead associated with repeated spinner creation,
> saving time across multiple passes. By eliminating the cumulative time spent
> on spinner initialization (i.e., creation time * number of passes),
> the spinner's active duration more accurately reflects the actual engine busyness.
> This leads to more precise measurements of the percentage of engine busyness in
> terms of spinner running time.
> 
> With this change engine-activity-accuracy test result clearly shows the difference:
> 
> Before spinner reuse :
> 
> Starting subtest: engine-activity-accuracy-90
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=-2.90% (81.03% vs 83.93%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.598s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=-2.81% (83.06% vs 85.87%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.684s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=-2.04% (83.83% vs 85.87%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.667s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=-2.15% (83.99% vs 86.14%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS (1.647s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=-2.00% (83.59% vs 85.60%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS (1.664s)
> Subtest engine-activity-accuracy-90: SUCCESS (8.264s)
> 
> After spinner reuse:
> 
> Starting subtest: engine-activity-accuracy-90
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=0.03% (89.45% vs 89.42%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.560s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=0.02% (89.56% vs 89.54%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.559s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=0.02% (89.42% vs 89.40%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.571s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=0.01% (89.28% vs 89.27%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS (1.581s)
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
> error=0.01% (89.37% vs 89.36%)
> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS (1.583s)
> Subtest engine-activity-accuracy-90: SUCCESS (7.859s)
> 
> v1:
>   - Add how this patch improves the engine activity accuracy test. (Lucas)
>   - Show the numbers with the said improvement. (Lucas)
> 
> Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate engine activity accuracy")

Add all gitlab issue with Closes:

> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_pmu.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba..af0c2dfe4 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -534,6 +534,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   		intel_allocator_init();
>   		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>   
> +		spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
> +		xe_spin_end(spin->xe_spin);
> +		xe_spin_sync_wait(fd, spin);
> +
>   		for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
>   			unsigned int target_idle_us = idle_us;
>   			struct timespec start = { };
> @@ -552,10 +556,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   				igt_measured_usleep(target_idle_us);
>   
>   				/* start spinner */
> -				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
> +				xe_spin_reset(fd, spin);
>   				loop_idle_ns = igt_nsec_elapsed(&start);
>   				igt_measured_usleep(active_us);
> -				igt_spin_free(fd, spin);
> +				xe_spin_end(spin->xe_spin);

Should there be wait here?


>   
>   				now = igt_nsec_elapsed(&start);
>   				loop_active_ns = now - loop_idle_ns;
> @@ -590,6 +594,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   				      sizeof(expected));
>   		}
>   
> +		igt_spin_free(fd, spin);
>   		xe_vm_destroy(fd, vm);
>   		put_ahnd(ahnd);
>   	}
> @@ -622,7 +627,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>   	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
>   		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
>   
> -	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
> +	assert_within(100.0 * engine_activity, 100.0 * expected, 2);

Is this tested on multiple platforms?

Thanks
Riana

>   }
>   
>   static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)

