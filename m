Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0355DCAC5B5
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 13:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6FD10E1BC;
	Mon, 29 Sep 2025 13:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuvnGOQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CCB10E1BC
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759152597; x=1790688597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L08yVfzfgcfuuxTrOwSgKO/4ynl2hwBwV5XGdUl0fH8=;
 b=IuvnGOQt1IR89+aXbt8r3o8p5vZZyGBiaAbs0g0N3dOwHCZGWvmxCZjr
 3K8MS9GfOF70v2gGfyBYr7FFAXl6lTIZXlKBIVB9VjOaE+sswkI0iP1nh
 Kqs6NV79bjMzjAfL+pf+pyngY9GqOmIA9KSvJGDlQtMGkBiA0Z2Z9t2vT
 R7KNfmxnNXwJUPDvPzLadN/fpdFVCa1hySHhHRtIGJSPXLytLUgQzybMG
 /qS5TeVRtPtP3Dy+z/NzF9qlJsNunpyrmldIbzirkue1bl9vb02HJAWvn
 8q8FUeV7tmZfy+w77UiufuFDtH0uRx6t+JdDG1dtB6eIFK8nY9Fy4xO5b A==;
X-CSE-ConnectionGUID: dTxc+c3ASoOcC5DotgNcOg==
X-CSE-MsgGUID: dQucEVUtSWeXZ/bhn6//vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61558202"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61558202"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:29:56 -0700
X-CSE-ConnectionGUID: SrL+taZjQ32vTcd23hxRHA==
X-CSE-MsgGUID: OHyLZ8WcR9iNkw0BTfS3cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="201912226"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:29:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:29:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 06:29:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPcB0215y3oYdlIekvjIppJZBjdXfemo4BadAiWezpx2nAdr7hwYVsTcLrurW8jRqEmWLq8oyWUmKLYfMP6CnFAuFo9iA37lYVYIGsQ09j/E3Pfy7WiusNDvyvBpyjpupXnGQrJxm0X97skMJX6ZJSS3CbKedU5td76DpqhkYOy5+4bTfl1MfErtCL1SwNxGS2k8XSJDJhdVR0H6plUx8WiupFn8hzMHjK66ZZiL90CA2HBgwovhr0QCMbsgG71atnpwyBMM902NBPZpghJkrwvyKZHkcJwE5eg3PrN7IpLpbLArYKLwVQww8ULbVfEOfzoEuAFUkaowKdBM2GcvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5KVeElqldzrl6WOtninLPPD/Jy4kK8HK7DotJGPiJo=;
 b=Zgo5wSUrC7iaQ3tkFbWzY8c9It2pGLjnJUcbDnpO0mpRgTGYeb9Sw0Drgrs9NBjklpQDBwOJ3yGfiRMdjWxelo9ZrkVZCrWenNh1XsegBhgzIOLbnZZA4T31FRteY6UbBlzZBUyolEAdml+BbjjHyKlNTKdXrU9d/BuN67gh2Z+GVgDUGwiO7O3mwOESVZr8T7eJdOd+3lT1Nhj/bvv2V8aivRuYLjqNpVqWUgp+/suhEGE5+OrCFPeOBseBsQykMStepwwcyRI5OYzVlSWkYsGoZQVDCkDTl3+MlApI461mUb6vE4ZK7UMTURkWvUWeoeWg9iZnob4gqdezFYXTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 13:29:50 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 13:29:50 +0000
Date: Mon, 29 Sep 2025 15:29:38 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
Message-ID: <ca7jri4wuvcjs74x6zz43maq2m7mnluzwaizgpric7k7hjtnuh@tf7rwypn4mmn>
References: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
 <24778384.ouqheUzb2q@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <24778384.ouqheUzb2q@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: DUZPR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::14) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec6d8a9-fbec-4cb0-c5de-08ddff5c4421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1BvbFlLL2lEcWJwUW9QSEpDOXFOYzlGaTR0UERyUWZQZXlvUyt3ZU9ORGVi?=
 =?utf-8?B?elJEZnU2QTUzVnhLcEhqQXh4NE0zeEZabU9kdDFya2NudGtOSW9qd2pLSHR1?=
 =?utf-8?B?bnRqT0toN0dOSWFFSjlIV08xMWR5MDc2aGdFYSs5ZzNLVFFPV1d0T0xjaXJx?=
 =?utf-8?B?dU80REF1eEpIUnZMZ282UXl5cW84SHU4a2F4S3M5YzNvS042aWFUdm5BVU1P?=
 =?utf-8?B?VjNVTEdSR3oyVWtoWGVLcS9mNUhvbW1SYytlandZNnFkN0NJeG83WndsL1BL?=
 =?utf-8?B?R2pwOG9QTWRDQlcvRWJFOXZnNFd4QkdWQTVqM1c3Smd5WngyeFh5US8vTW5x?=
 =?utf-8?B?MDc2NWltNXR6dUV2eWw3cEYrbm5PRElCeW1GajdEMTNPNVo2c21vUjc0ekFZ?=
 =?utf-8?B?TElsMzQ4SVRCZzUwOWpaaDErM2R5T1AvQnFjeGZmb0l2SkorVW9OcFhUK0Zk?=
 =?utf-8?B?NkpETUtBKzlOaTA4Z1E5eFBkRmN1L2lWcHhoV0VST1kzNDNiRVM0UW5hQkQx?=
 =?utf-8?B?RzVXbmZlWlNqNnF4QUNzQVJrYWVHV01BVitoSjRIand0OFVhZlVhTFJ5N2oy?=
 =?utf-8?B?U2YzQmxyelBISFJ0ajJNSGpwY2JGTFc0Y0JSZGRYclZJcnFSeTNZb2Z4ZEY1?=
 =?utf-8?B?UVU0eHdUSHdma2RweCswZkVnTCtRSUNlVFFVMHdJbXNObm0wN0hUV2oxUHNY?=
 =?utf-8?B?VWVpUjlIYU4xMXVXNUk5anZ1Z3pxTm91cU1LeW95VUVUeDlNTGxmWjUvMFRx?=
 =?utf-8?B?RUJDVTVJNFFVTDRpaUNYYVN4UFZkNUcxdU1wRS95MVh5WTZBWFZYVWwySHE2?=
 =?utf-8?B?bUlIZXcwbFVnWHptZzF3UG9LZjBKK0RQdHkwSHV0QnNubUs4TE9qcmhuYi9K?=
 =?utf-8?B?dHVWMDdDZEFiZkpqb2lQNTBwQ3JoZG1Nc0tRN0dMaTVjTWszcDU2d0RkSWtp?=
 =?utf-8?B?WnFyWFpZWmV6NGNSNlRiZlJCRGk0dFNQaUs1S0lYVnI3VFdIalRoc05rTDZw?=
 =?utf-8?B?YTBWYWhRVGhVSVBQZjJsVmNhV1F6NW9WSk8zY2lybXo3b05DKys4UElSRjQ1?=
 =?utf-8?B?RHBaYlNIbGZuTVNGZXppdnVhUG9xY2h1REc2YVhMOE9PNXV0eTRhVDF2eUk5?=
 =?utf-8?B?WHBsRlBWcmtTOVdnb2dqMHBCazhrMVdEWlZWNTFRc1NOaFhGbGRuMkZQWEhI?=
 =?utf-8?B?bHpwSEdKMGxXMlNqYlBXT0pSak9hZ2JiRytQSnRWelBUL1U2OXZwUEdhemJm?=
 =?utf-8?B?TzF0NVBaeXdSSnpZTFdoMStHS3EzUkxHblliT2lJem5mOUZ3QkRCbldxQW1z?=
 =?utf-8?B?NVY3K1o3U3poM2R1ajVvQk43ZVJuYWJVTGpPNXRLQ0o3ZEp3MEhnaWo2aFhy?=
 =?utf-8?B?Q1ZwS0dXcXE3MEl2Q0pWNzBwWGdNdEtiM2VVSkNtOGJLVHZ4Vk5pR0tLK2Q3?=
 =?utf-8?B?RlJwdnowWGMwRnM5S3RNQ2FOMXl0dnFEcGltbE12UEhYQUs1VnFZOGE3amNW?=
 =?utf-8?B?Zmh4N0Vic2taR1dOQ3RrclovUnVHalF2NW5OZVdSbnJ1NEs2UDFJWW9UaTlT?=
 =?utf-8?B?dmVpL0NtOThhaVNEQ3lRZkxhNWowbmdxWG0rMGsxZE0yVnZ0dE8ySS9lOE83?=
 =?utf-8?B?YkwvelVobFpUZUQyM0k1cjI5S1ozWmVTaEY1bmdaYmRFZkJWUHMzVFFScTdF?=
 =?utf-8?B?UXRoTkdxM2ZCUWFabXVZMXZkVloweHRnMWlGVW8zaFpFM2pWZUlWY3BDS013?=
 =?utf-8?B?OGlMY2szdHJSekFEYnV1ZVVNdlk0RkFySHZmVytseW1BVGtGSmpCMDR1S0Y4?=
 =?utf-8?B?Z25lWXI3aFhOMWM2Slh4aGJGQTliWkZkWmdodWhlV1poaVFObnJwSTdjNENy?=
 =?utf-8?B?cjRaWDFBa2c2dGVObVA5ZWNabUdzM3FZdmlwekh1c1J3U1hoK2FNOEE2ZVhM?=
 =?utf-8?B?blhEd21GTFZvUGZHSmluTHlldDQ4TEN4bHFQMm9Pa3IwKzRXaDdXRmRRWDJX?=
 =?utf-8?B?TGlHZ1VuUWZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFV3YWp6QTZ5bnN2MjNiZERrM2tiOVhYZ1E4ZG5sK0FOcmxkYjNPbG5RblNQ?=
 =?utf-8?B?cEpONUhmSS9BaGRuRXlialVRMXNyWDgxbGl4MHA4OFFVNXRxMDN3alh6UTNy?=
 =?utf-8?B?cWdBR3EvbTM1SDV0WWNqVXlrb3A2Nm83RXovQjMrdThkc0M1TWc5T01WVzFs?=
 =?utf-8?B?Y0VaS2h4N0JMb2pBc2lFU3pOTzNvZllLaUlHS1FnUTJURkZBd09WZ0lHaCtw?=
 =?utf-8?B?N201QXdQZzVwRGRmdm9vcU5ySTdlQ2ZEUE1FcWZZNlJJT1NiOFAwUktKTDFM?=
 =?utf-8?B?TllabDEwYjNiSkIvZ0hhclE0T3FxVWZleE10RFdlbGlKZFdzYjM1NklZM1Fv?=
 =?utf-8?B?OEkwZzFGcU9SRXV3bXhCdlZmd21jMDRLT242QUQ5WFlZdk5iOGJYTnhWTHNO?=
 =?utf-8?B?ZHVCcjE3RGs3R01BVnQ5UlJFNHByYng4L2RIaExvbHlieGJ1aTJSd3BSc25j?=
 =?utf-8?B?cllTU0w1dDdNRVVIZGFWdFMxeEZScVh0S3Fzak4vSHAvdUVBRk5yODVaQTli?=
 =?utf-8?B?am9ZY0FTSU5rM0NiTVprOGxxMkVzWXJEOFZWdzBLZkhUR21IdGJiQkFsdFcz?=
 =?utf-8?B?VzRrelBoanJvL2pKT0lnVlliK00rZURjQ05MdnA4c0h3UDZHU1NQODlSOTl4?=
 =?utf-8?B?Yjc1TVNPSTkzZE96NUFDYmljV3pzNm5tcjN1T2I0N2VISW1aY28wQmR0U2R4?=
 =?utf-8?B?V2xTRGxsWVc1RlIzVVNVWEloNzk2dTBHZHpUUVVDalI3OXdwUkVzSEFxeXo4?=
 =?utf-8?B?UzlOTnBwNVpFamU2TTUxL1d4aFJUSFk2NFFsMFRPRGFEYS9QY2lNNFVneVlx?=
 =?utf-8?B?aDN2M3BVbzNEMTEwREdIcE9HdTVZRm9xaFhFU3JVMXN5UzN3aDZIZUxVVkFT?=
 =?utf-8?B?Rmc5eXFoTWhrYmgwWkZ5V05JREc2YURUb05KbFlLdlRqSUN5aGdYNm44V0xw?=
 =?utf-8?B?ZVRSQWxWRS9sK0hhd0lDMzI5aldJUFVjVzh1TEsvb0lyQ2FNYnNTSDNFelBO?=
 =?utf-8?B?T0VaQjRSb3RFRDRVYnV4dmczRGFobFY5SjIyc1BWVkdOaWttOVRWZW1BUW03?=
 =?utf-8?B?YS9rczYycGszL0x6bE45VnNlSVBUVDA0Z0tSdSt3dm9BMTFxMnNqQmFBc1Iy?=
 =?utf-8?B?WnN6TnVXY3RCakYrOEFtb20zYmFvN1VwUUZxdkFFQisrRU9jSHd5WVUxUG9J?=
 =?utf-8?B?Vk8vUmNDUXROdlZhSDQ0cFAzbXdJVXQzNW1JN2FKcVgzdHhRS0pLUUI1QXdM?=
 =?utf-8?B?VUN6U1puWGtrYTZPWXM3bEJkMVhTUU1BZll4Mms5V05NS3N6Y3djT3VQekFa?=
 =?utf-8?B?QmVHcHlmUytFNXpxekVxeUpSL3JZdExqYUQ4bGJvbmJtYWlWTUp6ek1OSkdF?=
 =?utf-8?B?YmROSUZmaUk0eGlJdUVEeEltQWNHODdQVTFBbWJGaWR0V2FnMHlvMHRwRHRu?=
 =?utf-8?B?NG1DSnluS0hhU05ySVZlMG41S20xT3AwejBmclAybmVqMVFDKy9jOGxma01l?=
 =?utf-8?B?QzZQQVBtcmZ0YXlUUm5ham9vbFdETjB2bFVteHlHUVZOd1VCV1JLdCs0cTRz?=
 =?utf-8?B?Z3FJOXRGOUxxbjVwSHg3VWhHRmpBL1Y5SmhVVXg5VTkrRnhhOXFhUjh0b0NU?=
 =?utf-8?B?eE4xa1lBQjI3RGR6d3JLczQrekt5R3g0N3FWKy9QdXRzbUxzNTJHMTVEY1da?=
 =?utf-8?B?YWxuNlhuaEV3ZWM3UmI4WDRLN2RPcjMxVkZ3ck9ZRkk2U210SkdQeldSUDlR?=
 =?utf-8?B?RjB1bkNVSnEzNWtVM0NkTjE5NGpvSTRNcUZ3RStUOFcycnZ5aG5uMmI4SjV3?=
 =?utf-8?B?TE9CbHI3RFRaU2FrRnFxOEV3WCt4ZVlRVzJabWp3U3ZHaWdrVXR4bytBOFFY?=
 =?utf-8?B?RXhHRmFrT2Q3cTUyUklpOXkwbEttWXhNRXVoSU9SS3RzeDVvNVExUWlzVDdN?=
 =?utf-8?B?NDNUV1Fab2cyOVkrSFFjR3JqZUJDOEs5NmhFaDhCNnlCbC9PWVB6KzZWa0N1?=
 =?utf-8?B?ZU9jc2ZnQUpRbGhBallvL3lMdWIzOXNMbEd5QlA3eTc4alRLaURBdzNWNmpR?=
 =?utf-8?B?cFlneitLK3BUVVY3RFdaM0ZDWWVKVDd4VlVvUUZmWU5wbW5jV2hlRmJBOVdR?=
 =?utf-8?B?bnhxMm5XUU02bi9vZ24xa0o2R1ExakNudnI4UkI5QzBxb2d2L0wzall2SjVZ?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec6d8a9-fbec-4cb0-c5de-08ddff5c4421
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 13:29:50.3449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjJYNYYaiGtper5zuXi9hvDHLTewcbHh570BXKW8wL2g0QNgj1ACiZCCfvTdAJpPs8SD4DTFkbhE4hucs4oGYFJdEWimk7GH1fQrJWAF9VI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

On 2025-09-29 at 10:44:01 GMT, Janusz Krzysztofik wrote:
> Hi Krzysztof,
> 
> On Friday, 26 September 2025 20:03:03 CEST Krzysztof Niemiec wrote:
> > Move the interrupt timer from the parent thread to the child thread as
> > an explicit signal raise, and make sure the order of execution between
> > them is always the same. This reduces nondeterminism in the test, fixing
> > bugs like [1], where the child is starved out of CPU time up until the
> > parent gets signalled and monopolizes the CPU before the child could
> > submit its own execbuf, failing the test.
> > 
> > [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898
> 
> If this patch resolves the issue then that link is a good candidate for a 
> Closes: tag.
> 
> Thanks,
> Janusz
> 

I guess that would be good, should I send in v3 or can this be added
during merge? (cc'ed Kamil)

Thanks
Krzysztof

> > 
> > v2: make the sync variable actually work (Zbigniew)
> > 
> > Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > ---
> >  tests/intel/gem_exec_schedule.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> > index 84219b4cf..2f3958723 100644
> > --- a/tests/intel/gem_exec_schedule.c
> > +++ b/tests/intel/gem_exec_schedule.c
> > @@ -2447,6 +2447,7 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  	struct itimerval itv;
> >  	IGT_CORK_HANDLE(c);
> >  	bool *result;
> > +	bool *sync;
> >  
> >  	/*
> >  	 * We start simple. A low priority client should never prevent a high
> > @@ -2469,6 +2470,8 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  	result = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> >  	igt_assert(result != MAP_FAILED);
> >  
> > +	sync = result + 0x100;
> > +
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	memset(&obj, 0, sizeof(obj));
> >  
> > @@ -2528,10 +2531,15 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  	/* both parent + child on the same cpu, only parent is RT */
> >  	bind_to_cpu(0);
> > +	*sync = 0;
> >  
> >  	igt_fork(child, 1) {
> >  		int err;
> >  
> > +		/* We want the parent to always go first */
> > +		while (!*sync)
> > +			sched_yield();
> > +
> >  		/* Replace our batch to avoid conflicts over shared resources? */
> >  		if (!(flags & SHARED)) {
> >  			obj[1].handle = gem_create(fd, 4096);
> > @@ -2542,7 +2550,6 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  		igt_debug("Waking parent\n");
> >  		kill(getppid(), SIGALRM);
> > -		sched_yield();
> >  		result[1] = true;
> >  
> >  		sigaction(SIGALRM, &sa, NULL);
> > @@ -2566,17 +2573,19 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  		if (!(flags & SHARED))
> >  			gem_close(fd, obj[1].handle);
> > +
> > +		/* Interrupt parent's execbuf now that the child is done */
> > +		kill(getppid(), SIGALRM);
> >  	}
> >  
> > +	*sync = 1;
> > +
> >  	/* Relinquish CPU just to allow child to create a context */
> > -	sleep(1);
> > +	pause();
> >  	igt_assert_f(result[0], "HP context (child) not created\n");
> >  	igt_assert_f(!result[1], "Child released too early!\n");
> >  
> >  	/* Parent sleeps waiting for ringspace, releasing child */
> > -	itv.it_value.tv_sec = 0;
> > -	itv.it_value.tv_usec = 50000;
> > -	setitimer(ITIMER_REAL, &itv, NULL);
> >  	igt_debug("LP parent executing\n");
> >  	igt_assert_eq(__execbuf(fd, &execbuf), -EINTR);
> >  	igt_assert_f(result[1], "Child was not released!\n");
> > 
> 
> 
> 
> 
