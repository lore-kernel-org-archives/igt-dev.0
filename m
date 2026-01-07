Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A8BCF6BEA
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 05:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755EB10E1EE;
	Wed,  7 Jan 2026 05:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfXMyJW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FE310E1EE
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767762265; x=1799298265;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s4a7Pgc2wVJVmMbZd3OXvYMTNI2JGj7Ufmc8yXDuqKM=;
 b=VfXMyJW9cLeDn+EmcQW2WsDN8GWk1GhjZRbnf03NJchQa2F1iF8RtxL7
 01PLMXmZsn7z1QsQEGPiVc0GU07BPc7+BaI33hp0GO8HpeVucUjn5+xUp
 Vflf8QcqspxDbGdUwTQdzuPPo9zO4WdbTjhk71BUdwiYIrWMBX8WfR8p6
 xTM4ee6+EOdh9Ss/eXDomL7QyvLpt/v0nlII5A174HrYqJOA4zajiB2yh
 nzm5rrBlQsIA2x0zIrzkctK3bYR/bJ3clmm1jkbrwksp7LBLxzV+cKklC
 SOEjCXizDv0jV2Bxt1YFSzha97oay6WrMaD53geoW5RqeolYLEDXA2ZvA A==;
X-CSE-ConnectionGUID: QUyFazoQRE6ujAQhGcJciQ==
X-CSE-MsgGUID: Df9LPgMaSyaQguhbCoLEmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72976847"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="72976847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:04:25 -0800
X-CSE-ConnectionGUID: 06aF1VN6S2+BdJhemBDRXg==
X-CSE-MsgGUID: ifA56ls/Ti+pO6WdY0wg5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="203273309"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:04:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 21:04:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 21:04:24 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 21:04:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtI78IAXnXdy0iQG0QvGMqrK9nM95M9PkXOeTQLPNzI/OuEf/ejDaxsuICeHkkh5ZZbMrUvjvTjkl3BponSY1cKktLgPWEBDGqGTdzfexHMknofaVxnqjFT/Z9guCZ4N+iABC2qZq60PDZHzNAJ4mw2ldbhjEcnGa9oVDKifu8ZZqt+gm4urtOSDmmrRcBwLtqkWL3LxKahOsiOPV7kG9CjyRqjxp4YomUlNKCsCNa/upMbn3Sq0L8szoqG8Nmv1CkjqoS8bd/l94buonuiP+leyWpioMyAkbOSWkZII/CS7Q62Wve/4AfSMF8qH1QPbBkDLtiTJVCrlI3X+tClVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJDIXw/QZ2PegLKbRQ/17XjZWxqKAGMuY7/WA4F0Zuw=;
 b=hll0TeKhXkDAtR/CUVdH7Jq7jIdOYcl2U15hzxfNFESX96N7IRLVoaOQ22EaYpgH/p+Bgz84re3GMxsbtENcvZ0XUyeRzH6LaDSK/B/XS6WX0+1ppOpTTEd+eys/LfCDg+Ll4yQwe8vEO2P96pzed345hdYW1VwfciDAzBvMvqWm2+3dXYx0UPrIu5rz4ShTLjMCurSSHMWakIm1Sk3bjOLUsouoJlGIsiJYoWEgNbNsCZJr5aLllWYvkpU2OiPB8c3Bj29wmmClzKwuDlXmRR7aHeHtxSr2aar1yPN30Pgzf9E30oo9iUH5CkddOT0+yppLZdc7MoArWdMgmPOilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by DM3PPF9623118BD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Wed, 7 Jan
 2026 05:04:22 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 05:04:22 +0000
Message-ID: <30bf18ef-c09a-4719-a0ed-0c20d49ce7e4@intel.com>
Date: Wed, 7 Jan 2026 10:34:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/kms_content_protection: Re-create
 framebuffer before each modeset
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260106102207.2530864-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260106102207.2530864-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0274.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::14) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|DM3PPF9623118BD:EE_
X-MS-Office365-Filtering-Correlation-Id: d85325bd-fc18-4a33-aaee-08de4daa37d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG9yRm53d3VEdC94NWRrb1JUbzNHdEZlWUd5VE94TmU1a0RWd2tpNHpVS2FM?=
 =?utf-8?B?Wm5CWGh6dHF4OG5KV1Z2SmUxN3ZobzI2WkFsVFBJZmoxM2d6cXJIOU5TNzRK?=
 =?utf-8?B?ZjI5S1dFMGNHS1RqMml0NG5jZUtUcnJqSkJGbmVCZzVtZEI4L0JLYU5GUkcy?=
 =?utf-8?B?UUovTEdMY1VwOVI2U1BlN3owZzhaQkR4UmY4dmZyMnRNRVpaVm82WE4zT3d0?=
 =?utf-8?B?emc3SCt4R0NScTYrQVF5L1F1c0FFSzBwRlN3d2lXakRzMEJPNzRyK0pYREFl?=
 =?utf-8?B?SnpKOEhZQVNVZitDUVFYbmNENWZpVHBzZ1ZsTzR6MkxKMHdpRWJoQ3d1b0xB?=
 =?utf-8?B?OGFFc2R6V3lBbzNEbit3N2p4anlzQU5vUm03eW5YVGNmZG9zT1AxQlQxbmtT?=
 =?utf-8?B?UTd5NXBFZElPY2lvWVFXZ0I0L2xVRHpXbWhhOG9hOCtBMmtQc1pHSWJrdC9l?=
 =?utf-8?B?NnNYKzZRWThkbVB2NjBXOVZoeUxIa2lnbkhhQXFrd2lXNmp6aGhCdWplWkJH?=
 =?utf-8?B?Z3dJSVNVZVVVNkM4ZGM4ell5aVNPU2VWdndCOGd6WmxKa2VrZkloVUphMndS?=
 =?utf-8?B?dmhIcElEWmI5dkgvSDBJbWt5L25RdUkrbjgzZXlGL05kRG1aZllQL1o0MmpH?=
 =?utf-8?B?Nzg4QmpMSElLamEyM2pZek1vZ3pBenBTU2Ftb1Jtb2h2RWVOcWZOSURkZWFP?=
 =?utf-8?B?QjRNUjg4bnZMMERGM2dncUxhb2RRb2E3YWtMclM2M05oSTRLd2JoVzJDeWY0?=
 =?utf-8?B?YU1kL0prdHNqRE9vWEU1aUR4QXNwelNjZG56QTAyQ3JjQXVCTkkrVzhPa0lp?=
 =?utf-8?B?SDNaUkhMQ3lxS09JUUJuQ1JnQW1VbU5lQjJFWkpXZFVaQWpScldSenBKVVVz?=
 =?utf-8?B?UGZJWURSSHRSSS9OUVdwaW5jU0V4K3JXQmhPUytZODY4OUxYcWhrSEZFTEU2?=
 =?utf-8?B?QStVZ01najlTSGFXR3JLTlNXYzMxWmY2L3B4QURaazl0RlliWUtFejBMYTJX?=
 =?utf-8?B?ZGRFbUlKamFtenZ3VU96TTRpcTdUVzNSWURhc1pGTnRvZ3B3WGoxM2d4WmFw?=
 =?utf-8?B?REM4Q1Nvc29Nd3ZvSXVmSjE2bCtIK3RXbVJvM0hXZjhlN3QwVDVwRGU4ek96?=
 =?utf-8?B?NFhaS0dnUDRZYWI3bktSNEdCUnNBWTNONVpJeXV2OFpsbHh1cXpEY3lwVGNU?=
 =?utf-8?B?ZTVtcHdRWk5iVG9KbmM5bDZCNFlRaE93NWE0RnhMOW5yTisvalpyd3h5SGJP?=
 =?utf-8?B?OXZiZXd4NkJRSFNNUFcwVFluUWovRkRSMERiUHkzQXFiWGJYTXJyazVDdTlW?=
 =?utf-8?B?WjRYY3lGZGM5REZIeVN1VVFHb3lXZTM1Q3BZa3M2a1VBamNCTzVVR1FOQVlp?=
 =?utf-8?B?VkwzbSt2Y1EwdWhUeEtkdzdwcGRadUh1aHo5V2VyUVI4aHVhZmRsaGdqNFFN?=
 =?utf-8?B?NEdRbjJUVTlibVNuY2hXTGw1WXRoVlBFYUVBM0J5Zjd5MmRublpJdkZ2dExL?=
 =?utf-8?B?YUVzMFMvbUxaVEZmMGhCSEdxTjl3R0JuOHU2THMvQ3ptVEtZQVlRTWlHVXVB?=
 =?utf-8?B?WHEveTQzSitubDhObnB5c2JzSElZaXYrUDg1TW8zcGxBeExyUjAxYUN2RFVh?=
 =?utf-8?B?b1pSalZTZk5kZ2xwSlpWK3BaTmZHeWlQWVhzQTRkQWtkZEJFSlBqdmtuWWNa?=
 =?utf-8?B?MXZpWTJIaGVxVzlXdTJ2dEVmM1F3L252Tlo3dUhyVm1XMXExYkROOTdkd3lw?=
 =?utf-8?B?R0hNcDNqWmxkZVZNM01OVkxjV1Q0eVFsdnZkc0lLU0Mrak9vU1ZXWXkrV1dD?=
 =?utf-8?B?b21jRDl1SmRuMmo3aEpvSkd3b0hEZFovT2kyT1NOSGx5R25zRTlvQUNOTjlC?=
 =?utf-8?B?Sm1wKzIrUVVqdHd6S3dnRE90RnJPN214OEtDdjVFN1Z0TzVkZGR5b2ZSMzQ0?=
 =?utf-8?Q?An/tcq/5bYm4rd2E3ABy6jcn5Nc/nrEx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(42112799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm9hcXJFVVRZWjdoV2dQU1dUZk00NkdQTTlVTzNjd1N1V3NHbnE5UkQ3S3Z4?=
 =?utf-8?B?ZnlEbzA1YlFVWTE1SWZCckpPaDRucW0wZGM3WDd6QmVqZDdBcDZldGxWLzRj?=
 =?utf-8?B?OG1TZXJBTXZCUUJuQUpFODJnc1FoT1JLZ3hUMnFnR0NQU01LTk1uMFh5bUJM?=
 =?utf-8?B?SzlMeGFWOVYwY1lDOWNNK1k4RXRSWE9vdkxUeFJHTEtXUndPL2syYmJ5ZXVX?=
 =?utf-8?B?Wmppajk1Z0VIdG1NUTNTdnlneHBFYm55Z0M3VUkvMXJOeHplN3dlMXlFejh2?=
 =?utf-8?B?NUo3Nk84YlJ0dmpUdnhvZzhYQkc2RUtZb2tpekU2aTQyOEpyUThiOG5nQkJy?=
 =?utf-8?B?dXZPSzZqNU0xUk5YM1dyUng5cGJGamhlMGVmL2g2QWdYaklaYUZ1MjJ3N3ls?=
 =?utf-8?B?NDZUaWFBU0lUcFdtNklhbGlMUzVpSmUrdXU0YUtyUlpYSUp6RDY0MHg2NTYy?=
 =?utf-8?B?THRhVXFCczFpS0x0U01QT3dVeFovVjdHZ3JuajZSZ3dJSGtHeUZJOG9XYmZZ?=
 =?utf-8?B?YTQxVlV0NDFDaVNlMmdubmNMVHdEZU9GODZKcmJSU3BMZDNyMU9yOWJXUnBI?=
 =?utf-8?B?ZW00YlZVM1dBOXFpcTM5aGlNdzBDSUc5R2N5bkloOEpkOUx3N0dPcll0ZzA4?=
 =?utf-8?B?YzhTdHRPbzlYMmpZcExiNmhycGV4MzNWWkVOM3lLcmJ0eDJ5VDJvNVYzMGZO?=
 =?utf-8?B?eFFoRDgxRGljaWpFRkdGbW9PZDFpcGpyRHJoWTg0N2tGbTY2d21jZkFmSitS?=
 =?utf-8?B?YVh3TzhJdXhQemEyaG1qVGlrR2ViSVc4SU9oemFvWVpFdk5OemZ4UW8rZlVO?=
 =?utf-8?B?ZmlUcVpBOVgwOFZqYm4wZW1tU1VsY09vV29GWHdOUVFMbE5uR2V3NmI1VTF1?=
 =?utf-8?B?Um16a0kzLzZXTmtRWWx5cDYvaWx0VExUR1dPckorTzJVQmdpWklJejl2N3R0?=
 =?utf-8?B?NENaRi81THVjTnJiRlRMRXFuS0xuTXhzZU42YXpWOHREZmNuZXZwZ0l5VmZv?=
 =?utf-8?B?OXF3RXFGN2VaQ0c4b1ZMZ05KMnRQSHdxQnRSRXdScWZBN09maGw3SFpDWHlD?=
 =?utf-8?B?UmtGS29pZ3VUbDA4OXR0N2hqcDZ5ZFZ0RXFJc3FPZ3NTdSs0QzNlTThPYXp3?=
 =?utf-8?B?YWxDcFdrd3pjRkFaaFVhVUdGMVBiZ3dsNUJmTUh0YmdVRzhUUGZZdU56V1BK?=
 =?utf-8?B?ZksvS21LaUFxamJnSkNyM0JIaU1JV1V6dHdaRWV3aHE2a3Fhd0RZeXViTXJl?=
 =?utf-8?B?bjFNb2x1MEM5Vm9xL2F3VzFhSE1CNVFlR2EwVWVhUkk0dHJBZUhaSlowNUZX?=
 =?utf-8?B?VnNDVFFBR1dFQ0xRYTJkeFB0NUVRV2YycFhZY2s3YWhacUVKdGI1OXhIUHQ5?=
 =?utf-8?B?SG1hcFAvaEkzQS9vS3plR1g2ZjU1MnU5TGtMeWRiRzB1N0k3MldYcjFEL1FI?=
 =?utf-8?B?MmVjU25EN1l1Unp6TjhzMVI1R2xnUEFnbGpEWWxQb0h2eU9tVTh3ZERIRHM1?=
 =?utf-8?B?QXZqbEJhVmRROEJxNjhyYnp2aEkwL2pjcTdPWG5FOWVSY2poNEpvaTh1Njd6?=
 =?utf-8?B?N25LUkVIZTQwREphUnNpNFh0TnlIUnFTWWxQQjc2bFBHMzQ4QmNlS01ybEl4?=
 =?utf-8?B?OXNDbFNwd1hpTFFpbUZwejZPWXhYU05aME9WYUVCZi9aL3dHd2EvWU1BYkV0?=
 =?utf-8?B?RXZrOFZKa2R3dm1pbGZ4QWw2dmVvWmtWMUhzd3E0UWZkdTFvdVIrWlV5VVUr?=
 =?utf-8?B?K09qWWRTaUpDQS80ZzA2dld5RmV2Qkdxb0FiWkIzZ0gzVTdrUGtYb3JOMmZR?=
 =?utf-8?B?N0FCamxsQnVmN2RWRGlCcHFKdmQrQldUMGx4cEZ2VWhSWUVJdWFadU80UWY4?=
 =?utf-8?B?VTBCQW5QOXAwVkpQWGtrVFM4cWphRC9NcHVsU0taZURCZmlNWjZzWjY1RGVY?=
 =?utf-8?B?anllY25XV1hURHdycDZJdFhMUEVteUdZUDQvZTE1dHdJOVZHSDFGZG1TdFRy?=
 =?utf-8?B?UzM1amtFZUFCMUdHR0REQ3JWL2VqNEZ6a2pQZUY1ZGNOZUIyU2Y3Q1RlTzdP?=
 =?utf-8?B?T1pXQnZQUVNuZTlOMG5scFRBdElqbDBDZUhTMjFmWHFoZW1qWDRzV0ZRNFRa?=
 =?utf-8?B?dTdUa2JaT1VSQW1NbFNvN3loYVl2MC85bWxvQ244RG4xeENXU2txc2RXN3Bi?=
 =?utf-8?B?Sy9VVXdxZkRZRkZWUkxYK09leHdsb3BaZU04T1JHRC85VVFtV3VCR04zbW9S?=
 =?utf-8?B?SFdvaTQvRVY4YnNpWFoxYkhISGJVVWNnNFdrZW40cVFxVE4zOEJLZFEwK0k3?=
 =?utf-8?B?TFlib0FhR2VaN3IvUVo3NThaOWlQdUtiVllWaVM3RXZmR3Bxc2tDQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d85325bd-fc18-4a33-aaee-08de4daa37d0
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 05:04:21.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hdahi+LpmS60s1EGTAqdlrHHW9CIuVhcTPolwxUBXskCj3gMxYkiLTu6jkFjCcZJYbwBpe3nwlugT8iWyB94cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9623118BD
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

Hi,

On 1/6/2026 3:51 PM, Jason-JH Lin wrote:
> The red and green framebuffers were previously created only once at
> the beginning of the test. If the test runs on multiple outputs with
> different resolutions, the pre-created framebuffer's size might not
> match the mode of a subsequent output, causing the modeset to fail.
I see that the test is already creating fb's considering the max 
width/height among of all the available outputs, so ideally this issue 
should not be hit. Are we seeing any actual failures which this patch 
fixes or just doing this as a fail safe?
>
> This patch moves the framebuffer creation logic inside the
> modeset_with_fb() function. This ensures that for every modeset
> operation, a new framebuffer is created with dimensions that
> perfectly match the current output's mode, preventing potential
> modeset failures on systems with multiple displays of varying
> resolutions.

If we indeed see the issue and go ahead with this patch, fb cleanups 
need to be handled for the additional fb's created. Currently we are 
doing fb cleanup only once at the end of the test.

Also we need to remove the existing fb creation as it becomes redundant 
with this change?

Regards,
Karthik.B.S
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_content_protection.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 377bab9a3afb..980091871679 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -250,6 +250,13 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>   
>   	mode = igt_output_get_mode(output);
>   
> +	igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.f, 0.f, 0.f, &data.red);
> +	igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.f, 1.f, 0.f, &data.green);
> +
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, &data.red);
>   	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
