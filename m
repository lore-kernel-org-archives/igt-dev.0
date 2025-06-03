Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90251C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 06:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A32E10E0B9;
	Tue,  3 Jun 2025 06:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a33bwbR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CD710E0B9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 06:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748932633; x=1780468633;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LInkprjIZgrwTbkdgt58QItoVZ6Rcpa8xx9+/hQvReU=;
 b=a33bwbR67E7qn8OcuGsIhlPDmUkRoQRnydIXx0Xfuzl84I4FetTCJNj7
 F5TRyw9YjCxYhsjk+5VShcLBHGIotY+wxLwsDPflDSOkR4Py/h1hPzwZl
 JvRJhordnOyRpr06p5nJQYEC2r0wcAW4DntLzQZY0G4mBHaBb2KUobh63
 kxroSludcGzOkK6Z+YjMN6v8Wt+X/q79OuJ1C/DPjZWfnCkmocyLd81ih
 hj6zzBhlOZ1/kf/N2lcZpWiqmHgbGISq7Nfdlh39nkhmzsofmG6p4QAnv
 gI++YuNnJaZM5WWZQOEpDA6XDbKUkguByVorn4QsGGhr0p0ITTIEjWRg/ w==;
X-CSE-ConnectionGUID: XRPOlQ9hSwOVBZ5cAoielw==
X-CSE-MsgGUID: G1gZ6Fd3QF2LpcbDlXUgbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62315733"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62315733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:37:12 -0700
X-CSE-ConnectionGUID: SGouik3LR+GKlqcP0x0Fsw==
X-CSE-MsgGUID: xlwDsHN6QXec3wJ7I88orw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="149540812"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:37:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 23:37:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 23:37:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.67)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 23:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKbU2BGa8wyrS4qZKfbBo7Gb04C30LbA1BDsBKdkhx8P0JlsKYt+4Pq/wn3pSdVmM15iw620I4O9gTOXEjzInuIeRF3IjFqNSvTlCzAHc32PmZwfd37xjF6/xxMPZWSyMOBVtdYIhDOfdBWalX6a9b/n7S6VpjA2MflRlU8iNlv19u/9seJ6KPotMSaYmjlv6p1tvkPdV8MJoh8yWDXm62VROhKCpt3FFYt0h6beh2OLrd+agLe+byFk6hOmoXkHU1LT6Eq+dO1Cdk3Jlrw9cskHH3eoM/LA6kEtwmvMWrHxPqaMSWV5gtsv4Wsexq64ZtjTQoPTe1P1NPiQEIt/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjqU/GECqRLA0vkKvyii/gGXnoeQnnHaf8ve5ioYOJ8=;
 b=clMuBOzErjYoXzVnCpuhg9d75Zv4mtFWFTTVF/08q8B7UHUXy7c1YNqnixiU+HBqMrasZxMDP3GmjqTFwwq31r/E3n+f7i70RhWLLCnEWiWnbqNEPbkv0ATlX4Yvy7fj9aD2L2lBaONGOeOdVQ0pGGhTobpTexVD7lOpDDlGFOYUwazTSIwWuYal6ZgdDMCrkI6JbVVg0imlek7goGGhSPcmf2Zti1T8p6IuHsz5pOPCBbfoAENsSjlqbdjrWUP97hw+oYHQG4A0GcL0LphD/fJvthmS1pBCkmWmlDwGbwGEP+xGwDY/WMetlypwHFYHKBzaVwVuiEQf+KqR2rg+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 3 Jun
 2025 06:36:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 06:36:34 +0000
Message-ID: <a4cc689f-c5ff-4dda-b897-f4cb7f3ea670@intel.com>
Date: Tue, 3 Jun 2025 12:06:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] tests/intel/xe_pmu: Validate engine activity
 on gt reset and suspend
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-2-riana.tauro@intel.com>
 <aDibeRsG5OZkCVem@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aDibeRsG5OZkCVem@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e4dad9-e48e-426e-3f49-08dda268fba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnJ0Yk10eitFMjd6ZzFIMHhwOXB3eEsxOEFHZko5bklVVE9lMFlKRkhwR3Qr?=
 =?utf-8?B?Z0hXZHhVUnFMa01wOGVGU21lTFJwNjlVcExQNjNUaVZrZTF5cjlRejlOdlZ6?=
 =?utf-8?B?ZXBIQ0pBaVN3RmJiN2oyOStpS0ZvdXByWG5Ick5jZ2pHWk1xM1c1a0lzZkNZ?=
 =?utf-8?B?WGVib1FXWTh6VEpaTElad2lSamJBQzVabjMxLy9idi82ZEp2bXB5cWt5clFn?=
 =?utf-8?B?TitIdHhERVRwV2JablYzaklCelljNFhLWjBOL2RQd0haSGRqNUhZTUI4QnVL?=
 =?utf-8?B?c1U1WWViTmNEaEhEM3EwWmhsOXkxeEt1TzZCT3d2YTkxc2x2WGx1Y3czZnh1?=
 =?utf-8?B?Uk1CZmFNQzlJVlFURkQrZVhDWXlWbVFwWklyeURZWjR2cElQOUptWHdkU2xu?=
 =?utf-8?B?V21oMTZZU0w4blp2YkxSL1VxN0RTcXBSV1JOR1BSc0FTMWI0b0tJdW1JOUIy?=
 =?utf-8?B?dHBiZnBuZ3U0dFNSeVFmY0Q0T09XcmJkK2JYMEpCMGs3b21pSmwyMjRIOTZV?=
 =?utf-8?B?YmhKQkt1NnZGOXdJZmNza29wd0dGM2d3YUZEUkNjSWdpdS93SGcxR0o1WlN6?=
 =?utf-8?B?c1F2aFZxV3VHMUtBendwL2xzeXo2SlRzNXZBUnhsd3ArM21zNHVubXU1M2o0?=
 =?utf-8?B?K1E4L2ZDWXBNUW04ZTVqd3pINVZNNEZlUXVla0VpK1ZGcVJsejFUalVaWjRZ?=
 =?utf-8?B?M3pwQ2lwekpDblk3R20wNFFVU3VyK1Evb1I1TlZTZkx4UDFobldndUtJV2dM?=
 =?utf-8?B?U1IvMitxaWIwQWZWSm45aDF1aW9vcjl5MExWblFlNldTQWlQdVRYSnlJQ2lM?=
 =?utf-8?B?ZlFqZVIyK2hxcjk5QlZUQkxqa0hUamdrTm9PRmFmek4vR2xIY0JncXpVWW02?=
 =?utf-8?B?MDZNOGVyWG5kcGtSc2FRUzliTzhjR2VsRU5MVmlYSHpUdi9DWE5IVjluZlNI?=
 =?utf-8?B?N1lZTVZUN2g5cXRpNTAzWUtab3d0VDBOWnA1VVllOWEyR0FOb1BDNUxSb3Fa?=
 =?utf-8?B?bXVzRElEa1JWK1MydW95MkthWGZ1NjRtcmxUZnBhOFhIdFM3VnJZZGt0Y0hT?=
 =?utf-8?B?b2E3UFlsd1VySEtnTGpXUkh2eUNlR0xRQU5hNTZJZE0zQVV6Yys1VmsyTjRU?=
 =?utf-8?B?dEdsMDhRempTWnhBdjZ5enRLaUlGZ01mZXM5MTNVKzBDM2FiT2swQnpBYW5v?=
 =?utf-8?B?ZG0xcWVXVmk4eG9yT05SbFppQkw2Q295M3h1T0h3Qzh1Y3hHNk1aa2dwOXRO?=
 =?utf-8?B?YW1kaXlCNlNIdVlEaWlwRTlLNThSYS9nM2EyRGtaK3RCV0J6Z0loM2lwVEdm?=
 =?utf-8?B?VHVTMDVrU25TVlRZdmdUbUc4dEZyMllQNDE3Q1VkL3RTVnNnWUxYOU5VRkhk?=
 =?utf-8?B?UGJWQkxSTTdHUWNlcU85RStYa09yUk5ST3F4c2hFVHJ5eEFGQlgrWTdUTjVS?=
 =?utf-8?B?UFY1NUhXWk9ReWlkWllKTHVDRGR0dnlZVStSVmxhNmpSdThUZlVpYWMrNlM0?=
 =?utf-8?B?ODNDd3g1VVVVb0Z5MHFNZFVPSE9Kd1NEUWFPTFBxQUVPcmpXbFRRTE1hdDk5?=
 =?utf-8?B?OCtjMWdWdDhsNFptYWJ1N3FMVzJRYWs0Q0YrbU5zczBqR1FwNmk5Yzh5WXVQ?=
 =?utf-8?B?b2VhVitORDJlYlBRbzMwaFNhUmV6QWgyTG5ON3dvRnVtZnhPNngwOTFiL1RN?=
 =?utf-8?B?V2NiSEhkUW5TZGIwZDBudEJtWU5Jb1BKcGR4SWppTllrdDBUL3d4bXd4bG5u?=
 =?utf-8?B?U2FYYmsrVGl2RlNRMEtKR1VJMjVpUkE3U3VSV054bFlIUzdwRWRLSW1zRlV3?=
 =?utf-8?B?V3hFUmtJT090Q01SeG9YRFpBQlJWOFdKVWVYQkNXOVVZbVVVN2xlWWxnQ0hx?=
 =?utf-8?B?R2V3ZlNOK3p4dUVQeHhuZmJVMzkyOFRRbnJ4VFIrUUFhbEtxN0hsQyswQkRa?=
 =?utf-8?Q?jRtRf/UmSMA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnZnb2hoN1pZNGZGWEh1NHFMT1BIRTRQWGp3eUhqbDFpbktiZ1lyeTNnWWls?=
 =?utf-8?B?Yk4vWi9CNk1wSC9qMmtCYk5QUkp4YW5zdm9xVjB1VUFMUnlFNTRGa3pxdUE1?=
 =?utf-8?B?d1RIWEt4U1A4NzNaWExQYlRZazc4blNybW9xQkkxZVI1SU82dFpzWTNNNjdM?=
 =?utf-8?B?eGpXaEo5a2pVeElRV1ZBK3V5Si9abVVVSHlNdGhWUC9sZnE4L0NQSGp3cVlB?=
 =?utf-8?B?UlEzWGZLQlo2ZkFTcE5TVzk2WFZoRHc5WnpxSGYzOXJvS1ZrMEZhL1g1bGVR?=
 =?utf-8?B?VkhkRmhzOEhqTmVaL0wvU2lWVlpTb21PNllDbXlOYVMxTkVrekw3NDBkMWgw?=
 =?utf-8?B?d1dyV2UvaHYxOWJWUUE4R2syU0l6Y1E0UEpvdW15VFB4b3lqWGZBMlJCVFF5?=
 =?utf-8?B?QVo5d2J3MVUzRkx2cUErMEVRMitjanZlOFgwcDA3RkpoOXhkazdhaXBTZ092?=
 =?utf-8?B?YThoRkJaNGZyaFJsUkc5NXFuL2R4dW9ud28zRFpBTHg5aEVwQUNlRGd2MDZ4?=
 =?utf-8?B?NE4yeDAzQi9NRDFUNC9zdnR6YjR4Y0NVbkpFOGNDRmVXOVRLdlZlVTZsVGZj?=
 =?utf-8?B?YmVoWEx6aWdYeXRXWEhSL2xUaVFPaDhHNFdMZUhFeVlLUFFxdnlhRjRBbUNp?=
 =?utf-8?B?M1pYTk9Mak9UV0UvRFJXL1dBM2JrM3NuKzVmSENUMkxyU0VMUG9LTmtNTEZw?=
 =?utf-8?B?RzIybEFDb0ZHa3BOa2VPY3hhVkRZMkF3RkprZWROcXNrQy9Hc0p0c0w0Y2Jh?=
 =?utf-8?B?NkFBU1NFSUorRm5XT01zZVRRdHMvaEtRWE84Wm9uRjRIVVFjNGdlQThWczZV?=
 =?utf-8?B?UXVCanQ3aFJuV1QzamxPeTlYeDlyZkFQWlNlNmtjM1lsUkM5K1ZyaUVRck56?=
 =?utf-8?B?MS8zYVNueFFjdlc4TEZlTUxNT0hsZ1gzZENiMG13UG1lMXlxUTd5SEpnWms2?=
 =?utf-8?B?aVczRU1FeTgxTVA4d0o0S1daVU5uSnU2NDkrQklVaFBiZ2YrUEQ1c2lhYWFT?=
 =?utf-8?B?QnV2Z2lIdS9WUEhnMms0blFPSzVHcEo0VVp3cUNUc0xrb0VuR3Q5UU1Fbjk1?=
 =?utf-8?B?bHplVWJadDNsalcvd0RPdzRNNEd0MXZXdjdrNUVnTk94b0lqYlVUVXhpSEVx?=
 =?utf-8?B?NVEvZStadS9sMU5hNCsyaFdlWnRRcklWWTlIdytFVVZjdUFHUVFDUkxkemVx?=
 =?utf-8?B?QzRNdjhQdEg4ZDRXM25RSXJ0eTl3VnNSYzZHbHFQZzFIdDZpN3VtM1dDK29W?=
 =?utf-8?B?eGo0dnlMZG00L3FReWJvZUVvdnVCczE0cGgwY0UyMGNOVlg5T21kZDhDZ1Qx?=
 =?utf-8?B?cDNxbnErSHBPaGZMaUZqeWU1U1JFWnI1S2h6aTVqSW94aWJhMUp4S0o1dHhk?=
 =?utf-8?B?RkVUckJKWUk0b1FaYnFVN1NHb0pMQXlNRlJpWlhJOVphekNhaDFLQThwcTRa?=
 =?utf-8?B?cjE3WDV2bGF5Q25NYUhEeitLNXVDanVlMVFrN0VQdUpFVnVUZU5FSkRyUUhx?=
 =?utf-8?B?elhOZ1pKN0FWQmJpV2xIRXV0ZXpDMVlqM1VKMEwyRlBWdGwyb1ZhUlVrcmxr?=
 =?utf-8?B?ZkFPZFR3Y1lsWFVXbUpMY3BvN1V6b3BIRmNqdk5xaWlVWS9sdnlLQkZPOU9o?=
 =?utf-8?B?U3lTRGNmc0Nnc0Q3cEhvTnVESGpIZ1B6L1l0RkdmUU1wN3lKNnN2NnhqaFZL?=
 =?utf-8?B?OHJXNFlEYmhRbS80cVdCMUVDUXh2dUpNeXk2a3VyOVN1KzhNVUVoQkpQd2RY?=
 =?utf-8?B?czRuQ0NPbTFBbndPVk5ZTUR2ZERETWNTcmxMdXlZQmlOc25EV1M4ZEd6aml6?=
 =?utf-8?B?Z05wbDR4WUNhTkNhUDZ2YXUwQTkxVzFSZDR3OWowQXdsK00xV1BsMTlEWFov?=
 =?utf-8?B?cHUrM1ZmOEhKUEF1VHBxZ1pUNnd2bUQxYiszSERHN1pIcGFKV1BYZTR0MnJ4?=
 =?utf-8?B?SUwwRG1SbXJmMjFFVUdsajkyZExhZnJnWHhpMVpVNk5oMTBCWXh6aXZRUXRW?=
 =?utf-8?B?YUVvd3lhNVk1RUNJbFhYVUU3VTZkTmFoU3NiYUQwMXhBdzZKbDcwSUUrYVpl?=
 =?utf-8?B?QWpta2NkUWQrR09BazJ1UVA5M2diQS9LNFNNckhKb2RPMnIrTkVraWRLTDkx?=
 =?utf-8?Q?cpvg9eazzS1nwxVjHpvevCCZO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e4dad9-e48e-426e-3f49-08dda268fba3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:36:34.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPsjjleO+Q+VUwPd8E0wk+5MNkIeG1BGyKEotyN3pPRZZvsDwhFORlyPfGoLTliGxCAzoNm4RzCAHSAbBZSGkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
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

Hi Umesh

On 5/29/2025 11:08 PM, Umesh Nerlige Ramappa wrote:
> On Thu, May 29, 2025 at 12:23:56PM +0530, Riana Tauro wrote:
>> Add tests to validate engine activity before and after gt resets
>> and suspend
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 21 +++++++++++++++++++++
>> 1 file changed, 21 insertions(+)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 02f23bd7d..15b4b82d8 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -40,6 +40,12 @@
>>  * Description: Test to validate engine activity by running workload 
>> on all engines
>>  *        simultaneously and trailing idle
>>  *
>> + * SUBTEST: engine-activity-gt-reset
>> + * Description: Test to validate engine activity on all engines 
>> before and after gt reset
>> + *
>> + * SUBTEST: engine-activity-suspend
>> + * Description: Test to validate engine activity on all engines 
>> before and after s2idle
>> + *
>>  * SUBTEST: engine-activity-most-load
>>  * Description: Test to validate engine activity by running workload 
>> on all engines except one
>>  *
>> @@ -812,6 +818,21 @@ igt_main
>>     igt_subtest("engine-activity-all-load-idle")
>>         engine_activity_load_all(fd, num_engines, TEST_LOAD | 
>> TEST_TRAILING_IDLE);
>>
>> +    igt_describe("Validate engine activity before and after gt reset");
>> +    igt_subtest("engine-activity-gt-reset") {
>> +        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>> +        xe_for_each_gt(fd, gt)
>> +            xe_force_gt_reset_sync(fd, gt);
>> +        engine_activity_load_all(fd, num_engines, TEST_LOAD);
> 
> This is also probably one of the tests that we want to run, but for gt 
> reset and effect on PMU, I would just do the reset withing the single
> engine activity test in the same manner as it was in i915.


i915 test checks for idle after gt-reset. Since engine activity is 
registered with GuC.  I wanted to check if running a spinner again after 
gt-reset and capturing activity values works

Should i add another test for idle after gt reset?

Thanks
Riana

  >
>> +    }
>> +
>> +    igt_describe("Validate engine activity before and after s2idle");
>> +    igt_subtest("engine-activity-suspend") {
>> +        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>> +        igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, 
>> SUSPEND_TEST_NONE);
>> +        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>> +    }
>> +
>>     igt_subtest_group {
>>         unsigned int num_fns;
>>
>> -- 
>> 2.47.1
>>

