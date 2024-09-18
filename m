Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608A6CAC595
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027DC10E090;
	Wed, 18 Sep 2024 07:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LduIoWu2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1011A10E090
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726643673; x=1758179673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tD/LZnveOgysTaFHvyYDpGbEWvbXAp8wU4xfmebJmeY=;
 b=LduIoWu2W4ns+b3IUh5nvcOQBqfow/lWnW8J6K2Tj19THrmK3K17v4Kh
 uOc0+DYavSXenvZR9tl+maik9DCMmxKowsHHhLHaVG4DPth/5OMgq7+LU
 7carJ2bP+zhswiNI2dMRAf2FAPtrZa3S2JMWW1u5CvVxvvLHy3cJ26tHb
 /quc7WdPNYKFaX2JoY9KY3ZKyKqYKw+ZIpLJgw+nFIE3ySRew8XukcpW0
 oBVFTfftuN2umDFX4LHy67NnAnHyFGJVUghd9Nxbue2wYTlCEW18yYhFU
 xfrP8eqqmBDEk0SSX73+p9hOx1y0KJe3QECaAtPh8zPnybOsrMWYJA7VB A==;
X-CSE-ConnectionGUID: mREUxgUYTlW+0qGYyyf1gA==
X-CSE-MsgGUID: JX/vP8BjTLKVpuPyAq8hnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="50949288"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="50949288"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:14:32 -0700
X-CSE-ConnectionGUID: PSGTAL+4SqmgKCKmYtLA2w==
X-CSE-MsgGUID: Wdf1LgNgSdq1xso6IaKV7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69085747"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 00:14:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:14:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 00:14:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 00:14:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbWN10iYZU5bUB1EQW3d0ZApAFZVVWqK3ZPTdEoOxX3KPNzA8jMTRAODJv+PNB/DfA6ucpF4S0zkMX4LFp480+wHLdALJJgCpegbyFNiYuiWbhROem6FOYpK5yYuA5k6MLnOdOm0ErsQTLEf1bGISwj0GZ/KZ8R5SHVnO7xjMaIHjVKhaIeqBegwCD/7/zFh1LyEFm+5ZQAwr0oOUtltdM0VVZt/li+uvK9BwG/MSjJpClKfXzcY38VsxahZ66m+76lq+REbg5+vnK05zJtBEBItOis5Ybhtvt6c8Fw/B7eNqFKy4ZIIdPCUjWntuyvw3ryMojOJ/oBJCb4hYLBIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePfnWO89iGFEuBipPEk+lgR5rd4Xfyz84OnXuxm9qDs=;
 b=HcIF1HwoIYJgl53+Vm7avnXsrOu6m4cAvhpipDH1kgF9FnHa0PRG1jVJXkoQBi1Pp/4wgWrx2i02SjUddyZMc6UeudkbmK+sb5O/Rif4P6o/pt+Z6kMFq00xgrMRE9GBOGdAfdZhoG6TQ/qtKYHjOPvvm1l73sTr5QmYPNo6ro5G7STco27n5bmI88SujWzEgTpZyH5cMAJQ+sgZA8LpXvtwogq2B9u7HqNGvhay85+dfonjIPhcrOoHcJrDK12DYbCzXN+JQgS/LAFV+2gLQ1D9M2TOrWoiB7NTX3w3F77/+sfRzn5PCu80fBdmws+d6kq+UPyY1D3WeLDyLob2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 07:14:29 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 07:14:29 +0000
Message-ID: <4e940810-2cc3-4b6f-887b-897e68116146@intel.com>
Date: Wed, 18 Sep 2024 12:44:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] lib/kms: Update force joiner helpers to
 accomodate Ultra joiner
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>,
 <bhanuprakash.modem@intel.com>
References: <20240911072204.22825-1-karthik.b.s@intel.com>
 <20240911072204.22825-3-karthik.b.s@intel.com>
 <dc9c09b5-bb86-421e-b60d-bcda9717e340@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <dc9c09b5-bb86-421e-b60d-bcda9717e340@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb5d629-6b0d-4b3f-cca9-08dcd7b188ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzBlZFBRb3VGSHF2VmFWbC8rMmNhbXMyaTRMaGhNaGoxTFRLUE1rNnFiRGhp?=
 =?utf-8?B?TVdrbWNFdHdQT2Jpb0xhbGxZbHBranJEMm8wOGtxakFxRUoydmtwNGx5Z3Yv?=
 =?utf-8?B?c1Voem1CZU9vdlBmK2RhVnJkUjZNV2tlQ3JFNU1SWjVWNmVPYUtCWW1zcHUx?=
 =?utf-8?B?REQvS2Z2NHdnVlZIelBTYTJVUVd4Qm1CZ0szTjR3UjhxVnlqNmxJaGNHME9n?=
 =?utf-8?B?aTFkRThlQkd4UlMxYy9JSFJVdU1zMFM0YzYvMktqWG1XMmdNVmJVRWsyV0ty?=
 =?utf-8?B?b3F0MEMzbFpESy9BS0luMyttb016aDZUN1dxamlRTU9aaENhT3BPZnFUZnFZ?=
 =?utf-8?B?QnZOUlVyNWU5V3JrRmxVWUxtaitNQ2pXUmRkL0RXNEN2VEk4eGg3RGVpN3cz?=
 =?utf-8?B?L0IwWWUwakcySnFKZkpaRmxaSzRBczhWOGk0SU43UnlDNHF5NVJKRlExSjdG?=
 =?utf-8?B?S2ZjM0R5RDArTnpKRE92cEFaNm5rZXBvL1N0ZEF2VHNSNTB6aEhERUlLN2c1?=
 =?utf-8?B?T3BYdTE2N0hPa29rbEo3S2k2Q3kxbmtHN2J4ZUFEbWYrRnkxSElEQTd0N1hw?=
 =?utf-8?B?b2cyQUtSZ2MyUm1BbzdXOVNSVnJoZ2ROMTVUYXNickxLSW91bGtQNjErM2RR?=
 =?utf-8?B?SitBa3pQWXlDTlNoZHlHdFFFV3c3a1RVRU83aExnQ3U5VGVwTkEzak1Db1By?=
 =?utf-8?B?SGNLRTQzZUcxdmlaYnN1Y1pXSTZYRGozeFpnNFRXVXBBcHJ3c1NVTy83Ukcx?=
 =?utf-8?B?LzdQWWdNVGJBWHJpQmdoRmMzMEZWcXpkK1RibzR0WklWNmVaWjJHODVXamJJ?=
 =?utf-8?B?VjczWjNrc21HMlkyNXJTbkRPWWhRTXl4SExpUnZ4c1piYlJJLytuZ2lMQU1C?=
 =?utf-8?B?ZVB4ZkZpSkM2bUJpb1ByUCsyWWQ0aDRPVTJBWnlQelNXK3doY0ZETzJoN0Ra?=
 =?utf-8?B?OVBjYWlIUTNUa0tLa2NZU25icHNTUDFsSzhqYm9OVUphZU1BdTdQeC9KVmYx?=
 =?utf-8?B?ZTQ4NWljM0xmTVRxNE9FVzdjVFJWUE4zY3NhdmI5Qk52NWhuOWdzUk5aWGxC?=
 =?utf-8?B?NUtFVmhCS0ppVFd5WXdxajJENDFkK3BUcFV5RktoRzhOU1FlRXZmcENINVlE?=
 =?utf-8?B?M1h1Q2xUWm00dlBWRXp1TjA0Mjl6dlM5cGNYZlNCSFBhRFZQeUFXTDcvOWNG?=
 =?utf-8?B?dEkxSVB5ODAycU00TXZiY0dmYnkvcnIrbDRlMU9HSlVFVzlWb2VwV1JIZ3p0?=
 =?utf-8?B?VU9TWTlNSVlNSitsc3F2UGMzT0xxU1pVZytEVzJMem1DRGlCUVpoTVRQSkNq?=
 =?utf-8?B?ZFB0cG96MXhXTHZKeHZHM2ZkUGNjZFYxenp1M3liSWN3NnRYSlI4YlR6R3gw?=
 =?utf-8?B?WXRiTGZOQ0ZIcm9wcUVybFV3LzMrMENjS3ZhMk4yT0JEbTRNT3d0Ujd2cUxz?=
 =?utf-8?B?UUVLYU9MMW1FY0txcG1jNUFrMDBxQkNmZEVmcGlON01UTWVOazVQa1Fncjg3?=
 =?utf-8?B?RzB1RnZOSUNuK3dEUjZ3T21CaStUb2ZXNmZEcFVrQWhqSFh2Zmozd2JZZEhw?=
 =?utf-8?B?U2xlYjFBRGR2MmdkQk5EcDNSaVhHZ2Y5YjdLczMzNlJuc2ZhVGZ0UUg3d2Zq?=
 =?utf-8?B?SDZwS3daS0NhSzlSQUVkZ2dwaDduaEhPMGlFczVybkJ5UVYwYk9rSWxGTEsw?=
 =?utf-8?B?NmYrQWJBNTFZKzAvUC9iRmtJU2FBVG1oL0xrR0ptSHpieUNCYUJDcjA1T1hQ?=
 =?utf-8?B?bVZDSGIwWXIrY3VRMDh1aXh3dDVmNHpxVlZhdGJteEtCWjVSV1NsRUJ5RlFK?=
 =?utf-8?B?U2ZlYmlkeGUxaFRkeDVzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZCMEI4WWkvdzhUbUE2aTZMRXZoYWl3N3hhSzlLUmZNc1czcTZwWUtST2Nq?=
 =?utf-8?B?Tk9xYURkc0ZOVjFkb3BXblpEV3IzYzNSdFRQdkUwMHphRFdSZTVIYVd5SWFp?=
 =?utf-8?B?ako4WWt1MW1EUlk2ejdZdElhSEE5cWFZdFI5aTBuYzdMTVBVbnJHZ1NvSzd2?=
 =?utf-8?B?aGloT1BxbUg1NEpkZ1NqcHJCWkVrQXhPNkVrKzhJS0kzc1hJOUNJNnBlVFFG?=
 =?utf-8?B?OHNycGV3dGlVdG8yRWtxa3A5UEVtVTM0eHpDQlhyU083Y0txVzlVRVBoNnJF?=
 =?utf-8?B?R24vYjVXT0RHQzVEc0Q2bTh0WUR4UVIycEtXcXcrUkp4RzdsZjV0WXBXd3d6?=
 =?utf-8?B?dmJjODlTbXhucVFBNi9MTEpjcnVqVUJhOUg4S0pEUWU2TzNSaGYyQTM1UFAv?=
 =?utf-8?B?dDJ5cXM5RW9oeEpPU3BhWkQ2azBidUNBS0FLU3BBbUFyaVpReEc0T3owVGw3?=
 =?utf-8?B?SlJ1eFJaUi9mTldaNmJ1NUlGeElWUzVrYnhRKy91akg3RWNTMnAvTlE0bmhS?=
 =?utf-8?B?dm12N0lsakRzNEs2ZWZSTUhUcjRGdThWVDFNVE9OU1JoenpVajlxSkZiRGpn?=
 =?utf-8?B?UGpGTWFsMWZ1dVFZS2JTQ2FEQ0M1ZUtJc3lkcUt2RTV4WG9QNVVSRk5tUmNu?=
 =?utf-8?B?b1BacDZ0ajhhOTFlRXBzdVd0eWJ0WHNDMHNtS01DVktxL2xqQmxiYk5xRXNV?=
 =?utf-8?B?ZGwvcjhoNUVidWQwbnowaGp6SmNYdUdza1hVNU9PZXpZbmRtTjA4OENoWE5K?=
 =?utf-8?B?Q1lWc1N0N1FKakFiUE9WcWZSVmpTNzUzSCtHa3c5MytIbXI5NG0vYlA5dksw?=
 =?utf-8?B?dHhkNGRjU0J4MlEzd3J0a3NqRGtSbk9GYVhROFcyZFE2cDF6Z1BQRE5pQ2pG?=
 =?utf-8?B?MHgybWI3dnhocVUwTjlzUFFkRXdJdS9OUVBWYzlLZWlOSmV6cHJWaDZINEZL?=
 =?utf-8?B?TVVNcFU2OXlReVY5T256akJCenV0VzRweWQyQ1dmUEN1SGpmeVltUkFUUm1J?=
 =?utf-8?B?RG5jRXpwZWNtU05CSTd3YUJwb3l5V0EvSE1KNkdCbWVMS1lPS2U1Y1dwSHIv?=
 =?utf-8?B?YUZXemgwaXdOVGpoZ2hobzZuTFg0S0ZrZUlER0UvWi80Zng4QitZMFRMZmxI?=
 =?utf-8?B?dWdLb1l4Q0JXcWxKREFHdHBGMHdobXlEMEU3b1NhZE8wenlzYVlqOEhDNUxx?=
 =?utf-8?B?UzRrZm5UQWVVbUo1Q0NLNGJhM3VmcnNOUm5vY3F2UUVHOW0vdWIvSXMwK1RT?=
 =?utf-8?B?b1BUbEFxTmRZT1VLbUt3aUNrM0N2U2VPdFZRU0c4TklPSDJ2WDMwYnFaM3Bs?=
 =?utf-8?B?azN5WTVVUENQcHpvUVBQaHREcVcvamZaaDlZVkVXQ1ZTdjZaZ0NIdEN0dzB6?=
 =?utf-8?B?VU43RHdZZ1gzUUQwVnU0TDEzdDVkK0VYby9VdlRhcDB2RlV4aGl4KzVvRTds?=
 =?utf-8?B?M2czbk40cmZ2QXE0RDVCb3lCTjNiaCtVMTR6NFoxUUdmZnY2N3pOKzZhZER0?=
 =?utf-8?B?VWdFQnJPeW43d1ByTjR6WEVYdkF4WS9vcklKaW5qR1FmOUZGL0ltd1Boc1lD?=
 =?utf-8?B?NE1GbUVnNFcxaGFyMS9UejJlMzNjTUpTcHUzM0pkMVR1MUplTXJ6bG41cjV1?=
 =?utf-8?B?T0dzWmM1by8rZGQrUkMydHR3Tno1cUZsT3RZQXJQSlRzWUJBcVAxcDhCdHVD?=
 =?utf-8?B?dHdKbXJxdEoyd0djSlB5cUNhUmtYN29uK3VZQStlVXp2aFlUQ3BWTXhqVFpU?=
 =?utf-8?B?MnZEZXRvbnpONVVldVN5NmFPQklyMXlocW11aU9sK1hPWUE5OFZmQmM0REdz?=
 =?utf-8?B?cVhSemFvZGtrWXQzYXpLeGxGSDRIVC9wWVBFeTJ3WTA1UjlXcEdHSmlxdDEw?=
 =?utf-8?B?dzF5NjZZZWU0ZmRLUVE2aE5wVEpScTZyZ0xuSXloVVZSMlcyV1JyL1hxYVB0?=
 =?utf-8?B?Z0FmMVdqRkE1bVVkNHZzOW1Odk9VQ2ZMMnduN0V4b3JPWEZYUk9WWU9LWGRC?=
 =?utf-8?B?ZkMzRmFxYUhmVVR6RW51ZHR0a2s1Q2VlZFdxMk1VN2p6SjIranJHY1FaWHZm?=
 =?utf-8?B?bGhaaEQ4dFNhb3FaajBycDFBR2FtM1ROcGJJbnVnY0FZSkZpNjdic3dqUTFi?=
 =?utf-8?Q?TodqwJba3aicaMKsBbVomBPVR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb5d629-6b0d-4b3f-cca9-08dcd7b188ce
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 07:14:29.4605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPEDQeB4FOAmAAqae0u8xN/gDkyJKcfKNfn5IzX+NGQuxFDELRq+tfN2xYk4k0xfjOxRcfWSYb5YNnbU2LVuLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
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


On 9/11/2024 1:13 PM, Reddy Guddati, Santhosh wrote:
> Hi Karthik,
>
> Can we add an enum something like below , which can be re used at 
> other places.
>
> enum joiner_mode {
>     JOINED_PIPES_NONE,
>     JOINED_PIPES_1,
>     JOINED_PIPES_2,
>     JOINED_PIPES_3,
>     JOINED_PIPES_4,
>     JOINED_PIPES_MAX
> };
>
> bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector 
> *connector, int joined_pipes)
> {
>     const char *value;
>     drmModeConnector *temp;
>
>     switch (joined_pipes) {
>     case 0:  -- > case JOINED_PIPES_NONE
>         value = "0";
>         break;

Hi Santhosh,

Thank you for the review. Sure will update this.

Thanks,
Karthik.B.S
>
> On 11-09-2024 12:52, Karthik B S wrote:
>> +        status = kmstest_force_connector_joiner(data->drm_fd, 
>> output->config.connector, 2);
>
> >> status = kmstest_force_connector_joiner(data->drm_fd, 
> output->config.connector, JOINED_PIPES_2);
