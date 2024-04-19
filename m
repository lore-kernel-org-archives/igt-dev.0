Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB035C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 09:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672ED10E23F;
	Fri, 19 Apr 2024 09:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAGzsboP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDEB10E23F
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 09:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713519197; x=1745055197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iNfZ2NZzUdW4uOfq2E2xrhGamcK3mZljhUHKAF9XOus=;
 b=bAGzsboP8pphlQ1G8VBhXzzPrY/bo7GD/LqCMNr+dLC8zEBAoJyTFSmW
 5idCmXx+psV5KZvUKN7xEfAckqqpRGk/s/+HwiZwPR+I8S12jk8MB+mJ4
 UqEjKmxXzAFy6w+DEcN30nfOMy4JijgIyzRByLweLcXGAFjwlglPq/2Ta
 /G61r6ernlQRmdqxhIM4VHKA2+4aXIfxlKfqcVqVaFARgbG8qT6gMjJl/
 UOah36bCxD1/v7QwKSebk71kShHZtSZ/TNvexTF+BTrjSiNyISKZR9Jx/
 ZQR1EFZWwUz6p+UIXXFkMEdJ4/bck93sMamxMAeuXS05elAz2ZrFT/7kj Q==;
X-CSE-ConnectionGUID: jc0+x6IZSZuZwLwyRtTwgw==
X-CSE-MsgGUID: rOsSE9z+TYGBBD5k0N8Kuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26567887"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26567887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 02:33:16 -0700
X-CSE-ConnectionGUID: zukXRzvETneOZqgf0aedjg==
X-CSE-MsgGUID: 47JX+xVhRmilSQa5kmONgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27899592"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 02:33:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 02:33:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 02:33:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 02:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbOgGNs4tVtYBOAccuVK7we41BqZAkUGjNwSwPWIKrxIpivfGpBC62Xe6ZXBqdkATnchyKAYKSKAenr2J2ayB3FQnoXWomiH/511TaV/E8RUpqzPT5E8dEgT81WJQEzKlveJU2vtqY9Lka2hGOBOFm1KLIBJLPqNBjGUcUatlE4iURUal0AyzHL0FzNgggjOUKhfkYBo7oq+OAQ+eC3hHKfuJXkmS07GazcGLjviK6FxgHjeRNDFrQaXtYO46qLBVKKfe1gBBaMmxf2zyvjT8lBkHDvq3Qgk7zDxSoGBhqaxkUsEEMY/lo98eKFCSEG3KJkehydpI/NoW4GOBlkt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXN9tzaCTz61W5Iq8ToXUH3p+NekN0V3D1fws1S0jgM=;
 b=CfvRrebIpLW5z1O+BBFRPntxY0Z/gemzx3lB9MAqhyY3S/i0xFo4vfH0IKoiIjU6467DNfg7hdFMKVfHIZppofUi1QEACUVfWRvxlRNwdrzOanwWpcufmrLSj9MuHelwxTyNJqlaWnB665ZWKoC/J+VhFupnsnXY8aHkk217REVrCbWofnmLvmj8Y3TkUe2x3nMF2cbNEjb60WoVLgKa7D+u1yd4vASpMy9PVz/gyF0oxY+gFV5hc7lBaMLjylH2nIdYt7kBaX3y9Kir8j0lGK4xiq5NykhiHVv9XfwZcqj4IfowuE6EP027xJtVTiYulJVMvrQdOnQPtx7zp22KOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Fri, 19 Apr 2024 09:33:12 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 09:33:12 +0000
Message-ID: <192ce4d6-5f3e-42b1-86f0-e1a040c27f4b@intel.com>
Date: Fri, 19 Apr 2024 15:02:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240419064001.2401850-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0218.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::10) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: bff30f9e-6bf4-468b-bad5-08dc6053bb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjhTMVRkdkJHNkNuWFgveHRDKzUxRFUxTkZwTkhTakJBdmJzcGk0ZXduUTRl?=
 =?utf-8?B?U2FDN3ltMlZzeE9YZnp6bHJlTlRLSUZsMDN6d3BEcHBpVmRSM1RkZy92MHRU?=
 =?utf-8?B?enJYcnBmNjdSM0ZFa1l6R3crY2dLUTNHVkFJMnp1bnU5dVArYWhLbmJ4TUdz?=
 =?utf-8?B?Tm1rcTBkTTA5c3VnM2ZzTStIT3VPZjVSaGEzSW53enRmeFdHRFBtWldLM3VH?=
 =?utf-8?B?OFJDbzZYNkF0TzkxZm44Q0MwbmxJdHh5bUdHTUlxbWw2c1UybVV4dUp1bXla?=
 =?utf-8?B?WDdnZjBwdU9zaGUxbmMrZ3Z1TjJ3Z2kvdzFwSmpHQktPcXdoVUZIT3AveHZJ?=
 =?utf-8?B?c2N2V3VuRDE4cE03OW9KVGsyc3dpUEM3d1NibHNoRStIVzI1cEdNR3NrbEI0?=
 =?utf-8?B?bVM2dGtpUlhPbXFIYnJGV2h4RVNuWFRPejhtdWErblNrTUdYTmttRWg1akJ4?=
 =?utf-8?B?N29TaWF3bnhxSVZJd1p3d3dLSDA5WVFsaWdDcEUwYndFNnFDMXF5emhXZ1l6?=
 =?utf-8?B?dEhIRzFxTzBLaXNpSjRRazB1WDRIc3JMM0tZY29vcnhLMnZtZ0F6WEF5N3FW?=
 =?utf-8?B?OUJ4amhEcDFrR1FCdGlxQlBtNDErdkVnakZZbUJtcUlOb0pab2h6SHNFdC82?=
 =?utf-8?B?M2JNeU41Q2t6RGtJUmRLMEVhOHBHeHZySHZaMUY2MTBvVXVZMEtjU09NU3lN?=
 =?utf-8?B?QjlYdGpDMHpZZW0rNHQ2KzEzeVZ5K0lYL2lCK2NiWno1YWlLc1BucmtNc2dF?=
 =?utf-8?B?aWgrdEUvTjhRQkRyOTVXTjNwQWJOS0pXRFlJOUh0a0hqSWtMQXBOVUE3T1lT?=
 =?utf-8?B?ZXlmREhsRlkvaXJzNFJlRk5Sb0pwUnpjdnNlTW8yNlV6dmZ3Szc1bjNwRy8v?=
 =?utf-8?B?NmNLZjhoeEc4c2RMUjQwam1HSkpOUFkvOVVxUHdKS1JMa2tyOEtoVXNLNlBt?=
 =?utf-8?B?V3dGSmpZcHROZm5ySjNzbnJNRlp6Z0pidkd2cjR2WjFQTE85T2N0Zkt2N0I4?=
 =?utf-8?B?VG1NNHM4NTFKYjZGTC8vMDZ2L01DdnhZY2Vnb1dvRm9uNllaTFdzZXIybFZM?=
 =?utf-8?B?OFFyRDRIRDl4aWJVa3JNeU04cEJham9jalZmdUpUd1lCemVlWUVTUWF0RlUr?=
 =?utf-8?B?ajhKVmwrQzRFVUw5UytpeDNjbGxtc3pRVVdpdVZaS281dy8yMjd0M3RxZzRK?=
 =?utf-8?B?b1JCVmQ4dlQ5cUwxU2VaaHBUdE03RStGVzYyWTdUcTlGdVd4ckc3NEc0bDFs?=
 =?utf-8?B?VjRnbFd1NEZNZUtLWW01WWRJRTNOQ0dCRTdqR1hGTUVENEhPUXdYNkpVZFhj?=
 =?utf-8?B?MjZWM2NKM0FrcC9xcGk0U0NORS9wNzhZbXFUZHF6d2svMjBWaEs3N1dxODhn?=
 =?utf-8?B?blJJb1pmbzh3TnZva0RsWWlTU2NJWVpWRmdHUUY3OXR4UUdvdjBpaWVFaU5W?=
 =?utf-8?B?cGtQTE5RL1cvQ3dVR3ZPZG1UMDA3R2RRU3Z3TVRudU5Xd3NtRC80YlllZkt3?=
 =?utf-8?B?N3BQVGgxRXRqd0VoeDNWTWFScG53c0hmS29KRUloWTFGNHdIV1RRc1FqVXRH?=
 =?utf-8?B?VTh2b0hlaUZDelFVUk9LSUpsc01vWENjSnhGSHRjRC8vSjJXdWRxTTRWQnM2?=
 =?utf-8?B?aTY4UVJTUm5yMjNjUWgzSEZUSjVUUUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHdrSm4xMXNScXhBYXNXa3VSTXZqdHZySWdrZktYSmtoUjAxQXVFRnZIdkNE?=
 =?utf-8?B?THZZMG10SHVFTDJZNEJPRlRoTmVPNktPUGFScHVkWEFFNmtQcWZNdGpHb3k2?=
 =?utf-8?B?ZW43bm1XS3llOVI5WkdYeGZ1d29HL1JUOWJ4T2piU2s4bWkweUxBcGpFK2tv?=
 =?utf-8?B?ZmJNWFFOR2cxdi9IOHdZcUZ4WGRXdGcwN3ZyVGJxTDRsRkE2eWxEdVRjT0hu?=
 =?utf-8?B?MkNTSUNQSkcwZVRQbWpIWDFiSHVHZ0ljQ0p3ZERJVmkvc2lTSXpoTUtVR3do?=
 =?utf-8?B?ZlRFZzVKZmQ2WGU5dlZUajBENStEWWlxdXB2NmJaeEs0KzBTRUZLU0VzS3A1?=
 =?utf-8?B?RkhPbXEzRXRQOVR1ZWlWdk1aZ0RPSG9TN1ZGbnZCamw0cGIvSnpxWjBxekI2?=
 =?utf-8?B?TlhzRTZyd0hlRnZCRHhIZm94RVZtMWNvTnBGdVVNZy9UNFpJRW5lb3JDaUFl?=
 =?utf-8?B?SDYwYzJpOGkyWWsyN2Fibk9sVWxRR1BaTlBTeUdQOUI3bnUyNi83QlA2TEJu?=
 =?utf-8?B?Ry9sVWszdEgzOVIwaEUvemxIZVljSDZOTktLZTRESVpwaVFsMy9ZR0tBaEJN?=
 =?utf-8?B?KzN3bUhnaURKb3R5TTl0enZYc0hKQ2xSZVFvTGNVcXhDdmtpN2tRNjZ4Slln?=
 =?utf-8?B?RC8xWm1xVGY5UWh3VXc1WCt1dGpqRldmejcrOFhlYTcxUDhMS3dLOG53WkU0?=
 =?utf-8?B?dnFHL2ZYYjBtTXRnaUJoTlFyM2FYWkI4RmFoUkNOeEwrYXZaVnkxcEs5cG1n?=
 =?utf-8?B?R0dkanFqZFlaWWJHemVTQzBPUVVncXE1YzVxTkowOEY0N1NQY0taUDBFemNa?=
 =?utf-8?B?MW40ejlOQmpDcTlSTmVSby9pVUE2LzRVWkhoeCt1bVdTRjJXeUNKZnJNUG5S?=
 =?utf-8?B?OHZnUy9hTENnNXoyZkpXZVdRQW9BV3V5dm10YjJOeFdnNWxMaUlSamVmRUh0?=
 =?utf-8?B?NDg4Y0ZtQTFldmptbWdrVkFCTjJQZkMxTWo3bUU0T0hFa3F3clpJemt6cytw?=
 =?utf-8?B?ZVk0VDE2dXgvOUdobUg0akdLZHhMVThTc3M3WW9LdHVodTd1cHZITmZyRG83?=
 =?utf-8?B?aFp6NUpKRVUzWm5MWFZ1cksxc3dRME01ZkorOHZvalovcmpucVhOYncwMVFp?=
 =?utf-8?B?OFVEUUp4MFc3TnNLazdldnViME5WVm13akVnOTBvRkhlR001WFFDRFhuN3Ey?=
 =?utf-8?B?THZhakRTSDZXN2pLOUZ6b2ZkcjR4aXExOVBFVXpMbTJVbHZBelVSOW5WbER1?=
 =?utf-8?B?VkJBQ2NRUDA5VVBtRXVVK1QxMWd3bURLN0pOMmV0NlNrZDlIM1QvRlFMYUJ2?=
 =?utf-8?B?TElmNFUzc291ZGVZOUt3YmFMODZpbFlod2VSeXBTRTRqU25MYjN0QzRLSG5U?=
 =?utf-8?B?djVXSENDbkJXSGNOcHdtcENuRzBqdVpjRWN1Y3lRRWxycFkvQWNSaUFnbkwx?=
 =?utf-8?B?dXFhOEgwcm8zZDJFd2sreU9OQ21wR2VQMGJPVmg1S3BsL2UrM0kyZis4M0x6?=
 =?utf-8?B?c0xNaktZSzk1blJ3Qm40YzBFRkx5NGI4SFk5VWVGMHhsb1J1SzdhM0tKMVZX?=
 =?utf-8?B?bCthb3B2bUZldDh1bE1Yb0dJUjRZRk9GSE1aZ3J3S0VZZXNzUjR3TGMvcjdu?=
 =?utf-8?B?dWVtaXppdlpXRzJ4bERrdVFpZmRUVE5Ga1dNZXVEbUtRYUhrUlRGM2tjNWN5?=
 =?utf-8?B?ZXN3bVFHMndOdGR6VzBwcVFzVWlVZlhnNVRNMXhaYnNyMWxhKy9VZEJUVzJG?=
 =?utf-8?B?cHlkanJZeUFYU0hXdHI5QkdVYTNzWGZGZ2RzcjI2VXpmcGl1OHQ1QytINXMw?=
 =?utf-8?B?WWZFQU53WDVQUXRCT3lITmQ3cENZVnNGVm50UjdpOURuMkoxbHlCMHJQMk1O?=
 =?utf-8?B?U2cxODhtWWdBUS9SemV1clpkNERTWnU1dlhMYTdTZU5YaG01RXhYSXNuMDhM?=
 =?utf-8?B?L1ZXOCtXTmZ2TE5UYUM2U1NuQ3NtVEtQZ2FabjZYNVFadDdYdGxEYmNuWHQy?=
 =?utf-8?B?aG5yZjhJd0pwbUZHd1NUcmx0U29Ra244K3FXbFpucUlZck9hS2VTcCtNTUhW?=
 =?utf-8?B?bEJ5bzBZVUVJY1llbnIyMGk4UzlNQ0toNURQbnhIajZNVDNuTm5IK0JLcDNx?=
 =?utf-8?B?QnRIRGY5NDBMbkRBUGowdnRmRDB6amliT25IOUtNMEZPZG5YUFBtbjdTQU1K?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bff30f9e-6bf4-468b-bad5-08dc6053bb3c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 09:33:12.3193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq5cb/Q0IiAyJppL3tqxEiEzF3CIiGs+e1VLgTY3EwJ89AQb6PAuuZFZrlLM2EsAYBdcQ9nFI3OCOCXmVXUUkoGn+m32poMXsS6u8RmUNzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
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


On 19-04-2024 12:09 pm, Kunal Joshi wrote:
> kmd exposes debugfs for all the platforms, so add

This is not correct, KMD exposes the debugfs if display ver >= 11 and 
the connector type is eDP or DP [*].

[*]: 
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/i915/display/intel_display_debugfs.c#n1542 


> a check in igt
> 
> v2: dsc is required for gen12, so test only
> for devid 13 and 13+ (Ankit)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   lib/igt_kms.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3216fe7e4..378c97f88 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6246,6 +6246,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
>   	char buf[512];
>   	int debugfs_fd, ret;
>   
> +	/*
> +	 * bigjoiner is supported on display>= 12 with and only on
-----------^
Nit: Use capital letter

Incomplete sentence: With what?

s/and/or/

- Bhanu

> +	 * Pipe A for Display 11
> +	 * For simplicity avoid Display 11 and 12, check for >= 13
> +	 */
> +	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
> +		return false;
> +
>   	igt_assert_f(output->name, "Connector name cannot be NULL\n");
>   	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
>   	if (debugfs_fd < 0)
