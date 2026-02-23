Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D25AEF5864
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEBE10E219;
	Mon, 23 Feb 2026 05:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mS3NZddK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CDF10E219
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771823448; x=1803359448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DY86jdNZ5cGx8QQW3xkPYVvBS6qUMLR/KphDtWXgxUA=;
 b=mS3NZddK9IeaBRBUVi526+WWHrrp/cq4sM/nc3EncLlsMBbDRoFyvgB6
 US8BcigVRovcYEMzc13/ws7VXWAPSQcG4XbCWfXsJlU+Q5cPKTg2keLHU
 a/shL0YRrmkZaNfQcAu0Wa9GQ0qyJC81tZm8B1n9dpw4vvXhGHcYfGUld
 IclfmLJVnKeamRLsDh4MnY4i/FscZmiivcQ2N/pw362JjezzA/Fl8nQ4M
 rAV2cC99qD898fRl5F9OKG1VdannWmFlLZ3fvM44TUqu5yYeJyjjH5Bl/
 CUd1Fz5s8ZLlwoCfnMkzZBKiLVB5sH/+xDDkfcyrKCAJPWZ7izpqC7npA A==;
X-CSE-ConnectionGUID: ZlSoT9CaSwaUgoi5/YeX+w==
X-CSE-MsgGUID: raWXH2oFTh+l/tqVv8aHdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72519041"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72519041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:10:47 -0800
X-CSE-ConnectionGUID: cRnFyjGGRLGOE9ZEOKc0eg==
X-CSE-MsgGUID: s06/UVGVTwig77HZbyXkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219570280"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:10:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:10:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:10:46 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:10:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yarJD27R+NNYI1jDPlC6QvrDdUbq84UMYqAmXLLxqgOusavfskk13x3AHfpSkpko0SsC+tWYklDG7YIlhGuCs3xjGL2qw7vUbbb9hjmtqTSIVreiGnTssswHTFXwVqiPm9Tjb2U42JhHDST1H8B4FOExr3L8D8ewhKbGHwOXJZWiNs4QaEOk+8pu/ANPgrBpqHTJKZHE3ihWyNq+FFabAnw5wTuZZBkGO0a0Z/CVp0Ti4xKbTKv0OgOQZCZJT5yK9pQJBSMyeJdg4ZdA3DfzpNyaptmiO80RHTrFnDlLaBLhvxobqN8e9fAkJtnW1g8fIVAqr1ZZj/n/RyoP+EtESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY86jdNZ5cGx8QQW3xkPYVvBS6qUMLR/KphDtWXgxUA=;
 b=ut6rBygRTmp76p5ZIjOie28wyrwCaxmCWyKlJfX7/MNKpWToqRnrwUQvfKIZKySMr5Orcix6myVLyx1Lf8KVzyk2kgQHCof8UPsXLqdA0m1DQHveyqSBex2yh2eDo5CH8vGISJASL4SDPBPLAU63zowZehqs3yVwvIKRPKNFlIXnJjTJwLs3gGayst/l4jfWJsNLVhf0Y7rhvI7pan0DjqbGUC6fW6h0YmiwpGSICuyxKFcA2+ieXx1n8tk5Xe7xhuYcSHNjd79WAnv17GfwoZTYP4bqWYJKisIDZImCarIZFVcqIqL2pmQgQFi8w+tcVIfumnVu6hPMkgBTSXv82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:10:43 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:10:43 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 5/8] tests/intel/xe_madvise: Add
 dontneed-before-exec subtest
Thread-Topic: [PATCH i-g-t v3 5/8] tests/intel/xe_madvise: Add
 dontneed-before-exec subtest
Thread-Index: AQHcn7YmoKPzSVhtOkGBEIM9bxSOXbWPxgtA
Date: Mon, 23 Feb 2026 05:10:43 +0000
Message-ID: <BL1PR11MB552517BD58B9CA1E7FC9556D8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-6-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-6-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: db536fb7-01f0-4064-4154-08de7299e56a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?UENVc09NNUFaVDloaEJ1YmRWNTNaWW92VzMvUEl3QUJtNW9oYnNoaHhPS1E1?=
 =?utf-8?B?VXZIbm1rRDhNdW4vSk9ZeTRsbTR4NncxWlVmTmNFajNrbzltRUxzU2tER3pZ?=
 =?utf-8?B?SU5VaXA5SFFJbVQ5TURaeUV3enY0R0FwYW1qVzZJL2ZDRFlxc0FDMFdMYk56?=
 =?utf-8?B?eVUyaWs0Mkx3S0pidjFzNFZoOTd1cEFYcDhMRjRQSmc4a1N6U1h2VEY0YWhZ?=
 =?utf-8?B?V0oyUkNySU1INThjNXpoYy9lSkdXRUx6TUZhQlJTTWxuVTM1QS83TE12ZWdV?=
 =?utf-8?B?dmtFMlBPL1pQTTY5Ynh4M1FEUnhZR1NwMUFBVjNwaXROUGluYmx4VTlzdFE2?=
 =?utf-8?B?c3lPNzB2cjV6YUo0eDNZa245RWZuUGViRy9GaVJ4UVBVZzlIZ0d2eXptZ2ds?=
 =?utf-8?B?UFIxNDJHQkRYK291bWZmcm5ibTY1RjFsa3I3L2JTOEZZbG04djBOdEc0ZkVW?=
 =?utf-8?B?V21Za0diWTQ3M0xlb2JhdVd1bmdhazZGcFlOUWFtUmNGZ1RWZUNLUlRjcG83?=
 =?utf-8?B?YjhXdjZ3K2J4czV3OTdtdlF1YmVKcy9xbUkxZnIxb1hKM0lyR2Y0YjhSOXJ2?=
 =?utf-8?B?dnE2dVNORjdyZG9jaE5NaG5yRkRldjZ3cXkvemE5dy9DMEoyQnZSNEVtdVEz?=
 =?utf-8?B?dVBRY1krR2pWb1pkZlpsU1A3cTl5M0IvVE4zM2VwRjVrSFlEY3QwUlhGSEtH?=
 =?utf-8?B?QXM3TkRDR25pUFVMU29raE1GZDJ5ZEc0bVBuelc1U2dtTnNDZDlnL1E2RTRu?=
 =?utf-8?B?UU1PNHpHOVlKbHN6MWtmemRZN3BzWHNGQVl2bmRvQm1maEEvdUNaVC8yclor?=
 =?utf-8?B?Uk1wSnFTZm44OXdiYjVtQy9haEZKeFA5UkM1VlBpRVB4aVh6WUVzWURLcnRs?=
 =?utf-8?B?RndYLzJudXJLdkR4K0g2bWkzU3Bub3NrY2JTWk85Z3BiME93amJvSGtpeTFX?=
 =?utf-8?B?NUN1RzF0cERKNERBQWNmOHNqVUI1OGhULzgwUVgzTEk2KzBxcTRsV1hFc0hF?=
 =?utf-8?B?WmpTam4xNFY5aEZmcEZMWi9PTnJrYVdkeldTWm1UY3lGSmIwdXlEV0NrOFdm?=
 =?utf-8?B?cTlwQmhodlJSMmVsN0hCa0JBYThabFNrdEhwRTZDeU0vVWNZYXNLVHJ5Z3hH?=
 =?utf-8?B?M2V6SW1PVldQRzlhOCtUUkJ6QmpYK1p6QjF6bUk0RmRlMlNFT0ozUUtIaTBZ?=
 =?utf-8?B?M082WkxDUktJQVZXdVVhenRhNUVhNWNlM3hmNmxwNG9tYWVBN21Vc2lIYXpv?=
 =?utf-8?B?YjBvQUxyaWUxbTFacmt0dGpxY0pwN1JGTTNLM0l4UkxMR1F2dm5uM016d2o0?=
 =?utf-8?B?Wnlxeng2c3EvUjJtcVd6Ly9YdlhMYncyTjBEdzZETkkxTUhGVzVmbVVpQUdS?=
 =?utf-8?B?UWZHMElCR2N1UTNsbkNoRWlyZU4rRDNQRlU1V25Vc29SRjJLOEYrcmFyODBl?=
 =?utf-8?B?Z0NIRkJNYmJVWk9yaFc4RTkxdkVwaWdFaHY5eGhPNmh5L3pHZ3k5RVJMbmxn?=
 =?utf-8?B?UklRUXBRZTI3dXJyd002VGF3WWRUYVVudVJvTEN1R3lJOVVrNm0xcjBpSjQv?=
 =?utf-8?B?ME9lNFhVYktVVSs2eFFVL2ZORDRlMUFyWlY2Ujh6YVpoS1h2Ny93WUxCUi9v?=
 =?utf-8?B?TVE2bFllSDhkcndRMzlsc1RQdmpzYWhXT1V2dGg1NkUxWWJmQTlUQ284WlBU?=
 =?utf-8?B?YVkweDZTd1kzZW4yV29WUm9kSGl0eU5Ya2x5RjN1THJ1bjBrb0hCaVAySGJR?=
 =?utf-8?B?bmZwMi94NU43dWg5bDlkcXdDYnJMNURKdHgyakMzM1lhZDYwa25MYzFYQUM2?=
 =?utf-8?B?dUlPQ0tnN1RyY0tUeVlJS0N0OWNvZGpOdW5DaWh3VGlBZE02R1Q4UDNieDFV?=
 =?utf-8?B?YzNCbGZ0aHpTV0w0QUVSUUg4OVZsWWkxb3h0WTZrVWtYOW9KRG9iRjN1Unp5?=
 =?utf-8?B?ZjJCU2UvRDVxeUlaSis0bDNYbjdrNVMySjNYbVRYeDJnSWZrZ3UxdTZQUGMv?=
 =?utf-8?B?dk1VZ3hkaUlwbTdjRFNSMkVydWdpOVQ5TEYyK3BOUDNCaDBaV0FFU3lyVHV1?=
 =?utf-8?B?TStLMXdGZzVtdkhHeERYNDBlOW15VDVLZm9HY1h6YXl5YnlEYWM1aDRsSUZC?=
 =?utf-8?B?alQvbjA5MXZvallrZnhSWW1IOXN3MXRnRTdhWmxMTFN0R04venEvN1dLSkxi?=
 =?utf-8?Q?du8uyw4Yrhudv8HbLsU8Rag=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDdrcXhJelFSNjdGRnhVU25URCt4TWdzZFFIemhPbGxUZ1pSdGV1VHJaMHhT?=
 =?utf-8?B?RFc3V01yc0xSRFROczY0bXhFMzllNTVBd3hMSHdjelVFOUR2cG1JbytIUzk3?=
 =?utf-8?B?NHl6TWhoZzQ3QzNEb3A3L1ZRK0lmZ09kazBRSWxhZ1B3ckNHbWxHVEk3cmUv?=
 =?utf-8?B?bElzcGpFbGVUWTZieG5ORnVGOFQ3T1NwcW5aanlrZzYzQm5HTTJZTlcwV24v?=
 =?utf-8?B?NTJaYU9LVGpWK1RsLzlyUDRzTG8wcHpBbTlsK0NRZTZNYUYvYkFhTWI1MytL?=
 =?utf-8?B?YkVCUk9VZ2VxSVU3U1l1dkFWZDkrRXZjaUlydWxlVkgxbFgydjNUTGNraStJ?=
 =?utf-8?B?c21RS3RyMStXQUU3cDdBUlJHTVhlayttTEhnOW9FQ3MzYlFUOHFCVG1yZFlo?=
 =?utf-8?B?WEtBcWd1UWdYZ3VxWXdZbm5zSTdhVjhSYmpDTU5BTkl1L1dnVmY4RmlPOFB6?=
 =?utf-8?B?d1BPcGU5ZlNYdVA2SjdqeEZGK2UwOGNkdjBVT1JJNlEyV3Zmcnp5cmIwNU1l?=
 =?utf-8?B?b3BrYXFjVURTbXoyejZuSmp6L1RyL1BYQktJeWZhR0JxejFpZklTY29BakFD?=
 =?utf-8?B?NElNUVpCcmkrbitzS2hXUVVWNFdJUENVdXJnaXNRWm1IenhoOTkrY3YzT3hG?=
 =?utf-8?B?VUpoQ2xFeFpBeThiY3pPTCt2ZmViQ3hyMEJRWllCaUNIYW1QZDNPUm1rRFAx?=
 =?utf-8?B?WkRSRVEzR3lEamVVNDRKRGRvZWRNTmFVMTZJckw1VFp4TVpiUkY0aU8xNzZt?=
 =?utf-8?B?d25tRWliaG5uODF2QTZacmxNOU5TdWdRcWxHVU1rNWRHTlVHL1JkYUpNN2xm?=
 =?utf-8?B?d3lkbjQrM1haZHNFSVJQQTBKOHQ4c0d1TlpnYTNIOU9jc0k5d0JoTkNRNDRl?=
 =?utf-8?B?L2xWRXlSWW11OWwzNGF1cXV1SnRXZkZ5V0lwenhHVEdXYWY2dUtEWkxxajZi?=
 =?utf-8?B?UjBBbXNISnpGTVBhZW1FdEtDTGpzanBkZUltbXBSY0Urc3dlTjBNcTRNRHdG?=
 =?utf-8?B?c2E5SWpCUGtralY2T0RDWXJtV1d3ZEhXdGhQS3FwL1lKdTQwdzJLd2premp3?=
 =?utf-8?B?R2FxSm12a1FVVTZ4L0hlak9MUTFRdjREUEx4YjR6MVczN1psYjl5UmpaeW5E?=
 =?utf-8?B?clpNNVlXME9UOVVTNHoyVnpsQzlvb3UyTjZSR0VVOVpudXlNalpXQzdoZDBE?=
 =?utf-8?B?T3psY2o0ZVpQQ0lJczRXaS92T3NpV2JTZ0NpelNVM053OUt6L2I0d3g0RTJl?=
 =?utf-8?B?TFQ3bW5RY3d5UU5leE9WL3FGWmJrR0tzTWh3TmpaRTg1L3FDdGhhcURUR0E0?=
 =?utf-8?B?anhORFVyMWVYMzM1YWM5TkExbC9zcEtGd1NVTTBaazhLa3FwT0FGc0hnV1dN?=
 =?utf-8?B?aGcxamRMZkZTNVUrTWJ0YXZFd2trZlgzUzB2NHBLdkpNdEN5Q2dGQUJLNGJE?=
 =?utf-8?B?Mk1jcjg0ZVVUZXVCM2g0VEJ2OVlCN2hKbWdJVnVkUTFnMUR4aGk3TGE4dU4v?=
 =?utf-8?B?L0Y0SStDYVlVT3RBemZtRWdYTVE5MnhDc3FQVzZpVjVaeW5RbjdiNVUyNm1w?=
 =?utf-8?B?WkRZMkNkazZIK3AxMVhUYWtWa0c3VWVtaVB5NDd2R00vcUprMzhUeS9QSlI0?=
 =?utf-8?B?L0p3T0Z3cVM4cVBRVXlUVmd4emxKQm1uSHl4eVpicmtyMFlseFNQamlyUWk1?=
 =?utf-8?B?MW5wZGFwbUpvTWptM0gwSktrSnhGaGF6YytoczNHM3FBTzJ4OTdmcytpQXMv?=
 =?utf-8?B?NGIreWxVeSs1bERSaDZxU3dWdnBzeWNVWjNpbTBVWUJjUG16bTJWazZUbHhQ?=
 =?utf-8?B?RE5PRDNub29xZHdOUVFUSDR2MXhvTTVZbzROSU80Sm1mSk5xQVJ0cGhGdTRu?=
 =?utf-8?B?UTQ5eVhWYlIycjMvcjZQMWc0VmRyaE9FVU1WTEx3NnBCMEVCVzNzakZjTTA0?=
 =?utf-8?B?YXB0Q0tSYmcwRmpBUVNTeWIxMEpiMGRGV1BFeFl0eHVzcWIyZUE0bWFOUXVZ?=
 =?utf-8?B?UTc3VC9FY2V2ZVFWaWlKZENsNlZPNk4vbHdveXVoM3lxVUdzMFJvNWlpWGla?=
 =?utf-8?B?VkpTOG5kMUZRV3dUdmltaCtsekhvK3dJeWNtaysxVHlZTi8wd0treTZhblpu?=
 =?utf-8?B?Z3lNbWVNVXFBbTRFUXBDNnVhZ1ZUZVFtRFdEUzVxdnBpZHd3MWFvTU82UUJO?=
 =?utf-8?B?d1RXd2UwNldLb0RCdWdNVW9FdVQrVHpLclUxc254anl4QTJlaUMrbUl2MC9t?=
 =?utf-8?B?Zmw0RjAwMmIzRmwvNWNIdEczTGcrY0FzNVVMcHdGT21aRzFvNGJrTDBXTFpL?=
 =?utf-8?B?eThCcE1VU2RsV2kzV2h6bXFLYWltWnNzZzBwRzVzVlU1SG05WC9xZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db536fb7-01f0-4064-4154-08de7299e56a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 05:10:43.7466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9riyGKQUX1w3XAZ6ChuioofZt+5CIJmzaW6juEgRErVr3fS/v5gsx7CDhqnU/kyyuKvjh0OpzeFgpG+qz7Em6v0XMdiUtUZxrcpQuo4ryE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDUvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIGRvbnRuZWVkLWJlZm9yZS0NCj4gZXhlYyBzdWJ0ZXN0DQo+IA0KPiBUaGlzIHRlc3Qg
dmFsaWRhdGVzIEdQVSBleGVjdXRpb24gYmVoYXZpb3Igd2hlbiBhIGRhdGEgQk8gaXMgcHVyZ2Vk
IGJlZm9yZQ0KPiBzdWJtaXNzaW9uLiBUaGUgdGVzdCBjcmVhdGVzIGEgYmF0Y2ggdGhhdCB3cml0
ZXMgdG8gYSBkYXRhIEJPLCBwdXJnZXMgdGhlIGRhdGENCj4gQk8gKHdoaWxlIGtlZXBpbmcgdGhl
IGJhdGNoIEJPIHZhbGlkIHRvIGF2b2lkIEdQVSByZXNldCksIHRoZW4gc3VibWl0cyBmb3INCj4g
ZXhlY3V0aW9uLiBXaXRoIFZNX0NSRUFURV9GTEFHX1NDUkFUQ0hfUEFHRSwgdGhlIEdQVSB3cml0
ZSBtYXkNCj4gc3VjY2VlZCBieSBsYW5kaW5nIG9uIHNjcmF0Y2ggbWVtb3J5IGluc3RlYWQgb2Yg
dGhlIHB1cmdlZCBCTywNCj4gZGVtb25zdHJhdGluZyBncmFjZWZ1bCBoYW5kbGluZyBvZiBwdXJn
ZWQgbWVtb3J5IGR1cmluZyBHUFUgb3BlcmF0aW9ucy4NCj4gDQo+IENjOiBOaXNoaXQgU2hhcm1h
IDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZh
bGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFydmluZCBZYWRhdiA8YXJ2
aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMg
fCAxNDANCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTQwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC94ZV9tYWR2aXNlLmMgYi90ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMgaW5kZXgNCj4gNWM2
YTI0NTUzLi40MmNmMWIzZTUgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX21hZHZpc2Uu
Yw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMNCj4gQEAgLTE5LDcgKzE5LDExIEBA
DQo+IA0KPiAgLyogUHVyZ2VhYmxlIHRlc3QgY29uc3RhbnRzICovDQo+ICAjZGVmaW5lIFBVUkdF
QUJMRV9BRERSCQkweDFhMDAwMA0KPiArI2RlZmluZSBQVVJHRUFCTEVfQkFUQ0hfQUREUgkweDNj
MDAwMA0KPiAgI2RlZmluZSBQVVJHRUFCTEVfQk9fU0laRQk0MDk2DQo+ICsjZGVmaW5lIFBVUkdF
QUJMRV9GRU5DRV9WQUwJMHhiZWVmDQo+ICsjZGVmaW5lIFBVUkdFQUJMRV9URVNUX1BBVFRFUk4J
MHhjMGZmZWUNCj4gKyNkZWZpbmUgUFVSR0VBQkxFX0RFQURfUEFUVEVSTgkweGRlYWQNCj4gDQo+
ICAvKioNCj4gICAqIHRyaWdnZXJfbWVtb3J5X3ByZXNzdXJlIC0gRmlsbCBWUkFNICsgMjUlIHRv
IGZvcmNlIHB1cmdlYWJsZSByZWNsYWltIEBADQo+IC0xNDQsNiArMTQ4LDYyIEBAIHN0YXRpYyB2
b2lkIHB1cmdlYWJsZV9zZXR1cF9zaW1wbGVfYm8oaW50IGZkLCB1aW50MzJfdA0KPiAqdm0sIHVp
bnQzMl90ICpibywNCj4gIAl4ZV93YWl0X3VmZW5jZShmZCwgJnN5bmNfdmFsLCAxLCAwLCBOU0VD
X1BFUl9TRUMpOyAgfQ0KPiANCj4gKy8qKg0KPiArICogcHVyZ2VhYmxlX3NldHVwX2JhdGNoX2Fu
ZF9kYXRhIC0gU2V0dXAgVk0gd2l0aCBiYXRjaCBhbmQgZGF0YSBCT3MNCj4gK2ZvciBHUFUgZXhl
Yw0KPiArICogQGZkOiBEUk0gZmlsZSBkZXNjcmlwdG9yDQo+ICsgKiBAdm06IE91dHB1dCBWTSBo
YW5kbGUNCj4gKyAqIEBiaW5kX2VuZ2luZTogT3V0cHV0IGJpbmQgZW5naW5lIGhhbmRsZQ0KPiAr
ICogQGJhdGNoX2JvOiBPdXRwdXQgYmF0Y2ggQk8gaGFuZGxlDQo+ICsgKiBAZGF0YV9ibzogT3V0
cHV0IGRhdGEgQk8gaGFuZGxlDQo+ICsgKiBAYmF0Y2g6IE91dHB1dCBiYXRjaCBidWZmZXIgcG9p
bnRlcg0KPiArICogQGRhdGE6IE91dHB1dCBkYXRhIGJ1ZmZlciBwb2ludGVyDQo+ICsgKiBAYmF0
Y2hfYWRkcjogQmF0Y2ggdmlydHVhbCBhZGRyZXNzDQo+ICsgKiBAZGF0YV9hZGRyOiBEYXRhIHZp
cnR1YWwgYWRkcmVzcw0KPiArICogQGJhdGNoX3NpemU6IEJhdGNoIGJ1ZmZlciBzaXplDQo+ICsg
KiBAZGF0YV9zaXplOiBEYXRhIGJ1ZmZlciBzaXplDQo+ICsgKg0KPiArICogSGVscGVyIHRvIGNy
ZWF0ZSBWTSwgYmluZCBlbmdpbmUsIGJhdGNoIGFuZCBkYXRhIEJPcywgYW5kIGJpbmQgdGhlbS4N
Cj4gKyAqLw0KPiArc3RhdGljIHZvaWQgcHVyZ2VhYmxlX3NldHVwX2JhdGNoX2FuZF9kYXRhKGlu
dCBmZCwgdWludDMyX3QgKnZtLA0KPiArCQkJCQkgICB1aW50MzJfdCAqYmluZF9lbmdpbmUsDQo+
ICsJCQkJCSAgIHVpbnQzMl90ICpiYXRjaF9ibywNCj4gKwkJCQkJICAgdWludDMyX3QgKmRhdGFf
Ym8sDQo+ICsJCQkJCSAgIHVpbnQzMl90ICoqYmF0Y2gsDQo+ICsJCQkJCSAgIHVpbnQzMl90ICoq
ZGF0YSwNCj4gKwkJCQkJICAgdWludDY0X3QgYmF0Y2hfYWRkciwNCj4gKwkJCQkJICAgdWludDY0
X3QgZGF0YV9hZGRyLA0KPiArCQkJCQkgICBzaXplX3QgYmF0Y2hfc2l6ZSwNCj4gKwkJCQkJICAg
c2l6ZV90IGRhdGFfc2l6ZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luYyA9IHsN
Cj4gKwkJLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0UsDQo+ICsJCS5mbGFncyA9
IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMLA0KPiArCQkudGltZWxpbmVfdmFsdWUgPSBQVVJHRUFC
TEVfRkVOQ0VfVkFMLA0KPiArCX07DQo+ICsJdWludDY0X3Qgdm1fc3luYyA9IDA7DQo+ICsNCj4g
Kwkqdm0gPSB4ZV92bV9jcmVhdGUoZmQsIERSTV9YRV9WTV9DUkVBVEVfRkxBR19TQ1JBVENIX1BB
R0UsDQo+IDApOw0KPiArCSpiaW5kX2VuZ2luZSA9IHhlX2JpbmRfZXhlY19xdWV1ZV9jcmVhdGUo
ZmQsICp2bSwgMCk7DQo+ICsNCj4gKwkvKiBDcmVhdGUgYW5kIGJpbmQgYmF0Y2ggQk8gKi8NCj4g
KwkqYmF0Y2hfYm8gPSB4ZV9ib19jcmVhdGUoZmQsICp2bSwgYmF0Y2hfc2l6ZSwgdnJhbV9pZl9w
b3NzaWJsZShmZCwNCj4gMCksDQo+ICsNCj4gRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ORUVEU19W
SVNJQkxFX1ZSQU0pOw0KPiArCSpiYXRjaCA9IHhlX2JvX21hcChmZCwgKmJhdGNoX2JvLCBiYXRj
aF9zaXplKTsNCj4gKw0KPiArCXN5bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmdm1fc3luYyk7
DQo+ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgKnZtLCAqYmluZF9lbmdpbmUsICpiYXRjaF9ibywg
MCwgYmF0Y2hfYWRkciwNCj4gYmF0Y2hfc2l6ZSwgJnN5bmMsIDEpOw0KPiArCXhlX3dhaXRfdWZl
bmNlKGZkLCAmdm1fc3luYywgUFVSR0VBQkxFX0ZFTkNFX1ZBTCwgMCwNCj4gTlNFQ19QRVJfU0VD
KTsNCj4gKw0KPiArCS8qIENyZWF0ZSBhbmQgYmluZCBkYXRhIEJPICovDQo+ICsJKmRhdGFfYm8g
PSB4ZV9ib19jcmVhdGUoZmQsICp2bSwgZGF0YV9zaXplLCB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAw
KSwNCj4gKw0KPiAJRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ORUVEU19WSVNJQkxFX1ZSQU0pOw0K
PiArCSpkYXRhID0geGVfYm9fbWFwKGZkLCAqZGF0YV9ibywgZGF0YV9zaXplKTsNCj4gKw0KPiAr
CXZtX3N5bmMgPSAwOw0KPiArCXhlX3ZtX2JpbmRfYXN5bmMoZmQsICp2bSwgKmJpbmRfZW5naW5l
LCAqZGF0YV9ibywgMCwgZGF0YV9hZGRyLA0KPiBkYXRhX3NpemUsICZzeW5jLCAxKTsNCj4gKwl4
ZV93YWl0X3VmZW5jZShmZCwgJnZtX3N5bmMsIFBVUkdFQUJMRV9GRU5DRV9WQUwsIDAsDQo+IE5T
RUNfUEVSX1NFQyk7IH0NCj4gKw0KPiAgLyoqDQo+ICAgKiBTVUJURVNUOiBkb250bmVlZC1iZWZv
cmUtbW1hcA0KPiAgICogRGVzY3JpcHRpb246IE1hcmsgQk8gYXMgRE9OVE5FRUQgYmVmb3JlIG1t
YXAsIHZlcmlmeSBtbWFwIGZhaWxzIG9yDQo+IFNJR0JVUyBvbiBhY2Nlc3MgQEAgLTI0NCw2ICsz
MDQsODAgQEAgc3RhdGljIHZvaWQNCj4gdGVzdF9kb250bmVlZF9hZnRlcl9tbWFwKGludCBmZCwg
c3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UNCj4gIAl4ZV92bV9kZXN0cm95KGZk
LCB2bSk7DQo+ICB9DQo+IA0KPiArLyoqDQo+ICsgKiBTVUJURVNUOiBkb250bmVlZC1iZWZvcmUt
ZXhlYw0KPiArICogRGVzY3JpcHRpb246IE1hcmsgQk8gYXMgRE9OVE5FRUQgYmVmb3JlIEdQVSBl
eGVjLCB2ZXJpZnkgR1BVDQo+ICtiZWhhdmlvciB3aXRoIFNDUkFUQ0hfUEFHRQ0KPiArICogVGVz
dCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkIHRl
c3RfZG9udG5lZWRfYmVmb3JlX2V4ZWMoaW50IGZkLCBzdHJ1Y3QNCj4gK2RybV94ZV9lbmdpbmVf
Y2xhc3NfaW5zdGFuY2UgKmh3ZSkgew0KPiArCXVpbnQzMl90IHZtLCBleGVjX3F1ZXVlLCBibywg
YmF0Y2hfYm8sIGJpbmRfZW5naW5lOw0KPiArCXVpbnQ2NF90IGRhdGFfYWRkciA9IFBVUkdFQUJM
RV9BRERSOw0KPiArCXVpbnQ2NF90IGJhdGNoX2FkZHIgPSBQVVJHRUFCTEVfQkFUQ0hfQUREUjsN
Cj4gKwlzaXplX3QgZGF0YV9zaXplID0gUFVSR0VBQkxFX0JPX1NJWkU7DQo+ICsJc2l6ZV90IGJh
dGNoX3NpemUgPSBQVVJHRUFCTEVfQk9fU0laRTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3lu
Y1sxXSA9IHsNCj4gKwkJeyAudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfVVNFUl9GRU5DRSwNCj4g
KwkJICAuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJICAudGltZWxpbmVf
dmFsdWUgPSBQVVJHRUFCTEVfRkVOQ0VfVkFMIH0sDQo+ICsJfTsNCj4gKwlzdHJ1Y3QgZHJtX3hl
X2V4ZWMgZXhlYyA9IHsNCj4gKwkJLm51bV9iYXRjaF9idWZmZXIgPSAxLA0KPiArCQkubnVtX3N5
bmNzID0gMSwNCj4gKwkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKHN5bmMpLA0KPiArCX07DQo+
ICsJdWludDMyX3QgKmRhdGEsICpiYXRjaDsNCj4gKwl1aW50NjRfdCB2bV9zeW5jID0gMDsNCj4g
KwlpbnQgYiwgcmV0Ow0KPiArDQo+ICsJcHVyZ2VhYmxlX3NldHVwX2JhdGNoX2FuZF9kYXRhKGZk
LCAmdm0sICZiaW5kX2VuZ2luZSwNCj4gJmJhdGNoX2JvLA0KPiArCQkJCSAgICAgICAmYm8sICZi
YXRjaCwgJmRhdGEsIGJhdGNoX2FkZHIsDQo+ICsJCQkJICAgICAgIGRhdGFfYWRkciwgYmF0Y2hf
c2l6ZSwgZGF0YV9zaXplKTsNCj4gKw0KPiArCS8qIFByZXBhcmUgYmF0Y2ggKi8NCj4gKwliID0g
MDsNCj4gKwliYXRjaFtiKytdID0gTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQ7DQo+ICsJYmF0Y2hb
YisrXSA9IGRhdGFfYWRkcjsNCj4gKwliYXRjaFtiKytdID0gZGF0YV9hZGRyID4+IDMyOw0KPiAr
CWJhdGNoW2IrK10gPSBQVVJHRUFCTEVfREVBRF9QQVRURVJOOw0KPiArCWJhdGNoW2IrK10gPSBN
SV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArDQo+ICsJLyogUGhhc2UgMTogUHVyZ2UgZGF0YSBCTywg
YmF0Y2ggQk8gc3RpbGwgdmFsaWQgKi8NCj4gKwlpZ3RfYXNzZXJ0KHB1cmdlYWJsZV9tYXJrX2Fu
ZF92ZXJpZnlfcHVyZ2VkKGZkLCB2bSwgZGF0YV9hZGRyLA0KPiArZGF0YV9zaXplKSk7DQo+ICsN
Cj4gKwlleGVjX3F1ZXVlID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCBod2UsIDApOw0K
PiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9IGV4ZWNfcXVldWU7DQo+ICsJZXhlYy5hZGRyZXNzID0g
YmF0Y2hfYWRkcjsNCj4gKw0KPiArCXZtX3N5bmMgPSAwOw0KPiArCXN5bmNbMF0uYWRkciA9IHRv
X3VzZXJfcG9pbnRlcigmdm1fc3luYyk7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFZNIGhhcyBTQ1JB
VENIX1BBR0Ug4oCUIGV4ZWMgbWF5IHN1Y2NlZWQgd2l0aCB0aGUgR1BVIHdyaXRlDQo+ICsJICog
bGFuZGluZyBvbiBzY3JhdGNoIGluc3RlYWQgb2YgdGhlIHB1cmdlZCBkYXRhIEJPLg0KPiArCSAq
Lw0KPiArCXJldCA9IF9feGVfZXhlYyhmZCwgJmV4ZWMpOw0KPiArCWlmIChyZXQgPT0gMCkgew0K
PiArCQlpbnQ2NF90IHRpbWVvdXQgPSBOU0VDX1BFUl9TRUM7DQo+ICsNCj4gKwkJX194ZV93YWl0
X3VmZW5jZShmZCwgJnZtX3N5bmMsIFBVUkdFQUJMRV9GRU5DRV9WQUwsDQo+ICsJCQkJIGV4ZWNf
cXVldWUsICZ0aW1lb3V0KTsNCj4gKwl9DQo+ICsNCj4gKwkvKg0KPiArCSAqIERvbid0IHB1cmdl
IHRoZSBiYXRjaCBCTyDigJQgR1BVIHdvdWxkIGZldGNoIHplcm9lZCBzY3JhdGNoDQo+ICsJICog
aW5zdHJ1Y3Rpb25zIGFuZCB0cmlnZ2VyIGFuIGVuZ2luZSByZXNldC4NCj4gKwkgKi8NCj4gKw0K
PiArCW11bm1hcChkYXRhLCBkYXRhX3NpemUpOw0KPiArCW11bm1hcChiYXRjaCwgYmF0Y2hfc2l6
ZSk7DQo+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ICsJZ2VtX2Nsb3NlKGZkLCBiYXRjaF9ibyk7
DQo+ICsJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBiaW5kX2VuZ2luZSk7DQo+ICsJeGVfZXhl
Y19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlKTsNCj4gKwl4ZV92bV9kZXN0cm95KGZkLCB2
bSk7DQo+ICt9DQo+ICsNCj4gIGludCBpZ3RfbWFpbigpDQo+ICB7DQo+ICAJc3RydWN0IGRybV94
ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZTsgQEAgLTI2Niw2ICs0MDAsMTIgQEANCj4gaW50
IGlndF9tYWluKCkNCj4gIAkJCWJyZWFrOw0KPiAgCQl9DQo+IA0KPiArCWlndF9zdWJ0ZXN0KCJk
b250bmVlZC1iZWZvcmUtZXhlYyIpDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7
DQo+ICsJCQl0ZXN0X2RvbnRuZWVkX2JlZm9yZV9leGVjKGZkLCBod2UpOw0KPiArCQkJYnJlYWs7
DQo+ICsJCX0NCj4gKw0KPiAgCWlndF9maXh0dXJlKCkgew0KPiAgCQl4ZV9kZXZpY2VfcHV0KGZk
KTsNCj4gIAkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQpSZXZpZXdlZC1ieTogUHJhdmFsaWthIEd1
cnJhbSA8cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5jb20+DQo+IC0tDQo+IDIuNDMuMA0KDQo=
