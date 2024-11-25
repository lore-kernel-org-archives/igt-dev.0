Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E997D3B7F3
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 08:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA0810E3A7;
	Mon, 25 Nov 2024 08:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAvbhPcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F9910E3A5
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732524654; x=1764060654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0qhfBq5KMwHv1pEm+gR6nZJuBvmUxL7RHKVxr+nQMBQ=;
 b=CAvbhPcLdTBpKnVs0MsjFqa/pvEGNTAzNLC8neIXnaT1yCx4HXOHrKfx
 nU/RpBL113LxtcSN3LgntsjPG35dW7btEuqpfooX//R5+dP17pwRzS+Oo
 VSsVbUPILobex0f/vSeWKGx1g5zEK/L1RHwYuzP9JKXOVtukLxnLhMFok
 eHocUWB990iZgi7B7wsr40uKBq2gKM5o3yx1oEXcusXcpmcXJjkuqqF0h
 /cjxz0ae8kdrDrdKh4DY/eff2wxVyfgjzwF5mnJlTmgqwx+zU/B5X2i43
 s/m4pyXfk3lbPl/lYk4FT3RedgORSObFImmIDM31DOAE/DAQQWelqasmV w==;
X-CSE-ConnectionGUID: KsYwm7pPTQWKBkpqw23erw==
X-CSE-MsgGUID: q9QOL2N4TCq9nZd8EgYwyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32557643"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="32557643"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:50:54 -0800
X-CSE-ConnectionGUID: nmoUx5PoR9S5v9Y9DeC6Lg==
X-CSE-MsgGUID: yMB2xizTQd+MR+lrTuBYew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91990925"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 00:50:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 00:50:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 00:50:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 00:50:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIOKm7LVDHQQik7baxSfyhKjttMgddZam0pqC7YHZwmkuVUPfi0gKuJWulCFCHKAoX3iHiCOZv1tZx6NkMeExyR+NC9oOPuXKPJg2QSBH06gPrD4HIr5w5JPthzvMBIoMr0iknxGw8DytzXA5ylRoujNGn/p4l0cohtb83J3V2clhDh7VdYa+vcCn4XxFChI4tIrRZO8S8K0qID0QDNLOwdWRLxYssYH2KsPmUv3cXBIllw7D7OBUjAisj5bja1/Dv4MQlUKRUSO1D/cmRckDS+RkzL1X03gweLGQ1M/4qdNaKt+5CsYoJ8/V1KEfLoUM9ouZWpOSucz/rHfIfFUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qhfBq5KMwHv1pEm+gR6nZJuBvmUxL7RHKVxr+nQMBQ=;
 b=X1XcGhvqGPEh7yWQlIHb2U1kd98FWbDwfwG+imz/m8FkuC/L8maxwoZiq+uRZXFnpWjA9sOYuOd9OvB2rCJ8WzPJuvCazu37rjyR6v89JZQNe3fqfiQbZAhi0hILdicBGdXX0SwJxZjkpCt4RcImbPz2ERQpOTCfvwWuNkNAXD2ZOkc8wiGNs6qezv8zeXL2CZbOe+DvcTjxAkJHfmCygf8cA5J/ISFzgsCbkNyARnDYHEGTWzNEb1er+qF5snjJ+iUxifbSmanZp9mHLgCV3Bhh6l827514vst2OMBATUorELeNselS9CcbWq9hBUsEUZ+mzXtJs+NfEFeOnRuiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 08:50:51 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 08:50:51 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v4 3/4] lib/gpgpu_shader: pass surface desription to
 shaders via inline data
Thread-Topic: [PATCH v4 3/4] lib/gpgpu_shader: pass surface desription to
 shaders via inline data
Thread-Index: AQHbPwwrgIWgnsfRqECVK5L6X3JDHrLHsCeA
Date: Mon, 25 Nov 2024 08:50:51 +0000
Message-ID: <3c0633196e2d29b8e770976f28c412218955066c.camel@intel.com>
References: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
 <20241125-gpgpu_send_rework-v4-3-c16b568a1f3d@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v4-3-c16b568a1f3d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CY8PR11MB7169:EE_
x-ms-office365-filtering-correlation-id: 0d0e39f4-aca2-4118-846e-08dd0d2e43e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZnJyajV4UGdvVnY4SE5XSk1iL1NpRjJ3VTVDUXNCNTRLZ3BFaGlEdEVzQnlr?=
 =?utf-8?B?bnNKZEpxcmc1R0JTVDQ5YkdxU1RNTzVZUGlYb1NSU2ZaUEgwdHlUUkVHdkZS?=
 =?utf-8?B?TEhUUTIxeU1YWnFjb1VkKzVXbUpjNldVTWZQNkJxL2t2cDN3endqN3E2Qnhr?=
 =?utf-8?B?Wm1HQ0VmSFBaRmcrNHorN1U3TkNWM0JvYlJCOFQ5VkpoMW9Wbm80cFlkejFH?=
 =?utf-8?B?bDFIK2J6bktrZ2JVRmpkNTNqMmZRMlR5TXNwWmk3L25vYVEzb2VwKzhEWlZO?=
 =?utf-8?B?UElIYW1WcGJjRDFlaXloT3BNSC9ZVmJzUDViQURsOHI3THVERFQwVnZ0OHNt?=
 =?utf-8?B?Z2E0SlhTWE5sSzhTbnkybEFoWDlncDN1TXVCZTVacUFHQThzbEswaEZWYWRh?=
 =?utf-8?B?OHlBNU5ZczVEYmVsKzVOYkJWbFVjRm5Yb3g3NDlRZ3I5aElNY1VBd3V4NEdy?=
 =?utf-8?B?YUoreHZsaE1QV0hYM1d4bFdOdEQ1V3NpVlBac21HUEYxRXBIM2prTkZlSjJN?=
 =?utf-8?B?VXRPUWFZT3BFajl1bVpOUmpibzdMTHFwdytRb1N1S0ZBYmczaFhDOHB6UUNa?=
 =?utf-8?B?T3JPNWJkSkxpNHlPY3d2OGFaOW9BeEJmWHZibkJBYWhEYmtFTFhPaC9nNzBw?=
 =?utf-8?B?aGtib2FmM3kybURGQ1pFSUxsOHkrWTRHN2szUzBEMU8yckpOajRGZnZvUmhT?=
 =?utf-8?B?NXk5MHI2UEpZU1E3T09HZ2hha0FtVUxISFBsSUs1L1RJb1pTZjhzalBVRi9w?=
 =?utf-8?B?QlpXU2cwNTVGc2tMTGJ0N1FsV3E4cWY1c3pQYTZUSjZVTk5vUm5nV1Z1bnhE?=
 =?utf-8?B?QUpUaTQ3UnVjU3ZCZVJwTzlKNWtzZG11anM4WENsVmExOVlUYjkzTWxVeWRX?=
 =?utf-8?B?R2IycUovTG0zMUtWcGFyZmJjd0pvQmRSRFJBY0VLdkF5b3N5MnlySldoUWlJ?=
 =?utf-8?B?cUJPSG93cVMzMm5zVjlEZmkzck9oTFNyR08vSjhmNUY3Zytxd0tVUFVOL1Yz?=
 =?utf-8?B?am5HNWlqN2RnM1EyNkVlU0gzS3djNndJNFhZTVE4d0U1b3ltUmxyRmEvdisw?=
 =?utf-8?B?K24rWGxsaVBYZks2aStibEVuYVN1M0xIK0daQi9ubVd3SmZ5UzJxZmQ3MDNs?=
 =?utf-8?B?dXFMeDE1M2taNXlIZmNOOUo5ZzFPeGxBRzdTUVcvVURSR0ZNWXZmbWNGbElr?=
 =?utf-8?B?TFhuR2daaTdEUi9aR1FyUGRzWE0xMzVTNmxZVTJzMG5qdXZJcUpjZC9JOWxw?=
 =?utf-8?B?YmVOZDBWdlpOOHUzQ2lxT0VIaEVTNkxpMHJFOWpnM0RkdUV3dWlmV1N4VkZE?=
 =?utf-8?B?alBlVEFvUUJkaHZFTWxRMzgwOVlob1NJTzVlVkUvcUM1UVJWQnpzemE1U2hT?=
 =?utf-8?B?MndPTFBKaHFXcGRiK2RRSlFtWmVaZmM4d1p2TmJaSFpzZUR1OE5NcEpicURs?=
 =?utf-8?B?R2U3Sm5xbVl3aVJOSW9mUXBNMFVhbEVZY1NiNFMwUmdFWFdieEh5b0pDOWFt?=
 =?utf-8?B?YUd3NHBOK2ZLNVJkMzBhM0RyZHg2K296dzVFcW9rRktNOGw3VXFKL1lIbzV5?=
 =?utf-8?B?Rlc0SUh6MW9aaktCclRBNUs2eDhaUEo2dkREcEFVR2UwK3hQeDJQWjRLc3dV?=
 =?utf-8?B?T1RWOCtTMHJYaWxVbEY1SDNmcktOK2p1LzhKcEN5U3hkdmhBZHVyOThNTUZa?=
 =?utf-8?B?U2h4emdzM2FqQm9XcWE5dVloa0crb0xqU2I5R2h1TDJVQUdPazlFTjM0YzR0?=
 =?utf-8?B?V3U1eGhJZUhpUC8zVURNQmI1b1A2UStMVGlkRkhoTm02L3h3MkpvdXlSRm9a?=
 =?utf-8?B?azZ5akk0YnNvYTc1UHhteC91T3BEUlFqMEQxZ3hFNEVydUt1eWFFNExiU0xp?=
 =?utf-8?B?YUxrTG1xclg1RlNaVnEvcG5pRXdKNWJNL3l4YWc3akp5T2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3llSVNQakNxZmNSc21zemM5UFZzS2RGMjhDdGJnT3c4aHdFWkVTOGlpTHQ0?=
 =?utf-8?B?K1JYTkZLN2swUEs4cGRza0JZbUF6STk3UWVQSmc4cUYxQUswSzFIcnpxUkFF?=
 =?utf-8?B?Z3V2OG1zQ1lVbXA2elYyUTRWT1VyY3dXSjlOR1pWaStlRHZvL2MxUU9wYWVV?=
 =?utf-8?B?aWZzZHVLbkNTRi9yejg4UzJmY0tuUG93b0ZRbHZ3OTZzL1pjN1JVQkU2TXZm?=
 =?utf-8?B?akx1ZTNHdXhHaFlJdU9aV3RWWWEzSnlHRFVZbUI3Y1NRTHVXZWdjZE5XbFVY?=
 =?utf-8?B?Q2ZIaThnN3hkeitOTTl3bkhhSFNYSXQvaTBNRU4rU1k0aUNLU0ZyKzZNOFpM?=
 =?utf-8?B?ZC9mRGp6Mzdzbzc5QjZsZnhVL09MeUR3NDYvVTRqeGkxU1VzSzRqaHhoam45?=
 =?utf-8?B?Q21LZkpYbkNvQU01bUp3WFZlRmQ1eTZDUjd0R1Q4QmIyT21tWlpzVDJIZFZQ?=
 =?utf-8?B?L0hDR1ZBd2RKN0NucVdaSWNxb2t0b0FZUk9XcXFNa25vTmdCQ1dybHN4SW1Y?=
 =?utf-8?B?eERXRnVkcFZ6Y29QT2ZoTzNJSzBwcTJIUDNwdkFLL0s0RWNYZmFhaU15M1c2?=
 =?utf-8?B?dTRhc3NzQ0RVWm1LcXhzelEzTXhxRGxIVXhWWk5jWmZVTmhQSXMxTW9wYXE3?=
 =?utf-8?B?clR0RmdyZkRuUzd5cG9raXNyMXFkc3orUS84RlhFQWVpZFRIOVhMcXFjR0U0?=
 =?utf-8?B?TTNxSzZ1MlEvN3k4blphaEJTNUVmd2JNdTZNbkd5anY4MkdkS2Z1WXJ5Rm5j?=
 =?utf-8?B?dDMxL3RXMGxoQWUzVWJuMmpFOFhMTFdXUlZTM2wwSVVpTFVUVlJiUngzcU9r?=
 =?utf-8?B?N0EyVmJocEVTNXd2T0YvWVNjR2kxbEZRR3hFM3IvUjAyRnFLTi91MFJFMWZi?=
 =?utf-8?B?cTdiMko3N2xTbTkxbENLZ0U4MEpEV1F2bUszSklpWmFlOW5ZZDNNVjVwMjY5?=
 =?utf-8?B?V1RhOEtDYUxPeCt6MFh2ejNwUldieWVKWU9BTjE4amFSWHZWb0hvU3ZnazZk?=
 =?utf-8?B?dzlUTVJ0NHJMN0V2THEvbmxmT2c4UG8xWS9HRXBVYmJMZXovaWh1cGVrcU02?=
 =?utf-8?B?ZXA4TTF5dm44aThvTEtOZWlHcDNTYzVFa2RWWkNEdHpLb3FHWm5adUJrNlN1?=
 =?utf-8?B?VGxQTWdGTnowQ0gxN3dXaDBoaFhWSHp6Sjl6Z2pqdWtwazI2Mm5GSGNpVkFE?=
 =?utf-8?B?Zk1IMy9pamtWOUw2YVFIOGcveGtjTDBYalJGeEhKZVY4K2dBZ3pFYWt2YmxD?=
 =?utf-8?B?T0kzb1pmRUZkYnRqR2RGNmVQd3M4dzlSNzFScWN3WXdhZVF6Tm4vUmJwVDM1?=
 =?utf-8?B?amNaS2JyQXYrZTBuY0dwS210bCs3MFVKeHBRZ2VqQXBaMWVCSHpwaElKdDdx?=
 =?utf-8?B?VUZpUXRCbjRTblRLUHlnb1pJS2dVbHZjNjJOZk5ISTJ6Rm1NdVFGOUVBUkU0?=
 =?utf-8?B?Mm1KSXVjajMxK3dpOWdXcWp6MW9vVW5UNFpIR1dLRUlSTHU2MkVXT3NVZUxM?=
 =?utf-8?B?Z3VlSnBLdjZvSFBEeEY3Ull5WlowelZLa2lWUnplc3RLd1ZTNHpBQmF3T1Vk?=
 =?utf-8?B?R05HN3BzenNBOCtHcmZDNEJmVEhoYm95Q2wrRjd4U1BlUGo1R0U3aDlUY2Qz?=
 =?utf-8?B?eERHUGRNMGJteTJ5R1NRZnp6SVF1dXFYQmg4dzFoU2R5ek0xaWI0eFV6NjRO?=
 =?utf-8?B?YTFWL0pISnl5UklxMXZzT1RZSUs2TS8xcWdIZTRNZTkyY00xNzdSbXV3WmZ3?=
 =?utf-8?B?S0pTdWQ5YzBIeUJwN1RyVHEwZG5QdFBUNzJORFlnbGwwK0RQd0Z5WFdnaE1S?=
 =?utf-8?B?WUx3TkJDaGNONUwyT3FkL3JsekhFNThoMEY3VE9tekh4SnMzNmN2WXZrekty?=
 =?utf-8?B?ZWRsa0EvTmRXMzJXSC9oRTNKcER1Vzl2QkZjN3kxc0RBakFCUlYrQm5aYmhB?=
 =?utf-8?B?R25xWWRKT3dIaFpCeE15ODZUN3RRMHUvaHZzdlpUZ0EwUmJObytsVWU0NUZz?=
 =?utf-8?B?WTJDTjRWcnREQTU3T20wUjZhcmJQTHdwMFRqZzdWS1hsdHEwVTh0UmpZVGdF?=
 =?utf-8?B?Y2RyV1IzV3B2SDdkbThoaUR1bzhNL2xQYmJTOEljK0hWdCs3cXpSTVVwNC9W?=
 =?utf-8?B?aVNySTJjUThnWnFIR0JZanNaWk9Fa1V4ZHNiNHI3NC91V3pkS0NGSGNFelF3?=
 =?utf-8?Q?UE6j7dmHqUhBsQ3qia8qdHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16DDCF5775A0D148936431C849BC3B8B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0e39f4-aca2-4118-846e-08dd0d2e43e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 08:50:51.4586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iccPnf0Lux34h/8fV3KsuoMXDJHpWy2Tiytby98iDKJHe+5CHvJjaGundCMK4wDQ+e1SBW65pZfmjx9fqp+PV+A+hGZCqeXN92N6nYTCUgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
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

T24gTW9uLCAyMDI0LTExLTI1IGF0IDA4OjMxICswMTAwLCBBbmRyemVqIEhhamRhIHdyb3RlOg0K
PiBTaW5jZSBuZXdlciBhcmNoaXRlY3R1cmVzIHJlcXVpcmUgc3RhdGVsZXNzIGxvYWQvc3RvcmVz
IHdlIG5lZWQgdG8gcGFzcw0KPiBzdXJmYWNlIGRlc2NyaXB0aW9uIHRvIHRoZSBzaGFkZXIuIElu
c3RlYWQgb2YgZG9pbmcgaXQgZm9yIGV2ZXJ5IGNhbGwNCj4gd2UgY2FuIHVzZSBpbmxpbmUgZGF0
YSB3aGljaCBpcyBwYXNzZWQgYnkgQ09NUFVURV9XQUxLRVIgYW5kIGlzIHN0b3JlZA0KPiBpbiBH
UkYgcmVnaXN0ZXIgcjEuDQo+IA0KPiB2NDoNCj4gICAtIG1vdmVkIGdwZ3B1X2FsbG9jX2dwdV9h
ZGRyIGNoYW5nZXMgZnJvbSBuZXh0IHBhdGNoIGhlcmUgKERvbWluaWspLA0KPiAgIC0gcGFzcyB2
bV9pZCB0byBpbnRlbF9hbGxvY2F0b3IgKERvbWluaWspLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQpMb29rcyBnb29kIHRvIG1l
Lg0KDQpJdCBpczoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6
ZWdvcnpla0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2dwZ3B1X3NoYWRlci5jIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvZ3BncHVfc2hhZGVyLmMgYi9saWIvZ3BncHVf
c2hhZGVyLmMNCj4gaW5kZXggMzYzNDM1ZTdlZmQzLi41MjUwNjcwNWU1MTcgMTAwNjQ0DQo+IC0t
LSBhL2xpYi9ncGdwdV9zaGFkZXIuYw0KPiArKysgYi9saWIvZ3BncHVfc2hhZGVyLmMNCj4gQEAg
LTE0OCw2ICsxNDgsMTYgQEAgX194ZWxwX2dwZ3B1X2V4ZWNmdW5jKHN0cnVjdCBpbnRlbF9iYiAq
aWJiLA0KPiAgCQkgICAgICBlbmdpbmUgfCBJOTE1X0VYRUNfTk9fUkVMT0MsIGZhbHNlKTsNCj4g
IH0NCj4gIA0KPiArc3RhdGljIHZvaWQNCj4gK2ZpbGxfaW5saW5lX2RhdGEodWludDMyX3QgKmlu
bGluZV9kYXRhLCB1aW50NjRfdCB0YXJnZXRfb2Zmc2V0LCBzdHJ1Y3QgaW50ZWxfYnVmICp0YXJn
ZXQpDQo+ICt7DQo+ICsJaWd0X2Fzc2VydCh0YXJnZXQtPnN1cmZhY2VbMF0uc3RyaWRlID09IGlu
dGVsX2J1Zl93aWR0aCh0YXJnZXQpICogdGFyZ2V0LT5icHAvOCk7DQo+ICsJKmlubGluZV9kYXRh
KysgPSBsb3dlcl8zMl9iaXRzKHRhcmdldF9vZmZzZXQpOw0KPiArCSppbmxpbmVfZGF0YSsrID0g
dXBwZXJfMzJfYml0cyh0YXJnZXRfb2Zmc2V0KTsNCj4gKwkqaW5saW5lX2RhdGErKyA9IHRhcmdl
dC0+c3VyZmFjZVswXS5zdHJpZGU7DQo+ICsJKmlubGluZV9kYXRhKysgPSBpbnRlbF9idWZfaGVp
Z2h0KHRhcmdldCk7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkDQo+ICBfX3hlaHBfZ3BncHVf
ZXhlY2Z1bmMoc3RydWN0IGludGVsX2JiICppYmIsDQo+ICAJCSAgICAgIHN0cnVjdCBpbnRlbF9i
dWYgKnRhcmdldCwNCj4gQEAgLTE1OSw2ICsxNjksNyBAQCBfX3hlaHBfZ3BncHVfZXhlY2Z1bmMo
c3RydWN0IGludGVsX2JiICppYmIsDQo+ICAJc3RydWN0IHhlaHBfaW50ZXJmYWNlX2Rlc2NyaXB0
b3JfZGF0YSBpZGQ7DQo+ICAJdWludDMyX3Qgc2lwX29mZnNldDsNCj4gIAl1aW50NjRfdCBlbmdp
bmU7DQo+ICsJdWludDMyX3QgKmlubGluZV9kYXRhOw0KPiAgDQo+ICAJaW50ZWxfYmJfYWRkX2lu
dGVsX2J1ZihpYmIsIHRhcmdldCwgdHJ1ZSk7DQo+ICANCj4gQEAgLTE4Niw3ICsxOTcsMTAgQEAg
X194ZWhwX2dwZ3B1X2V4ZWNmdW5jKHN0cnVjdCBpbnRlbF9iYiAqaWJiLA0KPiAgCWlmIChzaXBf
b2Zmc2V0KQ0KPiAgCQllbWl0X3NpcChpYmIsIHNpcF9vZmZzZXQpOw0KPiAgDQo+ICsJLyogSW5s
aW5lIGRhdGEgaXMgYXQgMzF0aC8zMnRoIGR3b3JkIG9mIENPTVBVVEVfV0FMS0VSLCBCU3BlYzog
NjcwMjggKi8NCj4gKwlpbmxpbmVfZGF0YSA9IGludGVsX2JiX3B0cihpYmIpICsgNCAqIChzaGRy
LT5nZW5fdmVyIDwgMjAwMCA/IDMxIDogMzIpOw0KPiAgCXhlaHBfZW1pdF9jb21wdXRlX3dhbGso
aWJiLCAwLCAwLCB4X2RpbSAqIDE2LCB5X2RpbSwgJmlkZCwgMHgwKTsNCj4gKwlmaWxsX2lubGlu
ZV9kYXRhKGlubGluZV9kYXRhLCBDQU5PTklDQUwodGFyZ2V0LT5hZGRyLm9mZnNldCksIHRhcmdl
dCk7DQo+ICANCj4gIAlpbnRlbF9iYl9vdXQoaWJiLCBNSV9CQVRDSF9CVUZGRVJfRU5EKTsNCj4g
IAlpbnRlbF9iYl9wdHJfYWxpZ24oaWJiLCAzMik7DQo+IEBAIC0xOTYsNiArMjEwLDE3IEBAIF9f
eGVocF9ncGdwdV9leGVjZnVuYyhzdHJ1Y3QgaW50ZWxfYmIgKmliYiwNCj4gIAkJICAgICAgZW5n
aW5lIHwgSTkxNV9FWEVDX05PX1JFTE9DLCBmYWxzZSk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyB2
b2lkIGdwZ3B1X2FsbG9jX2dwdV9hZGRyKHN0cnVjdCBpbnRlbF9iYiAqaWJiLCBzdHJ1Y3QgaW50
ZWxfYnVmICp0YXJnZXQpDQo+ICt7DQo+ICsJdWludDY0X3QgYWhuZDsNCj4gKw0KPiArCWFobmQg
PSBpbnRlbF9hbGxvY2F0b3Jfb3Blbl92bV9mdWxsKGliYi0+ZmQsIGliYi0+dm1faWQsIDAsIDAs
IElOVEVMX0FMTE9DQVRPUl9TSU1QTEUsDQo+ICsJCQkJCSBBTExPQ19TVFJBVEVHWV9MT1dfVE9f
SElHSCwgMCk7DQo+ICsJdGFyZ2V0LT5hZGRyLm9mZnNldCA9IGludGVsX2FsbG9jYXRvcl9hbGxv
YyhhaG5kLCB0YXJnZXQtPmhhbmRsZSwNCj4gKwkJCQkJCSAgICB0YXJnZXQtPnN1cmZhY2VbMF0u
c2l6ZSwgMCk7DQo+ICsJaW50ZWxfYWxsb2NhdG9yX2Nsb3NlKGFobmQpOw0KPiArfQ0KPiArDQo+
ICAvKioNCj4gICAqIGdwZ3B1X3NoYWRlcl9leGVjOg0KPiAgICogQGliYjogcG9pbnRlciB0byBp
bml0aWFsaXplZCBpbnRlbF9iYg0KPiBAQCAtMjIxLDYgKzI0Niw5IEBAIHZvaWQgZ3BncHVfc2hh
ZGVyX2V4ZWMoc3RydWN0IGludGVsX2JiICppYmIsDQo+ICAJaWd0X2Fzc2VydChpYmItPnNpemUg
Pj0gUEFHRV9TSVpFKTsNCj4gIAlpZ3RfYXNzZXJ0KGliYi0+cHRyID09IGliYi0+YmF0Y2gpOw0K
PiAgDQo+ICsJaWYgKHRhcmdldC0+YWRkci5vZmZzZXQgPT0gSU5URUxfQlVGX0lOVkFMSURfQURE
UkVTUykNCj4gKwkJZ3BncHVfYWxsb2NfZ3B1X2FkZHIoaWJiLCB0YXJnZXQpOw0KPiArDQo+ICAJ
aWYgKHNoZHItPmdlbl92ZXIgPj0gMTI1MCkNCj4gIAkJX194ZWhwX2dwZ3B1X2V4ZWNmdW5jKGli
YiwgdGFyZ2V0LCB4X2RpbSwgeV9kaW0sIHNoZHIsIHNpcCwNCj4gIAkJCQkgICAgICByaW5nLCBl
eHBsaWNpdF9lbmdpbmUpOw0KPiANCg0K
