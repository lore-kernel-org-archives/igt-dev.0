Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E781109C026
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 14:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F1110E7C0;
	Wed, 25 Mar 2026 14:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vco5z7lJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0395E10E7D9
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774449668; x=1805985668;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ts5VDfRcZUzwNzPlhXArPxJhlNdjo5urfEUgE8zSz5s=;
 b=Vco5z7lJKopTTcdPRqpuoh1j5w/P9Hcj1rD/WvSHrQKnRis+LTvW7UyX
 th/xEvERmwa81KcPswvP1mu4CZw/NgSYHYN7NftGfRaHXt+EoLKlzeDNr
 OH3fubQFEWylxW0l6SNyEhcL7Gfl2bgz+O8JLBxes4CFMQvz5EOMAkZdC
 GP2Mo0xut4hLsOxQr6AaQGRaYYiI6iTFRIsJmhvCj0oemT4lwOzBsS/YZ
 6BVUOTe6vRDtVyUKDHHcvtEhiEff9RA5KXDP2m1cz0HqTrP0l0/SBXufv
 xeoHilgWBZvGH9pwMIH4/7fWizP0fDoaYsOWqgIXRuPZjLtP6bMbAvPlk A==;
X-CSE-ConnectionGUID: ut8lWJP4QJqAeaA0iMRVXw==
X-CSE-MsgGUID: kSe/zs5hSAiFETwLtAlNMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75680981"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75680981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 07:41:07 -0700
X-CSE-ConnectionGUID: hMZl6IZKRIWuki5vEqwj1A==
X-CSE-MsgGUID: b6HUay87SRCsAADV73LyIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="247734826"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 07:41:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 07:41:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 07:41:06 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 07:41:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn/5H9GB+B/xX97LeI5DsPCLD9dkWFND1hDG59tTatpMgmQcw33+LLGwTzQ4j/9vnAXdx7PoI/QELTNM7DZrHSdDFP/ABxotLnABxN32yh0rGLjRXBEZ/KS6iKbWfo37FACc7vwiAbtOCmplqtwCdymQ1tMseXjiBO3/mnAXRb3z+7y4zavWKh4cf+DlMWMe9P9V/hUTw3lEpHVNT2nb7vKG36jWZxF04FHUfhhuCxb6xD09a7xj27Q/qNwUJTlI4nEc8lC+6zlqkS5BrTr9UTwxD/TVKvQnmJZBnAo2ePZb+hWDXEbdWm3QJeeGfzpcSmK/veHhXvYiKTYn/2IweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/q5Sqjr9N/Wby5v42b4ZsLHUzNjRsENEidrPCsJzTk=;
 b=deV1Zd9ebQq/JuedoqZ7uEake2dG3HeI+0f7Mi6/0VL0RQYEUXMhOy2NXMMY3PV4UfXGgN5Mc6iBQ6NgAZbTBTxWODPW4CjTsJDiG/zXq/bsIvaSnDT/PPQmhcCyTHns6mBSeNHuJUWnW/9OvNfZ22lr2CntvBg4f9jpUFi0BW9Q357Rb4yqm2lKzhgIWm/FFY345PewrKvuioAB3ElbpA0VSPzC38QQ/7PhCgcnot8zXGJrbCchSHFTD0AwXijForCXfRMW1kS918R1QoHhUYOq9tOCT6hUyvskhvjDY8Z61xCUAOCgyLR0oWXE0ZYID5p4vUzXdGqDl4AfXLhQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.12; Wed, 25 Mar
 2026 14:41:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 14:41:01 +0000
Message-ID: <a7721b46-dbd2-447e-97d7-6cc5c72adf84@intel.com>
Date: Wed, 25 Mar 2026 15:40:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] lib/igt_core: flush output on each line
To: Jan Sokolowski <jan.sokolowski@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>, <peter.senna@linux.intel.com>
References: <20260325114901.256229-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <20260325114901.256229-1-jan.sokolowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::10) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f42e65-f98b-40bb-6af5-08de8a7c890a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 0iL/87hj5y1roSz9FW0SEMT3w3KwjkyN0hpHY/M7DkdhJ6eoQe0WScczVrtPR1OWBzch9KRwnNs/fEHGU5HqexmFgf+rLc1po5m0ovtxNh8ONcBqg8OSKLgNO0Mf/CkS8fWstzX0NvjZSo2NQhIBYIxd3dwZrGs57nRM6lLsIOaKW+ke6NvijuwSCUu8ngFy7cEIDmSmQoV4pn1QXnYnuu/T2j1Gu/xjD02D277F6rKLKzdSmRZN2qYYX2syuH14EPBvqZ0CCrrYLKm2+WzIgeLjNogywMfDlvjsvwaWV61XjnMBcAN9fQ2ED1ahyJr99IuuWleeq1qCLsPrO/fVJ7rTSNcNk53iq+U0DZy4SQCSG0drwgPaXMUcfR3hc2zHQaYA/lm8CNde4daVC58AEUeQ3s8d7+2HJjwGXkJDmmx4iLkEP4YXEs931fKjtF7ZhTdNJhErXYmyaBXHWvitviWY7kuGCLRcGHrvXk0LBu6EUKMz9kwI2id+naYOs95bEVrq4b+2KdjbBGmTYR/UWBx4u+eI8vx5HFmrRPi2bp5kPLS42AGKU+2Odj08NrzgLX9EpeZTQMyDt0DdsERyQSio363jeTSva6F/hNjRhG9XfD4qxiyTbeyILXoKAp5MGeoKSe/K3pDL28D5Od98uNG2OvvnaaDLvJVq6NaDyAJxYJxV/9UnpHYb3cA7IyH65UgZk+NOc+LS8J1/pjKMP5HYdspA9T5db7Q3P5M5QNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5YTmtFZ2ZUN1gxVGFmY2QxRnQ1T2kySDVMREE3QlR6SmR1VC9DZmxFQ2Fx?=
 =?utf-8?B?STZGMHZnTDZ6L0dGaUVJWDVrWDdZWkZFdlB2bUhEWmcxb3NIREJZWVBoWmlk?=
 =?utf-8?B?TkNIWUJ3RWlwV2hZRVRmbzV5Z2pCeFVwZUZxUk5ORGNoZG16M2EzRGdCaUFo?=
 =?utf-8?B?RWlub29EQUUzK1Z5K3gxMzRib2FoSmpOUHlCSDk4VWYreFJFY2FpR2t5YmJo?=
 =?utf-8?B?Mk9Kam9zMGF1VDhVSVlHSS9id2d4RXZhTmJZNzFja0M2SXVvdjk0K21yUE9J?=
 =?utf-8?B?SVNTWHZ2dm0zWjBxcTZ2cDhHdTY3cFRMdmZpaWgrM05lZi9ZaW9oemxOZ3RD?=
 =?utf-8?B?L042ODlmOVRaeEpxaHpPa0hRaDdWTFJLdGFXaFFxc2pXeE1ETUdLM3ZuY1JT?=
 =?utf-8?B?aGdrUnpLZVhRSWdrNnE3YXFoOGdJNmF0WVk0VnJFQWh3b3Rza29kVC9LZkdV?=
 =?utf-8?B?WVAxcDNFT0dvdXF2R1pZVm5OdkFzZmJBdWIxUk5ZVzdBdWRad2ZOd3dpS0NE?=
 =?utf-8?B?M2Z0enhKNWVVcW8xY1hmZkQ3ZXhqcmZzc0VDazBoWlU2VlNPaU9EQWNQUEd1?=
 =?utf-8?B?eXlEbEtLUG5UR2kwemJhWUlEaXlVOGlQcXduQ3pWVEM3N0VEZTFUcGZ3aDd6?=
 =?utf-8?B?K1ZRa3hlOGdiVzZlSUJndGhBMkRNUWVtZit1RnJuUkFRZDhCemxkbTJyaHR5?=
 =?utf-8?B?ZmpsaHVFUG5Bb0ZTTUtoRHJ0eDVDZVg4U0NDWTYraFltS0Jtai9WQkMyZnJ3?=
 =?utf-8?B?bDdiT2wySGRsVE9ic2RmZURQemhYU09JcGFwY095eHhkZUhralFRQXV1R2R6?=
 =?utf-8?B?cWRZai9Lenl2dXlDd1M0WktheDk1TXp3QkIxK0tBVktpWEM1QXJvMzFWKy95?=
 =?utf-8?B?bkg0c0N4UTZpdWZ2UzA0Nnp2VlZLOXV1NVFNbGt6akVSUncxY0lpajlpTklo?=
 =?utf-8?B?SVlEVFREUUlybTVoZE8zdDc5cmdFYUE0NHlvUmNIK3JaUG5TU0F4VVBNRTRY?=
 =?utf-8?B?dms3OXVTd2xEZXdlYU12RThUVFB0QlJzMEdEQmdvbmtDQUpKZWlWR0krSU5z?=
 =?utf-8?B?Y3E1ZHJ3a3MwRWtaM1NEazUrUElDS3dROXFFcFFXMkVTQjNpcmhDTUg3QnRK?=
 =?utf-8?B?cDQwbjFTWG1qWDMwTUNrOEI1QWNZYWUwY1NBS2dYdlN2VkxuaStETXRJbHB1?=
 =?utf-8?B?WVVqc1V0TlZDZjlYU2lTaFVSL1pDM1g3NmlySWRoR0tRRVRjU01wQ2dnWkJo?=
 =?utf-8?B?Ulh2b1kwa0tBMTBIeDYyNXJEL0l6Ris4OVNrTUJNdkliWGRLb0w3UER0MEZ1?=
 =?utf-8?B?YmNCZENjR2hGRmhkbm1TWlpSNjlNaFl6aFJJMXFZNVZTM3dmdSsremNKVVRU?=
 =?utf-8?B?djVscGN5ZEM4bGVhTHVIOEhYdDB2a2JsMWxMUlhFQnREd1V0ZlNDNldtTWNi?=
 =?utf-8?B?TzU0WnlySGN0cTdKSjRCWE1tSHNwM1hGM29ZRnkyNFpxUGg1SXZkcHRuWmxk?=
 =?utf-8?B?eUd5L1hBNXZoZlBSRHVBektIdzV5REZ0ajNuUzdVUmdEbWtwM3FVaGtNOVhT?=
 =?utf-8?B?WlVrU01mQ2F3WmQ0Y0FiR0xKajZqTjN6a1BzL2ZUMGdDdFVSOHhVKzlBbGpU?=
 =?utf-8?B?ckFnT3VocGdZL1ZiK3lwbmdBRWFRMUpnZU1hRmoreTBhYlVTRHdXZkFZWmNk?=
 =?utf-8?B?b0d0VlZkWmNuanFya1ZkaFg1cWY2dGJjcVJJSDVad0srNDFWeGVDbDVYUFFL?=
 =?utf-8?B?RjlBd3dCM2tkRS8vWmNaYnFwZkxYenlXZ21oNXdnNG1zWGV5RCtMWUdQTzNu?=
 =?utf-8?B?T0FHYzhNWUVJbkYzbW9HaEFQSFIwU0QwVXdBUTgyUGV1eHlsMzF1M0NidXlC?=
 =?utf-8?B?YktHSU5kZncxUzh6ZnJ6QzZsWEFValBkd2tldGZxZFhRc1k2WFJWWXE4bDZI?=
 =?utf-8?B?V1gyL3hJcm5ibWM4VWQ4Zkp2K2VISm9FVXhIdFpJaWV6YTdhSklNbE9SUU93?=
 =?utf-8?B?dGk3dVJYNUxUd1JnekYzOFl6NFZzVldBelFjbysxbkZyQ0Z2dXRxQzdFclkz?=
 =?utf-8?B?NVp2VVNNQmRxaGhSeFVnZlFTYU9jeVQ3WHltVTg1a090cjk3Y0duYW9HNENz?=
 =?utf-8?B?VzhNakM0cnJpd0VCWXZJR1ZadTlodzNZK1NFclNReUxKdHpsZ095d0NSTmxu?=
 =?utf-8?B?cWxBS24yM0RUUVJiTXFFYkdCdmtQQThCRU9DUmFHUFFFL3RPVkZMYzJsS2xH?=
 =?utf-8?B?TTZrcjg3TFRuaUV1cmpEbkVuT2FvNGY5QWJQaXFyUk9XbWdIVWg2TE9JeWpF?=
 =?utf-8?B?SlBPTS9SK3J6YXBkeWpFczBWbm53QjZnb3JCM055bThXeTNGUjRZZDlRekhE?=
 =?utf-8?Q?B+et6p0+Puu+5b8U=3D?=
X-Exchange-RoutingPolicyChecked: A4Isk7u77BLNLekTDFATQi3EupLtKX9EcF2jG2IdWsdBASla3b0OatFXLFjw+uHAQMKY+5n3Zbc6si0pEiTATiuOzBLGTIlVcHqH7Jau3KvOO0O+z6eAssqxiZBtxbh59Kich+YlyaCCZto/D3p0rJyNfUS6i7Ro9sjNnkI+yg5n//Q3o0fFqwpbAKsuTRc3CTY0ClvxeVhevKIQaF3O8rNB55CSpzUBZIXvs12Mwse3L5rlOBtRgDo21d/v12q6sy8lf0Hv9CboAC0RpxrghUlSPklz5DJD0meAhIrCGJMlWNy4jcXVwlCWHVNyztqeOC9FQLtJ3X+MpX8ZcjAlNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f42e65-f98b-40bb-6af5-08de8a7c890a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:41:01.4364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67aEyMwGaXzjjBVAI/JlAwKqSpyxSzw+Re/PIF+Xf6uukz/BrUQWhqwr2WmRW3zF/CECrVOF6ICkl2u3i/2k/vZzBDqvsdgsnmj/xpzBhmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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



On 3/25/2026 12:49 PM, Jan Sokolowski wrote:
> It was found while running tests that if a test launches threads with
> even more subthreads, some igt_debug calls might not print their lines.
> 
> Fflush after each line to make sure we see everything we want to see.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
LGTM,
Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> ---
>   lib/igt_core.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 65325f08d..ed4f48d86 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3294,10 +3294,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>   	pthread_mutex_lock(&print_mutex);
>   
>   	/* use stderr for warning messages and above */
> -	if (level >= IGT_LOG_WARN) {
> +	if (level >= IGT_LOG_WARN)
>   		file = stderr;
> -		fflush(stdout);
> -	}
>   	else
>   		file = stdout;
>   
> @@ -3309,6 +3307,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>   		_log_line_fprintf(file, "%s%s", thread_id, line);
>   	}
>   
> +	/* Ensure output is flushed explicitly, as concurrent test threads
> +	 * may otherwise cause messages to be dropped or reordered.
> +	 */
> +	fflush(file);
> +
>   	pthread_mutex_unlock(&print_mutex);
>   
>   out:

