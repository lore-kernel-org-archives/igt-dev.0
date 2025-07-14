Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EB5C83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 11:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4205310E14A;
	Mon, 14 Jul 2025 11:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7t3AvHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF5C10E14A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752493076; x=1784029076;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=O9DI4l/Me3Ndi+Webx/m/MMcsVJNMoqELhClyDUyEH4=;
 b=i7t3AvHI/h+/+bLsYH4v/LaXNaShmIGX2E0efFP2F9oT+ukSdzOqQ7LU
 y/rhTg4k2x7lxZnjk3s9JR+mQAFjQjgWi+LsQEmQ6N86VxBpVGepXjkHs
 mHWBPlqGUZsXIP3w/bhsKVja6/XLcCSYA34OdE1V15v0gHELtuJ/trYpL
 9/E6obj6U5WtQ5C+6q5GMIqh5t3ASls/Ou+UfZjyYIShQO5GYecXhG5+E
 /o+0kJROjWfUnzel97+AC43FfO7x1x1djOI7/cwOjWq1BgCpackpeS3WU
 4A8Bcd+ucu+wkBM/8c/B7pl8hvXRzHxYDnLLll1OQQEi7YVqJHtTo+YHe Q==;
X-CSE-ConnectionGUID: BKqCG1AsQIOgTFr6tU+ztA==
X-CSE-MsgGUID: kSgYFDYmRK26mnPvMqv7kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54835867"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208,217";a="54835867"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 04:37:55 -0700
X-CSE-ConnectionGUID: P7nWzUeNStSkNjDhoYGk0Q==
X-CSE-MsgGUID: cHrzPNJdQ8KMy/56gJM7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
 d="scan'208,217";a="156327220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 04:37:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 04:37:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 04:37:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 04:37:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYPWMyhTE+QUWnlFoT4TsE7rEBkpb+oYPDCL4M3jlNKIZVe7uGMUdlAI3HqiibOsBrB/yg0osE9MnLK2IIGebCTF1lGeRNRsfO3VuNL0FFD+xcd4kUMY20fjo+f2I99dNIB04e7hnBAuFG5jLW5BFW07BnIiDSVygT5PMuin/HoMSpI1Medf/jauYAGX6gvDoH7wi627YJxCFnsZtPbjGLrswZPIfCZhP79qrjkq50MEdlkapnxpxZj4C3XM2jM5TYqoETUXc0FLVnFYTRFhZJgUTXjY2N47ds3dxkVDOsgULgO7q6Cq6ynOMAUC0A+7q7zFRj1nMu46mYuCa6YMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgqKSNtIVu64ujQHKwq9cp+PSMxfoFGUMAlgpyWkXMY=;
 b=V4VVU8wgUiE/jvTeoEsRfASCX6wVD+W8Qa1Oj6b8J/R1ScPPzOT90ynh8vK4PQupEDNpSz6LYmp5Oevn32iHfIhWRfC4tEBjo7P6DdKjP07/+g3rDxEezYnTaJcgEoEkfvSj82jWixAbvWChYkIuMoAWf7uUAMesQDX4XtFtda6If7Y8ftvdlnenX779lpbmNB9ed/aFkcRMKwjkl1BLVDa+/EH1DYO8kCRnToPRLHbjHO03acteCciDcrgi8KE2gmf4lNYhshIWdzqr0WGRmEo6/yFfs6+uvIyAqw4RbZ1ESOL2NoAY6hPzAdaMao2PNU7zbILB2Cm7zO24a2zIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by PH3PPFA07D87DA6.namprd11.prod.outlook.com (2603:10b6:518:1::d3e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 11:37:17 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 11:37:16 +0000
Content-Type: multipart/alternative;
 boundary="------------A8WpQX0bycvI90U3PuXSf06e"
Message-ID: <d426e4e6-f964-4ec6-8bfd-de8aad65606e@intel.com>
Date: Mon, 14 Jul 2025 17:07:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_vrr: Pull Panel Replay check before
 setting up output
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250714102812.212333-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250714102812.212333-1-jeevan.b@intel.com>
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|PH3PPFA07D87DA6:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd13fc4-1511-4e2f-aaed-08ddc2cac8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDNGZWoxZklWWmc4TXRMMW9zTVd6bUNLYS9RcjIwc3ppMFJMS08yWEVSR3Rz?=
 =?utf-8?B?NUNZZTUvNUo5ODJLR0tZU2hNMi9RY0N5K2dxZHpiajFSMjRUckZyelc3a2hO?=
 =?utf-8?B?cmtMajZpQW9odkNub3dRdEZJZW9zbUZrRlpGNGZyM1NZYVA5Y3pXR2hISmM3?=
 =?utf-8?B?ajVvMngzRjUyUE8zVnYyYmQyZzBlSXNsVlExczF5VmVscXZyMGYrKzFVa1Bo?=
 =?utf-8?B?WmNIWUVLQ2NMbDdLKzBINHkvVG5CaDVsbWZnUlU4Uml0VWxhMXkrNXlJamNa?=
 =?utf-8?B?eXRVYVhWTktKU1VmZnJPeUZDQnE4QXpnMzduUWpTS2M4c1lRN2JxQ3JLVEtT?=
 =?utf-8?B?a1d4WVpiZFFPS0VzeDVqZVZSV2ZWa3ZlWjYzd2VnSzJWVUlyTnNhQlU5dktR?=
 =?utf-8?B?S1VNZUJIS3lzeVNTaWV0VE4xVkNxekswM0V4NGZabGxVWEE0anA4Kys1citV?=
 =?utf-8?B?QVJsMEpTK1BKRWJyT29FMVg3cHFiUm5jcmlhKzRYSnlFazZJaVFNa0llS3Bt?=
 =?utf-8?B?THg1QkVibXZjWmxuUktLWit1ZlRPVkFSUGhlZzcrNFNpeStZWmxYZUNsTndk?=
 =?utf-8?B?WHkrSHN4N3R5U1M5ZlRZLzVuM3VtTmtvNzhMSU5PKzdmUFNIT0VZaExKSlZi?=
 =?utf-8?B?dC93cXZqWGluVk5IeVBteit2RkkxemlCdFhndld0WEMwTXNTU2NlK1diWUlx?=
 =?utf-8?B?WVBsYmhvSG0rL3gySGtUUUd2OWtSZ05vVGZkaVdWaUNzTzViTk43cnRIbGQy?=
 =?utf-8?B?dVlaaTRCUFh5NmR3aFpiR0QvV3ZveURiTU40eS9CVmJES0VVSjRDamJtOFFK?=
 =?utf-8?B?UUwrRWVSZW1oWXdmYjdhdjQrUGxid1VMT3VwVGh0aER2bE8vdlFja3pqZ1h5?=
 =?utf-8?B?cjhLM25Kc1RGUzE1RU1OdmhYMVlwT0xkc3NrNzV2UHplTjNkU3BUSHZUL1E0?=
 =?utf-8?B?WjFvc0NMbDRYZEoreTBrL1YwZDNaVWxRcFFwb1ZNSEhFd1M0dURVdGpDWDBk?=
 =?utf-8?B?STIvQ3BuNjUyR2p6cWhFUDFjZW5qdndKYVN4ZTR4czFKMWNmMWE4aUlPWWdP?=
 =?utf-8?B?SkNBaVA2V0dGVHY5V1hzeU1KbDlUR3FURWFRRG1CSUxmT3lEOGx3MG12R2c1?=
 =?utf-8?B?ZDlKcUZub2pGYWZiOGJ6MlF2ZzVNUWFpUFJYMDMyQ1B3V01oWHhBRVM5ZW1l?=
 =?utf-8?B?NkVEektYdTVRU1RMUThEMmdiTnlYdys1bkt1OHpVeEdXeGFqWlFraE9EUGYy?=
 =?utf-8?B?OFRhZXIxWFB6OXFVTkc2R0dLbit3WDUwRFI3U1ZOOUZMdHJSbEZVeVhoVXZX?=
 =?utf-8?B?cTVyN2U1YnlaSnFNd2RHbHVnMU9PaVFwdytEUVF5eFo3UUpIeUE0SWluZTJs?=
 =?utf-8?B?Z3JqT0RPcnlFelJsZUlqSmE5bTlrUisyNWx4bW00YmMzMStoZ3NjdktTb3pm?=
 =?utf-8?B?NTkvTDl1dmJpaC9Kc3RIN1hFaGVUamNYeDlmM255a2JsNzBlOHB5MkdNblI5?=
 =?utf-8?B?ejB3amQwMHVISFRFYkowcWQ5ZWVUSVBkVy9uWFg5OWMrTkZKTERKaUJkNmU5?=
 =?utf-8?B?V3NoRUpRWkVrb2dBR2NuZzNNbmtoLzltS2hneWp3NjNiV2R2Z0UwSFYzdURT?=
 =?utf-8?B?QVU1N2ZiYjNrSk5Fd3ZJUGlFOGVXTGh3aW9iS1BjeFdDR2l6Y2Y0eVBmZEhI?=
 =?utf-8?B?SGdMcmxzR3d4MmNqaU5NNkxldzhmMkpDbGE2RStkR0kwVmZ1TkN2VXNlQ2ZS?=
 =?utf-8?B?L0tGektVaWorZmM3UHpNblhLaTQydTFsNHdOU1IwNmZOaGZpSFIveVFuaGVZ?=
 =?utf-8?B?cnByT1NHWW5tZjUvaHdNOXhraXNwY1FETlNxRkhuckZkVU1PVG4vclVhek9i?=
 =?utf-8?B?YjdJMlpKVXRkdWZJbGlZK3NqZHRsRFpVN3o3Y0ZuSWdSVXJLWUFQazNaSzFD?=
 =?utf-8?Q?Kmk+luODEKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmtsSVdlNWZHWnhtbUR5cmhFM2xIVnJUeHMyR1RkL0ZUQ0dTTE0ya3JiMGc5?=
 =?utf-8?B?a3VpWGNkK0pVM3lnRmlITVkyOXlmU2w3dy9oVjNIMG5aZ1R6d0hHMjNEMUJQ?=
 =?utf-8?B?VlZkTUFRSzJ3aGVPcnZJNVB1SzhHTkhtUGkybmNHQVY1Ujdpajluc3ZTWEpY?=
 =?utf-8?B?OTMxb0ExQ0dvU1VHcUsvd3U3eUlHaHJkK0t4dlZvYkY3cGwrQXdLNHFPSFZn?=
 =?utf-8?B?NHNoUDVKRUlZVGFzSHBncEoya0J2bThXWDhzRkNuaFY1bFNrY1ZCbHNYQTJY?=
 =?utf-8?B?aGMvbkZvTlVQZERCSVhoKzNBdHpOK0RXMjRxSHNVNHhQVHJEN3hJSWp4Sk1R?=
 =?utf-8?B?NjlNcklTUUZHb0phOUVVZzM2bXRxYVR3SU9sU0h5ZzZoNDNudDQrTStKK1FB?=
 =?utf-8?B?YlhwU0hsNW8xK0NxVVFwUUV4RUNIVkZWQ1kySTQyb1d5eXV2dUJzTXhhQjlw?=
 =?utf-8?B?MzIwVmIyREdodVdYcmhNd3Uyc29DMzFtNnQweG1rR1RKR1E5VlV5SWtJOGVU?=
 =?utf-8?B?MDdoZTJJSkRNZEU5eTRSOHdtVTdxS1k0UlZubkZaaytGWkdOQ3BXT2loSExy?=
 =?utf-8?B?M1dUUkdRUU9vVjhOQjUzb3pQemhGRnZqQVE2TGxvbVoxOTVxUWZpSnY5TXV6?=
 =?utf-8?B?REdUQ2NodVdIWk5QYlJ5bzcxRnJTK213dm5KOVUrZ2g0R3dxbWY0V01ablhX?=
 =?utf-8?B?UGhVbkk1MGZMMEt5Rng2MXpNOUIwT1NsVEs2NE1CM0dDTndpWlZmTGltelVX?=
 =?utf-8?B?ZFZRbGhPcnRmTGd6RTVJZE81RUV4OHR1RjdKSnJVUnpMTkhYZzZkc3RqQjVS?=
 =?utf-8?B?bVBjYUxObHlBVDhlVlR0TUpxVmFQY2RqTFB2WnFOMDNRQWRUcjhpdlo0RWtm?=
 =?utf-8?B?Um81Z252Z2VaZ2pTcUVqRVRzeHpLaWhvUHJjbTEwQzdZb25oUlJ1ZkJqNzFy?=
 =?utf-8?B?eStlc1JBZS83VHVuelo3K09xY2VOOXpJWStOTFJDbDJZNFBYVjFrWEx0YXZB?=
 =?utf-8?B?R1ZSM1VMOUV1NmFTNGhGaFg5MVFJT3BBaUxhbXArL3lLbjdqSzFFQWlnUWdP?=
 =?utf-8?B?SU9odyt3YjQ3R2RVTUdNRE5mK2RSZHBkNEFmbk5CYm5qNkFrOWlUQTF6TGc5?=
 =?utf-8?B?NGdid1pFWTh2STF0LzZ6a0hWQUNhUzJFaFZYOWc4WXZ6dkxCa3ZiSTk4MG4y?=
 =?utf-8?B?K0ZSUjdlMDB6SlQ1bXBrcytPZ1hhU0JITkQ3ai8yVmoxS1F3eFkxZ3VFVnBI?=
 =?utf-8?B?eE5MZi96UHE4aEc2eE1hZ2k5NjBZVE1hcFFkWHpmL2ZyUTZCQnpGdVJjNE0v?=
 =?utf-8?B?enJYelJGSjhvVEFuSFJSSU0zM2I0UnZKTzZCRFJKT1pYdkY5cVFHaEhjOVRm?=
 =?utf-8?B?Uzh6ZUk2SEJlNVNTZ1FLcW1JS3pkaTZZVFdDaVF4Yi9wTk5lV1NTWHM0VXYw?=
 =?utf-8?B?RTRyZVd2dWxEWE5LMFZBMDEwbG9adnNUMFYreWlITjhEL0pWRUp2RDUxbCtF?=
 =?utf-8?B?MFFuWXFqWFhrYWRSd2JXckVOZHFLVEpreWxnWUlyU3dHaVJjRS93MDBhMk9F?=
 =?utf-8?B?WGVpd2o0Q2J2ZEdaYnFDSVlCRFJRQlhoRlAxdkE0Mmh4Uk16eGtheTEvc0ZU?=
 =?utf-8?B?cFE4Nko2c0tSSE93R3U3dDA3NHJ4VDc4bElGQ3VvK0s0VDZwYmdiUWFpVGNO?=
 =?utf-8?B?cXM2NnQwcmFuV1o3MnlTTGZpdC9BbzVYdTJWOGprS3Vra1FHaFBvWU82V2ho?=
 =?utf-8?B?L3lYRXNzL08rT1hZSURJTEpsUjlxc3psOERCNGZtc2R5NmtwVXNOc2lnRE1Y?=
 =?utf-8?B?M3N2ZUUzNnE2WnVTTFNmaFRIbWVrQ1FQQWEyd3NMWEMyVGx1eklZRHUyZU5i?=
 =?utf-8?B?YklHTXM1SmxwNXB6NkNJc0hERGdsOUQ1ZFBjc2tJL3FqTmVhbXFpSHAzR2pF?=
 =?utf-8?B?L2NMZys1cHNIN0EyNFBhZHVidDVSTUFEcVRrYnJmdHZ6RHVmSHBRMlh6YjQ2?=
 =?utf-8?B?Yk5yUHhzL0JNSGlvZTFWdjFkVjR6WVQ2OFlKRStOcThmK1hZUU9qdjAxQkt4?=
 =?utf-8?B?VDJXQUFIdGFVejhaL1V5UXo0dENXMWVETEtkRGl6ZlFETDh0dlFZQXVsVFZm?=
 =?utf-8?B?aksvSHFwV281MHFUSm00dHA4dVRVVE01S2RhYlRzVEFibHppbVUrWk5lU0Zt?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd13fc4-1511-4e2f-aaed-08ddc2cac8da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 11:37:16.9345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnvsjTsOEyiOsAJAeOsX4DSYKc4Xzwblw9oWVn1yMEgxxchbhRp9eFD51iD1Rsuu3NQWRzqPCOYuQ2vnof85ialjj+Jw9XbewB4C6AWMIMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA07D87DA6
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

--------------A8WpQX0bycvI90U3PuXSf06e
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan,

On 7/14/2025 3:58 PM, Jeevan B wrote:
> Adding the Panel Replay support check later in the test was causing
> an invalid skip, since the test disables PSR/PR in output_constraint().
> Move the check earlier to ensure correct capability detection and avoid
> unintended skips.
>
> Fixes: 7da0c57182cc ("tests/kms_vrr: Skip LOBF test if PR is not supported on sink")
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 9c2c4ac92..85a90bb25 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -960,6 +960,14 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   		return false;
>   	}
>   
> +	if (flags & TEST_LINK_OFF) {
> +		if (!psr_sink_support(data->drm_fd,
> +				      data->debugfs_fd, PR_MODE, NULL)) {
> +			igt_info("LOBF not supported\n");
> +			return false;
> +		}
> +	}
> +

Consolidate TEST_LINK_OFF condition to avoid duplicated checks.

imho, This should be as below:
if (flags & TEST_LINK_OFF) {

igt_require_f(psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, 
NULL), "LOBF not supported");

if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) 
|| psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))

}

>   	if (flags & TEST_LINK_OFF) {
>   		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
>   		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
> @@ -1051,11 +1059,6 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>   				continue;
>   			}
>   
> -			if (flags == TEST_LINK_OFF)
> -				igt_require_f(psr_sink_support(data->drm_fd,
> -					      data->debugfs_fd, PR_MODE, output),
> -					      "LOBF not supported");
> -
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe), output->name)
>   				test(data, pipe, output, flags);
--------------A8WpQX0bycvI90U3PuXSf06e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,</p>
    <div class="moz-cite-prefix">On 7/14/2025 3:58 PM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250714102812.212333-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Adding the Panel Replay support check later in the test was causing
an invalid skip, since the test disables PSR/PR in output_constraint().
Move the check earlier to ensure correct capability detection and avoid
unintended skips.

Fixes: 7da0c57182cc (&quot;tests/kms_vrr: Skip LOBF test if PR is not supported on sink&quot;)
Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_vrr.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9c2c4ac92..85a90bb25 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -960,6 +960,14 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
+	if (flags &amp; TEST_LINK_OFF) {
+		if (!psr_sink_support(data-&gt;drm_fd,
+				      data-&gt;debugfs_fd, PR_MODE, NULL)) {
+			igt_info(&quot;LOBF not supported\n&quot;);
+			return false;
+		}
+	}
+</pre>
    </blockquote>
    <p>Consolidate TEST_LINK_OFF condition to avoid duplicated checks.&nbsp;</p>
    <p>imho, This should be as below:<br>
      if (flags &amp; TEST_LINK_OFF) {</p>
    <p>&nbsp; &nbsp; &nbsp; &nbsp;<span style="white-space: pre-wrap">igt_require_f(psr_sink_support(data-&gt;drm_fd,  </span><span style="white-space: pre-wrap">data-&gt;debugfs_fd, PR_MODE, NULL), </span><span style="white-space: pre-wrap">&quot;LOBF not supported&quot;);</span></p>
    <p><span style="white-space: pre-wrap">	</span><span style="white-space: pre-wrap">if (psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PSR_MODE_1, NULL) || </span><span style="white-space: pre-wrap">psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PR_MODE, NULL))</span></p>
    <p><span style="white-space: pre-wrap">}</span></p>
    <blockquote type="cite" cite="mid:20250714102812.212333-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	if (flags &amp; TEST_LINK_OFF) {
 		if (psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PR_MODE, NULL))
@@ -1051,11 +1059,6 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				continue;
 			}
 
-			if (flags == TEST_LINK_OFF)
-				igt_require_f(psr_sink_support(data-&gt;drm_fd,
-					      data-&gt;debugfs_fd, PR_MODE, output),
-					      &quot;LOBF not supported&quot;);
-
 			igt_dynamic_f(&quot;pipe-%s-%s&quot;,
 				      kmstest_pipe_name(pipe), output-&gt;name)
 				test(data, pipe, output, flags);
</pre>
    </blockquote>
  </body>
</html>

--------------A8WpQX0bycvI90U3PuXSf06e--
