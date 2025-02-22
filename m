Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71368C021B3
	for <igt-dev@archiver.kernel.org>; Sat, 22 Feb 2025 00:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328AF10E0E9;
	Sat, 22 Feb 2025 00:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGyiwGgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165510E0E9
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Feb 2025 00:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740184693; x=1771720693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Xq8lpnSwkfz/hkLSsnqloWJAoYWi0/XbmDYZKTLHB8=;
 b=AGyiwGgYxrfpXjmDoegiq10wpRw2Mx0XyHUnUztMoanyH0lycGHafeHd
 VHd0RYXLIOI7f2/mcefdX9uNMpO2Zv8EK0U5SH8FIa6W9E5dFVOmg9y9K
 WVAlZt19ZZ8/4iAay5TQ/4WC+/izHPN4MPfzgSgDL2Fo6iE3IleaXLiCh
 IOr3H+OaF8KDokGAWXkwl10ZWchchFzH4X8RMwkxIAQtmkYQABm7soJDZ
 MtTAPyPdgHINBO5XEWjPaZmk96YUjDe78ol+ZnhI1eA8KIGWOb0L8iDTw
 ARfW9gZRkzM4+8yWXYVwWHsQiQIGYlaFk3hgE7vNmasEZzvn6LSzCB84U w==;
X-CSE-ConnectionGUID: 5NM/ctcnQbmbwh8ll8ZZTQ==
X-CSE-MsgGUID: 6iVTorV8SRi46bafcBe61w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40207627"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="40207627"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:38:13 -0800
X-CSE-ConnectionGUID: b7PEpiJpRX+yoNsktgDEnw==
X-CSE-MsgGUID: uP25taeVQJGSeJUcGMu/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="116146531"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:38:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Feb 2025 16:38:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 16:38:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 16:38:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5hh8p33UPETNkQ6S9RfFHbs+ZSi+OnxpRzejGjMvG/HnLLU4igm5/1eyleF+3PB51MWlW6T56aijpPkbyime+DPPdKoSlqbKJpc1K1/3z7CDK0bxrq9wVRHYniWVSw1ilDBBc1QIb5ETBu04JqUu9CSky42vUEH4KryIJs9u2EprCVLEnJiP72dmabA8mM/S4gxjxSY2IHsOWedArh42IsL2lq9m1VRQB2b1nXdFxzlzWuQSNDYiuCs7jbtFT5rLBjcx0Q5UrmeWjWfz6+u+ndf0Nq/OXcTCCfe1R21GK4Y1mPEr7YXdsJqG3feVRBXa78u6i0mZv3ftBW73/pnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUoP64AbxwI97sU+Py8XjJxZ8MgYsFAdJlVswa92EaY=;
 b=uGbhnS6kLQfsa4/X7L1+VSwW7OsvrsSMF3wsxPbyCfV7o4JxZeIK4jPXWla4dkgrK9qnG9Wgb/74qXFW385X66JK6SWcyQwIEnhe/f6L5PPVyAeKICHrf5jwCAq6WtZDMZekBXXtvvLRIOg2uN7qKQkFfSl/KbV+UiV5WmqiPkGbxbWuUMjbl4OPg6kCnr5tvhtyI66p6CwYbueO76hKSpQG6Ky8r7WbqJGb9hS0Nbh3sYZlOM4iuJd5xFnEcBSpqSXV0CX/RdrcOOi5/LbUIzFMI+a+Xkj8S/sZNwIS3iZwWxtT4j3cG366YK7XbhPJOeHVidgcLddH4YKirr67QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4627.namprd11.prod.outlook.com (2603:10b6:5:2a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sat, 22 Feb
 2025 00:37:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Sat, 22 Feb 2025
 00:37:55 +0000
Date: Fri, 21 Feb 2025 16:37:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t CI run 04/14] tests/intel/xe_oa: Use default
 exponent for some tests
Message-ID: <Z7kcYel9BWtxBmoc@orsosgc001>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
 <20250218202812.1679653-5-umesh.nerlige.ramappa@intel.com>
 <85eczqom9f.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85eczqom9f.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:303:b4::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4627:EE_
X-MS-Office365-Filtering-Correlation-Id: 608e0b81-eb9e-4dd5-62e1-08dd52d92620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGdaM0s4TFQ4T1dPbFFmZWw1cXZpZ0lYa292Qkh3UGVKWk9hWTN0cGZ6ZTRH?=
 =?utf-8?B?ZVlTOUhkNGRRUTZ3VkNDY2ZjeWJnampnM25pdG1GTGdsbDAxbzlEMnJxTmpF?=
 =?utf-8?B?ak5jbXVLZVBSQ1VKNmZxSWpZc1ozZEhQVUJKWGNQVncwbjVSVDcyTUErazgz?=
 =?utf-8?B?Ly9uMmlwRXRUTnFvUkcwSjVTM0JLeU02UFdzcS9TUXNidVFVS2NrV3ZMMnRO?=
 =?utf-8?B?YU9mMEdWZnRob25jQnp3WFpraWVEaE1KYXRjeTFGSitCTk1SRVo5dnJmUi9u?=
 =?utf-8?B?bzJBNnhzQmtNb2Z2Y0dmNzArY0JqR2tRMVh0R1Q3RXV1ZjB6MmFwVXRBZE5P?=
 =?utf-8?B?MHRoTkhjZmNYOVNMOTcxbVQxWDd4ellPZUhZM0dvbHd3VWF3RWU3b2xYM1pR?=
 =?utf-8?B?cXh6SVFOMHc0cVVWWS85WXBHYjJEZmlHRldJR2VnZGRkVjVmSmdPQTUyc28w?=
 =?utf-8?B?OHFtSDh3WVNqQm1YNnpGUzhKR2FFMjk1ZFF2ZmIybSs2N3VvOFVaeGhWam95?=
 =?utf-8?B?SGZMajJrdjh3L1FtWEk0Y1BtWEdiZHZWTDJIQWpySWZkOXpMd1J2bXJLVHVr?=
 =?utf-8?B?ZlRMSndya2lKQTZCQlVPSmxpck5UVmhoRTlXN1VzbXQ5TS8wQjBqbkFFVEYy?=
 =?utf-8?B?MmhTVkVqM2Z0Q0x6SStZTVYxTEhVWjNEN29xLy83NkpRT1ZrOFFXRGNLUitC?=
 =?utf-8?B?cmQ0SGJJUjVmY2xNWDZaaS90RGcrYW1TRjhaMlhsUUg1b0JZbTBQeUlCY0gw?=
 =?utf-8?B?TitCRlJ0c2VBWHVseWZSbU0wY0xudmZLQ3JpMDBndlF2TGxPQk8rd2gzUWls?=
 =?utf-8?B?S2dSS3A3SjhnRm8yWmJ1M1UwU0RkL1g2VVR3d3MrcXMxOG9wOHZ3cW5jR3A5?=
 =?utf-8?B?cHRoVCsrZWhGdzBkTHQrTkFROTFQSFRnWUxtcGRyK2lZUThxU3U1WXgyVXZ0?=
 =?utf-8?B?Q21kTkM4T1J3T1NBVkNtR1AvQUlCdm1ycWJJQzY3czEwUXB0b0tSS0pGcE44?=
 =?utf-8?B?akZBVDcvUjFONGwxOUx0U09zQ2taRnppM2VDRHJGWCt1NXppcmdEYUtBd2hO?=
 =?utf-8?B?Y2kzSkgxZWxqWWQzMlpVWjRQdmVsQnN0bFdyNFAyZ3NpdlR3b09Ebm9NSVVs?=
 =?utf-8?B?ellCV1VqVDFWUEFmWmdsenZVcjN1LzBsdGRPRVptWmFyRzBuVGFPQzF5YUx0?=
 =?utf-8?B?eG1VVW16ZWNvODFZMjhYVHN5UWZQYi9WR1p1QlpaYnpTMTl1T05OQ1V3Vzht?=
 =?utf-8?B?Y1pzQ2VUYlVmN1JDQ1prdVBpUXBxZFRpNXpDYVd4WWNFTjlMeDdFY25Udlpm?=
 =?utf-8?B?NnFXMWFROEdORTY5MlB3REVKcVVEckk4TGNlRHNGL0lQUFJsK2YzaXRoNnEv?=
 =?utf-8?B?My9EazhORFFhc2VYZ2dMZzBsaTExTm11SndwaFJscVBVVERvM0MvU3QvZHMw?=
 =?utf-8?B?VEMyT2s2Y0txVHRiSENJcUhiNzFJOUZZMjdPVGJ6V2FWK2FLUFVuaHFSdGZy?=
 =?utf-8?B?ak1oK3JUaW5KdklYM1RBdllUVDZ1UXZzelhORXFQU3R4V3NlTzVEZ0NjM29Y?=
 =?utf-8?B?SWlaZXJONWR1RGZwRnBuOEtFSFY4MzVBQWdWb0dZRFFONzhXQ1BiMVpPSm9S?=
 =?utf-8?B?UUVlOGxwZkgyYVV1eXhGcWVSeDZka05WdW1HUzFjd3pFbTgxdEl4WXpqdjdk?=
 =?utf-8?B?TlVNQlRyY3I1ZHNOTU1xZnRNZFRTeC9CanRBbGJYalhSVVRBNWN0QlYxZUFW?=
 =?utf-8?B?VkwwVmsxOWhzbWYyaG14MHBwQXlRT2t6bkZaNWJDZ3dEbkpVcWFsMUVoakoz?=
 =?utf-8?B?MkVWQTNsNWI1dkRLRE4yRExkUkEyaGVMemtqTlBwaFZrVlQ4OUtnY3hFajAr?=
 =?utf-8?Q?6gJrb7XP/6hnQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnB0VXlvK0plZDF6RGxXTkUrOTA5VFJiTkdZT2txSU5mMmZ2am5EZkljUGI0?=
 =?utf-8?B?WTFmeXdKU3JMZzRpYTZsNnpwSk5Jdlo2dlNDWnBDVmZuekN2Mzg3ZkxwRGZR?=
 =?utf-8?B?ZlQwMDFjRDdZNTFXS3B1Sk5XMkVqakNYYmNWVjIyakxhbW9hN1FDRUhjczJu?=
 =?utf-8?B?eVVHa1FqLzNHZ2hxdkU5ODRFSDVHRWdZWjEwbjJ1ZkswOHFSSUlhMzdyam01?=
 =?utf-8?B?K2FrWVVIQ3gwTnhnR0JFVFRUcWhSN2VDYytTakRlOS9pb0t1dk1ZVnJiSUx2?=
 =?utf-8?B?alEyNGtRS3V6cmFhdVZ5b3dOYW1yQVlQMWxmL3FLb2RGR1A3Z01yYS93THk2?=
 =?utf-8?B?SDhkUUZXYms5UWxOK0hTT2RiTnZFeDVRa0ZudXJlYTJOeDVJM1FtREhBc3BE?=
 =?utf-8?B?WFllSGUrS1RRaEMvQkJtOXBWVmd1cnQ4NzVyOHJmZHc3ZFZnMEtKRVI1bWkx?=
 =?utf-8?B?RkFEN1VrSUE1amEweWRFMEtoc1NVb2xyREtZQnRQRTg5UnMrbmoweUxJSDRm?=
 =?utf-8?B?OFozWDJnT1drd0pnZEtnRzFzdTJRZWxGVEVoQmZLWFc5Zk9FVXNIejE1ang5?=
 =?utf-8?B?QWlSemFBSjgvZ28wRTBaa3JJNUlxaXRURzhSM3NMdGg3ZjNKaDJFN2FEU0Ri?=
 =?utf-8?B?VFRjVjRoS2hnTXpMOGZHVUcxbjR2K0x5OUVzSGlIK084NmppMFBOOXF2b0N5?=
 =?utf-8?B?S1luekdjYmtKOVhJZ0JseTlJM0FndDIvNlFZcHZXT1lZYWt1QVJqam1Ud2sr?=
 =?utf-8?B?WWI4NUZ0blpFWkphNDgvUTdySnpodC8xV0d3cW5Ndmk1Qis3SkVtTUE4SHpj?=
 =?utf-8?B?VEtWOWhLUHp5dysyS1NhQnV2NmpZSGxqdTdKSzdhWCtXcVpRdXp0YTJNd2dW?=
 =?utf-8?B?WVVmWnRjQXZpQTJqZjVyL093a1FhVWg0Rk54N2ptQlA0YjAvSE5kYkRjN1VH?=
 =?utf-8?B?UzB2MGo2RndjeUFaMkN1Qm51ZktlcGNkV2tXTTVXRW1iSm9GSXNzNk1EdGU3?=
 =?utf-8?B?aGt6eEhPaThHNnFxQVFNcWhaazZMZVp6cjRHMUlMQzBHODF6Sy8vUHBMVm10?=
 =?utf-8?B?UUhPVnFyVlpDT0hLY2s1TjV6d3lldlcwNUhnMUJXQldjSHpCUkFEYk5CakNa?=
 =?utf-8?B?cTFpb0ZZWG1pdFhHb1lKbVdtNjlzU2xOQlc2UFFKWnpqQVJMNlZ0T2NNQ3dM?=
 =?utf-8?B?eUF4M01ITDdCcytIQTRXZDMxS05Od1NrdUlxRlg5SHNnMmV0QWNaUzc2TzBJ?=
 =?utf-8?B?SERzaitCY2lpOC9yajJyejh6azRNYXpXdU4ySHcwNmFCa2tPSk9WWkp0TTAv?=
 =?utf-8?B?amNlVk8xdEFKUmxNU1dndTVaaXRQeS8vZlFUME51SG9WcVFOS1ZYalVDMW1v?=
 =?utf-8?B?OHkwVjIxbENCMVpsVWxMdzluSHRES1BNK2kvQUgvSzdaRGQvRWhoY052T2Jh?=
 =?utf-8?B?bEZ3ejlzbUo5RFV4QWNkVUJsaU56dTFPbVFNUmJsNzUwb1UzTmp5V1MwSStt?=
 =?utf-8?B?Z2pqcHBvR3NZaEk3VzdFOSt5NUhYMDZrU2F2dFptai9sMHpRRFI4VHFsS3hx?=
 =?utf-8?B?YlR5U3FaaEJvOHVhSGlmNjlvQWRoNVlyZ3QreEpVZUE0b2FuRHVHekxpalhq?=
 =?utf-8?B?YmxJY2lwcWY3QmFWZWxhdjRxVit5eUJsdjV6cjVwdS92M3RpVmpHMDlPbGN5?=
 =?utf-8?B?N1BOTzQ4S3NpZ1drQk9HWkZSOWhDNnU1eDd0Si9kUGMxWVpSUUVFTDlGalhI?=
 =?utf-8?B?ckFIVWJROW1ZL3ozVXZVU0wrMTBqUmZwU0cyemlSVW1NbXRHQWVLdDdzVUVo?=
 =?utf-8?B?bWZKRHJicE9rakRsbEVUeW1wVzduS2s4ejVMa1RRYlB1Sy84Nmh2THIvOGJ4?=
 =?utf-8?B?bzVtM2J6WVFiYnhSMnNSNHpZMDNkbXBwRHFRVHoxYmt5QUlmdjNRRjhIZnp4?=
 =?utf-8?B?SWdhV0tkUGE4Z3NJaVZEem15OXJPeWFUR1djZENzc1RUaXp4U01Bdkp3SHAv?=
 =?utf-8?B?dEZNVFA5NVoxS2E1SjBBREVrWjVlRGE1eGRWcHNjL1Q1L1R6Uk4rUGl6bGpM?=
 =?utf-8?B?eldIQ2kzNTlaNkVmODlsUGg4dE5yNjVMTW1SVUxHYkhIVjZBMnZXYURPOEs2?=
 =?utf-8?B?Vkc5UklIR21zK0RUM3dTYURZYnNja3ZKSTNSeTQwRjJEaVpXeHoyMkdTVnhW?=
 =?utf-8?Q?+F6s+Jmna0naYAo/2v1qtck=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 608e0b81-eb9e-4dd5-62e1-08dd52d92620
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 00:37:55.8588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkRBP8KxEKCWG8NUJ6AdhX0gr3cYiGJJ4/fmlL6otoKEHyOcIw0KjZq8evHD+xl2nnaHXWKSB719nsD74ZFrwr3g2l2DPgP/fpLUNqF8a4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4627
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

On Fri, Feb 21, 2025 at 04:29:00PM -0800, Dixit, Ashutosh wrote:
>On Tue, 18 Feb 2025 12:28:02 -0800, Umesh Nerlige Ramappa wrote:
>>
>> Use the default exponent for below tests:
>>
>> oa-tlb-validate
>> short-reads
>> stress-open-close
>> mmio-triggered-reports
>
>Why? Let's add a reason in the commit message, for all the patches, even
>if, in this case, it might be "because it doesn't matter what exponent is
>used".

That's open for discussion in this review. My reasoning:

Other than the stress-open-close, none of the other tests actually 
depend on the oa exponent, so we might as well use one value everywhere.

>
>Because these tests were ported from i915 I myself don't quite understand
>why some of these tests do what the do. So it will help if we could
>document why we are making the changes we are making, and, when needed,
>what the effect of the changes is going to be.

There is one patch on top of this series which should adjust the 
exponent value for all tests so that they run quickly on simulation.  
Maybe I should post the v2 with that patch so the context is clear, 
otherwise, I agree that the reason for these changes is unclear.

Thanks,
Umesh

>
>Thanks.
>--
>Ashutosh
