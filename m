Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DB1C43602
	for <igt-dev@archiver.kernel.org>; Wed,  1 Jul 2026 14:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD42510E391;
	Wed,  1 Jul 2026 14:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzIiN6wS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0592088BE3
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2026 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782916756; x=1814452756;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+tAlzKkYmt4+UiSfnZ7YbuCtQk6+LoiUiB477ALE/Mc=;
 b=FzIiN6wSHBsPHsGgaaUyFyC7C5azXclEo4k5QQFk44I7XeRlLIhTrn2z
 aa/nXw01MyG8P3Gj762Mb6OLmgYWB2E7DWHdzPnOe1XdjnQ9vSTEDmriu
 GXJ+4lYWC66K+VvuwkFQqcfp58xp7Z4mZqpYl14mw6hJ7yeMfnvtFQs92
 LsWs+SUQ558HmZjaJmudJXqabKeW+B9bIhwyHEV0t6ucXPwqYCdKSQ0kF
 eVmdMMzj0Kb0UjcPV+kLvbTHD7SR7DdtaZ3XFhOZHIpSyUlwEbxhE9Xjh
 wtRRoVGaQhznIkt2b6BRXow3ErZmfKfDn17RW9bIa2UZNrGpZyBCCtJUO g==;
X-CSE-ConnectionGUID: 2fki8+bITzevPbFe8ptuIA==
X-CSE-MsgGUID: Lh3IQfC7TheMNcl5jw42SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83681786"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83681786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 07:39:08 -0700
X-CSE-ConnectionGUID: zfxAeXqMSKC1ZZyMaEE8vQ==
X-CSE-MsgGUID: imZC/6PYTzKA6Q/lkYOUnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="248603599"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 07:39:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 07:39:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 07:39:07 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.55)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 07:39:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rn3PE4Gv9XxP6uxAJ97oaCcWsEMu8YLLdaE4pacAWWwzTFjp+3+jQeJ/pFGYZOD7hVOasGaJx+/eJPmOD3UyDK6npII5Evje9bG0ycCnbJuEil8PZcSYovIn6KF3zzgt9IuxpBKhkBmF4I9W/H/FzgieP/2mCtHk5+Fjm+asG0D7CSDls+ukCqXO4xWQZyJbYNmYv+wZn5ZHWAvDZAzY3T1mPY87pwVShOQTpILGNoIWSp9yVa41kyfqgGOZS/ejPx607oF+/bYyVp3VC1unO/XylWk6fCi9973KUNaGVi8uXpGmUyChF0fK/UPPnXzI8zNGAI6Mbg+5czzTruv2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B184EfRosVIAzI9yKOdk68/1wuex3lTNJ9y6AJTf4s=;
 b=D2DSb3H/zMdnpSsmQ/bK12qzi9JMmsg5OqHQhQ6y+dTuJHCgxEODi0NRkPMiOxzwdHJf36/laVzQJ0pAz9RKrJMmRek2hyusyYQG4SyAZj+T94z1EmlJQINB+OqzJz26ZP0OopVducTuCO09JYdjhAXswdShvlxofu2sltJt0ekkOEF3WkEJXdPY0dSDmvffi24MLif9cwUs58AIjaOA268oZYx9hHc+Crimgh7av6i0IdhfQ1vsPmF+aoM3Bjn626dJpqsj9L34ZnQmrVBlXkR1IkYkt3pDv4m8lKnDLfZBWLgdrmLIzJunCvl9iO2xZPVZToj8fLVB6JjvlYZ/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:39:04 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 14:38:59 +0000
Date: Wed, 1 Jul 2026 14:38:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 2/7] lib: Implement generic platform filtering framework
Message-ID: <sltn2sovlc526c6y3cnnclgt3w4xrzocfp5k33sx75msitcmne@tk3moippuwve>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
 <20260630032442.200729-2-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630032442.200729-2-vitaly.prosyak@amd.com>
X-ClientProxiedBy: DU7P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::11) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA0PR11MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a554acc-78ee-47d4-cfe9-08ded77e7c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|3023799007|4143699003|56012099006|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: PDUbACYI4kvLF2owHeuspQCuuiOQ/ADhkuw9t44AQfOA0F78Ix3A2/uygkh7ZrzPQxtsraEERtm4UN5x9g8Cw+MEBfrt65T0Z7LeA20qyr9mW19hwDNNLvKY3+CxGmWZlp9DO/MSzzjvmXGs5BPIWt8UijtIPEzbV+VAoeG647YjiwTbqw+LFlCo5bt1pe3yNhCex9cs0eXI6dXO2iMXkeUZHrdhcWK8BXZb7vQX7tn3GyPChzIfx70IYiMsPPYvXqTxcc4uKrATkdAU2AHxWMsu0qyCYhBMpI1SFXcZRkYz7MUBKqjsecTo+JXm9uH+nZfimFKtUdmuK2vOUlQQPs5zuH/vQdkYAYasog3ix+JORk5gK4QN5O8slvefCSaRfaTVr3QA9+nCl/CEKNBN9uM3hKo4HfjwkaEdzDNrPq4AHEzc3IDSmlKgGUWhOGOiRqYL2pq60nh7Fam4VyoAyVohzIdruKxETZpedvlRiYnnMulJHGNgHhw5jc0RLveNiiX+aBYxYzGje6ltHIMzS40XSWiEDBqurHUuqcb27y1LJqvL9l4eVI5qoZqSOgx8mCFWRfNuOh2nUxfQuGwNLCl1xu8xps5ofyfSL5rbbxu4jL2VJ4yNkt/VcChzJjOguT1CHtBAGmpXJMLxsnpTLf82zm9P7vNdJKD1EQD3Hjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006)(5023799004)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFRXZzFhc0hqVytxbjMySVlMNE9rdlovNTlmK3NGVlR3SG02RDNMeUllOGFF?=
 =?utf-8?B?MDJKYnpsekJOQ0VhbHRvNU0xaWl2TXNIdnBUeUlmZnRIRnFqb0VwSzlmRlNR?=
 =?utf-8?B?ZE55MkFRbkU3amF0NkdwUnFJVzFia3FKMVQzQmk4R21mVWZHS0doZWpWY3VL?=
 =?utf-8?B?WHpXckRkN3pGZ200RUJ1YjJTazl5MitCN2tWZldBTFpySTN1V05WY0ViZmpj?=
 =?utf-8?B?VDU5Vlc2dmdKK3YrMXVzK3JjWnVxdkc2c1NNamdEM09lUUgwcEFVM3RaYWlY?=
 =?utf-8?B?VktRMmRaK3pwNG83UGFxZGMzTUJhZytLb29pWlZ1Mjg3NG8wV0lwY1ZBbFVJ?=
 =?utf-8?B?dFQ2Z3Z0MEN0TFNJV21KTzdTWGRFUzBDTks3ZWxDNTFaeWNVS3VFeWErQ0c1?=
 =?utf-8?B?V3p5MFVKMUR0K29sMHZnNnpoTmVkRWtwYjN0N0h2dTlJYm4raDZyM093Qkh3?=
 =?utf-8?B?Y3BybFhSODF6SHJwK0toNXFnV3ltZE5jZFRXUnhHN01wWHhFaTlqY0hSTUM4?=
 =?utf-8?B?ZXlLUkxzOU9na1hPNGlhYTVxOFFveHpsMDIrNHNnVFBQdDBvYjg5ek5kVDNS?=
 =?utf-8?B?WW0ySGVSd3lIN1BiSUZRaUVxa2o0MjVVb0Z1SnJRK01RQndMRk05cEFXemty?=
 =?utf-8?B?R0tMdWIvczlMeEoreHh6VHNsV3YzemJldjJCOWhyNXNITXhGTFRYQlBZQU9w?=
 =?utf-8?B?TTJramFRZGFlckMzTzNQNnA3M3dXRUFkUzFCUnByeHArZmpOcWhEQlBMbFFE?=
 =?utf-8?B?bDlkVk9IVnNwZ3Q1OEgyUE5HSW9FZXh5ZkNDbVVkSVdhM3VjSHhMR1pUWmRU?=
 =?utf-8?B?NU5Ya2VYenBaTmU2KzNVSGRyZTJWYm5vZG5IKzhJajhWcEJVKzZ0Qnl2ejUy?=
 =?utf-8?B?QnZVQVlyNDd4WHd2WXRIN0hMWTlXcC9EVUIwd1YxekRYc2lzd3hoVm44eVJk?=
 =?utf-8?B?M1FSYlZudmwwQUp6U2hjdE03dHdrVTJ0QnFqTkJmaCt6bXN6aWUwUzRoNlEy?=
 =?utf-8?B?LzNBSnNKN3Zpbi9iQTlHdG9NSEloTmZxYzAzR2dXaGZnUkNjVkFFd3crSng0?=
 =?utf-8?B?ajNCSHkxMjcvQXJsU2xqOVY0L3J3L3dzb3RZQjRJMWRNYVAwSzYvcmpsU1N3?=
 =?utf-8?B?bVYxd25XWm8yTFJBZFJJRnV4cUhLUlM2UXY1QklXN0lxSjJlR1h0ODJvcUpa?=
 =?utf-8?B?VXhSSUw3OTNHSDE2KzFHUG5sUTNHbERZNjhLUEh6SEtSUFF1SWpJTHAwUjJK?=
 =?utf-8?B?WEoxOFJ2MW4xdnFmWFVraXY4dDl6aEw0ZS9wdlR2L2ZleCtVdXUxYmVFalVm?=
 =?utf-8?B?bWJNUEZJYXA1MXdGaEZ2QnlRL1BpMEdranhCSXhCbGw3d1ZLRnhRTVIybHdS?=
 =?utf-8?B?akVURm9xZVJSZmtOL1Fna2NkOTRmUXQ5aldGVzkrSlJHYTd2OUxSbUgyTlQr?=
 =?utf-8?B?RTd3cWNWbEZmdkRvbmJQeVE5bnJHbHhKaTVLQkl1MzFCWDJqeVRML3FMZG5p?=
 =?utf-8?B?QWE2RnhBbWNMMUpZYWNqSEtianVJU3N5V1NEdlZqeXdnMmpLbzI3eHRGL0ZY?=
 =?utf-8?B?b3JwUWJlRkNsTUw3cTQ2YkhiTlJLN1lFTDlxL24xYzlVRmZWL01SSzNJR2hV?=
 =?utf-8?B?K1VkMXZMWWZuU0cwUE5BdC95YTNSYmpKUFB5WnpKUEMxWWpqU3dLY2NUVzdv?=
 =?utf-8?B?WnpEV2JBVlF4dllTQTRaZ21JaW1Bd3Y2K3paYXdaNEQrem9UcVdoRmliTFZH?=
 =?utf-8?B?cUtZVnB6NHQyZnIxWEpLUmc1eEZKNTFTV1VmTDA5RFk1UkNyNUhUZmFmT21l?=
 =?utf-8?B?ZWNZSHNmMi9NbnY5UzI0L0l4QUdiZGRIcUpWRGhlQVFJTys1SWFINlF4TTV4?=
 =?utf-8?B?STdKZng3dm51NnJCWUxySFIybmZmaExhVHQ4RDBZNHlJTTlNVlFhTVM3VUJ2?=
 =?utf-8?B?K3RaR25YTGdxd090UU1TQldsWGhmMDd4d3ZBalhLN3VnV01TVzVYNFpiN1gv?=
 =?utf-8?B?T29uelF4cG5RUnpUK1R3dThKRFZsWVEyRXBJR0lNNDNkb2VBOEJocHg2MW5y?=
 =?utf-8?B?a2VwOEpuVDdoTTExQTB1QkpjdDI4dnV0SHZES0NlTGk2YVFqMXBiNjVBa1VJ?=
 =?utf-8?B?Uy9KcUl1OEtDMHAvVEhDWmZ0UVZvVEVObXJnamQwK0wrTXIzYmt2TnZ4MS8w?=
 =?utf-8?B?aEhybCtFVFB4VzJEUDlDbFBpbDJvcXh2ZFN5blNvc1FTVWRTYWVXV1BDbng2?=
 =?utf-8?B?Sit2QzNBWlJicXZRdWp1ckpFekZqR0ZCNExmdzlOWFR2MXZxdW95b05iTUN6?=
 =?utf-8?B?akYrMEowdDM1QmJYRjg2czh5c2gvWndCcCtXalZmZXoyekh1Ty84ZkQ5Ym10?=
 =?utf-8?Q?qPAWb32JZ4GeLLXc=3D?=
X-Exchange-RoutingPolicyChecked: LGColrkM+ody4AMllIl+42lNUZb4rTJxzWPGslv57h2Ybr84aHBK2mljFfjWGm2thMgQnTGWkPmCthdYrGK+E2AUw74xo6BVfkRwvixm+hfqaFwsBGZsdTteimk9D3hhh2dkS2kuqjykiFLxfgmp7I5tFTNyZEwgL4mKPRkTowYpnwK3VIPOP80n4zNBww6v1W00lbJtfY2mjgzBc/F7B3Zr6DZuoOZC5h/z7WJOgJe2Dt6VWA1dIJNK11b50cwehVbcehNrH5yHQkxEeplTG0DWBJ8aRwIxIVMwdX6R/o3Hn+mzViB+tK5w7WiLLGZ8WGcaXb5ZMSu4AGxq4SCrTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a554acc-78ee-47d4-cfe9-08ded77e7c93
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:38:59.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1DnCeCoUouj68DzQJTm/T7t3vAYzFIZn8JKCMHP0I5+k0bEDMHJM+1Wsd4pHl5s6BI3oGydJyNt8xxh9YMYr+W7d18lVXZ+5h4ZUbh2QV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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

Hi Vitaly,

I left some comments below, mostly nits and questions.

On 2026-06-29 at 23:23:21 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Implement the vendor-agnostic platform filtering core that provides:
> 
> - Three-tier priority system:
>   1. Built-in rules (highest, vendor-specific, requires rebuild)
>   2. Config file /etc/igt/platform_skip.conf (no rebuild needed)
>   3. Environment variable IGT_PLATFORM_SKIP_CONFIG (runtime)
> 
> - Config file parsing with format: platform:test:subtest:reason
> - Environment variable parsing (semicolon-separated entries)
> - Wildcard/glob matching for test and subtest names
> - igt_platform_require() integration with igt_skip()
> - Dump functionality for debugging filter state
> 
> All state is held in struct platform_filter_context (no globals).
> Vendor backends are accessed exclusively through platform_filter_ops
> callbacks, keeping this code completely vendor-neutral.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> Change-Id: I0a6ce532c2ef9913e68c9a23c8b9e642443a367e
> ---

[...]

> +/* Helper: Check if entry matches platform/test/subtest */
> +static bool entry_matches(const struct platform_filter_context *ctx,
> +                          const struct platform_skip_entry *entry,
> +                          const char *test_name,
> +                          const char *subtest_name)
> +{
> +	/* Check platform match using vendor callback */
I think comments in this function are superfluous, the matching
is self explanatory.

> +	if (entry->platform_data && ctx->ops->match_platform) {
> +		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
> +			return false;
> +	}
> +
> +	/* Check test name match */
> +	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
> +		if (!test_name || !match_string(entry->test_name, test_name))
> +			return false;
> +	}
> +
> +	/* Check subtest glob match */
> +	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
> +		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* ================================================================
> + * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
> + * ================================================================ */
> +
> +/* Parse one line from config file */
> +static bool parse_config_line(struct platform_filter_context *ctx,
> +                               char *line,
> +                               struct platform_skip_entry *entry)
> +{
> +	char *platform, *test, *subtest, *reason;
> +
> +	/* Skip comments and empty lines */
> +	line = trim(line);
> +	if (line[0] == '#' || line[0] == 0)
> +		return false;
> +
> +	/* Format: platform:test:subtest:reason */
> +	platform = strtok(line, ":");
> +	test = strtok(NULL, ":");
> +	subtest = strtok(NULL, ":");
> +	reason = strtok(NULL, "\n");
> +
> +	if (!platform || !test || !subtest) {\
In previous patch "*reason" was annotated with "(required), but
just below you insert "No reason" yourself and it is a bit
confusing to me - is the reason required from whoever fills the
skip entry or rather "this field cannot be NULL/empty" at the
end?
If former is the intended way, then here you should probably
check for !reason as well (especially when you explicitly state
the expected format in the igt_warn below).

> +		igt_warn("Invalid config line format (expected platform:test:subtest:reason)\n");
> +		return false;
> +	}
> +
> +	/* Allocate and copy strings */
> +	entry->test_name = strdup(trim(test));
> +	entry->subtest_glob = strdup(trim(subtest));
> +	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
> +
> +	/* Parse platform using vendor callback */
> +	platform = trim(platform);
> +	if (strcmp(platform, "*") == 0) {
> +		/* Wildcard - no platform restriction */
> +		entry->platform_data = NULL;
You could avoid a bit of code duplication and skip this first if:
platform_data == NULL with current logic means that a wildcard
was used or there was no parse_platform_config available anyway.
It'd be something like this:

if (ctx->ops->parse_platform_config) {
	...
} else {
	/* Wildcard or no parsing function */
	entry->platform_data = NULL;
}

> +	} else if (ctx->ops->parse_platform_config) {
> +		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
> +			igt_warn("Failed to parse platform: %s\n", platform);
> +			free((void *)entry->test_name);
> +			free((void *)entry->subtest_glob);
> +			free((void *)entry->reason);
Are these casts needed?

> +			return false;
> +		}
> +	} else {
> +		entry->platform_data = NULL;
> +	}
> +
> +	return true;
> +}
> +
> +/* Load config file */
> +static void load_config_file(struct platform_filter_context *ctx, const char *filename)
> +{
> +	FILE *f;
> +	char line[MAX_LINE_LENGTH];
> +
> +	f = fopen(filename, "r");
> +	if (!f) {
> +		igt_debug("Config file not found: %s\n", filename);
I wonder if this is going to confuse folks, because usually
"file not found" is associated with some kind of error. I think
you could skip silently here.

> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from: %s\n", filename);
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
> +			igt_warn("Config file has too many entries (max %d)\n",
> +			         MAX_CONFIG_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, line, &ctx->config_entries[ctx->config_entry_count])) {
> +			ctx->config_entry_count++;
> +		}
> +	}
> +
> +	fclose(f);
> +	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
> +}
> +
> +/* ================================================================
> + * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
> + * ================================================================ */
> +
> +/* Parse environment variable entries (semicolon-separated) */
> +static void load_env_variable(struct platform_filter_context *ctx)
> +{
> +	char *env, *env_copy, *entry_str, *saveptr;
> +	const char *env_value;
> +
> +	env_value = getenv("IGT_PLATFORM_SKIP_CONFIG");
> +	if (!env_value || env_value[0] == 0) {
> +		igt_debug("IGT_PLATFORM_SKIP_CONFIG not set\n");
Here too, if it is expected that this env variable may be unset,
then maybe skip this log entirely or reword it to be more
informative and less error-like.

> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n");
> +
> +	env_copy = strdup(env_value);
> +	env = env_copy;
> +
> +	/* Parse semicolon-separated entries */
> +	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
> +		env = NULL; /* For subsequent strtok_r calls */
> +
> +		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
> +			igt_warn("Too many env variable entries (max %d)\n",
> +			         MAX_ENV_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, entry_str, &ctx->env_entries[ctx->env_entry_count])) {
> +			ctx->env_entry_count++;
> +		}
> +	}
> +
> +	free(env_copy);
> +	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
> +}
> +
> +/* ================================================================
> + * PUBLIC API IMPLEMENTATION
> + * ================================================================ */
> +
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +
> +	if (ctx->initialized)
> +		return;
> +
> +	if (!ops) {
> +		igt_warn("Platform filter ops is NULL, filtering disabled\n");
> +		return;
> +	}
> +
> +	ctx->ops = ops;
> +	ctx->platform_info = platform_info;
> +
> +	igt_info("Initializing platform filter system (3-tier priority) for vendor: %s\n",
> +	         ops->name ? ops->name : "unknown");
> +
> +	/* Get current platform name */
> +	if (ops->get_platform_name) {
> +		const char *pname = ops->get_platform_name(platform_info);
> +		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
> +		         "%s", pname ? pname : "unknown");
> +	}
> +
> +	/* Priority 1: Built-in array (vendor-specific) */
> +	igt_debug("  Priority 1: Built-in array (vendor-specific)\n");
> +
> +	/* Priority 2: Config file */
> +	igt_debug("  Priority 2: Config file /etc/igt/platform_skip.conf\n");
> +	load_config_file(ctx, "/etc/igt/platform_skip.conf");
I wonder: why this location for file? Wouldn't putting it
inside IGT work as well? Or letting users pass their own conf
files?

> +
> +	/* Priority 3: Environment variable */
> +	igt_debug("  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n");
> +	load_env_variable(ctx);
> +
> +	ctx->initialized = true;
> +	igt_info("Platform filter initialization complete\n");
> +}
> +

[...]

> +void igt_platform_filter_dump(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, total_count, count;
> +
> +	if (!ctx->initialized) {
> +		igt_info("Platform filter not initialized\n");
I wonder if the change in severity is deliberate: in
igt_platform_should_skip this message was a warning.

> +		return;
> +	}
> +
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n");
> +	igt_info(" PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +
> +	igt_info("Vendor: %s\n", ctx->ops->name ? ctx->ops->name : "unknown");
> +	if (ctx->current_platform_name[0]) {
> +		igt_info("Current Platform: %s\n\n", ctx->current_platform_name);
> +	}
> +
> +	/* Priority 1: Built-in array */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n");
> +	igt_info(" Source: Vendor implementation\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	total_count = 0;
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			total_count++;
> +			igt_info("  %2d. %s : %s\n",
> +			       total_count,
> +			       entry->test_name ? entry->test_name : "*",
> +			       entry->subtest_glob ? entry->subtest_glob : "*");
> +			igt_info("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
> +
> +			/* Print platform data if vendor provides dump callback */
> +			if (entry->platform_data && ctx->ops->dump_platform_data) {
> +				igt_info("      Platform: ");
> +				ctx->ops->dump_platform_data(entry->platform_data);
> +				igt_info("\n");
> +			}
> +			igt_info("\n");
> +		}
> +	}
> +	if (total_count == 0) {
> +		igt_info("  (No built-in rules)\n\n");
This could be a debug log.

> +	}
> +
> +	/* Priority 2: Config file */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
> +	igt_info(" Source: /etc/igt/platform_skip.conf\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->config_entry_count > 0) {
> +		for (i = 0; i < ctx->config_entry_count; i++) {
> +			entry = &ctx->config_entries[i];
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No config file rules loaded)\n\n");
This could be a debug log or no log at all, it will spam the
output. User should be aware if they used a conf file or not.

> +	}
> +
> +	/* Priority 3: Environment variable */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
> +	igt_info(" Source: IGT_PLATFORM_SKIP_CONFIG\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->env_entry_count > 0) {
> +		for (i = 0; i < ctx->env_entry_count; i++) {
> +			entry = &ctx->env_entries[i];
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No environment variable rules)\n\n");
This could be a debug log or no log at all, it will spam the
output. User should be aware if they used env variable or not.

> +	}
> +
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" SUMMARY\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info("  Built-in rules:     %d\n", total_count);
> +	igt_info("  Config file rules:  %d\n", ctx->config_entry_count);
> +	igt_info("  Environment rules:  %d\n", ctx->env_entry_count);
> +	igt_info("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +}
> +
> +int igt_platform_filter_dump_to_file(const char *filename)
> +{
> +	FILE *old_stdout;
> +	FILE *f;
> +
> +	f = fopen(filename, "w");
> +	if (!f) {
> +		igt_warn("Failed to open %s for writing\n", filename);
You are returning an error here, so igt_err would fit better.

> +		return -1;
> +	}
> +
> +	/* Redirect stdout to file */
> +	old_stdout = stdout;
> +	stdout = f;
> +
> +	igt_platform_filter_dump();
> +
> +	/* Restore stdout */
> +	stdout = old_stdout;
> +	fclose(f);
> +
> +	igt_info("Platform filter configuration dumped to: %s\n", filename);
> +	return 0;
> +}
> diff --git a/lib/meson.build b/lib/meson.build
> index d1289a5e0..ba0683995 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -38,6 +38,7 @@ lib_sources = [
>  	'igt_params.c',
>  	'igt_perf.c',
>  	'igt_pipe_crc.c',
> +	'igt_platform_filter.c',
>  	'igt_power.c',
>  	'igt_primes.c',
>  	'igt_pci.c',
> -- 
> 2.54.0
> 

-- 
Best Regards,
Krzysztof
