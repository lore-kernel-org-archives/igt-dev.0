Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C92ECAC592
	for <igt-dev@archiver.kernel.org>; Sat, 20 Sep 2025 00:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D418310E263;
	Sat, 20 Sep 2025 00:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfYmAK6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA3210E263
 for <igt-dev@lists.freedesktop.org>; Sat, 20 Sep 2025 00:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758326855; x=1789862855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F/FoXSupdY+WzNysAgzxpq3te0DerysGb++g2+i2d60=;
 b=YfYmAK6uSPgHpTvh495a5fon2CIOvfZBnq7UuA8EG7nJBrIXkafiOqKG
 llTYKYFb0UFpz19dIlxUBLfc0yriBr/s1YC6too5zIZIEH/pijVbZdiMx
 Nb3t6tdioXvtmVfHdn0w0EoT8upBhDgt+VRW/L6CY5GUrnBH7jmhRblG7
 oZPf3gUH+OVDt9NISkdP7wuSZK2KhK1TdVQRGFmK67p2EnpV4ZpDTx1UB
 r6aN1Bmfa4HcUJ7HdtMp1ZquOFs32NeOldaJBQybE1Ya4DA/kYwCVSNkt
 iWcPGSGtIJCHlXuSF9aOtEoL4uWAuljm0RpH7K63rhvF2j9G7YwzbGfI9 w==;
X-CSE-ConnectionGUID: sWxpTT8YQ5e/QA0KBX6EjA==
X-CSE-MsgGUID: Y7GNVO13ST2NZuAdnuO0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71783391"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="71783391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 17:07:35 -0700
X-CSE-ConnectionGUID: mZcE7Lu0RPGbzTCk7MR3nQ==
X-CSE-MsgGUID: yS4LoPHDT5SUpfjOqVs2vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="213108789"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 17:07:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 17:07:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 17:07:34 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 17:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ko7H4cKcmZ0o1aYt6bvQuYAOuJ83uueVldJro1GrgMTOnQ7aGEcQFAb47Q4a5WJb1Sk7qYVDQr1x47B/e2AbkpYGl4kJwDnu4dv8sNYliDvOyvfOYUP8rATGFFF+fW6HG9tDyjpEN6PYzsMvDuRIq5ciiZhey2dn1q22fFBvpRs2B/RnbmuV8jUUnY/Xg14tHr0ws/tWEH5jxRRZmE2WJoX7nZS5UzNnmAjh69z0ZlWsyFmdvYVY8dwK/Ro1n8HV0shgB7RAObCUDxD2vfPm8LigOfzuktaakWotj3hZ++dAytp4OTG0+VLAYAXFBBh0CMzJ2ooF1vsc7UlkXQH9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4uilvVJyg//xpgKGo05TawkXGTn2FvER2z3As8Cva0=;
 b=BVOafH/hU4jQDmGnWRrPx+LmN4JyudJrw8PyKF2AWnRJ9uUBL5wNC0Vv5CwWEo30Hi7MEylhcSwKfCZ7+JK6IbISHPBO5TS+TITplAl7vqa/L4lHnjTK3K7Fjq4vIo1/pgUjlA2+tjjWZUcMKuh5vxyR8ghVKoyzLyfi4drlnfD6clTIWcdAaZ2ygIsAS6uiyt//aTcSys4RAkztFXVfGEaMgakKW9fgXIhc+i+jSwG3/fKF8EveJLRhYBSWcbGW0gff4M9578RMHrni81ixfra48y2k2FzmdUBSBcOhtHRLHbLybOh8QGy3fVeI5o2JxfaxeRgRqRsiwnnObS74ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Sat, 20 Sep 2025 00:07:31 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599%4]) with mapi id 15.20.9137.015; Sat, 20 Sep 2025
 00:07:31 +0000
Message-ID: <de1dbb13-b9ba-42e1-a9c4-a9ff57006dfc@intel.com>
Date: Fri, 19 Sep 2025 17:07:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_reset: expect error or complete on
 CAT_ERROR
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250919222836.82407-1-daniel.charles@intel.com>
 <854isyxabr.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <854isyxabr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0022.namprd21.prod.outlook.com
 (2603:10b6:302:1::35) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|DS0PR11MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 831a83af-8af1-4ec6-98c0-08ddf7d9b19a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUU1dXFkZjZxRUlUWko1RDdHTC9HdzhPSVZQK2lGYTAwYzZlZVcxdWhJZHha?=
 =?utf-8?B?aS9GYVl3T0syYUkzb1FjR2xWV2c3N21YREEyU1AxbHRhcEVGTjA1Q2xvQ05k?=
 =?utf-8?B?RkhiWG40YmVNaTYvdUpHV0lsZzdUTXB3eUFPY1ZtZDVJRkVzVzl6bkp4UnpJ?=
 =?utf-8?B?aGorMVRUaEQzbmZZUitWRHd2T1IwYStuSHBsWE5SVU9Sd0taN24zMzFNZThE?=
 =?utf-8?B?SW9Wc05xQ200RWQ0M3pqUllIRThjL2h2Rjc3aS9Xcmpob2Q3clVITkFMbWs1?=
 =?utf-8?B?RllrUHN4WUp1QlpSN2JIMGVNMTZCcURlUWhVWTNSbk1wVXVQcURHR1BMcXk2?=
 =?utf-8?B?ODJZNmI0ODZka0JyUHhabm5yMWRkU2JrK251bi9va0FoVVpjZkc5NEpDVk1X?=
 =?utf-8?B?ZStRVVdnU05ZOHY3SVFORkJ6OGRBMnpmU3AyUnFIOGtqbWtIYW1DZ1JiWUt0?=
 =?utf-8?B?NFUxdEZ4QncvYWdyUzYzeGt2SzZWaG5lSkl2ZXlFbTQrOFZQMGVzVWxEeE4z?=
 =?utf-8?B?SkxVNEVxYmtod201dW10SFVQSUdZUkhkNnN2LzVNQ25sdVpJL1BRaDNnN21S?=
 =?utf-8?B?dTVKaVkwUHFEV1F2WlVOcFEzR0VzWHVDS3ZhZ0tDRlV1b1NEMGNpdFQvLzc3?=
 =?utf-8?B?WWdpb20xbnRSZU15OXB2K0QybFVadlNWNUpOcXo5TnpjZlQxQVNJQWs3dkp2?=
 =?utf-8?B?ZUJCY2JIQVBBaE1RQkVXNzlWMkZEbGh4ODBjK01NT0JWTENoZ3Y0WW9ZUWpJ?=
 =?utf-8?B?RmxlcEg0MHdVKzY3U2VOQWx2dGU1YjhsNTVOcWRaVGFra1RTbXFlMlIxS2RC?=
 =?utf-8?B?WjNzekl1K0RqY0l2TUVIRXJJSjdnandZOGNyRzNscXRKc3FrR2pEZmJITnBK?=
 =?utf-8?B?T1krdUNhV05XV0hzT1BUdVlVdlhKTXBMNzk4bXZ1V3MxbHd1SzlwV0ZEemxO?=
 =?utf-8?B?a3I5Q09FR2ZlN250czJJMTVBQVJWQURDKytCY0xocWRzWE80RGh4L3czcDFm?=
 =?utf-8?B?Nk1SVVZCbXB6NktTS3JURzRKdDJWbWYzblJmZEU2MzRwVjkzMmpqSklIMDRu?=
 =?utf-8?B?aUxjTmo5UlF5cFN0WDVhS2dsMmk1TEtObk9vU0dPSGZZQU9KYmZVR2pkRTdl?=
 =?utf-8?B?S01tdVlWOTRVdjgvYnJrUGVpT25WZmVaZHZ4blFhZkNFWjk3ZE1Rb0ZkYyth?=
 =?utf-8?B?V1RKbFZGTlp4em9jcjVnd2N0ZWtNZS9na3pzSThvRWU4RS9Pb1pScklmS2NY?=
 =?utf-8?B?NG5NakVaSkFCQ25ockI4Y3piSCtieUM1U1A2eXVrV0poZmc2MTZUOExlaUlD?=
 =?utf-8?B?R1ZqU21HdkdITXEyb1pjMmNSY1l1NHp4SmFmOVZ0VlF2L3I4cXRlc2x5VHhy?=
 =?utf-8?B?NVhMYTZtTzFsalNOamxsbGUzd2NpTjJQWDF4NTYwNG1WQmJHSE01TUlTbEdp?=
 =?utf-8?B?UXQ0NkdzekRKS3B3R3BoYnNqelg4VUxsSTh0NzI5T25KVjlXd255dTdwVThB?=
 =?utf-8?B?RHh2WDNLbmVtZWszQ05VbVNXaU9Hb0E3M3I4WHhsNUpneDdQbVdUaXBKVWd2?=
 =?utf-8?B?WFNQN2IvZlErTURYUm9ubFFMWFJIVkt5NjZuTlB0QzRZVmRDOVp4eE9Vb1hV?=
 =?utf-8?B?VEljTTN6bllaWlJBNTJvdE1sdi9YVGZFNmJXRW10SE5FTkpWSVFQSEc5V0c5?=
 =?utf-8?B?WTcvSGl3S3JwV1dFelZsYWxIUUJGbGRTSmp4R1ErNnRUdEZTR1Y2dTRLTUtz?=
 =?utf-8?B?ak0rZTNZT2ZKU25zK1I2UE9nUTlQT0Z1V01rZDhHQ3Q1emFCT016RGwyK1ll?=
 =?utf-8?B?NlBsWS9pN1V1bmM1NDZwa1lHbzd0ckFnQ0pXd2NLK2w2WEpVU2RTdkI4d2cw?=
 =?utf-8?B?aXFSNmgvZkpmNTFLUFBHTE1Ud3h4ZGdSWXdXUUFjRkRUd0tSeXorV0NxTTVa?=
 =?utf-8?Q?GEDeDyrGCPg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZDcUpwOWFqLzJPbTVjNHVoQ2N4SFV6dVNFZGh4TUdyREJiUFFZN29HRnQw?=
 =?utf-8?B?TVdseWlFc24yMERTYzZWUG1jaDd1ejVVRUVVL2pmeTN2dWp4ejhZK2M3NFNC?=
 =?utf-8?B?N2hXazFrVVRRUnBtcisrZllheWJoVGI0QStPdi9vaHlCWll3WlUySVBEQ002?=
 =?utf-8?B?d1ozaEoxYUR2SEp2c1VSaGNUT2xUUDVmcWtUbVNycUpIWEpFaW0rdit3UmpM?=
 =?utf-8?B?RnlUbWlSdWhDMVhBbVFzVmZzMkpDUFN5a3RsN3YwT2lzOWFqWDRjU1dIb2gz?=
 =?utf-8?B?bmhmeGgvME55aUZRS1dQUHVXYmsvT0p3ZVFTY1NWZkEvdElwYXdQUTMxbERn?=
 =?utf-8?B?eW16bGN6TVVtNjBSSENNamJYSXlLWE9vVDJ0aUhpTkdXUis2WVNVZVFpM2JY?=
 =?utf-8?B?SVEzdDZ3ZnFqM2pZT240cCswSXMzejZKVVg5VW9jTmRVOStRaUhoY3hqTjBN?=
 =?utf-8?B?am14VkgrZ0ZNSjZyTi9sdnVsa0hCaHpMZGN1QnV0WE5FclVpVlp1RWF2d2do?=
 =?utf-8?B?SE9JWVk5VEVuLzlMS3h4aUx0MXZYK1ZvMHBKMjk2R251L0huTzd2aUQyTjdN?=
 =?utf-8?B?bmdIUFF2aHNYd3VkSzZraFc4QzFoL1BoK0Y3MWxiSVRyeVFKSnNULzVWT0sw?=
 =?utf-8?B?SGJQWlU4UzIyTkc1VmRTSUxmdmlaMXhXYy9iL0VmUHo5eTZlMEpqM2NzVzJ2?=
 =?utf-8?B?RGlrZUxTQXUxSUg0RlpXR3JuZmVIYlFrK1ZjY2M0TER1RVNLN1FyYk1rcnA1?=
 =?utf-8?B?K0pGd2JadStLSjl1eGJueGlKRUsrMlQ3dE1jSE8yS2x2Y2ZzUVFFd0dOdFlI?=
 =?utf-8?B?WDQ2RWlzYzlEaUNmWFV5TENXM3Rrcnozc2gvOFl6dDUrNWoybVFHZXNWOHFC?=
 =?utf-8?B?RGxJTWc4RUt4Qll5WVhlMHpKN1VxUjg1aDRuZ2VzR1ByZ1RrcVNyY1U0bzVs?=
 =?utf-8?B?bFNPc05TMU12RmdSd1lBTnZNaHFxVXlhSmxDSGErcTIvNkpXZTkvVlcrcVVX?=
 =?utf-8?B?RzRVb3R2MWt4RnFVTnZrZyt5NDQyNUhmV1NJMjJPQTJmN2duZk42c3JUZmZw?=
 =?utf-8?B?RUZuY2JETTY3MGMzUlZ0TWk5MTl2YzRyL29xQXQrajg4UytXdmJrM0p0b3Ex?=
 =?utf-8?B?K2h1RFFKaUh5MGJuN3lIZXlwdS9nUHV3Zm5sR2hVdTZ1SHJEcDhKc2hXdkNY?=
 =?utf-8?B?VFJqTmlqcTg3c3RLT1U0VDZpamFUMjZsMnRPbU5seEpNRUxzbFVEbXN4NHBW?=
 =?utf-8?B?YkpDUndPMGQxSCtLYzhKc1NrMFJhOUpJQ0IvUFNhb0ZwNEkreVJFWmtDdU9T?=
 =?utf-8?B?bXFPdGtBRlJLWHVhYjFmOSsvQ2hqbjJKMXdBeVBBVDgwT3FDZG1RRlhnRkp0?=
 =?utf-8?B?WkQzc2xiRnFtWVcyMUpaTmJURW5tamc2bmp4UWcwN2lON1JYTzVmVDJtRG1s?=
 =?utf-8?B?c1FFc1JJbGJSRWdZc0EzMFVPcFg3dnZQRlpFSDJOVkN6bkdDK1JYTCtuL2h3?=
 =?utf-8?B?aGVoekNKNklEK2NsVjVIMmZodzhjaUwzcFRsOVBRK3pqSnZBNjJJcmc4UHEv?=
 =?utf-8?B?dWRLaVV6aGRmOEQyMDFncjdzVjJEbmRVekhVY255V0MzMTZZOUtUdHYrYXFX?=
 =?utf-8?B?RnFyUkt6WXpnaDNnb3YrNTgrMW1YQW5sSi9USUxkZVJZVUhpS1Qyb3ZDd05r?=
 =?utf-8?B?K2VlT2hrQS9oZGgyNDlBdGdvYldYRjM0QmFpUHFzRTN4eFhVUVczNldNcS9Y?=
 =?utf-8?B?L3RmRDVUbkUxK1dWc3JWdUM0YVY5N1ZQenYxOWNyRkM5cEJDbUxLYm00R0ND?=
 =?utf-8?B?RnNwRnpneTFJdFRWb1MzMVFIaFpQUXZIQzFBZzRKcWFYQUUvbzQ4bkpOM3B2?=
 =?utf-8?B?YXhqNEZ2R2pYMmticHdxbFFlcGxyNXJVckZHZFJyaG1RTy9WeXNNSEZEMGJV?=
 =?utf-8?B?ZXpCYVpOMGt1M29SWm1xWjdhbXNzajJBWHA2LzU1aGFzdDZ2b0JSV1N0S05k?=
 =?utf-8?B?WHNOYkZuQjdKYWVvdUFxYnRBSEdPVE1qd1huamlWYjFuMFFXblhKeTBBVkVq?=
 =?utf-8?B?T0s2dG1GelRBZHQyTkhrK2o5UkUwdm5kOXdFSzkzQVdRVExKcndVUWpSL0FS?=
 =?utf-8?Q?D114Rbr3i0YoS/Du2ouKJ8gV2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 831a83af-8af1-4ec6-98c0-08ddf7d9b19a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 00:07:31.7760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYsSPEnJLo0UQteWml7ygenS7eefaHTLV90ExRUvtXJJZkXLvBE2AP/2AXixEDnbV3XGumgwh9iEus7Ijeo7RYN8JKElN7fMllUm4FgQxHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
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


On 9/19/2025 4:59 PM, Dixit, Ashutosh wrote:
> On Fri, 19 Sep 2025 15:28:36 -0700, Daniel Charles wrote:
>> when running cm job, it could be that after the fence is checked, a
>> CAT_ERROR will throw an error in the same way as GT_RESET does.
>>
>> Signed-off-by: Daniel Charles <daniel.charles@intel.com>
>> ---
>>   tests/intel/xe_exec_reset.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>> index 7ae53c679..73c5c7e20 100644
>> --- a/tests/intel/xe_exec_reset.c
>> +++ b/tests/intel/xe_exec_reset.c
>> @@ -433,7 +433,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>
>> 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>> 				       exec_queues[i % n_exec_queues], &timeout);
>> -		if (flags & GT_RESET)
>> +		if (flags & GT_RESET || flags & CAT_ERROR)
> Hi Daniel,
>
> 1. Is there a gitlab bug about this? If yes, could you please add a
>     'Closes:' tag to this patch (see git log)
not that I'm aware of.
>
> 2. Would you have a reference to the kernel code that a CAT error returns
>     -EIO?

when there's an engine reset a job that was sent to execution and didn't 
finish before the cat error, the driver will return -EIO as it does with 
a full reset.

-- 

Daniel.

> Thanks.
> --
> Ashutosh
>
>> 			/* exec races with reset: may return -EIO or complete */
>> 			igt_assert(err == -EIO || !err);
>> 		else
>> --
>> 2.43.0
>>
