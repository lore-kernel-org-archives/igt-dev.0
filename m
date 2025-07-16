Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022DAC83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 16:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8D410E295;
	Wed, 16 Jul 2025 16:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwXRn9L8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580CF10E295
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752682123; x=1784218123;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lSmU9We3JIHpE6aQ+ddUmLlVzOnOiVx8/M20EOmB8zM=;
 b=DwXRn9L8JUCsWzGMp/ikvG03oFVUqSMr/dF35QBZ9i3YX+i/j7v/mV0F
 7Wqbt1r4mZHsOMIxbl1znkWuhaCAvagCigENTkQJTi1u2gtojfLf4FmtI
 j/x6hGMcfq2EEpclS8USTsxJkOHinSm6jL08Q7iXJB33FrXYCbJ0DDnZc
 bgMrvDQcP5wEvoes6kO4jTMFNG1A/Hq2x8dUWzrGfqjxqk+BwOyt3R16t
 dLjZZ5kLO8OjSM5RzgF6/62F6gM3Ls9u1f+/iFyiVh64C6dszxTx6bLcz
 3E7Mf+KegDEf/8R6B8ikUzeip8fRES6BmTffCUf4fSGqzEUF/RnTeM/X2 w==;
X-CSE-ConnectionGUID: +gCkvks8SYy7bVS84+GBPg==
X-CSE-MsgGUID: cKCehSLJQ7yhKBUzO0Eq2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54874979"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54874979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 09:08:43 -0700
X-CSE-ConnectionGUID: uN1kRkScRFyS6EvIYiki7w==
X-CSE-MsgGUID: RR1e0rknRcq2yoeQ+SdF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="162092835"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 09:08:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 09:08:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 09:08:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 16 Jul 2025 09:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUKv57obLXsCYC2Zd1H6O6r8h7baoLRvPWJi02cmI0GxPsBjjJ7K+kjvwuzZ6gU5H+zKG7QgbX//JNK8fp+rNRZD3slBUvs9vOtvYEieAqbkQhgeoLEHf/WN4LMLXBWpR+qUvWS0HM+qEEXlpIrpg8+WeXLBycFI8fL+GA0FGJG9Rg3MVb+fp1euFTkuG80l3k6ESo7+mMWs+eenXO3kgiIod5cifap2zjVI9RSJ2MOPawMcRa/9wp9LUKDVWibX+SHjznwn2DRbERP27itbR8VSaFmk9ooukHfqUJzTdAEJWJ+1vDKEqe5kpSuQNCsZcr3NwGW6N7+jT6AWa6Ps7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0/wVVvwfynZkQIbMdFhxFkNoEthVwZ9LNRWBTadbAw=;
 b=RCeNT6y3zySLA8gGq4BWz4sZKGurY6jNtiIYccKsX1JyKS3jtoku4E6y0pxInEQN0Xxu3A3sTHFP5wY5qCSiLAVsx9xtv+vc5dUW8FeZKVkcowRraaTDPpBArvIOoZenrCgJZsIblL6LR5o2/SDMoqpttGG+pAdznGEK5SkBRzULvkoc2TFxXkzDf6Y1uJP7mikM1i+QbPHeZBOe9ZxRYi1hHHAizYQtzIs2HZO/b9CUc69s1r0NPyj8dmR3sFdQuuK/BUU1pP1mASO+6RqTka8yzppZf8xz40t7kNDdJdGl1KY+c1g7jQE6GETXzT1Oa/mZZqlyxBCjpMhVnQuk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.37; Wed, 16 Jul 2025 16:08:38 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 16:08:38 +0000
Message-ID: <303150bc-bb1a-4127-9249-8c0b4177399a@intel.com>
Date: Wed, 16 Jul 2025 21:38:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_async_flips: Replace hard coded modifiers
 with async modifiers
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
References: <20250715154827.318741-1-santhosh.reddy.guddati@intel.com>
 <IA0PR11MB7307AA7E554A4BA5D5DC37D0BA56A@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <IA0PR11MB7307AA7E554A4BA5D5DC37D0BA56A@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac3b409-cd6f-4a8e-ea18-08ddc4830610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTRmRkpPOFJDeU11bVBLaHhzbGtGVlV4d1BlVTFieVkyN1RKNEcwcFJQNTJw?=
 =?utf-8?B?SnhEb3h6U3R0V1pFczdXQ2V1SFhtN1NEUVBpc0tjNGFtZHZwWUFDQjdGRTNY?=
 =?utf-8?B?YXM4MXg1dWhvVWZCVVMyUUloNWVGaUFtTVNEZktqNGIrSXh6N2ZxcU1aWWc5?=
 =?utf-8?B?dVAxVlZzNTR2akhDeWxBdVBkVGpDUXF5M2h5NzBIdzBVZGJYenA5UzhtVmxp?=
 =?utf-8?B?eGJZZWtiNlZhdFlDcjNyMW5YWHNwRlFEYUpoOXhWYzBvcC9RMHJmNFVNTnVN?=
 =?utf-8?B?L1owOFRWQytXYzIwQWJyWFExODZjMkZ0YWFVbHJDWUVsZjVMWjBWQjlGaE9t?=
 =?utf-8?B?TnBsaXB0MDE2UnhnSFA1S1FIeGRkM0pqbXc5dXUyeGlxVHJ3Um9NWXJ0VjUy?=
 =?utf-8?B?U2QvdUtYZ0IwZVBiZnRJKzBBYVh6QTc3eVM2eGgzbWxQTWRvdFFSU2RCeE0z?=
 =?utf-8?B?bCtuazBXdDJLdDI3M2tDMHQzbHVNWUhsTHVJNHppVHJaQ2ZuN3NZTmlST1M3?=
 =?utf-8?B?UXEvL3QzVEM4bHVUdml3b3ZnVDlkN3JnOXBwVUM2VFJqK09zMkk1ZWZWS3o0?=
 =?utf-8?B?ZVUxWGNDSlBSOWlKMFB4VEdxWXFieFBqR1BVWTNVMGE0ZEpBdEszY2tBc0ww?=
 =?utf-8?B?emZrTmRQVGZRb2p1d09sR3VoSjlCRCtCMHZpM1RqbTlIOUtnamthaE1IYk90?=
 =?utf-8?B?ZDlwT0RtQlNDcTdVNEVIeVNCdUpXM3RFMmVYU0Z6cEs2cXZUbmxueHBhajNF?=
 =?utf-8?B?NTQyd0pJVXRBc1ZnbEEyQTNlYVI0ZHR1S1UwZmxkK0xwc2NyZk1YNDAzTy9l?=
 =?utf-8?B?Z3dBeWlNenpkTVM0U21BNnR4MHZLRk9XdmdGOWw5VFVoSkp1UHY1Ym1PYkIv?=
 =?utf-8?B?M2xhTUF3a1ZvV3hoOFoyMWpWb1VuVnFLK3pMejRYb1ZHc2VBZm9OVGRIQ1hu?=
 =?utf-8?B?SlU5K2JPUVhGdHJ6K05IWnlUNHpEVVpYWXh1MXJQNmlVZ0FhRVRld1pEeE04?=
 =?utf-8?B?Z2RlRUdSLzJ3T2xPQkdFSWJ1d3lHbXRkOXRyNi80R2gvdUcyaW8wbDNvMHpy?=
 =?utf-8?B?MXlWY0Zib2tkTkNLUGozaWJlSHNjODdZS2pLanhRQ3A2SXdUdkhpMXFxL1I3?=
 =?utf-8?B?K2lSekp2MW1SY24vL21KQSt0cXc1eXNKbEFqeXUzbHZrUkJYc3ZWMWZiY3Ns?=
 =?utf-8?B?cGVOSWVtYnFONjVYRDlwTlFlb3l2dE9XOENwaGFGTDR6aDU1amI5QUl6NmFM?=
 =?utf-8?B?T3hxNklVVnJQY3ZzdXVDd3RUaTFQVDk3VUIvWlFxR3M4RmRpODVNeUdQVGdq?=
 =?utf-8?B?OFdTYWluM1lJSmZzRWVyS2xNcnRDM01UUVpTUGtmRU1Sd28xVjltMThtczNJ?=
 =?utf-8?B?eE1uUldDM3BicFZDY0k1bFZJU0hJQW1GcWpoTzFnM3JleXdZazMranFreEtj?=
 =?utf-8?B?am9ERzExWU5tWjFndjJ5c0xyNWZWMk9tcXJtdjJRUEg4QTk1VlhjU1BGMXNi?=
 =?utf-8?B?NmtGUEgwVmttcDJBVWNmRHZGWWJyamlXcEFKNFR3Q2NWSWlqSDNkOTBXY2pu?=
 =?utf-8?B?YnJkRVFOSk80bXR0MCtXTVdaQ2s3WG82VjZtQnV1aCtJQ3o0Qm1Cc0VldGtT?=
 =?utf-8?B?VXA4a1c0Q3RBUVlBOEltV0MrOWFnZ2ZiVW0xclJJWUZocnc2QzExeUlIbldK?=
 =?utf-8?B?ZHl6cXFUSy9pUU9URmZ3Z01pUmh3bWtLekhrUFVBeUVyRTN1bmpUVlpDTUx1?=
 =?utf-8?B?YXVLeVJ4Y2d6Q3RzcDBvZFVjTytzUit6c09OTEYzdTloT1FLSy9oVnJGOHh1?=
 =?utf-8?Q?dDQcuDVLnuj9acNOjySGVdkul3roK6FKOcVLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFpuOEFwenhFTURiT2FKN3lUSjVLcmpHaGIyRmZxc2N5RW40aExDbnE2TVRF?=
 =?utf-8?B?OUZ2SW9hWnIvb1RqMEk4VWU0QmdLWkFzYXlPdmlvalE2KytZY0NLSHVKQ3VC?=
 =?utf-8?B?SlRkNmtoMW1qbjU1MFZveDF0VGFST3FuTFZ4NDJLRmNwZVZOMjZ4UndzWnVa?=
 =?utf-8?B?dGlsYkxHOUF4aTJKemtrMTFxQVpsVGZDcTlhaEpqbCtXWGR1bXdqV0hPZm0x?=
 =?utf-8?B?VThmSFdoNk56Um9icHZBRFdnQ3NRWUZ1SGhrcVN5M1Awck5TZUNac2hSVzdk?=
 =?utf-8?B?aGJtTXBDV0h2ZGNpK29oWFZ3MGE0UjNoWFVqeWlUZThFc0dXVWV6Y3pJR05v?=
 =?utf-8?B?cDZvMngrbDF6eWVCOXp2cHo5M3FaUWd3aFpYMkJlWGRrQTNYa3cwY0ZNM2x1?=
 =?utf-8?B?dllnRk42aGZ6ZHdhVEZxZ3IveTZZZytmQzVja0xuVi9EbFlvZ3FLdEdiSFdj?=
 =?utf-8?B?T3FxVUJBY1Y2Y1d4WGo0cVQwczZZVWk5ZmZWdkplUlNGV3QrSm5WamhZZTJ3?=
 =?utf-8?B?aGpMclF5MHd1WEFac2hzSHZhM21LWTUzSkVBWGQ5RUo1V29YSFFJYzRHSmtI?=
 =?utf-8?B?QkdzU2pnN2VUbjRoVUd1TnhuK2ZqRkpwWFl5THlKSzY5OStCdEVtMzBIa1du?=
 =?utf-8?B?MG9PeU9DSXVlNXpMdFhsWkt2TUpsVnFHVnlLOUh6RWlJM0lhS1ZlYXlnYUw2?=
 =?utf-8?B?WVZBdmJManlpMkFPZnZyTUxuRStmTDJBMWRnbWQ0N0E0ZHBIY1ZXbVMvWmsz?=
 =?utf-8?B?QjFQUHkzY1ZkYnlhOW9Razc0djZNaTVWRCtZVEZWaC9oWmlOTHcwY01GVVZ5?=
 =?utf-8?B?QytiSkI0Q2F3SlhwRlVEMFBPSHRycWFMRk1lTGUxZDRhS1dDSEJMVEhwWnVT?=
 =?utf-8?B?enlhYnpDTEY4dGJjb0JucVlhTWJEcUd5WVpVVGVpV1lrVGQvcWpLZGlPa2Fs?=
 =?utf-8?B?WVpnT1pvWlNCdHF3Z01ETHFkVEpYNHhvb3llSnBZTmszUjBXL0dTT0JVY2tS?=
 =?utf-8?B?T3hranVNdit6TEFhZUViZFhOdnFTcDFkSWkweUxCSTRXSitUVnpPQTBIVjVX?=
 =?utf-8?B?TjJpdzJGMThFV1FHQ2lKNlFjUTZESTlxUHROckxwdGZZTEc2NjJ5RG9OMXJ0?=
 =?utf-8?B?bno0S29pL0hMc2daQkJ6QmJQUzNSWUtBc0RMSCtzRGhYaXZXWUZnRDgyV29X?=
 =?utf-8?B?NHk2MmpqaUpQdUkrNUlRWDZra1ZWdE9vY2xjWTZPeTV4VTQ4SjF4bysvMzhX?=
 =?utf-8?B?TDZYVTV0ZXdrTy9mc2NlZnJGd2sxRXlQUkZ1azRSbFdwS29FbUorYWtiMDBh?=
 =?utf-8?B?ci9PbWtZOCtGK0xnU2VVZytRSFNoSmJvODMvRDJkTktmZ1hVZHJ2R1hLNnNH?=
 =?utf-8?B?Y3BWVkJRa1JKYWszZDNMVHFaUEgzdzU4L3o2LzZGZ0tPTHUrdnZjOHB5UlZ6?=
 =?utf-8?B?a2lhWnNreUVuaGV5b1l5WDBvSm11dGdWQUVZMGVseHNqNGxsS20wbVF2bjFF?=
 =?utf-8?B?aFIrVEs0cVdDNWM0cGRBLzJ4ZGVTakY3N1ZPQ0FWQnFFTVdYcjRyMjJTQmFs?=
 =?utf-8?B?b0dWWEVhNWN4UHY4L3lOcmtRdDBKYmc0Nm1jQWVMUzJSVERhcEZjRjBWQTJu?=
 =?utf-8?B?Z0ZqR3liUUpjNXdUOUxqQlR2Q1NFTStsUWVqbHpob2RWUU5ORWlpcmJuWU9T?=
 =?utf-8?B?ajNkS0JTclNGUGY3VW1adURNSmxVSStMNytWOVdtYmd2ck5XRmpZWVcrVGRl?=
 =?utf-8?B?RXRTUUVmbGNxaTlWZWQ4bnFzYm0yeE5uWjcyaXJkR3lKLzBTb3poWVNJUDEw?=
 =?utf-8?B?WUU3OXA0aXpEQWIxOGlDZTRkZ0R5TStES2JabVQrZXZxR09XVFVjYzM3aC8y?=
 =?utf-8?B?OUVVTXRsajQwTHV6THFLSUxDaHlUazNJU0xuZWVkaUJmS1ptSWc0aG9URGZG?=
 =?utf-8?B?UlAzNWJxK293SUtSUmtPaTFHd0xCeWp6bWx1NStkMjQvd2NDeW4rbEFDYWlh?=
 =?utf-8?B?T1NxRS9YLzRzOFowSjdTdjFLNEEwSTRHa21XSUVxUEdLdG96VEdwaERBWVdF?=
 =?utf-8?B?ZTlnSWdaVHBPY0pOQ1E5L29LY0o4QWVTUHNxSGE3bkYvUDlQMXBBblN0c3Z2?=
 =?utf-8?B?T3VuMUtjbk83NDJFRUtIYlhtN3k2NlptYmdwczR0bXd6Vm1wT0l6OHB6eDNs?=
 =?utf-8?Q?qTDVmmvH18qbWxit3s8VqUE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac3b409-cd6f-4a8e-ea18-08ddc4830610
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 16:08:38.1457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpW4v5i2WsBXEfA9kFDpnwsoI5jnbe/WALL6s0stG8TZF7mQNx0kzopGLFpke34CoDXqOuynlLTrVk9pSRE0aSqnbFZdH2Duyt/+Noq095xn0gxJnS4axTkT2IA8z9A/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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



On 16-07-2025 10:47, Murthy, Arun R wrote:
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Tuesday, July 15, 2025 9:18 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Murthy, Arun R
>> <arun.r.murthy@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t] tests/kms_async_flips: Replace hard coded modifiers with
>> async modifiers
>>
>> Use the IN_FORMATS_ASYNC uAPI to get the list of async supported modifiers.
>> select the 2 unique modifiers from this list to test invalid async test, removing
>> the hard coded dependency across platforms.
>>
>> closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 35 ++++++++++++++++++++++++++++-------
>>   1 file changed, 28 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> ddac904ce..ed95ffc96 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -598,6 +598,7 @@ static void test_invalid(data_t *data)
>>   	struct igt_fb fb[2];
>>   	drmModeModeInfo *mode;
>>   	int flags;
>> +	uint64_t mod1, mod2, found;
>>
>>   	igt_display_commit2(&data->display, data->display.is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>
>> @@ -607,10 +608,35 @@ static void test_invalid(data_t *data)
>>
>>   	flags = DRM_MODE_PAGE_FLIP_ASYNC |
>> DRM_MODE_PAGE_FLIP_EVENT;
>>
>> +	/*
>> +	 * TODO: As the async supported modifiers are currently duplicated in
>> the list,
>> +	 * the below approach is chosen to find unique modifiers.
>> +	 * Get the first two supported async modifiers for the current plane.
>> +	 */
>> +	mod1 = 0;
>> +	mod2 = 0;
>> +	found = 0;
>> +	for (int i = 0; i < data->plane->async_format_mod_count && found < 2;
>> i++) {
> Can the IN_FORMATS list be fetched to find out the format that is not present in IN_FORMAT_ASYNC and use them for invalid test?

In the current test, we want to use the valid modifiers that are async 
supported, but trigger an invalid scenario by attempting to change tghe 
modifier on the subsequent async flips, which should be rejected by kernel.

Thanks,
Santhosh


> 
> Thanks and Regards,
> Arun R Murthy
> -------------------
>> +		uint64_t mod = data->plane->async_modifiers[i];
>> +
>> +		if (mod1 == 0) {
>> +			mod1 = mod;
>> +			found = 1;
>> +		} else if (mod != mod1) {
>> +			mod2 = mod;
>> +			found = 2;
>> +			break;
>> +		}
>> +	}
>> +
>> +	igt_require_f(found == 2, "Need at least two distinct async modifiers
>> +for this test\n");
>> +
>> +	igt_debug("mod1 = %s, mod2 = %s\n", igt_fb_modifier_name(mod1),
>> +igt_fb_modifier_name(mod2));
>> +
>>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> -		      I915_FORMAT_MOD_X_TILED, &fb[0]);
>> +		      mod1, &fb[0]);
>>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> -		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
>> +		      mod2, &fb[1]);
>>
>>   	igt_plane_set_fb(data->plane, &fb[0]);
>>   	igt_display_commit2(&data->display, data->display.is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY); @@ -1113,11 +1139,6 @@ igt_main
>>   		test_init_ops(&data);
>>   		/* TODO: support more vendors */
>>   		igt_require(is_intel_device(data.drm_fd));
>> -		igt_require(igt_display_has_format_mod(&data.display,
>> DRM_FORMAT_XRGB8888,
>> -
>> I915_FORMAT_MOD_X_TILED));
>> -		igt_require(igt_display_has_format_mod(&data.display,
>> DRM_FORMAT_XRGB8888,
>> -
>> I915_FORMAT_MOD_Y_TILED));
>> -
>>   		run_test(&data, test_invalid);
>>   	}
>>
>> --
>> 2.34.1
> 

