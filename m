Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1630FC369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 14:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AFB10E6CD;
	Tue,  8 Apr 2025 14:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGqkMcKn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B3710E6CD
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744123600; x=1775659600;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wp8kx72L8QSFVs5VgCewQJcgCWQaNRClqj+od7Cx7mQ=;
 b=RGqkMcKnSbE7Y7kDgZXtBTzkCd3skYhXQMPy97oVpPVfmbqUidyyV9hf
 3YLYoyufH1DCKW+qkxNsXzNdO2nLjAZeLWbCHHS51X56OMwGVgVh9fpl/
 8E9c6Y7mxhcpc0V6iXiljN/4x09+wXAeuqyjQRgmd5kAO/kxGEm3PQEWZ
 LZ6jUfE1M/eIuC23NI2dKwRTSQ+spZBC5xYtenNs0c5SGGf6+mYGYjCqE
 Xqr8pyb7ztnuiolae9ZiCqPLVFoRcf4suGFjvH2Ur0n8bLAiv++AS6Lk+
 iWjn8xO96B7poct75sEwb6RDCaSbrJ2jHVvbz8YOTQ/za7E0FAFeHym81 w==;
X-CSE-ConnectionGUID: pk8oAHJySWi01ct6Poqcsw==
X-CSE-MsgGUID: upDzg1y2Snm7COvRyPdlZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45721695"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45721695"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:46:39 -0700
X-CSE-ConnectionGUID: yBAMpS4URdaHCxMkNJiiUQ==
X-CSE-MsgGUID: El3SzlMXRdqxoKScz4PffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="151483850"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:46:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 07:46:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 07:46:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 07:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BR5mbfbS5TKHTEml+Er1TPqgolCvNVmCfTgce7k1z69gJQ95FbwaMcJJV1mhQLNUH3k+saqK06JQ2GhTyioD309Fne+47kzGJTqa67QwAzg1RHkp6wh4VTzcnZFj6GF/d2pGTdLjQi4GOcOF8nTNmzjgTBg3cX7UD6dCwK/yz9tnfN0DO8QrXdRvnFgL8xKkXeX1T22q7k8S+XMriRLLBEOqx6bRvo3i/Xf3w5AuFuIo8ZOM7YPN9n7+K+uds0x3VUrA1yCOmGpPmwv7QAK9ASO2N35GIAEzvVkZSe+o2HxDkOHAdOfFvikhGByWAxx9x12KZUGAMMm7Vv1JWG+06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsA8B5zwLaigPwdCSc41b0aPZtoYhLjFstArvwLEHmk=;
 b=FqCnqj8Kt5qQLTwHET8364FyrAC8229ey0m0LX2jRR3H5Im/jaxjWzZH0T7uJn9Vfso+6TPx5iHXcX/oVtpRWBvB3qex5HUJBLaf1P3kX43MtK8qkPb71wKZsmXKBt8+KYUygtjWGLOq9PF6pvydrvkq6lNs2+pqlB8I4O/1Eo0BjdyDvWQ4SUmrnrMKlyNntymW0NQSuGMGMLeAgER7OCjNDlD5ywlO7/8LgFbS1ZGHjA9WrhxtXJP4zWYlxvj9pdrzVCbL1X08VlELlDSbyc/GZJKCHgXbXubZpUbsAX7Gnozc0D1btymiphCMxkrFV7MzaU0oULcQVxJxZFlkrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 14:46:35 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:46:35 +0000
Message-ID: <16260d04-0d7d-4ac7-8810-b0ed9be2782c@intel.com>
Date: Tue, 8 Apr 2025 10:46:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tools/xe_guc_logger: Add guc logger for Xe
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20250312213057.1374314-1-zhanjun.dong@intel.com>
 <41da9389-46c8-4ec8-a70a-594a6e450002@linux.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <41da9389-46c8-4ec8-a70a-594a6e450002@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ2PR11MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: f8df1095-cc52-4121-329b-08dd76ac2902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk9zYkdFWDlQMDJnY0h4cWdzZWFKZThBeGFWYkFINFdRMElUTllFMkJqTHRX?=
 =?utf-8?B?aWtwYmNBcEUza3VFbmJNNXprUEdwQnhSdDYydTlrelUvNDlNYkZsaGJ4TGE4?=
 =?utf-8?B?c01LbnhnUXQ3TllsbmFESVBUQ2ViTzFLQkE4Um1nbzI4cmlhcjhOdUpOeDhl?=
 =?utf-8?B?VDNIRUJOVkcva0ZxS0VGTTJQbXR6YlNKQkZTVUlRUlVicmhxKzdqS1liODYr?=
 =?utf-8?B?ZHNtWndxT1cvelVvbEltU20vSFM4OGcxQlJhQXlnVGgrNVBSQ1BOUTR6cUdp?=
 =?utf-8?B?aEFEckQ1VkxLcTcvNFZnVUlLVlBnNnlnMlV6aUNieUZkR3Z3alpBOXdETHBa?=
 =?utf-8?B?Z0FRSGlMdlhkdWk5dTBIak9TR3VhUFBFbzhzREdJa1RWQVFSTlJ6UHJsZGEw?=
 =?utf-8?B?SFlpT0svNklpNFFDUjVhYzlyVlhrZWNBbDZ2OG9STUMwY0pDc2dmMUxEc0xD?=
 =?utf-8?B?U3lxRU5ZTy9pbUxIVFhJLzFUdUF2by9MWFA2OGljT1k1OURhR01vTzNMeTBj?=
 =?utf-8?B?QVordWFzWXR3b2hjbnUvRFpUdVNMU2txRlR3dEZLaEQ5ZkxFY3ZScHUzR0tK?=
 =?utf-8?B?UGpVd3V2SThNK1hkZHkzazNLSkN6WlJyUmtnR3FVK21Wc1BybVRvcnI5TGNU?=
 =?utf-8?B?bnY1SzYwczZEUmdiWml2QXU0d2oyR2ltb3o4VTRReWpjSlkreUMyMC9ZRytX?=
 =?utf-8?B?bkFIdTI5ZzlxaVo5aTFJQk9qbFo1emRqdXZVcFV0OVFLNzVFd3lnenQwSG55?=
 =?utf-8?B?VUVLQ0xwOEZWVDRpWVlYZVNLUmsvM1hxTHFLZU92aFNvaG8ycHRZT3hhazBJ?=
 =?utf-8?B?ZGJ1clZ4OFBnTWFKRkJmeFJDbVZ2QjViKzZrTXdZQVJyNUVtbDcwOE4xQ1N5?=
 =?utf-8?B?RmlkbEVVNjNhNjVGL25zUWswdDIvamJCT0pnb2Z6ZTJnaVJzT0xld3VMcU00?=
 =?utf-8?B?UFN2Z2FtMXNQMUphdCt0RTVjRFhFQW1RZTBrd3VnWHdMdEx3Y1gxN2hzZDJT?=
 =?utf-8?B?aHZiYXNiZVFTeURYUW4ydW9NRCtQMzNlSFdlckhPcXRQaERIU3JlbWduQ3Bh?=
 =?utf-8?B?QmVDZ0tjNEhlbDd2SEVzN2VNUVFkcUZFSVFJRkR2eC9Sd1BiMWZoR1VTdGRD?=
 =?utf-8?B?QzVOKytrUkIzT2Z6K3RNbmZ0NG1vVDE2SzVISmlTUWpZRHUyUEhKaXgxdmNl?=
 =?utf-8?B?YzV3YmVucVU4S3kyRjc0OTRRcE02Ykprb3hadkxOOVJRaXhVMzFnZFQrNzhG?=
 =?utf-8?B?RGZWV3E1bnl4NktPbjFUSU55STI4Y3hSM0xGWE1TMXIzK2tyRWk2N2M5MEpR?=
 =?utf-8?B?Uk9JU3U2bU8zaW5yVWpiNHIwWGdzTkxHR3p1Q2hSQnEwNW1jZXp6bjF6dFNl?=
 =?utf-8?B?czhSTURTbGgrNmJ5SUQzemlkUTRCWE0zRSthOGFpV3g3eFZKaDhRSWxRbDY3?=
 =?utf-8?B?eSs3L3hFNVE0NW8xYi9vbFB1LzhKZEU5V2xTMktSczkxTU1CVkdPR1dTTG5Y?=
 =?utf-8?B?Y2lKUE5BZjdMbHgwblpMNXFYOHdSZDdRSHFNNUxSUEpYMTlhUTZyTEg4N2NY?=
 =?utf-8?B?eTlWcmZkVGVNbmVXVlg4eUNETWd2R2N5TGpUMldXVkRkMUc4UmxEa1ZqZHNW?=
 =?utf-8?B?Zk42TzVGQ2JvcGdLcWU1Y0NLTFhodVp3VVJCQXNrOTN4eHBNVmJ3QXZGaW1K?=
 =?utf-8?B?cGsyYXZXRVRZektiMTljeFZqWENWU2taUWREUVpoMXQzRmZpeEJKcEVScVla?=
 =?utf-8?B?TzNSbFpJdnZVK3d1QzVZaXNqQ2Q0bTNaVnZ5d3RJQjRZN0svY3ptUlBNU0VY?=
 =?utf-8?B?OVJWZXRITDVJQlJ3QkxYOWlrRUQ5TkNlSUdpakRBTHBOUnUvM2o1SUVRNzJx?=
 =?utf-8?Q?So3/1I/BYOV/k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFXR2tnMmd5dXJ1dXJhNEwzaCtwTWc0YWdySkFGNkRjV1IxeE12SWhmd1B5?=
 =?utf-8?B?Q2dOam1jL3dWYUIvUlhpWkxCemExN2FvTHBlYVVseUE1TWxpQVB0RUxIS2VQ?=
 =?utf-8?B?YWd6cElVVC9RRW5ZdjhwQVRBMHBIMnFvWGE3SmRBTzFwclIwSGNUaWthZDBE?=
 =?utf-8?B?T0Y5UWphQmF5aUpWZ3JLMlhQR0ZpSU9IOUtvNFVUTllrNTdJcGp2aUMvZ2xU?=
 =?utf-8?B?TXZTT0dlUG9KS2I5YSt4djhVdzBZMFpJMTRqMHJ6d0lnVVViTGd1cGpJeit1?=
 =?utf-8?B?bld0V2NwNGlRRVo5MGNRQS9WdW1KMnFNZTQ1S0l2aVJHTldvZGZkSS9ZK2RE?=
 =?utf-8?B?WG5KQWpQcEFDM0lUUG5OVjlrNXdmb0N4WjJDZnlPYWM5Nzh4TU9seTRYSkNE?=
 =?utf-8?B?bjRtSWRaclJ5UUJ3S0hpbVZWcWhHQWlOdFhWT3dTTXQrMGJhOFBYR25lcys2?=
 =?utf-8?B?blUwSzBNMi9qRVVqMlJud0dIQUtpMDFIdEZZa2JUWjZSOXg0WTErYzlqdUcz?=
 =?utf-8?B?VWJPdnFlY2FLZkFsQ2tYWldQd0VacmJlaGs4TFowVnlUYWxBNE1hSDhtYUdi?=
 =?utf-8?B?WlFJSXZpV25iUXJHVW9qNk41TzZlSUZTUzVCblVDR05ObWhZRTZXcWZ0aWZW?=
 =?utf-8?B?c3BsQWU3T0JFZUpzbmdFZXpSNGQxNmZXOTNFOExRQUsyaTlOMzJCNU8vL1N2?=
 =?utf-8?B?SnExTkN5OHhrK2pYbUJ1RitKakIzeGV1OFlQYjFmYlZWMHg5dmtickxUa2ZJ?=
 =?utf-8?B?dVJsN2sxT1dLM21BOFAxWEE2L1VvYy8yTEM4b2JNZjJjb1VEb2taSVdSOE8v?=
 =?utf-8?B?QURlZzVFRzRodlgzZUR4L296dFovMzV1bHlvZXFLNm1UUERtL1h3S3JNNys4?=
 =?utf-8?B?UnEycm13MG9FaDNGOXlkSHAwSEwwS01Iby9NNklPaEpCT0hpNlRIcSt4Z0hF?=
 =?utf-8?B?Z1FtWlNZbHBXek9QK0pJaDNacnpscTRVcEROdHRvSXZwNHJMckdlRTgzZFUr?=
 =?utf-8?B?SDBjbEZ4RWg5T1FEYTIzdW5GMnZYSmxqM01zYnNydUdVbUhPOEx0SjFpb3Iw?=
 =?utf-8?B?RXoraEVIU0lDUFlsOWNWVzhCMFpQN1lKNjRhUS9nWS8wUUVJOGZ4WVpSMDc5?=
 =?utf-8?B?OFpmWW9lQXArVytIQXgrY3dWdEY4RmwrTDZLWFBUY2NGb1MyeVFTSEIzeklu?=
 =?utf-8?B?S3QrRFBFWjFYRVFQaDd5QlN2Y3VLbEsrdkd6RWpVaHd6L0xVV09jSnlod3hN?=
 =?utf-8?B?TzNSQy9ORFhZb0JUb2lieEJySkUrQUxoV2VGOFRxVzgvVlVtUW1pMW5PRmNH?=
 =?utf-8?B?M0svN2xRVHZyeFYzTG1xbmJBTVFycnc0VG9sNmhuNDgyd3BxK1JoUVhEK0U3?=
 =?utf-8?B?dzlkSGdYSVhLYlFGb2x0VzZ0ak1Nd2lGT0d1bDhKNnBHb1FBaHoxNEEwNURF?=
 =?utf-8?B?K1hhVk4vSUFTNEl2K3Bnd1hKQnBpbm81NTRuYSt4YmEvMTB1UHhBWmg5TXY2?=
 =?utf-8?B?R2ZTR2IzSEtia3RZaXJjZERTYTdIN2R2TFg3THgzQkMzTmdrbVNiUUErY0h2?=
 =?utf-8?B?TFdVVXdtSFF0RzBGSkxZKy93YjNSNndpcWVGUHBsWFdPeEttblFTWi9YRXhh?=
 =?utf-8?B?WERvUHJRY0hzQllqVHljVFBLOFJPV2V4dVZZWm8vOUhEbGo0YVFKY2dIeUd0?=
 =?utf-8?B?OE1vREF1V1REWU1hVHhDN1paMEtuQlFoSG5zYkVOY1VrZHZVV1BEMHptSnd5?=
 =?utf-8?B?NXBJb2RDcEZRZ05jcWxSZHk3cVUzM2lPQ3pQQXVmdDhkdGtQVENDalhjZ2Zk?=
 =?utf-8?B?MnpzNElwY1BSZVhUQnJ0MkUrQ00xQ1pzZ1pFa3B4aWh2aWRLMUEzYUNiRjZq?=
 =?utf-8?B?d1NZVUg1ay80QlhUQitXK1J2ZDd2WFFwQ2ZZeERqRnBKWmE1eExwdnZmaVc3?=
 =?utf-8?B?TTdDcWR4U21ZcE10bmVZT08zU3Z5YUNSMXJkdk16TzhiMUZYbFFRcXAwbDRT?=
 =?utf-8?B?Yi83bmhiQ2x2aVNMRkE3RHJtWUlmWmkwTE5SNjkzNm40aFhqeXZYOHVCdFRy?=
 =?utf-8?B?Z0QvajVZYkhWaXVHdGJORmtodWt5cFU1cDltcVZka05uVkFpck4xSjBLT09J?=
 =?utf-8?Q?cPnyUqDvdf5anZLGU4hix7gkv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8df1095-cc52-4121-329b-08dd76ac2902
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:46:35.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3Mst+IwIw5WMurZQ+/a3ueEt6uAJpg2gmrRwsBpEnsuOxU0S71r7AVmR6oj20CFZo1Ud6/yR9K5wV+45RZYcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
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

Thanks for review.
Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-04-08 5:10 a.m., Peter Senna Tschudin wrote:
> Dear Zhanjun,
> 
> On 3/12/2025 10:30 PM, Zhanjun Dong wrote:
>> Add guc logger for Xe, support save guc log in LFD format.
> 
> I tested this patch and found the behavior of the tool a bit
> confusing. It behaves more like a test than a standalone tool.
> For example:
> 
> $ sudo ./build/tools/xe_guc_logger -i /sys/kernel/debug/dri/0000:03:00.0/gt0/uc/guc_log
> IGT-Version: 2.0-g4b22256d0 (x86_64) (Linux: 6.14.0-xe x86_64)
> Using IGT_SRANDOM=1744102201 for randomisation
> SUCCESS (0.371s)
> 
> $ sudo ./build/tools/xe_guc_logger --help
> Usage: xe_guc_logger [OPTIONS]
>    --list-subtests
>    --show-testlist
>    --run-subtest <pattern>
>    --dynamic-subtest <pattern>
>    --debug[=log-domain]
>    --interactive-debug[=domain]
>    --skip-crc-compare
>    --trace-on-oops
>    --hook [<events>:]<cmd>
>    --help-hook
>    --help-description
>    --describe
>    --device filters
>    --version
>    --help|-h
>    -i --inputfile=name   name of the guc log file, including the path
>    -o --outputfile=name  name of the output file, including the location, where logs will be stored
>    -v --verbosity=level   verbosity level of output
> 
> This makes it appear as if the logger is a test case rather
> than a tool. I suggest removing this test-like behavior. You
> can look at other examples under the tools/ directory, such
> as lsgpu and igt_facts, which are implemented as tools.
Right, the tool should not has the testcase help message, to be updated.

> 
> Additionally, the tool is hard to use without reading the
> source code. It would help to:
>   - Automatically locate the guc_log files in /sys/kernel/debug/
>   - Provide a clearer error message when the input file is
>     not specified
> 
> Right now, omitting the -i option results in a test-like
> assertion failure with no guidance:
> 
> $ sudo ./build/tools/xe_guc_logger
> IGT-Version: 2.0-g4b22256d0 (x86_64) (Linux: 6.14.0-xe x86_64)
> Using IGT_SRANDOM=1744102681 for randomisation
> (xe_guc_logger:2445) CRITICAL: Test assertion failure function load_guc_log, file ../tools/xe_guc_logger.c:267:
> (xe_guc_logger:2445) CRITICAL: Failed assertion: fd
> (xe_guc_logger:2445) CRITICAL: Last errno: 2, No such file or directory
> (xe_guc_logger:2445) CRITICAL: couldn't open the file: guc_log
> Stack trace:
>    #0 ../lib/igt_core.c:2065 __igt_fail_assert()
>    #1 ../tools/xe_guc_logger.c:166 main()
>    #2 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>    #3 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>    #4 [_start+0x25]
> Test xe_guc_logger failed.
> **** DEBUG ****
> (xe_guc_logger:2445) igt_core-INFO: IGT-Version: 2.0-g4b22256d0 (x86_64) (Linux: 6.14.0-xe x86_64)
> (xe_guc_logger:2445) igt_core-INFO: Using IGT_SRANDOM=1744102681 for randomisation
> (xe_guc_logger:2445) CRITICAL: Test assertion failure function load_guc_log, file ../tools/xe_guc_logger.c:267:
> (xe_guc_logger:2445) CRITICAL: Failed assertion: fd
> (xe_guc_logger:2445) CRITICAL: Last errno: 2, No such file or directory
> (xe_guc_logger:2445) CRITICAL: couldn't open the file: guc_log
> (xe_guc_logger:2445) igt_core-INFO: Stack trace:
> (xe_guc_logger:2445) igt_core-INFO:   #0 ../lib/igt_core.c:2065 __igt_fail_assert()
> (xe_guc_logger:2445) igt_core-INFO:   #1 ../tools/xe_guc_logger.c:166 main()
> (xe_guc_logger:2445) igt_core-INFO:   #2 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
> (xe_guc_logger:2445) igt_core-INFO:   #3 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> (xe_guc_logger:2445) igt_core-INFO:   #4 [_start+0x25]
> ****  END  ****
> FAIL (0.046s)
> 
> Instead, please consider printing a helpful usage message,
> such as:
> 
> $ sudo ./build/tools/xe_guc_logger
> ERROR: Please use -i to specify the guc_log file
> (e.g. -i /sys/kernel/debug/dri/0000:03:00.0/gt0/uc/guc_log)
'-i' is designed to let user specifiy data source, it would be usedful 
for mulptile gpu  system. Thanks for take time to test it, I will 
consider better handling on this. >
> Lastly, it would be helpful to clarify the purpose of the
> output file. What does the tool provide that a simple cat
> on the guc_log file wouldn’t? A short explanation in the
> source code and the --help output would help users and
> developers understand this tool.
Good point, will add that later.

Next rev will have dependency with KMD/guc changes, this tool will not 
moving forward before those changes finished.>
> Thank you,
> 
> Peter>
>> Reference:
>> https://coredocs.intel.com/InterfaceDocs/sphinx/core/kmd_log_file_format.html?highlight=lfd
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>
>>   tools/lfd.h           | 590 ++++++++++++++++++++++++++++++++++++++++
>>   tools/lfd_default.h   |  39 +++
>>   tools/meson.build     |   1 +
>>   tools/xe_guc_logger.c | 615 ++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 1245 insertions(+)
>>   create mode 100644 tools/lfd.h
>>   create mode 100644 tools/lfd_default.h
>>   create mode 100644 tools/xe_guc_logger.c

... Omitted ...
