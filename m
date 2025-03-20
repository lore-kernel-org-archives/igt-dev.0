Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D773EC35FFF
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 14:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8735910E3A8;
	Thu, 20 Mar 2025 14:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PORzrRYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A6910E3A8
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742479794; x=1774015794;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nreEyU4MBCjoEH+eAXZSX37l/XsnA8sbKnmMhtOOp5E=;
 b=PORzrRYi/PGCxrKkeOf0uZZwgCDSZPvdZOUPJTjAymh07wHQ36Ro8lV0
 BGCidkUY6Ow3uWwuBtXiocqUgcL+47LrbQB45hunFS05gZ/vj8QdFA2tU
 jgL7uywzH9+8ebkhXdfEHkWWQlsbyttISGO5s2Hg/ddcbOoUMnKx+Sput
 y+cD43JJGUSgTGS8AFLyEj8ngK8HIzLIv2a3/LodS8QFGtQ5mTOBzIquQ
 qxMbJXWUver+oiSWJnmW+yHG83PasqiNeKEEzD37junDL2vNnDQIDDLwu
 9YKSU+atg7v2nIWfYxFW8P96RwwlbWq9fySlUdGxq/V8HOnsHvWz0y39K A==;
X-CSE-ConnectionGUID: XAH+C8gtT8SchfpU0szlKA==
X-CSE-MsgGUID: Pt78Q0mlTGq3CAwTX0QDQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="53930496"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="53930496"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:09:53 -0700
X-CSE-ConnectionGUID: qFSKnDlxQ3O20Jn2J5FTRQ==
X-CSE-MsgGUID: OCPczdk2RWazKtXVajDqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123111181"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 07:09:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 07:09:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 07:09:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 07:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxWod+S0q9P/Spw351NS30x9hWWYYUFPWxFtyEmIS/EMwiyGao4r+nCUTEkzKHPYoDiI9v9dOyhAAgnhR+G6GTYAntl5EvzSYxI0Elhg+xxlEAS+BbrrFLKZdIyIg1eVTVsEQrw/q0ylf3OKb670bAdaQpA0ze4EH5sJmtlkGA88CwCfZys/M9qgovb7gfmOyvj46e5dacqCs9Ni+59W0gbKTV5tee7XwUmp46zun0yMsArmPkhOB2Uw9WZXRC6K+TaOhE14p8fpePcSmRCOJx+z7kilU0YpFys5SBbNqhzvju7fYxbARQW+iAifHu0yuVFlyavuvxH+KXg2zZQufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2nzFhhkjz4L2n6kZ1P7FUBrm0zL7OjrWT1gJcSSmG0=;
 b=VsubmgAxneh9jcY4JBFvFf2EqIsQm7SdXW9eeYryK4RbbN95fXqj6yJmBjHGhPDzx/Ojg5+QkdFrkrlXrHD4hPOOJua0KFXF1umy1ZQ9Ead9zZISMlVoCF/TytsnR/43BGBtOL3sjcAWLK+W1P7+UOFDNMveLYrD1+cD8AJtmUg0do1LUXkDP4pfXCjdgDr3CP01KDL6TpB2Zhnh4bpwLzwZ+gXR1+UFor5flAjnNWiTkChVjITlpY5p3OSSckUpYWCRiw4mHBRXRhcJB+dF+9i3hGOv9Z205a7jFm50vvrzDYVa9Wr30OGp0//hup9qtsDD/SKa9/x+QqLeH2ihDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 20 Mar
 2025 14:09:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 14:09:35 +0000
Message-ID: <56606e53-9eac-437b-afdf-4d6958f8d896@intel.com>
Date: Thu, 20 Mar 2025 19:39:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_addfb_basic: Split tests into subtest
 groups
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>
References: <20250312103008.613087-1-karthik.b.s@intel.com>
 <20250312204328.mvo7qdvryx77vp72@kamilkon-desk.igk.intel.com>
 <17c91321-4885-4649-a8dc-4438b782ae26@intel.com>
 <20250320133006.doxlplrllaxld7f3@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250320133006.doxlplrllaxld7f3@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8a97f0-ff15-4e82-10ca-08dd67b8d79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3ZmODhMT0o4dm1LU0pncGFaREExcUVzUllabFFLLzZFcVpPUS9CaE5LbXhB?=
 =?utf-8?B?c2NhQVdKZkhFMWoxeEU1ZWN2elM2aHJ3elBYSlg1Y2E3SWVsTjhEaUFBcG5o?=
 =?utf-8?B?eWdlME5XMThBZUo4NEVxa0ZmV2h6WTJYQUh4ZFdoRUFMMTAxeWVWWFNKQSta?=
 =?utf-8?B?NjFVM1NaQW45dE1IT1RsM2didzVUSXdQU0FCbWpoOVVwUXd6Szl5YVZKTzRM?=
 =?utf-8?B?N1dja0U0bjhDejEyV0lRM3FGUWZGcGxJVktXdXVoeU1tTVV0UEs5ZHFwV1Rv?=
 =?utf-8?B?N3FBdUkzRWRqMlRIcDNWa01Dakdua3lOZnFuMlZmMlVsZHlmVW4xZm0yZnJ6?=
 =?utf-8?B?bEM0MHRUWmoyQ0tTYnArR3JLV1h6dWRRV0k0d3hFdXpzKzUvVjR1OWhDZDNF?=
 =?utf-8?B?RDA5ZFB5dHBXeThHN242OGpQMlRuc3BDeFVRV1hFa3kzREcxM3dLR0dkQ3Ri?=
 =?utf-8?B?SnIzODVBYTM5T083bnBWbGRvK2M5RTNxeE5RWWord0o4N2tVeFl0cjNJWG1T?=
 =?utf-8?B?ZytxNUxhVVc2MWNsSHVXWldkajFXeTBLdDJJczR5eDNqQmU2ZE0yS29jMHVy?=
 =?utf-8?B?WjFnMHowNDVoSTlUeXFueDNOd2JWMnBCdytiTTd6SEVVWXorNjlOd25hZUJk?=
 =?utf-8?B?NUVGOFVObG9tVnJSb3piUkp6cUdLMFhwRzZMMUlSbmZDTXYrT25pVDRWaFBm?=
 =?utf-8?B?OVJnZEYwL21GZEozQ2VqaUIxMHNRTGhnS2taSmcrV254WTFvNWU3b3lmQ2tR?=
 =?utf-8?B?T3UzVlpQR1hOQzlNenJNQlEvZ2Zaa21aN1JCOTRVcFd5TUV6YWh0SmpkaE5y?=
 =?utf-8?B?eUp0VEMvdGFXM1l1S3FmeXZQSDVpbkZha0R6S24rS2ZDSXU0d3VOUkpJdDZx?=
 =?utf-8?B?SlgydFJJdHdNUW53VXFJQ1F1eTRteVpDYThvS3ZRRHVsc0JIQm5JakF5K0xB?=
 =?utf-8?B?c3l2UCs5eWZUVDhwcFBpOW12cW9wVmV6bG83MlpIVzlTUTNEZk42cXYwN28y?=
 =?utf-8?B?SExYc3A5RmpzRUtVcEtPNXhkbFZRczZCK3cyYnN1NU5TOWpmZTZYU0g4ckxi?=
 =?utf-8?B?T2hTTEpsajlJTWdDVHk5NG1VOU9DVEk1U2JTcmhwUlZsQUFtR3JhOUF4cEFZ?=
 =?utf-8?B?dHZGNloydU9LVTluRFRiNmd4MTBZWkRIVmdna3lLRjRMaXJ1dFUyd1pBTSs1?=
 =?utf-8?B?WTVaSnA1dGdOQXlQYktBR29LVVpVUmU0dHNuY1QwZ2kxM0x2U2FIblNpZzdq?=
 =?utf-8?B?MkU2bi91N2x4UXZKUk92d2F3cDN0WWJqdU5SaU9SeXBkZExEekhOT2swYXBk?=
 =?utf-8?B?cE8zcUNPaENIRUtIYzl4Vmc5a3VCajFRNko3aC9xbVpQTWg1S0ZBV0QzeXRO?=
 =?utf-8?B?OG9IRnJMMGlGc0N2NHdHcEthZm44bDVGTVgwYTNGSXd5L00rejVoNVY2OFdQ?=
 =?utf-8?B?Zno5WlBLZncyOTI1eVJLNkQ4R3RVQU1jRnc1MzVLU1NsN3pRSkIrbXA1TGJk?=
 =?utf-8?B?MSttTmVPRUFQRmh3VTVtV1dDbFgvOWk2VzFpQWpmVXA1Y2pweWZ2c3gxVDdZ?=
 =?utf-8?B?RDRNQmlqNDFnSUJLb3pFOHl1MjN5Nmo5dXFKd1dGUHNTN1RFTWx5TEVmcjVE?=
 =?utf-8?B?dEpTK3RqMGpKRGNSaWhiK1BNUE50NllURWhXWUxOWU0rbCt6KzVTc20xSUNy?=
 =?utf-8?B?cnR4WWVZZ1dSZ3l4V0dPTmJlbTNWS1FuU3VyaGtnQ3BnWUlwVDU5Tkt6b29K?=
 =?utf-8?B?dSt0VGp2T1NLK3VMZmZCanJWMGN4czRlOFBhQldOYkhoWFp2Q3hMZkkyeER4?=
 =?utf-8?B?RlpmTjNuanFGbldpRitQTnIzVExOWTF0c0lwR0RuWkNEQW1TMXQzYmJGUkZy?=
 =?utf-8?Q?TwVVsUGmRC85y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXlzUHczZUl1azR1UmhEdFc4UWRmMjR4dVkvUEdMRm5XUXlpOHdYVDB4OEFk?=
 =?utf-8?B?MWxlT1B0WnVobmNXQTIwZ2hNclc4UFE4NldYTzNLMmU0TjAzaXlUdytFdzcr?=
 =?utf-8?B?MkxpQlkwTHZiQ3NkWGpEM05sRjY4TU5QVUU0bDlobnNmNk5GdXFrTlF6UlpL?=
 =?utf-8?B?c0M2dERMWm9Zbks0b25RZitIcDJpMjM1SFRjcUtURm8xTHNOd2tZMmhVQUxu?=
 =?utf-8?B?N09UUkVxRUtZTTRjcnNMQ1QwQmdOQ1kyb2FCM3ZJc3VDbDg3eHBBK01tMXk3?=
 =?utf-8?B?WjZiNjdUL1hVUmxjQi9SdVEvakJ4dklQWFNiSDRtZythdy9KMnRsTDM1ayt2?=
 =?utf-8?B?WmYxRmtjQ2pDQlJwbDJrWXNreVFlMXVsclRZVWpiS2RyQXlnZXdnOENkWndL?=
 =?utf-8?B?dzBwTjFuQkNQajJwRG5DRTFSdmxTRjAwaE45T2dTakpkNHhGZ3hpblBWb09W?=
 =?utf-8?B?ZDBSUVFsSytWQWI4Ti85WHdDRkZ6bXRFZlZVNG0zaVl3WjY1L25zayttQU8z?=
 =?utf-8?B?YVlnQzdLbFZNK2JhODlpbmNWWTNGLzBtRXRkMHM5emhsZXVZaUE4QjVRRHNy?=
 =?utf-8?B?L0czWUo4Mm1qS1pBcDB4aGVmczUxOE92QmRCeTMwa3ZkcG1Ea2RNNGs0NUZN?=
 =?utf-8?B?WHhsZWQ4b0JReE9BczFUUk9qd0tYMGdnMXZSRlo4bVBMc21seUI3K3pndXdx?=
 =?utf-8?B?akxNSUtEZUtUYjAwTklXd0Nob1Rob3lQdHF2dEFuM29uODFuZVpIS0xOWTFz?=
 =?utf-8?B?V0hqdW1HcU5mR09TMjRGVEJjbUloK0NDM21MbVI5MlRnWDNONnY2bzByaFNZ?=
 =?utf-8?B?RXErbHE5VUpnVEtWUjFJOGRkc1NxUmNsckcySTRKU1ZvdzVwWU9Jc3c5STQ5?=
 =?utf-8?B?NDdRNTl4TlpPc2hBaUtWVjlZaUo3c2hERHNZb3NmNTZ2anFnb25pdXBvQ1pi?=
 =?utf-8?B?QlBydkNDZFZYRjlyUU1wUWc2QVNUUkh2QitScjhGTnAxVjhNTGFWc2pxbysr?=
 =?utf-8?B?WHNYSEpHeEN6RisvOUNmQXZnK2RFL2Y0a3U4K3paU2ZKTHJsZXBENnBPUXVi?=
 =?utf-8?B?eUs1STFzdmpmMHZXVDdCbmdPYUpKOGZJc2FwZ1lGMEhDbXBHdkI5WTY0L1JH?=
 =?utf-8?B?ckMxYzZMWkJiWUwwU21QU0pTZHJraGhwNVdBdE8rQi9kdEhaUVZQeDBJclg4?=
 =?utf-8?B?ZTB0NHBvWDhDZkxHYUs3RTE4Q3VKUEVTQjBoNkFTcnVDSE4vL2tzYXErWUhL?=
 =?utf-8?B?N3A0RzJqMjVzZHpVWk9HbTc4S1F4ZFlvNGNQSURVOFc3UlZFTVZvT2szemp6?=
 =?utf-8?B?SDVZdlp3dkdIOTNaK1h5NjFwb0ZEemx5d2NFVW4yZFRyMVlwZEg3eHJHR1Na?=
 =?utf-8?B?SXNDRGpqUHVPckZNcHF6bWw0RUQrNUpxbzJEK0dBcFlpTlhadTJDU2NwMWMr?=
 =?utf-8?B?OVRYc3FNMmtrdXpYbXBxbDJDYkdqSUdqNFVxNEVpakJpL0NHQTJHNlpFVzBr?=
 =?utf-8?B?NmtRcVFIRXBDNDc1V2pNaStpT2wvdXdoUVhnem95WnluSk4rVGlTdElqQnM0?=
 =?utf-8?B?eEtYV0xkZmQ4UHRoRDBKOTk3K3RpckI3WjNURGJOWTNFMW9pQ2VpMzhMbDJk?=
 =?utf-8?B?SXhLZDBYM0VWQ1VjRzNNSm10SGZUcFJVNGo5OHk2QUdRL3Azcm5tWlRZam1H?=
 =?utf-8?B?bVREeXptUnhPdlNZbW5xaEx3NzNhVzFZNHUreVZRbVFuanFLN1pOTTU0bEJF?=
 =?utf-8?B?czZNSmZpSlg1MEtnOXJUT1lLK2NoTUFpUGQ0bzRUdEEwdktVK2hlenlGQzZZ?=
 =?utf-8?B?WlhiOTBBeUcwTmNLb09OYnk2K3NoQXhDWGRpTktjdDR0aFpVNmlkamVEbkxt?=
 =?utf-8?B?Y0ZhU2xMS3BvQXBsSmZEUHZFbzlXREh2T2NRdzRCaXpMZEIzeVJSVnlDTEtU?=
 =?utf-8?B?WUcxdThPU0FlRWJsTzNFZVdkRG9QbjkrZDNLYlJnU3B0eHFkV3FLSHpSa0VM?=
 =?utf-8?B?R0NjTTJjWW5pZTRaNFU5eTc4eDFsYUh4WXc0WFVscXRteTFQZzhpNHB5eW96?=
 =?utf-8?B?K241Q0lrV3VwZWo3bFZLSlJYcTNtb1dDbE02VzN3Rkp0L0tIaTF5UW11L2Iy?=
 =?utf-8?Q?7HISsICjW2tofNW40OGA3F6YU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8a97f0-ff15-4e82-10ca-08dd67b8d79f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 14:09:34.9874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZA0VdDL0McQ3WdAPkf1GDNxMrxsXM9Lf2vOhksc3AaBa6gPDAtbqqVf5Cs2X0A2d1SAnXGi8ooQbR1yIZmtrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
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

Hi Kamil,

On 3/20/2025 7:00 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-03-14 at 15:13:57 +0530, Karthik B S wrote:
>> Hi Kamil,
>>
>> On 3/13/2025 2:13 AM, Kamil Konieczny wrote:
>>> Hi Karthik,
>>> On 2025-03-12 at 16:00:08 +0530, Karthik B S wrote:
>>>> Multiple subtest groups exist in kms_addfb_basic with individual
>>>> igt_fixutre calls. Split these using igt_subtest_group so that any
>>>> failure in the fixture of one of the individual subtest groups don't
>>>> affect the results of subtests in other groups.
>>>>
>>>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>>>> ---
>>>>    tests/kms_addfb_basic.c | 15 ++++++++++-----
>>>>    1 file changed, 10 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
>>>> index e5ff9ea32..268e4e0e4 100644
>>>> --- a/tests/kms_addfb_basic.c
>>>> +++ b/tests/kms_addfb_basic.c
>>>> @@ -989,15 +989,20 @@ igt_main
>>>>    		igt_require(has_addfb2_iface(fd));
>>>>    	}
>>>> -	invalid_tests(fd);
>>>> +	igt_subtest_group
>>>> +		invalid_tests(fd);
>>>> -	pitch_tests(fd);
>>>> +	igt_subtest_group
>>>> +		pitch_tests(fd);
>>>> -	prop_tests(fd);
>>>> +	igt_subtest_group
>>>> +		prop_tests(fd);
>>>> -	master_tests(fd);
>>>> +	igt_subtest_group
>>>> +		master_tests(fd);
>>>> -	tiling_tests(fd);
>>>> +	igt_subtest_group
>>>> +		tiling_tests(fd);
>>> I looked into those tests and imho this needs a major refactor,
>>> for example there should not be any igt_assert() in a fixture.
>>> Generally igt tests works ok for one fixture in begin, last one
>>> at igt_main() end. When used in-between it becomes more
>>> complicated to handle cleanup.
>> Thank you for the review.
>>
>> I tried out by inducing an error using an igt_assert(0) within the
>> igt_fixture of a subtest group and verified that the this change handles the
>> issue by not failing the subtests in other subtest groups. As agreed
>> offline, will use this as a quick fix to handle failures in the current
>> design and for the long run will check if there is a way these fb
>> tests(kms_addfb_basic, kms_getfb) can be redesigned to be more robust.
>>
>> Thanks,
>> Karthik.B.S
> Yes, after a second reading this could be a first step
> followed by refactoring later, so as this could improve
> testing a little this is
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thank you for the rb. Will merge this and then see how overall test can 
be redesigned for the long run.

Thanks,
Karthik.B.S
>
>>> Regards,
>>> Kamil
>>>
>>>>    	igt_subtest_group {
>>>>    		igt_fixture
>>>> -- 
>>>> 2.43.0
>>>>
