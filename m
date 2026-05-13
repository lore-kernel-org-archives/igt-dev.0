Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C8CD4F24
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 14:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA00892C1;
	Wed, 13 May 2026 14:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZEghAE3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F2E10EEB3
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778682557; x=1810218557;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=w8Wn1uzN6S1qwx1zbmRTDNIYPHq6RdnSRG/d5f1BYVs=;
 b=kZEghAE3l9XPinhN0+DZpHq32us5yIryYyVEkJHDdDiYZqsF54XQ44KQ
 LN2FNrkeNMWOq5hgShOBIaTwT8ujaJQUgpDDlLBhVSDhnWAawiZAxgPQQ
 UbbLEyLGdwaH9RbvZJp5izxL+Yl/0Ve5o1NLsbu1rU5zJTjA5FYyGJgFy
 5EGTi0WZOdWxPgx24WwFOg652GuNg+mA0fXe+VsfeOTEMb1hcoZcE1uhO
 7UeCoKWES/MAUVPqJy3g/lTQL2bJJSJ11oOOpn226hM0cC2RDA81RXzIC
 zCEv8ZoW8PJK3xBezujvDjiuNn20CiszA3Mg7oPJ4ptutsulFFSeRuMOJ Q==;
X-CSE-ConnectionGUID: SFPRDb7XTgiDyEicNQGBqQ==
X-CSE-MsgGUID: mktlV/p+RCakzKIfzflD2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90994840"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208,217";a="90994840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 07:29:16 -0700
X-CSE-ConnectionGUID: BELCJhpGQre1hRhFydHGLw==
X-CSE-MsgGUID: 7JXHylUSTO+J5rVC/NtDLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
 d="scan'208,217";a="268440293"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 07:29:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 07:29:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 07:29:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 07:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeOXhbf8Wp9uZBr1QUzj8IMQt6Dk3FVZ1mJxidBXb0E8FWHUxHWu9jJDNfKPW3siR6hREt66Z6F7azm4aXx/UbVsd0SQ+/rJPCx1j36Kp14x2ZQtl0UknAfc+qx0FhBhrwgNVyxGn9c39GpH/8PXIsd7xE/Ys+5rOLghIfpYCf+mNR1+dq/P03wdCo9/BdPPVigUTnh3SYYfjh2fcDjmPIe0TmakWhbnCAx+oUQj/wOqDlatmQoo8IiIfUYlCtR0qiVsP7c00U4SpEzhO18xYjFOJw0pmMAvPeNdfXxtIq+wQy6Rma8wIcmu+jEzTJld7Qp4KbaxDebZsILqkUOjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQ4uEjxbGNpG6CeVzWQZJHlz+03N3h7JE8Dj9rB4qbo=;
 b=WFuc+Qh+0xGzkBFzu6cHqirG2KPYBDa00yZQLwpCZSheWk1eHcogDrkBb8V9JEc4/TR4HmUPfzmUOvbLBrE/TWicAGiixQeXUi6okMkqJmuy65Xs/jvjZ1bG2WnwwHIxrvG4mCb6xRtPWxoGzdr6EJkIwrlp8ux346pbe2x2PEhbBbNVRz2bdia04963DuFb+UqcQhF9276URsm1VBx+iI7QmoFdOZ3RLpP8PmK6pu5lVUd4WuUrDiXFdhESQYYnghFPrf9ngP/s5jkHjC5iFtVVXcEeGl9oot7XsXQas0Ogk2eOp8gN06Kb4OM5/NHQpy7/ZRu322VaYg5UhbuJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DM3PPF63A6024A9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:29:12 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:29:12 +0000
Content-Type: multipart/alternative;
 boundary="------------aYt1X9FCrLWQ0f01TqBT8qHT"
Message-ID: <bc911537-0987-4054-a4ae-74ce36679766@intel.com>
Date: Wed, 13 May 2026 19:59:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5] tests/kms_vrr: add support for full range refresh rate
 testing
To: Lee Shawn C <shawn.c.lee@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260427120955.3537070-1-shawn.c.lee@intel.com>
 <20260513061657.980046-1-shawn.c.lee@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260513061657.980046-1-shawn.c.lee@intel.com>
X-ClientProxiedBy: MA5PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::9) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DM3PPF63A6024A9:EE_
X-MS-Office365-Filtering-Correlation-Id: a459f7c5-b4c9-46f5-05da-08deb0fc00c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|8096899003|22082099003|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info: nRzn4vh0D0x8PayFy8BHHWTSaInUaENJxQuChs+ujuSxvskKn1mCmk3MCbw1z+QY6xERcZeGhnK3MnBw+WcY/YlyTaTIA0DHBGEXk2SVJWnK+8U42l+fWYW3M3KKzN+ZtggFmsb8m0XQAXduviU+zE8GkqIblHxI/HfyCcMw3VUf+MwviKaA/zJv/ikyeWPXwy660xOrGJrY0+VS7OT3Wz4SkmshmHGXOx0rkzF/JuQ4ixrkVB9WO+8h7BU2QdCH5xNZEBnCIfEtQ4KFeg6LJQvj42r71DSPifqw0wQsJGM1EuOmKYdO3IlMcv3M+hXcs/9dXMnsiRsePvgb7ax0Egf4By8jpuAQYziw8QDDMCmBBNA0k3VpdPto+qB6c4CqdQ9n3S7VuJ/64WLjLqO+cbNovwQD9Uo/3rJ+wHRKUG2HVxA+kMWzGl+0vSh2mObvtfTQRufX8Vth73qkGH5sQNydZvcJJL2l1QBrgNoH7cF5byF7Ux4rhSiX1S1kXy1XckGPUz7twcaC1isf44F4iCHlkI+6Mm/paGEzoZ2eSWx0/LIL7GAPBkpHe1Xd84TO5vzbnFwDflQf5PaLxKqnutRzOSljUEi5bcfsVUg/kOziVnvtOo+PZTAntZWeEEu9a50Zwrrs8KEIdXt164TGfl3PO/CnA/mqbgtV6mA1DoWnccMz04PFWOxaIrFs0quh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(8096899003)(22082099003)(56012099003)(3023799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGNCV0JoYlpoYWovZGVhMlRlWEF0WGdyNkVuNTVtSEVnZHZ5VzJqN1g4VVI5?=
 =?utf-8?B?UGJGaDM1clNSOGpmZENmQW9sKzljYnorVnl0UnhzSklVK3Z2L2dLU2grK3hU?=
 =?utf-8?B?OVNjczl6K01DOXJ0dERsUyt2OXRTQTJvTTRoYTVnbjk0c21zb210dTFDeDhG?=
 =?utf-8?B?VEVMUFFkUnduenFFaGw2U3AvaGE3b0RISlE1YW84Q1BhM0QrbjZrYWJoOFBO?=
 =?utf-8?B?YXNOS2loSU9KVXdyTWJaYlphZEt6TDF2NG1VN0ROVVlaQ0NLQnlvQU5EendJ?=
 =?utf-8?B?VlBCaUVqMkNqS0FLYkNrdFhuN2R1Tlk4M1BFNm41TzRHejY2a0tkUStlY2ht?=
 =?utf-8?B?OCtUZHYyOVhMNjNwQUVBd0ZiaGFqTGZiVy9VOGU5RkdaV1NIUldSM2o2Nk80?=
 =?utf-8?B?b2RDU0Urd252UHp5dDBYblVySlA3d3AyNk0xMUxZWGdIMGg1SFdkS0F6QU5B?=
 =?utf-8?B?YXEyZUF1M2JLZFU5NkhNL3RlRXV3RHU3NFlRRWNnUXVKYmpIcXZ1YU1jdEhM?=
 =?utf-8?B?bk5rWnNQSHhyVy96S3BVcytTazVMS3V0WnhXS1k0SjNKS2x1ZHA2M0Uxekx5?=
 =?utf-8?B?TGNYRTJrenNnQU5FeXJIY3hid3hQT0w5cm1qWEh2eWhMSS9OTlIvU0cxVmZk?=
 =?utf-8?B?VlJyTzJnSVNUSlA5aTROdkN5RXdsUDBPME1Demd0NVoyWWM5SnRTcHN5bVBB?=
 =?utf-8?B?S1lpWmFNZEM3Q0M0SmxjRitrdnhqSnMwR01aUlJPeW9WVGMyVlVvbFh6dS9o?=
 =?utf-8?B?c2tWcWpnWi9oYm10NXA3Qyt0ZGErOWlGUFVxTzZMWXhzczgvWkZ2QWgrQ01i?=
 =?utf-8?B?eEthRjZkb0s0RmpqV2MxTUk2NmNVYWhsOEw1VEkxWXIyVGtuVDgwVFFmMnhK?=
 =?utf-8?B?VFZSeUxYam5IYXdtdng1c2hxaHBKdDJKTHVXRGtMM3VEdEg5T0NkRitnenJx?=
 =?utf-8?B?RDc5NkFkRXc4ZjcyZzVEb0ZOWUxjTWliUlhVZFNwSzQ1dEEvUVFvaE9Ed0hH?=
 =?utf-8?B?VDhPWlhOay83bXp4QVFjYjlBdkV6VjZoVEdsU21ERkRwd2FYVTJQTzZCbFJO?=
 =?utf-8?B?NHFWREl3T3pQRjAxVmx1dXRyZk9OQUQ3c0NFb3I1UDJ2OUZoTTY4SVZyT2VF?=
 =?utf-8?B?a2J6OGlaVWVnVlFtWEF6SkpQSHEvMGswQ3FqakEySnRzbGZpV2JlaVJyTTRo?=
 =?utf-8?B?Y3NVR3QxQUhIOENWRWFxcGNhd2ltemtPTm9RWFZtYkNIT2owcStmcUFpdzla?=
 =?utf-8?B?d09TYmhRQXpVaEQvbzQzWnVxWERSRTZreENPMUhlNzBkWVBVQkJQYmJYVnNl?=
 =?utf-8?B?cDA4ekhqaHVzN1YwTFJJZm90LzNEaFlUeFcxeVkreldNTDRMOGdvZGx1aGE3?=
 =?utf-8?B?VlJodkdWWWNjYXlZVm11SHRaakgvR3IydlJob3JuNUlFL3ltNC84UU1LTHFn?=
 =?utf-8?B?QUUxYXdJMU5WVjQwdTBjd0VZNDh1UHJURFZMTWRwNGVNODBjZzVlWkMvRGJ1?=
 =?utf-8?B?Rk1idVcxbnV2cFJTaGxRZWNodzUyamxaUmJBc0dzRDVWVXFHUjk3VTcxbVBo?=
 =?utf-8?B?MlgzWHJsb1creUk3QnlHYXJXVThEUWs3bDBKUXdvYXBzTk9NT01SZysvOVZh?=
 =?utf-8?B?c1F0czdrWWtER29kSTBXc2Q1eW1DZXZYSU00Y1ZhaXkyWCtTWDRQMDZ3Nm5l?=
 =?utf-8?B?T2UzL3FOS1QzTjB3d1NhcGk0cGg5VTJYUldMbkhJdzU3Yml2c2JoZ3l3RGhn?=
 =?utf-8?B?cTN1VGNjZUxnSmVEdmkyZllyOVg5c2dObmVrUi9ZY3E0bFJ5aWY5VVNuMTVp?=
 =?utf-8?B?Ym9BZ3VHdC9xUDZDWE1SWnF4ZE9vS0ovTmtGR1I5L2hGRHJxenlkQzdnbnJQ?=
 =?utf-8?B?anE3bG5HUWxBZFlNWkxZWFRwcHJDdFFaUlhKZTdWaXA5Z2dkNWovM2tubWkz?=
 =?utf-8?B?L0RjbzBNZVpoNGVqVDZOTkpxckJwaE5VcndCYVd1aDdka2RhVnphemNyUHBB?=
 =?utf-8?B?ZmprTzVyTlNCSFcvcHhMTkZxMGVuVUJZazBacTBoYU9qNUVWdVZ3aXlyaVpI?=
 =?utf-8?B?TmZuYzRMWmxQOElPZzRWQ2E3SHlteElKZEhLMVRpNkZHbFVNaFI4SEtKNXhs?=
 =?utf-8?B?OWV4NGhtdW9NMzB3KzVKbFBjcHJ1SUJiUnp5azd0b0tNS3FNamtUZGJ0MkdI?=
 =?utf-8?B?dFdaVml3eGJ5R0d4MWJGTXRxQWZUM0JIQnFqd3ZTeUhGWndVL2NIWGNrQmRD?=
 =?utf-8?B?YmJ0cmNMUUZPRWl4WWRVMWZZZzlNbFAyREdNMzZiY2RPM2dhcWRINmhBMlRQ?=
 =?utf-8?B?Q0dBOXpsSlM2cDBsdURJeUh1eUJ5ei81QnJZN0VkWlU5eHJyTkpJbWhiL1hR?=
 =?utf-8?Q?f2EbU+kkmyB2iB+Y=3D?=
X-Exchange-RoutingPolicyChecked: OonynkP8cdKgQ5lELfTX/ACAy6Ly/pdWYZbMUKpm/QRSlKGt3J9+rk8UIg1vstDZyqnTNUAfaFdgU62qX9hvfpejLVTFx9PzKeR0c7N4atIj0gAQCjpUBjn5q/dPpufXa3imLK/UpGlIF+ge7m21DWIWqigwY6fjADWtbkX+rPeVksfDNZioTRRxxSmAv8yryHop9q9E7X8CsI0Hoir4uedJpmssFzuixfmR2ZaxQT8IM0eDAcYRavV69HoEaJC5LB+cEYwRelKJoTrq1Yo3wjMMv0Hj+e1WyC2vm0sMDEo+AEbLT54iaiVOBJ/6Cf1t7gWBdfa6yOCMaVCDugfxxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a459f7c5-b4c9-46f5-05da-08deb0fc00c6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:29:12.6350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+8EiLyYf7TGIPRtTySDaJAMeS9g25xHqRos025Fjyz6X9uu+4P75Kjl1xRDnHesIeAG5ij+qab4kZ2ed8kcG1O9N545gEqGRKq7wHJiev4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF63A6024A9
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

--------------aYt1X9FCrLWQ0f01TqBT8qHT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee Shawn,

With the recent kernel changes, the midpoint approach is no longer 
necessary. It would be better to first revert commit |862eb1762| 
(/tests/kms_vrr: Start virtual RR test above midpoint to avoid mode 
fallback/), and then layer your changes on top of that baseline.

On 5/13/2026 11:46 AM, Lee Shawn C wrote:
> Currently, kms_vrr tests fixed step increments within the VRR range.
> To better validate hardware stability and potential issues across the
> entire spectrum, this patch adds a 'full-range' testing mode.
>
> When the full-range flag is enabled, the test will:
> 1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
> 2. For standard testing, maintain the existing behavior of incrementing
>     from minimum to maximum using the defined step size.
>
> v2: Fix build failure by adding documentation for the new subtest.
> v3: Remove unnecessary '!!' operator when assigning to bool.
> v4: Add full-range (top-down/bottom-up) subtests to verify all supported
>      RR within VRR range.
> v5: Fix build failure for the new subtest.
>
> Cc: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
> Signed-off-by: Lee Shawn C<shawn.c.lee@intel.com>
> ---
>   tests/kms_vrr.c | 118 ++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 100 insertions(+), 18 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 6043d40f1d74..bf2fab9ce23f 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -65,6 +65,11 @@
>    * SUBTEST: seamless-rr-switch-virtual
>    * Description: Test to create a Virtual Mode in VRR range and switch to it
>    * 		without a full modeset.
> + * SUBTEST: seamless-rr-switch-virtual-top-down
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
> + *
> + * SUBTEST: seamless-rr-switch-virtual-bottom-up
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
>    *
>    * SUBTEST: lobf
>    * Description: Test to validate link-off between active frames in non-psr
> @@ -94,11 +99,13 @@ enum {
>   	TEST_SEAMLESS_VRR = 1 << 4,
>   	TEST_SEAMLESS_DRRS = 1 << 5,
>   	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> -	TEST_FASTSET = 1 << 7,
> -	TEST_MAXMIN = 1 << 8,
> -	TEST_LINK_OFF = 1 << 10,
> -	TEST_NEGATIVE = 1 << 11,
> -	TEST_FORCE_RR = 1 << 12,
> +	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 << 7,
> +	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 << 8,
> +	TEST_FASTSET = 1 << 9,
> +	TEST_MAXMIN = 1 << 10,
> +	TEST_LINK_OFF = 1 << 11,
> +	TEST_NEGATIVE = 1 << 12,
> +	TEST_FORCE_RR = 1 << 13,
>   };
>   
>   enum {
> @@ -235,13 +242,58 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> -static void
> -virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
> +static bool
> +virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
>   {
>   	uint64_t clock_hz = mode->clock * 1000;
> +	uint16_t virtual_vtotal;
> +
> +	virtual_vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	if (is_intel_device(data->drm_fd) && virtual_vtotal > 8192) {
> +		igt_info("VTotal (%d) already exceed 8192 at %fHz\n", virtual_vtotal, virtual_refresh_rate);
> +		return false;
> +	}
>   
> -	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	mode->vsync_start = virtual_vtotal - (mode->vtotal - mode->vsync_start);
> +	mode->vsync_end   = virtual_vtotal - (mode->vtotal - mode->vsync_end);
> +	mode->vtotal = virtual_vtotal;
>   	mode->vrefresh = virtual_refresh_rate;
> +
> +	return true;
> +}
> +
> +static drmModeModeInfo*
> +get_selected_fixed_mode(igt_output_t *output, bool lowest)
> +{
> +	drmModeConnectorPtr connector = output->config.connector;
> +	drmModeModeInfo *selected_mode = NULL;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *m = &connector->modes[i];
> +
> +		if (m->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
> +			if (!selected_mode) {
> +				selected_mode = m;
> +				continue;
> +			}
> +
> +			if (lowest) {
> +				if (m->vrefresh < selected_mode->vrefresh)
> +					selected_mode = m;
> +			} else {
> +				if (m->vrefresh > selected_mode->vrefresh)
> +					selected_mode = m;
> +			}
> +		}
> +	}
> +
> +	if (selected_mode) {
> +		igt_info("Found Target Fixed Mode: \"%s\" %dHz (vtotal: %d)\n",
> +			 selected_mode->name, selected_mode->vrefresh, selected_mode->vtotal);
> +		return selected_mode;
> +	}
> +
> +	return NULL;
>   }
>   
>   /* Read min and max vrr range from the connector debugfs. */
> @@ -757,19 +809,25 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   	unsigned int vrefresh;
>   	uint64_t rate[] = {0};
>   	uint32_t step_size;
> -	drmModeModeInfo virtual_mode;
> +	drmModeModeInfo *virtual_mode = NULL;
> +	int start, end, step;
> +	bool need_low_rr = flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
>   
> -	igt_info("Use HIGH_RR Mode as default\n");
> -	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
> +	if (!virtual_mode)
> +		return;
> +
> +	igt_info("Use %s_RR Mode as default\n", need_low_rr ? "LOW" : "HIGH");
> +	kmstest_dump_mode(virtual_mode);
>   
>   	prepare_test(data, output, crtc);
> -	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode->vrefresh);
>   
>   	/*
>   	 * Sink with DRR and VRR can be in downclock mode so
>   	 * switch to highest refresh rate mode.
>   	 */
> -	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +	igt_output_override_mode(output, virtual_mode);
>   	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
>   
>   	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
> @@ -784,7 +842,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   	step_size = (data->range.max - data->range.min) / 5;
>   
>   	/* Switch to Virtual RR */
> -	virtual_mode = *igt_output_get_mode(output);
> +	virtual_mode = igt_output_get_mode(output);
>   
>   	/*
>   	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
> @@ -795,13 +853,29 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   		   (((data->range.max + data->range.min) / 2) + step_size) :
>   		   data->range.min + step_size;
>   
> -	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
> -		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
> +	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
> +		start = data->range.max;
> +		end = data->range.min;
> +		step = -1;
> +	} else if (flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP) {
> +		start = data->range.min;
> +		end = data->range.max;
> +		step = 1;
> +	} else {
> +		start = data->range.min;
> +		end = data->range.max;
> +		step = step_size;
> +	}
> +
> +	for (vrefresh = start; (step > 0) ? (vrefresh <= end) : (vrefresh >= end); vrefresh += step) {
> +		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
> +			continue;
>   
>   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> -		kmstest_dump_mode(&virtual_mode);
> +		kmstest_dump_mode(virtual_mode);
>   
> -		igt_output_override_mode(output, &virtual_mode);
> +		igt_output_override_mode(output, virtual_mode);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
>   		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
>   
>   		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
> @@ -1105,6 +1179,14 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>   			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-top-down")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
> +
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-bottom-up")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
> +
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
>   		igt_subtest_with_dynamic("lobf") {
--------------aYt1X9FCrLWQ0f01TqBT8qHT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Lee Shawn,<br>
      <br>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>With the recent kernel changes, the midpoint approach is no
      longer necessary. It would be better to first revert commit <code>862eb1762</code>
      (<em>tests/kms_vrr: Start virtual RR test above midpoint to avoid
        mode fallback</em>), and then layer your changes on top of that
      baseline.<br>
    </p>
    <div class="moz-cite-prefix">On 5/13/2026 11:46 AM, Lee Shawn C
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260513061657.980046-1-shawn.c.lee@intel.com">
      <pre wrap="" class="moz-quote-pre">Currently, kms_vrr tests fixed step increments within the VRR range.
To better validate hardware stability and potential issues across the
entire spectrum, this patch adds a 'full-range' testing mode.

When the full-range flag is enabled, the test will:
1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
2. For standard testing, maintain the existing behavior of incrementing
   from minimum to maximum using the defined step size.

v2: Fix build failure by adding documentation for the new subtest.
v3: Remove unnecessary '!!' operator when assigning to bool.
v4: Add full-range (top-down/bottom-up) subtests to verify all supported
    RR within VRR range.
v5: Fix build failure for the new subtest.

Cc: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Signed-off-by: Lee Shawn C <a class="moz-txt-link-rfc2396E" href="mailto:shawn.c.lee@intel.com">&lt;shawn.c.lee@intel.com&gt;</a>
---
 tests/kms_vrr.c | 118 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 18 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..bf2fab9ce23f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -65,6 +65,11 @@
  * SUBTEST: seamless-rr-switch-virtual
  * Description: Test to create a Virtual Mode in VRR range and switch to it
  * 		without a full modeset.
+ * SUBTEST: seamless-rr-switch-virtual-top-down
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
+ *
+ * SUBTEST: seamless-rr-switch-virtual-bottom-up
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
  *
  * SUBTEST: lobf
  * Description: Test to validate link-off between active frames in non-psr
@@ -94,11 +99,13 @@ enum {
 	TEST_SEAMLESS_VRR = 1 &lt;&lt; 4,
 	TEST_SEAMLESS_DRRS = 1 &lt;&lt; 5,
 	TEST_SEAMLESS_VIRTUAL_RR = 1 &lt;&lt; 6,
-	TEST_FASTSET = 1 &lt;&lt; 7,
-	TEST_MAXMIN = 1 &lt;&lt; 8,
-	TEST_LINK_OFF = 1 &lt;&lt; 10,
-	TEST_NEGATIVE = 1 &lt;&lt; 11,
-	TEST_FORCE_RR = 1 &lt;&lt; 12,
+	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 &lt;&lt; 7,
+	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 &lt;&lt; 8,
+	TEST_FASTSET = 1 &lt;&lt; 9,
+	TEST_MAXMIN = 1 &lt;&lt; 10,
+	TEST_LINK_OFF = 1 &lt;&lt; 11,
+	TEST_NEGATIVE = 1 &lt;&lt; 12,
+	TEST_FORCE_RR = 1 &lt;&lt; 13,
 };
 
 enum {
@@ -235,13 +242,58 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
-static void
-virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
+static bool
+virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
 {
 	uint64_t clock_hz = mode-&gt;clock * 1000;
+	uint16_t virtual_vtotal;
+
+	virtual_vtotal = clock_hz / (mode-&gt;htotal * virtual_refresh_rate);
+	if (is_intel_device(data-&gt;drm_fd) &amp;&amp; virtual_vtotal &gt; 8192) {
+		igt_info(&quot;VTotal (%d) already exceed 8192 at %fHz\n&quot;, virtual_vtotal, virtual_refresh_rate);
+		return false;
+	}
 
-	mode-&gt;vtotal = clock_hz / (mode-&gt;htotal * virtual_refresh_rate);
+	mode-&gt;vsync_start = virtual_vtotal - (mode-&gt;vtotal - mode-&gt;vsync_start);
+	mode-&gt;vsync_end   = virtual_vtotal - (mode-&gt;vtotal - mode-&gt;vsync_end);
+	mode-&gt;vtotal = virtual_vtotal;
 	mode-&gt;vrefresh = virtual_refresh_rate;
+
+	return true;
+}
+
+static drmModeModeInfo*
+get_selected_fixed_mode(igt_output_t *output, bool lowest)
+{
+	drmModeConnectorPtr connector = output-&gt;config.connector;
+	drmModeModeInfo *selected_mode = NULL;
+
+	for (int i = 0; i &lt; connector-&gt;count_modes; i++) {
+		drmModeModeInfo *m = &amp;connector-&gt;modes[i];
+
+		if (m-&gt;type &amp; (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
+			if (!selected_mode) {
+				selected_mode = m;
+				continue;
+			}
+
+			if (lowest) {
+				if (m-&gt;vrefresh &lt; selected_mode-&gt;vrefresh)
+					selected_mode = m;
+			} else {
+				if (m-&gt;vrefresh &gt; selected_mode-&gt;vrefresh)
+					selected_mode = m;
+			}
+		}
+	}
+
+	if (selected_mode) {
+		igt_info(&quot;Found Target Fixed Mode: \&quot;%s\&quot; %dHz (vtotal: %d)\n&quot;,
+			 selected_mode-&gt;name, selected_mode-&gt;vrefresh, selected_mode-&gt;vtotal);
+		return selected_mode;
+	}
+
+	return NULL;
 }
 
 /* Read min and max vrr range from the connector debugfs. */
@@ -757,19 +809,25 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	unsigned int vrefresh;
 	uint64_t rate[] = {0};
 	uint32_t step_size;
-	drmModeModeInfo virtual_mode;
+	drmModeModeInfo *virtual_mode = NULL;
+	int start, end, step;
+	bool need_low_rr = flags &amp; TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
 
-	igt_info(&quot;Use HIGH_RR Mode as default\n&quot;);
-	kmstest_dump_mode(&amp;data-&gt;switch_modes[HIGH_RR_MODE]);
+	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
+	if (!virtual_mode)
+		return;
+
+	igt_info(&quot;Use %s_RR Mode as default\n&quot;, need_low_rr ? &quot;LOW&quot; : &quot;HIGH&quot;);
+	kmstest_dump_mode(virtual_mode);
 
 	prepare_test(data, output, crtc);
-	rate[0] = igt_kms_frame_time_from_vrefresh(data-&gt;switch_modes[HIGH_RR_MODE].vrefresh);
+	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode-&gt;vrefresh);
 
 	/*
 	 * Sink with DRR and VRR can be in downclock mode so
 	 * switch to highest refresh rate mode.
 	 */
-	igt_output_override_mode(output, &amp;data-&gt;switch_modes[HIGH_RR_MODE]);
+	igt_output_override_mode(output, virtual_mode);
 	igt_assert(igt_display_try_commit_atomic(&amp;data-&gt;display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
 
 	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
@@ -784,7 +842,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	step_size = (data-&gt;range.max - data-&gt;range.min) / 5;
 
 	/* Switch to Virtual RR */
-	virtual_mode = *igt_output_get_mode(output);
+	virtual_mode = igt_output_get_mode(output);
 
 	/*
 	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
@@ -795,13 +853,29 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 		   (((data-&gt;range.max + data-&gt;range.min) / 2) + step_size) :
 		   data-&gt;range.min + step_size;
 
-	for ( ; vrefresh &lt; data-&gt;range.max; vrefresh += step_size) {
-		virtual_rr_vrr_range_mode(&amp;virtual_mode, vrefresh);
+	if (flags &amp; TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
+		start = data-&gt;range.max;
+		end = data-&gt;range.min;
+		step = -1;
+	} else if (flags &amp; TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP) {
+		start = data-&gt;range.min;
+		end = data-&gt;range.max;
+		step = 1;
+	} else {
+		start = data-&gt;range.min;
+		end = data-&gt;range.max;
+		step = step_size;
+	}
+
+	for (vrefresh = start; (step &gt; 0) ? (vrefresh &lt;= end) : (vrefresh &gt;= end); vrefresh += step) {
+		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
+			continue;
 
 		igt_info(&quot;Requesting Virtual Mode with Refresh Rate (%u Hz): \n&quot;, vrefresh);
-		kmstest_dump_mode(&amp;virtual_mode);
+		kmstest_dump_mode(virtual_mode);
 
-		igt_output_override_mode(output, &amp;virtual_mode);
+		igt_output_override_mode(output, virtual_mode);
+		igt_assert(igt_display_try_commit_atomic(&amp;data-&gt;display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
 		igt_assert(igt_display_try_commit_atomic(&amp;data-&gt;display, 0, NULL) == 0);
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
@@ -1105,6 +1179,14 @@ int igt_main_args(&quot;drs:&quot;, long_opts, help_str, opt_handler, &amp;data)
 		igt_subtest_with_dynamic(&quot;seamless-rr-switch-virtual&quot;)
 			run_vrr_test(&amp;data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
+		igt_describe(&quot;Test to switch to all virtual modes in VRR range without modeset.&quot;);
+		igt_subtest_with_dynamic(&quot;seamless-rr-switch-virtual-top-down&quot;)
+			run_vrr_test(&amp;data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
+
+		igt_describe(&quot;Test to switch to all virtual modes in VRR range without modeset.&quot;);
+		igt_subtest_with_dynamic(&quot;seamless-rr-switch-virtual-bottom-up&quot;)
+			run_vrr_test(&amp;data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
+
 		igt_describe(&quot;Test to validate the link-off between active frames in &quot;
 			     &quot;non-PSR operation.&quot;);
 		igt_subtest_with_dynamic(&quot;lobf&quot;) {
</pre>
    </blockquote>
  </body>
</html>

--------------aYt1X9FCrLWQ0f01TqBT8qHT--
