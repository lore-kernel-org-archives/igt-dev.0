Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8067C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 20:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B40110E043;
	Fri,  7 Feb 2025 20:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFtalm9F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B473710E043
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738961021; x=1770497021;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=YKwHVcLXm8znA81rb+i7zil76YtorHr6SVjC6DOWB2E=;
 b=AFtalm9F9lhtUanwOA14Z5sEFPWzUJ/Q1kRnvtnkVmMfl/wdNUpWuN7T
 uKYutn2m0rzhT5+e93jcZ+2tpI/QM0uEV8cRJAyKPKEz34VoDHR3QuQ49
 S97HgNbzssmoY/SByv1vqKNsWLEx6xq27ZnN8WFsTuLO76IpMg7bbMJHi
 P+RlMUlMRVfDZFfhNT9l4r2Kj7x7Al1CWv1aQMbn+sAZoQu6VQdJxS1Uu
 Ob9Zwz3BEjynoUQLCC5cIVNgLZwaZWZ14RQBE1j/OA0jxtVqTRVt9DO+F
 zqllLWDWAeiyXVhcKJAe6OSFq7INJhw9Ss7Y3/7W+ph6desRNBtOOOFWv g==;
X-CSE-ConnectionGUID: dGGVh4lgTRqP/U1FIQJKvA==
X-CSE-MsgGUID: ezO7s94gQaCDqaR5JK6/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50238337"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="50238337"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 12:41:42 -0800
X-CSE-ConnectionGUID: EDEMlTCpSniZcOwsv+UFCw==
X-CSE-MsgGUID: QVjTxTnzTPSQRhhqE2iDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116228850"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 12:41:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 12:41:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 12:41:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 12:41:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsylz0fKqvAo3wYSncTDcce9WFrY9kdyybx1dWNU8iM93W2+P9r1CthRid0njBNF1ZPOZ+kCm0EJIoGSedHBOfKzmbW3+FPBdgZdSsLKwUttOFEM18Z5C6R6rOwEQ6do6815aKezherPG0F+x+EaUdSxOgr6GGc09+PI2pQC+snpIiJzTnVN3aU5g4oiaQQcSceourovwpdaRV7SY+bIIHdPq9ow+O8wzVhHiLaxstzc1IyGlP4FxQrKeY3FgbOnZFQ/ytLwO48ypjhwhWFV44gnGmHdPXElSm/F1UPU45G5dwmDAHruoVC2FjfBi7nIr/Vft2CaBYie+y2G+tQxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcm1OYKxvGIJVVI8PsgF5+dQNZFlR3KnAwDVTmys+uA=;
 b=CB5r6eH6kmnHMV4aDwGZXc9n3BfVOb0qNlvGztEj7ao8CR2GzpTUURyyP28ltklAMnnyuH57SAQEFbU0jH5HHzjOeyVKdxn9oj5uckruCm8hUnaqcqd8HypBsZZHLVDtDwddZIaYGhufcgp2gdWksXzELfnxyjlbYl5/RBfulqr/g5oqlJ6Wc9Oy07Bs18tl5y1M1TBn3O1TTQ+I8cWQR4v9myTC9zrMKf/0HJ1HwUQ6Vae1CVokL6uN7CCd/1KFcKrClnc797VzLTrbx5f4qObUL5TmnYP0RLrm+R6pSvmOQIW9xG9Jpeq5ocTtMwhlkUNRKUC4TYAS3iR0PZR4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB5799.namprd11.prod.outlook.com (2603:10b6:303:181::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 20:41:35 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 20:41:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173896060422.1963.16792492690522172141@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-10-lucas.demarchi@intel.com>
 <173896060422.1963.16792492690522172141@intel.com>
Subject: Re: [PATCH i-g-t v3 09/10] runner/settings: Serialize command line
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Fri, 7 Feb 2025 17:41:32 -0300
Message-ID: <173896089260.1963.15775278912827903875@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5fbca7-ea8b-42ab-8409-08dd47b7d04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2NvVGdhc2xxSWRCdzh4V0c5SXFMUDFrSGJZNXRsdnNTK2pZZFlqOUtlanIw?=
 =?utf-8?B?bk1iZFJtellZVmkwU012ZHBJK09YK294YUhTUnA2MFhPWFQ0Znh3MmxIZXJi?=
 =?utf-8?B?bEtuQUNmM1NaM2pzdUdEejVsalBqR3FjNDJoWXRaUnZsOEczb3crWGQ4Z3ZH?=
 =?utf-8?B?UW40OUx2MGY0YVJScmVCKyt1SHVpNW5mRU9SU2UyZnhwdzRMQXhWc1ZXdEt1?=
 =?utf-8?B?eUQxRmhpa2VoSkNGT1htb3cvK0hTNTNYUlNhTnkzWjVNNHNiRUFpQzlIM0JN?=
 =?utf-8?B?TVIvRTlXZ1REa2xLNnQ1ckdhcmpPSHJocm9NZUQ4SnpPNUdSSGg0a0R4bUNR?=
 =?utf-8?B?NkgwSWxoTlRtQ3ZhaU1nT3RJNkNZcG14Z0NIbzhlVjJVYjV5QkFGaUVIdnNU?=
 =?utf-8?B?WldkOUc0UnhlTkZUaC91SVYwWlhBc3FZNGxvaTVDZjNYUWxEUnN6TGtlcEFQ?=
 =?utf-8?B?S1dkd3Zld3QzR1dkZGRBZENoaUd1NXhwcTRTL0tuQStldGt2Znk0NWdYNlhY?=
 =?utf-8?B?SDA3aEs0Y3ZFSHJLZ2pYOVF4Y0tNYVRsU2JEbGdqcXRkaVlyZWJEc1NsSnhK?=
 =?utf-8?B?UEQvNEJNaU5kZ1hhVCtrR1hWSjVKZkdiWUpUcGV2b1drZ2sxQ09sYVRNOGRv?=
 =?utf-8?B?UTBORXIxZEhyMDZPUW9vWjdhd3VVYlZTQTBsR01JQ0tlYVhoQUFQOTMxanJY?=
 =?utf-8?B?WWpPMzRYWFJSN1VKY1B5RGhsY25FM0ZBaTk2dm52N3F1TnBZNXBSbEFBL0NS?=
 =?utf-8?B?N1VZcyt5cEI1WHptam9yMVczdWZsUG16QUd2bVJHREtIbEFEdGZtTEVMUXdR?=
 =?utf-8?B?V0ZzSnJ2RUI2ZHprNlVPa3cwdUt3b09CTHJ6OEJxOGd6ZmNjc0N0WWZCMElz?=
 =?utf-8?B?TlhINnJoSmJXdzU1cWtXKzlOM0M0TnlBUkxYTFhHSS9hSDQ4QmQ0eStON29B?=
 =?utf-8?B?Zk0zazI0dklCM3ZtZFY3Nlp5Q1hNS2pZa0ZMTnBtZ1FXR2xrYVZrUUNlbnBj?=
 =?utf-8?B?TXV3NkU0RmJ3aktWa2R6Vkdabmw2Mk5BRVNsaTJhVTZwNUt0VWI2ekpUNmlE?=
 =?utf-8?B?MTVKV2wyUnpNY3Z1NTN0T2t3V1hpSVlmMmIwT1NoaThLUVhHalUvOUY1aDJp?=
 =?utf-8?B?OU1BNExUR2cvS2c1MG5VQXoxbll5MUxOMUlUSEJXYkhaR3FlUUVHNksxL3N3?=
 =?utf-8?B?QStjSlZsOHRhSHNGZG5kYVFhalhDRUYwRk5ZTnZEUFNCOVZNK0ZtL2Vrendm?=
 =?utf-8?B?MjdiNWJNanRFczRkZ016TVJLa3l3RmdnZmVTY2xSTUVNN00wZ2s2dlN4anVZ?=
 =?utf-8?B?MFQyMXhhaU9kdjlTUmxrUTljUS9ReXFXMi9wSWFQazBwczRhWitaNXFYemdC?=
 =?utf-8?B?NWNRb3JXdFJKT2tnOVVXWHJpclZ6b0ZKTWduYWk3ZmpPRTgyQ2JIbzFkaTk2?=
 =?utf-8?B?d0pFZzdGR1pnQmEvZXFRNEhuMnJxMkZEcEFRcDJBY2xPeGwxYkI2K3VZUEt1?=
 =?utf-8?B?eXFoM2trOGl6WkhWN3VXSVIzVHl0MzVib1ZNem90c1U4VDFRekEzNHEwUlZV?=
 =?utf-8?B?ZVJsWkgyVi9JTHNoMFRHTHJMclNFdzYydnJLdTl2aUtoTmtLTWJ0ZkFqWGRl?=
 =?utf-8?B?ZldUZzFxUHkzcUJOL0RaRnd0TzNBaXJoRjRRRHRjN2o4bHJEL3NvQ2F4ZjBj?=
 =?utf-8?B?RDgyNmlkemlCOUQvTVV3bkVENmRlT1QrVWdHWmw5Vjl4b1VKOThUN3o0T3Ix?=
 =?utf-8?B?MTRRZ25CYmJOT0xXWTVwMWtnUmJYMzhmMStXenZTQnJnMWQ5dkF5bjM2MjEx?=
 =?utf-8?B?V0cvVEFmZU51RFdlbW5VdDFhNVI0R1hSdittdlJpOW1VNFRUQXN3VlZZbzJi?=
 =?utf-8?Q?1Rv8i7HMNr+3n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFUQnRDeVIrSWlkVG1hbitqOWtybVdGNUw0MTBNQXBSOWQzeU1MWFMwUVVG?=
 =?utf-8?B?UGNjQkRxY1dGZ0oyMnJhUzIycUl1T0N6ZkQyalBEUjAvU2Y2cFpHcE1sWmxp?=
 =?utf-8?B?ZHRwUHNjNWcxK1RlZllqU0VNbHp2KzZ4TkFQMnR4aXdHYkE2T3gxTFdpdlBs?=
 =?utf-8?B?R050VVF4Z3RZTFNmSkhVc09NN2lCci90ODBWT1pDbVJxbUI3bURyS1NPSEpK?=
 =?utf-8?B?WTNmSTBoTCtkeWFhTHZHNmRUSDdKRm5sczBMNFhyK2xsM3d6VDQ5SWg1U0kw?=
 =?utf-8?B?MzJZR0IwcW9ycktBYllNT1VNUUwyaEVOaVQ4aEprWW96bHN1K0FETURoOTNP?=
 =?utf-8?B?U240N3lpMFZvQ2pEZzlSb3p0b09wUmg5NnVQQUh5N3IyaXlNVkhHb3dWbUxt?=
 =?utf-8?B?VnZRRUFHV3lqMkRQQkJRMHlsTFVrd1JoR0Jtd1FodG43UmdvSFRYNHljbzht?=
 =?utf-8?B?bkdPOUZKa0U0RVVFUDFNSEs5alFlcVJMeHZIb05oc245SVFkSHBIYzk0UWRr?=
 =?utf-8?B?SnNvazUzYXNvZmdpTmpoVlY1RHlXVWhsbG5BSGlDZElBbVVBc0ZZVjlOV2dj?=
 =?utf-8?B?NjcyZFFqdjdydm9IZ2VoTTFwU1BYU3QyU3ZKZkxmUWZIQ3VuTkl2RDJXejgw?=
 =?utf-8?B?VWx3Z0RWSUs2Y0U2bitQVjlMbWdSOXZqNGZ5dHVZVTc4eWpYdlJ3ZS9NQ3NX?=
 =?utf-8?B?ZXRjdTdnMkNlS05pOEErY0REUDhpaEdEdzZUWHpLMXYyN3pmRW55dE5Ddk1n?=
 =?utf-8?B?akhoY054ZFZkQlBKNHJTMWxDVUhmM01IL2NxYzdPV05ZU1VKMk1oMUxSL1Zz?=
 =?utf-8?B?U3pwdnA3OWpiWWZYR2dISVNHZ09mTE5BMys4bmxZYmY2MEZ4ZFR0SW4zUW52?=
 =?utf-8?B?LzZXKzNZVkFkUUMzV1NKZE51SnM5cGxsNUV5ZjBIS2ZzeDl5VGs1MGZ3dVgy?=
 =?utf-8?B?MDJFUks4ODVJTlpzNVNPZlJSY2g2NzJWVUxqc1p6dG5xT2NTc1k5T0k2OWJh?=
 =?utf-8?B?UDdaSVZSS0ZLSWNHWCs4eHlYaEZXVFlwWndhRUVIeVRGR2pRV2lwSG44WWYr?=
 =?utf-8?B?c0o2ZWVIMk9vWUtLYmZsMVNvM1hSR3NTUkUyUmI4cWY0TGt4d1dOeXZhQkxV?=
 =?utf-8?B?WWptQmdsNTU5elh5ektzVkUyR0Naall0RWs3endPb04rOW1LQXhraWFTazVB?=
 =?utf-8?B?YVFsSmFmK3hZVXNCZS9Ya0RqZ2tISGd3b2x5U042SUJMSVlZVEJiQjZpYkVB?=
 =?utf-8?B?YWZ1NjA4NWNLcWxCcEd1NVBRMnAvMEFNYVR2Ukd0UDZWckNlOU0ybTdZaWFQ?=
 =?utf-8?B?YXMweTNPUnN0by9YR3V3VFlQb0pERVBnTmRrM3hlREhnM1JjLzRxeFRlZmlS?=
 =?utf-8?B?emZ3SXp4eHM5aEFtWlpTTWZDSlRYdTlLNWFZZWVZRlVBM21iV1M2Tjc4cUdT?=
 =?utf-8?B?cVZvL05yK1N5TFhvNlVBNVdlL2N3VjdvUTltd1VyQ3YzdmlLNG1pV1NuLy9J?=
 =?utf-8?B?S24raExCOE9xaWtyTThwbkdTdUJlTjRTbm9Hblk1UThJY3JzUWNWTmhaWnJt?=
 =?utf-8?B?SVdTc0U4NWtYY2tTWEZqRkVha2dycCs0U2MwR2c5QWRob1d2Nkhidi9YajVM?=
 =?utf-8?B?cGZvRVBXakQxSFBBZ1FNWmI2QXMrNVBySXUyRFFuU1l6MGhXaUVYYXpnNlN6?=
 =?utf-8?B?SUtFZXNwenVJWUp5WmJkUTFodTBKNUZYWEd1RjA1cm9RQWxUN1E5M1ZPQ3JM?=
 =?utf-8?B?QmRodW9GaERIUnM1a3ptcmRES3RMaXoxWlE5THBhUGlPWXFXTWZZekxqdkNW?=
 =?utf-8?B?OG5MZm40aDJ1WnVYUzM2elBUaDFMdXRGUjBNTThEUlh0RHl0QlZaNXRmcGg4?=
 =?utf-8?B?clZpaVJqR3ZLL1QzdEgwWDNHRUl6dHNQTTRVZTZJMDVXN01RWUNQdFE2MnVZ?=
 =?utf-8?B?RElsMHB0UTRuczVWSDEwSnpJYnFxK2pGVWllSVptMnBXSGh0Z0pRaDZEeitN?=
 =?utf-8?B?SWFoV1BidFlCUHUyZzYyZGtpZVNiWWpBaFlCOUk5bTF0MG0xOXB4MHFlQlNI?=
 =?utf-8?B?K0V4bDRIaDREU3o3QmswMHlFREkyK1B5cndDZ0NFMWZrWTQ1WUNTU2sxL0lI?=
 =?utf-8?B?VWcvbEZ5SVRVWkkzTUh0YTI2L2hCalFVZzE4T0V1R2xtR3plWXdLMG9yRXpt?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5fbca7-ea8b-42ab-8409-08dd47b7d04c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 20:41:35.8142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcz8wr/T9ExviOP6huev1n1ag8MKKyAScCf8bMwiXjc9FammtXpDIYRe0+RGdV445aip6HI0VPRWcfj78uSpKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5799
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

Quoting Gustavo Sousa (2025-02-07 17:36:44-03:00)
>Quoting Lucas De Marchi (2025-01-30 14:21:48-03:00)
>>Serialize the command line to metadata.txt. The expected format in the
>>metadata.txt is like below:
>>
>>        cmdline.argc : 6
>>        cmdline.argv[0] : ./build/runner/igt_runner
>>        cmdline.argv[1] : -o
>>        cmdline.argv[2] : --test-list
>>        cmdline.argv[3] : /tmp/testlist.txt
>>        cmdline.argv[4] : build/tests/
>>        cmdline.argv[5] : /tmp/results
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> runner/settings.c | 21 +++++++++++++++++++++
>> runner/settings.h |  4 ++++
>> 2 files changed, 25 insertions(+)
>>
>>diff --git a/runner/settings.c b/runner/settings.c
>>index 62afd3534..84d8c85e9 100644
>>--- a/runner/settings.c
>>+++ b/runner/settings.c
>>@@ -529,6 +529,14 @@ static void free_hook_strs(struct igt_vec *hook_strs=
)
>>         igt_vec_fini(hook_strs);
>> }
>>=20
>>+static void free_array_deep(void **arr, size_t n)
>>+{
>
>We need to make sure that arr is not NULL before going into the for-loop
>below. That would be the case if "settings->cmdline.argv =3D calloc(argc,
>sizeof(*settings->cmdline.argv))" failed.

Hm... Although n would be zero in that case, huh... Well, your call. I
would still check, but feel free to use the r-b without the check as
well.

--
Gustavo Sousa

>
>With that fixed,
>
>    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>>+        for (size_t i =3D 0; i < n; i++)
>>+                free(arr[i]);
>>+
>>+        free(arr);
>>+}
>>+
>> static bool file_exists_at(int dirfd, const char *filename)
>> {
>>         return faccessat(dirfd, filename, F_OK, 0) =3D=3D 0;
>>@@ -646,6 +654,7 @@ void clear_settings(struct settings *settings)
>>         free_regexes(&settings->exclude_regexes);
>>         free_env_vars(&settings->env_vars);
>>         free_hook_strs(&settings->hook_strs);
>>+        free_array_deep((void **)settings->cmdline.argv, settings->cmdli=
ne.argc);
>>=20
>>         init_settings(settings);
>> }
>>@@ -875,6 +884,16 @@ bool parse_options(int argc, char **argv,
>>                 goto error;
>>         }
>>=20
>>+        settings->cmdline.argv =3D calloc(argc, sizeof(*settings->cmdlin=
e.argv));
>>+        if (!settings->cmdline.argv)
>>+                goto error;
>>+
>>+        settings->cmdline.argc =3D argc;
>>+        for (int i =3D 0; i < argc; i++) {
>>+                settings->cmdline.argv[i] =3D strdup(argv[i]);
>>+                if (!settings->cmdline.argv[i])
>>+                        goto error;
>>+        }
>>=20
>>         return true;
>>=20
>>@@ -1202,6 +1221,7 @@ bool serialize_settings(struct settings *settings)
>>         SERIALIZE_INT(f, settings, enable_code_coverage);
>>         SERIALIZE_INT(f, settings, cov_results_per_test);
>>         SERIALIZE_STR(f, settings, code_coverage_script);
>>+        SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
>>=20
>>         if (settings->sync) {
>>                 fflush(f);
>>@@ -1315,6 +1335,7 @@ bool read_settings_from_file(struct settings *setti=
ngs, FILE *f)
>>                 PARSE_INT(settings, name, val, enable_code_coverage);
>>                 PARSE_INT(settings, name, val, cov_results_per_test);
>>                 PARSE_STR(settings, name, val, code_coverage_script);
>>+                PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdli=
ne.argc);
>>=20
>>                 printf("Warning: Unknown field in settings file: %s =3D =
%s\n",
>>                        name, val);
>>diff --git a/runner/settings.h b/runner/settings.h
>>index f69f09778..2266118a7 100644
>>--- a/runner/settings.h
>>+++ b/runner/settings.h
>>@@ -75,6 +75,10 @@ struct settings {
>>         char *code_coverage_script;
>>         bool enable_code_coverage;
>>         bool cov_results_per_test;
>>+        struct {
>>+                int argc;
>>+                char **argv;
>>+        } cmdline;
>> };
>>=20
>> /**
>>--=20
>>2.48.0
>>
