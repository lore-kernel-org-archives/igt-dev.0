Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B8EA3F3A
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 10:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F6C10E550;
	Tue, 10 Feb 2026 10:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Osj/Xdpm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9F10E550
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 10:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770720993; x=1802256993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V0OJNUPGT9V8z46tzv9qM7OlQoNwUeto4VfA+F7bfj8=;
 b=Osj/XdpmOqiFY/MnM+i9JVcJN4gUJiArJW27QMU6fC7shKqgI+pJd0cE
 mIDgpl4qnklVU6y3B/OazcVO0qPvOE7B+OmbbwivIgVUTzf0LMIAOnK2T
 RNlTxHGc6uVMZsVafWU5zcNc+gbgXcWZrWi5f5me72dp1ucww7e6NxY8Y
 pAL7wUOw3n2W4fRL9DCjOUKZG/Fqx70c/W+4TBJ20J2IJJMGlNpfBoiVg
 5ELvEqTsnuzCptCFOaH0nI6JanMClaDbUKU0J2u6QXBcBm8gL7TTldHQM
 7giyy/Pxze1FecurQcj4kCdJWfHrq8RRz2w9Fvdu3m4fYmQHC+9GuZQK9 Q==;
X-CSE-ConnectionGUID: TESBHyyjSy2Q1mtk+Nmoeg==
X-CSE-MsgGUID: k84PW8ElTfyXPpphx/85iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71832836"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71832836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:56:32 -0800
X-CSE-ConnectionGUID: CqkHF2DRRBOPHvZLLzekEw==
X-CSE-MsgGUID: ylqUxOEASHyI2Mw19Z7rVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="249529920"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:56:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 02:56:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 02:56:32 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 02:56:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mA5p6/889e6WLN4gYfRAFnraonxJoemXrPDcXe2IQqPzNBMNTFZZ+A5/aO7pJTBPQIC9opsLd0EDRcUfKuZ4mQcePR32a9le5Jh7irnKCLxs+uTx4oYSULFxiD3kGVJpdpZcrqJIPF9oRB+84eyXjDZo7yqJnkXScAgrVjhu/SMivwFKCZrtMolFcUrM/2HauB1Xt1jW0MdIqoExO+TVGZYmuDr3pNS5Lcrcy8XsxwthTl6L0byaQF5tJuZe6VzzlhuJD2EZraALsTvs3sYNrnVh6UkewAa9p4Fgc10sNUgcfWrpyE9o+MygSDpV3SZmAh1R+rdSYB5dvOVpdl6YEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIVP2Iby2AERRl8G+YV0gSDACvwRoXMEYjR7jr+36mU=;
 b=DBbmicBrywzczEfIXmc+btrpS+QEvL4RU9oNjt4cLqGUmcgKkSVAO8oviQ6bNqpe7qPRpK/lRaSpy3IpYvuq/kQ+81BhsCgqmVb0v8UpdqttJTLAIcm1xES1tLK+tHt/FjO+FuX6C0di2WJqs2FFodu7nOB8+OXuD2YFKi6hxTVOOn8aFtnj4HBr1hoT9mj0X93v3GB5DvvaR+wnd2Hyrp/WlPWS0XWvFXbVotOP+th5P/ZgOhwTUQ5iMUfeaVaOBZkvsDRRw59Fj+XKkvPiM2LGagiarOPyhDnL1VaJqhhS0TF57XDMELDvx74oBziaYbPDCmZz24D3SLCfz8DOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 10:56:29 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 10:56:29 +0000
Date: Tue, 10 Feb 2026 10:56:18 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <kamil.konieczny@intel.com>, <zbigniew.kempczynski@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v8] tools/gputop: Add GPU frequencies to the client
 headers
Message-ID: <nyos3kinfomgey5wpsxhbma5vbs47l6ave7vptlx7cdxaqw76m@wvuiv7ligaol>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260209101835.3899129-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260209101835.3899129-1-s.sebinraj@intel.com>
X-ClientProxiedBy: DU6P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::17) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM3PPF529E923C8:EE_
X-MS-Office365-Filtering-Correlation-Id: 9873f788-feef-483f-398c-08de68930af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHE1TWNYYU5kRmhtWjcvbHRMMzJlL1k4am1BWGJ0eTJtTVBYbEpJVU1qZDl5?=
 =?utf-8?B?RHVtZ0w0b3RPTDFKcW9jbWN1ZEVnMnhoRy80WWdXTlVHZS9pZkhnYWxqRFVh?=
 =?utf-8?B?ZlNPai9iU21JVEJFN2UxTmpaaWcwTHREQWR6TXcwZlRKOXJnUGdnMDhCNDhX?=
 =?utf-8?B?QU9qUnhzQmVXKzJ3ZWY5UWsydGpRMEJWSWtCZkNTSmZLbHFPWWVCem1wb1Va?=
 =?utf-8?B?RnRoOUw3QStuU0NWUGorMTA5RjRiSjNSdjI2OG16b2JvMkhvNUVSZld2S3Q4?=
 =?utf-8?B?NXFIODhCRnBVdnZNUUdNR0tkbHE0UmI4VFhYK20xZVZ0Q0ZGWDl1MW11clJB?=
 =?utf-8?B?OSt2VWRBTC9TS0hNb3hLUzdCcGJqdmJhODczZVpRdVV5azRiS1FJK2Z5clc1?=
 =?utf-8?B?ZTdpaDRNektaREJXUkM0S1JuT1l5VnIxZ3BocFpMcTlyTmZ1elBNcGl1SnBQ?=
 =?utf-8?B?eDlENGJNS0lXbys4WUE0UlFXSmlDY2tBZ2dqbnZmSmpSR1pzRGFTZ08rb0Q0?=
 =?utf-8?B?WDlxM3hZSDhtQ0hQc3Y1Z1ViSVEwRWZQZzg2UGRqQzlObS9qOFBZbnNtMFZr?=
 =?utf-8?B?U2NkcE44NkRvK1p0MHFxUVl2SnRqMTdwTExCZTYzbUJpTWJhcGNrZGF5eDlp?=
 =?utf-8?B?b1RIbi8yMDk1WXpNOFAxcXA2a1pTaUpHcE5Ic0FMejB3dmVyWTBxWUFuOUtQ?=
 =?utf-8?B?QmVJS2g4bWFvaWE3ak41L2MwcTFBWExSQmkrRzNXOVg0R0M1eGxsbnpRazUv?=
 =?utf-8?B?SDFSY1RSWGhlVGVSL3JSOWJXWWFEUm9uVytwS3NtdnBEVllSRXlvWWlOSWtJ?=
 =?utf-8?B?MFhwTUpmbVJRb1E1eUliUkxnZWIrMUFzOGlTRnBDQXNoMGxjWGFEdEMrUlNv?=
 =?utf-8?B?QXl1ZGcwLzI5WEgwYytMbnl2VVZkdmlFOFdoaFVsWXJadXlMdzNZcUY4cVZp?=
 =?utf-8?B?SUt6QWRsaVRGUzBkSGdpaUJ3S0pzR29Icm5LaUhuNWJ4UTlmWnBOOVBTRlRs?=
 =?utf-8?B?VmRhUUY3NGdOb25vOGhLV1JJQ0lCbm9ZL1IyYUlxZVkrZnB3cDN1ZjJ5TUNi?=
 =?utf-8?B?djlhZTZwZlVKcTE0TlhIZ1BzSm1SYXAxaDlJcmFLRGZKQm1LamVveVVqa2x3?=
 =?utf-8?B?bjUwRmFuN21EWkVaQ1RCUXMrUGRiaFlCeFJzejZ0WWg3Um9KQ3pML1lXRE9D?=
 =?utf-8?B?QTlreEMzemFjZ1pPc2xpQXFOdDl5a2V5WXFBREVSZFVGVk9neEEvYmFCR1A5?=
 =?utf-8?B?N2V4R0VKSkQwTzkwaGZFOGJ6WnFuYXl6VFE5ejFTbkpPVlp3SVlldHRiSHc0?=
 =?utf-8?B?NGhuVmJTNFlDcEhkbDVoOVU2cTFRTEtlSFBGVm5QVXlMWFFnTGkwV3Z2ZEdz?=
 =?utf-8?B?VGdZaitLVEtUU1FUQlB2T1kycEYwZlpwQ0RUYy8ybXcwc3RiQ25nOGs2TytH?=
 =?utf-8?B?aEdlWTRMTHFkVGRqUVBYY2QwRVhmVFFPNjF5TXY2T0NYRElZT0o0MDdhZGZy?=
 =?utf-8?B?QWI3aFkvRHY4RDE0bzZaQXlxTU8vaDIvNk1hU2tnajJzUExIQkpkRkNodVNW?=
 =?utf-8?B?UGhMVTNZZlovOXJ2L2dvOHd0VFZSQ0hPT0hrWjJ4Z00wVXhEdXpFUXZuQUVs?=
 =?utf-8?B?c3VLcWgzMnltUGVFUkxqVFowNXM1bXFjWEF2RWdWZE5hbTYwaDRhMlNzTUdi?=
 =?utf-8?B?eWFHV1JTVVVIQndMQmpnNUtQZXA1RzQ2cWM4MGlyWmlZd2RwbDdlc2ZiVHdw?=
 =?utf-8?B?UWt6U0o0UUlBNXYwMlB3QkVKeEt3VERNUENRMVU4UHdzYUNwUC9sWTNTQmNM?=
 =?utf-8?B?VkU5SXhVY2pVS21sT3hXSTBLeFpmU09WdzlnV2tKV0tiNzVsSFBrOGlyMndq?=
 =?utf-8?B?ZTREZ1BuUUtiRG44VisxS0JUWEJRdmMxSStTWGtVeVVFY01DTkQ1SWloTkI3?=
 =?utf-8?B?TEJydnpQMkhTTmdXUDh0MHpRWGJaWGZmdUpnVWkrRFlhSFM5Q3lUcm40RFFY?=
 =?utf-8?B?Sk14amszT0tHeEFJK0JpMGh4ajB4V2t5dE9TcTVneGVNbHpYL215RFhDblc4?=
 =?utf-8?B?dnR0YVNpMXR4WUhFZGFkYmphQlNBa3ZYVWE3QmRvOEFUTCtXUTZSVEVGR0dq?=
 =?utf-8?Q?7cPI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFtaS9XcG9wUVA5TE96eDZ3ZXVtcGg0MUhGNUMwZ0V0bFB4WjZVWGJ2Qzlq?=
 =?utf-8?B?UGRxQ2VuRVkwWUJFTXdBRUgvNHk3WlI5Z2NGUjhXVDR5M0Z6MFQrNkhBUVhU?=
 =?utf-8?B?NHpiNEpjTG9xRlNuWkY3SW9zeUM4ZlVTdmttclpHL3RhT3lqSWpTMkhuem1P?=
 =?utf-8?B?ZE1TMTZKQ3Q4aVNiSlRFbzlXazViV1Vwa1JDUkZwNEQwbVRxQXR2SFpQazBl?=
 =?utf-8?B?b2gvMHhZamFrMzVDMnN6bTBzR1VqRUxNYWwwOVVyWFNnNXpjbTcrNkh6aWxW?=
 =?utf-8?B?anNmM25ML0JhaDVDcmd6N0pVZW5hVGtVSXdGQ2xQcVZjR3ZvTy9sZnJYOGtP?=
 =?utf-8?B?RFNrRHU0Z3dEZ1lhSnBWWXQ1QVFpekx5QWVoT2UzbG1ncHF1MkNrYkpjZk50?=
 =?utf-8?B?cnhIeWhCRTBBSFptQk1aclJPT29lWVJLNHBpd1JETjhFL1FPOGEvTENGZjVl?=
 =?utf-8?B?SUhxc053cUlER1YvK3c0cm15Q1NPV1BIdTRxbVRKUEVJZ2Z5QTJ6U0NOSHh6?=
 =?utf-8?B?TjlGTzErc2Jhc2ovdExzZWxON1l6b1hHaS9vbWhTVmV3dENMTWdhMjdmQk5S?=
 =?utf-8?B?V1JIeTc1RVhMSURDTlhPNzduak5TR3VUMzhnTUJCYUpWU0NCeDJyWUI1VHVK?=
 =?utf-8?B?Tys0SXZmTjYvcHNPN29nd0RZZDIxSjBHMmxCaVVHWkw0ZGpIN1VOdG5LV2pG?=
 =?utf-8?B?eTRNZllBVlYvV0dETFBoY0N0MjM3YUlrQi9LUjJvL1FYRGx6UlhSOFNLcFEz?=
 =?utf-8?B?bnZGQitLU3F6amFQRkl3blMweUFnV3Arc0E1U0VaOHpLTEJTNFF4K3V1OWtk?=
 =?utf-8?B?Z2xDZnY1blBFYnJvOWl4OHRaRmxnOXFVRWVjQzdYZVoydUNKVkxzZmU3OWh4?=
 =?utf-8?B?NnRPbHV3UTBRRk9la1RpNk1lSlgycGNjTTdXMTcwU2hTYlZzaThjWlp1b3V1?=
 =?utf-8?B?WkN1UmVRc0RYajJ2VHRxdWhWZXVEWExrazFTalVyNDczeGpvek5WOVhCQW1k?=
 =?utf-8?B?UC9rc1UxSmxQenNIRFRudHNwRHdBcm4xeUFPZzNhZWVsSW9YV0pha3M2emtT?=
 =?utf-8?B?SHFoNG40UnNpZXVFbGdtYmU4ZFRvLzMzMVJJL0lLdzVCZ3J6L1BFTjlJQ2hF?=
 =?utf-8?B?dWxPNVdHMkdFSEplNmJZdjU3SGpVTVNQdFdBSVMzSlVSblpmdTVPbDFQQkZa?=
 =?utf-8?B?ZldCM0w0TGZLZmdPREtJck9vclJ4eFJlMkFsRFlKUkVuT0NnMHFWUlUxY0tl?=
 =?utf-8?B?eVpvK2F1cktqeS92VzVaWWE5Umk2ZFNab2VhakNZUWZaSjM5dHlXTjI3S2JT?=
 =?utf-8?B?TVUwV01TcGV1SkNwK0dubmtUbHp4SG8xVTh5OGlxTTJSZlhEeWUzemxFdmZm?=
 =?utf-8?B?MllVQnVJdjljN2cvR3kyQjNPV1FrZFVlWmMzQXlHTG1DR2Y5UVcrVDhVVWxD?=
 =?utf-8?B?c3duSGlPamdZTEx6aVMwekVzaWk3alhXN2pEcWRGWnMveGxPWEFMdE12ZSt6?=
 =?utf-8?B?ZW1KZFI3MVJkR2F3MnRPKzNDOTFtNVhaNlpadmx2cFY5eHRVZjhrdXp3djhR?=
 =?utf-8?B?amljVmhKeW51M1RIYk1XMHQvRHlrOEFUOTgvRXEvZmNtNUJIaUljUFhtYmxK?=
 =?utf-8?B?OCtCNWd2VUcrWktCaldjNjVPOXNqS2wxSGN1N1BzNXZ1YzNic2FvNStWemdF?=
 =?utf-8?B?MTF2Zko3TFZmdU1MRkRmWG11N2NDSFBuOVZjbXVYZk1peVdQRGVGWmp3Uzlz?=
 =?utf-8?B?RXdRQXFDWWJIM1VEOE00a2hSbmlZTmk4MGZ6RmtEa0RjWVRpL3NtTTM0aVhO?=
 =?utf-8?B?ZnlFaSsvVFhXUjNKS3oyUU9EUitCazErdTUyMUQ3cUY3UFZsN3padjJQZzli?=
 =?utf-8?B?WlFkMVgyekE4THRNNXBhTTRFV29PM2ZNcy9QMDN0ZGZYcEpHRWVlbVJXamNR?=
 =?utf-8?B?SmFQdFREZ2NJV0ZGVVhGSVdxbVZFd09FdkQvdEJRWTJQWnFpRnZ2R2RaUGVX?=
 =?utf-8?B?SENDUFRZY0dyVm9tNlQxL3QrL1BoWmhxZFBkZTh5TFRsY0JYWjNCcTdoYUND?=
 =?utf-8?B?aW94WW1kZGV4bHZROUFBNXJnSmpyTFA2dDVJelU3Y1FSRWE0RVpralRmcHF1?=
 =?utf-8?B?Q2N0enRpcGU2bklUd2sxQXVKNEVuQVA1a3BXSlBCRXlTeEdqeERyeVRtQVpa?=
 =?utf-8?B?bmszUTBXRkFtN1grK1dBQkpRa3VtT3VtdWN0UUdrWWRDT2hydENETy9pLzlM?=
 =?utf-8?B?ZGU0UFNPRER0RkVRanpHUERjOXNMaWQ2S1pDVDR5RWxSbUc1dEhqRkN6RTJY?=
 =?utf-8?B?VTBIOW1DZDVWbjdZdXl5Z2cwLyttL0twaGVKa0E2QTBxMUs3di9KS0piK3oz?=
 =?utf-8?Q?CKXymStWn2tbS/RI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9873f788-feef-483f-398c-08de68930af1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:56:29.8083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36924/2wb+FBuL0eL9Y8ilgf0gblLO/xYuQLXXQ65R00z41GHcz1z2BP6ZvL5dD/S140rh4ZJY03xVJbOiJ9EvbEipjDo6X078/q+o4fLH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
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

Hi S Sebinraj,

[...]

> +/* Detect which driver is bound to the device */
> +static bool is_driver(unsigned int drm_minor, const char *driver_name)
This is a bit misleading. The function checks if the driver is
bound to a given device. It does not answer the question
"which driver?", but rather "is this driver bound to this
device?". I think a more appropriate description would be:

/* Check if a driver is bound to the device */
static bool is_bound(unsigned int drm_minor, const char *driver_name)

> +{
> +	char path[256];
> +	char link[256];
> +	char *driver;
> +	ssize_t len;
> +
> +	/* Read the driver symlink */
> +	snprintf(path, sizeof(path), "%s%u/device/driver", 
> +		 get_sysfs_drm_path(drm_minor), drm_minor);
> +	len = readlink(path, link, sizeof(link) - 1);
> +	if (len == -1)
> +		return false;
> +
> +	link[len] = '\0';
> +
> +	/* Extract driver name from path (e.g., "bus/pci/drivers/i915" -> "i915") */
> +	driver = strrchr(link, '/');
> +	if (!driver)
> +		return false;
> +
> +	driver++; /* Skip the '/' */
> +	
> +	return strcmp(driver, driver_name) == 0;
> +}

[...]

> +/* Count the number of GTs by checking which gt* directories exist */
> +static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_type)
> +{
> +	char path[256];
> +	struct stat st;
> +	int gt_count = 0;
> +
> +	/* Check for gt0, gt1, gt2, etc. up to a reasonable maximum */
> +	for (int i = 0; i < 8; i++) {
> +		if (driver_type == INTEL_DRIVER_XE)
> +			/* For Xe, all GTs are under tile0 */
> +			snprintf(path, sizeof(path), "%s%u/device/tile0/gt%d",
> +				 get_sysfs_drm_path(drm_minor), drm_minor, i);
> +		else /* i915 */
> +			snprintf(path, sizeof(path), "%s%u/gt/gt%d",
> +				 get_sysfs_drm_path(drm_minor), drm_minor, i);
> +
> +		if (stat(path, &st) == 0 && S_ISDIR(st.st_mode))
> +			gt_count++;
> +		else
> +			break;  /* Assume GTs are numbered sequentially */
> +	}
> +
> +	return gt_count > 0 ? gt_count : 1;  /* At least 1 GT should exist */
This is a bit strange - you checked the number of GTs earlier,
so gt_count == 0 would indicate an error of sorts. You already
have a check in get_intel_frequencies() for num_gts being equal
to 0, so no need to force return 1 here.

[...]

> +/* Intel-specific frequency reading for i915/Xe drivers */
> +static char *get_intel_frequencies(unsigned int drm_minor)
> +{
> +	char freq_str[512] = "";
> +	char gt_info[64];
> +	int num_gts;
> +	int gt;
> +	enum intel_driver_type driver_type;
> +	bool first = true;
> +
> +	/* Detect Intel driver variant */
> +	driver_type = detect_intel_driver(drm_minor);
> +	if (driver_type == INTEL_DRIVER_UNKNOWN)
> +		return NULL;
> +
> +	/* Get GT count from sysfs */
> +	num_gts = get_num_gts(drm_minor, driver_type);
> +	if (num_gts <= 0)
> +		return NULL;
With current implementation get_num_gts() always returns at
least 1, so you will never return NULL here (see previous
comment). Furthermore, checking for num_gts < 0 is unnecessary
- this value will never be lower than 0, so please use:
if (num_gts == 0)

> +
> +	/* Read frequencies for each GT */
> +	for (gt = 0; gt < num_gts; gt++) {
> +		char freq_path[256];
> +		unsigned int cur_freq = 0, act_freq = 0;
> +		bool has_cur = false, has_act = false;
> +
> +		/* Read current/requested frequency */
What is the difference between current and requested frequency?
> +		if (driver_type == INTEL_DRIVER_XE)

[...]

-- 
Best Regards,
Krzysztof
