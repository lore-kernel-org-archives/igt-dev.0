Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90B9CCD195
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 10:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791F210E120;
	Wed, 18 Sep 2024 10:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2spOenA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE9410E120
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726654712; x=1758190712;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7409/0OBE/rr4nCvmHGN3U+JtjFCx1kbnJyuWiOPJdA=;
 b=d2spOenAWrnwFQUpMQiN/3bJ7t9AHRD99pXPGMXKXhcdohHr08JZNiDi
 Nl8p0qpCDnoQXFFEB2OFl1yyyyfXr0fBm3m1iTKw1pzL50m99Zw30wHfo
 aGlCqvk6Ma1XEPUEt0V/w0hYJpkEEsuywRyNWsz6ZUinniU3lYA1daq98
 CkfiY6isYTRKw4GAUqcwpSj9bwKWWussRmtM7mxOAKO/9YU+pWyhgkP9R
 1gCdCubexUhjbiSv06vKKhHR2JgomInRZXUeef4DO5A36d+idGodOo26I
 GkELp5ncYyBpWEcNs5JOcpVjotd9RzETHqjTWwnEPzx4Dz2pTD9HH9e4c w==;
X-CSE-ConnectionGUID: WXhbdiQiSNOQh65Ca9TOeQ==
X-CSE-MsgGUID: Mn1bZXcmRt2PFZxkvgBaIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29300294"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="29300294"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:18:32 -0700
X-CSE-ConnectionGUID: AJwxImZaTQq2EEtTRIXKBQ==
X-CSE-MsgGUID: /Aq9tGDvQm6GpoJAsudEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="92787566"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 03:18:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:18:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:18:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 03:18:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 03:18:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pz6ZF+vIQBGhEA6pPF/3VTuCNSIgkRNWyJnFTM3OSiVht7iXRzzAZf/2IzobC3um21bl7RkIxg/gZ5kg6E7F9aX6solkXfPQtSdYRQWCrjcm1k4VQw40ZucWc2uPc8aso3j8RouqPOMba5SgEjhcbc9gFPihGWTUnKyfGd33wuAW4EY9bxAI0XS04fim4CTM9EPAyathZFHLMVmcfKZTLzTI4Oe+KP/n/DEd4Q2I3usSDN15yaLc1XulPIodSpsz2c/ahPsVwRKXUA46yv4GvbKPtq/qbKBMqTfZ9zOKiGc938gJTeOEthg3W0/uatG5bt69JxptYrk0CU3Kh61jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzRrBOpk2WPf8keAmu/Yl5aNI/RgSUNHfQmp55hBs/I=;
 b=wAypzoSD3HZpnddN7ZyFpymgJC53SjsSueJCnZUJaX5hk5opqm8ZshZFZz1DrzC6LeMeTs+S5FWGywWqIigBkVwAeuM4uB8Jc2ZkNrzhCzENJ6KS2p35MpJq3kFVzZt3/J2JYxj7uQY4rCua2JUOCcYE+1grJYRUlo5Bml3RKDm5TqKOKvm4xEzbrdC+z3/QcrthUqgUffc+Qp21rmOVrg4zHoW0RVk1JYp+JeYQc8UtmbqWUpD0ronY2L5AbupFFy+J/SUIBEnq+u4gEOVAoB96EcaK2NKL/hrzmr7FKg4iFkwCt7l5T7JNJOw0sc8U7nhrPWcWQPBnntqiWfsLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Wed, 18 Sep 2024 10:18:28 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 10:18:28 +0000
Message-ID: <4322a2c7-a532-4f0d-954c-19b91a712fc2@intel.com>
Date: Wed, 18 Sep 2024 15:48:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_universal_plane: Use COMMIT_ATOMIC flag
 when doing commit
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <jeevan.b@intel.com>
References: <20240918082918.792033-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240918082918.792033-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS7PR11MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: c3856597-dbcc-4f25-734b-08dcd7cb3d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnJkY3pGRldaV3BJVktOZHpQMTZHZnZZaWM1V1UxSU90UzFyNU9xMFZrMGxp?=
 =?utf-8?B?czArbEszb3ZnUWdNNDhmTHA4bHh3aVVvNHlSRjdWSWEvN2F6UWVuVkFoS3Q0?=
 =?utf-8?B?TXFUY3ZzVkdJVzNhaDZuTmFhNjYzdjdJcUd5SjNxOVlMbnNrcS9Yd2tZWDRZ?=
 =?utf-8?B?ZGNmYkZzWmlLNWtFdTdhZUQ5KzRMU0FobFVUYW51eW5BM2RKekJybTNpOGF5?=
 =?utf-8?B?bCtWWnpBblQ5V2pYNkdTd3hnQWxRWnhHUHUyb2gxKzJ2QUZJL0FPT2ludC9G?=
 =?utf-8?B?VDBnL1pXOWVPWVhmUjBTZmFwTnE0bWo3ZEZTbTZ3cEZKYU5jNThwZTJCRnJL?=
 =?utf-8?B?SXZlTCtuaHdHV1lWQzVKVXZiYzBFUTB5ZGJRdUVyZld1VHhUNU5GK2NCMGxQ?=
 =?utf-8?B?MTJGVlVVa1M2ZW9vTUh2MTBtckZCdWtkTFhxYTNtTldrWmhnSHV2WE11YTEv?=
 =?utf-8?B?bndXMk9jUUIxQURIek1ZektxdDEyRjYrc2RxSU1vTVhnRGZlcUxpWVVkZStT?=
 =?utf-8?B?Q09Sc0ZEQ0VleVo2UStWcE11WERmU0lBcWNMb21OWnM3YlFjUzM5QXk0T0NM?=
 =?utf-8?B?UUVhVlFBUWxWM1d6ME4rQmc2VCtlU2ozcDdjN2wwVFlyM1h2by9XY09Ed09Z?=
 =?utf-8?B?bWdSYjg2L0dlY012TUQrVWxjc1BIRE5Kd3FLcGdYZU5DdFhmajh3WUVpM3V1?=
 =?utf-8?B?a1lZU2Z6T3g2dm1iMVdWelpyZWtTczVhQ2lTbVZGSTNSdG5RVnRTYVlZaGhy?=
 =?utf-8?B?R2VQbnlKNFdrYVh0NktDTHo1anpHRUdvSDVTRCtFOTQwajh6VWU2Uk44d1B0?=
 =?utf-8?B?ZFVNZndqT3BxQW14T3VuYUVlL0JFb3p1NUUvSkRMVVB0ZVEveEdKQm9yYmRo?=
 =?utf-8?B?dENCMHNSWEhpbjkrOGxFeGpmYS9vR3Y2OHdYY1FlMTkxTkdJKzhRT290YmN2?=
 =?utf-8?B?bUpCQ2ZBdTdOTGtsUjMyYWZLejlPazh4ZEhZZXZ1NW9hM3MwWVhTelBEa3Jk?=
 =?utf-8?B?VHNJUFRXUjc5c21zWEZYZW01aXNNK2U2aXpmRzh5WWJVU0x2cXUyRjQ5Ymdi?=
 =?utf-8?B?b1hWdFpnZDJEekpXWk9rZmVVMkNYaWJybys5UGtRb0YvalVjZnpKMnQrVVJz?=
 =?utf-8?B?YnlLdVFCaVNJQ212TVBqd2pYRFdMRUtJV3NxYklTY0xObDE1ck9FTDJubDFk?=
 =?utf-8?B?dThWWnZ4WlJaRkovMndacS9XU2NvTGUxbi9Qc0JqYUExRHAxSlh4NEtUa0g0?=
 =?utf-8?B?Q3FxNld3bHpydUpqQVkwN2psOHZOSzF2R1ZYemUzUVluUXRDS2U3Tkh6MFZ5?=
 =?utf-8?B?aGdtVWJKYjN4NisxckNLRGRDUVk3VlVzSVZOSEgvY1p5M3kxY0liSmZhbkM2?=
 =?utf-8?B?VzZUd3pWT0tQTlV3N29XSkRHaVNGMTdNZVplZkdJSExuSWY4cWtrZXBtbDAw?=
 =?utf-8?B?djVTV0RzUE9nelk5a2Uwc1lGV1V4aUFadVlxOGZSZ3pUR2FhVnllUjZvSVBC?=
 =?utf-8?B?VWZERWxpc3ZWNEJGaGxJQWJYcVVsVGFueEpXUGhYT252Yk9IbmpGRSs2d2Vk?=
 =?utf-8?B?bHhhMmZDVVhONEtWa2pjdVUxL3lMR2tIcmVrbWVQZk9pVEpCREpqeWVsanRh?=
 =?utf-8?B?OFlraDU0V0FjWFNPUlIyYktXNjk3dElmT3dmYXNUcGFTQWFkRjN5a1lvWE10?=
 =?utf-8?B?SGRNTEVnUm1hQlp2aURRR3FLdU92SzBjZFZzV3BubzlDTS83eWp4cC9jcVBn?=
 =?utf-8?B?TE10N0g5RUdZMmI5bUIwUGlQeEFqbDdtLzF6dVhLTzJ3bnRIN3JYNzBlaVhn?=
 =?utf-8?B?RXJNeTdDTko2OXZ4VytBQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzJCODQwbFFXWldOb2szTEp6T3Vpc2p6YjBqSHN3ek1jVFkvdnVyWTdJVFdG?=
 =?utf-8?B?RW54UzlYMk1YVTRweDZzQUdMeHo4WjZBZlZSZ3NLNWhqLytOem1zZGdqdyty?=
 =?utf-8?B?ajE5Zjd2eG02eWp3RUx6TC9sU2dKKzV5dUpsdHR3OXUwV1l1ZHA2NVZSNWpt?=
 =?utf-8?B?aDgzdE1FSUY1S1I1MWE4dFZqanBaR0Y4akIvNHVJVDY1dmNsUFJhbzdFZDVQ?=
 =?utf-8?B?ZTVKY0tXZlJuRm8wMkZZWkR4T2tvbE4wVEZlYkdVVmsyVjRBSGRDNFl6TnUw?=
 =?utf-8?B?LzZ2T3pGTk81SEp4SE9nYzFPV2FOcCtrTTU2bk45YjVMTHlGSVllbWt0Ulhl?=
 =?utf-8?B?QmxHckZwRUVJM1RUT1JnQmp6VGhXL3oyQVowcG5ndFFHSXI0OGVjK1VBZEMw?=
 =?utf-8?B?TExkV3RRbUpueVNxYlMzNmJxaldBaFhiUkEwcjhwb1ZZMm9KUkcrRVJUV0VP?=
 =?utf-8?B?UW0xbGorOHB5dEdlSlVSRmlVNTRXL3pUSC9tdnJwbXplUWpNQk0xWHJEUjBG?=
 =?utf-8?B?NU11U0VZSFlFdTVEMUpyWjZ1d0Y1bVBicm5IZUxsRm11SWFiencvRXcrUGdl?=
 =?utf-8?B?REZJaDliVlM5eFNEQmlQTjVmTGhVN1ozUDRiTXYweWRpMTZJZTQ5bzl5NmNi?=
 =?utf-8?B?TzZJRm92em9WNWorNlJLWUh6MjR5SDBSRUhZY2YzcWxkQUlrOGlwblE2c1Bl?=
 =?utf-8?B?a3I0b0tFbVFXTzJtQ1hBNW1Gb25vR3JlSnQyaEhRRTY2UnRXTG5UTStnbkl0?=
 =?utf-8?B?SVE1RVdMUG5rSnU4M20wdWlhTm1QUnFjZ0NQUU51ZHhzL01ES2RWSUJKdjNv?=
 =?utf-8?B?a0dIUmdzWkRNMVdoZnpiaUVBajhpME1RZm90VVNCSGxjYWlKQjNZUk45Zzh0?=
 =?utf-8?B?aGl2SFpxVGRHbUJ3S1VtRFRTWmdadGFyTnBvRENqbzY3bFJXRFhwQkhmdG9s?=
 =?utf-8?B?VjdtYWl2d3FteTI1S3I5NlF1SDZrYWZWMGhpbS9GYTA5K0MydHBnQmNtYVZs?=
 =?utf-8?B?WHBsRjl6TGNBYVBaZ3JyMlEvUk05K0dEZkZraUl0MlBURlRYaS9NbXpOQU1F?=
 =?utf-8?B?RkpCNEtQMVd4eHhnd2JIRFloNWxtRlhOMFpsVUJybk9nQW1Oci9QMEJwWGNW?=
 =?utf-8?B?enBRUjFtWXZERDNkWFZiYmlxR0haNjRCcVFtNmdmdlVWTVFPTC9CTUpZRC9L?=
 =?utf-8?B?Rm80S0JUVFRJckc4RmR2eXJxVndHUkM0WWtqcG0xWXVEZlFqeC9La3A3bHFS?=
 =?utf-8?B?QmZEUDRPenNpWHF0emVjbHRQbWdSdW54OUlXNjdmckxQL3FHczl6aGlhL0FW?=
 =?utf-8?B?N0RnMXZWT0FoMURJeStuMVVrUk1hdlhGSm10aG56ZkNBdGtGNTB2WnJMRFM3?=
 =?utf-8?B?SlN0MndEcTRJQXNSZjVuVlhZbHRScG1xOUxjcysxRS9ROVZMUCsxdVJXaFZj?=
 =?utf-8?B?OFVNcW5GTU13NFE5T2duNnJFYlI0V1JDS1NwcnYrS0VVRUl3U2R3VjBCVVlr?=
 =?utf-8?B?NnpNdHVvaURHOVhyWVFwcjN5Mm5RalJoakNpajhaeEl5SWRyRlBDMUlmaTNR?=
 =?utf-8?B?Nk80QzA2SktsV0xZS3dJcDZsK0xWQ0JZbVg2bXlUME14eG9FRGhNYXRVWXFR?=
 =?utf-8?B?WVJrNkdIenBUL09RNHFqUmhDN203MUZxQ1RhM3JvREJvalZTZzhNRGZvN3kr?=
 =?utf-8?B?Wk4zTmNRZVRvN2pIZWRabmkxaXdzdElHdG1oTUl5ZUxsZWFFYWlyVzFld2tE?=
 =?utf-8?B?YnpwbEJZaVM0SHJnajZDM3ltUDdTOEFmSWZYOVVLWmpsZkJrdXdzdFlPTVZN?=
 =?utf-8?B?Vk1yM0EweVRjK2hWUEJPVHFSWFpqWlVUWDRQWHd3RS9EcGZYYnpTN0VVaTRw?=
 =?utf-8?B?RTI2V0pyK3pmZURRR3JkeURaWlo3UFdyUGFlMzhTLzlvd1UxUGFoMGdESERT?=
 =?utf-8?B?bE1SemcxamJTUnZpc3o1RDE3OGY5eWNnSkV6dDlZK0t3K0lzaDZ2aTFTVCtU?=
 =?utf-8?B?SDNwL0VWQUloYUc3VnI3aXhmL0hDR1ExRzQ0ZWlIUHZrMk85Vi9XVXdkWXlo?=
 =?utf-8?B?NG8rOXFQVUtKdW95QmU4RWJVVHVqQTdUQWozSDdtaVdhbXBRSzRrdkFaU21Q?=
 =?utf-8?B?bGpBUDdQTGxwSFg5TldJZGdjdktob1RQUHdxeTM1OGdMNVBEWFRtcjZlODl0?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3856597-dbcc-4f25-734b-08dcd7cb3d43
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:18:28.8302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boB5mtogUSORoHJiQDd7CR27YViCuaNbSKleQQfVmjj3GTXWqgDM8JkbeO0dTHxV7X0Kl2bLQpcNXPPP7/lZDh95uNeeLItSghI7EG5Ow+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
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

Hi Suraj,

On 18-09-2024 01:59 pm, Suraj Kandpal wrote:
> Use COMMIT_ATOMIC flag when doing a display commit so that we make
> sure to wait for all the cleanup work to be done before going and
> reading the i915_gem_framebuffer entry otherwise it may end up
> showing an incorrect count sporadically if the cleanup takes
> place after the count is read.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/kms_universal_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 8c1ce8143..081847f87 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -702,7 +702,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	/* Release our framebuffer handles before we take a second count */
>   	igt_plane_set_fb(primary, NULL);
>   	igt_plane_set_fb(cursor, NULL);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> +	igt_display_commit2(display, COMMIT_ATOMIC);

I guess, it'll break the legacy. You can fix this as
display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY

- Bhanu

>   	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>   
>   	/* We should be back to the same framebuffer count as when we started */
