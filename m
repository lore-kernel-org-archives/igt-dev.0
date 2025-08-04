Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F680C87FD3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 06:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2927810E2B4;
	Mon,  4 Aug 2025 06:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVASoIaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A48310E2B4
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 06:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754287290; x=1785823290;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yKJFClgt3ED4NZvk4zrxWUNW3bp23y4wnLfPVnoNYpE=;
 b=PVASoIaXXmi+Ek6JItx04H8zBfbh65jMp/6zpUP4+OeEWjHyyv35iCIw
 MFsYRl7qQQFK2YmWsxHlkxrDWetI0TJKTL7pdRYYqweQ1EtI+M/Cxhllm
 qiD5sWkQ+PNs7danwAaM3NDikDH/zygf0LYpz1tda22NCrZgkIR3oIj8m
 ZSe1RVWgdewVaFHgXxZgnl7pvUcvHhE3qERD3D4d3lPe6ry1bXuj+8xMI
 /6MTvcJwL1moqWKG4FNOZFBOFzpgz9tRoJACraRtjtSex16koew8bYU4m
 zDMinhKD4yvcZMA2AM9qksDTaiPPn6q4VVtJNmtuczThHaU4qmLZbTycP Q==;
X-CSE-ConnectionGUID: Ahc/WFTlSsueC3sjAHT8tA==
X-CSE-MsgGUID: zOBHLzLiSxWafGOgrFaX3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56501017"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56501017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2025 23:01:30 -0700
X-CSE-ConnectionGUID: q3aqL44fQ8mCCSilS+VeTQ==
X-CSE-MsgGUID: OSRXfDWmTvmNk+cxt6vebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164401089"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2025 23:01:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 3 Aug 2025 23:01:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 3 Aug 2025 23:01:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 3 Aug 2025 23:01:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBGuevWd7Oi2S05+w+kMtsFx0CNeSZcXniT78mlVp0tTeoygfjkrrykK0jC1eMicyvhUaXcYPcIFvHWLqytaaQ8JERi5vWUd59eBIIzv8ktuGXUGUvKMJB9ePeHRQU3HozJns+hQYHH8fV2x965wBsNSZOUwd83NtpO83qohGTNXKKhY6y0ZYpnKhxPlR1tZJqUiAj4FwYSLa8mGHhNtuMZmvr8fo2SQ0ABTL90fv7qSHevD9H3jIc7UDET5QTdvQeYVxFKns0KuhHJBODlaXA3rcSnkUIZn2WW/CEn2aTnTvgGgELjV9WErOHY95Tb9mJrAsfViZ7JmSpOGP2xJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84EyvYkZFNeyCYA6qaRnPK8pte6QaO6vC34BIplHEQA=;
 b=A9agBjjLqjqGZD4AbeCIQ3Ll2BV7khg5LxJIcmHs0yAYv+nK8hFcSPGla44EOxV8VzH0yXI7UsC4n4io2DrUZ5efstRbo4LHpCmgRT1q5QahzmfVsnbsJr4sT69rj5PvuIs7isgQmqOS4z1h+otG8/RcDJankUEllOVSMFSXf+7bDEJaT+eoy2JwMH8R/XK5mUbY1lvuCii+u2K5ZJ61G8dQwTVjrBoazYpJlmqxcRHEIn1Jtg86y/yrdroLQdWyCkN44u1b7COGCtFTQoq0b4J23RC8mQTmw0qj66QsUpoRpLVCOb8JG1iOEl0azs3ZmcdMSI9e+lYjMh/tspVxZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA0PR11MB7257.namprd11.prod.outlook.com
 (2603:10b6:208:43e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 06:00:45 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 06:00:45 +0000
Message-ID: <eb97ed3c-0c68-417d-9c7d-628019688d41@intel.com>
Date: Mon, 4 Aug 2025 11:30:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tests/intel/xe_exec_system_allocator: Wait on mapping
 BO's to mirror
To: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250714170309.2949211-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA0PR11MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3b9969-078e-4e66-ebc6-08ddd31c405b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkY4U25CaVFMdndIdC95ejgxOEpodFE1OWR3WTJrdEtkYm1JTHRuOFI3YmIv?=
 =?utf-8?B?TlpKb0oxYTBxTFpFRDBrVk1yVG5iblJwMHZCNDNsd3JHT2N4NFVuc1c2a2lE?=
 =?utf-8?B?OFMzbFlsMnR4b0VOYldiWlljM0xBcFg0Y0RpL21jNTY2V241dUwyb1N1NXpM?=
 =?utf-8?B?YzZFQlJRai9ERjFnRnVkcWpqSWl0bGE4MjZWQ2hVZ2hlQTRPU24raGg3RDhP?=
 =?utf-8?B?NjF1NUFBSXJEeXI1bmw0eWdLMkdsenV4bHZCTS9tcHBaZDlrTUZnYWJSaE5K?=
 =?utf-8?B?QTZwT3RzQ1FNejN2YnA1WnNaeGRlSDBPaFN3V25URy9MYWtvUnpoUmMzdU8v?=
 =?utf-8?B?b3dKSzFaV0pCaklibGxsUC85MGJXdVZENnR5WGxjUHZDZUVPcm1HSHo4QXdW?=
 =?utf-8?B?ZkMweVRhQXZvWllGT3NSaHpIRno0S3l5R0NWQ1NuYUYvTlBDODJVVXdaVGZv?=
 =?utf-8?B?U2VuR3R1S2NuUitGVjZXdDZsYnJtSWpMaW1nVXpTdkplb2FPN1JSU3B6TTBh?=
 =?utf-8?B?bVg5MHlwVnlqZUtJY2JZRTJXdTl5Y01EdGRyMTRXdEJTRm82RkRLMm9SV3dN?=
 =?utf-8?B?U2pQM0FybWJDYzBDL2lsWWVVRWxNUGp4N2Y5S1lFWWFXT1dIcWlwTkdlYVRW?=
 =?utf-8?B?Zkg5T3oveWYxOWVMUE5QSzVtbElBZml1OW03clF5OWJjcWRqbURJRFNjWG5P?=
 =?utf-8?B?UTg0ZFE0VDY3d0E0bW44Z2lybTRGSlk5Z3hDZ1N2bHBwQVVtVHpjL1RaS01J?=
 =?utf-8?B?WjVPSDVDQVFEdjlMTUJKa1NJOHBWWXhMdW12N2dPakN1V2pzbGJDeElwUUwr?=
 =?utf-8?B?d1VVL1FYb1RyclljSkpZVU9HWHI4YUY5UjVKMk5vYVg5SVNPcERmc0t2Unpl?=
 =?utf-8?B?ZXBpYXppVEFrdWtaZGZXdEU0MXpmck9xc0haQjFzeERZMkdWSnI4R1pWRUxH?=
 =?utf-8?B?V3BLVWFmOEJBMGNNblo2R2lMZTBtRHIzUzFLQURFT095ZHd2dmY4TmFvQ0ln?=
 =?utf-8?B?dktFcjZiaStXQ1BpenlTM1o2bzFBb3lZc3VJdlFGQTBHT1ZQNE1rNEY2WEMr?=
 =?utf-8?B?a3kvNm8xYWxqZEhEN2dxTHRtL1hueVZnbnMzaFdBbmdvMVkrNG9YVnJvWXlQ?=
 =?utf-8?B?NzVRVzZXUDZoZzVmNGVDcldXRER1Ui9BZnh3dTNWczJmYUwvVG1YYUVQMk0z?=
 =?utf-8?B?aXByMXgxZDg5UE9LVVdLS3RmRWs1TEVJVHUzeUdqUVVEWDFyU2lKN1k3NVpI?=
 =?utf-8?B?c1h3MjgxUUZuYnlMSG9GY1BmZ0QzekRsSjVteVVqSEg4Rk1aSlc2K3pEdG9E?=
 =?utf-8?B?R2c2eDNoTjl2K3k4S3JJa2Z4ampUR1p1ZzVZckxaNkxwQ1ovN1E4UGVETUVY?=
 =?utf-8?B?UHJHU3YwclllL0d3SHZEZERMSUFGNnh6Q1BQZjRBdmtiVVpCMVZDUzJScGRz?=
 =?utf-8?B?Y1UzcWE4Zks0VGJEYklGeTRGWTZJQUZrVGhFaE1SalJMSW9saXVtbUpJRU5N?=
 =?utf-8?B?Rm83MUdzcCtqZWRGSDF6aXVVZTJxcVFZNDk1VlpJYXYyVTZsQjA0UzJ0Uml5?=
 =?utf-8?B?MEd2T2xZWnFaeDFrbFBVb0ZTd1VqMU02bkpRU1NlZnBpd0Q1NXdlcjgvREt6?=
 =?utf-8?B?VjJySmNFdFhKcTNjMWd6czQxWkNGTlRtMWwyNG1mN1pJL2ZPOFRyVHdCODlo?=
 =?utf-8?B?S0x4YVJrRm1YTjNnWnJWOTNqVXc5aFRJd1Y2NFBERjhiOG5tSWhVSHVLZ1p2?=
 =?utf-8?B?eUxkY1oyVUgrdmNreDcxMDJMZFhzUFMxY0h6dU5uQ3JnV1VDa3NOVkFIY2ov?=
 =?utf-8?B?K3did0cvRnFGSTNUSCs4bUNicEhRMWV3c0RtaHBtS1dMMjZEQ2Jla3h6Ynpu?=
 =?utf-8?B?RUtBZUxFVmtRUUlPQlhsY3kvMTNEdDR5MjdtZkMvVVJIZjFzejRxSW93eE1y?=
 =?utf-8?Q?FIfdpF5vpAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJ4SDNRcHZZWDFBSjQvNlN2NWNQc283NkZPY0dMY1Z1cmNweHZrVHZJZG5l?=
 =?utf-8?B?Q2ZHOUNWU3pJeTkxcGFhT1UrbUVWS1J3WnBIaGRsZFJ2K1JNb3U2ZGxqK1NL?=
 =?utf-8?B?TVlCUVdWRE41OTNERmk5aUovQUxCdnN0VmdLVjlwazNPdE9tKzQ4RGZVTVhX?=
 =?utf-8?B?dzdoMlg1STIzZmU2VmRIT2sxMDlQTU9qWlFqdUtKRURMUExSZzEyS1ZMUldE?=
 =?utf-8?B?RWlxL2FJR1g4ZTVzYzNUNms0Wk43ODg0VFpmQ1RUSE5jUG1MekJobTVYRWhQ?=
 =?utf-8?B?eFdKWkN6YTcvWmFpRTA3RmtKcHk2YkM1UWhvSlp6R0JvZGUxSnlXcHI5YWpr?=
 =?utf-8?B?WmpIem8wNE80d05NWDU2ZlVycThNeWxZcitWWXdwZzFuc3gyU1N4Z2QyUFNh?=
 =?utf-8?B?b3FtQ2NMYTUwbFZmbVlpR085Szgra0xNZDJ6aEhJY0pzL3dVSXFoZWRyNHdz?=
 =?utf-8?B?MktPQnN1eFJxQjBKeHRKTlpMeFU4R1dNZ3ltV29PNGp2RzBPTkQweFR0YzE5?=
 =?utf-8?B?MjQ1ZWN6MmpVVi9rRTQzU2pIaWJNR0dFREZ4eVhmRk1sSWliTUlZNmhhY0Y4?=
 =?utf-8?B?bkhKcFB2aURGdndtSWhHcjAyQ3EyakF6SDZjMXJMRFRVcWtuMlFhQ0RNZS9P?=
 =?utf-8?B?N0ZId2sraVhnOFB2MkZ3VFp2cmVRS2wvZHlwZU9maCsyVndTRTZRM0o0VGlW?=
 =?utf-8?B?Q2s5ZmVjTTR5VFZwNWtkY1lTOUVxdjJObHlwVXFtMlorUS85enRrSHJ0b0I4?=
 =?utf-8?B?bDJPY0o3RjY4Q3VibVNsV0ZhTjBxRENLYlFnYkxTVldDUWpkNmhaUFljQU5Y?=
 =?utf-8?B?ZE42UmFsUUtaVUMrUS9tS3hsc25wc3Bqa0JJTk1BVlpTWW1FTXRKR3RUWVRm?=
 =?utf-8?B?cUZNSi9Xd2RBT3ViZnZKM2tEREc3aGJ0TUh6MktSNm9zOEhKNXc1TU1tcEIy?=
 =?utf-8?B?cjR6RXhQV2E5RERhSFhDV28vN1Z2WGNCdWVWZWFXWnFNQ1lXQ05EL2N0YndI?=
 =?utf-8?B?MUhFTExJUWpFaXdzbmgwcVZLQ05SVXRIRHF1UGErbW5QRjlSQWZRS0txMHZi?=
 =?utf-8?B?RklsbXo1TmVLT1FJUnVYZ05aMjMrWHpqaEhtVGtiRUlNVzM1MHhKbjcrbzR6?=
 =?utf-8?B?dTQ0WUVDQmhrL2RIckxmMkZ2KzNkK21CQ2lpb2JWck5GQlpGVjJ1V2hnR3R6?=
 =?utf-8?B?bDJYZ1BSSnVFUVNKUHJJdURvdDlrVnFoWVkvcmlDSjdSWHExSU96RUhyQnZT?=
 =?utf-8?B?R01Rbm1BV1I3L1FLaW16d2JIZzRSNzJqMUVEMVhvc1N5OXRHRXZxODhYS2Ja?=
 =?utf-8?B?dVNuaWhmWmkzMUZwQTJyWWJNdnkrcDd2SFJoQkErYWF6R3dVd0MyeWJHemV4?=
 =?utf-8?B?TlplaGZDZklDMWZwc0VSOGNMRE5hTzFManA4SU1vV2p3SGxqUndMRUwvZ09r?=
 =?utf-8?B?akhwTDNybXJXMFg1TFlHM0t2czhDcWZKK0pvNW4rRlZOVmpPN1czcEhpL1dT?=
 =?utf-8?B?aTA2dFhIRGdHdXRaTkFOMmxkVGhuZlM3d0JmTEoyUnNxY1l2dk9UamI2Qy9n?=
 =?utf-8?B?czQrK0p2c2JaL2g0SzR2eGVicjRrcjcxb0ViTWQxUkh2V3V5WmVJUlc4QTJ5?=
 =?utf-8?B?ZFZrb0Roa3FldnlpUWY2VmtpVnpTcUZYMTJIdDhURzYzRXd0QUppVHhFdmU5?=
 =?utf-8?B?RWErWkV0ZXBlUmNDQnpsZjNITlVFZWMrUWlqLzBrU2JsZTluU0d6K2YvbldS?=
 =?utf-8?B?UHlFMkhzalFLS0lZY1VVcXByMUl0SXN3aWIrZndMbVU3UHJOa25IZGZhdnlJ?=
 =?utf-8?B?SUdWMzFaTGxUdFpaM2tubnFQdTNERERNVXd1U0R2RkM5b21IL3dZYjJqSGt0?=
 =?utf-8?B?ZVBneXM4TnFzMjl1WmVpdmlkaTBuMGdFaHZndkN0WGhBUzNtUXcxa1REbjBw?=
 =?utf-8?B?QU5FQnQxZ0xyL1NiUnZkVkpYdDE4SENXbU9kQ21iSTZuVXZNeTNUOE5ZZklx?=
 =?utf-8?B?WmlIQmh3UXZhU2J1ekJDM2R4bUZPZ3RtandFanJwQ000SkVBVzFDTE5QaHhD?=
 =?utf-8?B?REJMV2Q5UWNaZldNYloyOEhWU0ZyQ1d0MjJENGQyYVAxTHNDVCtRZGtPamhG?=
 =?utf-8?B?ZnV4WkR6QUJMZ2RwTlhaR1pqY1FjbWVsbGJqNmdHY0JZbVd4UitFa1FMMDRN?=
 =?utf-8?Q?0zo1Ts5jCCnLU3H6NNYR4uI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3b9969-078e-4e66-ebc6-08ddd31c405b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 06:00:45.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3vxIwGv1M0HHZtEf4tWHMDu4dioE3IHD8JfdWVAWxDFr7r5g1oW5avpY4LKDYQ7ckVRLSYHHp2UpZ6kx2ODpPTRUStiMWSslA3Cj1rtRdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7257
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



On 14-07-2025 22:33, Matthew Brost wrote:
> Mapping a BO to the mirror is a non-zero time operation, especially
> since TLB invalidations can take a while to complete. Without a wait in
> the test, this can race, leading to possible data mismatches, job
> timeouts, and other issues.
> 
> Make mapping to the mirror a synchronized operation.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 57 ++++++++++++++------------
>   1 file changed, 31 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index f8d144328e..006a3dc920 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1012,9 +1012,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>   	struct test_exec_data *data, *next_data = NULL;
>   	uint32_t bo_flags;
> -	uint32_t bo = 0, prefetch_sync = 0;
> +	uint32_t bo = 0, bind_sync = 0;
>   	void **pending_free;
> -	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
> +	u64 *exec_ufence = NULL, *bind_ufence = NULL;
>   	int i, j, b, file_fd = -1, prev_idx, pf_count;
>   	bool free_vm = false;
>   	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> @@ -1154,20 +1154,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		memset(exec_ufence, 0, SZ_4K);
>   	}
>   
> +	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> +	bind_ufence = aligned_alloc_type.ptr;
> +	igt_assert(bind_ufence);
> +	__aligned_partial_free(&aligned_alloc_type);
> +	bind_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> +				 bo_flags);
> +	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_4K,
> +				      to_user_pointer(bind_ufence));
> +
>   	if (!(flags & FAULT) && flags & PREFETCH) {
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>   
> -		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> -		prefetch_ufence = aligned_alloc_type.ptr;
> -		igt_assert(prefetch_ufence);
> -		__aligned_partial_free(&aligned_alloc_type);
> -
> -		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> -					     bo_flags);
> -		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
> -						  to_user_pointer(prefetch_ufence));
> -
> -		sync[0].addr = to_user_pointer(prefetch_ufence);
> +		sync[0].addr = to_user_pointer(bind_ufence);
>   
>   		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
>   
> @@ -1176,18 +1175,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			region = 0;
>   			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
>   					     1, region);
> -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
>   				       FIVE_SEC);
> -			prefetch_ufence[0] = 0;
> +			bind_ufence[0] = 0;
>   		}
>   
>   		if (exec_ufence) {
>   			xe_vm_prefetch_async(fd, vm, 0, 0,
>   					     to_user_pointer(exec_ufence),
>   					     SZ_4K, sync, 1, 0);
> -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
>   				       FIVE_SEC);
> -			prefetch_ufence[0] = 0;
> +			bind_ufence[0] = 0;
>   		}
>   	}
>   
> @@ -1246,16 +1245,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			struct timespec tv = {};
>   			u64 start, end;
>   
> -			sync[0].addr = to_user_pointer(prefetch_ufence);
> +			sync[0].addr = to_user_pointer(bind_ufence);
>   
>   			start = igt_nsec_elapsed(&tv);
>   			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
>   					     1, region);
>   			end = igt_nsec_elapsed(&tv);
>   
> -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
>   				       FIVE_SEC);
> -			prefetch_ufence[0] = 0;
> +			bind_ufence[0] = 0;
>   
>   			prefetch_ns += (end - start);
>   		}
> @@ -1374,11 +1373,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			exec_ufence[0] = 0;
>   
>   		if (bo) {
> +			sync[0].addr = to_user_pointer(bind_ufence);
>   			__xe_vm_bind_assert(fd, vm, 0,
>   					    0, 0, addr, bo_size,
>   					    DRM_XE_VM_BIND_OP_MAP,
>   					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> -					    NULL, 0, 0, 0);
> +					    sync, 1, 0, 0);
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			bind_ufence[0] = 0;
>   			munmap(data, bo_size);
>   			gem_close(fd, bo);
>   		}
> @@ -1456,20 +1459,22 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	}
>   
>   	if (bo) {
> +		sync[0].addr = to_user_pointer(bind_ufence);
>   		__xe_vm_bind_assert(fd, vm, 0,
>   				    0, 0, addr, bo_size,
>   				    DRM_XE_VM_BIND_OP_MAP,
>   				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> -				    NULL, 0, 0, 0);
> +				    sync, 1, 0, 0);
> +		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> +			       FIVE_SEC);
> +		bind_ufence[0] = 0;
>   		munmap(data, bo_size);
>   		data = NULL;
>   		gem_close(fd, bo);
>   	}
>   
> -	if (prefetch_sync) {
> -		munmap(prefetch_ufence, SZ_4K);
> -		gem_close(fd, prefetch_sync);
> -	}

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +	munmap(bind_ufence, SZ_4K);
> +	gem_close(fd, bind_sync);
>   
>   	if (flags & BUSY)
>   		igt_assert_eq(unbind_system_allocator(), -EBUSY);

