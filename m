Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D904D58D5E
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 15:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3887210E68A;
	Mon, 25 Nov 2024 15:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neKYoKVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40A310E689;
 Mon, 25 Nov 2024 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732549500; x=1764085500;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hpW7gAqLR9ESN9suoiWS0Oena4tlmXXInDllu5KnqdQ=;
 b=neKYoKVgupLQJ/7d8BabkiwVDviANFBkFTAY4PZh8QAiRMRxWpbp4xWC
 1zwQhlyhoTi9GPw2ad02A29Mq4KcHUGKa5VuqzB7IlkC5QkasDuiiy9rD
 frEQqBX1Vrjqoveam+Aoli4RjuHWN7u4spMw91WJULucDcc0OliJ2i4OK
 80ZiRgReDLm8r9Gab0fgCPG2EctsnSa6DukieTgfsfdzVTDQjhmVPsQse
 JZHCIvOeW9yC62WntriE4wPWjJyJDgIv7wU1zfp3IJBqudxeQENPduErG
 iG1Vzkqfq1D+yTJPH5DXMif4RWtle440wQqLEpBlGp+2mvmSMNBKm6vFy w==;
X-CSE-ConnectionGUID: kcN3PYnWSX6ZX669x7x3Hw==
X-CSE-MsgGUID: jku8KKfUTuut/VISJVNv7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36445823"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="36445823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 07:45:00 -0800
X-CSE-ConnectionGUID: SNliOHx9R2a5j9DynOrx4w==
X-CSE-MsgGUID: i9/EInwdTFqlArj4VB93gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="122245166"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 07:44:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 07:44:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 07:44:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 07:44:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEj//98mZiLz7HxInKFSMQ3mBdYluQ53nri7b93srq7NQbBN9Yw4nE0aykWFDULS3TFjQtkSn9xPxaEkJTD02yLeYOjGXxS9b8Uv0e7Aqgycvqz1q6+Gdhzr8dCcm5Sop+1hRrmvPoV+qi3CWi3mbABON7n8bWHFauHajZ4aKDb+bkgeJU7GpX7gnha32bAxe60d0HHvlSplbvz0gYp0kXLjMv5mX1OnZxS94fMkH8AkFQ9JrltnF9SDj9XBLvJi1CK1TM5REaitcx6e7wEzo8HeS7auR2IiyDIhr4WYQ702g3QWALxdMQeFi3DSLLZI2XvsfZjN4g830gWFS+1l6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwfFdTGCzYg7tG/KZWgEO52I7OzyTyF1DdCHtTqS2e4=;
 b=Qe0vA7lyYEi4HxtrNzHe7omqDA9Eq2esDPKFtP0MCPiy0n/luAumEBlAFLOTi/maQgtd7z+uG86H7Hv0Uvyl46Wi1xJv7DTCyP/N+6wuCEzsjFJCclkKHA9fDufhhTky9R0sjyyg10WxfA5PQFLF8AG0plwP2t/YIheIT/5lzODpb4k1u6rGnIWGPPW3mpyjW1xw9DWu5zcYB/fWcgBxqYL4e1UGBW+TF5gK0rbmTtXCeaQ9ap7rvPCXccGNn43BeC6Anj3e/+xsMjisdPAm14t3gPoZn2gaaR3rM/dF+zWkvipE0Kmw9DbeKhpXcDHxScs5T60iHMR5v5plFxL8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 15:44:54 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%5]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 15:44:54 +0000
Message-ID: <61ed7878-3c57-43e2-a7f3-9c2f9e56c5a7@intel.com>
Date: Mon, 25 Nov 2024 16:44:51 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGxpYi9ncGdwdV9z?=
 =?UTF-8?Q?hader=3A_simplify_load/store_shaders_and_add_Xe3_support_=28rev3?=
 =?UTF-8?Q?=29?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
 <173254807584.2856342.9553562979482518748@b555e5b46a47>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173254807584.2856342.9553562979482518748@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::12) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9fcfab-ee2d-42c8-8739-08dd0d681b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVk2N3dOMGdNaW1mNmcrU1JkelVYQXlxV2RqU2dBM2JqV2QvZE1TUDhnYnZE?=
 =?utf-8?B?ZlNXcEZBS1VRdU1ab3dUek5yM0R0US81cDA4QXFQNWNlRkpFdFdhc2ZsWmI5?=
 =?utf-8?B?c2xuaGNlNVNDMkpwbXpLT0Q2c2RjVFpUamxkL2IrejlrYm0rbS9PQkNSekhx?=
 =?utf-8?B?UU1aZlp4SE5mcGY3WGU4cVNCY0hiQk5JTklQMnVaeUdlczhRTzc4U1ZkdEtm?=
 =?utf-8?B?RDdQN3lJdFJZQXkxM3IvRzZ3YXNwVW1LT1ZMNmliMTNqd0xtSjBURlBoMklV?=
 =?utf-8?B?My9uQm5VVnl5S3MvSWZhTHhMTXBEczNrdVhhN051Ui9DV0NvMTJkV3d0TTBl?=
 =?utf-8?B?d05OUUZHYmxwU0VQMUo2L0hjNzVyYUsvaUM3UXNYV3NPc1p6VXpoaGs0NllH?=
 =?utf-8?B?WUxxK1owWG5ONjVERjVWL0tuZVFXdUJoaUdVaGZiUzRiVENhQ1lmbGNXbVlP?=
 =?utf-8?B?a21ycWM1QzZzczBic01CdEZsbUdXSnl5OG1EQW5nZlhpMHlJcVlndGl1YWhy?=
 =?utf-8?B?UnhQOGczM3NxM3VlTnhOaXdKVWdpbWROYnp3MW80M1crd2NRbytJYVBmREwz?=
 =?utf-8?B?eXhicGlOaW9uV1hZaVp3TjlHVUdSZXM0M2hEclFHU3BjRTJXN01ZMU1kN3lr?=
 =?utf-8?B?MUlSUmJCUjU4dTB0Ykk2NTlIV1phRTY4WnorOFRqOEFyQnpCZ3c4YjVlMCtt?=
 =?utf-8?B?ck8weWU3Z3dHZ0VueVl6UEdoZVluaXBHaHc2MGU1Y1dJdHd4Q2ZRN1Q4Mnds?=
 =?utf-8?B?SWVjTXNEbEd2RXg1OEhyT2haYWJMOXp1WlVxdmlqUXJaMzFlV050eGh3YUU4?=
 =?utf-8?B?K3RqU1RreHM1ZjExclNRNlhJZk9UMjJUMUJNSERlVElJbUt2U1lXbG4yUEhz?=
 =?utf-8?B?SzRaRVQ5dUkzUVR4SFFaKzl0MHA0d2pYZGVrbURQY25zQVdEdkJlSlFpSG04?=
 =?utf-8?B?STIvc2lmUVM1c2UvR3BiSnE2dkNVaDRiMmZnOEdDUDJjdkRMQ1ZSSVNQUnF4?=
 =?utf-8?B?bnZzQzFoTTFZc2hTWEJENmYySEZPdGljdHM2Rjh2bGw5TmpCdEFzRWJ3T25R?=
 =?utf-8?B?QlU0aTdlUnNOL0VtTWNhRFordjBCMTVkV3RCN2cwNGpERmUrVVhDVlpTMHha?=
 =?utf-8?B?ZXJZNFUrdnF0aHRRQzAwWmdVQUxwdmRkanRsN1RtUTh4RWtxUGt2TmNKbkc3?=
 =?utf-8?B?SEk5bHpteFBqQXJkeWt3QURCRUdacnMrd1F6RVUxMzBPbjlnNzJDc1NXaTZ6?=
 =?utf-8?B?aXl3TE1VWExBZ3JOdlovVTI5SjhOQkJGZzh5cGJZTGE5NWZ4aWhSWmM2NGRr?=
 =?utf-8?B?SGtIdVMwWEJicnJrMFpmT0dXZm5ndzRhOXFuNDVKR3Fyc3hMWU1FQ3VDSy83?=
 =?utf-8?B?d1JIaGloN3hIRUJEWmtZSnVTM0ZFdGxqdlJ0NWZhRWpDemtJSHRJU0VYSkRG?=
 =?utf-8?B?WUVzY2o5RjdIZWxPUEljWDlPZjhRVlVVYVU5RVZ5V1c2ckV4a3cra0V2Mjdr?=
 =?utf-8?B?ODZYMFY4eFIyYmdlL0lvLzRKMFBaMzM5cDBXQmRFa2lzdjE1WTNBUTBnQVpK?=
 =?utf-8?B?VzRrZEJTajRxWVZLekJDeGh2V3hYQXl5S0JzZGYxanpPVC9EK1l0eE5HU0RU?=
 =?utf-8?B?REMzNDlvR3FES1BBSk9YTzUraDRmdmFXSjJReUh3R2UzT2JiaHg0YXQxd2M4?=
 =?utf-8?B?VlBzeVFlVktVdlJzRUExQnkvUm14aHpnS1BQNE81MjlPZU96dWgxSnNITjZQ?=
 =?utf-8?Q?ImUV5SpLwJbA+7pFmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlNHd3RIWG1Pb0tROTBvN0dmOWJwaG1qWDlUdUZzQzJaTHRnWnJJNXNNN1ZV?=
 =?utf-8?B?TkJ4eTdqTkFYUFZPc2JwRStudTlicTZlZnk4dHViaDA0eno4clFDZnVQWFFR?=
 =?utf-8?B?bDRkSXRCdjBTcFA1YXAzeStLYWxabWhYVmpsRW1rNXlmMDUzY25BTmVnT04y?=
 =?utf-8?B?YVdtV0RHeGRiN0VDMWVvTjg0NUhFWHY4dlZETWlES1ZXQWxVZmFKVHJzYkxI?=
 =?utf-8?B?QzlWZFJJNUp5a3JveTVUYlRNeXBibUdHb3gxdU1ha0h2bzhJcXkrRERzYUhG?=
 =?utf-8?B?Q3QzNlQyZjhlb0tFZmNpUVNtRWFrZjAxRVZqdU84QVpGQkV5UUswTHFoT3Vz?=
 =?utf-8?B?bTJpeTBMTkVvd21uWEdYVmozYWExK0dUSlVtMkRIdzRraWgrV2FqMGY2akk4?=
 =?utf-8?B?MEJpRWRIelkxYTg2WTV0a0lVSGJyS2dTKzQvNDN4OEo0TjJLdmJWZHV3aVFT?=
 =?utf-8?B?VVFtREMzb3E2SVN5aDV5MDhpQ282d09lTmZ4REFBNnMxTGRLTVBMMlNSa3ND?=
 =?utf-8?B?bzFhR2Q2ZWF0b2hCTm1aallxSzl0THM5S1Z6RVdiaEVkN1drK3d2S3VCbkQz?=
 =?utf-8?B?UXBENnpYWFVBOThwa0wxUzFLaU9VUjJzUmZqUk05UldXdy9aOXROL1ZLcHZr?=
 =?utf-8?B?V1pDRUNHZ2dobCt6YXE3SUNaZ0hnR01QdzBlemhqcW9tWTV5ZVR6ODlpUWxM?=
 =?utf-8?B?ZjRvMVl1TERVTk9OSncxRjYxY0krV2NHTmNKWnJpQ0ViNFFndHU1VE96Y2xv?=
 =?utf-8?B?UjlFNnRiQk9nRW5lVTZQL3JTbVU4QzA1N01DRk13UW5OYi9UYStVZTkyYkY2?=
 =?utf-8?B?TlNzRFhBMUp2NEhNL042SS9NbGtFTjZjYm84bXZwM0hXVjB5ZVRXT1BJQXVQ?=
 =?utf-8?B?eC9ZQzlaRkNCNXEvS2Z1TWY5OGFHbVNUTzBLNG92dW96YjYzZEwzUXNKQndW?=
 =?utf-8?B?U0hLRjdkYXp4UVdUbmJOcGcvWFBHUzN4M1cyZzlPbEhJRS9NUnM0Z0FZZHRD?=
 =?utf-8?B?dVJ5UWZRd2R0SUFvTzJ6S1ZhZlh0QnBYTVpleXliajV3NjIvOXR2R0d0L0ov?=
 =?utf-8?B?aVZYQktQeW5KMmVVTlNyWFlHcTMra0R6Y1F1Tm9WVkEwTDRXVVA5T2tQT2Fr?=
 =?utf-8?B?emg1a1pVakpiWXVHVEZMV3p2Z1NzYVdRN1NXenc1U3FIUy90VGJwSUIwRXk3?=
 =?utf-8?B?UVBHamFWTHdQTWJTdUlBSnVKaU9xQ20rVnRmcWZoOHYyaFdlbENYMFg1ZWN2?=
 =?utf-8?B?SUVzTGRYdEdHVXFMWUVuNVRpKzM3R1YwcncwbGt6UUJMRVlNS1JwaGtjV0hz?=
 =?utf-8?B?UllOdWxONGszY2ZpbUNtUmlRZWZmOHZCZC9FNGhHdWVCTmRHN2FjYUxpVDYw?=
 =?utf-8?B?QzAyUG5mTytZVE1ISlhacm9mWGZxMzJpcHVoRGlsWDgvT3U5S3I3U05tUFY1?=
 =?utf-8?B?V2J4OGNUV1J2cGhaY2dUVWY0VWxsa0ZYQVkzK093Wkh1dDJjSEJHaDJpb2lP?=
 =?utf-8?B?bDJSZlYvSFJ5Z0tOZm5pZ0xHV1kxdEhGOStEQzhFb1I0anU0NVRuU1Fhbmd3?=
 =?utf-8?B?QTkyMGJzTFZ0UFNHdkZsT1gxNzN6djNwRXF5blp2QjdoVmtlanY5czlwTWlK?=
 =?utf-8?B?b3ZqRVpySEE5YUVSRzgwYnU0V1lGcTF0S1ppRkk2SkZBbXpZVnIzbyt3SjRS?=
 =?utf-8?B?cDRKOXp3WjE0MmNCVkc3QUx0dU9IR1o0TnFvaTl3WlVwTlVOcnVLMjJzWnhl?=
 =?utf-8?B?bzFFa0ZBS1ZwQkJuTnpENDVuckdFOUM4TEFGTTc3UW1WaFFkdVFROVM4Rmpz?=
 =?utf-8?B?ZFlkb2NObFJLVzE4SHZxM1REWk9ZZ2pwMm54QmJYZUdubVNsRFpNTlZFOGp0?=
 =?utf-8?B?SkI5aUhEVmtJN2NOS2JsOXhXclVJczVEYit1Y2p1ZXBuZ2N1YXRQblFzMUVi?=
 =?utf-8?B?Q0x6TFo3dUNISFZuaHJTKzkvNi9SMnRQSVpGU2x6NVZvOVlwNjRjV0hGcFlu?=
 =?utf-8?B?cW5RNlBVWUdSVTI3ckNNYXp3U0xmK1lvaDVLSnBKUGVydi9NY09WdTBJaVhX?=
 =?utf-8?B?TGVib0VYQ1VBME1lYlluZWE2ZXJWTndiSHZ5bFdCcEpITFBBaTdHUkJUZk1X?=
 =?utf-8?B?ODZhbWZQL0pmZHlWZmtOR0VqbjRSK0ZNc05jVzZ3T2tJMUFxUnlVMWYwNlYv?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9fcfab-ee2d-42c8-8739-08dd0d681b77
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:44:54.7800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjOeIvUVtj6vNbFrJCTEM9+Mx+9uIZvrHqgnbHslvjGRB6xH80mPHk5prx0KLqWANZ75HuAkjg8BCCWBz4j7JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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


W dniu 25.11.2024 o 16:21, Patchwork pisze:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/gpgpu_shader: simplify load/store shaders and add Xe3 
> support (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/141668/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/index.html
>
>
>   CI Bug Log - changes from XEIGT_8124_BAT -> XEIGTPW_12190_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_12190_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12190_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (9 -> 9)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12190_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_module_load@load:
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_module_load@load.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_module_load@load.html>
>

Not related.


Regards

Andrzej


>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_12190_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>  *
>
>     igt@fbdev@nullptr:
>
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@fbdev@nullptr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@fbdev@nullptr.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) +4
>         other tests skip
>  *
>
>     igt@kms_addfb_basic@bad-pitch-128:
>
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +50 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@basic:
>
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@xe_prime_self_import@basic-with_fd_dup:
>
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +157 other tests skip
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_psr@psr-cursor-plane-move:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +2
>         other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +32 other tests skip
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o bat-dg2-oem2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8124/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12190/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>
>
>     Build changes
>
>   * IGT: IGT_8124 -> IGTPW_12190
>   * Linux: xe-2269-4d723d57180a3aafc1a510bc08ef42f4b03671a7 ->
>     xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9
>
> IGTPW_12190: 12190
> IGT_8124: 8124
> xe-2269-4d723d57180a3aafc1a510bc08ef42f4b03671a7: 
> 4d723d57180a3aafc1a510bc08ef42f4b03671a7
> xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9: 
> b21f1413ea1860e80fd278112e820e6dadfc9df9
>
