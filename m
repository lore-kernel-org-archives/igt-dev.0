Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331ABC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 18:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF91F10E726;
	Wed, 22 Jan 2025 18:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S46AsTLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9E810E726
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737570404; x=1769106404;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=57IZS5fode2MzrT+/trsHXFrxmH57hzbJlC4V1o5kUM=;
 b=S46AsTLkmTKCxAk8Pj8qtjyDaNTiuWG1Vbx98XTI9EvvbL7zPP0pRgHu
 SQj+kv6BrqenfgytPyaOzRuLU0TymR5nsFEzYUoqloMHvwVAR8WzhZGZy
 gJG8e/I6uGwEUazvw64DuyjTpkQeDzoWOE0koFU8aXVZu1RF9QhIslvU7
 uvnOPALWwzprTauUjkehuP+8SQ8b1n+MKlc2Th69LDmBCEr97UvCVDhuB
 1jvoWDFfDH+6uzXHK9JabbeRlTBFoe7ZaHPXcYuuSqqmHnjDFa9LcUV1N
 pXa+AtLranIEKuVbJuxy6zmmWC3jyRIQqsMcythGZRvNYDk31JW351jTr A==;
X-CSE-ConnectionGUID: aMcebZrISg6FfZOZsjqCpw==
X-CSE-MsgGUID: Fv2szNFaS6KTRIrt7tGtQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49456826"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49456826"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:26:43 -0800
X-CSE-ConnectionGUID: M+M2gnKLR1umNFXXdPFX9Q==
X-CSE-MsgGUID: Zouf/iS/Qjmpg0s6hWd3FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107229814"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 10:26:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 10:26:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 10:26:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 10:26:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt7dGDAnqPXqg+9HuHE5OKEZ2CTTG+TpL8Wucu5g/xCWCPY3q9nYZYZNP3GTRNhKp696fD3vkMNqhAPfKfro5ND4KgXrG4n1OeqFgVhhACvpyMzTp7gg5E5etX48eSsiMDSjrN1WvyE1vZXY96a8XtKwo4r75F5NqxnUQkDwVXyGj+W4rpmUVGuwegvJeuAca/xQkSwQ2LBZOSjp8DDJi0PPx33pclvi/Lpxg4OXtMRTw6uf0e0bDpjPPXEbhuNJLzjyS/hozs/BJZ4PdImColVMBNXIoM9QnpuKO8PdJTo4Qd+Q+yvFEJU3RDC7Q3X4ekZYxKwDF2EOUjUVPa0DkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeCB1K96OpLV0/D7AbFWC8B9r9xu4BkvqFsyWfxXeBo=;
 b=eWQatwywjTEUdAp5AzL2yYUM/vE5pnp0mhuk4tdiEkQQOAcwn0QNatGG2ycEcALiKVyrx2fLjzBgpeVm+jdSKYDwDKtpK2vg0zHMTS2iGBZNU7MHj2XqMQTY4FXCtGuDU4L+vQBdj+teRqj4bkWj5/3D5k3KSpQcKq0M1ugmt86+96AN5US1sEP/XAlb/wq5/TGdbAFLHtxww8XwRjX4DEiAplFzqd+/x2E6CB+lmN3QMd3Cz2ctTFdzfiBDQrO2Lb/Zgi96+xREbXZfIUeWE6zL22FbCnaZ1fF+CVpRqtUcwVvOKpNN3nX27p7zQA617OaaYFf/e2/Tlik+GtLCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 18:26:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 18:26:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e740cbcf-7794-4b2f-866b-49c265f701b1@linux.intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <173754961509.5500.8834900644999128777@intel.com>
 <e740cbcf-7794-4b2f-866b-49c265f701b1@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 15:26:34 -0300
Message-ID: <173757039426.5500.1181401747974476563@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: cc44059b-ec55-4b25-b118-08dd3b125076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2JiYUFuU1kwWTViYkMzTW10NjNCY3dIKzFVSkpBWEdXaUdBaDR4WDNFV1kw?=
 =?utf-8?B?a2Z3bitldEtQaCtybHRYSHFYWVpPZlhDZnNiYXFpampzRjdJWXVvajc5bG5W?=
 =?utf-8?B?QlB6TzZSY3kwa2FTeDI1N2Z0cTA4dDRhUnAxeW50YzV5T2g3Z1YyVWlXWHR1?=
 =?utf-8?B?Zk5wLzh3RWxjVWhRUVBaUHNnZ25FeGY4RWNEdmJNRDl6VW1YTXBmM2h5RW1Q?=
 =?utf-8?B?cGc1aThZMHl5U1k1d3FXVm81bklZR21tU2h0OENoZHEvemJ4cVhtY0hrOXQ0?=
 =?utf-8?B?bGJCa3JmS3lRYlkwaFV2Q0x1OE9QOXZDOUVoUUF6VEx2dGtyZlczKzJaZjhj?=
 =?utf-8?B?ZUVOZ1hRYlcwZnU1SmVFcHpBNitmS1RXQVZhdjBNK0RpYVlsaGExa1R3Yk5j?=
 =?utf-8?B?TWY0UHQ2MS9jcFJmYWdqak9VL3RyR1hTQW94eWtEZnRSbGlTZ0ZVaDJ1UUcz?=
 =?utf-8?B?NnIyWlVIVUpad1VCbDQ1YkY4WGJjeG5lQ2ZEM1NqUmpuLy9rSVNoNGN3YVVR?=
 =?utf-8?B?MEduQWg5NnphdHZPWExRTlFVNjBKRmR1d1A4aHQrcnh5ZHo0a295Mm51VEpi?=
 =?utf-8?B?OEY3Vk1qTzVlWG9hbUdjS0UyZDNkSHgwdTVraEVVcWU0UGdGbDVqbGF4MU04?=
 =?utf-8?B?WDhHNU41RHhQcnJhd1Jra0ROSVBWZVJCUTVEYjcrRVBqWVZNU0kyT3BPMVJC?=
 =?utf-8?B?MUhDcCtVQkgzU21sZW50ZUJoNEJmcURhMnZrWmpFNGt3aXo4cnJ0a29wS3BB?=
 =?utf-8?B?OUhNd1MwMEpoS0hqK0VtVGg5bnQ5RFU1UzErdml4RDBQa1luRk1Ka2QvbnZt?=
 =?utf-8?B?K1NVQXB6VUM1K050eXpnR2xlNXFPOHhBaFJ1dnhUNk9rSVNXalNpWGxUdHZR?=
 =?utf-8?B?RzZybkZZZjBhL3c3c2JPZlVHY3dmeEFmZVZIejc5SEZ3b3M1d3RubCtyMmIx?=
 =?utf-8?B?S0tFTGwwWmxGZ21sWnJlL21IUU5Kc0gyV1RoWlIrUnNCRmJmREpVdDlKazJB?=
 =?utf-8?B?S2JUUGd3RG9NRzY0NVppZEhQZFlGUkpFNnJzSnJEb3RVMTI5Smt0S1BIWndY?=
 =?utf-8?B?R3l3TDAyeXc3VkdCUU12RG5QVXkyd3JaUzhVUDhPR04wYkhlUklLV3BPTzh3?=
 =?utf-8?B?OXdzV28xaVZDUFZmUk1MUHJPOU00MVhTNk5XcmVKSmszbUhhSkFRcG5VeFN5?=
 =?utf-8?B?ckdmNTNqVVZGVU1UdG1HRUdCcm9GZi8waFkxeWRLMWtieGpIZU1leHFSL1Jv?=
 =?utf-8?B?d3hBU1M4a1Q5TlpBd0JLMWlJTjl6V1VvZldJTTAxOGk1ZUNyc0YvZjRFMkZp?=
 =?utf-8?B?NGRyWXdYNkR4QjB6NVl4bG1ZYzZMSFNxOTl0NHVlODJRZktZSzNqUHpTSlFj?=
 =?utf-8?B?b2Z0UDFSaW5pWWRmaTR1ekIzNlZNQ05NbG0rYmFycDUxNDZuMHo0aHd6bHFO?=
 =?utf-8?B?YlAyNi9iYlZ2ODdsK3VBTVB5MVh1VXMwUU0vS2tPVDJBL3VveXF2ci83OEhS?=
 =?utf-8?B?czV3MlJOem8zNXpUMEM2S3dQWVJOT0ZtWjhDSlpSYjVMc2I3cWdRcnFWWTBO?=
 =?utf-8?B?dDJtRjhGaEk3QlE2TitRZUhQMVQ4RTVoY1FGN2Y3R1IxZ05TL2dUbUl3MGhy?=
 =?utf-8?B?VXUwekFHaVpaNk9sL3pvVnZ5bW83L3g0MVl3NnY1aWk1d3B5RE5iTGdIZkRq?=
 =?utf-8?B?QzVOdTNkaWxnTUdmcTJHRlQ1U293MStQenhVd1pCYk1lS0lrL0ZXaWFub0FP?=
 =?utf-8?B?Ni9XU1dzcTNranBONXNmMkhyb0xsblJjK0p3SFJYb09lTjBDKzdrN1dmTVFu?=
 =?utf-8?B?WnU3RzBpWXVzYTVIZlI1bnpGOEkwQ3IreDNqVEZibUZQZ2x3RDliQ0ViWlJU?=
 =?utf-8?Q?HoVwhGJqpNAaP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFBaOGE4YkpIZ3FYZ1laQ3NvcFg3bjlpbVltalZmaWlHUEh3blMrMGcyY1oy?=
 =?utf-8?B?dlNiSFI5MzZxUE4yWmYyV1BGS1RUMkxUMlpUZ1BseGh4Rm51dTBDNmVLUGxL?=
 =?utf-8?B?ODJtSnVBVWw2V2dJclNKTFlzd2F1eXAvSE1FVEpVUXBVNlNCdUdhZlc0TXBi?=
 =?utf-8?B?Vm80aGYxbWVVWTg3OEtBQWt4M1NIYUFMNlVZVXdDQlpwVHY1ejF5M2RxVVQx?=
 =?utf-8?B?OURBY04zbFgxQVlORGx5RUloRXhuMHprKzN5OWgramhCWUdsU0RYSmFPcjcw?=
 =?utf-8?B?MlZiZ0VxSWFDQzhEeTVHU3ZqdUM5MkxQajF2ZkxGbXVkMWYyQW9nOUsxenJu?=
 =?utf-8?B?MEErSTF6K05ycjNTZlMwcmsxeEUwck1pd0dab2pLZlMxK0IrN0tGMmdUbTFC?=
 =?utf-8?B?R2Z3TTFHYVJ1V00wS00vMjJmZjVGQW02Ukk2RS83OGFMSGtZVTZJUGYrVU8y?=
 =?utf-8?B?cmVhS2s2enJFRXR1aHJkcTh0b2RVMDNOMTJsRVJkRFhHS0hrcGwwTjZwSkxI?=
 =?utf-8?B?WURSKzF1TUxZYzZrSjhKZGJXZGpVWUdBeWlVTkxaSGlEbmRrRGdaNExPOTFQ?=
 =?utf-8?B?cDJHMGtTQXZqZnJrTmJPYUZuY241MGNiK0hqam9GR3pCMEJkWG9LQW44SjNO?=
 =?utf-8?B?YWtJTXQ3RW5hdWgya0h5dG53ZkE2N0svaXZSdTlGNFB1RjRBTXhNdWNIckEy?=
 =?utf-8?B?dzlBSk5pc0VBN3JtcnR5Zm5XWk5LREtxRmQrMm1md3kwR2llWVlKSWFVckV0?=
 =?utf-8?B?bmQwQ1NKUGFZdFpDYmg0ZzRqM1lHQUQwSERaN3FBTmZYbWlZZU1OU1MweUpm?=
 =?utf-8?B?dkNlcjgranpUM2pYb3BIdGxlb2g1NURrMjZYa0NVSEJJbzJ3djd4c1pBSmIw?=
 =?utf-8?B?UWVUZlZPZjNDVVc3MUhMZWJxOXdvdkdCUXVSbDFFaHM5ckluQ2ZYNkJ5UlFP?=
 =?utf-8?B?MFpabTUzTXVQdjBBdTh4V3ErUlNtUHBpc2dONm9VM1Z0dFRhMytMVWgrdXBH?=
 =?utf-8?B?cGxlNXZTSytiV2xKVmp3RHd0aWlRdjZQeHVxTmdsVks4WnRScTU0eWJodlpN?=
 =?utf-8?B?eG5FcUl4cVNwYm5VVkJsZHJxK1JLR3ByRG5qWlVxQ3lESGpWUHVoNUV2V1BP?=
 =?utf-8?B?VklVUERpeXltVWtVUnV0S2lrSVc4OUJmRUxCTU5tR2xSS1p3UHg3SWhkM0dN?=
 =?utf-8?B?NW1vSUY3UE9DTDJtbmliY1gzdmNxQWlLWHl1NjZjWmMwSGVqdW9IUmNqelJQ?=
 =?utf-8?B?Z08vSUh2c0ZvY0ZmcVd5WGhYV2R0c2ZVTGFhLzBqSUxOUTU3QWNTWlpxd0V3?=
 =?utf-8?B?WUNxM1hCTjBacG40SGhMZ2p4bVhVSHZNZlhkYzRVU0l2MzV3eEM5RGV3VEhU?=
 =?utf-8?B?RlJQMlo5aDFCcy9yOFlrTEpQbkFWb2hpL210bERGdU1rMG04TTI4ZDBMYlBM?=
 =?utf-8?B?UGd1b3BJMmRyOHpONjQraW9YT3BwcUZzRHZJVFZHbzJlNTUxRzRjVVVFa0Rq?=
 =?utf-8?B?NTNTNnJVZUZhVGlVVXBjMzhKUUJrUWQ1N2wyZG5KSlVsRHhUYjcvVm5WWGdG?=
 =?utf-8?B?ZUpzN2hwQzVmVStaNDFGQ012OWxsT1JIYlRYcDhvTDJZaXBQSHRBK0toRFhi?=
 =?utf-8?B?S2FZSm5lbVF2bExKaC9FR1FadFFhU3ZjMm45VGNMVVdEN0U5YkY4Tjc4Y0cv?=
 =?utf-8?B?T2dsd0dtcHpPKzA5ckVHeHZoMWxjaTd5ZE9sSWdEci9haG92cjNBRXNLSzV6?=
 =?utf-8?B?YWQzaitNenlMUWdxRXRnWHNyaUo1a3FBUWt5ZVcrWUlybEt1L1VLbXVPdmhH?=
 =?utf-8?B?Q2JTWVUzc290d0d5eURld043L2JiYlhIR2lqYWxkSkRleHMxVU11L3JVdUJZ?=
 =?utf-8?B?UTdqc1VQYWNHZGhmVXlCbytKbE1idWdsQm5qWkdaV0wzZHhKMnJMVFpGa3Jk?=
 =?utf-8?B?THFtK2xkbnhRbW9HVndlMkFLUTZPNlpaTW1NZ2R0TDZ2ajcxT2hEMVQzYndh?=
 =?utf-8?B?TGVXVVJiSjR5blI2cFhLVHhCbUdjdmY1Mll3YXFJaEVPaXZRczNiZ3RrNXdZ?=
 =?utf-8?B?Tk5kMXYxbWxIaHVmNjVpazJNUmZweGlXM0JiR2c3ajN1NnI2aGx6QXlGVlZJ?=
 =?utf-8?B?SlRrYXBrRU92S1Bma0JFN1RPUlpndzFYVjJLTTdOYm0yVTk0SGRJQ3ViclJT?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc44059b-ec55-4b25-b118-08dd3b125076
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 18:26:40.5362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eib15H1vVPlVOaT1m0nZtv/iTDtLUD1L9bvDRfYBFFYYzgv6o6nEASs5nvdvOnyQhi7fcyxtGjV/YUwjk1czCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
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

Quoting Peter Senna Tschudin (2025-01-22 15:16:59-03:00)
>
>
>On 22.01.2025 13:40, Gustavo Sousa wrote:
>> Quoting Lucas De Marchi (2025-01-21 19:57:32-03:00)
>>> Serialize the command line to metadata.txt. The expected format in the
>>> metadata.txt is like below:
>>>
>>>        cmdline.argc : 6
>>>        cmdline.argv[0] : ./build/runner/igt_runner
>>>        cmdline.argv[1] : -o
>>>        cmdline.argv[2] : --test-list
>>>        cmdline.argv[3] : /tmp/testlist.txt
>>>        cmdline.argv[4] : build/tests/
>>>        cmdline.argv[5] : /tmp/results
>>=20
>> One limitation here is that we would run into problems if one of the
>> arguments contains a newline character. We need to have a proper way of
>> handling that.
>
>I tested this by adding -t '(?m)\b\w*exec\w*\b\n', is that what you mean?

If you are using bash, I'm afraid '\n' in '(?m)\b\w*exec\w*\b\n' is not
turned into a real newline character. Something like $'foo\nbar'
would.

Example:

  $ echo 'foo\nbar'
  foo\nbar

  $ echo $'foo\nbar'
  foo
  bar

--
Gustavo Sousa

>Here is the full json:
>
>  "cmdline":[
>    ".\/build\/runner\/igt_runner",
>    "-o",
>    "-f",
>    "--per-test-timeout",
>    "100",
>    "--dry-run",
>    "--test-list",
>    "build\/docs\/testplan\/intel-ci-tests\/xe\/default\/bat.testlist",
>    "-t",
>    "(?m)\\b\\w*exec\\w*\\b\\n",
>    "\/home\/gta\/igt\/3"
>  ],
>
>The newline Looks good to me...
>
>I also tried adding a multi line regex, and that fails. However it fails w=
ithout
>this change as well so Lucas did not introduce any regression. So maybe it=
 is ok
>to accept this patch as is. Here is what I tried with and without Lucas' p=
atches:
>
>$ time sudo IGT_TEST_ROOT=3D'/home/gta/UPSTREAM/igt-gpu-tools/build/tests/=
' ./build/runner/igt_runner -o -f --per-test-timeout 100 --dry-run --test-l=
ist 'build/docs/testplan/intel-ci-tests/xe/default/bat.testlist' -t '(?s) \
>\b \
>\w*exec\w*\b' /home/gta/igt/4
>
>If my example is wrong, please help me with a good one.
>
>
>>=20
>> One option would be to have string serialization to escape newlines
>> characters, and string parsing to undo the escaping.
>>=20
>> Another one would be to generalize read_hook_strs_from_file() (and with
>> a proper rename) to be reusable for both hook strings and argv.
>>=20
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>> runner/settings.h |  5 +++++
>>> 2 files changed, 47 insertions(+)
>>>
>>> diff --git a/runner/settings.c b/runner/settings.c
>>> index 2787869ee..ed1afc205 100644
>>> --- a/runner/settings.c
>>> +++ b/runner/settings.c
>>> @@ -529,6 +529,18 @@ static void free_hook_strs(struct igt_vec *hook_st=
rs)
>>>         igt_vec_fini(hook_strs);
>>> }
>>>
>>> +static void free_cmdline(struct settings *settings)
>>> +{
>>> +        if (!settings->cmdline.allocated)
>>> +                return;
>>=20
>> I would just make life simpler and have cmdline being always allocated.
>> But I'm not blocking on this...
>>=20
>>> +
>>> +        for (size_t i =3D 0; i < settings->cmdline.argc; i++)
>>> +                free(settings->cmdline.argv[i]);
>>> +
>>> +        free(settings->cmdline.argv);
>>> +}
>>> +
>>> +
>>> static bool file_exists_at(int dirfd, const char *filename)
>>> {
>>>         return faccessat(dirfd, filename, F_OK, 0) =3D=3D 0;
>>> @@ -646,6 +658,7 @@ void clear_settings(struct settings *settings)
>>>         free_regexes(&settings->exclude_regexes);
>>>         free_env_vars(&settings->env_vars);
>>>         free_hook_strs(&settings->hook_strs);
>>> +        free_cmdline(settings);
>>>
>>>         init_settings(settings);
>>> }
>>> @@ -875,6 +888,8 @@ bool parse_options(int argc, char **argv,
>>>                 goto error;
>>>         }
>>>
>>> +        settings->cmdline.argc =3D argc;
>>> +        settings->cmdline.argv =3D argv;
>>>
>>>         return true;
>>>
>>> @@ -1055,6 +1070,7 @@ static bool serialize_hook_strs(struct settings *=
settings, int dirfd)
>>> bool serialize_settings(struct settings *settings)
>>> {
>>> #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\=
n", #name, s->name)
>>> +#define SERIALIZE_ARRAY_ITEM(f, s, name, _i, format) fprintf(f, "%s[%d=
] : " format "\n", #name, _i, s->name[_i])
>>>
>>>         FILE *f;
>>>         int dirfd, covfd;
>>> @@ -1123,6 +1139,10 @@ bool serialize_settings(struct settings *setting=
s)
>>>         SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
>>>         SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
>>>
>>> +        SERIALIZE_LINE(f, settings, cmdline.argc, "%d");
>>> +        for (int i =3D 0; i < settings->cmdline.argc; i++)
>>> +                SERIALIZE_ARRAY_ITEM(f, settings, cmdline.argv, i, "%s=
");
>>> +
>>>         if (settings->sync) {
>>>                 fflush(f);
>>>                 fsync(fileno(f));
>>> @@ -1177,9 +1197,21 @@ static char *parse_str(char **pval)
>>>                 s->field =3D _f(&val);                \
>>>                 goto cleanup;                        \
>>>         }
>>> +#define PARSE_LINE_ARRAY(s, name, val, field, _f, _max)               =
 \
>>> +        do {                                                        \
>>> +                int idx;                                        \
>>> +                if (sscanf(name, #field "[%u]", &idx) =3D=3D 1 &&     =
   \
>>> +                    idx < s->_max) {                                \
>>> +                        s->field[idx] =3D _f(&val);                \
>>> +                        goto cleanup;                                \
>>> +                }                                                \
>>> +        } while (0)
>>> +
>>> #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, =
parse_int)
>>> #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, =
parse_ul)
>>> #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, =
parse_str)
>>> +#define PARSE_ARRAY_STR(s, name, val, field, _max) \
>>> +        PARSE_LINE_ARRAY(s, name, val, field, parse_str, _max)
>>>
>>> bool read_settings_from_file(struct settings *settings, FILE *f)
>>> {
>>> @@ -1211,6 +1243,15 @@ bool read_settings_from_file(struct settings *se=
ttings, FILE *f)
>>>                 PARSE_INT(settings, name, val, enable_code_coverage);
>>>                 PARSE_INT(settings, name, val, cov_results_per_test);
>>>                 PARSE_STR(settings, name, val, code_coverage_script);
>>> +                PARSE_INT(settings, name, val, cmdline.argc);
>>> +
>>> +                if (settings->cmdline.argc && !settings->cmdline.argv)=
 {
>>> +                        settings->cmdline.allocated =3D true;
>>> +                        settings->cmdline.argv =3D calloc(settings->cm=
dline.argc,
>>> +                                                        sizeof(*settin=
gs->cmdline.argv));
>>> +                }
>>=20
>> I think we could have a PARSE_ARRAY_LENGTH() that would encapsulate
>> reading the int and allocating the array. Of course, that would require
>> having a "known format" for an array structure in settings to be used by
>> others in the future.
>>=20
>> The advantage of such a macro, is that we don't need to keep checking if
>> we already have the length and that we haven't done the allocation yet,
>> like done above.
>>=20
>> --
>> Gustavo Sousa
>>=20
>>> +
>>> +                PARSE_ARRAY_STR(settings, name, val, cmdline.argv, cmd=
line.argc);
>>>
>>>                 printf("Warning: Unknown field in settings file: %s =3D=
 %s\n",
>>>                        name, val);
>>> @@ -1234,6 +1275,7 @@ cleanup:
>>>         return true;
>>> }
>>> #undef PARSE_LINE
>>> +#undef PARSE_LINE_ARRAY
>>>
>>> /**
>>>  * read_env_vars_from_file() - load env vars from a file
>>> diff --git a/runner/settings.h b/runner/settings.h
>>> index f69f09778..d563a0d16 100644
>>> --- a/runner/settings.h
>>> +++ b/runner/settings.h
>>> @@ -75,6 +75,11 @@ struct settings {
>>>         char *code_coverage_script;
>>>         bool enable_code_coverage;
>>>         bool cov_results_per_test;
>>> +        struct {
>>> +                bool allocated;
>>> +                int argc;
>>> +                char **argv;
>>> +        } cmdline;
>>> };
>>>
>>> /**
>>> --=20
>>> 2.48.0
>>>
>
