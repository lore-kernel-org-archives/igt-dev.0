Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E917FC4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 16:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0A310F019;
	Wed,  1 May 2024 16:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6thHqAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694BC10F1A0
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714582672; x=1746118672;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6lScgwFm2kAlTW4f7UPOzwBy8OHf2oCOv7Wt+sc9BWI=;
 b=E6thHqAENjAsdMR3USjD5Y1hpfWb5vip7Dm8vQJ9uEqlDl1brDx51mvC
 hNSGpmsUIiGUx8MArKuXKjZEpAEKPkvbZXqISB0vdE6BoLWLbCbFWnu7w
 gHgiogqh34LtCX73CD0haMKIC4T8IFfK9vTM+jyTvAl+6i/si612wm3n9
 I8xi2pPoZSsWHHTv4uvJ3weWQgwDXVB3wdvsZzQgzM7dVDw5YXRJZ9YqI
 vK+P+Ky3k2bbTPCeqheN3lfYlJpw4qg508JpQSxzK9dRpP/YeoQEKRM+B
 s+mDuUJ23dgLlHUOO86k6Za7dkyeZW5l6KTJ8nsAvnY6wHv9Xj0vYY91S w==;
X-CSE-ConnectionGUID: 23c+rq2USt+B6BHXij1IIw==
X-CSE-MsgGUID: 7ewBOTwFSDewRnNpkLSzTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10198158"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10198158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 09:57:51 -0700
X-CSE-ConnectionGUID: yjVQSHcNR6e3QF/ZMD1Ptg==
X-CSE-MsgGUID: xnOlG5ZETgyWLEM77NkqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="27328023"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 09:57:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 09:57:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 09:57:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 09:57:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 09:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGjyyQn2GueOpby/wsUULAUp6V6urstYGNB4Ae32pSAOTE148i9HfqDhWS4NSAECQbzcA/bnuhueO82uSaz0H378TuFFdPO25L+fqZ9AiSvHbVKJjgY6hK/STmvWc1O2ikec4difvYnPrWJik+rNQy27ul3CjgMF3sAjFCai27ZGkciNuxNcI/J6WVKRAnm1tq7aYtRbYMgIJkFgXWW7Uvo7WeRpClR1F2Xl790GBW/gObdubMtqDsxEHgIIHs6gyubiQ3YbSlGSfcUcchT0Kp0x9+cpF/fwjve3jeuMYq0d1KG6xH/8GAAM0VNaLO2flip0I8yeHj94rbm/5WAApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYtG5IUDWF9P6Hv/51nxr7kOTVleygEQ8ZN/APgKLiA=;
 b=VX4lr2dP/qb+ZoXiyWrSSjveEW6ktrGQVFvovWNdGli35n06+BQ2/af+X7J/nP9L8XTLuW6g/LFuLnKtakDwOgJVlHRo1+JT/4z6s/2WV58AmjIQRuoj+xRte6Wq+IpXO+PhIBmCRZTDgNFmobamvpGK/Ds2boFFhbeLxRvguf1AfuKETG+bTs1hTr1tQcHxkdCffmHvWSCoGsR1B2YQ/ApgZTbmO1Ya+W/e5BSYKPqKtomFUXJ/n0K/wgePwvZ+cpehKVrGYxC8AvQe1Xl230LOyShKanr2eJj/hbIlRWa9ceqIcC/hsSfgTN8y0JVB3zq0MJQH2C3I3zvGPrBbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Wed, 1 May
 2024 16:57:48 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 16:57:48 +0000
Message-ID: <404cea92-793d-4d66-8d87-de7b495e9605@intel.com>
Date: Wed, 1 May 2024 09:57:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_vm: Update mmap hammer sections to
 prefetch next page
To: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240430221644.2370891-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240430221644.2370891-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: 600dfbab-32dd-4df2-6843-08dc69ffd468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnppYVpyM2NGeVpwMVpqVTEvdmpObDNwSkdjeG1pK3g5alRtOXpkL3ZNZlh3?=
 =?utf-8?B?OGx5cGp4azMzTFBXRFFkTUtPcnVCanJxVHhFU2NZaWwzMStsazdvVnFGRDJE?=
 =?utf-8?B?dUtnSXYxT2FZVktOUmVEUFJMRUxoSGk5NGtqbm9CZ3RyZzZNb2IrOXExK1lO?=
 =?utf-8?B?ZWN2NWRzYjRDVGtmOFcvMlVNd2VOM0ZqeVE4azdMclltNllqcHJCcXRzTGhD?=
 =?utf-8?B?dEh1bktaNGVxbkovUEF2RC9zYzRkOTF4MVA3ZjNyZ3NOMFJQb0FoT0lpN3pm?=
 =?utf-8?B?b1FlVXVRZVBYWW5FTmtwU1JXQy9qVDVONWNUdTFSWWd2M05OWHNqUEtRNjhn?=
 =?utf-8?B?N0JaZlBnNUlWd25BMFc0YitCaUx0NUhGNUFQRytjQ1ZSZ2lKMzlEcVE3ajV0?=
 =?utf-8?B?YUVvVWQzR25hVnlyeTZNSHJuQXdGTUlXZkRGK0tKQVJaVnhjOHVGeUhBWkVz?=
 =?utf-8?B?eS9BUmNNaVJSUWNNNGpRanhZaU0wKzViVWtTOFU3MHAzMmxUYVgyaWluRXJu?=
 =?utf-8?B?OTJabE9VOVU3WVVYRjNTcXFMQVI5a1EzdDFBS3QvbG43TEIraW15NjJ5d0U0?=
 =?utf-8?B?NEZ2amVtNklBR1I1Z0tISXo5blRzMllXaFhKNytYVW5mVEdhTFZLcldLQVFs?=
 =?utf-8?B?N2tDaVlFVjNIc0s4YlpaRkZpUXYzbFdBdkFqaHVpTnBUTlhrRmFlM0lHdUF0?=
 =?utf-8?B?L01jaHlnMkRNWWM0RXg0eWJGbGZhdmFweHpYa2ZrNjJwUFdLWG1hZHpyNmJZ?=
 =?utf-8?B?aThubzdIT3hYaUx0NTd4NFpFOWRacWFUNzBTN2dVQ0RLRXJORVpZOFdtcGJo?=
 =?utf-8?B?YjVJWFZLODJwQWFpd3IzbW1vaStUL09LTDd0RVNDZFk4TmRwd0EvbklYNHVQ?=
 =?utf-8?B?dGgvWXBxbW9OdWZlZWtxZGVZSzlhNGg2VzJPY280Z3poYnRMUEVua3J6cGRR?=
 =?utf-8?B?elp1MUxQVndQV1NiYUxMZWVYeXhraVo4NnYyT1g0dzEwemM0a0pwRGhqK0Iv?=
 =?utf-8?B?b1dsY3UxT2JQQ3Jzb3YyNi9uRXFiSjFIeGcwOGJTMzROY0E3SXVHdk1qVjVM?=
 =?utf-8?B?dG1naUpRaHlQdVpMaWFnYlBReGp0a3RvemtmZmd3M2RTVkVWbzZpakRGVHU4?=
 =?utf-8?B?NlBoN2ljeEY0L0RHM1Y1NE5XTHlRZkJoNjJrT0tJWmIwclFyb21MVmY1Rmti?=
 =?utf-8?B?MDc5djdKb3R6NVZETThWK1owK3JlMEJkaE5oZ2s3UTAvUnFjckttTmV3bmFS?=
 =?utf-8?B?YXRBUVd4Rmgzd1hNTDRyaTNLYkwxMXhOaS9PWFN4N0RNY2FDdXAwQmdkdTZ2?=
 =?utf-8?B?c1hVRFkxaUg0cmtJUklSa3p6STNpUHNzeEhsK0x1N1lHT1VqK0VNVmdFNC9v?=
 =?utf-8?B?VVJQbkJrUGhvWTlobkRMZzk4cTJoTDZZYndoTkg5RC9wMVlGc2l1OGZBOEhN?=
 =?utf-8?B?b3dJc3UrVktXUHhzZnhrNEQxc0EraldVOHJEUy9KOWg0cURuZDVUdlo4MmRz?=
 =?utf-8?B?R2tqVjJFMzZxTElqUjUwaW9FSGljeFRvNmZIQXphcm9BN1ZSRTd1aTRwYWc5?=
 =?utf-8?B?WHhzSWt2TlFkUnd4MlVxaFIrQm1WTEFLcUNYeWV6b0tPVW5GYjdnWGc0Q0Nj?=
 =?utf-8?B?d0dna2JRMGJteDZrdXBrczFSRFgwYm1ScGh4OWZsb21sQnJuZTFZV3ppV1Zl?=
 =?utf-8?B?U2h4ZFFuVUltbkpLVUQ1eDlKUEZwR0JrMjN3NkE5eXFTeUNOWmNSTmVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5jSE5IdVVHRUFjaS9uQXV4NkV2WDFZSG5TaXVUalVCTEUxaDEwWTlsT09w?=
 =?utf-8?B?VFF3emJTNnJYZ2VYQkFsdWJTYUpINnB1SmlDUkhjWEEweHg4Z1pSNXhVRW9u?=
 =?utf-8?B?WEZFcEFRdVhqMVptdGN1WE5zaUxqK25PMldxSHFFUG1lZ2kwU0J5MFN3WUxC?=
 =?utf-8?B?NlNsS0dGcXZJRWpTUEpCcjBralVhN1lnSVRZMVBhdjZ4dU1YdGV3OVdTK2hX?=
 =?utf-8?B?dEN1WmcxbXJCSE81dC9TbUpuNjJsamxGRXltMmY2NmJDc1A0VDM0aVVXdmNy?=
 =?utf-8?B?bUlxVlpFSVVsME5vNTU3Q1BDZFVmUWM0eVMzN3FVVlpTSGg5S3NWaVhsQ1l0?=
 =?utf-8?B?R0pRWHBqb3ZmNWpKV1lUQUh3bStlRys4cWlncXROZ0tiOHRqSW5aeEo4b1Bs?=
 =?utf-8?B?Zkw1ZWFoQlpPS0FMaStSRHFvWkNMRDhhNmZXU2ExaUs5Q2NKWG5RcDZjaHND?=
 =?utf-8?B?Z21GZ1IrUDdla3V3d3BKeWdjbXZNUWJnc0p4enVDL0Q3OW9Ba0toeXNmMzZz?=
 =?utf-8?B?K0NoSUZuZG5lS1VMK3JrSlJCTDlhZEpOYlRNSHBmclRFWHJiNnVEMHZJNXZE?=
 =?utf-8?B?b25xOWVDWGlPZEpLejJSWUM0V0k4ZXdSWlN2T3RzNCtqajduUlYza0pnU0Z0?=
 =?utf-8?B?SFZuQTNoM1BkYkJkUXlVN3ZJRnBtd3Bac2VCSDUvL1hUS3ZoVmpGd3BpTTdV?=
 =?utf-8?B?Znp1emFoSFpGV0ljaWN3TFdycllEVXNmcUVueEJWUE02K1RmZncxdHZ2R1A1?=
 =?utf-8?B?VUdjUFJiZTVYV1JWc3FTWmlYdllFSzdQeUFxVTVKOWsvdm9yM1pBejZyM05F?=
 =?utf-8?B?R0czaGt1bTRPLzBZU0hWdXJGUVE0QlkvTFh4V21SRnpnWUdFRzFDMi9zZDBJ?=
 =?utf-8?B?ekUvYXF1cE10YnBXN2E2TlgrY1gyMEFNa0pLcU5ITHQydHAxdCswTzNWSkhN?=
 =?utf-8?B?OHI4WUJQQXU4ZTB6MS9Fa2tXSk1ZVG5CWk9Sa2NRWk5QQnN6ZGloOHJTWTdL?=
 =?utf-8?B?ZjhYSXRGUE5kT0JlSTRkWDlnMjVKVEJaY2MwTE1abzZ6YytkditzVmtCU3Ny?=
 =?utf-8?B?dUVvVGVmR2J6QzNrYnlTbG5nOTJsckNkT3pVczVTNVFYRHZVZVpCYXZJZ0Iv?=
 =?utf-8?B?Ymd0NHNTOU9sMVJjMlRFYi84bGRKVzR6WGdTZk5iZ3U1Mmx1MHY0cFA0Qkx3?=
 =?utf-8?B?S0YySnYvb1Q5MUJrN3haTDNqMUdJZEFYTG5ncVRIZHpacXgwVzV0L1NEdHNu?=
 =?utf-8?B?QVJuUmRnZXJXMXJVcjI5ZjVheFN1NVZweDFRd3NJUHNKeDJiYmZHb2picUdw?=
 =?utf-8?B?KzJkQUFCVHIvZDhNUG5QWHovRHdXTnlkNERYSTRodE9XL2wzaHFJb1VSc3I2?=
 =?utf-8?B?K3RIdXV4cnNlc3JhK2tnNy9Gd2pYZ0VIWnhidlppaGErNVFGTTN6S3N2SWcv?=
 =?utf-8?B?aHpFNC9KMDIrSlZjZlNMck5HZ0p3UFd2dldDdE84cUhNTVpjZk5rbkczM21L?=
 =?utf-8?B?bjBXYUsrTGVsWGttank0SUduNWxiaXYzNHRlby9yOEhQMVQ0R1ZwazAzNUg2?=
 =?utf-8?B?dDNoOGpGVmszQlBwQ2JFUlpUS1pZU0I2eHkxMm9TQTBxcFFoUkFyOHFTSmg1?=
 =?utf-8?B?eWJRS1JpQlYraHA5ci9iSDhvT21EZy9ZMjhBV1Mzb0p0Tjd6S3pmM0Jwc2pV?=
 =?utf-8?B?SGoxQ0FuanI2cytVcnFuMjhmQUZwVy8yeDYyUjB0VkFGZis4ZlU3MFlxYzQz?=
 =?utf-8?B?dnpjTWwzeXVCeDB5TWRhSzk2NFVCb0lwZnhhTEZjUkNBRTJ5Q3E3amViMFVr?=
 =?utf-8?B?ZjEwL1lxQXkxc21oWXlxdExGSDRac2lVN1pzYm1YSXkweG9qMEhxZ1cwbWha?=
 =?utf-8?B?Tmo1V0YrWmVjenV0blJPd0ZYOEorL0pjakZiNmwxVUp0SkllNUpaKy9MN3pp?=
 =?utf-8?B?QVp0UjRpdmVabTNpaGxBRW5UbjlHbjVnTTQwZDM3OHNSWW15OWlqalJReDJr?=
 =?utf-8?B?QjhFSDFHQ3o4TVh2WDlUODJHczZac25aWVNTUGZUVDE5MFloaVhkdmZ4QkRX?=
 =?utf-8?B?MVdVOHExanhaN3VVdXhPb2tYMmdUdTJyNTJEQ0dWVHhFWXdMd3RBSVo4YkR0?=
 =?utf-8?B?V0o2U2xjUGVFeE9vb0x4NEo4d2hFRjN3Z3FuNDNkaHNGUjZ3NkcyUlR2QVNv?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 600dfbab-32dd-4df2-6843-08dc69ffd468
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 16:57:48.2447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEZBG5Yn7ExXLiTtEGpGdXmYGO8H21ZtkZLLIqhw1CMFF8Gp/S5qohgPSgRPanOGfEkRVhML/pWPK1coV8jYEkzrt9haT0U6+h5TCLvDFr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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


On 4/30/2024 3:16 PM, Matthew Brost wrote:
> Adjust mmap hammer sections to prefetch next page by moving BB to within
> PAGE_SIZE /8 of page boundary. This is prefetch next page on all
> platforms, even ones with a smaller prefetch size.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_vm.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index de2b1a8136..77cf1f7e67 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1623,10 +1623,11 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>   		t.fd = fd;
>   		t.vm = vm;
>   #define PAGE_SIZE	4096
> -		t.addr = addr + PAGE_SIZE / 2;
> +#define HAMMER_OFFSET	(PAGE_SIZE - (PAGE_SIZE / 32))
> +		t.addr = addr + HAMMER_OFFSET;
>   		t.eci = eci;
>   		t.exit = &exit;
> -		t.map = map0 + PAGE_SIZE / 2;
> +		t.map = map0 + HAMMER_OFFSET;
>   		t.barrier = &barrier;
>   		pthread_barrier_init(&barrier, NULL, 2);
>   		pthread_create(&t.thread, 0, hammer_thread, &t);
> @@ -1685,7 +1686,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>   		igt_assert_eq(data->data, 0xc0ffee);
>   	}
>   	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
> -		memset(map0, 0, PAGE_SIZE / 2);
> +		memset(map0, 0, HAMMER_OFFSET);
>   		memset(map0 + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
>   	} else {
>   		memset(map0, 0, bo_size);
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
