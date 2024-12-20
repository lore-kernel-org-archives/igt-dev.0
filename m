Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A900E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 19:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279B710E4C0;
	Fri, 20 Dec 2024 19:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8/OXANx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0FF10E4C0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734721799; x=1766257799;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R5+pY52QmLdWmx7C1mIsVC2f7/uYlfokV4ziNKdUGP8=;
 b=f8/OXANxQ0fPy8QetvBv3RK62om2idTMQWthkp+dxK0f0v2AzBb0/hnc
 3E12i5V/e2KAx8PyySy+RH/FLLufmQKPga+1vDiO1AQfGJp0Zp1yQ+V/t
 O/tnvbT5Vnmf3Z8xvYkhGZU6SJog4utnMTjY/UtaSP7lgY41Ur0wgiqkU
 wXNjbFYRjiPs1c3gZeNm+JjAFab9vr0YGnAwdWIJppYm3aBD9c+sO27Bx
 xUGZvop2W6PPVJilNxMjXmBggjoCdsQHWjj9x4W7iGEo+ycBfL52C9QEy
 pZdElA7M1yWtCIFj28YeWaDlltwrNIo06ezPK39/esQFXNhCE1afFzo0Y Q==;
X-CSE-ConnectionGUID: iv6X+ynqQ6+ZgWJByLuutQ==
X-CSE-MsgGUID: mRgAkqY0RpStbRSCqiLTIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45771318"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="45771318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:09:59 -0800
X-CSE-ConnectionGUID: h3cWfynPQ56qBcF+78csug==
X-CSE-MsgGUID: GEWsFe3+RLaW9/Ng7Xeo8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="103561161"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 11:09:59 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 11:09:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 11:09:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 11:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfdhkkrVftA1iBGXunnnT50o5HoEvp8h3Jz42718ld7gmiZgiTdNiM7buA+LYgNTQjk9NfVbFXUnsvAu3B8r/FRGewyQpz2yvIWpOWH5X49xNlgE+c9o5MTNAEkOfmzsZhUQh+LDwsvX1OKtXi2l0YzbA8FFlbNgfwXNl8IR0I8GTi7cptSc7sqlYdA3coAkAwavnmdGnsWCUV3u5uaGlE0ttzxkWoXY+P7t4o9ivLS5A+P+sxfbUDMTawsF9HDfBz++XPRwJOsgnr74FTKOHngDE9W7xCr8v5HCQe3/iD3tSx3ojtX5lYtHKXQWTP/nZ1O4/NqnZa3oeI2yS8xm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWPRDCAvYnN2Oo+LQ6dLscc/r6eKtNdohlZ+7ClhmBM=;
 b=tYqTFu1YykBEMF7l8eiYnPYWnhHZWL/tkzhRAMzeu6PbZLOwGKolJHlIm8nkm97eaj1EAesVNtzAMaVPYd4eVPqDfXJqZXJ96jX5zDGXtlD5ErZkk/3HjQrOADPUAxuJgLev+ZgEa4W8UesCFpY5iwVzUN/bnOTzjicTFtuyOgJbEPJn2Oh5z5Rs4BDkYzHnzJSx2se+mLyBnDGXO3An9Phsbpw3btm30mPkzYZAR7xBuL0tNZGklanqkpujgZ3e5V8VHZTkqTnDfBXxPG0m3/MLp4jpioNdjLzlHoUk7fotZAUDtSSG9xDaofht9Be0WGV29KncJgJiokMew3IDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.14; Fri, 20 Dec 2024 19:09:41 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 19:09:41 +0000
Message-ID: <f48f64de-0c08-492f-bcfa-8fdcd674bffd@intel.com>
Date: Fri, 20 Dec 2024 11:09:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Do not explicitly unload intel
 mei driver
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
 <20241218233830.2444510-2-daniele.ceraolospurio@intel.com>
 <20241220181026.lq6msnxgrcgemy4h@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20241220181026.lq6msnxgrcgemy4h@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2b84af-ab31-4ca4-9c13-08dd2129db2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnlWSHB3dmEvQ2g5bElmemFNTUNVZ1BrdUhqZzhkL2lvN2VOdWZKbTNtRFJB?=
 =?utf-8?B?NFl3NlZiWjVIZGJ6blRDS1daTUNYRVZpUTBtTjUxU1ZyWm8yVzgyQnJ6UGEz?=
 =?utf-8?B?SEljUExQTVBVblZEYVZXVW5FSzVsRTlhUmk0dlZlSGFzRDlQT2YvTkZQZXg5?=
 =?utf-8?B?dFFWaXUwU3dodzlsM2xmdUlVRTUrRVRIS3hzdVBsakpSRFhWakNjWEJTQVFi?=
 =?utf-8?B?MFFzOGlhZ05HVytEdnVjUnI3RU5pNnpnYmZ0RUphbmRKT1ZKUFVsdTFaZlgy?=
 =?utf-8?B?Nk9zMXc4OXg1b2hHUGl6Nyt3ZGw5Yy9vaDA0dzl2RG9oZmFyZnd3LzBsZ3l0?=
 =?utf-8?B?d2lrOXU3WG1FSzVodU9RMnpoVHpob1NuQk41cXVRK3JXUXB5Q0h6QjJSL3Vr?=
 =?utf-8?B?eE5yWmtTc1RKS0FoczlNb2s5aVp4MmRaVFNGNWJxd25abHhZMGZFb0dYZTkx?=
 =?utf-8?B?OHR4M1cwdGhqSXdFa2lkRms5NmZtZS9NM010L2dZK2YvK0VaUytRc3Bzbzhj?=
 =?utf-8?B?MiszSDNpQmhjR2xYZk9kN0dpNjBkT0U5RGJaNGY2SDdWdU1aMGFiTWI3TCtu?=
 =?utf-8?B?aTBIeU5vbExoSk5odk9jdWxoNUk5dTF1UVoyTG9iLyt5YjljTEtEY2c2ZVRL?=
 =?utf-8?B?REtOQzVmQzRvWmxuanQ3L3dCYmlObTJ3SGJIYnNwdTZlR1lYbTFJK2h5MDZO?=
 =?utf-8?B?endOQ0JHWGRjQU9QbnkxeERrclpFSGJnbEp0QlZ5c1ZiS3JXeCsrSGdGR2RG?=
 =?utf-8?B?d1hZZHVCdE9zR0o0alVrWXZjTU9sSElGb0VKSmZOL1BSaVZhNUZRd2doOGlw?=
 =?utf-8?B?L3RmdUhPSXJrUmdiUHM1NWpBbVNqUFpzZ0wvRkorRkdpb2RMUzlGMUdnM282?=
 =?utf-8?B?R3JaNmZRZEtPaEEwMVBqWEk3dnhRdzlPN243WTYzKzM2VXhwR1dkMWNXWXEz?=
 =?utf-8?B?NTB1QUZUSCt4UXFNdDRZVVc5MUI4bGZRdkhTRUFjQVNhQjcvcmpwV2Z3L0NB?=
 =?utf-8?B?YVgyalhXQVhPWm9lRFZ6Yk5zRERSQUdFUVNhdlE1cnFtaVFhaUFnUC83R3dH?=
 =?utf-8?B?VlhPMzJGbWFyaWNoTEYyRVg4czBSV3ZhcFFkaFVndDZnSGxPcXFhN0JnbFpr?=
 =?utf-8?B?MDJPVnJxcEZWODFzZmpvNUEyT1UzeUsvbHpKbjJiSjYyYk95dWk1dU9YV1o1?=
 =?utf-8?B?bVgwZTMwcGFKQ0VwcDBPdGNDN1AyWGNPRkxmOHhnR2pUZ1djUjhKL2Rpakdk?=
 =?utf-8?B?VHFmeDliRURvaWxKVVVwR1lLcDZRVVAyNEs3TU9yaFpXb1dDSDBJN1ZHaG9Y?=
 =?utf-8?B?dVN4ZUp2Rm55Z3B1cXBzY2JZY0dkd3dTajNGTlJIeDdJbzJmR0JXdmJYZHdL?=
 =?utf-8?B?MUhKTkgvdVJjUWZhSHFaei9IaWRHN0Z6V29pZEpxRDQ1Q2tiRUFQc0pQQzBK?=
 =?utf-8?B?QW4zbXd2NkZ4YmtJVm9CYU1WRnVuMGo1bFlYRlFkWTNzSlJVQ1MxS3Z4MXRW?=
 =?utf-8?B?cnBDQnBVQWFvOEZ4TVJCYmpZS0IzRHlGM1FmTHF3cld5T3dmY1VuYXE0cjZl?=
 =?utf-8?B?cG9YdDZoQXYxSUgxVjhpYmJhcWtCTjBnMHA2Q1BVRWdwWHBXZGZ2ZDVVRk5D?=
 =?utf-8?B?UmFLUHNyN1JOQlZRZUIveXlyb2pOSEFRUFpqY0NWTng1b0pJZXQzYmRSQVZV?=
 =?utf-8?B?MTc4bUtCanZCaHllZ1lMKzZ6OE5sbHVsUXk2WHhVc21mK1RDbHZqbGd1N24x?=
 =?utf-8?B?MkhyMGNpaG1lRjZ2cGNOL1VkMEN1eEpNMkR0dVQ4NkZNK0xUTFVFS1U5VmF6?=
 =?utf-8?B?OWE3ZkNaYVl6aENXSzF4M1RIR0ZDclpnN2UwbVJoRDM0ekNHWGVGcXM4OUZt?=
 =?utf-8?Q?VIxfQ+dhB25Wf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWtPdzJST24zWGdsTWF1R2grNUdYS0ZnU3dMcEV6VDIvd3IwQS9wNUorcVYz?=
 =?utf-8?B?ZTJPZ2YvYlpYZ1JJcjZ2dXJnd2tyVVdJeHlSNnNqMEJ3OW4rOU1BY2lLYnow?=
 =?utf-8?B?STFncGQyRlMzNGlJanI2ckIwUlM4aFRBSUY3Mm5hWllDMktsUFhSSlhJSTFo?=
 =?utf-8?B?M3BYbG5uNi8rWVVIUElCbVdtWGNlNzlsSjkraStKczV1Z0ZjSWFrc3RCMm8x?=
 =?utf-8?B?eU5ZeFNva2tHYXkvZjRXdXcvY1dIVXROaU9kYStxRkJTTENyVWszZndjbS8r?=
 =?utf-8?B?aXhJMHhEaytnQ21pSHhSMnVCdUxjVkVxREVKNlRTV2JHMmZTYmttaW1iZVky?=
 =?utf-8?B?UnlpUXd1YjBIcTg2OFRvbGY3OHhyUjJLQ0pmRnVPYnhuVzcxekJxbFFuZUUw?=
 =?utf-8?B?R2pEanRTQitMY3VJTUJ4eVkwME5McU82K3VVeTM0SitOSU1SNXhtVTIwUGpM?=
 =?utf-8?B?NTlHYmdlKzZYTmlPSjBEM0hMeE9XLzB2bFRuTGZlRlluL2dzUUZrbnlkTXdV?=
 =?utf-8?B?dmcyWWVoa2NSTU9IM0llSFB1ejB5Y0l5MlcxL0JwRzZudHNuVS9va2ZxV2Q2?=
 =?utf-8?B?L1hjVHE5Q1Z3Qk90WWJmb1RvNjVibGQ2Y2VFODJiZGxRZ0IxNjIvanV3MDlL?=
 =?utf-8?B?aG9nUDBIakJMY0lpS2loTDgyM0M2RllVaDJsZjNMb3ppejdDcURrV0Flc3M4?=
 =?utf-8?B?NTFsbkFWbUR6dHg2a0hSRWhqUzdONXhPSnpIMTBjQ3lsOXBkcVp4SXJVZURk?=
 =?utf-8?B?UDRMeDJzbU92VWI5d09vUHRycGVXVzE5TGhiWUlOd3Nwd2txcTlZSys3dG9Q?=
 =?utf-8?B?UEFTelUyaVl5YmU4ejR4TmtmNit5MXJtMlpCNUVrTjl5NnV4S2UwdldkSksw?=
 =?utf-8?B?VnpFS1BsM0NPeExZQjlkTkVVRUVGSSs3RTlYWFFWem5GMDRqVzVtelZ4dER0?=
 =?utf-8?B?NHhzM0kvblVSbGorR282ekdmU2x5T2l5NytOUWNMTXRMR1M4aG03RkJ2b2R1?=
 =?utf-8?B?MENKV3ZLYW0rZzJma0I2SEFMcnh2MFZQVGJiUFY4T05lK3BIa01vTUZ2YlpY?=
 =?utf-8?B?R05vV0hCNVlqWFUrdGNXZXk1SWpBbDBPdXhhM2Qxb2hwTVVuVHYzRUpsVm5r?=
 =?utf-8?B?TGs3U2tWWDg4WGx5M0RaL2doUTUxcmV3Z0pIaWhrbFBqd29pMkdxRkJ5QlRy?=
 =?utf-8?B?WVA4eFVnNS9JelE1S2dmVWRoNDZGYlRiSzk2NEpJeVJmSXp1Q3FjcjlTdjYz?=
 =?utf-8?B?NHNBWitqNC9ucW1PQmI5Q0NGanF5SVVNa1hIS1JoenhtRXBhRjZ2T09qdzdk?=
 =?utf-8?B?aFU1RktZUjFBZUI4dmwwSkVFZ0F3STNxQ2FvVEFQSzBjb2p3cmV4NlZxd3ZL?=
 =?utf-8?B?ZDgyRlpuc242Tnd2UW44V2pvM1BLSjh3Smw5aU9DYkd3MzhiU1FvZGw0UE1u?=
 =?utf-8?B?ekZuOTJEZ1QvK3pKVzlEZUR0VCtBak5SVXVqUDkwb3FGOTg1ZVNnU1FUbkh5?=
 =?utf-8?B?MmVwSWx5aDNTOE42RU5FbXBUTUZOMU9Xb1hhS0dxZGxIM1FkUWdnanVXY01F?=
 =?utf-8?B?Sk9DQ2hyUnQzQjBEd3dQUHl5QzQxNlJ3ajB5OFhvMzZnaDZGR3NsYWtadUJB?=
 =?utf-8?B?em5nZTRiRGNOZW9sMmVNWUFTTVhwTEtQdEhqQXJMTDJuRUxGc054UDI2RlM5?=
 =?utf-8?B?T0RIdHB4SFk4TGVkS3lHS0VoTko3QnBEekNRUzJJZGN6Zm1hQ3M3ZStDYWRU?=
 =?utf-8?B?c2hhcjkvVmRONE5BZ3FzMnBYVXpseCt6bWxhSVF2VXo3OHZVYU9NbGNpVHVa?=
 =?utf-8?B?QUhlYWpjQmlQNWVseHZtZnl5Rmk3dDRWOXNVVGRFK0t3c2d5NytCbEJXUE42?=
 =?utf-8?B?QjNBVHg5QTl0L05DSEFCQU9QSFNHaGtkRzBDWDFnRDUrWlpNRUtxQUhFQXFU?=
 =?utf-8?B?NUFlVFQ2aDJxZlRWQ25DbTVaaDNqK1dOSzB0VUhPRk1OMUxuNmRvQU1Mb1lY?=
 =?utf-8?B?ZzkvNFF0bEQ1b1dLVDhxY1l4QUZTWXY4blNOS1E0dEhLQ05JR1ZHOEZMV3RY?=
 =?utf-8?B?WDlsVWh1NjJmV3JWckFJOThnVUV0Qyt3S0xodnl6U1JEbWJ3LzRPWjNuWm85?=
 =?utf-8?B?YjBhajV0R1Yyc1hSVWRlZzN6d3pFKzc0ZWFBV0VKa0Vmc1FNekNXMTZQUFdx?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2b84af-ab31-4ca4-9c13-08dd2129db2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 19:09:41.2906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nz2OYHbPFl/3ctyMbjw6nkhikqmOOJFyZ9u192KeAO/sM7qy9YsUSzidh0zvFzdyBp9YcEKtcc9py9jc+4d77BGT9Ejjowea3qKC7rnWasE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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




On 12/20/2024 10:10 AM, Kamil Konieczny wrote:
> Hi Daniele,
> On 2024-12-18 at 15:38:30 -0800, Daniele Ceraolo Spurio wrote:
>> The mei driver is a child of i915 on discrete, but not on integrated.
>> This means we want to unplug it before removing i915 in the former case
>> but not in the latter. Therefore, instead of manually unloading the mei
>> driver, we can unbind i915 and leave it to the kernel to unplug all the
>> dependencies. This also means that we don't need to explicitly disable
>> the vtcon anymore.
> Will it work also in case of both iGPU + dGPU present?

It should work, yes. The i915/xe unbind will not unload the mei drivers, 
it will just unbind them if they're bound to a gfx child device. So in 
the case of having both igpu and dgpu the mei driver will keep being 
bound to the CPU mei device, which is what we want.

> Should we provide a tool to unload an i915 driver?

A subtest of i915_module_load that just unloads could be useful. We have 
that for Xe.

Daniele

>
> Regards,
> Kamil
>
>> The other 2 dependencies are left untouched:
>> - intel_ips uses symbol_get, so the automatic dependency detection won't
>>    unload it.
>> - the hotunplug test mentions that the sound driver can throw errors on
>>    i915 unbind, so we need to keep the explicit unload.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   lib/igt_kmod.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index a8b0339b9..fa9541d72 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -620,16 +620,9 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>>   	const char *aux[] = {
>>   		/* gen5: ips uses symbol_get() so only a soft module dependency */
>>   		"intel_ips",
>> -		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
>> -		"mei_pxp",
>> -		"mei_hdcp",
>> -		"mei_gsc",
>>   		NULL,
>>   	};
>>   
>> -	/* unbind vt */
>> -	bind_fbcon(false);
>> -
>>   	ret = igt_audio_driver_unload(who);
>>   	if (ret)
>>   		return ret;
>> @@ -648,6 +641,8 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>>   	}
>>   
>>   	if (igt_kmod_is_loaded(driver)) {
>> +		igt_kmod_unbind(driver);
>> +
>>   		ret = igt_kmod_unload(driver);
>>   		if (ret) {
>>   			if (who)
>> -- 
>> 2.43.0
>>

