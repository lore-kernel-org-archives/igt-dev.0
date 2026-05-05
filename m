Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E8CD3430
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 08:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC41510E409;
	Tue,  5 May 2026 08:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jz+JnxCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3E310E409
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777969999; x=1809505999;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qxgm369n3NpBDjTogzRzMUaQFtQiaxsX6ajrsttzaYc=;
 b=jz+JnxCWLx/ECpA/h4+FtARLNybb0Y6I1xiRh4jHYexjC0IpDo0TsocP
 ougXhZoXM10EuDlsrr51Ig21AxRdcIY3l10K/REpyZSnvL112UfU46xGt
 yHIXif2YpCCM0rvK5i267g4jYhjTBLDbDMMhlzpK4tQWLjryXYbakgZFy
 /aKY8TNzSwOD9qILUeHPJnkdZ2YNrn35WYlvrob1wR8Z8tdCD5p3A+45l
 RhnEHfD7hadeCwvB4UBozytMjkE9741TdYwabLcCOzpPdTLPm3zNaBdJB
 Mh40GX0visEyO/zAPAtmD/F6J9RfRnoi4HcrmR7DiXK+Hfx8QrJvWDWEU A==;
X-CSE-ConnectionGUID: EqCQuvQuSZOjCBd17ieqgw==
X-CSE-MsgGUID: 4cDIY79ASKu7ROwQqaN9ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90290271"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="90290271"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:33:19 -0700
X-CSE-ConnectionGUID: QXMMirkIQtOf7kEr2vcOuQ==
X-CSE-MsgGUID: w7EnJG8GQvyuPDB6fJD8hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="239742993"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:33:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:33:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 01:33:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+MzUkcN7x4JEOdnGYH3VUUAP4A/5dtqjZyuyLW1WT5ZSSfJfTZQXvwMqn+vMP2FLZUECF+uhZ0O2ZlpXqMrxfjgNuL6AanK59glQEJSAWq5L8KPz0b9vlB18naHylahWBsR0M4nAmwqzkATN39qXtrlj9MNeq48fNUc9pmfGYJxxdc51PMG+GoAbgYAv+1Pryf/GHVSsHFADKizqQe26bs3W+Bkj1InDGc8S111cOmmb8MlLIk8FvuMcxFWDgSMC6HZ8qFkjcVNgZEkPOHu7GISUG0giPYpJKwcIxKYfc3+HCGbj6EDwIRJ0rzcC1lQmWOIbzv+NBSXHmiqKsfmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xn5Xoca4mA3K8nIii/6sXd76waeWCJ4gzMPYCn1HHeA=;
 b=hj9esIEVUDYPjHc7Y9FsC3U+nCvX5mR2PampbskEM+W5FV46yJm/yQYXDGQm/+VlFEbnz6SpGg5CyPf72JwDgfgP6uuDDr78Hyup+CZqjT+jy09TzYF1FpgMtvhCsU+1rvsNbT7t3ybIMjfhdZCdmFy0QSkDLvXkZI3NkIiJrJaj2kmgf6N1DbKoR9framzaoc/XmxT3TTmBb3cwSfKwPukq1lP4LDMhAozli1VaCTN+l4T7rKh2CEM9rSDLORauQmIo4fI0OQJVj/21Dz8wZpBDr//YeImgjcwJT6SA1QYUtvwqU8jKhegwi4wyAr4aKuHyHifsz8hR5ITY9VWCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by MN0PR11MB6111.namprd11.prod.outlook.com
 (2603:10b6:208:3cd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:33:14 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:33:13 +0000
Message-ID: <030d1aef-01f7-4169-9613-9bfbddfc4f05@intel.com>
Date: Tue, 5 May 2026 10:33:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/gpgpu_fill: Add support for xe3p gpgpu fill
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
References: <20260422191922.274036-4-zbigniew.kempczynski@intel.com>
 <20260422191922.274036-5-zbigniew.kempczynski@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260422191922.274036-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:802:16::25) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a61629-8e8f-421f-c214-08deaa80f281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: oXp/gL08rihu9UNw6fsIUWk7GRkTmZrKRRb2COubKAyuOAvPci/9ZjiMyLr3HRPpjHU/DaxR3zzzUxQojq6yMSiMilEVLQVEx5xbrcjsZ6UoSOBuPhvyMlnOLgbLZAhghgxahg33JWz+mZQGG8LKWcO+Mo8eNLR+P473iP21zpAzDX/d+/aajH9JMvW5Dh8Ert9owhrB2zd5KPQKQ/xrHTHETWtrYknMy8Bf3npAuSFcXsS7JPWxWl780VGfWTSG1RjWejKt133AUSoYstluYLtbrzeZKlINzumjjTBBr1hoIr0SPgbEoEJzVevjiNTS58dEUf36FuI6/oGvmGP6LiNkmAwMOZ7wMKJ9wgSSW9ieQ9zm2JZ9LxE0Z07xpLWgcArUDWImL9N9Y5KW0Dwk89v4oWM9kN9BfIefRw6MJvI48xYthHVaXcFEd/rrNqCwPp61dclbo8RVHmza0p/sXjuh2i7+j3dis3TASrRJ2NGEdaNTvTAeOEqh/5+CxpEuImooKFgbtionp8lsIPLGYrGi8aZ752bmuoJWEFL8aLDCm/VKfvL5jZRSGZqzeWfBjiQo8ZyjnpNChnX6UakxygyIEIzg6Ii7vA5wd5EG9GoSyPzRsVr0eGnNVwX+Xteg7JGSJfVoX65aWGZSitjoNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnJnUEtmOEpIaWlGTlVtSFFIcmpVaDc3bDl3akNRSUhmZ3E4WW1EZ2hkaG5m?=
 =?utf-8?B?UEdQd2tER2JZUUo1bmpHdnpERFQwVndwam5hY2JuT3ptcWM4TEF0M1NXRXEz?=
 =?utf-8?B?OW5mRTMycnB1bzhjSXEveVRwSSt1cVVoNExtRUtacGljbTYxanQySVM4ekJT?=
 =?utf-8?B?YjNNQUJ4NktJMEY2dmE2a3AwN2NIR0htL01DdFFGZCtOWmlrOHd5akNoS3Y5?=
 =?utf-8?B?QTgvWGgwbmJ2N3IrSWsxb1QyL1VoUFhCL0VxeEppN3YxMTNXcitaNjNBRkxO?=
 =?utf-8?B?QVAzbmN5UlBaTzhSY3lJN3lLSXZxUlZsWGUyejlDcGUwTlBvMHdFSW5yUHRY?=
 =?utf-8?B?RVlVanozNTRRdjFPUzd6dEZ5UXlSaHVDNFpNczQwcFZlMm9lWW9xVTVsTUJM?=
 =?utf-8?B?NEZlOG1VZEZXYit1RGQyY3J6NVpMM0RicWlMNzhhUFlwTHE5UTJORjlhR3hW?=
 =?utf-8?B?YVV0RzdCUVdSMzdxOWVtdEltNldTbjZxb1hCalNSYjVqZUE4bTgzeGsvaXBK?=
 =?utf-8?B?V3d4aVd5WHMvcXVJZ3NJQklwMmhvUDhTWm5lUTBqQWF1S2VFWDF6WFIxamRZ?=
 =?utf-8?B?UDFBZnkwWmZkd2JrRXE5cFF6RHdYWnh1QkptZGVxOElYU2lvdVh3Q1F5R1lK?=
 =?utf-8?B?YXVmdXRBTVlJc2pFa0crL1p4UGE4T3lTUERlb1pBNGw5dVJOQmNQdmxDeGdz?=
 =?utf-8?B?azBRdFliQk9ydHdEM0hEdmZtTEpoak1FOGZabHZJRm1GMmtnMTVjSjRMVjZV?=
 =?utf-8?B?ZzZ4QitMMWtTbzNsa1l4TFJnN09PTTVQRGQrTGlnMVhlZGY1QS90M1NjVEov?=
 =?utf-8?B?ZURYRDVZOHptS3Z4QzVPSWVBMmhLOWdmYXZLNVg4U2tBWjdFa1N3b0Fab2gx?=
 =?utf-8?B?OWpBdTVXQndrQjFNNmcrTjR6c1hSUlRycmZsTnBpaEhTOEhNZTBxSGlDbmdC?=
 =?utf-8?B?SEJubVY0RmI4VkFFM3hUeHFzTjViME1NT251bHdJRzFXQlhYeUxGWWFQenIv?=
 =?utf-8?B?cTFtNE05WEdpdDhQZHlBRTFQSHJ2dmZ5SDFZT2lSbzN6YS85cWxnVE1NRGVh?=
 =?utf-8?B?bUh5YWZzUVhxSHdudHRIYUw2bXdNSEJQRmRpK1FIaUhrSmJVYnBRbTdkM1k4?=
 =?utf-8?B?d1orVUlYT1lueVdIRmZuR0J2RmE1eThsRE9weDJkTnZ2ckN2Q1VrYnAyVmI1?=
 =?utf-8?B?Z285dE5lNmRQZlhjSDNIdkJsNGZUT0FJSXJyYUNTTVYyUittTm12K2ZEYkZr?=
 =?utf-8?B?bFFuSEJRaWFUMmZ2bzZVOXJBTmlEUG16aTI3akk2aWh0cUpGaUZOTTFITzgy?=
 =?utf-8?B?bkdib1lJSlZxL1c2Skcxbmo5eGRkdGwrTzJSRmh0dXYvM3pYcHJDZ1kvMjhZ?=
 =?utf-8?B?NHlZaUp3akVkTlI1S21xTjhrVU1rQmNQemlQTVVZZGtidU4yRzhLRmlPVWxj?=
 =?utf-8?B?TnBQZzM3SUlucmF3VEVZZ2U1NUE4ZEd1dksrREdXRE10NDA5QkhFZlhzZmc5?=
 =?utf-8?B?Q2hnYitpMWVidjg4UjhZUDVBVHIvSHNyeXlOTlprclRtMkNCbUpVSVZ0TTEy?=
 =?utf-8?B?VnZEWFQyanEydmZtd2lhWE9YcnBlcWVqMS9TdG5EQUVocU9VU2J3YnNMSDc3?=
 =?utf-8?B?TEszU3VaMTJQM3RXbG1lK1N3QTU1STgyejB6SzRZVDJkZHZZTFg4TktzR2c0?=
 =?utf-8?B?MUJnczhyN2t3Z1VkNFFwaWYxemlVOSt0VGNOdU9pZmIzSXVsYThMY3JwN0hC?=
 =?utf-8?B?Q1FBRVFhbitRZGlUbjROUXJsa1gwVGY5VFNTeWRoQXl2Z3lDa0tmcFF6UlVE?=
 =?utf-8?B?QUkrSHhlUDBXanlwUHVKc0I1NUdCYmJhbWxnSDdZNFZJS0YzNXREcEpJT2tK?=
 =?utf-8?B?UVZHbTBEd3VkVTFXMGg0QnNOLzN5Q2NpSGcxSmpod1AwOVhtVEJwSjVRRU81?=
 =?utf-8?B?OERlalBYV2JQRVdiMi9BSU1nUC9ra00weTg0NnZJMXdsTTU3V0JvOXcxQ2lq?=
 =?utf-8?B?K3lFdlVQTXV2T0poaEtrekJNWHIxekp5VUp3WFNRKzl6bVFlM09YalBOR2RG?=
 =?utf-8?B?dnNsRlNQZmlXWjNFQWpLS3ZaOTd6OTNobUwxb3FNN1VacU9nNE00c0NKMm9F?=
 =?utf-8?B?bllLSmx0czByTkhRSmpsR1prNDJOVnl4UjlZZlpTdUlSa3ZTcU4zUkNyZk9N?=
 =?utf-8?B?TWFFWXFVc0Y4UU9uZUk5QnIvYndQNUN5Vy9UamF4MFE5eHZHQzloMDhjRDJk?=
 =?utf-8?B?cmNRejBnT05lMUdzamFmald3NmpBNkszRXBRL05FWUhXL2R5R0lMZm5zV1dz?=
 =?utf-8?B?blVPSTNwUUovZUZYMUZDOGl1aGc2K2R2TGdFRUx2SjRYcU54YytHUT09?=
X-Exchange-RoutingPolicyChecked: NdTB8CsN4HLBfP0YmxlBUXUsvbDbQUP84w0CJSHWAgSKVKqxSQC0qGf2V6rb5UJiEyYDmO1TKOA6NQcDB4f4HzjbNxy3fcx7hU0Ez+W+A1GOwTtfZQzATBfiVkBTQINnMKiNxNHKdfEYoyTi5ydqcB3c86cwCfdMFRNIi6SL9mMhraAcQpOQmBc3Wz8+zkKFTm3V8MU8cDcR/ZIb4KAshMTV92yVBg9HLC30wv8C5BW1u6t6DdxFBaL124PUKzv4d5WvSB9Iina8evxfyG3PP+dzlI7KiZXJeHMBkCSMnpSHY/tpGjOK8HyZcrtxiJPP5WIBZQ0EGILjY5a/K7boGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a61629-8e8f-421f-c214-08deaa80f281
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:33:13.7160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZJ0g0ZyVRGYfnBqR6EQXnsQwnFdDDIk7z4Xi64z3cTw9n3+4VDSff3LbufB6hdbAgQmHde9VQ9vASq2XyRwaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
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

W dniu 22.04.2026 o 21:19, Zbigniew KempczyÅski pisze:
> XE3P uses in non-legacy mode COMPUTE_WALKER_2 so adopt pipeline and
> shader in gpgpu library to properly handle gpgpu fill.
> 
> Difference between previous platforms shaders is no surface state
> is used so all geometry must be handled by the pipeline / shader
> (accesses to memory are via untyped global [ugm]). Threads spawned
> here are still SIMD16, but due to conditional writing to ugm memory
> with 4B vector using 4x1 sizes and positions become possible.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>   lib/gpgpu_fill.c                     | 117 +++++++++++++++++++++++++++
>   lib/gpgpu_fill.c.gen.iga64_codes.c   |  47 ++++++++++-
>   lib/gpgpu_fill.h                     |   8 ++
>   lib/gpgpu_shader.c                   |   6 +-
>   lib/gpgpu_shader.c.gen.iga64_codes.c |   6 +-
>   lib/gpu_cmds.c                       |  93 +++++++++++++++++----
>   lib/gpu_cmds.h                       |  14 ++++
>   lib/intel_batchbuffer.c              |   4 +-
>   8 files changed, 274 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index f83eee5f21..4d5689be59 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -28,11 +28,13 @@
>   #include <i915_drm.h>
>   
>   #include "intel_reg.h"
> +#include <ioctl_wrappers.h>

I think better would be to no mix system and user-defined includes, ie 
lift this up 2 lines.

>   #include "drmtest.h"
>   
>   #include "gpgpu_fill.h"
>   #include "gpgpu_shader.h"
>   #include "gpu_cmds.h"
> +#include "xe/xe_util.h"
>   
>   /* lib/i915/shaders/gpgpu/gpgpu_fill.gxa */
>   static const uint32_t gen7_gpgpu_kernel[][4] = {
> @@ -328,6 +330,81 @@ mov (1|M0)		 r4.14<1>:w	0xF:w					\n\
>   send.tgm (16|M0)	null	r4	null	0x0	0x64000007		\n\
>   #endif										\n\
>   	");
> +	gpgpu_shader__eot(kernel);
> +	return kernel;
> +}
> +
> +static struct gpgpu_shader *__xe3p_gpgpu_kernel(int xe, struct intel_buf *buf)
> +{
> +	struct gpgpu_shader *kernel = gpgpu_shader_create(xe);
> +	uint64_t offset = xe_canonical_va(xe, buf->addr.offset);
> +
> +	emit_iga64_code(kernel, xe3p_gpgpu_fill, "				\n\
> +#define IGA64_FLAGS \"\"							\n\

For new shaders please use raw strings, see for example [1]. In such 
case you can also avoid backslashes in IGA64_FLAGS.

[1]: 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/intel/xe_eudebug_online.c?ref_type=heads#L262

> +#define RX		r0.1							\n\
> +#define RY		r0.6							\n\
> +#define COLOR		r1.0							\n\
> +#define SURFWIDTH	r1.1							\n\
> +#define SURFHEIGHT	r1.2							\n\
> +#define WIDTH		r1.3							\n\
> +#define HEIGHT		r1.4							\n\
> +#define XPOS		r1.5							\n\
> +#define YPOS		r1.6							\n\
> +#define OFFSET		r2.0							\n\
> +#define XOFFSET		r2.1							\n\
> +#define YOFFSET		r2.2							\n\
> +#define XEND		r2.3							\n\
> +#define XCURRENT	r2.4							\n\
> +#define TMP		r2.7							\n\
> +#define ADDR_LO		r3.0							\n\
> +#define ADDR_HI		r3.1							\n\
> +#if GEN_VER >= 3500								\n\
> +(W)	add (1)		XEND<1>:ud	XPOS:ud		WIDTH:ud		\n\
> +(W)	mov (1)		OFFSET<1>:ud	0x0:ud					\n\
> +										\n\
> +(W)	shl (1)		XOFFSET<1>:ud	RX:ud		0x4:ud			\n\
> +(W)	add (1)		XOFFSET<1>:ud	XOFFSET:ud	XPOS:ud			\n\
> +(W)	mov (1)		XCURRENT<1>:ud	XOFFSET:ud				\n\
> +										\n\
> +(W)	add (1)		TMP<1>:ud	RY:ud		YPOS:ud			\n\
> +(W)	mul (1)		YOFFSET<1>:ud	TMP:ud		SURFWIDTH:ud		\n\
> +(W)	add (1)		OFFSET<1>:ud	XOFFSET:ud	YOFFSET:ud		\n\
> +										\n\
> +// Set base address with scalar register					\n\
> +(W)	add (1)		ADDR_LO<1>:ud	OFFSET:ud	ARG(0):ud		\n\
> +(W)	mov (1)		ADDR_HI<1>:ud	ARG(1):ud				\n\
> +(W)	mov (1)		s0.0<1>:ud	ADDR_LO:ud				\n\
> +(W)	mov (1)		s0.1<1>:ud	ADDR_HI:ud				\n\
> +										\n\
> +// color									\n\
> +(W)	mov (4)		r20.0<1>:ub		COLOR:ub			\n\
> +										\n\
> +// A64 offset									\n\
> +(W)	mov (8)		r30.0<1>:uq		0x0:uq				\n\
> +										\n\
> +//dword: 0									\n\
> +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> +//dword: 1									\n\
> +(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud		\n\
> +(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud		\n\
> +(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud			\n\
> +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> +//dword: 2									\n\
> +(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud		\n\
> +(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud		\n\
> +(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud			\n\
> +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> +//dword: 3									\n\
> +(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud		\n\
> +(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud		\n\
> +(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud			\n\
> +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> +#endif										\n\
> +", lower_32_bits(offset), upper_32_bits(offset));

Not sure if wouldn't be better to pass offset via inline data, IMO 
explicit parameters should be for things which can vary between users, 
but no strong feelings. Just this way it is passed in gpgpu_shader.

>   
>   	gpgpu_shader__eot(kernel);
>   	return kernel;
> @@ -373,6 +450,46 @@ void xehp_gpgpu_fillfunc(int i915,
>   	intel_bb_destroy(ibb);
>   }
>   
> +void xe3p_gpgpu_fillfunc(int i915,

Hmm, xe3p and i915 :) Please use fd instead.

> +			 struct intel_buf *buf,
> +			 unsigned int x, unsigned int y,
> +			 unsigned int width, unsigned int height,
> +			 uint8_t color)
> +{
> +	struct intel_bb *ibb;
> +	struct gpgpu_shader *kernel;
> +	struct xe3p_interface_descriptor_data idd;
> +
> +	ibb = intel_bb_create(i915, PAGE_SIZE);
> +	intel_bb_add_intel_buf(ibb, buf, true);
> +
> +	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
> +
> +	kernel = __xe3p_gpgpu_kernel(i915, buf);
> +	xe3p_fill_interface_descriptor(ibb, buf, kernel->instr,
> +				       kernel->size * 4, &idd);
> +	gpgpu_shader_destroy(kernel);
> +
> +	intel_bb_ptr_set(ibb, 0);
> +
> +	/* GPGPU pipeline */
> +	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> +		  PIPELINE_SELECT_GPGPU);
> +	xe3p_emit_state_base_address(ibb);
> +	xehp_emit_state_compute_mode(ibb, false);
> +	xe3p_emit_fill_compute_walk2(ibb, buf->width * buf->bpp / 8, buf->height,
> +				     x, y, width, height, &idd, color);
> +
> +	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
> +	intel_bb_ptr_align(ibb, 32);
> +
> +	intel_bb_exec(ibb, intel_bb_offset(ibb),
> +		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, true);
> +
> +	intel_bb_destroy(ibb);
> +}
> +
> +
>   void gen9_gpgpu_fillfunc(int i915,
>   			 struct intel_buf *buf,
>   			 unsigned x, unsigned y,
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index 400ff7b18a..ac2ec0caea 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,7 +3,52 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS ebaa9e23021939d874c576c7cea482bf
> +#define MD5_SUM_IGA64_ASMS c0fcff5c21cc4826b2f8f2e6624d4c5c
> +
> +struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
> +	{ .gen_ver = 3500, .size = 148, .code = (const uint32_t []) {
> +		0x80000040, 0x02350220, 0x02000154, 0x00100134,
> +		0x80000061, 0x02054220, 0x00000000, 0x00000000,
> +		0x80000069, 0x02158220, 0x02000014, 0x00000004,
> +		0x80001940, 0x02150220, 0x02000214, 0x00100154,
> +		0x80001961, 0x02450220, 0x00000214, 0x00000000,
> +		0x80000040, 0x02750220, 0x02000064, 0x00100164,
> +		0x80001941, 0x02250220, 0x02000274, 0x00100114,
> +		0x80001940, 0x02050220, 0x02000214, 0x00100224,
> +		0x80001940, 0x03058220, 0x02000204, 0xc0ded000,
> +		0x80000061, 0x03154220, 0x00000000, 0xc0ded001,
> +		0x80001a61, 0x60010220, 0x00000304, 0x00000000,
> +		0x80001a61, 0x60110220, 0x00000314, 0x00000000,
> +		0x80080061, 0x14050000, 0x00000104, 0x00000000,
> +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x80001f70, 0x00010220, 0x52000244, 0x00100234,
> +		0x84032033, 0x00000004, 0xf0021e0c, 0x9404140c,
> +		0x80000040, 0x02458220, 0x02000244, 0x00000004,
> +		0x80000040, 0x03058220, 0x02000304, 0x00000004,
> +		0x8000a001, 0x00010000, 0x00000000, 0x00000000,
> +		0x80001961, 0x60010220, 0x00000304, 0x00000000,
> +		0x80001b70, 0x00010220, 0x52000244, 0x00100234,
> +		0x84032133, 0x00000004, 0xf0021e0c, 0x9404140c,
> +		0x80000040, 0x02458220, 0x02000244, 0x00000004,
> +		0x80000040, 0x03058220, 0x02000304, 0x00000004,
> +		0x8000a101, 0x00010000, 0x00000000, 0x00000000,
> +		0x80001961, 0x60010220, 0x00000304, 0x00000000,
> +		0x80001b70, 0x00010220, 0x52000244, 0x00100234,
> +		0x84032233, 0x00000004, 0xf0021e0c, 0x9404140c,
> +		0x80000040, 0x02458220, 0x02000244, 0x00000004,
> +		0x80000040, 0x03058220, 0x02000304, 0x00000004,
> +		0x8000a201, 0x00010000, 0x00000000, 0x00000000,
> +		0x80001961, 0x60010220, 0x00000304, 0x00000000,
> +		0x80001b70, 0x00010220, 0x52000244, 0x00100234,
> +		0x84032333, 0x00000004, 0xf0021e0c, 0x9404140c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +
> +	}}
> +};
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
> index a483859e5e..417c920672 100644
> --- a/lib/gpgpu_fill.h
> +++ b/lib/gpgpu_fill.h
> @@ -68,4 +68,12 @@ xehp_gpgpu_fillfunc(int i915,
>   		    unsigned int width, unsigned int height,
>   		    uint8_t color);
>   
> +void
> +xe3p_gpgpu_fillfunc(int i915,
> +		    struct intel_buf *dst,
> +		    unsigned int x, unsigned int y,
> +		    unsigned int width, unsigned int height,
> +		    uint8_t color);
> +
> +
>   #endif /* GPGPU_FILL_H */
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index ffa357eeb1..ccab4d4b0f 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -599,8 +599,12 @@ void gpgpu_shader__eot(struct gpgpu_shader *shdr)
>   (W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud			\n\
>   #if GEN_VER < 1250								\n\
>   (W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}	\n\
> -#else										\n\
> +										\n\
> +#elif GEN_VER <= 3000								\n\
>   (W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}	\n\
> +										\n\
> +#else										\n\
> +(W)	sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT}		\n\
>   #endif										\n\
>   		");
>   }
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index 59172cdfd1..064564cfb2 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS 4311fff3bece03802f3220b7d239c33b
> +#define MD5_SUM_IGA64_ASMS bd1d8e873d1021863cf0b0cde7c332ea
>   
>   struct iga64_template const iga64_code_read_a64_d32[] = {
>   	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> @@ -843,6 +843,10 @@ struct iga64_template const iga64_code_jump[] = {
>   };
>   
>   struct iga64_template const iga64_code_eot[] = {
> +	{ .gen_ver = 3500, .size = 8, .code = (const uint32_t []) {
> +		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
> +		0x8000c033, 0x00000001, 0x3000000c, 0x00000000,
> +	}},
>   	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
>   		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>   		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 10c8bfb8dd..c61f5fe5fc 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -1267,13 +1267,14 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   	}
>   }
>   
> -void
> -xe3p_emit_compute_walk2(struct intel_bb *ibb,
> -			unsigned int x, unsigned int y,
> -			unsigned int width, unsigned int height,
> -			struct xe3p_interface_descriptor_data *pidd,
> -			uint32_t max_threads,
> -			struct xe3p_cw2_interrupt_data *intdata)
> +static void
> +__xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			  unsigned int x, unsigned int y,
> +			  unsigned int width, unsigned int height,
> +			  struct xe3p_interface_descriptor_data *pidd,
> +			  uint32_t max_threads,
> +			  struct xe3p_cw2_interrupt_data *intdata,
> +			  struct xe3p_cw2_gpgpu_fill_data *filldata)

Hmm, 9th parameter. This is asking for refactoring, maybe it can be done 
later.

>   {
>   	/*
>   	 * Max Threads represent range: [1, 2^16-1],
> @@ -1282,6 +1283,14 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>   	const uint32_t MAX_THREADS = (1 << 16) - 1;
>   	uint32_t x_dim, y_dim, mask, max;
>   
> +	if (filldata) {
> +		if (width + x > filldata->buf_width)
> +			width = filldata->buf_width - x;
> +
> +		if (height + y > filldata->buf_height)
> +			height = filldata->buf_height - y;
> +	}
> +

This is quite ugly, why do we need these ifs, here and below.
Just asking if we can avoid conditionals somehow.
And what is width/height and what is their relation with 
filldata->buf_(width|height_) ?


>   	/*
>   	 * Simply do SIMD16 based dispatch, so every thread uses
>   	 * SIMD16 channels.
> @@ -1294,7 +1303,7 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>   	 * thread group Y = height;
>   	 */
>   	x_dim = (x + width + 15) / 16;
> -	y_dim = y + height;
> +	y_dim = height + y * (filldata ? 0 : 1);

Again strange conditional.

>   
>   	mask = (x + width) & 15;
>   	if (mask == 0)
> @@ -1332,9 +1341,15 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>   	intel_bb_out(ibb, 1);						//dw8
>   
>   	/* Thread Group ID Starting X, Y, Z */
> -	intel_bb_out(ibb, x / 16);					//dw9
> -	intel_bb_out(ibb, y);						//dw10
> -	intel_bb_out(ibb, 0);						//dw11
> +	if (filldata) {
> +		intel_bb_out(ibb, 0);					//dw9
> +		intel_bb_out(ibb, 0);					//dw10
> +		intel_bb_out(ibb, 0);					//dw11
> +	} else {
> +		intel_bb_out(ibb, x / 16);				//dw9
> +		intel_bb_out(ibb, y);					//dw10
> +		intel_bb_out(ibb, 0);					//dw11
> +	}

This is another problem with x, y - it seems they are unused (almost) in 
case filldata is present.

>   
>   	/* partition type / id / size */
>   	intel_bb_out(ibb, 0);						//dw12-13
> @@ -1366,12 +1381,26 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>   		}
>   	}
>   
> -	/* Inline data */
> -	/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
> -	/* The rest of DW33 through DW46 will be copied to the following GRFs. */
> -	intel_bb_out(ibb, x_dim);					//dw31
> -	for (int i = 0; i < 15; i++) {					//dw32-46
> -		intel_bb_out(ibb, 0);
> +	if (filldata) {
> +		/* Inline data */
> +		intel_bb_out(ibb, (uint32_t) filldata->color);		//dw31
> +		intel_bb_out(ibb, (uint32_t) filldata->buf_width);	//dw32
> +		intel_bb_out(ibb, (uint32_t) filldata->buf_height);	//dw33
> +		intel_bb_out(ibb, (uint32_t) width);			//dw34
> +		intel_bb_out(ibb, (uint32_t) height);			//dw35
> +		intel_bb_out(ibb, (uint32_t) x);			//dw36
> +		intel_bb_out(ibb, (uint32_t) y);			//dw37

No need to perform explicit conversion.

> +		for (int i = 0; i < 9; i++) {				//dw38-46
> +			intel_bb_out(ibb, 0x0);
> +		}

No need for parenthesis.

> +	} else {
> +		/* Inline data */
> +		/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
> +		/* The rest of DW33 through DW46 will be copied to the following GRFs. */
> +		intel_bb_out(ibb, x_dim);				//dw31
> +		for (int i = 0; i < 15; i++) {				//dw32-46
> +			intel_bb_out(ibb, 0);
> +		}

No need for parenthesis.


>   	}
>   
>   	/* Post Sync command payload 1 */
> @@ -1392,3 +1421,33 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>   	/* Preempt CS Interrupt Vector: Saved by HW on a TG preemption */
>   	intel_bb_out(ibb, 0);						//dw62
>   }
> +
> +void
> +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			unsigned int x, unsigned int y,
> +			unsigned int width, unsigned int height,
> +			struct xe3p_interface_descriptor_data *pidd,
> +			uint32_t max_threads,
> +			struct xe3p_cw2_interrupt_data *intdata)
> +{
> +	__xe3p_emit_compute_walk2(ibb, x, y, width, height,
> +				  pidd, max_threads, intdata, NULL);
> +}
> +
> +void
> +xe3p_emit_fill_compute_walk2(struct intel_bb *ibb,
> +			     unsigned int buf_width, unsigned int buf_height,
> +			     unsigned int x, unsigned int y,
> +			     unsigned int width, unsigned int height,
> +			     struct xe3p_interface_descriptor_data *pidd,
> +			     uint8_t color)
> +{
> +	struct xe3p_cw2_gpgpu_fill_data filldata = {
> +		.buf_width = buf_width,
> +		.buf_height = buf_height,
> +		.color = color,
> +	};
> +
> +	__xe3p_emit_compute_walk2(ibb, x, y, width, height,
> +				  pidd, 64, NULL, &filldata);
> +}


As I commented before - abstraction looks problematic (parameter 
inflation, null checks in shared code, parameter duplication).

Regards
Andrzej

> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index b3bfb137b0..a8a92d0f29 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -45,6 +45,12 @@ struct xe3p_cw2_interrupt_data {
>   	uint64_t post_sync_val;
>   };
>   
> +struct xe3p_cw2_gpgpu_fill_data {
> +	uint32_t buf_width;
> +	uint32_t buf_height;
> +	uint8_t color;
> +};
> +
>   uint32_t
>   gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color);
>   
> @@ -168,4 +174,12 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>   			uint32_t max_threads,
>   			struct xe3p_cw2_interrupt_data *intdata);
>   
> +void
> +xe3p_emit_fill_compute_walk2(struct intel_bb *ibb,
> +			     unsigned int buf_width, unsigned int buf_height,
> +			     unsigned int x, unsigned int y,
> +			     unsigned int width, unsigned int height,
> +			     struct xe3p_interface_descriptor_data *pidd,
> +			     uint8_t color);
> +
>   #endif /* GPU_CMDS_H */
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index b095065746..189a411968 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -769,7 +769,9 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
>   {
>   	igt_fillfunc_t fill = NULL;
>   
> -	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
> +	if (intel_graphics_ver(devid) >= IP_VER(35, 0))
> +		fill = xe3p_gpgpu_fillfunc;
> +	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
>   		fill = xehp_gpgpu_fillfunc;
>   	else if (IS_GEN12(devid))
>   		fill = gen12_gpgpu_fillfunc;

