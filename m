Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E71F8E4A4
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 03:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4745910E283;
	Fri, 17 Apr 2026 03:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqJSg4VU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8119910E283
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 03:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776396340; x=1807932340;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9ClEAaUl6+Nxcq93PPe32Hq4chSF8EsHb6VOd+f+HrE=;
 b=lqJSg4VUfm4CMeUcCDzCz4brjbaR5mXFlTlIhISzvEEYOaBSIYJJSXtR
 JxOY2BVDx60ZhL3EYu3rVED9Ibq37s9zwzn2AfWjKJQFKP2qiBsnJORmD
 o+8fwiyYPVnP822WdDxSkIwNeOhuHaFooi6QOVYhlrSM5fVVbG1aH5gvu
 I/YgHxBOIqqRqOvJTy1GVP3jBFSY05wNxfYObVxrF4RHJmQ3VpYGqs/BQ
 sYeE6OS5pzVtG2ofUqF8ZMU5Ac8yrsCsBQU/dOGRIjpdFtu0+Qu6ftiAB
 +ElH8s4dGZ1R5xvFp/KDS1MBDa20kToMcVwGcCHy75+nV2Y2XKlXYgA4E g==;
X-CSE-ConnectionGUID: P/sHqnZTSzCVbI/0tAN/2g==
X-CSE-MsgGUID: mivcA2GKQC+TyEP04Khn4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81279588"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81279588"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 20:25:40 -0700
X-CSE-ConnectionGUID: xmtgdjIJS9+i/PfxBIOFNA==
X-CSE-MsgGUID: iGtUxkpKSseeRTgoW7KAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230803626"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 20:25:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 20:25:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 20:25:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 20:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQnnf4tu+qnYfLbLHRKo0vz8bW9odjU2ygYgWsKndEl/4cIHLQKxuqWK1iDIzeY9/5RZUxMtFrLypjGS9UAioI38F99IrXF6G63mJQ06+6gJ1LINnqWQVIGGiHA/DF1m4gtYIkSso1aY2qADaWWd5yuHpUD1a1eDhViyzPanRl2FtJUAdyL53edaz7MRQ41WaZdkX062wUaX7Vo480alkGHuPsOImKgjZ4W7JyiXFR1uqLra/y/yGDEWJAZQXwAgILn6hGcRZC6Sf537wLD8dFdI43PHHN+hLGUrsNElA5TZiWccG7uY8neXWMTuuZxdM8K2xEOv4bAZzLExFtAjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIGLtiPd5Zanw2wAZzuqqHeGCbg7IAq5ubX9ZnC9VYc=;
 b=nSv0hQ2zuNIGaCtAYm6rs01s1gTVepuxrQyibdamyboMfMkI/M69ov+Zp6wGNgKq1oSnqH61DwMjVGivrgGDrOp6TUIJ/RzEsQPe3KMNSsDmaw0nsNkrGy1HjJ5A9X4VewN2DmHFjonLi0YK1hodHXqBOG6oj+05CRO0XV5EO3iY8H2Ja50CIDhdFIzx5TOXKLcJk7Aqw9KTpawwKFvrKIhhfDMAgDFYhHiRPq9xAleZbASHjo+QcRTsAG0iJEMJ5LGH1VSA8HIMQLLaThITdQxJqXcrVxlfXmZMhNl7+Moyrw+UDaKT8llyNKXrq8m0a5p2r9kAqN9PP+nWOQ1+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:25:34 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:25:34 +0000
Message-ID: <3bbde1d9-fe89-48f4-ac25-5c3d5935ec14@intel.com>
Date: Fri, 17 Apr 2026 08:55:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/amdgpu: Fix typos and grammar in test files
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>
References: <20260417002116.94208-1-alex.hung@amd.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260417002116.94208-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::17) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a1fdd8-79db-4333-3c37-08de9c30fc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: lvVXXvK3tWptAVMzroEHibh6Dl/e1/c87nAcIAK14KdHbAnfuIIyuPMRV9W4fy8oktn+K6I/QS6+kcT+AGH37yPufSw0CtdkU5NCAMQRJem44My2SvEeSKJw2CvOhM1c5AAGiGmBb3z0rkfUgSW8AipE0yjZm/RlJ/sYs8zMRWZjSmNe+U3ualjuafz8LJVmAcJhXKKcpy4CVoHyONlipH+VpV4crVtC9jKSP9GGgj5KFlRWqKRelvTzF8lxuXyobRc1KnCI2yAQAswqMwAba50z9VxlUNVunQm6pupCrQ2THgk8HB2rPd9dvWZo3dH+O4jvpBZaLeh/dc8JrQR/K3J4AL2xImVamGZefMqLq0KSsITP/jyLQTbs3ff5MvTRipluZ6UStDVwcX2M+pjsW54f+MgztkEfzK1R5AxqUl/jNx8i59x3upHicLPR24yikV4ooPTLGBDENr/Zv+ZYLpgq1w63tajDJcULhsrd0BtywZiPeekXTIo+XcruaQymC8hKR1wHvpDXZFrFa4JpE8f1l8LlK9/ZS1JfNIw1y768ioXBWpzK1KzqmHfgK2B2E8xdBeAIeUYirBpi4pMt3nXBimyGOu84grr/Y7Mx46VLTePLDgILjNwywBQSUoQ9wEJpua9V3S4Ih2a/M1/kAHlmDGGpN2+nxSxt66hRhxU7E77b/lP+0LMiVQ49PiCzAXY7rjW/mCg8Dm3rHtJDDS2i7CS7lO1lDkKS5ccWFyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjdSTnZxdm9lZ0wvWEFxdzZCekRuV1crT0ovTkwyT2FRUTZob25BUjBaNk15?=
 =?utf-8?B?Z0tCQ1BDWEFSdTdERlBHLzQ1cmdhTlVYVDdBQ0NtSmFvOHZmYStlL0p1VUNa?=
 =?utf-8?B?N0l0T252dXdIakl5aHFBYVNLemZxWDhBbHB0WGZTcUlXMXh5bHBEVzZla3Rx?=
 =?utf-8?B?dW4vSGxEK0h5Rk9aRkZ1ZzcrZHU1eWlmR0EzOHo2b1RGVElmeVJaL05vekdl?=
 =?utf-8?B?QUFhRzJVQ0lkbkR1YTRlOERJaUszRXFwQytobHc1aWdZMVRVaGVEUkl2UFNp?=
 =?utf-8?B?bEUrbUo2Vll4UmlnMDgxU1JacDJXaGFvZ001amlMOUp6NlVMaTlyUHhnQlFQ?=
 =?utf-8?B?R2dlS0hHVkZNY1IrWTZzNDRTSlp2UHlaaWxLWmo0MmhGR1VuTkhsczQ1S3NF?=
 =?utf-8?B?cGVaQmlHYkEzWGZGZjJCTTNLSUVETXZEUUNKekdSbnZiMUJtU2tzbjA1YUhH?=
 =?utf-8?B?SG5mTURoUHVqMktodHBwU2RISXE0eWM5c1FWVFBKV3cyUzhJUXpGdE5MQkY1?=
 =?utf-8?B?aitGV0tJUHZKOUhtYmNMSmgwc0dPeG9TWnNRQUpFWlBUVGQ5amNMRkVEVXJ0?=
 =?utf-8?B?ZUVqWTJRSjRKTmtyT3YvdDF0SHpheTRyWmlIV21WcjFkZythbVdiczVDWE1l?=
 =?utf-8?B?OStiSG1uRGY5c1hDVjJ5Wk93ODNHMXYrS1lnRVZ4VFdBMWRNZ0IvUWJTdlhp?=
 =?utf-8?B?UTBhWHZoSkh0UU9FK3BzbUxlendxS2ZrL3QyeTdNZlVsZzBEMjJzb0lMaDdZ?=
 =?utf-8?B?c0gydTZ0STAyL004T1pvemNLVU1ubml3blAvYnJSYWR4Z0J4dGJNTFJHWmlI?=
 =?utf-8?B?M1RZSVJ3Z2c0a3NNQmlETGdWRnJuN1QvRURNZnhrdFZiMHA1eUxHRSs2VEIx?=
 =?utf-8?B?ek5KRytNUys2SWZWL3k3aWwzNnVuS1ZLeHBBZllFZ3BDZGNaVW9JNGlQaXFN?=
 =?utf-8?B?U0NCUkRyV0NEVm9kYXdoSVJzdFJSTnEvakpqVTlUTEM3OTFSKzEzMUpyRHN2?=
 =?utf-8?B?ZFJWTjk1OFNyL2dVeGRhSkhGOWprZW90SlA5U1ZVcWE2dlFpa3RCcTZLK3pW?=
 =?utf-8?B?OGp1NlpkQ2tLZU5MeDgwa2lKUld3YTRya29xMzEveFd5bm1TclpRMlBHLzMv?=
 =?utf-8?B?SWNDOWZhRVl5cjlwVmlHTFU0ZUJ4YkNsNkNPK2dLK29SSW5ESC9Ta0hzTm42?=
 =?utf-8?B?Zk1rOHQ5bklIRmNLcDQxNGRTZzVFQ0o2MGx0dGRGL1pjOUN3YjliM3JkYSto?=
 =?utf-8?B?UXN3TDEvaC9tZk9hQzZwUGhZQW9mSWhTTFRPeGI3L0x3TDZxNStHSW9lQUdI?=
 =?utf-8?B?VTBoR1NLdFNDT3NybFgrWmdMVGFYVjAzZUdxT1o5VUxGVHdPeHVJN2FCR0gz?=
 =?utf-8?B?ZlRmTms0ODNTVGJneW1NUGRQaWs2OGZsU0ZGVW4vUjQ4eXhJVW0xVVJCNzlO?=
 =?utf-8?B?bkZmbURNQk11VVJQWFRraFljZEMxU29oYmRjVC9JNWdCQjE0VFhUbjVTbUJo?=
 =?utf-8?B?KzNhVXZmS0lvUWs4NjRjN1BlMU5NaFdZVk55ekFmUUdUTTQ2dHdrZ0JTUWZQ?=
 =?utf-8?B?d2dxZVhiVHFvcEx2SlhwVTB6SDVyU2U0K3lxcDVGT0I1TFdLT01xaG1ucHdi?=
 =?utf-8?B?MnVxeFY0aE95ZllaaDlHd0NFTEQ1MmJsL1hwRHJwUFIrK2Y3RXBhTlB0S2hs?=
 =?utf-8?B?aHV1ZHkvNFA1eDBUc3lpL1RIRVVTbkpnNGV4aTJwZ1ZqQ2VDSVd5ajFGMC9s?=
 =?utf-8?B?eGFndjNnQzBhRzlZbVljMGxVa1FTZ21LengzRzVFU3QvZjdVbUUrOWxEWUxM?=
 =?utf-8?B?RU51bTl6KzViVFNJcWhkLzNwQ1dvNmdSMHdKTCtOOGF0OE4rSXptcjBYdks1?=
 =?utf-8?B?Uk9HMzE5c2ZCbXRldTR6NFF2dStYTU5xeHNMazRseW1ydkRRdFhKSGFnS0ht?=
 =?utf-8?B?cVljcDFlRVhjaEVPbFZHQWE4bnFSK1VvcjA4cmY5eVBvczB4cU9KczVzaXVB?=
 =?utf-8?B?djRrU0VUSkswQkNLbDZOK01VM2FpYUw0bzZ0NmFwalpGeWYyMzg5Q05CaktR?=
 =?utf-8?B?YkhGVmhJZGdqbW42SDllV2N6ZjV5YkI0dEUwLytaWlQwSXIwSVF2Zy85Ymk4?=
 =?utf-8?B?MDFQRDNlejRlYzVXK1Q4QXNBRGIvU3hERDFnZEdPWHZ4RWk2VXB1aFp3Kyto?=
 =?utf-8?B?NXExNEEwSEZnN3Y2K01iUEFra3g4K2lWdHpvY2MyMVRJTDRoN2hId1VDMkxB?=
 =?utf-8?B?RHRUdFl3d25HZ2hjZlhtRzIzOVEreUtQVnE2MEpZZHZvWkMyaU1INWo1cDBJ?=
 =?utf-8?B?V05wT3BHNDFiUnRKTWVEVW1DY0Y1RytuWkN5bG5Da25QL29mS0Z4Zz09?=
X-Exchange-RoutingPolicyChecked: csesqowk3kILMAttBpmUCU2RxMIIWUYevIwHOUZbzDfqOMYNaF7myhUVWaG3Kfhdixvwa853LLLSVYFhmxHrC7COCVGyOAAvgJwywpunj2qNFS8etHaaPgZUZxyVDzkC1+z/XYuuupajcsENqAWU8DLqRFFc8HEuk50AzZpoPMQTdxyDbvIVVLn+XdEA3Zi4N8LQvvSubkrgKt0iqV3v34035YCjtV2oMd+lU4164r66atSjgOrpIBc1SpwJ2GobilL/5EcNhrVh6PAIh/zqpJ/HUV+dBz1z5B3Tw8xFrQsFUhP4RIVbDVtJ/RiLslucbaA6SIoR+SQybvBfTcI45g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a1fdd8-79db-4333-3c37-08de9c30fc0c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:25:34.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7PlNGTdWmFFmiFjDfOVaMPteOIcDtbwv5qRjj19fRwVlYBkthMp2/s7eogdeKX0pE/8yeftYBxsAbkehd5H1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
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


On 4/17/2026 5:51 AM, Alex Hung wrote:
> Fix various typos and grammar errors across multiple AMDGPU
> test files:
> - amd_abm: "amdpgu" -> "amdgpu", fix grammar in comment
> - amd_assr: add missing article, remove trailing spaces
> - amd_color: "amdpgu" -> "amdgpu", "liner" -> "linear",
>    fix incorrect "degamma" comment in regamma function
> - amd_plane: "backgroud" -> "background",
>    "overley" -> "overlay", "beacause" -> "because",
>    fix wrong size notation and misleading comment
> - amd_vrr_range: "gange" -> "range" in function name
>
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/amdgpu/amd_abm.c       |  4 ++--
>   tests/amdgpu/amd_assr.c      |  6 +++---
>   tests/amdgpu/amd_color.c     |  6 +++---
>   tests/amdgpu/amd_plane.c     | 14 +++++++-------
>   tests/amdgpu/amd_vrr_range.c |  4 ++--
>   5 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index d36044aab..207d075b0 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -128,7 +128,7 @@ static void test_init(data_t *data)
>   	if (!has_edp)
>   		igt_skip("No eDP connector found\n");
>   
> -	/* It doesn't matter which pipe we choose on amdpgu. */
> +	/* It doesn't matter which pipe we choose on amdgpu. */
>   	data->crtc = igt_first_crtc(&data->display);
>   
>   	igt_display_reset(display);
> @@ -169,7 +169,7 @@ static void test_fini(data_t *data)
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   
> -	/* Disable ABM before exit test */
> +	/* Disable ABM before exiting the test */
>   	for_each_valid_output_on_crtc(&data->display,
>   				      data->crtc,
>   				      output) {
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
> index b07f3fb15..71209e79f 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -29,7 +29,7 @@
>   #include <sys/stat.h>
>   
>   IGT_TEST_DESCRIPTION("Check if ASSR is enabled on eDP links that support "
> -		     "the display authentication by changing scrambling sequence. "
> +		     "the display authentication by changing the scrambling sequence. "
>   		     "The test also covers embedded and non-removable "
>   		     "displays that appear as DP.");
>   
> @@ -285,10 +285,10 @@ int igt_main()
>   	igt_describe("Test ASSR on connected DP/eDP links");
>   	igt_subtest("assr-links")
>   		test_assr_links(&data, TEST_NONE);
> -	igt_describe("Test ASSR with DPMS ");
> +	igt_describe("Test ASSR with DPMS");
>   	igt_subtest("assr-links-dpms")
>   		test_assr_links(&data, TEST_DPMS);
> -	igt_describe("Test ASSR with suspend ");
> +	igt_describe("Test ASSR with suspend");
>   	igt_subtest("assr-links-suspend")
>   		test_assr_links(&data, TEST_SUSPEND);
>   
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 68f541d64..eb1eb581a 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -177,7 +177,7 @@ static void test_init(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
>   
> -	/* It doesn't matter which pipe we choose on amdpgu. */
> +	/* It doesn't matter which pipe we choose on amdgpu. */
>   	data->crtc = igt_first_crtc(&data->display);
>   
>   	igt_display_reset(display);
> @@ -262,7 +262,7 @@ static void test_crtc_linear_degamma(data_t *data)
>    * sRGB regamma matrix with incorrect calculations or rounding errors.
>    * If we put the pipe into bypass or use the hardware defined sRGB regamma
>    * on the plane then we can and should get the correct CRTC when passing a
> - * liner regamma matrix to DRM.
> + * linear regamma matrix to DRM.
>    */
>   static void test_crtc_linear_regamma(data_t *data)
>   {
> @@ -291,7 +291,7 @@ static void test_crtc_linear_regamma(data_t *data)
>   
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>   
> -	/* Apply a linear degamma. The result should remain the same. */
> +	/* Apply a linear regamma. The result should remain the same. */
>   	set_regamma_lut(data, &lut_linear);
>   	igt_display_commit_atomic(display, 0, NULL);
>   
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index 412a220b2..e63d4dc2f 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -366,14 +366,14 @@ static void test_multi_overlay(data_t *data, int display_count, int w, int h, st
>   }
>   
>   /*
> - * Compares the result of white backgroud with white window with and without MPO
> + * Compares the result of white background with white window with and without MPO
>    *
>    * Reference crc:
>    * Draws a White background of size (pw,ph).
>    *
>    * Test crc:
> - * Draws a White Overlay of size (pw,ph) then creates a cutout of size (p,w) at location (x,y)
> - * Draws a White Primary plane of size (p,w) at location (x,y) (under the overlay)
> + * Draws a White Overlay of size (pw,ph) then creates a cutout of size (dw,dh) at location (x,y)
> + * Draws a White Primary plane of size (dw,dh) at location (x,y) (under the overlay)
>    *
>    * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
>    * a ref crc per flip)
> @@ -400,7 +400,7 @@ static void test_plane(data_t *data, int n, int x, int y, double w, double h, do
>   	igt_plane_set_fb(data->primary[n], &fbc[n].test_primary);
>   	igt_plane_set_fb(data->overlay[n], &fbc[n].test_overlay);
>   
> -	/* Move the overlay to cover the cutout */
> +	/* Move the primary to cover the cutout */
>   	igt_plane_set_position(data->primary[n], x, y);
>   	igt_plane_set_size(data->primary[n], dw, dh);
>   
> @@ -451,7 +451,7 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
>   				int x = dx*j*dir[i][0];
>   				int y = dy*j*dir[i][1];
>   
> -				/* No need to pan a overley that is bigger than the display */
> +				/* No need to pan an overlay that is bigger than the display */
>   				if (pw <= w && ph <= h)
>   					break;
>   
> @@ -491,7 +491,7 @@ static void test_scaling_planes(data_t *data, int display_count, int w, int h, s
>   		int ph = data->h[n];
>   
>   		for (int i=0;i<ARRAY_SIZE(scale);i++) {
> -			/* No need to scale a overley that is bigger than the display */
> +			/* No need to scale an overlay that is bigger than the display */
>   			if (pw <= w*scale[i] && ph <= h*scale[i])
>   				break;
>   			test_plane(data, n, 0, 0, w, h, w*scale[i], h*scale[i], pw, ph, fb);
> @@ -523,7 +523,7 @@ static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
>   	int it = 3; /* # of times to swap */
>   
>   	/* Set y to 0 if window is bigger than one of the displays
> -	 * beacause y will be negative in that case
> +	 * because y will be negative in that case
>   	 */
>   	if (h >= smallest_h)
>   		y[0] = y[1] = y[2] = 0;
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index 4397f3c15..0312e22c2 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -260,7 +260,7 @@ static bool has_vrr(igt_output_t *output)
>   	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
>   }
>   
> -static void parse_vrr_gange_from_edid(data_t *data, uint8_t *edid, int index)
> +static void parse_vrr_range_from_edid(data_t *data, uint8_t *edid, int index)
>   {
>   	bool max_rate_offset = false;
>   	bool min_rate_offset = false;
> @@ -314,7 +314,7 @@ static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
>   				break;
>   			else if (i == range_head_size-1) {
>   				/* Found Display Range Limits Descriptor block */
> -				parse_vrr_gange_from_edid(data, sink_edid, index);
> +				parse_vrr_range_from_edid(data, sink_edid, index);
>   				return true;
>   			}
>   		}
