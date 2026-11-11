Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAA7606A326
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KYl06uV6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D90610FAC0;
	Wed, 11 Nov 2026 10:45:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320EC10FA9C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794393859; x=1825929859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=bg/GxNXGN1JtkILp6xnSWlbPVowlvyLWh6wWTprLIBI=;
 b=KYl06uV6Kbjiu2p6XkJAtOgK7VlIg0y0rOIHT7pKTgSnU2sGYdqrx3o2
 8JG99cK7fMPpRdxHPjkheGnXPgEV6aj36zT5XUvprY1jTaBCnobKMiHji
 qTitRM+BeGS1AWZ9r3DKYDmVMb+HxEKGW84qQUvlVL/y7qpY7onyYSoJd
 rn7y7otwHE8Zozms/tMJ6cJiR8bprI5sVue4pzHGogfajvBbNUeGwXMfV
 Im86ucAiTZeKsL8ju0x2JP11OI+5j30Iv6tv59D0jvOLDFwfqJB5n4rZ5
 r2CH912euQGXR5C1PbSXEpD5FpGLk4u+8AQGzZ/jJGje754bIrwrDZMXj g==;
X-CSE-ConnectionGUID: T+lEfDCnRQ+KCZKJ0PEDig==
X-CSE-MsgGUID: 74fcDeGbTTCOrSaq7dYvXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3194856"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208,217";a="3194856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:44:18 -0800
X-CSE-ConnectionGUID: 8mrm6m8IS6uesiAEECPbIQ==
X-CSE-MsgGUID: ROnq2eibTtCttYKNLxpTiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208,217";a="8282504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:44:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:44:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 02:44:17 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:44:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlgkN3bdkTCvy06c+xGmT1hXNc1YVtApLLqmnwbpmlyLlojqAoRuUxBhgQdqCRXVISow3U/uTw6LXFs0Bt3hdu+EeXrUrPkmh+58c0EWDg9pnVqkCG7RXOzCEc3WI8dQmKgSB/Pa9yJv5cmOC80Y73nH7sm9qzU+gJEKGvyzygPDaoeotW/HTRXzqoIpeTtcJyfFyFQBaKkDgUe3UzQJ6N6vqAQxAvTP5FZ5CYDsSS8hGldiD5J8zCbXrjUq4uX8Y9AcwU7Gh/KXSMsS57vMcoFKE22JnB/pUUQ64uRr1SqztrlikUwWODUQhbpa6nHn8sFkQKrHYDojRPGwhKhtFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMFpzJ/bX4fqQTBSBXVkU/2oDP14iZspkoR60rwrgVI=;
 b=SGko7Kwi/eoLRa/UzXmDPBHeX8RMv6bYZ3FWNHTK7n46fjnkCEsl5VniSP3ZjKCa7/3w1E3QtsfWMFqePqrqn+DnVPGH4EWIQ4Je3HIxOHgjreBAGrt6FAJl0Hjfqvjv9hCjbpHRhbo13KaRKppwmhTarAlh6Yh0+Zax4haIj4OyeZoF5HuCc39fQQySS71xOltzPq8a9R8kVRx0sfYcWguM0AcwlRv81gFiRKqbW0qeoj25JbpbpJfdCfUnfaDZT8Z3WFY0rxI6LtcFSzMJF2AUUErqn+MpBIS9q1MgPt8V4M21p04IxBu5wdUKpp1TtrnfJ7PyDrcTQPko1187RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 11 Nov
 2026 10:44:15 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 10:44:15 +0000
Content-Type: multipart/alternative;
 boundary="------------jnVHFaMDMis1crz7emcHx69M"
Message-ID: <e17c0709-217a-469a-aa7b-1752e90d47e3@intel.com>
Date: Wed, 11 Nov 2026 16:14:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] lib/igt_drm_ras_nl: add get_error_counter support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
 <20261110160504.1315160-5-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261110160504.1315160-5-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA5P287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::12) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5319fc14-277d-4ef5-1690-08df3fe0bab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|261021123027099003|11063799006|261028144727099003|261021121427099003|261009223027099003|56012099006|261022105027099003|261102123227099003|261026140227099003|261022075727099003|261026121527099003|22082099003|18002099003|8096899003|6133799003;
X-Microsoft-Antispam-Message-Info: 7i2u5WuxGwijfyPm4Y/3mFKKf0NdE0Cgcqu6FPPyqtqelb1XZTbYCcjhtDWIO5BLQaEFUHDRaU8mZUD1zachxwpuFYH06decxNKqYEU6yu+45HAdK993LkWCyq6MZVGeivluBm0kMfsESI6XH2Ow72UHY8VTRJhRYuBfoW9im5A/rERAGvERkErfLJA8zeoOR60xeJ3X2n6D8ZFyKSPTtDRjF6XhkjGGtMyrO6+jbtsZ8TG8dXEFqkqiyXA5dIMCAkDS3JGEbyD61oNnQykkmJh+PQlMfxWVhlpXziiRaaDaTgXOcRMqnWlg+99snPs0bBn7TMOimtqcX1xmmwln5qw+wZKWgduVJJbJV4BBOCCYmp2dEmZFE7STisnwwGKBCgZ7w67cgEFUirGPsXXH/INZIqVwrpbFpHyU2RhQJK0kMG1NoBy7++HsrGY+WfjBgiS/rRx/yw0KOmfEpRmRTAgkpI+bjAc8Gem/h6NBHRE4zKrQn6DNI1AcAq1A7ngyML9bJqchrWX1rQALCJaP5mrdbsXh6JG/n4T7bx9TupZvvjeJGpbZJr4xbQluHucCU/s8944cIdITcYA7OSts2psdk5nCKeKmibp272y9CN/+c0hz9c0rvjocEPAOZlsSwXyDnD6kkrdpz/wRsH5xpXIIKCQuaUcPZQyoY0btRT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(261021123027099003)(11063799006)(261028144727099003)(261021121427099003)(261009223027099003)(56012099006)(261022105027099003)(261102123227099003)(261026140227099003)(261022075727099003)(261026121527099003)(22082099003)(18002099003)(8096899003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2lYM1lncUNwZ3ZOVjFNSUZMc2MyQURTWkh5MmpMY1Rnc3BBckc0OW54eWQv?=
 =?utf-8?B?akJoTEdESFJHbHVoRVNlQmRXeHViL0pqdzlKYnpRUDFFcE9ib0N6VksrZEZ2?=
 =?utf-8?B?QndmVHdWMDZJLzY1T1Z3WHBTU09jV3Y5T0RLMXlxMnZsNGpLb0ErenR3Qi8v?=
 =?utf-8?B?b3NLcnhuN1BFZVYyN25EYnJOSEpvUHBaTUh2a0xmVkZKWURCd2hMM0VQUElz?=
 =?utf-8?B?ODI1aFltVTlWZU42Q0lmK3ZTdlVhdFptRFN3amIxZ2dOVHJWa3NjRVdHSXdF?=
 =?utf-8?B?ZWVyS2xqZnZYNURGYThuc1F6b0w1aFMxUW1mQkpVU0syOFpyalN4cTd4dGpp?=
 =?utf-8?B?L21RbkJ3cThjNVF0WktROTM1R1hhN3VGNnNBc3hkS2ZvNjFJVGs5dkV3VmpE?=
 =?utf-8?B?M09KeFE5VGgzenBhU0ZzaVdCbGtOUEV3Nyt4Mjg2dCtlTUNXUEJYL2JxeFdQ?=
 =?utf-8?B?RmZvWkVrcXlaL0FselZCeHEwWWhQcEVXUUhnMnQxQndxY2gvNlJiU2tnbUMw?=
 =?utf-8?B?dnlDL1RWQVFqSElHRUpVUVhTUTdyY0FGcW1wVks2bzdhRXVhYTNNeXN6RXJy?=
 =?utf-8?B?NGhGdzBpMlhBK01EVUtTWWVZdEJ4WVlVR20yQkxFekR2TmNadHNjZ1NXRGtQ?=
 =?utf-8?B?UWZ1dTRENnZ4WGNqb0NpaC9lWkt0Um1GNmxpVnZGa2RuL2RwOFR6cCs4ZUNm?=
 =?utf-8?B?cDZOQXFXTUlCRHYydG82dGlVc0RNQmQzMWs4NEtjckFnd2VsaDlucENXTlYz?=
 =?utf-8?B?K2kxWThZeTluLzl1ODAxb2dtUXl5UDE0N3pqdURCZW9LanFYUjhwMCtvVk02?=
 =?utf-8?B?N2lQelpONjRPM3ZJK045UkIxcEc1aXZQSDlnTjhHM0I1UUp5aFJSVWJVL0Nr?=
 =?utf-8?B?QzNPa1NuSFUweG1mNXpNWVVLU29DQ3BIaytwT2tRVlFUN21SWklTbkhwajgw?=
 =?utf-8?B?b2hIRlpWTWpER3JxT0xqQ3N0UVBoMTZtTW9yRnA3ZXBwRkxsL3l3YjI3WVBX?=
 =?utf-8?B?NGUxUzBPWEkzeFJCemk4akVsa2FVQTRURldLUWpzWGNSNjk2VStoNlBlamFR?=
 =?utf-8?B?c0R4dHd1QStXWk1kSFlvZHR1dVovUXpoOUgyUU9TL3pPZVJFa052TTQyVm80?=
 =?utf-8?B?S1hBbXozSjFHMFQ4dnZ2QmU1RDVmNVpKUk4rdXYvNEVwaEhUbm5YdVhSWWFv?=
 =?utf-8?B?V29NRUpheUYzMFlmTHJEUEYzYVp1blhING1wSFZSMERZNk15aUFHYU4vekZy?=
 =?utf-8?B?bjE3ZlFiNEEvdjNWYURGN3FheXlJVTJrWDQzWFNUU2hmWWpySEtjTkVPcEl1?=
 =?utf-8?B?T2tQMzUzUnk2THFpVDJkSkw5bVh4Y2YyUmRGNkVsOHJCZEkwR201YWFqZzJK?=
 =?utf-8?B?eGZGdlhwT0VtaFhGYkwwNTNiRE9MZDNodCtWYzFUQWJHOGwvb0w2a1FDVVZx?=
 =?utf-8?B?UHhqbFNob2dRRVlyWHVMQlpZSXNMY0dHazd3Z2toSDA4MjQ4bzVJVnArRkRn?=
 =?utf-8?B?anBHamE3c1ZyRXdRT1kyYlY3WUJwTVRaU1FTakN1K05ZU2lCZlUyVTMxNUNh?=
 =?utf-8?B?QUhpR1RNcTl6clhFKzdLS1N4MmVwKzhTOHoyU2pWUkozYk5xcU9ZRXhSOFFW?=
 =?utf-8?B?TFNkTThrbzJFSjRRWTNmVG9XUTZkVWFITmlqdmF4Wi9uRjh2MDN6VTJlTDBw?=
 =?utf-8?B?dDJEb0ROSXpHblpHR09lMHFCL1hZTTkvTERpeG5VRllvc3dxUHFQbUR2QnZI?=
 =?utf-8?B?ZERLb1k2OFEzZHVURmJEbFRpejhJSVZCcXpmVXZaeVQyMnB3aUVqdVhCT3N4?=
 =?utf-8?B?R3VzdUNqcDV0a01XdnQvMHQrZUttRG1mSlBVWndWMmlNZ3NPV3c3YlcyL01K?=
 =?utf-8?B?R28wQ1ZNSW1LWXlVZ2hnMmRSQ0Y0RUxRdzBxbUs0RVpyaDUvd2NGMEs1Rk93?=
 =?utf-8?B?UGZnVGNwTXdxQXNqZDdkeWQ4bVlKc2xoWGFybDdicFJKeURzRGNMN2w5YzVG?=
 =?utf-8?B?Y2JKUFdpTUtib3c2cHdocHdEWHpIc3FrVzNWS3ZMVnFtU0d5NkJzdWVUb2VM?=
 =?utf-8?B?UVpBTThDWDgxazZkcVVLS252YnV2czdxZjlPY09BU1M5VGhObzBCMzNnQmJX?=
 =?utf-8?B?QjljUXAvSlFIdHM2c1ViNXRuZlJXM3hoaWprWTlaSFFFYnlzTXVlTEJpL2JT?=
 =?utf-8?B?bUQ0RjNQdjZyQllyWGlNWDBEYm0wMkZVd3ZsR25TSElDdGVWbGtyUEVtQjJF?=
 =?utf-8?B?YnVYSjRsRno3Y0JYNlZYaHJOUDBxVEpFUkhJeUdKNW5vNjBPTFNYYTRSVnU4?=
 =?utf-8?B?bVRVaVBSeE1xcUkzTHhScHowaGlqK1ZxUHdTR3hHRjNSMmR4bFhzZz09?=
X-Exchange-RoutingPolicyChecked: Sm1I14rqwKgiuGfCPhw6nu+oetJ4qVoAYgU2QAqIclwSsTXOZfSlxumbBm2SkzuLAvl/wcUzZYcW8xNzsIZCEjP+wHAebqgn0xg4OccLddmEoNG7nDrPONAeyFJ5hZDRVPEHhVF/9Z3pRAt13q1nwmXDliiyvc/6HUEzXd27zPEDb1SrZPGeIjNv4jn3mImpdOAZ9hfbiefLGhQqmRr/X3Tn3N/GCdsG1PajJVB0olPUwSKQB3IOnV0KhZkwnrqj45wG1GVk0iJ4Mq0Mg8IdMqgRjhqCntmnsrj+53TklmCcNUO2YF2Ip0pOKlmFTZcr/AnVf6Sx0LWwKvD3WOmHLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5319fc14-277d-4ef5-1690-08df3fe0bab1
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:44:15.0719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8fV7ebwHvnPuLQ8to3M70/ePKvi9Yb2hodd1wr450nwSn0n0zp93GyxCkAGuO/QhFtwjIRuHz1KY/eqXTaulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------jnVHFaMDMis1crz7emcHx69M
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ravi,

On 10-11-2026 21:34, Ravi Kishore Koppuravuri wrote:
> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
> v7:Added detailed debug messages to aid diagnosis of failure conditions
>     Introduced an overall timeout for Netlink response completion
>     Consolidated redundant error-handling paths using a common goto label
> v6:Removed normalize_nl_error() for standard errno in ras_error_cb() and
>     send_and_recv_nl_msg() (Soham)
> v5:Renamed library function names prefixed with igt_drm_ras_nl_*
>     (Riana and Soham)
>     Normalized libnl error codes to standard errnos (Soham)
>     Added error messages for error handling functions (Riana)
>     Changed the error-id max value from UINT32_MAX to DRM_XE_RAS_ERR_COMP_MAX (Riana)
> v4:Added support to poll for incoming netlink messages with 10 seconds timeout
>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>     other cosmetic changes (Nikula Jani & Kamil)
> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>     Added a check whether error_value updated by valid callback or not
>     Added a check whether response required for the command or not
> ---
>   lib/igt_drm_ras_nl.c | 352 ++++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_drm_ras_nl.h |  34 +++++
>   2 files changed, 384 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index 91396452d..10a433525 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -4,14 +4,321 @@
>    */
>   
>   #include <errno.h>
> +#include <poll.h>
>   #include <stdint.h>
>   
> +#include <netlink/errno.h>
>   #include <netlink/genl/ctrl.h>
>   #include <netlink/genl/genl.h>
>   
>   #include "igt_core.h"
>   #include "igt_drm_ras_nl.h"
>   
> +#define DRM_RAS_NL_OVERALL_TIMEOUT_MS 60000
> +#define DRM_RAS_NL_MSG_TIMEOUT_MS 10000
> +
> +/* Normalize netlink error codes to standard errnos */
> +static int normalize_nl_error(int ret)
> +{
> +	if (ret >= 0)
> +		return ret;
> +
> +	switch (-ret) {
> +	case NLE_INVAL:
> +		return -EINVAL;
> +	case NLE_NOMEM:
> +		return -ENOMEM;
> +	case NLE_NOATTR:
> +	case NLE_MISSING_ATTR:
> +		return -ENODATA;
> +	case NLE_OPNOTSUPP:
> +		return -EOPNOTSUPP;
> +	case NLE_EXIST:
> +		return -EEXIST;
> +	case NLE_NOADDR:
> +		return -EADDRNOTAVAIL;
> +	case NLE_PERM:
> +		return -EPERM;
> +	case NLE_NOACCESS:
> +		return -EACCES;
> +	case NLE_NODEV:
> +		return -ENODEV;
> +	case NLE_BUSY:
> +		return -EBUSY;
> +	case NLE_AGAIN:
> +		return -EAGAIN;
> +	default:
> +		igt_debug("Unhandled netlink error code: %d\n", -ret);
> +		return -EIO;
> +	}
> +}
> +
> +static int ras_command_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +	struct genlmsghdr *gnlh;
> +	struct nlmsghdr *nlh;
> +	int ret;
> +
> +	nlh = nlmsg_hdr(msg);
> +	gnlh = nlmsg_data(nlh);
> +
> +	ret = genlmsg_parse(nlh, 0, attrs,
> +			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +	if (ret < 0)
> +		return NL_SKIP;
> +
> +	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
> +		break;
> +	}
> +	default:
> +		return NL_SKIP;
> +	}
> +
> +	ctx->reply_received = true;
> +	if (ctx->ack_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_OK;
> +}
> +
> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	/* err->error is a raw kernel errno, not a libnl NLE_* code */
> +	ctx->last_nl_error = err->error;
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	ctx->ack_received = true;
> +	if (!ctx->response_required || ctx->reply_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_ACK callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_FINISH callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_ERR callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
> +				struct nl_cb *cb,
> +				struct nl_msg *msg)
> +{
> +	struct pollfd pfd = {
> +		.fd = nl_socket_get_fd(ctx->sock),
> +		.events = POLLIN,
> +	};
> +	const uint64_t timeout_ns = (uint64_t)DRM_RAS_NL_OVERALL_TIMEOUT_MS * 1000000;
> +	const uint64_t msg_timeout_ns =
> +		(uint64_t)DRM_RAS_NL_MSG_TIMEOUT_MS * 1000000;
> +	struct timespec start, message_start;
> +	int ret, err_ret;
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	nlmsg_free(msg);
> +	if (ret < 0) {
> +		err_ret = normalize_nl_error(ret);
> +		goto process_error;
> +	}
> +
> +	ret = igt_gettime(&start);
> +	if (ret < 0) {
> +		err_ret = -errno;
> +		goto process_error;
> +	}
> +
> +	message_start = start;
> +
> +	/* NL Reply and ACK arrive as separate responses */
> +	while (!ctx->cmd_done) {
> +		uint64_t msg_elapsed_ns = igt_nsec_elapsed(&message_start);
> +		uint64_t elapsed_ns = igt_nsec_elapsed(&start);
> +		uint64_t remaining_ns;
> +		int timeout_ms;
> +
> +		if (elapsed_ns >= timeout_ns || msg_elapsed_ns >= msg_timeout_ns) {
> +			err_ret = -ETIMEDOUT;
> +			goto process_error;
> +		}
> +
> +		remaining_ns = timeout_ns - elapsed_ns;
> +		if (msg_timeout_ns - msg_elapsed_ns < remaining_ns)
> +			remaining_ns = msg_timeout_ns - msg_elapsed_ns;
> +		timeout_ms = (remaining_ns + 999999) / 1000000;
> +		ret = poll(&pfd, 1, timeout_ms);
> +		if (ret < 0 && errno == EINTR)
> +			continue;
> +
> +		/* poll()/errno results are already standard errnos, not libnl codes */
> +		if (ret == 0) {
> +			err_ret = -ETIMEDOUT;
> +			goto process_error;
> +		}
> +
> +		if (ret < 0) {
> +			err_ret = -errno;
> +			goto process_error;
> +		}
> +
> +		if (!(pfd.revents & POLLIN)) {
> +			igt_debug("Received unexpected poll revents: %d\n", pfd.revents);
> +			err_ret = -EIO;
> +			goto process_error;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0) {
> +			err_ret = normalize_nl_error(ret);
> +			goto process_error;
> +		}
> +
> +		ret = igt_gettime(&message_start);
> +		if (ret < 0) {
> +			err_ret = -errno;
> +			goto process_error;
> +		}
> +	}
> +	nl_cb_put(cb);
> +	return 0;
This is not required. Just initialize err_ret to 0.
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
> +process_error:
> +	nl_cb_put(cb);
> +	return err_ret;
> +}
> +
> +static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
> +{
> +	struct nl_msg *msg;
> +	struct nl_cb *cb;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +
> +	msg_head = genlmsg_put(msg,
> +			       NL_AUTO_PORT,
> +			       NL_AUTO_SEQ,
> +			       ctx->family_id,
> +			       0,
> +			       NLM_F_REQUEST | NLM_F_ACK,
> +			       cmd,
> +			       DRM_RAS_FAMILY_VERSION);
> +	if (!msg_head) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER:
> +		ctx->response_required = true;
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +				  ctx->node_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return normalize_nl_error(ret);
> +		}
> +
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +				  ctx->error_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return normalize_nl_error(ret);
> +		}
> +		break;
> +	default:
> +		nlmsg_free(msg);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	ret = register_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		nlmsg_free(msg);
> +		return normalize_nl_error(ret);
> +	}
> +
> +	return send_and_recv_nl_msg(ctx, cb, msg);
> +}
> +
> +static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
> +{
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = DRM_XE_RAS_ERR_COMP_MAX;
> +	ctx->error_value = 0;
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +	ctx->family_id = -1;
> +}
> +
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>   {
>   	if (!ctx || !ctx->sock)
> @@ -19,14 +326,19 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>   
>   	nl_close(ctx->sock);
>   	nl_socket_free(ctx->sock);
> -	ctx->sock = NULL;
> -	ctx->family_id = -1;
> +
> +	reset_drm_ras_nl_context(ctx);
>   
>   	igt_debug("Cleaned up netlink socket.\n");
>   }
>   
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
>   {
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	reset_drm_ras_nl_context(ctx);
> +
>   	ctx->sock = nl_socket_alloc();
>   	if (!ctx->sock)
>   		return -ENOMEM;
> @@ -49,3 +361,39 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
>   		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0) {
> +		igt_warn("Invalid DRM RAS netlink context\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ctx->node_id == UINT32_MAX ||
> +	    ctx->error_id == DRM_XE_RAS_ERR_COMP_MAX ||
> +	    ctx->error_id == 0) {
> +		igt_warn("Invalid node_id (%u) or error_id (%u) provided\n",
> +			 ctx->node_id, ctx->error_id);
> +		return -EINVAL;
> +	}
> +
> +	ctx->error_value = UINT32_MAX;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ctx->error_value == UINT32_MAX) {
> +		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
> +
> +		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
> +	}
> +
> +	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 011f3bc05..f51784524 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -7,14 +7,48 @@
>   #define IGT_DRM_RAS_NL_H
>   
>   #include <drm-uapi/drm_ras.h>
> +#include <drm-uapi/xe_drm.h>
>   
> +/**
> + * struct igt_drm_ras_nl_context - DRM RAS generic netlink context
> + *
> + * Holds the state for a DRM RAS generic netlink request/response exchange.
> + */
>   struct igt_drm_ras_nl_context {
> +	/** @sock: Netlink socket used for the exchange */
>   	struct nl_sock *sock;
> +
> +	/** @node_id: DRM RAS node ID to query the error counters */
> +	uint32_t node_id;
> +
> +	/** @error_id: RAS error ID to query the error counter */
> +	uint32_t error_id;
> +
> +	/** @error_value: Error counter value returned by the kernel */
> +	uint32_t error_value;
> +
> +	/** @last_nl_error: Last netlink error reported by the kernel */
> +	int last_nl_error;
> +
> +	/** @cmd_done: Set when the command exchange has completed */
> +	bool cmd_done;
> +
> +	/** @reply_received: Set when the command reply has been received */
> +	bool reply_received;
> +
> +	/** @ack_received: Set when the command ACK has been received */
> +	bool ack_received;
> +
> +	/** @response_required: Set when a reply is expected before @cmd_done */
> +	bool response_required;
> +
> +	/** @family_id: Generic netlink family ID */
>   	int family_id;
>   };
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   
--------------jnVHFaMDMis1crz7emcHx69M
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Ravi,</p>
    <div class="moz-cite-prefix">On 10-11-2026 21:34, Ravi Kishore
      Koppuravuri wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261110160504.1315160-5-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.

Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
v7:Added detailed debug messages to aid diagnosis of failure conditions
   Introduced an overall timeout for Netlink response completion
   Consolidated redundant error-handling paths using a common goto label
v6:Removed normalize_nl_error() for standard errno in ras_error_cb() and
   send_and_recv_nl_msg() (Soham)
v5:Renamed library function names prefixed with igt_drm_ras_nl_*
   (Riana and Soham)
   Normalized libnl error codes to standard errnos (Soham)
   Added error messages for error handling functions (Riana)
   Changed the error-id max value from UINT32_MAX to DRM_XE_RAS_ERR_COMP_MAX (Riana)
v4:Added support to poll for incoming netlink messages with 10 seconds timeout
   Renamed the library functions with prefix &quot;igt_drm_netlink_*&quot; and
   other cosmetic changes (Nikula Jani &amp; Kamil)
v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
   Added a check whether error_value updated by valid callback or not
   Added a check whether response required for the command or not
---
 lib/igt_drm_ras_nl.c | 352 ++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_drm_ras_nl.h |  34 +++++
 2 files changed, 384 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 91396452d..10a433525 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -4,14 +4,321 @@
  */
 
 #include &lt;errno.h&gt;
+#include &lt;poll.h&gt;
 #include &lt;stdint.h&gt;
 
+#include &lt;netlink/errno.h&gt;
 #include &lt;netlink/genl/ctrl.h&gt;
 #include &lt;netlink/genl/genl.h&gt;
 
 #include &quot;igt_core.h&quot;
 #include &quot;igt_drm_ras_nl.h&quot;
 
+#define DRM_RAS_NL_OVERALL_TIMEOUT_MS 60000
+#define DRM_RAS_NL_MSG_TIMEOUT_MS 10000
+
+/* Normalize netlink error codes to standard errnos */
+static int normalize_nl_error(int ret)
+{
+	if (ret &gt;= 0)
+		return ret;
+
+	switch (-ret) {
+	case NLE_INVAL:
+		return -EINVAL;
+	case NLE_NOMEM:
+		return -ENOMEM;
+	case NLE_NOATTR:
+	case NLE_MISSING_ATTR:
+		return -ENODATA;
+	case NLE_OPNOTSUPP:
+		return -EOPNOTSUPP;
+	case NLE_EXIST:
+		return -EEXIST;
+	case NLE_NOADDR:
+		return -EADDRNOTAVAIL;
+	case NLE_PERM:
+		return -EPERM;
+	case NLE_NOACCESS:
+		return -EACCES;
+	case NLE_NODEV:
+		return -ENODEV;
+	case NLE_BUSY:
+		return -EBUSY;
+	case NLE_AGAIN:
+		return -EAGAIN;
+	default:
+		igt_debug(&quot;Unhandled netlink error code: %d\n&quot;, -ret);
+		return -EIO;
+	}
+}
+
+static int ras_command_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+	struct igt_drm_ras_nl_context *ctx = arg;
+	struct genlmsghdr *gnlh;
+	struct nlmsghdr *nlh;
+	int ret;
+
+	nlh = nlmsg_hdr(msg);
+	gnlh = nlmsg_data(nlh);
+
+	ret = genlmsg_parse(nlh, 0, attrs,
+			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
+	if (ret &lt; 0)
+		return NL_SKIP;
+
+	switch (gnlh-&gt;cmd) {
+	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
+		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
+			return NL_SKIP;
+
+		ctx-&gt;error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
+		break;
+	}
+	default:
+		return NL_SKIP;
+	}
+
+	ctx-&gt;reply_received = true;
+	if (ctx-&gt;ack_received)
+		ctx-&gt;cmd_done = true;
+
+	return NL_OK;
+}
+
+static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
+{
+	struct igt_drm_ras_nl_context *ctx = arg;
+
+	/* err-&gt;error is a raw kernel errno, not a libnl NLE_* code */
+	ctx-&gt;last_nl_error = err-&gt;error;
+	ctx-&gt;cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int ras_ack_cb(struct nl_msg *msg, void *arg)
+{
+	struct igt_drm_ras_nl_context *ctx = arg;
+
+	ctx-&gt;ack_received = true;
+	if (!ctx-&gt;response_required || ctx-&gt;reply_received)
+		ctx-&gt;cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int ras_finish_cb(struct nl_msg *msg, void *arg)
+{
+	struct igt_drm_ras_nl_context *ctx = arg;
+
+	ctx-&gt;cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
+	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;Failed to set NL_CB_VALID callback (ret=%d)\n&quot;, ret);
+		return ret;
+	}
+
+	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;Failed to set NL_CB_ACK callback (ret=%d)\n&quot;, ret);
+		return ret;
+	}
+
+	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;Failed to set NL_CB_FINISH callback (ret=%d)\n&quot;, ret);
+		return ret;
+	}
+
+	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;Failed to set NL_CB_ERR callback (ret=%d)\n&quot;, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
+				struct nl_cb *cb,
+				struct nl_msg *msg)
+{
+	struct pollfd pfd = {
+		.fd = nl_socket_get_fd(ctx-&gt;sock),
+		.events = POLLIN,
+	};
+	const uint64_t timeout_ns = (uint64_t)DRM_RAS_NL_OVERALL_TIMEOUT_MS * 1000000;
+	const uint64_t msg_timeout_ns =
+		(uint64_t)DRM_RAS_NL_MSG_TIMEOUT_MS * 1000000;
+	struct timespec start, message_start;
+	int ret, err_ret;
+
+	ret = nl_send_auto(ctx-&gt;sock, msg);
+	nlmsg_free(msg);
+	if (ret &lt; 0) {
+		err_ret = normalize_nl_error(ret);
+		goto process_error;
+	}
+
+	ret = igt_gettime(&amp;start);
+	if (ret &lt; 0) {
+		err_ret = -errno;
+		goto process_error;
+	}
+
+	message_start = start;
+
+	/* NL Reply and ACK arrive as separate responses */
+	while (!ctx-&gt;cmd_done) {
+		uint64_t msg_elapsed_ns = igt_nsec_elapsed(&amp;message_start);
+		uint64_t elapsed_ns = igt_nsec_elapsed(&amp;start);
+		uint64_t remaining_ns;
+		int timeout_ms;
+
+		if (elapsed_ns &gt;= timeout_ns || msg_elapsed_ns &gt;= msg_timeout_ns) {
+			err_ret = -ETIMEDOUT;
+			goto process_error;
+		}
+
+		remaining_ns = timeout_ns - elapsed_ns;
+		if (msg_timeout_ns - msg_elapsed_ns &lt; remaining_ns)
+			remaining_ns = msg_timeout_ns - msg_elapsed_ns;
+		timeout_ms = (remaining_ns + 999999) / 1000000;
+		ret = poll(&amp;pfd, 1, timeout_ms);
+		if (ret &lt; 0 &amp;&amp; errno == EINTR)
+			continue;
+
+		/* poll()/errno results are already standard errnos, not libnl codes */
+		if (ret == 0) {
+			err_ret = -ETIMEDOUT;
+			goto process_error;
+		}
+
+		if (ret &lt; 0) {
+			err_ret = -errno;
+			goto process_error;
+		}
+
+		if (!(pfd.revents &amp; POLLIN)) {
+			igt_debug(&quot;Received unexpected poll revents: %d\n&quot;, pfd.revents);
+			err_ret = -EIO;
+			goto process_error;
+		}
+
+		ret = nl_recvmsgs(ctx-&gt;sock, cb);
+		if (ret &lt; 0) {
+			err_ret = normalize_nl_error(ret);
+			goto process_error;
+		}
+
+		ret = igt_gettime(&amp;message_start);
+		if (ret &lt; 0) {
+			err_ret = -errno;
+			goto process_error;
+		}
+	}
+	nl_cb_put(cb);
+	return 0;</pre>
    </blockquote>
    This is not required.&nbsp;<span style="white-space: pre-wrap">Just initialize </span><span style="white-space: pre-wrap">err_ret to 0.</span><span style="white-space: pre-wrap">
</span><br>
    <span style="white-space: pre-wrap">Reviewed-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20261110160504.1315160-5-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+process_error:
+	nl_cb_put(cb);
+	return err_ret;
+}
+
+static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
+{
+	struct nl_msg *msg;
+	struct nl_cb *cb;
+	void *msg_head;
+	int ret;
+
+	msg = nlmsg_alloc();
+	if (!msg)
+		return -ENOMEM;
+
+	ctx-&gt;last_nl_error = 0;
+	ctx-&gt;cmd_done = false;
+	ctx-&gt;reply_received = false;
+	ctx-&gt;ack_received = false;
+	ctx-&gt;response_required = false;
+
+	msg_head = genlmsg_put(msg,
+			       NL_AUTO_PORT,
+			       NL_AUTO_SEQ,
+			       ctx-&gt;family_id,
+			       0,
+			       NLM_F_REQUEST | NLM_F_ACK,
+			       cmd,
+			       DRM_RAS_FAMILY_VERSION);
+	if (!msg_head) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	switch (cmd) {
+	case DRM_RAS_CMD_GET_ERROR_COUNTER:
+		ctx-&gt;response_required = true;
+		ret = nla_put_u32(msg,
+				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
+				  ctx-&gt;node_id);
+		if (ret &lt; 0) {
+			nlmsg_free(msg);
+			return normalize_nl_error(ret);
+		}
+
+		ret = nla_put_u32(msg,
+				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+				  ctx-&gt;error_id);
+		if (ret &lt; 0) {
+			nlmsg_free(msg);
+			return normalize_nl_error(ret);
+		}
+		break;
+	default:
+		nlmsg_free(msg);
+		return -EOPNOTSUPP;
+	}
+
+	cb = nl_cb_alloc(NL_CB_DEFAULT);
+	if (!cb) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	ret = register_callbacks(cb, ctx);
+	if (ret &lt; 0) {
+		nl_cb_put(cb);
+		nlmsg_free(msg);
+		return normalize_nl_error(ret);
+	}
+
+	return send_and_recv_nl_msg(ctx, cb, msg);
+}
+
+static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
+{
+	ctx-&gt;sock = NULL;
+	ctx-&gt;node_id = UINT32_MAX;
+	ctx-&gt;error_id = DRM_XE_RAS_ERR_COMP_MAX;
+	ctx-&gt;error_value = 0;
+	ctx-&gt;last_nl_error = 0;
+	ctx-&gt;cmd_done = false;
+	ctx-&gt;reply_received = false;
+	ctx-&gt;ack_received = false;
+	ctx-&gt;response_required = false;
+	ctx-&gt;family_id = -1;
+}
+
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
 {
 	if (!ctx || !ctx-&gt;sock)
@@ -19,14 +326,19 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
 
 	nl_close(ctx-&gt;sock);
 	nl_socket_free(ctx-&gt;sock);
-	ctx-&gt;sock = NULL;
-	ctx-&gt;family_id = -1;
+
+	reset_drm_ras_nl_context(ctx);
 
 	igt_debug(&quot;Cleaned up netlink socket.\n&quot;);
 }
 
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 {
+	if (!ctx)
+		return -EINVAL;
+
+	reset_drm_ras_nl_context(ctx);
+
 	ctx-&gt;sock = nl_socket_alloc();
 	if (!ctx-&gt;sock)
 		return -ENOMEM;
@@ -49,3 +361,39 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 		  DRM_RAS_FAMILY_NAME, ctx-&gt;family_id);
 	return 0;
 }
+
+int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
+	if (!ctx || !ctx-&gt;sock || ctx-&gt;family_id &lt; 0) {
+		igt_warn(&quot;Invalid DRM RAS netlink context\n&quot;);
+		return -EINVAL;
+	}
+
+	if (ctx-&gt;node_id == UINT32_MAX ||
+	    ctx-&gt;error_id == DRM_XE_RAS_ERR_COMP_MAX ||
+	    ctx-&gt;error_id == 0) {
+		igt_warn(&quot;Invalid node_id (%u) or error_id (%u) provided\n&quot;,
+			 ctx-&gt;node_id, ctx-&gt;error_id);
+		return -EINVAL;
+	}
+
+	ctx-&gt;error_value = UINT32_MAX;
+
+	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret &lt; 0)
+		return ret;
+
+	if (ctx-&gt;error_value == UINT32_MAX) {
+		igt_warn(&quot;No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n&quot;,
+			 ctx-&gt;node_id, ctx-&gt;error_id, ctx-&gt;last_nl_error);
+
+		return ctx-&gt;last_nl_error ? ctx-&gt;last_nl_error : -ENODATA;
+	}
+
+	igt_debug(&quot;Retrieved error counter: node_id=%u error_id=%u value=%u\n&quot;,
+		  ctx-&gt;node_id, ctx-&gt;error_id, ctx-&gt;error_value);
+
+	return 0;
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 011f3bc05..f51784524 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -7,14 +7,48 @@
 #define IGT_DRM_RAS_NL_H
 
 #include &lt;drm-uapi/drm_ras.h&gt;
+#include &lt;drm-uapi/xe_drm.h&gt;
 
+/**
+ * struct igt_drm_ras_nl_context - DRM RAS generic netlink context
+ *
+ * Holds the state for a DRM RAS generic netlink request/response exchange.
+ */
 struct igt_drm_ras_nl_context {
+	/** @sock: Netlink socket used for the exchange */
 	struct nl_sock *sock;
+
+	/** @node_id: DRM RAS node ID to query the error counters */
+	uint32_t node_id;
+
+	/** @error_id: RAS error ID to query the error counter */
+	uint32_t error_id;
+
+	/** @error_value: Error counter value returned by the kernel */
+	uint32_t error_value;
+
+	/** @last_nl_error: Last netlink error reported by the kernel */
+	int last_nl_error;
+
+	/** @cmd_done: Set when the command exchange has completed */
+	bool cmd_done;
+
+	/** @reply_received: Set when the command reply has been received */
+	bool reply_received;
+
+	/** @ack_received: Set when the command ACK has been received */
+	bool ack_received;
+
+	/** @response_required: Set when a reply is expected before @cmd_done */
+	bool response_required;
+
+	/** @family_id: Generic netlink family ID */
 	int family_id;
 };
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
 
 #endif /* IGT_DRM_RAS_NL_H */
 
</pre>
    </blockquote>
  </body>
</html>

--------------jnVHFaMDMis1crz7emcHx69M--
