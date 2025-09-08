Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8BFCA1013
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 09:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F9F10E4A7;
	Mon,  8 Sep 2025 09:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDPVlZdq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E974F10E4A7
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757323324; x=1788859324;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=5x+z2Mhd1uWPoNdVZaraDu6VOlbMLhRJIt+4R3gFnws=;
 b=PDPVlZdqHsQoEuNM8qJORARjLbvZO0zlBgLmrH2Q0K5ke4G7jGG6dofK
 2BruQ5jVpau2vy96EdKDPGirp49mwqwFVjoKWe/Paf8toFDLT0vZD3PCr
 mPhHHNPo2UUkvoDaoVyE302lcmhIABCIi2m1FuyF/niQmbDCQGGkkPyIx
 jhvRByG/CjNYrYTKkRyqhPeLkT+41gbuEpIRYH3/eUHShaJUm6LzprHbh
 WtjDZ5LRsDJ4jvoR8oaB3+i8tzhYNFU/sij9T6rxhYv9bzFD9zuP0h0aP
 uyKYV2DaB+iu2eRhOnel/UIKKbSad50ukdc6dLtP+64fFeEsezIykewai A==;
X-CSE-ConnectionGUID: CL/a4C18Thu9Me/olDhEqw==
X-CSE-MsgGUID: Xq+JSTNQRJSbaftJNw3+NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59645518"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="59645518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 02:22:03 -0700
X-CSE-ConnectionGUID: TDbTW3ZPQCmpi8xbs+ZTRA==
X-CSE-MsgGUID: 8Z/EjkDKRP6W5Umwvzcy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
 d="scan'208,217";a="176803971"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 02:22:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 02:22:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 02:22:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.58)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 02:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYuwKBdJEO+4POFM5qnulbKIeV60BbM608P+dymKCp1rGdW+0LFjI1d99ByazdgLOujhLeIBrwCBYB2OpQ86tL7GXYzGyZORvP2yyudFWmoDHlEvClcT85pWRzqhB0ObHW+T5SqAGeI/xEsTY80bZpt7+QnMjhbjc1A96+WbqXImJ1eSW9+5j+eAS8L5zFibr5kyXPKKSZXwTRJFV7ZCG8eY5q4BuWo9ataFpYoYvI0IotfZnhVpJMwwMzx8E6QvtBe5n0IHN4sAAbveAsVV3iCf44lq+XjNw/kb45B7zKkDtIl6B31s/syVwNQziJCiXqUWH2YmgNOJYuZ9DNXt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBgzUq7eQGC5RDTNaXE07gvcCb1vNHXdbFAfKuXEZ84=;
 b=cPFzb1Bkonf1E00AfENfXLn3LPCTiv34fYU6GuN4l5JMTlNUvefcX7xIFNi20Q9brvCvszr6xc7ipe4Oedm0a/ku/6N3RjVlOex0zR4CRhW2I++rN1d+JHJPAVrFQP1ZZJHjl3r038QyyT99PfywzFixsoNiQGXgSN3nL/mUjbi11IDDlJXl4Bo/+0J1T72sRj+2MnkY2DWwXOA+0Lgj/cH+HA6d/9FVA0oYCKqoV+mWViKlT26Ti0UYvpp43LcYUOooUL+IX4Kk6cvdjpc636ZBSobidS61bzfSRLbo2btgfzAL9yVv3npFXc0HpB/3uHMxMxzQRMBucksWyqHPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB8259.namprd11.prod.outlook.com (2603:10b6:510:1c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 09:21:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 09:21:53 +0000
Content-Type: multipart/alternative;
 boundary="------------NYmNsoLMC0JuYKUmbYI54gkm"
Message-ID: <b27c4df8-bd4b-45a4-a4f1-74bc4922d31f@intel.com>
Date: Mon, 8 Sep 2025 14:51:45 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/kms=5Ffrontbuffer=5Ftracking=3A_Remove_FBC_modulo_4_restrictio?=
 =?UTF-8?Q?n_for_ADL-P+_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, Uma Shankar <uma.shankar@intel.com>
References: <20250904093237.300400-1-uma.shankar@intel.com>
 <175708743153.307560.6266685726592172655@1538d3639d33>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <175708743153.307560.6266685726592172655@1538d3639d33>
X-ClientProxiedBy: PN4PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 74da9a00-383f-499d-a984-08ddeeb92501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|1800799024|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVZ4OWx3RGF3c3VZMjkvSzVXclJtcTlVTXhHVHFDQXNNZC9HaEFreWIxWHZl?=
 =?utf-8?B?S1lRNkFHa2VTeFQxcHMzcHU5c1kyS1pkc1NjTUVlSkIrTThjSzNrYW1aVm1m?=
 =?utf-8?B?UG5HRUhIakxtaWVKMzFYcWk0UFQwYnYzZlFJNFh0ZVF4TmwzYjBRUGgrL1Bz?=
 =?utf-8?B?MXFqZWFYNmVWNTFsV3pFbFZKVWhjQmQ3VjhsdStRc1FVNEZKNnFJSUdyeDUz?=
 =?utf-8?B?anlOU0hpSDNkUy9uU3o4S0ZQRlM4MUdpaUdvSWJxK1laYlJMMWV0TkV5U0pS?=
 =?utf-8?B?eXNncDJoMzNXcjZSSVRLZDZYQzM2N2J6Qi9Ja2c4NlFsNWpqclJSQmtRZjhh?=
 =?utf-8?B?c3M4TWdNSk5ub01vZ2I4Tk5CUDZkNFQ4WWErR096YlY5YXo1d3UyZngyV2RQ?=
 =?utf-8?B?Vy9HSlRteW9LK1NvR1hWZDlnUUNFaWRUa3VYTCt4NTdXRWI2Q0l6OCtlWERS?=
 =?utf-8?B?Yy9LOXFwWmNHWUtjSG9YU1dBNGJEdjlqYURSQlJOQUZZRkhQZzBlbzdQcUxQ?=
 =?utf-8?B?Y2RRRGl6bkJyQmZwQ0NxamNjaWxIRjdLZG93dG1RRmxhdnNXdllZQUIvTko2?=
 =?utf-8?B?RUl2UHhhSVdBMTZoY0JIT2d1TDkxV00wWVYzL2owZUhwNjFWZ1JvdFJIS3RJ?=
 =?utf-8?B?ZGQ5Y3lKQ1Z5anJUeHp1Nk5wTWFjenhuVVZlTUtROFBsOGRhbW4ycnR1SVRG?=
 =?utf-8?B?cXR0bERlVmZkZmxMeWZKdjhnUTJlV2V0dEFzcExQalRZQ2VpcmVPOWZEV1Nt?=
 =?utf-8?B?QTdhZUlwbVhKMStXOHJvNUMvOUdRMzJ1ejgvd2pXbzJWTFBxRWlnTm8vZG9k?=
 =?utf-8?B?cVVkNnpINEV5a0ZwSzVwTFhreTIzMjlkd2pEcGF1aVN0WndKR1M4V3NMV3NF?=
 =?utf-8?B?U0dvTjlYZ1QwT09uaURRQlZBL3d5KzZSdzJYVDFqU0hoOVByRWxlMmR4OFgz?=
 =?utf-8?B?UHdmMFN2bzVjWDg3RDdEQWhFcnRmNmtjVnk2TE44ZnFidlVvRWNONFBjWXpr?=
 =?utf-8?B?RWN3RUJERlhXNkJRU3o2Tjc3ZHpOalNFZ0NQRWV1bUYrb3ZrcVVkaTZDT05K?=
 =?utf-8?B?K051Tm1XYnhTSWxESVhyK1ZGZmZheTU1SUlZcHp1SnZSUFlDRFVwNm94K3JO?=
 =?utf-8?B?SVlKaSswN2tPQ01lQXpXUDdMS3R4UGVxN1N4T3NtRTFkZXp3Z1VCWFZ2ZFFU?=
 =?utf-8?B?d29JUjhueUJRWGwvcWJQanRIY0F2SnNLc1RWS2hPUnRZUWh5UzZTZ3A4TEpY?=
 =?utf-8?B?WUwyRjErN2V1QUxaM2ZFVFJhSUE3V0lQdVFYUitYL2ovSUhxR3QzejRZQjVw?=
 =?utf-8?B?dEZqaS9waVRDTU1JbUhGeTB2TEk0RHRZUHI1bG9kUk54cUdhKzhEZ0dXNlk2?=
 =?utf-8?B?eXFUbnZLTHpucXdRRFhDSVBCMmtOTGdVYnhBdHUzUkRJdXNTV0FIQk54YWhV?=
 =?utf-8?B?V0FFWTQwa09VOUpkMlNveDJHbmlYNW96WnV6MHUxT3ZZb1BkbUZQRW80VDlZ?=
 =?utf-8?B?Q2J5bkRRRTFIZDFCdGY0WW9EaGNaMk1XdzVoanprUHE3ZmtLRXUxVGhEWk16?=
 =?utf-8?B?L2J6NkpUR0JrNm1VNDFoRy9FZzBJVUx5Nlc1aE9GVGdBb1lDUnFwR0ZpaXJv?=
 =?utf-8?B?MTFvRE91Zy9JWGJrd25jSHRwbUpML1ZVdm9DV2xNeTkzVVM1UzRxT3JVUzRr?=
 =?utf-8?B?cEl1eFVJTnBUc3hvV1BZRURSQWQ4ckQ0WFdmbk1jZzlFMEZGbnNkRW1ad1VX?=
 =?utf-8?B?Z1lsaTBZbDlDZDR5RWxpSjI3MnViMitvOGwvVnlBM0ptNzZNLzQ5aTd6dVln?=
 =?utf-8?Q?iGztIRA//T5Gl60D21p+5J6rpHVnkWf2fn2f8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtWS3JmUkdUVU1lYzlSclZFWDVmcHJ5T2JkMmRxeElzaklSNWMvRVo0dllj?=
 =?utf-8?B?aENLYWEvZ1V4WUdkbXV5L0lnM0MrdTlDSHRYbUJwR1h1SGVDWWhMQndocHRu?=
 =?utf-8?B?VXRkVEdGQjRqTjhmdDdaaXN3d2hjS3NnTU56RERRK2dnaWtXck05dm5DbDFF?=
 =?utf-8?B?ZU04TjRYMjdFV00ybzQ2VWlKTVcwOUJUbWNEZENPTFBpZ3d5YlRpYWVKQzRI?=
 =?utf-8?B?VTcrWDV5MHlPRXhGS1JiaU9TRktqbEZCNWh1aVl4SXlPK0dTbjVhSENvV1dL?=
 =?utf-8?B?dEpGcXBXYUJ2U21pZlBqNDlydWEyNVhyWmRzcUlaVzQrRkJHMUhGdEpFa2s1?=
 =?utf-8?B?WjEzR1ZiM0dOeUMyTldIdFZUdHlKeEFLeDFTQzJvYUJiNi92MURjc0twdCtw?=
 =?utf-8?B?OHdlUXV3RW1uaXdlUCtrYjI1bkoyMGdGbXIwZEdwcTdKRVJyb0dDaGR3SGxj?=
 =?utf-8?B?WW5KRkM1N2pjY3BkdWxaT01kVjg0emQ3T1JPcnk1b09OejBMZ2JDeTcxOGE2?=
 =?utf-8?B?R3RjY3FwdXpzY2ZmWkxJVjdNa0IvUzZnWk1sd2p2clZ3RitreTFXb3RGSVM3?=
 =?utf-8?B?Qy83dzNNaStHaEpHajlRN0tVQTZ3YTFYamFQcEtHTXpPL1RvZEVoVS9NVm9o?=
 =?utf-8?B?MkdUTWlUZU9HV0RlZkMxV3B5dHNJc0l3RkVTNkdPbWxtMzNkSVNKMmlWbjlN?=
 =?utf-8?B?NmM0VEJncEJJYU5qbGFweXBCOGg5UlVXY3lzd3lMb2tFUHZGK1h2VmlpVkdE?=
 =?utf-8?B?TklIdGhDMCtQVUFnbVNZajJNaUN3NVpwRFlFU1BuZ2kyMmJGRXdvdDBuTWFF?=
 =?utf-8?B?WHdzdjZRSjdUbmlQak9KTldMVmFvOEM5dm9YUnpsVU1xdDY4eDhYcWltWWQ0?=
 =?utf-8?B?a2Q1a3VmNW91NWFKTjE1am5lQVk2WTVlbGxLS0Y1RHQ4R2FVUXRXV0hqUzlG?=
 =?utf-8?B?MmgrRnZ5cVkyUlFUNTZ1QnlWMmNYU2Ryc3JYa2VpbElDR3ZOS2ZNbUcxRnhy?=
 =?utf-8?B?ajJVbU4rRE9tUWY5am9ucDZTc2MvOEgzTmpnS2ZQZUhxVElaUDlhZHUyUk44?=
 =?utf-8?B?RllYU0pUK0JwL01nRTl0SkNoOGJuWUwrM1M2MHd5Rm0yU296T2I4SDZwRTRY?=
 =?utf-8?B?N1kwRjJlN09pZVUrWXFFUWlGWFBvcXBvUmgrZlRsVUtHT3BzMjNNVnM3NGFp?=
 =?utf-8?B?WUJVNmg0SE1ielZHQm4zM1BRYndidE83U0N2Z1pQMXZFcnl3cjZsUkUxWDhQ?=
 =?utf-8?B?anpySkNsZWtsZUkyV2U2VmUwZkZVR205WjA5U1pNVHNCMWdDUTQxMEE4bVF3?=
 =?utf-8?B?U3pxM3dQcVY0ODlLS1Q1dTBxN1hNUHoyYWNYeTZUOVFDT0tYZE5zVmZhU21k?=
 =?utf-8?B?R3NrN2thaDROZTVXZzEwNDZqTW9mNmt6ZzU5Q2JEV3ZGaWZXSmxGUVpZNEdq?=
 =?utf-8?B?eTdnUHdLZEZPRUt3U2xXVTBjRE1KbHlOb0htK0cvRk1yQjNNT3poK2ZPYmFV?=
 =?utf-8?B?aXU5ODN0TW1LYStkUVZKUStwcHJsOVBaOXpQQ3JyUWYrU2ozMUpCUHpiaU1l?=
 =?utf-8?B?VmVYK21nNlVqdTFrQUVqQmo4MHpUT3ZVNHp5OWpTUUtwMXhpclkwN2pheUJ0?=
 =?utf-8?B?VnR1YXdWL0RsZENyMW05UUFCWWtWN1VWT3JCb2k2cmhBalBPdDFGQzJyMDRO?=
 =?utf-8?B?NFUyWDZzaXNpQ3ErKzJRMFdndk5UeTUzK2NqTW1LWTMxK3NKcndDREpxU3RX?=
 =?utf-8?B?SXU4T0lYYXlZakJUZzRZMVk0WE1UNTNVcmV1SmIwc3ArR3B4ekRYOE45cW1l?=
 =?utf-8?B?QXlvSmFjQWdhUHYwU3phRWdUa1FaeUtHdlhoU3NIN1YwTWhqL21ZV3hGeFBW?=
 =?utf-8?B?c0JpeEZtNDZsaW80MlJBUXBUY1g3YmNuVFloM20ycHVBalMxWk15SDlGb3g0?=
 =?utf-8?B?R2srVkxWd28yL3BXZkNvbkhvTEs4QllDUG1zcE82NUgxVFZZNGtHMll5bVg0?=
 =?utf-8?B?aWdSd09ta0xrT0cyN1Q1dWpFTlI4V20yN1FNYks1NTVaYnR5WitkTWMrZThy?=
 =?utf-8?B?d0svOFJ1OVJuek1BZ1NoM1BGSFE3aC9mMmsrdllKbE9PWmhNZFBqbkQ0alBY?=
 =?utf-8?Q?QXDP1J0r7N8DARFTNVdW9TWlQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74da9a00-383f-499d-a984-08ddeeb92501
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 09:21:53.1230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZlJIcoiLPSSO1xqqTyei+ZHlHo//MnOb0SPVqnOxXeibWj+MtxlP5GuBGbHTD/t4ZjFZbTrVYstPz4u5mq5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8259
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

--------------NYmNsoLMC0JuYKUmbYI54gkm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are expected with this change and will be fixed with the 
below kernel patch.

https://patchwork.freedesktop.org/series/153926/

Thanks,
Karthik.B.S
On 9/5/2025 9:20 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4 
> restriction for ADL-P+ (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/153924/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/index.html
>
>
>   CI Bug Log - changes from IGT_8524_full -> IGTPW_13696_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_13696_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_13696_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/index.html
>
>
>     Participating hosts (11 -> 12)
>
> Additional (1): shard-dg2-set2
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_13696_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>         +1 other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         +3 other tests fail
>
>
>     New tests
>
> New tests have been introduced between IGT_8524_full and IGTPW_13696_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-b-hdmi-a-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.59] s
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-b-hdmi-a-2:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.59] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_13696_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@blit-reloc-keep-cache:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>  *
>
>     igt@fbdev@nullptr:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@fbdev@nullptr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@fbdev@nullptr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582>)
>         +1 other test skip
>  *
>
>     igt@gem_basic@multigpu-create-close:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_basic@multigpu-create-close.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_busy@semaphore:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@gem_busy@semaphore.html>
>         (i915#3936
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html>
>         (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>  *
>
>     igt@gem_create@create-ext-set-pat:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>  *
>
>     igt@gem_ctx_persistence@hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@gem_ctx_persistence@hang.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-hang:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hang.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-hostile:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hostile.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_ctx_sseu@invalid-args:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_eio@in-flight-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk9/igt@gem_eio@in-flight-suspend.html>
>         (i915#13390
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390>)
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-16/igt@gem_eio@kms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-12/igt@gem_eio@kms.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-tglu-8/igt@gem_eio@kms.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@gem_eio@kms.html>
>         (i915#13363
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363>)
>  *
>
>     igt@gem_exec_balancer@bonded-false-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_balancer@bonded-semaphore:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_exec_balancer@bonded-semaphore.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_balancer@parallel-out-fence:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk6/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_capture@capture-recoverable:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html>
>         (i915#6344
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344>)
>  *
>
>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>  *
>
>     igt@gem_exec_flush@basic-uc-ro-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@gem_exec_flush@basic-uc-ro-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_flush@basic-wb-prw-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@gem_exec_flush@basic-wb-prw-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-active:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +7 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-noreloc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-cpu-active:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@gem_exec_reloc@basic-write-cpu-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>  *
>
>     igt@gem_exec_reloc@basic-write-gtt-noreloc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-12/igt@gem_exec_reloc@basic-write-gtt-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>  *
>
>     igt@gem_exec_schedule@deep@rcs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-2/igt@gem_exec_schedule@deep@rcs0.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>)
>  *
>
>     igt@gem_exec_suspend@basic-s3:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@gem_exec_suspend@basic-s3.html>
>         (i915#13196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196>
>         / i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>  *
>
>     igt@gem_fence_thrash@bo-copy:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_fence_thrash@bo-copy.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>  *
>
>     igt@gem_fenced_exec_thrash@too-many-fences:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@gem_fenced_exec_thrash@too-many-fences.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>  *
>
>     igt@gem_lmem_swapping@parallel-multi:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@gem_lmem_swapping@parallel-multi.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@random:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@gem_lmem_swapping@random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         (i915#5493
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>         +1 other test timeout
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#12193
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193>)
>  *
>
>     igt@gem_lmem_swapping@verify-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs@lmem0.html>
>         (i915#4565
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_media_fill@media-fill:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_media_fill@media-fill.html>
>         (i915#8289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289>)
>  *
>
>     igt@gem_mmap@pf-nonblock:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@gem_mmap@pf-nonblock.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>  *
>
>     igt@gem_mmap_gtt@zero-extend:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@gem_mmap_gtt@zero-extend.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>  *
>
>     igt@gem_mmap_wc@close:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@gem_mmap_wc@close.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +1 other test skip
>  *
>
>     igt@gem_mmap_wc@invalid-flags:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_mmap_wc@invalid-flags.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +3 other tests skip
>  *
>
>     igt@gem_pread@self:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_pread@self.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>       o shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk5/igt@gem_pwrite@basic-exhaustion.html>
>         (i915#14702
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702>
>         / i915#2658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658>)
>  *
>
>     igt@gem_pxp@create-protected-buffer:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@gem_pxp@display-protected-crc:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_pxp@display-protected-crc.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +1 other test skip
>  *
>
>     igt@gem_pxp@regular-baseline-src-copy-readible:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>  *
>
>     igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test timeout
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-linear:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-linear.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +5 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +1 other test skip
>  *
>
>     igt@gem_softpin@evict-snoop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@gem_softpin@evict-snoop.html>
>         (i915#4885
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885>)
>  *
>
>     igt@gem_tiled_pread_pwrite:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_tiled_pread_pwrite.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@create-destroy-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@relocations:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@gem_userptr_blits@relocations.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-cycles:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@bb-start-out:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@gen9_exec_parse@bb-start-out.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@valid-registers:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +2 other tests skip
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>  *
>
>     igt@i915_drm_fdinfo@virtual-busy-hang-all:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-hang-all.html>
>         (i915#14118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118>)
>         +1 other test skip
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-dg2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@i915_module_load@resize-bar.html>
>         (i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>  *
>
>     igt@i915_pm_rc6_residency@rc6-fence:
>
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#13790
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790>
>         / i915#2681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681>)
>         +1 other test warn
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_pm_rps@basic-api.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>  *
>
>     igt@i915_pm_rps@thresholds-idle:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_pm_rps@thresholds-idle.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>)
>  *
>
>     igt@i915_suspend@basic-s2idle-without-i915:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@i915_suspend@basic-s2idle-without-i915.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@i915_suspend@debugfs-reader:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@i915_suspend@debugfs-reader.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>  *
>
>     igt@i915_suspend@fence-restore-tiled2untiled:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         +1 other test incomplete
>  *
>
>     igt@i915_suspend@fence-restore-untiled:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk9/igt@i915_suspend@fence-restore-untiled.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk5/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>  *
>
>     igt@i915_suspend@sysfs-reader:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-4/igt@i915_suspend@sysfs-reader.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-10/igt@i915_suspend@sysfs-reader.html>
>         (i915#8213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213>)
>  *
>
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +1 other test skip
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>  *
>
>     igt@kms_atomic_interruptible@legacy-cursor:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-17/igt@kms_atomic_interruptible@legacy-cursor.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@kms_atomic_interruptible@legacy-cursor.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-1.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +10 other tests dmesg-warn
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>         +1 other test fail
>  *
>
>     igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +39 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-180:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#5138
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +7 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +7 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +132 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +44 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +120 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +44 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +48 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +34 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html>
>         +312 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +4 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html>
>         (i915#12796
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796>
>         / i915#14694
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694>)
>         +1 other test incomplete
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +20 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +4 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +2 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +52 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#10434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html>
>         (i915#13781
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781>)
>         +4 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html>
>         (i915#13783
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783>)
>         +3 other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_chamelium_color@ctm-0-25.html>
>         +9 other tests skip
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@kms_chamelium_color@degamma.html>
>         +6 other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-mode-timings:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_chamelium_edid@hdmi-mode-timings.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +3 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_color@deep-color.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9979
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979>)
>  *
>
>     igt@kms_color@legacy-gamma-reset:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_color@legacy-gamma-reset.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html>
>         (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-3.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>         +1 other test fail
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_content_protection@lic-type-1.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_content_protection@srm.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_content_protection@uevent.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-tglu-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +3 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_crc@cursor-onscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x32:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +2 other tests fail
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>  *
>
>     igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>
>         (i915#11190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9833
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#9833
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_dp_aux_dev.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-2/igt@kms_dp_aux_dev.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@kms_dp_link_training@uhbr-sst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_fbcon_fbt@psr.html>
>         (i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3469
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         +1 other test skip
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_feature_discovery@display-4x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_feature_discovery@dp-mst.html>
>         (i915#9337
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_flip@2x-flip-vs-suspend.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         (i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
>
>       o shard-snb: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html>
>         (i915#14033
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033>)
>         +1 other test timeout
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +7 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html>
>         (i915#6113
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>         +1 other test incomplete
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html>
>         (i915#6113
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>         +1 other test incomplete
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html>
>         (i915#12314
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-tglu-8/igt@kms_flip@plain-flip-fb-recreate.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate.html>
>         (i915#14600
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600>)
>         +1 other test fail
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@kms_flip@wf_vblank-ts-check-interruptible.html>
>         +28 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +6 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +34 other tests dmesg-warn
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         +58 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-stridechange:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         (i915#6880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html>
>         +57 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +10 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_hdr@static-swap.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         +1 other test skip
>  *
>
>     igt@kms_invalid_mode@bad-hsync-start:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_invalid_mode@bad-hsync-start.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8826
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (i915#12339
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#13522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_panel_fitting@legacy.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>         +4 other tests skip
>  *
>
>     igt@kms_plane@pixel-format:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_plane@pixel-format.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane@pixel-format.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825>)
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +5 other tests skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html>
>         +75 other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_pm_backlight@fade-with-dpms.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#14104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_pm_dc@dc6-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-2/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#4281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>)
>  *
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         +2 other tests skip
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_pm_rpm@pc8-residency:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-2/igt@kms_pm_rpm@pc8-residency.html>
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@pm-caching:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_pm_rpm@pm-caching.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +6 other tests skip
>  *
>
>     igt@kms_pm_rpm@pm-tiling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_pm_rpm@pm-tiling.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +4 other tests skip
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +5 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#12316
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html>
>         (i915#9808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>)
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr@fbc-pr-primary-render:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_psr@fbc-pr-primary-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +14 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-page-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +1 other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +13 other tests skip
>  *
>
>     igt@kms_psr@pr-primary-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_psr@pr-primary-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-onoff:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_psr@psr2-cursor-plane-onoff.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +11 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@bad-pixel-format.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@exhaust-fences:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@exhaust-fences.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         +1 other test skip
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak.html>
>         (i915#9196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>         +1 other test fail
>  *
>
>     igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html>
>         (i915#1311
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1311>)
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_vrr@flip-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>)
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-8/igt@kms_vrr@negative-basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_vrr@negative-basic.html>
>         (i915#10393
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393>)
>         +1 other test fail
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>         +1 other test skip
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_writeback@writeback-pixel-formats.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>  *
>
>     igt@perf@global-sseu-config:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@perf@global-sseu-config.html>
>         (i915#7387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>  *
>
>     igt@perf_pmu@frequency:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@perf_pmu@frequency.html>
>         (i915#12549
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549>
>         / i915#6806
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806>)
>         +1 other test fail
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-tglu-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@perf_pmu@module-unload.html>
>         (i915#14433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433>)
>       o shard-dg2-9: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@perf_pmu@module-unload.html>
>         (i915#14433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433>)
>  *
>
>     igt@perf_pmu@rc6-suspend:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk3/igt@perf_pmu@rc6-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk3/igt@perf_pmu@rc6-suspend.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@prime_vgem@fence-write-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (i915#12910
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-14/igt@gem_eio@reset-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@gem_eio@reset-stress.html>
>  *
>
>     igt@gem_exec_suspend@basic-s3:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html>
>         +1 other test pass
>  *
>
>     igt@gem_pxp@create-regular-context-2:
>
>       o shard-rkl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@gem_pxp@create-regular-context-2.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html>
>  *
>
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>  *
>
>     igt@i915_module_load@reload-no-display:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-18/igt@i915_module_load@reload-no-display.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@i915_module_load@reload-no-display.html>
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-snb7/igt@i915_module_load@reload-no-display.html>
>         (i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb6/igt@i915_module_load@reload-no-display.html>
>       o shard-dg2-9: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-9/igt@i915_module_load@reload-no-display.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_module_load@reload-no-display.html>
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-snb7/igt@i915_pm_rps@reset.html>
>         (i915#13729
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729>
>         / i915#13821
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb7/igt@i915_pm_rps@reset.html>
>  *
>
>     igt@i915_power@sanity:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-1/igt@i915_power@sanity.html>
>         (i915#7984
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-5/igt@i915_power@sanity.html>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>  *
>
>     igt@kms_busy@basic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_busy@basic.html>
>         (i915#11190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_busy@basic.html>
>         +3 other tests pass
>  *
>
>     igt@kms_color@degamma:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_color@degamma.html>
>         (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_color@degamma.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html>
>         +3 other tests pass
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-128x128:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html>
>         +40 other tests pass
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-256x85:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
>       o shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         +3 other tests pass
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-15/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html>
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>  *
>
>     igt@kms_flip@basic-flip-vs-wf_vblank:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         +6 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-dpms-on-nop:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#14553
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14553>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop.html>
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip_tiling@flip-change-tiling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_flip_tiling@flip-change-tiling.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html>
>         +6 other tests pass
>  *
>
>     igt@kms_invalid_mode@zero-hdisplay:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8826
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_invalid_mode@zero-hdisplay.html>
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane@plane-position-covered.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_plane@plane-position-covered.html>
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html>
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html>
>         +2 other tests pass
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html>
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html>
>         +3 other tests pass
>  *
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (i915#13441
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_pm_dc@dc5-dpms-negative.html>
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html>
>  *
>
>     igt@kms_pm_rpm@pm-caching:
>
>       o shard-rkl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_rpm@pm-caching.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_rpm@pm-caching.html>
>         +42 other tests pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html>
>         (i915#9196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@prime_vgem@basic-fence-flip.html>
>
>
>         Warnings
>
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>  *
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_exec_balancer@parallel-out-fence:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_reloc@basic-write-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_exec_reloc@basic-write-cpu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gem_exec_reloc@basic-write-cpu.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +7 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read-active:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +4 other tests skip
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#7276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-uncached:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +5 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +5 other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@dmabuf-unsync:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@gen9_exec_parse@allowed-single.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@bb-oversize:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +2 other tests skip
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@i915_query@hwconfig_table.html>
>         (i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@i915_query@hwconfig_table.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +2 other tests dmesg-warn
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +5 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +4 other tests skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +4 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +15 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         +14 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +6 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +15 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +3 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +4 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cdclk@mode-transition.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html>
>  *
>
>     igt@kms_chamelium_frames@dp-frame-dump:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_chamelium_frames@dp-frame-dump.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-frame-dump:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +6 other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-11/igt@kms_content_protection@atomic.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_content_protection@atomic.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_content_protection@lic-type-0.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_content_protection@lic-type-0.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-rkl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_dp_aux_dev.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_dp_aux_dev.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_feature_discovery@chamelium.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_feature_discovery@display-2x.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         +1 other test skip
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_feature_discovery@psr1.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_feature_discovery@psr1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip@2x-flip-vs-modeset.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +9 other tests skip
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (i915#12314
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314>
>         / i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +5 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>
>       o shard-rkl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test dmesg-warn
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +28 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +14 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#1187
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187>
>         / i915#12713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#12713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#12713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_joiner@basic-ultra-joiner.html>
>         (i915#12339
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html>
>         (i915#12339
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_panel_fitting@legacy.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_panel_fitting@legacy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_plane_alpha_blend@constant-alpha-mid:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7294
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_plane_alpha_blend@constant-alpha-mid.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-13/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +2 other tests skip
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#3361
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#9295
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>)
>  *
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test dmesg-warn
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-15/igt@kms_psr@fbc-psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_psr@fbc-psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +15 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-plane-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +14 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_vrr@flip-basic.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_vrr@flip-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>         +1 other test skip
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_writeback@writeback-check-output.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>         +1 other test skip
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_writeback@writeback-pixel-formats.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>  *
>
>     igt@perf@gen8-unprivileged-single-ctx-counters:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>  *
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>  *
>
>     igt@prime_vgem@basic-read:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@prime_vgem@basic-read.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@prime_vgem@basic-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@sriov_basic@bind-unbind-vf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@sriov_basic@bind-unbind-vf.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8524 -> IGTPW_13696
>
> CI-20190529: 20190529
> CI_DRM_17127: 76dbb37ec196e36c129b63b102b4884c90506bd7 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_13696: ee6a5e1f9d1acbda04c4400122865971cd5a0bed @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8524: 8524
>
--------------NYmNsoLMC0JuYKUmbYI54gkm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are expected with this change and will be fixed
      with the below kernel patch.</p>
    <p><a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/153926/">https://patchwork.freedesktop.org/series/153926/</a></p>
    Thanks,<br>
    Karthik.B.S
    <div class="moz-cite-prefix">On 9/5/2025 9:20 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:175708743153.307560.6266685726592172655@1538d3639d33">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/kms_frontbuffer_tracking: Remove FBC modulo
              4 restriction for ADL-P+ (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/153924/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/153924/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8524_full -&gt; IGTPW_13696_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_13696_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_13696_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/index.html</a></p>
      <h2>Participating hosts (11 -&gt; 12)</h2>
      <p>Additional (1): shard-dg2-set2 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_13696_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html" moz-do-not-send="true">FAIL</a> +3 other tests fail</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between IGT_8524_full and
        IGTPW_13696_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.59] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.59] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_13696_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@api_intel_bb@blit-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send="true">i915#11078</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@nullptr:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@fbdev@nullptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@fbdev@nullptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582" moz-do-not-send="true">i915#2582</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_basic@multigpu-create-close:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_basic@multigpu-create-close.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_busy@semaphore:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@gem_busy@semaphore.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936" moz-do-not-send="true">i915#3936</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335" moz-do-not-send="true">i915#6335</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-set-pat:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_create@create-ext-set-pat.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562" moz-do-not-send="true">i915#8562</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@gem_create@create-ext-set-pat.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562" moz-do-not-send="true">i915#8562</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_create@create-ext-set-pat.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562" moz-do-not-send="true">i915#8562</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@gem_ctx_persistence@hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-hang:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hostile.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-args:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_ctx_sseu@invalid-args.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk9/igt@gem_eio@in-flight-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390" moz-do-not-send="true">i915#13390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-16/igt@gem_eio@kms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-12/igt@gem_eio@kms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784" moz-do-not-send="true">i915#5784</a>)</li>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-tglu-8/igt@gem_eio@kms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@gem_eio@kms.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363" moz-do-not-send="true">i915#13363</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-false-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-semaphore:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_exec_balancer@bonded-semaphore.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-out-fence:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible@smem0:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk6/igt@gem_exec_capture@capture-invisible@smem0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334" moz-do-not-send="true">i915#6334</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-recoverable:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344" moz-do-not-send="true">i915#6344</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-ro-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@gem_exec_flush@basic-uc-ro-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-prw-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@gem_exec_flush@basic-wb-prw-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-read-active.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@gem_exec_reloc@basic-write-cpu-active.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-12/igt@gem_exec_reloc@basic-write-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@deep@rcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-2/igt@gem_exec_schedule@deep@rcs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s3:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@gem_exec_suspend@basic-s3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196" moz-do-not-send="true">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-copy:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_fence_thrash@bo-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@gem_fenced_exec_thrash@too-many-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-multi:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@gem_lmem_swapping@parallel-multi.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@random:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@gem_lmem_swapping@random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493" moz-do-not-send="true">i915#5493</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193" moz-do-not-send="true">i915#12193</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs@lmem0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565" moz-do-not-send="true">i915#4565</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_fill@media-fill:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_media_fill@media-fill.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289" moz-do-not-send="true">i915#8289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@pf-nonblock:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@gem_mmap@pf-nonblock.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@zero-extend:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@gem_mmap_gtt@zero-extend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@close:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@gem_mmap_wc@close.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@invalid-flags:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_mmap_wc@invalid-flags.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@self:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_pread@self.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-exhaustion:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk5/igt@gem_pwrite@basic-exhaustion.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702" moz-do-not-send="true">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658" moz-do-not-send="true">i915#2658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-protected-buffer:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@display-protected-crc:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_pxp@display-protected-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-linear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@gem_softpin@evict-snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885" moz-do-not-send="true">i915#4885</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_pwrite:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_tiled_pread_pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@create-destroy-unsync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@relocations:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-out:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@gen9_exec_parse@bb-start-out.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@shadow-peek:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@gen9_exec_parse@shadow-peek.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@valid-registers:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +2 other tests
              skip</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@gen9_exec_parse@valid-registers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-hang-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118" moz-do-not-send="true">i915#14118</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@resize-bar:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@i915_module_load@resize-bar.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545" moz-do-not-send="true">i915#14545</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-fence:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790" moz-do-not-send="true">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681" moz-do-not-send="true">i915#2681</a>) +1 other test warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621" moz-do-not-send="true">i915#6621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_pm_rps@thresholds-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s2idle-without-i915:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@i915_suspend@basic-s2idle-without-i915.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@debugfs-reader:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@i915_suspend@debugfs-reader.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@fence-restore-untiled:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk9/igt@i915_suspend@fence-restore-untiled.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk5/igt@i915_suspend@fence-restore-untiled.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@sysfs-reader:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-4/igt@i915_suspend@sysfs-reader.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-10/igt@i915_suspend@sysfs-reader.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213" moz-do-not-send="true">i915#8213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531" moz-do-not-send="true">i915#9531</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531" moz-do-not-send="true">i915#9531</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_interruptible@legacy-cursor:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-17/igt@kms_atomic_interruptible@legacy-cursor.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@kms_atomic_interruptible@legacy-cursor.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +10 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956" moz-do-not-send="true">i915#5956</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +39 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138" moz-do-not-send="true">i915#5138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +132 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +44 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +120 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +44 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +48 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> +312 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805" moz-do-not-send="true">i915#12805</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796" moz-do-not-send="true">i915#12796</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694" moz-do-not-send="true">i915#14694</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +52 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434" moz-do-not-send="true">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781" moz-do-not-send="true">i915#13781</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783" moz-do-not-send="true">i915#13783</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +5 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_chamelium_color@ctm-0-25.html" moz-do-not-send="true">SKIP</a> +9 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@kms_chamelium_color@degamma.html" moz-do-not-send="true">SKIP</a> +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_chamelium_edid@hdmi-mode-timings.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_color@deep-color.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979" moz-do-not-send="true">i915#9979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@legacy-gamma-reset:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_color@legacy-gamma-reset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655" moz-do-not-send="true">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_crc@cursor-onscreen-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190" moz-do-not-send="true">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833" moz-do-not-send="true">i915#9833</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833" moz-do-not-send="true">i915#9833</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_display_modes@extended-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691" moz-do-not-send="true">i915#13691</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257" moz-do-not-send="true">i915#1257</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-2/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257" moz-do-not-send="true">i915#1257</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749" moz-do-not-send="true">i915#13749</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-sst:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955" moz-do-not-send="true">i915#3955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469" moz-do-not-send="true">i915#3469</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337" moz-do-not-send="true">i915#9337</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033" moz-do-not-send="true">i915#14033</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip@2x-flip-vs-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_flip@2x-wf_vblank-ts-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113" moz-do-not-send="true">i915#6113</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113" moz-do-not-send="true">i915#6113</a>) +1 other test
              incomplete</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314" moz-do-not-send="true">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-tglu-8/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600" moz-do-not-send="true">i915#14600</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@kms_flip@wf_vblank-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> +28 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +34 other tests
              dmesg-warn</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> +58 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-stridechange.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880" moz-do-not-send="true">i915#6880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send="true">i915#5439</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766" moz-do-not-send="true">i915#9766</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766" moz-do-not-send="true">i915#9766</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> +57 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-10/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-hsync-start:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_invalid_mode@bad-hsync-start.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826" moz-do-not-send="true">i915#8826</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339" moz-do-not-send="true">i915#12339</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522" moz-do-not-send="true">i915#13522</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html" moz-do-not-send="true">SKIP</a> +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_plane@pixel-format.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane@pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825" moz-do-not-send="true">i915#8825</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_plane_multiple@2x-tiling-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>)</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html" moz-do-not-send="true">SKIP</a> +75 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812" moz-do-not-send="true">i915#9812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-6/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812" moz-do-not-send="true">i915#9812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104" moz-do-not-send="true">i915#14104</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-2/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281" moz-do-not-send="true">i915#4281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@pc8-residency:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-2/igt@kms_pm_rpm@pc8-residency.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@pm-caching:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_pm_rpm@pm-caching.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@pm-tiling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-7/igt@kms_pm_rpm@pm-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +2 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316" moz-do-not-send="true">i915#12316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808" moz-do-not-send="true">i915#9808</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +3 other tests
              skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +5 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-render:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_psr@fbc-pr-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-render:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-primary-blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_psr@pr-primary-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_psr@psr2-cursor-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@exhaust-fences:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@exhaust-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235" moz-do-not-send="true">i915#4235</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>) +1 other test skip</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_setmode@invalid-clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196" moz-do-not-send="true">i915#9196</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1311" moz-do-not-send="true">i915#1311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_vrr@flip-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920" moz-do-not-send="true">i915#11920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-8/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-7/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393" moz-do-not-send="true">i915#10393</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@global-sseu-config:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@perf@global-sseu-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387" moz-do-not-send="true">i915#7387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@frequency:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-1/igt@perf_pmu@frequency.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549" moz-do-not-send="true">i915#12549</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806" moz-do-not-send="true">i915#6806</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@module-unload:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-1/igt@perf_pmu@module-unload.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433" moz-do-not-send="true">i915#14433</a>)</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@perf_pmu@module-unload.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433" moz-do-not-send="true">i915#14433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-suspend:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk3/igt@perf_pmu@rc6-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk3/igt@perf_pmu@rc6-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-19/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910" moz-do-not-send="true">i915#12910</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-14/igt@gem_eio@reset-stress.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784" moz-do-not-send="true">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@gem_eio@reset-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s3:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-regular-context-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@gem_pxp@create-regular-context-2.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-18/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029" moz-do-not-send="true">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545" moz-do-not-send="true">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-18/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-snb7/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545" moz-do-not-send="true">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb6/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-dg2-9: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-9/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029" moz-do-not-send="true">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545" moz-do-not-send="true">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-9/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-snb7/igt@i915_pm_rps@reset.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729" moz-do-not-send="true">i915#13729</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821" moz-do-not-send="true">i915#13821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-snb7/igt@i915_pm_rps@reset.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_power@sanity:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-1/igt@i915_power@sanity.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984" moz-do-not-send="true">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-5/igt@i915_power@sanity.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956" moz-do-not-send="true">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_busy@basic:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_busy@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190" moz-do-not-send="true">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_busy@basic.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@degamma:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_color@degamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655" moz-do-not-send="true">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_color@degamma.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html" moz-do-not-send="true">PASS</a> +40 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-15/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-16/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip@basic-flip-vs-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14553" moz-do-not-send="true">i915#14553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip_tiling@flip-change-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_flip_tiling@flip-change-tiling.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@zero-hdisplay:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826" moz-do-not-send="true">i915#8826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_invalid_mode@zero-hdisplay.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane@plane-position-covered.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825" moz-do-not-send="true">i915#8825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_plane@plane-position-covered.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms-negative:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441" moz-do-not-send="true">i915#13441</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@pm-caching:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_rpm@pm-caching.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_rpm@pm-caching.html" moz-do-not-send="true">PASS</a> +42 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196" moz-do-not-send="true">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-flip:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@prime_vgem@basic-fence-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send="true">i915#11078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send="true">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335" moz-do-not-send="true">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335" moz-do-not-send="true">i915#6335</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-sseu:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-out-fence:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-cpu:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_exec_reloc@basic-write-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gem_exec_reloc@basic-write-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-active:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-active.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@semaphore-power:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276" moz-do-not-send="true">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276" moz-do-not-send="true">i915#7276</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-unsync:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@gen9_exec_parse@allowed-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-oversize:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245" moz-do-not-send="true">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245" moz-do-not-send="true">i915#6245</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> +14 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-frame-dump:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_chamelium_frames@dp-frame-dump.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-11/igt@kms_content_protection@atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257" moz-do-not-send="true">i915#1257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257" moz-do-not-send="true">i915#1257</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955" moz-do-not-send="true">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955" moz-do-not-send="true">i915#3955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip@2x-flip-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_flip@2x-wf_vblank-ts-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314" moz-do-not-send="true">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +28 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send="true">i915#5439</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187" moz-do-not-send="true">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>)</li>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339" moz-do-not-send="true">i915#12339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339" moz-do-not-send="true">i915#12339</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294" moz-do-not-send="true">i915#7294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_plane_alpha_blend@constant-alpha-mid.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-13/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361" moz-do-not-send="true">i915#3361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295" moz-do-not-send="true">i915#9295</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@screens-disabled:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430" moz-do-not-send="true">i915#8430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430" moz-do-not-send="true">i915#8430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-dg1-15/igt@kms_psr@fbc-psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-dg1-14/igt@kms_psr@fbc-psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-render:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-move:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-5/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-5/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436" moz-do-not-send="true">i915#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436" moz-do-not-send="true">i915#2436</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send="true">i915#2433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send="true">i915#2433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-read:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@prime_vgem@basic-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-7/igt@prime_vgem@basic-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@bind-unbind-vf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8524/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13696/shard-rkl-4/igt@sriov_basic@bind-unbind-vf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8524 -&gt; IGTPW_13696</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_17127: 76dbb37ec196e36c129b63b102b4884c90506bd7 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_13696: ee6a5e1f9d1acbda04c4400122865971cd5a0bed @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8524: 8524</p>
    </blockquote>
  </body>
</html>

--------------NYmNsoLMC0JuYKUmbYI54gkm--
