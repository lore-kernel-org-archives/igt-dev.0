Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F45C5AC67
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 03:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E1C10E03B;
	Thu, 13 Aug 2026 03:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KddlgsGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4430510E03B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 03:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786592264; x=1818128264;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Tm2CJCmmqU0NAf+NrFCWnOCqi/25yOPTIAUNevSRoA=;
 b=KddlgsGrXm1oi27iNI/W58X+ske+MxY4IQxyHGYoWYaW9Jq7jK5RSkoj
 4KT9HjdVszLZYKMi/bFdUA7KWbV6ky6/nSz1R+4SVf7wEjlj9MOaooTZa
 lKLoHv/zhCdyopEnSvwwxdr2SjWLCmcx7Xcl0U1VzYLcC/x0AMTS74C+d
 2zQDbYJm7ixa/gpbYQUpHU/q4u07EKkpZLU/rpxsC9ecJZ1IhBsIuaDdx
 goWorG3bgYEPs2gqX52UPa9m/BuqxUDc4KX+t+x+uuwG1/CkznxcnANGP
 UDkULfmVD8pAOTHda2wsBe7ZZXoIEszFVKRnm8tD3p5M5S5fkDG+CXvHE A==;
X-CSE-ConnectionGUID: VDVmRIxiS6izO03Ydcs7fg==
X-CSE-MsgGUID: ZvCowb1gR6i39breYGxvDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109947402"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="109947402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 20:37:43 -0700
X-CSE-ConnectionGUID: 9HEB0ODPQZCvKrdiRjGAmA==
X-CSE-MsgGUID: Lbmk7DwCSUmSzZoVu1QSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="261203192"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 20:37:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 20:37:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 20:37:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 20:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbZvipBBo80v6sbGEOqoykemqVefw/TMxDHS4cw3jKkOZYUf5EChSyZ6XNnPpx7zkRIYV987nzVD0Sb8C4X/8CZYcQbMbxF2MMkxm2Zj2ZpPSG+9F3PINbOMNi+seRB7Vc0rGfDZR4EXqXdUXuIitpCwApJ9SvAIiqLLt2IHZwFDFUGw4k5Eyfy8e6FcT+vT1fwFeb7NoY/PCqff2LdfVVF2m2uho8fzOWA8MRO7ZrWWl2CwmnNRdJm+lvr3Oa5eO0TaXQ4t1RizJ6Qd7rveKM8aQgwUQeMdQm3OkI5O3DC91Hx1ZIzWa1NG1fwfE7Je4TzcrSCvQJlUknzTYWDo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ow0IppGUpSVN6CHCJ0nJLdE29H0g1xXlsheAxbBYNZA=;
 b=mfIYPa7DuZAuJwMo967T/iYffiXUALwsKZ8URFr+P/skNimyWmmIzb4Z2Ay/58JS7P7ztg/GNY7w8HgKjfA+3f4hmRHTHbG40uFtgEYxqdxUdth8Wb6qtwesltJIVX37zcULc7nhG3gSHMb4SmAj+H4/tQSQ7mfhMxSI3M3AdLHpKSLZBDwkJiiEKXN6M75X+T9CBAN835XAP9jQNBMZsdKvj6HhbMkdF6LQAzK4vyuG24bbABxy0PTJG3MFHh2G41uraks70ueWEgWnZVzsTT6ndenfZIFNDjmEGHA6DzsCrysWJg55rhk9771htg8HFZAO1kWDlznfK4CPESxSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 03:37:34 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 03:37:34 +0000
Message-ID: <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
Date: Thu, 13 Aug 2026 09:07:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>, "Juha-Pekka
 Heikkila" <juhapekka.heikkila@gmail.com>
CC: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>, Manasi Navare
 <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0308.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 179728a8-ae27-4628-69c7-08def8ec35eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|7416014|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: UFMGGYubV+l0lpO6Dcnh1KbCccQAUDIgqPsuy0M+m1ZMGIT/8/XZrps2kwq+cEuRB612dDTlA7oA2mbsUnJA/T76soe8D5ZCpZuGaev4rw5TfOvj+Gc9TiK2j9g18hNjMgza2FJ9yf8glnLHxGDaYbF24g0hMFqsS+zeaMOcn80tw8Nskrop+HcorT6jGKFkjUyJwUQC5URru70xJ1i0XjegWPdkDN+WRknmznmQnrQ7nFlo+OUW/wW3QBYrPJBUCK6oobRFVWDXXkf1lktHilfpYa3HlnAWGsKeJ2cPc8dqbtMe9ZGblR/boNoNQ4yC4P4RV+xmKHe6sjJFn9UC3RPoG4iMv1XwA3QnS4z2lI8F1MZ0KM3GVZv0JQ1t32ld6zCCPeCjhfRPM3ElBchY+PE4sVnTp4LCoDGVkDnkFWHhk8rA3bnHKqVYaWDRq4L6coIX67j7AJ4wu6BWxR92uWm7ykwPVOA81ob8VcMqLA3LAVzUWHprH26I/kfAOuwbIa7lFtvjQOQODYoQUyXaUZVbkgklkvZcXfyL4gADyxo2FvxdhOqi+UKSU3pzLU5gNnhW4dEUnn1A0Uth/jexSDkugazRZ+kI0JrSV7HdD4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTBBZDMrQk9qSTAzbjFxZlh6cVprZ0pHTVVIN2dhZktoSkJQS0pCVmhqRjl4?=
 =?utf-8?B?SHpBMU9uSSs0NEhSWjI0UDMvcGlPSjJoWWw5WHdESUlQZWJCdE9PVGt3MVJX?=
 =?utf-8?B?cTdEU1BYUDNTLzZPRGhWNmltcUI5dmVzZ3NJZktKaGt4VE5FOGtxYjloZ2Fz?=
 =?utf-8?B?MjRVblEva3RrV0VxUUdlb0h5TGhWSGozaEl2eVdUL1RINEdnVEpycWxnRk91?=
 =?utf-8?B?ZkEwT0VoWlR5Q0xKY2IwV3ZWL1Zhd3dEeFNyYStNYmkyaXo0WGZxUVFueDBp?=
 =?utf-8?B?TmY2WHhaWVFUQ1FucURGTHdnUi9UUWQrc1RNMVQ0THNtVlhwSVNuSzJRRHJz?=
 =?utf-8?B?WTBJeTJyTmg3cmxYeDdLQ1k1VWdJQ2JWWDFJd0JnQklSeVVJT1Nza1dCeUVL?=
 =?utf-8?B?L2lTV2VyendOWjVkSmV5RlNSOFcwenZrQkNIL3hHM3g4UzdHcnpUd0ZodUlQ?=
 =?utf-8?B?MGI1TnhSQmxVYlFUR2VmTzhOMXZDejJXdTl5ekw2KzRQYVFMTUhDRVFjL096?=
 =?utf-8?B?UGwxU2x5cm9zaHVyS0lkVkxDbkMvSTFFMWpkVlZGVEFUa2V4L2o3Y29oS0tC?=
 =?utf-8?B?UVk0RWozS1pwQmdCNGhmMlZ4R3c5Wm90VHlTU0NCaEl1Y0hQOFc5RmVQZDlz?=
 =?utf-8?B?TW10ek9jWm44Z2RuWlB2UEsvZk5PdnUvU2hDYU9jTCthaFdxaVVzSnBTUUpx?=
 =?utf-8?B?Nnh2YUtPS1NCR2cycjlYQndZYUg0VU8vUVNOUE96akpuYm5iaGlBTVVhSVNl?=
 =?utf-8?B?Z2QwT2dhRldXbWxHVDVrTERHZ3d2TG45TWp6MDNadzhGOWJteUZOK3pFaTNx?=
 =?utf-8?B?Qm9rRnJIUXR3bk0xVzF4ZEtkdjJIalFPVUxEZDNCRDFVTHFiMTBnM1M3WWpI?=
 =?utf-8?B?aWFrekhlLzlxa3BaYU5xaHFoamhoaXhkSXQrS3hqNi9kUU5odnZZTlhDRVFw?=
 =?utf-8?B?T0tjUTBmVXlKY2h1MFpiWmZzdlhBRk5NWXhQMkNGYktVdTFrN3hZL1BnOUdo?=
 =?utf-8?B?QTY0djJyem5KYXcrNFk5TXl2Rnh6UDFCN055dWhUalZ5Uno0bzltV0J6aVJN?=
 =?utf-8?B?WXRKQlA4SllMTnBqS0xNTEEvT0RsNy9hWE1ZbHNTSUNERTZ4UnNySlZwM2Zn?=
 =?utf-8?B?eGE5STJGU1hIaDZESE54cndVL3M5eDV0dnVwUHlhY1JFZ3VRM2JlZS9NZHpS?=
 =?utf-8?B?elI2ci9tdjRablNTai9rNThSb3oyUjVhSW4zU3RZT2kwYnhhd1JPY0duTnRy?=
 =?utf-8?B?OUJTMzJQdGs2eFVOazNKZDVFd0xrOHVPSlFsdUdRcVF6bnM0OWF4K0NQMHR3?=
 =?utf-8?B?bFpNelVwUk8wczZ1bUVjeTBiYWlGNGMzd3VyL0REam80TG56ZXZmM1NpOEpT?=
 =?utf-8?B?LzhWMysreW1MWDV4Mk14YXpselJUZ0huaEY1NGtWcXlpSUpSV0wyVGJFWkFW?=
 =?utf-8?B?U1lUZGZoeVB0SlAyTEg0cEpYODF5T1dIMFFLWW1PTllpODhucWtMT0dBVHdq?=
 =?utf-8?B?MEJJc0NEajRmOCt1MFU0eGs2ekY2dVhEZXlYa2Z6VEI1b2NSY2psU3FkQnh3?=
 =?utf-8?B?aEwxUVpudW5Ud2c0N0grQ2h5Nmxic2RnbFVpOXJCUUwwUXVJT1lHdVUxVkpp?=
 =?utf-8?B?S3I1Q2FEZkcyUWtXZ045dzlPcGZxTkRROXZRb0hkTXZzRld3MjZGRVNSTTRL?=
 =?utf-8?B?OWRqN2dVV0JFaDk4RmJQdVYyZWZMWEhaSy9VRWI5YzN6ZmFBcjBnbkhNQWlJ?=
 =?utf-8?B?bU9IbUs2SXJldkx2TnpNcXFzNlRQenZuU25rMndCU3VPcHdFM3VKTERpdlk1?=
 =?utf-8?B?d2o1RmdXcWNKbEZwMElxTDR4NE9wV1hxYjcxTjFvN0lHMnlYbUgzTCtPK3NM?=
 =?utf-8?B?d2VkaEFhWE51dzBEOVJ5cGtrbS9ESWFWZzhvU0ZGcW10NnlSKytwL0lYNGUz?=
 =?utf-8?B?NVRhNXVOU3g0UUFUcE1KcTl2TnNJQm8xMStOcm9OZzBkR2xOYjBlUnRndzk1?=
 =?utf-8?B?S3F5a2xNcXUwQzdYSTBHVXo1ckFIemk4SXA4ZnRFVUxDaEN3aGhiK254REFa?=
 =?utf-8?B?Tlloc3BFaTlIMGhsN1VVTzhwZVVUbUFOOEgrbzRMclN0Zzh4TmROMEJpWllR?=
 =?utf-8?B?R3JqMmZ3YWcvMkpzQW1xZnA1a1lsZnBJZWMrZUpMbitJNDJtS1NKaEI1MCth?=
 =?utf-8?B?VVdLclBkSXJwQVg4U21jRFZvM3RTOU91Y25xTS9DdHRONU4vcWthbG1lb0xL?=
 =?utf-8?B?c2FVNEt0cmM5dThFZVdUNDh5OGxKTVNzVHZRNFFLZCtnUnlzMFQ3ZUltcmxT?=
 =?utf-8?B?enlQMjdBWk14MlovY3N4MHk5bGpmYUpTdTNxY3J3TFJEd09KaUZqQT09?=
X-Exchange-RoutingPolicyChecked: afQ/uOLZZ87jzNCrYFfwhQCJQ5SJO1mKOiCr0YcVOfspkiu4l97s+6+6rAq+U8oKfN9h6nnon8zJW5riWZtZNwnxBQtV2X7o4g7eMV5TX0cQevgJyNr+c2cIu0pc5VPeKbjBbGFBsan1RLW+BsHHgnC26f06XAVAoLDa3h4PbZk4JZ+pKQOOZLV7xxCH6UWUeYcvn72uxuE5fbSOodKKPa07qS6Y0zWYnvYtzsZ8YWi7LVwjtoIcloOz1nI+UwIohqez4mFd/IxyTqC0t7FY9MJffJR38ipgM3PG5v4G6BPjgAUrAUmFR7OD8AFwinky/Spy9qC+bs1CoyMhOwnPlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 179728a8-ae27-4628-69c7-08def8ec35eb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 03:37:33.9471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9ogmh6HhtjjNrKYeG+xM3XMbtdD0WYLlX9fZDyONi5j2f3HZwv5wkO+RxuooIIUJ+IB+jlbCh4zCMP3QyWN0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7744
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

Hi Jason-JH,

On 8/11/2026 9:44 PM, Jason-JH Lin wrote:
> The capture_crc() function validated that the CRC frame sequence
> returned by igt_pipe_crc_get_for_frame() matches the expected value.
> However, igt_pipe_crc_get_for_frame() already guarantees
> crc->frame >= expected via its internal loop:
>
>      do {
>          read_one_crc(pipe_crc, crc);
>      } while (igt_vblank_before(crc->frame, vblank));
This isn't fully true IMHO. The capture CRC function actually ensured 
the exact match of frame sequence and with this patch we're just 
guaranteeing '>='.
So we need more context here from: 
https://patchwork.freedesktop.org/series/168037/
>
> The additional check in capture_crc() is therefore redundant.
> Remove it and rely on the library's existing guarantee.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_plane.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 12dfbfe1d82b..fe8ee2ab26ab 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -765,11 +765,6 @@ static int num_unique_crcs(const igt_crc_t crc[], int num_crc)
>   static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
>   {
>   	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);

Also if this is only igt_pipe_crc_get_for_frame now, ideally we can just 
remove this function itself and call the helper directly. But before 
doing that, as the existing assert was added by a patch from Ville and 
rb'ed by JP, I'll request an ack from them or if they have any inputs on 
this.

Regards,
Karthik.B.S
> -
> -	igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
> -		      crc->has_valid_frame && crc->frame != vblank,
> -		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",
> -		      crc->frame, vblank);
>   }
>   
>   static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc,
