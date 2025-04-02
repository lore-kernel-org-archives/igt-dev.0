Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CC8C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 10:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B4B10E73F;
	Wed,  2 Apr 2025 10:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0iyeqGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571B610E73F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743589617; x=1775125617;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+lpXKpMWD994MzSc1GZzHJEO6tCPGZvDxyNGCw0DKQE=;
 b=J0iyeqGwV5MoF0kOTtYCK/qqAR2avGOZlZUQz4WDLNtrRYpkYZcdzxp5
 dTjvTbSnvSeVB9/wwhznYq9rg3UyFlWFzq0L+BmQIJLiZtPT86sIv71LE
 h4leIMcYy/lpHwX/yWSzcsNJHplW++3HVJrNufaGzvVK/Gn250bEZa2Hg
 y6z3VeYulyqFXwsuaCUmUeB9kjB3JxTsrPakhF5OCcfesDbC/mv0k9I/S
 MZbSL1RCqG/eDGS1NJ8jvN8HCR+mOHqLF4RMenM+4arxY0TJ4RHuSVNJB
 8NCX4G6eqc2IDiaV4+s/jWyg6b7SKr9JfWBvJnrCviGBbvDn/JwlIzr8f Q==;
X-CSE-ConnectionGUID: EUE4ccYcSp23t4XJYaIl5A==
X-CSE-MsgGUID: AVyfrnA0Seir92YvtfAJ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70310715"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="70310715"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:26:57 -0700
X-CSE-ConnectionGUID: VaYo//3fRJCFPcO3JZH5Gw==
X-CSE-MsgGUID: xqIOYW6sSbuc8OmgM6oXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="131786248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:26:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 2 Apr 2025 03:26:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 2 Apr 2025 03:26:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:26:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uc7r67yx7gKFlHrs2QY456twtJenlRJVqKp7TuwBeE815jizAt5yv5NmGxz7M681BHWS47iNyci+VtFNWQbW4/jrIKOL9HjSmquO+S/wvwKyY4vlb0T7R5EYwcqFyIoVih1AosK+F2ontwKuMQHiwxGypSxWW0TJZE+h4l00+gEJV3/REfees/M4+2WdvLVLc1Ga3RPPrLYRY/hXTy9EffzMHwF9bVaJfoFX7YrXrGAFdqHBKkxFsu8d83UGulynavIhse6ZGPEVn0bu+LS9sKj+nH9TM9gNLmzTzG0pRggBYhrw0yTpoFkJJ5787FiUadrPRV7OBe/CZ1WLwXXtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppW5QskNDFDsUftuf28vsVkbC76ol8tKvwDG1OlSM3g=;
 b=CO0znHX+n+dZLoo/n/ZM7p8IAsYzEmmEWqRr4csR9InDXqLsRM3c263wb4roWx+5RpMIKWIjefcoGsYnRcF7i/3xgDsOI0YJyHfCud9adTpb1sxkyyUvpHy9Xj7DuefdNTeFMB3I/wcy37MjmF7cRO5y+BvvjcEu15NLGs5FSNNkc6oOyqbZ0twGr4r4UEC863jPhQehBiTANXyawek9LZpCE6YTrSEMnNbuQF/HPHzQYhoc+cRRFi2tjxiG7TD+SNLVvLW8wZKsSBc0C/+RMOuQyaNvAGTOgyg4aNpspU/foF5+J97YovAuHWKemSJ1D+3srDk6THF46kpaQZJtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ2PR11MB7647.namprd11.prod.outlook.com (2603:10b6:a03:4c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:26:27 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 10:26:26 +0000
Message-ID: <8ba86f20-f486-478e-804c-2127e3b40081@intel.com>
Date: Wed, 2 Apr 2025 15:56:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_flip: Add flip-vs-dpms-on-nop subtest
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
 <79f7f21b-cbc4-46c4-ab61-c214a6169f95@intel.com> <Z-wTSwYb5mg1R1Qp@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <Z-wTSwYb5mg1R1Qp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::24) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ2PR11MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db6ac62-4aee-4395-bd8d-08dd71d0d313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzBFb0hSNm11eERKbTNIS3dPb2t0SGdOUkNUaURHZ0VVc0F5VzlWTC9odUVO?=
 =?utf-8?B?dnB3SHY3bzdyZHF5bk5BZVl4ZlhZTk1LZ29KWmwrb0phUnRBdkRjUENmL09u?=
 =?utf-8?B?Ump0SDJYMlpwU1FoemM1ampzdGptRU9GWSt0NEt2VGVlV1ZJdFQ3M1M2Smxq?=
 =?utf-8?B?MkJyQU5ZRFg2NTB2QlZoQTg3MERoNE53Y3B5RUNZd1NSWkdtVzZhdFU1VFVu?=
 =?utf-8?B?djd2cmRMbDZhK2pubXIrL0RvT2IzTjNvUzRMMDYrYXZkMElxNWVaODBzMHVL?=
 =?utf-8?B?di9rTU9NRjMrZElXWitPcXRJZUI2R29sczZPVXpVa1BxOTNFaFNremZ6eHZT?=
 =?utf-8?B?SnBvNSt2QU9PaFIybFByVnUvcEtud0RtbWpWQmRTVGRqNExnbll2aDI1cVNF?=
 =?utf-8?B?VXpIdHJOYUdrK1J3RVJ1NUQ0RENnYWZ6L0VBWFF5R3ptdSs3ODVYV1pFaEZS?=
 =?utf-8?B?L2ZFeHZ6TWRuSHU2UElwTEZ6ZHF0bkI3TGlaWFBTeWJvdzZjZThGVmNPMmNL?=
 =?utf-8?B?WUdUMGFQT1VsS3Ridnk0a1NIZFcyMVN6ejVOVnVPTi9odGZweHdRc1JsU1RO?=
 =?utf-8?B?c0lGSkM0Q2NlajdZWGVGNlVyZDFHVDMwNDZmeS9ON2RiOWcwSTk2aEJEMklT?=
 =?utf-8?B?c2RDUHZ0VDZFL1YwbUVLY09reitBOHZRb2hKeWxoa1ZJdXFFalZwNmxJajlB?=
 =?utf-8?B?WFhxSWpxSmE1dGpvaUZyaVZ0aUlEVUFQNjNWUFFSTHljMklQbU5wc2lGc1R4?=
 =?utf-8?B?QU9nK05od3IrR3NGdHRRSmdIMXdPM1RUb2NwSmVHOEJTTGRNbFZHVm9pMDhS?=
 =?utf-8?B?dHlyY0J1bTJxQ21tRlIyVDVPSVhDZkRhVEVwYzdKK2pDdk5aWEZ6Y09GSmIx?=
 =?utf-8?B?aC9YZjZ2U09SQW1neUh5ZDJnQldxUmQvc3pjMTNMelJud3dtSzFuZUIzSkpp?=
 =?utf-8?B?UTBpaVdabEZoZTM1czJJQ0NJR2hkdXpUT0lvUEhiVDRncFN4NjBMcXRLb21y?=
 =?utf-8?B?Q1RLdm1oREFUNlcwYWw1a3NQNkZWajZnZnpIdWJnMDRGV3docFBpaGloc0E5?=
 =?utf-8?B?dTdiVG9TZDloMzllc2E1VnVnOHRNbGYrVkFIVk92eG1DdXVSeTFrQXZwK1VE?=
 =?utf-8?B?amFRT2JJTTA2UmxGNFRPYUIxeUVqK0xiV2piQnRMREloTVN2RFVPMXh3RDRy?=
 =?utf-8?B?dVRubURWSjROVTFDekJMWHhPalNVcVdYODdnaXowTDFheXI2aG5veFpNVWNF?=
 =?utf-8?B?Q3FreTNCRDNXNlBRZUxhZitmb3pHMDNpM2hKNjZtUFAvZ0kycjNha0NIRUVk?=
 =?utf-8?B?Yzl5a21XQU1VOFVPa0lBZnVUaGZXNUVpSEN6RElLL2xCUjNhYVJ2eFhKWG0y?=
 =?utf-8?B?WlNFczhCeVMzUHFFZWYrZkxsWU1naEEwblM4eE85VTRTdXRNUmZrTENoaVRp?=
 =?utf-8?B?WjNIUkpBTWJqTVc0eFZIcllja0JpU2Z0OGV5L1BSYTRoM1cweG1jamo3ZzR2?=
 =?utf-8?B?eWZXVU10YXIrREJiN3B4YzEwcmhDbkIwbnJPU1NTUndsUUVtRUZ2RGpiUlFo?=
 =?utf-8?B?YTE5UjNhSFBLVktPRERiZ3o5UUhyYW85SjdZL241NUhZQXZ2S1dMcjF0K0Vo?=
 =?utf-8?B?bkYyU2pkWktFeHphQlRrZzljZ2M3S2hsWGlUK2NTS3ZuRWVyR1pqeitwc3BP?=
 =?utf-8?B?Y1l3Z2VuMnVVcmdidG1QSEcwR1RlRmdqRjhpUUdYUXBOT2Q3bzNxZ3dzdkFx?=
 =?utf-8?B?UER6TXZQZ1U0RU0wQzFXek9NQ0VrVHpyYU1USzFUZHcxalFQL1VNK1hzV0sr?=
 =?utf-8?Q?PwtGN5IiUDaK3bDaBpVtkoSKjpYwI9HslwTjY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGIrT0hJZXY2dm1sdTVIT3BhMm9MWmpORmNxdW9Cd1lzSUttZjVYN21Oc3NO?=
 =?utf-8?B?OG00VVJ1Y1k4bXAzcFpSMTFXUUNLaW5Ic2FzWkVFTHFlK0c1eUI4eUM1ZUdI?=
 =?utf-8?B?dGlPRmV3ZHlTK2loeEc4NlN0N3pGNEttckVyR2JKUFZuQkhLdmxBVTl4V09S?=
 =?utf-8?B?TmlIODlqRGFNWENLRGtzcEhSVkhjOTNZRDQyS0hVUXN3Szd4YmpROWhGS0du?=
 =?utf-8?B?N3E1NjFaa0V3aGNkOCtrcXRDU0x3d1RKU2tGbnRLcHZFa09iaW1yREJnR2Rw?=
 =?utf-8?B?TGl6di9yYlJDdUhKeHV4MFdabDQ0UXNNMnBTQnJaZ2twVHd5cVhmUFJxeG9x?=
 =?utf-8?B?bFRiNEJYZ0ZsZUZwUVRVRjVlTytqOE9kb2xVUExJM2VkcTQ4TzhPdEliNWhv?=
 =?utf-8?B?ck42SWVtY0Z3Q28ySzBhSHZoZit2NXlVTmQ1d1I4L1RzYXpUYzRZMVF5NmVx?=
 =?utf-8?B?b2dJcElkSGJQREhBMHJaNVpKOUx5SWduaFlzRHNTTmMvanRhbDlabi9NdkZ0?=
 =?utf-8?B?NjJ3TDNqQVpOODYydHgzNlJKNjcrWEVrdkdRUk9xeExYZVk1c21wN2VQSDN6?=
 =?utf-8?B?T2JhM3NQbE1JVHJsdVpGZ0RqTDZYbFdtRnVaWEpaU0FmdU96bWZyc1UvdkVa?=
 =?utf-8?B?c24yUzdPNUVXNjNBOEdQY3FWbmdBMXJyb1hjNUJiZ1Q2RzRwZkNqNXUwZzZX?=
 =?utf-8?B?YmYvR0NJZlM2ZU9SZnJxNkwrSXZzRUlBL2dUWmFXVXhabTFBRWlsZE9zUG16?=
 =?utf-8?B?OER1dVAyYXB1TVllZXBxK2RsNmZ5OXpzeFhZRzAzcW4vTi9ZV1lMUDdkRFFH?=
 =?utf-8?B?WllBUFZiL2VvUlg3L2FjUE9KZE40blpaNks0N2NPaytuTG5FUmE0Zk84RWE3?=
 =?utf-8?B?MHh4L01ndU45QzczZkpaRWczcVl4Y2tiWCtVM0lOd1JFRVAxUTRLdWJ4M2xK?=
 =?utf-8?B?SUtPSTBvQnRBWU5FbHV0UzE3VmwybEJuWXVGNHRNR1pneENFanNMMGZOQkVC?=
 =?utf-8?B?U1ZqT2NNak5TVFlyNWJWQWkxWlFLTTYvblV4enNnekdMWE0vaWVOMnJhSWI0?=
 =?utf-8?B?eEpsVU05Rm52UlZMWWJPZzkyZVFRV3ZYQXNRVVIwd0Y1Q2hkOXFVUHJEU2Y0?=
 =?utf-8?B?QnhCaTJKWDhWaEhhK2RhbE1relFyOWJrRG9lUWJpc2xFdFlhSzJwTGVqMDd5?=
 =?utf-8?B?SDI4NHV0Z0RGR3lLbktGWmZ0N3RKZ0RsNlA5a0RIWFRmU3BLV3o3bEtBMkkr?=
 =?utf-8?B?dmRFUVpKWUlRYW5tL01iUG1NTThSZ2t5STgxVU8wRHhoS2VJWS84VGhib3U0?=
 =?utf-8?B?NXRBYk9pOExhOUVEVEVmano4NVU5SnFvWkUweDM5eGdDVDZDMk5QYWhVNUVH?=
 =?utf-8?B?ckF2MVQxUlh4MVBlM3JZNmRGRFIzZ3dWZUk2ZDNERG1oNWNmbElVUTJDVnZl?=
 =?utf-8?B?bG9IRndOMjlKY0dzVXh2V2x1ODVobytrWGxGZ04yK3BIUjZmaVdSc29YWkE5?=
 =?utf-8?B?WDNwd3NEVG13RktUeExFMHFCRmJMUWZnNEdWWXRDcDVER1FCbFZoUEM4T2p5?=
 =?utf-8?B?dWpvR05qYmxzYlFIa2hhR0Rlblordnd5S1M3S09QUUtwS2VsMXFBbDA4dVNJ?=
 =?utf-8?B?U2VVSFAvWHZIVGlXK05vQzNwTndLQnBELzNDMWtqV3BOOXc2eG1GenlwamZw?=
 =?utf-8?B?ZVdodmE2ZytRUlZRNFpnUDZqZnQ4QmJ3T25sdUNTV0ZISWIwdmxQbXdUY1l4?=
 =?utf-8?B?dURZaEtPM2tIYWZGZFlTdWdWNHVtUVVyeUhmaEoxOHo2dkRmVHdrWDd2L2x5?=
 =?utf-8?B?Q2lGS3JIeE1wQUEvSE44RnduRytvK254cmVBUEZtNDA3aG5SekNVSlBMS25w?=
 =?utf-8?B?a0E1RFdLaFVISkdCQ0xYdXhrUDBObVlSMkhVS0ZSekMxb2VlNlZlZzNsaHlV?=
 =?utf-8?B?bFRYYWZMV2hzQW5wM2duaHUrYWVPRmlpZkVDam5ONWk2bEY2T3dhczA0MHFT?=
 =?utf-8?B?UU8yeThaWmZEL0hNR3VldVpSWUhRUjZ2clFDVUorWnVQT3U4dnZQUi9YQlI0?=
 =?utf-8?B?cGxPa1RNNGtYdUgrUDVSMGkraWtWaHIzMjJhVGpPcVM2MHM1Q1Q0cW8zZGUz?=
 =?utf-8?B?V3FPaERDWVVGZkhZK0dIRmZrbXdzWnRJek0xaTdNYzdtdTdDVXNwMDFLU3pX?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db6ac62-4aee-4395-bd8d-08dd71d0d313
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:26:26.8357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lz+tHFcKtlScgEmyAVl1hOjgAWP7LNlP145rVzPgt/t82iXCA6BNuBXU9n5mxdgUVseEaHRMbePf3DJBeW/HYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7647
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

Hi Ville,

On 01-04-2025 09:54 pm, Ville Syrjälä wrote:
> On Tue, Apr 01, 2025 at 01:44:16PM +0530, Sharma, Swati2 wrote:
>> Hi Ville,
>>
>> Since this test is failing across all platforms.
>> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12687/shards-all.html?testfilter=lip-vs-dpms-on-nop
>> If this is expected beh, do we need to modify IGT to handle this
>> negative scenario.
> It won't fail anymore since the kernel fix is in already.
Do you want to add this test? Can you re-run to know whether its fixed?
>
>> On 01-03-2025 01:12 am, Ville Syrjala wrote:
>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> Verify that redundant DPMS ON requests don't result in
>>> actual commits (and thus frame drops). This behaviour
>>> is guaranteed by the kernel for atomic drivers.
>>>
>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> ---
>>>    tests/kms_flip.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>>> index 3ad4d0afb1f6..59740aca25bd 100755
>>> --- a/tests/kms_flip.c
>>> +++ b/tests/kms_flip.c
>>> @@ -176,6 +176,7 @@
>>>     * @single-buffer-flip-vs-dpms-off-vs-modeset: pageflip of same buffer along with
>>>     *                                             the modeset and dpms off
>>>     * @dpms-vs-vblank-race:                       vblank along with the dpms & modeset
>>> + * @flip-vs-dpms-on-nop:                       pageflip and issue nop DPMS ON
>>>     */
>>>    
>>>    /**
>>> @@ -240,6 +241,7 @@
>>>     */
>>>    
>>>    #define TEST_DPMS		(1 << 0)
>>> +#define TEST_DPMS_ON_NOP	(1 << 1)
>>>    
>>>    #define TEST_PAN		(1 << 3)
>>>    #define TEST_MODESET		(1 << 4)
>>> @@ -957,7 +959,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
>>>    	if (o->flags & TEST_MODESET)
>>>    		igt_assert(set_mode(o, o->fb_ids[o->current_fb_id], 0, 0) == 0);
>>>    
>>> -	if (o->flags & TEST_DPMS)
>>> +	if (o->flags & (TEST_DPMS | TEST_DPMS_ON_NOP))
>>>    		set_dpms(o, DRM_MODE_DPMS_ON);
>>>    
>>>    	if (o->flags & TEST_VBLANK_RACE) {
>>> @@ -2020,6 +2022,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>>>    			"plain-flip-fb-recreate" },
>>>    		{ 30, TEST_FLIP | TEST_RMFB | TEST_MODESET , "flip-vs-rmfb" },
>>>    		{ 2, TEST_FLIP | TEST_DPMS | TEST_EINVAL | TEST_BASIC, "flip-vs-dpms" },
>>> +		{ 2, TEST_FLIP | TEST_DPMS_ON_NOP | TEST_CHECK_TS, "flip-vs-dpms-on-nop" },
>>>    		{ 30,  TEST_FLIP | TEST_PAN, "flip-vs-panning" },
>>>    		{ 2, TEST_FLIP | TEST_MODESET | TEST_EINVAL | TEST_BASIC, "flip-vs-modeset" },
>>>    		{ 30,  TEST_FLIP | TEST_VBLANK_EXPIRED_SEQ,

