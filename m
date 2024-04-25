Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2EDC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 07:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D31D11A236;
	Thu, 25 Apr 2024 07:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjfRYs7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A191611A236
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714030775; x=1745566775;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4/tVe9qkYd1Q01B/y1rwa6PRGQwhJzCwaVBSXYli5tg=;
 b=HjfRYs7Ci0aWFX6MW7NVSaeqXMlJYqc8QvuR05GCq1CXEa6wfmhvxVzy
 XcVQox+7Ra0LWIhxX5oilCL948ReUCDJ07leHn4rfBtjLlZCrWVcz/Vuy
 GGZOPNDIEWb/3FMrEJwvcwOA0eeOyHrNRIHyt1kRmQjnt48eVFwgYF8P7
 FqDLhpnLD4HtVVrztXLpyExDNtu8hwrkRBCRxJymbAdNWSLhK1gt6uLsM
 n5U5uugWuc4IUn3Lj7aPtnN97yQQafBeAaKVUlASuptyRHQPE/FUljTJ8
 2gzDy5Iu/92x0w5Zfii5kh61QVs8MpsnqhR4YAza2JVirbiPoX3L9+M3b g==;
X-CSE-ConnectionGUID: Zwwb7wlTTC6HDqyY9OZF9A==
X-CSE-MsgGUID: VXv8Ah4NTcOlgRUw95r/PA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12632749"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="12632749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:39:33 -0700
X-CSE-ConnectionGUID: gp8iaJ8pTVaBr7Ivo/DDeg==
X-CSE-MsgGUID: S4Xsq1IvRua8Sg3i+fB7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24859072"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 00:39:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:39:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:39:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 00:39:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 00:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG7n443YfFdmc5tSpoBE4Pnd5Y4gPPOb9mcT3jsgcQ3Qbue/mJJ4ioqQS+pdZGo3r9rSCPXyL529yT6QjGHky3dp5lBPAiiBZresffehDbEBN3UzDB+KL1IDbUEET9rZStEO3qXaFkD7kv/fx9vClJDMm+mpNwDgGHgiuhwXIZuU8grw7E3HZHaN/rbcaLiZaPxRaKaboQz6WwQ3jkxg5jPgH5qIl0BNpnia3AdZjOuI3IP8lOIJQCPnEhiTAjqinPvSXf0xaWBB6JyxGYbqdsOl3byzQ1t7KrkeGPPybyPpkCCwhpQj/GcXnFqU8MmP/tYjJGqyqfZY8K0UYxBW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eb1mohH3CM0tVgOVnoQM55CglYcDJKuFmhZwTNvx2E0=;
 b=T8m4dGSs42u1TL7D6rsAfQo/g7rYd2tE5rz93RTPutabRlU5AQ5mIu/7pNAFUu5lg3jtRQLQUAqCZnr1HW5vPGYHgA0AbemUa/glMVGvAewB5XZqau7u4EYxcIz0gSoijRb7xkfaMxPieIGaSeerMCr9KFFBd7iOPgCqlwpcX6kmra5AMhhJxc5R4vkdQjKhsFQsPtpY8TShSud0lBrBWfjdVdKqNrlDIgvxQBeICooz0QvukDHg8lBr/HCUQ3o1Am/7mm0LHYF+JdXDUo7JgUIfyZ2W4mpu20JupDEQFvn3A26HTn3GtXTz1+uMt4G+t5kYIyIVYqmweupNUe7vew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 07:39:29 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:39:29 +0000
Message-ID: <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
Date: Thu, 25 Apr 2024 13:09:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
To: Manasi Navare <navaremanasi@chromium.org>, <igt-dev@lists.freedesktop.org>
CC: Drew Davenport <ddavenport@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240424201344.783935-1-navaremanasi@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::30) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 35fa29a3-cac2-48f7-e3b2-08dc64fad6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUpIbjg1NkZuN0QzanRZdVpzaVhBLys1VjdscDRNaW9EMnBiWWMxMDM0bHpl?=
 =?utf-8?B?bk5vTlp5RVdUOUVWOHgvRHVaK2cyVWcvOWUrWVMxdEswZDNlZGpnbjZnRW1s?=
 =?utf-8?B?WUw1NTUyZ3M0K3ZaK25mR3ZsZFBCSXhIVW9aa3RnZW9scVI2d1RYRVRlellt?=
 =?utf-8?B?SFJxNVY3c0pGbXMzeWZ2UkhzQkxTb2ZtU1d1NjVTNllMeUlaSmhjaFFlRVY2?=
 =?utf-8?B?c3IxK3gzangxaG1vYmgxb1o4N0F5UGVyeE1RT0d5ZVE5QjVKRmxPWS8yQnJ6?=
 =?utf-8?B?NTFOVG9CSFdPRWtFZ3JwSEl5QjhvYjZRaXcyY0hncHQwSDFaOXNVbFdhT0t2?=
 =?utf-8?B?SVp1bVNkQmpHWWpsTjJQTHQwcnArRGswbW9MNVdENjlTTDBqb2V1cEVKSGVV?=
 =?utf-8?B?OEZnSDBtOFhidUlua3hFakdacjQzNEtjcWY0TFhLazhEMUZSU21KZUg1ZkZR?=
 =?utf-8?B?dmU3bUUxbWRaTEpnclhWL243ZE0xRExrTk5kcDc5ODFMWTVUODNnUXNWamx0?=
 =?utf-8?B?QTBZT1AwWnNkUkViRUZZZ1NLWDJxVnlkOHNEdVZOc0lkZVJSTVdleFBtKzBo?=
 =?utf-8?B?QWlnWWpRVEI2Wm9pb0NzOUIzbmpkc2lCSjFoRi8xc2gvUGYwajNGdS9wWkkv?=
 =?utf-8?B?b1JVK0VkMFJqWTFmc0VWN1k3d1ZVSHJsWWNPd1BJWmN0YlNwWGJPbnM0S3lx?=
 =?utf-8?B?OHY2ak9kYzhSemgrR1BWWmdvODdyWFpxa2RHUDFubHpwSzlJZ29zUnBBc1Ey?=
 =?utf-8?B?V3N0eDBTTjByVGVrTFJHNkdjWDVzSjl3cCtEcFRvU1c5Uy9GcFFSbFVTM1R3?=
 =?utf-8?B?Rm9TK3ROV2xWSlpiKzh0a3RuSGhaVXZ0K25BYVc1NGx4cHlMVis2OVBBQmVs?=
 =?utf-8?B?YnZmTGxQdkxkZ28yclBwYXJ6UHBubDBaS1NnVkNhUzJmbWlwNVNCRytBeUFB?=
 =?utf-8?B?dWVJVjl2Wk9iTUpKOHdKKzZod09uTnBKLzlVLzJncVY2NVF2ZDV2c0xCclE0?=
 =?utf-8?B?UlZHVlE0WGRWVmdacnB2MXVCUWNod1BwUWF1UVVjeGlJbUFVSldGT2FPOFBi?=
 =?utf-8?B?N1VwejM4QXFXK0ViTkRwWTdDcUJ5a3R6NVZMR2hiM1VocnliempGZVF0NUZG?=
 =?utf-8?B?ekRsY0RiSmRjZTFQbmhRVnhlR210akcwbGxmQnJiejcyNEpTMlV0QmZXLy9r?=
 =?utf-8?B?Q3o3Y2Uyc0lzT25ublRDUzdWeGx1dFVCOURoTHV4VXN4anlRSmNiZEN3VHBM?=
 =?utf-8?B?ZXU0Yjc5amFCWnlGdnFudXkvWHFYTmRHU3dNUVhQOG5sN3lNcSs2QVc1RU9z?=
 =?utf-8?B?d3JuUlkwRFp6Q2FqcVZqTk1OY2JmVGZOVyt6U3VjRDZ6cVo4bDUrY2ErY2JT?=
 =?utf-8?B?NStWMnA4NDkzWk14TU9JVGhxZTNtNEhxdmo1Q1FiNjlXRlRVUG5YZEdRUGxP?=
 =?utf-8?B?RHlaRElhcVFSQ1VMcW4yWkVqbGNnTFNQTWszMVErdjV6Ti9Bai9NSjFTdDRx?=
 =?utf-8?B?a1JUYjhlTjNPeU5qU0RpRDRKWDdqUmRaVldkZWorR3JQUmNmV1IzVkdKQ2w3?=
 =?utf-8?B?YjVVczNUUXpYRlcxQkJVNkpUUEVnRnFiSXlIa2ZybW40dmhwR3hadk96b3Rh?=
 =?utf-8?B?VUF6ZXI1TWlOb3ZsZlc5L0k3L3J1b3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SldBSjhoamZuN1d2YzhEV0o3RWpCRTZBWjlvNFIrK0JaTzRISnFGRjJETDhS?=
 =?utf-8?B?YTdqaG43ejh2VlFNdkY3WWxkTVk4NCtUTXNFV2FuOEtqclNUVUF3dUVGeFRO?=
 =?utf-8?B?RFRscHE5TVA4ZTlrSm9TbFlpSlhNWDdFeStTc3pQS2s2K1c2ZHR2TTNXQ0VK?=
 =?utf-8?B?WmVhVFY3KzF4RzRwZlFFZy9iR04xVVdkRlRSRGFvVkRVc3RQS3pVdnUxQzVQ?=
 =?utf-8?B?R0JMRFcwZXJQUmw3QnlJdzc1RjNGb3FaZm9oMTVCa3NGV0pEV28xNnpkTXc0?=
 =?utf-8?B?OUhXYXhsTFVQNUpTVDBaQ2l3NTVxRjRaUHlrSGFEVVhPN1BZQit6K1VXZ0pI?=
 =?utf-8?B?dkZHMVppdVE1Z3htZWVpb29KSGt0YStnSFduUUFsSVozbHF6MTYyVFhGLzlB?=
 =?utf-8?B?b2h2aVhzemttSjZhR2t4SzFqS0tPUUxPV3BzeWJ0SFdmRTkrSE1sZ2Q5cXRD?=
 =?utf-8?B?NW1tNXR5VnllSnN4TFBZajB4eWlhNHRxMkRaNDNjQ3lCSjAzTVBKb3NNZkF4?=
 =?utf-8?B?SVZlRmlSNmFuNFRxL01UVWUvb3EycmhQMUx2QkNuYW1KM2J4WnM3Wi92c0NN?=
 =?utf-8?B?bW9pODEzeExWenI4WTdWTW5odWV4WllKUXZCOXVtYzhNNHlOOEZjaDkvVSs1?=
 =?utf-8?B?bE42cjhCeUg0RWtucmlTRWJSNmdSb0dzd0VvTXR6L2NQbFNLVllMOVB1YWVQ?=
 =?utf-8?B?ekJGUUR2Undhd2RjNFlMdUxZejhScURYaTkxQk5BS2YyaGE4T2pMQjFuZ2hL?=
 =?utf-8?B?OXRTc0F4N1BJaWxEMkhCY0lldFJybEpFbVd1S2g3OGxsZ0UvTWNBT2h4ellL?=
 =?utf-8?B?d3FBVzdQenRSTG15NFFlemV4MjM1TXZCVmFoeHJVcy9pdStJQ1VKMHVZbUVq?=
 =?utf-8?B?L0oxMkd6alBHV2prSXZqdXJIKzRLMU9oZml1T2JWSFQyd0ZkLzlMZ3RGSUNS?=
 =?utf-8?B?aHZqcHFiekROaVN1dGdMdDkxVnltTWszSDY2cHN5V1JFYWtReHpVc0RBaDVu?=
 =?utf-8?B?TGZIZnJjQ3FDR1VwcVJhU2g2K0lXaHREcmd4NWFzMVAwbTVEVmNkQUVqUGFE?=
 =?utf-8?B?bnhOeUxwSFFkWjFtMmZ4MW91RXVVWTVPdm1YaFBvYWQzcW5HdHFEUFk4RzdR?=
 =?utf-8?B?ZlR1YSt3R1BLbnJHU1lzMUVsV2JTTEpCR0c4YitFR1FDbDJyR2w0V1dmL2JF?=
 =?utf-8?B?NWJicjIwVnoxU01EajB2aS81UFp1Wk9iR3pQSFJnU1RlWDBjUWdyWGJVNEV6?=
 =?utf-8?B?Q2paNHlSZjRKQzZKOC80VHN0dUN1Unc0R1dFM1d3SExrb3dXV2JnbFNqc0R6?=
 =?utf-8?B?OGVKOVNIbHcrN0dmTDFTaWJZbjc0c0xieVNNQ3UzdDRIRUZqQ1RscldYbk8r?=
 =?utf-8?B?dTZ6Nnhyd0hrWitwc3VPSldCNDFHSEtlNjg2YUhISitjVlU1aGJNM1J0TTgr?=
 =?utf-8?B?ektGcmptMm1uOER4TlhoTitZQzlHak9GcEFVYkI5TjZLb3E2bjRUeVBnTWxS?=
 =?utf-8?B?SWVuM0tpdno4cGt4M2c5UXFMa294VTh2ZzJsUzVCK3pqZWdEUmxKKzlwSHlJ?=
 =?utf-8?B?Ymx6ekVXWnh5Um5VTFo1NWNqSXJ3aU82Vk9RMUhxcVdad0M0YjVJd0ZVSmNt?=
 =?utf-8?B?ZWJGdHgyM0V4c093WVVQeEFuTm5CcGczM216ajBUa1EwSzV6Y3ZOaW4vVVFS?=
 =?utf-8?B?Ym5tNTBndk85VUFhaksrWXBteUluTHBISkptd0pjVGV3NGJKNzdEeWNXazVE?=
 =?utf-8?B?Z0Z0SWZNNTV3RkZOaVRzQjNuSnpadFl6L1lMTVhKUnJ6TDZVYUpFcy9aV3Nu?=
 =?utf-8?B?YXdHSm1MVXh1L1R2aDZQWmJTSFRlUVRwWXdlV2xlSkhZOGNNK3Nnek1yUERk?=
 =?utf-8?B?VDVnVWNZVUczUm9QRkNZSk10YTRrUzEwYzZ5WWUvOEdqNGZQYnBhcTdGSGg4?=
 =?utf-8?B?UGZycm9CaXNrN1Qwb0RoTk44enpTeGFlQkJBUFZZbUljYVFCVzA3TVFyVkNS?=
 =?utf-8?B?SXpoTjk3N1E0ZnNzN1lkQmJuNzJNdlg4UzNaODM2Nkp0aHdJNElUWDhYVXJR?=
 =?utf-8?B?MzlvdTJ5T2k4NFRHcFVRbTEzNWpIQmtvQjRoZE41VXdZV2FtR01ka0FjemxW?=
 =?utf-8?B?WXJqQ3ppd21OWEdnT29PZ2xxRm1VU2VOdUlxMy9Tby9GRHhyYS9ybkJ3a2Jw?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fa29a3-cac2-48f7-e3b2-08dc64fad6b2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 07:39:29.0157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Qxv0e0Yjhzy/fm/IloMkeZS54K/fERSU98Nm59uqjHzAK4G68VYQpJ0sA0/Bf2pWLS+nCXSCgEaf1+u5v3cgsLYhwPDYX6tC6B5kisT9yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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

Hi Manasi,

On 25-04-2024 01:43 am, Manasi Navare wrote:
> This subtest validates LRR fastset functionality by testing seamless switching
> without full modeset to any of the virtual LRR mode within VRR range.
> Here we start from highest refresh rate mode and then switch to virtual LRR
> modes in the steps of 10Hz within the VRR range.
> 
> This is used to test the LRR fastset functionality of the driver.
> 
> v5:
> - Pass a reference to flip_and_measure (bhanu)
> - Add a new line between between declaration and code logic
> 
> v4:
> - Change the test name to align with drrs/vrr tests (Bhanu)
> - Fix some build warnings due to rebase
> - Use a local virtual_mode variable
> 
> v3:
> - Fix build error due to rebase (Manasi)
> 
> Cc: Drew Davenport <ddavenport@chromium.org>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> ---
>   tests/kms_vrr.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 15c62b34b..7f64d6806 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -66,6 +66,11 @@
>    * Description: Test to switch RR seamlessly without modeset.
>    * Functionality: adaptive_sync, drrs
>    *
> + * SUBTEST: seamless-rr-switch-virtual
> + * Description: Test to create a Virtual Mode in VRR range and switch to it
> + * 		without a full modeset.
> + * Functionality: LRR
> + *
>    * SUBTEST: max-min
>    * Description: Oscillates between highest and lowest refresh each frame for
>    *              manual flicker profiling
> @@ -89,9 +94,10 @@ enum {
>   	TEST_FLIPLINE = 1 << 3,
>   	TEST_SEAMLESS_VRR = 1 << 4,
>   	TEST_SEAMLESS_DRRS = 1 << 5,
> -	TEST_FASTSET = 1 << 6,
> -	TEST_MAXMIN = 1 << 7,
> -	TEST_NEGATIVE = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> +	TEST_FASTSET = 1 << 7,
> +	TEST_MAXMIN = 1 << 8,
> +	TEST_NEGATIVE = 1 << 9,
>   };
>   
>   enum {
> @@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> +static drmModeModeInfo
> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
> +{
> +	drmModeModeInfo mode = *igt_output_get_mode(output);
> +	uint64_t clock_hz = mode.clock * 1000;
> +
> +	mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
> +	mode.vrefresh = virtual_refresh_rate;
> +
> +	return mode;
> +}
> +
>   /* Read min and max vrr range from the connector debugfs. */
>   static range_t
>   get_vrr_range(data_t *data, igt_output_t *output)
> @@ -641,6 +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>   }
>   
> +static void
> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	uint32_t result;
> +	unsigned int vrefresh;
> +	uint64_t rate[] = {0};
> +
> +	igt_info("Use HIGH_RR Mode as default\n");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
> +	prepare_test(data, output, pipe);
> +	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +
> +	/*
> +	 * Sink with DRR and VRR can be in downclock mode so
> +	 * switch to highest refresh rate mode.
> +	 */
> +	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +
> +	result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
> +
> +	/* Switch to Virtual RR */
> +	for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
> +		drmModeModeInfo virtual_mode = virtual_rr_vrr_range_mode(output, vrefresh);
> +
> +		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> +		kmstest_dump_mode(&virtual_mode);
> +
> +		igt_output_override_mode(output, &virtual_mode);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> +
> +		rate[0] = rate_from_refresh(vrefresh);
> +		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +			     vrefresh, rate[0], result);
> +	}
> +}
> +
>   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	if (vrr_capable(output))
> @@ -686,7 +747,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>   
>   	/* Search for a low refresh rate mode. */
> -	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> +	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))

Does this virtual RR applicable to eDP only or supports other connector 
types too? If it is eDP specific [*], then we must add a check for that.

[*]: 
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_vrr.c#n660

With above comment addressed, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

>   		return true;
>   
>   	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
> @@ -841,6 +902,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   			     "between flip timestamps converges to the requested rate");
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
> +
> +		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   	}
>   
>   	igt_fixture {
