Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF519C44500
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 19:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469AB10E673;
	Fri,  3 Jul 2026 19:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uw1DprHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02FE10E673
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 19:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783106511; x=1814642511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IbXcpzkZcODRFIMS0ehxDSTcIKvfiWvj5KkqR/Sa2DQ=;
 b=Uw1DprHjv0J+WI3ExcFmPTX7HIrjO9Rgmv41QBXLOkCJlXN46Yw2+SFH
 zFua9cq29fwKM8VYSS9woU2/p7djJfImANdCejbfoiMAblBzJGn9htT6Y
 PUhoTHTsFjIhwwJ3V7MN1Ujf/+O5xkfyGpjk5w9yPNP9kkJqmynb2eP0s
 bmR5yz8wZpT65h7URDdFBoTIlP5+I+fhDjPs12Lz2rOffP9sBTfVVewNK
 aERsdD3EL//insKkUwvrcbanHxujG//cVethi0x4LdrNJ7LARt0SCKwWJ
 QOMw3xx1Jjsn2/NjTfWejswUpdR9oISA44uGl8TozthqdnzkOCfVAiFCq Q==;
X-CSE-ConnectionGUID: BoVBFq82Q/2tbOo6HaH8xQ==
X-CSE-MsgGUID: xdAKzu9QRJilgTGYHivGog==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="109402587"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="109402587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:21:50 -0700
X-CSE-ConnectionGUID: +rhVLtrJSeuvUugFbvAaLg==
X-CSE-MsgGUID: i96tcXmXRZ6OfBahwKNv+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258068594"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:21:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:21:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 12:21:49 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7vAq5HSnlGJkzYuJT3jgf/VWUsSrmPVY7ERIIPKJaShUgS6XkrU285kk850sOp8Vsco3zwq8yNQ3+fTotoreUlCe3d68x4hsd1AS5yGtEQHxfB44Fx1hje0BpktNRrCoPgKZM+o/bS6KXZrPWMX6Kf5rkHc8aE0+FDCeuvJDVmBpoMbTgwclIA3FyrUo1RECujjjtsEQRY5q5OHVzs8Pe329O6iJ1dWmXKeEOCH0HepUK4x5KaDby6nq98UJYmKzUCTbtonplJAYQmH9A/jB/40pTJOdcZuMlWXk6UJAOgra/GmYO4DNXYIdDKwSBf17BT+RUfuPB2ccGr/5gbZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgpS4ZVNvzNeHZzdAYsVK2scqHcJ/2b9TH5nzsqopbM=;
 b=I08A6aUsM755wxnfORHfuEExxzaID6D0FHKUYqj3/O+G+pSunftaabzvnUvCZ7LBaggK7h4BmuKzWBq8/GyK+DGhs8NeU8KL+sQ4uphI9+ItuB0rnMvP5MfORP8Hk+jrOVNipz/pKfVJfHpz3rQeZYEyy6g7trKPFbi+E8IZpPkk/HN6wO5hjJRWseSB8nxiVo8eL3SOsoiwdfAGaudcQM5P1s3h+DStLWQKD6/vZYefQbs6z1vD3zjrU0vyHzvqsx1lE/0D4jUfaoBkWyLICtUdWHtwO8Sfr/vYsKbs3D3o9Mk1uQDKxJLo2KG9asBPaKoLuto1YBAOvrI7h1tzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS0PR11MB7358.namprd11.prod.outlook.com (2603:10b6:8:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 19:21:42 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 19:21:42 +0000
Date: Fri, 3 Jul 2026 21:21:30 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 01/31] lib/igt_tools_stub: introduce static
 sub-library for tools
Message-ID: <e4cdzpmfhytckimcn2ync3v3kmt3fhl47do7suwgyt7vrutrkk@ne3cdhcbyxvo>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <99c93f19877174d8a9dfd156dde841808a5950a2.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <99c93f19877174d8a9dfd156dde841808a5950a2.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB9PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::28) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS0PR11MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c3b5de-25a5-4f44-b54a-08ded938501f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|23010399003|4143699003|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mlP40P4cDB+oBmVtlZDNzDOrsztQu/+KVCDEdeSZ5U+jfkkOaDvMqexyvjno5dXHv8f9il9f9/GiXyrN17Mg8JTfIGQ5kSTyG7y9w8jfXmz/LUYu2hlrVIHdWocAZ2d1apNSNHhipkwfmm3BnBlimVkLFDo5lf96XqYGiaRwrt8PgjcaOVgjW8Gt8gULCqMjB8XzKbaDfIeCXGvL/XO/VDBYlfexhTvn8nLJsTgmNC/zQeO9TPhrXxa7KIcHN6UyKwDAIZPOcSUd3Y73aKEAWVHPNv+lrW6gMxrNdJ4fD4dooPQHtBkHnhakZsuwiUn2ygTjyMt9IgCJ2f3SGMizOfBfMemBveOEAE7ASWTjVSjsukuD6D3lqK/uAl0yL1tvoDh7lzURY264B0QDQkLiEKAjFahdZeI04spNJd4n2PiSujLN4i0HqOPjDDGzHyZdBr95FrDlRSIaW4Ub+zJg6ckv6WHMOnYwAbW7W9NItLnW/MdIH0t/YOsasmK1hohfvTkEOZzktLOKSfzPZx2syxML3I1k8W7g73mt/bR9K4vBOzBmSLbsnfze+H8AbbGAcIiPJ/Urun3KZhVyCz31IrenqRTtW4WDbIxkDzhMFczicgZSuOHGET1jsloVP99DqYlZsIxLReOveAddA4MneXfZ8AmVcCvKWz2Ctr6LwtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(4143699003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXdkQktKVXZXM2hvS3daSUdXdlhINDBhaFVSb1kzZXEzRElFNGdSTkM5UVp0?=
 =?utf-8?B?RzVtRCs3dVdHc1lYL2E2SVRTVWJTVHl1WXlvcFFMd0RVY1pzQ2thTEFRTnUz?=
 =?utf-8?B?YUg4c2RhMGhqTEFBYkJxeDdmVENienBVcFlsWFlJWlpaRVJCczl4M1hiT1RQ?=
 =?utf-8?B?NmtZOVgrYm44WFEyMlEySm5ncGwxaGdQdHI0RXBicmsvN3NvcHpISGZvc0Nr?=
 =?utf-8?B?VjUxQldXOUM3bWkwVnhFaVpTU01tdThOdjlEbFEvdWpCUSsvRXJCR1J2R2lK?=
 =?utf-8?B?VGx5UWhCNWVDS0djNTlmVGx5a3BWL29XZWVtSmo5MVVDK3JEYTM0dzdoUVlG?=
 =?utf-8?B?SUpJRzJMbitzWExrM0UxY0VoajhzVzNCRzJEbWZZMEpZWUVtV2RSaVZrMG9W?=
 =?utf-8?B?L2ZZek9scHROdnZFdWp6V0dCZC9ueUtsbXRYSHd1ZmM5enp4NERyaWtEeDZF?=
 =?utf-8?B?MlBZbUdQYXVVQnhwS1JudkwvSEhkb09jMGZEeTdzWUsyRmE3UmtsSXNkUjFh?=
 =?utf-8?B?alNqSUpCQnZyOHdPTW81TXVZUU5vM0I0eUhGSU1BclBqNXJRZkN3V3pJTEdj?=
 =?utf-8?B?SmdHaU1ia0hFaTBSQzRsc09HYWhlRUt3dGhIZ1dyODFhRW81NVF6WEhPNTRV?=
 =?utf-8?B?V3NybnhEaXhselMyelFESkNOeno0VG9sRGkycUpQMFJ5Lyt0QUdoWXZLd25q?=
 =?utf-8?B?VGNra3VnK3ZRRGtkOWJUVkROTVp1VmtmVkxlQnI4MVFsU0VqczM3QjRabmEv?=
 =?utf-8?B?SEFTdllwOVUxRUxPQWhaSnBCd1ZkVVlLRmE2SmdyQWRtRzF5Z24rcC9LcTlY?=
 =?utf-8?B?V3E1ZnFFQ0xjM3NIclRXcEg3ZTBVVWdjYjVQQTdTV2VIYytMQjFKd1lGalRI?=
 =?utf-8?B?WDVjdkNWTlF5dVQ0dVJ6ZUc1US9qbnBNVy9hdnlWTGo5M0ZkeXhPc3BoaHB5?=
 =?utf-8?B?UU8wMks3Nmh6VEcyUHRRUVVrSkYwZ0NxQWR2RklSMHpGbUM5N1FldzhTUjBs?=
 =?utf-8?B?RXRadVNDNTJycElpZHlLeVJsTmdITGFZWVFhektqNWZ1WGJKM2pLNE16UFEz?=
 =?utf-8?B?M1laTUZpbHl0bExiUkV0aDNTbzZJT25tOE16dDZsaHB5M2xrODlMWXBkMWhU?=
 =?utf-8?B?Y0xQbXQ5NFdkWnJZZWtDdHpxZGlTWkdxLzhOTktucysreUNPZUJmakRVZEdI?=
 =?utf-8?B?TTBDWTR4NjQwRDJSdEthWjl5K2o4aVF2UUZ4cTdzSXl1SW5yUzI2cGNhVkY0?=
 =?utf-8?B?SjMzbTErK3lKWDdySmFvZFE4eUdKOW82ZlBIMzczNVRjMnJnU2t0OHNpemtI?=
 =?utf-8?B?U3N1ZjBCQ0hJRHFQSWVRK0Y1d2RLeitzWlQ4Q3ZYaEhvTGNqQzZ6N2VSVkQ5?=
 =?utf-8?B?R3VsOVlOSTBieU1VRGdOWVNUT2xwSFRmemZNV1pudnVlb3VoeE9BMUZPU09x?=
 =?utf-8?B?dGdNR3NRMWgxTUw4T09uZWxQYVhqTmF5cjNNcWVFdVdWdlBHcnI2WkVaaDRI?=
 =?utf-8?B?WGc1MS9Sc0VtTEM4WVB5aHlEWWx6KzZkTmtQdTZqTWZCRDdRZUYrYzh3aWV4?=
 =?utf-8?B?NGU0S2JuRE1hSzVZMTlCbndjVjZjV1hrM0dyQllHN01WalFWQ0MybDM1SU4z?=
 =?utf-8?B?WkJqRVI1VFNGcnZqQ3g0NFMrNTl1N2xGalA5dldjZS90L0EvSC9TY2pnVWpq?=
 =?utf-8?B?TXgwdmtiUkpiaGFLc2E0K2RCb29NSUNFM2tGT3FZajBBTXdNMnhsNGF3K1Iv?=
 =?utf-8?B?eis0YWN6bEtyVWJtZEJCMHV5ZHhXd1FBdWw1c1BxcmN2NlBmNFU2L0t6R04w?=
 =?utf-8?B?UXMxL0dFcHRsL0grT0s3d3FLTG00NEZ2N080TU02QjBwVk5lWlUxMlZNODIx?=
 =?utf-8?B?TG1XTUJIa3FWcFlUMjJkWVkzMFdNeU1rMG9LTy9tdk9PTzZCVE45bWUxaDVU?=
 =?utf-8?B?SW56ME1lR05PSnlpWUo1VkkwMThqWTFJYlpmLzVwZC9DalE3Rm9tRzRCaVRB?=
 =?utf-8?B?VUhVMVYvVm14cUhHc3JtcG9qVnc3dktOKzhMWWVwVlI1NG9wQ2JHRVRKbUsr?=
 =?utf-8?B?UlhDVmFnRFRxbFlWNU5wQ1hDa1RLeVV1T25kQTNHKzhwM21JSDlWQU91MW5m?=
 =?utf-8?B?S1N5K3JsdHVtS1VxYmJ2c1pmbG5IVWZ0dHlvVTNsZzQ1UTRiQXRMRDQ4bDFX?=
 =?utf-8?B?WFovOWJ2QWFWb2tRWVZFZ0xsS09xUTFkVVpNVTUrM2JMOGMrM1Jkck5pNjZ5?=
 =?utf-8?B?WXp2UWZkVk05WndlM0hHTUl0UkNHaXFOQ0dHMlJhTFhkaWl3VTI1dG9ubGZW?=
 =?utf-8?B?SVVCbDJudXBiL0JKWG4zRk5naXR5KzdaSXRPZndQcG9FUmc3VDl0VXZzOHE0?=
 =?utf-8?Q?DeByxLMhqMDmJMEpJdqGw3zmDRGEitpc/4DvTuphxl50q?=
X-MS-Exchange-AntiSpam-MessageData-1: VdM1BQACcJSTOjgFeWgGsEeSmwvr5qIyaBc=
X-Exchange-RoutingPolicyChecked: n8CIDXz/cTJTJMH5obCPxS75IpEdn8StZ0+N6rlJnU9H4utEYsvGxrnXN5YSN9uvxRJBbwICyUQXQSnxQfHqvRgHCcvP2B9ivJx4rprPqLDOdTCKjugl4UUB01El4YYocDrkTflfCaBHcIc1x6wzgwvnDbqI/OEKboi/KPSIVvrZM2qc7FgEAPaZMdnJp+nf7eqfZO3clVRua7fbZd+8oCAdnJeTvxtS6YF1Wc0lLVvk589q/zUa7h+i64yTr/Is1Dp4Ox9aWi6JCtbp/2r6Q0HN2tRs4r2xKK2pTz21XQ58+W4YZ1JHi85w6RW26WhT9rzfltTDjx0T3LuPhbcTqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c3b5de-25a5-4f44-b54a-08ded938501f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 19:21:42.0350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3tPakkAu6Jx6KwUCZzsoasVIWqqDDX/YhKR/cagcPD1vSFTaiDW0/IwEAEPY8QBxRmLAPast4oh0W44CL1JOaVBP2pls2ykbh/6A7RbCvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7358
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

On 2026-07-03 at 16:28:35 GMT, Sebastian Brzezinka wrote:
> Add lib_igt_tools_stub built from igt_tools_stub.c. Tools that need
> minimal IGT assert/logging stubs can link this without pulling in the
> full libigt.so stack.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index d1289a5e0..e95b29d49 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -349,6 +349,13 @@ lib_igt_perf_build = static_library('igt_perf',
>  lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
>  				  include_directories : inc)
>  
> +lib_igt_tools_stub_build = static_library('igt_tools_stub',
> +	['igt_tools_stub.c'],
> +	include_directories : inc)
> +
> +lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
> +					include_directories : inc)
> +
>  scan_dep = [
>  	glib,
>  	libpci,
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
