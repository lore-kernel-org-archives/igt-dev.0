Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6E2C982C3
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 21:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED96410E021;
	Fri, 16 Jan 2026 21:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAbdG7aH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9133E10E021
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 21:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768599244; x=1800135244;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xlGQO6Ap8n8diyBk3C5CzN/8etZIHITpB73bZxJpntU=;
 b=GAbdG7aHEG3364hT1yyCYx0eEs72J10Bs2Cm6P+hPT/fPXjhi+91ppb7
 6i0lji5qoNM+pwTYqoAUhc1w+a/e1KYr6/MdTqIvDvhfVb7HL3VfNBiRa
 o3RPSL6MKan2qWmNRyUp04qZ6FJwCh2edjKWvRDM917knZ1h3zkZLAjJx
 HZfUsx2SDe61huG5YAjafyRWPDhhIHMwY3HxhH++v5htcy257lSXGvCdz
 HJ39Eiw80B9+2pskKMZxdx7SSWtQB2ZAs2KLkdeeskXJeqnlUaIKYrqKx
 rWoDfJzCCC++TEjK70Nan9NxZDTHLSACqxl85m1SzChpMSFD2m+v/aqbW w==;
X-CSE-ConnectionGUID: Ij3OZJpwRGKORImcCuWSRQ==
X-CSE-MsgGUID: 18awWNCdQQmCn/Jngl3Mzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73771386"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73771386"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:34:03 -0800
X-CSE-ConnectionGUID: fBQtWpMWTyW8RaMgSDQD4g==
X-CSE-MsgGUID: I6DHdK7cTQ+/J/rBctVRQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204953378"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:34:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:34:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 13:34:02 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:34:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLOWw4B9rOvLnLZNs+mmggE6nwuwTq3cBe23u4NW8iWhgW4Ruin7vHZ0HE13x1ZcQGg/X5fyAsZAuC9S05JGhWnJIVpKsUExTuUEc6OY8WUa/xJ5n/OYZRBBaHS6UqXm66EAPh4C9UcuUKA5CcgmS6mTZs8RHk0Gm9S/1DFGEYZtAz/7NpeRskxteQmG6QjSLC/zXJdir3zB1KOyyJHx+51Po0jBAnJayb3bggHPGoNCDaWfL5h9OzrmMYA5aRqeHy7m8Cweb2j9nkZoSprtL37cnhgSz/hQbarRycpY5Ab/JtCeutzJ+G31BjbIuvrzdoGGumTUq4DffH95lUsLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3VC49fCBhY/v5/WPQTnGrpCDCSxV1jpn27vOrtKR1s=;
 b=t2QtBm/8dKUmrLf2v4NthbxbXqExMPT+3qkbM1xscffAvaQhRWyva2Hqo7i2iqUkq00LkIeiPwoeVMTVzg3idsLt/9esmTPxSOk54Ykq41M+byCNKMwasHnZTpbLSKd1UtTzOe1XrJwkscFDO3aol3S7xKYmbJENAM9fFdSufmM9U5qeL0gJk8I1p/TbdM9bfkNHCjiSSjpn6MjHRKs/fVIXVoBhkVEQd0AuSZXv73MTfVyphf8zIxtgEvbp0WhXWCpXFVCy6Qgq8NubvXJgQWUcTcJdc+FAlwtTzNhHgtIbKQcSnCC1tDvjE0ZkX/+AFC+jC8X6GbfSM5Wu+MHiAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB8890.namprd11.prod.outlook.com (2603:10b6:208:55d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 21:34:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 21:34:00 +0000
Date: Fri, 16 Jan 2026 13:33:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Ravi Kumar V
 <ravi.kumar.vodapalli@intel.com>
Subject: Re: [PATCH v10 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Message-ID: <20260116213358.GJ458797@mdroper-desk1.amr.corp.intel.com>
References: <20260112191732.672297-1-x.wang@intel.com>
 <20260112191732.672297-2-x.wang@intel.com>
 <viv6pwhicr6jjm5d4hoznn7w4h7ixamqdwalpx3eb3aoc5fgbr@2rrcrdhe7rsn>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <viv6pwhicr6jjm5d4hoznn7w4h7ixamqdwalpx3eb3aoc5fgbr@2rrcrdhe7rsn>
X-ClientProxiedBy: BYAPR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:74::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f6a0e3-2cd5-41d1-5729-08de5546f674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG0wUzV5ekx2ZXh4Q1ozQmdyK2U2RDlNa2lBdDhGMmF6c3VLcnRRVUVTRlVM?=
 =?utf-8?B?aDNKd0JqR1h2UVRwbnc2am5SQVFoL3pqeVZ3K0Fya3BjalF3UDVrL3RRVkpo?=
 =?utf-8?B?cFM1cXJWT0VuZE92YlBadXpZeTVFbzUvMWJxOU1XUTVURXB1TEJPai9JTHBz?=
 =?utf-8?B?QnZHYUNlL0kwY0I4d2hkQkdVRlh0bHV1MmJVbjN1MjUzM3VkWWR6ZWQrRUJ2?=
 =?utf-8?B?VmJXeTE0RXBwUzlaZWlSZVRremtpdWxjZGpaSnduREE0Zm0xUjNpd1lRSGdJ?=
 =?utf-8?B?QkRCZVllT2pFVWtSUjRScGRMTmtPaFJETllycnVJdWZjbHJVMzNiV1AxUnhO?=
 =?utf-8?B?cHZUdmdTdEI1L1dlTzB6cExZS3NYcFpvUzFUZ1BNZkRucWlabXA3bjFUbTBy?=
 =?utf-8?B?RTdnMUdFeGdLbXJUdFYwa3Q3MVFDQlpyWHNhdFF6d05kQy9EY2lkU3VHbGlh?=
 =?utf-8?B?dXFDckRSNGZyd0owOEtwRWkyZk5tVkxZRlg0RUtpaTNaRjcwZVkwNnBvZ1BL?=
 =?utf-8?B?K2lRb2R5dG0yOXFCaHM4aE5aWWtBaHlhUTFZRjJqaGd5ZG5UaWFqcHBWaXh0?=
 =?utf-8?B?U1VOWDdBTEdXNkRGem5xYWxTUExDVHkzNkZqdHlnKzExR2NpbVdJcS9XeU9J?=
 =?utf-8?B?cVVJS1E1aTN0UXZLOS9wZm9RZ3JwVFFmYnRFUUJvSW5sdkxIMkg3eVJoQktZ?=
 =?utf-8?B?dzcvMHlrZmY3RmVIUTZNNkhyc0tMaXpaWlRHVTUrRmE0c2tHeWJRQVBLYk1H?=
 =?utf-8?B?WnNLTm5weWxKZmpyY0hmVjRxSHBHamtnMGVnNmFtR1VXT1VySDJYT0dWVm9N?=
 =?utf-8?B?Z2ppOGtyd3FCOC9STit0cGFtcmpCWDFyMmZLQ1l2WHBTWDMxRW9aZTR3M0Rk?=
 =?utf-8?B?QjY3aG11RC9GM1lOMGoyZGkwZGZDQkFQNHpxc25DdUJKV3R4NkJKS2VvbXNE?=
 =?utf-8?B?enZyc2o0S1E3azhFcmxxUk5oRkt1Y2RWMlNKdnNvU1BWOWlBeWt5N1FSR005?=
 =?utf-8?B?T3lZcEVQODJWTWpIMUY5ZDBYU0Uvd3g0M0svdGl3eHQ3K2lMMlM5VERiQXpX?=
 =?utf-8?B?OUhBYm4xdGFXSWhFM3ljc09iVEJodU82T1pDRmxQNTZreGxiblplNkVsU3Vj?=
 =?utf-8?B?NDFkRFFGSS9Ec2tnL2FKWUhDTWZ2ZmFjZXVYcHMxb0U0YWUxajdadE1KRkJQ?=
 =?utf-8?B?Si9lTEMrdkpBZEgwdDNjMURaV25qUmdpeEdraXZNZm9Fb29lOG5TZi9yUEN6?=
 =?utf-8?B?ZjZoWFlYeHAxbU42anR2djdnZGpJQTFidEpUQ2FLMldtUGhHT2Z3ajg2bmhk?=
 =?utf-8?B?eXVCN0Y3ZkJ3YzNmaUsvSnFCZk1QdkZKTU1CdGRmWG5VZG9zbjZ6bmovcVFU?=
 =?utf-8?B?R05aVHRidVVqY21mZWFWQ0VtRVpHZUI4alZRditXMmhYRElUZTdoQ204T0Jn?=
 =?utf-8?B?aTdVRERKOXl0OC9lZW5MYmtCVHBmSUxMRS9BTkNvVExac01UaXgwNytoQ3pM?=
 =?utf-8?B?anF0c2JZMVVVKy95em5OaGFIWjdXSVRvKzlRaFh2eTVGUWZ0czFyeTNnREdH?=
 =?utf-8?B?ekpQYldKc1haOWZ5N25iS1JjL0JpUVZjNVBkSm1NTys5WVFFd2RYVjlQcEpw?=
 =?utf-8?B?cFJFVGpkdmd2b1huKzRDc2NBV3Y4dURiTmcvNFZwNUJ1blovZVplQ2E4aGVh?=
 =?utf-8?B?SlVWNFRYV2lWeGdTNGhEc2lRNVN5UE55UWFTWEVCR3owQm14eEtZaXpYQUh4?=
 =?utf-8?B?OGIxVHhBZi9VUnFlL05SSEFmNjVXZFk2cjR4UXZvUmFoZnR1YVlCaGQ1eWsz?=
 =?utf-8?B?RUdLZFBSVDBRVDMzdDJUWTl5bmZIbWxoblhlM3lPUGpYT001TVN5ajdrdzZO?=
 =?utf-8?B?ajBhdVNnc2V0SFVZWm5IM3VFQmdudXVpeEh3Zm80NFFMbENFbnYrWDJCeSs1?=
 =?utf-8?B?d0FLTWVpamp2QmtTTGVsZ3k4Q0lsVWdNa2pTVlExYm5MMUwxUnZ1c1hLR3Zt?=
 =?utf-8?B?dGtPMk9tcXRGWkdBbms2QU11NUNoL21aMWIvZXFIaG5CemViS3dQQTZleEZz?=
 =?utf-8?B?S2IyeXdGU1NJbzZHbUlmQ3FkTGU2VGpSYlEwK2R6NGZGcmJLWWovekpvQjli?=
 =?utf-8?Q?GPeA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzFLRjIvd1hHYm5VeGFMcEpuYjFaSi9UeXIvY01TazZwenE4SHJIWDE1QVpv?=
 =?utf-8?B?Q2NBTE1XanhkZUNidTZHMHhmTnBCVy8wOGt2Snh1TmkxRUVRdE5aVFBHRHdL?=
 =?utf-8?B?NlJET05nb2VRYVlUbWJOTVVSYk56NkptMDNReFMvQmxONkZIOGcvV0Z3VkZv?=
 =?utf-8?B?b1AyK3VqS1FBRTlGNGI0Mkk5YllLUkJXU3VFZFNGU1ZKekVnTUVqOHdLZFpK?=
 =?utf-8?B?Y2dLOTFKTDJEU0dNdUdVODlqR1FBc09UejJ0OTQrdjU3WmRNcDIwa3A5MEVK?=
 =?utf-8?B?MnFnd3l3L0MrbW5iWjU2aUFMWUg3V3BWTEY2M0o3ZkVQbDd4UWdySmVlNHlH?=
 =?utf-8?B?eG1pRTJrN3RKZVhhNzlOZTg3ZWduMDFEdy9EVFh0L2x3aE9UTTdsc3BvUk1s?=
 =?utf-8?B?YnhocjZJNTZSTjVkMWs1Tk8xMXQ4T0NkcXJlUWUwS1dTS0VDVTVjZXk0aDBZ?=
 =?utf-8?B?WFR4dWpneENCUTlIWU5DQWV4QkVSWGFhdUNRdm9EYzNuL1ZLdUpqRlUyWjA4?=
 =?utf-8?B?cnNzamttOTV5dWpuVlRTNWYrbUp2dG8vclFJQmpVQ1plRVFuZS94c1RHd21G?=
 =?utf-8?B?dFY1TUx4MWJpeVp6SURwbXlLdmFidVRKSStaMkpVL3JnOGFoVVoxTW04OHVF?=
 =?utf-8?B?eUZEeFNkOTRlYzAvMG02b0xRdVg1ZVRHTDRWKzQ2bmlMblBqR3I4Mi9WaStF?=
 =?utf-8?B?NVhibUVSZjYxdTFZUFVINm9lYzFTRUdXQUxZT1BNQTkvbTVEcEN4ck5hUGhj?=
 =?utf-8?B?Uk4vYitWMEd6ZU1ZSVFOelEveXlqZzdkTmwyd0dCSndOaFlaa0U1TUhUSEdD?=
 =?utf-8?B?NzVRYWVHRi91TzJYQ2tENElGWHpsaVdML2VBQnBoRUxWcDByOVZKUGtTUUgr?=
 =?utf-8?B?a0gvZXNvNEZDTHRITDhPdVNUcW1zUmtoWWptZ0Q5aHdxVUNsN2FDQnJsa253?=
 =?utf-8?B?eEllWDBmeDJkcGVnU0JhV3h0elJnMmFqUVZEY2JlR09mc3FTVGdIanhCRGdN?=
 =?utf-8?B?SE1xQThJcUtueFliOXpELzBMNkQ2U1o1cVpKZm9ycXNCU3FoRWZpYVM2ZXFv?=
 =?utf-8?B?RFJmWUJwQ1czQmNvdkRUTXZWazBDcHdUVDdnbmdFbW9qS1hMZFVIR0lDREI5?=
 =?utf-8?B?aFBiTW5Ib0N2Y0g3aXJUV0JIckFCMSs0bVVNL0UwYXoyZGNTS0E3azdwSkNt?=
 =?utf-8?B?Z3R2b3ZJNE5PemgzZld3a1pkYzZxOFRaS0ZpbDNvc1I0YzdDS2NCQmc3aFRp?=
 =?utf-8?B?M3JsaWNveThmaVpQUUpyVVprRnA1NFlkRGVsMVhlQjZicnp3M3RvcXhKeDBB?=
 =?utf-8?B?R1NBc3R4UlFOY0I0WGl2MWFHV0JpY2drR3pmQmYyNVpMZ2tSOFpSb3c0TnhT?=
 =?utf-8?B?dDlvK1kvT3E4aWZHc29uSmQvZDNOUEszanIvYldmWFg4NGUrVmJrSC9xWXJS?=
 =?utf-8?B?WGZtMUh5YmllU09NM3R1b3lNVllNdzQrZFo3N0VqWk0vU3dTaFhIeHg0U2lp?=
 =?utf-8?B?aUpaSUtaMk9MdnlUdWFuRitqMDN4YzNMWVYwSTlzNFZ0SVhvdDBvYzRLSG8v?=
 =?utf-8?B?UmJpbGNONmFSbEprT1YwN3FjZmhoYStkay9RVXZHSlNSeEswUE5iQkVoVVZD?=
 =?utf-8?B?ZXhTZm1tUmdBbnV0WVkzaThBVUNkVTVkQmVNL2loMEZaZjBmbEJrUlRXWVhy?=
 =?utf-8?B?c0FESXhJaUtvTlJXekREZDBQL08zYlk3ZmVaTzRsUFZjZkRGRGZvTmpzemQx?=
 =?utf-8?B?T0drV1AzcjczQ3dJc1ZIemVCa2drS3c5U0xnRndQTUR6OHg3VldWM2d4NU83?=
 =?utf-8?B?aFRrS3Z6K1E0UUtNSzVvaXAyaFFnLzhmRlpVUjluNWlxSFVIbjQyczVweFhl?=
 =?utf-8?B?YUNHdThoOWovTmJvc3VEeE5waGt6dmVOd2lxZ1RkSDc2alNXeGozeUF1MGZC?=
 =?utf-8?B?ZDFPVWZsenh3KzR4c3Q3bGFDNVNoM3hOZUFmcVZmcGZ3MzV0eitsR3huUWRP?=
 =?utf-8?B?Y3VGcmt4R25odzNSd3hyUy83aXJ4WldYN2dXYnNRYS8ycEtieTRrS2U2d0U0?=
 =?utf-8?B?YmxidVdRUlNySklFdTZ2T1RoeXV5ZlFsbk92UWdBTjhHVnRWRzloZVpNSlVp?=
 =?utf-8?B?blBaaG9PSGZHTEY4WWNkcTBCUTJQZUJFZDUxM01pVEpxQVRmT0hsTHRLd2Ji?=
 =?utf-8?B?SjRNbThIam5QeEIxamdVRVAxemEvaVVPbFd6WWVTcGQweU1zdGk0OHU0aG9t?=
 =?utf-8?B?dWpFTzBzRDluOXZxOTBHaWp0WktUV0FPUk12WC8vS0docjJVb1hpWnZQa3NN?=
 =?utf-8?B?eit0R05tS3BuNTlEcFVDQVhVMnl4R3doak1qTzlhZUJ0dWxxaXpsT3ZwenFS?=
 =?utf-8?Q?aCYq9iBohC9ZBmhM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f6a0e3-2cd5-41d1-5729-08de5546f674
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:34:00.6046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PynKNCodYasff2XNDaZcPzBS/B46Y0LGRQijYlT6iM2q4xgBPyTgcrMWeSmvcy7oHZShyvWlRsbnJSytjuSdeQfTl3AvqAzt1pOEi6ZBaCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8890
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

On Thu, Jan 15, 2026 at 09:00:53AM +0100, Zbigniew Kempczyński wrote:
> On Mon, Jan 12, 2026 at 07:17:31PM +0000, Xin Wang wrote:
> > This allows IGT to query the exact IP version for xe platforms.
> > 
> > Key changes:
> > - Add xe_device_ipver field to xe_device structure
> > - set the graphics versions based on the GMD_ID
> > - Cache device ipver in global map indexed by devid for efficient lookup
> > - Implement xe_ipver_cache_lookup() to retrieve cached ipver by devid
> > - Clean up cached device ipver when xe_device is released
> > 
> > V2:
> > - add new struct xe_device_ipver to hold the ipver info
> > - separate cache map to eliminate collision (Roper, Matthew D)
> > - changed function name to xe_ipver_cache_lookup() to avoid
> >   confusion (Roper, Matthew D)
> > 
> > V3:
> > - optimize the coding style. (Summers, Stuart)
> > 
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
> > ---
> >  lib/intel_chipset.h |  6 +++++
> >  lib/xe/xe_query.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++-
> >  lib/xe/xe_query.h   |  4 ++++
> >  3 files changed, 63 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > index cc2225110..424811f7c 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -100,6 +100,12 @@ struct intel_device_info {
> >  	const char *codename;
> >  };
> >  
> > +struct xe_device_ipver {
> > +	uint32_t devid;
> > +	uint16_t graphics_ver;
> > +	uint16_t graphics_rel;
> > +};
> > +
> >  const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
> >  
> >  const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index 981d76948..823a29f2d 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -210,6 +210,22 @@ static struct xe_device_cache {
> >  	struct igt_map *map;
> >  } cache;
> >  
> > +static struct xe_ipver_cache {
> > +	pthread_mutex_t mutex;
> > +	struct igt_map *map;
> > +} xe_ipver;
> > +
> > +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
> > +{
> > +	struct xe_device_ipver *ipver;
> > +
> > +	pthread_mutex_lock(&xe_ipver.mutex);
> > +	ipver = igt_map_search(xe_ipver.map, &devid);
> > +	pthread_mutex_unlock(&xe_ipver.mutex);
> > +
> > +	return ipver;
> > +}
> > +
> 
> Please forgive me for sharing my thoughts only now.
> 
> I wondered about this a bit and according to current code shape
> I don't like this design - especially ip_ver cache in xe_query.
> I mean I don't like to use external cache which might or might not
> be filled at time of calling intel_get_device_info().
> 
> At the moment I see following options:
> 
> 1. Provide update function intel_device_info_update(devid, ver, rel)
>    allowing to update rel field during xe_device_get(). This still
>    keeps intel_device_info.c independent but rel field might be
>    incorrect. BTW I would set it in static definition to -1 (max
>    unsigned) to catch it is not set/updated properly during
>    intel_get_device_info().
> 
> 2. Add new function intel_get_device_info_by_fd() which will support
>    passing fd instead devid and migrate code to use it. Most of our code
>    uses fd to acquire device id before calling intel_get_device_info()
>    [exception is igt_device_scan which uses pci devid directly]. This
>    will break intel_device_info.c independency because we start calling
>    driver functions, but maybe it is time to do this (GMD_ID).
> 
>    Digression: It seems when INTEL_DEVID_OVERRIDE won't work properly
>    but I wouldn't care about it for now.
> 
> 3. Mix 1 and 2 but build hash map from intel_device_match[] in the
>    constructor and update it during xe_device_get(). Pros of this
>    is we could stop using 'static __thread' for caching last info.

The problem is that "graphics version" and "media version" are not
supposed to be a characteristic of a general device type anymore.  An
individual device will have some version number, but another device of
the same "type" with the same PCI ID can can potentially have a
different IP version.  We've been lucky enough so far to still have
unique PCI IDs for cases where the version numbers are different (at
least for production parts), but this is not something that we're
supposed to be relying on since the IP disaggregation happened around
the MTL timeframe.  Personally I think that hacks that keep treating
versions as something associated with a device type are just making the
problem harder to untangle.

For a proper solution, I think we really need to separate the concept of
"traits associated with a type of device" (which is the stuff we have in
the device info structure which can be accurately looked up by PCI ID)
from "IP version associated with a specific device instance" (which on
modern platforms can only be accurately looked up in the context of a
specific device handle such as a FD).

So aside from a few special cases, we want IGT to stop translating PCI
IDs into version numbers and instead start translating fd's into version
numbers.  The special case exceptions I can think of that don't really
have a way to do fd-based lookups are: 

 * tools/tests that bypass the driver entirely (possibly running without
   the driver loaded) and just use libpciaccess for direct BAR access.
   Most of these either don't have version-based conditions or only have
   version conditions matching against very old platforms (where a
   PCIID-based lookup is "safe")

 * the old i915-era error dump decoder tool just reads its information
   (including PCI ID) from a dump file on disk.  The tool might be
   executed on a completely different machine from where the dump was
   originally captured.  I don't think this tool has been updated since
   gen8 (everyone switched over to using the Mesa tool instead), and I
   don't think it would function at all on any of our modern platforms.
   So if this tool is still useful at all, it would only be on ancient
   i915 platforms where a PCIID-based lookup is "safe."


The solution I suggested during an earlier review of this series was:

 * Create separate "version from PCI ID" APIs that can be used in the
   few special cases listed above, and migrate those uses over.

 * Change the signature of intel_gen / intel_graphics_ver to take an FD
   rather than a PCI ID; when running on Xe this would do the lookup via
   the query ioctl to get an accurate value.

 * Update intel_gen / intel_graphics_ver:
     - If running on i915, fall back to the device_info lookup that
       we've always used.  That's safe for all i915 platforms except
       MTL/ARL, and we were lucky enough that they never created any
       production MTL/ARL platforms where a single PCI ID had different
       possible versions, so it winds up being safe there too.

    - If running on Xe, use the query ioctl to obtain the version
      number.  This will return the proper value for all platforms
      officially supported by Xe (i.e., Xe2 and later).  It will return
      0 on pre-MTL platforms (which aren't officially supported), but in
      that case IGT can fall back to the i915 approach above.

I did a mockup of the first two parts several months ago:

  https://github.com/mattrope/intel-gpu-tools/commits/forupstream/version_query/

Since the function interface is changing, it's a lot of churn, but most
of it can be auto-converted quickly via Coccinelle.


Matt

> 
> --
> Zbigniew
> 
> >  static struct xe_device *find_in_cache_unlocked(int fd)
> >  {
> >  	return igt_map_search(cache.map, &fd);
> > @@ -270,6 +286,24 @@ struct xe_device *xe_device_get(int fd)
> >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
> >  
> > +	/*
> > +	 * Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
> > +	 * We should use the hardcoded value for the non-GMD_ID platforms (ip_ver_major == 0)
> > +	 */
> > +	xe_dev->ipver.devid = 0;
> > +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
> > +		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
> > +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> > +			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> > +			xe_dev->ipver.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
> > +			xe_dev->ipver.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
> > +			xe_dev->ipver.devid = xe_dev->dev_id;
> > +			break;
> > +		}
> > +	}
> > +
> >  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
> > @@ -304,6 +338,11 @@ struct xe_device *xe_device_get(int fd)
> >  	prev = find_in_cache_unlocked(fd);
> >  	if (!prev) {
> >  		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> > +		if (xe_dev->ipver.devid) {
> > +			pthread_mutex_lock(&xe_ipver.mutex);
> > +			igt_map_insert(xe_ipver.map, &xe_dev->ipver.devid, &xe_dev->ipver);
> > +			pthread_mutex_unlock(&xe_ipver.mutex);
> > +		}
> >  	} else {
> >  		xe_device_free(xe_dev);
> >  		xe_dev = prev;
> > @@ -315,7 +354,15 @@ struct xe_device *xe_device_get(int fd)
> >  
> >  static void delete_in_cache(struct igt_map_entry *entry)
> >  {
> > -	xe_device_free((struct xe_device *)entry->data);
> > +	struct xe_device *xe_dev = (struct xe_device *)entry->data;
> > +
> > +	if (xe_dev->ipver.devid) {
> > +		pthread_mutex_lock(&xe_ipver.mutex);
> > +		igt_map_remove(xe_ipver.map, &xe_dev->ipver.devid, NULL);
> > +		pthread_mutex_unlock(&xe_ipver.mutex);
> > +	}
> > +
> > +	xe_device_free(xe_dev);
> >  }
> >  
> >  /**
> > @@ -365,13 +412,18 @@ static void xe_device_destroy_cache(void)
> >  	pthread_mutex_lock(&cache.cache_mutex);
> >  	igt_map_destroy(cache.map, delete_in_cache);
> >  	pthread_mutex_unlock(&cache.cache_mutex);
> > +	pthread_mutex_lock(&xe_ipver.mutex);
> > +	igt_map_destroy(xe_ipver.map, NULL);
> > +	pthread_mutex_unlock(&xe_ipver.mutex);
> >  }
> >  
> >  static void xe_device_cache_init(void)
> >  {
> >  	pthread_mutex_init(&cache.cache_mutex, NULL);
> > +	pthread_mutex_init(&xe_ipver.mutex, NULL);
> >  	xe_device_destroy_cache();
> >  	cache.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> > +	xe_ipver.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> >  }
> >  
> >  #define xe_dev_FN(_NAME, _FIELD, _TYPE) \
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index d7a9f95f9..19690cff3 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -74,6 +74,9 @@ struct xe_device {
> >  
> >  	/** @dev_id: Device id of xe device */
> >  	uint16_t dev_id;
> > +
> > +	/** @ipver: Device ip version */
> > +	struct xe_device_ipver ipver;
> >  };
> >  
> >  #define xe_for_each_engine(__fd, __hwe) \
> > @@ -181,6 +184,7 @@ static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
> >  }
> >  
> >  struct xe_device *xe_device_get(int fd);
> > +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid);
> >  void xe_device_put(int fd);
> >  
> >  int xe_query_eu_count(int fd, int gt);
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
