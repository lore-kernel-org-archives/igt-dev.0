Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D72FCEE91
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 11:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C215810E747;
	Wed, 25 Feb 2026 11:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHXvrjp1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA38310E746
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772020246; x=1803556246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wyCnQmxlSXep1o8jBDHj0mTSR/tiLPRAwVIpbXBfTDw=;
 b=VHXvrjp1haY7UPhhqCtRt67lUHKrgHa4dgfDLNyPIfny50gPF/73k7Wx
 XCZNaW5NOdEdZf1fHYda1PXslaiSWYwBI5M1vdn56q9szLQJA/01q2OAF
 WBWVQB+T2q3HKs3nMZaw9LCXJPts6VA4ujw19L+yq2nQS8NgC7uUyu1uC
 pj13uBBzh2bruqzLWjoNGdXsuWeAA5rNG+rPOhNUprto0E9aBZmFU29kc
 brXm69iZm+wyw/tfVvBeaILdoWxWUi4lQbpesZ9c3SCidCdwKigEPED3X
 0/7sXasBZjeMKPL6ZydoGyAeKgU2dBh8IFq8zhd4SGSt7cXM6s9/TKVpz g==;
X-CSE-ConnectionGUID: XhA3DqNqQn6Cwh81w2BdRg==
X-CSE-MsgGUID: iAU0gUSNS2yphk5t9Irz3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83681595"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83681595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:50:45 -0800
X-CSE-ConnectionGUID: g3YF+5SdSd68qIvOzZ6brQ==
X-CSE-MsgGUID: iy0EyNYZQricZ1HYSqaXdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214337432"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:50:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 03:50:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 03:50:44 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 03:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceutwizrIjVjyAR384JVcyoUahsuSLZSj1ZmIFjdkAStv7P5L8NnPPdedVdixzTJPYKtUhz7zAL/zK8fgGSk2XGyoFPGSc75P5oiO6Rd9ADTNBED9fUvhW9AxKfieRkZruclTI24IR30CGwGwieJdKvaQMjnbdVcCK9G/PUJMcwTUGcIlMofdnLAnUw0ChQfV/wKGPKshnOGbjUbqfw41dgz/+obutPG+nhJcDjfp7Nm9/qSL0g9jrx0weAC/ssfl11CCCGekzsfeT8YUS08WzecKtT+k9VxUFE2X5QRRzGypWXyLZg438Zz+hhxU71gI/LfKJIrr53fGhsUKnpGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJb3vAPOCaZKHtqqSdM5cTuRp8H7grSPl9eRiP+iWVs=;
 b=soThkc+Pt2TyisBUleh74YEpzzDU3VoAQJPs1ti+ajVbSRtyMQ6EVWx4S82P0m4QBpveb/O2j0agJtdJoIf3UdZ0LVuT0y73c0mY/D0d3aPp1qhobJISn8WhxWU7vpy9y9BmbddrcPKObCcPmQCLMJu0d5NKdC8PuxE6vs6O+XJUv2c6VvPQYBncu0EKx8znSmSFz9s08GiOc8zJtEj92m6WudDPfiiaZnPD86PCJlv4WeUokdzN30/w/nCxTNQvCsibdCjOWYIeF356e32pEl7V7C98W9hxxhskUh2pvR2YQFGx0MXbH7/m3aE3mfF3yiot/xheqISULNmB6/NEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by SA3PR11MB9509.namprd11.prod.outlook.com (2603:10b6:806:47e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Wed, 25 Feb
 2026 11:50:38 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 11:50:38 +0000
Message-ID: <79ee21aa-d7b2-47e2-b59f-4d939dde02c8@intel.com>
Date: Wed, 25 Feb 2026 17:20:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] tests/kms_async_flips: Fix PSR2 selective
 fetch check for cursor tests
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>
References: <20260203084257.1372798-1-santhosh.reddy.guddati@intel.com>
 <20260203084257.1372798-2-santhosh.reddy.guddati@intel.com>
 <DM4PR11MB6312FB09794D26A0E536AD379063A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM4PR11MB6312FB09794D26A0E536AD379063A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0126.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::9) To BL1PR11MB5302.namprd11.prod.outlook.com
 (2603:10b6:208:312::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|SA3PR11MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 35be0ca7-d3f4-4938-68ab-08de746417f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: Xw4C1Le5aVXdu1KAu0bHrkl5AnT1eV221EySlZ3iq4ZRSZp/iCHCFVWjUEbHfgiqLOUFzU4X12J0ks6wNuprpqjPtf2qUDgnDqO2qY0PxbRkeRZ/nEkgxuhi1AqOabzosUsBl4esqw05zNL1PvMpZ0TRr+yV8iNBGxSNN+5X/gddZyqUqsXGZJRE2QRorK3Usin7wllz2Vkq+yBbx81gh+i2/cKtqT2lOJVXK7sfnT+kssElVq/scb9DCrWqz4iPTup6hE+mQYj8WHVQDyJMqwq6hWUB6XYbr1eZdcYqHHhGcrh4m9KIQIb88ngTyv7Wz80Bg9kkkndBISK4t0klunPRcClXhppDIZK/s4Cnjlbl3HYm/BztYRxsve+Wzz7mhle3E7i1KfRKu+PoRRY2aHuo68AyEdBZMSyrm4cA3zVCDs0IFZRtvu3nit+r6SpfM9jDLk/PzZpvDrAaZ34TbIznQC+DkMcBGSrNckEJEht4CzUWdMPBpOc3nMKqIii9XZWmQ0tmWVJXUl1MuZm+6Q3ZF7KCIcLrbNzTlUi7t+5E3H/E2zunftw4nuKLXrNqmLRKDux1DM+dZ8Cpenz8nOsZIutSRW+RXCnbxhzc5hnvFNe9QgMRpsLBKXmZAtuWmuhu0gL37m3/FrS9cGcvJikV0IPyVYto3y1Rne2hxG7ywosj1jZGzol9TtIYvguOqDJGPzHnCv8Dbz27edcwm2hLZ8sl2hOtrHhBhIzIv1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09rN3crMmZoZy9YQjlrWWk4SDFaWFVZbEwvQW9IdytkTTNpZVhGeWxFbjI5?=
 =?utf-8?B?M09GUGQzMjhZOWpVNndLTHdYbmZnVkZZTHNvQisxYXc2bW9pUkdXRDZKVVNj?=
 =?utf-8?B?ZmpFRGFYU0pwS1JOcVJtMDZYb0dVa29BYnJzRDhRTVl6RFVSYzh2OGZJZUxm?=
 =?utf-8?B?UjNLNFMyMFBrVEFLYWpYaTVDVlVPMXdMWFpaQUJUUTdTTTJ2cnRKSVpzMmw0?=
 =?utf-8?B?SWx3bzdqcTM5eUZwNldQOWpYMW9qTFh3dWZROTNzVSs2bmgrYjI4aElhYjFD?=
 =?utf-8?B?OEtWdHVOMWE2eFdUaXUzYy9wYkM1Q3RPY2U5YlBPNjlNOUtET3NnenhrQ3Rp?=
 =?utf-8?B?NXR3OUY2NHVxZTRqaEJZdkdmNWJxNGhOaVkwN1A0OE02Ukp0TkMzVzl5bGs3?=
 =?utf-8?B?RmNRd1hNdTl5M29CdUFLblZiR2FoVHM5TW9jdW04SE5vSllrWEczMDJyTjNL?=
 =?utf-8?B?dkRGK1RldDZEcWlXWFdkVVAwQ1UxQlRkc2g1QytuTDRxNytjbEI3QWllckRT?=
 =?utf-8?B?QWtPS1pvMjRCb3BmMSsyeXdYU2VhN0k4ME5QbTQzdHludXBTNEtOcHBLaFl1?=
 =?utf-8?B?dmVpS2FTN3h0TmJTdFREbFRUazZPeXJjTTFWUTlaK2xnQy9jend6T2hNNEVR?=
 =?utf-8?B?dldDSm9JdU9aajVDWE1HemF3WnRYb1F3Kzh6M1hMelVZYURXUGNlaC8wUVlK?=
 =?utf-8?B?SmlKOXJpQXRjR2xyQmZMaW9mTGFVbE9oR3JWemk4T3dXQm03MlhxZXpQTSt4?=
 =?utf-8?B?aW5nNzRPUzZKblFaZUhSL0pQYi9MTFh6VjJFMGRjN1g1RXNmYWtSSk5XcUgy?=
 =?utf-8?B?Zm1sOW9ybXNoc1MrQWh6cXlsOTYzR0s5cndOc3UvNlRPQUlQV2MyNUh1TjdG?=
 =?utf-8?B?N2IrM1pFeFkzeG5pU2FKUkVmT0pDODl1c1FwMVpqa2Y3cWFVbWJxMlB1ZmV4?=
 =?utf-8?B?ODY4bURTY1VGM1E1TExNbzJFTUFGdzdQeDBWeDFRNlVETVJXMTRBM1lRb2dz?=
 =?utf-8?B?MXZuNDU5SmJhTEhMNWUwSjRBNmNxS3B5ZEdLcmZmaGFFYXRKeDFheU0zbzlV?=
 =?utf-8?B?RGpaS3NhUzdrcHBEaFdiZU5rWklFeEZOYTRwY3kveWIySnM4QUNuZ1hhYWwr?=
 =?utf-8?B?NUl4aENsV0lCdEkvWk84QU9NTktQL0RuK3Rtd05zazZsazdLeHAvVDVDdjZR?=
 =?utf-8?B?cmF0Znc0cW1IV0NBQnNkR0VSRU45cW1kS1Z0cCtGY2ZwbytBTDhFeVVqL0g3?=
 =?utf-8?B?by8rU0xhNHgxUjRFdytwY3dnWmJmbGgvYnVSRjlyVDVHSVpMYys3OC9LMmts?=
 =?utf-8?B?MU9zL3huek9KVU54V0phdmZVazdaNm53dVZ5YlZXVDViZ2hPUTB6bW5RQUpo?=
 =?utf-8?B?cUIxRThua1FmODR1eE1kSmtSWGdjRFFibjhSdmFvUVdydWZJenFQNFprck9m?=
 =?utf-8?B?RzNraEpRTlFDcU5yZlliMERXcm1LNGZURGl6MEE2d3c5TFlFR0ptM1ZWMnhY?=
 =?utf-8?B?TEI1UXpXMVczNWVncldXYjQwWk1uUzV5cmIzUFRiYklJdE42MW1jaFZtVWgw?=
 =?utf-8?B?YW1rUzNZdEN3UURBemtKTklBeU1ucUlxQzVJdFc1eFRvd3pRelAvckt5QllV?=
 =?utf-8?B?TjBGSEh6ZTVoNVBwZWtwMFBwUm9rSVpFZCtrcWs4U3VuK1BoR2ZUUkNGUWxo?=
 =?utf-8?B?T3p3MHdxVjlLS0hVdS95S1lHRUwzMlJ1aDd2aVBPeldoQmtJNmIyb3hjdzVT?=
 =?utf-8?B?anFpalpJU1lETVJVb1RBK0ZXazRPeW1qNk1zZ1RnNHQ4T2MySXpVSGNyTTBP?=
 =?utf-8?B?Z21ySzMzeCsxbnNUR29FcGM4b0xsMysyRzBVTWFqSTQzMkJjRkovR1BnUTJO?=
 =?utf-8?B?dGE0TEI1TVJxd21hcDlHVXZELzBGOEFBTmVWbHFhRXNlK0ZOelZUSUZMc3Bj?=
 =?utf-8?B?aUdjanlMQnFJMTZqZFFoYXZTbDBrek5zMXNKY1ZhaUt0eXJTWTI2Z1Q3M2hx?=
 =?utf-8?B?VGNsKzVlOFFPNjJYcmRjWUxCcUplY3JHSUV2ZkJVSC9BZTdJM25rV1ZQa0NQ?=
 =?utf-8?B?QnlNS3lUWTN1eHhPSHNUc0xqRFJYeTBqN2krcndzeUx6T2FsUlh2NmF5eU1C?=
 =?utf-8?B?YkVnL2VSL3UySDUzRjFvalh5RnZHT2hocU5tVEhjUllqb0puRTY1azJsVHZC?=
 =?utf-8?B?THNlak5GV1drNTlDRy9aR2xoNmpESVV4TUhJZXN4Qm1zTTZ1NmhxbUpwVGhI?=
 =?utf-8?B?OWI0RUdqSW4rdFpDQWFYcDNtaTZPaEpXbUc5Tk50b3VRV2VOb0MyY28xK3Ni?=
 =?utf-8?B?YThYSnBkTDA0emc5M2VmK0hac1VKZ04wZktyeWdHaiszTGVmdFl4MktGVVVZ?=
 =?utf-8?Q?lyqAMnoltI7on+NjskqUg7qdCRogDfFHQOj32?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35be0ca7-d3f4-4938-68ab-08de746417f4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:50:38.4642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q84lVap6D2peg/ICjTSbUYX9igqwRWh62N1c9lWTFZCkgKu2JXZtCPEd40IQHMCtdCznh4OsURMbYcI2LzCH4yl4DHsZFjMupmDVhl6AiIQ83AHCUBIXIn8TVxcHYjAO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9509
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

On 11-02-2026 09:10, B, Jeevan wrote:
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Tuesday, February 3, 2026 2:13 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>;
>> Sharma, Swati2 <swati2.sharma@intel.com>; Manna, Animesh
>> <animesh.manna@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v2 1/1] tests/kms_async_flips: Fix PSR2 selective fetch
>> check for cursor tests
>>
>> The async flip cursor tests are expected to skip on PSR panels and execute on
>> non-PSR panels.The change allows the test to check per sink PSR capabilities
>> and verifies async flip behaviour accordingly.
>>
>> v2: Use psr_sink_support for the panels capabilities to identify psr2_sf and
>> skip the tests accordingly and revert lib changes. (Jeevan)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 30 +++++++++---------------------
>>   1 file changed, 9 insertions(+), 21 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> 993ad3753..f7f70dd5b 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -616,7 +616,7 @@ static void test_timestamp(data_t *data)  static void
>> test_cursor(data_t *data)  {
>>   	int flags = DRM_MODE_PAGE_FLIP_ASYNC |
>> DRM_MODE_PAGE_FLIP_EVENT;
>> -	int ret;
>> +	int ret, debugfs_fd;
>>   	uint64_t width, height;
>>   	struct igt_fb cursor_fb;
>>   	struct drm_mode_cursor cur;
>> @@ -628,9 +628,14 @@ static void test_cursor(data_t *data)
>>   	 * necessary, causing the async flip to fail because async flip is not
>>   	 * supported in cursor plane.
>>   	 */
>> -	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd, NULL),
>> -		      "PSR2 sel fetch causes cursor to be added to primary plane
>> " \
>> -		      "pages flips and async flip is not supported in cursor\n");
>> +	if (is_intel_device(data->drm_fd)) {
>> +		debugfs_fd = igt_debugfs_dir(data->drm_fd);
>> +		igt_skip_on_f(psr_sink_support(data->drm_fd, debugfs_fd,
>> +					       PSR_MODE_2_SEL_FETCH, data-
>>> output),
>> +			      "PSR2 sel fetch causes cursor to be added to
>> primary plane "
>> +			      "pages flips and async flip is not supported in
>> cursor\n");
> 
> Small suggestion with the print message can we make it " PSR2 selective fetch adds cursor to primary plane flips, breaking async flip support"
> I'm ok with current version also. With this Patch LGTM.
> 
>   Reviewed-by: Jeevan B <jeevan.b@intel.com>

Thank you, I will update the print message during merge.

Regards,
santhosh

> 
>> +		close(debugfs_fd);
>> +	}
>>
>>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH,
>> &width));
>>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH,
>> &height)); @@ -1163,15 +1168,6 @@ int igt_main()
>>   	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after
>> async flip");
>>   	igt_subtest_with_dynamic("test-cursor") {
>>   		test_init_ops(&data);
>> -		/*
>> -		 * Intel's PSR2 selective fetch adds other planes to state when
>> -		 * necessary, causing the async flip to fail because async flip is
>> not
>> -		 * supported in cursor plane.
>> -		 */
>> -		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd,
>> NULL),
>> -			      "PSR2 sel fetch causes cursor to be added to
>> primary plane "
>> -			      "pages flips and async flip is not supported in
>> cursor\n");
>> -
>>   		run_test(&data, test_cursor);
>>   	}
>>
>> @@ -1179,14 +1175,6 @@ int igt_main()
>>   		     "async flip with atomic commit");
>>   	igt_subtest_with_dynamic("test-cursor-atomic") {
>>   		test_init_ops(&data);
>> -		/*
>> -		 * Intel's PSR2 selective fetch adds other planes to state when
>> -		 * necessary, causing the async flip to fail because async flip is
>> not
>> -		 * supported in cursor plane.
>> -		 */
>> -		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd,
>> NULL),
>> -			      "PSR2 sel fetch causes cursor to be added to
>> primary plane "
>> -			      "pages flips and async flip is not supported in
>> cursor\n");
>>   		data.atomic_path = true;
>>   		run_test(&data, test_cursor);
>>   	}
>> --
>> 2.34.1
> 

