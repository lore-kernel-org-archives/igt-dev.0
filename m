Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4DCCFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 12:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA1F10E242;
	Mon, 24 Nov 2025 12:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lt2/YD7W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218810E242
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763986762; x=1795522762;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MGAAWNOhsZH6ayWDD2/BmupnF2+tJkQYptoLmcak9bE=;
 b=Lt2/YD7WXrmA5/xQRf2lkPgSu9R0ccjtAUu/cevElKEcjDXCRsaWfakE
 kecL1Wbs5iFtvhYr8XUKdQdX0VPGSD7tS7n3UTvUj/NIaTpmVof8NaswO
 o1tK2vzD5tzXLHCpx7BNgMg2jHrk/CGMbBHloNGZscCu68AK6K8AaKf16
 PcvZ8TGcP+C+fwwzGpnKm3dnJsd7Z3XiQH/hP9Ra5zUf/jxVVNt4P50JN
 9muFuRFG/5k+d4vPhzmdkSRL6MAu0mpDAwz6fOqFvf9gQ8pO4FUI/mZt4
 eJER9Dv7xE5RvfZfcBaPWkaoGtPIj1p+s5CVdsTY9Gzb7Jr+evtPgtmYl Q==;
X-CSE-ConnectionGUID: oj0vFMFaTJuoq7AShTTv/Q==
X-CSE-MsgGUID: 117xUY4HQ0m/qmpxCL+wMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65864875"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="65864875"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 04:19:21 -0800
X-CSE-ConnectionGUID: MwAaOM94T4OKjbZPeqVcjA==
X-CSE-MsgGUID: 0gwqbRE7Szy/qRQON8x5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="196610230"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 04:19:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 04:19:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 04:19:21 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 04:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbIRZh6GKccOeX3m2A0oba1KU4Up99R6iUTUhWSZV1m62a1T9YnpIgFOr3LIdCVabrW+8e9+g1Nd/k0uo27Qz0KSDgpO/anEqLUnPK8g3HMD7QeN1TGwkWC4UiUUt/GR4wDUR25t1f61JWVihV4Y7yZNA/f19eNFo5HZhgYb1Yy+Vw0uIZgqoljJv4vxAVvEPqXJDx+xA+oYutTHSLcZzEU8UbrBJWuvtqkn65JX1pxVkKVI5buW+oQFeXm8QpKKVkWcruDnPDh37rr/gJxb7ukKDIhTDb9gD9TnZdp71yrO4w6OBUksgfIqJf6rfEVk0vyLq/t7ByNB4i3pkaLCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlXheoIv5B5uacUyI/LA6BvyGyglBLwRAotwpKoLKWY=;
 b=YpNpiyKiySFTqg1GQg04HcGEWXqeXSDP+IHZLOnbIQVPgaeWNXzAko2/h5CgkfMdyUQVjIQQlW0vVJGw/6EGajaBNzIQGw8TsYnGyYv2DoRMW5BIQ21iamNs73IFgGXPubd6RWHX1Gjvv3M80E2XrNunKR1WC5fSzKmI6ONIEdDq2oNLb5yYtrIPpiCpsRyq1LfsVUwLbYYQYSIIh0kpSjYOiiseZWOrbVxo+TnJaGhbm5SfCCdZ78VPMZbB2ZUMuJNE7TDtkhyvy/IiJ6XDYdbzoCRfT8NoidLB1ZtmKFnsreDddgGB7wb9+SCFtmt9uoJaUFoPiFfJsuKQJEeBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 12:19:19 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9343.009; Mon, 24 Nov 2025
 12:19:18 +0000
Message-ID: <310ea8ca-a4dd-44f4-9afe-f60fc1b23a12@intel.com>
Date: Mon, 24 Nov 2025 17:49:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/8] igt/kms: Nuke unused igt_pipe_*prop*() marcos
 and functions
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
 <20251121190633.24522-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251121190633.24522-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 843e2342-c0fd-4919-a205-08de2b53b0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnVJazdXNGtTbys5dFpvS29jZ1pmMUVqK2NCUWtzd1lUNU5WMDZmZkpaU0pO?=
 =?utf-8?B?bGZ4NDlzWDNDNHBnclp0S2llS1lrRlRIcERic01lZUxML0I4UnJkcUEwRnph?=
 =?utf-8?B?OHVZRWdFV0Q3d1ZhRWJBRHVGVlBSL3VselI2a1JvSTFSYmY3SVBQYlFzNFVi?=
 =?utf-8?B?UVR2SlgzcGx5VkN6U1lQYVp3bmh2ZDFRRmtKUTJpRG9BVWxkTkx6dXFzYk4w?=
 =?utf-8?B?NXZDU0NFcEw0TTZRcWlLWHJuMVVrV0tFMDdEcTFybWxxcnR3aFJROWJuSWo2?=
 =?utf-8?B?SVluaDBWWEo0ZC8vK2p0N3hoUnh2ODNrT3VVaGlxdWlTRFFwU2pZQ25UQXN3?=
 =?utf-8?B?Z01GYnp1c094MmM4bHAvNXFWU09VeTZwYkpoQ2lESktiZTJTK29qOWtiM2Zn?=
 =?utf-8?B?RHNQSi9pVHJGV2xpa090S3RyR1RpRlRsd3NpYVBLdVVlYWR0TitmRmt6ZlhZ?=
 =?utf-8?B?NmUyc0Q2YmRaWVIwYkhHdzN6WWpRem1SeG90SzZFbDY2eENEeFZnSW93WXZ3?=
 =?utf-8?B?dmpqUHZGcmRzeGpwc3JYNkRlWHgyL0RuMnZPZmFEMS8wcERVa1lDdWN2MXdW?=
 =?utf-8?B?d050ZFJNUGZvUEpka0pLWkd0YnZjdVE0TmtHSDZmU2gxN2RqKzFuaE1jVmtN?=
 =?utf-8?B?akwxSkZqYTJJNElleENTTWxYbHlTVTVFS2xKZlRyNmhJc25rMXlBc2FDMDZY?=
 =?utf-8?B?b3N4dzBCa3lwVFFKTDg0MFFUdzNmSndEWG51d21hZzAyeU1FMi9MeEtSL3pO?=
 =?utf-8?B?UWdHTytrSHdkeFEzMGpUSzR3eXBiRXBsQTR2TDBXdHNEWEJuUGErZmpBbFZB?=
 =?utf-8?B?SkFJTkN1RVVYcUdsY2JmK0hsRm8yT2lPVXVNU0lKZjlzUGpWd2JYVlgyZWdq?=
 =?utf-8?B?Ump1T2lTTzZFdHZQUVBoQzNUVWQzTDhwaEZlN2xtWTFHcHFJR25DMXBzWG0x?=
 =?utf-8?B?RlBPbmxRN2kwcGZmbnNRb09IN3Q5NUFON0lmaUdXZnY4cVQ0d3RRdVBJczBw?=
 =?utf-8?B?VmYwczNHdW5hdGpKUzFhTmVRYTI1SWdEcTM4MTFWOWR4SW5rdSt4QTZpVjhN?=
 =?utf-8?B?VTJZRU5kdFp5WGRSU3JZejFDRmx6VTFSRWJyK3c1aExZTHh5cml2enpsaE51?=
 =?utf-8?B?aGxBNEQzbmg3Q1RtdndScWRZQW9Qemw2bnYvUm95REJldXB0Y1dmZWxRUHNq?=
 =?utf-8?B?eTdIVXg1RFFMTXRHTjgwT2IrQmRNQzJtb1BuUjlhSHVYYXFNZDl2V0ZrZjZt?=
 =?utf-8?B?bW9uNVBOVjh2RVNjb2VpUFFrLzcwZTEwL3l0VDJFNkU5b2MvS00zT01EamhE?=
 =?utf-8?B?NWkxMHRkTzM4V3ZBcnd6aktxQ1JISlhHTlBmMXNBZEtTSHdlTzJFR25lckov?=
 =?utf-8?B?ZjlZMWtTYjJ3RU4xSmJyVm83aVgxR0hBUlB0SGRvWUZwNjNXZ0VnTU1TS0hw?=
 =?utf-8?B?YTdwKzNxRTF4M1RKanV0b0pDdWhDZGNXdElFbEkxN3pTdnI0QUhKMldScndM?=
 =?utf-8?B?ZTA0RFlvZjZqRFA1YzZweDM2SU1BcXlBV1dWaUd6NFg0L0w5VUh3VnFvc3do?=
 =?utf-8?B?ZzlEWnc2RVJleXg1MGVLdHlJcnpUN1pzcTFOUHZlSTZlMEhoUzN5cHB4akRW?=
 =?utf-8?B?a2I1TzVvdjRyaFYvaFZLOE9SUGJvQVFybGlvd0NrejhsK3owZXNZUDZPMlJ6?=
 =?utf-8?B?MlF3elBaa0QvcFVQYm1yQ3dwMXc3SCs5a014SUV3U1dGcm9lUFNYWkdUNkhN?=
 =?utf-8?B?bjdVQU96bUhCRUpmYmlGeXpybU9oRWYwZG5SM0JMSVI5d1RudVFsMEhHWW5p?=
 =?utf-8?B?eitNQ21YVGNxbTVPL1lEU2pOOS9LZVVCeDJ0VVkwK1I0OFU4SXJZZS9nOVc3?=
 =?utf-8?B?bmlvWTdZVkdZS1ZLRkIwSUwvbDBrN21uMUdZVzhMSzNMQUxPYUNVOGs1Q0dl?=
 =?utf-8?Q?ayj7WNu1cxmauMI3gischc68BYMpzXky?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0N0T1AzVUdJSTBIdWpCaml3dHllc1RYdG9WRmE5SlROVkQ2QnN6engraXdV?=
 =?utf-8?B?RHRadHZ6NE1xZ2Z5KzVNUUE4Y0JBM2kzM3g4MzVHYkdvckVsNk95KzVoRXdk?=
 =?utf-8?B?bDlTbUhNMU9BdnpjTFlSS05HOCthbGdhZkgwZmxYUzAwYVhkTkt6dEN3d0E5?=
 =?utf-8?B?SEhxUEZrUzRFWTFEYmtzM0pFV25WeGVEUUVJSlZqRG1PN0xBcHFrTWUvWnFG?=
 =?utf-8?B?UWFNV3F1U2dPR1piREdMdldyUGRMMGRVc2ZBR3h4dlpKY1hPM1ROYWZrMTJO?=
 =?utf-8?B?azFyeU9iZnlCcE5BTDl6ZmJWUTdmc0p6cjd6RU5JdDFYRVJ0MGF1SGdweW9n?=
 =?utf-8?B?TnlrMmx3N3dZOUs2WWpxdmR0SmRtSGNWVTNyQ0NlL0lKWWRRR0Nldmg5N3VX?=
 =?utf-8?B?Wm92dytkdkxwMkQwQWYwTS9RSXpPUGw0TFZpN2FVNEROaTdUMnYvaTZQUGZK?=
 =?utf-8?B?eVd4K1VlaklhN3lIVlZVVVZ4SHM0aFFnT1N3bEd1ckxvL0ZUMkt6YU5rRmdN?=
 =?utf-8?B?UFIvbG80QWtzbCszS3d2bkRYWjVhQUZZUWVoWlNRbmFaNHdxWkR3Um0rNUxB?=
 =?utf-8?B?TFdQaUt2TnIyNTI4dGVQeC92RENEOUdSdGpwblowWml5cFpVUWJPSUZOdno3?=
 =?utf-8?B?MjhsMlkwWGt5dWwvalJNVjFSZzVieDB0Y3E1WHI2M256Z0ZpSnBsa2x0OWly?=
 =?utf-8?B?VDlCYU9QdXNHMXRoL0VSRDBteXRXRnI1OWZaV0JEZjZpcHcwUWRKZ1dUR1p4?=
 =?utf-8?B?WnBIWG9OQmhYVW0wWXdtVkROa1BnWWJaRk1sNCtFZjlFMndBdzlndVdRRFBq?=
 =?utf-8?B?clJWc2ZQQkxOZStia3JhbUsydkVteU9rVzVTaDhIVnJ0dHdCQ0xIN0p5bEhV?=
 =?utf-8?B?TUJuMndaMS85aSsxUHZZQ0tUVzRiNHo2SzVZNk92UW9PTlM1N3FZcUprMGp4?=
 =?utf-8?B?b1lyTzg4Vm9BOVpQVUFMeUVUblhZV3VMQldsY2pPZzQxMGJ6QTE4T3lMS1Y5?=
 =?utf-8?B?YzA0Tk9HRnoyTEE0YVEvUVhPZ2NMb3BIcUtiTGl2N0dhVit0akM4Vzg5anpn?=
 =?utf-8?B?WWwwdkRjMC9xVWNqRXFDNVlEaWFkVnVVY1lMcEJnaTRsaGJ2UC8vbXpwVDlx?=
 =?utf-8?B?R2lrVkJMZVFsQ3RudGJyRTRCMTRoci95eldRSGM0TmZTTGxjQTQ5R2EwMVRj?=
 =?utf-8?B?K05FOG5xY0FVM1owdWJ3UWNKUzlsKzhWaDVkRko5ZGdTeC9nN2tjOGlHMFhn?=
 =?utf-8?B?ZEFKYVpjbzdCQ0p0ZXRzSW4reW93S2JrWFZYWmozb0hHQkh3QXFkczJ5ZE1Q?=
 =?utf-8?B?NHFVZ0p6UlFKVEdNeEZZeWovMGs0clV3MExsYUxwWGRSaGJkREg1OUpvcWE4?=
 =?utf-8?B?VHVoak8zbk1jVlI0dnZ2dnRXaVZEdTh4U1p6SGcrYzMwNkJ3ajAxd1VFZkdm?=
 =?utf-8?B?K3k1M2hxNXZGOVNRcElnN29pRnpOUEFQbEp2WGtGK2lTdWlhU1lFQzFnd2ps?=
 =?utf-8?B?R2dDWFA3WDdVNGhjSXlBTFVGekVRNzFGS3NMMjVIRkQzNVdZZmRhYUxpZW9t?=
 =?utf-8?B?UlM2T0g0MjhvMFJjSUIxUE8xZUZOYWdxbW5RZTN3S3M3Ym04MEc3NE5wUFcz?=
 =?utf-8?B?bDZuTHdMN0VkRDJBOGpWRnU0a2Z1b0xuaHhlcXlzMTdVVUxxRmRIN0JFdHZi?=
 =?utf-8?B?a2tDdHZYcVRvTzdtL1NOSFJNa1BOT20rUzlSMmxMNDhPTy9jVExPUnY0RzBQ?=
 =?utf-8?B?ZmFiYXlvWnpCS21zcGNHL1RNYUhoTE5OajVNUmhqQTNOcy9nOW5pQlE0bTI3?=
 =?utf-8?B?RW1NTndaVC9xMHAvbC9Zb1RmeFBlOWJLZVN2VWFVa01VQjgwWjJUT0pubEdF?=
 =?utf-8?B?cytxajhSQXZEelcrUHB1NHVtREFCNHY2cVQwNUJNdjJ1NG5TdHY5N1pkVVl0?=
 =?utf-8?B?ZWZhN0FvalowTDNIdGMybDNjcW9EbndUeGhpQ3ZuMHBHemtFR0IvMWRmL21m?=
 =?utf-8?B?K0FuYnpjOEh3YS9va3JMWHlCZWhLdVpPWFJ3UFJjSHVUbmkwMm8ydHhiM0pX?=
 =?utf-8?B?aC9JMDJiWEJNU2F5Y0FFdmV5bUEyV1hZSVYweUk2cFpmQ1VNeDU0L1ZOZTNF?=
 =?utf-8?B?TE5sUmJjd1Y5eE1kQlJBQlF1RERWbC9ySHRPd1Y5N1VsNkU0ZDdqWG5TS3NE?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 843e2342-c0fd-4919-a205-08de2b53b0f2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:19:18.8247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6U25ssiv+9Dj4qSAkI6kDReA1opcl4BoxsItMh9cv5uryUP64dvZ9tBEr7i1oWvoXZNJdApQOUC8dJ2mDK8Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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

Hi Ville,

On 22-11-2025 12:36 am, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> We have a bunch of unused macros and functions related to
> crtc property handling. Nuke them all.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.h | 101 --------------------------------------------------
>   1 file changed, 101 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c9216dd5bdbe..91776e73e309 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -928,42 +928,6 @@ igt_pipe_obj_has_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
>   
>   uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
>   
> -/**
> - * igt_pipe_get_prop:
> - * @display: Pointer to display.
> - * @pipe: Target pipe.
> - * @prop: Property to return.
> - *
> - * Return current value on a pipe for a given property.
> - *
> - * Returns: The value the property is set to, if this
> - * is a blob, the blob id is returned. This can be passed
> - * to drmModeGetPropertyBlob() to get the contents of the blob.
> - */
> -static inline uint64_t
> -igt_pipe_get_prop(igt_display_t *display, enum pipe pipe,
> -		  enum igt_atomic_crtc_properties prop)
> -{
> -	return igt_pipe_obj_get_prop(&display->pipes[pipe], prop);
> -}
> -
> -/**
> - * igt_pipe_has_prop:
> - * @display: Pointer to display.
> - * @pipe: Pipe to check.
> - * @prop: Property to check.
> - *
> - * Check whether pipe supports a given property.
> - *
> - * Returns: True if the property is supported, otherwise false.
> - */
> -static inline bool
> -igt_pipe_has_prop(igt_display_t *display, enum pipe pipe,
> -		  enum igt_atomic_crtc_properties prop)
> -{
> -	return display->pipes[pipe].props[prop];
> -}
> -
>   /**
>    * igt_pipe_obj_is_prop_changed:
>    * @pipe_obj: Pipe object to check.
> @@ -994,16 +958,6 @@ igt_pipe_has_prop(igt_display_t *display, enum pipe pipe,
>   #define igt_pipe_obj_set_prop_changed(pipe_obj, prop) \
>   	(pipe_obj)->changed |= 1 << (prop)
>   
> -/**
> - * igt_pipe_set_prop_changed:
> - * @pipe: Pipe object to check.
> - * @prop: Property to check.
> - *
> - * Sets the given @prop for the @pipe.
> - */
> -#define igt_pipe_set_prop_changed(display, pipe, prop) \
> -	igt_pipe_obj_set_prop_changed(&(display)->pipes[(pipe)], prop)
> -
>   /**
>    * igt_pipe_obj_clear_prop_changed:
>    * @pipe_obj: Pipe object to check.
> @@ -1014,16 +968,6 @@ igt_pipe_has_prop(igt_display_t *display, enum pipe pipe,
>   #define igt_pipe_obj_clear_prop_changed(pipe_obj, prop) \
>   	(pipe_obj)->changed &= ~(1 << (prop))
>   
> -/**
> - * igt_pipe_clear_prop_changed:
> - * @pipe: Pipe object to check.
> - * @prop: Property to check.
> - *
> - * Clears the given @prop for the @pipe.
> - */
> -#define igt_pipe_clear_prop_changed(display, pipe, prop) \
> -	igt_pipe_obj_clear_prop_changed(&(display)->pipes[(pipe)], prop)
> -
>   /**
>    * igt_pipe_obj_set_prop_value:
>    * @pipe_obj: Pipe object to check.
> @@ -1056,54 +1000,9 @@ extern bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe,
>   extern void igt_pipe_obj_set_prop_enum(igt_pipe_t *pipe,
>   				       enum igt_atomic_crtc_properties prop,
>   				       const char *val);
> -
> -/**
> - * igt_pipe_try_prop_enum:
> - * @pipe: Target pipe.
> - * @prop: Property to check.
> - * @val: Value to set.
> - *
> - * Returns: False if the given @pipe doesn't have the enum @prop or
> - * failed to set the enum property @val else True.
> - */
> -#define igt_pipe_try_prop_enum(display, pipe, prop, val) \
> -	igt_pipe_obj_try_prop_enum(&(display)->pipes[(pipe)], prop, val)
> -
> -/**
> - * igt_pipe_set_prop_enum:
> - * @pipe: Target pipe.
> - * @prop: Property to check.
> - * @val: Value to set.
> - *
> - * This function tries to set given enum property @prop value @val to
> - * the given @pipe, and terminate the execution if its failed.
> - */
> -#define igt_pipe_set_prop_enum(display, pipe, prop, val) \
> -	igt_pipe_obj_set_prop_enum(&(display)->pipes[(pipe)], prop, val)
> -
>   extern void igt_pipe_obj_replace_prop_blob(igt_pipe_t *pipe,
>   					   enum igt_atomic_crtc_properties prop,
>   					   const void *ptr, size_t length);
> -
> -/**
> - * igt_pipe_replace_prop_blob:
> - * @pipe: pipe to set property on.
> - * @prop: property for which the blob will be replaced.
> - * @ptr: Pointer to contents for the property.
> - * @length: Length of contents.
> - *
> - * This function will destroy the old property blob for the given property,
> - * and will create a new property blob with the values passed to this function.
> - *
> - * The new property blob will be committed when you call igt_display_commit(),
> - * igt_display_commit2() or igt_display_commit_atomic().
> - *
> - * Please use igt_output_override_mode() if you want to set #IGT_CRTC_MODE_ID,
> - * it works better with legacy commit.
> - */
> -#define igt_pipe_replace_prop_blob(display, pipe, prop, ptr, length) \
> -	igt_pipe_obj_replace_prop_blob(&(display)->pipes[(pipe)], prop, ptr, length)
> -
>   void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
>   
>   void igt_enable_connectors(int drm_fd);

