Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015F4C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 22:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9825E10E0B1;
	Fri, 21 Feb 2025 22:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xc/xIIWq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B60110E0B1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740177087; x=1771713087;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=iS2InsDpd9HKbL5IltisGqYpqswg/+uAdTIl1sa1mEg=;
 b=Xc/xIIWqrqIB/XGot9aFofOZAFVjuwNUk9Hgmdz35D9kw3Qp4swNdTWb
 9G7YP5pQV2uLg5EuiqowTakGalSx1dE1Vm1Jio2CiahCS6hG51WFOH373
 HxIjomZiBMv5bkLpHxBcX7z+4Eoe0Jnc1rmuWsl9pvXmoBmZJIiPQ0xSg
 bxejEDmF8GYoIvcMGX6oHKE7YA1ty4nXRxjoMBdycbtFOhafXw5cb6ILz
 oQOrRteTsNpA5Eb5t0JKvLhvey8pgbgJ8l1fsg3TXH4tMnhVaP7CcaGyf
 CT08lXjcg57SIS9tIdjyeAVX+fmjeb1e6eVxvV//r8YnjLCBMgLknvU3M A==;
X-CSE-ConnectionGUID: SQi4bE35RK6jtooJyWw5xA==
X-CSE-MsgGUID: 2Ul5/xZ5QW6pB8xGhHNCGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40199843"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="40199843"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:31:27 -0800
X-CSE-ConnectionGUID: NZiFg4lvTwuYRiOdSUSMyA==
X-CSE-MsgGUID: jzcgYSPjS/u45Myx3W37YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="138719572"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:31:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 14:31:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 14:31:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 14:31:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMhomrw+XCuZJlDZT1fJqVh2/CatxA00CAHIHIhOawDkDgvl6ri+TrsxZqndH7zbu/uEpU+wr/zshG0rgycsinubOylFke24sSpYE9/c/qPy9eOYxwBerbcFNO5xg+I2KDKtQfRVhjJJvjUu2uuKc+MgbH77vTIIVbjL6XoRvRrUwvyErciDwcFX2VeuB4JEp1i2GWKD8SdUyHZXl3X6p3zN7f2NEhHf93llyOajCgzpt+5ZTaeeLSP9wEjlwjhMfPTEfM5pp76YhNr3EFH6JaoXVUCdUZTo5WjydXCTx3gAr/BejlGDYZu3BTnQ+VMOUqtU8whhzq5V7Au9dDL4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vThSwd+Meq/wh4ylyAqPhQpnoCI5issW0A/f+ZLlrjI=;
 b=ff96KKcSOMFLp0E0BJ6ymX7aKpQGVAwVr7oVcOTdM0b4nj33KOAyhKd3Y4lagJoC+AdvNFfL+IkD7h95PHVX8Dc8NHppM4ebokF1ZEVKk13zvodkeOzfCf9uDQ+CI1LJ8iOPAd8WiSE3lI734poZTvyuIvEC26aCk2S/wtlC6mi8RHnR79c3tv4Q64bLvdR+RyGZ8aEnDLbyeGsANu8rf3a967tl+JQ6sjBG217W2eF/8M5scdsRWYldFOcYCNMPJr9h401Ftg1kYrI7dW4D9jXLUi4VdVy9nqDrRNwOFkS4hJ6CSj9iwJo7sm+k3kq+zrAXmBvXuMsBWb68a0OiRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 22:31:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 22:31:02 +0000
Date: Fri, 21 Feb 2025 14:31:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <ashutosh.dixit@intel.com>, <lucas.demarchi@intel.com>,
 <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] lib/igt_core: Add ftrace logs at test boundaries
Message-ID: <Z7j+pJ7oEL0lO/hS@orsosgc001>
References: <20250221222739.2335825-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250221222739.2335825-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7a9583-c220-4160-e666-08dd52c76c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGFXWThPS2x2bXVDWm9hZEI0UjJ0QUNFMU5RbTdDNmZta0dMVDRaNEJzeVdL?=
 =?utf-8?B?QnlLdHh2MHFFejQvb1lFQTBnL1BWRi9RUnQrRmJCNFBvRGVGU09SVEV0Um5x?=
 =?utf-8?B?bHB4eGxiN1k3Si85aW84UDNUeXgvU1Y5dUFhY09pNVpjYmh4Y0lvUzVNWkhR?=
 =?utf-8?B?d0Fwc3l4T0xldzZZOURlVkNkWGNHVkdlZnlhdXNXWkJLZVhGQ0ljYk9jUmNn?=
 =?utf-8?B?K0lUcUlGVDF4cWkySGdVRnNqMVJlTEdiUkpFMHNBTnZ2d0c5U2QxUlRiQm1q?=
 =?utf-8?B?NVcwTkNnck5mRVJycGdhU25mWWdOeTVWc2dMZXlCc0FPbW94N0tta2lGWmpF?=
 =?utf-8?B?c2tRd1JaaGwyU29rTXFFU1JKdFNUVG01Zkx3TVB4SE9keFp3TEhKZzd0OTBI?=
 =?utf-8?B?U28wdmwzUTNSNStRR01JNzJpbWhzSE1iNE9Hd1BIOHdJd2p4bTNQK2xTQVhQ?=
 =?utf-8?B?MkpmTVZsWDQ5ZDdpTDlOSTd0N0t3T3BKc3pvdHgrUXI1dFdVcThQQWRsR2lj?=
 =?utf-8?B?VjRsaGw2SHVUeGxBTFhsbkdMbkJ4dlk5NTU3bFVoYzR3T0gvU01YWGZPOUdK?=
 =?utf-8?B?T2lqK1ZMTHM5QnljbGZ1OVpYaVl6ZHdjSmc5RWZJVERHUmJHS2w0YVJkTjRT?=
 =?utf-8?B?SzMya2g2eDBwajlEMHMwb3U4Z1VmRmNETGhJTGpKQ1dkYUYyUE4yK0gvOWZU?=
 =?utf-8?B?RXlEZmQyQkUxc3cwQytGbWxuTWtzQzlCN0J2SFVPZTNtblFmcDRBclRZWkN3?=
 =?utf-8?B?YkJHcng2d0JGMitvNU1ISEt1dFhkLy9NaS9ZUDFiTktCTk8waDVqYng0THAx?=
 =?utf-8?B?WU9vUnpYTWt0V3ZZL3lpcmR4TDdxbW1hWGZwbDd4QVJoYisxRzI1UFgrajhs?=
 =?utf-8?B?QnBGblNSL3ljSkx6UFp6T29jMVM4NTFVOTRUN21LbHNaVnplb0orMmt2bTNQ?=
 =?utf-8?B?bWRaSUxpQyt4VXAzbnYxRHdESlVsQTU5SXNQV05jREhRcXR2c0NtcGFPU0Zk?=
 =?utf-8?B?RVQvSE02S1RHR0dCRUtPMDJadTVBTGkwaTVSR3prYmtUR1hMOHJ0eG5XVGEw?=
 =?utf-8?B?RnRWK2t0b3Azd09kMHVRRHFJOU1lTmNNcFNlK1R5K2RuZWxNS1NoK2JzYlRz?=
 =?utf-8?B?RS9Gb2dSajk1ZGdPVzBhdUpreEd2TEJsNjZUOWdtaGNodTVDWmVnTWpzaTZ4?=
 =?utf-8?B?N1pTVjVWZHRHeUR2MXlIalYxTEYrUkpzQkdDUzJTa0tWaFlZOWlqYzJOdVVC?=
 =?utf-8?B?dWVnYlc0T09YbkR3Mzkzdm0xdXVHQ1lOcFMveVppZnU4ZkVUMml1ajlodVBQ?=
 =?utf-8?B?QWxKRnl5M3ZHWnYvdmord0puWWNJL09KZDhmTGR3YzRRLzlhc01xS3d1T1ho?=
 =?utf-8?B?N21XdTZRaHowNS9GUEFodHd5UEVmMURldE5xMmFBc2hVU0Fva0JvMWd2Y0xr?=
 =?utf-8?B?OXBpUU1SUUtDMzh2alJuUWlkbnVKcXB0NmNlV0lRWVdSdWxKQk1KRzN1STl2?=
 =?utf-8?B?Q2haNU1XaXFvb3ExN2ozTFMvUys5WUZpRnRVTUxXRTdKcTdjcGZ0STQ1YjNh?=
 =?utf-8?B?dm5EbjBIcitHQTVwcnZnNnhua1lsTVhjUytpK0swSjRQZ3ZHTS8rWnJrTHBY?=
 =?utf-8?B?aGVQcjNQS3RDMHFMRDhOaXk5dENWV2V4dGsvV21udjc4U0cxOTdBN1hyS3ky?=
 =?utf-8?B?blIzUDhSdU10elRmMUFxRjhuMlhsL2s3clFJeVQ2Z2pLUHE3S0ZCaGZGN0FS?=
 =?utf-8?B?ZHkzRjFUSUZ4eXp3cFRGWnhjSVcwV3FYYVlHMzMzNHVQZXBhRVhGcW51QzRR?=
 =?utf-8?B?VUJ4aFFFQWR2TlEzUXVHTlZQU3VSQThBMnBVOWlJb0Z3UzJUSUl2Ny83S3d0?=
 =?utf-8?Q?03h9ByJTQtthO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWtPVjN3akZPa05LL3hMaVdzWHl3YTZlR3VVV09ibFlHNWZuMTdDb2ZhN0Rw?=
 =?utf-8?B?dU9NRThFeHIvcXFLdXRYdEtyUEx3aHRJa1hpYmFLZnJFU0RuNVMyQVY0T1J3?=
 =?utf-8?B?VVNZVU5NRUxLTE1NL1lXMG9UN0wzWlhVSXdlWDJldko0YzFoYzJRa0ZNSXRF?=
 =?utf-8?B?U0xlVmVlUUJxQnlVNjBzNStiOFVtR1ViZHJTQS9yNUh0WmRVRlBvaDJzSDRq?=
 =?utf-8?B?OUdQVkF6Q0I1eVNrSG8xYmVqNmovYmRaZ3ZncUFDVCtNQ1htaDlkZEFYQks0?=
 =?utf-8?B?THVYMjBwRVVmZVNqL0pCT3NLRlBMNC9DM2RuQndzc0tDcjB3d1lmd2FsYlNs?=
 =?utf-8?B?VlJpVUZUV1hJQ0ZXb1RMYVJ5NlhIWTllMGUzWG8wb0d0Y2lUOXJkS1FoSVIx?=
 =?utf-8?B?RHFPajNqV3hJYVF4WXd6dHdLREZ3RTI1UEhDTTZQbmpJSElGeVMxNWZoUXhp?=
 =?utf-8?B?K2poNjZTU2k1MitqL01odFhIak5nYjYvdkZRZlkzVjBqOFRJV0JQSTJCK1Bo?=
 =?utf-8?B?bjVROVZwRzRhMkx1M1dRQmFUdkRPblVnMU5SK1FNSzNyc1RPWGZteU1VSVh4?=
 =?utf-8?B?c3JMcFV2dkM1NG9BQWxaRGFNZkJQTDF4ZlMrVWRoMERKQUJBZit5Tm1kN2NQ?=
 =?utf-8?B?MGc0Vy9NWjhzZjFQL1R2eTJCaVBwM3R4OUFoNDIvZXREWnhBSGNhR1NYUXlo?=
 =?utf-8?B?MktlN0Qrb3IyRUFlbUZIUTVCeldja0tBUHlobWJ3N0pnbnFMV0FBeTRyYmRu?=
 =?utf-8?B?MjdHV0dCSDRBeXZldVNmck5kQ1ZHYkw5bXV6ODAwVEMvMzl3eER3b214ZWlM?=
 =?utf-8?B?aTFCQzlGNWhpT3p4RlRMTmErRlN6eXVrRWl3UEtrcUQvMHNzd2NlbGs0aVV5?=
 =?utf-8?B?bzJleU9teVcxeU1hM29CdjZVUHd5QitjZGN0eGlqUjdteFFuWnlQWi9kOFVr?=
 =?utf-8?B?eGh1aHZTdFNndHRyNnNwV05iSkhnRHVub2lMNGRuTFppV2Zna1k2bWd1NGF5?=
 =?utf-8?B?dmFveWhGU0JKSmpPL2s3dXB1dEtmU3grbkJCb0t3NDNpdFQzV29RUm5vS0NF?=
 =?utf-8?B?WEJaZzNadmtLQlpzeUtna2dVNnpWSVN5d3h5WmJaWjBWYUMyVTBZR01tQXFT?=
 =?utf-8?B?dkxVSEpGZUdhTGh6aVN0dEVmQThVS21XdXU2eTRndmlkTHFUdzJvVzU0ZDFD?=
 =?utf-8?B?c3gydEdwN29TZk5zSTBZN2R3d1lRQktha3lTRDF5NUZaZHZSSjhOaU9iTkdH?=
 =?utf-8?B?aG83enNPTWttbmlyU0F3TE5jV0srT1hiZ0xhNDlRa294cTZ3V2krR1ZiSXp6?=
 =?utf-8?B?YzlqNkpSaE9FWjgvcVF0UTVrMGNxMlhuVTk5cDVYZkR1U0ZUZDB5OEJ2dHQ4?=
 =?utf-8?B?aDZIcDdKT3RlTTZKSUZLTjhHU05QM2N2THhnQ1JzRWRUWDNodTBxM0EyWHli?=
 =?utf-8?B?Mi9UNzZtZStqL1p3ZGRTalMwbVVvcXdPZGtYcjlPNWc5anBXK0lkSW9lb2xK?=
 =?utf-8?B?WS9FWEl4eWlDWXE5WlpseWNod2g0MVBvdUw1dUNmMXhhSFRQanlBdXFoZldw?=
 =?utf-8?B?amlLcTQwK3BWbW1pZlM2OWxEL1hSMEhFbkhtRVJ3TElCYkxRbmNTaE1SUktD?=
 =?utf-8?B?S2ttc3VUbnJOb3pDMTFhV0F4Q2JmcGtvQVhrTDJNMWZIckxBRlRDNHJwTHcy?=
 =?utf-8?B?M0R1Z1N3UDNqYlU0S1I3bFBDdkhac3hiTlJERnl4SEdxczV2elJteXhBckV0?=
 =?utf-8?B?ejREckRNNEtteHpqWjlzRnFvS1ZmL1JXOEJZMUJoTVh2UU1aZ0Qvbzd2eVZY?=
 =?utf-8?B?VDRuZ3NzNEUyczRHOUFJMEJ0ZTVKSFZmL3hXRzArTnNJaGljMC81ZHNZNEVy?=
 =?utf-8?B?SGVDY2tNaHBXNVFXQlRyOGliTllPeHUxVjczUkRpUGtoZGowbVJaZzFmSmJk?=
 =?utf-8?B?bmFkdTg3ZUJjTjZmVDRTNUQrby9HaG9QN0lISitwTkZvNnkyYkdUM0piK2lG?=
 =?utf-8?B?YWd1azVmUit4aDJVS0gvamlHODNOcEtwSlg3YmhFMmdIdWtzQWc1dTBqK0po?=
 =?utf-8?B?KzdoNTF4bG5NcFFnaGRSbUgxa3lkckRpeHhRbFJ4MUd0K2tlMkhFME1wL3d0?=
 =?utf-8?B?NklEWFdsSE11TWc0RDdxUVI3QU0zek4zanE2TldhcDdPbGR5TnVrTTM0eUc5?=
 =?utf-8?Q?/JsL/p7klXCIQ7qA2GzmAVQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7a9583-c220-4160-e666-08dd52c76c33
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 22:31:02.6653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b7q7hghxdWSkpbV04jluodG8yh6Ub7jZsW3sXjR+QMjEpJjThpI8o1DTwS03+66u68TL2CFfjUvF5H3c41F8fVbj+zA06E8A3M014toGbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
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

Wrong version sent, please ignore.

On Fri, Feb 21, 2025 at 02:27:39PM -0800, Umesh Nerlige Ramappa wrote:
>When looking at kernel ftrace output, it would really help to see the
>test start/exit boundaries.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> lib/igt_core.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/lib/igt_core.c b/lib/igt_core.c
>index b95db1b25..6d9928e36 100644
>--- a/lib/igt_core.c
>+++ b/lib/igt_core.c
>@@ -1324,6 +1324,7 @@ out:
> 	if (!igt_only_list_subtests()) {
> 		bind_fbcon(false);
> 		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
>+		igt_trace(KMSG_INFO "%s: executing\n", command_str);
> 		print_version();
> 		igt_srandom();
>
>@@ -1528,6 +1529,8 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
>
> 	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
> 		 command_str, subtest_name);
>+	igt_trace(KMSG_INFO "%s: starting subtest %s\n",
>+		  command_str, subtest_name);
> 	_subtest_starting_message(_SUBTEST_TYPE_NORMAL, subtest_name);
>
> 	_igt_log_buffer_reset();
>@@ -1681,6 +1684,8 @@ __noreturn static void exit_subtest(const char *result)
> 				igt_time_elapsed(thentime, &now));
> 	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> 		 command_str, *subtest_name, result);
>+	igt_trace(KMSG_INFO "%s: finished subtest %s, %s\n",
>+		  command_str, *subtest_name, result);
>
> 	igt_terminate_spins();
>
>-- 
>2.34.1
>
