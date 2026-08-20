Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B111C5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 13:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AEC10E5E3;
	Thu, 20 Aug 2026 13:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF34MTiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC0910E5E3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787231874; x=1818767874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gnhdYg8HLpNItHnoQuodvd97Uvq2PWSNvaGmPAkyWkQ=;
 b=iF34MTiw4yB5OWespyC6bUIniwthluSpeycEegf6CJ2gps0ViV0mmZgo
 N7XjdhJjE5tWKL5TxuazKkUqnlVyuY0bHoqFwyGyz9FSHdCoXoF2YlMR+
 YablzUPuSS2p/zHUeBUaMiRkxJHm0G/OPIuXOXxJf6A73uaZbyq3/DlZ+
 BDsMOOsTJO70RDnnYYH3BhqZqJGuJH+kuEoLaeIe5w4PfFmQB2XPm9WHu
 sDX7q+gIe/9qwzhNHemjxABzmJgKDDfTra4jblUapwsJFaOkfwO1c0WQN
 oC+yQb+8SP2gULxLFahZpaxMODbNGfSvwMCodeiBFvRXSrZJPwYQkHTwh w==;
X-CSE-ConnectionGUID: ShnZGIEqSQq+L/Xv+JpCSg==
X-CSE-MsgGUID: cFCimegAS56RtoC/k7+7Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87971359"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87971359"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 06:17:54 -0700
X-CSE-ConnectionGUID: LMPqC7irSVSWVbN9pKynRg==
X-CSE-MsgGUID: ZQf1UoSpSLiS0YzV59vN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="270262849"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 06:17:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 06:17:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 06:17:52 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 06:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4P2H18vOa7T2r3BRnI5kaAVa2ubNEUvGgfHse7l0Tnqpnt60jN9CEeMMT/+2q96ZaTO/gaEax6ZBvmLExes9ML6wGQxSN5mc2fUjXGkYFsWVtewYXgS5Pc0604tjSmksWkJH7XavqDq5XborVsInpQYycyUif95i9cuCaegoQDJZD2nsjbSyGACUS9L+nb08x/0mHHh/jHy3Mozq/dOoMnblxGJcpxvBFBS8ObtV8cRQ8RHH7MJC3Z6hmphH3ccrwNdTKjfBpcEYItnBVyp+JpcJBl+/LGjR/d0gkSgMMwlqxk50Ur9iAq3o3A4tD+vyXQaOValahVnBX7FPcMtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkBeRimi/JEz1IMapMXIyRINSXIhzzElCmESRymoHUA=;
 b=YZMQzD8cF9ZC4JNRTJWwQYOK359D2N56i06KV9RlGei4shuXYP9QMTKMnORIm7iH9keqGWDrpElMdt/BlPDzu9y5VhZfh5q6nLBcLCSyESat2k4mt+5XDCGcKydLhm22HDNXH/8zDULba2c6kifxRl9xYBawNk0RG+//dWuvkoSsjPmMR2Yhud+BH7rME6HXP3P6w9ZRfS2IjlkTP3xLhovz8tTqzuEXVd4qib/z1/5FvTYO41WUq3RUWHLJzdnVPq9yuJy7Dd9FN3YzkBK3sgLGaTai4PfB65pmVdRbsZIme2R35L8KXcXJuWT5WimNRzMsGmm6OxAen+JgnV9/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by LVXPR11MB9779.namprd11.prod.outlook.com (2603:10b6:408:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 13:17:45 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 13:17:45 +0000
Date: Thu, 20 Aug 2026 15:17:37 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
Message-ID: <aob1Jdrp54F491Je@kniemiec-mobl1>
References: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
 <gda37yz65qif5ugay37oko4xj57emhqznqaf2imil5k3z25w7y@hbpp5mhzkqs3>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <gda37yz65qif5ugay37oko4xj57emhqznqaf2imil5k3z25w7y@hbpp5mhzkqs3>
X-ClientProxiedBy: DU2PR04CA0344.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::17) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|LVXPR11MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: b5deedfa-24de-47ec-f5a9-08defebd6c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Newtdga+2B8gdTz6yV2pHLixsNl/f2eoEjdr/ciFuEHp+VcdKlg0JQXSSINKJvcbskpN1lJ/SIaDmQxC9tRq6uoqKnxR1+2DagmjueQ8u2f/jazNO8jwQC+X/XmpGXy1BHcVOFzs7gAo+7cuWQKCt13IhzhwUhJR3KaYqAIPWenB/LkdUfLh3sKtpe18djBcdiG+Ll8hGElwshX+EbdFZFV++j/s8bbOZWTfYEYJUd8SLZMDUtexwDYEIND15ULldYu+DoKE0pas6iDTqSj/p6Y7MDV/C3NVC+ECLNWw5+GQLCt6QwpVSiiYpknxZ9TZTALk+5VJRaQORc33qevmDEpld0p/lw/7mBZ4HfUbtTknLPrEgFkrF6ES3PnJeO1f7eDUVIalRmhkyy6pnb44rQXXgcVBc/cZaYg0DEUI0BH1UgU6152sdfo+N5aiP9pZOHPIY/L4tohrMJDbGADWOXndIElJp7xuMs8+zgom2kB7ENPKeNAqL+ncuveYCrAsKIwhBvM64OfveSUeVrhQQ49vTZKGCdhOL5++IF2iAkOu88FcqwzDoOQxx0GD6ni4SlavOSqwvvY5AbIZ8b6VKUvCIimDVE5L+m69wVkHXiKbHhzy3sikp2CfVl0Qd4dv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjNTcjhETEdTRVpNWFExNzlnYVY2K3JGeDV2alpLRmJiZnhLRXcxMUpFZ1pm?=
 =?utf-8?B?eFFiaHZ5Sy9Ob1JybTRLdVpDalNOWktITDZsdlR2am92RzIvWmpYVHhyanUr?=
 =?utf-8?B?cnpBZVBIQ0x4ZjRXTDMzeklOM1R4cUJEVHpNSE9neS9pazhzY05GTHRBN1kx?=
 =?utf-8?B?ZkNmem1sNEVkQ015NVRqbEZhV2hvbTNzOEIwbVlPZGxrbDg3L255bTRyTXpz?=
 =?utf-8?B?dXFOaSswM0NGTi8xM05GM0s1T0x2eDRaekdsa2xmWHNOZXlWZEwrWHl3NWo2?=
 =?utf-8?B?ODAzZ2pZay92Zlo5bVBuVjZlTGhzRGRoTjFJdGN4ZnVjZ3BmNnAyd2kyU0Vs?=
 =?utf-8?B?Y3NQWHp4cXVKdVg4NFc5aW9ZZVA3YkNscHZjZDZaSkJ6bHJ1L1RtNE5LRE16?=
 =?utf-8?B?dDRZM2g1dlVrZjMwVkdoRUNRSjJIM1BHQVFHNFhONU5LSiszWXVVRmc4QlJP?=
 =?utf-8?B?MGJNbzRramg3Nzc2ampUWUYvV2VhZFdqbWFMNDNzb0h2NGx1T25na2tHSDVu?=
 =?utf-8?B?cHZWRnlDTUFVVmJVc04xRTJlQW5FWEhQWDFzN0U5dCtqQW94V1VMdVo4K2ds?=
 =?utf-8?B?a0x3NElaWW0wNDcvZHhKbGhtL3JSdkJFaDVjdDVUUy9IeE1WNWkyTlNTRS93?=
 =?utf-8?B?QjBxUSt1RjhXT0lPS2RWbmE5Nmc1TXM5M0tTdFdOTUR5SFhISG5oeEJncThk?=
 =?utf-8?B?OW5oR0YyaHdYY3hWOVdkVHpHb2xWSUx4R3V0dS80MDJZL2JGalJyc0U5RUts?=
 =?utf-8?B?V1dCTUVIVkRhMmNBUDBwY1grRUhYYUZ2SjN4MUpXSEJ2Vk1NQmNBL2lDbU1p?=
 =?utf-8?B?amk3cUdJZjFGT0RYcW80M3dtUkM4b0NkRkpUMU1xbWVOQ3J2eGtGM0dTcDQx?=
 =?utf-8?B?WU5IVENaYmJsejRIaC9Id1dUSGpYOUN0QmN4TUpWSFRDSW9uQ2NSUlljU01F?=
 =?utf-8?B?elhVZTNSSDZiYThIV05GeG92SmVtbFArcXlrTWhFVTBFcHlUMXdYQmJsTUpV?=
 =?utf-8?B?aEJkcUJrVEFWQVVIdVljcWxFQTlOREpuT2h3OHhtZ2QzS0JhSkV6L3ZNSHFK?=
 =?utf-8?B?d0F2cEVxdWtpTnVzbWUyZFE5VlppWmlRb0ZFMlpreW9UVUh0QWw2Z3MyWS9B?=
 =?utf-8?B?YjdLaXgwZmcwazY1b3EreG0xdER3MHJlU0dRQnc2OE1mRUxKck9xVGNmT2dW?=
 =?utf-8?B?MGRRRFhIWC9STnNiZ0t6Wm5OdXpUdEVEVHQ0MS9nL1JiZTA1bDdyYVVuTEJP?=
 =?utf-8?B?NUk4Yk5NQjZtRzR6VVcwVzVKcWoweTNsd2dyMlQ0ZFJqaWRZY2FBVy9JZ0Vx?=
 =?utf-8?B?bnV6TDVJYzJFWnFaVnF4VlFCTnZzaEVpZm1YS1JEZEQ1cURRK2JWN0V5ZlFq?=
 =?utf-8?B?ZDhhN3lWY3dyL0NGVnkzc1RLQzVLS3ExZkpzUER6aGJxZnJ0cHp2MTN4Sm5S?=
 =?utf-8?B?eTdpaXd2d2ZsSjdjbUtUaHFZNkd4YklVN29xNXgwMERlalJzN2orcGlWQkpK?=
 =?utf-8?B?Y2NBaWdBbXhrbmgrelNQV1BHbzZJYTNOVXA5TVBaZ25uRXlSUVhnTHpWblM5?=
 =?utf-8?B?YXZFdXJJeHhaOVgzRGwybVFSc1B2bmpnNHZ6SXB1b1RzeFFIUDdkdW5YRFlV?=
 =?utf-8?B?ajEyMDNhWGw1akc3SU5BUy9TVjdDUnI1RjdzZllhRFF6TExheTNBZ1FhYjl6?=
 =?utf-8?B?SWJnZnJGT1pER2xwdWVhcEpubmhKZE8xQ1VQcENEVk5SeXJQQW9hdWRMWGNW?=
 =?utf-8?B?QkM0KzhLT3ErZnZLOVUyQTVlL084RXZxQ1FQWU03ODZYVUk2a1hIUktGT2k1?=
 =?utf-8?B?cThvdDY2a1NiVzRhblNyWjhsRXN5R28xYUZuS2FrdUkwaVNTSnloUFlFMHVy?=
 =?utf-8?B?NDZYb1g4NSs5UHgzY2thaDMxNklCeFdxVjNHaVlRL1lpT1RTVUMweXEwT2Zz?=
 =?utf-8?B?cXB1d2MzcGVBVnVTM0djTDc5OUlRNmw3azNpank4SGd0dlZhdko0M3lZV0NQ?=
 =?utf-8?B?Z2I5Q2Z6RmpzVEF6Q2crZ0FNK2t3QU5uZEVPbTlJU1pBUCtpMGd5TWM3clQw?=
 =?utf-8?B?SUZJSmdqMG0zOHpyaUcvOFRXNlQ0UVJRQW5xcXRnTFE1WE96dGUveDltaEFK?=
 =?utf-8?B?MGNIeVRZQ2NreGs4bmdIY3ExazJhU3RwZ2pzWDkzemRSZHBDS2VQMFA4eU9w?=
 =?utf-8?B?S3pSbGNGZHIzWUJrajFvV2xpZWhCdFp3ZUEvYmMrS0VreGRIUVhQNXpjVHpG?=
 =?utf-8?B?QXBSanBseU42c2R5QjRuWmZUdHdTUUo1WUVCa1IrNE9aNEJleHkvL3A4Rnd3?=
 =?utf-8?B?Zjd1ZFU1NWFVM1JNN3dDZHk3dlZTdnBSdExJeCtDVUtZbEdGTm9LRjRtVzZU?=
 =?utf-8?Q?+3JRTXBS7fGzORZc=3D?=
X-Exchange-RoutingPolicyChecked: mB95gsXymrU8FUrJs15MQ5rTUIZdKEQq1F3JUyqwmXsiAVQlZP9NP960sgfjPSDzWryR4Pa+1cKdSsWJSTR1yvGAliur4yVTgUdScqaLYbhG1prtIoKxL8mSCAEvoKwV/dkTSX251pGn6OTxfN7Zxieihv2qYT1hLxrcCEvUdUOVkZURG6QyLomuqb8xJiGT5DuH+Gtiy2eQ6jUjyZmQCEJkUvG4DENJCq2mJ5g85qvgs1ReECnhQZIRH3Oca4vnWtbG84J9SaXWZeHeRJKI5jQ+/iCW2CkYaQtC0lQMA0TqGce37NiR0jhDjXPi1acxcCqRFgwwC3Gt1VwJu3Bfkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5deedfa-24de-47ec-f5a9-08defebd6c17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:17:45.1301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc9p6pHm2IapIIsq660RB8QALQ0nBN8Zn/fZmk9N+47hyuvhu8Vp+V4/qaarIq2hrihkf8T+5PmCJui0COQuB9ajyYU7WW595bv85mOumSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9779
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

Hi Krzysztof

On 2026-08-20 at 07:15:23 +0000, Krzysztof Karas wrote:
> Hi Krzysztof,
> 
> On 2026-08-19 at 17:21:09 +0200, Krzysztof Niemiec wrote:
> > Add coverage for the case where the batch start offset is invalid with
> > multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
> > ("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer")
> > 
> > Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > ---
> > 
> > v2:
> >  - Reword comments to be more specific (Krzysztof K, Sebastian)
> >  - Get rid of the context id parameter (previously set in rsvd2, which
> >    should have been rsvd1) - which turns out isn't actually required to
> >    trigger the correct error path (Sebastian)
> >  - Capitalize sentences (Andi, off-list)
> > 
> >  tests/intel/gem_exec_params.c | 50 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> > index 3ba4c530b..c405190a0 100644
> > --- a/tests/intel/gem_exec_params.c
> > +++ b/tests/intel/gem_exec_params.c
> > @@ -85,6 +85,8 @@
> >   *
> >   * SUBTEST: invalid-flag
> >   *
> > + * SUBTEST: invalid-offset-multiple-buffers
> > + *
> >   * SUBTEST: invalid-ring
> >   *
> >   * SUBTEST: invalid-ring2
> > @@ -404,6 +406,51 @@ static void test_invalid_batch_start(int fd)
> >  	gem_close(fd, exec.handle);
> >  }
> >  
> > +/*
> > + * This test is checking for a NULL deref in eb_release_vmas()
> > + * (see 4fe2bd195435 for kernel fix), which happens when multiple buffers
> > + * are submitted to the execbuf ioctl and some of them are invalid.
> > + *
> > + * The __gem_execbuf() call is always expected to fail with an -EINVAL,
> > + * because the bug mentioned above is in the error path, which is
> > + * deliberately triggered. Affected systems, however, will not handle it
> > + * cleanly and will crash with a NULL deref.
> > + */
> > +
> > +static void test_invalid_offset_multiple_buffers(int fd)
> > +{
> > +	struct drm_i915_gem_exec_object2 exec[2];
> > +	struct drm_i915_gem_execbuffer2 execbuf;
> > +	uint32_t size = 0x1000;
> Why this particular size?
> 

gem_create ioctl rounds up size to "the largest of minimum page sizes in the
specified memory regions" (in this case simply PAGE_SIZE), then checks
the alignment to PAGE_SIZE anyway. So this can be anything as long as it is
not 0, and most of the tests I see default to 4096 byte objects with no
additional explanation.

If 0x1000 is less readable than 4096 then I can change it

> > +
> > +	memset(exec, 0, sizeof(exec));
> > +	memset(&execbuf, 0, sizeof(execbuf));
> > +
> > +	exec[0].handle = batch_create_size(fd, size);
> > +	exec[1].handle = batch_create_size(fd, size);
> > +
> > +	/*
> > +	 * To test 4fe2bd195435, we need multiple buffers submitted and
> > +	 * eb_add_vma() to fail. eb_add_vma() checks whether
> > +	 * batch_start_offset + batch_len is smaller than the vma size, and
> > +	 * fails with -EINVAL if it isn't. Submitting two buffers and setting
> > +	 * the offset to the size of the first batch will trigger this
> > +	 * error path.
> > +	 */
> > +
> > +	execbuf.buffers_ptr = to_user_pointer(exec);
> > +	execbuf.buffer_count = 2;
> > +	execbuf.batch_start_offset = size;
> Would setting any large value as offset trigger the desired
> error path? Is using "size" here significant?
> 

batch_start_offset >= size triggers the error path. The actual check I'm
targeting [1] uses range_overflows_t() to check the interval
[batch_start_offset, batch_start_offset + batch_len), if it lies in [0, size)
(both right-open). AKA it checks if what we say is the batch is within the
batch's vma.

Any value of batch_start_offset >= size will fail the range_overflows() check,
triggering the failure (see [2], "Any range starting at or beyond @max
is considered an overflow", batch_len needn't be set with start_offset >=
size). I think this is the most straightforward way to fail eb_add_vma()

[1] https://elixir.bootlin.com/linux/v7.2/source/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c#L608-L614
[2] https://elixir.bootlin.com/linux/v7.2/source/include/linux/overflow.h#L235-L268

Thanks
Krzysztof

> > +
> > +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
> > +
> > +	gem_sync(fd, exec[0].handle);
> > +	gem_sync(fd, exec[1].handle);
> > +
> > +	gem_close(fd, exec[0].handle);
> > +	gem_close(fd, exec[1].handle);
> > +}
> > +
> >  static void test_larger_than_life_batch(int fd)
> >  {
> >  	const struct intel_execution_engine2 *e;
> > @@ -705,6 +752,9 @@ int igt_main()
> >  	igt_subtest("larger-than-life-batch")
> >  		test_larger_than_life_batch(fd);
> >  
> > +	igt_subtest("invalid-offset-multiple-buffers")
> > +		test_invalid_offset_multiple_buffers(fd);
> > +
> >  #define DIRT(name) \
> >  	igt_subtest(#name "-dirt") { \
> >  		execbuf.flags = 0; \
> > -- 
> > 2.55.0
> > 
> 
> -- 
> Best Regards,
> Krzysztof
