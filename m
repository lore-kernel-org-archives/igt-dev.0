Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5245BD68BE2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 06:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CCB10E0C1;
	Thu, 18 Dec 2025 06:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvKBk/XY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC89F10E0C1
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766040307; x=1797576307;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yXjkttjpdfbYymtu35BuJ7jqiGKenri+FFInux+dO0U=;
 b=BvKBk/XYj9ICR6sJyeOFLOU17zec35fu/NnnQcBIHCV+ZSTFoD26ym0X
 jx+tDTzJKZbYZZpESGRxSNjFFra08ocJOzl7TSrHM1PfwVcpMMMGx9opV
 FolVj2cKHAxI6DhjwfeY+wQhc9ScNAzzU7NbMTIawV0jbaP7s0WMRO1gf
 CmOmT2dVQflDx3IycR320BBzTpEr5ZA/fxDe8n9c8XLL9KlBymzs4KzlU
 lD2SS1ssOYANe/JeLp5s8dRn8zUvn4HjA2UeM3PKGi0Ah0E8FM9OOxuyR
 cnaKOc/6mEsyxGUBZhZvQnF+4z6Zf3y+0YKUbPBYUzjXJ1qxdETn3Pd9a A==;
X-CSE-ConnectionGUID: yGXh+RcdR7uqdaAFc/GVyA==
X-CSE-MsgGUID: YcN+KUHpSyuwIF5JNnHYzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="93463071"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="93463071"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 22:45:07 -0800
X-CSE-ConnectionGUID: JbPFTrFlQ0ug7I6y0h+G3A==
X-CSE-MsgGUID: SCQEYcDRTbOpzZx+CpeqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="197662778"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 22:45:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 22:45:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 22:45:05 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 22:45:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywf/IcB726DZO+4wj4rcqJQ0EhLQA+D3B7PeZJOnlhdiPw2XWWn4UWg6RXAYp1oOUYynj28Am65uoVB1SwmIqanTxL8MiJs5/p2x6qPc/U2rf1GmC8sl4sIkohuhhNfAvalUER5BbaTTAjZRRzyVwFL6VgtFw3KBrkMUpLi7ZSw+z0zpE79wIc337hNzRzyN04KMu6R1pFVGIfJ8rbQpwO9F4Q17e/U3paUNYveKIrLG7rq0PeXxO01uhEOYJHQEL/jHZiMSVyP5HkHkSm5fLMdETgVTcv51jzT++mzC/lEypOWnwDG4ET68wkS8ZDJyYqcrtujw1JVspsrYydLm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6fdN5rIcJ9TyAKAPoX0ODPkwjHp+5lWX+LeQlajSwk=;
 b=VLI8XNQPyUamhaPaAUWA4T/mw0UkqOPL3RHxdKQ36Jaue4/LdxW4zfUlTSTKTjvBuy+GBwPOFOKGOVKBA4wALepzpIhllS4VgxB2NOyl8bQ2BmBRQEiqB82VBpKgdT0Dtmf0wGPNsUt37EITco1ft8WFqzHN/E0zSBw4GZbu4S9DTaLjZdeCb4SMDlUgLCjXCOcX9FihgXYxAL1RwV8in1RRtQN0JUmqji5EA4S3Wm4IuogSOjOaLQ0SqAowVjqpVP+S+fSbnu2y0rfLV6Beq+pSQdZ/vogAX2hUY1AYMCKXcGYO3ittxbUo8g4B0shsOM6ld/U78rbLYuqRkSp3kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6093.namprd11.prod.outlook.com (2603:10b6:8:b0::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 06:45:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:45:03 +0000
Message-ID: <d1d36fe2-6788-40dc-a83f-3fbc22494cfe@intel.com>
Date: Thu, 18 Dec 2025 12:14:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/i915_pm_rps: Improve error reporting for
 sysfs write failures
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>, 
 <raag.jadav@intel.com>
References: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
 <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
 <df7a74a3-c375-4485-b2d6-9cd4fb2aa5e5@intel.com>
 <b94dd113-98a2-4f23-8ed3-d8c8ee58e68a@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b94dd113-98a2-4f23-8ed3-d8c8ee58e68a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: ac89d2e6-5401-41b5-b563-08de3e00f93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVBSYTg3blNnQWhlV3Fsb0k3VjVxdmxUNGdRY0NIaEJ1bFM0WHF0aEZnZEE4?=
 =?utf-8?B?U1lEakJhUWJXV3hMUkxFdCtmdXVweEhkclkyMm5DTW5wQSthRERRZlVVZHBW?=
 =?utf-8?B?MlNmaE5RUHBBWWR1OWtjaFpyOUFWQW1aMURtYmNDczZYVmZ4TmVpMEhCeDZ6?=
 =?utf-8?B?a3BqcXB1akJnQmYxdXZyRTg4cnNsc3JwRWVBNUZieU96djYyL3doVzBXWkZx?=
 =?utf-8?B?U2VIazliam55L1V0eHZUYldQamNkNFNhYWtQQy9EU2FIL2VFUTNDWHNjcGJ5?=
 =?utf-8?B?UUdNYm95NCs1RHZZdHA5ZnA4N0xCalVRSmJjeHNvWmNUREJmUndIYmRnbDlm?=
 =?utf-8?B?RzZ1SUNFM2dXY3pFRitLZ3VKVUJubERwd3VJWmI4Mmhqc3hBZ0xMUmFTWTlR?=
 =?utf-8?B?REsranlVeFI1K1hEZzZaN0RjS0hBQkVkL2hkRklZTTJJaXgzbGkra2JYRWZ1?=
 =?utf-8?B?aUZyRnVjQ055aE5NVVZxUzNJQ05XZmxtRCt6TG9vTUhRWWZESU1WV3NTbmpF?=
 =?utf-8?B?cVlpUXZYdi9LTnBGREF0dzNTU0granMrcHpvVUE1RXFZa2FSOStDbGJjL1Yv?=
 =?utf-8?B?RUhrSVA2aC93L01heVA1QlpWZTgxejJDb3IrL2wvWFJBZHl2Ti9CYnlEM1hV?=
 =?utf-8?B?NzgxVkRqZlVtRngrdnZuYlpUbGJxZE5vWGs1WlNnVzkyTGVETVBIeHlUZkJn?=
 =?utf-8?B?a0I4Vk5KR2V5aTA5alQzSGFNNThQSFJES2hTdjh4Umpka2xUc3U3YXVBTmFR?=
 =?utf-8?B?UUl1U0tEbUJPM0doY3dXUlpjZGdPMVNZZFY3S05va1BEMEN4b1JJQXZaZ0pW?=
 =?utf-8?B?L2FiUkpDdU9vM21KSDhCTWNPWUVubS9DMkxUYXVINmJKMm5yMlZLZHpPZVEz?=
 =?utf-8?B?R25rUklaOC9ENmx0WlVsa3ZBTC8vV2RpR2x3dFJNakovTlV0N0ErWmQwNkQ4?=
 =?utf-8?B?dTB3dG5SNHE2V1lxNkc5djRwMHFzb2tqRzRKbDNNakFrVVc1MlZOK05sQlF0?=
 =?utf-8?B?RldYYzV0QkozZWJmVTdVbGYwZDlpanB1TzhWUnQzaERwdXJKbWE5b1hJWStM?=
 =?utf-8?B?V3BHalVybGJHWkVXNmJMNThrVzFON1ZxbTczQlYzc0tzY1l4eERaZklQaEFu?=
 =?utf-8?B?b1dDYVBGVFlJbWw5blQyMnFUQXg3NkRLV2FyQ2VsK2pHbk4rL1YvZGllN0dV?=
 =?utf-8?B?WU5JV1NGQldVN2hkR2dvVVRJa21FcjZENjVLN0dEeFhja1E4aXkxcFQrbHRi?=
 =?utf-8?B?ZHdvUGljK2RmMHhjZ3VWWEhaZlFQZWllRXV5eXYxNkkrMk1IQ0dVbkdkaDFm?=
 =?utf-8?B?azNibnk1WFBJNzhMWTQ2ZGFVOW5qb1lnaUk1OTZLTjZJSmV1bjVMUDQ0bWZ0?=
 =?utf-8?B?SHNtdUtHaWlXQy9ubVppYy9yQllGcnRTU0RWYjJBdFVsN2E0c1ZCdnp0MGFW?=
 =?utf-8?B?amdBM1dCS2NkWHM1SEIxYW02bjFncXZCSlFISjU0dVBjSVM3cXRGcFNqOUI4?=
 =?utf-8?B?UnVMbG5NWHJNWllLMm5IY3pWcWxjOHowSWhIUmVvVGNIZkF4QW0xbXNTMk4y?=
 =?utf-8?B?YlJ2MEFJeU5xNDMvYkJ1Y29VTytrTXQwMDBRQTBueFNidkcvTDFJa3lBOFQ4?=
 =?utf-8?B?R3hBZ0FnMlM5R3ZINmJIUFFaVDIxbUZUQmxvb0YwWGVXREpPakxVRUZCM3U2?=
 =?utf-8?B?MFlHNWJVWGdBQzJkTTBhTUpySHR3TnZZL1Q2VmlBZDFBY3VIQTFzZ0dFbHBu?=
 =?utf-8?B?M3FuVW9sK1M4YXdzNytCand6SDZHOXpJc3NhMUNCZ0g4ZDVEbzZBbVA4QVZl?=
 =?utf-8?B?RW1yM25KdlAyMmZ3eHRzVnJLSnNyYWI0STNhTmI2REVRaThOV2pDZHlMZ2tL?=
 =?utf-8?B?cjV6RmFBZUNadkRTY3lraktVWFQ4eDZzNWJObDNrNENKTTlCYXp5Z0E2bGJu?=
 =?utf-8?Q?5g9Cib9rGgX6ton0G/gUa1zyzZ1BTxNt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hodzZOZkhIc2krWDl5ZktIam9ZOEM5WEtLaUlZcW1RbEE5U1RrWmtrckhS?=
 =?utf-8?B?eW5BaEk0SmRvU2EzSWIydzNjMGd4VUc1VjBPWjBYUjg0VjZRclJ0U3RBZ2Vl?=
 =?utf-8?B?djBnNWRnTHo3SVdoNHQzczMxSGcxN0lqaWpZc0d2aFpJOElqQVVjV1dNQUpO?=
 =?utf-8?B?dkptWTU1MC9HSWI3aU5uUTFDRVRyN2FpSGU2aThBMW9GcHgwMGE0MkU3RVhp?=
 =?utf-8?B?YXlPdk92NnRWcFRzQ1BTU1dVeGhwY2V0NmIzbUhJdHdEdnF3MVJKZ1NtN3d4?=
 =?utf-8?B?NVArSHNsUmtMbDBwK3I5WFBKRkVNeDJlNFRCZDNFU2hDKzlqVUtEMUdhQXRO?=
 =?utf-8?B?MGNoT1Q1RGp5alYybnp4djJNNms1U0FPUmFPMGFidDFXTXhLZVdva085Nk1R?=
 =?utf-8?B?amJ2TXNINUVqTmFBdVl6cURoa3dZbm5XNW1ZRVppS0J2Z0VRbDMzemdaU1JJ?=
 =?utf-8?B?emdlbjhFMmkzK09LU3lmb0RFZ3hjUUh2QkhaS05BWFYyRnhwUGdPbitudjBs?=
 =?utf-8?B?aVlLTDVFYTRpUXhEaXdTY2c1Y0d0cE1EQ3E1cHd6S0cyWUxzdlA2UUJoUnVv?=
 =?utf-8?B?M1RFYUlQc01lRE5ISC9IV0Z4TGE4SUN6aUxkazUrRnlXNkllNHl4Rk93NDUw?=
 =?utf-8?B?Y1hIUVRsUUU5RmxXRDVuUG04Sk54TG5mdlo2THEwUEkyVlhYUXBRaWoyRmIw?=
 =?utf-8?B?ek1GUVlPUUNyUXF3c3RaZTZqNEFMY1FLRkJQVWMrUG1UeTBPNjArNkZRaU1r?=
 =?utf-8?B?aWtTWi85VEhCZ2daRmUyN0pCUUNpT01lUjQ0Zk10czNJTDBheTFaMmNraUsw?=
 =?utf-8?B?YUFPWnU4K1ZaMmttUnFSVzlBekpRZ0tudi91WTltVjdoRWNGdEhESHdqMG9k?=
 =?utf-8?B?bk1kOGVSaUJ2eG5FZjMzWXpVZGNyUWQvQmNhN0F0UnlUdGgrZjBueXFON2dv?=
 =?utf-8?B?WGZRS2pISStUY2c5bHNNWUN3blhlL25sY3RIY1R5Z09LRHRVK29lY1dydG81?=
 =?utf-8?B?RVB4aHAxdERuQnhNQ2hubk9tZnRKcWVaWWxTYk5CRDF2VkxIU0M3UlA3TEFO?=
 =?utf-8?B?RXFqeCs2Ly9xMDgvb2lQWkxhdVNyajlWQnJhNHc4eWRKTXJpYloyQUZUTmYz?=
 =?utf-8?B?S0w5ZXdNNFFJakF5NW9TR1RmcnRjUTI1VnJXd2ZOeisxMnhrb0xWdmo5dDA0?=
 =?utf-8?B?SUIzOHkzUmFrMkU4NWZOcUNEdnBDV2srOHp0Ymp6QnJDRVcrM3A1SWhHMHJ1?=
 =?utf-8?B?VnJDbUF3K2hIbHRzdlExU0R6RjV4ZXpETDdXb3lxMUNTa1Nuc004K1VWNGRP?=
 =?utf-8?B?amVkOXp4VmJ2aFg2S25UYzNZVno0ckN4ZDBJLzk1anZxNEVpbnhTTVRJZkZu?=
 =?utf-8?B?YzVtblh2N2lKbWJoa044Mi9TaUVVZ1hzcE9Dckx2TlUwQVhUdHJBS3BibHlk?=
 =?utf-8?B?cW1CQVpYWUJBR2c0ZU4wN0NZSithbEhnaGdmRm9KUEI3UUNYWkc3NFdZaExm?=
 =?utf-8?B?dCt5cGJ3b0ZSWW9JeXdmcThOZy8zSk9qV3RsUnd0T3VzczIyajdKUjRvTzlt?=
 =?utf-8?B?ODFxcnpLdlc4RHNyT2ZEWllJV2RYaC8zc3JGVXdDb3krZXNtYmR4TGVFNUk3?=
 =?utf-8?B?VlgxNDRyTzRMRWt1QmxlV1FEbGFvbUVLVUc3ZGIvS043T1ordUUvRWh6amVu?=
 =?utf-8?B?VkwrNWhlWXA4VEVUeHB6SW5tN2ttU1N2TGQ3OXZ5ZXRIeWMvMkpRWWZ2UDl1?=
 =?utf-8?B?S1FROGhEQzVmOS9INDlZNlkzOUVWNXBzdEtQRU5VTlN1ZEZQUEMyckd0c2Ur?=
 =?utf-8?B?bE53NThGckk2c3ErWjR3OUg1Q0c4OUJSZ2dnU0J5S3VySTNxd0wrSWJPWU5n?=
 =?utf-8?B?bGd0YUNveUZXV243cENrZjc2d0FuUHZUUkFPRUhXdk94WW8vcnd5T1VKL0FX?=
 =?utf-8?B?UExtcVVRK2VyV1A5VnVZcmFER1hLbUxMMDlyS2lYZDhKU1dQemxxSG5xUFlL?=
 =?utf-8?B?TGhZbzFhc29nU1dMWUk1czI3VU1PV01PTms5OXZ1N0o0c01zalQrZitRWWdn?=
 =?utf-8?B?NWRsaldkV3BweGNUMG5ZbzRsT1B4YTZRcHpjN0hMOERzdHd2eDJPYm9mWXJo?=
 =?utf-8?Q?309ceyPTPrf9kVrW203Qu4L3W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac89d2e6-5401-41b5-b563-08de3e00f93c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:45:03.8786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JM7t1JgXH/TLYeNdFhvobTKvAfd8yBWUbCAMwKsM/UGEghG9h40153vrM1bYlqHO7vO8C00Rrw5uzKpZz4LV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6093
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



On 12/18/2025 12:10 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
> 
> On 17-12-2025 12:25 pm, Riana Tauro wrote:
>> Hi Mallesh
>>
>> You can send a single patch directly, you do not need a cover letter.
>>
>   Sure!
>> On 12/15/2025 6:51 PM, Mallesh Koujalagi wrote:
>>> Add detailed error logging when writing to RPS sysfs files fails.
>>> This helps diagnose issues where frequency writes are rejected by
>>> the kernel, particularly after events like GPU resets or during
>>> frequency transistions.
>>
>> This looks like a debug patch. Should this be for trybot? 
> 
> This patch providing essential error context that allows developers to 
> actually investigate and resolve sysfs write failures when it occurs.
> 
>>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>   tests/intel/i915_pm_rps.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
>>> index f97a716be..02c807399 100644
>>> --- a/tests/intel/i915_pm_rps.c
>>> +++ b/tests/intel/i915_pm_rps.c
>>> @@ -201,6 +201,15 @@ static void wait_freq_settle(int gt_id)
>>>       }
>>>   }
>>>   +static const char *get_sysfs_filename(FILE *filp, int gt_id)
>>> +{
>>> +    for (int i = 0; i < NUMFREQ; i++) {
>>> +        if (sysfs_files[gt_id][i].filp == filp)
>>> +            return sysfs_files[gt_id][i].name;
>>> +    }
>>> +    return "unknown";
>>> +}
>>
>> This seems unnecessary. It's better to add a single debug log a line 
>> above the writeval similar to the function "min_max_config" in the 
>> same file.
>>
>> igt_debug("\nSet min=RPn and max=RP0...\n")
>>
>> If you want to add it in do_writeval, add a parameter name instead of 
>> searching the name again.
>>
>> Thanks
>> Riana
>>
> Sincedo_writeval is called multiple times throughout the code, a single 
> generic debug message won't help identify which specific sysfs fileis 
> causing an issue when a write operation fails.

Then it would be better to send the name as a parameter since you use
sysfs_files while calling do_writeval. There is no need to search again 
through the entire list.

Thanks
Riana

> 
> Best regards,
> 
> -/Mallesh
> 
>>> +
>>>   static int do_writeval(FILE *filp, int val, int lerrno, bool 
>>> readback_check, int gt_id)
>>>   {
>>>       int ret, orig;
>>> @@ -217,7 +226,10 @@ static int do_writeval(FILE *filp, int val, int 
>>> lerrno, bool readback_check, int
>>>       } else {
>>>           if (ret < 0) {
>>>               int freqs[NUMFREQ];
>>> +            const char *filename = get_sysfs_filename(filp, gt_id);
>>>   +            igt_warn("GT%d: Failed to write rps_%s_freq_mhz with 
>>> value %d, errno=%d (%s)\n",
>>> +                 gt_id, filename, val, errno, strerror(errno));
>>>               read_freqs(freqs, gt_id);
>>>               dump(freqs, gt_id);
>>>           }
>>

