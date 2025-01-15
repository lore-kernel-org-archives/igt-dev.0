Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5F6C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 15:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8904210E744;
	Wed, 15 Jan 2025 15:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJpK3VsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1C10E744
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736956687; x=1768492687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ilkUQPpA0esr5ShG/HiFCaQ8Y9g0UN3QN/OBr7sSVx4=;
 b=GJpK3VsSEjzIhBSE12fSUYRMBOeDt1+plhjkoshk5FeNpWLZB83P43Mg
 OSgU9sTDC2dqVUtOpPa/RpX05biVNKbLEZCXJnNhTMlgoHZe8KZU8RSJn
 vbMGEkuTJieKUXEljNflgEumIkmN6AU8xxDkf5TaKN7oVh2wMyvnSBPj/
 LR485/4eq+RKCIuEO137eUKp4EWyycmu7qsMBhEgBE3j6KWEUN6CGtNLh
 unnMkI+dS3uyE0veKEJpTnyxsx7MnrkU6VIib23vAQOwQlRIIflpZn4gJ
 E8+paaszcz3r2ANvuoZ9trvp2fv8ElNiIJ5fShMXcughQ0Cf3UT1aL5pH Q==;
X-CSE-ConnectionGUID: eNJdUe7vQjaDWHKgc/eM3g==
X-CSE-MsgGUID: fHGcoonGTvS80tKc7xrtXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37327298"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208,217";a="37327298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:58:07 -0800
X-CSE-ConnectionGUID: jofvC13dTiGrqOjiqbYcPA==
X-CSE-MsgGUID: wj4je93qTnuDsSsaksf8yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
 d="scan'208,217";a="105708214"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 07:58:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 07:58:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 07:58:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 07:58:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPRvHc/8WCfQQsFaaILyYm4xiD9pjm7ZaXuk0zGPDfMjgt2T8j9POjoyI+Z0fkr8J3PhOUvrUHq6++uvs82DAyrZpMpoA6Gvu65eAQB/VIEizYuWnXhSXFWKzIsDHS8nmw8oESiqiM+LAMOArb73GfRA4G7NZWtw4HpzTeXDsQBkkYejXnSMd/5JP9+38zCkCmt6tl6ewXP6Wm/3wWtlasoJoUaR9a/0GuEWA5y38gurO2VqcEqQlRQBBIZy9JNGhAdNv7OsU3r2XBBEc0TqS3tvyDG6R5i868uEcYJN4Nz4zN5J6FoXRNSbhW9bCz2RCOXfU7NG4YAs9bsG1t5EGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXgQDRAHwlr5bvkqcvX6Iv8rRN/GkHpKnqrYLcI+FoM=;
 b=gemyqoOXJjbQSEHbyvFlQiux9LUzXy/NKCJOLj5CXcgeG6UtMgs2IHPC2R1DZ88Cz+0NzzWlgiZv8/46T1/0ITeJ2JC2LwjUskldCZW4vCvBECgl+YJUgwAdHjv0VDi6J0za8EjwO/4GVDcMQpU9S7vf6HEXRQ4nC8O33CRctbi9R+UDTNi43CsWnfB/AHRzYqRaShzKUVS6x/7hIzLTizAjNGrqaZT/tpLZMAGq7RnJ1oz6C01isLiR1FbuVf77RM3ZKOhXIDxI/olLYv+bXkg5/Z4rnx7dcFSUR0s+Tf28KfW8O1GIH44ah04vFpqIYsv36czJl1SxSnIfZyiTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA3PR11MB7627.namprd11.prod.outlook.com (2603:10b6:806:320::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 15:58:02 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 15:58:02 +0000
Content-Type: multipart/alternative;
 boundary="------------jV1kHTeFcU0ggWamnrUK117n"
Message-ID: <cba48ddf-23d5-4117-8877-8f38c5828dbf@intel.com>
Date: Wed, 15 Jan 2025 16:57:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 6/7] tests/xe_sriov_auto_provisioning: Add tests
 for SR-IOV auto-provisioning
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
 <20250114150848.332708-7-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250114150848.332708-7-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VE1PR03CA0003.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA3PR11MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c6a8f3-5111-4d2e-5153-08dd357d63f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDNhQkxwSzF1bUd3blZGSG1UQ0NRcDFKZjZ3aEtuTUgvMDZ6OXFuMkVKMndH?=
 =?utf-8?B?TXhuODZGYk5ZT1p0eEZWMFM5Uk1PaXFvbGR1Z3FKME1KR1pZSjUzV3ZBS211?=
 =?utf-8?B?TGQ0WVg1SmJZcVZVQ0cyWnRPVTlWOFIxVFh6LzlJUnZXbWJnUCs5UDVwZjJG?=
 =?utf-8?B?RmhxN0M5LzZDKzNXVlFldHVJVFV3YURwQ2h1bmU0cEJySERBaG1LWHR0em1K?=
 =?utf-8?B?ekFMQ0Nob2s5cmYrVU05M005OEpoMDJQQjY5a3pobVhac0ZXMGQ4bEpERHl6?=
 =?utf-8?B?d2p0ZEMzNVdOYUFjZDF3U2lHcGRlSUJsK2VSVll0OUxVSlNEWWVkT05wbHln?=
 =?utf-8?B?TXZRN2FHVHBDbjVOS0dvemxmM2JTVDhGQXQ2MXdXKzV1UXdmZkk5MVlUYWdp?=
 =?utf-8?B?V1dwS2VrRDRGaVhaczRKMlVUTHdqZkhrUUVqd0x1MlpSTGNXazJpaHJELzBY?=
 =?utf-8?B?UzRHbGF5L3lxdjU0MFNhS2JoeU14ZzR4UXFiZFQyYkR3VFAyR2NVYndLOEg0?=
 =?utf-8?B?MWpTZlZEQ2Q4UExaeU5RV0pvbWNKVXBxMzdjSXVJZkY2TXk3dWF5U1Vjbjdl?=
 =?utf-8?B?VTFvZGhUOWh5ZmNFVkkvRGhXekgxT2REcmFDaG1EeXRyMFZNMkVVbXA1b2l1?=
 =?utf-8?B?N2RqQmVlS0RpQkJjdkJ4U2JkTGNsRDZEYkprUC9Iamt5a3ZwWU1jV0prRGFW?=
 =?utf-8?B?MGV3eHY1c3I0anpaWnluL01iblF3aSs2aVYwL0dEYWt2aTcrMXJoNUcvREtn?=
 =?utf-8?B?TTRJYk9QRXBsNHQzTFpyL25PVlc2bjJ4SmgwMG1TRUE4SnBaUytQQTEycUhF?=
 =?utf-8?B?Ujl6amsrME8yK0pFNzFGdjhTNDBxb3JDSGE2NmdKNURHemJkSm5mL0g3QVM2?=
 =?utf-8?B?cjYxZlBMckszTHFRUjZHRU5reU1ud0pIblBDMzFnM01waTcrUzd2Y0tCYXBW?=
 =?utf-8?B?RGRvdGgvSzVqRFMwMm1Ic0RLVmVGYmlBTlpyTWUyVUJtYmFlbldYNU14eC8y?=
 =?utf-8?B?VEg1YmJBUzJmd1hCUjVSQWN1bnBIQTdhWU5kc0VoQXlQelQ0SXJ2Yyt0S0Y5?=
 =?utf-8?B?RmFWaHJnSTJSUk1ZbEVtZUpVTzdIWFM0Y3ZkWjlWL1RoNjZtMFkybEVQOVUy?=
 =?utf-8?B?R3FzQWZoMisyWEE1aVJ3c2tadGkvN3BCOGFOUnFkbzNVNEhDbWRsNnlROUxi?=
 =?utf-8?B?c1IzaVo2QlgrOWN1eFM1cEpmRWZnUEphL2h6YTZSRUNtWTVVemlpOGtiVE1m?=
 =?utf-8?B?ck1pVDgvU0NNcWVnTE5FYVRnMjlPWjF3eXFyZ1BsUVRxOW1YOUZwSEtGcFhz?=
 =?utf-8?B?S0NIZS9BbkEweE0wUWhhOG5EbXdwZXNQVExmUWZqbXJBb3ZMeUtBelRzSnRW?=
 =?utf-8?B?ekZxOHRxNGhzWU5SaFh5aFZPdkZWcy8vc05xT1Fvd2NRRkhlU3FtL0hSYm1S?=
 =?utf-8?B?L0x2WXFoeU4xeHEwT1JLWDQ4QUVLb0F5cFViaGJlb0hRL1MwRzRaekEyY2Y0?=
 =?utf-8?B?YzMxMHBvRy9HQ242WmhnbTR4Szkvb3FNUFZqK0kzQ21WeW84QUczL2IwZ29P?=
 =?utf-8?B?NTRMcUI5MmdHZVJHWUdVSjBZOHJNN0pCZ2ZjcVVoWkg4Y3o0SlpubDh2WE5C?=
 =?utf-8?B?QWNyYUFzQ0EzTzloNHJZTjNsVWgxTk9rTzdhTEhJZGRFN2pvNDhRM0ZPem9v?=
 =?utf-8?B?N0lzY2VYdlhzRE1DdFRJWDBpa3VOVTJHNVV5NGQ3V0hEdWd2SjlCN3U3YnBG?=
 =?utf-8?B?eEg4NXdka0k2VHpBY1lhbkpxRWRneHp6S0NqM2tZN25KaGRsWlFydm9IMzVF?=
 =?utf-8?B?ZG1OUXoxbmpSa2U2YkwrUWVJS3gyWittVWVFd3BOaVoxUmJ5NC9rL3hsRS9i?=
 =?utf-8?Q?iRwb7z2l69X6b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxZaTBLZko3bUFhc2FsWDlXZVlBMXVBendUKzFuOEFMKytkaWVPcjNRR3I1?=
 =?utf-8?B?ZkkrMmM4NkNqT3RpWEtWZXVwc1hjdmdJV1JtN1RLQ2pHaU5ncG9TaGZQR3A0?=
 =?utf-8?B?amlZL2hDeHdLWXEwZDlrcXhOVXp2a1NiSHlwR0lNSjVCVlpON2tYTGpZWktL?=
 =?utf-8?B?d2hkdjJnc0VZalVja1oraWFNYmYvamRsckpheVdpVnQwQjRWYzQrWHBhT2NI?=
 =?utf-8?B?REVqNmVTRnp4aGozOStQZ0x0V2JOSzJmUStLbWlBNjNCR0RaaGRXcExNRXFS?=
 =?utf-8?B?Z21mSCsyUGRNcjNrbk8xTWMzS05MRTNFUklvUlpFeEE3cVVxYktKaUx2NStL?=
 =?utf-8?B?TGlKUDJqUVY0blVIZlFsRzl3ZGd6SkFmT0NLMzhIQzFoYnk2OG1Cc1l0QjZP?=
 =?utf-8?B?RjFEU0UxODlHVnAyZkJRUkJkaVZabDA2RVNVTXBYSjFXL2MwZnpEM202L3RH?=
 =?utf-8?B?R3BpVlhyTHIvenVJT3ZvT1c1RmhyK3ppVFdtck1sYUVna1M2cDRvMG8xcU5p?=
 =?utf-8?B?VEo4MHpzVDl3Zk9wNFlmbDhhLzRSZ0tTN0RMK2tLMWVYRW11SENlamFuUFAx?=
 =?utf-8?B?TGZPSzQxQnF1YnhZUmovR1MzeE8wTW1uNGY1OVFwRHNVQTdRY0dVcHR1Ly9X?=
 =?utf-8?B?RGlDd1RSMzQzdkhFdlVPckh3VGNsNkxGekNrQkRKV3IxRWxiaVdNTkxYYXI3?=
 =?utf-8?B?YXBMRlIvdHNPcGR6VWdQNGxSZ0MyMHl1WjN1S1YvVHFTYi9tV05XUytNTXVa?=
 =?utf-8?B?dk03L1JYZjdEd2puNjNFQlc5U21uQlM3dXoyYzF2UGVhcGpyeU16cFluU3dB?=
 =?utf-8?B?dkhoZlpVOU8xakF2aHpKc3cwNk0zVDYzc21RUFZkV0RvbmVaSlZCUFh3TGl0?=
 =?utf-8?B?NFJ3ZWdHOW9RYi9Mc1RkTC9iWXI2Q1BqNW5QSEx3TjJzRGZpQzBoczUyNzNr?=
 =?utf-8?B?NWFOYXdkcVpyY242RU5ucFdZWWdlVUpxZHZVZ0UrQ2RNS1QvMERxYzFsRU9O?=
 =?utf-8?B?UkxpSFgvT3ZTRnRiS1hBVWtQTGcxQ0wvbm5iTkp3akI3bnV4ejBTUmJyM3d5?=
 =?utf-8?B?Zlo4ZzAvY2h5UmhQdk1CODIweWg2aXY1OUNjalVWdzJkZFlNMkRRZHlmb2Zt?=
 =?utf-8?B?REtJNUprTis5QXM5ZnowaHJnTGl6YzQ1TG9HMWsvL09ScEp2Q1BHQUlUdzRh?=
 =?utf-8?B?U0J5ZXk1eDZ4SWNBNmR0WDl6MC8rd1pWZVRlaEo0NzZDR04zZTN5U09hbEFu?=
 =?utf-8?B?YWNsSTZRbWtKcHN4dG9UVTlZWjh1L3JKd2NpWU1SK2Y1YStFTjhGQTN5OE9L?=
 =?utf-8?B?TzZCWXZLTGZNWWFWVXJ5cmw5TjFseU02MEloSDFjSGQzeXJrTmhkZVVKQWlG?=
 =?utf-8?B?QUMzV25oYklFa0QvQ1YrQjJmTGUybU1QZTR2MElRcmw3V0RLWUUyaDk1aFoz?=
 =?utf-8?B?ZGxuNTl0S1RjdUhkekJvZmJ4cVlsemY1anE3OWJBeVk1YzRpQW1SUlhQMHRw?=
 =?utf-8?B?OFdhc3RlMGFMNkRRRTlQNFlrd3RjUG9GL2hWQkt6aTBNS2Y1SkFGalcxeXhj?=
 =?utf-8?B?UUdYcjYxVFJHbjNpSnF4VCtpVHBCMWNhaVdhemE3YnNnU1hTcjE1cEJ1eFB4?=
 =?utf-8?B?SW9hbUUrZVJjYlZCblFhMmFGbmhOdWMwNm44VjFKWWZmSG1nWWYyZFVSZC8x?=
 =?utf-8?B?T2FJbkFBdkpDMHZraXZudWZYNVBnR3dscktIZC9PZTFENGVOcjRmZnRhbEZC?=
 =?utf-8?B?d0wxeVJ2TUtjbERMbXpvMmpiSjhSMTYwNDJ2dU5PamhqUllnRFY5TW1GcFI2?=
 =?utf-8?B?VCtRK0RCUitIZmhubUMvK3c5UGkwTElGcHBjOVhLSE1iQjh0Ymw1NXZ1Mm5C?=
 =?utf-8?B?dkhScHYxVEdLNWVCeURyM1NudVFyQm83NHgvTmJWMURpQ2YzSnczSmhsUWVF?=
 =?utf-8?B?YkdBYzBOd2N6TlpKKzV2SDI1K3lxL2lUQUJLMjlvbFd6QitQTzJhRFJQdWdU?=
 =?utf-8?B?OWkvbExIY3pWVGpvaGZTL2Q4dU9NeCtqcjlMSW5zNUdJWUxrK1ZLTGRQTWZC?=
 =?utf-8?B?SHJEQ0x1QmF4MTFUN2JKV1pSQ1dFZm9EZ0xOcHR6VEdIQ3RZL0pMSTJ0TzU2?=
 =?utf-8?Q?rorNtXANIIxCa6FHdGFBbAZ74?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c6a8f3-5111-4d2e-5153-08dd357d63f9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:58:02.3286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mk6lfdZ9UWfrwdExk1DaqgsdBkA5YFS029w5AYZz783K+wTLRmzx643Kf6/duvqDSZ1YhWgTlbUQeD98pTlpjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7627
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

--------------jV1kHTeFcU0ggWamnrUK117n
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/2025 16:08, Marcin Bernatowicz wrote:
> Added subtests validating below scenarios:
> - auto-provisioned resources are allocated by PF driver in fairly manner,
> - auto-provisioned resources are released once VFs are disabled,
> - verify that ranges of auto-provisioned resources are exclusive.
>
> The tests rely on ggtt_provisioned, lmem_provisioned,
> contexts_provisioned and doorbells_provisioned debugfs attributes.
>
> v2:
> - Simplify range validation by using
>    xe_sriov_pf_debugfs_read_check_ranges (Lukasz)
> - Rename subtests for clarity (Lukasz)
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
>   tests/intel/xe_sriov_auto_provisioning.c | 290 +++++++++++++++++++++++
>   tests/meson.build                        |   1 +
>   2 files changed, 291 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_auto_provisioning.c
>
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> new file mode 100644
> index 000000000..1d2aa8624
> --- /dev/null
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2023 Intel Corporation. All rights reserved.
> + */
> +
> +#include <stdbool.h>
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_sriov_debugfs.h"
> +#include "xe/xe_sriov_provisioning.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: xe_sriov_auto_provisioning
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: provisioning
> + * Functionality: auto-provisioning
> + * Run type: FULL
> + * Description: Examine behavior of SR-IOV auto-provisioning
> + *
> + * SUBTEST: fair-allocation
> + * Description:
> + *   Verify that auto-provisioned resources are allocated by PF driver in fairly manner
> + *
> + * SUBTEST: resources-released-on-vfs-disabling
> + * Description:
> + *   Verify that auto-provisioned resources are released once VFs are disabled
> + *
> + * SUBTEST: exclusive-ranges
> + * Description:
> + *   Verify that ranges of auto-provisioned resources are exclusive
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe tests for SR-IOV auto-provisioning");
> +
> +/* Expects ranges sorted by VF IDs */
> +static int ranges_fair_allocation(enum xe_sriov_shared_res res,
> +				  struct xe_sriov_provisioned_range *ranges,
> +				  unsigned int nr_ranges)
> +{
> +	uint64_t expected_allocation = ranges[0].end - ranges[0].start + 1;
> +
> +	for (unsigned int i = 1; i < nr_ranges; i++) {
> +		uint64_t current_allocation = ranges[i].end - ranges[i].start + 1;
> +
> +		if (igt_debug_on_f(current_allocation != expected_allocation,
> +				   "%s: Allocation mismatch, expected=%lu VF%u=%lu\n",
> +				   xe_sriov_debugfs_provisioned_attr_name(res),
> +				   expected_allocation, ranges[i].vf_id,
> +				   current_allocation)) {
> +			return -1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int check_fair_allocation(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
> +				 enum xe_sriov_shared_res res)
> +{
> +	struct xe_sriov_provisioned_range *ranges;
> +	int ret;
> +
> +	ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt_id, &ranges, num_vfs);
> +	if (igt_debug_on_f(ret, "%s: Failed ranges check on GT%u (%d)\n",
> +			   xe_sriov_debugfs_provisioned_attr_name(res), gt_id, ret))
> +		return ret;
> +
> +	ret = ranges_fair_allocation(res, ranges, num_vfs);
> +	if (ret) {
> +		free(ranges);
> +		return ret;
> +	}
> +
> +	free(ranges);
> +
> +	return 0;
> +}
> +
> +static void fair_allocation(int pf_fd, unsigned int num_vfs)
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			if (igt_debug_on_f(check_fair_allocation(pf_fd, num_vfs, gt, res),
> +					   "%s fair allocation failed on gt%u\n",
> +					   xe_sriov_shared_res_to_string(res), gt))
> +				fails++;
> +		}
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_fail_on_f(fails, "fair allocation failed\n");
> +}
> +
> +static void resources_released_on_vfs_disabling(int pf_fd, unsigned int num_vfs)
> +{
> +	struct xe_sriov_provisioned_range *ranges;
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			if (igt_warn_on_f(xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res,
> +										gt,
> +										&ranges,
> +										num_vfs),
> +					  "%s: Failed ranges check on gt%u\n",
> +					  xe_sriov_debugfs_provisioned_attr_name(res), gt))
> +				continue;
> +
> +			free(ranges);
> +		}
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			if (igt_debug_on_f(xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res,
> +										 gt,
> +										 &ranges,
> +										 0),
> +					   "%s: Failed ranges check on gt%u\n",
> +					   xe_sriov_debugfs_provisioned_attr_name(res), gt))
> +				fails++;
> +		}
> +	}
> +
> +	igt_fail_on_f(fails, "shared resource release check failed\n");
> +}
> +
> +static int compare_ranges_by_start(const void *a, const void *b)
> +{
> +	const struct xe_sriov_provisioned_range *range_a = a;
> +	const struct xe_sriov_provisioned_range *range_b = b;
> +
> +	if (range_a->start < range_b->start)
> +		return -1;
> +	if (range_a->start > range_b->start)
> +		return 1;
> +	return 0;
> +}
> +
> +static int check_no_overlap(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
> +			    enum xe_sriov_shared_res res)
> +{
> +	struct xe_sriov_provisioned_range *ranges;
> +	int ret;
> +
> +	ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt_id, &ranges, num_vfs);
> +	if (ret)
> +		return ret;
> +
> +	igt_assert(ranges);
> +	qsort(ranges, num_vfs, sizeof(ranges[0]), compare_ranges_by_start);
> +
> +	for (unsigned int i = 0; i < num_vfs - 1; i++)
> +		if (ranges[i].end >= ranges[i + 1].start) {
> +			igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> +				  "Overlapping ranges: VF%u [%lx-%lx] and VF%u [%lx-%lx]\n" :
> +				  "Overlapping ranges: VF%u [%lu-%lu] and VF%u [%lu-%lu]\n",
> +				  ranges[i].vf_id, ranges[i].start, ranges[i].end,
> +				  ranges[i + 1].vf_id, ranges[i + 1].start, ranges[i + 1].end);
> +			free(ranges);
> +			return -1;
> +		}
> +
> +	free(ranges);
> +
> +	return 0;
> +}
> +
> +static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			if (res == XE_SRIOV_SHARED_RES_LMEM)
> +				/*
> +				 * lmem_provisioned is not applicable for this test,
> +				 * as it does not expose ranges
> +				 */
> +				continue;
> +
> +			if (igt_debug_on_f(check_no_overlap(pf_fd, num_vfs, gt, res),
> +					   "%s overlap check failed on gt%u\n",
> +					   xe_sriov_shared_res_to_string(res), gt))
> +				fails++;
> +		}
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_fail_on_f(fails, "exclusive ranges check failed\n");
> +}
> +
> +igt_main
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	bool autoprobe;
> +	int pf_fd;
> +
> +	igt_fixture {
> +		struct xe_sriov_provisioned_range *ranges;
> +		int ret;
> +
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +
> +		xe_for_each_gt(pf_fd, gt) {
> +			xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +				ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt,
> +									    &ranges, 0);
> +				igt_skip_on_f(ret, "%s: Failed ranges check on gt%u (%d)\n",
> +					      xe_sriov_debugfs_provisioned_attr_name(res),
> +					      gt, ret);
> +			}
> +		}
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +	}
> +
> +	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
> +	igt_subtest_with_dynamic("fair-allocation") {
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				fair_allocation(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify that auto-provisioned resources are released once VFs are disabled");
> +	igt_subtest_with_dynamic("resources-released-on-vfs-disabling") {
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				resources_released_on_vfs_disabling(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify that ranges of auto-provisioned resources are exclusive");
> +	igt_subtest_with_dynamic_f("exclusive-ranges") {
> +		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +		igt_skip_on(total_vfs < 2);
> +
> +		for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				exclusive_ranges(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..01076f401 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -315,6 +315,7 @@ intel_xe_progs = [
>   	'xe_vm',
>   	'xe_waitfence',
>   	'xe_spin_batch',
> +	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------jV1kHTeFcU0ggWamnrUK117n
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/14/2025 16:08, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250114150848.332708-7-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Added subtests validating below scenarios:
- auto-provisioned resources are allocated by PF driver in fairly manner,
- auto-provisioned resources are released once VFs are disabled,
- verify that ranges of auto-provisioned resources are exclusive.

The tests rely on ggtt_provisioned, lmem_provisioned,
contexts_provisioned and doorbells_provisioned debugfs attributes.

v2:
- Simplify range validation by using
  xe_sriov_pf_debugfs_read_check_ranges (Lukasz)
- Rename subtests for clarity (Lukasz)

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
 tests/intel/xe_sriov_auto_provisioning.c | 290 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 2 files changed, 291 insertions(+)
 create mode 100644 tests/intel/xe_sriov_auto_provisioning.c

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
new file mode 100644
index 000000000..1d2aa8624
--- /dev/null
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#include &lt;stdbool.h&gt;
+
+#include &quot;drmtest.h&quot;
+#include &quot;igt_core.h&quot;
+#include &quot;igt_sriov_device.h&quot;
+#include &quot;igt_sysfs.h&quot;
+#include &quot;xe/xe_sriov_debugfs.h&quot;
+#include &quot;xe/xe_sriov_provisioning.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+/**
+ * TEST: xe_sriov_auto_provisioning
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: provisioning
+ * Functionality: auto-provisioning
+ * Run type: FULL
+ * Description: Examine behavior of SR-IOV auto-provisioning
+ *
+ * SUBTEST: fair-allocation
+ * Description:
+ *   Verify that auto-provisioned resources are allocated by PF driver in fairly manner
+ *
+ * SUBTEST: resources-released-on-vfs-disabling
+ * Description:
+ *   Verify that auto-provisioned resources are released once VFs are disabled
+ *
+ * SUBTEST: exclusive-ranges
+ * Description:
+ *   Verify that ranges of auto-provisioned resources are exclusive
+ */
+
+IGT_TEST_DESCRIPTION(&quot;Xe tests for SR-IOV auto-provisioning&quot;);
+
+/* Expects ranges sorted by VF IDs */
+static int ranges_fair_allocation(enum xe_sriov_shared_res res,
+				  struct xe_sriov_provisioned_range *ranges,
+				  unsigned int nr_ranges)
+{
+	uint64_t expected_allocation = ranges[0].end - ranges[0].start + 1;
+
+	for (unsigned int i = 1; i &lt; nr_ranges; i++) {
+		uint64_t current_allocation = ranges[i].end - ranges[i].start + 1;
+
+		if (igt_debug_on_f(current_allocation != expected_allocation,
+				   &quot;%s: Allocation mismatch, expected=%lu VF%u=%lu\n&quot;,
+				   xe_sriov_debugfs_provisioned_attr_name(res),
+				   expected_allocation, ranges[i].vf_id,
+				   current_allocation)) {
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
+static int check_fair_allocation(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
+				 enum xe_sriov_shared_res res)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt_id, &amp;ranges, num_vfs);
+	if (igt_debug_on_f(ret, &quot;%s: Failed ranges check on GT%u (%d)\n&quot;,
+			   xe_sriov_debugfs_provisioned_attr_name(res), gt_id, ret))
+		return ret;
+
+	ret = ranges_fair_allocation(res, ranges, num_vfs);
+	if (ret) {
+		free(ranges);
+		return ret;
+	}
+
+	free(ranges);
+
+	return 0;
+}
+
+static void fair_allocation(int pf_fd, unsigned int num_vfs)
+{
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_debug_on_f(check_fair_allocation(pf_fd, num_vfs, gt, res),
+					   &quot;%s fair allocation failed on gt%u\n&quot;,
+					   xe_sriov_shared_res_to_string(res), gt))
+				fails++;
+		}
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	igt_fail_on_f(fails, &quot;fair allocation failed\n&quot;);
+}
+
+static void resources_released_on_vfs_disabling(int pf_fd, unsigned int num_vfs)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_warn_on_f(xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res,
+										gt,
+										&amp;ranges,
+										num_vfs),
+					  &quot;%s: Failed ranges check on gt%u\n&quot;,
+					  xe_sriov_debugfs_provisioned_attr_name(res), gt))
+				continue;
+
+			free(ranges);
+		}
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_debug_on_f(xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res,
+										 gt,
+										 &amp;ranges,
+										 0),
+					   &quot;%s: Failed ranges check on gt%u\n&quot;,
+					   xe_sriov_debugfs_provisioned_attr_name(res), gt))
+				fails++;
+		}
+	}
+
+	igt_fail_on_f(fails, &quot;shared resource release check failed\n&quot;);
+}
+
+static int compare_ranges_by_start(const void *a, const void *b)
+{
+	const struct xe_sriov_provisioned_range *range_a = a;
+	const struct xe_sriov_provisioned_range *range_b = b;
+
+	if (range_a-&gt;start &lt; range_b-&gt;start)
+		return -1;
+	if (range_a-&gt;start &gt; range_b-&gt;start)
+		return 1;
+	return 0;
+}
+
+static int check_no_overlap(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
+			    enum xe_sriov_shared_res res)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt_id, &amp;ranges, num_vfs);
+	if (ret)
+		return ret;
+
+	igt_assert(ranges);
+	qsort(ranges, num_vfs, sizeof(ranges[0]), compare_ranges_by_start);
+
+	for (unsigned int i = 0; i &lt; num_vfs - 1; i++)
+		if (ranges[i].end &gt;= ranges[i + 1].start) {
+			igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
+				  &quot;Overlapping ranges: VF%u [%lx-%lx] and VF%u [%lx-%lx]\n&quot; :
+				  &quot;Overlapping ranges: VF%u [%lu-%lu] and VF%u [%lu-%lu]\n&quot;,
+				  ranges[i].vf_id, ranges[i].start, ranges[i].end,
+				  ranges[i + 1].vf_id, ranges[i + 1].start, ranges[i + 1].end);
+			free(ranges);
+			return -1;
+		}
+
+	free(ranges);
+
+	return 0;
+}
+
+static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
+{
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (res == XE_SRIOV_SHARED_RES_LMEM)
+				/*
+				 * lmem_provisioned is not applicable for this test,
+				 * as it does not expose ranges
+				 */
+				continue;
+
+			if (igt_debug_on_f(check_no_overlap(pf_fd, num_vfs, gt, res),
+					   &quot;%s overlap check failed on gt%u\n&quot;,
+					   xe_sriov_shared_res_to_string(res), gt))
+				fails++;
+		}
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	igt_fail_on_f(fails, &quot;exclusive ranges check failed\n&quot;);
+}
+
+igt_main
+{
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	bool autoprobe;
+	int pf_fd;
+
+	igt_fixture {
+		struct xe_sriov_provisioned_range *ranges;
+		int ret;
+
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+
+		xe_for_each_gt(pf_fd, gt) {
+			xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+				ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt,
+									    &amp;ranges, 0);
+				igt_skip_on_f(ret, &quot;%s: Failed ranges check on gt%u (%d)\n&quot;,
+					      xe_sriov_debugfs_provisioned_attr_name(res),
+					      gt, ret);
+			}
+		}
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+	}
+
+	igt_describe(&quot;Verify that auto-provisioned resources are allocated by PF driver in fairly manner&quot;);
+	igt_subtest_with_dynamic(&quot;fair-allocation&quot;) {
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f(&quot;numvfs-random&quot;) {
+				igt_debug(&quot;numvfs=%u\n&quot;, num_vfs);
+				fair_allocation(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_describe(&quot;Verify that auto-provisioned resources are released once VFs are disabled&quot;);
+	igt_subtest_with_dynamic(&quot;resources-released-on-vfs-disabling&quot;) {
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f(&quot;numvfs-random&quot;) {
+				igt_debug(&quot;numvfs=%u\n&quot;, num_vfs);
+				resources_released_on_vfs_disabling(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_describe(&quot;Verify that ranges of auto-provisioned resources are exclusive&quot;);
+	igt_subtest_with_dynamic_f(&quot;exclusive-ranges&quot;) {
+		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+		igt_skip_on(total_vfs &lt; 2);
+
+		for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
+			igt_dynamic_f(&quot;numvfs-random&quot;) {
+				igt_debug(&quot;numvfs=%u\n&quot;, num_vfs);
+				exclusive_ranges(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_sriov_disable_vfs(pf_fd);
+		/* abort to avoid execution of next tests with enabled VFs */
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) &gt; 0, &quot;Failed to disable VF(s)&quot;);
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       &quot;Failed to restore sriov_drivers_autoprobe value\n&quot;);
+		drm_close_driver(pf_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..01076f401 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -315,6 +315,7 @@ intel_xe_progs = [
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
+	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',</pre>
    </blockquote>
    <br>
    LGTM,<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------jV1kHTeFcU0ggWamnrUK117n--
