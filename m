Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE5CC3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 08:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2029D10E347;
	Mon, 19 May 2025 08:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LiSwXAWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582B510E347
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747644948; x=1779180948;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LpkW23GqCtl8pMuTGzGMm9uQeowRcUi698pTNwnYtUU=;
 b=LiSwXAWzBN+4Yi2n7KjE5lpRBFTMBSFfZ+vsngXO5ApAAaTIPZEVP25x
 jPwIEYSd4Tbsu2xT9b6d2J1iLiDGpxWxqbE4LrDdbKUe5ttgjyEMf6D1M
 aR2gPLe+hF1KWIls1WsWEcNZjSnCHiIUnS2Rp1ZPdm/+MJCsWjspgfJeI
 knf7dXvYTDyDgS2jr4lg0qkiknFHb/CDOQBrvKVZdu1AeVZuVs+iMDCoX
 iaBtuvFRbWqvbQ0CXeMtluSbnBbjJbxvndtIOnMa1dEIX5k/b/nbwAE50
 Q+FNMMc2duca9qUtHRYpZSA9jgxV4AR+K9muiQUNH7i6ey0BiZj8zv4Bj A==;
X-CSE-ConnectionGUID: LkgeEn+VSiWta9GTLcJ7Tw==
X-CSE-MsgGUID: Q6lfCV0bTj6S27ZQPmXT1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49601320"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49601320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:55:39 -0700
X-CSE-ConnectionGUID: xdI5sdxNQ+qwPHacoyeFaA==
X-CSE-MsgGUID: WD2kRn4nS1qh9KLNNeldiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="143312968"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:55:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 01:55:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 01:55:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 01:55:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8zAvmDaW9Pzfj7QuH7381EA4Dbk/t2dyCT2Om+tDkrfe4cosiPGvWB6lgytwAaq0IV9LXI/FcPXyPQVGxc/82sYZ6LiiCvXxkPeHgthwd/WP391qWhkHdbJN9J817YW1XiFIfAdaPpXfkOwNjAZ3GBnClPPrW4ijgpiSXiQ9uz9K5i9RVu5FRv08I8MNjHUHUTCpDewVaOahENPrGNAXOxmrOwm5O0B+lcKWeIA5P1q0x2WZ1bSjBRrRn2/FcicLPpq8Zls71MG8AceNfmvHaRqyDpR8c8xLSlGgtMdgGmffqyzCh0cdRplNwucGS9BrcTmJ4UBX7TIDw7DlY/DLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oulPkQXvGeQqhVlq6hg6cBiYyKPQEglCglb9Kg4t40=;
 b=DIRcgefobklmbN/dFQRY0L8G9xVkdiDJeahogkyqHXMxZJLxpX/uUJf/+a4UGBVAF+pzj7HIeytF92hljV/P0NgRmGVphTF2qjZGo3q16PkHD4w2Kuzr+w4nvwq7nSw3PnlqZNqRDZLSVgmJJJj9uv/mniIPlUlEIzEN8hR7NhhAJU1pMQmyIhS5rCE4KHtAFCcYJ0LmAKHMzYXpcvG4L3u/JsEA7S1ySuLzNSNO+UpGGii8qhZQIIAxUt1vQxViIRCfdttxGxiKvaJCHVf9X7m+HumvINqKx8FvKYnYfUieUs4xKjId9Rz7etqKYQJqT05DhUK9XxtwW8yMSw+UrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 19 May
 2025 08:55:17 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:55:17 +0000
Date: Mon, 19 May 2025 10:55:14 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/15] lib/intel_blt: add emit batchbuffer end
Message-ID: <aCrx8heR-k4efPSj@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-9-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0326.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::31) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef1d022-f31e-4f93-3fb5-08dd96b2e0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUVpQXVFbSt2d1dBSEd5R013YnFjQ1Jib1U5YmhzNFRKRTRpcjM3UXArYUVY?=
 =?utf-8?B?V3dKWGwyRnk2d1RVTElESk9QZE80SkFhbU4wUFhlQ0tOZ0NZT1dYTHNQRDNN?=
 =?utf-8?B?WWs3dkNGRUM2emovWFMzUGVoN2JrS1ZXR1hqODVYUmlPSnhWM3o0V2I3S2Jn?=
 =?utf-8?B?elV6aldnNUZCYXkxV285aFdEbEJWTHpRV3p2cGFtRFI0R1R2WjN6NDAzZG1K?=
 =?utf-8?B?TzRSRjN3aXpMS2YxaFl6MXdVTjhOUk1tQUN3VVVveGg2ZlZYeGdEdGQ5U2Uy?=
 =?utf-8?B?N1k4WkZqOWRxOWlpcmF5a2ZhSUNlM3RzVEpPSlZkTi83YkE2SjhxTDJabkc4?=
 =?utf-8?B?L1F5emVaV1AyOHZIRVJZU0kySFh4YlVybW5pZkNsM3hWaEJ0Zklmb1JNV2tL?=
 =?utf-8?B?NFl0S3g3RkVkcU8xUDFlU0Job0JvQzRtNStUbXptNFMyS3h5N2NMbTJjRlIy?=
 =?utf-8?B?RmdzWVdtT0ZsaWl0TjZHaC9JcVU0dkZKM2RMdkZSejVscFc1cVZlWUJQek55?=
 =?utf-8?B?aWpSMTlibWkzSmpGNTdtNzM0cmJwT1hkeVkwdVpQWlV1aVV0VDhIUWxhMHRH?=
 =?utf-8?B?RmpzRWxYL3B4Q0haOVFHSGRiRm9OUFZQdlJIUGdhclVOTWs1ak9ob3BrWmVz?=
 =?utf-8?B?bUhISEpjcVNTRTZWWVo0Wm1zWFFISkRDT3RhOUFRS3RPYnVGSmNORGRwZkZi?=
 =?utf-8?B?ZjVWclUvS1JuYWJaTXc0WENoSU9wNmRwM0R5MFpGK0FtYUFWazlCS2xXdW9t?=
 =?utf-8?B?K1lOdUNmcmovbE1xeHVUTVdoWjlXV2c3QTRNRFlSa3RlM2J3N0ZZUVl4elY3?=
 =?utf-8?B?d1ZQSmlxUCsyM2t1STR5bFN0MmxoQ0E1a1VmV3Z0aTgxWW5Bd3NsOE9mNEk3?=
 =?utf-8?B?UWNVRlBqYzBCZmMwaGxZMDZ1SE0ySEI1TVBETHF3OE54ZlhUV011Qm0zMVZ6?=
 =?utf-8?B?c2JuUFVLMGNlSGd4UlBoaEtTM2phR09zeldaRW1lRy9jYUlOV0NSN3o0aFhv?=
 =?utf-8?B?ZUFHS1pHT2w3RTNOaUtkOWV2azRZcUZNSG94YnlVd1hybzZkZ09xYWNubnk1?=
 =?utf-8?B?YjhCd1ovOTZjcE1nb1Fma1VLM3p5blZGRjRWYzBqK2lGVTlGRG10ZVpSRXlx?=
 =?utf-8?B?R2U2bmM0THlQOCtwSHppdHJ3MjBqUjYra2srU2l3WDVFekt1MWhmS2lnU2Fl?=
 =?utf-8?B?UjZJUnBKZUQySDdEdm5hYlhPUzhGOTdxRHgweFNiczM4WGZzOHM0RmVubWFN?=
 =?utf-8?B?QXduNnJmNVdGVXJjZy9ybnl3UWV0KzhXcDVma0drVWFtZ3E0WmlET25TVmM4?=
 =?utf-8?B?ckpsTjdOampEbC8xUGJrQ3ZvQnJtSXpYYUFWazJ1K1hpa3JYRXkwSzNybmZC?=
 =?utf-8?B?RmNQOTE3Nk1jSFpLb1cveEJIU2YyOHdJNkduV20xQkZydlA4ckg1M1F4am5W?=
 =?utf-8?B?bG9kVFA5R1ZjN2pxM0dLYlV1a0xBQlVMbVR5ZTcrMWhpUDRxc09yS2JlWkUy?=
 =?utf-8?B?aVFrOXdzOVBsN2JVaFRyYUU5WmJuWmR1dXNnRTFVZ01May9VRE1mN1lmeGI0?=
 =?utf-8?B?Q2h3NmlEejd6S3NmZVQ4S1ZTU01VRVhYNE9qc3ZjT2FQVk9ZempxcE9zcG5j?=
 =?utf-8?B?ZC83a1ZVMGIzMFJ1bGpTTkJVM1FDczFVeW9pQU9iclh5ZnZKeFFWSzZTWDA1?=
 =?utf-8?B?WFp3aGlOVzJmWlVBVXJLaGdGZFVYVlVWeUJ0b0NkTFpWNlVpUUs0WmtrTDVG?=
 =?utf-8?B?N29GQmgxaGNiUFhNeGI2dFpzYmtGTmxJQ2N5Rks3VjhqSUJiSTdHMHlVOWcy?=
 =?utf-8?B?bm1oSDRWN1Flek5GTUtFZ3NneWZsdFlDZzJtNVc5ZjFzZEpKYUM4dXExb0Zm?=
 =?utf-8?B?U1dadlhIZ1REUFRhUkZBME03ZXNaVTdGcUI1QzYzbTNNcXhMK3ZmREpWcG5i?=
 =?utf-8?Q?ZujRev6KUwI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlpZkwwUDd0K0dDbEN2WW9IbkZhRUNwa1hNamlpR2RCYnhxa2VUNEE0QWVv?=
 =?utf-8?B?aHNOYWtYZVlpVlI0VmlkZ1BEcWluTzRyYnUzUmNKVGVGUSs3a21yTnBKaGxZ?=
 =?utf-8?B?bUFzaXRGL1ZSU1FmR2QwTlBqNWljT3pjK0hBWEhIZkg5eUpCa29GYXBDckZ0?=
 =?utf-8?B?WFFVdUdNR0ZtWnk2NDA4Y2NSem9nV1pCWW1XVGhMZXp4TVBXSUI0STFaY0JI?=
 =?utf-8?B?RHc5YlE1S2VTU2FkQXFCOFBuV2pSb096S1ZtZExFakRLN0pXblVhYWJaYUM2?=
 =?utf-8?B?dk1pYzNpc053Ty9zY3hMcnUyblBoL25TSXY2U2QyOVMxWXR1aW80VkFteUhU?=
 =?utf-8?B?bktYdnpWd0pZZHVQZ1hleTcwTEV2eFhXUGNBQmh3VENEejRuclJ3dDhxemJs?=
 =?utf-8?B?T3VNV1pOaTB3WGRvVVNqZnRuSW1uVDJyWXVqY0NSejhaNFhINU5lY2VwNCt6?=
 =?utf-8?B?Tk9sZnJhZGZqQ3F1N3FXazZFNVk3eDRVTllFQXJQTXdSb2MxOXZ1U0E3WHBt?=
 =?utf-8?B?ZUpEK3V6eVJOZGl0VWRPUEN5VGRuOUcwK1pjNkl6aVVhd0lrVHRZdlRzNGZs?=
 =?utf-8?B?M1lDU3o0YnREdFhwQ2hyQW93MUpSbzJ5VzhCMWZvNEdQdURzQVhlUUdTSzNt?=
 =?utf-8?B?UkFtNHdGVnNuakNXbkIrcnJOWnZIUUc5TGVpS29wcUhYbVJSRUt0dG5raXNr?=
 =?utf-8?B?NmNmcE5ibGJIUGRuYlRvYUs0VE9mTVVrWThKNDNGRUVTSXRYMEc4a3BRS0wy?=
 =?utf-8?B?S0ZodWtlUFliR0g2NWErM0JIUlpaeDRYOVpXQTFsWmpMOVhxVTlSRWZjRW00?=
 =?utf-8?B?T0ZKYUd5QzlTMmRFYUtxalRMblNGekhWYWIxSFB5SEY3WkIwNEFLNTJJT1pr?=
 =?utf-8?B?TllxUzFqM0lLaTZBUzBpWGdHMWFKRDRKM3hBbFhuRVFwV1lhL2wwRGNyajR3?=
 =?utf-8?B?bE9mdjEycVdKcnltL00reHdDeWZlbzNFY3ErU25Zc3RDelhYZkRMRGwvejBq?=
 =?utf-8?B?UXBGZjJTOXdNWjl2bnFXbHRjZkwzNmtIQXptL3hubjNRQjVkck92ODAydE8y?=
 =?utf-8?B?ZEx6NWN3STBLTGo1dFBteXc0V08zNStxWW1PRmhnV2huVTh6UXF1eTRhRTFz?=
 =?utf-8?B?UTlRN1RVTTlHaW84b21zYnVWai9hc3JKRDdXdk5iTlhqcjBDbjFWNW5MVFFx?=
 =?utf-8?B?R09MK1ZZdldlcjZFQUZ0bUhaSk9ucWJCQ1JLQUtaSml4emdNcldoKzVjYVVm?=
 =?utf-8?B?dXdkT29UbFM3cmZnbVRVVkk1WExLelBLYzZtQ1F3MzNibUJuaVpwbmVTeHpE?=
 =?utf-8?B?cFFpb0hXL2dJek9sTWMrSHU3cFI2WHZhOWp2MFVsN2RrSnpsTGQrNDJabzdP?=
 =?utf-8?B?aTZzeWRVR1ZkNlNXQVFRV1V1WFVJc0xvQzNwNkV5OEg0eFY4aXgrZ29NZ2NQ?=
 =?utf-8?B?SGhxT2dCUXk1Zk5Rek5RWUpNL010dVBTWnVwQXQxdmFKVCtPSTJ0bEt6a3Vp?=
 =?utf-8?B?MVFoMEdrUWtBK29CNHNHb2JPL1R2K3JiSVk2WXo3T2Q0dnU4aFc0VUZkd2Nh?=
 =?utf-8?B?OFlmWVlpVXp0ckFwcDVCOTFpNDJ0ZU5TTE5ZeURoUlk3ZTFPTWtnMHBoSnpn?=
 =?utf-8?B?U0ZEdFVDZDRzTHBuNkFkSmtVd2c1cU9kU1ljaUJSYTZqV1I0NXdlV25GV2gr?=
 =?utf-8?B?ZElmdE8yZ1VWRlptTkV1dTFZZ0Jid25hd0JvOFZ1UHZCSDc2SEE1MmVqdnJh?=
 =?utf-8?B?RjJ5cUx2LzNjUXlHSlFqNkl1QlNDMS8yMllpbzByR2YyZTNNRy8zanQ4Qk8z?=
 =?utf-8?B?UUZWZkU0Tm5zVWo0SVdvT1Y2OVkxWURiK2h6STFDRGF6RU95bUNWaW01MDY0?=
 =?utf-8?B?OCsvbTBNNXpmdnRlSFc0MzNzMnRvOFV6Y1hnbHNvRDdyb1E1Qk1KdERMaVly?=
 =?utf-8?B?REdvd1VSejJRaVROVExxMHdJZG94QWlnZlhMb2N2Z1NReHpWVGhWVlpQV3p5?=
 =?utf-8?B?Z3RrcFo5SjhaR1E4SGhFKzZlbnBNL3dvM2hIQ3VQcW9UdDV6bGNYMTVTT2NU?=
 =?utf-8?B?b25kZkptRzlGWVhJeU1NUEtCK1hvWnZ3UU0zRjFYSnE3Qk9ycUJOcjZQdXJZ?=
 =?utf-8?B?NERyUVZzbDFDRzVTNVZnZFk5aFNFOFdqQlg3clJmNVk5YmxMQ05Gam5oV1N2?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef1d022-f31e-4f93-3fb5-08dd96b2e0ad
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:55:17.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rvOy4Ey75vdnQsIsQW2t4VofcG6wzgUVxXHicWewNPxpbSwkWuNtPVX6C7p/qGfK+KlviYWeHKEbUv1wfdx60/sl4QdtiMKJGU+1rMANkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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

On Tue, May 13, 2025 at 08:58:03PM +0200, Zbigniew Kempczyński wrote:
> Blitter functions allow emit BBE on demand. This gives the caller
> to combine different emit functions in single batch.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_blt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 6bfaf09a2b..04549ab42e 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1820,7 +1820,9 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
>  	mem->copy_type = copy_type;
>  }
>  
> -static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_copy_data *mem)
> +static void emit_blt_mem_copy(int fd, uint64_t ahnd,
> +			      const struct blt_mem_copy_data *mem,
> +			      bool emit_bbe)
>  {
>  	uint64_t dst_offset, src_offset;
>  	int i;
> @@ -1846,7 +1848,9 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_copy_d
>  	batch[i++] = dst_offset;
>  	batch[i++] = dst_offset << 32;
>  	batch[i++] = mem->src.mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
> -	batch[i++] = MI_BATCH_BUFFER_END;
> +
> +	if (emit_bbe)
> +		batch[i++] = MI_BATCH_BUFFER_END;
>  
>  	munmap(batch, mem->bb.size);
>  }
> @@ -1880,7 +1884,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  					  0, mem->dst.pat_index);
>  	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
>  
> -	emit_blt_mem_copy(fd, ahnd, mem);
> +	emit_blt_mem_copy(fd, ahnd, mem, true);
>  
>  	if (mem->driver == INTEL_DRIVER_XE) {
>  		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> -- 
> 2.43.0
> 
