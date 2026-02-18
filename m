Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EEFE9A03B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 04:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAAB10E546;
	Wed, 18 Feb 2026 04:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJEt2svw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582DD10E546
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 04:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771389954; x=1802925954;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdTp8El7ob4c2pxFkdpVHsP5n4jU7Xsuv0osiDO8sNc=;
 b=UJEt2svwBfbKOPFddEJ7hkAc6WnXcks4rEa1DMq4lUZBxFX6+sulBgbF
 Uy+Rasz3lYPJOTfNf3MuZEC+UrUbexGTxnolEw3Y9f1Ax42/YVctFjQfd
 L5MwfRMyTAIRTaYUusCayC9m39gJUgsawfsX3MBXdFVKvwzI1mGXQIiOH
 4Qxu/8xu4IEHPOhGYWXsS+rxb3fHGe7DXp7OMDuCx5ZFU/ibMc4yYC3IZ
 ujCA32av+FcmeCnkUF4ixEiHWYsqKPt/G3h3RjdKNKan41dLG59adhuOa
 42gEPQ5rJBkXYvvw9opbsFXW5VRt5pPcQLfPaRVJKH4luWYFF3lO6SWvu w==;
X-CSE-ConnectionGUID: YXu12DdbTvOzxkjMj87DGQ==
X-CSE-MsgGUID: e3lttdzwRDOzlHRB/KhCNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83571489"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="83571489"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:45:53 -0800
X-CSE-ConnectionGUID: 26kAqmIETfa9kMcd+uC7fw==
X-CSE-MsgGUID: OGmh2iu5SsGlKc/fawSFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213937106"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:45:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 20:45:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 20:45:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 20:45:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/ZZSl8VDaCcYuab+45tXyqCdeUoKJa3mst6S5Jl/8NGupaUYaU2yAxA8m5LIlaRGTEwYcVZl+JyUMpbKSX6yze4rv6IZ+YMamD8fV5lhjWrdvu/bWhFgt/7lGie8dD4BztsYU3aGJApKiiAz6AI+c2F/dCCnFMHy6GNaD58kdIbE+Y/CUxGlkglm+wywqT+EVJMbWBqZm7UQA7nWPb1kbWTKuqVA47sH1HnZzdplORWD3PMvJYG8Q/5mnmtziDhMboFtOQagLbvfIcQYjDNmZ2cHdIbBkzDE7KerCa26XzCfdABCCcs2ul7WQsmRp07BCOGMxNgjVeDaHoa8QoJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIMyG7oko+JrwZeR8dx+Jq7dFrhlc7LdD+fe+GG/xuQ=;
 b=RZ2i5kK4q0k0TfDsSaqoObtj70t7lFElN/yvfanZhqroLgEKXjQOHX7CR8nC/fVk+p0BS47XPtZkV/LwAVH8va0SsrwGzChjtbDIv+80uCDOFdQfqF4QBl8S8HsJr8bRWKeTJAGFBKzHAVSIAMiKNa3Qg571MNLVDziACqPSbahl5MMsay2mINV9vXcpMyVwxEaRImTGha4nnN9YYVTA/pG6tcuaGhcxVK3CuPvLs2qqdtfFvA/P8FxZw85u87b1K05Xp8aT/0jXnlsiL511dEJYofQ8IOsaM+NB4NcxaJyBZWEVwma9YlP/45Yy24SU+RtCDZ0yA65EUbiwwN0u3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 04:45:48 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 04:45:48 +0000
Message-ID: <c22faab7-1829-453f-8c4a-ae5fb1a970af@intel.com>
Date: Wed, 18 Feb 2026 10:15:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Fix framebuffer
 management
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260128054617.817010-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260128054617.817010-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d2b454-c1af-46a6-7daf-08de6ea895c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVFZNFdocmJnME02cEVWdndPZCsycStOZnoxZGN3VVFDTzhjbUZwV3pvVGRl?=
 =?utf-8?B?V2dxdVdRaGtSTXVmQXN6V29HWFlnZXFpbE8xMlpzMTFGbnZSUVdNQnNjVW0y?=
 =?utf-8?B?WmRsVE1CY2xSUFUzay9Ua293OVdtdWR2S3BFdmlZMDZOUDRuaXFCR1NQRitv?=
 =?utf-8?B?amJRbUlsWmg2UFhaUzJFWlN1KzhFN3UwS1J2NUtUV1JRTHlDQlFJU1U0TlU4?=
 =?utf-8?B?WjZNWnlBQ3FWdXBuVUpnMTRxSkFjMzBpeGJTRlZFTi9sZ3NiakZ4YXdBaktr?=
 =?utf-8?B?OHE4MUlsTUowcUFQRUZBRmtkcFFxNzFrTW00eWU0TVZYYmhyKytIaTdXQ3p5?=
 =?utf-8?B?RXpQc2h4dU9tUm1XajdPUTZqZGJ6OWxGSy9EZm51Q05uZ0QxcHcxeWF1bDUz?=
 =?utf-8?B?bkpEa2VXcTg3UG9SWFJJbDlOM1huQzNuMktMYnYzMmV0b1VNVDBxSUh5RUp0?=
 =?utf-8?B?QXZCQjJNNnV4M0Z1dEQzUTJWZ09sa0p4QjVTNjViRFZCdVZSRXVmSTRZTEp6?=
 =?utf-8?B?VW44MmRZMkJncnN5czcvaGNZQTZqSFRLTFkxZXMyNzV2dWVZTG1SNDJIZVpB?=
 =?utf-8?B?UDFKUlI3UVNwSSszeko2b3pEdms0RDhVSlAxVkZrcEFnRHhWVlRqUjR0QmhP?=
 =?utf-8?B?RFZ2S1R3L2FHRS9tb2hiTzM5ZURHQmZpUUpYTnBsYkc0RDZnVkgvNk9XbW05?=
 =?utf-8?B?clFOcmxrVVZDY05uQkM0OUJFVmNoMkV0dnl4ZlpoYWx6YXZwaURQcytycG1V?=
 =?utf-8?B?TkpFWTVBVUQrVU5qdnloZGFWSFJtYndpaHdaTUUzT2lDcm5KZFVBMEdxZzg4?=
 =?utf-8?B?Ymw1eGVYK3A4eVQ2b0h5ZktWN2FJUitVNGRqdFg4QkFBYnhTYms2YWlkYVk3?=
 =?utf-8?B?OWNKOUZlQUVEQTVLelhXaUpVNTMrbWZ0SWtFb1o4OU12bDZ0aTk4S3BaYm5D?=
 =?utf-8?B?M1VmY3VhRVRqSGtvRnhTaG9wOTZ6S2l5VmFkNXpIS0Z2QTUzQ1pLd3FXRXE4?=
 =?utf-8?B?ODBqNzZxR1B2VkI2bTU0dTNxYmQ2dHA2b0lqYkljN3ZJbDQvbEJtUVhybTI3?=
 =?utf-8?B?MXN1c1dseVlvNkxUcHlLTEpZYldWbHVVYVdmWnNUY2k5N2tGbkNLemQ1Sk4x?=
 =?utf-8?B?Z3NRNkp2NllEWm9oVHk1c1ZtaWMrSkVnYmdrNzRtTUorNDg1bFUyMk9CdjdQ?=
 =?utf-8?B?WkRHMmxFVzROcnlxLzMvSHRHeGdJWGMySlhJVENKRE42ZFR0R01KQTdINWFR?=
 =?utf-8?B?UGRxRisybmlRTjJnR1BZQkYxdHdmeTdLZUc2NEpPenRyVzNhczVZdjU1MGxW?=
 =?utf-8?B?bDBHakI3dS9IbkIwRjFLV0I4d0JLbU5xT282Z09OdFBiSEcyM0g3LysrVXRj?=
 =?utf-8?B?Nk80eEphMFZOR05kRmlLUmxvZllyNnNLOFNIVHYwMXE3b05PWi8wNzBub1Zt?=
 =?utf-8?B?c0J6clJlTUpoWGpEL3dlUkI4TC9RKzVaNEJkNnU5aVlVTmZjOEFWUUJyWTBP?=
 =?utf-8?B?b0xuZGtUdzZKUU1vY3JZV1hER0J3UWU2eElPQlNoejZpaVROQUliZjNUSVVI?=
 =?utf-8?B?cG52NWRMWmhTNG95QUNubmo0ZmcwbXQyNDJNamxxOEJWSGI2TEp0a2xHR0xo?=
 =?utf-8?B?dmc4eDBMOG1ZT203SWVYRTlFYWxCenZPQ3p4WWpPT2l6a1hZZGt5dG5MSWFk?=
 =?utf-8?B?TitjZGRYcjQ3a2ZBRGM1LzcyNWxILzYzOThjWkpLVFdZS09ncXZKRVE5U3A3?=
 =?utf-8?B?YW5qWkYzbkFBKzVQaktqUFNzNUhMNTl3NVFyY2FHNk8rT0c4SDRNTEhhMUw0?=
 =?utf-8?B?OFd2MWpKSU1SSFlGc0M3Q0RXUnpNakpHbFMyQzJnQWxVSmpFS1R4azBUQkdI?=
 =?utf-8?B?U2owTmcyY3d0aHJJMmd6T1pnZ2ovc1pEd0lIelhPNno3VTMrUHNJNTljd1hv?=
 =?utf-8?B?dUZ4eFQ0Sm1JVXQ2aEZnN2pTYlBLSGw5NWlIN2ZpQXVoZm1RdFhXQUNxVGlh?=
 =?utf-8?B?bWJMRGY0N3BYY3BqUDZqd0h4L0tDOGd5c1N6RWJwbS91M1I4WFduV3ZXakNC?=
 =?utf-8?B?dnJ5MWhMYlFFK1AxK3Q1OXlyRUYyRnoxcDNtejJGSmJKMG05djdIK0w4SFU0?=
 =?utf-8?Q?UgDw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VC9zZVBXMWhkNFN2K1UzcHhyUUVtdlMyUW8yRy9sTjUrV0pnVCt2NnluZ3pV?=
 =?utf-8?B?MzJGNUgrOXpUQmMySC9LZGY2bG40VmVFeGkxMHk0UlZ4cmpXclVLUGRGT050?=
 =?utf-8?B?NURwSER2R29kR0pPWisyckNWSktQemJjcmRjYnVEeUxCY0hGUXJTTHNYRW1W?=
 =?utf-8?B?UTVIQWNLR1drdW5zYjNFKzJPYzN6aVl0L2RqOEF1a1FoTVg5TVlNREFQOEkw?=
 =?utf-8?B?dnB5MXBzb2c3WjhHNzJhYzVLb3JHZDJyM1QwdHo1YlkycGJrVjdZV25rUURH?=
 =?utf-8?B?TzR2enV1ekw5YzRjd05QMTBKcWVBcGZ1WDNiSHZMc3QzeWxsL1JwYTJCYThy?=
 =?utf-8?B?YkJtMVcvYjN6L1NWSDVrQ1pVVjBBQlBCeElhNlZodlkyU3h6UEFzZnZyekdJ?=
 =?utf-8?B?THh3Q29iRlN2RjdFU3laekd3bkN1WER4ZHBBcHYwVUxyVVpRemtOUkJEdjFZ?=
 =?utf-8?B?QUI0R2ZEdS9rNklJd0xKTUpHOGpZREJkNjBoWFlqTzJBd01ZdWo4NVRjUk9v?=
 =?utf-8?B?RlVHMVhKdTUwVWxjdUM3Qkp6MkpZUVBhSmhrdXV5dHdvVzNCeEMzRzRLUzl5?=
 =?utf-8?B?WmFrTFJ1WWxJM0drWHJBenRyNS8wRExCNnFybXRQUVlwaDR1cEFVMTVJZ2E5?=
 =?utf-8?B?OXkzUTd3TGY1Sytua1JsRGhoWkFvZnh0WER3ODE1Q1BmRWIxVjdGMm1rRzkz?=
 =?utf-8?B?UFJQbytDOXNmY1pWKzZ6WGY5NlV2U3ZpNGRZaURxdDUyTXpFN2p3SVFhREFr?=
 =?utf-8?B?KzJvbVZiZlUyRnE1Wmt6MnBZdXNsNWUrRmZvK2FRZGFpU2ZWWTI2YzRHZ2hi?=
 =?utf-8?B?Q2RTNFF6TkF2L2h1NDNqZkhvRmRXTWlPTVpBK2JYUnVCNHc5MThLTjdjcmd1?=
 =?utf-8?B?VTZvaENHSUdaajNRQVpnaEpscVR2RWJ2Y1RqSDY0VE54WloyTHQ2eGVHeTN6?=
 =?utf-8?B?Z2Vxc29OcTAyYURROHJvZmUzMXlHSWlUZ09LbnhlUkg4NGpoMlN5bk1oZ2lM?=
 =?utf-8?B?V3ltRDhrcldRVlhnbGdNQnp2QlRZZVVXVUxWQlJHYTRnTnBFVWE3OCtJeWt5?=
 =?utf-8?B?ZTZHd1ZnWGI5V1BrVnVvUXBFSnI2N0JyN0NMejg4SXVteUl4QzZjOVJZQ2pp?=
 =?utf-8?B?RUErK3NqNTRKd005ek5rSzY1U1FJaTRHbTJLQU9xTjdJdHhVdUU2UVVCeEI4?=
 =?utf-8?B?dVVXRGdHdlU0RmtEaU1scTBDaU0yM3F6d1pIazhMK1FvYlJEeExDK0FZQTRi?=
 =?utf-8?B?ZFZDdHMwN0lPcnQ4RFNnZDBuZ1RWamJtN0xqNHR5S3BjWU1ra0c1dVZURGJB?=
 =?utf-8?B?NkQybVlIQ09MeXhYUVB2NXR5alluL3IrMS9SUmNSaG1jVmhFbDJobXZxcUhW?=
 =?utf-8?B?UUgwclIvQndNcjd0cnJzOWlJNTcwVnJOa0orLzh3eDkvc1BMaXUzMzdEK2Zm?=
 =?utf-8?B?SEN3WUNlditZWlcvLzdwMkNqUVlsdFcrQXRKZTNPZDM1Uk9kaUE4NlBSOEV0?=
 =?utf-8?B?UytsenozcWtGMmlYZnBMWVNQdmZFV3pveWJBWWFXMHgvMkd5MlVwZ1B0cExF?=
 =?utf-8?B?UitLMGdiUDFyLzQ2WlA3NUdFWEFMc1hQUEJxQWFhRmJkb2VUYkV2d3VOU0RP?=
 =?utf-8?B?NXMzZEdXNXZtMlhIdzczRVJ1VUkrZ0VqNk01c3pxenpqdEtsb3JoaG5kem93?=
 =?utf-8?B?eG83bEU2MjlIREw2L1dldTdTNmJJaU9RdWRiVi95aEt4ZTB2UlhsTDh5YXMv?=
 =?utf-8?B?U1JmK0E1cmJoR3doZm1mSFRzeHo0YTI1Uk1PK3dsLythUnNGY2pvZGZhVXVs?=
 =?utf-8?B?cmxTU2c3YjZRMndmNC9CenNtdlNId04vUHQwOTVtRWlUWGpPajc1clQ5TUZ2?=
 =?utf-8?B?OWxwa1ZUdk1KUUFxY0wxRjBwN3J6elV5emNTa0Zpbm54cit1enF6UDgzWk1u?=
 =?utf-8?B?YTZoUUJiNXZ3SEpRdzRDcUlBdFBsbDh2djJHNCtQK1JYYmViaW0zckxxc2Ro?=
 =?utf-8?B?RG1BYVBNQlBnUVIwSWdTbStKK09ZTEg0RUtNL0VxSHljY0M5bkdNdDNUaW56?=
 =?utf-8?B?dGNNRmlnQlBZZVVSTTJmOEhjZ3JFMjdOWUFkWnJpaUJVdTJXOHFZVWNZNmFl?=
 =?utf-8?B?RXA2U2p0aXJqT0I2SlhnMWE2bVQyT0RpalhsY0R4clRUWXdORCtNS1ZKZ2l5?=
 =?utf-8?B?QUdpUHh5WmFYaE5FNmVMZ0hqU1dMOWljcDdmajk1K2lnT2VwbS9WOG8rM0Ir?=
 =?utf-8?B?VGZxYkJzUGVxWUtCTG54aCtLTkxQbnZmSTFGd3F1UGg3SjBXbzJkVitvVHBI?=
 =?utf-8?B?L3Mzd2ZhaGlmMTQ0WjJIMm5xNy90cjNqa0s2MElleXdKaHJvb2E3dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d2b454-c1af-46a6-7daf-08de6ea895c2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 04:45:48.2974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hAl3JJYe12zCBoD2+OBLcK5cejMlyCfRN9IQYW9jTDyYPlwr8jc6EGXCsJ2iLMDGuPWO73AUUEChUSTIdfHkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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

Hi Jason-JH,

On 1/28/2026 11:15 AM, Jason-JH Lin wrote:
> The framebuffers were previously created once at test start.
> On systems with multiple outputs of different resolutions, the
> pre-created framebuffer size might not match subsequent outputs,
> causing modeset failures.
>
> Fix framebuffer indexing to properly handle different resolutions:
> - Single output tests: Use pipe as framebuffer index
> - MST tests: Use valid output sequential indexing to support multiple
>    outputs per pipe with different resolutions
With a couple of minor cleanup fixes I've mentioned below, the overall 
patch structure looks fine to me for the idea mentioned above.

But one open/thought I've is, instead of creating/removing FB's multiple 
times in the test, could we create the red/green FB pair one per output 
(probably at the first need for each output) at the default mode, and 
reuse them throughout the subtest. Only when(if) the output's mode 
changes (mostly will only happen in MST override), we could recreate the FB.

This still fixes the current issue of just one pair of FB's for all 
outputs, but greatly reduces the number of FB creation and removals.

>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_content_protection.c | 150 ++++++++++++++++++++-------------
>   1 file changed, 93 insertions(+), 57 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 5928266f2fe4..e9f15e4cf22a 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -107,10 +107,15 @@
>   
>   IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>   
> +struct hdcp_test_fbs {
> +	struct igt_fb red;
> +	struct igt_fb green;
> +};
> +
>   struct data {
>   	int drm_fd;
>   	igt_display_t display;
> -	struct igt_fb red, green;
> +	struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>   	unsigned int cp_tests;
>   	struct udev_monitor *uevent_monitor;
>   	bool is_force_hdcp14;
> @@ -267,18 +272,19 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>   	mode = igt_output_get_mode(output);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(primary, &data.fbs[pipe].red);
> +	igt_fb_set_size(&data.fbs[pipe].red, primary, mode->hdisplay, mode->vdisplay);
>   
>   	igt_display_commit2(display, commit_style);
>   
> -	igt_plane_set_fb(primary, &data.green);
> +	igt_plane_set_fb(primary, &data.fbs[pipe].green);
>   
>   	/* Wait for Flip completion before starting the HDCP authentication */
>   	commit_display_and_wait_for_flip(commit_style);
>   }
>   
> -static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
> +static bool test_cp_enable(igt_output_t *output, enum pipe pipe,
> +			   enum igt_commit_style commit_style,
>   			   int content_type, bool type_change)
>   {
>   	igt_display_t *display = &data.display;
> @@ -301,7 +307,7 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>   	ret = wait_for_prop_value(output, CP_ENABLED,
>   				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   	if (ret) {
> -		igt_plane_set_fb(primary, &data.green);
> +		igt_plane_set_fb(primary, &data.fbs[pipe].green);
>   		igt_display_commit2(display, commit_style);
>   	}
>   
> @@ -320,7 +326,7 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   
>   	for (count = 0; count < valid_outputs; count++) {
>   		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.red);
> +		igt_plane_set_fb(primary, &data.fbs[count].red);
>   		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
>   					  CP_UNDESIRED);
>   	}
> @@ -338,7 +344,8 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
>   }
>   
> -static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
> +static void test_cp_disable(igt_output_t *output, enum pipe pipe,
> +			    enum igt_commit_style commit_style)
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> @@ -352,7 +359,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	 */
>   	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
>   				  CP_UNDESIRED);
> -	igt_plane_set_fb(primary, &data.red);
> +	igt_plane_set_fb(primary, &data.fbs[pipe].red);
>   	igt_display_commit2(display, commit_style);
>   
>   	/* Wait for HDCP to be disabled, before crtc off */
> @@ -361,7 +368,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	igt_assert_f(ret, "Content Protection not cleared\n");
>   }
>   
> -static void test_cp_enable_with_retry(igt_output_t *output,
> +static void test_cp_enable_with_retry(igt_output_t *output, enum pipe pipe,
>   				      enum igt_commit_style commit_style,
>   				      int retry, int content_type,
>   				      bool expect_failure,
> @@ -372,16 +379,16 @@ static void test_cp_enable_with_retry(igt_output_t *output,
>   
>   	do {
>   		if (!type_change || retry_orig != retry)
> -			test_cp_disable(output, commit_style);
> +			test_cp_disable(output, pipe, commit_style);
>   
> -		ret = test_cp_enable(output, commit_style, content_type, type_change);
> +		ret = test_cp_enable(output, pipe, commit_style, content_type, type_change);
>   
>   		if (!ret && --retry)
>   			igt_debug("Retry (%d/2) ...\n", 3 - retry);
>   	} while (retry && !ret);
>   
>   	if (!ret)
> -		test_cp_disable(output, commit_style);
> +		test_cp_disable(output, pipe, commit_style);
>   
>   	if (expect_failure)
>   		igt_assert_f(!ret,
> @@ -451,16 +458,16 @@ static void test_content_protection_on_output(igt_output_t *output,
>   	igt_display_t *display = &data.display;
>   	bool ret;
>   
> -	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
> +	test_cp_enable_with_retry(output, pipe, commit_style, 3, content_type, false,
>   				  false);
>   
>   	if (data.cp_tests & CP_TYPE_CHANGE) {
>   		/* Type 1 -> Type 0 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, pipe, commit_style, 3,
>   					  HDCP_CONTENT_TYPE_0, false,
>   					  true);
>   		/* Type 0 -> Type 1 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, pipe, commit_style, 3,
>   					  content_type, false,
>   					  true);
>   	}
> @@ -470,14 +477,14 @@ static void test_content_protection_on_output(igt_output_t *output,
>   			     "mei_hdcp unload failed");
>   
>   		/* Expected to fail */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, pipe, commit_style, 3,
>   					  content_type, true, false);
>   
>   		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>   			     "mei_hdcp load failed");
>   
>   		/* Expected to pass */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, pipe, commit_style, 3,
>   					  content_type, false, false);
>   	}
>   
> @@ -496,7 +503,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>   		ret = wait_for_prop_value(output, CP_ENABLED,
>   					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, pipe, commit_style, 2,
>   						  content_type, false,
>   						  false);
>   	}
> @@ -507,7 +514,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>   		ret = wait_for_prop_value(output, CP_ENABLED,
>   					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, pipe, commit_style, 2,
>   						  content_type, false,
>   						  false);
>   	}
> @@ -577,21 +584,24 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>   	return strstr(buf, "HDCP2.2");
>   }
>   
> -static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, int count, bool is_enabled)
>   {
>   	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
>   	int width, height;
> +	struct igt_fb *fb;
>   
>   	mode = igt_output_get_mode(output);
>   
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
> +	fb = is_enabled ? &data.fbs[count].green : &data.fbs[count].red;
> +
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> -	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
> +	igt_plane_set_fb(primary, fb);
> +	igt_fb_set_size(fb, primary, width, height);
>   	igt_plane_set_size(primary, width, height);
>   }
>   
> @@ -663,11 +673,11 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
>   }
>   
>   static void
> -test_fini(igt_output_t *output, enum igt_commit_style commit_style)
> +test_fini(igt_output_t *output, enum pipe pipe, enum igt_commit_style commit_style)
>   {
>   	igt_plane_t *primary;
>   
> -	test_cp_disable(output, commit_style);
> +	test_cp_disable(output, pipe, commit_style);
>   	primary = igt_output_get_plane_type(output,
>   					    DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> @@ -725,6 +735,8 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>   
>   	for_each_connected_output(display, output) {
>   		for_each_pipe(display, pipe) {
> +			drmModeModeInfo *mode;
> +
>   			if (!output_hdcp_capable(output, content_type))
>   				continue;
>   			if (is_output_hdcp_test_exempt(output)) {
> @@ -739,6 +751,14 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>   			if (!intel_pipe_output_combo_valid(display))
>   				continue;
>   
> +			mode = igt_output_get_mode(output);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    1.f, 0.f, 0.f, &data.fbs[pipe].red);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data.fbs[pipe].green);
> +
>   			modeset_with_fb(pipe, output, commit_style);
>   			if (data.is_force_hdcp14)
>   				set_i915_force_hdcp14(output);
> @@ -749,7 +769,11 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>   			if (data.is_force_hdcp14)
>   				reset_i915_force_hdcp14(output);
>   
> -			test_fini(output, commit_style);
> +			test_fini(output, pipe, commit_style);
> +
> +			igt_remove_fb(data.drm_fd, &data.fbs[pipe].red);
> +			igt_remove_fb(data.drm_fd, &data.fbs[pipe].green);
IMHO, this should be part of test_fini.
> +
>   			/*
>   			 * Testing a output with a pipe is enough for HDCP
>   			 * testing. No ROI in testing the connector with other
> @@ -843,7 +867,7 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
>   			igt_debug("Retry %d/3\n", 3 - retries);
>   
>   		for (i = 0; i < valid_outputs; i++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
> +			prepare_modeset_on_mst_output(hdcp_mst_output[i], i, ret);
>   
>   		igt_display_commit2(display, COMMIT_ATOMIC);
>   	} while (retries && !ret);
> @@ -865,6 +889,7 @@ test_content_protection_mst(int content_type)
>   	enum pipe pipe;
>   	bool pipe_found;
>   	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
> +	drmModeModeInfo *mode;
>   
>   	for_each_pipe(display, pipe)
>   		max_pipe++;
> @@ -890,7 +915,16 @@ test_content_protection_mst(int content_type)
>   
>   		igt_output_set_crtc(output,
>   				    igt_crtc_for_pipe(output->display, pipe));
> -		prepare_modeset_on_mst_output(output, false);
> +
> +		mode = igt_output_get_mode(output);
> +		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    1.f, 0.f, 0.f, &data.fbs[valid_outputs].red);
> +		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    0.f, 1.f, 0.f, &data.fbs[valid_outputs].green);
> +
> +		prepare_modeset_on_mst_output(output, valid_outputs, false);
>   		dp_mst_outputs++;
>   		if (output_hdcp_capable(output, content_type))
>   			hdcp_mst_output[valid_outputs++] = output;
> @@ -906,8 +940,22 @@ test_content_protection_mst(int content_type)
>   		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
>   		igt_require_f(found, "No valid mode combo found for MST modeset\n");
>   
> -		for (count = 0; count < valid_outputs; count++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
> +		/* Need to re-prepare after mode override */
> +		for (count = 0; count < valid_outputs; count++) {
> +			igt_remove_fb(data.drm_fd, &data.fbs[count].red);
> +			igt_remove_fb(data.drm_fd, &data.fbs[count].green);

Here we're removing fb's before detaching the plane. Please handle this.

Thanks and Regards,
Karthik.B.S
> +
> +			mode = igt_output_get_mode(hdcp_mst_output[count]);
> +
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    1.f, 0.f, 0.f, &data.fbs[count].red);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data.fbs[count].green);
> +
> +			prepare_modeset_on_mst_output(hdcp_mst_output[count], count, false);
> +		}
>   
>   		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>   		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
> @@ -935,7 +983,7 @@ test_content_protection_mst(int content_type)
>   	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
>   	 */
>   	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]->name);
> -	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
> +	test_cp_disable(hdcp_mst_output[0], 0, COMMIT_ATOMIC);
>   
>   	/* CP is expected to be still enabled on other outputs*/
>   	for (i = 1; i < valid_outputs; i++) {
> @@ -946,6 +994,11 @@ test_content_protection_mst(int content_type)
>   
>   	if (data.cp_tests & CP_LIC)
>   		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		igt_remove_fb(data.drm_fd, &data.fbs[count].red);
> +		igt_remove_fb(data.drm_fd, &data.fbs[count].green);
> +	}
>   }
>   
>   
> @@ -956,6 +1009,8 @@ static void test_content_protection_cleanup(void)
>   	uint64_t val;
>   
>   	for_each_connected_output(display, output) {
> +		drmModeModeInfo *mode;
> +
>   		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
>   			continue;
>   
> @@ -964,34 +1019,16 @@ static void test_content_protection_cleanup(void)
>   		if (val == CP_UNDESIRED)
>   			continue;
>   
> -		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> -		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> -	}
> -
> -	igt_remove_fb(data.drm_fd, &data.red);
> -	igt_remove_fb(data.drm_fd, &data.green);
> -}
> -
> -static void create_fbs(void)
> -{
> -	uint16_t width = 0, height = 0;
> -	drmModeModeInfo *mode;
> -	igt_output_t *output;
> -
> -	for_each_connected_output(&data.display, output) {
>   		mode = igt_output_get_mode(output);
> -		igt_assert(mode);
> +		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    1.f, 0.f, 0.f, &data.fbs[0].red);
>   
> -		width = max(width, mode->hdisplay);
> -		height = max(height, mode->vdisplay);
> -	}
> +		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> +		test_cp_disable(output, 0, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> -	igt_create_color_fb(data.drm_fd, width, height,
> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    1.f, 0.f, 0.f, &data.red);
> -	igt_create_color_fb(data.drm_fd, width, height,
> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    0.f, 1.f, 0.f, &data.green);
> +		igt_remove_fb(data.drm_fd, &data.fbs[0].red);
> +	}
>   }
>   
>   static const struct {
> @@ -1159,7 +1196,6 @@ int igt_main()
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> -		create_fbs();
>   	}
>   
>   	igt_describe("Test content protection with legacy style commit.");
