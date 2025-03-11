Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E36C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 13:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE15210E1FD;
	Tue, 11 Mar 2025 13:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMWhyZSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D958E10E1E1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701265; x=1773237265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VkMFSAf0z4LKmf5FSj3/PCEg2VbBjo8kZvzvlQR/3uU=;
 b=bMWhyZSUMZ/wxFTCvYD8wBQ2M2Kie3j7PEVLPxl1ROQhHgWmCCbBrcAS
 ENArTW1xAh7IVYMrbTADf2ziaAHA/BDdB3XDbML8/zPWuDML4fBx9xCpy
 mkdLvOUJ/1uQl1PTLHn5aRfAdzZu5IZD9P0zomlR3QypEXnm4NgD5oXsz
 fkOL8rsSRMvxL8gOq6gXSY63BWoV6kqEG7F269IJaIWM5RlBxbaeX+3xX
 fxXMkfphdH0DgtnZle0SLUCvvIwnP+suLuZMJUHH8VGN3AeDjx59xS6sr
 O290ZGfi6RNSYrjfsCStWlE/NcxB2ueA55inERvprCHq7YlPdNsI0k/js Q==;
X-CSE-ConnectionGUID: 0TmRhVwDRc+X2e21VIpprg==
X-CSE-MsgGUID: o3EGTOgQQEu2Bt7WEy+S0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54121809"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54121809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:54:25 -0700
X-CSE-ConnectionGUID: Pz6/qhQlTByjOMFLvU8+nw==
X-CSE-MsgGUID: mcdWZJjCTmigxDYUW+58gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120555655"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 06:54:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 06:54:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 06:54:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 06:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok3pkKikksNL6i/VCP/KMu5VM6SAc1lXcX+R+7/nk8oqUTvuVgxRr7izJUGbEqMN4Thja1AteZzs0QXABrXIXu2r3dIvyeC3PNlTkD81o/GgHWQrVOy9X1IU3EOg98UF3s4oRDpdBF7rNuqkeFLCyOqLUUR4YsUq+i2xeUK0SFh3k8quEFyBoPY0tMbiMTXaYws9+d2L++AQlF1mvM3AQQSXBf+TXdCHC8wVDr4RaS3AlEU+coSNCSsXls1+GDZRMIfAJSiJupKZ2lIvtLrv60drU5/CihIaBsU+rtUA0xn5M/4hAeJrlUmIdPQp+a5gubAH1UiHmmm+WUfre1w/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkMFSAf0z4LKmf5FSj3/PCEg2VbBjo8kZvzvlQR/3uU=;
 b=Dkcya9wuaaPEMI8SG3qwaI+XsaOd72jYFVGNO40GZ/VMrS63OtR1AseQFu1kd9jzIKcxRg5nzBrsMOyDLoWRDi9jrS/Tm0+he060a/rfcGdOG7WPwh94sbi/1UQGczr0TrVwAJijbG/ZCmQ4epp+xxEx2BUdIE0EjSWeBULLIxhcZrQl7eimM/UTMykxm4YgcKKJaQUvgYqf+RymtesCYxkmx2unOIJWKaQRYwT8e20gTFciEQLaoJrVQaLW6hrCOrc+jWZ1RPrQ1H2mn+de0JrCLA/gXsIjWSRo1suqmSdD+Dyqp6E8iEkZOyh4+r26D5ao3gUHYopqNUQSvLrqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:54:21 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 13:54:20 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Sokolowski, Jan"
 <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/xe_eudebug_online: Add
 set-breakpoint-sigint-debugger test
Thread-Topic: [PATCH i-g-t 3/3] tests/xe_eudebug_online: Add
 set-breakpoint-sigint-debugger test
Thread-Index: AQHbhr05tK9yjcJPqkiIw6WTn0p1orNsYPcAgAGqfuA=
Date: Tue, 11 Mar 2025 13:54:20 +0000
Message-ID: <DS0PR11MB72645261BB30625DA94AC880D9D12@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
 <20250224130807.9249-4-dominik.karol.piatkowski@intel.com>
 <b9da5d35-1845-4879-9046-31638db1ee91@intel.com>
In-Reply-To: <b9da5d35-1845-4879-9046-31638db1ee91@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB6395:EE_
x-ms-office365-filtering-correlation-id: b649658b-b368-4939-603a-08dd60a43949
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UWh4ZGlwZ21XTko0WDIyaXlvWTF2Um44UWNwd3F0Z3JXVndnaWRIZTlUeDhB?=
 =?utf-8?B?YVIxaWVBVmdnTWdPM0hOUXBPdUptMW1ub1poS0l6NEI1VURYamxmd0NmajFM?=
 =?utf-8?B?YXdFZjlUczNKL1dSbWlrSk1OOEdhY0x0YkY2YVl3WjVkbFBYYTFFYUU3eUQw?=
 =?utf-8?B?RlovbmUvSVRLRDkvTTJUWnZnS082MTRvcWRndm53U0VwTlhkclBhaUFVamcr?=
 =?utf-8?B?SUVqa3I3V2lVNDNFYTR6RWJ1ZjVzK2NuRUhiNkVSYzdFSjgyL3YrcEdyc0RF?=
 =?utf-8?B?aHVVN1ZKd1dSOHlrdnJYZUJyQ1JGRkxGOVEzWWF5UTYrbDNYQTNCTDQxMHNB?=
 =?utf-8?B?Yno0RkdVbjFjS0RMWWxTMi9waUR5Mk9VRnNRMXNJWWFyZ2tuaXdubVAxcFIy?=
 =?utf-8?B?NXh5NTJLQ2RTNTRQWk80b01ud0gxT3AvQkpCY3R6WTEwN2gxTGpQRW4xMXVQ?=
 =?utf-8?B?b3lXVlFjOVF5NjlDSTNUd01aK2tXSXo2eXh0QWx5M242ZVpmY1E2bHp4b2V5?=
 =?utf-8?B?K1EybDFaRXhJSzJvdW5MTHVWMFBYWGtJZUZOWlU5Q3FncTE4SVk0WEJhU3ZJ?=
 =?utf-8?B?MklJQy9KVm8yaXp1NEswT3ZPMVpna2g2QkFUTWZFLy81VmdpczFMSWxBaktn?=
 =?utf-8?B?VjI0RFhaek16UTNOY3pkNVl5SzBPc0doRDZ5MjFJOUdKUm52bDJWNlAwQXd6?=
 =?utf-8?B?ZWlyRE9vT2YwM2ZNWDNMRXNKeUp6RGpaajk5UnZzMG5vanNCTzZFWG9HYTNy?=
 =?utf-8?B?d1F4VmJLRkJyRmUwbFltWlV1Y3Qya05JWWw2NVh1VFRxeUR1bmZCMDBSMk00?=
 =?utf-8?B?KzlLUmw0MFRLdDU3WkV3elhGQk96T0VIWm8xdUk0V2Y5QnlrZlR5TitMVVNn?=
 =?utf-8?B?QXJ6Y3AyekVJekFJekMyWGhhbW5KSTZNZGRwVW9XS3JBdUJuY25RK2ppUEV0?=
 =?utf-8?B?azhsNWMrRVh4RWE2NVRYdGhGWmM2QWpxZkxPalBjK3VwOFdEdkJXdnl5amsy?=
 =?utf-8?B?c1Q5UWJKbU4rWFVPYnA0TUZWZE5pNlZDTVlYWWxQK01rY2RtRWJsb1pWblBY?=
 =?utf-8?B?Y0pDZExhTnNUZGkwNDBxRmpGNFBjK0pzVmZmdllKSmRyaVE2TUpFckVXeWVC?=
 =?utf-8?B?SU9SNnlZdHZ2SS9rNlBqbm12ZXZBRmlBdzdYM1RubVpobEg1c09kSWxDWUNp?=
 =?utf-8?B?M0J0OVA4QjM5MXZrRjJRdEt0SmtDT0puT3drSnVCN05peWx0alo2L0ZyalNL?=
 =?utf-8?B?WHVsRG9jaitXbkpxTHNNQjFyQmpiWkdHNFY4UEd4OGsrSGcycXdsVS9mOFUx?=
 =?utf-8?B?cjJTQnpHdHB3T1lwTS9sSTRKU1N6Y2lIRXR5aXlTMjR4UFpvN1hudFM1RC9N?=
 =?utf-8?B?bjRGTHBvbk55VXhtbGFYa21qUjNRekYxZ1ZJb1NWUEcrZEQ1dFc0MnJmcUdB?=
 =?utf-8?B?cTZETjFQS1hRQm1BOUJVRUFsc21xSnFmVnplZUFqZzRwaitlZmtQUjVRMENL?=
 =?utf-8?B?RDNIcXV0ZEdtM0xiRXpLL1Y0NmxMS004cWVvcWs0OGFlWmtqb2VTbis1bTJW?=
 =?utf-8?B?SDN2cUt5R2hXUUJkbWcvb1B2bW1UWS9rSDlkK01iZVBqMThUK0RIWmh1R2Zv?=
 =?utf-8?B?UmZwVWlUNGRNdm12SnpReTZVak9UYnoyUmgxVDNITGpLQm9DQTMyMjhkanRr?=
 =?utf-8?B?MVFaZ2I5U0N2YmhhdHNwbWx4MFNNYWVhQXNJRGFlRCtKT2RMOW5jTXhadzlX?=
 =?utf-8?B?dW1aazRXUktSN3M0d21JMWFWWUtGemw1K1hWRTlwcVVKaXFrbTFTeWVhU3Jl?=
 =?utf-8?B?UE4rTnVTdXBqSXVBREdHOWJWYmgvODVVa01TUFd6akR1WG5BWGt1dXdNVjF2?=
 =?utf-8?B?WEJxQWhjNHJuOW95UXhETHFMNFlla1lEVjVXNnpCQkU4VkNqcUEvaGk2ai9p?=
 =?utf-8?Q?z5YgZqegGtbYy5M0clsKRAVSvRhDGI7A?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjJuT3BKTTNXb1lNQTh0UjZVcG43c3E3USt5R1NySXFpQUtTNDg1c3hicCs3?=
 =?utf-8?B?bVpRcm0wejhEN0hOQUNzRFFIS2drQ1FIenAzVFVnRndyU2pqY3E3SGtHV09t?=
 =?utf-8?B?akRkY1NIOVp0Tk9ORGQ4K3I5M01DbDA5Rkw1RFlsdlBzRUtvMDhLQjBkZlFI?=
 =?utf-8?B?ZHJvalp4OVNYWkcrQ0FGVG5McGRzeElhZTlmaGZ3M0JJSGNsNitzZVFWNFhk?=
 =?utf-8?B?UzR1L2liWGh5Q2ZVYkJ3ZTRoaU5BbnpaN0pGMG92L005SU1vWjFGZEg3bUxD?=
 =?utf-8?B?YXdodFJnZklCaitUNVZiL1pmajVkNkVQdGh6SEVLN1F5cG1QSWxJZmxqRE9K?=
 =?utf-8?B?dGRqUlhrWTRKV0RHNVBtQ0lTR2lSbkxYTGFPQUdmMjV4RWZ5SnI5LzVjakJK?=
 =?utf-8?B?VnFXQlYyNWdMRGYwWUkrd2pPUkxkMDRjdW90dENITFlSb3RWUnhOYVY3TWx2?=
 =?utf-8?B?TCtCTmZpZ1VyNlVrZDVWeEFFL1dFck1QY0R2dDUzUkxUQXhSV1QycFhXbmFY?=
 =?utf-8?B?M3JXZEwva0NTc1lKRi9wL2xKOHAxSStML3hVclpKTG95WGFQdnRnSHJpdnNO?=
 =?utf-8?B?OHh4ZHdwRUlIYUVyMnExOFFBZFBaVEUwM0tWMVRQNVRhQWcyVmM4QktDZUFh?=
 =?utf-8?B?Z1FtaTJpZ0FHYWZOSVJUOHFOdDRBWFVuZm1CdXkzelVoNHFzMW16VXh3ZGpB?=
 =?utf-8?B?QjZWeWorb2RZK3JiT1pwVGRoZ0oyNGlpckVTbzdya1lYcXJqYWR0ajdrZWh3?=
 =?utf-8?B?WDJjZHY5blhadThTeng4N3lXK3FxQUIweFpMOGtOWUI0Q1ZpUzYwU1QyTmpk?=
 =?utf-8?B?NnJ6MldJZWJ0VlYwa3M2SDlrOUVLOHFaejI0SW8rS2tKZkFHRlJ3aW5ETG5F?=
 =?utf-8?B?Y3BnTVpmdFd5WXZFeHI5anhvUVIyQzIwQWRnazEzbDZON3oxcE5MTnRZNkhI?=
 =?utf-8?B?eC90RjFoTkJja2NGcFQ0WDlCUFV5eFNNbXZIblZMZjRhamI1cDBxOXF5QlRD?=
 =?utf-8?B?Sk1odVdaODdHMHBtUDZpaWVwdG1pLzd4Ymh1M3h2Vm1uMnBycldJWDdnOTl1?=
 =?utf-8?B?UFBFeWtIczVVbW9HU3BWcWx1VTcveUtPS1BkcFVwbFR3SThDMCtzNDVkTGhP?=
 =?utf-8?B?d0FWTGxvYjFyNkF6N1JqeElWOG1PbWlEcWdjS1lhU1JOUlFlWGhoR1h6bzZY?=
 =?utf-8?B?QWx0eDRDWWZTc29kMG5KU3BUWWo5WXJEamRLMzhDTWJma08yZXJEdllmelcr?=
 =?utf-8?B?Z2lDN0pTaERJM1VwcVpPSjNTOTVwNENtMVhmVzlhV1RmQnJacGJudWk1aTc4?=
 =?utf-8?B?b3JkbkdvQnhtdHI1dWxtOElSenFuK0x4b3JISStEbGVDNHFFeTVVVzYvS3NC?=
 =?utf-8?B?NjdhQm8yVHF4WS90dTltbWpoSzNRUW9qeWlsYjYyNHoyKzd2eVpTUmlGa294?=
 =?utf-8?B?Mi8xRHQ0am1LRnZCdVlZUUx1bnR0VndyYUNwdkc0MmRkdWJiTng2c29HbFRz?=
 =?utf-8?B?MmhWOXIxU0tuTHdnL21HeTIyeWFJaXQ0amRtRm9BN0kvV0IrVk42WkE1SSta?=
 =?utf-8?B?amNrbWlIcW1CcmRtem85akFwV0h3WDdYcTRZRVMvSm1wemU0QVBxTm1MaTFM?=
 =?utf-8?B?cVlpc2t1bWVDS0ZPMDBUR1lHMEtRS0s2OXVScVpMRi9BSlZHbEZqWWhSTVBO?=
 =?utf-8?B?eFZ2cXBLeEhWWTlRMWRuY3ZlZk5DTTVCNXU2OUkxNDZQYStsNGdNdGFJam9L?=
 =?utf-8?B?TjgvZHFKOEd2Z0c4TEpVL2VVeE15MnllNC9kOFhxc1hvNnFEUjF4ZVVwVDZX?=
 =?utf-8?B?SXFaWG15eWZLZXM3cVpiZHZQODR6dm9EL0JCbVFjWTd6b2tia2xKczlKQVFI?=
 =?utf-8?B?cDFLenIxRFlPNHBIczBna1o2R2UxV0VESmVGdVIvcmgyM2ZOVVMrTm9oOGx1?=
 =?utf-8?B?YlFlZXNWWC9id0czbVJadHNJVUVZQURVOU5IcmdLVDAzNUZEaWJENW9jWDFL?=
 =?utf-8?B?eExYYkd3Wkw4ZU5Td3V4N2tGbVVDcjcvTk56MFE1L1JGNG9IT1hLUTlaSUdv?=
 =?utf-8?B?aWRrYUNIZ2Q0MEphTHJTeWZTdktEcXo4V1RXaHBvY203aHpaY2phZzBiOEh6?=
 =?utf-8?B?dldTZmN6VzRJQmJSV1R4bXltSVpNODQ3aWpKcGdsbXRmZmR6SzZYbGRPcXU0?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b649658b-b368-4939-603a-08dd60a43949
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 13:54:20.8380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4keeBjh2n3e6iUEGh156criaFQdhKspHahQtioYAGeB10ODE4V51xotVUGrWzPE1NBc7VDORFF9kqjJB2gqanWvsCRBHqbd/hf4LRsXciVtGtX0UUQTFmmUYmd8YUKxY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
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

SGkgQ2hyaXN0b3BoLA0KDQpUZXN0IHNjZW5hcmlvIGNhbWUgZnJvbSB0aGUgY2hhdCB3aXRoIE1p
a2EuIFRoZSBpZGVhIHdhcyB0byBoYXZlIGNvbXBsZXggZW5vdWdoIHRlc3QgY2FzZSAoc2V0LWJy
ZWFrcG9pbnQpIGFuZCBqdXN0IG51a2UgdGhlIGRlYnVnZ2VyIHdpdGggY3RybC1jIGluIHJhbmRv
bSBzcG90LCBob3BpbmcgdG8gaGl0IGludGVyZXN0aW5nIHBhcnRzIGV2ZW50dWFsbHkuDQoNCkkn
bGwgc2VuZCBhIHYyIHNvb24gd2l0aCBNaWthIGluIENDLg0KDQpUaGFua3MsDQpEb21pbmlrIEth
cm9sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFuc3pld3NraSwg
Q2hyaXN0b3BoIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgTWFyY2ggMTAsIDIwMjUgMToyMyBQTQ0KPiBUbzogUGlhdGtvd3NraSwgRG9taW5payBLYXJv
bCA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR3J6ZWdvcnplaywgRG9taW5payA8ZG9taW5pay5ncnpl
Z29yemVrQGludGVsLmNvbT47IFNva29sb3dza2ksIEphbg0KPiA8amFuLnNva29sb3dza2lAaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IDMvM10gdGVzdHMveGVfZXVkZWJ1
Z19vbmxpbmU6IEFkZCBzZXQtYnJlYWtwb2ludC0NCj4gc2lnaW50LWRlYnVnZ2VyIHRlc3QNCj4g
DQo+IEhpIERvbWluaWssDQo+IA0KPiBPbiAyNC4wMi4yMDI1IDE0OjA4LCBEb21pbmlrIEthcm9s
IFBpxIV0a293c2tpIHdyb3RlOg0KPiA+IEFkZCBhIHRlc3QgdGhhdCBzZW5kcyBTSUdJTlQgdG8g
dGhlIGRlYnVnZ2VyIHRocmVhZCB3aXRoIHJhbmRvbSB0aW1pbmcNCj4gPiBhbmQgY2hlY2tzIGlm
IG5vdGhpbmcgYnJlYWtzLCBleGVyY2lzaW5nIHRoZSBzY2VuYXJpbyBtdWx0aXBsZSB0aW1lcy4N
Cj4gDQo+IEkgaGF2ZSB0byBhZG1pdCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgd2hhdCB0aGlz
IHRlc3QgaXMgc3VwcG9zZWQgdG8NCj4gdGVzdC4gVGhlIHdvcmtlciBsb29wIHlvdSBhcmUgaW50
ZXJydXB0aW5nIHBvbGxzIGZvciBuZXcgZXZlbnRzIGFuZA0KPiByZWFkcyB0aGVtIHZpYSBhIGlv
Y3RsLiBUcnlpbmcgdG8gdW5kZXJzdGFuZCB3aGF0IHRoaXMgdGVzdCBjb3VsZCB0ZXN0IEkNCj4g
dGhpbmsgSSBmb3VuZCBhIGNvcm5lciBjYXNlIG9mIG91ciByZWFkX2V2ZW50IGlvY3RsLiBXZSBj
YW4gZW5kIHVwIHdpdGgNCj4gYSByZXNvdXJjZSBsZWFrIGFuZCBtaXNzaW5nIGV2ZW50IHdoZW4g
dGhlIGludGVycnVwdCB3b3VsZCBoYXBwZW4gZHVyaW5nDQo+IGNvcHlfdG9fdXNlciAoYWZ0ZXIg
dGhlIGV2ZW50IGdvdCBwdWxsZWQgZnJvbSB0aGUgZmlmbywgYW5kIGJlZm9yZSBpdA0KPiBnb3Qg
ZnJlZWQpIGJ1dCBiZXNpZGVzIHRoZSBwb3NzaWJpbGl0eSB0aGF0IHRoaXMgY2FzZSB3b3VsZCBi
ZSB0cmlnZ2VyZWQNCj4gaXQgd291bGQgc3RpbGwgZ28gdW5ub3RpY2VkIGJ5IHRoaXMgdGVzdC4N
Cj4gDQo+IEl0IGZlZWxzIHRvIG1lIGxpa2UgaXQgaXMgbW9yZSBhIHRlc3QgZm9yIG91ciBJR1Qg
bGliIGFuZCBzZXNzaW9uDQo+IGhhbmRsaW5nIHRoYW4gYWN0dWFsIFhlIGV1ZGVidWcgZnVuY3Rp
b25hbGl0eS4gQnV0IEkgbWF5IGJlIG1pc3NpbmcNCj4gc29tZXRoaW5nIGhlcmUgYW5kIHBlcmhh
cHMgYSBtb3JlIHZlcmJvc2UgZXhwbGFuYXRpb24gb2YgdGhlIGludGVudGlvbg0KPiBvZiB0aGlz
IHRlc3Qgd291bGQgcHJvdmUgbWUgd3JvbmcuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RvcGgN
Cj4gDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3Nr
aQ0KPiA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IHRlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMgfCA3NQ0KPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0K
PiBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gPiBpbmRleCA0NzIwMTNmZTEu
LjhhOTdjODA2NiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGlu
ZS5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiA+IEBAIC0x
NTA2LDYgKzE1MDYsNzcgQEAgc3RhdGljIHZvaWQgdGVzdF9zZXRfYnJlYWtwb2ludF9vbmxpbmUo
aW50IGZkLA0KPiBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW4NCj4gPiAgIAlvbmxp
bmVfZGVidWdfZGF0YV9kZXN0cm95KGRhdGEpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gKy8qKg0KPiA+
ICsgKiBTVUJURVNUOiBzZXQtYnJlYWtwb2ludC1zaWdpbnQtZGVidWdnZXINCj4gPiArICogRGVz
Y3JpcHRpb246DQo+ID4gKyAqCUEgdmFyaWFudCBvZiBzZXQtYnJlYWtwb2ludCB0aGF0IHNlbmRz
IFNJR0lOVCB0byB0aGUgZGVidWdnZXIgdGhyZWFkDQo+IHdpdGggcmFuZG9tIHRpbWluZw0KPiA+
ICsgKglhbmQgY2hlY2tzIGlmIG5vdGhpbmcgYnJlYWtzLCBleGVyY2lzaW5nIHRoZSBzY2VuYXJp
byBtdWx0aXBsZSB0aW1lcy4NCj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkIHRlc3Rfc2V0X2Jy
ZWFrcG9pbnRfb25saW5lX3NpZ2ludF9kZWJ1Z2dlcihpbnQgZmQsDQo+ID4gKwkJCQkJCSAgICAg
ICBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlLA0KPiA+ICsJCQkJ
CQkgICAgICAgaW50IGZsYWdzKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgeGVfZXVkZWJ1Z19zZXNz
aW9uICpzOw0KPiA+ICsJc3RydWN0IG9ubGluZV9kZWJ1Z19kYXRhICpkYXRhOw0KPiA+ICsJc3Ry
dWN0IHRpbWVzcGVjIHRzID0geyB9Ow0KPiA+ICsJaW50IGxvb3BfY291bnQgPSAwOw0KPiA+ICsJ
dWludDY0X3Qgc2xlZXBfdGltZTsNCj4gPiArCXVpbnQ2NF90IHNldF9icmVha3BvaW50X3RpbWU7
DQo+ID4gKwl1aW50NjRfdCBtYXhfc2xlZXBfdGltZTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJ
ICogTWVhc3VyZSB0aGUgYXZlcmFnZSB0aW1lIHJlcXVpcmVkIGZvciBiYXNpYyBzZXQtYnJlYWtw
b2ludCB2YXJpYW50LA0KPiA+ICsJICogc28gc2xlZXBfdGltZSByYW5nZSBpcyBjb3JyZWN0Lg0K
PiA+ICsJICovDQo+ID4gKwlpZ3RfbnNlY19lbGFwc2VkKCZ0cyk7DQo+ID4gKwlmb3IgKGludCBp
ID0gMDsgaSA8IDEwOyBpKyspDQo+ID4gKwkJdGVzdF9zZXRfYnJlYWtwb2ludF9vbmxpbmUoZmQs
IGh3ZSwgU0hBREVSX05PUCB8DQo+IFRSSUdHRVJfVUZFTkNFX1NFVF9CUkVBS1BPSU5UKTsNCj4g
PiArCXNldF9icmVha3BvaW50X3RpbWUgPSBpZ3RfbnNlY19lbGFwc2VkKCZ0cykgLyAoTlNFQ19Q
RVJfTVNFQyAvDQo+IFVTRUNfUEVSX01TRUMpIC8gMTA7DQo+ID4gKwlpZ3RfaW5mbygiQXZlcmFn
ZSBzZXQtYnJlYWtwb2ludCBleGVjdXRpb24gdGltZTogJSIgUFJJdTY0ICIgdXNcbiIsDQo+IHNl
dF9icmVha3BvaW50X3RpbWUpOw0KPiA+ICsJbWF4X3NsZWVwX3RpbWUgPSBzZXRfYnJlYWtwb2lu
dF90aW1lICogMTEgLyAxMDsNCj4gPiArCWlndF9pbmZvKCJNYXhpbXVtIHNsZWVwX3RpbWU6ICUi
IFBSSXU2NCAiIHVzXG4iLCBtYXhfc2xlZXBfdGltZSk7DQo+ID4gKw0KPiA+ICsJdHMgPSAoc3Ry
dWN0IHRpbWVzcGVjKSB7IH07DQo+ID4gKwlpZ3RfbnNlY19lbGFwc2VkKCZ0cyk7DQo+ID4gKw0K
PiA+ICsJd2hpbGUgKGlndF9zZWNvbmRzX2VsYXBzZWQoJnRzKSA8IDYwKSB7DQo+ID4gKwkJc2xl
ZXBfdGltZSA9IHJhbmQoKSAlIG1heF9zbGVlcF90aW1lOw0KPiA+ICsJCWlndF9kZWJ1ZygiTG9v
cCAlZDogU0lHSU5UIGFmdGVyICUiIFBSSXU2NCAiIHVzXG4iLA0KPiArK2xvb3BfY291bnQsIHNs
ZWVwX3RpbWUpOw0KPiA+ICsNCj4gPiArCQlkYXRhID0gb25saW5lX2RlYnVnX2RhdGFfY3JlYXRl
KGh3ZSk7DQo+ID4gKwkJcyA9IHhlX2V1ZGVidWdfc2Vzc2lvbl9jcmVhdGUoZmQsIHJ1bl9vbmxp
bmVfY2xpZW50LCBmbGFncywNCj4gZGF0YSk7DQo+ID4gKwkJeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9h
ZGRfdHJpZ2dlcihzLT5kZWJ1Z2dlciwNCj4gRFJNX1hFX0VVREVCVUdfRVZFTlRfT1BFTiwNCj4g
PiArCQkJCQkJb3Blbl90cmlnZ2VyKTsNCj4gPiArCQl4ZV9ldWRlYnVnX2RlYnVnZ2VyX2FkZF90
cmlnZ2VyKHMtPmRlYnVnZ2VyLA0KPiBEUk1fWEVfRVVERUJVR19FVkVOVF9FWEVDX1FVRVVFLA0K
PiA+ICsJCQkJCQlleGVjX3F1ZXVlX3RyaWdnZXIpOw0KPiA+ICsJCXhlX2V1ZGVidWdfZGVidWdn
ZXJfYWRkX3RyaWdnZXIocy0+ZGVidWdnZXIsDQo+IERSTV9YRV9FVURFQlVHX0VWRU5UX1ZNLA0K
PiA+ICsJCQkJCQl2bV9vcGVuX3RyaWdnZXIpOw0KPiA+ICsJCXhlX2V1ZGVidWdfZGVidWdnZXJf
YWRkX3RyaWdnZXIocy0+ZGVidWdnZXIsDQo+IERSTV9YRV9FVURFQlVHX0VWRU5UX01FVEFEQVRB
LA0KPiA+ICsJCQkJCQljcmVhdGVfbWV0YWRhdGFfdHJpZ2dlcik7DQo+ID4gKwkJeGVfZXVkZWJ1
Z19kZWJ1Z2dlcl9hZGRfdHJpZ2dlcihzLT5kZWJ1Z2dlciwNCj4gRFJNX1hFX0VVREVCVUdfRVZF
TlRfVk1fQklORF9VRkVOQ0UsDQo+ID4gKwkJCQkJCXVmZW5jZV9hY2tfc2V0X2JwX3RyaWdnZXIp
Ow0KPiA+ICsJCXhlX2V1ZGVidWdfZGVidWdnZXJfYWRkX3RyaWdnZXIocy0+ZGVidWdnZXIsDQo+
IERSTV9YRV9FVURFQlVHX0VWRU5UX0VVX0FUVEVOVElPTiwNCj4gPiArDQo+IAlldV9hdHRlbnRp
b25fcmVzdW1lX3RyaWdnZXIpOw0KPiA+ICsNCj4gPiArCQlpZ3RfYXNzZXJ0X2VxKHhlX2V1ZGVi
dWdfZGVidWdnZXJfYXR0YWNoKHMtPmRlYnVnZ2VyLCBzLQ0KPiA+Y2xpZW50KSwgMCk7DQo+ID4g
KwkJeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9zdGFydF93b3JrZXIocy0+ZGVidWdnZXIpOw0KPiA+ICsJ
CXhlX2V1ZGVidWdfY2xpZW50X3N0YXJ0KHMtPmNsaWVudCk7DQo+ID4gKw0KPiA+ICsJCXVzbGVl
cChzbGVlcF90aW1lKTsNCj4gPiArCQlpZ3RfYXNzZXJ0X2VxKHB0aHJlYWRfa2lsbChzLT5kZWJ1
Z2dlci0+d29ya2VyX3RocmVhZCwNCj4gU0lHSU5UKSwgMCk7DQo+ID4gKwkJY2xvc2Uocy0+ZGVi
dWdnZXItPmZkKTsNCj4gPiArCQlzLT5kZWJ1Z2dlci0+d29ya2VyX3N0YXRlID0NCj4gREVCVUdH
RVJfV09SS0VSX0lOQUNUSVZFOw0KPiA+ICsNCj4gPiArCQl4ZV9ldWRlYnVnX2NsaWVudF93YWl0
X2RvbmUocy0+Y2xpZW50KTsNCj4gPiArDQo+ID4gKwkJeGVfZXVkZWJ1Z19ldmVudF9sb2dfcHJp
bnQocy0+ZGVidWdnZXItPmxvZywgdHJ1ZSk7DQo+ID4gKwkJeGVfZXVkZWJ1Z19ldmVudF9sb2df
cHJpbnQocy0+Y2xpZW50LT5sb2csIHRydWUpOw0KPiA+ICsNCj4gPiArCQl4ZV9ldWRlYnVnX3Nl
c3Npb25fZGVzdHJveShzKTsNCj4gPiArCQlvbmxpbmVfZGVidWdfZGF0YV9kZXN0cm95KGRhdGEp
Ow0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgLyoqDQo+ID4gICAgKiBTVUJURVNUOiBw
YWdlZmF1bHQtcmVhZA0KPiA+ICAgICogRGVzY3JpcHRpb246DQo+ID4gQEAgLTI0MjYsNiArMjQ5
NywxMCBAQCBpZ3RfbWFpbg0KPiA+ICAgCXRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUoInNldC1i
cmVha3BvaW50IiwgZmQsIGh3ZSkNCj4gPiAgIAkJdGVzdF9zZXRfYnJlYWtwb2ludF9vbmxpbmUo
ZmQsIGh3ZSwgU0hBREVSX05PUCB8DQo+IFRSSUdHRVJfVUZFTkNFX1NFVF9CUkVBS1BPSU5UKTsN
Cj4gPg0KPiA+ICsJdGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgic2V0LWJyZWFrcG9pbnQtc2ln
aW50LWRlYnVnZ2VyIiwgZmQsDQo+IGh3ZSkNCj4gPiArCQl0ZXN0X3NldF9icmVha3BvaW50X29u
bGluZV9zaWdpbnRfZGVidWdnZXIoZmQsIGh3ZSwNCj4gPiArCQkJCQkJCSAgIFNIQURFUl9OT1Ag
fA0KPiBUUklHR0VSX1VGRU5DRV9TRVRfQlJFQUtQT0lOVCk7DQo+ID4gKw0KPiA+ICAgCXRlc3Rf
Z3RfcmVuZGVyX29yX2NvbXB1dGUoImJyZWFrcG9pbnQtbm90LWluLWRlYnVnLW1vZGUiLCBmZCwN
Cj4gaHdlKQ0KPiA+ICAgCQl0ZXN0X2Jhc2ljX29ubGluZShmZCwgaHdlLCBTSEFERVJfQlJFQUtQ
T0lOVCB8DQo+IERJU0FCTEVfREVCVUdfTU9ERSk7DQo+ID4NCg==
