Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA20C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 12:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712EF10E5E8;
	Wed, 31 Jul 2024 12:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToRMnfg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4231710E619
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722428781; x=1753964781;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=9qrDb//s0K2I4vg8DWqV3e9yo4kxr2ZFTqaLSe8HfGI=;
 b=ToRMnfg3kcnKVC4YAOYuy6dfrcQkvtEjIoxBOYSsbZpvO5L79HLBjN6T
 uBssAaIJnI66qnS0fqSaF2LzGkiHNPEeJq+SYIfGPqByaRV+FqWMZAHzO
 jTzBlLsWElV+A1wjPFpnd6ae8cWKUuyYbznkpvuNnQyRu5E8oW8CPY8vT
 Z4u0niw1hlXY6EXAJe3dSJh7WV//vLrdVhAL8R0P8lYN/UGVYu2ocpaQG
 A8PjuI8dXw5D2snWtGe/jvSzCjBbuu7pbgnDn/no1BFzjY46MTAM4xNdy
 5HuwjjjPGfkThgs8dbmJE3J6Uh9CvWEOHxHewGxbJEDw79T06kudV1N1b Q==;
X-CSE-ConnectionGUID: /VSu4eGXTCyZgzq/kQX+zg==
X-CSE-MsgGUID: 1qgIqvOOQB2RnYgqumGFpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37775200"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37775200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 05:26:20 -0700
X-CSE-ConnectionGUID: 53D/Y9jWRfufYcCPRT7/2g==
X-CSE-MsgGUID: kUQrveBrRFCJYn4RfrnhoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54665859"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 05:26:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 05:26:19 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 05:26:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 05:26:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 05:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcqA81Zlz7PTN8sQKtKxSfOAeMXsUdX4zoSTxCQeutEW2gN48jzoH7H4Aqr7ymVjZpLrBbXKnR8bfwSS9CHmzMZK5z/x+Oqfe5dWY7lRoXx8QW2Codb39kBqBP1SWZAD9Hkr+6fAQHNkM8B4bcH0HanQhLnbM4IiP71b6DewsntUS8+IFsS3ek73LttTq/8YX5Ugl+ESPgMMl7RQZ8G3TRFhQWJcw8/I35cAZymJIKyl9BbSqaO2btFtCIvF1c2puse73SUzXG+Dh2lbJ2lsqAbnOjwHVZJZ2pOC8BWkYZC90/3kUSqZ3voWQCF9I5m6tv/J6Pls7ZScP6gOWRKteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DQav5Kef/55Pz6X3Vs6knhSE48MZtwb/KIVqJ3JipQ=;
 b=rCOjjN+XpIhokiwTXJZ07Sf2atc4lCeRMqNzRr/AvfuVEqBJ+cu4GOOsRsPJgSUwcj9/A0DbFJ5sfGIpSLlq+oND4H/ChoCvc6PoGw5RK6w9V7dhlEnLfokYnQYz0LDSZMko5IOnbkt5Bob1lZIJ6HJIYraX7reb049aKT3d47FHDjcOv+LFjKhqNbB19xWDHX+tDCbTcExzaVrI6xUddBM3bNP2DwzFG6J1siLZYx8FgLRb08pQK+HwsvCTETEezShCwc35pCxzsbNZSslSuxztwZy78y8zcMrEHn6PgAb+oMzh845vMx5P3du8+Lyo3SUshdzVFXVevq9aLTvrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.32; Wed, 31 Jul
 2024 12:26:14 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 12:26:14 +0000
Date: Wed, 31 Jul 2024 17:55:48 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t,2/2] tests/intel: Apply igt.cocci transforms
Message-ID: <Zqos_4qdA2BniRuj@bvivekan-mobl2>
References: <20240729220251.3353533-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240729220251.3353533-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SG3P274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::31)
 To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4f5013-3543-4d74-d460-08dcb15bf827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z05obVJVNXRlRDNWU3lkQ1JSRjhESTFpa25oR1NEbHFSL3RueGRqMDQ5YU81?=
 =?utf-8?B?M0Q3WjBDb1FYbnkycEt1R3lKVjQxakJ1VHZsenkrOTNtcno5MjFBNkp0MW44?=
 =?utf-8?B?c3VCOTJDYUxIVERJeDVsSXJybWorOVdpTHBjdG5NYXZCckZNK3VIbm9RZEtt?=
 =?utf-8?B?L1g5K3Y3WlFxQ0RXN0x3RjhDUWtmVEFwQWo0T3hsTjkyTlYwU3IwRnVUVWFW?=
 =?utf-8?B?ZFVQS2ZyTTZ5VXhOMWlCdVNVNjJTTHdWKzFvdE1wbU9McXNUdGpyYXd2b3Jm?=
 =?utf-8?B?T2h4dmFOOTRQZUxyYzdBVGhDbm9LN2gvcjU3NkZNVlVpNjVBY214bUFRTHNL?=
 =?utf-8?B?REYvRXcrcnhVTEp3bE8za3huODhOUWVRZEJTWWNLTEpRQ1BpeFJ3U2Ewb1ND?=
 =?utf-8?B?T3k3cHdiY294YzVLUjFGZ2tmRGNKTzJ6ZGxJWGhuR3IrRVFJd3d0ZGZ2clUx?=
 =?utf-8?B?SkpEVWpJZSthbmJNbmVsaHA1T25PUE1mWCt2RkVXcjJoclQyMi9rSWt3YkNp?=
 =?utf-8?B?STEwMUQ0NFp0cElxMHRWZzBOYnJ1V242VEczbWs3NzUzZjlMbWYzNmVnUU9J?=
 =?utf-8?B?S0NOUyt1b0ZuVXExYUxGV09tYnppWjdaeUJUallKaWdFYlRIZTlQcUtpc2dT?=
 =?utf-8?B?Q2JpVFlNNVhYUkl1NERvNjczMDkrMnZXRlpPMUFPNVJpQTRMa3hFYWx6S00z?=
 =?utf-8?B?SXJBYlNlS3FUVUZUTEROQy9UcVhqdDZNb3RuRFpNSjZEZHNPejlBWUhoMGZK?=
 =?utf-8?B?ZlU2WkNuQUNaeldkcGdCT1pXaVg3NWh6cUwraGRXVklYcTg0T0c4S2doRnJJ?=
 =?utf-8?B?aHRMV2wwMjZaYlppMzNvZlAydEFMWkNqUmgyVEoxdW9TZG5Xb0tXUXJmZCtl?=
 =?utf-8?B?S1orMlhRVjRNT3RYK1VzTEk5T1cxK3lJMEdMazJqamVRVEJIclZET0k4QVFt?=
 =?utf-8?B?aVRqN3VsYUhmRnZ5VzVmblJudWVlMzUyNFRVQ1NkU0pQa0NlRmM0b2d3ZlNj?=
 =?utf-8?B?YS93ZmZleGs4cSthWHdKMkc2L0wvRWxBZjZBU1c2VzExQ1BzNkdYNUVmMWp5?=
 =?utf-8?B?SytFcEdJanY2SVFsa0dDM2QrYnljTi9RdWR0bEJsMno0Vld1QlVURGp2NGNz?=
 =?utf-8?B?bWZhN2hyaGZaWmY1S3FDa2tVVFdNRXYxYm1JSVRZOUpWMUgreUNnT1FRUVh4?=
 =?utf-8?B?RVI2QWpaV3dTZHptMGRnNDUwcUppd3BpbWlqZ2lPMHViUXc0cElsTjRZM0sv?=
 =?utf-8?B?Y1lWT0Njd0xvbXMzWkpYNzJEMnZYS1F0ZWpKVDEwRXZjUXpkSi9HaXFZMnZM?=
 =?utf-8?B?dVBoZVpUemN5SjkyZUI4TDY5RFRLNVNjdElSRm9Scm1NaWpRSlV5empWMkw2?=
 =?utf-8?B?RnhSb3prYnV0dnRIRzhkM2JpWk9MeisvekF6ck9SeHhubThoM1Jib1hHVytX?=
 =?utf-8?B?bnB2bE9xNXgwWnNjeFdsTXNTZk55VlgzYW9HZkx4QWx3WUJXNjFLS3NKYmYw?=
 =?utf-8?B?REVUeU9mVjhKcnp2VVdhelNNeXZiSm1SZ242ZHBTa0h1ZkVUT09wSk5sVDk4?=
 =?utf-8?B?V0hTSGM5Q0l4dUlaK1ppNlR3Y2t3YTFnUDdTcVVCMk9YOCtEQjhxTEFueXQ1?=
 =?utf-8?B?UWYwejZJOVhTR1NTZ1ZCN2RQQTF5QytkVGs0R2lUd1IzVk80SFhjbHZhYUFW?=
 =?utf-8?B?ZTJZQ2ZZL2tuVDNmM0xmMkpOVFhDNEFIUlRMaSt4amlLK3RYUkdRcHRjSHdy?=
 =?utf-8?B?S2dJOXgwZTcrRVZia0oyZFF6RVlVUDA5aVZrS29vbkl6SHlnVzFhbTlHM3M0?=
 =?utf-8?B?NXdGdklsTXNFSUdWTWJuQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEkyeHVLaVZ4S0VCUTF1b29JeWVrVmZ1aDZjNWZxT0JHejk1cCtYYkdSdWZn?=
 =?utf-8?B?SGNGRWFYQXppNURkYURudWtodDFrRmxDODM3RThxblYwcGFJVVpQbmQvOUha?=
 =?utf-8?B?dkt0aGRpMEU5MVRUbi90aXJGa24zR3N3Vy9qOXJ3RUxLblJKUHlCS1pVelUz?=
 =?utf-8?B?RkRSSDBaVkZNeTF4WEtZWFJPbnFHYzhUWEpJUXZNWkk0c1VFd1VMQkFCa1B2?=
 =?utf-8?B?MGowT0ZGdnYxVTNUbytOSEtXNm1ENWpXeHBOazdIeTB1Ry9LNGJYVFVkSndV?=
 =?utf-8?B?aUxQbHJSbjNtYStNTlhPV0hoRkQ4ekcrc2ZyeTdDVHhEelRaM2phVUJ4TkZG?=
 =?utf-8?B?V1ZwTlVJQ1hZSU1uekxKcmhNYWl3bEoyMmQzRndwVXFFQmlmZGlQaUY1Mk5a?=
 =?utf-8?B?YUZoKzZhVW0yQWUwRUxyWVMxZVk3QnNGYzVabGc3M1I1Qyt3RW5nWjdIQW1J?=
 =?utf-8?B?YTZ6L1FDdG5pUTdhN3BBZHhkSmpvVXdFK3VpYThsaTZOWXFxWTgwelBWc1hz?=
 =?utf-8?B?WXl3ejlyK3hHeDZrOVpqWWl4aU5uT2Y5aWE0cXdPNitPSGIzUEVSVWIxOVJo?=
 =?utf-8?B?Q2NnMTQ1U0JmellqVllZVE9hTWdvSkYxd0syMkVxWmNXdnhnWXlEZ3FQY1FS?=
 =?utf-8?B?OFZpb1VNQzJyeDlVdjhKMnExTGlqOG5HWUVmTkhCVkNENkN1dWhKMG9HME9o?=
 =?utf-8?B?ZDdpSUIyNHBNM3kwWHhYRW4vNFQvU2FvTWh5YjROYmlOOVNWRTVSdjJwL01F?=
 =?utf-8?B?bWE4S09NRFA2enV5Y1Q3d3ZEdnNHbVNNUmMvdTZ4ckF3dFRtazdkREpLNHFD?=
 =?utf-8?B?RytoR1RIUWgybFFKOTFlZ3V3NE9zNkhQeUFhRFlIMi9tclZrUE9pbEhORkFM?=
 =?utf-8?B?OURzbnVHSFRLSndUKzRoNGhWL2hEdHRnaktURXhSY1NRWW5oSkt4WG5EcCtM?=
 =?utf-8?B?OXR5TTBaM3lhQjFjTEowbFdySzB3RGFqazVKaG1rUmY5Mlc4QzhQTTZTOStV?=
 =?utf-8?B?MHE0TmpGTkQ5Q0lBSysrZm1qNUIyS0daWEdoaHpOZ1VtRFpiY2hWYk1Zbzht?=
 =?utf-8?B?UmtyWnNzaHg3L2NRc0VCMWtsRlZ1dXplZndtck15K0IvTWE5SWJtdlRKb3do?=
 =?utf-8?B?RXRVWHJiS0dKMWNOelpIZWYvQzhZK3FSNG1kM2N5V2Y1OUdVY1ZKSVU3NTRH?=
 =?utf-8?B?bDZuZWsySkxIQ3BOaVBuOHdGbmxiNDJaSFNYL2xVc0N6dHZveEladExpYVdz?=
 =?utf-8?B?SHBGVTNRK2xRclBUVitzVFQ4VlcxUDgwd2UxQlJPZ0pnRkEweFZVaTJVOEt5?=
 =?utf-8?B?d1dLaHpIL3paKzBZdEhMRjhJbkFXblVqMG1hV01zQm5BRUx1Q2RGZmhuVnI4?=
 =?utf-8?B?aW95Y0I5UVkzVjNMUWpFeXBGZFJkUnZtbmZDVDUwdVRSc21Dd3lTZGhoMDJZ?=
 =?utf-8?B?WlgyNk1RVXYySGhBYW5CcDNwYjVMd3ZIcy9LREppTjNnc0dJUTREZnlqTjlj?=
 =?utf-8?B?WXZURWxsRlpNSnZHSDN2dGw1NUtNREtMMFlpQ3VZZWhiUmo2Sm5yRU5oUUhI?=
 =?utf-8?B?c3B0VTBYL1hoLzhLbGhsV253NFBhWXJpcnhRekxNSkxzakNydlJieUlzMWdw?=
 =?utf-8?B?U0dxYk5kZjM1MXg5Y3NRUWJWSlY1WU0yRUFDSWM2N2o0UXFzVjBvWlZHYVg2?=
 =?utf-8?B?bHpERUh0WGh5RG5MZDgwQko1NCtDWEVTWDlpWmlvR1dLRXZBenNvQ0RZdzNy?=
 =?utf-8?B?L1ZMcW9HRWt3Wks2WHlJMWtVVzNSdllNV0RaY3ZmQUxpdTR6a2QzM2NHdjEv?=
 =?utf-8?B?aHVvNC9Tc3lsQmd3MklJOHYvaDdPWUxCR3Yxam9WZm1EUzYvbmNZcENyUkhn?=
 =?utf-8?B?R1g2bFJtanNQZjA2eVRYZll6a0krelV0R2JBekc3R055bTRTRUpQdkZwM3JR?=
 =?utf-8?B?MzVva0Vld3E5dExUejZoMnhjeGRnbmErMG9ZRnR2ZVNWRThsUk14OUR1VnRz?=
 =?utf-8?B?Q29aNnpzRTV5V0Y3YW5PUnJOc3h3RWhJNUtUcnJ0cjdWVGJpbjFiaVk0elhW?=
 =?utf-8?B?Z0EzSlZjeW0xQjFnd2J5dkk3UVJBM2pzV3BGRElQK0tKTGVoNmxTSzRpRENV?=
 =?utf-8?B?VTRySlFySTBpKzFMeUwzTG5nRFFqVzgza09rMVBQaGpmYVJwN0pRZHRyS0p0?=
 =?utf-8?Q?HGxOMOi4+KwoX2P3m0DHhx4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4f5013-3543-4d74-d460-08dcb15bf827
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:26:14.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPVAB2gQv0sSyKRI0lLo7v5uWfq0nPYhwDnuikptWDN0Zs8F+aIZTku6mToQwqM41KwjxUyWuFUcPrHTcSvSeOODBqnyWdd0KnfOM4q+7ksz7wxR5jxaRhOn7pXr59QF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
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

On 29.07.2024 15:02, Matt Roper wrote:
> A number of Intel tests are using checks like "igt_assert(x < y)" rather
> than using the dedicated comparison assertions that print the actual
> values on assertion failure.  Run the Intel test directory through
> Coccinelle to apply these conversions and also apply some other general
> coding style cleanup:
> 
>        spatch --in-place --sp-file lib/igt.cocci tests/intel

There are some places in the code, where still igt_assert is retained
like these lines from file gem_ctx_create.c

```
shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
igt_assert(shared != MAP_FAILED);
```

Are these unspotted by Coccinelle?

Regards,
Bala


> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  tests/intel/api_intel_allocator.c   | 12 ++---
>  tests/intel/api_intel_bb.c          | 18 +++----
>  tests/intel/drm_fdinfo.c            |  8 +--
>  tests/intel/gem_blits.c             | 16 +++---
>  tests/intel/gem_ccs.c               |  4 +-
>  tests/intel/gem_close_race.c        |  2 +-
>  tests/intel/gem_concurrent_all.c    |  8 +--
>  tests/intel/gem_create.c            |  2 +-
>  tests/intel/gem_ctx_create.c        |  8 +--
>  tests/intel/gem_ctx_exec.c          |  4 +-
>  tests/intel/gem_ctx_persistence.c   | 12 +++--
>  tests/intel/gem_eio.c               |  8 +--
>  tests/intel/gem_exec_alignment.c    |  6 ++-
>  tests/intel/gem_exec_big.c          |  4 +-
>  tests/intel/gem_exec_capture.c      |  8 +--
>  tests/intel/gem_exec_fair.c         | 32 +++++++-----
>  tests/intel/gem_exec_fence.c        |  2 +-
>  tests/intel/gem_exec_gttfill.c      |  4 +-
>  tests/intel/gem_exec_nop.c          |  2 +-
>  tests/intel/gem_exec_reloc.c        |  4 +-
>  tests/intel/gem_gtt_speed.c         |  2 +-
>  tests/intel/gem_linear_blits.c      |  6 +--
>  tests/intel/gem_pread.c             |  5 +-
>  tests/intel/gem_pwrite.c            |  5 +-
>  tests/intel/gem_pxp.c               | 16 +++---
>  tests/intel/gem_reset_stats.c       |  8 +--
>  tests/intel/gem_softpin.c           |  8 ++-
>  tests/intel/gem_tiled_blits.c       |  6 +--
>  tests/intel/gem_tiled_fence_blits.c |  4 +-
>  tests/intel/gem_userptr_blits.c     |  4 +-
>  tests/intel/gem_wait.c              |  8 +--
>  tests/intel/gem_watchdog.c          |  2 +-
>  tests/intel/i915_hangman.c          |  2 +-
>  tests/intel/i915_module_load.c      |  6 +--
>  tests/intel/i915_pm_freq_api.c      | 50 +++++++++---------
>  tests/intel/i915_pm_rc6_residency.c |  4 +-
>  tests/intel/i915_pm_rps.c           | 11 ++--
>  tests/intel/i915_query.c            | 12 ++---
>  tests/intel/kms_big_fb.c            |  2 +-
>  tests/intel/kms_busy.c              |  2 +-
>  tests/intel/kms_ccs.c               |  2 +-
>  tests/intel/kms_cdclk.c             |  5 +-
>  tests/intel/kms_dsc_helper.c        |  4 +-
>  tests/intel/kms_fbcon_fbt.c         |  3 +-
>  tests/intel/kms_pm_dc.c             |  9 ++--
>  tests/intel/kms_pm_rpm.c            |  2 +-
>  tests/intel/kms_psr.c               | 18 +++----
>  tests/intel/perf.c                  | 34 ++++++------
>  tests/intel/perf_pmu.c              | 37 +++++++------
>  tests/intel/xe_ccs.c                |  4 +-
>  tests/intel/xe_debugfs.c            |  2 +-
>  tests/intel/xe_dma_buf_sync.c       |  2 +-
>  tests/intel/xe_evict.c              |  4 +-
>  tests/intel/xe_exec_balancer.c      |  7 +--
>  tests/intel/xe_exec_basic.c         |  4 +-
>  tests/intel/xe_exec_compute_mode.c  |  9 ++--
>  tests/intel/xe_exec_fault_mode.c    |  5 +-
>  tests/intel/xe_exec_reset.c         |  8 +--
>  tests/intel/xe_exec_store.c         |  2 +-
>  tests/intel/xe_exec_threads.c       | 11 ++--
>  tests/intel/xe_gt_freq.c            | 80 ++++++++++++++---------------
>  tests/intel/xe_intel_bb.c           | 16 +++---
>  tests/intel/xe_oa.c                 | 26 +++++-----
>  tests/intel/xe_pat.c                |  2 +-
>  tests/intel/xe_peer2peer.c          |  2 +-
>  tests/intel/xe_pm.c                 | 16 +++---
>  tests/intel/xe_pm_residency.c       |  4 +-
>  tests/intel/xe_query.c              | 12 ++---
>  tests/intel/xe_vm.c                 |  6 +--
>  69 files changed, 335 insertions(+), 328 deletions(-)
> 
> diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
> index 9218be3b9..15ba4828c 100644
> --- a/tests/intel/api_intel_allocator.c
> +++ b/tests/intel/api_intel_allocator.c
> @@ -705,7 +705,7 @@ static void execbuf_with_allocator(int fd)
>  		gem_close(fd, object[i].handle);
>  	}
>  
> -	igt_assert(copied == magic);
> +	igt_assert_eq_u32(copied, magic);
>  	igt_assert(intel_allocator_close(ahnd) == true);
>  }
>  
> @@ -776,13 +776,13 @@ static void gem_pool(int i915)
>  	bb[0] = single_exec_from_pool(i915, ahnd, 4096);
>  	gem_sync(i915, bb[0]);
>  	bb[1] = single_exec_from_pool(i915, ahnd, 4096);
> -	igt_assert(bb[0] == bb[1]);
> +	igt_assert_eq_u32(bb[0], bb[1]);
>  
>  	bb[2] = single_exec_from_pool(i915, ahnd, 8192);
>  	gem_sync(i915, bb[2]);
>  	bb[3] = single_exec_from_pool(i915, ahnd, 8192);
> -	igt_assert(bb[2] == bb[3]);
> -	igt_assert(bb[0] != bb[2]);
> +	igt_assert_eq_u32(bb[2], bb[3]);
> +	igt_assert_neq_u32(bb[0], bb[2]);
>  
>  	spin = igt_spin_new(i915,
>  			    .ahnd = ahnd,
> @@ -792,8 +792,8 @@ static void gem_pool(int i915)
>  	bb[2] = single_exec_from_pool(i915, ahnd, 8192);
>  	bb[3] = single_exec_from_pool(i915, ahnd, 8192);
>  	igt_spin_free(i915, spin);
> -	igt_assert(bb[0] != bb[1]);
> -	igt_assert(bb[2] != bb[3]);
> +	igt_assert_neq_u32(bb[0], bb[1]);
> +	igt_assert_neq_u32(bb[2], bb[3]);
>  
>  	put_ahnd(ahnd);
>  
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 6cb5d4f9e..db039dc3b 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -1024,11 +1024,11 @@ static int __do_intel_bb_blit(struct buf_ops *bops, uint32_t tiling)
>  
>  	/* We'll fail on src <-> final compare so just warn */
>  	if (tiling == I915_TILING_NONE) {
> -		if (compare_bufs(&src, &dst, false) > 0)
> -			igt_warn("none->none blit failed!");
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) > 0,
> +			      "none->none blit failed!");
>  	} else {
> -		if (compare_bufs(&src, &dst, false) == 0)
> -			igt_warn("none->tiled blit failed!");
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) == 0,
> +			      "none->tiled blit failed!");
>  	}
>  
>  	fails = compare_bufs(&src, &final, true);
> @@ -1367,11 +1367,11 @@ static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
>  
>  	/* We'll fail on src <-> final compare so just warn */
>  	if (tiling == I915_TILING_NONE) {
> -		if (compare_bufs(&src, &dst, false) > 0)
> -			igt_warn("%s: none->none failed!\n", __func__);
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) > 0,
> +			      "%s: none->none failed!\n", __func__);
>  	} else {
> -		if (compare_bufs(&src, &dst, false) == 0)
> -			igt_warn("%s: none->tiled failed!\n", __func__);
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) == 0,
> +			      "%s: none->tiled failed!\n", __func__);
>  	}
>  
>  	fails = compare_bufs(&src, &final, true);
> @@ -1535,7 +1535,7 @@ static void test_crc32(int i915, const intel_ctx_t *ctx,
>  
>  		put_offset(ahnd, data);
>  		gem_close(i915, data);
> -		igt_assert(cpu_crc == gpu_crc);
> +		igt_assert_eq_u32(cpu_crc, gpu_crc);
>  	}
>  
>  	put_ahnd(ahnd);
> diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
> index a790f9255..160dc3d0a 100644
> --- a/tests/intel/drm_fdinfo.c
> +++ b/tests/intel/drm_fdinfo.c
> @@ -275,7 +275,7 @@ static void log_busy(unsigned int num_engines, uint64_t *val)
>  		int len;
>  
>  		len = snprintf(p, rem, "%u=%" PRIu64 "\n",  i, val[i]);
> -		igt_assert(len > 0);
> +		igt_assert_lt(0, len);
>  		rem -= len;
>  		p += len;
>  	}
> @@ -805,7 +805,7 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
>  		buf[count - 1] = 0;
>  	close(fd);
>  
> -	return count > 0 ? count : 0;
> +	return max(count, 0);
>  }
>  
>  /*
> @@ -855,7 +855,7 @@ test_memory(int i915, struct gem_memory_region *mr, unsigned int flags)
>  
>  	gem_quiescent_gpu(i915);
>  	ret =  __igt_parse_drm_fdinfo(dir, buf, &info, NULL, 0, NULL, 0);
> -	igt_assert(ret > 0);
> +	igt_assert_lt(0, ret);
>  	igt_require(info.num_regions);
>  	memcpy(&prev_info, &info, sizeof(info));
>  	memcpy(&base_info, &info, sizeof(info));
> @@ -905,7 +905,7 @@ test_memory(int i915, struct gem_memory_region *mr, unsigned int flags)
>  		ret =  __igt_parse_drm_fdinfo(dir, buf, &info,
>  					      NULL, 0,
>  					      region_map, ARRAY_SIZE(region_map));
> -		igt_assert(ret > 0);
> +		igt_assert_lt(0, ret);
>  		igt_assert(info.num_regions);
>  
>  		read_fdinfo(fdinfo_buf, sizeof(fdinfo_buf), dir, buf);
> diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
> index 5ca81fbfe..b2af48ef1 100644
> --- a/tests/intel/gem_blits.c
> +++ b/tests/intel/gem_blits.c
> @@ -267,7 +267,7 @@ static void buffer_set_tiling(const struct device *device,
>  		batch[i++] = obj[1].offset >> 32;
>  
>  	if ((tiling | buffer->tiling) >= T_YMAJOR) {
> -		igt_assert(device->gen >= 6);
> +		igt_assert_lte(6, device->gen);
>  		batch[i++] = MI_FLUSH_DW_CMD | 2;
>  		batch[i++] = 0;
>  		batch[i++] = 0;
> @@ -415,7 +415,7 @@ static bool blit_to_linear(const struct device *device,
>  		batch[i++] = obj[1].offset >> 32;
>  
>  	if (buffer->tiling >= T_YMAJOR) {
> -		igt_assert(device->gen >= 6);
> +		igt_assert_lte(6, device->gen);
>  		batch[i++] = MI_FLUSH_DW_CMD | 2;
>  		batch[i++] = 0;
>  		batch[i++] = 0;
> @@ -542,11 +542,9 @@ static bool buffer_check(const struct device *device,
>  			continue;
>  
>  		for (int x = 0; x < buffer->width; x++) {
> -			if (row[x] != model[x] && num_errors++ < 5) {
> -				igt_warn("buffer handle=%d mismatch at (%d, %d): expected %08x, found %08x\n",
> -					 buffer->handle,
> -					 x, y, model[x], row[x]);
> -			}
> +			igt_warn_on_f(row[x] != model[x] && num_errors++ < 5,
> +				      "buffer handle=%d mismatch at (%d, %d): expected %08x, found %08x\n",
> +				      buffer->handle, x, y, model[x], row[x]);
>  		}
>  	}
>  
> @@ -664,7 +662,7 @@ blit(const struct device *device,
>  		height = dst->height - dst_y;
>  
>  	if (dst->caching) {
> -		igt_assert(device->gen >= 3);
> +		igt_assert_lte(3, device->gen);
>  		igt_assert(device->llc || !src->caching);
>  	}
>  
> @@ -764,7 +762,7 @@ blit(const struct device *device,
>  		batch[i++] = obj[1].offset >> 32;
>  
>  	if ((src->tiling | dst->tiling) >= T_YMAJOR) {
> -		igt_assert(device->gen >= 6);
> +		igt_assert_lte(6, device->gen);
>  		batch[i++] = MI_FLUSH_DW_CMD | 2;
>  		batch[i++] = 0;
>  		batch[i++] = 0;
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index 6ced67d7a..07aa6d322 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -175,7 +175,7 @@ static void surf_copy(int i915,
>  	gem_sync(i915, blt.dst.handle);
>  	WRITE_PNG(i915, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>  	result = memcmp(src->ptr, dst->ptr, src->size);
> -	igt_assert(result != 0);
> +	igt_assert_neq(result, 0);
>  
>  	/* retrieve back ccs */
>  	memcpy(ccsmap, ccscopy, ccssize);
> @@ -601,7 +601,7 @@ static int opt_handler(int opt, int opt_index, void *data)
>  	case 'f':
>  		param.compression_format = atoi(optarg);
>  		igt_debug("Compression format: %d\n", param.compression_format);
> -		igt_assert((param.compression_format & ~0x1f) == 0);
> +		igt_assert_eq((param.compression_format & ~0x1f), 0);
>  		break;
>  	case 'p':
>  		param.write_png = true;
> diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
> index 9edcf13eb..c68e2fa73 100644
> --- a/tests/intel/gem_close_race.c
> +++ b/tests/intel/gem_close_race.c
> @@ -307,7 +307,7 @@ static void multigpu_threads(int timeout, unsigned int flags, int gpu_count)
>  		struct drm_gem_open name;
>  		int fd = __drm_open_driver_another(gpu, DRIVER_INTEL);
>  
> -		igt_assert(fd > 0);
> +		igt_assert_lt(0, fd);
>  
>  		igt_fork(child, size)
>  			thread(fd, name, timeout, flags);
> diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
> index dbb7622d3..acc6a230d 100644
> --- a/tests/intel/gem_concurrent_all.c
> +++ b/tests/intel/gem_concurrent_all.c
> @@ -306,7 +306,7 @@ userptr_create_bo(const struct buffers *b)
>  	igt_assert(ptr != (void *)-1);
>  	userptr.user_ptr = to_user_pointer(ptr);
>  
> -	do_or_die(drmIoctl(fd, DRM_IOCTL_I915_GEM_USERPTR, &userptr));
> +	do_ioctl(fd, DRM_IOCTL_I915_GEM_USERPTR, &userptr);
>  	buf = intel_buf_create_using_handle_and_size(b->bops, userptr.handle,
>  						     b->width, b->height, 32, 0,
>  						     I915_TILING_NONE, 0,
> @@ -497,7 +497,7 @@ vgem_create_bo(const struct buffers *b)
>  	struct dmabuf *dmabuf;
>  	uint32_t handle;
>  
> -	igt_assert(vgem_drv != -1);
> +	igt_assert_neq(vgem_drv, -1);
>  
>  	vgem.width = b->width;
>  	vgem.height = b->height;
> @@ -915,7 +915,7 @@ static void buffers_create(struct buffers *b)
>  	igt_assert(b->bops);
>  
>  	buffers_destroy(b);
> -	igt_assert(b->count == 0);
> +	igt_assert_eq(b->count, 0);
>  	b->count = count;
>  
>  	ahnd = alloc_open();
> @@ -941,7 +941,7 @@ static void __buffers_create(struct buffers *b)
>  {
>  	b->bops = buf_ops_create(fd);
>  	igt_assert(b->bops);
> -	igt_assert(b->num_buffers > 0);
> +	igt_assert_lt(0, b->num_buffers);
>  	igt_assert(b->mode);
>  	igt_assert(b->mode->create_bo);
>  
> diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
> index 26cd6e32e..ca39a8b64 100644
> --- a/tests/intel/gem_create.c
> +++ b/tests/intel/gem_create.c
> @@ -637,7 +637,7 @@ static void create_ext_set_pat(int fd)
>  	 * This means that we are on a Meteor Lake and the PAT
>  	 * index is already supported by the running i915
>  	 */
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	/*
>  	 * {set|get}_caching ioctl should fail for objects created with set_pat
> diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
> index 6afb10a7b..0332ecbb9 100644
> --- a/tests/intel/gem_ctx_create.c
> +++ b/tests/intel/gem_ctx_create.c
> @@ -297,18 +297,14 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
>  {
>  	uint32_t *a = array, tmp;
>  
> -	tmp = a[i];
> -	a[i] = a[j];
> -	a[j] = tmp;
> +	igt_swap(a[i], a[j]);
>  }
>  
>  static void xchg_ptr(void *array, unsigned i, unsigned j)
>  {
>  	void **a = array, *tmp;
>  
> -	tmp = a[i];
> -	a[i] = a[j];
> -	a[j] = tmp;
> +	igt_swap(a[i], a[j]);
>  }
>  
>  static unsigned __context_size(int fd)
> diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
> index f3e252d10..a45a7e378 100644
> --- a/tests/intel/gem_ctx_exec.c
> +++ b/tests/intel/gem_ctx_exec.c
> @@ -346,7 +346,7 @@ static void nohangcheck_hostile(int i915)
>  						IGT_SPIN_FENCE_OUT));
>  
>  		new = fill_ring(i915, &spin->execbuf);
> -		igt_assert(new != -1);
> +		igt_assert_neq(new, -1);
>  		spin->out_fence = -1;
>  
>  		if (fence < 0) {
> @@ -362,7 +362,7 @@ static void nohangcheck_hostile(int i915)
>  		}
>  	}
>  	intel_ctx_destroy(i915, ctx);
> -	igt_assert(fence != -1);
> +	igt_assert_neq(fence, -1);
>  
>  	err = 0;
>  	if (sync_fence_wait(fence, MSEC_PER_SEC)) { /* 640ms preempt-timeout */
> diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
> index 90c1e0112..8d4a874d4 100644
> --- a/tests/intel/gem_ctx_persistence.c
> +++ b/tests/intel/gem_ctx_persistence.c
> @@ -1093,10 +1093,12 @@ static void test_processes(int i915)
>  
>  			/* Wait until we are told to die */
>  			pid = getpid();
> -			write(p[i].sv[0], &pid, sizeof(pid));
> +			igt_assert_eq(write(p[i].sv[0], &pid, sizeof(pid)),
> +				      sizeof(pid));
>  
>  			pid = 0;
> -			read(p[i].sv[0], &pid, sizeof(pid));
> +			igt_assert_eq(read(p[i].sv[0], &pid, sizeof(pid)),
> +				      sizeof(pid));
>  			igt_assert(pid == getpid());
>  		}
>  	}
> @@ -1109,8 +1111,10 @@ static void test_processes(int i915)
>  		igt_assert_eq(sync_fence_wait(fence, 0), -ETIME);
>  
>  		/* Kill *this* process */
> -		read(p[i].sv[1], &pid, sizeof(pid));
> -		write(p[i].sv[1], &pid, sizeof(pid));
> +		igt_assert_eq(read(p[i].sv[1], &pid, sizeof(pid)),
> +			      sizeof(pid));
> +		igt_assert_eq(write(p[i].sv[1], &pid, sizeof(pid)),
> +			      sizeof(pid));
>  
>  		/*
>  		 * A little bit of slack required for the signal to terminate
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index dc6178d63..b65b914fa 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -627,7 +627,7 @@ static void test_inflight(int fd, unsigned int wait)
>  		for (unsigned int n = 0; n < max; n++) {
>  			gem_execbuf_wr(fd, &execbuf);
>  			fence[n] = execbuf.rsvd2 >> 32;
> -			igt_assert(fence[n] != -1);
> +			igt_assert_neq(fence[n], -1);
>  		}
>  
>  		igt_debugfs_dump(fd, "i915_engine_info");
> @@ -687,7 +687,7 @@ static void test_inflight_suspend(int fd)
>  	for (unsigned int n = 0; n < max; n++) {
>  		gem_execbuf_wr(fd, &execbuf);
>  		fence[n] = execbuf.rsvd2 >> 32;
> -		igt_assert(fence[n] != -1);
> +		igt_assert_neq(fence[n], -1);
>  	}
>  
>  	igt_set_autoresume_delay(30);
> @@ -774,7 +774,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
>  			if (__gem_execbuf_wr(fd, &execbuf))
>  				break; /* small shared ring */
>  			fence[n] = execbuf.rsvd2 >> 32;
> -			igt_assert(fence[n] != -1);
> +			igt_assert_neq(fence[n], -1);
>  			count++;
>  		}
>  
> @@ -885,7 +885,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
>  		gem_execbuf_wr(fd, &execbuf);
>  
>  		fences[nfence] = execbuf.rsvd2 >> 32;
> -		igt_assert(fences[nfence] != -1);
> +		igt_assert_neq(fences[nfence], -1);
>  		nfence++;
>  	}
>  
> diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
> index 7b51b7af0..6a9905d95 100644
> --- a/tests/intel/gem_exec_alignment.c
> +++ b/tests/intel/gem_exec_alignment.c
> @@ -302,7 +302,8 @@ static void prio_inversion(int i915, unsigned int flags)
>  		naughty_child(i915, link[1], obj.handle, flags);
>  
>  	igt_debug("Waiting for naughty client\n");
> -	read(link[0], &elapsed, sizeof(elapsed));
> +	igt_assert_eq(read(link[0], &elapsed, sizeof(elapsed)),
> +		      sizeof(elapsed));
>  	igt_debug("Ready...\n");
>  	usleep(250 * 1000); /* let the naughty execbuf begin */
>  	igt_debug("Go!\n");
> @@ -331,7 +332,8 @@ static void prio_inversion(int i915, unsigned int flags)
>  	igt_waitchildren();
>  	gem_close(i915, obj.handle);
>  
> -	read(link[0], &naughty, sizeof(naughty));
> +	igt_assert_eq(read(link[0], &naughty, sizeof(naughty)),
> +		      sizeof(naughty));
>  	igt_info("Naughty client took %'"PRIu64"ns\n", naughty);
>  
>  	igt_assert(elapsed < naughty / 2);
> diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
> index 7bd91c2a0..86849f322 100644
> --- a/tests/intel/gem_exec_big.c
> +++ b/tests/intel/gem_exec_big.c
> @@ -143,9 +143,7 @@ static void xchg_reloc(void *array, unsigned i, unsigned j)
>  	struct drm_i915_gem_relocation_entry *b = &reloc[j];
>  	struct drm_i915_gem_relocation_entry tmp;
>  
> -	tmp = *a;
> -	*a = *b;
> -	*b = tmp;
> +	igt_swap(*a, *b);
>  }
>  
>  static void execN(int fd, uint32_t handle, uint64_t batch_size, unsigned flags, char *ptr)
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 720ff796d..2340ad495 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -406,7 +406,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	gem_execbuf_wr(fd, &execbuf);
>  
>  	fence_out = execbuf.rsvd2 >> 32;
> -	igt_assert(fence_out >= 0);
> +	igt_assert_lte(0, fence_out);
>  
>  	/* Wait for the request to start */
>  	while (READ_ONCE(*seqno) != 0xc0ffee)
> @@ -792,11 +792,11 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
>  				&fence_out, REGION_SMEM, true));
>  		put_ahnd(ahnd);
>  
> -		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
> +		igt_assert_eq(write(link[1], &fd, sizeof(fd)), sizeof(fd)); /* wake the parent up */
>  		wait_to_die(fence_out);
> -		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
> +		igt_assert_eq(write(link[1], &fd, sizeof(fd)), sizeof(fd)); /* wake the parent up */
>  	}
> -	read(link[0], &dummy, sizeof(dummy));
> +	igt_assert_eq(read(link[0], &dummy, sizeof(dummy)), sizeof(dummy));
>  	igt_require_f(poll(&(struct pollfd){link[0], POLLIN}, 1, 500) == 0,
>  		      "Capture completed too quickly! Will not block\n");
>  
> diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
> index 2f7ef3800..19df66921 100644
> --- a/tests/intel/gem_exec_fair.c
> +++ b/tests/intel/gem_exec_fair.c
> @@ -579,10 +579,12 @@ static void fair_child(int i915, const intel_ctx_t *ctx,
>  
>  	/* Synchronize with other children/parent upon construction */
>  	if (sv != -1)
> -		write(sv, &p_fence, sizeof(p_fence));
> +		igt_assert_eq(write(sv, &p_fence, sizeof(p_fence)),
> +			      sizeof(p_fence));
>  	if (rv != -1)
> -		read(rv, &p_fence, sizeof(p_fence));
> -	igt_assert(p_fence == -1);
> +		igt_assert_eq(read(rv, &p_fence, sizeof(p_fence)),
> +			      sizeof(p_fence));
> +	igt_assert_eq(p_fence, -1);
>  
>  	aux_flags = 0;
>  	if (intel_gen(intel_get_drm_devid(i915)) < 8)
> @@ -850,9 +852,11 @@ static void fairness(int i915, const intel_ctx_cfg_t *cfg,
>  		{
>  			int sync;
>  			for (int child = 0; child < nchild; child++)
> -				read(lnk.child[0], &sync, sizeof(sync));
> +				igt_assert_eq(read(lnk.child[0], &sync, sizeof(sync)),
> +					      sizeof(sync));
>  			for (int child = 0; child < nchild; child++)
> -				write(lnk.parent[1], &sync, sizeof(sync));
> +				igt_assert_eq(write(lnk.parent[1], &sync, sizeof(sync)),
> +					      sizeof(sync));
>  		}
>  
>  		while (nfences--)
> @@ -1028,9 +1032,9 @@ static void deadline_child(int i915,
>  	if (!(flags & DL_PRIO))
>  		execbuf.flags |= I915_EXEC_FENCE_IN;
>  
> -	write(sv, &prev, sizeof(int));
> -	read(rv, &prev, sizeof(int));
> -	igt_assert(prev == -1);
> +	igt_assert_eq(write(sv, &prev, sizeof(int)), sizeof(int));
> +	igt_assert_eq(read(rv, &prev, sizeof(int)), sizeof(int));
> +	igt_assert_eq(prev, -1);
>  
>  	prev = execbuf.rsvd2;
>  	next = execbuf.rsvd2 >> 32;
> @@ -1044,7 +1048,8 @@ static void deadline_child(int i915,
>  		gem_execbuf_wr(i915, &execbuf);
>  		close(execbuf.rsvd2);
>  
> -		write(sv, &fence.handle, sizeof(uint32_t));
> +		igt_assert_eq(write(sv, &fence.handle, sizeof(uint32_t)),
> +			      sizeof(uint32_t));
>  
>  		prev = next;
>  		next = execbuf.rsvd2 >> 32;
> @@ -1187,10 +1192,12 @@ static void deadline(int i915, const intel_ctx_cfg_t *cfg,
>  		}
>  
>  		for (int i = 0; i < num_children; i++)
> -			read(link[i].child[0], &over, sizeof(int));
> +			igt_assert_eq(read(link[i].child[0], &over, sizeof(int)),
> +				      sizeof(int));
>  		igt_info("Testing %d children, with %'dns\n", num_children, child_ns);
>  		for (int i = 0; i < num_children; i++)
> -			write(link[i].parent[1], &over, sizeof(int));
> +			igt_assert_eq(write(link[i].parent[1], &over, sizeof(int)),
> +				      sizeof(int));
>  
>  		over = 0;
>  		missed = 0;
> @@ -1207,7 +1214,8 @@ static void deadline(int i915, const intel_ctx_cfg_t *cfg,
>  
>  			sw_sync_timeline_inc(timeline, 1);
>  			for (int i = 0; i < num_children; i++) {
> -				read(link[i].child[0], &fences[i].handle, sizeof(uint32_t));
> +				igt_assert_eq(read(link[i].child[0], &fences[i].handle, sizeof(uint32_t)),
> +					      sizeof(uint32_t));
>  				fences[i].flags = I915_EXEC_FENCE_WAIT;
>  			}
>  
> diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
> index a313c31f2..7f39c73d7 100644
> --- a/tests/intel/gem_exec_fence.c
> +++ b/tests/intel/gem_exec_fence.c
> @@ -366,7 +366,7 @@ static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
>  		execbuf.rsvd2 = -1;
>  		gem_execbuf_wr(fd, &execbuf);
>  		fence = execbuf.rsvd2 >> 32;
> -		igt_assert(fence != -1);
> +		igt_assert_neq(fence, -1);
>  
>  		if (all < 0) {
>  			all = fence;
> diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
> index 096681740..ff600e0ca 100644
> --- a/tests/intel/gem_exec_gttfill.c
> +++ b/tests/intel/gem_exec_gttfill.c
> @@ -66,9 +66,7 @@ static void xchg_batch(void *array, unsigned int i, unsigned int j)
>  	struct batch *batches = array;
>  	struct batch tmp;
>  
> -	tmp = batches[i];
> -	batches[i] = batches[j];
> -	batches[j] = tmp;
> +	igt_swap(batches[i], batches[j]);
>  }
>  
>  static void submit(int fd, uint64_t ahnd, unsigned int gen,
> diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
> index fb37cb511..1b20cc870 100644
> --- a/tests/intel/gem_exec_nop.c
> +++ b/tests/intel/gem_exec_nop.c
> @@ -415,7 +415,7 @@ stable_nop_on_ring(int fd, uint32_t handle, const intel_ctx_t *ctx,
>  	igt_stats_t s;
>  	double n;
>  
> -	igt_assert(reps >= 5);
> +	igt_assert_lte(5, reps);
>  
>  	igt_stats_init_with_size(&s, reps);
>  	s.is_float = true;
> diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> index d8013ccfc..44c09c3e2 100644
> --- a/tests/intel/gem_exec_reloc.c
> +++ b/tests/intel/gem_exec_reloc.c
> @@ -1343,7 +1343,7 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
>  	x += idx * CONCURRENT;
>  
>  	do {
> -		read(in, batch, sizeof(*batch));
> +		igt_assert_eq(read(in, batch, sizeof(*batch)), sizeof(*batch));
>  		if (!*batch)
>  			break;
>  
> @@ -1359,7 +1359,7 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
>  			}
>  		}
>  
> -		write(out, &err, sizeof(err));
> +		igt_assert_eq(write(out, &err, sizeof(err)), sizeof(err));
>  		count++;
>  	} while (err == 0);
>  
> diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
> index 996e54af0..0f4e174d2 100644
> --- a/tests/intel/gem_gtt_speed.c
> +++ b/tests/intel/gem_gtt_speed.c
> @@ -70,7 +70,7 @@ static void streaming_load(void *src, int len)
>  {
>  	__m128i tmp, *s = src;
>  
> -	igt_assert((len & 15) == 0);
> +	igt_assert_eq((len & 15), 0);
>  	igt_assert((((uintptr_t)src) & 15) == 0);
>  
>  	while (len >= 16) {
> diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
> index 2eeec5b6a..b6c0b13ac 100644
> --- a/tests/intel/gem_linear_blits.c
> +++ b/tests/intel/gem_linear_blits.c
> @@ -212,9 +212,9 @@ check_bo(int fd, uint32_t handle, uint32_t val)
>  
>  	num_errors = 0;
>  	for (i = 0; i < WIDTH*HEIGHT; i++) {
> -		if (linear[i] != val && num_errors++ < 32)
> -			igt_warn("[%08x] Expected 0x%08x, found 0x%08x (difference 0x%08x)\n",
> -				 i * 4, val, linear[i], val ^ linear[i]);
> +		igt_warn_on_f(linear[i] != val && num_errors++ < 32,
> +			      "[%08x] Expected 0x%08x, found 0x%08x (difference 0x%08x)\n",
> +			      i * 4, val, linear[i], val ^ linear[i]);
>  		val++;
>  	}
>  	igt_assert_eq(num_errors, 0);
> diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
> index e5e662361..70a38e75c 100644
> --- a/tests/intel/gem_pread.c
> +++ b/tests/intel/gem_pread.c
> @@ -151,7 +151,7 @@ static void write_value(const char *path, int value)
>  
>  	fd = open(path, O_WRONLY);
>  	if (fd != -1) {
> -		write(fd, buf, len);
> +		igt_assert_eq(write(fd, buf, len), len);
>  		close(fd);
>  	}
>  }
> @@ -223,8 +223,7 @@ static void test_exhaustion(int i915)
>  		count++;
>  	}
>  	igt_assert(count);
> -	if (t.err)
> -		igt_warn("err:%d after %lu threads\n", t.err, count);
> +	igt_warn_on_f(t.err, "err:%d after %lu threads\n", t.err, count);
>  
>  	/* Service the fault; releasing the stuck ioctls */
>  	memset(&copy, 0, sizeof(copy));
> diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
> index 025684a33..05a47b7b1 100644
> --- a/tests/intel/gem_pwrite.c
> +++ b/tests/intel/gem_pwrite.c
> @@ -425,7 +425,7 @@ static void write_value(const char *path, int value)
>  
>  	fd = open(path, O_WRONLY);
>  	if (fd != -1) {
> -		write(fd, buf, len);
> +		igt_assert_eq(write(fd, buf, len), len);
>  		close(fd);
>  	}
>  }
> @@ -497,8 +497,7 @@ static void test_exhaustion(int i915)
>  		count++;
>  	}
>  	igt_assert(count);
> -	if (t.err)
> -		igt_warn("err:%d after %lu threads\n", t.err, count);
> +	igt_warn_on_f(t.err, "err:%d after %lu threads\n", t.err, count);
>  
>  	/* Service the fault; releasing the stuck ioctls */
>  	memset(&copy, 0, sizeof(copy));
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 6be19318a..e2c12df17 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -811,7 +811,7 @@ static void test_pxp_dmabuffshare_refcnt(int i915)
>  	for (n = 0; n < (TSTSURF_SIZE/4); ++n)
>  		if (encrypted[0][n] == encrypted[1][n])
>  			++num_matches;
> -	igt_assert(num_matches == (TSTSURF_SIZE/4));
> +	igt_assert_eq(num_matches, (TSTSURF_SIZE / 4));
>  }
>  
>  
> @@ -988,7 +988,7 @@ static void test_pxp_stale_ctx_execution(int i915)
>  	 */
>  	prepare_exec_assets(i915, &data, true, false);
>  	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	trigger_pxp_debugfs_forced_teardown(i915);
>  
> @@ -1008,7 +1008,7 @@ static void test_pxp_stale_buf_execution(int i915)
>  	/* Use pxp buffers with pxp context for testing for invalidation of protected buffers. */
>  	prepare_exec_assets(i915, &data, true, true);
>  	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	trigger_pxp_debugfs_forced_teardown(i915);
>  
> @@ -1055,7 +1055,7 @@ static void test_pxp_stale_buf_optout_execution(int i915)
>  	 * the intent of the subtest) to ensure ARB session is alive.
>  	 */
>  	ret = create_ctx_with_params(i915, true, true, true, false, &tmpctx);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	/*
>  	 * Use a normal context for testing opt-out behavior
> @@ -1063,7 +1063,7 @@ static void test_pxp_stale_buf_optout_execution(int i915)
>  	 */
>  	prepare_exec_assets(i915, &data, false, true);
>  	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	trigger_pxp_debugfs_forced_teardown(i915);
>  
> @@ -1088,7 +1088,7 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	 */
>  	prepare_exec_assets(i915, &data[0], true, false);
>  	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	/*
>  	 * For asset data[1]: Use pxp buffers with pxp context for testing for invalidation
> @@ -1096,7 +1096,7 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	 */
>  	prepare_exec_assets(i915, &data[1], true, true);
>  	ret = gem_execbuf_flush_store_dw(i915, data[1].ibb, data[1].ctx, data[1].fencebuf);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	/*
>  	 * For asset data[2]: Use a normal context for testing opt-out behavior
> @@ -1104,7 +1104,7 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	 */
>  	prepare_exec_assets(i915, &data[2], false, true);
>  	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	/* Do an S3 suspend resume cycle which also causes the pxp teardown event */
>  	trigger_powermgt_suspend_cycle(i915, pm);
> diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
> index 91bec96c0..8c74ce28c 100644
> --- a/tests/intel/gem_reset_stats.c
> +++ b/tests/intel/gem_reset_stats.c
> @@ -315,7 +315,7 @@ static int noop(int fd, uint32_t ctx, const struct intel_execution_ring *e)
>  
>  	memset(&exec, 0, sizeof(exec));
>  	exec.handle = gem_create(fd, 4096);
> -	igt_assert((int)exec.handle > 0);
> +	igt_assert_lt(0, (int)exec.handle);
>  	gem_write(fd, exec.handle, 0, &bbe, sizeof(bbe));
>  
>  	memset(&eb, 0, sizeof(eb));
> @@ -457,7 +457,7 @@ static void test_rs(const struct intel_execution_ring *e,
>  		if (i == hang_index)
>  			inject_hang(fd[i], 0, e, ASYNC);
>  		else
> -			igt_assert(noop(fd[i], 0, e) > 0);
> +			igt_assert_lt(0, noop(fd[i], 0, e));
>  	}
>  	sync_gpu();
>  
> @@ -524,7 +524,7 @@ static void test_rs_ctx(const struct intel_execution_ring *e,
>  			if (i == hang_index && j == hang_context)
>  				inject_hang(fd[i], ctx[i][j], e, ASYNC);
>  			else
> -				igt_assert(noop(fd[i], ctx[i][j], e) > 0);
> +				igt_assert_lt(0, noop(fd[i], ctx[i][j], e));
>  		}
>  	}
>  	sync_gpu();
> @@ -876,7 +876,7 @@ static void _check_param_ctx(const int fd, const int ctx, const cap_t cap)
>  		igt_assert_eq(_test_params(fd, ctx, 0, 0), 0);
>  
>  		if (cap != root) {
> -			igt_assert(get_reset_count(fd, ctx) == 0);
> +			igt_assert_eq(get_reset_count(fd, ctx), 0);
>  		}
>  	}
>  
> diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
> index b7c1b34e1..c542bf741 100644
> --- a/tests/intel/gem_softpin.c
> +++ b/tests/intel/gem_softpin.c
> @@ -793,7 +793,7 @@ static void __reserve(uint64_t ahnd, int i915, bool pinned,
>  	unsigned int flags;
>  	int i;
>  
> -	igt_assert(num_obj > 1);
> +	igt_assert_lt(1, num_obj);
>  
>  	flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>  	if (pinned)
> @@ -843,7 +843,7 @@ static void __exec_using_allocator(uint64_t ahnd, int i915, int num_obj,
>  	uint64_t sz = 4096;
>  	int i;
>  
> -	igt_assert(num_obj > 10);
> +	igt_assert_lt(10, num_obj);
>  
>  	flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>  	if (pinned)
> @@ -969,9 +969,7 @@ static void xchg_batch(void *array, unsigned int i, unsigned int j)
>  	struct batch *batches = array;
>  	struct batch tmp;
>  
> -	tmp = batches[i];
> -	batches[i] = batches[j];
> -	batches[j] = tmp;
> +	igt_swap(batches[i], batches[j]);
>  }
>  
>  static void submit(int fd, unsigned int gen,
> diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
> index 6fcc8616e..d8e80ca60 100644
> --- a/tests/intel/gem_tiled_blits.c
> +++ b/tests/intel/gem_tiled_blits.c
> @@ -129,9 +129,9 @@ check_bo(struct intel_buf *buf, uint32_t val, struct intel_bb *ibb)
>  	linear = intel_buf_cpu_map(linear_buf, 0);
>  	num_errors = 0;
>  	for (i = 0; i < width * height; i++) {
> -		if (linear[i] != val && num_errors++ < 32)
> -			igt_warn("[%08x] Expected 0x%08x, found 0x%08x (difference 0x%08x)\n",
> -				 i * 4, val, linear[i], val ^ linear[i]);
> +		igt_warn_on_f(linear[i] != val && num_errors++ < 32,
> +			      "[%08x] Expected 0x%08x, found 0x%08x (difference 0x%08x)\n",
> +			      i * 4, val, linear[i], val ^ linear[i]);
>  		val++;
>  	}
>  	igt_assert_eq(num_errors, 0);
> diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
> index 5e5bc6939..f5a3d9311 100644
> --- a/tests/intel/gem_tiled_fence_blits.c
> +++ b/tests/intel/gem_tiled_fence_blits.c
> @@ -158,9 +158,7 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
>  {
>  	uint32_t tmp, *base = array;
>  
> -	tmp = base[i];
> -	base[i] = base[j];
> -	base[j] = tmp;
> +	igt_swap(base[i], base[j]);
>  }
>  
>  static void run_test(int fd, int count, uint64_t end)
> diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
> index 807c209e8..67283c182 100644
> --- a/tests/intel/gem_userptr_blits.c
> +++ b/tests/intel/gem_userptr_blits.c
> @@ -814,7 +814,7 @@ static void test_nohangcheck_hostile(int i915)
>  						IGT_SPIN_FENCE_OUT));
>  
>  		new = fill_ring(i915, &spin->execbuf);
> -		igt_assert(new != -1);
> +		igt_assert_neq(new, -1);
>  		spin->out_fence = -1;
>  
>  		if (fence < 0) {
> @@ -831,7 +831,7 @@ static void test_nohangcheck_hostile(int i915)
>  	}
>  	intel_ctx_destroy(i915, ctx);
>  	put_ahnd(ahnd);
> -	igt_assert(fence != -1);
> +	igt_assert_neq(fence, -1);
>  
>  	if (sync_fence_wait(fence, MSEC_PER_SEC)) { /* 640ms preempt-timeout */
>  		igt_debugfs_dump(i915, "i915_engine_info");
> diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
> index 7a353a11e..9265d1d7a 100644
> --- a/tests/intel/gem_wait.c
> +++ b/tests/intel/gem_wait.c
> @@ -167,9 +167,11 @@ static void basic(int fd, const intel_ctx_t *ctx, unsigned engine,
>  		       igt_seconds_elapsed(&tv) < timeout)
>  			;
>  
> -		if ((flags & HANG) == 0 && !timespec_isset(&spin->last_signal))
> -			igt_warn("spinner not terminated, expired? %d!\n",
> -				 poll(&(struct pollfd){ spin->timerfd, POLLIN }, 1, 0));
> +		igt_warn_on_f((flags & HANG) == 0 && !timespec_isset(&spin->last_signal),
> +			      "spinner not terminated, expired? %d!\n", poll(&(struct pollfd){
> +					spin->timerfd,
> +					POLLIN,
> +				}, 1, 0));
>  
>  		igt_assert_eq(__gem_wait(fd, &wait), 0);
>  	} else {
> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
> index 3d2fd68a8..1edde8b3c 100644
> --- a/tests/intel/gem_watchdog.c
> +++ b/tests/intel/gem_watchdog.c
> @@ -500,7 +500,7 @@ far_delay(int i915, unsigned long delay, unsigned int target,
>  	batch[1] = batch[0];
>  	batch[1].flags &= ~EXEC_OBJECT_WRITE;
>  	batch[0].handle = handle;
> -	assert(batch[0].flags & EXEC_OBJECT_WRITE);
> +	igt_assert(batch[0].flags & EXEC_OBJECT_WRITE);
>  	gem_execbuf_wr(i915, &execbuf);
>  
>  	gem_close(i915, obj.handle);
> diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
> index f100118b6..a556eec53 100644
> --- a/tests/intel/i915_hangman.c
> +++ b/tests/intel/i915_hangman.c
> @@ -470,7 +470,7 @@ static void test_hang_detector(const intel_ctx_t *ctx,
>  	igt_stop_hang_detector();
>  
>  	/* Did it work? */
> -	igt_assert(hang_count == 1);
> +	igt_assert_eq(hang_count, 1);
>  
>  	check_alive();
>  }
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index e3e4470df..cd1ee6d10 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -230,7 +230,7 @@ inject_fault(const char *module_name, const char *opt, int fault)
>  	char buf[1024];
>  	int dir;
>  
> -	igt_assert(fault > 0);
> +	igt_assert_lt(0, fault);
>  	snprintf(buf, sizeof(buf), "%s=%d", opt, fault);
>  
>  	if (igt_kmod_load(module_name, buf)) {
> @@ -343,8 +343,8 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
>  		char *tmp;
>  
>  		tmp = __igt_params_get(i915, "lmem_bar_size");
> -		if (!tmp)
> -			igt_skip("lmem_bar_size modparam not supported on this kernel. Skipping the test.\n");
> +		igt_skip_on_f(!tmp,
> +			      "lmem_bar_size modparam not supported on this kernel. Skipping the test.\n");
>  		free(tmp);
>  	}
>  
> diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
> index 2a3da6f4a..f2106cd3e 100644
> --- a/tests/intel/i915_pm_freq_api.c
> +++ b/tests/intel/i915_pm_freq_api.c
> @@ -61,34 +61,34 @@ static void test_freq_basic_api(int dirfd, int gt)
>  	igt_debug("GT: %d, RPn: %d, RPe: %d, RP0: %d\n", gt, rpn, rpe, rp0);
>  
>  	/* Set min/max to RPn, RP0 for baseline behavior */
> -	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
> -	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0) > 0);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn));
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0));
>  
>  	/*
>  	 * Negative bound tests
>  	 * RPn is the floor
>  	 * RP0 is the ceiling
>  	 */
> -	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn - 1) < 0);
> -	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0 + 1) < 0);
> -	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn - 1) < 0);
> -	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0 + 1) < 0);
> +	igt_assert_lt(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn - 1), 0);
> +	igt_assert_lt(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0 + 1), 0);
> +	igt_assert_lt(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn - 1), 0);
> +	igt_assert_lt(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0 + 1), 0);
>  
>  	/* Assert min requests are respected from rp0 to rpn */
> -	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0) > 0);
> -	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rp0);
> -	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpe) > 0);
> -	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpe);
> -	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
> -	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
> +	igt_assert_eq_u32(get_freq(dirfd, RPS_MIN_FREQ_MHZ), rp0);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpe));
> +	igt_assert_eq_u32(get_freq(dirfd, RPS_MIN_FREQ_MHZ), rpe);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn));
> +	igt_assert_eq_u32(get_freq(dirfd, RPS_MIN_FREQ_MHZ), rpn);
>  
>  	/* Assert max requests are respected from rpn to rp0 */
> -	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
> -	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
> -	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpe) > 0);
> -	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpe);
> -	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0) > 0);
> -	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rp0);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn));
> +	igt_assert_eq_u32(get_freq(dirfd, RPS_MAX_FREQ_MHZ), rpn);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpe));
> +	igt_assert_eq_u32(get_freq(dirfd, RPS_MAX_FREQ_MHZ), rpe);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0));
> +	igt_assert_eq_u32(get_freq(dirfd, RPS_MAX_FREQ_MHZ), rp0);
>  
>  }
>  
> @@ -100,8 +100,8 @@ static void test_reset(int i915, int dirfd, int gt, int count)
>  
>  	for (int i = 0; i < count; i++) {
>  		igt_debug("Running cycle: %d", i);
> -		igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
> -		igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
> +		igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn));
> +		igt_assert_lt(0, set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn));
>  		usleep(ACT_FREQ_LATENCY_US);
>  		req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
>  		if (req_freq)
> @@ -124,8 +124,8 @@ static void test_suspend(int i915, int dirfd, int gt)
>  	uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>  	uint32_t req_freq;
>  
> -	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
> -	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn));
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn));
>  	usleep(ACT_FREQ_LATENCY_US);
>  	req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
>  	if (req_freq)
> @@ -149,8 +149,10 @@ static void restore_sysfs_freq(int sig)
>  	/* Restore frequencies */
>  	for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
>  		igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
> -		igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, stash_max[gt]) > 0);
> -		igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]) > 0);
> +		igt_assert_lt(0,
> +			      set_freq(dirfd, RPS_MAX_FREQ_MHZ, stash_max[gt]));
> +		igt_assert_lt(0,
> +			      set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]));
>  	}
>  	free(stash_min);
>  	free(stash_max);
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index ebc0c235c..7942d46d3 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -250,7 +250,7 @@ static char *get_drpc(int i915, int gt_id)
>  	int gt_dir;
>  
>  	gt_dir = igt_debugfs_gt_dir(i915, gt_id);
> -	igt_assert(gt_dir != -1);
> +	igt_assert_neq(gt_dir, -1);
>  	return igt_sysfs_get(gt_dir, "drpc");
>  }
>  
> @@ -307,7 +307,7 @@ static int open_pmu(int i915, uint64_t config)
>  
>  	fd = perf_i915_open(i915, config);
>  	igt_skip_on(fd < 0 && errno == ENODEV);
> -	igt_assert(fd >= 0);
> +	igt_assert_lte(0, fd);
>  
>  	return fd;
>  }
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 99b83f315..3b7da197d 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -322,7 +322,8 @@ static void load_helper_run(enum load load)
>  			spin[high_load] = __igt_spin_new(drm_fd, .ahnd = ahnd);
>  
>  			if (lh.signal && high_load != prev_load) {
> -				write(lh.link, &lh.signal, sizeof(lh.signal));
> +				igt_assert_eq(write(lh.link, &lh.signal, sizeof(lh.signal)),
> +					      sizeof(lh.signal));
>  				lh.signal = false;
>  			}
>  			prev_load = high_load;
> @@ -690,9 +691,9 @@ static uint64_t __fence_order(int i915,
>  	obj->flags = flags1;
>  	gem_execbuf(i915, eb);
>  
> -	read(fd, before, sizeof(before));
> +	igt_assert_eq(read(fd, before, sizeof(before)), sizeof(before));
>  	gem_sync(i915, obj->handle);
> -	read(fd, after, sizeof(after));
> +	igt_assert_eq(read(fd, after, sizeof(after)), sizeof(after));
>  	close(fd);
>  
>  	after[0] -= before[0];
> @@ -796,9 +797,9 @@ static uint64_t __engine_order(int i915,
>  		gem_execbuf(i915, eb);
>  	}
>  
> -	read(fd, before, sizeof(before));
> +	igt_assert_eq(read(fd, before, sizeof(before)), sizeof(before));
>  	gem_sync(i915, obj->handle);
> -	read(fd, after, sizeof(after));
> +	igt_assert_eq(read(fd, after, sizeof(after)), sizeof(after));
>  	close(fd);
>  
>  	after[0] -= before[0];
> diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> index f886297ed..4d706d62b 100644
> --- a/tests/intel/i915_query.c
> +++ b/tests/intel/i915_query.c
> @@ -491,7 +491,7 @@ test_query_topology_matches_eu_total(int fd)
>  
>  	free(topo_info);
>  
> -	igt_assert(n_eus_topology == n_eus);
> +	igt_assert_eq(n_eus_topology, n_eus);
>  }
>  
>  /*
> @@ -1380,7 +1380,7 @@ static void query_parse_and_validate_hwconfig_table(int i915)
>  	i915_query_items(i915, &item, 1);
>  	igt_assert(item.length == table_size);
>  	igt_info("Table size = %d bytes\n", table_size);
> -	igt_assert(table_size > 0);
> +	igt_assert_lt(0, table_size);
>  
>  	/* HWConfig table is a list of KLV sets */
>  	max_words = table_size / sizeof(uint32_t);
> @@ -1391,21 +1391,21 @@ static void query_parse_and_validate_hwconfig_table(int i915)
>  		igt_assert(data[i] < __INTEL_HWCONFIG_KEY_LIMIT);
>  
>  		len = data[i + 1];
> -		igt_assert(len > 0);
> -		igt_assert((i + 2 + len) <= max_words);
> +		igt_assert_lt(0, len);
> +		igt_assert_lte((i + 2 + len), max_words);
>  
>  		igt_info("[%2d] %s: ", data[i], hwconfig_keys[data[i]]);
>  
>  		value = data[i + 2];
>  		switch (data[i]) {
>  		case INTEL_HWCONFIG_MEMORY_TYPE:
> -			igt_assert(len == 1);
> +			igt_assert_eq(len, 1);
>  			igt_assert(value < __INTEL_HWCONFIG_MEMORY_TYPE_LIMIT);
>  			igt_info("%s\n", hwconfig_memtypes[value]);
>  			break;
>  
>  		case INTEL_HWCONFIG_CACHE_TYPES:
> -			igt_assert(len == 1);
> +			igt_assert_eq(len, 1);
>  
>  			if (!value)
>  				igt_info("-\n");
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 605813f7f..b808b4a02 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -307,7 +307,7 @@ static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
>  		igt_remove_fb(data->drm_fd, &col_fb);
>  	}
>  
> -	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> +	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
>  	newfb->fb_id = f.fb_id;
>  }
>  
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index db45e286e..5917b888f 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -388,7 +388,7 @@ static void gpu_engines_init_timeouts(int fd, int max_engines,
>  
>  	*num_engines = 0;
>  	for_each_physical_engine(fd, e) {
> -		igt_assert(*num_engines < max_engines);
> +		igt_assert_lt(*num_engines, max_engines);
>  
>  		props[*num_engines].engine = *e;
>  		props[*num_engines].preempt_timeout = 0;
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index c91370a9a..f262b271c 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -348,7 +348,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>  		       (uint8_t)(cc_color[1] * 0xff) << 8 |
>  		       (uint8_t)(cc_color[2] * 0xff);
>  
> -	igt_assert(native_color == cc_p[4].d);
> +	igt_assert_eq_u32(native_color, cc_p[4].d);
>  
>  	igt_assert(gem_munmap(map, fb->size) == 0);
>  };
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 7baf7d98e..6fe6e6c3f 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -236,9 +236,8 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>  	mode_hi = get_highres_mode(output);
>  	igt_require(mode_hi != NULL);
>  
> -	if (mode_hi->hdisplay == mode_lo->hdisplay &&
> -	    mode_hi->vdisplay == mode_lo->vdisplay)
> -		igt_skip("Highest and lowest mode resolutions are same; no transition\n");
> +	igt_skip_on_f(mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay,
> +		      "Highest and lowest mode resolutions are same; no transition\n");
>  
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index 58057aca3..0de09b8e9 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -35,7 +35,7 @@ void save_force_dsc_en(int drmfd, igt_output_t *output)
>  		igt_is_force_dsc_enabled(drmfd, output->name);
>  	force_dsc_restore_fd =
>  		igt_get_dsc_debugfs_fd(drmfd, output->name);
> -	igt_assert(force_dsc_restore_fd >= 0);
> +	igt_assert_lte(0, force_dsc_restore_fd);
>  }
>  
>  void restore_force_dsc_en(void)
> @@ -163,7 +163,7 @@ void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output)
>  		igt_is_force_dsc_fractional_bpp_enabled(drmfd, output->name);
>  	force_dsc_fractional_bpp_restore_fd =
>  		igt_get_dsc_fractional_bpp_debugfs_fd(drmfd, output->name);
> -	igt_assert(force_dsc_fractional_bpp_restore_fd >= 0);
> +	igt_assert_lte(0, force_dsc_fractional_bpp_restore_fd);
>  }
>  
>  void restore_force_dsc_fractional_bpp_en(void)
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 71e42f19c..edf6f8d4e 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -317,8 +317,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
>  	for (i = 0; skip == false && i < ARRAY_SIZE(reasons); i++)
>  		skip = strstr(buf, reasons[i]);
>  
> -	if (skip)
> -		igt_skip("fbcon modeset is not compatible with FBC\n");
> +	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
>  }
>  
>  static void psr_skips_on_fbcon(int debugfs_fd)
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index e1318bfa6..1aef1e02d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -230,11 +230,10 @@ static uint32_t get_dc_counter(char *dc_data)
>  	long ret;
>  	char *s = strchr(dc_data, ':');
>  
> -	assert(s);
> +	igt_assert(s);
>  	s++;
>  	ret = strtol(s, &e, 10);
> -	assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) &&
> -	       e > s && *e == '\n' && ret >= 0);
> +	igt_assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) && e > s && *e == '\n' && ret >= 0);
>  	return ret;
>  }
>  
> @@ -611,8 +610,8 @@ static void test_deep_pkgc_state(data_t *data)
>  	}
>  
>  	/* Skip the test if no VRR capable output is found */
> -	if (!vrr_supported)
> -		igt_skip("No VRR capable output found, skipping the test.\n");
> +	igt_skip_on_f(!vrr_supported,
> +		      "No VRR capable output found, skipping the test.\n");
>  
>  	igt_display_reset(display);
>  
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 66c68b902..5af3e81bc 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1527,7 +1527,7 @@ static void pm_test_tiling(void)
>  			gem_set_tiling(drm_fd, handles[j],
>  					tiling_modes[i], stride);
>  			gem_get_tiling(drm_fd, handles[j], &ti, &sw);
> -			igt_assert(tiling_modes[i] == ti);
> +			igt_assert_eq_u32(tiling_modes[i], ti);
>  		}
>  
>  		enable_one_screen_and_wait(&ms_data);
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index f3caa9ecc..cf0ce4bb8 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -499,27 +499,27 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
>  
>  static bool psr_wait_entry_if_enabled(data_t *data)
>  {
> -	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> -		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> -			 data->op_psr_mode);
> +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, data->op_psr_mode),
> +		      "enable_psr modparam doesn't allow psr mode %d\n",
> +		      data->op_psr_mode);
>  
>  	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output);
>  }
>  
>  static bool psr_wait_update_if_enabled(data_t *data)
>  {
> -	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> -		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> -			 data->op_psr_mode);
> +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, data->op_psr_mode),
> +		      "enable_psr modparam doesn't allow psr mode %d\n",
> +		      data->op_psr_mode);
>  
>  	return psr_wait_update(data->debugfs_fd, data->op_psr_mode, data->output);
>  }
>  
>  static bool psr_enable_if_enabled(data_t *data)
>  {
> -	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> -		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> -			 data->op_psr_mode);
> +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, data->op_psr_mode),
> +		      "enable_psr modparam doesn't allow psr mode %d\n",
> +		      data->op_psr_mode);
>  
>  	return psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
>  }
> diff --git a/tests/intel/perf.c b/tests/intel/perf.c
> index 95b17f522..c5a103c94 100644
> --- a/tests/intel/perf.c
> +++ b/tests/intel/perf.c
> @@ -493,12 +493,12 @@ __perf_open(int fd, struct drm_i915_perf_open_param *param, bool prevent_pm)
>  
>  	ret = igt_ioctl(fd, DRM_IOCTL_I915_PERF_OPEN, param);
>  
> -	igt_assert(ret >= 0);
> +	igt_assert_lte(0, ret);
>  	errno = 0;
>  
>  	if (prevent_pm) {
>  		pm_fd = open("/dev/cpu_dma_latency", O_RDWR);
> -		igt_assert(pm_fd >= 0);
> +		igt_assert_lte(0, pm_fd);
>  
>  		igt_assert_eq(write(pm_fd, &pm_value, sizeof(pm_value)), sizeof(pm_value));
>  	}
> @@ -625,7 +625,7 @@ elapsed_delta(uint64_t t1, uint64_t t0, uint32_t width)
>  {
>  	uint32_t max_bits = sizeof(t1) * 8;
>  
> -	igt_assert(width <= max_bits);
> +	igt_assert_lte_u32(width, max_bits);
>  
>  	if (t1 < t0 && width != max_bits)
>  		return ((1ULL << width) - t0) + t1;
> @@ -2128,7 +2128,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
>  			/* igt_debug(" > read %i bytes\n", ret); */
>  
>  			/* We should never have no data. */
> -			igt_assert(ret > 0);
> +			igt_assert_lt(0, ret);
>  
>  			for (int offset = 0;
>  			     offset < ret && n_timer_reports < NUM_TIMER_REPORTS;
> @@ -2472,7 +2472,7 @@ test_blocking(uint64_t requested_oa_period,
>  		       errno == EINTR)
>  			;
>  
> -		igt_assert(ret > 0);
> +		igt_assert_lt(0, ret);
>  
>  		/* For Haswell reports don't contain a well defined reason
>  		 * field we so assume all reports to be 'periodic'. For gen8+
> @@ -2526,12 +2526,12 @@ test_blocking(uint64_t requested_oa_period,
>  	/* With completely broken blocking (but also not returning an error) we
>  	 * could end up with an open loop,
>  	 */
> -	igt_assert(n <= (max_iterations + n_extra_iterations));
> +	igt_assert_lte(n, (max_iterations + n_extra_iterations));
>  
>  	/* Make sure the driver is reporting new samples with a reasonably
>  	 * low latency...
>  	 */
> -	igt_assert(n > (min_iterations + n_extra_iterations));
> +	igt_assert_lt((min_iterations + n_extra_iterations), n);
>  
>  	if (!set_kernel_hrtimer)
>  		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
> @@ -2728,12 +2728,12 @@ test_polling(uint64_t requested_oa_period,
>  	/* With completely broken blocking while polling (but still somehow
>  	 * reporting a POLLIN event) we could end up with an open loop.
>  	 */
> -	igt_assert(n <= (max_iterations + n_extra_iterations));
> +	igt_assert_lte(n, (max_iterations + n_extra_iterations));
>  
>  	/* Make sure the driver is reporting new samples with a reasonably
>  	 * low latency...
>  	 */
> -	igt_assert(n > (min_iterations + n_extra_iterations));
> +	igt_assert_lt((min_iterations + n_extra_iterations), n);
>  
>  	if (!set_kernel_hrtimer)
>  		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
> @@ -2821,7 +2821,7 @@ num_valid_reports_captured(struct drm_i915_perf_open_param *param,
>  		       errno == EINTR)
>  			;
>  
> -		igt_assert(ret > 0);
> +		igt_assert_lt(0, ret);
>  
>  		for (int offset = 0; offset < ret; offset += header->size) {
>  			header = (void *)(buf + offset);
> @@ -3343,7 +3343,7 @@ test_short_reads(void)
>  		ret = read(stream_fd,
>  			   header,
>  			   page_size);
> -		igt_assert(ret > 0);
> +		igt_assert_lt(0, ret);
>  	} while (header->type == DRM_I915_PERF_RECORD_OA_REPORT_LOST);
>  
>  	igt_assert_eq(ret, record_size);
> @@ -5001,7 +5001,7 @@ static int i915_perf_add_config(int fd, struct drm_i915_perf_oa_config *config)
>  	int config_id = __i915_perf_add_config(fd, config);
>  
>  	igt_debug("config_id=%i\n", config_id);
> -	igt_assert(config_id > 0);
> +	igt_assert_lt(0, config_id);
>  
>  	return config_id;
>  }
> @@ -5339,7 +5339,7 @@ test_whitelisted_registers_userspace_config(void)
>  
>  	/* Create a new config */
>  	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_PERF_ADD_CONFIG, &config);
> -	igt_assert(ret > 0); /* Config 0 should be used by the kernel */
> +	igt_assert_lt(0, ret); /* Config 0 should be used by the kernel */
>  	config_id = ret;
>  
>  	i915_perf_remove_config(drm_fd, config_id);
> @@ -5360,7 +5360,7 @@ read_i915_module_ref(void)
>  		if (strncmp(line, "i915 ", 5) == 0) {
>  			unsigned long mem;
>  			int ret = sscanf(line + 5, "%lu %u", &mem, &ref_count);
> -			igt_assert(ret == 2);
> +			igt_assert_eq(ret, 2);
>  			goto done;
>  		}
>  	}
> @@ -5381,7 +5381,7 @@ static int perf_sysfs_open(int i915)
>  	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
>  		break;
>  
> -	igt_assert(dirfd != -1);
> +	igt_assert_neq(dirfd, -1);
>  
>  	return dirfd;
>  }
> @@ -5784,7 +5784,7 @@ test_group_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
>  		grp->perf_fd = igt_ioctl(drm_fd,
>  					 DRM_IOCTL_I915_PERF_OPEN,
>  					 &param);
> -		igt_assert(grp->perf_fd >= 0);
> +		igt_assert_lte(0, grp->perf_fd);
>  		igt_debug("opened OA buffer with c:i %d:%d\n",
>  			  ci->engine_class, ci->engine_instance);
>  	}
> @@ -5826,7 +5826,7 @@ test_group_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
>  			param.num_properties = ARRAY_SIZE(properties) / 2 - 1;
>  			errno = 0;
>  			err = igt_ioctl(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param);
> -			igt_assert(err < 0);
> +			igt_assert_lt(err, 0);
>  			igt_assert(errno == EBUSY || errno == ENODEV);
>  			igt_debug("try OA ci unit with c:i %d:%d\n",
>  				  ci->engine_class, ci->engine_instance);
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index e3f51d0c7..bfa2d501a 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -200,7 +200,7 @@ static char *get_drpc(int i915, int gt_id)
>  	int gt_dir;
>  
>  	gt_dir = igt_debugfs_gt_dir(i915, gt_id);
> -	igt_assert(gt_dir != -1);
> +	igt_assert_neq(gt_dir, -1);
>  	return igt_sysfs_get(gt_dir, "drpc");
>  }
>  
> @@ -210,7 +210,7 @@ static int open_pmu(int i915, uint64_t config)
>  
>  	fd = perf_i915_open(i915, config);
>  	igt_skip_on(fd < 0 && errno == ENODEV);
> -	igt_assert(fd >= 0);
> +	igt_assert_lte(0, fd);
>  
>  	return fd;
>  }
> @@ -221,7 +221,7 @@ static int open_group(int i915, uint64_t config, int group)
>  
>  	fd = perf_i915_open_group(i915, config, group);
>  	igt_skip_on(fd < 0 && errno == ENODEV);
> -	igt_assert(fd >= 0);
> +	igt_assert_lte(0, fd);
>  
>  	return fd;
>  }
> @@ -527,7 +527,7 @@ static void log_busy(unsigned int num_engines, uint64_t *val)
>  		int len;
>  
>  		len = snprintf(p, rem, "%u=%" PRIu64 "\n",  i, val[i]);
> -		igt_assert(len > 0);
> +		igt_assert_lt(0, len);
>  		rem -= len;
>  		p += len;
>  	}
> @@ -950,7 +950,7 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
>  	int timeout = 3;
>  
>  	/* Time spent being busy includes time waiting on semaphores */
> -	igt_assert(busy_pct >= sema_pct);
> +	igt_assert_lte(sema_pct, busy_pct);
>  
>  	gem_quiescent_gpu(gem_fd);
>  
> @@ -1359,7 +1359,7 @@ static void open_invalid(int i915)
>  	int fd;
>  
>  	fd = perf_i915_open(i915, -1ULL);
> -	igt_assert(fd < 0);
> +	igt_assert_lt(fd, 0);
>  }
>  
>  static bool cpu0_hotplug_support(void)
> @@ -1415,7 +1415,7 @@ static void cpu_hotplug(int gem_fd)
>  					       cpu), sizeof(name));
>  			cpufd = open(name, O_WRONLY);
>  			if (cpufd == -1) {
> -				igt_assert(cpu > 0);
> +				igt_assert_lt(0, cpu);
>  				/*
>  				 * Signal parent that we cycled through all
>  				 * CPUs and we are done.
> @@ -1534,7 +1534,7 @@ test_interrupts(int gem_fd)
>  			close(old_fd);
>  		}
>  
> -		igt_assert(fence_fd >= 0);
> +		igt_assert_lte(0, fence_fd);
>  	}
>  
>  	/* Wait for idle state. */
> @@ -1755,9 +1755,9 @@ test_frequency(int gem_fd, unsigned int gt)
>  	 */
>  	__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq);
>  	__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz", &read_value);
> -	if (read_value != min_freq)
> -		igt_warn("Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
> -			 min_freq, read_value);
> +	igt_warn_on_f(read_value != min_freq,
> +		      "Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
> +		      min_freq, read_value);
>  	close(fd[0]);
>  	close(fd[1]);
>  	put_ahnd(ahnd);
> @@ -1880,7 +1880,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>  			continue;
>  
>  		if (gt_ == gt) {
> -			igt_assert(test_idx == -1);
> +			igt_assert_eq(test_idx, -1);
>  			test_idx = pmus;
>  		}
>  
> @@ -1890,7 +1890,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>  		igt_skip_on(fd[pmus] < 0 && errno == ENODEV);
>  		pmus++;
>  	}
> -	igt_assert(test_idx >= 0);
> +	igt_assert_lte(0, test_idx);
>  
>  	if (flags & TEST_RUNTIME_PM) {
>  		drmModeRes *res;
> @@ -1981,7 +1981,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>  			continue;
>  
>  		fw[gt_] = open_forcewake_handle(gem_fd, gt_);
> -		igt_assert(fw[gt_] >= 0);
> +		igt_assert_lte(0, fw[gt_]);
>  	}
>  
>  	usleep(1e3); /* wait for the rc6 cycle counter to stop ticking */
> @@ -2206,7 +2206,8 @@ accuracy(int gem_fd, const intel_ctx_t *ctx,
>  				 100 * expected, target_busy_pct,
>  				 avg, sqrt(var / n));
>  
> -			write(link[1], &expected, sizeof(expected));
> +			igt_assert_eq(write(link[1], &expected, sizeof(expected)),
> +				      sizeof(expected));
>  		}
>  
>  		igt_spin_free(gem_fd, spin);
> @@ -2216,12 +2217,14 @@ accuracy(int gem_fd, const intel_ctx_t *ctx,
>  	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
>  
>  	/* Let the child run. */
> -	read(link[0], &expected, sizeof(expected));
> +	igt_assert_eq(read(link[0], &expected, sizeof(expected)),
> +		      sizeof(expected));
>  	assert_within(100.0 * expected, target_busy_pct, 5);
>  
>  	/* Collect engine busyness for an interesting part of child runtime. */
>  	val[0] = __pmu_read_single(fd, &ts[0]);
> -	read(link[0], &expected, sizeof(expected));
> +	igt_assert_eq(read(link[0], &expected, sizeof(expected)),
> +		      sizeof(expected));
>  	val[1] = __pmu_read_single(fd, &ts[1]);
>  	close(fd);
>  
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index beccfcb1a..a55ee5abd 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -212,7 +212,7 @@ static void surf_copy(int xe,
>  	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>  	result = memcmp(src->ptr, dst->ptr, src->size);
>  	if (blt_platform_has_flat_ccs_enabled(xe))
> -		igt_assert(result != 0);
> +		igt_assert_neq(result, 0);
>  
>  	/* In case of suspend_resume, buffer object would become
>  	 * uncompressed in xe2+ dgfx, and therefore retrieve the
> @@ -696,7 +696,7 @@ static int opt_handler(int opt, int opt_index, void *data)
>  	case 'f':
>  		param.compression_format = atoi(optarg);
>  		igt_debug("Compression format: %d\n", param.compression_format);
> -		igt_assert((param.compression_format & ~0x1f) == 0);
> +		igt_assert_eq((param.compression_format & ~0x1f), 0);
>  		break;
>  	case 'p':
>  		param.write_png = true;
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index a7d56a0be..a7c567c45 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -222,7 +222,7 @@ test_forcewake(int fd)
>  {
>  	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
>  
> -	igt_assert(handle != -1);
> +	igt_assert_neq(handle, -1);
>  	close(handle);
>  }
>  
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index f0d3f0d54..7af80dd2f 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -108,7 +108,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  	} *data [MAX_N_BO];
>  	int i;
>  
> -	igt_assert(n_bo <= MAX_N_BO);
> +	igt_assert_lte(n_bo, MAX_N_BO);
>  
>  	for (i = 0; i < N_FD; ++i) {
>  		fd[i] = drm_open_driver(DRIVER_XE);
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index eebdbc84b..f0c66c49e 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -57,7 +57,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	int i, b;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	bo = calloc(n_execs / 2, sizeof(*bo));
>  	igt_assert(bo);
> @@ -237,7 +237,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	int i, b;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	bo = calloc(n_execs / 2, sizeof(*bo));
>  	igt_assert(bo);
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index a6dbd748b..73f69e7b0 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -190,7 +190,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>  	int i, j, b, num_placements = 0;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	xe_for_each_engine(fd, hwe) {
>  		if (hwe->engine_class != class || hwe->gt_id != gt)
> @@ -410,7 +410,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	int i, j, b, num_placements = 0;
>  	int map_fd = -1;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	xe_for_each_engine(fd, hwe) {
>  		if (hwe->engine_class != class || hwe->gt_id != gt)
> @@ -534,7 +534,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  			if (flags & RACE) {
>  				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
>  					      0x666);
> -				write(map_fd, data, bo_size);
> +				igt_assert_eq(write(map_fd, data, bo_size),
> +					      bo_size);
>  				data = mmap((void *)MAP_ADDRESS, bo_size,
>  					    PROT_READ | PROT_WRITE, MAP_SHARED |
>  					    MAP_FIXED, map_fd, 0);
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index 0fd1ae062..dfbd68d1d 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -122,8 +122,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	int i, b;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> -	igt_assert(n_vm <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_vm, MAX_N_EXEC_QUEUES);
>  
>  	for (i = 0; i < n_vm; ++i)
>  		vm[i] = xe_vm_create(fd, 0, 0);
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 389de7ca4..b92feee2c 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -115,7 +115,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	int map_fd = -1;
>  	int64_t fence_timeout;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
> @@ -243,7 +243,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			if (flags & RACE) {
>  				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
>  					      0x666);
> -				write(map_fd, data, bo_size);
> +				igt_assert_eq(write(map_fd, data, bo_size),
> +				              bo_size);
>  				data = mmap((void *)MAP_ADDRESS, bo_size,
>  					    PROT_READ | PROT_WRITE, MAP_SHARED |
>  					    MAP_FIXED, map_fd, 0);
> @@ -457,7 +458,7 @@ static void lr_mode_workload(int fd)
>  	ts_1 = spin->timestamp;
>  	sleep(1);
>  	ts_2 = spin->timestamp;
> -	igt_assert(ts_1 != ts_2);
> +	igt_assert_neq_u32(ts_1, ts_2);
>  
>  	xe_spin_end(spin);
>  	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> @@ -466,7 +467,7 @@ static void lr_mode_workload(int fd)
>  	ts_1 = spin->timestamp;
>  	sleep(1);
>  	ts_2 = spin->timestamp;
> -	igt_assert(ts_1 == ts_2);
> +	igt_assert_eq_u32(ts_1, ts_2);
>  
>  	sync.addr = to_user_pointer(&vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index b022f97d3..56bad2b75 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -140,7 +140,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	int i, j, b;
>  	int map_fd = -1;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	if (flags & ENABLE_SCRATCH)
>  		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> @@ -291,7 +291,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			if (flags & RACE) {
>  				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
>  					      0x666);
> -				write(map_fd, data, bo_size);
> +				igt_assert_eq(write(map_fd, data, bo_size),
> +				              bo_size);
>  				data = mmap((void *)MAP_ADDRESS, bo_size,
>  					    PROT_READ | PROT_WRITE, MAP_SHARED |
>  					    MAP_FIXED, map_fd, 0);
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index dcb22f275..72f2133e5 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -155,7 +155,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>  	int i, j, b, num_placements = 0, bad_batches = 1;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>  
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -326,7 +326,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct xe_spin_opts spin_opts = { .preempt = false };
>  	int i, b;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>  
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -475,7 +475,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct xe_spin_opts spin_opts = { .preempt = false };
>  	int i, b;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>  
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -704,7 +704,7 @@ gt_reset(int fd, int n_threads, int n_sec)
>  	for (i = 0; i < n_threads; i++)
>  		pthread_join(threads[i].thread, NULL);
>  
> -	printf("number of resets %d\n", num_reset);
> +	igt_info("number of resets %d\n", num_reset);
>  
>  	free(threads);
>  }
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index c872c22d5..5c1dd0a01 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -249,7 +249,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  		object_index = n % (count - 1);
>  		ptr[n]  = bo_map[object_index] + delta / 4;
>  
> -		igt_assert(*ptr[n] == value[n]);
> +		igt_assert_eq_u32(*ptr[n], value[n]);
>  	}
>  
>  	for (i = 0; i < count; i++) {
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index e7a0a7cd0..6e53d3cf8 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -70,7 +70,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	int i, j, b, num_placements = 0;
>  	bool owns_vm = false, owns_fd = false;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	if (flags & FD) {
>  		fd = drm_reopen_driver(fd);
> @@ -88,7 +88,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  		eci[num_placements++] = *hwe;
>  	}
> -	igt_assert(num_placements > 1);
> +	igt_assert_lt(1, num_placements);
>  
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
> @@ -272,7 +272,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	int map_fd = -1;
>  	bool owns_vm = false, owns_fd = false;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	if (flags & FD) {
>  		fd = drm_reopen_driver(fd);
> @@ -396,7 +396,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  			if (flags & RACE) {
>  				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
>  					      0x666);
> -				write(map_fd, data, bo_size);
> +				igt_assert_eq(write(map_fd, data, bo_size),
> +					      bo_size);
>  				data = mmap(from_user_pointer(userptr), bo_size,
>  					    PROT_READ | PROT_WRITE,
>  					    MAP_SHARED | MAP_FIXED,
> @@ -476,7 +477,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	int i, j, b, hang_exec_queue = n_exec_queues / 2;
>  	bool owns_vm = false, owns_fd = false;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	if (flags & FD) {
>  		fd = drm_reopen_driver(fd);
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 93ebb5ed0..365c9b9e6 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -41,7 +41,7 @@ static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>  
>  	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);
>  	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> -	igt_assert(gt_fd >= 0);
> +	igt_assert_lte(0, gt_fd);
>  
>  	while (ret == -EAGAIN)
>  		ret = igt_sysfs_printf(gt_fd, freq_attr, "%u", freq);
> @@ -59,7 +59,7 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
>  
>  	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);
>  	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> -	igt_assert(gt_fd >= 0);
> +	igt_assert_lte(0, gt_fd);
>  
>  	while (err == -EAGAIN)
>  		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
> @@ -84,7 +84,7 @@ static uint32_t get_throttle(int fd, int gt_id, const char *throttle_file)
>  	snprintf(throttle_attr, sizeof(throttle_attr),
>  		 "freq0/throttle/%s", throttle_file);
>  	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> -	igt_assert(gt_fd >= 0);
> +	igt_assert_lte(0, gt_fd);
>  
>  	igt_sysfs_scanf(gt_fd, throttle_attr, "%u", &val);
>  
> @@ -134,26 +134,26 @@ static void test_freq_basic_api(int fd, int gt_id)
>  	 * RPn is the floor
>  	 * RP0 is the ceiling
>  	 */
> -	igt_assert(set_freq(fd, gt_id, "min", rpn - 1) < 0);
> -	igt_assert(set_freq(fd, gt_id, "min", rp0 + 1) < 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rpn - 1) < 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rp0 + 1) < 0);
> +	igt_assert_lt(set_freq(fd, gt_id, "min", rpn - 1), 0);
> +	igt_assert_lt(set_freq(fd, gt_id, "min", rp0 + 1), 0);
> +	igt_assert_lt(set_freq(fd, gt_id, "max", rpn - 1), 0);
> +	igt_assert_lt(set_freq(fd, gt_id, "max", rp0 + 1), 0);
>  
>  	/* Assert min requests are respected from rp0 to rpn */
> -	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
> -	igt_assert(get_freq(fd, gt_id, "min") == rp0);
> -	igt_assert(set_freq(fd, gt_id, "min", rpe(fd, gt_id)) > 0);
> -	igt_assert(get_freq(fd, gt_id, "min") == rpe(fd, gt_id));
> -	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
> -	igt_assert(get_freq(fd, gt_id, "min") == rpn);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "min"), rp0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpe(fd, gt_id)));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "min"), rpe(fd, gt_id));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "min"), rpn);
>  
>  	/* Assert max requests are respected from rpn to rp0 */
> -	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
> -	igt_assert(get_freq(fd, gt_id, "max") == rpn);
> -	igt_assert(set_freq(fd, gt_id, "max", rpe(fd, gt_id)) > 0);
> -	igt_assert(get_freq(fd, gt_id, "max") == rpe(fd, gt_id));
> -	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
> -	igt_assert(get_freq(fd, gt_id, "max") == rp0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "max"), rpn);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpe(fd, gt_id)));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "max"), rpe(fd, gt_id));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "max"), rp0);
>  }
>  
>  /**
> @@ -176,10 +176,10 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>  	 * Then we check if hardware is actually operating at the desired freq
>  	 * And let's do this for all the 3 known Render Performance (RP) values.
>  	 */
> -	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
>  	usleep(ACT_FREQ_LATENCY_US);
> -	igt_assert(get_freq(fd, gt_id, "cur") == rpn);
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
>  
>  	if (gt_idle) {
>  		/* Wait for GT to go in C6 as previous get_freq wakes up GT*/
> @@ -187,31 +187,31 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>  			     "GT %d should be in C6\n", gt_id);
>  		igt_assert(get_freq(fd, gt_id, "act") == 0);
>  	} else {
> -		igt_assert(get_freq(fd, gt_id, "act") == rpn);
> +		igt_assert_eq_u32(get_freq(fd, gt_id, "act"), rpn);
>  	}
>  
> -	igt_assert(set_freq(fd, gt_id, "min", rpe(fd, gt_id)) > 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rpe(fd, gt_id)) > 0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpe(fd, gt_id)));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpe(fd, gt_id)));
>  	usleep(ACT_FREQ_LATENCY_US);
> -	igt_assert(get_freq(fd, gt_id, "cur") == rpe(fd, gt_id));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpe(fd, gt_id));
>  
>  	if (gt_idle) {
>  		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
>  			     "GT %d should be in C6\n", gt_id);
>  		igt_assert(get_freq(fd, gt_id, "act") == 0);
>  	} else {
> -		igt_assert(get_freq(fd, gt_id, "act") == rpe(fd, gt_id));
> +		igt_assert_eq_u32(get_freq(fd, gt_id, "act"), rpe(fd, gt_id));
>  	}
>  
> -	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
>  	usleep(ACT_FREQ_LATENCY_US);
>  	/*
>  	 * It is unlikely that PCODE will *always* respect any request above RPe
>  	 * So for this level let's only check if GuC PC is doing its job
>  	 * and respecting our request, by propagating it to the hardware.
>  	 */
> -	igt_assert(get_freq(fd, gt_id, "cur") == rp0);
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rp0);
>  
>  	if (gt_idle) {
>  		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> @@ -236,8 +236,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
>  
>  	igt_debug("Starting testing range request\n");
>  
> -	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rpe(fd, gt_id)) > 0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpe(fd, gt_id)));
>  	usleep(ACT_FREQ_LATENCY_US);
>  	cur = get_freq(fd, gt_id, "cur");
>  	igt_assert(rpn <= cur && cur <= rpe(fd, gt_id));
> @@ -267,12 +267,12 @@ static void test_freq_low_max(int fd, int gt_id)
>  	 *  When max request < min request, max is ignored and min works like
>  	 * a fixed one. Let's assert this assumption
>  	 */
> -	igt_assert(set_freq(fd, gt_id, "min", rpe(fd, gt_id)) > 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpe(fd, gt_id)));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
>  	usleep(ACT_FREQ_LATENCY_US);
>  
>  	/* Refresh value of rpe, pcode could have adjusted it */
> -	igt_assert(get_freq(fd, gt_id, "cur") == rpe(fd, gt_id));
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpe(fd, gt_id));
>  }
>  
>  /**
> @@ -284,16 +284,16 @@ static void test_suspend(int fd, int gt_id)
>  {
>  	uint32_t rpn = get_freq(fd, gt_id, "rpn");
>  
> -	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
> -	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
> +	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
> +	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
>  	usleep(ACT_FREQ_LATENCY_US);
> -	igt_assert(get_freq(fd, gt_id, "cur") == rpn);
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
>  
>  	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>  				      SUSPEND_TEST_NONE);
>  
> -	igt_assert(get_freq(fd, gt_id, "min") == rpn);
> -	igt_assert(get_freq(fd, gt_id, "max") == rpn);
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "min"), rpn);
> +	igt_assert_eq_u32(get_freq(fd, gt_id, "max"), rpn);
>  }
>  
>  /**
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index 647fd64e7..845052bf2 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -674,11 +674,11 @@ static int __do_intel_bb_blit(struct buf_ops *bops, uint32_t tiling)
>  
>  	/* We'll fail on src <-> final compare so just warn */
>  	if (tiling == I915_TILING_NONE) {
> -		if (compare_bufs(&src, &dst, false) > 0)
> -			igt_warn("none->none blit failed!");
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) > 0,
> +			      "none->none blit failed!");
>  	} else {
> -		if (compare_bufs(&src, &dst, false) == 0)
> -			igt_warn("none->tiled blit failed!");
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) == 0,
> +			      "none->tiled blit failed!");
>  	}
>  
>  	fails = compare_bufs(&src, &final, true);
> @@ -925,11 +925,11 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>  
>  	/* We'll fail on src <-> final compare so just warn */
>  	if (tiling == I915_TILING_NONE) {
> -		if (compare_bufs(&src, &dst, false) > 0)
> -			igt_warn("%s: none->none failed!\n", __func__);
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) > 0,
> +			      "%s: none->none failed!\n", __func__);
>  	} else {
> -		if (compare_bufs(&src, &dst, false) == 0)
> -			igt_warn("%s: none->tiled failed!\n", __func__);
> +		igt_warn_on_f(compare_bufs(&src, &dst, false) == 0,
> +			      "%s: none->tiled failed!\n", __func__);
>  	}
>  
>  	fails = compare_bufs(&src, &final, true);
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index ff2218300..e26ebceb9 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -492,12 +492,12 @@ __perf_open(int fd, struct intel_xe_oa_open_prop *param, bool prevent_pm)
>  
>  	ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, param);
>  
> -	igt_assert(ret >= 0);
> +	igt_assert_lte(0, ret);
>  	errno = 0;
>  
>  	if (prevent_pm) {
>  		pm_fd = open("/dev/cpu_dma_latency", O_RDWR);
> -		igt_assert(pm_fd >= 0);
> +		igt_assert_lte(0, pm_fd);
>  
>  		igt_assert_eq(write(pm_fd, &pm_value, sizeof(pm_value)), sizeof(pm_value));
>  	}
> @@ -568,7 +568,7 @@ elapsed_delta(uint64_t t1, uint64_t t0, uint32_t width)
>  {
>  	uint32_t max_bits = sizeof(t1) * 8;
>  
> -	igt_assert(width <= max_bits);
> +	igt_assert_lte_u32(width, max_bits);
>  
>  	if (t1 < t0 && width != max_bits)
>  		return ((1ULL << width) - t0) + t1;
> @@ -1710,7 +1710,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
>  
>  			/* igt_debug(" > read %i bytes\n", ret); */
>  			/* We should never have no data. */
> -			igt_assert(ret > 0);
> +			igt_assert_lt(0, ret);
>  
>  			for (int offset = 0;
>  			     offset < ret && n_timer_reports < NUM_TIMER_REPORTS;
> @@ -1933,7 +1933,7 @@ static void test_blocking(uint64_t requested_oa_period,
>  		while ((ret = read(perf_fd, buf, sizeof(buf))) < 0 &&
>  		       (errno == EINTR || errno == EIO))
>  			;
> -		igt_assert(ret > 0);
> +		igt_assert_lt(0, ret);
>  
>  		for (int offset = 0; offset < ret; offset += format_size) {
>  			uint32_t *report = (void *)(buf + offset);
> @@ -1972,12 +1972,12 @@ static void test_blocking(uint64_t requested_oa_period,
>  	/* With completely broken blocking (but also not returning an error) we
>  	 * could end up with an open loop,
>  	 */
> -	igt_assert(n <= (max_iterations + n_extra_iterations));
> +	igt_assert_lte(n, (max_iterations + n_extra_iterations));
>  
>  	/* Make sure the driver is reporting new samples with a reasonably
>  	 * low latency...
>  	 */
> -	igt_assert(n > (min_iterations + n_extra_iterations));
> +	igt_assert_lt((min_iterations + n_extra_iterations), n);
>  
>  	if (!set_kernel_hrtimer)
>  		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
> @@ -2163,12 +2163,12 @@ static void test_polling(uint64_t requested_oa_period,
>  	/* With completely broken blocking while polling (but still somehow
>  	 * reporting a POLLIN event) we could end up with an open loop.
>  	 */
> -	igt_assert(n <= (max_iterations + n_extra_iterations));
> +	igt_assert_lte(n, (max_iterations + n_extra_iterations));
>  
>  	/* Make sure the driver is reporting new samples with a reasonably
>  	 * low latency...
>  	 */
> -	igt_assert(n > (min_iterations + n_extra_iterations));
> +	igt_assert_lt((min_iterations + n_extra_iterations), n);
>  
>  	if (!set_kernel_hrtimer)
>  		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
> @@ -2260,7 +2260,7 @@ num_valid_reports_captured(struct intel_xe_oa_open_prop *param,
>  		       (errno == EINTR || errno == EIO))
>  			;
>  
> -		igt_assert(ret > 0);
> +		igt_assert_lt(0, ret);
>  
>  		for (int offset = 0; offset < ret; offset += format_size) {
>  			uint32_t *report = (void *)(buf + offset);
> @@ -3473,7 +3473,7 @@ static int xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
>  	int config_id = __xe_oa_add_config(fd, config);
>  
>  	igt_debug("config_id=%i\n", config_id);
> -	igt_assert(config_id > 0);
> +	igt_assert_lt(0, config_id);
>  
>  	return config_id;
>  }
> @@ -3769,7 +3769,7 @@ test_whitelisted_registers_userspace_config(void)
>  
>  	/* Create a new config */
>  	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
> -	igt_assert(ret > 0); /* Config 0 should be used by the kernel */
> +	igt_assert_lt(0, ret); /* Config 0 should be used by the kernel */
>  	config_id = ret;
>  
>  	xe_oa_remove_config(drm_fd, config_id);
> @@ -4195,7 +4195,7 @@ test_oa_unit_exclusive_stream(bool exponent)
>  		properties[11] = exec_q[i];
>  		errno = 0;
>  		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
> -		igt_assert(err < 0);
> +		igt_assert_lt(err, 0);
>  		igt_assert(errno == EBUSY || errno == ENODEV);
>  		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>  	}
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 82155f1d5..153d9ce1d 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -808,7 +808,7 @@ static void display_vs_wb_transient(int fd)
>  
>  		/* c0 -> c6 might flush caches */
>  		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> -		igt_assert(fw_handle >= 0);
> +		igt_assert_lte(0, fw_handle);
>  
>  		render_copy(ibb,
>  			    &src,
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> index 6ff4774bb..2a941abe6 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -279,7 +279,7 @@ static char *region_name(int xe, uint32_t region)
>  		r = snprintf(name, len, "%s",
>  			     xe_region_name(region));
>  
> -	igt_assert(r > 0);
> +	igt_assert_lt(0, r);
>  
>  	return name;
>  }
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 8b115e2f6..eee89428c 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -94,7 +94,7 @@ static uint64_t get_vram_d3cold_threshold(int sysfs)
>  	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
>  
>  	ret = igt_sysfs_scanf(sysfs, path, "%lu", &threshold);
> -	igt_assert(ret > 0);
> +	igt_assert_lt(0, ret);
>  
>  	return threshold;
>  }
> @@ -111,7 +111,7 @@ static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
>  	else
>  		igt_warn("vram_d3cold_threshold is not present\n");
>  
> -	igt_assert(ret > 0);
> +	igt_assert_lt(0, ret);
>  }
>  
>  static void vram_d3cold_threshold_restore(int sig)
> @@ -305,8 +305,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
>  			  d_state == IGT_ACPI_D3Cold);
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> -	igt_assert(n_execs > 0);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> +	igt_assert_lt(0, n_execs);
>  
>  	if (check_rpm) {
>  		igt_assert(in_d3(device, d_state));
> @@ -507,7 +507,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	 * Therefore open and close fw handle to wake the device.
>  	 */
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> -	igt_assert(fw_handle >= 0);
> +	igt_assert_lte(0, fw_handle);
>  	active = igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE;
>  	close(fw_handle);
>  	igt_assert(active);
> @@ -557,7 +557,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>  
> -	igt_assert(fw_handle >= 0);
> +	igt_assert_lte(0, fw_handle);
>  	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
>  		   active_time);
>  
> @@ -600,7 +600,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  
>  	/* Runtime resume and check the pattern */
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> -	igt_assert(fw_handle >= 0);
> +	igt_assert_lte(0, fw_handle);
>  	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		igt_assert(map[i] == MAGIC_2);
> @@ -651,7 +651,7 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>  			active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> -			igt_assert(fw_handle >= 0);
> +			igt_assert_lte(0, fw_handle);
>  			igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
>  				   active_time);
>  
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 51735d887..1d3ce0762 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -182,7 +182,7 @@ static unsigned long read_idle_residency(int fd, int gt)
>  	int gt_fd;
>  
>  	gt_fd = xe_sysfs_gt_open(fd, gt);
> -	igt_assert(gt_fd >= 0);
> +	igt_assert_lte(0, gt_fd);
>  	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_residency_ms", "%lu", &residency) == 1);
>  	close(gt_fd);
>  
> @@ -280,7 +280,7 @@ static void toggle_gt_c6(int fd, int n)
>  
>  	do {
>  		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> -		igt_assert(fw_handle >= 0);
> +		igt_assert_lte(0, fw_handle);
>  		/* check if all gts are in C0 after forcewake is acquired */
>  		xe_for_each_gt(fd, gt)
>  			igt_assert_f(!xe_is_gt_in_c6(fd, gt),
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index c13613e0a..c6d88b258 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -198,7 +198,7 @@ test_query_engines(int fd)
>  								    hwe->gt_id);
>  	}
>  
> -	igt_assert(i > 0);
> +	igt_assert_lt(0, i);
>  }
>  
>  /**
> @@ -464,15 +464,15 @@ test_query_gt_topology_l3_bank_mask(int fd)
>  
>  			igt_info(" count: %d\n", count);
>  			if (intel_get_device_info(dev_id)->graphics_ver < 20) {
> -				igt_assert(count > 0);
> +				igt_assert_lt(0, count);
>  			}
>  
>  			if (IS_METEORLAKE(dev_id))
> -				igt_assert((count % 2) == 0);
> +				igt_assert_eq((count % 2), 0);
>  			else if (IS_PONTEVECCHIO(dev_id))
> -				igt_assert((count % 4) == 0);
> +				igt_assert_eq((count % 4), 0);
>  			else if (IS_DG2(dev_id))
> -				igt_assert((count % 8) == 0);
> +				igt_assert_eq((count % 8), 0);
>  		}
>  
>  		query.size -= sz;
> @@ -786,7 +786,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  		if (!((i + 1) % NUM_SNAPSHOTS)) {
>  			igt_debug("clock %s\n", clock[index].name);
>  			igt_debug("usable %d\n", usable);
> -			igt_assert(usable > 2);
> +			igt_assert_lt(2, usable);
>  			usable = 0;
>  		}
>  	}
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index a4f6c7a0b..f20a1f474 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -408,7 +408,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  	int n_exec_queues = n_bo, n_execs = n_bo;
>  	int i, b;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
>  	bo = malloc(sizeof(*bo) * n_bo);
>  	igt_assert(bo);
> @@ -778,7 +778,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  	} *data;
>  	int i, b;
>  
> -	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
> +	igt_assert_lte(n_execs, BIND_ARRAY_MAX_N_EXEC);
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * n_execs;
> @@ -974,7 +974,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  		base_addr -= xe_get_default_alignment(fd);
>  	}
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  	vm = xe_vm_create(fd, 0, 0);
>  
>  	if (flags & LARGE_BIND_FLAG_USERPTR) {
