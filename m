Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24206CAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 09:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D533810EBE9;
	Fri, 12 Sep 2025 09:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmF+Qtdf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FF810EBF0
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669859; x=1789205859;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=xssB0oAEnd5IgOPkEehXLbmxwp70qvEtMcWSvGeF26c=;
 b=VmF+Qtdfdrf65ML6FOIodfK4Todjg062FRkP1E2S5SJRxLrtSAwB+IpD
 8MlMqOYext3NKhSiksEFOKsKC+RdeQJD4gnCBydZfkjqch7G5ANUKjZdn
 Ecni9NRN/ZugsrvwXpWW9txOxvlIVgb+nQJJtglC5LphgPgaFeCFE2iNb
 pMz5tFqhvSSFdPXUQIFHzPMBU7/tbh15FTwvdqaoLz2CaHNIxNqvoVUGz
 +VmPMSV/qG0M4JEXu7Z3HHVuIR9pZns68QISFTZtEBEysH1T+Z0aUqurY
 +0yTzHlfu5ZjBVkB1dzBo9PD/NDfPlEgD5iVoaDnt0YsPTeMwCBHq2NHL A==;
X-CSE-ConnectionGUID: K9dCENgyRZqnJCExox870A==
X-CSE-MsgGUID: fLsU4uZ3Qq+YpmKVgmg8CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70635453"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208,217";a="70635453"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:37:36 -0700
X-CSE-ConnectionGUID: H5xvBzgjQCW7ppTSs4QicQ==
X-CSE-MsgGUID: E9I7fGMORYO+LmcTCzy9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
 d="scan'208,217";a="204917133"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:37:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 02:37:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 02:37:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 02:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRZLXVr5RYSWI/Dd6zGkIpt+O0SXYVfAODDp4fktNk5LjnWrg6h+VABfSntgTiYuN+uGG1nD0ysA63esgKqlYCOk9fk5aMLytbtCIqMUelAA3p7vZRRhj5CR916HB/g75rtOCYOVRIgTmSrMG0H2e6Er8cavx+/sFcDiAdaJGrmQO67+tBt1JllFD010NDSD3o45lfRUR4q1wgzfq1PPZBqcXUWgFAq/CTChgKVttWS0WgU5WSqbEupNT8poOMGCYI9XkIWKkid9DdVopcc1lbOOPfyi2r37shNJsm4l9g36vGobVvdLOHpmKJOxFPi6MGIsKCRGVAbedK7zggtUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIPo8Q0ZEE7Oo9MPz+w8++Is6PHjJ/A/YzAvvUcmwA0=;
 b=UyCdpYGlTSZJV29SNom6J7Xbzso88HEjNeoLYEUk6ijg74SQ0IZKalZmAS+NxvRXQQtY1/W9vSNWpjyDW10Xbj5BCVsl7lx7XmcO1e7Ddok5J1U4ZVr5tAW6o4K11Rd7r6gT+0mGaggf+87E8Kr+h7fv+/BP6gayMN/GUXIafrNw1qKRM+Y4n7eFdb32HPCI0ASd1F7J/xqUL/0oX3hQLyWt1bsyXzBmqSD+dXJiqBSEfl3Aod72RP1nRO5zs9qNSqmpDzMLkwftUxTpz0v/QQWcPiFielshFohlDw5XlXFFUpvaRSBlgEfyf9j7R8eHk72A+0Ed9Wfoih64QonvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by DM3PPF97A7CBDC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 09:37:28 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%7]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 09:37:27 +0000
Content-Type: multipart/alternative;
 boundary="------------zaQf0uM3P6F0F1Sty8o6XdQ3"
Message-ID: <b946be8a-896c-4ec8-b6fc-24250cb4dd94@intel.com>
Date: Fri, 12 Sep 2025 11:37:24 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fconfigfs=3A_Skip_survivability-mode_subtest_on_VF?=
To: <igt-dev@lists.freedesktop.org>
References: <20250911154411.1372973-1-jakub1.kolakowski@intel.com>
 <175763043402.328030.463738435981453197@1538d3639d33>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <175763043402.328030.463738435981453197@1538d3639d33>
X-ClientProxiedBy: VI1PR0502CA0013.eurprd05.prod.outlook.com
 (2603:10a6:803:1::26) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|DM3PPF97A7CBDC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 48108680-1b9c-456d-c429-08ddf1dffca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qm1FTC9RM1JDRW9HOWt5SWRhZ2NHbXVNblI1V2tJUUZiTWx5b2k2NEhCY09E?=
 =?utf-8?B?Y2owYjJZMElDTlF1Vkx2L2Y1U1MyOEtFSytpcWlMSlJVa3JvRzYybmtZUnZX?=
 =?utf-8?B?cFEzQ2hqTzlCSWFhMjRIaVBTRVh3cGRHeGNHV0ZrQm5DT0F4ZytxSkp4c3h5?=
 =?utf-8?B?aWdvYXZ0dnEwb3BQdE5SZDVoSHpDUWFzUWVnY3lQUkl1U2paNHBrRDZxTnVz?=
 =?utf-8?B?VnoyK21tMVBXQ2svUU91anRKVmMzbEU2TjQwNnFpNjVpZ2hyUHptZHpvaHEz?=
 =?utf-8?B?NVhDVEsralpYVzB0R1FBYnN2Mk9hR2lIYnhNVTZrYko5ZGp3MG9aVEZyTkZB?=
 =?utf-8?B?SC95dFRpVjRtT1BlSlhTK0xETVNWeWdxOEJqcENvd2RRcjNSdEFxUWdsZmRt?=
 =?utf-8?B?UnhLelpML2pxdVdvMlJXdktheS91Tjl4TnhyVTRjaGcrU1czd0NIWjQ0M2NJ?=
 =?utf-8?B?TlQvSFB2bXBzY0hwL1p2MGZmcFZUcUtVUUhvUE5vS0pieW5qMUt3WDF4emN3?=
 =?utf-8?B?RW9GQ2FjYkpiM3VYY3Jvb1E3RVRjRVZWS1JOZURJTlNTZ1RVaVVvKzdKTkFW?=
 =?utf-8?B?MWowS2JKZm91OEsxWjBLaDArNXZQZEVGYU1FRTRNeWErSXNxai9CMng0dk42?=
 =?utf-8?B?UkpuVkc5Kzg2ZjZqL3FRb2wrcEt6RWNQYW9xb1diVDFPY3Q1NWcrUTR3M2Jy?=
 =?utf-8?B?bkNiU0J4ZXJZNlFHN1FHSW9wWnpqNTU1K0NSSjVHb0lUNzFOR3NweG5zdDBY?=
 =?utf-8?B?eEJsNE5kSEVMTjc2OTRBa2RZM1RCR2w3ZXgzNUd6ZDZQck1uYjRZTjM0L1pX?=
 =?utf-8?B?Q01kWEg0cERXbjZPUnB0dUxQRnNTelpkelJwajdUbFZWbFBPYkpSNDdhR2Jn?=
 =?utf-8?B?MlRQSzVGTGtZNU5FdHhSaDJKQ1BUMXRWMmljdHZxdkNoaTJnZERVN3VVVkhC?=
 =?utf-8?B?dkhoRHl0bUJPRFdIUWd5TWJndUJLR04ySjl3RFVpOFZYSnF0NEZBYkVWRUg5?=
 =?utf-8?B?NTA2Qmk2U1ZZZmFIRGdOWkpYNk1NcEpiOTJDb2Q5WXZqZ0hzOVp5bjZ0dzA3?=
 =?utf-8?B?MVNwZFZyTEFsTzF3ZFZ6Zzk2a3QzcklZNGRVbm1DS3A2QWkyRzBVNERYNEJP?=
 =?utf-8?B?aTU1Nzg3djh6UTFJajZWc1c0cWF2c1FnVFhjbzVyNEhPa3lsSXo1K2tWNUwx?=
 =?utf-8?B?dWxOVkthcDFPRmE5c1JDNk03dE0wYlY2ZTRBdk42c1ZYa25HUFNEOGlUS056?=
 =?utf-8?B?V1p2bmdoR2pLMHhneE5vS0E0YUVaVS9lMlBFTVlmRFpPbzRJUGZHUWFlakpi?=
 =?utf-8?B?UkhtL0N3WnYxU01QYmVjSENmM3RRdHEwYkhPZFpseGUxdVA1bFN0MHk5WjYw?=
 =?utf-8?B?cU9ZYWRmaEI5cVpieVNMNXc4dzk4ODlVSzJRSm9QbUJ3S0dIZGlYd2l1VVdN?=
 =?utf-8?B?VTJpb2ZKK21XcXhBeFE3cTVhZnFUb0kxajFPZGcxQ0hpTE0zWkF0OWRkaG5w?=
 =?utf-8?B?cDQ1MGhNTWt4YVNKZXNlOTFWMXhsUU92L1lMODhrUHFBemNJVFEwTkVCVVpF?=
 =?utf-8?B?NjdQN1E1WUlRbXJLVEtWMCtONVZEQjNaT1liM012eEtKSGUzNitUNHZxQlVI?=
 =?utf-8?B?RlEvUnlOUTY2SjZucVhvSEJxYW0zbzI4TTFMSFo1TU9oOWZzMnBvQmxjaDB0?=
 =?utf-8?B?QmVBVG4vMnRyeFNiV2loczFvaHNsRWk2bUx0NFBMY1lla0xNcnZjTkR6QTBL?=
 =?utf-8?B?cjZJVGFTQzAwVWNPUTQvL2ZSOWwrOE5jaXhDNmM1MzhtUzhxSG13eXdCWUc0?=
 =?utf-8?Q?DC6oO8Zw7te6vHzfBBafr1L50yIKnsDFuLRrU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2NaSVVIOUo3M09nRVhOSFNVTEJtNDNFdndmQkw3eGE1L3A4blpHVDVzNC92?=
 =?utf-8?B?aTBhRklhbzdQeXk2UjU3N3BCKzZadVE2OURLTUZuSEkzSXJUYlE2dHZBSklR?=
 =?utf-8?B?NzE2dEo5SHNuMTQ1NEdNMHNLd2ptZzNsR3MwWXdSYnNHSCtrSEZCUTRlOUw2?=
 =?utf-8?B?eWFhSytIVEdaQnRVTGxyWnBBYXpkYXV5Wm9melp5eFFkNjF0VEdmZ1lCTFF1?=
 =?utf-8?B?VlpBSzZISzdiRlo0bFp1Nm1NYmc5dmRLR0VsSC9YdXNxUkN4a2NQSHdqcTdB?=
 =?utf-8?B?M25vZlozUlJqK1hubnA2Q3c0VGNXaG1ITWIvVHIxRnQ1TWxFcnFRTEZxOElK?=
 =?utf-8?B?OThpL1RQdFkwWnhiZ0hJLy9hSW5uUzRJRFF2czF2U1FXaTZiTFNsU20wdEd2?=
 =?utf-8?B?bXExR3ZqUGdhRUFGRGdUTXdoYUlmZzBZTFgza0V1R3hneDB4dTduLzRrYmRS?=
 =?utf-8?B?eXpsVDUrTnBmZG5pNmRHRFQ3U2RhRXJ4d3M4Q3lNSGRCeENidUFoTSsxMnR3?=
 =?utf-8?B?aTVwL29qWDJaNSthdGFsYTl0c0UwZVF3RUdDUkFmVW9xRG1qVTNjOHBFOW5D?=
 =?utf-8?B?TzVheVhYSWtLT3NESFVlZDlTTTZ3bFdyNm1qVTdCTWxKUXVjU0ZlTUVBaGdi?=
 =?utf-8?B?aXg5RjZmL1d1K056L2dUeGpDeUxqVnROeURWSGhGZUphNk9mQXY1UEhIaHZP?=
 =?utf-8?B?RVBlem5kNFMxdGpvQWtHWkUvN0tKZ1ZxT29ZVzNTQ1A3ZERIYjROdFgvWUI3?=
 =?utf-8?B?eVRjTVVseGU5Tjk2a0dteXE5b3BDVitXVTY5S1BKUnFzVlFVSnZuWUV3dEMx?=
 =?utf-8?B?VG9pNTROc1NRMHZWNUVURzI3T1BUK29jWCtTN1NwREp2dWxEVEhEckNSZE5H?=
 =?utf-8?B?WlR3Z2gydDZKWUthdTl0bG03R0Vxbjg0djF5cktQbmViNXBEKzdKTUs4dFZR?=
 =?utf-8?B?MUpYVGNjWUkvUFVpZ2g0Ym1UM211cXMrOXV5bG9YQ2hXbkpJYVlTNVhNVFU4?=
 =?utf-8?B?RDZBaGRnMFEzZzA4Yzl6Z3lyUWFkcXpxOGRMVXZ6QkxobUFKeTZ2bDR0MUxK?=
 =?utf-8?B?SEl0ajZuQTNpam1FSEFmMENuNFV5anRvNmlVaG5xcndLN0FuUXFDR0cyZVNr?=
 =?utf-8?B?TVhhS0VQeWRVdTI0dnpEMzFUOFlpQkE2b3luZFhXOW5IajdZdlBRUDFrV0hO?=
 =?utf-8?B?WU9Sd3Fyd0Q1d1NOM3VLc2VPbEhBM0dSSGk2eGlPcDJNR1ZSWXc4N3d3aXF6?=
 =?utf-8?B?MDVzZE43UGxreEExdXBMQ3krR1ljaE14bWRJbEJtVXFPSVFsOXJGdXNDa0ZX?=
 =?utf-8?B?c1FDc0hoa2tFVzZMa1lDZVI2SXJlRG5LNEpKOEdiRU02VTlocTh4Q1Eya296?=
 =?utf-8?B?RWlHMncxZFFsRGtFam8yM2ZFZk9YRERTRFhhampwamRlVmFHZWZOa1RPbDUz?=
 =?utf-8?B?NDJjS0htRUxNN2l5ZGpSRE1BYzFNK0xrVnJ0bTczRktsbzhpNzI5Y2dmMjBl?=
 =?utf-8?B?ckM3cXNXOWlQb0pMSkc4RjFHNVhzTHV5OW1rMzhqWVRzNHIvai9VRGY5OVht?=
 =?utf-8?B?VlE2UElFT2UyNndpdDBFOXYyTDFDY28rMmx3eWpPaVNqSlVkMHJZcEtzVUF2?=
 =?utf-8?B?YlJHTmRUSTVvSUtIUU1TNmdqQ3ZVcXhza2M3eE5mUlM3ckxKc3FLZGtJcHIx?=
 =?utf-8?B?czkwV2Z3YkxsVldyQjI3RFJzdkl2czZ0UkVTVzJTQmxjSVJieDdFOGlBMjZF?=
 =?utf-8?B?cmswaDh0QXJJeTREY3U1blUvTkd6ejJUL0hBRGN3cUREOWhxMEpOaThjSVJo?=
 =?utf-8?B?RHI5NG1nQU1YMnZRNnhzSDRCOFFuSWlmd1BCcEcvVGQ4YkYzTmNCOXZZNHgz?=
 =?utf-8?B?ZEtqVHZTdGs1eXF4RjMvOTFGZS8vdHIyWkZRYWErVTVTaGwzV0tHL0ZRaWp4?=
 =?utf-8?B?ajgxdldKWGlWaS84QXdFL3QxalFDeGFCWGl0VlhkMFh1S09vdlY4VWFXTTFw?=
 =?utf-8?B?Rzh0RitoS1RCdHQ0ZjRDQ0JmVjdhWEhkZzBFMlR1dDYzWXcxOFFtMXVQMHdF?=
 =?utf-8?B?ckdqdjJQQnBFSzAvZVZTNGhuQitPOEJvcFNndmluMmM5Z29lR0x2bmpXem5L?=
 =?utf-8?B?Mm9iQWsyYWhmaDZaLzBIZEkxUVhFRHd4d2tKLzVTd28wbEM1TmZJWEpGQnN3?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48108680-1b9c-456d-c429-08ddf1dffca6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 09:37:27.8901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /elsvPOtJGxd+14xt0y+4v+LMqPxzTAn08M9t366gSfKC4/DV0TgS8eUce0wrcx8tT2cMcUCblfxbNvZAgjJZZbX5zroUuJiVpIBRBwBGg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF97A7CBDC1
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

--------------zaQf0uM3P6F0F1Sty8o6XdQ3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/12/2025 12:40 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_configfs: Skip survivability-mode subtest on VF
> *URL:* 	https://patchwork.freedesktop.org/series/154403/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/index.html
>
>
>   CI Bug Log - changes from XEIGT_8536_BAT -> XEIGTPW_13734_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13734_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13734_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (11 -> 11)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13734_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_module_load@load:
>       o bat-adlp-7: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8536/bat-adlp-7/igt@xe_module_load@load.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-adlp-7/igt@xe_module_load@load.html>
>
not related, my patch is only changing xe_configfs test
>
>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13734_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@xe_evict@evict-beng-small:
>
>       o bat-lnl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-lnl-2/igt@xe_evict@evict-beng-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +9
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>
>       o bat-lnl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +2
>         other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o bat-lnl-2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8536/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html>
>  *
>
>     igt@xe_vm@bind-execqueues-independent:
>
>       o {bat-ptl-1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8536/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html>
>         (Intel XE#5783
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html>
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8536 -> IGTPW_13734
>
> IGTPW_13734: 24b9037c54bba3b7190de731812a38c2cbcdd705 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8536: 8536
> xe-3729-a433a14cc397ef049ef273a3d4404d46a20a28cb: 
> a433a14cc397ef049ef273a3d4404d46a20a28cb
>
--------------zaQf0uM3P6F0F1Sty8o6XdQ3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/12/2025 12:40 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:175763043402.328030.463738435981453197@1538d3639d33">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_configfs: Skip survivability-mode subtest
              on VF</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/154403/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/154403/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8536_BAT -&gt;
        XEIGTPW_13734_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13734_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13734_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (11 -&gt; 11)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13734_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_module_load@load:
          <ul>
            <li>bat-adlp-7: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8536/bat-adlp-7/igt@xe_module_load@load.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-adlp-7/igt@xe_module_load@load.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    not related, my patch is only changing xe_configfs test
    <blockquote type="cite" cite="mid:175763043402.328030.463738435981453197@1538d3639d33">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13734_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@xe_evict@evict-beng-small:</p>
          <ul>
            <li>bat-lnl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-lnl-2/igt@xe_evict@evict-beng-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
          <ul>
            <li>bat-lnl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>) +2 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>bat-lnl-2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8536/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@bind-execqueues-independent:</p>
          <ul>
            <li>{bat-ptl-1}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8536/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783" moz-do-not-send="true">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13734/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8536 -&gt; IGTPW_13734</li>
      </ul>
      <p>IGTPW_13734: 24b9037c54bba3b7190de731812a38c2cbcdd705 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8536: 8536<br>
        xe-3729-a433a14cc397ef049ef273a3d4404d46a20a28cb:
        a433a14cc397ef049ef273a3d4404d46a20a28cb</p>
    </blockquote>
  </body>
</html>

--------------zaQf0uM3P6F0F1Sty8o6XdQ3--
