Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE4EC83F1B
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 13:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9056010EA54;
	Fri, 11 Jul 2025 13:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aS1D62IF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E12710EA52
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752240061; x=1783776061;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=4P7ccKo0dhu4kSlLUZrs7ut04a7hK+e2KJ5p74HtvQw=;
 b=aS1D62IF84WZRUrWnZgKb6D3+iMAikTk1+pCv1xR0ZfmzWM8rGqylMAO
 qfv2LDYJzr8+a+TJR6fGKXgpUghsUS9VEne5T1FFMKCKQ+vl15s4DJhZn
 t3UEEgwyrfBxM06c7goJug8TAh3yOC8JPWKj8wPF9REZ9Px7GVyJnej3R
 wKrjW+cykBMQ0cj8YIvUY+C4wnNY2XdsWteroTt5avnNY8fUmcqgNoWJT
 iy8RmuyrAHxsH6PNfBsqYNRUp6IOijPVTLh1fLR3Mf7peFzBG0E2939r6
 4lf0gdtN8l1B/VQD2hSjIoeS1MXtnpmUOJYrwdm5p20f0mtBa0bkhZLPU Q==;
X-CSE-ConnectionGUID: ffSo2N8zTo2Tn3ZSphEs8Q==
X-CSE-MsgGUID: B8oPXXKlQ1OEyIeOpi/UIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77081737"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="77081737"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:21:01 -0700
X-CSE-ConnectionGUID: hMyjyE2gTiOzV0zJLYrHyQ==
X-CSE-MsgGUID: VYJu8cEnSByMPSzLLXnG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="160387173"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:21:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 06:20:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 06:20:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 06:20:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkV7+YZWLDqaYiX7+wSWPsC4qm/U0PvKV/XtNPCIfDKpn6JH6BZdCElgmecC5nCvfJhD7PIBGucvjJAMcKQhTxJXTpY3ZJRvWd8OF+b50lFPJ0g1jGJUaObW3J318xwwCMtBntltxp7w8PDxj1MkwtYJ7ApQDtmfTJYAZATrPMGYUvIPFDyh2efiUXSsqj26B5UHiJmAaThUEtaW/UGvIuv76MBlQ+2+uCLdBcRKrToJ51V3DYdphL9uX4SW3hWbqJ41wL/lDDN/XjyyX0y0jnpd8mwCCeXG7Yk1br8PosEuySBzKyfStOk4/X8+baPrbnY7pu62tTead4d3nXiAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNhkPMWwSVnuhhAZdrt2KNmKys2hbKLEe2nWOAQjbKY=;
 b=XlWxnsGDcmhzz6+Lc3AePcPeOlOBIxgY4QvfSNQUqOByzEvIBIajQ+xdzKTgl/nYeReW+UzzUMmVnijPT+J3Askw33B+2fGhT0Hr7XnmxugJGDAbu+Zjh9xVhwi4lHWWLkN7MUS+IkVoL0vptoVJrwiU1jTKb6y9eGdrybgnbZE+yiGwYJOkqH63R3D0N4Dhbcn3+dJeQIHUb0nrbKwIwIJ0RPJkl9k6NQ8HnBpWCLG8CaiumwQarsttMDLwZ5q4b/fVHZpVQZTHlvewL2kfQO1u4Dy2l7bJGyIlXB15bFUPGNKwDUAtqZ+uQkMqaAWuNecLCkxKe4bZh7YzAO9UWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BY1PR11MB8032.namprd11.prod.outlook.com (2603:10b6:a03:524::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 13:20:29 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Fri, 11 Jul 2025
 13:20:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250703150304.101208-3-peter.senna@linux.intel.com>
References: <20250703150304.101208-1-peter.senna@linux.intel.com>
 <20250703150304.101208-3-peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Add IGT_HOOK_POST_GPUKMOD_UNBIND
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Date: Fri, 11 Jul 2025 10:20:23 -0300
Message-ID: <175224002361.2061.8716253238694399628@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW2PR16CA0072.namprd16.prod.outlook.com
 (2603:10b6:907:1::49) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BY1PR11MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: c4de8361-1c0e-43d7-8a6a-08ddc07db4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1AzNDdoTlA4VHBTNGoyNVIxYXNNREVVd1NGQlFQU1cvNGwxYjRnN2F0VE5N?=
 =?utf-8?B?cWYwSXN3MmhpMXNTdjFHWm9HN2NRbDQ0dlVhckFpai9HSGNCTTlyNjMwa1ZC?=
 =?utf-8?B?cmVwZGZaeFlMUEEwTGQ3dnFrUVo0STA1K0Z3ZjFZdXJNMlcraGgwZVgxUXM5?=
 =?utf-8?B?cFNxU1dONjhtQ0k2Y2sxYlFhUE5LK2t0ZGVHaCtoZGJ3Y3dnWWd2NWh3NVFJ?=
 =?utf-8?B?SnQyOU1CL3JiaWc4U3RwbWZzbmlGckM2MmZKYnJ2QkI5dVk2NEN1UHRKV2do?=
 =?utf-8?B?OFZCZ0I1OW1wOUtpcEt3WU14TlBzbzlGeWhBU0tSQmVaRWl2SHpMNVVMVVQz?=
 =?utf-8?B?dHBwS1pLZjFZY3dCOThQT09yZmZhZWlzZWF2RjM2WWd6TUtrTkhOd0V1RWFk?=
 =?utf-8?B?dkZFcXoxcnRpL0Njb1dOYWdpNGtydC9HTXhrVVlLVEdGdGJaUldobmFxWHly?=
 =?utf-8?B?UGlyMUtLRkRsYzd0ZU9rbnM5RXQxQ1RURFdNVlg5S3picnJCRTcvSHJjdTU4?=
 =?utf-8?B?elc4YWQwUjhNdGREM2ZCbDV5UW1ZSlJLVkNQTTVMYlZYbEtkazNRTUloOFdN?=
 =?utf-8?B?TnlNVWowQndSVHEvVmF1ekIrS3Nyc1lLNFhhUjN6YUloVkdXdWhFemVKSW5L?=
 =?utf-8?B?Wm5PdzN3akplVU93MFBZQ1grN2V6aHlqZ2swZytDVmY4VmJPQTEwK253YUZL?=
 =?utf-8?B?Z1MzZlBjdXhVU0tKc1dlMEJ0T3c4VHdwVy9JWUV0am4vSGVFOFRObkg5SHdn?=
 =?utf-8?B?L3Z4MUlhTTdjbXRGSUJtZ0pzVEpwcjRGaGZEL0JJQ1J0dUJ6N2lHdjl2WGFR?=
 =?utf-8?B?a0pVYzluYzMxT0tGT24wWk8vQThkZGU5WjB1SkVIYWRVcjBFN3NIU1A5eDh2?=
 =?utf-8?B?clY2WFNRVkplS3lIeUJHTjR0WXJsMWZRSUxuVG1Dc245TVRRRTdLVGRob0tk?=
 =?utf-8?B?MlFYN1ZGaVFPZ2FvQUcwWFZuVTlxL0xjNi9xMVNkSGxoLys2b2ZXcEJmcWQ2?=
 =?utf-8?B?RlNyTlNhYVdLa0tpMjJ4ZXNjZDhWNkRTUnJjTHp3amhVdmhPU2JVdE1Ub2Iy?=
 =?utf-8?B?OHhaTzY4ZGpFQ21rOEVPRTY5NzlLZ29CSUcwV29DTllYdUtIaXZwdTQxV1di?=
 =?utf-8?B?bTdPdy9tR2U0cXE0MHR6cHlzQXNwdG5mb3BUR1N2RVh6S09zdHJUQTZ4cUov?=
 =?utf-8?B?Y2sza1FVYjFENXNwU0krbmZFcUx1c2R5aWFCL1hYOWlPRnZPS1lYMmpuK0s0?=
 =?utf-8?B?bXo5c2RacW85V2xqVFFtb3VJZEtHTEFScllrejlWdXQzakNkR0JYcWV3eFpJ?=
 =?utf-8?B?T2lsVEMxRFhyT20ydWgxL0ozMVRYYmY4MEtja09LczBJelk5ci9rblBkUHhn?=
 =?utf-8?B?elZxd1UwZmUzVEJ5aGtjZXllTmgvQ2psakJzSTJ0cWd5ODRyd1NhSmNzUWU4?=
 =?utf-8?B?ZGdzWFRWWjE3R0FMdVo2dXBNd2hBZDhOSXVFRlBvVUIyTDBmZmt4dG9naDFP?=
 =?utf-8?B?U2M1WUxTejZoSzVPRHdKMS9nV0FiMzFaMnQyUnBDcVhXcUpWMlVibUxMQkVP?=
 =?utf-8?B?QnZrTW5WWFh4Vkl5eWoxU2sxYXoremNvdkRxN0pmR0dNckZsNGNDcmpvS0p3?=
 =?utf-8?B?R3ZONGp5bUlCVHQwNWtkL1hhSEZuUkJXcUJaMnhYbVN3N1o4QmxyZEJoUm0r?=
 =?utf-8?B?K1ZkREVRUGFmUDZJUGJMcjhlbDJMbDV5T0M4cTQzenUzanlwTnJ0Vi9idFh3?=
 =?utf-8?B?cHIxTkFVaElnYjZVSmJIdytkNHYzOHdudkRBU0ZORWVmMnlSdnh5bGRleUJT?=
 =?utf-8?B?MXdkQkV0MmNZb0gzUVBNOHRhS3lpUmVqbHA3NlVSK1NuZmhZSFJmWlBlNjgv?=
 =?utf-8?B?VjBEbS90L2ZMOWtLYzIyaTlUM2NTREVEWDY3QTQ5d0paWnVGSjlFMm1FdXZQ?=
 =?utf-8?Q?H0sfJejgOTg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFd3N0VpdW1mbi9JRE15SDNvTlBEMUpYSGR6aDgvaE4vc1VkOElEZlRqWDdL?=
 =?utf-8?B?ankwY1VObU5CbkZjMDFQN3hrUjhJSDNBdVZsSHBmVXVSRWhGMzNNVHZNMzYr?=
 =?utf-8?B?dEl2Zjk4S1ZrWmplc3VJSHhqQlVPYjcvd0UxQ2U2Qzg4ek5sZWE4c3gyVEZT?=
 =?utf-8?B?L0czSVJRN01oMmlsUndEK1NXRVJJWDd0UHdNK1VjZlV4Q1dNWkRxNmJhcFNk?=
 =?utf-8?B?b1NySldxcXNvdk5DRTJrbjlRT1hKSGlFTlZWMnNsVE1McFVzQkVvcENuOEUz?=
 =?utf-8?B?Yk95YUxsUkRwY0lpNzBYWmFEMis5cjQ5T0JPQ3lNRU9KR1djanBwNmhWTFJY?=
 =?utf-8?B?cHU1aWFBZ0RjcVdxYXpyeTFEcThGRTVTMkhUSU9USHlMN3hCRFl3bE9EbWxX?=
 =?utf-8?B?WmFoamN1RzhLWHNMeE5MbUxlYTVyZjZZd1I5Nzg1cDRrUkh3YmdmdzVuSkhE?=
 =?utf-8?B?UkEra3ptNnBoOW5jdGZYT3h4RVpOdzdVb1g2NTlRenIyb09RTDQ3K3QwbkZh?=
 =?utf-8?B?TGJvdldxU1VORDI1ZHAxN1JvaGhGcE44M3M0MVMyWElRaEtiRWdKSTJmb1Rk?=
 =?utf-8?B?UHY5TkpncHdUeGlOS0pxait6cTVNdzFOczNHTG15Y2VRVFA2OFpvSTBCUmEz?=
 =?utf-8?B?QnN1RkxCV1lkVk1uWXpySWZUOTBZOWNoZFBRYmE0bHhhWHRXOC93cmlUTTFs?=
 =?utf-8?B?NnJCOGRuS0pVVjVNbUxxblVOb29LeHUvWEExSng3Y1lFb3dMV2hJMDlVNGd5?=
 =?utf-8?B?NUYzUmRLaWJuUzlaT0pneVRkL1lqMUpSOTVNR05DcCtTaENxME9qaTZDTitv?=
 =?utf-8?B?cSsrTG9vNzhzaWp0aXpLNzVDaC93b0Y1SWZrc2dWUVp0eElieTFYYnFFQWdF?=
 =?utf-8?B?YnRUOHUrSXZCd29abzl0dzdOZktqQ0Fxa1VzamZ2cEdFdFI0RFJYTVdDQ1FV?=
 =?utf-8?B?SVc2OCtuODBFdStycHFaZGlienpCS1BqSjR0NzgxUXhHTkpJN0tKUjNnWXNY?=
 =?utf-8?B?d1pYL1VvZGUrelVrajkrNnV6Zk9lNW9WZHBLRkNWUkVQOGVTNFpTZlVtQklj?=
 =?utf-8?B?dWFuMks5UFJMTS9yUXpjNmFZT0Fpc3E5Z0YwbWlyK0MzSTVpREs4M1lERlpX?=
 =?utf-8?B?ZHltVllyc2U5YVdSQTBiUC9LTjgyVk5sK3NwM1BKNFlzMGZ0MmxhenNSb0pC?=
 =?utf-8?B?RXkwQjg4UWhSVEV4UC9YcGJJSU1yaTdHbDB3cGpTSE1Ja3BKeU5IQVFLZ0lK?=
 =?utf-8?B?R0h6SEZ3bnYxWlU4SThueCtYRG5wTG9raTIxN2VJRjJsVlRqb3B1bHRjeWsz?=
 =?utf-8?B?MjJ2QUFFV1hrdVE1aVVtZGwycW9QdWN4cE5lQkpQTmRRZ1c0UEhnamp3Z3g4?=
 =?utf-8?B?M2F2ZE1xTlI2V2R0ZXVLR0srdGZDaEtDYjdDcUI0bFo0VWJOblBOYy8xV1Aw?=
 =?utf-8?B?eWJvRnMxOUFZcWt1VkZTelBCOFUyVHlZcmZHY015d3h5cHVid1dkR0RRRWZ1?=
 =?utf-8?B?NXBsc1lySW95bE9UMmlYb0QxUVRsbzY1RUsxMWFWeWZNUzhMUnY0S0FKaVVP?=
 =?utf-8?B?eGVJd3EyRldMYUUrVGhvdXdHVnJETklRd2dPT0kzOWdzd29rb2tCUjlscWdW?=
 =?utf-8?B?RGtQeFlmUWZaUjFuaUg0MCtWdjR2bkt2MkhGYm9FeUxJZ2tweTViVE90YzJU?=
 =?utf-8?B?NkNVTUtxL1BCdEI0T1lsUjJ3TWowUVdTNUgwWmNPMmxrRlk0U2M5eXJzbUQ1?=
 =?utf-8?B?Qlg0Y2I3b0RBSWNMTWcxNDRkbTd5cjZnemg2ekdoRzJucUhMMk5CVWEwOVpB?=
 =?utf-8?B?T0o4RWVDcFY1aTF1RHgwR1JRd092b0xhWCtJV051QWNYa2VKaDNKNDFoTTVa?=
 =?utf-8?B?Ykx3ZHlqdVFHYkRSbzJ0SjNobFR1T0ZocGVsL0JpeXJtaWdTWVdtUU5aKzBn?=
 =?utf-8?B?eG9wTDVtaEhmVXZPWWRHL0pQSkgvZmg4ZFcvOGR3MlloR0pLYmdoYWJJS0Rs?=
 =?utf-8?B?aHhtRFpiTG8wczNUSDVqNUNNWC9IQ0RVYUJya2dyKy9RNzZHSVUzU3hvdTFy?=
 =?utf-8?B?T0Q1SHAycGZqeE1ueG1lK2ZNclVRLzJoQzVDSUVJMWF1dTgrbDdYMlpLNSt1?=
 =?utf-8?B?Y2tsOHVCZ2JpM0h2S3hwTHZtdXM2dWtOaXRsSDNnQXNNZTgrME9SM1ZXNndu?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4de8361-1c0e-43d7-8a6a-08ddc07db4a3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 13:20:29.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSW4BEDQwPa/jCiehxfSan3heZtFY3RXBU33CEtLMXGDgMJolr7mufD0Lf1+cZzfWSTKa0exL87syGaWdQTeVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8032
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

Quoting Peter Senna Tschudin (2025-07-03 12:03:04-03:00)
>Adds an igt_hook after the unbind operation of the GPU kmod intended as
>a strategice entry point for kmemleak scans.
>
>Can be used with --hook  'post-gpukmod-unbind:...'
>
>Cc: Gustavo Souza <gustavo.souza@linux.intel.com>
>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>---
> lib/igt_hook.c | 5 +++++
> lib/igt_hook.h | 1 +
> lib/igt_kmod.c | 7 +++++++
> 3 files changed, 13 insertions(+)
>
>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>index 8932d118d..a3f92acd4 100644
>--- a/lib/igt_hook.c
>+++ b/lib/igt_hook.c
>@@ -74,6 +74,8 @@ static const char *igt_hook_evt_type_to_name(enum igt_ho=
ok_evt_type evt_type)
>                 return "post-subtest";
>         case IGT_HOOK_POST_TEST:
>                 return "post-test";
>+        case IGT_HOOK_POST_GPUKMOD_UNBIND:
>+                return "post-gpukmod-unbind";
>         case IGT_HOOK_NUM_EVENTS:
>                 break;
>         /* No "default:" case, to force a warning from -Wswitch in case w=
e miss
>@@ -470,6 +472,9 @@ below:\n\
>                 case IGT_HOOK_POST_TEST:
>                         desc =3D "Occurs after a test case has finished."=
;
>                         break;
>+                case IGT_HOOK_POST_GPUKMOD_UNBIND:
>+                        desc =3D "Occurs after the GPU kernel module is u=
nbound from the device.";
>+                        break;
>                 default:
>                         desc =3D "MISSING DESCRIPTION";
>                 }
>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>index e9f97b79b..92d3986e8 100644
>--- a/lib/igt_hook.h
>+++ b/lib/igt_hook.h
>@@ -39,6 +39,7 @@ enum igt_hook_evt_type {
>         IGT_HOOK_POST_DYN_SUBTEST,
>         IGT_HOOK_POST_SUBTEST,
>         IGT_HOOK_POST_TEST,
>+        IGT_HOOK_POST_GPUKMOD_UNBIND,

We are missing a documentation line for this new member.

>         IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
> };
>=20
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 6d7f5705c..e300b743a 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -41,6 +41,7 @@
> #include "igt_aux.h"
> #include "igt_core.h"
> #include "igt_debugfs.h"
>+#include "igt_hook.h"
> #include "igt_kmod.h"
> #include "igt_ktap.h"
> #include "igt_sysfs.h"
>@@ -604,6 +605,7 @@ int __igt_intel_driver_unload(char **who, const char *=
driver)
>  */
> int igt_kmod_unbind(const char *mod_name, const char *pci_device)
> {
>+        struct igt_hook *igt_hook =3D NULL;
>         char path[PATH_MAX];
>         struct dirent *de;
>         int dirlen;
>@@ -633,6 +635,11 @@ int igt_kmod_unbind(const char *mod_name, const char =
*pci_device)
>         }
>=20
>         closedir(dir);
>+        igt_hook =3D igt_hook_get_pointer();
>+        igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
>+                .evt_type =3D IGT_HOOK_POST_GPUKMOD_UNBIND,
>+                .target_name =3D mod_name,

The member .target_name is not being used for
IGT_HOOK_POST_GPUKMOD_UNBIND. Did you mean to use it to update an
environment variable (e.g. IGT_HOOK_KMOD_UNBIND_MODULE_NAME)?

--
Gustavo Sousa

>+        });
>=20
>         return 0;
> }
>--=20
>2.43.0
>
