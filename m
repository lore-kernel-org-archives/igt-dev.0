Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D02C3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 20:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D001A10E051;
	Tue, 20 May 2025 20:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfOjXhYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA86010E051
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 20:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747772642; x=1779308642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r9Y1vTQgGF19OH9VjwTSG/0RGELJeHVLUcXvLxrDNSY=;
 b=jfOjXhYUuEy8ZC13Ob6ilSSzqte7h4DysGMvsH4XZqyZ97Vpv475KRFi
 Ty4tC2m61yaFTuJhlBpRRS5OAMmXz5jZMSpgfYiGTO/32y1h83ijBTUwW
 tH6Ymzi4hkivHw2iETIW439xlBJKXMyvH9MK9GZJ7PLVJtYYiFN2D8jBl
 TQadBfy4vFnSYoERMAkfCZYDT4czfx5HOBUIrFHRidU/+KH9s2vAxHqWh
 yr+qd8sZR/ZB+vw7jjSR2J23BUpEoHMFZhIqd4vecJk5Z5/Pg9NUPT3it
 3j7ditw0E6duwb3OBqdJ2Ahly5TAsH2EQSBT6RQZRepeHd11U6J9EXzqP A==;
X-CSE-ConnectionGUID: GlM213Z8Tw+H0H12AQF9LQ==
X-CSE-MsgGUID: LLiWf+4cT3SEiEV5/odKsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60383497"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60383497"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 13:24:02 -0700
X-CSE-ConnectionGUID: IBKKbuk5QR2g/cWiegrTUg==
X-CSE-MsgGUID: rjzndqQFT9aNxYm0AzsolQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144937770"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 13:24:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 13:24:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 13:24:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 13:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q77ghduoymyLmGE5Qsaqn33C9mPwnw7/FvtCIdaHiPnIQpd4p6u2zYrufjDO29kDwjXPLIc74m/34Iu5wY+moc3G9tOHLwdf7K+SPSM2nlmEqJYk8/RGGRcxWXKLEFRvJXAqzIKyCCcxIT+xoujGaLVDw6l3ldpjc03b8o+WGT4CNGOKAGo6IZojeutFrW+RLqQ/+sNKJJDw5l3MfOGDC/E98+vsbwz4DAQidaw19o7cDRWodccQqlduiZtee2tgKByoiwUqHuhI8BlgR0SQf7vcGqjTJEq4AmC5Rgr1gduEfOrkN7zQLoBeUe7oV5u1v5g1ne7F/VZmmKntSQ8WqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuNy1OZB+TPtjsLzPsl/dxafj/82TEplKFjs0tbgobw=;
 b=gIqwunR62AX/RzOT0VK28t9dQiStV1mDv5+T4EG9kp6kVj6vugBBHp+728+yZPse253oCFrsmiiq50CavWEXVPWW9K7qV3En/luVhulOEJXmKB47nckfhU/fdzrz8hx1nQZVSV1auZr+mqHfheDdxVYfAwFl6vGGSi2ATv0zXdx2h3LAtgg9NLj/o9f+wF940z5TLXxiqP2FCvrFMwS2mfmTryxjKomM152dzozg9GlP9BF05go5wrTC7tvs1S/S/rX3OKTAojTi8nMEwlEV+yWJ0WeM3Q9BP/Ouf6x2084RIjQANAy+qtfnmhV98HdgNDewcEjsk469d0IBY1fLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB6767.namprd11.prod.outlook.com (2603:10b6:a03:47e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 20:23:58 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 20:23:58 +0000
Date: Tue, 20 May 2025 13:23:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Add test to check for
 active contexts
Message-ID: <aCzk0B2GH-Zpu-0S@unerlige-desk.amr.corp.intel.com>
References: <20250425192102.1551877-1-umesh.nerlige.ramappa@intel.com>
 <14ccfccf-2d7d-4381-9688-9945ddbd1491@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <14ccfccf-2d7d-4381-9688-9945ddbd1491@intel.com>
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 7609f318-9704-43f4-d8b6-08dd97dc3ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3VtVW1HL21NZzhONzhSNVF3eFNhRVlBT0RKTU1FV3NFenZ2eEtaYWJRa1hZ?=
 =?utf-8?B?bFZwNTI2ZWZTUmlLTVZCMEwrTXk4NlczUkNUdmFFVTVnUWVoc1hqNnVxc2Yz?=
 =?utf-8?B?d2x6eEJGa2l2M1A2YkpQdi9aWXRmeHdabVRDRHpxTS9tZTVtN29Md0drUjhS?=
 =?utf-8?B?YThZZEx3cUZuSVFCZTd0M0FWcGFMNkIwWGMxd2J5c1huWlRRQThPdVZSYkU4?=
 =?utf-8?B?NHVrbHVqS0JBUks2c3YzM21SS2VJZ2k5TjFqSDA5b2FoVTRwL2dqY1NZYlJr?=
 =?utf-8?B?T0lMT2F4Wmp6QVVscWxKUmwvNjBINytOY0l0TVIvc3RwYVFXQmpvaUIxaWNx?=
 =?utf-8?B?NEpEY1ArdHdQYWs1OVdCblBQbWpLd0w0K213andDU3k2Z0R6V0JqdEYwamw0?=
 =?utf-8?B?SHRndGNvRmwweUxZemo5YTdxdTB1dVh2ZEdab2FOLy95dnhHWVljNXZHQTl3?=
 =?utf-8?B?KzhoRjFRR0MwYmErcXAxWEJsNFdDR0ZvRFIwclVxR3Z1VEQxU0syUWVHdjQ4?=
 =?utf-8?B?YiswUkFhTHozNVFTa2lOWFkyblltTi9NbFNzYmswVlJDczM2eE15eVFZTXZX?=
 =?utf-8?B?L0FaN0hxQThKOGNTV2YvbjBIbUdiYUQyM3lLUUVLdzhKNm8zekhYNkdWcFBk?=
 =?utf-8?B?VlYyQ1BGdFJGM3FFL1VYR0RyT3dtOW5YS3YyNG12UFFSRVdEek1DbTJVQ0k4?=
 =?utf-8?B?UkRHUmQ3QjluY2xvM0ZaaWdERzJ6dURpaVFqNGJsVTVOcWpGR0Eyd3F1c01z?=
 =?utf-8?B?bGp0dFFUcTY5WnhJMlBkTUVXNm5xNUJYQkNxVS9XNlZXWnNjSS9pc2xpbG01?=
 =?utf-8?B?UGx3WmUrc3lBUndHaEx1enRyWXRYZkVzQks5NHR6NHlSeFB3UmQ4aW9aUGZU?=
 =?utf-8?B?bEpYYzhaOUdYNUVGWW1sM3NTYklCZElrUjNwSmN5aVNRSHZJL29RYjlKYU5M?=
 =?utf-8?B?NkIxSkJvMTFjTjFUbEhFOHhHWW5saHRkNngrU0p5Z0xGSFJ6RmhkMkYrZmRz?=
 =?utf-8?B?TS9RdmNxMlBUc0RyR2RpREVVWEFvVDVQNDZBVndjakpzZFg4QjJjVFRDRHh4?=
 =?utf-8?B?VVZJeS85TmtVaTBkcUVQZmpSY2Fnam5sK2NJaUoydzl6RWRxUUF4RmgzL253?=
 =?utf-8?B?dExhNnpPN1lvRG1uVnViT2xERFczMjc3VHM4aUwyekpVai9YSWw0MW4ySVJ5?=
 =?utf-8?B?Q0Iya3A4LzR5VFF1dGphLzAxNFYyc0xiWDZlRGo5UVNQS0MvUUhKYzhSS0tt?=
 =?utf-8?B?TTBvSFpJMm5XazZDYkhaNHJBeWx0RW5odkhEc2pveEUxOHFPMXovOGg0ZWFL?=
 =?utf-8?B?V1NKcCtQSjdKVGp2bGQ1V0FScDVabENHcHRYNmNHRzkvUmQxK090enZ3cGp0?=
 =?utf-8?B?Y2dmakp3a0tJUWo0R1daOEt5R0FLQ0xlYXZKb3dCRkk0NG5lUGR4YVU2Rnha?=
 =?utf-8?B?MERkWnJ1bm12Q3M5aFFTVjlaT25DY3BuV2o2L3RBWTNaeGswb1VEZldRWXRk?=
 =?utf-8?B?cFdnbExOS0F0Q2NKRFVzbGZxR3BpOVJ3dGFaNFBZOUczbGM2T0lrMFQ2VHJT?=
 =?utf-8?B?eUtwSnNpaFdFR011ODBoK3NNbXVCc0l5bWlSdDZjeFQvVHN1dFpOMDF1ZGhl?=
 =?utf-8?B?UGFxbkE3OVd3WDNUcWdlQXJMeldzRnp3THpHMzB0R1lMR3QyamFlSHN3U1F0?=
 =?utf-8?B?RGp5S3RuNUorMllzOEZReUVvTmV6M1g0N0hLaUNNUTFKeTk1SUdqOTNsWGlr?=
 =?utf-8?B?YnBlK3BONTRmNTdlMlA1ZWs5Mk5xb045cnd3RW9KUEV6bk9NNENsMlcvWUZO?=
 =?utf-8?B?WW9YL0lpMUdxZTN1UVBCdGZhMVZkQ1cxYS82blBmZWE0Q2RSNGV1dFdSUDdM?=
 =?utf-8?B?RkgvSy8zNFh6WTJZN25tdWdvdFVjOTVqOWZtUVZDWlY2MkRMM0NYTzF6NkxG?=
 =?utf-8?Q?KBW7Rc4mFMw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzVnSytST21yUlZXNlRMVDdJMEd2WDhZSkY0RFpPTnFXb2dpbGg1UUVIYU54?=
 =?utf-8?B?ODJtMWhoT0tXeVQ5QmloUzBvUmN3a2tKQ3hMbXpiTzlES1EyRTZ6STRML3Vh?=
 =?utf-8?B?NlJpNVFSMnpQN3k2bUZrUks4ekNPQlBUK0RXOTBLSWsydnZSbkJMZmw1N2Vx?=
 =?utf-8?B?NEhDT0o1Vlc2Um9SWWFlYThXK0phRHRJMGt4Q0ZqTTBwWjVudm04Wi9FUTNv?=
 =?utf-8?B?QjVhNXhpaHdFb0t5SnRwNVZ2VEs5RTFyUWlqaTRNak5hTWQ0ZUdYQUNFNjZv?=
 =?utf-8?B?RVlocHRTVTRENG1wQlA1UjZHVnptNmhYT0kwTkVLNzFxVFczMEMvUnZhVmNM?=
 =?utf-8?B?YVlNY0I5RTFUSThKWEdWRVdQTWdYZE9jK3JCRG83c1ZyQW04M1E3MDJrR0dp?=
 =?utf-8?B?eVpZb2Y3dUwzSWJtaFZ3NXFMQS9QT0RlbnJGcUpEdmtqdW5NNTFNNEpvZGxK?=
 =?utf-8?B?Y0NqSE5MZFVPMFlsZElKYVZ1UUwvYlFOVE9kMWVsUkZCK1B2M2lBRUNVNDFB?=
 =?utf-8?B?dkNqNVN3QU82aW9ReXNJcUs4aW81c1hnRkRVL1dnUFBiUFRvRHVseWJtdlVl?=
 =?utf-8?B?RG9MbDlldHNuNmE2ZW9hUXZ1N1ZDMEUrM0RWb20zenhiRG1ZSkJCSHMyd25F?=
 =?utf-8?B?L0pQU1FxbXNzVmdieWE5WnhwdkhkYjNRNjViMFd1bWU5blBWTjVOOVM0OEdF?=
 =?utf-8?B?MXEwb2t3WVBFQ05rOFNHMmRnTEhsNDBaNDdsK3RYUDIwUVpocnB5cDhuRkt6?=
 =?utf-8?B?dFUrbHFDQWV4b2NCUjZ5WDlZcG9hUEZ6TElNMTVuWFN5emg2VFZhcndrQzVw?=
 =?utf-8?B?bFI2ZVo4WGt5ZDloOE52ZGs3d3N3cTVGQzg1bHhCYXErVk01MGJiaUJlaWlz?=
 =?utf-8?B?SmJrMEhqcTVuV0RPZWtRbFlEUFdxN0pvQ0hCRWc5MS9oOHUxQUVONHdrQ0RQ?=
 =?utf-8?B?TmhKWjE5aVZiZWJxVThKNFlaN3ZmK3BHaEJxQ1FLbEhpenQyRTVZRDhoTDFN?=
 =?utf-8?B?Z2orVEV4UzE3czNjTTBuV0FZbWFKOE5DZUNPOS93b2pmUFpwT0hvS0t2NzUw?=
 =?utf-8?B?Nk0vblJVdmYxbkZ0L0VkTUI5MmtVVDZWTThVenFQc013REhxWTU3U09zUTYw?=
 =?utf-8?B?QzZIakFpVXBGQktBN0dUS3FuSUUvS0RLdzVMWXM4SkNvbTdqRDV0S3E4ZldV?=
 =?utf-8?B?RVk4SUhxeU80YXlYbmlrMzNmZFEvbCt6c04yMmZQV2Nmb0VQejZqTjBqbUF5?=
 =?utf-8?B?VEZScHVOM2VndkRNcS9ndFVGdUg1Szc3WUh5bXl0K3M2cFdNUWpqTlp0blFi?=
 =?utf-8?B?UWNsOXhqbmI4R1UycW5IZ1plT2FGelVhM0Y3dkYzdDhXZ0RGcDVUVytxYzhS?=
 =?utf-8?B?T2pDTHpCK09nU0FhVWFjbEVFVnp3YnJhQklKTjBHNVdCSDhBcEp1TWRtS0to?=
 =?utf-8?B?c09pRG40Rk90RkMxeTBENmdtdzFqa21lV09JeXY0NGVCalk4a0VON1FQT3Q0?=
 =?utf-8?B?V3d1MmZNZE96OTNMUmpzQVN1bWxTcUdSdkZydHNwQmdXRDlCK1dWMm1OR1hC?=
 =?utf-8?B?eHM2Z1VwVTJUMzIyZktoTlg4SHA2K1Q1WGh1OUU5TlZoangyQVVqZTBQZXFz?=
 =?utf-8?B?VDNDVGFBWG9qOVJ3SXpBek1XS29wMzlqcWp4RlFDWXIvUnMrVWtWRTlRUHF3?=
 =?utf-8?B?NnJjS0pXV0VIYXE5VVk3OFA1Y2luOWhSK1lhd3JlNlMrNm96ZklwWElmd0dp?=
 =?utf-8?B?ZTVGQjJKVlFxZkU4RVR2cmI1NkJ1VWpWVDRVOHN5Vy8xcXlublIyY1JYaTNV?=
 =?utf-8?B?TmFQRUROZVVqaWZlcFduNjV2ZStlYjJSb0FKeG1td2dzdlR5VkRFaDgwNXBE?=
 =?utf-8?B?NnJZQXA1WTJtTUdTN3ZHZVJNa01MUlJqUEdmT0xkaDNGM0o0OENKQTQrd3BU?=
 =?utf-8?B?cjVmZGg4S29YMkprNGRzRUFPYyt1TVZoNFdXL3NzVGRQTFV5U01OZjNIWUtr?=
 =?utf-8?B?dEV4WExGTTdVQThQMHhSNmY0U3pBUDY5Z2l4QnJrbjY4VE1lK2o0YWZjQVN4?=
 =?utf-8?B?am9SM1VORjRHOW9IOFpjd2cxbTB6UnE1VERPK011NXpzY1hoUFF6bW5uN21h?=
 =?utf-8?B?OTZXeTBtbXM0NndhUkZBN21pWUhoMmczTEZxalc0MTR5R1h5bzU1K0JNemJZ?=
 =?utf-8?Q?MauCI7z2xNebN71diZXXSNM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7609f318-9704-43f4-d8b6-08dd97dc3ff8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 20:23:57.9977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCpQj231iG4AeN/pmY35vqjwj6WT1NhzkVuOLylQMJf4XVbBedzrVtBDt7ZcKKS/W3WSdZXWgG2KDA0gXjhxsgFPaVL+SrZa/hjZaA6d274=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
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

Hi Lucas,

Any thoughts on naming this test.

Thanks,
Umesh

On Fri, May 16, 2025 at 10:49:37AM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 4/26/2025 12:51 AM, Umesh Nerlige Ramappa wrote:
>>Add a test to check if fdinfo returns the correct ticks when querying
>>utilization for a context that is currently active on the engine.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  tests/intel/xe_drm_fdinfo.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index 9a8811b4cd2f..73346ee9b1da 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -48,6 +48,9 @@
>>   * SUBTEST: utilization-single-full-load
>>   * Description: Check that each engine shows full load
>>   *
>>+ * SUBTEST: utilization-single-active-full-load
>>+ * Description: Check that each engine shows full load when active
>>+ *
>>   * SUBTEST: utilization-single-full-load-isolation
>>   * Description: Check that each engine load does not spill over to other drm clients
>>   *
>>@@ -456,6 +459,9 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>  	if (flags & TEST_ISOLATION)
>>  		read_engine_cycles(new_fd, pceu2[1]);
>>+	if (cork && !cork->ended)
>>+		xe_cork_sync_end(fd, cork);
>>+
>>  	expected_load = flags & TEST_BUSY ?
>>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
>>@@ -769,6 +775,12 @@ igt_main
>>  			utilization_single(xe, hwe, 0);
>>  	}
>>+	igt_subtest("utilization-single-active-full-load") {
>>+		require_engine_utilization_data(xe);
>>+		xe_for_each_engine(xe, hwe)
>>+			utilization_single(xe, hwe, TEST_BUSY);
>>+	}
>>+
>the trailing test can be renamed to load-idle and this to full load
>
>Test looks good to me
>
>Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>
>>  	igt_subtest("utilization-single-full-load") {
>>  		require_engine_utilization_data(xe);
>>  		xe_for_each_engine(xe, hwe)
