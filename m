Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3853EC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 15:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94FD10E4C4;
	Mon, 14 Jul 2025 15:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHwT4KqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BACC10E4C4
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752507162; x=1784043162;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=vazp5M+ocv+d7MI//INBSJRBW3bmbKF3PCJrSKWqKGM=;
 b=MHwT4KqZxqHtXgoGzm6tCiTykpC46gRvLOPJKZoBmN/AfOIZAfOMT2TP
 yO4P2dwnGfNuEpEjqT7f6RKFIeBLLPWpVGccneU36oq081N20CBeL0xqb
 rgwb/QdkuX5lMtlh6QSwjf/rVsvjkaVwa5QkHOQtXJTr4FcM29h97hX7K
 G+E8jykLxIUgRN46KLVtw2u4aVS2Ncf8f2yVtRukYk0HkQsb8KNPCu/pc
 uU62koDzP8knnP/NqhzepeMOv5W7yIRquuJ7lXXsiFm3deo6+mDFzvRlD
 AsOMQF2taNcFlwk3tJPMpHrmIsYf/TS3oboLXPOH9nJw0J8iZqMIqHvBE Q==;
X-CSE-ConnectionGUID: RkyuNJjiR/ajtu3JqmZqLw==
X-CSE-MsgGUID: 6BPE2V7XR96zX6Wk8eb4tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72151110"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208,217";a="72151110"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:32:27 -0700
X-CSE-ConnectionGUID: k0m2oXvjTQWl9FjuiEt1/g==
X-CSE-MsgGUID: 8MQQi+FbQ+mCjlAFgtqIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
 d="scan'208,217";a="156371165"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:32:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:32:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 08:32:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:32:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qI/xBCaXhoAvu0puedamnF/iCHkNtmjbGtw9+vZukix6VL+3V9kBCuUP5Z10/jqcxUBGQR4/Vhod/ieKEfUJ/OvXinpehtjf03XMc5HqwB1PqpSCB9Kfk6u9q7RPEF0s/Udj5gf6r3ufNExk0oJd/CmQtvRvi2e6qaJfLjagvjLte6m53/PVSxhdWYOknNh1/M6GMt/MPAEEb3jnpj/KOnV4NG04ZSOAjuKsRpGnqAXaIoyFakWKT7JnNjCJ6gQEs8mPa/QBAYx2w8XtuHI4a2uMy7mnKOyb0vsNVNTpJLUmBekvmKKuy+6QH9mcmc7lhPWhnXNArfBK8qiGXuwKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCr7QHvpJbYFSwsok6wXowSnzNNTbnbDO6zxA+FyKDU=;
 b=e1CPDkeR0F94nkQlCFZLA41rLKJp0UN0J2TIkbaIqff3pSQPLGKa53w1r+ssi5WULlhMbgnWWa+3g9uy0098aNoXbIQqb+M3A0AC+zdOloabwJTpzFJ91iCFBmnjW94jiSxwXgymS1jgRZoVF8N3+IGD5j9PpHw6hT89Kk3RaJKT8z1kj/ox5O597W3sctmxJEHQLyzZkd8q249dACZAJKP/Zp8dJobUtCgmwUmHgr2cvgp41uAQ+SYX6jIFWfJmjWG5n+RyhyL+0Sd5n/r0KVqAbUdha9osYKHcMMBL+zV6jOrUhKgIoPtmvwzS5A9tWX1DVbIF2hFs8V/Q89L0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:31:18 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 15:31:18 +0000
Content-Type: multipart/alternative;
 boundary="------------kNhSzDY6VGi2ZF6YgYJ7sSj5"
Message-ID: <410efb4d-124a-4c77-9f65-c8e9cf0befb2@intel.com>
Date: Mon, 14 Jul 2025 21:01:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_vrr: Pull Panel Replay check before
 setting up output
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250714145556.213318-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250714145556.213318-1-jeevan.b@intel.com>
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b0e665-36b5-4d0e-edee-08ddc2eb7a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1kxbmdCN1hMTXlGZmhzN3pqNkNVZTFjN1BvVVd3WGtXOHV5WVpsakwrbUVP?=
 =?utf-8?B?MTRPY3RWV2N1Y0tLMHlrb0NOTnNWMUV1VzZyUUNmb0wzNE9sSm9DRFVKRHM0?=
 =?utf-8?B?SGg4NTNPZGpkenJsMHFqeFozWWRPNVJadTRMUVJvWVVCQzVabjlwbmNTNzZq?=
 =?utf-8?B?T0ZIdGJhVFR3NmtBeHRYTVJkZXk2c3pKT3NMT3hBVEhxdEU2V0JHMDdSRUtl?=
 =?utf-8?B?a3g1K0haMzdOQ0U5Ym16b29vM05DdVlzTUZ0N2thRU9HYWNVcGRzbmJtS0ty?=
 =?utf-8?B?T2lMMmdaQzVjdXRPTGY2aFptTUtQQk9ZZDFJMFFyejNmMWZRS3hodUxra2dv?=
 =?utf-8?B?YlBSN2RqV3loWUZDNDh5dzVvUlNtVlF2Yy9PQ2tIY2x4UmFLdVpuTGNEcjBG?=
 =?utf-8?B?bWhwV0tHR0ZsT0tpNHgvMnlEUTkyNHJxNkxKSTVWSS9nMlBQK0paVUxFTUVE?=
 =?utf-8?B?akxkcjJnTThITnhyRkhnYktDODdiQThSWUhRUUErZHJhQ3dkOURxNm9aNGZs?=
 =?utf-8?B?WGhHK0lmRFNZR2phUDM1M2JZMElaNmpkNXZkczlrNVBOOFErbDZ0OVpYdlk2?=
 =?utf-8?B?TzZ1OWlHL2pyblR3dXN3MHFLRkFVblJkNHlxeC8wT3ZENkU4ZkhpRFNiS0l0?=
 =?utf-8?B?VVFONy9OUGg5a0Y5dXB5T3BMRnpaRHdiOHhJNGhMRnAyNXd2dDgxMGUxYyth?=
 =?utf-8?B?MzFlc1lDSG9NakxFYjFZZlROZ1d0Mm1ZTlVCZXc5STZSZW9paGpycXJ4TmQ1?=
 =?utf-8?B?TGVzckc3N2hWNU1CWldBbHdGMVhkbXRpNW52NWJyREFYZFNMZ3BWaDkyaFpT?=
 =?utf-8?B?Vmp3eS9SVWZnZEF6UWJJeDdLcWtjZDRyNEF6NUFtZm9pRnNMbExBK3BTOVg4?=
 =?utf-8?B?T1drUGFMZ0Y5M0NkY3pFL25Lc2w2WUc2Q1JGQ29ObnRlNFNkM0dxamxpR2M3?=
 =?utf-8?B?cEpsWDdtcEZCL3VZeFh3aUhOTngwZ3p3bVJwaVZtRzFJek9kb1dnZ1NIQW1a?=
 =?utf-8?B?VzJRSDNLekJyMmtvWWU3Z2VuV1FQQW9zR2pZZkZITUpXbG5ldlBRME9IeWlP?=
 =?utf-8?B?bktZZ1Z5WWtYZGdnV2wzTzNicXpHWmxVRmhJbjJuSDU5Q0pQSUMwRnQ3QWEz?=
 =?utf-8?B?MFZpaUVXdzRrTStDdlJXbFA2a1BTUUVZZDF3RHk4Q1dLZHlFM3J5djZ1YTRJ?=
 =?utf-8?B?UXo2eFl0dGxFMUFaWVluNEhybWZtY0laY1hiZTYwSDJ1WGdrSzZCdC9lZVpB?=
 =?utf-8?B?RnRENnN0ZEN6R2VhYWFmZ2FmQTVpNTVLVFJnUlY4eWVyZG5zTU53YzFaeDA0?=
 =?utf-8?B?R2pGZ2lkK3V6MlkzTlozaGJLMXo0MGo5WXJJYWd1V2ZWMFRUNElTV1N1TFE5?=
 =?utf-8?B?OXFaR3NHWE14S2NGRjBqZDJDMUd0cVFkYmNnODFZQ20wL0JJc3pOcmg5TzVY?=
 =?utf-8?B?Uk9ldVREc3ZrbSsyOUN3UjNMZ1VNd1RTMTF1OGRLTWlGN0FmMmNRKy94Q3VZ?=
 =?utf-8?B?TFJ5Q1NTUjR4d1pqUjZmSVpUb0FOV0dzL3FVTFVYUGJ0WXQ1cGo2RFRGdml6?=
 =?utf-8?B?OFFodlNLVnl6UmVwM3FnODlhay85dktwcmd4V2g2cnBybSsySUJkc3lreVow?=
 =?utf-8?B?RENtdGhpdzlpdUc1M21TZEg5K0RrRVBMbmFuRGZHNmd3SVF2cmZ6RmUxTmxV?=
 =?utf-8?B?L0RHQm83aUZwQmVNZndheHN5NDRVWCsrUngwU1RxalMwSm5TdExWWUdaRGlz?=
 =?utf-8?B?SlBDT0VLb29OQm16K3djQUk0SE9HRTVTOTY2Q2phdThvNTdwK3ZXUnhuUURn?=
 =?utf-8?B?MW85ZEpQMnhJdEV3NWx6YUpTTTZOVHBKeDZmajV3NnFvUEoyTFgzVFVaRk02?=
 =?utf-8?B?cndsanNQVC8vSzRXUC9YVlZhRGFoZ1NsZlh6cHU4OHUyQTFwUWxEODBBUkhz?=
 =?utf-8?Q?U1qXFE8y+BY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzJ0bGoxbE05QzY5eUZyRndRY3pxcHZvRWxxcVFPRHFUc3hOUng5Mm5SemxH?=
 =?utf-8?B?NEdDT2twL00zM01wc2NQT1VsZXdOSXhkY2J1OWZWN1Z6Qm52dU01d3VNWEdH?=
 =?utf-8?B?YWJOamp4S2FyeW5FZWFKeEt2RW5kZFI1VUdYclZKNGwxam9YRGpKTFdPeUJM?=
 =?utf-8?B?ZTFWd0JuNG0xbFFiTTVGKzlxTHg2WVBmSElreDVVWi9zTlJTald6SGh5c1dp?=
 =?utf-8?B?cmJMN3laT2lkbzh6SE1Wa3BuZU0zQkJXczlyR0tzNUZKb0daRC93aHBjT3hF?=
 =?utf-8?B?T1YwbmIrdG5BTUxLUVZBSDZOaFVwbW9UaVU5SjYwVTRQcHNCdXFscExYcS9i?=
 =?utf-8?B?OFFUWkdBVG9CeDZpRDRwR2kyOHFlRUJIYjBqb3RLOGJiR0pvZ0FCRytHa2pH?=
 =?utf-8?B?WXB3OG5qNHA5OG9IZFJEMFM3dGVPaXFHOE92VkFTTGdTMTc0M3p4dXdjd0or?=
 =?utf-8?B?c29wa21qbE5QRmNveGQwejkyUGpIc2htclNPdXNPUVBQczNsdkRHNnU1cTRS?=
 =?utf-8?B?NGZGZ3lCZlROL3lyQ2thSitxODd3UEJHSitHY0d0VGM0enhjanVLdnA0NTht?=
 =?utf-8?B?VEpFWjBlaGtOdTl4RG9wcFp6OG5CVVJwZFk1NmpncWkwNTZ1R0tuQi9aSS9C?=
 =?utf-8?B?R2dMTjVzeFhNZXJpTnZsZEV0OW0rajV6bU8zYTczVmZzZklPSjUyeE8yaHVw?=
 =?utf-8?B?ZUZFNmNoYmZ1YlRHeWxPaXZFMGcvN3kweHkvTHNGSjc1d3FYVUk3M1VjcDJX?=
 =?utf-8?B?a241R1RDSHZUaTRIVG1zeHNvdFZPbU9mbTdnenY1UStPaWNIemh5K04zUzhw?=
 =?utf-8?B?U01lOFRiWmpiZElOUm5tbXJFNFVZemIwNXlSd3NPaFpUVzNuWG9DY2s3bWE2?=
 =?utf-8?B?bFB6RVlWZUE4bkJCNlZRb0V3VGhqNkp2am5hYThiQkxuRkNWVndnRHk5cEtI?=
 =?utf-8?B?bmlOYUFzM0pqWXhOYU8rVmsxdzRqUlQwWjlicDdWaXRZb1puNE83VTNpdFVU?=
 =?utf-8?B?WlhZaUxlVVMydVZHUFp1S1NNTEhrOGtqYlZ3ckhnOHpQdFNoQXpxcjdaZ2dy?=
 =?utf-8?B?bDJ1TnRkYkNrVVlBZXJEaStxMEwwUVU3cVluYzhES29PKzgvZTA1VW5SL0ZP?=
 =?utf-8?B?cDRIM0Z5cTlRTDJXci80Z2xIM3U0dnVkQVUwZkpaM1diRXMvOUtLNGFMWFZH?=
 =?utf-8?B?dXc2YjNYMGFDVnFSZTlneHpxT0l4QVZSdmtTS05xM2duTDU5UnAzQlBwMFRZ?=
 =?utf-8?B?RjVTWE9xcVZOSDVySHVQRnBGY1Y5S0EyTTNNK200Mjh6R3VVdFA2NVJ2bzg2?=
 =?utf-8?B?OTZXZG5QbHpMOHdaNSsyRDg5eGRzTEwzdjVSOVl5UlEwNjR2MGduRjU1NlU3?=
 =?utf-8?B?MkhtaGxZNkxOYjVpMzM2V3o5VHFxVTZzN3NsRVlQVElaRkF0d21ieTV6ZU9N?=
 =?utf-8?B?aHJOWWpkUm15S0xPVW5mOXcvWXN4VDA4MTFRT3ZLN3ZpcUZPMTZOeDhEbjha?=
 =?utf-8?B?Wi9aYUsyblRETktzNlppTDZieFphTDRYblQwS0g3NzJFd0NSempyU2RtZzBu?=
 =?utf-8?B?aSs3VVpXL0FMSnIzd2hRTUErVHIyZG5jdGcrb1htY29jMW1pNTFlYmc3cG4x?=
 =?utf-8?B?TWpaSk11UEs2MEthcjdPQnBzdE1iU1Bzd2lzdEd5Y3U0NWtmd3pwZG0wMVlF?=
 =?utf-8?B?OTRaSUZhMjlQTEQzc3B5cGp4dG5IdmI5bXBnREdrd2xONTM0Q2hicmlsency?=
 =?utf-8?B?aFUwaFRKVkJPTGtZU0h1V0ZWK2JVSTdYeFlhRTcwd2ZCc2dQNGNQRjNqbjha?=
 =?utf-8?B?WTFrSERyeXEvRldFUkwxODBJWENaSG42dEhhRi9pWHV3VGVINDd0c3RuQjBC?=
 =?utf-8?B?dXB5czRXWUlqdEtZZm90NEZrczhNYTJKTm1tVzBrSTYyZkNpVHNXU1lkWVNh?=
 =?utf-8?B?VkNrTlhOT0RyNlhhWmJmSFJ0WENqY3dRWitvVENpck1pNkNnc3AvZXVLL0FC?=
 =?utf-8?B?NlJTaDFZSUhGL09TcE1TYk1kRW9MWTI5YnlJamhSd2M5Q2lkMTVnQzUvUkRR?=
 =?utf-8?B?MC84ME1RYkVUN0xjQVdWWnBrU0NvaHkvK2J0QndjZmxQdE5DVWQrZGh0UUxC?=
 =?utf-8?B?dzE0TDZYUnJlSVkvaEFuWFltclZIV1Rnb0hHOVVqaGRBaFBsZ1VQb0RPMHN6?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b0e665-36b5-4d0e-edee-08ddc2eb7a03
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:31:17.9919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrzEGkKMEX1V+/uIXZPg6YEXXWw5tKzKriSiPnjZTIz4qT8/PKLdceC9z7konpInJusmb+egvLwqLhCjWWvhAlE9KxIaF1hDVp56b58yWXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
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

--------------kNhSzDY6VGi2ZF6YgYJ7sSj5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jee

On 7/14/2025 8:25 PM, Jeevan B wrote:
> Adding the Panel Replay support check later in the test was causing
> an invalid skip, since the test disables PSR/PR in output_constraint().
> Move the check earlier to ensure correct capability detection and avoid
> unintended skips.
>
> v2: Refactor TEST_LINK_OFF logic to avoid duplicate conditions.
>
> Fixes: 7da0c57182cc ("tests/kms_vrr: Skip LOBF test if PR is not supported on sink")
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 9c2c4ac92..233143770 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -961,6 +961,12 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	}
>   
>   	if (flags & TEST_LINK_OFF) {
> +		if (!psr_sink_support(data->drm_fd,
> +				      data->debugfs_fd, PR_MODE, NULL)) {
> +			igt_info("LOBF not supported\n");
> +			return false;
> +		}
> +

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
>   		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
>   			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> @@ -1051,11 +1057,6 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
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
--------------kNhSzDY6VGi2ZF6YgYJ7sSj5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jee</p>
    <div class="moz-cite-prefix">On 7/14/2025 8:25 PM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250714145556.213318-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Adding the Panel Replay support check later in the test was causing
an invalid skip, since the test disables PSR/PR in output_constraint().
Move the check earlier to ensure correct capability detection and avoid
unintended skips.

v2: Refactor TEST_LINK_OFF logic to avoid duplicate conditions.

Fixes: 7da0c57182cc (&quot;tests/kms_vrr: Skip LOBF test if PR is not supported on sink&quot;)
Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_vrr.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9c2c4ac92..233143770 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -961,6 +961,12 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if (flags &amp; TEST_LINK_OFF) {
+		if (!psr_sink_support(data-&gt;drm_fd,
+				      data-&gt;debugfs_fd, PR_MODE, NULL)) {
+			igt_info(&quot;LOBF not supported\n&quot;);
+			return false;
+		}
+</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by:
        Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span>
    </p>
    <blockquote type="cite" cite="mid:20250714145556.213318-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		if (psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PR_MODE, NULL))
 			psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd, NULL);
@@ -1051,11 +1057,6 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
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

--------------kNhSzDY6VGi2ZF6YgYJ7sSj5--
