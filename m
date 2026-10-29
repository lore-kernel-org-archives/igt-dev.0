Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA494606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=amXnnKes
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803C710E7C1;
	Thu, 29 Oct 2026 09:21:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C3410E4A3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793265660; x=1824801660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udSkToiLLmz3k9LhbT5c/g50AeCn4DP2uSbc7E5vEyw=;
 b=amXnnKess0esyTzOLtyPS4duqvmzZzAeW4pD2l5HoLsQgexUSV1nwZ5j
 PAkX2pDNuDBya1mUflRyqnKXhfAmsQy9hjRnCJqSMOcJVy2cDQBARYkU1
 cJPr7hhMXa2X3KW3OMdRaoaptoRdYJcC3sxY0hIbUe/PyGphhY8+N/jbt
 hVTVnhZHTdeXEIG+2ZaHDnQ1wUbQFpNKj+yzdtF+MwsciIWxi/JkSpQrS
 +gRi+RVqEXZmw6ZXM3FDoZj3ktFJM+2LJwbtJSMBGH+pP5h4yqzv+wWmx
 STcejDMhYGjt40udlBeCAP7VwbobAahwsIhWeYsxuImm6R3IbzKqdAx5h A==;
X-CSE-ConnectionGUID: olqw9KnPR1O0ykWNjQy73g==
X-CSE-MsgGUID: 6VkOszmVQ/O/ZcvAv8qGZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2001406"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2001406"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:21:00 -0700
X-CSE-ConnectionGUID: kcBmSa3vT0aIwdrAg5w/Lw==
X-CSE-MsgGUID: gz7jzq/GQdOvxNmwSJdBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4965835"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:20:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:20:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 02:20:58 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:20:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2flcq3OeZSOM8Q6Zz327DDkhDv7F6SHCPHqNL9j8I2CkYQbvDjQQUe5dFpYHosk5+PFgDMm+BJZfisBbIuWuoUwEkS9DZIEcr3ZU8PF66o+oq2imAu8dasnOwH7X50NDL7fXOQelXgIf2X2/vFVOoR0KLzUx4gaT0uSH6X+kgUvDe9npzjcwDXWtF3fShKv3LQbj3dJ6YgQqismyWf7/lGbBIU+4zlX3o9Pksk2q7u5MjY9LZ+WwHXTQXkO4KEgX17s91W5zlNKhu9mOaPQm6bBo3H+5rEDBGIQItj9MZMifKdIKb7EMNJ/bqXMMNeyrJztLDII7VBQRnkS50djKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao+6UjXeJ26MyRXOevsWbQzeE3eWcadhjwffWqnEe2U=;
 b=T0kB/q+1EyftrxiL3H0Jv/Sbtkusclvm4d/B5A6+WByFACHPAeSthQCQ7Wr/LfthrrG/rT2z7YS4OJUnA7C+GMb3rE6SkSa2gSr3n/+1RDJWLxIvXfs8fgmZF1JYTuVJBdNncdLPh0q5UUQd9PHTeCo9NdAi/o+hbHfunT/ThNa+uNzO9GR6ajS2JggutJuz8M/pU+21VUmjJ4AU1KuAaJrF5V0qRdtcCVWEdaSk3AYrwCPAtmF5D6eZQP39mMs8pKQq+iZPaGg1w2XgImj/xiYKCtEB3+2Yh0zPSmr19kZOdrV8bFv8EVwHNv4zHyMoREwSgps6YZs5IkAxziXaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 09:20:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 09:20:51 +0000
Message-ID: <f0b5e079-d209-40a9-af10-cdc7cd9fada7@intel.com>
Date: Thu, 29 Oct 2026 14:50:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] tests/intel/xe_err_injection: Add Core Compute
 Uncorr Error injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <soham.purkait@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261029085955.1232163-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: bfedd51e-0138-481b-08f6-08df359deced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|261028144727099003|56012099006|4143699003|11063799006|261026121527099003|261022105027099003|261021121427099003|261026140227099003|10067099003|261009220027099003|261022113327099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: 8LeYQH5xkbhIQT86y0b254pc2b1DMBWNbeJoNLVtLAOUhs9cP7BbtsI+l5iFc37RJQagHyN8y9gEVvx3GztfVVOG2X9OrSB+Mab1MPDWXrlIwYUxQFF8Bvtvl11RGQQ4x0Djw/5yHbnsUXOkde4Pyxysp07FdRrAEosgcSmgz8dCOeyiYdx95f9RJPUQpRScs8flEKKdknMujQXrAJaQCaL4K1ibzflrUDK/diFxS66vJ6e6pAt7BuIHshQP76YE/yFN8tz3fV5r4u0CUigPhlbZuR0INTSMLXvRc9PSqxiTyUa4bQPDUyrNux+jasgpzyoSMHwELC9XMqgvfcu2EIEl17Jj5Ab/tCqdKPPLc/XD+bdxRLmt/tI/pdn59InaJFgH9CrPWI/H7eLPNZxBjcSDw4gOozeVk16T7y3AxEmTE6es9NkzvYqgDQ46sxoLPaZDGw0M7eR05OnSEQnjTv7yx7gfEiFwK7DY2MFiQatgjI8RpR/TCwT+84vCSjhKSUW/plftiApFPwFTyKU7Alg58FruxJHOErQoF6wlSMV2YOEb6b7l8Ax1mJ4/MqAluPUlKvF2lDxVvLfr+iYJDcFLaTXuAJd+fms5Lqos97U3l0x96E5WvFGPRyx0Lv/z5ffKeStmj5QRKRgql7J/SIeGD4YPDQthKvTpQm6Yhz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(261028144727099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261022105027099003)(261021121427099003)(261026140227099003)(10067099003)(261009220027099003)(261022113327099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3pYL2tnekRqTllVK2cvSjVzK3N2MjFObjYrclR2Q05Pb000dFpaK2J4aU5X?=
 =?utf-8?B?QjBwODNYVXNuRmZrNW1WcU1aQjhEU3ZHcGxVSUx5aXNwRldocTMzOVh4cWtn?=
 =?utf-8?B?Zi9QajRYdE9PamkwSHNhSFFNRFVGNjJsWG5pa3p1MnlIazltbWhvVzFoaXFy?=
 =?utf-8?B?aE5uTkM3b29pNVRyTWNERkdKd0RYdFY1MGRveXpUYXpjMFFNdlpaV09ldEM0?=
 =?utf-8?B?eExjTE5SQU56L0ZMQmpOTU1TVzc0TXl5V01GbGNSL3I3ZThWSDY5aEt6M1VN?=
 =?utf-8?B?aTIxZ3BjdUlpRUFkcmFXM1hRYjB0aDhjN3V5bTNUcEdRUzltdGpZWERRRGtT?=
 =?utf-8?B?L2RwTzN2Y3g0MDFxQXZhMyt2WmdaWjZQVzRVZkxvR3M1aWN0SVUrYitkYTZU?=
 =?utf-8?B?Vi9mRTF3YWE0OURCWGZod1dSdk8zOHpjQjJvU0oyL1Q2ekRlUkh6SUo3dkF6?=
 =?utf-8?B?c1piSGN6aEtQRExCMHpCaHpScDZnQkhLeWwvRGo1ZkVOc25VemdYYmgwbnpB?=
 =?utf-8?B?ZC9PZUFvaGx6R1R6WmpFTnVyRDR1dmdzNDNSSFpab0VIV24wMTFOdUdNNmh5?=
 =?utf-8?B?R0VWb29XZm53QlZpM05LMkVjM1kyTW02T3l2OU1NSDlVNXFVNE5NbnNobktu?=
 =?utf-8?B?bFhVb2wxK2E0UW1leDJDUkQ3YW1kV294MHVGUDdkSWVkQWt0eWs4cXBsY3ZE?=
 =?utf-8?B?S2k3QU1DbUNMN3VJSVVXT0tDSktFbUNxUWpCS2d0amJTMHNPeWhGZDc0Snk3?=
 =?utf-8?B?bjVsbkg3WnVFY1JpVzFhWTdqWHVza2hJaFJYRmQrOG15dENRRGdQME1ocUZp?=
 =?utf-8?B?aXh6Z2FSYlpqTjZ4NHpjcTROeEZFYkJCOUYwZVZEMitqT3I3NjRaaUJNUjJY?=
 =?utf-8?B?eC9lZEpBbVl0YmtJdlh6M2FmeFVzcnFXeVBKQUloOXRRY280eFU4YStxQ2Fr?=
 =?utf-8?B?S1RVd0FHczlGaG9SV0JtaHhWMmFBY1lCVnI1bjkrNDlzeTZoOHJzRThjaTN0?=
 =?utf-8?B?cHVSVTZPS0dwRkJYK3NOWFdrcUFtb2I4ODlFaFpmVWM3L1lUVElzZ00wd0JI?=
 =?utf-8?B?WGl0T2hrZUNGMGhQcHNONEpqQ0tCWE5UUStqcDEwUXJ3aGgxTkQ1TytmUDM0?=
 =?utf-8?B?U05zdGJ5RG9aMWVnWlV0R3dncnFJZ1JZcEVuLzRkRkozaXRSRHFsRm41dk5l?=
 =?utf-8?B?QXJwRG1ZWU91LzV3VUdRR1IvUEdVU2lsaHFuK0dJLzA0aWMzZVZ2T1kzQk5J?=
 =?utf-8?B?enVSMU1jdytWU1crMG1ZMmYvNE1yUGtvY014TGkzT1Z6VXlYdWxsZk9PMlJi?=
 =?utf-8?B?N3Q3MC9BYjZPY0RVeHg0NGpQWDA0clZFZlFpeVh6eGduZyt3Q1M5NVMwTklm?=
 =?utf-8?B?U0NQNnZtWWRBWkRrN2xKVlNGSHJqR2VWeTRuMHBHQ1FlcUZBSGw4ZTlRdnhG?=
 =?utf-8?B?UTIxY3VHMUFHSVV1TzlKSlVPSDg5RVlieUZXSVc0dHBjOWJNaUFHdFdzeFN1?=
 =?utf-8?B?RFBuOUlmRVZRODVyR1lDTFVzRHA0akh4aDNEYWp4VjZ1d1VZblpwSFQxdE1K?=
 =?utf-8?B?aEszQWpyVEx0NGo5TlhmT0dIOXhWOU9iUW5ubm1GTGpibUJWTVpnS3ZlYm5u?=
 =?utf-8?B?V1lyQTU0UlBHMXBnTEJ5KzMzOWdCcDg0YVErbWF2ejZMR3lXY2dXVjZ1ekRI?=
 =?utf-8?B?aTlUcmZCZ2xXV3RSVFhVVGpvbVNqa0wrNlJkeW5hYnRLUUhEK3REamtsU2RD?=
 =?utf-8?B?U3ErUFhsYTlsK0p0TitYRVNUR3FNczc1bGMzRDZvYTBSSEd4bXVyczZ4bVJt?=
 =?utf-8?B?Z0c1alRTREt2ZmhBaFAyWUFiTlI5b3RoMCtHTGxWT2lNcGJrUEk3TlJFTXdw?=
 =?utf-8?B?TThLSXpuS3VaL1NaK1I5dVNUVEkxVkdVWjErVUJyN0w0R0c1VTROTVJzL3p0?=
 =?utf-8?B?T0s1YUJnYUZneWFPSmhhNERxc0ZJWkpnMTRiMWJUdkZOb0tqSzlPdlY3dElj?=
 =?utf-8?B?MGtocWg5ZTlQUjhmcEhnNmhrRFJpOHRRaUNSVlB1cHFad2FiMDFwM1FRRUpt?=
 =?utf-8?B?YkkvTTNMM1F3MmkvNm9pcTF0UXVBdkc2NDI5bm8vc2pJUUtsbXZjaERMWllt?=
 =?utf-8?B?alV1OUJFL1Z4V1VWS05tclFKOHdoMXNBUi9YdnhwZ0piMXVIVEtkRzdiTjJM?=
 =?utf-8?B?YjAzS3ZSbTk2MFc4eGlKZ0xUZ2FhTnNxSHRBOS9mT2wvNkF1TmhSc2tHeDNU?=
 =?utf-8?B?WlZ1UkgvUys0d2pTS2c3UDdWdEp5MlJUV2RPVW53VWo3NlgveEprMUlzUkx2?=
 =?utf-8?B?UG0wTkdRUU5EUUdMMEovNjRjNHlzNmRrTWhIWGk0TlRzdWNMMWpsdz09?=
X-Exchange-RoutingPolicyChecked: prNYKP/YLoMFF6akkcOdyEBnVhJRzhP+w2AbIOzxrcEjtA+zXMc3Vi1AvFamhrHEGfaHz7dCQJmce4pSksFWeWfjt3NDl3eUAhXcp2VQ6qb2sviuWsDN6en5BdAuQpylZOusRqbWGOolaucZgQu6c8BsHyLWTWNvqC+C+l9VBJwuukkoFMBguWbIGiuP1ZikHDZF7QHs4CoR5AXOt6PgAMHadLOHFaow93UBv+l7/lOlnbCr8+I5K9TZ4q4oVO+vnfkaT4Yzp7LVcEzy7FJnIgOvPXKwmmkGQCoDwCXbQi78iGNdN3qvDEmGBrvG+CSi+Hs4Og2Iy+OFObiCX5x6fA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfedd51e-0138-481b-08f6-08df359deced
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 09:20:51.4545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fNdfLwhEIGz1Ngmyhwpm30lgymNRZRia3orjH1+m1hTeq1KqC2O82wB+BJBERI8vKpmO0O3GE2xgWbGTdG0IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
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


On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
> Add MMIO based Core Compute Uncorrectable Error injection to verify
> the Xe driver error handling and recovery flows with the help of
> DRM Netlink API suite
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

Overall patch looks in good shape.
Acked-by: Riana Tauro <riana.tauro@intel.com>


> ---
> v6:
>    - Updated aquire steering semaphore logic (Soham & Riana)
>    - Removed enum to string mappings for test names (Riana)
>    - Updated metadata in the file (Riana)
> v5:
>    - Removed xe_err_injection.h and moved its contents into the .c file (Riana)
>    - Prefixed all register address and bit value names with "XE_" (Riana)
>    - Updated AER recovery dmesg strings to use enum-indexed arrays (Soham)
>    - Added error handling logic for function calls
>    - Changed test name comparisons from strings to enums (Riana)
>    - Added UC test and post-recovery workload tests as dynamic subtests (Riana)
> v4:
>    - Added Steer Semaphore for disabling and enabling multicast
>      operation(soham)
>    - Increased device recovery check timeout from 5secs to 10secs
>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>      Jani & Kamil)
> ---
>   tests/intel/xe_err_injection.c | 382 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 383 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..2f5f85b07
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) MMIO based Error Injection
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: Error Injection
> + * Test category: Functional tests
> + */
> +
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_ras_nl.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +
> +/* Steering Control Register (MC_PKT_CTRL) */
> +#define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +
> +/* Core Compute Uncorrectable error injection */
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +/* STEER_SEMAPHORE_MGSR_3D */
> +#define XE_STEER_SEMAPHORE_MGSR_3D 0x00FD0
> +#define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
> +
> +/* Node types for error counters*/
> +#define NODE_ID_UNCORRECTABLE_ERROR 1
> +
> +/* Error types for error counter */
> +#define ERROR_ID_CORE_COMPUTE 1
> +
> +enum {
> +	SUCCESS = 1,
> +	FAILED,
> +	TIMEOUT,
> +};
> +
> +static bool run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	bool ret = false;
> +
> +	igt_info("Running compute-square on all engines post %s\n",
> +		 state == POST_ARMING_INJECTION_WL ? "injection" : "recovery");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		ret = xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, EXECENV_PREF_SYSTEM);
> +	}
> +	return ret;
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static bool acquire_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	uint32_t regval;
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10; /* 10 secs */
> +
> +	while (time(NULL) - start_time < timeout) {
> +		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
> +		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void release_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D,
> +			XE_STEER_SEMAPHORE_MGSR_3D_VALUE);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct igt_drm_ras_nl_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize socket for get_error command (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +		igt_drm_ras_nl_cleanup(&ctx);
> +		return ret;
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_drm_ras_nl_cleanup(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg(const char *marker, int elapsed_secs)
> +{
> +	static const char * const dmesg_status[] = {
> +		[SUCCESS] = "AER: device recovery successful",
> +		[FAILED] = "AER: device recovery failed",
> +	};
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	size_t i;
> +	ssize_t line_len;
> +	FILE *fp;
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		for (i = SUCCESS; i < ARRAY_SIZE(dmesg_status); i++) {
> +			if (!dmesg_status[i] || !strstr(buff, dmesg_status[i]))
> +				continue;
> +
> +			igt_debug("Found \"%s\" in dmesg after %d secs\n",
> +				  dmesg_status[i], elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return i;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return TIMEOUT;
> +}
> +
> +/*
> + * TODO: AER device recovery logic is pending to be implemented using
> + * "uevents emitted by the aer driver" instead of relying on the dmesg
> + * logs.
> + */
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10 * 60; /* 10 mins */
> +	int time_interval = 30; /* 30 secs */
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return FAILED;
> +		}
> +		if (status == SUCCESS || status == FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static bool uncorr_error_recovered;
> +
> +/**
> + * SUBTEST: inject_core_compute_uncorr_error
> + * Description: Inject a Core Compute Uncorrectable error and verify
> + *		AER-based device recovery.
> + *		The dynamic subtests are:
> + *		inject            - Injects Core Compute Uncorrectable error
> + *				    and verifies device recovery.
> + *		post-recovery-wl  - Runs a compute workload on all compute
> + *				    engines after recovery to confirm the GPU
> + *				    remains functional.
> + * Functionality: error injection
> + */
> +static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	bool ret;
> +	uint32_t counter_before;
> +	uint32_t counter_after;
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
> +	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	counter_before = get_counter(node_id, error_id);
> +	if (counter_before < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to read error counter before injection\n");
> +	}
> +
> +	if (!acquire_steering_semaphore(mmio)) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Timed out acquiring steering semaphore\n");
> +	}
> +
> +	/* Arm the injection sequence. */
> +	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +	igt_debug("Injected Core Compute Uncorrectable error\n");
> +
> +	/* Run traffic to trigger the injected error */
> +	ret = run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +	if (!ret) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to run Xe compute on all engines post injection\n");
> +	}
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +
> +	counter_after = get_counter(node_id, error_id);
> +	igt_assert_f(counter_after < 0, "Failed to read error counter after injection\n");
> +
> +	igt_assert_f(counter_before != UINT32_MAX && counter_after != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     counter_before, counter_after);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 counter_before, counter_after);
> +
> +	igt_assert_f(counter_after > counter_before,
> +		     "Core Compute Uncorrectable error injection failed: "
> +		     "before=%u after=%u\n", counter_before, counter_after);
> +	uncorr_error_recovered = true;
> +}
> +
> +enum xe_err_injection_type {
> +	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
> +	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
> +};
> +
> +static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
> +{
> +	switch (injection) {
> +	case XE_CORE_COMPUTE_UNCORR_ERR_INJ:
> +		test_inject_core_compute_uncorr_error(mmio, fd);
> +		break;
> +	case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +		break;
> +	default:
> +		igt_info("Invalid Error Injection specified\n");
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
> +			      "forcewake_all is not available in debugfs\n");
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require_f(xe_mmio_is_initialized(&mmio),
> +			      "Failed to initialize Xe MMIO access\n");
> +	}
> +
> +	igt_describe("Inject core compute uncorrectable error and run post-recovery workload.");
> +	igt_subtest_with_dynamic("inject_core_compute_uncorr_error") {
> +		igt_dynamic("inject")
> +			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ, &mmio, fd);
> +
> +		igt_dynamic("post-recovery-wl") {
> +			igt_require_f(uncorr_error_recovered,
> +				      "Run the \"inject\" dynamic subtest first\n");
> +			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL, &mmio, fd);
> +		}
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 519a9e727..c8a4c9a6a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -294,6 +294,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
