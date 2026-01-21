Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919F2C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 08:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F1A10E2BD;
	Wed, 21 Jan 2026 08:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzqHO+O5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D318410E2BD
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 08:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768985963; x=1800521963;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=quI0kSrrZq0+djX1uo2Z/sNW2g0wRbgNjgcyI5M5Wws=;
 b=mzqHO+O5pQTVbz8DHg3nFQD1ImIalt0AD7cZENlTFXH5NVTbfSnbwpVO
 VXP83v9hG2pOFT4CLUBW7l3B4AgqTK1FS7mPJWmJT4hEP6f3YhCHvyhEE
 MxXcNNHBf44NBxr51YPRJ73Czpa0o6kvv1DQaLiQ286f3mQdj0zzX42jz
 xi1JteJnLikAfJ6o2fEHUpJ5IDvB5TssU4/KvEWdzNNf2eN/gcGzbQr4+
 up8v+DcpUJWx5ggmkT2FyyE2RxU43ahcefqZzvYS0lGBqEZp0iJpTenlq
 uM8+X2SKiXB+bxQGxRsqqOk2EmgfiTYpOp5tk1o8+CIGkt4d46fjKwXb2 w==;
X-CSE-ConnectionGUID: suZzVs9tQbGVLG7giUG7lg==
X-CSE-MsgGUID: HR0RQARORtiEcbEevj+Jxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70301484"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70301484"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:59:23 -0800
X-CSE-ConnectionGUID: yKQGFeNWTiOvgWxczlLudw==
X-CSE-MsgGUID: 6FXIC2T3TI6WEmhpNt9iNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="211248517"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:59:20 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 00:59:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 00:59:19 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 00:59:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9Y5FWKmk/ulsQe++WeMGKtnAPl9LIA8ZrVUYf+nUk9ue6yXW5GypnQR3hh5J/n+eywFW17ZQeu49zCYg7a6J2n04rnQkNMFG9uC6PIb6MBd+kd+HIYVhGG/VUjjicyy7zWBuYKWZjQ1LwdKeALqtB+LVWpjhPEV5qsf3Qkqaxo1PWwURJOADrTWBtJBuS4SOpwwDFRyoM/2y+BhxBYp/UpY7spRz0YApxOnDIBGaePtyqab9RI2rdOWe8l0GfSqlj7qROmKVmPEcaxFXW8SSqHGNDlOu1MqSy+M8e7oAtP75APkfPwgHYwgUTr1IxAnYeJmbW3IB8zbq8SewesfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gsg3fQfSj/JPueSLZk9n+8sgY1ecqvWAWxLaS6hCtFA=;
 b=j1LKcTJ0gMzdm0ZENCdlwWlC100gnATODTO8Y0w8udLLJkFXLddhULwxhXvgSRTC/aspkAzs3hz3UOTiO2R6wa7EbiinhBUAdrnhPOZVGeFP4QHHV26mfAg50wq6KZzfgVy7hbTrwQecp67piwcIemECBYI4SXBg4M8jQAObOP0EW9bHt0wU6+sMPs0fYY5IZ+lGJ6+T4q2xe9HfNXFNFt8zwrGyYJleVELZ10jnMfK6ZH6DTSXhu305nkdabOnEbeQOT6HRazECbY/y8zt0WGMOOgGOkmKvH90r7fAWDnQg92bvnnK++US1+/vhz2QDXsFj/7LGCkbRrys0vGVt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:59:15 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:59:15 +0000
Message-ID: <1441a7d6-5394-4444-8c7d-e2add5f25081@intel.com>
Date: Wed, 21 Jan 2026 14:29:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/6] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260107183739.84597-1-soham.purkait@intel.com>
 <20260107183739.84597-3-soham.purkait@intel.com>
 <20260120122735.njvn6rngqzikhzfy@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260120122735.njvn6rngqzikhzfy@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0044.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd80073-bd9d-447f-28c5-08de58cb5a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVNCQkc4dkpKVEZFTDJZOFhTTVhxU2RzZlpRUFdXdXJWdUlWeE91NXhBb3Bh?=
 =?utf-8?B?NTV0ekQvdHNrK0Y1MER1dXFKZXBsWEROdmdRWmFhTGRZUWY3N3lwbVAzRFJQ?=
 =?utf-8?B?SXFXejBMY2g2aGFyU3lZM2ZCcytwQUFlS3F2Q1hhRzJWRVp3VkxZL3YyVlI1?=
 =?utf-8?B?Z0Uva2w2MmxQdEhYdFh4cVRBYzZMTm9RZHVNRU1vZ1NvR0RzZHB6RTB1bFEz?=
 =?utf-8?B?RUFwWmhZaFJKRFRxb1VBcmY4OWs4bDlHK1BZV2VwM0NwYXNxMlJCQlZoeHFJ?=
 =?utf-8?B?YW5pSDBnVGt3VnpPdEV3dUR4NHprZG5kMk50MFVLZENZZWxzUEZqM0VQY2o0?=
 =?utf-8?B?WEh0S1k3aXZvY0FIbjZBY20xUEwxRUdXa1pVbnRNdEJrbldDSURuQWtEdFFr?=
 =?utf-8?B?VWtlL21iOUc0YlMrVDV3WFhhaGIzKzBDNGRlWElOQm1ja3NhaVZwRTd2bkE5?=
 =?utf-8?B?Q3ZncHFCekgyaExJaFRDdWdiQ1p6MzA5UGhyejk2U2I2SjY4TlE3WmlubTE1?=
 =?utf-8?B?V3NsS0FIb0wrVnJGYnNTaVdyY0I2UnFqSm1LZ2lBNWpFb2NuVFd0akYySDNa?=
 =?utf-8?B?ZzRSQ1ZIVHRvaXR2OWt3WVp3Sm9ZMlRPK3lUbmZtbzQxNlBGRTNTZVhCOXhX?=
 =?utf-8?B?dSsxZFZ3M2RWZmVIZXdDNHg1aXlaeU1xdUZ1c0NFcFdZazhRdU9HclgxSkN0?=
 =?utf-8?B?QXRhZERNU05nbFladk5jNktyZjBmT01DbnNIU1VXKzlmQ1lqMnlCak51ZGZp?=
 =?utf-8?B?RU0wOVRxMG9oR1dxUzVVdi8wQ3pZNVpBcjdoUytFTVlBT2IvbFdoWlZMaEZU?=
 =?utf-8?B?eGZ0N2w5bkdkWldUTU9nRVFxWUJ3OHA3Y1hOWndRTjU2N2pkblhwYmFxWDdX?=
 =?utf-8?B?NmdDb21TS1lkZnJldUg0cHc0RkUxeXllMzk3SU5jVU1weXYwYVF3a3orLzdO?=
 =?utf-8?B?TUdnZzMvWTFRcitQbXlRT05ST2R0KzFjTzBsNjliMDZ2NHlBV3dpM09sUTZy?=
 =?utf-8?B?b2xoc01xM2wvWXRRZngzQVNGaldvd1V4UVNSMU1SalR3V1VzS1lnUTB2ci9K?=
 =?utf-8?B?SVFhanB0ZjlDZWc0NmlheWY2TkxZb0xwd204WmRDN1JPNUJMYmFVY3lEN0p3?=
 =?utf-8?B?Szd6Z29JNlZZRS91OFRMcUp6WWlnb05wSzZkNGp5V3dFOE1lRFdscEF4dHRz?=
 =?utf-8?B?WFRLRmJoODB2cXdaZ1Y2eWEwTjBkQWNPeG1SSW92YUJSWFlpN1piTmNaekxI?=
 =?utf-8?B?Y05JSUZkQW9EL0x0Z3ZVSHRHcmo1ZmEwamJCVXJTclYwT2c0RnFnSTNwRUdZ?=
 =?utf-8?B?aWRWUDBzS2tMNzZSbDQ3L0J2emRZZmNFUWR3TDhaeXRDMXRHdERXME5abUUw?=
 =?utf-8?B?c1RzL09XUGJYRUhFWk9vM21sSXRja0FPell1TDlkVUhUa2IrbDFFNVlmKzdU?=
 =?utf-8?B?b1RJZ0pOY0dEMEhxUnhRQXV6V0p3K3hkbzB6WHdNR0dPSUFVbjMwSmRYa0Za?=
 =?utf-8?B?MW9Qa0pyQXgraFhZNW1neDY5Ull6UnlrQ2p0WXVDR3BJeU9QT3paZVE3TS82?=
 =?utf-8?B?WExZUjdGUktCVTVQNzJtN20xN1dvQ2FQQVZCd3NoV2xaejZ3L2ZjeVZ5a2h4?=
 =?utf-8?B?WkZQVFJNaUxhUVhDQmRRVU4vYjNyOW1vbFpsTFB6MGd0SU5vZElNV0tkTEtj?=
 =?utf-8?B?b1lLVHorSGhWTjJSeWVaZTBOVHJ1c3RXOUdJM3I1K2cvL0sydUJWYmJ5TEZy?=
 =?utf-8?B?UUNBWjY3SStzaXFzajBSenRlS0xrM1plSE93cW80V1gwTzRuMFlQOVdSVHF0?=
 =?utf-8?B?RkV1MktPcXNSK3o4Nk5iM2taMTlneXNzajRsMjR5L2JZWitYVGk4d2htaWpD?=
 =?utf-8?B?aGJDd3U2cFhIYWVYWU9sVXNrYzdPTGUybmFraGVWWTF0RlV6ems1enNQREFn?=
 =?utf-8?B?TGowT0JrWmN5TWVWeFlPMWUyV3R5QS9za2tkNTlEalVVcFVMU2lFSkh1NGl3?=
 =?utf-8?B?czUvV0JxcHMwejdQN3RJNXI1VUx1alNyY1FNblZnUlJQV3dPcjAzMWpsc01n?=
 =?utf-8?B?RCtGZ3QyMCsrSVhvOW5XaFZxQXArRWtEeDJyMGFRelRSNVdMUmRmNTZNRWhn?=
 =?utf-8?Q?rIwo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFNYdENHTEpXZ1NnTGNWNUtBRC9LL0lPK0xvc0V6TjJnbHRQMUpmaXNGMlF5?=
 =?utf-8?B?L0ozUUsrTzhZYmpnMUFDVXRyVUJpaEJqM3EyMlRxbWxuWmxib2gzZWhDR2VC?=
 =?utf-8?B?eUxCOFFLMzdURjBrT3JtT25lRjlpd081aWVrWDNlMlRZM2liY2lLdGUyaWZT?=
 =?utf-8?B?bnRXMEZwcUhWcW0zNXNoUnNEWjZXREtNbDRGUTVFVkdycHYyQmlMSnVsNmZR?=
 =?utf-8?B?ak4rOGd2TkZkeVVxSU5nOTZQTnUwRnBhMHpTaGMraVkvZGp2bFAxL0NuZ0JJ?=
 =?utf-8?B?NEY1N0J2bUs5aGtGY2JMOG9rOW1VTENBZFcveG9nK205VXNrSWZ2NzdRMmhI?=
 =?utf-8?B?Y0NXUVdxSDVzZ241SDJ5VS9KUTdJWVNGOElHZFBuMkx5RlF1ZnZhQnl2aUth?=
 =?utf-8?B?UFdMd08wai8wT3FzcWE1RHZHSjF3UVlFclI5ditkeFM0ZjU5UzdXNFJpRjhn?=
 =?utf-8?B?K2RMY3dSZHZnQ1ZHcGVldHRHY2pkRVowbGV1a0gwR0xhd2wvelhpeGMyaUo3?=
 =?utf-8?B?K1FmRWhESDJ4RUpvcWhtT1RXMTNYck02dzRHZkpCZnp1MUgxZUJVMmxsdzZU?=
 =?utf-8?B?aWpHUDZpUUdMeFhTU01oU2s5UllxczA0R3BXUkNIMkdHMUJ3MTk4MFJGSWUv?=
 =?utf-8?B?LzZ1UkZ5NmlVVGg4cTlHbHFhamE5MTB6MVd1WUpUYlJDWEJCbWNLK2NNYzQv?=
 =?utf-8?B?Z1k3cXVBZlNuK2xocFhBbmtha3lwNU5PdmtsOUdqUHdtdjhQalZ2eGlYanJk?=
 =?utf-8?B?bUpaWVlFUlp4dVFJNWF4d1dkbGEzdFd5YUE3MnFaNTNLOEtmU0s4RGhaY0cv?=
 =?utf-8?B?a0tpaDcvak55ejBmZ3pNWDVaallpcUNLYmswQlJCTytOY05rRFRqbVJMMUhK?=
 =?utf-8?B?RGhManhldnhpaHNKd281SmVaeFFzNXN4MFVIYUNpOVc0MUdRalY5QjJoY0Nu?=
 =?utf-8?B?R0Q5ZnNDelgyRVJ6RWRtdEVCakVuU2tFYmdJYnVjWFJRaGV4bnVmczlucytp?=
 =?utf-8?B?ZzUrTzBpa21qZFh6V2dMNkwrUDYzWmpraGxrWnppL1lZdUUxTUFJbXBWWGtV?=
 =?utf-8?B?RnlpbmgvdzJCek1jNDlhT2cyVmw5SmxpQ2I5THpxdmZ2TXc4MWRITFJlbS90?=
 =?utf-8?B?T2d2cE9zVnFvc0NtK0JRN3JRaG00T3lxYndpK2xueWcvdFVoclpkZWhxeS81?=
 =?utf-8?B?Rzl5OC84WkNkdGUzYk8wdHBubXErSHFhdG5JM3UvR3VESDVLRHQybTBsVEJh?=
 =?utf-8?B?ckJaeUwzUnZtVTZmWVZPRUNHUUhjTnV6alMzWU01Q2VvWGx0cXljdS9Qck9r?=
 =?utf-8?B?UlBiMWc3eWxxdXo4U0VBTDd5K1lIaE9SYjBwRFhBYUtveXROVXlic2JCdWZo?=
 =?utf-8?B?eUg0SWNqL0tlSXQ4KzQ1REtSMXdkYThOVy9Wc0FJN244bzdDNWN1aFBFYXlL?=
 =?utf-8?B?Wlc3Nm1VY0NWdHViNDI4ZkRNYjdqTmNQMDloRzE1SEdpYW1uMGV6TENhTmJ0?=
 =?utf-8?B?VkNKOGswY0hUOWVmS1BOLy9sMFhmZmNLaFR2RzFaWmR3RTJZbDBubUg2cC9I?=
 =?utf-8?B?YlpmM0o0SjZjZEk1bHhtTHE5YzdyWEJHa01HZ3I4QzY0NXQ2dFQzWk4wUGY0?=
 =?utf-8?B?R29XQjUxK2FMV1VnWks4clo5c29nd1pOb2g0eGF4MFg4aTdicWorVk56aTRJ?=
 =?utf-8?B?NjBxTFh1dmZMclF5QUJML1JwWlp0NGRydHJGQTFTSUd5RHZmbWxaR2ZsTSt4?=
 =?utf-8?B?ajByTDhudXN4QkFCZ1NEYnZaTGVaRlhjNnJDMGlZbk9SZFZkUU9HTytOZjg1?=
 =?utf-8?B?TkZpWVZqSFlRRkFMaThWdDNVOUJ3S3F4eTBrU3YrNTBMZFZZNU83b0NKVnZq?=
 =?utf-8?B?SS9KeE1aU1lodmFrbDRTaVk1eGwrbzdzcWFXSlgvdzFOVTY3UFEveGszNmZU?=
 =?utf-8?B?VVFlQ1JVUlFJNTZ1d09weG0xb3lTWWVFUzhVL2kxdUlQUUh3TDZKc1NzVVhq?=
 =?utf-8?B?UnljSGc2bmlQZ1hhK0tHeW0rKzB3SkVRcFo2VHBiUFEyQmhrY0lmbkt3aGYy?=
 =?utf-8?B?SFhwWVh0SkVIczZWU1ZEL1d3bXFXWWpKUHErME9nc0hBclNidVhtY0s0MzY4?=
 =?utf-8?B?MllWczhrVVN6Q1ZZK0hmZk54WHZnVDlxY0k0cE15UXl4TkdTdEZBU3dvWnA4?=
 =?utf-8?B?ZmdCZ3k4UEJ3NHU0NWFYcFYxbmFmSHVVbEJ1YWRVb2Rjb09lNW5xcWh2RjZS?=
 =?utf-8?B?WERUdkV5UGhJbXF5eXR6NDRlZUZtVTJPbVROSGJjUW11QkN0ekd1VHpyaTlN?=
 =?utf-8?B?Ujhuc0VrUnZyZ2VMQXh6bmdMTU9IWHJYNEcyTmczK3VqQnJxNmlxWHcvMy9q?=
 =?utf-8?Q?dPnJ5lqaLXaHRqf0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd80073-bd9d-447f-28c5-08de58cb5a92
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:59:15.5841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8oQiMEqj8pSUhjWWfDor0UIJZF9fkbMFcY2abwCredb2uAwyiy+cNpShHug9I67toeB8IAlWPiZYUV+TqJM+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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

On 20-01-2026 17:57, Kamil Konieczny wrote:
> Hi Soham,
> On 2026-01-08 at 00:07:35 +0530, Soham Purkait wrote:
>> Add clamp helper macro to utils.h to remove dependency on lib/xe/*
> You still have #include "igt_core.h" so there is more to improve.
Although "igt_code.h" has not been included in this patch. I'll try to 
remove it.

Thanks,

Soham
> Before your change:
>
> ldd build/tools/gputop |wc -l
> 5
>
> after appling all patches in this series:
>
> ldd build/tools/gputop |wc -l
> 78
>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/gputop.src/utils.h | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tools/gputop.src/utils.h b/tools/gputop.src/utils.h
>> index 00befed56..0334ec839 100644
>> --- a/tools/gputop.src/utils.h
>> +++ b/tools/gputop.src/utils.h
>> @@ -19,6 +19,14 @@
>>   
>>   #define PERCLIENT_ENGINE_WIDTH 8
>>   
> guard '#define clamp' with #ifndef/endif
>
> Regards,
> Kamil
>
>> +#define clamp(val, lo, hi)			\
>> +({						\
>> +	__typeof__(val) _v = (val);             \
>> +	__typeof__(lo)  _lo = (lo);             \
>> +	__typeof__(hi)  _hi = (hi);             \
>> +	_v < _lo ? _lo : (_v > _hi ? _hi : _v); \
>> +})
>> +
>>   /**
>>    * struct gputop_driver
>>    *
>> -- 
>> 2.34.1
>>
