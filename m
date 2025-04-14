Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF52C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 23:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF6C10E330;
	Mon, 14 Apr 2025 23:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iid7NQoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E596810E321
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 23:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744673198; x=1776209198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F3GE3DpsNNQeo9gNn+e0VRJoZBJmffZPMMZ7n7c68r4=;
 b=Iid7NQoKrqGfroz5Aba/vg2iLDMQvy7S+Ot8ty3bybioffoU/APmK+jJ
 R6d8+zotvQr+MoHnPHmI1NenjYeVp7g1jT00CI/9b9PZ1rUgLqWrh6IHv
 x1WPnmveolmxi6Rc0ekpqg9u0u2gCzaKMBamxoOpblmKeWFQUVeI0gd4D
 eF4JGRzAYmheRmW1032H6lc5IakDr/rbp4vICMMuio7OkW+yW542MtzdB
 FG0F/V0HUN5LAFpdcppVxaFeUlB/ZFEynTOV9Hjm9hifzb/Wl55ZUXswQ
 YTP7xARJqKNvIm459XUmhDMqR3Wrh5ULpx26JUCLKImydPP1BmfzJlJ5y A==;
X-CSE-ConnectionGUID: vhMDTp4RRZi6zV+KeKzbeA==
X-CSE-MsgGUID: xLWHHJZlRdGjEeywxEVDJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46324211"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46324211"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 16:26:37 -0700
X-CSE-ConnectionGUID: fCBaUuP9TIKJTKRWVGbP5g==
X-CSE-MsgGUID: YFZsFK4DSZCNNuWQ8d6aTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="160967444"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 16:26:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 16:26:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 16:26:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 16:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFEn2bbMX+J8LZjbH+0auO3q6j0PR5/AkvnNJgRI430Qgyy67f0dxP6w3phywV69vGPhbe4TD7v3+Wsup8Q4ZbX4GSqCP1Fr30lcOwm/AJ+fhQRyV8lgmHit0zX/48SlD1X5mW1guwL5qxMLVkhoPr8RPm8672/ZDNWdMGw5jsbm6Z7vqHDRf5NlB2Z4ivbMEGGPWixHtGpnUdROZRLq3TiZfVJyPmltp/hrj+mdS6BFfvOpUqdT9oDeOtlZBiczME1TYU7dX7ak10XrBNehal53pknZASJZlHBZbthn7SpZAwa6lKpVogfP/iwFuahd8DfBKGT5LwbCiwq2gfe89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWnDDd4nqNBMSrbZbk+78V7XB4WUtPPU8J4GHKkewlg=;
 b=IHoKAODBNYuONU3fEdxuNs/bR8iJFPaFx/S+7enClqWkyFsfNGWvLv66+C+37qYyDQTKmxUIFwlJBcsCnd1RXwf0WrPPGa/u4U7EPR7GQ/j70fjWWuqsHh3P8VwtS6amkfqdPbga8lI+2WcnR+VvQEGk05pJXeLuYDrCoWk0UNzXeXg82oqboDh3GpME4Tt6YDUOdLxb7eVxU1z9AgU5D3516bQgAMXkFZttelLYzse3obXXaLjwQrfV34Ee8cEB9ETjKXlCibPV8h7QkmApFw7dCHYm3bU1y0zeOxE7AukCASIQ6n9Bk4xTowi1c3BDGFJ7QKwTExxJSr0HC9MpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 23:26:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 23:26:20 +0000
Date: Mon, 14 Apr 2025 16:26:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Get stream status on read error
Message-ID: <Z_2Zmlzw_MLkAyOs@unerlige-desk.amr.corp.intel.com>
References: <20250409233441.143402-1-umesh.nerlige.ramappa@intel.com>
 <877c3reoyf.wl-ashutosh.dixit@intel.com>
 <Z_2J4Akq3ttJHKM2@unerlige-desk.amr.corp.intel.com>
 <8534eas55c.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <8534eas55c.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0367.namprd04.prod.outlook.com
 (2603:10b6:303:81::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: dd63e755-b9d1-4656-91a7-08dd7babc367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXU4VEZsK3cvYk5Wemo2bndDeGpCa1N3OEhPNkw2UnNQSC9jM1FkNkNPdEJH?=
 =?utf-8?B?TDNFbTN6MEZWUS9zRlQ0MWMzZW5sejJDMkVFcng0RUJ5a3Z4UmxoYis0WkpZ?=
 =?utf-8?B?MTNOUTB6U1grQWREdGFneDlkQVozUXZWNmYxZVFDUG5PZzRZUnRxTXNaenda?=
 =?utf-8?B?KzJObXdNazFPYTRYemw5N1AyVlZWT0hZdDVqQnFxWnJzbmIrTmhvL0I0aFpv?=
 =?utf-8?B?YjBkUkh1TiswOFVTWlVvVzdNZ1g3TG54ajBCLzFTZFJyTDN2VGU1VGZWR3do?=
 =?utf-8?B?OFFManZuT3BFU3BBbDNHMWlpRVFhdGsrWG1qanBHMEdSTEl1dHFqU0V4d2oy?=
 =?utf-8?B?WW81eThCZHdiYlZlVGZveDJPRE5xblhuNUVIM1hMNzdDWEN3dHRjYkwrbWFD?=
 =?utf-8?B?SCsvMFNQMGVQMUhkbG5nZ20xT010b1Q1NmJyTWN5MW5FYjZ2TWk0WHZhbGFi?=
 =?utf-8?B?OHc0ckZLZEUrTkNlM3p5enpmTlVVV2RhemJMYU40bWVyck9DN1ZxZVBNWGJ4?=
 =?utf-8?B?ejJndk5TNThLUFh2a2Y0dXY4T1ErWXVMT0RGUVpvMUtCUS84SDF5ZVhRd3Fm?=
 =?utf-8?B?bWRhcytZMVcrUHpuYXNuVjdiQWJnN21KbTZya0ZldGJ2SVgrNU5ScFB6YW04?=
 =?utf-8?B?d0VhdDdRY2VhaC9HVXBoOS8raCt2NmhHSXVzbW9QYlppa2FCL2JvMk5XcXZP?=
 =?utf-8?B?TzlEWE1Eb2JDSmwzSWswaSt3ODVScUpQQWErekhyVjJheEhXTWVtZGZQWWZN?=
 =?utf-8?B?blFzNmJ5cFVPcTNva3d4M2RzR2VIQ2lSZlpVbnY0di9QUGQ3VU9HRG1NcUJC?=
 =?utf-8?B?Q1VlTEpVMExIQ2JDUnRuS28vNVhhS0hteTJLNkpCdXk2d3RIRkhxUG1LUGRD?=
 =?utf-8?B?VDgxMGZUeVBHMWg0bkhZZ3VLWHRYbUVmR3dPQnp2cDZ6alYwcG1XVFo2c2Np?=
 =?utf-8?B?Mzg1TDhRaVdoUk1XVXltOEdtei9BZGtnTVZYNXhmcG93TmowTGlGQnVCalRN?=
 =?utf-8?B?R2Voa09pNXZMVjYxVDVVNVRXVVovdVVMb3ZoWkU5ZmovTGd1STl1dWE3NlJy?=
 =?utf-8?B?SC9iTnJVZ0duM0F0UFNiVm1VSzNwbXhKazBKdW8rODQ5U3kyYUZYUklQRFIz?=
 =?utf-8?B?Z1NxR2lHN28xZW1ZT3ZjSVE0OEk1YVBlMzZBODZPazYvSkpxZlpuMVJTVnJ3?=
 =?utf-8?B?WGp5TW1SdmE4TGR0YWZyNlNHdktmT0p5UFpTNVpNMUxicnpuUDk0LzV1THNH?=
 =?utf-8?B?cHhzdHYyZGRyZjBGaW5HZE93cjQ4azFtZVFqT2FFR3c3WEN4c0dnMEF2VnZa?=
 =?utf-8?B?Q1oxU3JXclp6ckRuL29LaUdveUNtekx4WCtlSXoyd1p5Ykwyd3JsUjdqeVdJ?=
 =?utf-8?B?ZkR4VldDYlNtZ2tudGhiUFFKWmVSaEVsaGdMeGx6T0MxMjZ5QjNCSDdVMmlW?=
 =?utf-8?B?QnFzbG41MEFpVDZPOVBJb1Fnc0lMV1c5dGZRUWdTTTZ2Njd0bk83SW5kbDFj?=
 =?utf-8?B?V3BraWdGSG1sSFptUzlEdzlTbDhmSldISWJmWkErb0tYUjFoalcrZnJzNitl?=
 =?utf-8?B?Yk1oT0tiN3Vya2drek1TYWpnbUV0MDN4Y0tld25mUlRNdW03UGpMM3ZublZr?=
 =?utf-8?B?bVZqb043MVd0TUtxdFlhL04vVTBGTldLM3NIeEJrSXJFdDVTL1hTZmxPbEQ0?=
 =?utf-8?B?YzJoSm5OVjhRRDFVVkZEb3BrRmllaVM2WWNxKzdnMXJhN2J6MUdFaDYvOTFh?=
 =?utf-8?B?Ri90Rm55NHprc3ZuMzI0cVE1eVZTdXp1K1JjT2MrQU1HM2NCMkptbEhpVzRk?=
 =?utf-8?B?NWZzMDZ2Q0hITEkrZkUydUNxY29saHVwV3BObE0wSVFIUndVcVFORUpmUGwy?=
 =?utf-8?B?M0xscEZtNWhyZjNCTmdRS2szVHQwcGlMOHNKek1HQU5ZeUFnUk1YRGlYVWt5?=
 =?utf-8?Q?x5QXjGI1048=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWpNY1M2Qlkvb29iendYU0JWTmJDUU9lSWZtdmpaYlp3Y29pZHBLMm9xclJn?=
 =?utf-8?B?V3VMUm1oczRvajRsRExjUnBIUEl1WHpVdUxaWmpVOGRobE0zWWNNL2d2ZXl5?=
 =?utf-8?B?RFhJbmVuM21SR3l1VkhsZno3UE9yQUVkcUZJSW9OWTRpQW4xSTByL1hsa01X?=
 =?utf-8?B?TUx0KzRJUmpkeE9zb0Q2Tkx6SVUxaUs1NUthQTYyNnd5eDlicmNXdi9aN3hx?=
 =?utf-8?B?S3RLVkJRZy9FM1B6RjhGV1l4N0xpRjR0NUpWVXlOeXl1MUdndk9Iejd4WXpk?=
 =?utf-8?B?L0VEWGd1aUxIbGpveTMvSzJ5allmc0xpVkI4ZEZSQlZNbjgxUGxrZjRvRnBR?=
 =?utf-8?B?MXdkN1hzWGRhQVpVeTBGWmRZN1FwVnIwVStNRjhiWXlaRWhSektIQ0FwSml1?=
 =?utf-8?B?VllDWEJieCtRMjE4U3g5Y3piZkRIUFJhVnN5RE16RmRIU1Q4RmluTTlvQnVH?=
 =?utf-8?B?OEwyanBWN1ZjRzMxek1ZbFhxTWh6Zkl4ZGdyZXNNYXo3RGgvVmw4THd1L0Nr?=
 =?utf-8?B?SjdVV0Y0RXpsNjNqMXJ4TGNKUUNPVFk0V2pURWdwZG5rbFljc2NKY3dYM3Vx?=
 =?utf-8?B?MDNDZnJ1Q3Zmd2swV2kzZFQ1b1c3dERNVjBKYUJwS0VzZFltajdVYys5RUlt?=
 =?utf-8?B?MFp3b0dud3VkY0ZscHdNelJ5bWMxOFIzekFTMUZoamZkaEtCM2hJY1ZLSzZ0?=
 =?utf-8?B?OEFWeHJ5Qk5vcmlMWEZFOEV6cFJIQU9IQTFNblpSa2h3SmhmaXdrMkhtZXhl?=
 =?utf-8?B?OCtLMmd4akxraU93UXhlOVlIUk5NRFFWTjZVNEtlT29zeFFoRytmSEVjalZp?=
 =?utf-8?B?ZVBrV1dpVmNIUXlkTDRZZ0VwaGc4aWZXd2ZONGZSYXRrTk1HNXIrY016dU12?=
 =?utf-8?B?TDNNVGgxS0JNdnEveG0vTEJ1Y1B2NHZPT3NXcE5NRXhsQTNOZTlkSmlsaXF4?=
 =?utf-8?B?YXVNd0crSEJKMHZYWmR2Y211WDhvdjV0THRTR2V2OVdjS1RxaGNZNk5FR0E3?=
 =?utf-8?B?dnQ1MldTNGxTb1V1UUd2V0pxWEdhclhubTNQdXYwQ3FPK3RtOUV0QnhSRjVy?=
 =?utf-8?B?YWlsZXBoYjNSVW50dzJNV1A2ejJHblhuVzZqdkZGcFRHcnhYZnBWVnQ0czlB?=
 =?utf-8?B?Z0s5MHBBRzlCQlMwSjhteUtyaVZIV1Z3Zyt3ci9LckRScDlDV2FCWC9MdVE2?=
 =?utf-8?B?a2wzU2hvcDNLV2hMd2JtR3BOSVVSSVFHY2N4c2Z3TWFPci9GNGU1c1ovQjlZ?=
 =?utf-8?B?VTR0YmJIVG1wOHhDRDNUN0doYlJRTmhZZTdxMWVRNER3QjdLZmtoajdaNXdW?=
 =?utf-8?B?WGZqZkdVakdRd0Ewb2ZUbjg2c0RvUXp1N3pjbDhDUFZHVGJiaU5XeUtaaVJz?=
 =?utf-8?B?WkJxSUlaY2x5YURQb0dBZ0RKRWdacCt3dFBoaTRLYnl2VmpRRjloM2VucUov?=
 =?utf-8?B?YlpscFZwdmNRalQ5Zmp2ZDl5ZEJEY3J1UytrdDB5QlI5U0oreGIrcTArNXhj?=
 =?utf-8?B?QW1JckIybWw3K2Njd09TSG5iRTFzcTRINnNOZ1QyT2tjczVqU2ZyOGZKTnFq?=
 =?utf-8?B?UjBqNy9reWJPWTVUMVQ0clhMNUJsZFNwVkhxS2JaSE8vRkt4Vnc4b2VmOWNr?=
 =?utf-8?B?S3ZIN3R4NlZKaHpDMVp0bURlNUJhYmtJcGtldmphTjN5UW44NklOWUgzbXFP?=
 =?utf-8?B?RElKdXM2SEc0TXlZdVFCbTlNa25iZGh2SXFObW1qalRDMU5sSGJjcEZnN1Ju?=
 =?utf-8?B?M2RNazRhcnQwSnl2djVkM0F3R01VYnR3Zzd1TnRiZkxpZXgyMmkwVjV1RWpD?=
 =?utf-8?B?STFRWmpFYThkcGNJUDFvSXpDZEQ4WkJXcHQ2aFZNWXEvZGVtaXBZN3BKWWRG?=
 =?utf-8?B?WFVWeDN5K3lHcFI0UXk3eUFOM1ptdzRIcEx3Mmx2b3Ztc3Zqck0wRGZnem1m?=
 =?utf-8?B?eDB5Y1BsVWRYU1VHSlYvNFI2THlOUmpUVFVNVDZ2VWpLK2poWVl3ZWpOZFJ0?=
 =?utf-8?B?WjhSQzFQOHVRU1N6ZHBLUzQ5UjRkb2NSRlZ4YWszNnpQZWRqaDFEdDJ5VENI?=
 =?utf-8?B?ZGkvMHBuRUpnUWg1TkNjSzkyV3pzbVZoejlwQTZnaGhCUVBpT0xHOWJOTmdW?=
 =?utf-8?B?d1Y5RmFkWTlxSE5vdU1Zcm5UQjVFMzdIOVFTZVBSb3V1bDZFRnduME1iRm94?=
 =?utf-8?Q?UyGJrwpzxbOl0NzhBrRUATg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd63e755-b9d1-4656-91a7-08dd7babc367
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 23:26:20.6011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tqm3LTPIvNLh9neQZGLyyYpR7eog3Lj1D93gG0nE3oD4yqTtY7Kd3xAAtt4u+xGwwL3fi49Isp1atLECfIbW85XP2MlLiFcG/7c5St/m0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7175
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

On Mon, Apr 14, 2025 at 04:19:11PM -0700, Dixit, Ashutosh wrote:
>On Mon, 14 Apr 2025 15:19:12 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Thu, Apr 10, 2025 at 01:33:44PM -0700, Dixit, Ashutosh wrote:
>> > On Wed, 09 Apr 2025 16:34:41 -0700, Umesh Nerlige Ramappa wrote:
>> >>
>> >> Whenever read fails, get stream status so we know the state of OA status
>> >> bits.
>> >>
>> >> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >> ---
>> >>  tests/intel/xe_oa.c | 6 ++++++
>> >>  1 file changed, 6 insertions(+)
>> >>
>> >> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> >> index 67acc74b3279..f3521c3d602e 100644
>> >> --- a/tests/intel/xe_oa.c
>> >> +++ b/tests/intel/xe_oa.c
>> >> @@ -2294,6 +2294,7 @@ static void test_polling_small_buf(void)
>> >>	errno = 0;
>> >>	ret = read(stream_fd, buf, sizeof(buf));
>> >>	igt_assert_eq(ret, -1);
>> >> +	get_stream_status(stream_fd);
>> >>	igt_assert_eq(errno, ENOSPC);
>> >>
>> >>	/* Poll with 0 timeout and expect POLLIN flag to be set */
>> >> @@ -2568,6 +2569,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>> >>	errno = 0;
>> >>	ret = read(stream_fd, buf, sizeof(buf));
>> >>	igt_assert_eq(ret, -1);
>> >> +	get_stream_status(stream_fd);
>> >>	igt_assert_eq(errno, EINVAL);
>> >>
>> >>	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> >> @@ -2584,6 +2586,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>> >>	/* Ensure num_reports can be read */
>> >>	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
>> >>		;
>> >> +	get_stream_status(stream_fd);
>> >>	igt_assert_eq(ret, sizeof(buf));
>> >
>> > Here read() is not failing, so maybe we should drop this one? Otherwise:
>>
>> But here we could get an EIO for some strange reason and would be good to
>> know if a specific status bit was set. The idea was to call
>> get_stream_status in all places where read was called.
>
>It's fine, I went ahead and merged this along with some other patches.

oh, thanks for pushing these.

Umesh
>
>> Thanks,
>> Umesh
>>
>> >
>> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> >
>> >>
>> >>	__perf_close(stream_fd);
>> >> @@ -2727,6 +2730,7 @@ test_non_sampling_read_error(void)
>> >>
>> >>	ret = read(stream_fd, buf, sizeof(buf));
>> >>	igt_assert_eq(ret, -1);
>> >> +	get_stream_status(stream_fd);
>> >>	igt_assert_eq(errno, EINVAL);
>> >>
>> >>	__perf_close(stream_fd);
>> >> @@ -2768,6 +2772,7 @@ test_disabled_read_error(void)
>> >>
>> >>	ret = read(stream_fd, buf, sizeof(buf));
>> >>	igt_assert_eq(ret, -1);
>> >> +	get_stream_status(stream_fd);
>> >>	igt_assert_eq(errno, EINVAL);
>> >>
>> >>	__perf_close(stream_fd);
>> >> @@ -2786,6 +2791,7 @@ test_disabled_read_error(void)
>> >>
>> >>	ret = read(stream_fd, buf, sizeof(buf));
>> >>	igt_assert_eq(ret, -1);
>> >> +	get_stream_status(stream_fd);
>> >>	igt_assert_eq(errno, EINVAL);
>> >>
>> >>	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> >> --
>> >> 2.43.0
>> >>
