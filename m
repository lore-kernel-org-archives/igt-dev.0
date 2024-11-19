Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F809D44177
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 15:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65ED10E682;
	Tue, 19 Nov 2024 15:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGuk0Uyt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4417310E676
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732031920; x=1763567920;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HnscFmRQPlD7HXAuwGAp1SIFXGuk6zvXkWUfnUSx1qc=;
 b=iGuk0UytMWC+w/NzinBCk1YXEKEwGNA0+YSKQBQlTPS12osBQn1uR26g
 PxLDxiuJgBP8Tu+txIu5Heqlm7twvnfi/XyrmBHqm7840RYK8dyjEwGIj
 yaxR4VlfCMAu0rOWBeLIYI89lPrvzeEjfbM2qkPbEZtHRX1QxTIH0Pk4n
 JnEI2Jq3gVuiFiiuv5Lvwa32V8j+7Ks3JCEMXiuCKwoPz/5PeUst41PCx
 9pLI2i9e91+WyI9ml5zgcBuN87s2Y1c8Kl6/suwN5g3WHHNp2wL8JwP01
 u48x0QTHfHkqimC0+d7FaoMGdBbt8sJzlyxOlabLd5r0cpdNUCZ+ZICyt w==;
X-CSE-ConnectionGUID: gAFAXG+NTMi++fZk1tSBPg==
X-CSE-MsgGUID: 5wAiQTL9Sv6miH6v+Eu8HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42554206"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="42554206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:58:40 -0800
X-CSE-ConnectionGUID: mHMtyUCmS/SoMdjud9d3zQ==
X-CSE-MsgGUID: SIpu2zF/RRGPp7xN1MgGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94057381"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 07:58:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 07:58:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 07:58:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 07:58:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6nd5HfEV+x5xFMxiyYZSFYHz6hN65SEEJcr7CjXMpVUtGA7qW5EfyBuGC5f66DG0PgIt7ebsE/ReoE5aUQVZw4kFF4uBpDV9cBQazFtL3A/ke1RoQ8nnA+vJq6Wam+CTsC5Wqj6bAmf74ZVQI7ZBX0Kp3U9zwKdtteT/LaOgVGCkT61CdW0+UvN5vTdl0bACf4ScHi2GZc3JX4HaBag8HYmVoKOVPzJpz5gBvFV4nhupcGEXbIuP1rsgtWleuE1GTpaejcpyn1IJ226ELwJBT7mxieunjdolKLz48kCDbiA1LzTOV/P7ovuHbaeoGdBZ/624xJRnHo/Ays9NTgXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsOxvrfq4L6mrW6QYAQUq1s6WWbt3gm9RmT5k9dMbqA=;
 b=YaZeRRZdsNELGIS5sBkrLmCHCU41OYJPSYc4z1OSEiJajCglzd70Gw59JbiyNPCg1tLTxeMTCBTSUULqpuXz84Q+kY3+gcAAre1UbHQA3xPGO2oZumrJxyLTBBNk9ANzUJ6vn4f6GZJbeiUuiEDKSVDBnIZGfcFWahguKIsk9pWMEeZ8tMAD15D6In8XdJj60UkOeQfjUFM9xSPUcTuUYnbOiULVfwmxrUTZFgaQ6i3KqQyZqDK4KPvPyyvwBrhGZxi7XxryTpLkU6qgHuIlb0DgXsnd/ZfqEhPK5T1RA2VyA+BL+L0k/WLBJ9sufw8ijiGTz6BdfgFJ1u+jChB/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 15:58:35 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 15:58:35 +0000
Message-ID: <b010f47f-1819-4d4d-9bca-8871b2d29eaa@intel.com>
Date: Tue, 19 Nov 2024 16:58:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|DS0PR11MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: b77f739a-c0d8-4687-7a3f-08dd08b3064c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OU5kTUpkWXlmM0RFblVZRTJYaFp1MkhLYVhERFVOdHZIWE4ySURXeE5JTW1V?=
 =?utf-8?B?bFQweEJ0WjIxY1F3TTg1V0pkc293V0NVZWdhcXNnOXJOYVc2WFcwTzJNZHJM?=
 =?utf-8?B?d201VmdDNnRVaXZjNHFmQVQxWG5TNnV4TGxrcGU1RzhBZkxBdmFKZFhKUFdV?=
 =?utf-8?B?eWNXL2ZrVVpUeFRNSzZtTkN3ZlYrWUpjcklFQjJnN3UvNkRkR2RvVzFDYkZG?=
 =?utf-8?B?eWVlZXVGOXRXSHRmVnJPeE02U1A2eUFDcituYlRFUmpqakxHQXZMTWR4a00v?=
 =?utf-8?B?a3dWUDQraWdaaEp6TWNSOWVjNm1NR0wyM1FUL2llUGFRRjlhZDJjeURLNDVx?=
 =?utf-8?B?Z1lIdVd1MCtURkZ6MHlydUVoMUlyRzlRdWhZYUFaTlJqdVBKL1MxSkgyNnlu?=
 =?utf-8?B?Wmt2QXJ5U2I5WFVhWUhFbEh2ZEgvNE5QamhxTEkwRUZWbkgrbTNuZE9Jbm9L?=
 =?utf-8?B?NVpkU1c4MHU4TTNITEFBVWpMMk1JcXJNcnllZzR6dGNlUWxBb2g4OFgzK0lC?=
 =?utf-8?B?a01MNEQ0aXFHSjB1ak5ob3lFeVNmWSs4N3V2bkZad1B0TkdoVUJOUzQ1dlV4?=
 =?utf-8?B?alZ4V0FMZzg5dkRvTG5sVjZtZDdXdElaVThrVTNKaXdaeHY5TFBaRWlqSWYr?=
 =?utf-8?B?bmZZdjdickhJbFFBLzkzcjVZZFFEeWhoeDFPY3NnV3FBNVFhY2psOHFaaFJF?=
 =?utf-8?B?bDg2Q1lRUjB6UlBwR2xIZG45bG5qcWRvOVBRbXc3YXpuTnpqUm1iV2p6Sisy?=
 =?utf-8?B?Z2JkVG5UdStVWHlpYjYvcVcwRklEK3VCWGNIazl2cVgyMnY1ZmQ5dzBVRndB?=
 =?utf-8?B?QlRJeW9WZ243M3RWU2ZWZUpNSDFwMzRqZnpHbnRxQVBhcXdmZm5EYW8vWTRC?=
 =?utf-8?B?R2oxWXJ2dTRaY0lRaHpPcGlHeWlOSlNhYnBIcHJ2NFNWRWFYRlRhV1JDTXQ2?=
 =?utf-8?B?TXRHTExPWVJud3c1Zk5yaDNMWm5MWWh3UmxiaUpOd0tqRXdYazlXSndxbnZx?=
 =?utf-8?B?RU5yWlMwT1pCNHJUMDVOMnVNK2Vqakd5ekhQZTFxVDNla1ZISDZMMXBCZGxK?=
 =?utf-8?B?cVAyOTlVM2hmclh2OVp3QlVPRzdodG13dzMvR0FEblJpcFdONEh5bzkzWU9L?=
 =?utf-8?B?RGtXYTVqMWxvQ3Y3MlVmRGdXOUhtSW1rdlpPR1ExZ0lRd2h3KzhNZnJ6cUhS?=
 =?utf-8?B?QVYrMWFTWEFhQ2ZBR1Nta3BtaUpGNjlGS3RDWFkzb2Joc0RzUXhXQ0hrWUtj?=
 =?utf-8?B?RFB2YSttbjhDK2Y2bCtHSDI1QnFweUJTdGNvYVp4SW5kT1NBMWdZZjAwTGhI?=
 =?utf-8?B?bU9oS2lHZ0MwSGxJWFpkNDVURkg3Z1R6TE55eTdLZnNNekNkVXVFdHB6RUVZ?=
 =?utf-8?B?RUt4ZUI3YjRpeUlQMFhTNHpLMnJReTB6RE5PMExFLzRnRzAzZ2FDUnMxMjZK?=
 =?utf-8?B?Um5uM25aWjNoOHVUZ1gzNkVpN2xmNW1yZUtEdXBJOTlqTmphTnZmeFJBaWN1?=
 =?utf-8?B?NFpjck15Q04rZDFsWDVPMk9OQWQ4b0NBU1c4Mk4yNDVCSHVSd3NXOUZndjRH?=
 =?utf-8?B?bXRCb0VQTGNQWnRFM1JwUHAwKzZvWXlQUHRpWitWWmMxWmRjNHBGdXc5VHpT?=
 =?utf-8?B?L3BCUVN0VEJIZ0tFbTNLM2VISXZzTzFyaTRGcFBwZWZRa2orZ24rUFlUOG5l?=
 =?utf-8?B?ZmNSUmQ2cTN3eEtxUWxjNExjTmFzOEhyc3dMUDlsSHc1QXA0NW1CQW44WWZL?=
 =?utf-8?Q?qORGl+ZeeR5IXp0hOQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZMVVBYSllCWE1tcmR5Z2ZrbGdDUW1TZzlFTFc4T25yOW1Vd2NQcVczZkJx?=
 =?utf-8?B?eFI4VmY1VjdyRlc1NDRrV2w2ZS95cE9oL3JMV3dBQ3psc0p1KzUyRDNsNVhC?=
 =?utf-8?B?Snd2Mit1WEFWWUUwZHgwTnRjckZyVnRjck1YL081Yk1TN3R0bTZYTHBFZXR4?=
 =?utf-8?B?MHNCR2V2NERydTlubU1zRGsrNXlJblVpQ0FORi9JdHhDb0JtWFhiQzl2TFZD?=
 =?utf-8?B?NWpUTkJNd01qQm9JNHJLWUJHN2daSDRCVDZTY0Qyc28zUE9tbXJ5RG1Od0tD?=
 =?utf-8?B?aHRpNTQ3M21NTU8raTRiZHdRcW9rbm85V0FVRThRTjNOcGliVlRmditRSHBN?=
 =?utf-8?B?QXcvU1REaGViM0NuMWdKSlNzcEI3YzZsb0luZUNtZVYzU291VzE2NmkydWp1?=
 =?utf-8?B?enJCcFgwY0FXaUhwUlFxSysxZ0xkcTlsUHRhaFA0a3A0dFQxeWJKUnFXZVFu?=
 =?utf-8?B?SEt4YVZKdCs4K0ZnbGdhWlNiQ1ZCMmRDQVN1Ny9aMGVIMDhSTUtxR0twVG9n?=
 =?utf-8?B?US9qb3N2TnBCd2d6ZHZralNMa2FwSmMybkVHU2I3WUs4aXJRNFkwQUlQTTlR?=
 =?utf-8?B?NXRaazMxWmZrRWpkbHZBckozWU5aYkhCQnNIMmpsbnIzSE5PaEdpYjQ0N2lm?=
 =?utf-8?B?cEd5ZkwvUVNGa1o2bDdUZ0pOZ0R5REpteFVxVDcwa2xTWHEzMGpQbWFmYXhu?=
 =?utf-8?B?RTB5OGRMcEtYaTdaVTUvOU4zL0xiMExuVmYvcktPY3c0ajFDS2U0Y3pyUXNx?=
 =?utf-8?B?TzZOdWRhOWJSS0g3c05DTHljLytHNXF3Z3VURzVENUlWbWQ2b0puMEcyY1d1?=
 =?utf-8?B?eCtxN053ZHU4aWpiWXhwZFlpWkhWOS9sUFNMTXhHT0JpQ2tLQjRNZElCVVk3?=
 =?utf-8?B?ZU9lZXFWcXo3ZmdoUUJmZ3pZSHJlcUtCTHV4N3NmVFB6UVcvRm9aanZGN3Iv?=
 =?utf-8?B?Y3dqNjBGZkJaNnVTdzcrenIxaUlGSkx4UnBBdGxZcG4wTmVoQ3lEdVV4d3Fu?=
 =?utf-8?B?VThOK2kycVQ5L3FQKzhRMVMvSUl3aEQ4dEpVcDNRYm12U0M0Q2tDVU4vcG5L?=
 =?utf-8?B?RWJUcURtNktNNlZsb3g4cGg5bHNWNWF0Qm9ZTlU5RGY2eG8wb2M5WHRHdXo0?=
 =?utf-8?B?bHkzTE1XcE53QnU0QjVhamFoVmhkekRzelBQclZLSllDVU5rM0pudDB3T0tj?=
 =?utf-8?B?ejNtOGtseTlSbmxuYk9kTFJFcS9tUzNYdldFTnIrUGhnaTdxa0NGcVdneUJz?=
 =?utf-8?B?aWZYUE1iRFJGRDh4ZTN6anpNOXBpSHcrZ3kzTlJJa2VzOFYyN3kySlIwK3h6?=
 =?utf-8?B?ZG1aekMzNW1yak9MWkhRaGI0Wmo3RGZ3NHpsSGtCWXR0L0xvdjFHZFBhUVJs?=
 =?utf-8?B?Nm5CY1pZclVYakNONFNUWnU2K0hFb1gxT2NQdC94S054cjF3T1BxeXJsbDJo?=
 =?utf-8?B?cUVhOTVBZDJ6TE5DQWp2T24xRUxNYXRmc0J0VktSdDFSc21veUVEdDd5cmli?=
 =?utf-8?B?SjZJWk4zT3RMb1R6ZnYrMlIrOHVuMzE3N3lPOFRGRFg3V1JNYmNNSTdOc0pW?=
 =?utf-8?B?eXVUQlFWVnc4SW5tc0UycXFHUTN0L09QMTJMVkZHWmdBVUVpNUZYUGIwNXJ0?=
 =?utf-8?B?SDVkRVlDeG1EdFp2cDBaZ0p5Vmg2ODhpMXZBYW84R01UbURFZTh5ZzU2SmtX?=
 =?utf-8?B?NE8xb0Z2aVgwUTF4RUpUTHhIVHU5L0hMOHhHMEZEUUthZ3dKQWt6Q1h1T011?=
 =?utf-8?B?eEkwcTdTZ3VyT0NvNGcyV2N4NTArTkp5MVhZbmh5bjJzYkhuME4weWZXdWZ3?=
 =?utf-8?B?dkU2YnJ6dzBGemY2M1IvamlXTGh4WlRkY05rY0N2d0srMVFBazMrbmhFWWs4?=
 =?utf-8?B?YnJ5eHB4TlcxZGhSS1FvS2MwVHVYWVFSOVlnMW9TNmg1UmVxMVFkOSttQml1?=
 =?utf-8?B?UmdCYThsWWh4c1NydmRlWTJ3VXVlZ3krVFJINnNkdnh4T1NCb1VSbEthaTR4?=
 =?utf-8?B?UW5sL0k0WERYN0NsZG5CWTlFVHlvNm9vekxBNkJVcHNFM2ZTWkdtTHhLMWp0?=
 =?utf-8?B?a2dqdldkUExHajBJaHo5QW1HY004SmkyNGtQQVpxcHhQRFZteEtkTzNlUHFa?=
 =?utf-8?B?YVJkenovK0hxMG5hU2ZhY1FFM2NlamRGQWxSb1FnbmpKTHFMdTdCUi8wWmdv?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b77f739a-c0d8-4687-7a3f-08dd08b3064c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 15:58:35.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EStAePpP7YaECvNYf3BdYeN5Sg8UBahTW5GVSKudh32xIpgXdhYdfaaKAxtSF9RWt2GM1+96XTRSyFwNZyRVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
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


W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
> Add read and write pagefault tests to xe_eudebug_online that checks if a
> pagefault event is submitted by the KMD debugger when a pagefault occurs.
>
> Test that read (load instruction) and write(store instruction) attempt to
> load or store access to unallocated memory, causing a pagefault.
> Examine the address causing the page fault and the number of eu threads
> causing the pagefault.
>
> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 219 +++++++++++++++++++++++++++++++-
>   1 file changed, 215 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 0ef0d8093..eae0eb520 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -36,6 +36,8 @@
>   #define BB_IN_VRAM			(1 << 11)
>   #define TARGET_IN_SRAM			(1 << 12)
>   #define TARGET_IN_VRAM			(1 << 13)
> +#define SHADER_PAGEFAULT_READ		(1 << 14)
> +#define SHADER_PAGEFAULT_WRITE		(1 << 15)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -45,6 +47,7 @@
>   #define TRIGGER_RESUME_DSS		(1 << 30)
>   #define TRIGGER_RESUME_ONE		(1 << 31)
>   
> +#define SHADER_PAGEFAULT	(SHADER_PAGEFAULT_READ | SHADER_PAGEFAULT_WRITE)
>   #define BB_REGION_BITMASK	(BB_IN_SRAM | BB_IN_VRAM)
>   #define TARGET_REGION_BITMASK	(TARGET_IN_SRAM | TARGET_IN_VRAM)
>   
> @@ -61,6 +64,8 @@
>   #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
>   
>   #define SHADER_CANARY 0x01010101
> +#define BAD_CANARY 0xf1f1f1f
> +#define BAD_OFFSET (0x12345678ull << 12)
>   
>   #define WALKER_X_DIM		4
>   #define WALKER_ALIGNMENT	16
> @@ -123,6 +128,9 @@ static int get_number_of_threads(uint64_t flags)
>   	if (flags & SHADER_MIN_THREADS)
>   		return 16;
>   
> +	if (flags & SHADER_PAGEFAULT)
> +		return 16;
> +
>   	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>   		     TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
>   		return 32;
> @@ -179,6 +187,16 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
>   		gpgpu_shader__nop(shader);
>   		gpgpu_shader__breakpoint(shader);
> +	} else if (flags & SHADER_PAGEFAULT) {
> +		if (flags & SHADER_PAGEFAULT_READ)
> +			gpgpu_shader__read_page_fault(shader, BAD_OFFSET);
> +		else if (flags & SHADER_PAGEFAULT_WRITE)
> +			gpgpu_shader__write_offset(shader, BAD_OFFSET, BAD_CANARY);
> +
> +		gpgpu_shader__label(shader, 0);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> +		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>   	}
>   
>   	gpgpu_shader__eot(shader);
> @@ -217,6 +235,17 @@ static int count_set_bits(void *ptr, size_t size)
>   	return count;
>   }
>   
> +static int
> +eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, uint32_t size)
> +{
> +	int count = 0;
> +
> +	for (int i = 0; i < size / 4 ; i++)
> +		count += igt_hweight(a[i] ^ b[i]);
> +
> +	return count;
> +}
> +
>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, uint32_t value)
>   {
>   	int count = 0;
> @@ -636,7 +665,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>   		}
>   	}
>   
> -	if (d->flags & SHADER_LOOP) {
> +	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>   		uint32_t threads = get_number_of_threads(d->flags);
>   		uint32_t val = STEERING_END_LOOP;
>   
> @@ -746,6 +775,43 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   			data->single_step_bitmask[i] &= ~att->bitmask[i];
>   }
>   
> +static void eu_attention_resume_pagefault_trigger(struct xe_eudebug_debugger *d,
> +						  struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
> +	struct online_debug_data *data = d->ptr;
> +	uint32_t bitmask_size = att->bitmask_size;
> +	uint8_t *bitmask;
> +
> +	if (data->last_eu_control_seqno > att->base.seqno)
> +		return;
> +
> +	bitmask = calloc(1, att->bitmask_size);
> +
> +	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
> +		       att->lrc_handle, bitmask, &bitmask_size);
> +	igt_assert(bitmask_size == att->bitmask_size);
> +
> +	pthread_mutex_lock(&data->mutex);
> +
> +	if (d->flags & SHADER_PAGEFAULT) {
> +		uint32_t threads = get_number_of_threads(d->flags);
> +		uint32_t val = STEERING_END_LOOP;
> +
> +		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
> +				     data->target_offset + steering_offset(threads)),
> +			      sizeof(uint32_t));
> +		fsync(data->vm_fd);
> +	}
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> +						    att->exec_queue_handle, att->lrc_handle,
> +						    bitmask, att->bitmask_size);
> +
> +	free(bitmask);
> +}
> +
>   static void open_trigger(struct xe_eudebug_debugger *d,
>   			 struct drm_xe_eudebug_event *e)
>   {
> @@ -1015,7 +1081,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	struct intel_bb *ibb;
>   	struct intel_buf *buf;
>   	uint32_t *ptr;
> -	int fd;
> +	int fd, vm_flags;
>   
>   	metadata[0] = calloc(2, sizeof(*metadata));
>   	metadata[1] = calloc(2, sizeof(*metadata));
> @@ -1025,7 +1091,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	fd = xe_eudebug_client_open_driver(c);
>   
>   	/* Additional memory for steering control */
> -	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
> +	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
>   		s_dim.y++;
>   	/* Additional memory for caching check */
>   	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
> @@ -1045,7 +1111,11 @@ static void run_online_client(struct xe_eudebug_client *c)
>   							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>   							   2 * sizeof(*metadata), metadata[1]);
>   
> -	create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
> +	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +
> +	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
> +
>   	xe_eudebug_client_exec_queue_create(c, fd, &create);
>   
>   	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id, bb_offset, bb_size,
> @@ -1245,11 +1315,14 @@ match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
>   static void online_session_check(struct xe_eudebug_session *s, int flags)
>   {
>   	struct drm_xe_eudebug_event_eu_attention *ea = NULL;
> +	struct drm_xe_eudebug_event_pagefault *pf = NULL;
>   	struct drm_xe_eudebug_event *event = NULL;
>   	struct online_debug_data *data = s->client->ptr;
>   	bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>   	int sum = 0;
>   	int bitmask_size;
> +	int pagefault_threads = 0;
> +	uint32_t *ptr = NULL;
>   
>   	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>   					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
> @@ -1265,6 +1338,16 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   			igt_assert_eq(ea->bitmask_size, bitmask_size);
>   			sum += count_set_bits(ea->bitmask, bitmask_size);
>   			igt_assert(match_attention_with_exec_queue(s->debugger->log, ea));
> +		} else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
> +			uint32_t after_offset = bitmask_size / sizeof(uint32_t);
> +			uint32_t resolved_offset = bitmask_size / sizeof(uint32_t) * 2;
> +
> +			pf = (struct drm_xe_eudebug_event_pagefault *)event;
> +			ptr = (uint32_t *) pf->bitmask;
> +			igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
> +			pagefault_threads += eu_attentions_xor_count(ptr + after_offset,
> +								     ptr + resolved_offset,
> +								     bitmask_size);
>   		}
>   	}
>   
> @@ -1279,6 +1362,9 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   		igt_assert(sum > 0);
>   	else
>   		igt_assert(sum == 0);
> +
> +	if (flags & SHADER_PAGEFAULT)
> +		igt_assert(pagefault_threads > 0);
>   }
>   
>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
> @@ -1302,6 +1388,55 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
>   	}
>   }
>   
> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
> +			      struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_pagefault *pf = (void *) e;
> +	int before_threads, after_threads, resolved_threads, pagefault_threads;
> +	uint32_t attn_size = pf->bitmask_size / 3;
> +	uint32_t *ptr = (uint32_t *) pf->bitmask;
> +	uint32_t offset, before_offset = 0;
> +	uint32_t after_offset = attn_size / sizeof(uint32_t);
> +	uint32_t resolved_offset = attn_size / sizeof(uint32_t) * 2;
> +
> +	before_threads = count_set_bits(ptr + before_offset, attn_size);
> +	after_threads = count_set_bits(ptr + after_offset, attn_size);
> +	resolved_threads = count_set_bits(ptr + resolved_offset, attn_size);
> +
> +	pagefault_threads = eu_attentions_xor_count(ptr + after_offset,
> +						    ptr + resolved_offset,
> +						    attn_size);
> +
> +	igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
> +		  "resolved=%d, pagefault=%d] "
> +		  "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
> +		  "pagefault_address[0x%llx]\n",
> +		  pf->base.seqno, before_threads, after_threads, resolved_threads,
> +		  pagefault_threads, pf->client_handle, pf->exec_queue_handle,
> +		  pf->lrc_handle, pf->bitmask_size,
> +		  pf->pagefault_address);
> +
> +	for (int idx = 0; idx < 3; idx++) {
> +		if (idx == 0) {
> +			igt_debug("=== Attentions before ===\n");
> +			offset = before_offset;
> +		} else if (idx == 1) {
> +			igt_debug("=== Attentions after ===\n");
> +			offset = after_offset;
> +		} else {
> +			igt_debug("=== Attentions resolved ===\n");
> +			offset = resolved_offset;
> +		}
> +
> +		for (uint32_t i = 0; i < attn_size / sizeof(uint32_t); i += 2)
> +			igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
> +				  ptr[offset + i], ptr[offset + i + 1]);
> +	}
> +
> +	igt_assert(pagefault_threads > 0);


Why not checking if pagefault_threads  == num_of_threads ?

I am not sure what is worth checking else, I wonder if we couldn't for 
example cause only some of test PF and check if they are reported correctly.

Regarding the flow I see nothing suspicious, AFAIK.


Regards

Andrzej


> +	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
> +}
> +
>   /**
>    * SUBTEST: basic-breakpoint
>    * Description:
> @@ -1383,6 +1518,77 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
>   	online_debug_data_destroy(data);
>   }
>   
> +/**
> + * SUBTEST: pagefault-read
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a read pagefault.
> + *
> + * SUBTEST: pagefault-write
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a write pagefault.
> + */
> +static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
> +				  int flags)
> +{
> +	struct xe_eudebug_session *s;
> +	struct online_debug_data *data;
> +	uint32_t val;
> +
> +	data = online_debug_data_create(hwe);
> +	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> +
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
> +					open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
> +					exec_queue_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_debug_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_resume_pagefault_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
> +					create_metadata_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					ufence_ack_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
> +					pagefault_trigger);
> +
> +	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
> +	xe_eudebug_debugger_start_worker(s->debugger);
> +	xe_eudebug_client_start(s->client);
> +
> +	/* wait for workload to start */
> +	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> +		/* collect needed data from triggers */
> +		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
> +			continue;
> +
> +		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
> +			if (val != 0)
> +				break;
> +	}
> +
> +	pthread_mutex_lock(&data->mutex);
> +	igt_assert(data->client_handle != -1);
> +	igt_assert(data->exec_queue_handle != -1);
> +
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	xe_eudebug_client_wait_done(s->client);
> +
> +	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +
> +	xe_eudebug_event_log_print(s->debugger->log, true);
> +	xe_eudebug_event_log_print(s->client->log, true);
> +
> +	online_session_check(s, s->flags);
> +
> +	xe_eudebug_session_destroy(s);
> +	online_debug_data_destroy(data);
> +}
> +
>   /**
>    * SUBTEST: preempt-breakpoint
>    * Description:
> @@ -2344,6 +2550,11 @@ igt_main
>   	igt_subtest("breakpoint-many-sessions-tiles")
>   		test_many_sessions_on_tiles(fd, true);
>   
> +	test_gt_render_or_compute("pagefault-read", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
> +	test_gt_render_or_compute("pagefault-write", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
> +
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   
