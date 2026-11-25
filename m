Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E2606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GXQddKeu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RsH1OkcD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C2010FB9F;
	Wed, 25 Nov 2026 11:29:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D47710FB9C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 11:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795606080; x=1827142080;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=11jfo7MTJaEnbVTQ8+c6SoCeol2SmLs/ZBj60iGbFxo=;
 b=GXQddKeu73x83UrA0341DTkRG6vbgs2/Q/DZMlf7/W7tWPXHYwgujMLU
 2GY05Ag1MEaemSnpeG0OcpTQT9xovEvDVq8Yb2ZPL2tLaU1VrXXWnCcMh
 LQl/buceBh9QaFNL+qPUUJsaKiio9FCZexTCniANZwu9PZkVW5/tLjLbz
 KhEWjFaaTx2DnHZVIOgZO4ELLexJsDs3N7ZCqaqjP8v95v7VrH2Kyl+MN
 0xEMutfL9J4Ayr5o2kDKBKfedXa9nLKee/Dzfq/hiQqJrufOsxsKo4ngI
 hVLB23At6wcPcjTQoz2+L/doiPjHp05kzCHX6ytr8z3it3IUzcIchmYLb A==;
X-CSE-ConnectionGUID: mBvhgDVWQG6R4bvPTt2j7Q==
X-CSE-MsgGUID: Xg5pPBeuRZej1Mjef+9wcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4393043"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4393043"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:27:55 -0800
X-CSE-ConnectionGUID: rFaXV/zHRqWWoXFbFipnmA==
X-CSE-MsgGUID: 0bZ2Sx/1Q+W9SW9oKyKOWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12436322"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:27:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 03:27:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 03:27:54 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 03:27:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+98dIHPJuvaArV0jYRhlQCWi/zwYGBAfo5YoUVWQF1RiXg9kEla2Qg+6+7RsHfzRITu37q4qIkWju9EPbNZ1olV84tbTFy4N7wJf6AynwEbEEDfLDEk9I4+JEsBQGWs1pldf7OigOzXzw9jZ57Mb6wAuhu6PZBgBp8MQXbBSAEB5XzOuY6qvkmK2A0M+eFPePJA6vJc3lhF2V9i9aEJ7AyIs6W5w7Ei0WJV9Tet4WycnkLBEnWYokN3aeAEkxm4ozO+n6GEEgRs6ioYipK4c5bMXKTO/1wQ5sDA2AHnpdyFHmDEyFs4GVSjT7LzsJ1MeZQEFgZ6JPtzZHscCLCCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC2zusD+cmbM1iZ9BMeoYk26UF8TajQK7KIUpZE+vvU=;
 b=pt8S2ilh9TCk6WCrOMAM5od/4uFY1Z2mmEuxuFrrYTBtP9q0EPsRqNuPbgY1mTmIzmhJ+ZwqV9r7QWpGauo66vENoIzEOb+bUbriJAl78qviUvgi39EO6tLRgBkuKGi4qhFvs0WUVoQNjDy0AU9cvVUXGqmg+b3pA11e1xXL8JT4GweADQcekKP06Vdmr0726oWf1BARyL4ORMtzsS5G9eUCn5zlt4uAe1uPBfBvgtuU+BC5bowQrTTXEpolE//cCfvAYP8whus6WSr1BGSh8ekFPQgdFCJDH28JC9RCZYku1wCKHCkwPYhAd8BCTe9s1W9RRAqlxi2EAIrqOLOlDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC2zusD+cmbM1iZ9BMeoYk26UF8TajQK7KIUpZE+vvU=;
 b=RsH1OkcDuQNRRVNnO29zWEGLh3uiJb3PxLWw9tMks5B9Y2+Cc+3cClSHt49YMPW1meCTrxZnNIwWYeMDfVlmuR6k7ujO9b1wbtWyLXJ4gGqASRUuS6R3/iFu9WtX9X6xE81Tlm7F/BQXO/R4NkguqSHc0NQGHp4fe8WJmKk7ZL0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA3PR11MB953716.namprd11.prod.outlook.com (2603:10b6:806:536::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 11:22:50 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 11:22:49 +0000
Message-ID: <709c299a-9d30-48ec-84cd-63fbfac4981c@intel.com>
Date: Wed, 25 Nov 2026 16:52:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] lib/igt_kms: Add max uncompressed dotclock
 limit for non-joiner mode selection
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@intel.com>
CC: <jeevan.b@intel.com>, <sowmiya.s@intel.com>, <ankit.k.nautiyal@intel.com>
References: <20261125102352.1905996-1-karthik.b.s@intel.com>
 <20261125102352.1905996-2-karthik.b.s@intel.com>
 <e88a6659109163b48e9f60fa66a6214e27506ba4@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <e88a6659109163b48e9f60fa66a6214e27506ba4@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::7) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA3PR11MB953716:EE_
X-MS-Office365-Filtering-Correlation-Id: 604a677e-9dae-452c-524a-08df4ae66fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|42112799006|10067099003|4143699003|261009223027099003|11063799006|261028144727099003|56012099006|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261026140227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 2RDPDd7psS7pdjGkgfkJNgbDwE1gvUyXz2OycMY+X+rY2Vo5FHpXgorUBFggY52B7diQO6QwAetrZ7Mo/OhmPTasw+Q4Wt+f5WtWmJhIUTOnEBhl/Hl3x8oCf/egzzLvGIv4lozYGU8b4wuSJm/WVCAvq/svYHC60gUiMb8ce+LTEsz+ehrFBW20ovbkPcso30fhUjFjDHJnCEam5XuK28bjH3kBgTf5QA0KHv8qxDT5Gg2W1/ko0gSNXL9b45mqquypPjNTojFxKroQZAjEuZRQTKmqDKfBQp+crF9BsLiG9b1hpo+aCbfar5xfSpRWeHfOQTyndaMTZ4tiIAIk7YgEJ2dJWwqmfKoIur34U4wymQh4o7Tr0v6RVxcQswd7yfydP4p2AwePGz6leGox7+VqJ0/3qDWjfXmqyEyGvzpPWVXJfctF2HuI1XyTcVwV94ajVnkcrbW8bc69+LtTAxbcTWCBn7Y7oAiRCIwxYa29zFRUANfgGc+37AaMWmcsseK/Q0uRPz4tALG+TEXaAou5BBAuwIR2zTmDxdUA1JUq7FzgcfX6fMv9K6sBptT77vcxPoYGy79kN5OIshxrwFx0RwYv4vJJnq4oK0RO1EYf12kYS/9OapmV7ftSkDLjj8N2McySUfh81hUkclTlSLYhI2B0aTYyc5wNk1XeOEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(42112799006)(10067099003)(4143699003)(261009223027099003)(11063799006)(261028144727099003)(56012099006)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261026140227099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlRGaVZmSUtjeHA1NU5JUmc1ZGl6T3ZJcFhEU3ZreWZ5WEkxRjZRdGJ6d0Jj?=
 =?utf-8?B?RUJYTG1ITkxTZThtK3lYREhVY2grbkEyYVhkTEVKMERvTmwwdDFTTWRFWnVt?=
 =?utf-8?B?YzlxMlZaMWg0Tm1yRXlDRkI0UTlHVFV6WC9BcmszVEg3a1ZmVEpVbC9jQTJJ?=
 =?utf-8?B?RzZhR1pscU1yWkk4cWlxdmNsNHlBTTN5VXd3RlFncHJ4QXRqZEpTQTU5ZXRk?=
 =?utf-8?B?dlpsbWJJZ1ZSOElya1VzMU1EQUM1NGovK1dIampJdWxUVnByc1dRVU9tSE9Q?=
 =?utf-8?B?aFIvSnAycG14Y2czc1o1ZXh6V1BQK0p5WWpMWEZLQldsYm9HeGZVWDVNbTlU?=
 =?utf-8?B?aUpMQko5OWFhWFFHRXp0K3ZNMzNEOTJDWldXdG4vQmQzaUxnNEdPcHRtSHVD?=
 =?utf-8?B?S3hoWUpyekZ6MEU5a0JaQkpVTlhDOVpzSDRzcDNpOTY5NUM3a0ttTVpjZDFp?=
 =?utf-8?B?RzBzRzFrOUlQeGRBc0pTVEtweFovNGdyRmE3SUNQU3N3WnVXclhlOVc4OHh1?=
 =?utf-8?B?aCtDdEs2blBTb2VianJrandROUpGR1NtVzV4U3BwOFlyelMwaVRVOFY2VjBW?=
 =?utf-8?B?dS9jZ0lRcnV5SGc3NEhUMUZ3SDNkRjVqYVRRVytkTGZFeXRzWFVzY3cwbDF3?=
 =?utf-8?B?TjNYRDlNUzFIMUxtY1NFK3ZLd2lSZ05zOGgwYVFUODlBbllwSWZTQUNrODcr?=
 =?utf-8?B?VjU2SEpUOG9YWjBnZGQ2VEhVczY4YUpHcnYxTGFYNC85b2luVkt6Z08rcVly?=
 =?utf-8?B?Y1MzTWE1cjd6VXhOUDI0Q2tXYW9PQW9OZklnaVdxTzBZSm4xbGxGUlN2Tll4?=
 =?utf-8?B?Q2g0YWl1S2JpdGc3UXNXVW8xVnUyUStXWHRCQW11VUdKMG9hcUduWWl6UXJt?=
 =?utf-8?B?eFpBa3duR0l6V1ZHb0NWeFdoVlE0RC85NXhFRmFWYVpkYmhGaE9ac2VEejNw?=
 =?utf-8?B?OExnU1ZJN0N0bm5NWkZ6Y1MwVnhoU3ByYlVBaVlvaHBwZmFueFFYUElMR1JK?=
 =?utf-8?B?Tm9mdHp0OTVKREk0akYrZGlTZkprUEhrOEs1cnlWU3JuUi9LSmxzKzNqZitl?=
 =?utf-8?B?REU1TVRoL1BobEM5dW9ONzc3UzlHaEMwd2hGdGFJMWg3dmpYSEw0aTJ1S3Fz?=
 =?utf-8?B?eVVxVGJFSzhuY2ZVU2NtZWc5YWhxSzN1cm0yWkZVQmJkRUp0VjZqdXgwZ3dD?=
 =?utf-8?B?dUZDeU5rMHBiVi9IZ0d4eEVTdm81dXJTcU5PQ1Y3VFJLVmVWSHdIcm4vc2RR?=
 =?utf-8?B?VC9wRlR6bWREKytydHRWbXl4cWp0REZ6eU5DMUdCbVFlWWgxNXlyUlJCZ2lP?=
 =?utf-8?B?d1VNTitOQ1pmbVpVc2FHV2k1L1NuQ3ZCZjI0dG1OUUYyL0VpZmEzVEhPUXRN?=
 =?utf-8?B?ZURhRmtETzdjbzBuU1F0RVNTejdHMmVOUm9IRXFkV0pMaXF1TGxwdDN3ckJr?=
 =?utf-8?B?OFpQN3RvUGRUUWJIanN5dC8wcEFpeFNvVUdIZVRBbHdJK243M3lZeFpkK2lL?=
 =?utf-8?B?ZWxneUVjcSs1YU84Rm5TWXBQR1BHSE9VcDZ3UXMxR3U5OXVhZDRDRWdmbE9m?=
 =?utf-8?B?SUFENWEzNXV6VFN5YVZvVWJkZ1BwdzNGb20zdU1mWitmU2MzVTdFdW9LU1hK?=
 =?utf-8?B?ZGVvQWFPTUFFelhQL3VSc3lKYU1TZVdoQmgwbDJQWW9HR2hFVWFqcWNrZXZx?=
 =?utf-8?B?NXZicXRnRGhMSlh6Ni9kTmlsdWxxc2NKbzN5YndFUFNrcWRJS2l2Y1F1Y0dv?=
 =?utf-8?B?eTJCZ042dnlxVFpIL0pVYjVpRlowSENnSXBDTDB4UURiV1FEVjBzZWtuc3lQ?=
 =?utf-8?B?UjIzV0tycGVzWGlRdWVaRG95bDB6UXppZHBtcEVKS2VYOGFrVUlXeVdraERv?=
 =?utf-8?B?dllOTDloVFdqeStVbzAvcWRNS0FuVGJGUjYrcGdwOVIxbldNTDlmOU03V2p4?=
 =?utf-8?B?YUNMWW5udDQ0K2JsWFZETEJTMEN6UjJ3ZVZ4YjRoSElPNmhqUXBRdWhGWXJw?=
 =?utf-8?B?Zm4rYXBhbkowTGQrL01tMEh3a0g2cVZDYkc0cnRwZllKYlloWEY5OEtDTkJw?=
 =?utf-8?B?QTFoM2piRVBrVWpTMjM4dWRtUGpxQUZSVDFZSjRJdUppSklCN2JtaXVjY1ZK?=
 =?utf-8?B?bjZJcjlrWDg2T1ZWanpOcTVtZk9zSFpjUFk5OTBQNW9KdU1WQlY3Yk5EelU0?=
 =?utf-8?B?R0MwS3JBdkFtNDI5S1pCdmZsZm9YQWw4K29kUXRJRGMyM3VxaWtyREdhOHZG?=
 =?utf-8?B?NWxOZjJZUVlsZnh6WUJCZ0JRQlJEMUxyUElyVGlNNFM5NS9uVE15N1g0RFhH?=
 =?utf-8?B?ejVCeFJUWVpnMk5HaURaejRpRmF6amJPWkpLMmlQRk9GUkRrK0Nldz09?=
X-Exchange-RoutingPolicyChecked: RChVX/WXeMe+nfRH/MOtKmbE2eYqGs7o4oZHds6plRXsmx3GUCLBYDaghN/cOZO59dCOvY8LkHgVpIj7hjPoPdoS5pgkiBq4XuROx0GoO1F//WZHXU6gp2iHOBtrNXwn5YMnq/KXg9/G5DcyU9b7CZukpzeL0t61QtCCparLKsu7LYAWR3H0xcNmAYdQH4uoDZGzJR4vU+o54WEGSq80c2hZLCRrSGD2VYAk0hsG/E3zQYFz0vY4HvVNQHj1IoROnuT2Ix6ktZLsfAhAjye9EB3VgVRmoyrfhfGSdN+BVuRS5wUnoFtd7ATtVl2xE1Lz5Hy4vwp/hpicMomzmSHnKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 604a677e-9dae-452c-524a-08df4ae66fc8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:22:49.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iowTaVn3WmaCHVEWVhemnewAW/5EUPUcyFRnJFkPv9KW8Cl92tN8VxPbJlUVCWSMgDaQfOE2K5pdGsPaWTMkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB953716
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jani,

On 25-11-2026 16:12, Jani Nikula wrote:
> On Wed, 25 Nov 2026, Karthik B S <karthik.b.s@intel.com> wrote:
>>  From display 30 the kernel limits the single pipe pixel rate without
>> DSC to the maximum validated frequency, which is below the max dotclock
>> derived from CDCLK and reported in debugfs (see
>> intel_max_uncompressed_dotclock()). Above this limit an uncompressed
>> mode can't be driven by a single pipe.
>>
>> intel_boundary_non_joiner_mode_found() only checks against the max
>> dotclock, so on a sink without DSC support it can select a boundary
>> mode which the kernel drives with joiner.
>>
>> Add intel_get_max_uncompressed_dotclock() mirroring the kernel limits
>> and use it in intel_boundary_non_joiner_mode_found(), so that the
>> selected boundary mode stays on a single pipe irrespective of DSC
>> support in the sink.
>>
>> v2: Use macros for the limits, rename max_clock to
>>      max_uncompressed_dotclock (Sowmiya)
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Side note, IMO *all* joiner stuff should be abstracted out from
> igt_kms.[ch]. This is supposed to be generic and common stuff for
> everyone, and having loads of Intel specific joiner code in there is
> sending the wrong message.

Thank you for the review.

Yes, will work on moving all the intel specific helpers into a intel 
specific file. Will send a series for this asap.

Regards,
Karthik.B.S
>
> BR,
> Jani.
>
>> ---
>>   lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++--
>>   lib/igt_kms.h |  3 +++
>>   2 files changed, 34 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 789da08b3..9c4c9b8ff 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7223,6 +7223,32 @@ int igt_get_current_cdclk(int fd)
>>   	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
>>   }
>>   
>> +/**
>> + * intel_get_max_uncompressed_dotclock:
>> + * @drm_fd: drm file descriptor
>> + * @max_dotclock: Max pixel clock frequency
>> + *
>> + * Get the maximum pixel clock a single pipe supports without DSC. This
>> + * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
>> + * limit an uncompressed mode can't be driven by a single pipe, so only
>> + * modes below it are guaranteed to use a single pipe irrespective of
>> + * DSC support in the sink.
>> + *
>> + * Returns: The maximum uncompressed pixel clock for a single pipe.
>> + */
>> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock)
>> +{
>> +	int dev_id = intel_get_drm_devid(drm_fd);
>> +	int limit = max_dotclock;
>> +
>> +	if (IS_WILDCATLAKE(dev_id))
>> +		limit = MAX_UNCOMPRESSED_DOTCLOCK_WCL;
>> +	else if (intel_display_ver(dev_id) >= 30)
>> +		limit = MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30;
>> +
>> +	return min(max_dotclock, limit);
>> +}
>> +
>>   /**
>>    * intel_get_max_pipe_hdisplay:
>>    * @drm_fd: drm file descriptor
>> @@ -7356,7 +7382,9 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>    * @mode: libdrm mode to be filled
>>    *
>>    * Check if connector supports a mode at the platform's maximum single-pipe
>> - * hdisplay boundary.
>> + * hdisplay boundary. The mode clock must be below the uncompressed single
>> + * pipe limit, so that the kernel doesn't fall back to joiner when the sink
>> + * doesn't support DSC.
>>    *
>>    * Returns: True if a valid non-joiner mode at the boundary is found,
>>    * false otherwise.
>> @@ -7365,12 +7393,13 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
>>   					  int max_dotclock, drmModeModeInfo *mode)
>>   {
>>   	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
>> +	int max_uncompressed_dotclock = intel_get_max_uncompressed_dotclock(drm_fd, max_dotclock);
>>   
>>   	for (int i = 0; i < connector->count_modes; i++) {
>>   		drmModeModeInfo *current_mode = &connector->modes[i];
>>   
>>   		if (current_mode->hdisplay == max_hdisplay &&
>> -		    current_mode->clock < max_dotclock &&
>> +		    current_mode->clock < max_uncompressed_dotclock &&
>>   		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
>>   			*mode = *current_mode;
>>   			return true;
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index dfcb91e02..29a4e96fc 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -154,6 +154,8 @@ const char *kmstest_dsc_output_format_str(int output_format);
>>   void kmstest_dump_mode(drmModeModeInfo *mode);
>>   #define HDISPLAY_6K_PER_PIPE 6144
>>   #define HDISPLAY_5K_PER_PIPE 5120
>> +#define MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30 1350000
>> +#define MAX_UNCOMPRESSED_DOTCLOCK_WCL 937500
>>   
>>   enum hardware_pipe __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
>>   int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
>> @@ -1381,6 +1383,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>>   bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>>   			    igt_output_t *output, int bpc);
>>   int igt_get_max_dotclock(int fd);
>> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
>>   int intel_get_max_pipe_hdisplay(int drm_fd);
>>   int igt_get_max_cdclk(int fd);
>>   int igt_get_current_cdclk(int fd);
