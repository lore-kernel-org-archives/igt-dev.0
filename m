Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45DACFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 07:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8737910E061;
	Tue,  2 Dec 2025 07:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2EhbazG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1012310E061
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764661532; x=1796197532;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=a2WJ+MzIUvPFqQdkY2I3+tBvlK8i8+qQG5jDK3pmLkk=;
 b=F2EhbazGbd4O9CPReiWjRWZbMiaseRSdl8wxPQoLoa0ZsZln5ImcM5Vf
 HVo+EoGCE4gUfes/+46uleMz4dxZdpkf8BypYgO97k+23qhqcv7YRg3Qt
 nqc51uaUxqAioyj4oCILItoHCEcn1x7GVGxhf5oC2haQipKK+uk0KUREy
 n8fm4X/onknjit4P+fKp5wQQbBeYe5TQ0Yea14dk4u5d1tloUriZYI1Po
 1q+N7iRQgPqwWNbMihJ1dAhxhPgfr83fQe6+pL9GA52yZw1BQnsSKV/vp
 gMVDaGpBOvjdefiPfm91EFijcUdnJhDF9a/xBHv8NCbRh9Q2oM3+xG3Gf g==;
X-CSE-ConnectionGUID: 7jQl1S5RQ+WSlsUhpD/aKA==
X-CSE-MsgGUID: eWfmKgPATXatmlY+6je8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84013998"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="84013998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:45:27 -0800
X-CSE-ConnectionGUID: AfwKel1gTSSpl6ivC1S2RA==
X-CSE-MsgGUID: A/hs6KYrQSan8YWGmnMvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199433144"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:45:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:45:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:45:26 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:45:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wkt6FhjX1thKLVdMhIpTIosiDewu0amj344o+EKT7/nT9m9de0pkJ+S7rKDV6Drxtmmjqk6Rk2mbR5xp4lTGEuR5dIKZDS/cjJk3Row/eTR1s3oJuk5S9LvR2T2pQrV44Ifemhk2Q0Bdo5CBAQYrWcVbuhD5nTAbVgeuxyUrLwQ+00Uo4UAY81MPHiRTts35FY2BnwdiABLYjiZm5c1Px/fbF9qmkMiWpybOFRcHReMPFUjd9vDFrGKi/yquCULoBZdORAH/u4BdxYyhsVmDjJT61j4Iw3fcQ2SbDnVt/j0tggZr1zyfOy3x1pycINQB9UpDE+gvRdVsA0eRSkQC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2WJ+MzIUvPFqQdkY2I3+tBvlK8i8+qQG5jDK3pmLkk=;
 b=nZ7eypSUBw1zhNQqA2m6dhJkgSFHW9niVP8hUlLvHYaFcyN9jI12klKIAbKFk+hTUiEOVgpXz8MkmoFtVFTyrecwMNL7T4ABAxS+iFeTzrDZLsT1066PbZVrj03I5jaU3QUFnRrE5niMaQXXvwnxO4WYNM9BakQ5Po+poPv5W+X4PLUO6RCa+/2B4oaToX2hh4AaQmjIBmcwUnZmbhwAAAfUNwbVkhrZn5jrO1bfNNPU3gkYVvClSojpIc3eToymJ2kma1ERCZqVrAvzLVqkTeAFWkDdTYFTcJlq5VelM9fN3HRvjTsSHcgMFGxZU/JWbiMox4ihzcWngLpeYmuNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 07:45:18 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 07:45:18 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Topic: [PATCH i-g-t v9 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Index: AQHcYqEtpZsbFq7/NU2cZvHvvPtkF7UN+fAA
Date: Tue, 2 Dec 2025 07:45:18 +0000
Message-ID: <698f9e86845a7bf7e9ad29e5bbdd7ac9c88c3296.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-2-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-2-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM4PR11MB8132:EE_
x-ms-office365-filtering-correlation-id: ec48b0c7-f72d-40e7-b1a3-08de3176bd1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OEZEZVZhWldRcVdGR2xSejZaMVdEN3ppK0Z4azBxQXBpaGtJSTB3SHF1TFZI?=
 =?utf-8?B?b0JyTktoZElyby8ydmNhT29YV2hzZUwxaDdMUFJxQ2VFQVUzTWV3OG9ncHJw?=
 =?utf-8?B?RE5iWWoySDFkL0MrNTVXMXRHT1RYczdHa2RpaUNjZ0d4USs1VzlsZm9Ka3ZR?=
 =?utf-8?B?Y3VuVm1Yam5EUXJSaTVXazl5RlRsSldRdkdpaG9oYk5MaFZXMFl5eW1LRFAy?=
 =?utf-8?B?dEhnT3ByMW9BZ3JDNnp2VWE3Ry9TcFlKcjN3MVNKRmJFbE5xQVUvRVM5Tldv?=
 =?utf-8?B?NzQ5Rjh2eGs0b3R6aVR0VERraStLUldlU0FwTXI5QWpaU2ZaTGhONTBrOTFQ?=
 =?utf-8?B?Rm1qZDFsZEVEb3dnbFc3YXQ1ZmNpL3ZIUHBWMnIzTklqZFVpaTlPWm5uUVhL?=
 =?utf-8?B?VlNRU1RKUkFlaW1tZmVFeGR0eUZndjBycEJQcXFHVFE3TVBmSGh2MzhMY0Mz?=
 =?utf-8?B?QVJTU0NmR3YxNFU0SVJDWTgvVlFSdWR2SGw1QnVoOVNocXRzeHN2YzdMdHRs?=
 =?utf-8?B?cStobWpmVFZLVS9EL1Q3ZjlzTHhCOUIxblJMV0IxdVV3aXl6Z3o4ZW43SEl0?=
 =?utf-8?B?NnNvUCtQL2hGK251U3hBaEdsQWgvRGUvb0RIakZYalRYY1RNeTVOY0xYOFVj?=
 =?utf-8?B?SlNaekczWnF0ZkpNYThCOW54SndNclhjaE9rVnI3dGgyQ3BjV3NaODVLampw?=
 =?utf-8?B?N1ppUEJtQmU2ekkwN25zazVlZXdEamRBeXFDVldybzNCU01QTEE4WG40dEtH?=
 =?utf-8?B?a0p2TlAzd1N1eENFL2pWRlg1VXRwS3Z0ZTYzMnZrQnVPQmFORXdxaDNGMFlr?=
 =?utf-8?B?WnZVSlB5dkZhNklzVHI4aldneXNnL29ONG94OUw4UkpnUzE5b0ptaVBTS3N3?=
 =?utf-8?B?cCtUdElXNTN1MVYwRjZSTnpQcWRRNktvNTA0TXNLWXFwc1NiMEhpR2UvVndJ?=
 =?utf-8?B?MVFnQWdtTnlyZFQ5N0duck9VZU9sTFR4Y3BFaS9tZzNNVUt3cDBMdDlidDNn?=
 =?utf-8?B?N1NRZzJLdU5WOFdmcFFGZ25QMEk5U1dQcnU2WHg1a2xpZ3UySFk3aSs3ZE9T?=
 =?utf-8?B?R0ZVU0xjUTJvMEtNRStpSldEYjN3WmZYejM0aENrUFlpZGdIWXNuRnRZSFF2?=
 =?utf-8?B?RGc5NzBuZks5MklyQlVxZ0lVcnVTc01zUmduTzQwMC9vWTU1eVIzTzQ0KzJM?=
 =?utf-8?B?aThsVDhkelArWU1odkFKb1dYUFdVSTZZNkF4L2pVU2pDNWg1VENYa3ZPeUo4?=
 =?utf-8?B?cVh6SVErcEtZYzk2WVYwRytwT2h1SUVEc29HWVFGSnpHbmRTSE5vQnJGWXZH?=
 =?utf-8?B?aml1emJTRkJsamtZdDZrdHZoN3VJNXFWWUEzU2lLdDhwR1pzRDk0ekdPWU5X?=
 =?utf-8?B?Q2JmYVBWamRBbkVrcHVxOE1kdDdyZ016dkQxK0hTQ2lFS0RkQ2NvVThLWi82?=
 =?utf-8?B?MytycFpDcGJwWnhKZGI3NzlUWFdTRmRPdUdFQk1Pd1R4V3hFSFVxNW1VM09H?=
 =?utf-8?B?UGRMNXVwWTJPU24vMkhNb1RuUVdzam9NWlFRRVB0N2F0Y01VWHRaMnlzUXlM?=
 =?utf-8?B?M1AzYUNkbW4yNkhia1lidVZjVzgzR0M3R3RmZTJFNEZDMzR2MUdWTlVXMXd4?=
 =?utf-8?B?SFNGM3lqRUdBdVJxZHVFQ2FDandwc3RwM3Yzam9KZ1hJK1FMalJNczN5b2hr?=
 =?utf-8?B?VTYreWtqWWFOeGlXaU5Ld1EzVHJWQkJ6R1BTSnFxdjNWL1BjNExWcmtDRmFy?=
 =?utf-8?B?UFBYZ1JCNnYxZjlqUzRDQ05VMVlXQ0FmTnhXNDZuV0lxcjVpTWNkT0pBdkpm?=
 =?utf-8?B?NkVQS1pNR1UvYytTM25Hd0xBa01hVW45bnZqQ0M1RzVkUHNIYmMxT281WnB2?=
 =?utf-8?B?TGRjNHVvdHhWRUd5RTF4djdFeWZ3UjNNK2RrblR1YVBkVjZzaGlIenBjZkZS?=
 =?utf-8?B?eVFYWnMxREhQdEc2d0xjSjRaWnp2Ky94anJUeEFtR1NYYUZxRGdNSWJhcHR3?=
 =?utf-8?B?c3dIaEpXbmVBSVRXVFJtN3R5Q0ljbFQzNjBjMVRYZkgxOWJpV1RrazJUa1Rh?=
 =?utf-8?Q?6F2Amb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWszYTJaVXFadFJVa0YzTG1tbEpaRmt0eU5CZElCUTNKUlp3NWZ4M0ozOUM3?=
 =?utf-8?B?TUsvemxDbkFQUlh5ZHNLSVZwVFpCeENjWDRqVHRrR2pIRitpNlZKTm5jRUxF?=
 =?utf-8?B?Zzl4MmNjeEk3UWhBczBTVGEra1daTjdOczR3YzE0SHFQM2hOME5QbUN5S2ZP?=
 =?utf-8?B?TFFiRHpIL2tlTDJXUGYwWUQvZ3BYbFFoODd5RFVCdnZhN1dwSkNwTmh1cW5x?=
 =?utf-8?B?eW05a21GaWk2aFdZVWQzbEVuV3MzdjE2QjFTWnFjbi94dUtnTFI0OHBNdDBP?=
 =?utf-8?B?d3c1MlJzRkJpRXZWUEtvRjFuRWcvdy8yblhGZUVFcVlDWG9tb3JJTjJHKy9y?=
 =?utf-8?B?QWtwc1BWSjc3VkdveEt1Si82aTdubm1OYU5UeXNtbmhYWlpyQVovcFAvUG1w?=
 =?utf-8?B?ZkNzZkRlRlhMUmwzaEtGZWZCVVVXWmZRRHYrL29UM1NzR1lFRHlBMFZETUd1?=
 =?utf-8?B?bFhtSWYzUjZ0UHJudy9HdjdBN1VMRTlvL0JCVUJUK1hLZ2dzdnMxb0ljL0RY?=
 =?utf-8?B?NklaeFMzb0k5OXZPMUo3YnMzQXhlYmRoOGppeDJPa3E2RDFwTjZOUUlsbFBq?=
 =?utf-8?B?ejd3NTlBR0ZYeFM4aWlOZU5lWnp1VDJpWG5XUTNFQ0hpdGlqQ1MrSmVOdnlC?=
 =?utf-8?B?YjZwWXYzMStxNDhEeWlSdzV0VFQ0bC9ubGc5eTd4MHBvNzMwUXFKSmNCc0Zh?=
 =?utf-8?B?TzkzbWdaOUsxdyt6RUc5eGV2WTNPTkJaN0REdzZyYnE1TDg5RS8wOG84aGth?=
 =?utf-8?B?YlpGRHRkV1J3enVRK3lPdG5ZZk5KVUpwN2Zmb2FpZ051ZjJoTHpGWTNORHYx?=
 =?utf-8?B?ZzNnSFN2OWRWN0wxZ0plNGt1RGMra1lwenZFSWExOWo1MXZXT0gyWDRmUUZC?=
 =?utf-8?B?NG1wMUlNdUtvMHRRYVQzc2F6ZVdUYkJzalJHa0k0K0xXTk9KK2FwNlhKQzdW?=
 =?utf-8?B?dFlURENkRUR1Y0p0SG5UOVMxU2RGaEl0V2czVWIrTnQ1blQ3QVlURE9RbnNP?=
 =?utf-8?B?NE4rVVVVM25PaVlEOWpIcUdpdHgxUVNqOEQvR2krcTU0VWo2M2FVNUpCNUVl?=
 =?utf-8?B?K0xBYjk0aElxaDJ3YXRsNDZCMk5XSmNiWFpwUytZaGp5bHYyQXUyQU53ays3?=
 =?utf-8?B?L0NaRElXdkZPVHVPMnJBcjZMN2oxSHhCb3pvTlRSRkhEWkhLWnBhZnVVSUJU?=
 =?utf-8?B?MTRUR05oYlIrSGxreURxc3ZYS2Fsbis2VDBmMHBrNjMxbGF6bWpmZEVSankw?=
 =?utf-8?B?TDRSYWpiOTRyZ3N1OGE5b1FYT29uS3NBbmQ3bVQyQUEzOS9BdnZqL0RnUzBi?=
 =?utf-8?B?QmpqZU9sNzBuVUt2SnRVM3lqeSs2YUhkeVVOWWpNU3RCTEJ0OG1UZkNIa0tY?=
 =?utf-8?B?UFExLzg1djR4aEhmZ3MvQmxUVHFzSGZONEE5ZlRLNTVpVVVHc200MWErRGtt?=
 =?utf-8?B?RDFmaFJsbDdqVHB5aWxlUXZiRlJCVkJDcVFOUjNRZDVqbUVNNHphdHVNdUZ5?=
 =?utf-8?B?cFcwOFVRR3J0YmNlVkV4NU96ZjRyeTVYM0FGR3FIT3czanp2dDloNTEvMW43?=
 =?utf-8?B?Nlg1Umw3QUNsRXcybExxWFFYQU00K1pDTXFBQ2x0WDlNcnNZT09GcUl5MGlk?=
 =?utf-8?B?dG9HV1laMjlDdHR4QVNWNFdtM21NVFE4TlpyeGRFaHp3cWtGbE5kQnlsVHBm?=
 =?utf-8?B?cGRvbGxkckRibUZDRnNMS0E0eStwcDE3a3RYZSthM2J4OWxid1hwSEYyQmxq?=
 =?utf-8?B?YWhmSmhSb0w0S1BXWUYwWWlWekkzR2Yxc1k1dTRWMnNjRkVORGlSbHN3Uk5p?=
 =?utf-8?B?OTNyYnVQR0x4VDBHMTlQUjhHa0xTU2lGcENzWkxzMUc5UFc1bnFaZDZmTVlO?=
 =?utf-8?B?eEZQQThhSWdCemM3Y1MwZFppdDgxSUNBc25OQTA1dzA4VVBGTkEyMkRETXgz?=
 =?utf-8?B?QXdhRDhDMXJpSUU4L3drdUFlZUJFaXNjZjFJM1VmSkVld1dOa1RUNGpYajhI?=
 =?utf-8?B?YmVXY1RTeG5TWS9Odk1WcGNTdStsWGRzSlFGSktiUGpxdW90dFF6UVdxTEhB?=
 =?utf-8?B?K05JNnJYbjlJTE05SjZuaVFPZXhIamFrdWVUYUd2WkFvYW0wWXZidy9VZ1h6?=
 =?utf-8?B?NnpVcTkvQXFXN2ozTjZESWNSVFhvS3Nvd2I4MXdLN3J6QWI5eWFMaFY3OVB6?=
 =?utf-8?Q?UY6IluVKdmLKDi84xOAJEdqXaSTIs0KUZ/mAdiISzTOk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB9979836D741043B3A0FB5F47F549FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec48b0c7-f72d-40e7-b1a3-08de3176bd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 07:45:18.1347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yq6wW2pLu7HP1lVXeXPrMVJJlMmReDx18vxli/kkj1cT9wgtmiMoznpMfckbxiy9QQG4Q1AMG4G3nh89MejH3NvK9+/NMXfHnypvy9AxGGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA5OjAxICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiB0ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3I6IEFkZCBwYXJhbWV0
ZXIgaW4gbWFkdmlzZSBjYWxsDQo+IA0KPiBBZGQgYW4gJ2luc3RhbmNlJyBwYXJhbWV0ZXIgdG8g
X194ZV92bV9tYWR2aXNlKCkgYW5kIHhlX3ZtX21hZHZpc2UoKQ0KPiB0bw0KPiBzcGVjaWZ5IHdo
aWNoIFZSQU0gaW5zdGFuY2Ugc2hvdWxkIGJlIHRhcmdldGVkIGZvciBtZW1vcnkgYWR2aXNlDQo+
IG9wZXJhdGlvbnMuDQo+IEdldHRpbmcgY29tcGlsYXRpb24gaXNzdWVzIGluIHhlX2V4ZWNfc3lz
dGVtX2FsbG9jYXRvciB0ZXN0IGFmdGVyDQo+IGFkZGluZw0KPiAnaW5zdGFuY2UnIHBhcmFtZXRl
cnMgaW4geGVfdm1fbWFkdmlzZSgpLiBBcyBhIGZpeCAwIGFzIGluc3RhbmNlDQo+IHBhcmFtZXRl
cg0KPiBwYXNzZWQgaW4geGVfdm1fbWFkdmlzZSgpIGNhbGxzIGF2YWlsYWJsZSBpbiB4ZV9leGVj
X3N5c3RlbV9hbGxvY2F0b3INCj4gdGVzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBT
aGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxs
c3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBp
bmNsdWRlL2RybS11YXBpL3hlX2RybS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQg
KystLQ0KPiDCoGxpYi94ZS94ZV9pb2N0bC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTMgKysrKysrKysrLS0tLQ0KPiDCoGxpYi94ZS94ZV9pb2N0bC5owqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrKystLQ0K
PiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5jIHzCoCA4ICsrKystLS0t
DQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oIGIvaW5jbHVkZS9k
cm0tdWFwaS94ZV9kcm0uaA0KPiBpbmRleCA4OWFiNTQ5MzUuLjM0NzJlZmE1OCAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL2RybS11YXBp
L3hlX2RybS5oDQo+IEBAIC0yMDYwLDggKzIwNjAsOCBAQCBzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ug
ew0KPiDCoAkJCS8qKiBAcHJlZmVycmVkX21lbV9sb2MubWlncmF0aW9uX3BvbGljeToNCj4gUGFn
ZSBtaWdyYXRpb24gcG9saWN5ICovDQo+IMKgCQkJX191MTYgbWlncmF0aW9uX3BvbGljeTsNCj4g
wqANCj4gLQkJCS8qKiBAcHJlZmVycmVkX21lbV9sb2MucGFkIDogTUJaICovDQo+IC0JCQlfX3Ux
NiBwYWQ7DQo+ICsJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLnJlZ2lvbl9pbnN0YW5jZToNCj4g
UmVnaW9uIGluc3RhbmNlICovDQo+ICsJCQlfX3UxNiByZWdpb25faW5zdGFuY2U7DQo+IMKgDQo+
IMKgCQkJLyoqIEBwcmVmZXJyZWRfbWVtX2xvYy5yZXNlcnZlZCA6IFJlc2VydmVkDQo+ICovDQo+
IMKgCQkJX191NjQgcmVzZXJ2ZWQ7DQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9jdGwuYyBi
L2xpYi94ZS94ZV9pb2N0bC5jDQo+IGluZGV4IDM5YzQ2NjdhMS4uMjIxZmQ3YzYyIDEwMDY0NA0K
PiAtLS0gYS9saWIveGUveGVfaW9jdGwuYw0KPiArKysgYi9saWIveGUveGVfaW9jdGwuYw0KPiBA
QCAtNjg3LDcgKzY4Nyw4IEBAIGludDY0X3QgeGVfd2FpdF91ZmVuY2UoaW50IGZkLCB1aW50NjRf
dCAqYWRkciwNCj4gdWludDY0X3QgdmFsdWUsDQo+IMKgfQ0KPiDCoA0KPiDCoGludCBfX3hlX3Zt
X21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3QgYWRkciwgdWludDY0X3QNCj4g
cmFuZ2UsDQo+IC0JCcKgwqDCoCB1aW50NjRfdCBleHQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90
IG9wX3ZhbCwNCj4gdWludDE2X3QgcG9saWN5KQ0KPiArCQnCoMKgwqAgdWludDY0X3QgZXh0LCB1
aW50MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92YWwsDQo+IHVpbnQxNl90IHBvbGljeSwNCj4gKwkJ
wqDCoMKgIHVpbnQxNl90IGluc3RhbmNlKQ0KPiDCoHsNCj4gwqAJc3RydWN0IGRybV94ZV9tYWR2
aXNlIG1hZHZpc2UgPSB7DQo+IMKgCQkudHlwZSA9IHR5cGUsDQo+IEBAIC03MDQsNiArNzA1LDcg
QEAgaW50IF9feGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdA0KPiBh
ZGRyLCB1aW50NjRfdCByYW5nZSwNCj4gwqAJY2FzZSBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUFJF
RkVSUkVEX0xPQzoNCj4gwqAJCW1hZHZpc2UucHJlZmVycmVkX21lbV9sb2MuZGV2bWVtX2ZkID0g
b3BfdmFsOw0KPiDCoAkJbWFkdmlzZS5wcmVmZXJyZWRfbWVtX2xvYy5taWdyYXRpb25fcG9saWN5
ID0gcG9saWN5Ow0KPiArCQltYWR2aXNlLnByZWZlcnJlZF9tZW1fbG9jLnJlZ2lvbl9pbnN0YW5j
ZSA9DQo+IGluc3RhbmNlOw0KPiDCoAkJaWd0X2RlYnVnKCJtYWR2aXNlLnByZWZlcnJlZF9tZW1f
bG9jLmRldm1lbV9mZCA9DQo+ICVkXG4iLA0KPiDCoAkJCcKgIG1hZHZpc2UucHJlZmVycmVkX21l
bV9sb2MuZGV2bWVtX2ZkKTsNCj4gwqAJCWJyZWFrOw0KPiBAQCAtNzMxLDE0ICs3MzMsMTcgQEAg
aW50IF9feGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLA0KPiB1aW50NjRfdCBhZGRy
LCB1aW50NjRfdCByYW5nZSwNCj4gwqAgKiBAdHlwZTogdHlwZSBvZiBhdHRyaWJ1dGUNCj4gwqAg
KiBAb3BfdmFsOiBmZC9hdG9taWMgdmFsdWUvcGF0IGluZGV4LCBkZXBlbmRpbmcgdXBvbiB0eXBl
IG9mDQo+IG9wZXJhdGlvbg0KPiDCoCAqIEBwb2xpY3k6IFBhZ2UgbWlncmF0aW9uIHBvbGljeQ0K
PiArICogQGluc3RhbmNlOiB2cmFtIGluc3RhbmNlDQo+IMKgICoNCj4gwqAgKiBGdW5jdGlvbiBp
bml0aWFsaXplcyBkaWZmZXJlbnQgbWVtYmVycyBvZiBzdHJ1Y3QgZHJtX3hlX21hZHZpc2UNCj4g
YW5kIGNhbGxzDQo+IMKgICogTUFEVklTRSBJT0NUTCAuDQo+IMKgICoNCj4gLSAqIEFzc2VydHMg
aW4gY2FzZSBvZiBlcnJvciByZXR1cm5lZCBieSBEUk1fSU9DVExfWEVfTUFEVklTRS4NCj4gKyAq
IEFzc2VydHMgaW4gY2FzZSBvZiBlcnJvciByZXR1cm5lZCBieSBEUk1fSU9DVExfWEVfTUFEVklT
RQ0KPiDCoCAqLw0KPiDCoHZvaWQgeGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1
aW50NjRfdCBhZGRyLCB1aW50NjRfdA0KPiByYW5nZSwNCj4gLQkJwqDCoCB1aW50NjRfdCBleHQs
IHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwNCj4gdWludDE2X3QgcG9saWN5KQ0KPiAr
CQnCoMKgIHVpbnQ2NF90IGV4dCwgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLA0KPiB1
aW50MTZfdCBwb2xpY3ksDQo+ICsJCcKgwqAgdWludDE2X3QgaW5zdGFuY2UpDQo+IMKgew0KPiAt
CWlndF9hc3NlcnRfZXEoX194ZV92bV9tYWR2aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2UsIGV4dCwN
Cj4gdHlwZSwgb3BfdmFsLCBwb2xpY3kpLCAwKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKF9feGVfdm1f
bWFkdmlzZShmZCwgdm0sIGFkZHIsIHJhbmdlLCBleHQsDQo+IHR5cGUsIG9wX3ZhbCwgcG9saWN5
LA0KPiArCQkJCcKgwqDCoMKgwqAgaW5zdGFuY2UpLCAwKTsNCj4gwqB9DQo+IGRpZmYgLS1naXQg
YS9saWIveGUveGVfaW9jdGwuaCBiL2xpYi94ZS94ZV9pb2N0bC5oDQo+IGluZGV4IGFlOGEyM2E1
NC4uYmJlZTA2YTlkIDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfaW9jdGwuaA0KPiArKysgYi9s
aWIveGUveGVfaW9jdGwuaA0KPiBAQCAtMTAwLDEzICsxMDAsMTggQEAgaW50IF9feGVfd2FpdF91
ZmVuY2UoaW50IGZkLCB1aW50NjRfdCAqYWRkciwNCj4gdWludDY0X3QgdmFsdWUsDQo+IMKgaW50
NjRfdCB4ZV93YWl0X3VmZW5jZShpbnQgZmQsIHVpbnQ2NF90ICphZGRyLCB1aW50NjRfdCB2YWx1
ZSwNCj4gwqAJCcKgwqDCoMKgwqDCoCB1aW50MzJfdCBleGVjX3F1ZXVlLCBpbnQ2NF90IHRpbWVv
dXQpOw0KPiDCoGludCBfX3hlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0
X3QgYWRkciwgdWludDY0X3QNCj4gcmFuZ2UsIHVpbnQ2NF90IGV4dCwNCj4gLQkJwqDCoMKgIHVp
bnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWludDE2X3QNCj4gcG9saWN5KTsNCj4gKwkJ
wqDCoMKgIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWludDE2X3QgcG9saWN5LA0K
PiB1aW50MTZfdCBpbnN0YW5jZSk7DQo+IMKgdm9pZCB4ZV92bV9tYWR2aXNlKGludCBmZCwgdWlu
dDMyX3Qgdm0sIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90DQo+IHJhbmdlLCB1aW50NjRfdCBleHQs
DQo+IC0JCcKgwqAgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLCB1aW50MTZfdCBwb2xp
Y3kpOw0KPiArCQnCoMKgIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWludDE2X3Qg
cG9saWN5LA0KPiB1aW50MTZfdCBpbnN0YW5jZSk7DQo+IMKgaW50IHhlX3ZtX251bWJlcl92bWFz
X2luX3JhbmdlKGludCBmZCwgc3RydWN0DQo+IGRybV94ZV92bV9xdWVyeV9tZW1fcmFuZ2VfYXR0
ciAqdm1hc19hdHRyKTsNCj4gwqBpbnQgeGVfdm1fdm1hX2F0dHJzKGludCBmZCwgc3RydWN0IGRy
bV94ZV92bV9xdWVyeV9tZW1fcmFuZ2VfYXR0cg0KPiAqdm1hc19hdHRyLA0KPiDCoAkJwqDCoMKg
IHN0cnVjdCBkcm1feGVfbWVtX3JhbmdlX2F0dHIgKm1lbV9hdHRyKTsNCj4gwqBzdHJ1Y3QgZHJt
X3hlX21lbV9yYW5nZV9hdHRyDQo+IMKgKnhlX3ZtX2dldF9tZW1fYXR0cl92YWx1ZXNfaW5fcmFu
Z2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3QNCj4gc3RhcnQsDQo+IMKgCQkJCcKgwqDC
oCB1aW50NjRfdCByYW5nZSwgdWludDMyX3QNCj4gKm51bV9yYW5nZXMpOw0KPiArdm9pZCB4ZV92
bV9iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDMyX3QgYm8sDQo+ICsJCQl1
aW50NjRfdCBvZmZzZXQsIHVpbnQ2NF90IGFkZHIsDQo+ICsJCQl1aW50NjRfdCBzaXplLCB1aW50
MzJfdCBmbGFncyk7DQo+ICt2b2lkIHhlX3ZtX3VuYmluZF9scl9zeW5jKGludCBmZCwgdWludDMy
X3Qgdm0sIHVpbnQ2NF90IG9mZnNldCwNCj4gKwkJCcKgIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90
IHNpemUpOw0KPiDCoCNlbmRpZiAvKiBYRV9JT0NUTF9IICovDQo+IGRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiBiL3Rlc3RzL2ludGVsL3hlX2V4
ZWNfc3lzdGVtX2FsbG9jYXRvci5jDQo+IGluZGV4IGI4ODk2N2U1OC4uMWU3MTc1MDYxIDEwMDY0
NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiBAQCAtMTE2NCw3ICsx
MTY0LDcgQEAgbWFkdmlzZV9zd2l6emxlX29wX2V4ZWMoaW50IGZkLCB1aW50MzJfdCB2bSwNCj4g
c3RydWN0IHRlc3RfZXhlY19kYXRhICpkYXRhLA0KPiDCoAl4ZV92bV9tYWR2aXNlKGZkLCB2bSwg
dG9fdXNlcl9wb2ludGVyKGRhdGEpLCBib19zaXplLCAwLA0KPiDCoAkJwqDCoMKgwqDCoCBEUk1f
WEVfTUVNX1JBTkdFX0FUVFJfUFJFRkVSUkVEX0xPQywNCj4gwqAJCcKgwqDCoMKgwqAgcHJlZmVy
cmVkX2xvYywNCj4gLQkJwqDCoMKgwqDCoCAwKTsNCj4gKwkJwqDCoMKgwqDCoCAwLCAwKTsNCj4g
wqB9DQo+IMKgDQo+IMKgc3RhdGljIHZvaWQNCj4gQEAgLTExNzIsNyArMTE3Miw3IEBAIHhlX3Zt
X21hZHZpeGVfcGF0X2F0dHIoaW50IGZkLCB1aW50MzJfdCB2bSwNCj4gdWludDY0X3QgYWRkciwg
dWludDY0X3QgcmFuZ2UsDQo+IMKgCQnCoMKgwqDCoMKgwqAgaW50IHBhdF9pbmRleCkNCj4gwqB7
DQo+IMKgCXhlX3ZtX21hZHZpc2UoZmQsIHZtLCBhZGRyLCByYW5nZSwgMCwNCj4gLQkJwqDCoMKg
wqDCoCBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUEFULCBwYXRfaW5kZXgsIDApOw0KPiArCQnCoMKg
wqDCoMKgIERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QQVQsIHBhdF9pbmRleCwgMCwgMCk7DQo+IMKg
fQ0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkDQo+IEBAIC0xMTgxLDcgKzExODEsNyBAQCB4ZV92bV9t
YWR2aXNlX2F0b21pY19hdHRyKGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHVpbnQ2NF90IGFkZHIs
IHVpbnQ2NF90IHJhbmdlLA0KPiDCoHsNCj4gwqAJeGVfdm1fbWFkdmlzZShmZCwgdm0sIGFkZHIs
IHJhbmdlLCAwLA0KPiDCoAkJwqDCoMKgwqDCoCBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfQVRPTUlD
LA0KPiAtCQnCoMKgwqDCoMKgIG1lbV9hdHRyLCAwKTsNCj4gKwkJwqDCoMKgwqDCoCBtZW1fYXR0
ciwgMCwgMCk7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkDQo+IEBAIC0xMTkwLDcgKzEx
OTAsNyBAQCB4ZV92bV9tYWR2aXNlX21pZ3JhdGVfcGFnZXMoaW50IGZkLCB1aW50MzJfdA0KPiB2
bSwgdWludDY0X3QgYWRkciwgdWludDY0X3QgcmFuZ2UpDQo+IMKgCXhlX3ZtX21hZHZpc2UoZmQs
IHZtLCBhZGRyLCByYW5nZSwgMCwNCj4gwqAJCcKgwqDCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9B
VFRSX1BSRUZFUlJFRF9MT0MsDQo+IMKgCQnCoMKgwqDCoMKgIERSTV9YRV9QUkVGRVJSRURfTE9D
X0RFRkFVTFRfU1lTVEVNLA0KPiAtCQnCoMKgwqDCoMKgIERSTV9YRV9NSUdSQVRFX0FMTF9QQUdF
Uyk7DQo+ICsJCcKgwqDCoMKgwqAgRFJNX1hFX01JR1JBVEVfQUxMX1BBR0VTLCAwKTsNCj4gwqB9
DQo+IMKgDQo+IMKgc3RhdGljIHZvaWQNCg0K
