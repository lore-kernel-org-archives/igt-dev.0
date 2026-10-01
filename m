Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3369CA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9108D10F588;
	Thu,  1 Oct 2026 07:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9y8yfCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8500910F588
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790837957; x=1822373957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=growbrgnvOvSrb7nnWghGfX2OtMUEdFc/gslbrlq8SE=;
 b=N9y8yfCJuWKCqx23/xjmMkxmlpTQQmAJjnDRXUngC6rjYKZShobZyqb5
 NT1BJTYZE+JmjGZJ2ls/aaYWfxNxr7ldG/Soaq/3G125Pph5RVc/O7x2p
 SsWjmMZMe/J11OvQox7ivJ4E0uZR+ZiQzY8oyRgn8Sd8mgH/08Mt+fpid
 XQuD2Gtu9UVNd5SQL5g2VBJ5rfNXhlu4EbgYkae1l8k6T9YVq8GpXgCYF
 MFJd2ooQVx4zW0VbAUzjEn0JrTsBJhzNP5V0/6fNUBRvbbpnzT+VsJiQo
 YOoT8cAmdyd//niQC7/VWwU1Ip+vd3oBrGjIIUpNe7yMOrxjrB+1ZYNuf w==;
X-CSE-ConnectionGUID: EKU5o+RPS0i4VUYemCxJIA==
X-CSE-MsgGUID: q5fzVWlYR1O9eGY6yJFxPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="109070086"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="109070086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 23:59:17 -0700
X-CSE-ConnectionGUID: ez3Hsob+R12Um49c51yFJw==
X-CSE-MsgGUID: j196YRrFSauezdb4k0xLcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279133876"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 23:59:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 23:59:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 23:59:16 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 23:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eaof2EBYiitOIckicWfznbM203HXR+Ox6fbUAlplxKzWZlI6KLG742Ub5RM0n0W5eNivfKrUgNIngjbS4MJJTz00ngqFyzcLZojPn/4kKrcAK4gv5iDu71L6pNxRwl7ZI8CT3RpQCsAYOlmqcBD1/5oENwwE0TU8OcgGekVqe3gWiJUmQEsDa0eh7R79hi1ZNAO/uP88vYsU7pIepMrAr418uZFRuFmjDa/1Sh+OvxNnlfT6kHBYouzaGrXZHeXmiTp75ksOga/hs5qpY2lq5PiBt4IfQP1QE/6UerSv444HEVOxbSgf5UAMTw4i706mohH+GSdxUXZWproiwjQ3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecWC+efvSMu21GtJtYV7j/o/3qr0ruSMkQ5Z/h43RE4=;
 b=oyovxK+B1KjHdu3miQu4+f4aVx2uh4TateizgEDTxnYohIzOyY02Fd/PXMVJ0h0sOr6+p7C+wv7ttQT992eAFIqPsqFmvdKkihLxRMrLRfBuri5gklktkSBzffVD54GzQB6OcTdsMVG13muwvCJU6N8lH8iK+bcPAnUZxzxf23nlGwYojWO4tjh0BlcmQ5jixx380Mc6NnsAElY4pZvFvZxzEKwYxMGaIm12cLJgYoIz68nRoWGEt/cZaptVBRsnCjHohNDfSjJ/XOFupQnDVj7+shmRcIRQPkuOPgPKugKSBGqsvOIUigdd+evYkX0OUOOysaLT0JuVlWTesYXBfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 06:59:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 06:59:07 +0000
Message-ID: <8981dc88-c74c-45cd-ab3c-c623ade9f90e@intel.com>
Date: Thu, 1 Oct 2026 12:28:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/intel/xe_ras: Add test for GPU health
 indicator
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <igt-dev@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260915133234.2105121-2-soham.purkait@intel.com>
 <d8bf0a2d-c814-4642-a232-b39bdf9b9b8a@intel.com>
 <bcc06ad3-1470-4e5f-ba7e-d84495502b48@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <bcc06ad3-1470-4e5f-ba7e-d84495502b48@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0115.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 04fe464d-edb4-4a9d-17cd-08df1f897ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: EeehwaboKZ8gG2pCZH2zrWf9SBBdJuNkRR/sfXwL+vrHOga7BSLx/3joweqpRx6I7Kp+3iMSACEUfSsi63DIQ57ZUxxTQ/9Wu+ukFmEEQ8qZnt/gvrIne+oZHsEBXtXHETUCDS2rHFiJpvdcC5AC07fG3G5o+YofZEm+2OpQn9qqhZMqdTCsJGw0862K90QX314dZW6229KRiVHYilXUW0TGDvkMxDBC4iZI+o15mhZY5Pn66q559yGaXePhK4HTO5Q23Bikdgt3iFqYLWSxNdEvaRT2HbJ40sha3jMfuzOyUkEIbJ6WO128IA39s5xjXbV/aPoQtwYduDnJ4u9q+iEZk352eQBEM5k1XuzdPcz/+C94YS0WMyE67yjJoC96JI7NwzhFpgF1TqIPPpv9L30iXkYp2WgtuQN3CmLxHlyAgUAZIXjkgb0Sz7QqplKKOnDRT5/exGZ70m0iCA7ViILQHh0S5JejkBmRz+5QDl+2lUBw71zIFSjPxmE19ns+G8tsUko6fYwzThMCZJJwneCWXpMNvffT/LeLXOFQQZ95zdMFwB/2Loy7Cb7w7Nd0nhL2M2YQOxEtPQUsjnvASwsmVtSqffacvE8sjiuN+8yVxW1lb4bOYapNGjUK1mLZhY41NOP3JJQu5IAmGsLh5tvsQy4CvVguZeMZZFgxm3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STdKdnJ0RUlBbVRHNW43c0tYbzRtRDdZUnpVZEJCNWxwZU5lWkZPZHQ4dVdI?=
 =?utf-8?B?WDg2dlRhQWkwZytwYmxiSUlJSXpESmQ2WWFTWDVpSUVqWFZKL3cxQWlJV29z?=
 =?utf-8?B?SlhhUEtSYXZnOFJEYm0vZVpucjhDN25xSXY3ekpneS9RQ3RsVndwUytqSS9I?=
 =?utf-8?B?aXdQV3FpTkRGK25EMU1oL3IxSDJoQkVyV0szVnVoT0x4eUlIS3IyR05kS0d0?=
 =?utf-8?B?cC9RenM4RTZZUVRhOUxBejFOUkxOVTkyQk5idFZ4enhwd0NnTGZ4NjhjZG45?=
 =?utf-8?B?bzBhSVlrU3JDckp5MUtWdk15NFl0MTExR1dYWnJQbnQ2YmtycmkvVDJXaXNY?=
 =?utf-8?B?N1gyYnF6bmdOMy9PK25WMlVFaHlKcmlzOHRJNTZPblVtV00zakRPT2F4QVRu?=
 =?utf-8?B?eVI5R0VvSit6THJEbTU1WWJiWDJGeTBiMXlhbnZRN0hhQ1N2WkFuQkJWalVa?=
 =?utf-8?B?QzVaRTVyRG43ZnRiQkViVzdRa2dhcVZVTWNzMlFpS2w1Z0FBT1k2L0VCMEtW?=
 =?utf-8?B?MUo0MTRIUlJka1pNMVV1cEZKYkFQbTFJdEVvdEdzVHU4NWl6MTd0Z1JMQ2xY?=
 =?utf-8?B?d0g5bWcwaW51cSs2L25lRkhvcHZuRkc1OVpXQ0Y5cnQ1VXg3Qzc0RUdCSTZ5?=
 =?utf-8?B?cnlwbXl4WWhpVVdtNVYvTEwvTThOM3lsL0R5Z09HaVRZU094cTBlSkpHdU5J?=
 =?utf-8?B?VHRNeDNNc21hMjZydkc1VTVoUHBEcmxSQTBuZzJlSGRsSm0yTlhlbE1jc1FN?=
 =?utf-8?B?YVJzVnNZTGo2ek1pMkJPa1F5NkVWMFR5czRkSEhObjloVWc4L2xKODNJMlVo?=
 =?utf-8?B?aU0wVXhqUC9WbkNub0NUU0NQYzU0RWw0NE5Dc1l5WjgzSVB2ZTMyV2wyeTNi?=
 =?utf-8?B?VDZQSi83MFVycHZlTlpkT0xaMGNqR3FDS3AwZjBRcWgwdmg3b2JSeXc2dC9x?=
 =?utf-8?B?cXQrbkVtV3JCSHdXeGpRVVN2RElEbVErN0Zrd2l3Sk13Rm5oNXhhaTFHNU95?=
 =?utf-8?B?a1Y4ZDVyWVQ2SU1NTDNUb0VBQUZObmgrdENxL2NLUmhxckczSTlXOWJwbnJu?=
 =?utf-8?B?K05XMDRWZmJKZ3A1OTZrRXBadTd6c3dHWTVJUlZIcUNPMXBKYzBZTnNrdmV0?=
 =?utf-8?B?S1ErK0xuTmZ4T1JCRDBKbStEOWt0S3NTNWdqWXR3MWR2anFzbjhXVUViQ3ZH?=
 =?utf-8?B?QTZUWHY2MCt1eDRuY0VnWDhLT1lldGR3Y3o5NzljL3JlYmtOV29sNWhDMWta?=
 =?utf-8?B?bmtaTkdPRnRCdnliR3I4SjFUaW9rR0E1b1pFZFkyLzRWVFpkNTF2L0YzckN1?=
 =?utf-8?B?cHVTNzF1Qis4NFhNYUg2UkkwOEEwbHp3ckhoVjEwUSt0MUk3OXhRSTlRbnRp?=
 =?utf-8?B?dnNleVhhcmFuOHBhOGI2cmNZV25pOVJwUzJPUkdjZzZGamp0SklHeVBEbExU?=
 =?utf-8?B?cmVtMGJ0Sms0d3ljUHRNdnZvbUFkNkdxayt3Z2Q4R2RobUwwZ25DVFVNZ1B6?=
 =?utf-8?B?aU56MnNRVm5lbmt1VUNMOUdaekQzaWk3RmNtMWpvb0JGS0dIWnR1cUdFNjRL?=
 =?utf-8?B?TENBejQ3ZWpUQlNNdkRQcSt6TlVtdmIwbkNYVnNxeWo2c1VjVEtXVnQ0QUQ5?=
 =?utf-8?B?cWsrbkhkb1ZrYkxGck9oMWo4M21NTkJyVGROQ2lzQ1ZUVEM1Q2hOdWdKZUtS?=
 =?utf-8?B?b1k2MU1GS0M4R3dOb0djUnlVaCtteENnMTRsSjJYcmUvWXE1UEQ1NG5jNEFh?=
 =?utf-8?B?eFZrTkE1UUNHK2hDWk91S3FkQnBHaG4vUWM4OWF1V0FGRnZkNnEzZHl1UFlp?=
 =?utf-8?B?WXJDbXFGZ0RpVjIyVGZzVGVHU3JteGcyUFhiUmVSK2ViR09yUU5zRlAyVVVE?=
 =?utf-8?B?ODFOMTlGT2FjWHNXUVhXWE12T0FTejNTaWJqa2JxSm1ub1pDZTNmN3hWRmh5?=
 =?utf-8?B?ejRldVROSVpJeVNHdSt4WVNtVmpMTzJEWHBSeVZCYXgySWtSM0w5RW9LRmRF?=
 =?utf-8?B?Q0l5QnN4c2xKOUo2blV4TlhUVnlHdXJOSW9OeFpNVU14NHRVUEdja2FTNzZt?=
 =?utf-8?B?ZElyZjk2SXdRS0dFMVJpcyt3ZmpuMGlHTEJVeEx0UjBUbWV0Ky9kYmlmMHNr?=
 =?utf-8?B?dWMwMTB6QitTRnJ4c1c2dlBRS3NwV2NRSktudVFqMkUrVWVza3Z3SHJadzFl?=
 =?utf-8?B?WStmVDg1Znd1QWtjbkJleXpFSmxVbExIcVMwNDRQeGhKdEx3TGZxeEE2bHRS?=
 =?utf-8?B?TGx4VFpzRGgwTTZJN2RmSVRyTzA4Ny9Rbll2Ni9FaEtuMEQ0Yy9Id2Mwc21Z?=
 =?utf-8?B?OXFUTHkvRmwzbVB4UTlPM2F2RDlsSncxQVlsMEllMDFwWTREQWRXUT09?=
X-Exchange-RoutingPolicyChecked: bB28WKbS9SzkhrFzdBglhYgTvVwfn4vmHRhqdE6Z8nRc3msCqF95LQcke52zlt6xShUVBkPRhaCZIyppAZ09998pVVJ9xV/j27ftB9kACsCAMn+GGEFWxyUKLM6kxrKBL8mzL7mT5yiYM7UnJ+kQPfK7gZ8Iua5LRBSU8rftpxW0y+547h8J7UXhI7TLH58rcUqoaG5foTEy+KIe6N+t3b7e4PU1+GdeKsUwenbU5wFfPiOZ/yVJQXmxvLp8c/ghCOack+Y8bGGi6VRWbpZDuRMQCeEJhkrvFJxpL+kALmZ1jF+DxWsLKvnu9g46Qu1huHphRC3Bh2g+kWJysidDwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fe464d-edb4-4a9d-17cd-08df1f897ceb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 06:59:07.8111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGOfSOgbdlqoJxFvvA9zhHPiBNOoeIXvwF5uPCk+ZH94LODrTIwG7xVxBZ2zwFqL1zMuasXcd4rRMXivvczvrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
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


On 01-10-2026 10:02, Purkait, Soham wrote:
>
> On 30-09-2026 10:21, Tauro, Riana wrote:
>>
>> On 15-09-2026 19:02, Soham Purkait wrote:
>>> Add a new Xe RAS test exercising the gpu_health sysfs attribute
>>> exposed by the Xe driver on platforms that provide the system
>>> controller. The attribute reports and allows updating the GPU
>>> health state.
>>>
>>> The gpu-health subtest validates each valid state by writing it
>>> and reading the value back, and checks that invalid writes are
>>> rejected with -EINVAL, guarding against regressions in the
>>> implementation.
>>>
>>> v1:
>>>   - Add platform-conditional skip and exit handler. (Anirban)
>>>
>>> v2:
>>>   - Add dynamic subtests for each case. (Riana)
>>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   tests/intel/xe_ras.c | 146 
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>   tests/meson.build    |   1 +
>>>   2 files changed, 147 insertions(+)
>>>   create mode 100644 tests/intel/xe_ras.c
>>>
>>> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
>>> new file mode 100644
>>> index 000000000..91233e72f
>>> --- /dev/null
>>> +++ b/tests/intel/xe_ras.c
>>> @@ -0,0 +1,146 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include <errno.h>
>>> +#include <string.h>
>>> +#include <unistd.h>
>>> +
>>> +#include "igt.h"
>>> +#include "igt_sysfs.h"
>>> +
>>> +/**
>>> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) 
>>> functionality
>>> + * Category: Core
>>> + * Mega feature: RAS
>>> + * Sub-category: RAS tests
>>> + * Functionality: ras
>>> + * Test category: Functional tests
>>> + *
>>> + * SUBTEST: gpu-health
>>> + * Description: Verify the gpu_health sysfs attribute accepts each 
>>> valid
>>> + *        state (ok/warning/critical) and rejects invalid writes
>>> + *        with -EINVAL.
>> Provide a brief description. Don't we need description for each subtest.
>>
>> ++Karthik for Category check
>>
>>> + */
>>> +
>>> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
>>> +
>>> +#define GPU_HEALTH_ATTR    "device/gpu_health"
>>> +
>>> +static const char * const gpu_health_states[] = {
>>> +    "ok",
>>> +    "warning",
>>> +    "critical",
>>> +    "bogus",
>> invalid?
>>> +};
>>> +
>>> +#define GPU_HEALTH_VALID_STATE_COUNT (ARRAY_SIZE(gpu_health_states) 
>>> - 1)
>>> +
>>> +static struct {
>>> +    int sys_fd;
>>> +    char *orig_health;
>>> +} gpu_health_ctx = { .sys_fd = -1 };
>>> +
>>> +static void restore_gpu_health(int sig)
>>> +{
>>> +    if (gpu_health_ctx.sys_fd < 0)
>>> +        return;
>>> +
>>> +    if (gpu_health_ctx.orig_health)
>>> +        igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>>> gpu_health_ctx.orig_health);
>>> +    close(gpu_health_ctx.sys_fd);
>>> +    gpu_health_ctx.sys_fd = -1;
>>> +    if (sig)
>>> +        return;
>> Why?
>
> Is free() or igt_info() safe to call when fatal signal is being invoked?
> Seems like these are not async-signal-safe.

I see other tests using it. Do you see an actual issue?
If so, please store the index instead of char and access the array here.

Thanks
Riana

>
> Thanks,
> Soham
>>> +    igt_info("Restored initial gpu_health to '%s'\n", 
>>> gpu_health_ctx.orig_health);
>>> +    free(gpu_health_ctx.orig_health);
>>> +    gpu_health_ctx.orig_health = NULL;
>>> +}
>>> +
>>> +static bool valid_gpu_health(const char *s)
>>> +{
>>> +    int i;
>>> +
>>> +    if (!s)
>>> +        return false;
>>> +
>>> +    for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
>>> +        if (!strcmp(s, gpu_health_states[i]))
>>> +            return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static void setup_gpu_health(int xe)
>>> +{
>>> +    gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
>>> +    igt_assert(gpu_health_ctx.sys_fd >= 0);
>>> +
>>> +    igt_skip_on_f(!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, 
>>> GPU_HEALTH_ATTR),
>>> +              "gpu_health sysfs attribute not exposed by driver\n");
>>> +
>>> +    gpu_health_ctx.orig_health = 
>>> igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>>> + igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
>>> +             "Unexpected initial gpu_health value: '%s'\n",
>>> +             gpu_health_ctx.orig_health);
>>> +    igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
>>> +}
>>> +
>>> +static void test_gpu_health_state(const char *state)
>>> +{
>>> +    char *health;
>>> +    int ret;
>>> +
>>> +    if (!valid_gpu_health(state)) {
>>> +        ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
>>> +                      state, strlen(state));
>>> +        igt_assert_f(ret == -EINVAL,
>>> +                 "Write of invalid value to %s returned %d, 
>>> expected -EINVAL\n",
>>> +                 GPU_HEALTH_ATTR, ret);
>>> +        return;
>>> +    }
>>> +
>>> +    igt_info("Setting gpu_health to '%s'\n", state);
>>> +
>>> +    igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, 
>>> GPU_HEALTH_ATTR, state),
>>> +             "Failed to write '%s' to %s\n",
>>> +             state, GPU_HEALTH_ATTR);
>>> +
>>> +    health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>>> +    igt_assert(health);
>>> +    igt_assert_f(!strcmp(health, state),
>>> +             "gpu_health readback mismatch: wrote '%s', read '%s'\n",
>>> +             state, health);
>>> +    igt_info("Verified gpu_health state readback for '%s' 
>>> successfully\n",
>>> +         state);
>>> +    free(health);
>>> +}
>>> +
>>> +int igt_main()
>>> +{
>>> +    int xe;
>>> +    int state;
>>> +
>>> +    igt_fixture() {
>>> +        xe = drm_open_driver(DRIVER_XE);
>>> +        igt_install_exit_handler(restore_gpu_health);
>> This should be inside igt_subtest
>>> +    }
>>> +
>>> +    igt_subtest_with_dynamic("gpu-health") {
>>> +        setup_gpu_health(xe);
>>> +
>>> +        for (state = 0; state < ARRAY_SIZE(gpu_health_states); 
>>> state++) {
>>> +            igt_dynamic_f("%s",
>>> + valid_gpu_health(gpu_health_states[state]) ?
>>> +                      gpu_health_states[state] : "invalid-input") {
>>
>> Why do we need valid check here?. This is anyway done in test_gpu_health
>>
>> Thanks
>> Riana
>>
>>> + test_gpu_health_state(gpu_health_states[state]);
>>> +            }
>>> +        }
>>> +
>>> +        restore_gpu_health(0);
>>> +    }
>>> +
>>> +    igt_fixture()
>>> +        drm_close_driver(xe);
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 1ac89bab7..3c2d4fdda 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -333,6 +333,7 @@ intel_xe_progs = [
>>>       'xe_prime_self_import',
>>>       'xe_pxp',
>>>       'xe_query',
>>> +    'xe_ras',
>>>       'xe_render_copy',
>>>       'xe_vm',
>>>       'xe_userptr_pressure',
