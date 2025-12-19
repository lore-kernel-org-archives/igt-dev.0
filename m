Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5208D78763
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4710E486;
	Fri, 19 Dec 2025 12:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ey44dhep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3463A10E486
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766148594; x=1797684594;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=LEwBFIMarzvNjIXNaJmFxaLs5ZQv7C1WI3km/KJTdss=;
 b=ey44dhepT1a7f0IJlt9yaRtaZxiwY/gEDMZ6XQ+j1diK3f24WP7QWiFL
 K340+BTN70v0wXgt7O9z63FWPaeknJEgpMXNMv+0QEqR1+sBgtFmD8bLT
 7XuZ0fj/FXTN2j9fIBTk2zjO7cjS15TcESK1gCvkSoUcKEePpJrKGqeQw
 g7v62zQJa9ltc3Q04bUqkO5hKM1t5hEPj5DgrhL67Su9TmNz9ibxa/08+
 8/o2+Io7LOoigFvszcWChgTvMtsJb4vGFxRuueDeStSljZxX+r5YtvJKB
 MBuaK86OtOaz7xskwD/2vn2BFQNy0CjwY6ltxw2diEhi97H7p6IyxoJXA A==;
X-CSE-ConnectionGUID: nmRA4AJQSPWTsMdmZSOHQw==
X-CSE-MsgGUID: yqzGVmgsQIG2/5yiNhMiOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71968263"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71968263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:49:54 -0800
X-CSE-ConnectionGUID: 1wyiB57rR6ei43WjcUsk9A==
X-CSE-MsgGUID: to+Q3TBiTnS/YlADNIciyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203945182"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:49:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 04:49:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 04:49:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 04:49:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mun3/JRbrzWpjM3j5rDl0LPclZZ5ROyeCYqyW60mFc0g6wjzwwM7rrmlz6odDNfsrCOnSQWGQ56dzTYvC9eSAsC+cLKFEP6uYMCNurAym8BILTZzLpmT8+N8EtnpY4yEqjdicPj/KGChKIuV/hAK6P2T5cqFj9/Z4pNJfacb8t/ZpRcCg5npVa3PehmadlwPlFONpMEl4zYT60DOcl5vQqV9A/k2DdtU+rMn5cgBCWgdvnHBxVJMeQBrPgm/+k5QF2/7ZV+PrzEsBAPieOut7b+/5ivDeb4YhF6vYfbffQYtM9Ik0BRI1AeahFDSjteZtyvVoSAMLqEXLoGZjimiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjmXB9uMYC0kALfWDISXM8DWJE8tcBEM6ieLkytgAXg=;
 b=xq5NL6+ZXRC0Q41iICoh3VWXA/t6KXj9ARnfK4QQoI6ChGlgbQVP5PJcVjtYwS0p2Y+qnLMxiyozui/rkwoCMl8LEQzSYT+D9afTj78B0RrGaAUIddTJC2y/SpyOOO6amevLjVHv63YssnG+PE/tmZb0aDgbt1HmnvBDFSqC4g5uoNNKsY9lMjHm5spk/Jzz4UkRS7V+MYDVgxr7h+B9ZoNQTfw05S/uFA4lRKaI9v7hwts+4z142ZG0fLuJVZqtUKmOoDLVVIyTWSq5BJD1/vJqjLWL8qtNkcuHA5Bm0KStqaxsOf06eO5XwQm0qzL2bPXvtOlDprxORcLsEXabOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:49:50 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9412.005; Fri, 19 Dec 2025
 12:49:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 19 Dec 2025 13:49:57 +0100
Message-ID: <DF27FCZIC1Q2.3G2DE3SN10OUW@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>, <karthik.b.s@intel.com>,
 <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_chamelium: Add
 igt_chamelium_get_port() helper and connector_test() macro
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <20251215150717.1190726-1-mohammed.bilal@intel.com>
 <20251215150717.1190726-2-mohammed.bilal@intel.com>
In-Reply-To: <20251215150717.1190726-2-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: bd18f20e-a55b-4b00-3f70-08de3efd18e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3lNckcvWWdMUC9MZXdTRFE0YUMwYTIrZ1dNNFdPUWJzQjZGUTVZa0hYb3Vs?=
 =?utf-8?B?RXpjTnNIb1Bub0U5NzZHUkhVckQ4WjkyOG1OODB2eWJLWWYrK3RXTWlHd0ww?=
 =?utf-8?B?SmNPeWo0Vk9Cc3lNeVpBREJyZGVjdFh3V3pSVXVaWnVUNm81OVBmc2dORXNS?=
 =?utf-8?B?WldNM3h6RzZ4T2M2Yi9sQ0xUdHB2VHJyTVFMeXZPb1N2MHJobm1XQkxOT050?=
 =?utf-8?B?b0RXbGlyT01DVVF6ZjB2cEl1b25oOUh0L1MwVVJSbDVWdzVNQ3Y5Zm5IaTA2?=
 =?utf-8?B?R0hnOXY4dHk0QWhna1NxTllNRFhKcG45SFQ2WjdTcm1DMXhGaWR3eTdrUlFz?=
 =?utf-8?B?QnpiaWJNdml2azhYdkx5MkcrbzA5ZEFHTjFvWlI1K2dleFZOYXRkK1dveVRs?=
 =?utf-8?B?eHFHNnE5RnFsYXR4d2RzM09RS2ZtbDZoc1B2cFJkUGhXSGxqQzhRWG5KZThJ?=
 =?utf-8?B?cXAwR3FFWWtUbmUrcFRTMGZVRVFCak1vUThpVC8xT2dxM3hWZHF3T2FkeVZ6?=
 =?utf-8?B?SFhKZUdsMnE1QmZ3RGs1Rk1aRHlacXU2YVVUWVFHNURWeGl1NWJiWmlxODJ5?=
 =?utf-8?B?YUN1TVRSWEVFK3h3ODFuSU1rNFpVbllJK1ExamRMajdVd0RqS2IzMVlreDhz?=
 =?utf-8?B?Y1J5S2ttUzlJZitZdUhYNldnY1ZMU3NvTnp1QUU0U0FhQzhIU2tkRldXYzdr?=
 =?utf-8?B?eWx4WFo5NFh3YVhaaitEZ3hZOTFkeEl3YnRobUhBRVMrV3hHUXFGTCs1REJv?=
 =?utf-8?B?YnJKMFUvUzd4VWUzUlpaWHkwMGhBSlhFWWR4MHN5VWczN2NZRG5wUXp3ZUty?=
 =?utf-8?B?d0U1Z1pnN3hrMitMV01VbUN1Q3dhcnJTdzRmSlYzUkNVdGRqc2ZTTzVMNjdE?=
 =?utf-8?B?VXhRYlVJVkpVYk9wcnN4LytGU1Nlc2NpV01FWVpiQk9LQ09lZmx5THRsa09M?=
 =?utf-8?B?aVFNR2U2V1RGTC9ZRVdIcStrWFI0bHdCb2lhRFV4djRVR1gxd25tbkxKc1Ar?=
 =?utf-8?B?anNzNXNxY29jbUxVa2huUVpsUFlNWlc1NmhXeDljNmlmSXBabTRBTy8zV3BX?=
 =?utf-8?B?eXJDWmdEOEg2UXVhUDRuMm80cytrZnV3NFVGSnFQRE5QbVRSeFZrMHNueWJJ?=
 =?utf-8?B?ZWlHRTVlWlJheCtpOWtPZ2RhN0RJRld2WlNOTVEyeFJ5c1dJdDdPRnhYa1Ru?=
 =?utf-8?B?V0EwcjIyUXN1bjhNL3F0eVBsVUlxUWpTaEVycGpidVYwaDhJYlhhQTFna05j?=
 =?utf-8?B?NWk1aldidlIrQ3g5N3FxV3ZiNlV6QkJRZkphODFubWRWYlZPeFlTVkk5a2V2?=
 =?utf-8?B?czA1YzJUUUJaZmUyeHNleFNIME1rMVNxSHNvcVNtc3ZzQWpKMHhpYW9zMUpF?=
 =?utf-8?B?MVBIN0lXeW82YjQzM2ZNVU9WSTFJc3NRSS9vZElBYW1HREJtcDdCdWJNWDZ4?=
 =?utf-8?B?TFhDbzhOU21uN3VWNmFqa0Fnc3pRdmQwR0pmNnhGR08rNEoyQjBZc1VhMTc0?=
 =?utf-8?B?ek1DY1gvdzZQd0duVE9DT1B2UzgyV3dEWEJYQUEzcGUvaGNEdXkrei80dmdG?=
 =?utf-8?B?WmoyaE8yUWJLc3JHVjMvRk1aaWNiRXBuOHluQ2pNdzdOWGVrUjh2aFVVcnFU?=
 =?utf-8?B?bHljaXI4bGorZm02YUxoZjErNWIrN1ZJVjFWTjlJS0N3dUZEelNBWkZvTUdj?=
 =?utf-8?B?OTg5Q0NkRkhUSGxvYUxtYWJhaWtwWmJmWmQ0VEJGV2Q0bThkclBzOFViMHY3?=
 =?utf-8?B?Z0lHR21sR2JPL3ZQcW5JNStlZzBKaDRKRmY4ZVFQREJrT01GSWdYb2JQRFlH?=
 =?utf-8?B?bmhSMXBpMGpLN1V0alA2RE5FMnJkRi9ycmJIanBUcFptWDdLenBvUWx3M0xM?=
 =?utf-8?B?VnNCS3Nvd1lSK0x6VGF4WEZLQlN5S2YzU0c1UHdmalFvWmxFUC9vSUNZcTNN?=
 =?utf-8?Q?l4GFZTfaX35dm15sf1e9FB1rYPgTc11L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGtmU2tueTI2QjVObDc2aElucjh0emFDRFRSMXIvYUY4QXpDR244N2JCRVdP?=
 =?utf-8?B?Z3RPeTB0Yy9CSTNEdUlXVGFORzJZNDhabTNpak94c1Z5SmtXbnZHL3V2OVNj?=
 =?utf-8?B?WldFd3RISXNQS1ZrdlhEWWc3Snl6RFJuSlFvQnZJUUZ4UDBuVkJQTWorbVRM?=
 =?utf-8?B?WUZMUktESVZsTk1RdDB0ejdLL1hST1FocUZMaUFpL1ZJanczSW1uMW5ZU0xL?=
 =?utf-8?B?TGVhT21HdWR2ZVlhVG8xVi9RYWMyVU5uaUdxVzh6cFNvYlQ2MGpNYVYzSlg3?=
 =?utf-8?B?VEJmMTAyYTlZaHkvOTdLWUsyclRVYnRodFZ4NGxvYXRhOXJWaTR4eFExNEpD?=
 =?utf-8?B?YkluR3NXZmFXV21JZEFLbGNRVllCZWdzV3o5bWVOU3R4dENIU3paODh5MTI2?=
 =?utf-8?B?RnRxc3dMcUx2UVNXYzlXTlRMZDlCRUVhL0pQZFRidVJIdkc2U2hNOTVFU3Mw?=
 =?utf-8?B?cW9IM2dqQ1F3UFhzcEZWU0lDeVZEYlN5ZkdGUHhYTGNzWE45eHQwTzlQOHdW?=
 =?utf-8?B?R2lyZ2M2WEVDK1JaTGFCZERVdzVWdnEwanB4eitNcTV3Z21rZkFoZmtOY28z?=
 =?utf-8?B?SFd2Z1lxTjBJUjJqUWZSN01vTVZXNmtzVDZpbHVOd01qaDI4VmpHNUdTZEFq?=
 =?utf-8?B?V3NZRGlDK0wvSjlsZ2pQVVBBSFAvRy9qa0ducklDemRvYU8xYXVwNEVvTTVZ?=
 =?utf-8?B?R0E1YXVrN2hyUWZYMUdId09QMk5tRUNUOHRNS3E2QmMxRTFwVlRoNVJldUNu?=
 =?utf-8?B?TEVYYlB4VXhXY2xpY1BsK050Vmg3c0FINnVnM0JaWnc2UWtxdDBUdnFDSkdk?=
 =?utf-8?B?YU5SNUlkN2s2N1cvbkJlQUYzeXpMdVRnd1B1NzI5WFJHRmZHWnRuaE5DRTFx?=
 =?utf-8?B?Nlc4c254UVRFUUx3YjR2eUQ4QWlWR1l0WVNDYjZRR2U5SWd3VlVIRTM5eTFw?=
 =?utf-8?B?WjBTUGJCQ0JYTGIzaHBCc2paQmdyNTQ1RldQd2RtZVVxMWZ1dk5aTHQ3dFJ0?=
 =?utf-8?B?akN5ZFRjQkd1TUxrbHRib2c2Y1JJVkgxOVY3bXFHbzcrRkVsdHBTbHVEOStS?=
 =?utf-8?B?MG5QMTlvMzI4YVZhdUlKb2VHK0l0LzJyRmwwK0lBL3N0MjVwNGU1ZW1hR29u?=
 =?utf-8?B?N2EydFRDV2FrN0dOeVhBOUxUMGlMUWpYYlJaR0FWVEh2OVhCZ3J4T3NOM2xw?=
 =?utf-8?B?a1dQM0pEZVBoSGt4TG9kdEdCdXZHNGQ0UTF6QzR1UVpjY21JcmlQaEdQemFx?=
 =?utf-8?B?T2gvaFZHU0FNV2RtSVluUVRKTmgvRC9Gd1B5ZCswQUZNNFA2NG9PTU02UU05?=
 =?utf-8?B?WEdLRTIvdkdmdXJCK3orc0tqRGhxRTlPb3JBZjNvZHZJSTQ0eE5hN3p5d0pT?=
 =?utf-8?B?UGI4NWM2ZzFGTTNxSUtBU3FQQWZwc2lzaHJFcXhiWmxNdWlXRnhwQ3BaQ2t3?=
 =?utf-8?B?TXNjRGllZTNGZkdYY1h6Y3hlVzZRdlh6UVMzWmphbDNwZ0NRcEJUNkxoTFU0?=
 =?utf-8?B?SFBvS0wwSzR0QzUvNm1uZVNMczB3ZjdDQ2drSmFwOG90bytKWlNXTnZhb0hL?=
 =?utf-8?B?NURIYzJKTjErd0k2MDdmbHVHaitnNERuaXdxL3lXVWZYL2llaXhzUGtoQTM5?=
 =?utf-8?B?aXBXUklhcGRkdnVxRkFiZWowd1dNRysyN3JxajMyYUxKUDhLdlMzZWswZWll?=
 =?utf-8?B?eEIrT0tPNTZjckp0dkxwV2RZRGhnVUNsWHF1cXpyakoyVk5SUE9MRkNKU3Fy?=
 =?utf-8?B?K2RZTXBSWGVSZExWc2ZUNWIwWXF4ZFJWbVZzcEVpaEFWWFpITjgwVmQza3py?=
 =?utf-8?B?NXArRmZ6dlRyNE9VM3NtNjJ4WTdPSDVsMTNmRWcxSUk0Q0xKbXNMNStLc0FH?=
 =?utf-8?B?VGFvRm1NR2dDSDFoMnJRdllSRlFqaXc5cXAvZUdSYWptUXc0cCsxdUR1OWQ1?=
 =?utf-8?B?YUhwMXRES1BDazVSbC9EVTRHV1VmcGxHdHRxUHdia09GV1A2U3J2dFBGWExU?=
 =?utf-8?B?Y0RPbG5qNTc2YysxVjdieWFYUkdNZXdJTk9OVkhlY2V0eVpKV3lRdW45ZFBY?=
 =?utf-8?B?MDFKSUlnNWVpQ1lHKzNCSmtxOWpkQnJXL0xwZTdoMEwzc0hLT1N4OXhSNTM0?=
 =?utf-8?B?MzZoMDRtdW12dy82MW90UCs2TzUvRU8vb21uQ3NRUGZNQy8wWndDWWtaOXIr?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd18f20e-a55b-4b00-3f70-08de3efd18e1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:49:49.9639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSRazU3vBglSz9IvOUKC8fx6UkJ2DbOfUOcDD1XIbVQpaDif0T21vsEOh9j9Vt/KTE+R4w5fAcP2+5vwOwxVHRR64WGNXujsMXNo9nXTbDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

Hi Mohammed,

On Mon Dec 15, 2025 at 4:07 PM CET, Mohammed Bilal wrote:
> Add a helper to retrieve the first matching Chamelium port and introduce
> a connector_test macro to streamline connector-based subtests with
> automatic lookup and clean skipping.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  lib/igt_chamelium.c | 22 ++++++++++++++++++++++
>  lib/igt_chamelium.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index cb240a7df..95fd9dd4b 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -3260,6 +3260,28 @@ bool chamelium_wait_all_configured_ports_connected=
(struct chamelium *chamelium,
>  	return wait_for_connected_state(drm_fd, connectors, connectors_count);
>  }
> =20
> +/**
> + * igt_chamelium_get_port - Locate the first port matching a connector t=
ype
> + *
> + * Finds and returns the first Chamelium port that matches the requested
> + * connector type. Iterates through the provided port list and compares
> + * each port=E2=80=99s connector type. Returns NULL when no matching por=
t exists.
> + */
> +
> +struct chamelium_port *
> +igt_chamelium_get_port(struct chamelium_port **ports,
> +		       int port_count, int connector_type)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < port_count; i++) {
> +		if (chamelium_port_get_type(ports[i]) =3D=3D connector_type)
> +			return ports[i];
> +	}
> +
> +	return NULL;
> +}
> +
>  igt_constructor {
>  	/* Frame dumps can be large, so we need to be able to handle very large
>  	 * responses
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index b5d13ddc8..2733e3a11 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -274,4 +274,30 @@ bool chamelium_plug_all(struct chamelium *chamelium)=
;
>  bool chamelium_wait_all_configured_ports_connected(struct chamelium *cha=
melium,
>  						   int drm_fd);
> =20
> +struct chamelium_port *igt_chamelium_get_port(struct chamelium_port **po=
rts,
> +					      int port_count, int connector_type);
> +
> +/**
> + * connector_test() - Run a subtest bound to a specific connector type
> + *
> + * This macro wraps a subtest and automatically resolves the required
> + * Chamelium port using igt_chamelium_get_port(). If the requested
> + * connector type is not present, the subtest is skipped cleanly.
> + *
> + * Helps avoid repeated connector-lookup logic and provides a uniform
> + * pattern for connector-specific subtests.
> + */
> +
> +#define connector_test(name, connector_type, test_fn, ...)				\
> +	do {										\
> +		igt_subtest(name) {							\
> +			struct chamelium_port *port =3D					\
> +				igt_chamelium_get_port(data.ports, data.port_count,	\
> +					DRM_MODE_CONNECTOR_##connector_type);		\
> +			if (!port)							\
> +				igt_skip(#connector_type " connector not available\n");	\
> +			test_fn(&data, port, ##__VA_ARGS__);				\
> +		}									\
> +	} while (0)
> +
>  #endif /* IGT_CHAMELIUM_H */
Overal, looks good to me.=20
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

