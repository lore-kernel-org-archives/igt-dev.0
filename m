Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76BEC19F32
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 16:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7072110EB36;
	Thu, 27 Feb 2025 16:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOd1VipJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7B410EB36
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740674244; x=1772210244;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rwBoFoNtAIUt9XDwcqZ3zWzLURQQXmVRA9NxkCmaW/Q=;
 b=lOd1VipJ4oUi8uMFfO8x40TqWndTxCSxfcj5ekdA9CybBS+6l56CGpBU
 NRnd85Bn3tpU317dpvBlbZMElLSVbwP0ImX1EYj4xFsgJG64RnbJAsO0X
 VkLHU8X554AhWFQguqgQAagCqQHPDIB0lOdVo8UtQCoCUjlxbyqwOVgJI
 ropq9dwo+q/KyDa0cjz/703WexXC/VSQ9vE3fUdG2wYCmC0oB6LuLHFJh
 7S/63NLFUpphsST/XCySJcPWFXx7PPTTJvxKzgHQxWi9waMbnUg+2sRrw
 QUwHDemOEvjF9SfGEgj9AMMxZR7bt0R6uqifjtweK2UnBuBbuGdKZH4HA w==;
X-CSE-ConnectionGUID: 2rCRXmYpQNybbCpBdsCSnw==
X-CSE-MsgGUID: ThqOkZIrTfez3isQJV2Vhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52970562"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="52970562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:37:23 -0800
X-CSE-ConnectionGUID: BZFa4NPlQE2vLtdslUdiyA==
X-CSE-MsgGUID: he9sh9o2QEuE0Y86NS367g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117996533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:37:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 08:37:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 08:37:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 08:37:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN5oIgU+nabpQiW5l16lNUUVBaI1qvXSSV/R9Zzw1+/LnRhh3rje1bCzqMGGfH4Ym/BDp61NgcBRloeh3HQgIjg4yXFLXTLiPvPG2OmvuJSyNDJ5+mvcE4B0OaCoR1J6jluUmIc17jScv2AciljHGjM8/hwnCcP04P1/OAmU4plDEDJnOrSxC8vQ6Q5KPS7H2Eln+ERWyD/uqgPva1z+4lc87ve7f8IhP7YxYEaAppGXckAOSR8Ot6ILNWjnkXFyArdDEneAlVmjog9I8gZGJTW5nyZSG5whs1rHTspJRlVh3fjm6A5OMUTSe7FdY9O2ks/v/P3LSejI1QV5pN53ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwBoFoNtAIUt9XDwcqZ3zWzLURQQXmVRA9NxkCmaW/Q=;
 b=pz4LfFMV/SdO9045LcU+unYqbWG+e5sB9J5OVMKiJZf3TmZL2ZRACbv6PHqFLENEfiMEFQSvQ4voqc4+X/BeEKM80eBVlhiCiZ+18OQwlLsxvY4dBYTdulEjVNA6K7X0+8LeTgk976iVIbWnMxR7b1AAi07KcE6VFPWmHUnR7MevAedr8jultEig8ZlIRoJVMhhU8z4D9KiodUlNNM88nELbpYuUs6wqxwYpa5j9+jRKRSbpF3G+UZeXAitehzdbJDMz7j9gmmh/utONIPwngKvJb3vAlAwEQvqFIs00QLKtU03e3iTEgvb6uZrMrhVaBTlcV2LQG4EgBmMMBeyVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by MN0PR11MB6253.namprd11.prod.outlook.com (2603:10b6:208:3c6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 27 Feb
 2025 16:37:19 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%6]) with mapi id 15.20.8466.024; Thu, 27 Feb 2025
 16:37:19 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "adrinael@adrinael.net" <adrinael@adrinael.net>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Musial, Ewelina" <ewelina.musial@intel.com>
Subject: Re: [PATCH i-g-t] runner: Parse results harder
Thread-Topic: [PATCH i-g-t] runner: Parse results harder
Thread-Index: AQHbiIVcbhDaDBZkxkSNj4BITo3AD7NbWq+A
Date: Thu, 27 Feb 2025 16:37:18 +0000
Message-ID: <b15104046ffbc5fb09d439aed03c0256a8027c03.camel@intel.com>
References: <20250226193328.132817-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250226193328.132817-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|MN0PR11MB6253:EE_
x-ms-office365-filtering-correlation-id: 9629996e-ab1e-4c3e-4e5f-08dd574d0094
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NFNrdzR4YVVmK3pSbnUvdmdpamxRUG9ZRzdmbkVnMW8zOW1xTXJjYjdpVmJw?=
 =?utf-8?B?MDAzczJoYVc2bDFwV2hwenl3VzRQR1V0b1VESGRsbmZJQnUxVUJFK0FLM0xE?=
 =?utf-8?B?ZnZYTmlubGNOb2g3MUtxbStLanNaZFlNcGxtd0VvQ0RWNyszK3VPa1VHTC9h?=
 =?utf-8?B?aXNHeXRrL1BEYnVWa2hmb0ZhZytBL01MaEV3Z20rdENRMzRPVm51NW9lUnk1?=
 =?utf-8?B?UzhoR1lsUmMxRHFmZVRrSnI4dHJNZzBMeDVrN1ByYUp1TkRLQnJLQXV0aFFX?=
 =?utf-8?B?ZVBhMHVQTERBRzBhVXdPdllvbUtTK0IzNUF1S3dOd1FjT2oyLzhxWmlkb2JM?=
 =?utf-8?B?ZzhRZEM5dnZrZStrRjBRblY5WXNFUEthZTJQTkFreVc2T202L3ppUWtZOUFu?=
 =?utf-8?B?UHF1ZnIzc0xEaVhzUEYyaGFFNGxHRFQ5ZmltS1RCcDJOdDQrMTA4MkhEbUVo?=
 =?utf-8?B?OExYVUxxZXlaM2NPU1Y3Sm94YVNkUkk2S2lPaFg5WEtSUnRBUEYwbGx3Umd4?=
 =?utf-8?B?TUxDdjI2aFRqbld1aU9xd3ZDNWZwQnErakJWdVVLVDJURElFVEpTMTg5SmpU?=
 =?utf-8?B?LzZKcVk1WTNBcEdUbTFzaFNTdXRpd2RsMzJNdEpVNDA0ZGRzQTFzK20rMnBt?=
 =?utf-8?B?czZhc0hzSngvSi9LR095OG9aK0xlRmlROVFWbEFGczliWG5pRkI1S0YrR1pz?=
 =?utf-8?B?b3B4YTFwbXV6a1RjR1R6d0x5bllMelFRUUJCSlBMYlhIdm4vaVYxMENpRG9E?=
 =?utf-8?B?U1JseGM5eFBoRGhGK253Rkp2dEZTTVlpR0IzanJUQXB4cDVLYTVPeUZqdEt1?=
 =?utf-8?B?dWpEWFBnT3Btdnd5V015bC9KMytGS2JvbVluMzRhZUhMdWpub3hDOWZVZXZ3?=
 =?utf-8?B?UjVoVktVTEkwQTFVTVFsUHQ0bjczMFYvZERadE1hWjhEeUFPS2M4dmh2NWs0?=
 =?utf-8?B?b2tSZFBpQktkV0FISEhvbys5T0JFUEM0M0JsV1ZGcTJUNEgrVlBBdVg5NE4x?=
 =?utf-8?B?bVNuVGJrNDU3M3dZdXdHcGNzU0YzVU5TU3lYSkxsNEw1MENiaUk4cVVxVWs0?=
 =?utf-8?B?YTVSZzc4WjZjRjRKK3BHYkQrcWkyKzcwQW51bC9IbDkzaXlCOTJXNmNoVEFQ?=
 =?utf-8?B?QWNSN25vTkY0ZE1OQWtRWFpVQWtBS3VkeWliTkR2TndWVlc4MWZYVG92WWdt?=
 =?utf-8?B?dmdqQVU5MTBPZTNnN2lMbUNBbGxxeGlhYXZMT0Z5UCtiNDdQNWpVaW5UT3Vz?=
 =?utf-8?B?bnU4cGQyU3NWOGlsNExYU1hOQlJGNnlXalhWS3F2dHlZdTVZdDg4a1J0Ky9l?=
 =?utf-8?B?RVVRWWFaNThJYmpKeS9nY2EycjducXM2WEZpdUFZUm1teW5VRWpaSExiRUVP?=
 =?utf-8?B?ZFpmZFpzcGExbUR1ZVo4SkdNU09Nc2hrT0szRzBoZTBqL2Q4V0xMYUVVYlha?=
 =?utf-8?B?UDVXSEd3WVhMTzJyNE0xR1pLV08xRndxc2pOYXZMbFRIZCttNUxvVmxwdm1Q?=
 =?utf-8?B?ZHRaUCswd0VhdGlKTDh1QlFyaDBmZWxvbGhkQTBOZlRNdnladndjQy82Y0dF?=
 =?utf-8?B?SnEwZS90WTJDbjFPYmxHbXZmN0JIWURxN085WUdZd2hyNlVEc1J4RW9UeUhH?=
 =?utf-8?B?VUxzbU5nK1J0dlRRaWgvNStlVzBaZzdnb2ZSN0dKazBCelFFdERKSjhxLzBX?=
 =?utf-8?B?NmpQcGZhZVhVZHFYMU5OMUY0UHhIdTY2L1k1a3c5dllaaVhmTDVVSE5TOEQx?=
 =?utf-8?B?L1RVcFNGRjhYUUN1NzZvbmJRYzZISU1qTGpqY1JYaTdIN3FPR29MaEd5WlMr?=
 =?utf-8?B?Y2VYcC8rODA4ckFaaTM4VXBvWGMzL1l6ZlZ0Nk1FUVNwd3Y0Y1YyUEhzaXpp?=
 =?utf-8?B?Z1VtK09HdWZHeHZhamVFTW4rc0czOGNaQlJFd3F6SXJ2SVUxSXplNlVieis1?=
 =?utf-8?Q?UOvGD5AwZCo380K8uFSjk3FIq5Qi6Dzb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzBxYXczNXE4cjg5cVAzWGxSSnROaktSZmZlZU1jQXdSODRwVkdEMXZtSzcv?=
 =?utf-8?B?L204eGhKTElTT2NDZCtEdzdGRTZOVmxzcVNMNERHMnpYNWtVU1lPTFZha0I3?=
 =?utf-8?B?bklNNTUzK01lUHZPTXZ6dkcxUm5zUnFXTk5jdkhlSTd4RkhJWTRGZXgrSVJo?=
 =?utf-8?B?d0JEekJSeHZZanlwK0RBSlkwQ1E5TmhSckpwOXBrTkt4SWZKU2RDR3NWcFJo?=
 =?utf-8?B?RG03Zkd1NVlOYWIwemJlUHRwSFF4b1UwNU1OcXRQVEcyTzVVMFpDa01rdTlF?=
 =?utf-8?B?aVFqRHVQViszd3RzUUlnS0lIUmJOcFJLUUl5aVcwMmpGSXdubEpzbFV4NDFj?=
 =?utf-8?B?ZzlDVTM0V3NhUWJyaTJ6Sk1hbTBkZlN4V0xXK3BhT0FVK3JSeWJmbFJqN3h4?=
 =?utf-8?B?Wm9MTFBSb2Nib0pPZU9RUzFTSnhWN3RZYklCa2Njem40QXI3T0R4dVRRTmN3?=
 =?utf-8?B?SGZ6RGlCMXpzcHAwUTBqVkVzcU5Ob3BDWHlqWWJrTHRVSkxBbXdiTlJyY3oz?=
 =?utf-8?B?QUVGNEtmeXNIdU0wK0xWdnBiSTJhNURiUTVYblNXeEJLOHJwTlE4SnZQL2Jo?=
 =?utf-8?B?QmlvMHBkNVZCb0hCRGxOSmZPTVlFVlV1SjhzL0Z2eWlrN1RJYWFHdkhsZStk?=
 =?utf-8?B?aFJ6alMxQzZreGpnblJUVnUvVDJYUlpxV3hMYm0xKzdnRjkxdUozam9nVVhX?=
 =?utf-8?B?M2dHN3dYVEU1d0FrK0VKZ09EcklpM0ZIWDI5d2pjcVBtMXpRS2JUR2UxTTRF?=
 =?utf-8?B?dG55NFl5bC9MZlVRNDBtRStMczFueHJqUDI0SlV6L0kyeUFoWVFjRWoybU5r?=
 =?utf-8?B?em5FK0VZMmhRUkRlTlNFUlhoanpIOTRYY0Y4Wk9vWHN3dlI1UVY4cDc2RlVV?=
 =?utf-8?B?NlBPSGkyRnQ3Ukt3bmcyQXRTc2gybHYwV3Ewb2dkclZmZzV0cW5LNFVlN3hJ?=
 =?utf-8?B?THloaXVtWDZIOTVRbVBSWDgrREtmNnFJSmo0NDd4SjhDY3RoN3pXbExBaEg4?=
 =?utf-8?B?YlphTjlmb21RQTN0bUV1OW5JemVTbmJiQkNBNUF3ZGpEM0pCeXJ2Y0VkQlgv?=
 =?utf-8?B?VXM4aE8yUmpEb0hrZVRaM0JUUkxCaCsvM212Q2JhM1RpTkgzenMyeDN0ZTZJ?=
 =?utf-8?B?ZTQ0RnZCRVYrejJld0t3bER6RnArRU16aXBvNHZTeU10L3E3S3lDSEcvaE1N?=
 =?utf-8?B?aUs3dVg2ZzhDYlloRTIzSkQ4eVI5ckQrdUtBRjZmT0FLRkxkSGw0Y0VIVUlF?=
 =?utf-8?B?c3RFbDFrSTRkN01QVFF6aU12Z0M0RGxiUk1mK01aUkdZbnVYSVc0UXg5SlpJ?=
 =?utf-8?B?L0N5eGZlSlM2V0lkcC9xdno3eCs0aHFtWS9EWFVvODE2YUtmaWt0Q2UycnRz?=
 =?utf-8?B?OTFqaWphN1FZU3N0ajdkSXdaYktFejRPNkJUMVE4U3JrNGVIREprYTkrRjNi?=
 =?utf-8?B?ZG0rbHpwSzNZTC9ENFN6TEpVdHFkaTliNDBjeFVFMXBEUHFSbEdMTHVnckhR?=
 =?utf-8?B?REhKcHNWb3Ntd3YwakFSNk56ZTlkeTIwUVk2ZU5mMmJYelBaWXVxU1BlWUVQ?=
 =?utf-8?B?SEMrMlhycFZOeUswQUhpZE81NG9EZDF5MWM1VW00R0JQSCsvRmFoaVlCczFu?=
 =?utf-8?B?dmJsR29UNllRWGFady9iTlNpdk5xdGNjaGwvYi85ZDFLbUppWDJKQU13QmRz?=
 =?utf-8?B?NUlvYlhISlBKc0dGWUEzZXFjbHoxaTZzTFNyRWZvVDViSTc5NEN4LzRtT2xj?=
 =?utf-8?B?MGJQTFNnd3lJbUczci9jbE1UbmNvVXY0L3ZFcWt0aiswejlYb0c0dHVoQzIz?=
 =?utf-8?B?ZXJiWWFINXVBbmJzOXIzODFnbWZ0dk4yS3FmbzJDOWVaYmhpY0NVYVVFaU1E?=
 =?utf-8?B?NHJpZ2ZKUGQvc3ZGcG9mVlI4bkZ1RmtWZXZxM2dBL3lnTUxUeHJDZEl3USsx?=
 =?utf-8?B?eHFVc3U1SlRiWUdWWDkxOEtGaW9obm43YWtYLzliYkJHRWg3azZoRUg0UG5V?=
 =?utf-8?B?Mmc4cmhML2VjWVYxRGFPQm8yUGY0eXYxeG53aHJxdWJCL1NmWDBReDlkYU8r?=
 =?utf-8?B?NXRlNGQwdHgwbWFGT1orVVV6SlVQaXk4VThPbW1yOTNmMTlVVlNKRE9FVnBE?=
 =?utf-8?B?QXJBRVJ0ci9DeXQyMGV4ZWZjQ0hpN3NVYStNOGM1bVh6WFRDWmwrbk8xcFY5?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB3A067BD1557741B0703CB5A63C8439@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9629996e-ab1e-4c3e-4e5f-08dd574d0094
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 16:37:18.9817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T10J3RTLDg9fLUeVKmAHraafQWan6xjkObC10ocpGHU3GzRtYTbFlRwZ76Q/npq4/k2qzSSq/o+KWoBoLwTwtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6253
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

T24gV2VkLCAyMDI1LTAyLTI2IGF0IDIwOjMzICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+ICAgU29tZXRpbWVzIGFuIGVycm9yIGhhcHBlbnMgaW4ga2VybmVsIG9yIGluIHRlc3QgdGhh
dCBsZWF2ZXMNCj4gb3V0cHV0IGZpbGVzIGluIGNvcnJ1cHRlZCBvciBpbmNvcnJlY3Qgc3RhdGUu
IFdoaWxlIHJ1bm5lciBvcg0KPiByZXN1bWUgd2lsbCBqdXN0IG1vdmUgb24gdG8gZXhlY3V0aW5n
IG5leHQgdGVzdCwgd2hlbiBnZW5lcmF0aW5nDQo+IHJlc3VsdHMgaXQgY291bGQgZW5kIHVwIHdp
dGggbm8gcmVzdWx0cy5qc29uDQo+IA0KPiAgIFRyeSBwcm9jZXNzaW5nIG91dHB1dHMgYSBsaXR0
bGUgbW9yZSBwZXJzaXN0ZW50bHkgYW5kIHVzZSBhbnkNCj4gb3V0cHV0IGZpbGUgbGVmdCB0aGVy
ZSwgZXZlbiBpZiBvbmx5IGRtZXNnLnR4dC4gQWxzbywgd2hlbiBubw0KPiB1c2VmdWwgb3V0cHV0
IGZpbGVzIHdlcmUgcHJlc2VudCwgaW5zdGVhZCBvZiBicmVha2luZyBvdXQgYWRkDQo+IG5vdHJ1
bi4NCj4gDQo+ICAgSW5mb3JtIGFib3V0IHByb2Nlc3NpbmcgcmVzdWx0cyBmb3IgZWFjaCB0ZXN0
IHNvIGEgcHJvYmxlbQ0KPiBjb3VsZCBiZSBzcG90dGVkIG1vcmUgZWFzaWx5Lg0KPiANCj4gQ2M6
IEV3ZWxpbmEgTXVzaWFsIDxld2VsaW5hLm11c2lhbEBpbnRlbC5jb20+DQo+IENjOiBMdWNhcyBE
ZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gQ2M6IFJ5c3phcmQgS25vcCA8
cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCj4gQ2M6IFBldHJpIExhdHZhbGEgPGFkcmluYWVsQGFk
cmluYWVsLm5ldD4NCj4gU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIHJ1bm5lci9leGVjdXRvci5jICB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKw0KPiAgcnVubmVyL2V4ZWN1dG9yLmggIHwgIDEgKw0KPiAg
cnVubmVyL3Jlc3VsdGdlbi5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDE1IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRvci5jIGIvcnVubmVy
L2V4ZWN1dG9yLmMNCj4gaW5kZXggMmFiYjE4NzMyLi45NmI4YjUwNTcgMTAwNjQ0DQo+IC0tLSBh
L3J1bm5lci9leGVjdXRvci5jDQo+ICsrKyBiL3J1bm5lci9leGVjdXRvci5jDQo+IEBAIC01NzYs
NiArNTc2LDI3IEBAIGJvb2wgb3Blbl9vdXRwdXRfZmlsZXMoaW50IGRpcmZkLCBpbnQgKmZkcywg
Ym9vbCB3cml0ZSkNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4gIA0KPiArLyoqDQo+ICsgKiBv
cGVuX291dHB1dF9maWxlc19yZG9ubHk6DQo+ICsgKiBAZGlyZmQ6IGZkIG9mIG91dHB1dCBkaXJl
Y3Rvcnkgd2l0aCBlcnIudHh0LCBkbWVzZy50eHQgYW5kIG90aGVyIGZpbGVzDQo+ICsgKiBAZmRz
OiBhcnJheSBmb3IgZmQncyBvZiBvcGVuZWQgb3V0cHV0IGZpbGVzDQo+ICsgKg0KPiArICogVHJp
ZXMgdG8gb3BlbiBvdXRwdXQgZmlsZXMgaW4gcmVhZC1vbmx5IG1vZGUgYW5kIHNhdmVzIGZpbGUg
ZGVzY3JpcHRvcnMNCj4gKyAqIGluIGZkcyBhcnJyYXkuDQo+ICsgKg0KPiArICogUmV0dXJuczog
dHJ1ZSBpZiBhbGwgZmlsZXMgb3BlbmVkLCBmYWxzZSBvdGhlcndpc2UNCj4gKyAqLw0KPiArYm9v
bCBvcGVuX291dHB1dF9maWxlc19yZG9ubHkoaW50IGRpcmZkLCBpbnQgKmZkcykNCj4gK3sNCj4g
Kwlib29sIHJldCA9IHRydWU7DQo+ICsNCj4gKwlmb3IgKGludCBpID0gMDsgaSA8IF9GX0xBU1Q7
IGkrKykNCj4gKwkJaWYgKChmZHNbaV0gPSBvcGVuYXQoZGlyZmQsIGZpbGVuYW1lc1tpXSwgT19S
RE9OTFkpKSA8IDApDQo+ICsJCQlyZXQgPSBmYWxzZTsgLyogUmVtZW1iZXIgZmFpbHVyZSAqLw0K
DQpJZiBzdWNjZXNmdWwsIG9wZW4vb3BlbmF0IHdpbGwgcmV0dXJuIC0xIGFuZCBzZXQgZXJybm8g
dG8gdGhlIHJlYWwNCmVycm9yLiBZb3UgY2FuIHNldCBgZmRzW2ldID0gLWVycm5vYCB0byBsZXQg
dGhlIGZ1bmN0aW9uIHVzZXJzIGtub3cNCndoYXQgaGFwcGVuZWQgd2l0aCBhIGdpdmVuIGRlc2Ny
aXB0b3IuDQoNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gIHZvaWQgY2xvc2Vf
b3V0cHV0cyhpbnQgKmZkcykNCj4gIHsNCj4gIAlpbnQgaTsNCj4gZGlmZiAtLWdpdCBhL3J1bm5l
ci9leGVjdXRvci5oIGIvcnVubmVyL2V4ZWN1dG9yLmgNCj4gaW5kZXggYWI2YTBjMTc2Li41NmM3
MzIzYTggMTAwNjQ0DQo+IC0tLSBhL3J1bm5lci9leGVjdXRvci5oDQo+ICsrKyBiL3J1bm5lci9l
eGVjdXRvci5oDQo+IEBAIC0yNiw2ICsyNiw3IEBAIGVudW0gew0KPiAgfTsNCj4gIA0KPiAgYm9v
bCBvcGVuX291dHB1dF9maWxlcyhpbnQgZGlyZmQsIGludCAqZmRzLCBib29sIHdyaXRlKTsNCj4g
K2Jvb2wgb3Blbl9vdXRwdXRfZmlsZXNfcmRvbmx5KGludCBkaXJmZCwgaW50ICpmZHMpOw0KPiAg
dm9pZCBjbG9zZV9vdXRwdXRzKGludCAqZmRzKTsNCj4gIA0KPiAgLyoNCj4gZGlmZiAtLWdpdCBh
L3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9yZXN1bHRnZW4uYw0KPiBpbmRleCAwZDNhNTY5
Y2YuLmI1MGM0MTdlMyAxMDA2NDQNCj4gLS0tIGEvcnVubmVyL3Jlc3VsdGdlbi5jDQo+ICsrKyBi
L3J1bm5lci9yZXN1bHRnZW4uYw0KPiBAQCAtMjE3NiwxMiArMjE3NiwyNiBAQCBzdGF0aWMgYm9v
bCBwYXJzZV90ZXN0X2RpcmVjdG9yeShpbnQgZGlyZmQsDQo+ICB7DQo+ICAJaW50IGZkc1tfRl9M
QVNUXTsNCj4gIAlzdHJ1Y3Qgc3VidGVzdF9saXN0IHN1YnRlc3RzID0ge307DQo+IC0JYm9vbCBz
dGF0dXMgPSB0cnVlOw0KPiAgCWludCBjb21tc3BhcnNlZDsNCj4gIA0KPiAtCWlmICghb3Blbl9v
dXRwdXRfZmlsZXMoZGlyZmQsIGZkcywgZmFsc2UpKSB7DQo+IC0JCWZwcmludGYoc3RkZXJyLCAi
RXJyb3Igb3BlbmluZyBvdXRwdXQgZmlsZXNcbiIpOw0KPiAtCQlyZXR1cm4gZmFsc2U7DQo+ICsJ
aWYgKCFvcGVuX291dHB1dF9maWxlc19yZG9ubHkoZGlyZmQsIGZkcykpIHsNCj4gKwkJc3RydWN0
IHN0YXQgc3RhdGJ1ZjsNCj4gKwkJc2l6ZV90IHN6ID0gMDsNCg0KVGhpcyBmdW5jdGlvbiBkb2Vz
IG5vdCBjYXJlIGFib3V0IHRoZSBzaXplLCBqdXN0IGlmIGFueSBub24tZW1wdHkgZmlsZQ0Kd2Fz
IGZvdW5kLiBVc2UgYSBib29sIGxpa2UgaW4gb3Blbl9vdXRwdXRfZmlsZXNfcmRvbmx5Lg0KDQo+
ICsNCj4gKwkJZm9yIChpbnQgaSA9IDA7IGkgPCBfRl9MQVNUOyArK2kpIHsNCj4gKwkJCWlmIChm
ZHNbaV0gPiAwICYmICFmc3RhdChmZHNbaV0sICZzdGF0YnVmKSAmJiBzdGF0YnVmLnN0X3NpemUg
IT0gMCkNCj4gKwkJCQlzeiA9IHN0YXRidWYuc3Rfc2l6ZTsNCg0KVG8gbWFrZSBkZWJ1Z2dpbmcg
ZWFzaWVyLCBpZiB0aGVyZSdzIGEgcHJvYmxlbSB3aXRoIGEgZ2l2ZW4gZmlsZSwgcHJpbnQNCml0
cyBuYW1lIGFuZCB0aGUgZGlzY292ZXJlZCBpc3N1ZSBpbiB0aGlzIGxvb3AsIHNvbWV0aGluZyBs
aWtlOg0KDQpgYGBjDQppZiAoZmRzW2ldIDwgMCkgew0KICBmcHJpbnRmKHN0ZGVyciwgIkVycjog
JXM6IG9wZW4gZmFpbGVkOiAlc1xuIiwNCiAgICAgICAgICBmaWxlbmFtZXNbaV0sIHN0cmVycm9y
KC1mZHNbaV0pKTsNCiAgY29udGludWU7DQp9DQoNCmlmICghZnN0YXQoZmRzW2ldLCAmc3RhdGJ1
ZikpIHsNCiAgZnByaW50ZihzdGRlcnIsICJFcnI6ICVzOiBzdGF0IGZhaWxlZDogJXNcbiIsDQog
ICAgICAgICAgZmlsZW5hbWVzW2ldLCBzdHJlcnJvcihlcnJubykpOw0KICBjb250aW51ZTsNCn0N
Cg0KaWYgKHN0YXRidWYuc3Rfc2l6ZSA9PSAwKSB7DQogIGZwcmludGYoc3RkZXJyLCAiRXJyOiAl
czogZmlsZSBlbXB0eVxuIiwgZmlsZW5hbWVzW2ldKTsNCiAgY29udGludWU7DQp9DQoNCnZhbGlk
X2ZpbGVfZm91bmQgPSB0cnVlOw0KYGBgDQoNClRoaXMgd2F5IHdob2V2ZXIgZGVidWdzIHJlc3Vs
dCBnZW5lcmF0aW9uIGlzc3VlcyBjYW4gZWFzaWx5IGZpZ3VyZSBvdXQNCmlmIHRoZXkgaGF2ZSBh
IGJyb2tlbiByZXN1bHRzIHRyZWUsIHdyb25nIHBlcm1pc3Npb25zIG9yIHdoYXRldmVyIGVsc2Uu
DQoNCj4gKwkJfQ0KPiArDQo+ICsJCWlmIChzeiA9PSAwKSB7DQo+ICsJCQkvKiBubyBvdXRwdXQg
c2F2ZWQgaW4gYW55IGZpbGUgKi8NCj4gKwkJCWZwcmludGYoc3RkZXJyLCAicmVzdWx0czogRXJy
b3Igb3BlbmluZyBvdXRwdXQgZmlsZXNcbiIpOw0KPiArCQkJY2xvc2Vfb3V0cHV0cyhmZHMpOw0K
PiArDQo+ICsJCQlyZXR1cm4gZmFsc2U7DQo+ICsJCX0NCj4gKw0KPiArCQlmcHJpbnRmKHN0ZGVy
ciwgInJlc3VsdHM6IE1pc3NpbmcgZmV3IG91dHB1dCBmaWxlKHMpXG4iKTsNCj4gIAl9DQo+ICAN
Cj4gIAkvKg0KPiBAQCAtMjE5MSw4ICsyMjA1LDYgQEAgc3RhdGljIGJvb2wgcGFyc2VfdGVzdF9k
aXJlY3RvcnkoaW50IGRpcmZkLA0KPiAgCWNvbW1zcGFyc2VkID0gZmlsbF9mcm9tX2NvbW1zKGZk
c1tfRl9TT0NLRVRdLCBlbnRyeSwgJnN1YnRlc3RzLCByZXN1bHRzKTsNCj4gIAlpZiAoY29tbXNw
YXJzZWQgPT0gQ09NTVNQQVJTRV9FUlJPUikgew0KPiAgCQlmcHJpbnRmKHN0ZGVyciwgIkVycm9y
IHBhcnNpbmcgb3V0cHV0IGZpbGVzIChjb21tcylcbiIpOw0KPiAtCQlzdGF0dXMgPSBmYWxzZTsN
Cj4gLQkJZ290byBwYXJzZV9vdXRwdXRfZW5kOw0KPiAgCX0NCj4gIA0KPiAgCWlmIChjb21tc3Bh
cnNlZCA9PSBDT01NU1BBUlNFX0VNUFRZKSB7DQo+IEBAIC0yMjAwLDIwICsyMjEyLDE3IEBAIHN0
YXRpYyBib29sIHBhcnNlX3Rlc3RfZGlyZWN0b3J5KGludCBkaXJmZCwNCj4gIAkJICogZmlsbF9m
cm9tX2pvdXJuYWwgZmlsbHMgdGhlIHN1YnRlc3RzIHN0cnVjdCBhbmQNCj4gIAkJICogYWRkcyB0
aW1lb3V0IHJlc3VsdHMgd2hlcmUgYXBwbGljYWJsZS4NCj4gIAkJICovDQo+IC0JCWZpbGxfZnJv
bV9qb3VybmFsKGZkc1tfRl9KT1VSTkFMXSwgZW50cnksICZzdWJ0ZXN0cywgcmVzdWx0cyk7DQo+
ICsJCWlmIChmZHNbX0ZfSk9VUk5BTF0gPiAwKQ0KPiArCQkJZmlsbF9mcm9tX2pvdXJuYWwoZmRz
W19GX0pPVVJOQUxdLCBlbnRyeSwgJnN1YnRlc3RzLCByZXN1bHRzKTsNCj4gIA0KPiAgCQlpZiAo
IWZpbGxfZnJvbV9vdXRwdXQoZmRzW19GX09VVF0sIGVudHJ5LT5iaW5hcnksICJvdXQiLCAmc3Vi
dGVzdHMsIHJlc3VsdHMtPnRlc3RzKSB8fA0KPiAgCQkgICAgIWZpbGxfZnJvbV9vdXRwdXQoZmRz
W19GX0VSUl0sIGVudHJ5LT5iaW5hcnksICJlcnIiLCAmc3VidGVzdHMsIHJlc3VsdHMtPnRlc3Rz
KSkgew0KPiAgCQkJZnByaW50ZihzdGRlcnIsICJFcnJvciBwYXJzaW5nIG91dHB1dCBmaWxlcyAo
b3V0LnR4dCwgZXJyLnR4dClcbiIpOw0KPiAtCQkJc3RhdHVzID0gZmFsc2U7DQo+IC0JCQlnb3Rv
IHBhcnNlX291dHB1dF9lbmQ7DQo+ICAJCX0NCj4gIAl9DQo+ICANCj4gIAlpZiAoIWZpbGxfZnJv
bV9kbWVzZyhmZHNbX0ZfRE1FU0ddLCBzZXR0aW5ncywgZW50cnktPmJpbmFyeSwgJnN1YnRlc3Rz
LCByZXN1bHRzLT50ZXN0cykpIHsNCj4gIAkJZnByaW50ZihzdGRlcnIsICJFcnJvciBwYXJzaW5n
IG91dHB1dCBmaWxlcyAoZG1lc2cudHh0KVxuIik7DQo+IC0JCXN0YXR1cyA9IGZhbHNlOw0KPiAt
CQlnb3RvIHBhcnNlX291dHB1dF9lbmQ7DQo+ICAJfQ0KPiAgDQo+ICAJb3ZlcnJpZGVfcmVzdWx0
cyhlbnRyeS0+YmluYXJ5LCAmc3VidGVzdHMsIHJlc3VsdHMtPnRlc3RzKTsNCj4gQEAgLTIyMjEs
MTEgKzIyMzAsMTAgQEAgc3RhdGljIGJvb2wgcGFyc2VfdGVzdF9kaXJlY3RvcnkoaW50IGRpcmZk
LA0KPiAgDQo+ICAJYWRkX3RvX3RvdGFscyhlbnRyeS0+YmluYXJ5LCAmc3VidGVzdHMsIHJlc3Vs
dHMpOw0KPiAgDQo+IC0gcGFyc2Vfb3V0cHV0X2VuZDoNCj4gIAljbG9zZV9vdXRwdXRzKGZkcyk7
DQo+ICAJZnJlZV9zdWJ0ZXN0cygmc3VidGVzdHMpOw0KPiAgDQo+IC0JcmV0dXJuIHN0YXR1czsN
Cj4gKwlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgdHJ5X2FkZF9ub3Ry
dW5fcmVzdWx0cyhjb25zdCBzdHJ1Y3Qgam9iX2xpc3RfZW50cnkgKmVudHJ5LA0KPiBAQCAtMjM1
OSwxNCArMjM2NywyMSBAQCBzdHJ1Y3QganNvbl9vYmplY3QgKmdlbmVyYXRlX3Jlc3VsdHNfanNv
bihpbnQgZGlyZmQpDQo+ICAJCWNoYXIgbmFtZVsxNl07DQo+ICANCj4gIAkJc25wcmludGYobmFt
ZSwgMTYsICIlemQiLCBpKTsNCj4gKwkJZnByaW50ZihzdGRlcnIsICJyZXN1bHRzOiBwYXJzaW5n
IG91dHB1dDogJXMvIGZvciB0ZXN0OiAlc1xuIiwNCj4gKwkJCW5hbWUsIGpvYl9saXN0LmVudHJp
ZXNbaV0uYmluYXJ5KTsNCj4gIAkJaWYgKCh0ZXN0ZGlyZmQgPSBvcGVuYXQoZGlyZmQsIG5hbWUs
IE9fRElSRUNUT1JZIHwgT19SRE9OTFkpKSA8IDApIHsNCj4gKwkJCWlmIChzZXR0aW5ncy5sb2df
bGV2ZWwgPj0gTE9HX0xFVkVMX05PUk1BTCkNCj4gKwkJCQlmcHJpbnRmKHN0ZGVyciwgInJlc3Vs
dHM6IG5vIG91dHB1dCwgc2V0dGluZyBub3RydW5cbikiKTsNCj4gKw0KPiAgCQkJdHJ5X2FkZF9u
b3RydW5fcmVzdWx0cygmam9iX2xpc3QuZW50cmllc1tpXSwgJnNldHRpbmdzLCAmcmVzdWx0cyk7
DQo+ICAJCQljb250aW51ZTsNCj4gIAkJfQ0KPiAgDQo+ICAJCWlmICghcGFyc2VfdGVzdF9kaXJl
Y3RvcnkodGVzdGRpcmZkLCAmam9iX2xpc3QuZW50cmllc1tpXSwgJnNldHRpbmdzLCAmcmVzdWx0
cykpIHsNCj4gLQkJCWNsb3NlKHRlc3RkaXJmZCk7DQo+IC0JCQlyZXR1cm4gTlVMTDsNCj4gKwkJ
CWlmIChzZXR0aW5ncy5sb2dfbGV2ZWwgPj0gTE9HX0xFVkVMX05PUk1BTCkNCj4gKwkJCQlmcHJp
bnRmKHN0ZGVyciwgInJlc3VsdHM6IG5vIHVzZWZ1bCBvdXRwdXQsIHNldHRpbmcgbm90cnVuXG4i
KTsNCj4gKw0KPiArCQkJdHJ5X2FkZF9ub3RydW5fcmVzdWx0cygmam9iX2xpc3QuZW50cmllc1tp
XSwgJnNldHRpbmdzLCAmcmVzdWx0cyk7DQo+ICAJCX0NCj4gIAkJY2xvc2UodGVzdGRpcmZkKTsN
Cj4gIAl9DQoNCkxHVE0gZm9yIHRoZSByZXN0Lg0KDQpUaGFua3MsIFJ5c3phcmQNCg==
