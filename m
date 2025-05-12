Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B64C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 10:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E1C10E16B;
	Mon, 12 May 2025 10:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMgR5ztN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025E310E16B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747047257; x=1778583257;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p9A6PbmPC8Lp4nwVfZjBRLD6G3UOb1fWxPjSEtob6Cw=;
 b=KMgR5ztNhFxP7TSIviqwEcNqzptR5Z+FWggFCNldpdkWEBoSx4ZIcqks
 XAsCJe1Bwqqvd5Ulx7uXUhNRYFQHmnTT9Cia1M8Kqv18YsZn1xz6CArmS
 5Ux4ovprEnUvHnsCthRLZQmWNW9nDDaOeNLrfxkE64reqe96VNvTJaREM
 meFuUAzZHbaLEdxQyjjFQmnm1Yejkn0WCsPbqVAF022ypojWjnVQYwjky
 gd1vASIoFd1sAEwJLxDQdVuyZxHA+2wUGgGIEU9uqOx/aK3TSNNd40wvU
 vZv+VwSoKbtLdjAApWOgpRkPaNBU71y0tpaWT6y5fy0o1EVvl0xZYwGWd Q==;
X-CSE-ConnectionGUID: rlcb0QlwSMSqvXKwMgSleg==
X-CSE-MsgGUID: 92KUvU2jQLuIkYL5fuXnAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="51488578"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="51488578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:54:17 -0700
X-CSE-ConnectionGUID: av5EB7D5QTCCnnl/3XGRhQ==
X-CSE-MsgGUID: UTdUu9vRThewlzd/VQwDuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142096188"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:54:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 03:54:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 03:54:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 03:54:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fltRUc6bIfP6zdKlIDtyzItCwAENnFPhIGS0sqp3EXAssZHmVnbX9lOsU1oOHCId6rm/YRo2d+C9a6HPkCb36zYxcrRMV1ZeW665Qy38+bSgYVv4UQUHkWbzCVIHygTp3vOCdJGC0sDgX92hUPx2jBTW5tzIHl/pFUTjNlr4uf7rXg91Qr3CNBxAp2cgJTStv4mXauEpCU5OjdMuSPH21RMNyWR9THELZqVQiE3g18GMrklVeI4RJ3Au432hQsVyjhkBYywijITf/qQYhZXCYWxQpFCbpdw/cSHU5KLpM/XS/VZyhVEvWXCHMHBvYKYDaF1zVIshfHo+qShMV+yOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDpzkbkLlLInh9LHY7AC9hX5wg9d2EvF9SmrGCxO1Wk=;
 b=ODkpnEon9xlnOTHAg1kuxvUQejgzMZgs99mOIryb5HOyFomfmUsC1JAZHJBU92z0ebJDMBgd4ItutFLALw8SyJ0SgI9f4+0JRXV/z049uKXy5u7uh98TsW91rRc9sqQFv0PRMgbbOSVM3bFofP+9fACazjxDJPZV+klTRpqktHTFcouqS8TNCr2BnQuwiXQoXf9TQstlbCbdEAv9XmbvGUkIXdHZzdq7akLlXvTQC9FkXZNlqfT8n4ahcSUjkrHaQHOv1RfIJsD/L5TZ9vVMLobBxVMKrM3419VMwRZcqTIs02onKT7TlzfzE76fzxzk+d51MPBK5sZN3d+DSfKuhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 10:54:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.024; Mon, 12 May 2025
 10:54:12 +0000
Message-ID: <5278b1c6-38a0-4b05-bd25-46e5ea10b5e4@intel.com>
Date: Mon, 12 May 2025 16:24:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
From: Riana Tauro <riana.tauro@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <kamil.konieczny@linux.intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <louis.chauvet@bootlin.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
 <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
 <aAfuM25ln-ugZd_W@intel.com>
 <md6mljnmwsujfhv3up22l6rqhlmfyhg4qicqonkhfetabsako6@z5drpnypwqyr>
 <5a646900-7853-40a9-a217-e5d3021818fe@intel.com>
Content-Language: en-US
In-Reply-To: <5a646900-7853-40a9-a217-e5d3021818fe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 2311578b-db65-4cf5-66b2-08dd9143546f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blZxUlI5cnl5K1dMeGNnZE5URG5XZEZxcGNmenF1VUNCbjc0eHN1YWxEYVpX?=
 =?utf-8?B?L1NoUHYyV2ZKRkoxUXhaVTlZUXlxcFJmRjc4RlFjQXdhYmxMWnJWaWdoTXZh?=
 =?utf-8?B?SXlTbnNKalFpbjRMVmtNS1ExSk53RVZIdzVvdVFVZTVlbytFNUxCNkpYRE1t?=
 =?utf-8?B?NnZoc0UzNjUxbTZzSFdicFJ1Y1kzci9zZ08zQXY3RjgwRVpGNlV3RjlGZVdz?=
 =?utf-8?B?YVVNTUNVQzlOdXBScEt0Mm9UeDQ0TlJOM3BaWi9jR1duMnI5L1RPVUh1UC85?=
 =?utf-8?B?SjRwREE5ZDJsaURqdmVZNVBYditmbHV1ZkNzbVRJaHFmRnZnVFdjdUljaVBr?=
 =?utf-8?B?bTN1TXdOYmRVR0R3UzdyVGJxa0lJR2sycTV4MnpmZ01La3RsemIzV0p3OXVu?=
 =?utf-8?B?V3lrVk5YLzI4eWxYczNJS2VCd1R4MGRGTnZaQkUrcng1UkhLTHVaQ1RNSitE?=
 =?utf-8?B?WWJSanJIQnZET2NXRURYV2FqTXNQOElEUGpFNHFrR05nRnplbWZFWXBVSmdn?=
 =?utf-8?B?OTdjM3VFQW41T1JWOStHTGVjNVNNU2YxTkFKaXFKcmdhaDBrcE1KMzlZcUJQ?=
 =?utf-8?B?SEZrVGkxZ1p6bmNPTGs1YWUrUDVXTzNoMm9mMXpoM2Q4a0crTmdHYUh0a2hq?=
 =?utf-8?B?OXVFaUg2Nnl5alFrbjNjb3M1NWlDckZsRmhtcHdYV3cyTzVmS1U0M2NHQzdQ?=
 =?utf-8?B?ZW0rNjZNR3J1YzB0NW9NNGlITFZTenRhMUpaVDdvMHdFVTB6QmJSdnJaYnRn?=
 =?utf-8?B?OHF5VjR1dGhlTXorZ3EvRWhZZi8vY1FVaVdnOFVPVEVzZis3ZU5Kd2swa2xx?=
 =?utf-8?B?UFo0Ty9ScFNrMUlmWkJNNHlsUGpYcGVTYkNXTXF1OFNYNG8wUmRxa25xSisx?=
 =?utf-8?B?TTJIU0xpSFEwL1FNVVA5dEpMcE90NklvMi85YUJxWDJ0R0htZkZMUFg4WWJo?=
 =?utf-8?B?RGRvL2x4R2FtN2phSCtveXZQdVZKcWx3WmZEbDNHdlNYbUFySkxzQm0xWWpS?=
 =?utf-8?B?UDdzU05jdUErZm9QcE8rZWVpU2xWK1BYbG1hODRlY3JYMWVYNWd1QWFQbFpp?=
 =?utf-8?B?aTM4R1p0dnlqTExSQ3hHdVhoamd6UjUwbEljM2lqT2xpWFBTMWdGbFVxNHBi?=
 =?utf-8?B?aEV2d2c1bHRldm1hcUlOTUNaekozdVpTMExVb3djK1RVZlZhWGpXejRPek5U?=
 =?utf-8?B?enNnb0Y4c0tDbUdkTDNQRjVRd1JHWUF5S3VZR1RaaHptQ0dFa1FZRHNLWmJQ?=
 =?utf-8?B?Vm5qUGJDVmk3d3pFWmRPMXJMcHRoajJsMy9jTkdRemdkejg4VXo2WXNCWnBE?=
 =?utf-8?B?a04rSC9QY0d6eHo2dFloV1kzaloxeXFxczhOOFhnMWh2ZWV0OHFxS3pXQnh1?=
 =?utf-8?B?dHE0WkRQVEZwMWlVTzAyeEx0N2FhRFU2d29PYzRhbnhCME5lTmloeTBLOEor?=
 =?utf-8?B?dmxIaWNwQnJ1WE9OTG85amNrMnN2WDBSQVZubHltbWNIMi9OSVN5ajgzalha?=
 =?utf-8?B?NnZuZ1VTSnpyUmQ5UWFoaVRZL216MWNnQ0hvMkNCcVFCaHlVTlp0Um9rc04w?=
 =?utf-8?B?MndxaUpXQ0RFQjJYYVFNL3RjRjdSOEZQTHErdXNoTkJJV1RQdTZjT3Rxd3h2?=
 =?utf-8?B?d3hrYUk1RmFSVVFuaUlhZEhoTDBkWmtQS2FsdnpicjJBL1hJUG5sdHN6Y2NI?=
 =?utf-8?B?RVVWeHE0cXFXVk5iVHhMMG9XcWcyMjJuMWRoSzF3YjFYVGs4NUZPY0Z4ZktM?=
 =?utf-8?B?NGNUcTQ5cFpiRDNONlh4bEY3UFk0UXVSUEJsWWNYaXNrc2xFNzBXREZzRGt0?=
 =?utf-8?B?M3pnT2VaM2VjaUJXNFFDL28vQjZsQ08rN0JkTFU2Y3N2OGJTZFRTVC9SSmVT?=
 =?utf-8?B?REtEazYzTEpxbmwwUVJzaVhpcTVGaWZXR2xzOUNLamgzTjFUcEJCaTZzMloz?=
 =?utf-8?Q?pX82YkGhaBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3NXUGtkSjIydURBYlVHSFZ5TWZucitvV3dpcE5EOUg1TmhXNldDQTZYTG1G?=
 =?utf-8?B?d2xkZGUySHRLWWdRM3pTU01BeVROYndFSFkzdXErNlVMSjMreUNoUUd5RTVM?=
 =?utf-8?B?K2gwSTRYbHZvd2xPcU4wZC95elN4YTlWM1h3RlpOQmFaSUVyM0ZlMFV3YkRr?=
 =?utf-8?B?Y2FvZzVIZ1k4WUtuQ0NORGIrdTRsMXJBOGhDYjd1aVAybksrdkJ0ZHdiNHhz?=
 =?utf-8?B?Smhubi9WaXpXdHVLOG1Wbkh6QlpQTXlOTFpsZy9vVit2dHRsS1hDS3NpM0JF?=
 =?utf-8?B?OWFVaWwzblplR0ZNeWVwanFud2JzNlR0WHd2dDNXN3gzR0JUSU5RNVBYazZ4?=
 =?utf-8?B?S2xFc0l1eSt2RXhzVW1ycUk3dkpzWkFpMEtkTmRUa1Aza1JQazFENHIxVnZE?=
 =?utf-8?B?bWFiTjdlendOMFZkSytRbElaUWxhOEpHWHA0NmxheTZydm9CMVR3TmNHa2Ew?=
 =?utf-8?B?SXc3ckI5b1pkNEFmcG9YVXAyTUo4Z1A2eVVRVEpjUHdtMXpYN2c1SEpDK2xa?=
 =?utf-8?B?SnNlYmkwb0l2bldJN2gxck90cFhhS0hiSmhkQkViSWErVGtsbHFhK0F5OXFH?=
 =?utf-8?B?ZkxxUC9IMlhta0plWHZYc2NZdWhlcXEwQnhoRUN3TnlDK2VwTFovSG5VaDBO?=
 =?utf-8?B?bytYSUlBNTRnQzJvQkxPaUhDRUR0V0hpNll3cXNuajJQb0ROWkFmOWpNdW95?=
 =?utf-8?B?anQ2ejJ1Q0tmSlNIcnc1WjArQjdZd2VXQlJmd3ByTWVlQmlHSHJwblNEWUw5?=
 =?utf-8?B?UFRMbVpRTGxLb0c5MmVmeStrM1Z0cHMzbk5MY2tPeE4zVFh1L3hXK045Sy9k?=
 =?utf-8?B?eTJvY1hrcUJ6cEtRUEN1NTVnZXhkQ2plcng0SGFOeGJ2M2E5ejZ4MmJzeG1D?=
 =?utf-8?B?ZDEvTW4vU3pFRis4dkszUGd0MmlmV0hmaGVZRVFTQ1FHU2hMSTdPMTBGYW5C?=
 =?utf-8?B?VTFxcHI4Uk1MSmRibGxva3F3aC9TZEVSYUlxNE1qUjg5VzRYN0d1amFFNHVn?=
 =?utf-8?B?Z0J2UGNqVkFWU1RmM1ZZN1plOU5BOG1MVDdoOCtobEpXWko5ZTFhNmk3dHAv?=
 =?utf-8?B?RDN2ZTZROUVQU1g2REo4cU8rZ3J3bzNITVNHMkY2SzVYKzh6clg0VUE2a3Jv?=
 =?utf-8?B?SFNpbzVTWjV2TWVXYjYvalZkdkU1ZklHSjNqNXBpVFRiM0p5NmgzNTBWQjdW?=
 =?utf-8?B?U0F3QWlQZUVvdi9zOW9vKzdqbkFmTWhsVXVlWkYxV29pYTExL3JGQVN3UjZz?=
 =?utf-8?B?OXhTRkM1bXFrekNrekF5M3Zzb2NCcGMwekxnMkl2Ujd5NW1rb00zL3VhZUpL?=
 =?utf-8?B?RkJZOFc2VDN5MWdVVm9FeTBWN2tLQU40bStFK3BkOEtjL0diVmhaRDZnRmk5?=
 =?utf-8?B?TmpTVEIrOWRFcmJ3dVllMGZIeFllVVM3WVNLWFNLeWRyczBQTTM1QUhwRDZr?=
 =?utf-8?B?R3YzQUVHS3RWOGNiSUQ2RFpCdUNxcW9oSExrUWdKT2o4cnArN2VMRUZZZHpt?=
 =?utf-8?B?RkJFR3crL3FvQVBuNDhlZ3owWExhbXRmanpra2dVei82d2RtRlFoVUk0bkxr?=
 =?utf-8?B?a2FBSXdnYk05cFh1OXB2NGN4blBVbVJiZWMzQWNzNVRQSDA1VTl5MnJRSHhm?=
 =?utf-8?B?bW5nZnI1WjNKU1FtMTNodHJjYkpNZzRIbjdaUXYybkJHWjBEZzRGN3lzM3VK?=
 =?utf-8?B?R1Z4aWs2Z0ZUS1pHVS9NV0RjYTJWS2R6dmRaR0paNDkySWFRZEZoc1RKZHh6?=
 =?utf-8?B?YmxaM3BEdnJhMkdpTW9JNXZ5U080eHNXZG50dG9zTkF1ME93TFZrRzFjemdJ?=
 =?utf-8?B?bU1lazRFVTV2UXAvdEd5MGRXTUxENjROTUJneDNUVXJqdUVsdm1xM2cycjgx?=
 =?utf-8?B?UkhQbTJOMlR6cHo5MUwrWFJrelQ2Q2xIMll3M0ZKMmt4SUU1eHMwZTNwbmVM?=
 =?utf-8?B?a05EWGlxazMrRHVuYTVnOHhYbk84enowcTFtTDg2bVRlSjVXaUxMRVBJdUww?=
 =?utf-8?B?QkJYK3lRVnlrMkN0L1FOeGFOVTVZRVdrQmJUOHRYNXptMG8zRnhKZTdxZUdk?=
 =?utf-8?B?c0JnVTdqQjh2VFJEMWwvc1FPQUR4dEZvYklUSVBKaHZsakdkMU05dWk3R2Qx?=
 =?utf-8?Q?9dwii1TKfPWf9XG8JVvtBkk9H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2311578b-db65-4cf5-66b2-08dd9143546f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 10:54:12.7805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPHrNH6KDWTz8LWEY2Vpwqlr8LtAp4PUM4OhXqDG8RpoRwP/siIUNmNSedZQP7G8Nuf2OjBUOsyUJJhtkWR49Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
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

Hi Lucas/Rodrigo

On 4/24/2025 11:11 AM, Riana Tauro wrote:
> 
> 
> On 4/24/2025 9:47 AM, Lucas De Marchi wrote:
>> On Tue, Apr 22, 2025 at 03:29:55PM -0400, Rodrigo Vivi wrote:
>>> On Tue, Apr 22, 2025 at 08:57:35AM -0500, Lucas De Marchi wrote:
>>>> On Tue, Apr 22, 2025 at 03:26:01PM +0530, Riana Tauro wrote:
>>>> > The test validates if survivability mode is enabled on supported
>>>> > platforms when configured using configfs attribute.
>>>> >
>>>> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> > ---
>>>> > tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++ 
>>>> ++++
>>>> > tests/meson.build         |   1 +
>>>> > 2 files changed, 113 insertions(+)
>>>> > create mode 100644 tests/intel/xe_configfs.c
>>>> >
>>>> > diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>>>> > new file mode 100644
>>>> > index 000000000..414af4a86
>>>> > --- /dev/null
>>>> > +++ b/tests/intel/xe_configfs.c
>>>>
>>>>
>>>> humn... does it make sense to test survivability mode in a xe_configfs
>>>> test? configfs is just the way to trigger it. For completly different
>>>> areas of the driver I don't think we should bundle the tests into a
>>>> configfs test: we don't test if xe can be loaded without display in a
>>>> xe_param.c test, or if we can inject faults in a xe_debugfs.c test, 
>>>> etc.
>>>>
>>>> My suggestion is to have a dedicated test for survivability in which
>>>> configfs is part of it.
>>>
>>> Well, that would work for survivability itself. But perhaps it is good
>>> to have dedicated entry points for the knobs we expose, like we have
>>> a single place to toggle all sysfs and debufs. So we don't forget to
>>> add new cases and we have a single entry point to quickly exercises
>>> the knobs.
>>
>> humn... dunno. The problem I see here is that the answer for "does it it
>> work?" is quite different for each configfs file we implement. Some may
>> even be honored on probe only vs others that can be set in runtime. If
>> we had a generic way to test the configfs like:
>>
>> 1) write XYZ to file
>> 2) read file
>> 3) make sure it's XYZ
>>
>> then it'd make sense. But for these tests, checking that is not testing
>> much.
>>
>> For survivability we should test:
>>
>>      1) bind the module in survivability mode
>>      2) read something to make sure it is in that mode
>>      3) flash the same firmware... possible?
>>      4) unbind the module and remove configfs
>>      5) bind the module
>>
>> For possible other things coming to configfs:
>>
>> A) Extra Workarounds
>>
>>      1) write a {gt/engine/lrc} regiter-save-restore
>>      2) bind the module
>>      3) check for each of them, via <debugfs>/register-save-restore 
>> that         the value is correctly set.
>>      4) repeat test for write types like rmw, write, set bit, etc
>>
>> B) Fuse off engines in software
>>
>>      1) write a file with the possible possible engines that we should 
>> export
>>      2) bind the module
>>      3) check via debugfs that the exposed are at the most those
>>
>> C) Do not attempt enabling display (i.e. a substitute to the module
>> param)
>>
>> ... etc
>>
>> Are we going to shove all of them in a xe_configfs test even if the
>> tests are totally different? I think it will be harder to maintain, but
>> we can always move to something else later if it becomes overwhelming.
>> So.. I'm not sure. Any additional thoughts?


Can i retain this under xe_configfs.c ?

Thanks
Riana


>>
>> Lucas De Marchi
>>
> 
> 
> If we have a single test for each entry, wouldn't it be better to place 
> it in xe_configfs file?
> 
> There can be a couple of basic tests along with this like (read all 
> entries, invalid directory creation etc)


> 
> Thanks
> Riana
> 
> 
>>>
>>>>
>>>> Lucas De Marchi
> 

