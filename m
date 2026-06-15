Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E1CD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 07:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A146D10E21B;
	Mon, 15 Jun 2026 07:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2MtB5TB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC0B10E218
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 07:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781507317; x=1813043317;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7TKmW7/nNgxnfIEp4NWgAdj9QAXwMYpySYEaD/EJtZg=;
 b=g2MtB5TBkio59YOyAgJ1OKQkHbNba58frC8CW1H6NWBKLRZEBjZEhPnU
 30Y1ned1x81UsQfFjumT0Bqn5MLyUlfQEalf+/NEM5Sm6ELE0WIzv+xHK
 vEldRLv7VWoKBKE5QI/EcC26bhoNgvE2MVr6SXAGR68a49d9TVDg+/R6f
 ClUrFRlZnT6fYL0Hf49mRF8+lT19ToTCTWy7XjnghUEABwkTAsjcY501Q
 4Mm4hZ9RyfukFI/UdHvutn30GpqPx0Ooiq+Bcm27a0R+/XVt/nlmVhKOE
 3deE5rZLm+xzpMONA1ojDi/VuH5ppmJSrchzFFtCKfB8pAM669C+PxeXL w==;
X-CSE-ConnectionGUID: 7lZNLCE7S5qS0DK0EbX+iA==
X-CSE-MsgGUID: 8DUWTwUOS7u3dSg709Wxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81981026"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81981026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 00:08:37 -0700
X-CSE-ConnectionGUID: en14EmytRj6jNciskKvkLw==
X-CSE-MsgGUID: 1mWT/GUwQEaVNm46sKijYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243025918"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 00:08:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 00:08:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 00:08:36 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 00:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K97BnuUUv855E4fqT3maoHOX6AQPHjM/5WE0Nzo9r00Z0+1vuMVAM/gDD9yxVcbihLJEvojz/+poBtcpvTNQwxNr2k9P+I94JwYMq+YxvZwtDaWCRffuE/zW6WUSi2b4Hs7H021dQ9SuNQK0S0+y+IQK++dOxhPXQVy0E1kQdunA90OTLNURpgwSKSLTbPn9suVZElVkeT4uGOPaJ5MISyltpgtorg1/1Dzt4bpiEAWxoxXQw1sQSZoPI0JyWU84x/RXFg8b9WX/j95YEnFlrSoOQVxV7x09XMrERvFr5KabVnZS8D9PrSgpOYdVLfIhT9TaDhEel8YKUSIS7szmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+26qrdq+26Myqy/TKPhM8Tf66qDtFHpLo3wmunqA4E=;
 b=rTQ+VyVsQATS+Nu/a0V35kRhiQjEXbRqGXMwbgP9zlVjOLxWBhow4jAcHRGYG/sR0W0/esZ8K9WrDRuNAxnf7yMzjCUZ92lCHPK/NWSiGEL0Txdkt/rrf8TQhOAa34mnE3TlSViVIR/YZNSBV+k2RH2F9iuy9fIx1GbzUtfrW1eGAvfbwdH/u71YCdGx/Ny4TxtpWhNCMRqaCYbNuTl9fCxuy9Q6QG66CXCd1duHAlkev54nY4OMNTR42ZTlNXQqunLpYE0iqJJei8oaxnbYXZUyavO22gJaFjZPLTY4Qs3HqI3eAFDkxIlv+YxoVy9I/CXnqodO53t0cDlWAWwPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS0PR11MB7409.namprd11.prod.outlook.com
 (2603:10b6:8:153::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 07:08:34 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:08:33 +0000
Message-ID: <19bc434d-09d3-4c1e-8d16-2398e6053d95@intel.com>
Date: Mon, 15 Jun 2026 09:08:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
To: <nakshtra.goyal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>, <zbigniew.kempczynski@intel.com>,
 <priyanka.dandamudi@intel.com>
References: <20260615051321.544506-1-nakshtra.goyal@intel.com>
 <20260615051321.544506-2-nakshtra.goyal@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260615051321.544506-2-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS0PR11MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 68df695b-6992-40d8-33d2-08decaace97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PQsnqz5MzcC6o/9qr/WHnR/7JHP95eOVAjyWhkdX2PNHf69Ng8oYLaw+z+b4jidLLweF+kFQ+1xpqirTDm0mZQw7JYvanAEvvbCdLwlYiannVTNswwSvmjpS3F8lP2PYb0uPCy8wOQJjFSVrPEils/lYOLiPaNL9fsz5Qnw9592/eS1dZMolSZEB/7LDl0n7suJuP0kx8ztIygGzJzOSfHdYLS2MaBNsfDnxTpu+ytOkPQO77FMIj0A3MAGK6qthCo3sgrRc1E56RRP/fdY639VSbdj3YzJFvaJ53QdXabqZO8Vwhz4fbrLG4y4VRNcNk+JMw5z/Nat9Aw+cdQiwbLOunaD9tngRJFpP354o2Ie2p+xpeYEWN05F/QDoVEGh0iV3pbLrn0XFbyOc/WVV/GFuuSJvYw5ed0E0N3PK+ydKgm+xX6bWJ/QuGnFw7MW32QzcsIlyWxB+DiunZU4p0LHWTAVX8vyCLE5k4/cNdTHTQ0d5Xt2SzRR85I7H11Af4mhgpRfriIjxlWXN00D9GOLOq4eC1edIs3wo3cIjYsVnUsWzmFQ1ohH4vKGuhWIdCxa0Xr91uyEa+3OZOggdv89fLDlaHN6/LEre2Ql0xG+kQ7SGJnItJqXzq+6Xuy1hoAkNMd5nz68Nbq93e2RPCEhWroyFqI9oJGMo+CUOVh9QkljHBtFpyi7l6PBI2NeB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZsOGdBU0I3b09NSUdBNlFtZkpYUGk5MldONFYrZUppb2NzaW40Nk91OTJQ?=
 =?utf-8?B?bnV5cFRlQTBwcXJHQUhZN3I0VXBXNDlIemNrSERvT0ZqWUVWdGdvYmw4MXZO?=
 =?utf-8?B?TmdCa3JKWXFZNHJFNlRvVyt6SWJJQm92Ti91ZTVHVzhRa1hkcUp5OG5OZXl1?=
 =?utf-8?B?bnFJZldFc0duajhGQXcvQjFOMVVHVnVlR1NyNm44TDRRdEZDQ3EzNE9JeFcz?=
 =?utf-8?B?dllNS0RCODRiTWhjNENGQXJBODJvZEJSWWl1aFdRNkdrZmZDQ0U2U25abEIr?=
 =?utf-8?B?VlRTK29zMzFuUkpXSWhXTGQ0Z00xUURJeXNRTkZDWnZpTkF1dFhkM0ZEZERK?=
 =?utf-8?B?WDBFRk9TV3orMkI2YkZKRk51dDhXclNYek9OUXM3MXc5dWh3enRQZUZaTkY5?=
 =?utf-8?B?RVNmTWlLVTUxd2VJN3l4R3dBeVk4VHJEd0Q2MWM2c1dTSU1UWmhoNzkrb0ky?=
 =?utf-8?B?WmxDOGlPVnFMZGUzd3pPaDhOZnFLVlkvSjI2UHJFeVh2WGV1ei9lNkFTbDVR?=
 =?utf-8?B?WGhnaDhUekN1LzdMYlpHWTZVNDlOdXZxTDB1MDR6L3MzTlpodzd0L05rZ01x?=
 =?utf-8?B?eUx3UlNiWm0zblE3cUFQYjZsdDl4ZXpVOWVSMXFQMzlKMGtPNllrQU96bVd2?=
 =?utf-8?B?OFgzd01wMEo0TFNRUEJ6QjhtUzUzYm1VcXF4d2NRUENnM1JTQUxZc01BSStw?=
 =?utf-8?B?OVg1eGtyYWxsT1NwdTFtUit5dG5qWkEvb3lxLzZVQjh3S3N6VGEvWGNxUCtZ?=
 =?utf-8?B?ME9YNnFEZHBreXZHYlNYSEs5WHZpN1h6R2ZucExlVlhJT3RjU01lUzNyYjl3?=
 =?utf-8?B?aFM1ejVXU200QmtqRTQ2QjZwZG9UeFhJVEFzcjh3dkY3NEVMSTgwZmxMZDZx?=
 =?utf-8?B?RG1XaGJQRUlKeFptcEdjZ2t3Z1FUeDBiRmtodU9MeHdLUWtHdUFtZTZXUUF1?=
 =?utf-8?B?aVp2SUd0RmdnMm1XRGFOQVdaTFpVYjZtZ3lScDhxM09sSjBWc20vbXlnOVl4?=
 =?utf-8?B?aGRmV0UzOEkrektSRzYvallkbVNpdUpwSEJTdEdKODRlZjhaMGdXZGVTM1BB?=
 =?utf-8?B?cG1QMndZZHJsZzhvT1BVcU9nYzhRaCsvZ2wzeElIOGN0ZUlodGdsUnUza1hw?=
 =?utf-8?B?YkFrT0RnOVZHUHNYbGtZMXA3U0J2LzNnalNCdDZKU2NxRXVQeHhNM3hWejVm?=
 =?utf-8?B?MGFYWTdjRzc2Qkwwd0MwY1NNaGZlT1B2bUZLb2lYSXJOTEpkdHBFVGxqbUhE?=
 =?utf-8?B?OWR6dEtCVkFtb01tNE9jazJQSXE1c0VLTzh0WjluK0UzSUNLcDRrRllUMW1I?=
 =?utf-8?B?b1U4MHN4R2VNaTBqd3kxTlpMbUlwUWhUSitLTkZEdHpSYUhDZGRIaFRZbTB0?=
 =?utf-8?B?b0lzOHVncVJlUVo5Qzd4L3A5NU5DK2FSSDJnUjBSVWhxOUdVR2Q5RHJ3Sytk?=
 =?utf-8?B?dmsrZ1hVaTBKemJ4ZHVLaWFXblpFRDcvTzY0VVFPZTRWQTIvVG0rcmpWV21y?=
 =?utf-8?B?eWIxNFl6SU1weTdCMC9VYUxKVEFXbWNraXFQWVQ1R21Bc0Qvdk0xcTh5cGhY?=
 =?utf-8?B?ZytsWlJtVnRhZ3NmWHQ0UjdteWNGZU5JTXFRd09qZGFaUTIrSnBKRHB1YXBD?=
 =?utf-8?B?TDZEZjFTZS9tSE8yV0lsbkhKRW5RdzcyRDUrbmhhTnJBR1ZsYS92VnFMZEdZ?=
 =?utf-8?B?Ly83czk3b2E5dkxHTXVXbjc3clE3cEI4TUg1dFY4NTZ4V1ZxZ0s3ZU1nZFQ0?=
 =?utf-8?B?eEVveld3b1BxME9BZHdXdllTSjJBejBYSkZaUVgwZ1hHRW9hQ0U3bnA4WStH?=
 =?utf-8?B?R04zN2puMW9BT3RDdUNmT2Y4RWI4K0NJQzlLdTRpRGFPYU9YdjI3cmRQYjFh?=
 =?utf-8?B?NVhLV1dLT3Zjblhrbm10RkpSVjVEWVZCK3d6N01ObzdHbWdsQkFsdVcxWEw2?=
 =?utf-8?B?ZTNRU0JITXlmWmFRUmF0Q0VOdUlydmpjejU2MUVwRzArdTdOaHNONGFUb0tX?=
 =?utf-8?B?VjdzdmZiWk4ybm5kcjJNSXNUTFlxRzZUdFIvcUo0cDEyMjdkTVlIZFpJMjVX?=
 =?utf-8?B?dTdhdjRLMnpJK2VhS0hmeDlRcFl4cTRGUWQ5eDluYm81VURzZ1R3bEZOeldK?=
 =?utf-8?B?ODJMbmFCU0V2b0V4UVBEUTZmSkFLejhaR2NTVy9jNHp4YnUwUUZ1QXZOMnVX?=
 =?utf-8?B?WHJqeHE5SVNZRXRqQzdVZ3p0bmNSdkNDN1d0R0toNkltK3ZvUk9UdlB2ZnRQ?=
 =?utf-8?B?cXRNeXJCU1NrRCt1U2Ftci9BRmI0cnArYzdsVVZQRE15UlJESnI0ei9XNjFP?=
 =?utf-8?B?cDVncXluWDRoSTRRN0NxUXJVVGYwOWRjc3llZlNGNUtPQk54R2ZkZz09?=
X-Exchange-RoutingPolicyChecked: MPia/Ilk1Qs86lecSq2Hk2C7KjVxGDKk/mLCLtWUPiFqPTsH/w6aWI23g50H/NaNL3vJKc71tLz19pjgEgcPuqKMtVl5vQcLz3xHgmRiBVqVVJ4tGeudVHPycbwkt02NTdDnv5soJNscWbMs81cVLAub9iNvVrdbzQZzcz4ZuTKf6bHq2a1B/cZntQ29Q8rAExyRb5NJY28ZTJ116XDGbymqnEJdyaAObLCmLMdTHUhGbHdxA8Regl/iToYKLBNRHluxSCcXgeN7VpR0wwFEwxNz+ECTLOGPcG22W+QgrqVi8bK1hU1fuTcVdVINg7rvD1RNR8MOgOtL+o1a7QjqGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68df695b-6992-40d8-33d2-08decaace97b
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 07:08:33.6303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAo8+om6tX+EOdfcsVeu5NdQsGmEe3+VP1he3Sh0CkDXHlnfKHOEUpk44ZrdXeDUlOytd5jvcsRf5SDwmNxRaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7409
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

Nice,

W dniu 15.06.2026 o 07:13, nakshtra.goyal@intel.com pisze:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>
> This patch series replaces all occurrences of GEN_VER/gen_ver
> with GFX_VER/gfx_ver across the IGA64 shader infrastructure
> and igt code base to align with IGT naming convention.
>
> v2: Changing subject as per requirement and correcting
>      commit message (Kamil)
>
> v3: re-compiling to change to verify with changes in
>      shader sums (Andrzej)
>
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
