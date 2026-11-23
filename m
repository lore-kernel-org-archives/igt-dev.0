Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521F606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+tcUJog;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KeAWwZNC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF1310EB78;
	Mon, 23 Nov 2026 10:01:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79F610E78A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 10:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795428025; x=1826964025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J1x9Uz2g8uUbHdAegQlCkRCJaGXXJldmsnYUltcqaV0=;
 b=j+tcUJogX3ihIGDKd932RdDapkoCT4kR4mRGIqQBPlZMv01EyhmrG3BY
 UVFf5IGsthYS4gWhMwMUn2aeOIBXSBjY8cRm4X4RBf+63T3/Svf3dHXW8
 AlRp/WkpAC8TKhJ+L/rJSbvrlewJcH0eTyMZmTbt6Lpiw9DBUK1rPzKD5
 aZ1USUX0Aqr+DcERg8eckGd8MTjWfEwEHz9g8SZyaIvYKNYvXG7Ecfn6Y
 gPoVRZPS3VsCAuy5rRHxpPgLewJeN7ZuXtX4RlEc5QtcgrSMiXrMBu9Nj
 frVETl3T9aA/lI1FHw+GyiMlF+SnbT5qjnfcofKnhCJv5bMvCCy6cZNc/ w==;
X-CSE-ConnectionGUID: sfm9N2fdTKq9sdwJqFX72g==
X-CSE-MsgGUID: nrPrcWCuSBSwNt+lwb41yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4130533"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4130533"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:00:25 -0800
X-CSE-ConnectionGUID: zAydtOp9QHSyQazLBepBnA==
X-CSE-MsgGUID: y5yk9k/iQfK9hYi342j5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="12966071"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:00:24 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 02:00:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 02:00:23 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 02:00:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voa14mkDacamUfrs1Z7QQkV3h3kXx7K091C4Y6jcsn5qrwfLrZckS8gghwSW7KDJht60Y8so7YpzA6ouFcBOsM5s7FYVIVMO9+J3i7Z/Y1eglk+meM3djLqOl2e3h0uTLe94FOShW8uESFbQbAc51Jrgvs3oZ2akG8Q5n0AaLg6wx3ax6/K2zehvzOnIYW37sPUcrk2Touc2aCwfb8kbsFuzjC0IL3KAtJ1mT9kb0Dh9MUyEkrZnN/QSesQ0OpHhYQgN6hkNTvDh7bN1m/WvMSEI8Lh8wWPsl7bBA0CBKp8n94/mGCmCyt61rZfAcUV9hqzjmPvrqb9exCRkXzBsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSHXPCFb13DiUcYbH0+lbTghEYRfaAS5QQAb9AtXqv8=;
 b=il0BMCfOzLa7DGI0PL70/Jjcb4qc/5YUb5LTSQI3h99aqkxKpZwM1YdkAev63gChuDhwooFV+rOyMMIYN0LZ3CtH6R6hE9/Mb/31NHCD6J3X7co5DUa9c1O7ca5saEz8hGRmd992bPO8Sb9CVK4/oSG05ad3pnHvl+VH11u+mG7JU4+mmJ+c17pb+yHa0FPDRmV0nN0gDuZxtWUS8YWiJnIqSz21JnMIo6vaO40xTdcPXE95D2sUyNkR+5Kaq+SHPttIs9Ks4LLBOqeJ5/bAcmnIBl0ZVzDB0iKCeYlbY49qCrRO4q6u6ntM0fThid3IWsBmKAjEnDvyjmQ0OZNa+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSHXPCFb13DiUcYbH0+lbTghEYRfaAS5QQAb9AtXqv8=;
 b=KeAWwZNC9GnE3ff7jY6Rd9e50eqY882FXBdRu+0MyYBb86p7fxBFbGsyWFhty4iYBHS9e7qVXdJsxo8ugrQCZbzxft+OQm2oyqc1MUtnDJsHBGnVbNHNkD5j6tIqBhXRJlHLwSXg29vHC2JwKFhTAfmPR2b1qnsWJnRYlWLx4KA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by LV8PR11MB8584.namprd11.prod.outlook.com
 (2603:10b6:408:1f0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:00:21 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 10:00:21 +0000
Date: Mon, 23 Nov 2026 10:00:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/3] tests/core_sysfs: Correct typo
Message-ID: <egerbmy2rd5tl2xj5arjb3pna73cs32cx5nyivwcikvxmbfyxt@zbu3xzarapvn>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120182614.34410-3-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DU2PR04CA0301.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::6) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e1157a-c64e-418d-51ad-08df494895da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261102123227099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WORNzVBWueuRRnXDJCp67eikTHg2w2iTBDwI2UcFawgmJjB/yuLEaG7ll8a5QMY+3Bx2CoCEnyGDprI16K1ObiHu2m5xtIoqkDynz55bCFZLj5ljnxPKwrz4Qtdda24lNwxUEnBBQRQGqzMM+EtlpQceP3AlH0nE4H/WtJTRGi2nWlYCrO7fjKKI0PCIFVHXKUAyDcfhTRfAYGPnfhKNwb6ErCaGsVNjVXm5HkbeBl4kKCdmpmrK4Is+SIHCCRiMXEJ3w04S8cixFwEEW/1jZFoUTF84l8An2OFMb34LQ0YRthSof+3jWO2Uoxp72ESjX0OmXDwvr3vBlcarz2bC1kX16a1LL51UkJhNkf0DcM0wkhgGiY7J8nxciH/Z1Y6GbkhKp6yTdp66HgQ/Uc+bFJJxE7s5CgbXc7ykUutIubSfL/CfMQYM+k3LshBrJxHw6aHA55/kP8DT8M7vTmbhYu3zE+xqyoChS23IOSxlBHn4HhN9SHKH2QHfvfOBZINuXXsVYDr318Au5nsab0eafWbMCCWmx4xOh5DPMmywe/wsJfH3r7hZGg27Cy2AvomxiOKVujiayDBG+QaY1BBNdVsuoclQF4UNCq5vy3fGM9HqtV8FHvO12zexbfODEcCgYtUN9uoPMcPJQZw5cefxPzUad+9eLvMmFTywKns1yQc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261102123227099003)(261028144727099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTNLcjJvak5sSTZYam4yNVBLZXJHY1lKeXNQajhuUC8vYVNRdGpOY0xvS3JF?=
 =?utf-8?B?bmVLdDhQT2hTbFdOMXRJaFBjdHdIbXFTeTJ2MUNBOG9WTXVqRFFqMlNMdUNz?=
 =?utf-8?B?aWhsU2Q5OTZIcjFaYkYrTmt4S09qUkxQTytvRVV1eEpwdE1pSDhEVmlBWU1S?=
 =?utf-8?B?Q20ydG9YMGRxUHJ0a1FXQlBXb2xhR3pjTGJWZDNTSFBDTjdydE1pNUh6T05E?=
 =?utf-8?B?dXY4VFRjMWpCc2RzUTFUd0tDczBGSzFlQTFndnQ5WFpTa0tPYmQ1R1kwRHRj?=
 =?utf-8?B?RGZSSlA4U3FTSTAxN2MrZ0F3SFI2TzVuM1hUSHljNnkvRHVWWXE5T2pjeU9h?=
 =?utf-8?B?MlVsME50blVmVDhKQ3lHRENuSzRqMEIyYTQzc0VRK2tUakFEdnFOcGVMUnBN?=
 =?utf-8?B?VEJxV1Z0bjJJTC9qS1NkN2kvWjZ1THpCVDgvQ0RZN1pYYzBOOGROYmRiVUc3?=
 =?utf-8?B?YXRzYWpERDZjMm1uSStKblprSHdSSDFTSnZLQlVYdHdlUDE1QUJlMUI2MVhk?=
 =?utf-8?B?bEpQa3BMcHo1c205SUNIQTdWUkE5U2p2NVMzSExxNER3NkppM2FSNTM5OERz?=
 =?utf-8?B?YkpiY0h0eU1FWHZkekg5WlcvMGN4dXFWcXhPdjdBc2JzRloxUFhxQWVibURx?=
 =?utf-8?B?cUFWUjhyZTNQQlNoTE81QThBMVU2QVNoM1RTSFZtbE5OZCsxNTBFVjhhRzcz?=
 =?utf-8?B?S0tON3hqVUNwNnp2SXl5bUZpMVA0UVh6K0JNYm5SSkdPWHFrV2RZSnZlUFFR?=
 =?utf-8?B?VTV4LzVvdmdDZUpKRmxVWU14U1BLQm11UytQWS9Nb1dmSVFxb3F0RDYzZmU1?=
 =?utf-8?B?Ty9aZlpSc3NqYktlZlJ2ZVJJbURDeFd2bjBFNm43S0lRc0t6OUdPK1A2VkZX?=
 =?utf-8?B?di9WQUF4NnM5b3JLL3FDV2hYeXRDdWZldDVZckxSekpCYVdBVEJ1alR6ZElT?=
 =?utf-8?B?cFN1ZUZGQ3Q3a1dsbmxSdFVZTkN2YUI5elZHQ3dpUHpHbVY1eDhISE5rSUZM?=
 =?utf-8?B?UXFvNmcyc2RWeERxU0cvWkUvRUJ4c0Z0YktlWnY0b3BmZGdlZHYyM0Jid2JW?=
 =?utf-8?B?QzZIcjh3ZFR6OHpic1hCMG1xZlVhZW0wV1pQeG5CU3kxVGV1cCtzR0lLc0Vs?=
 =?utf-8?B?OTg3UHIyb0ZhVlZyQ09jT0NvVUxrZEdoeVpkT0cwMzNJR1pNYm02MTU5Q3Y0?=
 =?utf-8?B?ZkI2T2NRL2d4L1JPaU45cFdTeHB3SnhnSy9MK3hTUXNaNVpLZmYvYnRMQUZZ?=
 =?utf-8?B?Tmc4eTlWb1AzbE1JY0VHNU9XYkk5MjBRaU5XWUdkMTYvMnRWakNNd1RyTkdv?=
 =?utf-8?B?MlRDeFllbVpTY1hzMHdIdEh6Zlp0aXZvdXBRb1FFYW51L3dGVTh5VEFvcjhS?=
 =?utf-8?B?VWNadzVzZFUvQmZ1SW1oeHRxTkQwV2lwYkI2NzUrTlh5QnNFZWF3M0R0bWds?=
 =?utf-8?B?emFKOVlHeDdIOFBVOFlDaHo5UTlWVDI0WXlyWUV6MmVSSmpYV0hlVExEOFpp?=
 =?utf-8?B?OWdHcmpNZzdwVGlvbml0OXFnWStjUUlwZWY3NlB3TnkyNU5kcE5CQmpQM2Fz?=
 =?utf-8?B?UnQ1a2NxeENmYzBpWTRvOEVlWDd4OXk5Y0JwMXIxRzlmS0xKYjdlTVIyUHlQ?=
 =?utf-8?B?enZBcnlDMGlyczYyU0JzZHR1OEZLMnd0d1BybVZoejF5VzBTWm82Y3BRcy9I?=
 =?utf-8?B?b3g1dkwrRHVzYUpnTFhTN1l6TDBCNkFOZEdzUlNjSW4ra2N6OHNjeG5WcjI4?=
 =?utf-8?B?RHd5dlVTajU4ZDdsaWZ0cUNVVmlDeTMvQ29xQUg4WWNBWmgxMy9tU2RHUU8y?=
 =?utf-8?B?S2JJVEpoWk5EUUdOeGlZamxBaGxYMGtlRW9TWG5hbHJUWkxNNG5QSDh2TWgx?=
 =?utf-8?B?VXM5Q1VZUW9BQVBaZ3lsaFZmcElVckV4bXZNa1BWUmtTSXFHOSs3Z1lDdnJF?=
 =?utf-8?B?MTRVMmFNMnNNS1hFZXhYdHVLRmdYY0xmQTFRZUZ0TDg4UFlhM3J5b2NMVVNR?=
 =?utf-8?B?NS94VnNhT09sYjZLYkN4ZHdaTVRTT2dHeUdXeittOHlJcDBCZzFTWThYWFB5?=
 =?utf-8?B?VmdlYWhuL3B0VnFZK2k1SjZlcktFVnl5YXZSelZRbGxQWEZsSVQ2K0pUMjFK?=
 =?utf-8?B?Vll3L3RBZElDS2lVYnRwOW41RFI4WGN6dmt5Nk5Wa3dSVDhCY1ZJNHBteGtw?=
 =?utf-8?B?VzFQNHdER1FSMk1ldncvWU9oMnpaZ0QzbDlYWWh3MVZiY1dpa0thdzFtSVNO?=
 =?utf-8?B?STc5c1loVGYyc05sTHoxQXBJVWtheFhKazJhWCtTcWZsTkswZEFQUnVNYStV?=
 =?utf-8?B?c1U4eWtwM1UvMDdNblE2Vmx6VkZRVmtvemlKZGJFeHQwM2ZtTTU1aDVqcE1v?=
 =?utf-8?Q?zhyB254OgqKr2uNs=3D?=
X-Exchange-RoutingPolicyChecked: bChfkM1mDlMovGLvWlFfwZsiNzOf1Aaytd4AlgO6JkZh4uIZ/dbVq7HTNbxQ5J+pDLJWHudsjaeelEfpNQZwyeZVJuRLZLCEyWK9m66gtUf7UORH8nCrI7SRe5/Yfki4xMbt+j2ztuchPxU/H23F7hMjwRdxq8BmL6HiKtCfjO+qWd8jTJu9cRaMd6yc86gzTrZsz3TE83ZYwl7/LM8xqUVZeDepQsnwGFoa/CVpP1agVWj5CThGCS8WdqKddmx6YgCZ2aP3YNZnieBx1I93pVYkbIzNhwKKc55lcUAlJ4ClTAJbtDTVBhg3S5X8nzhGTDXL4DRygMZZunNO6dShlw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e1157a-c64e-418d-51ad-08df494895da
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:00:21.1146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daTbfidTV4ltAzEK4wqIkd0/a9CIyqHKkh0muqKyRbgEZ1QW2wbKEuV30xVaxW2EUKyQa4u4jheyEAF12QmidbG0yD8grm48ReABGDYFpsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

On 2026-11-20 at 19:26:13 +0100, Kamil Konieczny wrote:
> Fix typo s/readed/read/.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index 99117eea3..8719b4ffe 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -27,7 +27,7 @@
>  
>  IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
>  
> -static int not_readed_count;
> +static int not_read_count;
>  static int ok_count;
>  static int read_fails;
>  static int open_fails;
> @@ -53,13 +53,13 @@ static int read_sysfs(const char *filename, void *data)
>  
>  	if ((sb.st_mode & S_IFMT) != S_IFREG) {
>  		igt_info("Not a regular file %s\n", filename);
> -		not_readed_count++;
> +		not_read_count++;
>  		return 0;
>  	}
>  
>  	if (!(sb.st_mode & 0444)) {
>  		igt_info("Not readable %s\n", filename);
> -		not_readed_count++;
> +		not_read_count++;
>  		return 0;
>  	}
>  
> @@ -75,7 +75,7 @@ static int read_sysfs(const char *filename, void *data)
>  	if (bytes_read < 0) {
>  		if (errno == EIO && strstr(filename, "/power/")) {
>  			igt_info("power management EIO %s\n", filename);
> -			not_readed_count++;
> +			not_read_count++;
>  		} else {
>  			igt_info("Read fails errno=%d %s\n", errno, filename);
>  			read_fails++;
> @@ -136,9 +136,9 @@ int igt_main()
>  	igt_describe("Read all entries from sysfs path.");
>  	igt_subtest("read-all-entries") {
>  		process_sysfs(sysfs);
> -		igt_info("Summary: reads=%d fails=%d not_readed=%d\n", ok_count,
> +		igt_info("Summary: reads=%d fails=%d not_read=%d\n", ok_count,
>  			 read_fails + open_fails + stat_fails,
> -			 not_readed_count);
> +			 not_read_count);
>  
>  		igt_assert_eq(read_fails, 0);
>  		igt_assert_eq(open_fails, 0);
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
