Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B89E68960
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 09:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B15310E848;
	Thu, 31 Oct 2024 09:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmkGEtOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354310E426
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730366632; x=1761902632;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=g8qhobOA1kM2icevBvTQt5ccSYul+YunVc/iiwv2U2g=;
 b=gmkGEtOoq3ENNgh2p3yAvF/f02dYxIN0xPcYbEPY3tAj5lxYE1vPBTQt
 G2FSJZe5BMVySMXEDUisOjcvJnYeCOKZfHvQFUaW6VTBsjIaTEnWaF/uh
 GzH4wYRUuf4NRN9A2fXX8Q8t3z91ioPs+I+N3Lj1FDysR9ZvJIT3YT+gB
 Svg+ADJYQYNP7FvrdHSFs0YLVGkegrcb8vb5ojVzSajJq9LrTFRjcITXH
 HqQ97KoOwkfecwgwvXJg8j5CPqPYStvyUEXz+lUHR30cmoBHp+nU6aq6e
 yzGwSitLtt99lxAvZ+lXX39tvPAGxKcl8zeLqlImuJY1J74OmRagAtScJ g==;
X-CSE-ConnectionGUID: 9ujwZUUTToOJd5wy6azccw==
X-CSE-MsgGUID: 4l8P3ZupS2qP0+BA75pgTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="34024982"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208,217";a="34024982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 02:23:51 -0700
X-CSE-ConnectionGUID: 7ClzAa/zSiSUN/pubUDeoQ==
X-CSE-MsgGUID: SnyZNQ14SGKkQ9xMquVsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208,217";a="83000056"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 02:23:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 02:23:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 02:23:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 02:23:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/fIzNhanuCXb1NAKjvZzGT0hUObqI6Az2U/ihbSlovxzf4Bd0DtVizyrFyK14oL6fWr7ErM4QYzCvqoNNjSreC2tAcqtSn6vDfKTE73ZGgcHDIcfmwLcN2WgG91oPUNZHri9d0nXENLzjszdPW9MVh2g2IPFs1skWF04D1+Wn2NADOOmFDKMGm+Y5klAkr5CprhBlGkaCGZOwbuxKF26eYbaHWRoS9xY4TXQodZs8GoFI+2/j4x8/sMkh+ouWotoYKYx6PnBCXqMs+zB5wmneEw9sxCFg1E9PLo7koJSs1PUGK83Ee3xWfmBUx/3wZcIzevIlfs/VXog9Z8bAKP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8qhobOA1kM2icevBvTQt5ccSYul+YunVc/iiwv2U2g=;
 b=D+m1uvFvbtBNo1nRXA3vJekSTNNMm9U6+sTaM99cTK3Xp7NU86P2yA0p9baB+Anvyuz8qapUz0hik+k2S595Df5dQGQXOwFxoOt4Fr5W14LqRmLtGtlV0xkdNOm6gX6+Fc3XQRKFiGPK82qOSV5aB5GtUm6LkujXRxfoYNqLR2Gl0qwKQoS1g8uUj8GDd17cZS8kGMH80jw/E3/iAPiGRzYYzu/lT8qK4agzPTQP20q97JhXEgYgLYjFOJt2wyWfJfNMN1loMuEnVmjVT9LA2/XWorIJXOk2YF3pyT5BAYHypefzUXSOFG0r/TXG5Q3ngBu6Db0HAFeVWas40Gv+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Thu, 31 Oct
 2024 09:23:43 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8093.023; Thu, 31 Oct 2024
 09:23:43 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_psr: Check sink status only when wanted
Thread-Topic: [PATCH i-g-t] lib/igt_psr: Check sink status only when wanted
Thread-Index: AQHbKpkrqpQZ5Npwm0CvuJBTqf6hW7KfWa6AgAE+RgA=
Date: Thu, 31 Oct 2024 09:23:43 +0000
Message-ID: <33c0eed9de0896a133ddf9f71ec96543e8c64329.camel@intel.com>
References: <20241030065827.2392745-1-jouni.hogander@intel.com>
 <cc55b868-9a05-48df-a9a5-6bb2639e8286@intel.com>
In-Reply-To: <cc55b868-9a05-48df-a9a5-6bb2639e8286@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB7007:EE_
x-ms-office365-filtering-correlation-id: fd30206a-e196-4719-0c5c-08dcf98db6e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a1F0VXVlK3lnK3lmV2dwZFJQTzJienFmSlA3VkdLNW95ZzArazFlSllCVXBT?=
 =?utf-8?B?N294SWNIZ1FqU2VtMWdvTTB6dTk1RStBT3VSRjdjSUQxT2xXVXFHdHdNdUN6?=
 =?utf-8?B?SmQ3MVlLbmUyeGpCSCtwSCtnVWxoZWlHTENQdW1CNkhaY3Z5UnZ5Mldhbm1X?=
 =?utf-8?B?Q1NpR1RDc0phcHYyWUxXbUkwZ0U3SkZXMy9FZlFURkFYdEVBcWNMTlBFYlF3?=
 =?utf-8?B?NHNSdWVyajVQYitZcDZEZkVlUFNZQU1DR2VraEl2bVg3bmlSOXhybWlPbWhQ?=
 =?utf-8?B?Y1NUVFdvYmdxMVJrMi9SQ2tLUzdLYkxnYkpuZFB4SGpITjVrbmo4WjBHQlF6?=
 =?utf-8?B?ZnlIbjQ5U2x6WEo4SzV6SWQ3Q2VheWNEb1JySzVJNkZUOXhHd2t5a2J1UHVn?=
 =?utf-8?B?cWlxMU9TOTFYUTJjUkY3ZHRuMXMxRWM0bEM5SGRGTzArb1MzVWpQZ3FJemVS?=
 =?utf-8?B?Z2hONFVSd1IxOTZLU2xjanAvTlZJYmI1dzlpMmdRUE95eGtmODJ2QTlzNm9s?=
 =?utf-8?B?UTN6UHdUYkhzQ0d1Y0VRamc5N0JCV2NIRldrRjU3SWsrd0JVSStIN1Jpb1FM?=
 =?utf-8?B?Smp0WlRIRm51bm5mT2FvVThsV1ZkRFlCTUZhTXFoVWZMdEJtRWdvcWFTeFVs?=
 =?utf-8?B?MzY4ZVd2TDYxNXZZQjJ5WTVXdndUZkZ4bEZQb2cxN2h3a3lEQTVHVTVBbUtP?=
 =?utf-8?B?dUoxWUJ3bEVkcHdJL2dObWlOSDZZTXdza0JiaU9icVlZUS8yRkcxaTFuY3NJ?=
 =?utf-8?B?a3NvaVd3V1JrQitBcC9EQUJtY2QrSXBmTXgvaVpsaW5Dd3dFSUIxRmVHUERr?=
 =?utf-8?B?cXVWaGZybS9sQmFzQURJa3pja2QwR3Q4VHViSmFsS1hNUmJHR2xLY1lqeWM5?=
 =?utf-8?B?UGF6YWNZZUZmRHhRcG9GeFlaRm0vZDVVK1RSUWVVbk4xcEI2Y2RBUG5Uc3Rj?=
 =?utf-8?B?aHRQRGpnZzhVS21CY0tXNWgyM3lSV2NPbWhhWXlUaFpvVncwRVZOVmlFWW5Z?=
 =?utf-8?B?SUdyTVFIaU5DdjgxNWNKYzM3QzkxQkUzZGRTbU1SRVc2blg2d0JWR2NPWldw?=
 =?utf-8?B?TUJlOEJhaE5jZ0Z1SXIxY3NXc2duMFlxYW1XdWtYQmVoQzFPWW96VHMyVWx3?=
 =?utf-8?B?U3R3QmRDWGZQMjRQYXliKzNOVi9Rc3ZydWs0bmRZQmZNcFZvL3RhZi9tUFov?=
 =?utf-8?B?eTlHRTc0MUdqenREM0txVVN1alkydmdjd2tXMVM2UngxRzVCWHJiUERlUTE2?=
 =?utf-8?B?clZmUDdxaEpSWjFvMGVsaElNVjJjKzZjQWdVUnhidzRweThYYUppUS9QYUZN?=
 =?utf-8?B?Um1GaHEyLzI2M1lWWUFzU0Q4dzlXbjA0cUMxRnB6RHUzSEtVek9DWnd6aTQ3?=
 =?utf-8?B?NVBMcXBWMFNRTHJYUnU2cUNaVzVFZm1scms4V0ZuZWo2ZkR5Nko0d1lxSUVx?=
 =?utf-8?B?SGhUVWpjYnAyaHBVK3hFRzh4enVHazdUUGFuajVob0YzSUJ2eGJla3NGNlJH?=
 =?utf-8?B?UkRTdFhjY05neVJ4SlNNbG0rQWJ6V1orOXF6dEdqWWlIVTVUcWJEczlMbWs4?=
 =?utf-8?B?WTZxRHMwYkNTaGg1bDRhKytRSEk2V3hFejkvYUZCT1FaVFowK0xVZWhXUEMw?=
 =?utf-8?B?WFJsRVI0OHZpRENEdzVCWDNpaVplWVlteUcxU2NCVHFmYWdkZGpGMGJjbFNn?=
 =?utf-8?B?N0VucmIvSTd4WXRrOFQ1MFRya0lMc0RoTDNZRGhKK2RCZ3REUUJaMDRqNHQz?=
 =?utf-8?B?T3FOaHl1NlZLamhFbnJPZzVGYm9xY2hBaHdZamNxTzNLU04rZGZNMS9wVTJz?=
 =?utf-8?Q?yjq0785wWuCSHH3cQeQPWYq5bQEWmBP6vOVOk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MklrRFpPQkFaRXlFU2Jma1ZpNlczWnNSQXdaS0d1SnRHOS9yWWNaK3dHK0ZQ?=
 =?utf-8?B?cVMyb1d0NnRId0Z5c2hneDlXZ1NxbS9KdkpkSFA1Q3hkMkgwR1Jhb3k1R2ow?=
 =?utf-8?B?WkhISTNlNk0yN0M2RDEvQ3l2ZjZ6WS85WWxlNVpaRHgwbHZuQjE3Tkg1bHRp?=
 =?utf-8?B?SEJmYThUNGVtWGpDbFR6Y3VYUjF2MXBvZWZlRmc5ckxzSWFpMGRQTG1qZkRM?=
 =?utf-8?B?bFRkSWsvanFlUFZUUXFUQjlyQzRLRHdHWkRDYVdCb3NMRWtqZ045RjBNTXZm?=
 =?utf-8?B?U20wR2F5TkRSRy9YaXRBS2VmMXJ6V2libURCS1pSbVhXdmF4T3FIZ0NWbkoy?=
 =?utf-8?B?aVBpamhjd2NUSEdNdm9UeXhNa2l5WTgvOXdtYk1VMVFhRmE4SENNekN1MXI3?=
 =?utf-8?B?WloycmhTcmlpRXl1bGpySDZhOXhLS3B5Y3lZUWdmRFpPWE9nQ3ZHMzF4S1dD?=
 =?utf-8?B?alJvUjJ5VHVZcWNodW9DajY4MHJXVDVWOFNCNGVJa2htdHN2R1hyeGNWSHVm?=
 =?utf-8?B?dXUxN21GdWJla1R2VUZDam1sMEV5VDZ2T0ZVSkRBdWhQOWtyT1RyNGpseWhS?=
 =?utf-8?B?Vk02cFlxWGpBanFNOFQ0c3U2VmE2WDNuaHlOUUYyck9UY0ZJUnFBTWxqTVNm?=
 =?utf-8?B?WFRmQlEvRndFOE5FNGdzZFdrelMvdXBhQWoya0c3UkdnVm1rUmUybXgyMHkz?=
 =?utf-8?B?UDgzMGFqQzgyMmxpV1FhQy8rcmp2M21ETDFHdFRybnZWSEJVc3ZUb25hK3cx?=
 =?utf-8?B?aDkvd2o0MmxFK1BHMFhHRS9Qelp6RnJTTUZxUkVXcXR4M0hZODhWT3EzM1BC?=
 =?utf-8?B?aU94aUN6RFUrQXBZdURJQ05pSnk1Q3F6T2F2R3VNSlhqUmp4VGt0ZjE2Q1ZN?=
 =?utf-8?B?YXRqLzhJU0RSUDd6UDVrZDhBdmdBaDZnWEVZNVhTS0svN3UzMEczYXc3VkpP?=
 =?utf-8?B?YnEwWmw4TThtR0ZsbDBKY0lIVXJFa3VWbjVMR2FKT2F5MjB0YldMWFVCQ2gv?=
 =?utf-8?B?YXV2enA0RlRPT3BrelhlTnFOTVRzWHpxTEJ5bHlKQW14cUpvRk9uUjl2MWYz?=
 =?utf-8?B?aStMb2tITlFXMFI0bUxiY1E4b3N0Q2k1dU11RkJOVFBlNmF5dlJjZktWOFJD?=
 =?utf-8?B?ZXBmMDZsZDhsY0NXT2p2cUdBNG43RTI0T05xbkw0NGNKdFZONlpnR1hWc1VL?=
 =?utf-8?B?UUgvMDZQOEJwWlMvam9iUWsxUkkvU1pudndOUmc2L29jRU8xMFRMZXFQV2k3?=
 =?utf-8?B?MXQyc1NMWm80Rm9NMUE1NWR3WUVFdWRwZVZJbUxFRlpiRmVQYTlRQ2xqWW01?=
 =?utf-8?B?RjJmZVZmVmNxM1FENzlLVm9yQStyYmwyNzd3UGFqbEJ6ekEramliRWFMVWRj?=
 =?utf-8?B?MHRzekhOQW8wNldRSEpidFdVZDNsMEcwL3NuN3FiZ1RNaUdaU29pRVdiTEJ6?=
 =?utf-8?B?YTdqQzVic3ZYY2YrbEJicFV4ZWdKamt2OWZrTGhkYjZpa3ZSK1lXeDAycWJq?=
 =?utf-8?B?bjIySGJDWTBFUnQyVHVERlNkRU5HcTJtemxzd1RaZWNFSDJnSXVzQnZqaWJZ?=
 =?utf-8?B?NkFHci9sekt1M1hocjBRYzU4UmhHdVY2VWQ1eGpIZmt3SjR5YWpwSDYwZG43?=
 =?utf-8?B?b2lpS2EvWWNQc2YvWGszRE15QW1BTWxlVmFkQ2lrQmhPZzh3N1NKS09DY01Y?=
 =?utf-8?B?VXlkSFlzaVpOdG1CT1VEMXIzUlUxRUZ0ck5UbVhQRWlRSytHbHFPMUZsQ0xp?=
 =?utf-8?B?b29XMHp1ZENSSWRITTZhckxvbmNXLzRaM3ZtVWMzZ2lqWkFrSkVqbldpbjFi?=
 =?utf-8?B?VHpGTFVtU1J6TmtVL2U5VTFhWS8vQ0VyTXpFdm9Ec0tCVjhYU2FGWFE5YTBn?=
 =?utf-8?B?YW03WVJJMmtmN0hOV0tPNk1RQytaWllIa0JHTi9aaDkyVEtQMjQ3RXdFR2ZC?=
 =?utf-8?B?TURVY1lkV0FlakRBTnhnTlJaNUY3Y0hHUWt5MXFpSSsrYkYzRUNMNUpWZktC?=
 =?utf-8?B?c0pYcnM4NUhFanh4dDYyZEptdjZsL0xoYlRyUFZnSlB0ZjRsODY3bTQ5MnVv?=
 =?utf-8?B?QmdBbVVxMkQyQSt5MGlzQ2hwNDM3V3lwSUZJbjArZ3RaS0RpeXRmSTJZVnhF?=
 =?utf-8?B?TmFwaXVjNHhXY3dGcEpxV043dUthVlhuRnd4ZGRFZTlzS2VrZHBkWlRTSkxi?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_33c0eed9de0896a133ddf9f71ec96543e8c64329camelintelcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd30206a-e196-4719-0c5c-08dcf98db6e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 09:23:43.3049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0J+8ZZc2hg2h5KY0K/PmBWG4Kij/YurWvoGgpag3mLc2mRpEtPlE/Xon+olz+ole3Nrshwt6kBtikNVB2xWKtGRT0Z27KtzGH0vfs75TgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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

--_000_33c0eed9de0896a133ddf9f71ec96543e8c64329camelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTEwLTMwIGF0IDE5OjU0ICswNTMwLCBOYWxhZGFsYSwgUmFtYW5haWR1IHdy
b3RlOg0KDQpIaSBKb3VuaSwNCg0KT24gMTAvMzAvMjAyNCAxMjoyOCBQTSwgSm91bmkgSMO2Z2Fu
ZGVyIHdyb3RlOg0KDQoNCkNoZWNraW5nIHNpbmsgUFNSIHN0YXR1cyBzZWVtcyB0byBiZSBjYXVz
aW5nIHByb2JsZW1zIGFzIGl0IGlzIHBlcmZvcm1lZA0KDQpieSByZWFkaW5nIGRjcGQgc3RhdHVz
IHJlZ2lzdGVycyBvdmVyIEFVWCBjaGFubmVsLg0KDQoNCkdlbmVyYWxseSBoYXZpbmcgc3RpbGwg
cG9zc2liaWxpdHkgdG8gY2hlY2sgYWxzbyBzaW5rIHN0YXR1cyBpcyBhIGdvb2QgaWRlYQ0KDQot
PiBkaXNhYmxlIHRoZW0gYnkgZGVmYXVsdCBhbmQgZW5hYmxlZCBpZiBlbnZpcm9ubWVudCB2YXJp
YWJsZQ0KDQpJR1RfUFNSX1NJTktfU1RBVFVTX0NIRUNLUyBpcyBzZXQuDQoNCg0KU2lnbmVkLW9m
Zi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+PG1haWx0bzpq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoNCi0tLQ0KDQogbGliL2lndF9wc3IuYyB8IDE2ICsr
KysrKysrKysrKystLS0NCg0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQoNCmRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9wc3Iu
Yw0KDQppbmRleCAwZWIwMDI2MzMuLjgzYzIxZTZiYSAxMDA2NDQNCg0KLS0tIGEvbGliL2lndF9w
c3IuYw0KDQorKysgYi9saWIvaWd0X3Bzci5jDQoNCkBAIC03OSwxMyArNzksMjEgQEAgYm9vbCBl
YXJseV90cmFuc3BvcnRfY2hlY2soaW50IGRlYnVnZnNfZmQpDQoNCiAgICAgICAgcmV0dXJuIHN0
cnN0cihidWYsICJlbmFibGVkIChFYXJseSBUcmFuc3BvcnQpIik7DQoNCiB9DQoNCg0KDQorc3Rh
dGljIGJvb2wgc2lua19zdGF0dXNfY2hlY2tzKHZvaWQpDQoNCit7DQoNCisgICAgICAgY29uc3Qg
Y2hhciAqZW52Ow0KDQorDQoNCisgICAgICAgZW52ID0gZ2V0ZW52KCJJR1RfUFNSX1NJTktfU1RB
VFVTX0NIRUNLUyIpOw0KDQorDQoNCisgICAgICAgcmV0dXJuIGVudiAmJiBhdG9pKGVudik7DQoN
Cit9DQoNCisNCg0KIHN0YXRpYyBib29sIHBzcl9hY3RpdmVfY2hlY2soaW50IGRlYnVnZnNfZmQs
IGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90ICpvdXRwdXQpDQoNCiB7DQoNCiAgICAg
ICAgY2hhciBkZWJ1Z2ZzX2ZpbGVbMTI4XSA9IHswfTsNCg0KICAgICAgICBjaGFyIGJ1ZltQU1Jf
U1RBVFVTX01BWF9MRU5dOw0KDQogICAgICAgIGRybU1vZGVDb25uZWN0b3IgKmM7DQoNCiAgICAg
ICAgY29uc3QgY2hhciAqc3RhdGU7DQoNCi0gICAgICAgY29uc3QgY2hhciAqZW52Ow0KDQogICAg
ICAgIGJvb2wgYWN0aXZlOw0KDQogICAgICAgIGludCByZXQ7DQoNCg0KDQpAQCAtMTE2LDggKzEy
NCw3IEBAIHN0YXRpYyBib29sIHBzcl9hY3RpdmVfY2hlY2soaW50IGRlYnVnZnNfZmQsIGVudW0g
cHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90ICpvDQoNCg0KDQogICAgICAgIGFjdGl2ZSA9IHN0
cnN0cihidWYsIHN0YXRlKTsNCg0KDQoNCi0gICAgICAgZW52ID0gZ2V0ZW52KCJJR1RfUEFORUxf
UkVQTEFZX0lHTk9SRV9TSU5LX1NUQVRVUyIpOw0KDQotICAgICAgIGlmIChhY3RpdmUgJiYgb3V0
cHV0ICYmICghZW52IHx8ICFhdG9pKGVudikpKSB7DQoNCisgICAgICAgaWYgKGFjdGl2ZSAmJiBv
dXRwdXQgJiYgc2lua19zdGF0dXNfY2hlY2tzKCkpIHsNCg0KICAgICAgICAgICAgICAgIGFjdGl2
ZSA9IHBzcl9hY3RpdmVfc2lua19jaGVjayhkZWJ1Z2ZzX2ZkLCBvdXRwdXQpOw0KDQogICAgICAg
ICAgICAgICAgaWd0X2Fzc2VydF9mKGFjdGl2ZSwgIlBTUiBzaW5rL3NvdXJjZSBzdGF0ZSBtaXNt
YXRjaFxuIik7DQoNCiAgICAgICAgfQ0KDQpAQCAtMzUxLDYgKzM1OCw5IEBAIHZvaWQgcHNyX3Np
bmtfZXJyb3JfY2hlY2soaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291
dHB1dF90ICpvdXRwDQoNCiAgICAgICAgY2hhciBidWZbUFNSX1NUQVRVU19NQVhfTEVOXTsNCg0K
ICAgICAgICBpbnQgcmV0Ow0KDQoNCg0KKyAgICAgICBpZiAoIXNpbmtfc3RhdHVzX2NoZWNrcygp
KQ0KDQorICAgICAgICAgICAgICAgcmV0dXJuOw0KDQorDQoNCiAgICAgICAgc3ByaW50ZihkZWJ1
Z2ZzX2ZpbGUsICIlcy9pOTE1X3Bzcl9zaW5rX3N0YXR1cyIsIG91dHB1dC0+bmFtZSk7DQoNCiAg
ICAgICAgcmV0ID0gaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwgZGVidWdmc19m
aWxlLCBidWYsDQoNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9m
KGJ1ZikpOw0KDQpMR1RNLA0KDQpSZXZpZXdlZC1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxyYW1h
bmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPjxtYWlsdG86cmFtYW5haWR1Lm5hbGFkYWxhQGludGVs
LmNvbT4NCg0KVGhhbmsgeW91IFJhbWFuYWlkdSBmb3IgY2hlY2tpbmcgbXkgcGF0Y2guIFRoaXMg
aXMgbm93IHB1c2hlZCB0byBtYXN0ZXIuDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5kZXINCg0KDQoN
Cg==

--_000_33c0eed9de0896a133ddf9f71ec96543e8c64329camelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2A20FE587E10914E8F3FAB7A606C0A7D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBXZWQs
IDIwMjQtMTAtMzAgYXQgMTk6NTQgKzA1MzAsIE5hbGFkYWxhLCBSYW1hbmFpZHUgd3JvdGU6PC9k
aXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJv
cmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPHA+SGkgSm91
bmksPGJyPg0KPC9wPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAxMC8zMC8yMDI0
IDEyOjI4IFBNLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6PGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4N
CjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOjIwMjQxMDMwMDY1ODI3
LjIzOTI3NDUtMS1qb3VuaS5ob2dhbmRlckBpbnRlbC5jb20iIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8
cHJlPkNoZWNraW5nIHNpbmsgUFNSIHN0YXR1cyBzZWVtcyB0byBiZSBjYXVzaW5nIHByb2JsZW1z
IGFzIGl0IGlzIHBlcmZvcm1lZDwvcHJlPg0KPHByZT5ieSByZWFkaW5nIGRjcGQgc3RhdHVzIHJl
Z2lzdGVycyBvdmVyIEFVWCBjaGFubmVsLjwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPkdl
bmVyYWxseSBoYXZpbmcgc3RpbGwgcG9zc2liaWxpdHkgdG8gY2hlY2sgYWxzbyBzaW5rIHN0YXR1
cyBpcyBhIGdvb2QgaWRlYTwvcHJlPg0KPHByZT4tJmd0OyBkaXNhYmxlIHRoZW0gYnkgZGVmYXVs
dCBhbmQgZW5hYmxlZCBpZiBlbnZpcm9ubWVudCB2YXJpYWJsZTwvcHJlPg0KPHByZT5JR1RfUFNS
X1NJTktfU1RBVFVTX0NIRUNLUyBpcyBzZXQuPC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+
U2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20iPiZsdDtqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20mZ3Q7PC9hPjwvcHJlPg0KPHByZT4tLS08L3ByZT4NCjxwcmU+IGxp
Yi9pZ3RfcHNyLmMgfCAxNiArKysrKysrKysrKysrLS0tPC9wcmU+DQo8cHJlPiAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSk8L3ByZT4NCjxwcmU+PGJyPjwv
cHJlPg0KPHByZT5kaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmM8L3By
ZT4NCjxwcmU+aW5kZXggMGViMDAyNjMzLi44M2MyMWU2YmEgMTAwNjQ0PC9wcmU+DQo8cHJlPi0t
LSBhL2xpYi9pZ3RfcHNyLmM8L3ByZT4NCjxwcmU+KysrIGIvbGliL2lndF9wc3IuYzwvcHJlPg0K
PHByZT5AQCAtNzksMTMgKzc5LDIxIEBAIGJvb2wgZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBk
ZWJ1Z2ZzX2ZkKTwvcHJlPg0KPHByZT4gCXJldHVybiBzdHJzdHIoYnVmLCAmcXVvdDtlbmFibGVk
IChFYXJseSBUcmFuc3BvcnQpJnF1b3Q7KTs8L3ByZT4NCjxwcmU+IH08L3ByZT4NCjxwcmU+IDwv
cHJlPg0KPHByZT4rc3RhdGljIGJvb2wgc2lua19zdGF0dXNfY2hlY2tzKHZvaWQpPC9wcmU+DQo8
cHJlPit7PC9wcmU+DQo8cHJlPisJY29uc3QgY2hhciAqZW52OzwvcHJlPg0KPHByZT4rPC9wcmU+
DQo8cHJlPisJZW52ID0gZ2V0ZW52KCZxdW90O0lHVF9QU1JfU0lOS19TVEFUVVNfQ0hFQ0tTJnF1
b3Q7KTs8L3ByZT4NCjxwcmU+KzwvcHJlPg0KPHByZT4rCXJldHVybiBlbnYgJmFtcDsmYW1wOyBh
dG9pKGVudik7PC9wcmU+DQo8cHJlPit9PC9wcmU+DQo8cHJlPis8L3ByZT4NCjxwcmU+IHN0YXRp
YyBib29sIHBzcl9hY3RpdmVfY2hlY2soaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9k
ZSwgaWd0X291dHB1dF90ICpvdXRwdXQpPC9wcmU+DQo8cHJlPiB7PC9wcmU+DQo8cHJlPiAJY2hh
ciBkZWJ1Z2ZzX2ZpbGVbMTI4XSA9IHswfTs8L3ByZT4NCjxwcmU+IAljaGFyIGJ1ZltQU1JfU1RB
VFVTX01BWF9MRU5dOzwvcHJlPg0KPHByZT4gCWRybU1vZGVDb25uZWN0b3IgKmM7PC9wcmU+DQo8
cHJlPiAJY29uc3QgY2hhciAqc3RhdGU7PC9wcmU+DQo8cHJlPi0JY29uc3QgY2hhciAqZW52Ozwv
cHJlPg0KPHByZT4gCWJvb2wgYWN0aXZlOzwvcHJlPg0KPHByZT4gCWludCByZXQ7PC9wcmU+DQo8
cHJlPiA8L3ByZT4NCjxwcmU+QEAgLTExNiw4ICsxMjQsNyBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0
aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRf
dCAqbzwvcHJlPg0KPHByZT4gPC9wcmU+DQo8cHJlPiAJYWN0aXZlID0gc3Ryc3RyKGJ1Ziwgc3Rh
dGUpOzwvcHJlPg0KPHByZT4gPC9wcmU+DQo8cHJlPi0JZW52ID0gZ2V0ZW52KCZxdW90O0lHVF9Q
QU5FTF9SRVBMQVlfSUdOT1JFX1NJTktfU1RBVFVTJnF1b3Q7KTs8L3ByZT4NCjxwcmU+LQlpZiAo
YWN0aXZlICZhbXA7JmFtcDsgb3V0cHV0ICZhbXA7JmFtcDsgKCFlbnYgfHwgIWF0b2koZW52KSkp
IHs8L3ByZT4NCjxwcmU+KwlpZiAoYWN0aXZlICZhbXA7JmFtcDsgb3V0cHV0ICZhbXA7JmFtcDsg
c2lua19zdGF0dXNfY2hlY2tzKCkpIHs8L3ByZT4NCjxwcmU+IAkJYWN0aXZlID0gcHNyX2FjdGl2
ZV9zaW5rX2NoZWNrKGRlYnVnZnNfZmQsIG91dHB1dCk7PC9wcmU+DQo8cHJlPiAJCWlndF9hc3Nl
cnRfZihhY3RpdmUsICZxdW90O1BTUiBzaW5rL3NvdXJjZSBzdGF0ZSBtaXNtYXRjaFxuJnF1b3Q7
KTs8L3ByZT4NCjxwcmU+IAl9PC9wcmU+DQo8cHJlPkBAIC0zNTEsNiArMzU4LDkgQEAgdm9pZCBw
c3Jfc2lua19lcnJvcl9jaGVjayhpbnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9kZSBtb2RlLCBp
Z3Rfb3V0cHV0X3QgKm91dHA8L3ByZT4NCjxwcmU+IAljaGFyIGJ1ZltQU1JfU1RBVFVTX01BWF9M
RU5dOzwvcHJlPg0KPHByZT4gCWludCByZXQ7PC9wcmU+DQo8cHJlPiA8L3ByZT4NCjxwcmU+Kwlp
ZiAoIXNpbmtfc3RhdHVzX2NoZWNrcygpKTwvcHJlPg0KPHByZT4rCQlyZXR1cm47PC9wcmU+DQo8
cHJlPis8L3ByZT4NCjxwcmU+IAlzcHJpbnRmKGRlYnVnZnNfZmlsZSwgJnF1b3Q7JXMvaTkxNV9w
c3Jfc2lua19zdGF0dXMmcXVvdDssIG91dHB1dC0mZ3Q7bmFtZSk7PC9wcmU+DQo8cHJlPiAJcmV0
ID0gaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwgZGVidWdmc19maWxlLCBidWYs
PC9wcmU+DQo8cHJlPiAJCQkJICAgICAgc2l6ZW9mKGJ1ZikpOzwvcHJlPg0KPC9ibG9ja3F1b3Rl
Pg0KPHByZT5MR1RNLDwvcHJlPg0KPHByZT48c3BhbiBjbGFzcz0icmV2aWV3ZWQtYnkiIHN0eWxl
PSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+UmV2aWV3ZWQtYnk6IE5hbGFkYWxhIFJhbWFuYWlk
dSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFtYW5haWR1
Lm5hbGFkYWxhQGludGVsLmNvbSI+Jmx0O3JhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20mZ3Q7
PC9hPjwvc3Bhbj48L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
PlRoYW5rIHlvdSBSYW1hbmFpZHUgZm9yIGNoZWNraW5nIG15IHBhdGNoLiBUaGlzIGlzIG5vdyBw
dXNoZWQgdG8gbWFzdGVyLjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+QlIsPC9kaXY+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5Kb3VuaSBIw7ZnYW5kZXI8L2Rpdj4NCjxkaXY+PGJy
Pg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44
ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRp
dj48YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDoyMDI0MTAz
MDA2NTgyNy4yMzkyNzQ1LTEtam91bmkuaG9nYW5kZXJAaW50ZWwuY29tIiBzdHlsZT0ibWFyZ2lu
OjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDox
ZXgiPg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJy
Pg0KPC9kaXY+DQo8ZGl2PjxzcGFuPjwvc3Bhbj48L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_33c0eed9de0896a133ddf9f71ec96543e8c64329camelintelcom_--
