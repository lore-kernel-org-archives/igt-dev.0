Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AA9D7831A
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 13:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FF910E1B3;
	Mon,  2 Dec 2024 13:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXlshr8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2EF10E1B3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733145004; x=1764681004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=KRVMyqm4XJh7wBrznNIZ4hDVH9Zx0A5KvrTJ7a3kUI0=;
 b=MXlshr8CyTWVcf78L9ZcUnga7dL63m1Pm1daM34GQ5vJ5JsfTUhUzKUk
 J8clGcfWxxKZheHMVmV5LVaAIf2usv6Vy8rMzLPuh+y+x0oLjAtkb+Ld0
 kSFyLYaao2eI7AE8Ht/V7/4sjoWGtzM6LlWLBhVW9fa9iS9accmecpadn
 2/TI8k7eGmMQlkQga6G8yF0wUBYyt+3Flc9QvHgmSY/qPhSC4osHh3MGS
 IqYWOpdyyoKKXlu95hY3L/cO1m/uSi2N5OyxrlzHfFd46F7pV2XI1q3Lk
 0fk52wNd7UiVl0yWd/U8u72u5Mfiu57lruU+HfyQ/VFp/cms6mezSLCFX A==;
X-CSE-ConnectionGUID: PVlN8jWER/+HkkICmAzbdQ==
X-CSE-MsgGUID: TkbWWGSPRaajwSVN5NX7vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33444970"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208,217";a="33444970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 05:10:03 -0800
X-CSE-ConnectionGUID: nxeb9qGYSOGCxLUc8Cna0A==
X-CSE-MsgGUID: GEZk57qlRTiMo1qmeOMSfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208,217";a="92931719"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 05:09:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 05:09:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 05:09:40 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 05:09:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAp3TFyLd43uc8lpL8jauu3vnma0hrcGQhj6ofeNO5oEB+axxfNGuIm8a3FDLdtqAxq5KwjXHS53w+3/aFrbREtSQZLRhVjkrGS30lbeHdKt0FWQS/c8L32BH/FPnvN/5FhI9olvm3Is41O4MdMTu3Qx57sPnnc9oqrlQ6FxOFnYB5Qo+hdolvokrhYQZEHh+/Kleui0L9JbehWbY3bQBneoLl+L2GkvXe9m+crnrqvF8CNwylrMsn9x4qHiXmOstGCBQAMzaDpqmI1c+F8MJqrW7nFJuaeapMsLHjxOqKQniTyRSRA5RsXugAjrIFXTsEg/fA30498L7R6KhDZnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKMN3jBM2pLVaafcA/Dx52LpUvAmysL9mHP2sv0UlRc=;
 b=L32Nx0apFkQbPO16XnHPnqTST4hfep+0Lm5YgD5C/ISCdiRFhHL9nF56i37jVixLE4TjH3IUjjipOMJxfDXorPtTiRrqH7cWyN0kCw3dSev1N5eh48HUAwjUADUoYEaqJ0Ek8kS2bzmPbqTmkQv3xHAWI2OmvAGKYWotzKaa6MZuZnlDaCfo2VsABumNVdmlh7eeNacDJlVG2C0EeySxJ++3qb62pBiAByZf7F7Xx4KsUAxWD7Kvgsy9GZw59pV+mmTXVcLYi5HbVgKNyNXu73bBRtJv8oEZnd2QqNiVXapsEiwxWnftW0/FSXh18R0giSUARuwUPp4Jm3PFhDik6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Mon, 2 Dec
 2024 13:09:36 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 13:09:36 +0000
Content-Type: multipart/alternative;
 boundary="------------e0GWuSk3VrTBtRNGy71eXhKt"
Message-ID: <77f56487-e8f4-48af-bf36-b6f31a82d777@intel.com>
Date: Mon, 2 Dec 2024 14:09:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] lib/xe/xe_sriov_provisioning: Add accessors for
 quota/spare attributes
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <narasimha.c.v@intel.com>,
 <piotr.piorkowski@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>
References: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
 <20241127200302.1376594-5-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241127200302.1376594-5-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: ZR0P278CA0217.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 750de86a-24d1-4a9b-d532-08dd12d2926f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzE3ZUdPNUM0bGdOTlhHVm9reU5Cd2l3MVMzenBBNmJpcmRKMHVDZXluWVBZ?=
 =?utf-8?B?QmxtbnU5OStOMFNad3JwTCtlTnlaRVQwTkREL05pcmY0SlB4eTRTK2JrT3VP?=
 =?utf-8?B?QTArZ3JlRm1wcDBwUDB6YmQ4SllmRmdIcloydWFVekJ2S1p0VG9jRnhoZ09j?=
 =?utf-8?B?T1ZrVlpac1pjSUI3bFZxemZCTEF2a1ZETGJCaUdPQml5TDdvRG85bm1yNzJ5?=
 =?utf-8?B?bmRqYm9HOHd6aUdGMU5XR29qNjR2SlZyNkM3U29yNDhLRGxCZ3R5cDZmZHpn?=
 =?utf-8?B?VUVYMzFDSVFKeXJEWXgvbDRaYnpoNHU4R3pLTTJNdk50MFpFbzl5NEEzYzlt?=
 =?utf-8?B?bXZHSDBFRGRIVlVzcm9xN1NHTDhOZjh1amtVRVgvbkhpdVNKWFl3bHNKMXFH?=
 =?utf-8?B?aVpCaGtNVlRrdUdmMGpMNWR4ckozL24vZ0hja0Zoa29IaUpiRVV3NktIdDBD?=
 =?utf-8?B?STM3elZON0QwSFZ5ZkFWZnN1TDdWdFpTMG1xbG1PMTdIWkdHOTRjVzdhTUg3?=
 =?utf-8?B?RU16S1dJbmlQNUpHZk1YdVVrQ09ieE45bEhmRzVTVEgxdGdrRVZCUCtlZ1FV?=
 =?utf-8?B?NzlkTG1KczFMTVVyRW5qNnI2TFNnN1hYb29lSnpUVVd6OXBEeGdQZTFSR0pn?=
 =?utf-8?B?U2xpYnhRR1E4dlZwanB5L1psYUNwRDBlL1UwTnduanZDaUNqTndOVjI1SkRB?=
 =?utf-8?B?REZPUzNkamZjRmNHa1pZUnRaMDA4V3U4aGhXREhjOEZCby9VcDAzb3l5UnlF?=
 =?utf-8?B?dEszbVNyWnl4YVRoc0pTK0hPTmRmZ214TytmNkpMbjJnbUo5Tm9lRFZEOWZF?=
 =?utf-8?B?RDBnS2Z4Z0VDQm00TmFtcUlqdTlPYXVxTkJJOU5Sb3VxZ05RUFdabHhHeVR6?=
 =?utf-8?B?amk4NXMrUzBGSVlEbmN2SlpVZGtUNUI0SlFQNFlka2tsTHh1OG9EOGtSUmdt?=
 =?utf-8?B?UUNGSGY4K0hXbHhUTXdFMzZjQzJmcFpvQ0U2V0UvZmw4UFRqT1A0YlpXWXlC?=
 =?utf-8?B?a1VQYWVudURSUk1qL0tOd3ZuL2JDQ3FrcTZ2YzgvWGg2SDBKZGpNTjM0em0z?=
 =?utf-8?B?dEdzNWhyTXROSEJzdUhBa2twaGo2Mnpqa0FvVGtiREJ2bldVajZSUERMYWg4?=
 =?utf-8?B?NkQ3WUFCMGxHaVh6Sldxc2tFSk9LZXdSc0xWRFNYdWVIcnRzMlR6M1dlWVc3?=
 =?utf-8?B?VnlaTEtBRjhSamRHZHJYUi96QVk5SHpmRmpid1NKU1RKYU9wcnFjTjNFekUw?=
 =?utf-8?B?S09sSUtlcHU0V2lncitpaEZacmptZ2tKT002MXNWKzRsOFFDcUd4bDhjelUv?=
 =?utf-8?B?eUo0QkpNZ29kcGl2WUM4Yk04WHhLRlFhdkh0YkVzbFBnYmpKa0k0Tnl0aCtL?=
 =?utf-8?B?ZFRWa3FpcEpHazF2ZzZMTzVWL3BBc3FJN3RJdUdTakRORUxFeTRlRzU4bUUv?=
 =?utf-8?B?UHgyYWhkSUp4KzJsajh1VGVaWGFoVS9WNHZqSWVNRmZOZDFkbUcxOXV6MVhr?=
 =?utf-8?B?Nm43WEdNZHliYkhlT0ZPeWV1dWhVMEVWRW4veUllYThrbFFtQmhiZHhjdDNK?=
 =?utf-8?B?eklqak4xZlpKWjdMVGNTRW5mZGUwU0V6SVIra0Z4ZHRaTFR0TTZETU1BRUVp?=
 =?utf-8?B?WkFNZ3M1enJNZG5LVzM4dngzK1BjYzJqdEdla0lFek9CVWNIQ3RWSVhBcFFv?=
 =?utf-8?B?SlkwRkJZbkxGN1hxMUZ2SHU0bjhtcWtjSkNJMHFHQjdFZnBpcklvOEhEOWJn?=
 =?utf-8?B?ZEFHanh1ZUtzdzA4MjRnSXdock1QVHZDMjBRSmN1TXNuVys0NjBlZTBJdXZq?=
 =?utf-8?B?ektDa2RPdVk4NG92Q1JaZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1lVM2NXclR0cCtJbUttK0RJQnZIZjF3akJ0YjhScDMrd1Y4RlIzUHM0OFZK?=
 =?utf-8?B?Q3J0U2J0ZXpyOGlDYkIwUThYbk85dU5NWXMrSGMvbjJHNXRMS1ltd3hGTkZh?=
 =?utf-8?B?N0ZUSXdqYSthVVd0bFBZTzRQUDJHWGR6eE9ONWd0aHpLNkhtTFAzQ0syTFZh?=
 =?utf-8?B?REVwbFVBdXQ2YytyZDFEUm93QVcrL01SZjNBZkNUMk5vSGp5TDF3STByTlJo?=
 =?utf-8?B?eDIxeTdQcmxqcGhWTzdmRmdSbTR5NUo2Y2pweDFDZDRhOFlRb3FxczBHRGtS?=
 =?utf-8?B?TEY1VG5iczFydk9DaXEzZWNaZk1NcnZHYmJReUFKaGVvRkNqN0dHUDlwMW9I?=
 =?utf-8?B?N1lURnF4cldWNGxyclJjcE1CdTVITFA1aU1lMEZyWHZSRDRacUt2em9YU0hP?=
 =?utf-8?B?YTQ0Q28yVFRHdlNRenoya1pFdVByejhWVXZ5NE9LTDl2SFpnOUdWZE9QeDZz?=
 =?utf-8?B?TndBYm1UaVhHaHNzRXdqTUdhS2JQUy92Uy9vaHlJQXhpbkRVcGFWbG1iWnl1?=
 =?utf-8?B?Q2p4eFNsYWJGWStYdU1XYjhTRXZ6bFdrdWlSamdGQ2E3czNqZzVtRXVWdWkv?=
 =?utf-8?B?ZGw1b1VRdmdnUHFDWXFiRGVXOURENUY0NnlGMlk2VEc5dncveE4wT3VTOEV6?=
 =?utf-8?B?bndZOFZ1ZzRBTWxpT0NZMk5MSXliekg4NnEyWE4yQ1VCbzFwKzM5d20ySTZF?=
 =?utf-8?B?M1dHUHlHejFGcStlR3ZFMVlYWG5mR1R3SUhXdDk2Ti90THcyZmI2Zk5CUmYy?=
 =?utf-8?B?Wk41cTAzSngwL0k3Uk9JQ0swMVVWTzZBMkQ5ZzEyT3I3ZHFBTS9iekhiUVY2?=
 =?utf-8?B?dE5kR2hjdHFraUc0OFFkb3Jpby9YYTkwdkRUWm9MSktkRzRVcS9rVGhhaG5n?=
 =?utf-8?B?SzdOWWZRNmF6eEduZFBiUGFJclZOZHVHd1M0T2s0cEtlSjFhRmhuNGQ1YU5t?=
 =?utf-8?B?SFdXbEs0bU56T29Pazd2eFNYU0xtSDRJRmtudlA2eUNXVnNPVktreDhsTVBs?=
 =?utf-8?B?TmJjOFRvczRMdHZmdmlIMUNMY1MrSGtlVmxJT0g5OTdUMzFEcWhCWnlnbjAy?=
 =?utf-8?B?WUdyUHlEaDJjdVQ4aE1pcGNuWUk3N00xbGxWcStvU2Z1elFrMVAvTnhUWXhp?=
 =?utf-8?B?S0xrcWd3amw1K1hiczZIN3MrSGdpNVJ5SklYcjRtdHZDOHJLV2hmVE1USHdZ?=
 =?utf-8?B?dmJjeDI4OVpsL1ZjQmJiQmYxWmwzYUQ0WklhOGQ3MWgzMXozKy9xRW90dWox?=
 =?utf-8?B?Wmc5OEVzUGF6TlUvMHRtelF5OC9reExUeHQwMWhRVExDb1ZrUm5XUTAwKy9H?=
 =?utf-8?B?UFNXZ0Q2bFg1R0FDd25QalUxN0c5L0JqNUFwVkFpK3ZvSFAzZGFWWldEemhk?=
 =?utf-8?B?STlhdFpscmJtdHd4ZHVBdUFUdThHRmErcnJkTXJZeE9pNGdhdmYySWlEdEdp?=
 =?utf-8?B?cFNEWUM4K1FFWG5MZjc5ODh1VEtVMDZxK2l5b2s2TXdTWDZERzFmNzFVNElY?=
 =?utf-8?B?Z3Nuclk3a21kbk9aSkNoMGhDWEF0YzBlN3M1YmZiR3VHWjVLb0gyKzFmd2dh?=
 =?utf-8?B?Zm1mc2w2MVo0Ykx0eWhSM3dKMVFKMy9EWTJtNkg4VXFuY3ltWEp5YXR4bzVw?=
 =?utf-8?B?OGdRd2x1OHQ2STVzc2FTZTF1VVFieVJTMGd5MDZ5QWcyZEY1RitsUm1YSjRW?=
 =?utf-8?B?WkdDdHY4Y21JMmN6SHQ2SmJyKzVIT0xxWGt1RzFoUkFQOGx2Rzl1WDZvYU40?=
 =?utf-8?B?QnRrcTh5dXdKZDRKa1NzVXVwSXRLbHc4dFc1bTQ3TTE2dEJzV2NEYlVXYVdV?=
 =?utf-8?B?SzRnaDIxZG9kbENHbExDWkJXRlVjc1BwZitubDB2M1dOK2s1a2tORTBUeUp5?=
 =?utf-8?B?YmdwbXdTaTBuRE1SeWRLUm9DRmFva1VGT2xmMGxuSGZYTEhuR2s5K3NZek0w?=
 =?utf-8?B?RUJnckhtVUZLRHJNbk0vd2M4MGRxY2FVdG4rcEFySmN1eE5WazhzVXJYL2N1?=
 =?utf-8?B?WUgyZWhxVFJYbHMwNDlYRllVR2hWYmZOV0xJV25aYXBIYW9UQjJpVWZ3UDVK?=
 =?utf-8?B?WVdBODBwVHdhOVJTbWJ5ZVh0ZG1LdWdxZ1VhWXF3SkhpOGtsR2ZjQit2NE5p?=
 =?utf-8?Q?Bjf47w94H1wuo86mwrWpWfl2V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 750de86a-24d1-4a9b-d532-08dd12d2926f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 13:09:36.8017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgcbOSMGGxLbHxP8BKfTnNo5O9VGBPotKKc7hf+jXF/bDSypObZnoccc4lgm2MXYQvP3iQ8f/UG0Kfw+ksdKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
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

--------------e0GWuSk3VrTBtRNGy71eXhKt
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/2024 21:03, Marcin Bernatowicz wrote:
> Introduce functions to get and set SR-IOV provisioning quota and spare
> attributes. These functions provide access to shared resource attributes
> such as GGTT, LMEM, contexts, and doorbells for both PF and VF contexts.
>
> Add returning and asserting variants to allow flexible error handling
> based on usage scenarios.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 123 +++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h |  14 ++++
>   2 files changed, 137 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 0c5cd01fd..ce06c00de 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -561,3 +561,126 @@ void xe_sriov_require_default_scheduling_attributes(int pf)
>   		}
>   	}
>   }
> +
> +/**
> + * xe_sriov_shared_res_attr_name - Retrieve the attribute name for a shared resource
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + *
> + * Returns the attribute name corresponding to the specified
> + * shared resource type and VF number. For VF (vf_num > 0), the "quota"
> + * attribute name is returned (e.g., "contexts_quota"). For PF (vf_num == 0),
> + * the "spare" attribute name is returned (e.g., "contexts_spare").
> + *
> + * Return:
> + * The attribute name as a string if the resource type is valid.
> + * NULL if the resource type is invalid.
> + */
> +const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
> +					  unsigned int vf_num)
> +{
> +	switch (res) {
> +	case XE_SRIOV_SHARED_RES_CONTEXTS:
> +		return vf_num ? "contexts_quota" : "contexts_spare";
> +	case XE_SRIOV_SHARED_RES_DOORBELLS:
> +		return vf_num ? "doorbells_quota" : "doorbells_spare";
> +	case XE_SRIOV_SHARED_RES_GGTT:
> +		return vf_num ? "ggtt_quota" : "ggtt_spare";
> +	case XE_SRIOV_SHARED_RES_LMEM:
> +		return vf_num ? "lmem_quota" : "lmem_spare";
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * __xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Pointer to store the read attribute value
> + *
> + * Reads the specified shared resource attribute for the given PF device @pf,
> + * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
> + * - For VF (vf_num > 0), reads the "quota" attribute.
> + * - For PF (vf_num == 0), reads the "spare" attribute.
> + *
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t *value)
> +{
> +	return __xe_sriov_pf_debugfs_get_u64(pf, vf_num, gt_num,
> +					     xe_sriov_shared_res_attr_name(res, vf_num),
> +					     value);
> +}
> +
> +/**
> + * xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_pf_get_shared_res_attr().
> + * Instead of returning an error code, it returns the quota value and asserts
> + * in case of an error.
> + *
> + * Return: The value for the given shared resource attribute.
> + *         Asserts in case of failure.
> + */
> +uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +					 unsigned int vf_num,
> +					 unsigned int gt_num)
> +{
> +	uint64_t value;
> +
> +	igt_fail_on(__xe_sriov_pf_get_shared_res_attr(pf, res, vf_num, gt_num, &value));
> +
> +	return value;
> +}
> +
> +/**
> + * __xe_sriov_pf_set_shared_res_attr - Set a shared resource attribute
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set for the shared resource attribute
> + *
> + * Sets the specified shared resource attribute for the given PF device @pf,
> + * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
> + * - For VF (vf_num > 0), reads the "quota" attribute.
> + * - For PF (vf_num == 0), reads the "spare" attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t value)
> +{
> +	return __xe_sriov_pf_debugfs_set_u64(pf, vf_num, gt_num,
> +					     xe_sriov_shared_res_attr_name(res, vf_num),
> +					     value);
> +}
> +
> +/**
> + * xe_sriov_pf_set_shared_res_attr - Set the shared resource attribute value
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set
> + *
> + * A throwing version of __xe_sriov_pf_set_shared_res_attr().
> + * Instead of returning an error code, it asserts in case of an error.
> + */
> +void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				     unsigned int vf_num, unsigned int gt_num,
> +				     uint64_t value)
> +{
> +	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index 4ddf3149f..30e769019 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -100,5 +100,19 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
>   void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
>   				 enum xe_sriov_sched_priority value);
>   void xe_sriov_require_default_scheduling_attributes(int pf);
> +const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
> +					  unsigned int vf_num);
> +int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t *value);
> +uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +					 unsigned int vf_num,
> +					 unsigned int gt_num);
> +int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t value);
> +void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				     unsigned int vf_num, unsigned int gt_num,
> +				     uint64_t value);
>   
>   #endif /* __XE_SRIOV_PROVISIONING_H__ */

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------e0GWuSk3VrTBtRNGy71eXhKt
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/27/2024 21:03, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241127200302.1376594-5-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce functions to get and set SR-IOV provisioning quota and spare
attributes. These functions provide access to shared resource attributes
such as GGTT, LMEM, contexts, and doorbells for both PF and VF contexts.

Add returning and asserting variants to allow flexible error handling
based on usage scenarios.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_provisioning.c | 123 +++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  14 ++++
 2 files changed, 137 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 0c5cd01fd..ce06c00de 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -561,3 +561,126 @@ void xe_sriov_require_default_scheduling_attributes(int pf)
 		}
 	}
 }
+
+/**
+ * xe_sriov_shared_res_attr_name - Retrieve the attribute name for a shared resource
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ *
+ * Returns the attribute name corresponding to the specified
+ * shared resource type and VF number. For VF (vf_num &gt; 0), the &quot;quota&quot;
+ * attribute name is returned (e.g., &quot;contexts_quota&quot;). For PF (vf_num == 0),
+ * the &quot;spare&quot; attribute name is returned (e.g., &quot;contexts_spare&quot;).
+ *
+ * Return:
+ * The attribute name as a string if the resource type is valid.
+ * NULL if the resource type is invalid.
+ */
+const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
+					  unsigned int vf_num)
+{
+	switch (res) {
+	case XE_SRIOV_SHARED_RES_CONTEXTS:
+		return vf_num ? &quot;contexts_quota&quot; : &quot;contexts_spare&quot;;
+	case XE_SRIOV_SHARED_RES_DOORBELLS:
+		return vf_num ? &quot;doorbells_quota&quot; : &quot;doorbells_spare&quot;;
+	case XE_SRIOV_SHARED_RES_GGTT:
+		return vf_num ? &quot;ggtt_quota&quot; : &quot;ggtt_spare&quot;;
+	case XE_SRIOV_SHARED_RES_LMEM:
+		return vf_num ? &quot;lmem_quota&quot; : &quot;lmem_spare&quot;;
+	}
+
+	return NULL;
+}
+
+/**
+ * __xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read attribute value
+ *
+ * Reads the specified shared resource attribute for the given PF device @pf,
+ * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
+ * - For VF (vf_num &gt; 0), reads the &quot;quota&quot; attribute.
+ * - For PF (vf_num == 0), reads the &quot;spare&quot; attribute.
+ *
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t *value)
+{
+	return __xe_sriov_pf_debugfs_get_u64(pf, vf_num, gt_num,
+					     xe_sriov_shared_res_attr_name(res, vf_num),
+					     value);
+}
+
+/**
+ * xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_pf_get_shared_res_attr().
+ * Instead of returning an error code, it returns the quota value and asserts
+ * in case of an error.
+ *
+ * Return: The value for the given shared resource attribute.
+ *         Asserts in case of failure.
+ */
+uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+					 unsigned int vf_num,
+					 unsigned int gt_num)
+{
+	uint64_t value;
+
+	igt_fail_on(__xe_sriov_pf_get_shared_res_attr(pf, res, vf_num, gt_num, &amp;value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_pf_set_shared_res_attr - Set a shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set for the shared resource attribute
+ *
+ * Sets the specified shared resource attribute for the given PF device @pf,
+ * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
+ * - For VF (vf_num &gt; 0), reads the &quot;quota&quot; attribute.
+ * - For PF (vf_num == 0), reads the &quot;spare&quot; attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t value)
+{
+	return __xe_sriov_pf_debugfs_set_u64(pf, vf_num, gt_num,
+					     xe_sriov_shared_res_attr_name(res, vf_num),
+					     value);
+}
+
+/**
+ * xe_sriov_pf_set_shared_res_attr - Set the shared resource attribute value
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * A throwing version of __xe_sriov_pf_set_shared_res_attr().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				     unsigned int vf_num, unsigned int gt_num,
+				     uint64_t value)
+{
+	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index 4ddf3149f..30e769019 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -100,5 +100,19 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
 void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
 				 enum xe_sriov_sched_priority value);
 void xe_sriov_require_default_scheduling_attributes(int pf);
+const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
+					  unsigned int vf_num);
+int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t *value);
+uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+					 unsigned int vf_num,
+					 unsigned int gt_num);
+int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t value);
+void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				     unsigned int vf_num, unsigned int gt_num,
+				     uint64_t value);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */</pre>
    </blockquote>
    <br>
    LGTM,<br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a></span><br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------e0GWuSk3VrTBtRNGy71eXhKt--
