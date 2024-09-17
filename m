Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E251BC3ABD4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 05:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B06310E40E;
	Tue, 17 Sep 2024 05:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyPgM6eP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AA910E1E9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 05:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726550628; x=1758086628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yyzjBqWwRdUca/mpmfsE4V6FenmkiKzcLoTqRu5wk8U=;
 b=KyPgM6ePLtCCtUUorxRosb2jxCnQeguVGXTINKthd6goVaJWNXiJo1ic
 Wu6nEb7S5d2A82aJoHAdfDTrZtHl7egxhIZUOXEV2yjAhOu2dglj/aS+3
 9N5w0aWuzAVUrbVCLyBkhwxkeUjksLSGGTxi1/Q6TAqhCq7UpCv7ioGmg
 3eJcA7V0dK9l8gKjYA//ri4HWJxuZoc/eQldNqs2v63zOWt8fXajS996g
 YI8OpLGfbd5f7Bl5+YnVIxi9Oyrm8NFQNT6fdPl+/I/R80KzYBaz1AVXr
 WeAMWgAlBjV9V9x6/xhXTJrGI95+8Ou+d58zVG26X3smedrUU9vnujvbt A==;
X-CSE-ConnectionGUID: CybNyCwVTdGSrqEH3VHarA==
X-CSE-MsgGUID: uLdPCrY9QVWXkg3/Lm/pZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24880840"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="24880840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 22:23:43 -0700
X-CSE-ConnectionGUID: /la9SMIxQD6YIja7+pxMww==
X-CSE-MsgGUID: 7m3hj/lnRZedJDlqNGMWOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="68714076"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 22:23:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:23:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:23:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 22:23:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 22:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od9smla8udA4SYcNLPUMT8rIPH3OqUqA0WqwUZK8nKYUae+eM9AW1pBXqoH76/YbS4g+eTOG4BSqHTSf0NUMljhotL2wfzjYAb5Soe4rRHSg023jTKog61OPesjvnh0Mj2Wk8QEGqt0u322D3j1pzAUvWBTrlouZKN/qQmZtAOm3QNGiZTXC4P8yT+o16HJYOI8FgOOVdwIEUzUbop/LVDR6Fh91An8HEiTG5AmqG1jvGASpyQEFWUuwBhvhHvNP7edoa0j8UsNjGBDJ6umquZ+itllvOTLg8mXn+jPqeTxFMY85Hq5rUeDWoGcMaIyBiIUMoQkYzmR2Ft8KuxxBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/nJuy3Zyi0Y5w8Il4J9AZB4GbzocKcARx/eecpHyNo=;
 b=EE0ih96cxrZLAtFLJgAZFd+YpZx8cC4/VsK6FFYt0PvBZoFj6KmMk1PJIdUsTIQIqU7n6M48l9jXdfVX0VCFSdQvP6lXCkEYWuYiwPvdO3WGhJgrMgwFIZLY0/ZRFz2KVrxDIKLKn+In0074nGAbZsCDLqGjD044o0w6BdNQmRDBfKkl4PyzNUX8NBevFcg5ugzXnupqY9CxWB/7BupH48cQeRsLBC+kPHA58DcGurI2qkOK7oqxh2yur6JZeCo3FKZxyVqcQvPi5mu0TLYR+Wf2q6LV4OsevaLlv5j2h4RQ0y9m9/K2nbB5wAMoAI8PduqVlNCZZhqEae0biHiNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 05:23:37 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 05:23:37 +0000
Message-ID: <450e8e3e-c411-40cc-a4e8-9dd3b667e420@intel.com>
Date: Tue, 17 Sep 2024 10:53:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_joiner: Add subtests for force ultra
 joiner validation
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
 <20240812044739.5630-3-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240812044739.5630-3-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: d538c962-4a56-45db-2b04-08dcd6d8e1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjRIY01CWmgrR2swUDJWdlRXRFYrK2NpYWp6NDBjcC93aXE1akYvcnZWSUZK?=
 =?utf-8?B?dTUzQVNQTGdxVGUwMUZ1ZEpWOFMxUUhCZGJkTlVPRmFlV3NrQlk1WmhkS05o?=
 =?utf-8?B?QmFtemQzdkgwYWtDUWhMYktmR09COS9vZld5cU9WQkRKL0VUUGJkVVk5Z053?=
 =?utf-8?B?TmRmNE9uV0QrVFRycGJxVDY1RTlhTmtmSkIvUHJodlNlNTl3MFJ5MUtGejZt?=
 =?utf-8?B?RmZEam5TUWFhQUVWNHJDbFJmdDRNUEJYK2RaRDAvNHRTeWkzeFJPc3JIa3pT?=
 =?utf-8?B?eVIwTFIybnlMMXZ4M0NxZGF6aGZ1eFBXbndlTzJuTkVkcjZseHQ4eUhyaU54?=
 =?utf-8?B?a0xKdXM5Skg2RERFN3N3NlZ5a2VaMWpNblBmdnl5VlowWlZXTHNxQW5oZUgv?=
 =?utf-8?B?Sk8wbWltcFZmbXp1YlV3cWcyc01UdVJ0SENHT0IydXROQzcrTHEydFJ6UWpq?=
 =?utf-8?B?a1A1K2lRQmpmYSt4ZmtsZWVhcnVRNDUzeW0wZ3ZTMWQzWUUwTVZKR2ozcDVJ?=
 =?utf-8?B?NW5Uc1c4UjMrM3RBMG1HU0JrL09LTkVqUUxmNTllR0ZMZ2Y0eVZqUDhQTm5V?=
 =?utf-8?B?NEpOTWlaZG5rYnpuMUxDbnQ0UDUxRTZRN0ZYVHFnMlFzSHpBWVhlOGRXeExl?=
 =?utf-8?B?Z2xocmo4N2h4Q0MwaFZ2eWNGdE0wOGtCdms2ZzZlbk1IVDc3SDRTRXRPYkgy?=
 =?utf-8?B?S2YzQ3lndDJKNnNhR2k3ekVuWnZMRlh1M2VlM0ZsZUtUaWgxRFZ6WGlGbjB2?=
 =?utf-8?B?SjBsbTVsREJnK253NWZpNlBGU0NCVDBDcHlxbGsvckpmUTltcU9MSDluNTh5?=
 =?utf-8?B?OElZRjNReEQ0N0hTemI1dmd4Z3hGc09maU1RRm5OV1k5MjkzRUJtWTQ3ZHpy?=
 =?utf-8?B?VjdlaldWTzBjWW9NS1hOeHlhZ1lDUGw0WXJCOW5VakdpMWsyUHhiTWE2NURw?=
 =?utf-8?B?eUNxTGpUTDRzYWFvSnRSMTRRbTJzcjlxMjRhVnNMSGZUNVJlSGh0U2F2NW5C?=
 =?utf-8?B?cDdydldRNzJhNmRSTzc0eVY1VmRTam1uZWI0aTZrQ0lSRHFoS2JjOEcxTlJu?=
 =?utf-8?B?NkpaUERlRmU1bzlQeUR2dFYwWHF0em4zY2krQ2x3b3NKQmlxbUpjQStLaExT?=
 =?utf-8?B?dW5jME1lMmE0bEd1VlR1Z3VpekQ2dWJVc0Q2THoxZzNBMS9HUHl6M0t3OHZy?=
 =?utf-8?B?QVV5V1BLMVZrN0lJRnZjZEhCWGhYejZTUk5DVlovcUdmMlVLT2drRklnM3d6?=
 =?utf-8?B?Zm1HdGpRUjRCVDBuVVUvSnFybjJSaDdnTHFibUU0TkF0YWowUmFNNEpQcjk4?=
 =?utf-8?B?V3QxWkcrRWI3dUdJdEppYVBHckI4VGlNQ2Fpeksxbks2azF6bmk0eTJ1cXpz?=
 =?utf-8?B?K1Z1VnRsdVNEQi9hUnMzc0o1MXJMeHVpUXdYcHZpSkY1MytjajV3NVgxUGhK?=
 =?utf-8?B?VUpuRTdOVkxWZXcwcUdvRmZnTlZPM0JxNEtaY1RWckp3YzdIc2ttTkVTN1dx?=
 =?utf-8?B?YWltTHNISzhyRHM1NmRoK280UG9EY05EK0Q4THhaMUVUZ0EyTXZCazBUbTVY?=
 =?utf-8?B?SEozS3BhZm9NdDZNenVnclNWRW5YZXFsM0dSVW40NnRBWUU0ZWthSzg2UThr?=
 =?utf-8?B?Q1htUnM2anNaVjB1b2NuTkM0SDBUemtvL2pmUEdvcjRXZHc1cm9lOE1pVTJR?=
 =?utf-8?B?WkNVZURJdnZYS0ZUbzNuaitjZldpVEg4WnJMZVBXeUwzTzNDb1ZUd2M2TlRL?=
 =?utf-8?B?amF4dkhGcTJlb3p6b2IyeGxrK1AxMDAyVW5WRnRtVnlHME1vUDZHOE5UWHJB?=
 =?utf-8?B?WUJFSXU3RzFLMnQwbnlEQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3hYUjE4NkhkUDZKUHVsTjB5YTFuM2FBa3JaMkorUldaRy9BS0JUd3RvNXBE?=
 =?utf-8?B?T21Eanh6b2ZIazVHMmZFbnRwMlFwcjJJaVYydUwrYXZveU5DcGRKS3FjUEV1?=
 =?utf-8?B?SWZCRmdHc1FCN24wMDdiZ3ZVOXRwZzk1eFpwQnNoMUpBTTVMUWRvQlhKWDZz?=
 =?utf-8?B?U1Jlb0xlMHVxWHRkdFRYaitwRG5yWEhFdVd0WkhtbldkenJEQ25icDlKTm1v?=
 =?utf-8?B?ZEVWc0RkL1gxYXVsYXBlcmtjaGtsSnZ6aWVobGg1MUhrN3ViS3g4YWk4a3BQ?=
 =?utf-8?B?Z0Z3VkxvV1hjbUxUVWlxODEyUklNZXVHaVRhUGgvREZBT1NCcEdUWnpUVEtQ?=
 =?utf-8?B?Z2ZzajNXb3J2U0s5ZUV2SW5qSW1ZWUJ4TkpQclh4L2tIaCtsblZYOEZVdkFx?=
 =?utf-8?B?Z2ovQ1hHcVlmM09STDlzblB5MUNTTkN4d2FjK3JuTmUrVmUvbWZpckRCMGZy?=
 =?utf-8?B?RlFqT3hCdngxVmNkVmk3ZlFRaVY1d2F3RjE2N2pSU3U0MmV1SVBqYnpJWSt5?=
 =?utf-8?B?TTdzUDNIMHhpMDNZNUVVak5jaWxMckRhdXRJRjhGV09lUHBCbjFtYU9INjNX?=
 =?utf-8?B?V2VqMFRMdzZrNmgxZzFTcUpxNjhDQWZlY2ZlT0lxV3VhajdaaG16MDBsZVBn?=
 =?utf-8?B?Nm9WRGNOWURoa0NtYnZYTUVLenhOMUladkE2c1RJOC84VFZRWm5tSXpqWStl?=
 =?utf-8?B?RU9qL09TR1hzL2VIcDZzNUJSaEVsUVJlV3F1OGdZQVlEN1gvcUpGLzZRTEp3?=
 =?utf-8?B?dUlVZVZ0TzZ4MktTQmZTbUhkWnNjRmxId2tGWTZ5RFBCR24zWllwL1c1WWps?=
 =?utf-8?B?WEVXalNONmxhY3R0dU5FOFprWW5RWFNVYWpxT1JlY3RLR0Y2RnRhM2xXNXc2?=
 =?utf-8?B?K0pxV0JLSFNiR3ZLTzZYYVU0WlhhWFFrT2wzbWViTlR1SHA3RndMd3c0anZi?=
 =?utf-8?B?dDFxMzMwYjJkSGxNek1qZDhTeUZIZitHM2FjS1d2TFI5SUtCTnRseHEzWWFC?=
 =?utf-8?B?QXg0TWFyY2hkVUxnU281bW1EanN3Z1JWWVVSMXBBM3J2OFBRNDdVNEtxQlJU?=
 =?utf-8?B?M3doSGUzamcwU1QxYVk4YnlUMnFtenkzcUVtRm14c3BCZDI0dE54Y0pjMGJJ?=
 =?utf-8?B?Mkx4eFZweGdNbjQ5d2REWjlpK05ENFRKNHpyWHVNSXJYWm9kM1FTek1vK3ZU?=
 =?utf-8?B?YUpOMGVXWGlzRDRLWWJ6b04xc054RitYQ2hZSXlsbUg2aUpyeGdUWmYxaVNX?=
 =?utf-8?B?OEhyc2F6NHJYMENqaWdzSlMrOEtVaFRjbzJUbXNSL3hGWDJSNUg0Z1FLVGY2?=
 =?utf-8?B?L2FCRHFsUkVFdnN2dm8vb0l5OXVPT0tuVm1jTTZZSnlZcnNHTkZGU0pBY0Ji?=
 =?utf-8?B?bDd2Z1VBcExPRmpUZFQyTHJzVHprN3BLSmRuWGx0VW0xT1g0a01KZnA3VEFG?=
 =?utf-8?B?Z2NOVFd0YTc2WGlVQlZiNStiUVlWYUdLdUhBYkh1WmhHcjh6QzRwUFlpYVFh?=
 =?utf-8?B?VTJZd04yK2ZLUlQwT0NxMzQ5emxjdXQxeU11MUFOazNvR2I4ZDZ5UFpzcTBO?=
 =?utf-8?B?NmpEbGRvQk1vUkJSTDREMnFNL2Jvc2pvZDYyQWJldDZPV3NSb0ZhU0RSOTVz?=
 =?utf-8?B?cG9sZ2FlWjh2WTRIRjN2M1c1cEJaRlE5NjdhT2RTU0ZoTlJCK0k4a0Q4ai94?=
 =?utf-8?B?VjNmUU1kc2E1Y0ZPc3IvSGlnamlSenIrM1FPYUYyNmxDQlBJR2FNVTBoOWF3?=
 =?utf-8?B?MmxGVEFnUkcySm5aTkpzNmVGTW5tUFBwTjhldGJLMjdndmtuSnVKbmRZdy9l?=
 =?utf-8?B?NjYvQ0xScDB6L1E2U0ZyN1dEeklHTWt6eTYxMnhzdXk5ZjVJdjhGVEtxQ3hs?=
 =?utf-8?B?ZXFSQWtRQ3BUcW5NMUFLSEdnazE5eFdFQkhKQnREZTE0Sm0zQ3RiQWw0OW9W?=
 =?utf-8?B?OHNzNUp1U3M3N29hTEp0NWlzeEJrTkU4Q1BucUlHRmdjKytsMW52eW5KS1lX?=
 =?utf-8?B?TDRLeUJsamh0V3Y4dThsVGJzZzVSdEpOeFBjeUZPMkVrTDExU0tSWThEZFpx?=
 =?utf-8?B?eVdGZE03b1hRWEZzWUQyeU9CRGMwbVBlR1hsVWNPSytlaUJqbDU3WmpJZ0Vw?=
 =?utf-8?B?eW03bWd1cEVrMElwdUU4Sm9SK1RKVmh3Tk92Y0dneTFEY2lzeXdGZHZqUDdl?=
 =?utf-8?Q?trAcaIECDLMFszp66IyPseQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d538c962-4a56-45db-2b04-08dcd6d8e1c5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 05:23:37.2196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r28OLT2WJZwNdzTvcrzCAsu1CDu+tRpTIDbRiwfkjv5b/pl5hjFHYEEV+m92qA6aPKSF7/1JcrSDBUIxWdVn3uk+rATsC5vtVdo9mLrNkFyfXodh0CsCas8mLy2rFrlr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
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


Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
On 12-08-2024 10:17, Karthik B S wrote:
> Extend the ultrajoiner subtests to validate ultrajoiner on a non
> ultrajoiner supported display using force joiner.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c            |  16 +++---
>   lib/igt_kms.h            |   2 +-
>   tests/intel/kms_joiner.c | 107 ++++++++++++++++++++++++++++++++-------
>   3 files changed, 99 insertions(+), 26 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 08b628f1a..3b252b00b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1720,34 +1720,34 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
>   	return true;
>   }
>   
> -static bool force_connector_bigjoiner(int drm_fd,
> +static bool force_connector_joiner(int drm_fd,
>   				      drmModeConnector *connector,
>   				      const char *value)
>   {
>   	return connector_attr_set_debugfs(drm_fd, connector,
> -					  "i915_bigjoiner_force_enable",
> +					  "i915_joiner_force_enable",
>   					  value, "0");
>   }
>   
>   /**
> - * kmstest_force_connector_bigjoiner:
> + * kmstest_force_connector_joiner:
>    * @fd: drm file descriptor
>    * @connector: connector
>    *
> - * Enable force bigjoiner state on the specified connector
> + * Enable force joiner state on the specified connector
>    * and install exit handler for resetting
>    *
>    * Returns: True on success
>    */
> -bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
> +bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, bool ultrajoiner)
>   {
> -	const char *value = "1";
> +	const char *value = ultrajoiner ? "4" : "2";
>   	drmModeConnector *temp;
>   
>   	if (!is_intel_device(drm_fd))
>   		return false;
>   
> -	if (!force_connector_bigjoiner(drm_fd, connector, value))
> +	if (!force_connector_joiner(drm_fd, connector, value))
>   		return false;
>   
>   	dump_connector_attrs();
> @@ -6420,7 +6420,7 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
>   	if (debugfs_fd < 0)
>   		return false;
>   
> -	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
>   	close(debugfs_fd);
>   
>   	return ret >= 0;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c8e89b076..8d154ec47 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -262,7 +262,7 @@ struct edid;
>   
>   bool kmstest_force_connector(int fd, drmModeConnector *connector,
>   			     enum kmstest_force_connector_state state);
> -bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
> +bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, bool ultrajoiner);
>   void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>   			const struct edid *edid);
>   
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 633bf51c7..a1510fae0 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -51,15 +51,24 @@
>    * SUBTEST: basic-ultra-joiner
>    * Description: Verify the basic modeset on ultra joiner mode on all pipes
>    *
> - * SUBTEST: invalid-modeset-force-joiner
> - * Description: Verify if modeset on adjacent pipe is declined when force joiner modeset is active.
> - *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs,
> + * SUBTEST: invalid-modeset-force-big-joiner
> + * Description: Verify if modeset on adjacent pipe is declined when force big joiner modeset is active.
> + *		Force big joiner applies bigjoiner functionality to non-bigjoiner outputs,
>    *		so test exclusively targets non-bigjoiner outputs.
>    *
> - * SUBTEST: basic-force-joiner
> - * Description: Verify basic modeset in force joiner mode across all pipes.
> + * SUBTEST: basic-force-big-joiner
> + * Description: Verify basic big joiner modeset in force joiner mode across all pipes.
>    *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
>    *		the test exclusively targets non-bigjoiner outputs.
> + *
> + * SUBTEST: basic-force-ultra-joiner
> + * Description: Verify basic ultra joiner modeset in force joiner mode across all pipes.
> + *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
> + *		the test exclusively targets non-bigjoiner outputs.
> + *
> + * SUBTEST: invalid-modeset-force-ultra-joiner
> + * Description: Verify if the modeset on the other pipes are rejected when
> + *              the pipe A is active with force ultra joiner modeset.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -106,7 +115,20 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>   
>   	for (i = 0; i < data->non_big_joiner_output_count; i++) {
>   		output = data->non_big_joiner_output[i];
> -		status = kmstest_force_connector_bigjoiner(data->drm_fd, output->config.connector);
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, false);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +}
> +
> +static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
> +{
> +	bool status;
> +	igt_output_t *output;
> +	int i;
> +
> +	for (i = 0; i < data->non_ultra_joiner_output_count; i++) {
> +		output = data->non_ultra_joiner_output[i];
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, true);
>   		igt_assert_f(status, "Failed to toggle force joiner\n");
>   	}
>   }
> @@ -297,23 +319,36 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   	}
>   }
>   
> -static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
> +static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display, bool force_joiner)
>   {
> -	int i, j, k, ret;
> +	int i, j, k, ret, count;
>   	igt_output_t *output, *non_ultra_joiner_output;
>   	igt_plane_t *primary;
>   	igt_output_t **outputs;
>   	igt_fb_t fb;
>   	drmModeModeInfo mode;
>   
> -	outputs = data->ultra_joiner_output;
> +	if (force_joiner) {
> +		outputs = data->non_ultra_joiner_output;
  >> nit, would it be appropriate to rename non_ultra_joiner_output to 
force_ultra_joiner_output?
> +		count = data->non_ultra_joiner_output_count;
> +	} else {
> +		outputs = data->ultra_joiner_output;
> +		count = data->ultra_joiner_output_count;
> +	}
> +
>   	igt_display_reset(&data->display);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	for (i = 0; i < data->ultra_joiner_output_count; i++) {
> +	for (i = 0; i < count; i++) {
>   		output = outputs[i];
> -		igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
> -		igt_output_override_mode(output, &mode);
> +
> +		if (!force_joiner) {
> +			igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
> +			igt_output_override_mode(output, &mode);
> +		} else {
> +			mode = *igt_output_get_mode(output);
> +		}
> +
>   		for (j = 0; j < data->n_pipes; j++) {
>   			/* Ultra joiner is only valid on PIPE_A */
>   			if (invalid_pipe && j == PIPE_A)
> @@ -461,7 +496,7 @@ igt_main
>   			igt_require_f(data.n_pipes > 3,
>   				      "Minimum 4 pipes required\n");
>   			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false);
> +				test_ultra_joiner(&data, false, false, false);
>   	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> @@ -487,15 +522,15 @@ igt_main
>   		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
>   
>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> -			test_ultra_joiner(&data, true, false);
> +			test_ultra_joiner(&data, true, false, false);
>   		if (data.non_ultra_joiner_output_count > 0) {
>   			igt_dynamic_f("2x")
> -				test_ultra_joiner(&data, false, true);
> +				test_ultra_joiner(&data, false, true, false);
>   		}
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic-force-joiner") {
> +	igt_subtest_with_dynamic("basic-force-big-joiner") {
>   		igt_require_f(force_joiner_supported,
>   			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(data.non_big_joiner_output_count > 0,
> @@ -516,7 +551,7 @@ igt_main
>   		}
>   	}
>   
> -	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
> +	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>   		igt_require_f(force_joiner_supported,
>   			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(data.non_big_joiner_output_count > 0,
> @@ -539,6 +574,44 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> +		igt_require_f(force_joiner_supported,
> +			      "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(data.non_ultra_joiner_output_count > 0,
> +			      "No non ultra joiner output found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum 4 pipes required\n");
> +		igt_dynamic_f("single") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, false, false, true);
> +			igt_reset_connectors();
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> +		igt_require_f(force_joiner_supported,
> +			      "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(data.non_ultra_joiner_output_count > 0,
> +			      "Non ultra joiner output not found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum of 3 pipes are required\n");
> +
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, true, false, true);
> +			igt_reset_connectors();
> +		}
> +
> +		if (data.non_ultra_joiner_output_count > 1) {
> +			igt_dynamic_f("2x") {
> +				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +				test_ultra_joiner(&data, false, true, true);
> +				igt_reset_connectors();
> +			}
> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
