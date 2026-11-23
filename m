Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781A6606A680
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jKhQG2G7;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jdjchS9h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0943C10E78A;
	Mon, 23 Nov 2026 09:59:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75AC10E78A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795427889; x=1826963889;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vg+hvHj5qHlSj67MPBXDostpTwdI8G45uVupK8yr2/M=;
 b=jKhQG2G7H4z3b3ZSKOokjzC6iXhGWIk6FYYcWl7XcLm6uBmFSewyDSnx
 ZtqiVvlwZDLezxx8tV2rnfmmHSmd3B2aLh3Jkchiv+8NvO8Un+3qa10Kc
 M2HXdKtu7y6JGN/K4yoY90o5POMHt4J+IfNlSYF34QsWwVEbu3yrviEjr
 zsqeYJ+38TAzxYmA1rrxeL+DD227gHU9YPyudZzA7eXylSRVDjk4nWOMZ
 2CdZgs+xbz+tyctvxD9dA2+JGHErYv03cB1SFfQCiu/QtmANT33iqE5Gs
 bGEm9BZCYpyjymVXBbc1W4QxXOwkkv9RkUiwGRABrzP/OlG9XVMvgoSZ/ w==;
X-CSE-ConnectionGUID: ViSfGcU9TOydgPpIDGr4+g==
X-CSE-MsgGUID: SQv2ajvASyOG64IvCzEb1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4280025"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4280025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:58:01 -0800
X-CSE-ConnectionGUID: 2MnjCXj2SXmEcjDeeIRJBA==
X-CSE-MsgGUID: RX9jCQFMR8OzN/DOfO5IcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11409223"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:57:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:57:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:57:59 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:57:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOSo8Yk3jdJbCKDvS83sVGL1CACU1wq9cABTVbII+IWpzQWGXxnz7TzNPNTodvtZYs/S7Z2M0AJMlU/UHT0TXt0J0avX8G9V5ndVZa0GSr2zx+vDjau5qVMeQcRh9/BuLx8jI5tVaxrupwIzdzEkvCBP8NoYMPQY2zp0gLAX31eZDjxf2v88IJp1r+6hwZe0KPvUvlC2iBLpqjApi6qIYd7CJCjM2kp9WS9FPmSeCeXs4mDnegbMZBiYtW0zHNeseHfmEKCMZf8zOYb1fr3T1GntZJT8EoynMOytPmMrIe3ppcrwR8TWaXczDs7UFaYVzmLvOFvX+75yzxVQ7QWiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4vJaZKnUfdA/x5Hb5UkKzx9XRWaGbR7tcMBkiWwjtw=;
 b=T/6nbjbj955sIAokVzpfeWaW89BVg+sYVdUsjS9W3cfk5E9V3LoGCId0BQ2dfbVDEoOLr5my8Qhmako818DPuI/EoLaumMHy7TjZyNLrGBD5iFMr1pQSnrXb5IeftSV6T3tXSD8rsLwRZvaGTGDMt+qkk8d+zdpUM8KbWXwTbGkKbbfu1hnmxzp6sLDLOuvnlAjorQbkoJ46Q1qYRnWfJrgdyRJH7n0I+6nJpOYFcGjDyiRG3f5kGcj32IvW7M+N5zmZxEtyYjKXbvPqs2AE+Of1yaqm6bTn1U73CR3Wzcysl5QkuZ7WiVxG78GI7kVZ7uiHLXpom9Nfj7DQDhFXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4vJaZKnUfdA/x5Hb5UkKzx9XRWaGbR7tcMBkiWwjtw=;
 b=jdjchS9h26syKr0cdMTytMhrIPSSDfDFUXYQCLMVPBjJxrcMidD+Z+bvBSXM+JiIKruz9oJgKJcVHua8HvzvBqKmxIfDvsMMQSjmX9e5auvIwEgS2HJZdpPEQPR+SaO9nFMU7Th4U1SAl/zmgRmYE9lJn0p3FiRMDiAV8fbTWNE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by DS6PR11MB610166.namprd11.prod.outlook.com
 (2603:10b6:8:469::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 09:57:57 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 09:57:57 +0000
Date: Mon, 23 Nov 2026 09:57:42 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Shivtej Eknath Patil
 <shivtej.eknath.patil@intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] tests/core_sysfs: Fix logic for EIO and
 other fixes
Message-ID: <lnjmgxtgorrxu43y3o3gykxd4o54bjhfpqylue7dijx74nxx6e@blqyh6qszpor>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120182614.34410-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DU2PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:10:234::17) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|DS6PR11MB610166:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8b46cc-85cd-48c3-d02f-08df49484042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003|261026140227099003|261022075727099003|261028144727099003|261022105027099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: cLxCn9MIEzoXnla3RjAGwy2Q1oYvdcGtmWJ1dpjE3gnWeomMJTHzmqJUirU3446ejsEIFklFWXRgPrkbksuQDff41Vx34T+oABhMp3HP1j6M+yRE17husrFsdkM3hBMMzH6K2qd31xjFhCewVzP6l9YWDlJIt3z2aUA+HfR6wfi95VSCfhYmxx9W17dNengEws0bRNTsZl9QLq5S1eYl+XF0Drofb0QffkARpIEORVBpgUuHKc4iYjk+WagdoMAQuaUJPFerntSvZs5H1lLBoUZDZn1ZFF5zRWJaax9jeaCvKcjSxD+rYFoqrIqN0UtiByG3d0IrZ1+lmaZrZF1GpgvHQgC6MIvuRrR9fy2wHsVezGoYMKl1pwGkXF0ioT9dlmqt+u0jPZgOmYT4aYwaVUZLYeP9XM8B1AoU/py8fRI1v/IMHEpDnH1TiW3ObP+KlS9FS5yE1b8db9J5EAXlDFGaBYQcpHAu3VNsIU61hb79LzYPgUhccgsTFAYVvyqIZDwM4A92QaKyZDuhkEWO8mYHxR0x1PtoTZhfpgVBd5gMAQJeRPxDCbCxKK2ddaN5U0kFet9vb9XPGAcw+APZNHWYoAmkpHJLpyDJ0p9iNLTZweBWxzOqR8vkYKuKp/6fN/ep2U8R3F/PkfhrmPbsQVuhxeXOSk53ow6Qvs1QP+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261022075727099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFHTG5JTWRqQXp0K1BQamM0Nmo1ZTJ2b3ZMZUJZVVk5WEttQ2Znd1prdGtj?=
 =?utf-8?B?Z1o4NVpoM2ZDdGNtVlk1YS9vdUxZK3Z2RWU0R2lJcUNOWXRwUGdwSHhjc2s1?=
 =?utf-8?B?bGFhUTQwMUh1T21CbFdsSmI3WTBsVlpaQ2hBc0ZpVGpwTHFTLytNbCt1aHQw?=
 =?utf-8?B?Z2t6d0hjeHcxNTJIVHdFcGNuRjVuM2N0UVJnQmlmS0l5NmJQNDJKNjZPQUtJ?=
 =?utf-8?B?K01ycUVMTWZEaDRxVUlKNG5pSHpMbEpBdVJ0d1FDM2dBREswYjd5dFJLYVhT?=
 =?utf-8?B?bjQzeXhscWhWaGJSUklkQ0ZRemlySDc0YzR3bGRNNlRPRHV4czAwNWpZKzdn?=
 =?utf-8?B?M20yZDVMZDRkZHlJMnBhdjgrSWY5TjlOUTR3NlMxM3NwNHpsWTc2Z0ljS3pB?=
 =?utf-8?B?N21VSjJnMmVuejRUK2ZTTWltQktyVFlrMGJ2TmVIdHRYVTZla3N4TlUyU0R0?=
 =?utf-8?B?NWtQazFMRW9vWm1telhVaDRpaTlsWVhVY2w5MnVGdDVzdTV1RUM5Z0ZucXE3?=
 =?utf-8?B?T1JYUkJkYXZ0Y3puZWxuSnNTbjNOejJwWlA1QTFNeGx6QnFoL2NQOWp1YitF?=
 =?utf-8?B?WGxNZ1E5YWppZ1JRc1RBV1I2aXIzb2sxODUyWnFiNG8zYVp3OVAzMUFXeEJP?=
 =?utf-8?B?OGtwZnp1Z0w1UWVBekhic0thYjhjUmtta09xSmRudUYxbWNZTkwzTG9BcWk5?=
 =?utf-8?B?Y3pPVHJrcUh4ZmdaamlxbS9YYlplQ3B6RW5vYlkwaEthVmVmd0U5Z3NxZlZI?=
 =?utf-8?B?L1RDckRsUHF2MkkxN2RDN2piTEFWTkliaDl4RVRLbmpGUTdOV0FJRDVHSHNl?=
 =?utf-8?B?Qkwxd2dyWlRURW1VaHJRY2pNV1lPSWRwZWJ1SkQxT3NEdHNiaDdpQzBiSTIz?=
 =?utf-8?B?azJXdys0aXhtbHgyQXlYR09NMlJGZ0VnbHBYRkRuRVdkUUx5VnkySGlwbTF5?=
 =?utf-8?B?RVBGZE40QWVlK0tCaWttT0VidEdjSStnM0NLU1p2WHhsS3VXYXdPQnc2R0xC?=
 =?utf-8?B?RzhXN0Z2bWF4YXZ0bGx1dHJYTStTMGU5MVdiOFlxQ1A2OW51N3ZhdEpxQ0w0?=
 =?utf-8?B?UTVyNWd6VjlpQ3llTGIzSjhPcG5SNDNDekJ4OFhtMkcxRExpWjhla3RaZDg2?=
 =?utf-8?B?RGZIYlE3YURZQlliRE1iRFkxTlJ5Mng0emdGVENNalRDbWhLeGJtRFA2U3RI?=
 =?utf-8?B?KzBTM2lnQTRzU1BaL3ZJQ2RpTExsMUlCdWpmTCtXc05DeitrSC9rS1N5YWNP?=
 =?utf-8?B?dUNuc3YyNW1OeTlaZ1BCS1dBb3ErbnFGUEJhN0NPMW53ZlB0L3hPV0lWWEhp?=
 =?utf-8?B?QTY0anNaUktCTlhBSU13eUhwenhHVnA2Ry9ZMFJXZm51ajRuRjM3WDJhRG5V?=
 =?utf-8?B?ZzNnSXB6V2Q0YTk1OWFCREF3R2psdDd3WjE4NitSeFUwNWxSQUdRV1haaGNW?=
 =?utf-8?B?eHk2MHRJVHNLLzhzcXU2aXBBKzZ5Rk5lWjZnMllEbFlHVHNjQTNpUmZzN2w2?=
 =?utf-8?B?dk84V2EwSGxTQjBWRDRTTUtmakFaMStKbUU1dUluM2lacVd5d3ZqU05RL3Vm?=
 =?utf-8?B?NjVEbWRVOWxIYnVVUG1lRHl5bUxqcUF3YUF4cnZFM0d5MFhTblFRNjhBNXIx?=
 =?utf-8?B?N3cxSkFjWUJpaDQyOGpQekdpV00yVXdvSUI3TlZDa3JFeGdwY05Gbkdmemhz?=
 =?utf-8?B?U1lGMGVncjJ2NkpRVnBiS0IyTGtha0ZScHI5c09EUkx0cnUwYVpXQ0pHelNq?=
 =?utf-8?B?QnR2Ny9WekNCaC9JTlVjWGJKdFpkVlJPUHNEZW9DWXlKS0hLaklNYjA5OWE5?=
 =?utf-8?B?TmhySjFXSllsSzBMY1l0RU5DMjQ5M1VMUG5FdlBpVnpBL28raHFmalEwQXVl?=
 =?utf-8?B?bUhXZEE4VkRwbE9kVU4rbllsV2l3dFplMGpkTXlhWG1SRVZBWVBROGUyZjcz?=
 =?utf-8?B?NXdoRWwvS3RXN2RmRmYwRTZENHFLM3l1MDc4UEdsMTV0NVA3Umx0TGxVRC82?=
 =?utf-8?B?U1pZdmV2d1F5MlI0Z1ByamRJZy9BY2hjYldMOVlYSXl6dHI5NmZhL05pYk5x?=
 =?utf-8?B?S0JJUFlMUm5QR1pWcEFEU0RHc0FGemhjK2lUUXBMbWNyMWk0VEJNT0FVM1Nz?=
 =?utf-8?B?MldhNkdwUmtWT2ZFVFBCcEwyQksxbmdSNmFwR3E1SEw5R1hKRGFDaEhmUlgv?=
 =?utf-8?B?cmxwT2JtOEMvdXZXWTlueEpoeHlvUEJJd0hWNmNKeUFVb043ek5EODhGSnMr?=
 =?utf-8?B?VS9lY1N6QWUrRkZnTDdtRS9pVzVVb0R2ZUQwOUFLcjQ0NHBiS3AydnNlaWo0?=
 =?utf-8?B?L2x1NEpqOE1mTUhtNkc2SkpQVERQM2xIbUZUNmpoMUNVTG84eVFhMFN2cGJ3?=
 =?utf-8?Q?8uyNh2CfZQsaNfr8=3D?=
X-Exchange-RoutingPolicyChecked: YBcKMsvxYtjHMri7TLZRKTBYIYUNvdafa578uWYhTnLEmrqvID7V+McKTMUAQRkwmqKYqEm5tXfEryDyH0/0RBZ5VU/MBKXQ2rizDZ2/r9V8XAA799LefiLGBBGOKkLLM/NeaJqB/MyJQx/HiWl4dFEpbLRep9AIDNFFfd6A71R99xd1wA18ZMJ8m2a/hRqa/Ppv54Zwcx3KMdH2tCBFpZIKkGhdkQpxg8ZhZ45HpT+5zlie1M1XrAaS5ar1Ctjq/2gCiUaWMrJ9opyZT0s6oYjuHJwp8iuJRyQbwMMVjG9UTdoBnyR1GLQAoReC4o3GRKiNENlE5imz6l+LrzJ3eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8b46cc-85cd-48c3-d02f-08df49484042
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:57:57.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THY+rO9Hmc8nr3SkKCHfTO00+CDw/mnQJ7iE9RGX+27lAKC9rvqAUt9SYqQ9ZC+rZxq5pQv/DBl0UoKTlrJb8qCUp21HghHhFeuaBfGRbJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB610166
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kamil,

On 2026-11-20 at 19:26:12 +0100, Kamil Konieczny wrote:
> Fix check for 'power' string in case of EIO and fix fd leaked in
> that code path.
> 
> Check for non-regular file makes redundand check for directory at
> open, so remove it.
The only improvement I can think of here is to put this
paragraph first, so the order matches the changes below for a
tiny boost to readability.

Apart from that, looks clean:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> 
> Check also return values from functions and fail early.
> 
> Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index fdb4e325c..99117eea3 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -65,12 +65,6 @@ static int read_sysfs(const char *filename, void *data)
>  
>  	fd = open(filename, O_RDONLY);
>  	if (fd < 0) {
> -		if (errno == EISDIR) {
> -			igt_info("dir %s\n", filename);
> -			not_readed_count++;
> -			return 0; /* dir or link */
> -		}
> -
>  		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
>  		open_fails++;
>  
> @@ -79,15 +73,15 @@ static int read_sysfs(const char *filename, void *data)
>  
>  	bytes_read = read(fd, buf, sizeof(buf) - 1);
>  	if (bytes_read < 0) {
> -		if (errno == EIO && !strstr("/power/", filename)) {
> +		if (errno == EIO && strstr(filename, "/power/")) {
>  			igt_info("power management EIO %s\n", filename);
>  			not_readed_count++;
> -			return 0; /* dir or link */
> +		} else {
> +			igt_info("Read fails errno=%d %s\n", errno, filename);
> +			read_fails++;
>  		}
>  
> -		igt_info("Read fails errno=%d %s\n", errno, filename);
>  		close(fd);
> -		read_fails++;
>  
>  		return 0;
>  	}
> @@ -108,13 +102,15 @@ static int process_sysfs(int dirfd)
>  	igt_dir_t *config;
>  	int ret;
>  
> -	igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
> +	ret = igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
> +	igt_assert_f(ret >= 0, "Cannot get path\n");
>  	igt_info("Reading sysfs files from %s\n", syspath);
>  
>  	config = igt_dir_create(dirfd);
>  	igt_assert_f(config, "Cannot create dir config\n");
>  
> -	igt_dir_scan_dirfd(config, -1);
> +	ret = igt_dir_scan_dirfd(config, -1);
> +	igt_assert_f(ret >= 0, "Cannot scan dir\n");
>  
>  	ret = igt_dir_process_files(config, read_sysfs,
>  				    from_user_pointer(strlen(syspath)));
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
