Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04618D3B9BE
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 04:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7854710E03C;
	Wed, 27 Nov 2024 04:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWbSGuAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8793E10E03C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 04:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732681778; x=1764217778;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=untngnQJ7N6fsKE2QwBGBWcyzhfD5b2kr93B5JY6G/s=;
 b=QWbSGuAkanJ5ago/zhMUlHOuLK0jXo9EZWPBMu0/31Wzr7TA8GGSACuN
 j/aAQakeE29LL3ySX31XdGGKFQ2QzcsjK+VrabDZr8OS9hvXjXsTlp48x
 oHaOhiTADNPl1+J+kz1nLisbJaUY2GU0eAj9VO95vkAJs6ukSvKq17USm
 22JB1gMDlmht508xCNs/9zV8mmti5MDhW4DLshTJNy/hhsetMiSBtTUlq
 gz5y5wVG2pA2Jxf5FZgBp7oHEW5beo2ZPanVJ6ukWg+dp28tGM6Lk+fRU
 7jfflJexBZdUh62whnr0wHilp8Y7cObxD8TOCoZ8KS2hwfr/6a2XiWIMj g==;
X-CSE-ConnectionGUID: se4PjhkHQRedtx2bW40ffA==
X-CSE-MsgGUID: E87BSv/PT8qKGzBxpyFdJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33017158"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="33017158"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 20:29:38 -0800
X-CSE-ConnectionGUID: bkRygpxjRgaI2kBriJjI2Q==
X-CSE-MsgGUID: BVMgLokpTr27ckZ+MHLCBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="92282545"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 20:29:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 20:29:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 20:29:37 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 20:29:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7Dx/LiKtB2vZH7VeMeaKmdHkX7heOfy4NAOWIOgFCJrSYNjAaSsL306K8b4Oh4gADd12R491wCoxBE0agdwR45m08Dcl3u/XRy0VktBhG6Aebsudu3BVRe7N0tqVAGdXHaD/nqg6aiP+PalFxHHt6S9gv4Pu8i0JMh6yuBceKCF0r/QHywXKINbZy6prHXSc1CDH7Zcw3f8VtrsMVxFf+tu0TQqd3UcxdAJXKNvSAdOiIWk8M9BM4RzXtdq9ChJUPrkKJeEXOhqDGIKhomIREcmwNe8gqLiq95vD9va9SsRMVIaBYhw0LYLt9VpZPCOcSF6mYm2CV5Phfyes57v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3JcKAa5H3MdeHt0ysYT/TUjk3suWDP9uekFk+SFvEw=;
 b=QhPW1pGsQLXCQ9LugHmAIk3Mc95Iw1R47FYCKYgUgzgwrP8eUylEGxf07JM7KVClJq76LayWmFonyDuqVf2fgPXOf3WaTWCUCQQOVET8z3/KrT0zH8xCARuVd57ZNoIoizGS3tiQmR2OzngAuxc4CVd7AQwkmVALXVYBRRTYY7+k+QdH9h3/4goVGyVleamKEzJ9YWl/QA6yK+xngzp8jAFRZHberiftglmKn76DshcDqxdDPABQfupoVdSNnmc1WlbdEI7izFRNBnxY9DH06d/LkRS/r4pkCvWOCHVb0Rhjkf5F61TC+daceVGB97fcSW10Ro6QviKp5J62yLnq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Wed, 27 Nov
 2024 04:29:35 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 04:29:34 +0000
Message-ID: <b57ef6ce-1466-4f61-ba85-abf431fb1634@intel.com>
Date: Wed, 27 Nov 2024 09:59:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] tests: Update igt_bigjoiner_possible calls to
 include drm_fd
To: <igt-dev@lists.freedesktop.org>
References: <20241126163021.458991-1-jeevan.b@intel.com>
 <20241126163021.458991-4-jeevan.b@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241126163021.458991-4-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::26) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6698d3-de00-4849-0add-08dd0e9c188c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjI3bnEyVDIwdjV6cEhUOGtnY3hQQ0MyZU5rUyt1S2RGeGZGZlVXeVJhR29P?=
 =?utf-8?B?T0RFL296OXR0eHUrMGEyTzNuUzgvYkM5MnZtVUh3QWt5SE8vanNaVUR0cnIx?=
 =?utf-8?B?MzBRNEZNVXlVdzR0cG92cW9MSmVsdCtuUTJMMmdqSzhPdVlCUW9CcEZPbVJq?=
 =?utf-8?B?d0xyM0ZrdFAraHRtMFArUUM3N3hGZmlXSi9hZy9wNzRhWTdyOEVEa2wzQU03?=
 =?utf-8?B?RUlCMUNjQllRMDJ3MjRTOW1idmtXR3dxNzQrMHVobCtVU1J3YU9lR1JweXZH?=
 =?utf-8?B?dk01WXZyNkJsa1ZqaGJHRC9UQ1JISkZoZFB4UGU2Tkc3amExeHNGRVZZVUxN?=
 =?utf-8?B?blpqemM1TDgrRVNvT2ZEdk81RThpREYyTG53MVAySllHY1ZKTXJjL3ljUkVk?=
 =?utf-8?B?SVFlck9Tc2tnREJhUDNWZEwzZE9ab1BZSDN3Q1VEWDlTTlVSUG1tMWFzRFVl?=
 =?utf-8?B?NnBuc3pMSkVGNGZ3dkQxNjVHL0lzUjltcnlZVEtKOElFdVg5RTlhSjNzR1hC?=
 =?utf-8?B?a0JoZVVYS0lNYWhrTlA4aTQ3NnJqOEpmNlBHcVZZUktLbDVOV0xnY2Y1cWRq?=
 =?utf-8?B?eWRzRThzUVlpMzBpMXVWUUZXNEd1NWNMeDh1dVg5UFhJa1l2eStCVXhDb2pC?=
 =?utf-8?B?WTVocE1Nbld5ZThCUHlmMHVmeTZyeTZZZEhTTWxEY1QzTS9YUWFsc0JKLzkv?=
 =?utf-8?B?WnRZb1BNVFh4eG9hYzFsbW1TU1ZNUWNTMzNERXlxcEgxN2R1YW05SDJ1Zi9j?=
 =?utf-8?B?Z2ZaeXhPOHFyWWozbnRnRll1T2lPVDRIOGRhTm8wbGFwbU54aFMxa3g1TXN2?=
 =?utf-8?B?N21XekVIamVhcWRwN2NhL0lkZCs2WWE5KytQZVMzQk43MDVLWXcrdE1OUGhv?=
 =?utf-8?B?Um9DbzFjbnZtS2poTkw1MnRMd1k2bjZ3bC83NndodGxpRkFDWHlWUWZMYmQy?=
 =?utf-8?B?N1RCdUQ0dG1PKy9LZzU1dGpzRFZiYzRJakgzSS9LQS80dmhUWjNvNXZzTGRZ?=
 =?utf-8?B?Uml0OEY5bGo3cmhZQk5vbkVOZEF6Ui9YUy9XZlN3Z2hvUnVsM2RMRThJcThj?=
 =?utf-8?B?WWlrOXBUckhRaEsyWlRkN3hyYzVXSkJiUlJESDcrZ3grZWdhSWlmbVBhWGpW?=
 =?utf-8?B?cTUwUzFGVzBTM3RHSWtnMmMwTzZ5OFZpVWphYWFlR0hweWhHZjhYZDZWUHQv?=
 =?utf-8?B?VWV0QzFZNDJGS2FRNlYyUnFUbmZBekIvT3RBWTFUMXBFSUlrc2pxR1NpQ3Nz?=
 =?utf-8?B?SWZKeVpjZEJpdVB4YWlzSVI3S2hzekFWRkhpQUUvN0ttSzNzbEIxS3Npdlp4?=
 =?utf-8?B?VFNyVERFQ1B6eHczVTk0VTRDaDdWMHZzb0hxd095UHJBdjBsOW55dGN5Z003?=
 =?utf-8?B?TWhxeVNWWG5TSXd5S3hudTB6QzJxTmpseTBodmprQkJEaktEcXlSbTBFYldU?=
 =?utf-8?B?YU9WR0tpMmloYjVKcTdpSFl0M004Z1VJTUcxZGJ2YVVwOWJUM3NhNzRGa0RD?=
 =?utf-8?B?MlFMVWtFYkpyYmEzemVxcWZ0aFVhRXFER3BVbWk0dGNrY2hPb09hK1RvY3dm?=
 =?utf-8?B?K1c1TWRvbE5qbVd3Znc2SXJuYmM3aEtDbDkyQjNXek1IMXZMSm1UT211L25X?=
 =?utf-8?B?YU9lazJoTi9weXZuS09pejhabUpIQ3UvaUYxRy9nRm1EbVNpOGc1cTVoM1Fp?=
 =?utf-8?B?bFRQUURBUFVrc0s4VFZCNzRIVDVpVkRUQUdSeW9GNUVONVEybzNzTlNvQ3dy?=
 =?utf-8?B?Qzg2MFVmamNFTGRSYmRlbTRrcG96T2thKytGNFVaVVJIbVpFZ1drZmRmL3Na?=
 =?utf-8?B?RGJhT0hhcHJKVlNJM2pWUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDA3WmtoYk9aK3YxK2dEM3Y4dTlLdE5OaSt6dVR4di8zOUR3MnE0VDh1VE5Y?=
 =?utf-8?B?TW1Qa0F4USt3ckJKSHdFY0pnT1RQMmtnTHFDK3VtSG5qNjJUNUh3WldQUzZy?=
 =?utf-8?B?NytOVFhkN1dTT1BTN1VKT3laWDdEVGd2RlgxUmdkb1llaUdjNXU5L05TVHdN?=
 =?utf-8?B?TGpiak91Z0VkS3dzNDN5SXUremNYSE5pZXNTYXZSN0ZlRlI1T2FnaW1qbjdm?=
 =?utf-8?B?WlAzbWpTc1pZTzE2TW9oNFBzVFhjenAyVG9SNTBTSFNYVERVZ2IvVUJra1Zy?=
 =?utf-8?B?Q2U0aGs3cVJBbThqQ01TRVBNMitHa0VlSC82U0NNWGp1YW1Mb0hsUGV3Y1I4?=
 =?utf-8?B?NWgyM3ZDRHlqbTBZd0JETmJmZjU2bkZmemFzODh0VW1rTlRnMFQzbk9QaStV?=
 =?utf-8?B?d1RnMVY5bU5odGROWm9SNk9oOHYyUTUrNVpPclp5SW42Q1lRTHVGWnhleCtN?=
 =?utf-8?B?RGw1dG1tUHAyek81MGRwRE95MDVITWoyQklRa2pCWTAxS3plcEpsU0lwZmhz?=
 =?utf-8?B?VEVtQXhGN2JPeUs2ZjdiNjFORm5vQW9ZbXM2eFNUdGkxUmdjSGpSZDloMkxS?=
 =?utf-8?B?Qk5VUVB3NGN0Y0kyRjZvWVhaYytZVXJ1Q2lYSVVnZTBoTVY4SjBaRWtLSmxF?=
 =?utf-8?B?cjZWc2FDbXBzWDQ4bVhmTjRicCtqekhDcnlEUXJJR0I0bjNLUVJmVkhwbXYy?=
 =?utf-8?B?bkRkUVNWVTNJUG9SK01VWjIzRUJadkR6SXlWT1ZjRmxPK09VNjJvMndrcjhv?=
 =?utf-8?B?U0k3QjV6Wm1BN0tkdjFMWTZITlhYMDdkT0Z1UnF1QW80YTIwYmhnNFB5SlRG?=
 =?utf-8?B?UmttU0N1cHBqOStOVGZWS2Z1NVBMbUtFanhpbTZMWTFCNEh5UXNpc1VEM1g2?=
 =?utf-8?B?Z0x3US9mS1dqZzZHVFFJcFlUTXJzK2NNeko1ZTFMQ2pLaHRPcEk0TEZFdGtv?=
 =?utf-8?B?RHlrRE1BbTJTdUxZbWVpWUU5Mm9QZW5LRERrajd1N21wN1ptYzF5V0ZNR1JZ?=
 =?utf-8?B?aHNXdUppWGdlazFsT0FYTkhCSkUwS2U4WldybGR0d3lzVzY1T3RVRUtOR0kr?=
 =?utf-8?B?d2tsQnFTbXVjRE9hV2RJbW1YV3VxMzcyV2Uya1VZSHl2TlJmaUZVbjBSdnd0?=
 =?utf-8?B?U29aMWpJR2tZL2N2Tnl0RWFmTDNBMFUyZ1BONWIyWUxyRHQwbU1YL3pKUk5a?=
 =?utf-8?B?Vm8zWW83UWxIU0VwdkdMdkJCLzhYbFhPMUk1V0RxNE11Ni9JbUJnZWcxdncr?=
 =?utf-8?B?eTdhYVIyMVROVGlvdW5YTlBYeXpOdWZWZnhqYXhpbE51WFpWR21LU2ZnRmZR?=
 =?utf-8?B?eEpLZHhOQnl4RTlXbVVtMzE1VS9jMDk0WG9IQ1ZZbVZXK2s3ZmkweVYrb2Jn?=
 =?utf-8?B?dDIzNWs3VVdaUm9PaVN4R2paYllBaU4vVTk0ODl4RDlOZ2ZZQzVDTGo5b0oy?=
 =?utf-8?B?dDZCWmw1QmQzcmR0K0RvT3poYm9meWtQWEgvMmlqTUp6MzdaVDNtRERlZnd5?=
 =?utf-8?B?Z3g3Y3d1dGNhQWlZOUJncml5WnVJb21KM1V6UW1MQW5NOXB0UnFTcm05UUo0?=
 =?utf-8?B?QjlhcDcrbDJSRXdoODI0MWUvT1lPajNMVWdtQ0FjbVJuaUNQeTBwYmFudllV?=
 =?utf-8?B?MCtmcVlqL0NiVktTeDZTK1pldHVBVkdXQnRsSXBRVUJSVGVpMStVQ1o5dEoz?=
 =?utf-8?B?THBqUHYrTzdJdU53SHhkZXRsb3dZWVpVRVlIZVlkL0l2SGtCZzhtOFphRHVR?=
 =?utf-8?B?SEdMaU9mbjhqMWU4cUR1NVgrNGowUjBEWExCSHJITlBLRStQdFVPSnNmNGNX?=
 =?utf-8?B?RkFIZnhlZ0FQMVJoUVJ4eFEwd3Rza25wTW5MT1lpL0hCM3VhY1F1YUI3YTJO?=
 =?utf-8?B?MHFaL3BwZDE4cmVwNHo5N04vMEI2anRYby9FZGxxNkFNRG5YVmJxM0txdTVB?=
 =?utf-8?B?VWVBUVdPcUpiUXVIL1FOdWFhZDNJRE9DVnJrSEY1ZGdBWWJtMDZTbTNka1pU?=
 =?utf-8?B?VnB4YUt5VGtZSmNQU1pkdi9CZmIrYWg1b2NwdTg1YythdmFWQWY5NTExdHRw?=
 =?utf-8?B?NGtvd1dzMllLU3owZXpCK0RpVXY1Q2dFZ0JwOGxCak14anBkZHJqSlBzVHEx?=
 =?utf-8?B?UC9ESlhteFpUOXVCNTc5bC9MRnVHbUVUWmd6SFBCYXh3L0dBRk12bzZMWTRi?=
 =?utf-8?Q?BYw5tXVaLD8LYgySV7Hop7s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6698d3-de00-4849-0add-08dd0e9c188c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 04:29:34.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUEyNgLNKi6igIfe3sIEQT42rPZfvJeccosYQVTad/FfVsGO4ZOP0Z2ESrlZPsz6MkRx7uy/w7OnyCeKaqv3n7bVmsDKwZ+M9NRFBEbtTdQVyR2gWMTmalmf/11jCd1V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
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

Hi Jeevan,

On 26-11-2024 22:00, Jeevan B wrote:
> Updated tests to pass drm_fd to igt_bigjoiner_possible.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_lpsp.c | 4 ++--
>   tests/kms_flip.c          | 4 ++--
>   tests/kms_setmode.c       | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 889da42de..74e9d799a 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
>   	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
>   		return false;
>   
> -	if (igt_bigjoiner_possible(mode, max_dotclock)) {
> +	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
Can we use is_joiner_mode here to skip ultra joiner outputs also?
>   		for_each_connector_mode(data->output) {
>   			mode = &data->output->config.connector->modes[j__];
>   
> -			if (igt_bigjoiner_possible(mode, max_dotclock))
> +			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
>   				continue;
>   
>   			igt_output_override_mode(data->output, mode);
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 88cd41083..3ad4d0afb 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   				 o->kconnector[i - 1]->connector_type_id);
>   
>   		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
> +		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
>   		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
>   		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
>   		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
> +				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
>   		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
>   
>   			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bc7b8fabb..d61cfeb9a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
>   			 *   - current & previous crtcs are consecutive
>   			 */
>   			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
> +			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
>   			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
>   			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>   			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
> +					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;

