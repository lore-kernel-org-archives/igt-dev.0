Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0184ED4A5F4
	for <igt-dev@archiver.kernel.org>; Sun, 18 Jan 2026 04:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E5910E0FA;
	Sun, 18 Jan 2026 04:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEfSf4C+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0946910E0FA
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Jan 2026 04:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768711350; x=1800247350;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tl3DzwmfFcCAUy2DySxQcaJFKZWFUrquz4/OZ2RV3qY=;
 b=WEfSf4C+wUo8J+qt7uaHSfAUgRvCV2YagHyOK2+zw9DnNRRnnv7jgQ9V
 BYJEBomR5YupxzY/7A/GAmp9FAsRs0ffkamF1fzQGLo3qomrBi+AXukMq
 gXlZ6sQTdNmZeEbzDGb1KoBvodOHu+zU7s/5VFCbkCvE4p5VCiPK1Mzjt
 fPUePQmHqVOaM4A262dYbLIeoW3XE9Q/aF/X3q8g2c55LHSYBE5Xx9RLD
 GEcmK66ru0uo035MqMNZM2KChTAON1MvkidW0J5Idh2xpUscFlfwqR3rK
 Ff7xq/TfMWoZEswlrLhEKyyrcOi3iQhUdidQo5JJTp+ZuOTehcdDFXAXA Q==;
X-CSE-ConnectionGUID: PNIIaCYnQXeCdmrYzh/MKg==
X-CSE-MsgGUID: bSxVDdZdSvOcu8c9MphZtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="92636297"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="92636297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 20:42:29 -0800
X-CSE-ConnectionGUID: 64RJLteyTg6MS53JW7TlCg==
X-CSE-MsgGUID: Z9Ep1yLaTuStZxRZUJLufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="243137751"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 20:42:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 17 Jan 2026 20:42:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 17 Jan 2026 20:42:28 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 17 Jan 2026 20:42:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh0BmGibLHz3JpI03aZ7nAzyiPUbeD5Eluo8LY60cTrWhWzn2yME8svfwm/rz+XbFdcUhAwW6R1bbBros8sAckgxkvtosK8lZwH4ioYSQeZW9zye63L5O/Sx9GWnjAMlcOLyUJ65W1HIFrIT5Twsy2xak3zncLMUJESVBO5sc43yJidgbcwr4hs8FUUiXGoP6Go+sUziJJ6uZyNR3OEDY9xYflAaE+L85aV+GT+39fJGCWPe2EhgIpuYYvaKkiPnr9vNEcjHZtgCQHtKMbUuxDo9M4lpV1tBI8OIbSnMqxGh4O7Ix5fS2W/9Dq8hA9KLXDA7KtRHKAB8RIHY31pHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udsRUKXwSqzgwEUxQUhB4r9/ZXs9ggfDcxr1QBCtTyY=;
 b=Klp/wf8W/bGt83Jv25sNYvvyjvHaOuHpvCuOcxazfgAL1LGeksk+0h725HkgyBUaYGMKPp1AVANKZ3mbwFkrHCicJazfmvnlLK3xGup2w2drrd10Q4a/7GFkUB5NbVu7rILcexjiA7FOEDqxnpwrLO3bNKd0Nkm8x1Yx4OhgTBglT1ggA4f3fLMHnU38Zq+04ksFtBIGe8HyfZRqaYPNvMn+Jl8amzTCzTwVPdv1YZfptI2AWA+bp9k5q2Vp6kzt5X+WP5vsufF5Oki+iLkG6cXgs8932lh4gUFDxQD3Q3AM0bz2k7Ju1rIrQWjCvGTZ6vnMXq0os1juI8UTmy586g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sun, 18 Jan
 2026 04:42:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Sun, 18 Jan 2026
 04:42:26 +0000
Date: Sat, 17 Jan 2026 20:42:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Message-ID: <aWxksBjMDVhWIm+Z@lstrano-desk.jf.intel.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115222938.330490-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a721c13-df6d-412b-cdd7-08de564bfaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnpQL3JqRnRBTnVoWUJvZ1hySUF2SzAveWFnN0hqdTVrZkdSSXFpaGlyenQw?=
 =?utf-8?B?TGlNYythWXoxS3Q4WklFbGJsaTdvN1Y2UkVNN1hFcUpRdEFQd2dJQVFSbUQr?=
 =?utf-8?B?a09BVTZQc3hGM2NyWXhSY1AwOHVuakkzQUpVam9zTDhFT21KbTczc2x2dGhB?=
 =?utf-8?B?V0pFbWNnTEdGTVNlemlCQmUrd2lRaTBIaVBnSXhvRkxLRUhZQTRFdk5YdG1a?=
 =?utf-8?B?NG0zem4zaDJXZ2NkbnhpaEc0bjMzQWRhdjkrUXcvUTY0TUdiN1hCZmVIRlBB?=
 =?utf-8?B?WWdGUG8yYUlKZmR6QnRSMkM0ekdYN3Qwc3pCOHZ3OWR4SGV5WlVyWGF1ZUov?=
 =?utf-8?B?ditRY0FKRTlzbkxTNTkxNEpwZnBZVStnZms3MHJ1bDNNdnZZMHdaZUg1WUw5?=
 =?utf-8?B?ZFNQa3RwREFlUUhIRmhtOGpSVHBPeWdsYWpwTHM3S3E1L0lmWnBDUWxpNEVH?=
 =?utf-8?B?bytXOGh0TUp2VjZRd1JxSGxDQUVZUmlUTkRZazVlcURYMkFTUGN5L1dCYW9v?=
 =?utf-8?B?Tkc4UjQrOUUwam5oTS9GajlQcVAwTFhsWVFyTG1JR0FCRStiQmkvWFYzczly?=
 =?utf-8?B?U0pobDJQRGdDb01DR1VGK0lYN3lTQWdCLytUMTR0Q3g5anoxU1RSKysyN05p?=
 =?utf-8?B?SldIeWJVU1B0WVVROXAyQTBGVWpUY3ZpSjVrQUxxMUpHYzVBOGVKOTFxYUJE?=
 =?utf-8?B?RTRIOFd0enJxMG1ZS1MxWDhpeUc5M3N5UUNYWFB3UGVoMk16RStNR2c3cm5W?=
 =?utf-8?B?ZHZkeHN0dk1pZmF2ZHRJVHFGYjRwUC9EQ1A1eW5zNmFRaFpRNGVzNkxqMkRH?=
 =?utf-8?B?T0grRVlrZHk2T0xuUFVWdTNkS3VkWjJyNGtCUko3VUFPejFpa1lSTTlmUGY2?=
 =?utf-8?B?a0J2OElkektDYjNrelgrTVVKZy9qcnUySER5N0xBTkRHV0NabklZbFczdTF2?=
 =?utf-8?B?cUY0RzR1UEFjZ2J6ZGxScW5YVHVOcHNVNnZndlg2M0Iya2hrNVFNb2ZCQXRO?=
 =?utf-8?B?NGhhZHRTZXdab21ZOENTR09GQTVENnZGQzNCYWp4OUt6dHFLRmxzcEJzUVY2?=
 =?utf-8?B?ZTFXcmdveVY0OTZpVzFvUytqM1k4ZGZvZWd1TXI0UU1jL21lelloVHdncEFS?=
 =?utf-8?B?K3N3dHloL0xYMTFxYXpuTW12d2JWZ1lHeFI2Q2t1dXZzOE1zRWxkVUd2M0ZP?=
 =?utf-8?B?R3NlL2FIQ05mYW81a1Q5MERaWFlrRUlSc0JPTkVvd0VyMDh6SjNULzNGVmJx?=
 =?utf-8?B?eGZsTG5UMGgzSWdOVy91RTQ4RXFRSjNVT3RwVGRhblpGeS9taEdVTEcwQ3dM?=
 =?utf-8?B?M1krQTR5YitRUitEWVphZ01oQnZwYUllRlpRZTVrL1hJQmc0R3dCblFmWGJH?=
 =?utf-8?B?SmVFd3VySThqZHB2ZURjVHdwRENsRDVHdlRBUmc3SEYzZGh0a0tuU3FwZnlQ?=
 =?utf-8?B?VnFiK0l6YStIWHR1U2tFNnphbmhLeDJFTWhOYnJMc2FScFVHcmw3emZibXpD?=
 =?utf-8?B?V1I4N293MXJLc04zbmxwemFUQmpHaGdxOUJiQlNiLzJVQlNzVEs5QTR6YXNz?=
 =?utf-8?B?U0dkVGU3cm5vdVQ4dHE5WEt5N0ZRNTJOd3RuU0UvZVN4TUY2ZjdRbGhZQlBS?=
 =?utf-8?B?bDV0bzgwZUhSS2tZcnRLOXJieFU0YlFuMVVmdml0cWlGSlpvMG1COGVCdjVP?=
 =?utf-8?B?VDdUbHpScW1aQVAzMHJxY0theXlodEdVbzhVL0h4NFloTmRCZnh3d0IrenRH?=
 =?utf-8?B?MG9VWEw5Z0ZwckJ5WCszTTRMdGxZd0JOSFltWVFnYWJKZUppYnJiemwvak4r?=
 =?utf-8?B?S0VQZFBKZmJKTlU0SEJRcGdjTFdHZ2VQZU5VNWhHL2ptL1JndzZaa2JpeDFX?=
 =?utf-8?B?N2NRZWlzQVhtQ2xiSzNFbm1uK0ViVEoreWk1WVF2TzQ3ZlplenhvMUtoNmdN?=
 =?utf-8?B?djVXTHMwMU9leWVYdUVZS0NZdm1mendtWCt0Z0toSU9Ubk1jMWp1Z2R2dHBs?=
 =?utf-8?B?Rmt0M2ZaVXlUZmJuMENZSFpRK3JBa2FrMWNDKzMyeWs5NkhDODh6NGZNTWs1?=
 =?utf-8?B?ekpKdGhxU2pmSVBROWkzRUJIeHlxV055UUg1a25kajRORU9zcmJ5eXRSbWlN?=
 =?utf-8?Q?8wAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmM4YklUVXVTN0ZrRkFzWlBOTDNXblBKVnpmRVR3Q0ZkcFF4bXdSYUlDZDJQ?=
 =?utf-8?B?ZnNwT0puZDdjSW4rTEZLWjNKN2JUVG9yZWkzZXJPenJDVlZkV1pqdVJMeW9h?=
 =?utf-8?B?MVlDanJQUXlMSlUvZkhkbWZqekxsbHREOHBQSDdCN2R0QXVYUWhWNXNIclJl?=
 =?utf-8?B?MUQ0ZWJ0WlpZQnN3SVdDRjl4S1Zzd2xzcGh2T1FoVHNJVVFNTDdSaGJMb05L?=
 =?utf-8?B?cHZCd3RrS0p3dFpWdUF4U2dEbWQ5RWJ3WEQwbkFFckRiSVJUMG9XRkgvMnFu?=
 =?utf-8?B?NkcveTZLZDFnekpiVk43N3MyL3ZGKzBtbTRtazZXd2hKUmRnd25wNE1rRXdV?=
 =?utf-8?B?MjIxWmRQRk1Pbys2Qkw3Sm5KYSt5NGl4aDNYcnphOURtSkg2cWNqYXZWYVU5?=
 =?utf-8?B?bVV4ejJZczlEQTkvYXVoRTVsdmFZZ0JZQmJxd25GK1dyazVaTUJLSS9qVGRZ?=
 =?utf-8?B?dEZFMXFoNFRsWGZUdVI4V3A4S2MyQzl6VG0xR01GbHRwRmdhakt3YlRaQ0F1?=
 =?utf-8?B?cUZqVzZaT0dTSHlkVTYydEViUE1qWkE0WXhSSDRpQks0akpMWmdLOTNpRUZP?=
 =?utf-8?B?alB0U3F2ZkIyRkR0Q1I0cVhFSSs3MGVpLzFNc3crcUJJN21YYjhwN21lMmZm?=
 =?utf-8?B?Z2VGRi9wWUJuUWRNMnFSQ3FBSXpQWXBoL1pUckpKTFlhZm9SWUJ5QTF4bHd1?=
 =?utf-8?B?bjgvcjVwa281dWkwQkhWeUozb25hOUJCcDVCdlA5amJMZjVZY25VODRFMXds?=
 =?utf-8?B?T3NPVW00eC9jbFF3ci9nLzJGc1Y2MU1laWV0Uk9TeXFZbk1ReHdyR0krZUtL?=
 =?utf-8?B?ZXZ0U3pMY0ZQMVVXSVBoTzFObWZIcUQvUW0wc2kzci9vaDFZR09OYklNNGxE?=
 =?utf-8?B?dWZsS2Rvc1YzTWsxQVNuNHJ4WmRmeUxCdWQ1RUM3VFFvSldxc1ZLTGJVbUFW?=
 =?utf-8?B?NS9oRTdiOWJDbWJreHM0UFdOYlJBRGNHNzVuSnU0ZENmS0x3SVdUckhwc3Ur?=
 =?utf-8?B?SG9PSWJCNjFFdnVNTWNKMzIzcWY3S3A4UnpOaDJ2RUJybUV4NXBoWUNCSDRr?=
 =?utf-8?B?RGlrUFJLZGRZdnFBM055anF5TW1tenYvOWVvUWZxQSsrZDBJY3Z6d0hodGRB?=
 =?utf-8?B?UHZJVSsvc2RhNFRVZ3UrYjBrdWlZb2VmcURZb0tBczNWL05nSG0yLzV2aC91?=
 =?utf-8?B?eFpOU21YWlFESVhXUWg5RUtqbkJtQnJOZkgwRlhIQ2RXV3phWDZzZXZmYnpJ?=
 =?utf-8?B?M2dtd2N4MVFXdzU1Tm9EV0xLSnM5dnkvdVRsazBxWGV1dWROSVQ2Qm42RE9i?=
 =?utf-8?B?aS9YeW1pOXZQWkEvTEJ2MmtzWUU5SlROK0dTZTJIZytwVVFyalNyd2p2MTYv?=
 =?utf-8?B?NjNzNXBzOVd3dEpkZlRxQ25BMWpkbXUrQ0V4OEZoUXZ3b21zMEMreDZndFJI?=
 =?utf-8?B?U1ZXcHNlMHFNYUp5SUJBaGlYOTVhbVdsSE1WNWJZVlFmT2d6aFpZMzUwWmJk?=
 =?utf-8?B?cmQ4RWczMnQxcDhTbkxqRUlNc1hKUGtSVExUV3hER3k2UHhMNzJLaFR5NnBh?=
 =?utf-8?B?TWh2V3RyaWtqQkl4ckNXREVyTzN6WjVHK1UrMTdNVWhVdEhUazNDSUdwbzZY?=
 =?utf-8?B?dGVrZy8vTXBkT2JMRnlDRnEwS25pOWl2aThRTDZkT0ZpVHVwc290SzJNWlA0?=
 =?utf-8?B?Wk1rc0ZNcXd2WFFtdmc5MXFxNnhzN3ZmQTR5cVFCRVhDY0NMOEFTRnVLNnBv?=
 =?utf-8?B?ZC9Xa2RkN1Z2REVrZU9Mc1dyeXFuQkxYV2szbitXckplRS9jSEIxbWZhbEhN?=
 =?utf-8?B?UWFTcDRuQkQvckR5a0VPamF0Z2RzbTA1QVgyVTlyU01ydU5GMlgvb0c1TzIw?=
 =?utf-8?B?cnI2NzhhdGNsZXp3THVEdnJCYVdMc3BGVU1uVFUxRk9XK1FaeWozQUJjR1lS?=
 =?utf-8?B?SjFZTksxU2FkWlRuUENGVEZlVmpJelQ4RjhVd1FvdWZ6SW5KT1ZRcWlpMXJ2?=
 =?utf-8?B?QlFnTnZoaXc4N0NsMlNJUkFqdHcyZ2hVSzdtRFVTV1Y3WnlEMUJCaUV5RTll?=
 =?utf-8?B?UDRyNXdvbXFRYjloc092Q0ZzWTlwY0FIRkZzMVFMbU8yZnZ3VGdHNDFBRE8z?=
 =?utf-8?B?Z0ZhbUYzK1Mvb01TWWpTVlIwZzlUdlp4WTl0UWJEazdROXV0Z0thaHFTVTJB?=
 =?utf-8?B?NFMzQVhzbnBZNXhIRTlyNmRXdUJpSXBmblM5TFFhNEFZL0pPdHEwTWVNRDRV?=
 =?utf-8?B?YnNET0lXYjUvaVIyL09JTTl1dlRwakxKVTh0dGlxTFlmdmV2UFhBQmVpemtk?=
 =?utf-8?B?VXZKUEdTc2pOTzlLc0hvMnlXejlURkJjREVmTTFaZDN6amhiay9DZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a721c13-df6d-412b-cdd7-08de564bfaae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 04:42:26.2948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfs9hUCSxhQhqWIWjDaV+o8rW2XnPX59AHxzfDvi8dq5JyjdZHTjdrkz52hhSe+UX76a+c0PhrB8yv1FLCb0WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
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

On Thu, Jan 15, 2026 at 10:29:38PM +0000, Shuicheng Lin wrote:
> This commit performs a set of small cleanups in xe_legacy_test_mode():
> 1. Remove a duplicate comment for BATCH_DW_COUNT.
> 2. Move LONG_SPIN ctx_ticks initialization to after the fd is opened.
> 3. Add an assertion for CLOSE_FD to prevent fd leaks.
> 4. Unmap data before returning to avoid a VM leak.
> 5. As i start from n_execs, which always will be non-zero, base_addr always
>    will be assgined with addr.
> 
> Except for item 4, these changes should have no functional impact.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Thanks for the cleanup. A better cleanup would be to move this logic
back into xe_exec_reset.c and move any tests that use this logic to that
test. I originally wrote this logic in xe_exec_reset.c, and it later got
moved with an ack from me — but it makes absolutely no sense for it to
live in some helper library, especially since flags need to be
duplicated across both the tests and this so called library code. It
also makes it harder to modify any tests because you now have to open
two files, modifying both. 

I know this isn’t your problem; git blame will probably tell me who to
reem here - I hope they are listening.

Matt

> ---
>  lib/xe/xe_legacy.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 084445305..dcd7e2075 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -22,7 +22,6 @@
>  #define CAT_ERROR			(0x1 << 5)
>  #define CLOSE_EXEC_QUEUES		(0x1 << 2)
>  #define CLOSE_FD			(0x1 << 1)
> -/* Batch buffer element count, in number of dwords(u32) */
>  #define GT_RESET			(0x1 << 0)
>  #define MAX_N_EXECQUEUES		16
>  
> @@ -65,9 +64,6 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	struct xe_spin_opts spin_opts = {
>  		.preempt = flags & PREEMPT,
> -#define THREE_SEC	(3 * 1000000000ull)
> -		.ctx_ticks = flags & LONG_SPIN ?
> -			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
>  	};
>  	int i, b;
>  	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
> @@ -77,8 +73,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & COMPRESSION)
>  		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
>  
> -	if (flags & CLOSE_FD)
> +	if (flags & CLOSE_FD) {
> +		igt_assert_eq(fd, -1);
>  		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +#define THREE_SEC	(3 * 1000000000ull)
> +	if (flags & LONG_SPIN)
> +		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, THREE_SEC);
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * (n_execs + extra_execs);
> @@ -175,6 +177,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  			for (i = 0; i < n_exec_queues; i++)
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
> +		munmap(data, bo_size);
>  		drm_close_driver(fd);
>  		/* FIXME: wait for idle */
>  		usleep(150000);
> @@ -187,8 +190,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>  
>  	for (i = n_execs; i < n_execs + extra_execs; i++) {
> -		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
> -			? (addr + bo_size * 128) : addr;
> +		u64 base_addr = addr;
>  		u64 batch_offset = (char *)&data[i].batch - (char *)data;
>  		u64 batch_addr = base_addr + batch_offset;
>  		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> -- 
> 2.34.1
> 
