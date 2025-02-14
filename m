Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5067EC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AC710E273;
	Fri, 14 Feb 2025 10:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1ozrv6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F24310E273
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739527328; x=1771063328;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4Rxm3BkSeHCltIImHpQUUKYEZcNvsFBrXBbHtjbvKNA=;
 b=i1ozrv6vGjARQh5Y8ZDxH5Lwf1ATpMIr+11FySxeajZxoYYvtT7RcOO6
 4nBJPRmRfNmas9C3qnA4KkhsJpwy38cJtRxs7GO8/jOuKKpD63yZElsQL
 QtbWgDBqbBwK92fq6o2m/DYjb0OilzvT+VeBuhz5MlG5m/0+OeSxFEn87
 ksjGjc99Rqsd0XTW4xqstXtE3jrUNppgJ2IAfBbU/1WQmvQoos7mXDjIP
 lKQWNmBG1orfvlZnSrLVBtU4+rpuMknjFEIX5+W9XmdqF3P34cuDsIdKb
 0m0xIP9ZdltL8dwltWmJ5lyoC3CuQ8A8OE7IXQr3VcgipI2l2d8cCURf0 A==;
X-CSE-ConnectionGUID: A4gl0u9fTfaZ4h3zNPwdlQ==
X-CSE-MsgGUID: iNdfb7SxSJqMdGpE2Xs8pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50485924"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="50485924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:02:08 -0800
X-CSE-ConnectionGUID: p5eg+iXeQPOQlEpciaIe1A==
X-CSE-MsgGUID: 9SajjmTEQOGsEG2KIiHgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113608184"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 02:02:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 02:02:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:02:06 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:02:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lky3MSzjOlfIE8ZH2tTf4y3rSjnxBi+hv8WsGneX2qz7XshPzWqgGzrozXok50Cqjhqd4WqoWIdISUwXf6JkNIIuO86MraX86mDzVqkVPeDqmkX3JGcNCd3bCv/7klOwBAis4UNpxzs1Eo5NEV0BUhcOt4oLJXx38/TfwuB852587RCM0+N68SO8RyaVUyvUmDg++Td9JfkOuL+T5WmvBW50ivw4JjRyPg+Qdq7+CYQkykQKBVyKLyL7pNNJvbKAGW3HYODl/g4uE30uPPYk9Da2+1yLWsxZc/ZI+eXC47zG6aLRlfsjTgbjuf8YBytFCmsrQ33xxJHB5yLUcz0A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGucQ10bGU4R1fF88PASaGph+23Ive1VD5axszaLD5I=;
 b=A8ZfHE+0cBX3YdHwzf0i+xQLhjLUidyVrPR1bxdLfK8/2iCg7/uaFDfHW9fpbf72/AvVr1cHmLhhD/k9DXV0puQTXBhYfjNwnrTUzUuKltBlZMdIv7HRCrn3X4cFUNxsQWRKOoDXuaaXsuh1wk/bU07mgrnqD4GHmnz+C/gq8lLQPwNGMKaR9G9Mr/LViekfp5sFaDuP5whuqH8bLZRYPJWNneNKyXqlwIt0kMGPzCX8wiCFVdPLk+Y2bY+GAn9cRhCOUvEFStwQdVBQAoP5MJfty5cd500n1xD4OIs5jF3sthB10jLQzgDTxIoX1AhCNI8/W2EmAVNcKlYtL5Wgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8771.namprd11.prod.outlook.com (2603:10b6:408:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 10:02:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%5]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 10:02:03 +0000
Message-ID: <e20f93b4-2bc1-438b-ab18-21ea025daf75@intel.com>
Date: Fri, 14 Feb 2025 15:31:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 1/3] lib/igt_core: Add tolerance and
 measured_usleep utils
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250205182214.1650169-1-vinay.belgaumkar@intel.com>
 <20250205182214.1650169-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250205182214.1650169-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb6ed26-9d76-4682-aa18-08dd4cdea12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3hrRXBqWVp2bFlnMVRqN3VCbUFueTQwdk82R2YydmNZb09CMjNMNjMzSHFC?=
 =?utf-8?B?OXdhV2NHMWRNSnF5ZzN4TERSaFFSK2F1MWljRzl2N2Q1S2xhTzNTSUwzSlBw?=
 =?utf-8?B?WVJ6dlp5MzRHUkFuRCtkaEJwTG9mMDFJSVNkZFNuYlMwY2FsUzMyRnNOS01G?=
 =?utf-8?B?OVZOTmh2Vjd1L3ZrbE95TCs4YVAzN2RDUzRtL2d2ZVdyV2V2b2FiZTF0RDBZ?=
 =?utf-8?B?VEpRNXh2V25IOGdBWGozZlVsR2NmUnFRcnVOS3V2Vy9URmdWT2tEQTNLekJy?=
 =?utf-8?B?Zlg4Zi8vWG13eW1yRUY2S2wrUlNDS2VQeGlRTVRNRFVKdzh6MXZGNjM5RGMv?=
 =?utf-8?B?YXYyNzdOSjg0ZGpQQWJHZFRrN3MvQXFOQjE3TVJPM3QwVkI3a0FQT3ZqV3o3?=
 =?utf-8?B?d0E5SXlwbUkvckZnOWFpMWhmQThvNVR1S3VFMnJ4c3I5QTJ4U2htTGJpeUZl?=
 =?utf-8?B?TGY4aE1SZFpBWCt0WTZYMGtybzVVYzJJSzB4eUt3YjNHbzdISXFKek5UcmNx?=
 =?utf-8?B?MzRUZ3YxQmhZUVNMc0d3MTlKNURqNFNTNTdjdkllZDByQjU5RFZnTXBadnVQ?=
 =?utf-8?B?RjdQNjNWUU1KOGRKajBHZkZMaGxYMTZrRHFrZ2paRzE0YVo5MUFrYWNhTDc3?=
 =?utf-8?B?ZUJOWlBURmNPajEwZm9jQzBwS2JsVDlQYkV6VU05OU5OQzRlMVBGZlpBbkVG?=
 =?utf-8?B?bFRYNDFIMkRwWVpiQW5yVW9ORlJpYks4eThqNjFHbnJ6a0NWUTVRQ2ViQ3dD?=
 =?utf-8?B?aEd3cDdIMzdlNEdQNXNVeGVoakRDOFVNd2JDMkpYNXhjUEQ4eFFFendOR1Yr?=
 =?utf-8?B?VnpReXhFYWZyQTgwanlac2w2bGNkMUlLRU02cnpIcGxCL3RaTUtYU0FnKzN5?=
 =?utf-8?B?Z2hGd1dnaWh2YVNkNUI5T3prM3JNUy9PL2VPZHpSNmI1VzZ4VkhXRHBjaFVq?=
 =?utf-8?B?c0EwbmFvcDFMaGt6MVIwei94akNPRUJCdkp2MkU4Kzd0cnNlcHBpaW5rajRy?=
 =?utf-8?B?VUszci9iaWM0akRpbGIrZmdBQnUrbGY1WXNOcVRVcnFXVkl0UHE0MWwrQ3JH?=
 =?utf-8?B?WCtYY0FqWEV3UE43czVpUjdpZlM2ZXMrVXhZaDl0YlhNV3c5WVN5L04weVo4?=
 =?utf-8?B?Ni91OVovdktPZlpvWlJlVFRmUkVVZGRURkF0dHV2ZWdQUTUyeTBjeWhDTHNI?=
 =?utf-8?B?bEJ5b1pLdnZSVjFUN0twcGhOZExQV0twajYrMmt6QjNlK29zcHlDUFZhNnFM?=
 =?utf-8?B?YVV3elVxb0xML3hHZUY2S3lIb2tnbjlYV3kzN01qZzNNOUNBMU5JeGtlTklD?=
 =?utf-8?B?aEREZHA1RjRzVE5SSENuRDN6TWFwMHY4TnR1V0hZcGlmM3UzbnJUVVhEZVRj?=
 =?utf-8?B?aWkrNHdiVmswVURjdk5hRFY3VkFRMDJQbndTaklpOFB4anp6ck4xcEdnRGlY?=
 =?utf-8?B?V1dNblVyZXFRY0xyekptQmxPcWxNNzFKcXBsRngvcWtQaUFrdGhmT1BBYXpB?=
 =?utf-8?B?WGtVcytmU0NvaERvdGJ6aGl3Ylo4T2pwbnF2cEpSYUdaODBnakExQUl0RGRX?=
 =?utf-8?B?elZNdElrQUVsN0hrejFiVUVjWnFRNDhHOVdPcFM5dDhHRjMzekh5NHlWZ0da?=
 =?utf-8?B?bWZMbUE3bHFTTTF5Q3VOUlpBNkljSnR6RStjMFRnMUV5YXdjQzUxc0VFQ3FN?=
 =?utf-8?B?bmdKRlBZUTh3UjJJcS9tTWQzRGpyNnNtUzJpeERteU91KzFSTUhlVWFiU2xX?=
 =?utf-8?B?YTBiNjRFWlhnaXd0Tm1lZnZWV0V1UlRuZGkrWDNmck9rdWNzdGVPL0l5TFZp?=
 =?utf-8?B?WWpBcTNOZzI2dlpJUDdETUlEZzJDYjFRYmloOHFzWC9oOWdielV1YUZRdHRP?=
 =?utf-8?Q?fFGq/QGTlDZUL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWRGalR4Z2lWWWJGcnY5L3hpMUdTYlBnOThSbGkvYktIT1BoeXNFbGZhdG1v?=
 =?utf-8?B?dmtDUUQ0cFA4dTk2UlhWNGQ2OWpXNjdnOE1Kd250ajhUMEZvWisrVUVzMXd2?=
 =?utf-8?B?eFpXVFV0KzhPRjk1WXFEdFovR1V4bTNKWkk0YXVmdDJSalFjWS9GSkVaY0E3?=
 =?utf-8?B?aVZvWjk4aVZIdmRNSklscVRJRk51Ymt1S3VrbnlBYUcwVklPTjNuQ2RUVi9v?=
 =?utf-8?B?QWlRbVRLcytsL1FOUlA2RFk0NGxRODdGT3NRemwxQ3pTYTdTaWF0TGtqekky?=
 =?utf-8?B?Vy8veWxrbWt3c2Y3dUt3RzF0QWlXQ1N3VHBUdTY2RFRUNGZMUGc0djZrN0t5?=
 =?utf-8?B?MG5Hd3V4TCtvWEFGT1VRTUVOYlRSQ3E5NkYvSytlYmtINmpTOGhjOHRHV0J4?=
 =?utf-8?B?UFFJOVRFMlRqbzNHYW1LSFpVR2RwWG1GSFFoTHZ5QzlLN09NTTJzZDIvMUxz?=
 =?utf-8?B?NUdkYTB5UHF5cG9WVUw0SUtxU2NadDdUbHN3Vzh0dFFxd1RSSGhCYjc0T0hC?=
 =?utf-8?B?LzVleVZkRHJFVU5oTDFncWFSa0ZDMVkxQ0V5VHFnYWtud0tKR0tyaWpSdmtM?=
 =?utf-8?B?Uml5QjZMM1VJZnQyb25HYXJMbzBWWUh0OWVqNVEyVllMa3lmVWtuRzhLNHNp?=
 =?utf-8?B?bmN6bHRkaFptb0FJZWE5QytIclhPeDBpQklLVERyeDdGejI1elJhaFlzVmJk?=
 =?utf-8?B?NUpyNmVQdVU3WGJPeXQvK0MrUmVLelRBb094U0hrVzBmM2VLK1JCTHpSN1h3?=
 =?utf-8?B?ZE9RcDRKb0IzWGpYc3NaUlZoTWh3dEZ4L0xqMVJZaTRBVUxHVHAydkdLSFVU?=
 =?utf-8?B?UVJXbGJkUU9Uek5ISkZwdDlsTmdoV0oxblJ6K25CWFBVUlB5dDdXMC9qcjdl?=
 =?utf-8?B?V0xxOHdyR1hjUW4vZytJM3lNN3o3N0Y2aWlZSHpVRXByVjM1TXBzZ3o5MXE3?=
 =?utf-8?B?YTAwd3FuT0t5NmRNci9sY0ZvZVBRN0Z6dnlzMDc1Tll4MkJadEwzY0w0WmZJ?=
 =?utf-8?B?S05iY3dXb1FFVk9WMWdQQ253dFlZamVXQzdtaUpQM2NSUGJYQjROLzFST2Ry?=
 =?utf-8?B?Nkx0TEpsU3hxQU8vR3RRVVZ6VFhIUy9sVmppZ1pSY3JtbklKZHM3bVBrZmlH?=
 =?utf-8?B?S2trQ2pvQTFieHgxMHpobmFHa0MzMWZBRU5vclJGMEhRMGQvRDM2bmgydzB1?=
 =?utf-8?B?UDVhSUJFVTlPYWpqUGJETXRUTHFHUThXTkM0TVJ6QytYMDZaV3Zlc1lZbTBV?=
 =?utf-8?B?Zk9LMVdCUzJrd1NMWUphUFNOYkxnZWZRNVBaQVg5ZmRUcElicTg1ZUNiMVhX?=
 =?utf-8?B?K05hV0xXM3czMlpzWXVlSnR0dVdkV2F0WUkxVm1sNElzbjZqRDZONUJUNlBm?=
 =?utf-8?B?cUNLNFIvaXBGTGkrYUQweXlESUk4eWZCYThMb3NtOHdHMUdzNmVuamlPbndW?=
 =?utf-8?B?eFRaTUMrcEJkRUlYa2tMNXlIb1lwUHVDeWFhdVN6TkdlOW4rVzJzWE5aNkR6?=
 =?utf-8?B?QXdkeVhzNWNlcm1rRFlNWHJYYk9CY0VPVnBaYzBNNVVTZmlpcEFza3pGRjhK?=
 =?utf-8?B?NS9CeUpuTGhheE9HV2VPdElJdDUyN3dGZ2RDYUFLTnhpUXQ5bGlEMmwxK1Vs?=
 =?utf-8?B?aUlQOHBiN2R3ZlpCaVlZUFJIa1luRFBDbGFad0lUZzVQOWRRazBQaU4rQjhv?=
 =?utf-8?B?M0w0NGV0NlB1U2p5bjJ5TjBjUnBYajIzL3RHK01mU3FFamV1clRNYmRtRmNT?=
 =?utf-8?B?d1llUUZnRW1ndWdtcVFIVXY3UmtGVFZLMEUwQlJDYXNwT25EL3dNZXQ1TXda?=
 =?utf-8?B?MzBGY0VCNHRaNmhJRzVzelZoeHArL2YvSnF0UEVnUnJ2WmJRLzhYaHlLM3Y3?=
 =?utf-8?B?ZjdFYWZFR0VHaXNBNkFUeUdrdEtMdXBkN01YbW4rL0hqOFI2TVNHT0NQMW56?=
 =?utf-8?B?cXpYVkZGVGRVZFlhN2pMVmZ3eWV0bjh5Wk42T2tYSmgrQ3lLOG9EWGZzdUlK?=
 =?utf-8?B?dXE3YU9ma0lMVjBaV3hLc3NjaHlQYWpNcmg4ei80UmxCR0o5c1hTbXJCUitn?=
 =?utf-8?B?RHA4NUFCZWo2clBzL3l0a3QzclVaVHpKQTNuUWNVY0NlYlJNK0pkREtNcXN2?=
 =?utf-8?Q?6G5MHlfzI0xAnVOdXxV9zxrFj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb6ed26-9d76-4682-aa18-08dd4cdea12b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 10:02:03.1164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMKlL24Aq1to9Ec2VDYSzzT9J4JaE30puk/2cwjNXRJNjXk1Br/F2dX8nXDaBpb1970FtcvEji17WPzUHUb+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8771
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

Hi Vinay

Could you re-run the CI, to make sure these are not from this patch.

igt@sysfs_heartbeat_interval@nopreempt@vcs0:
shard-mtlp: PASS -> ABORT
igt@sysfs_heartbeat_interval@nopreempt@vcs1:
shard-mtlp: PASS -> DMESG-WARN


On 2/5/2025 11:52 PM, Vinay Belgaumkar wrote:
> Add these redundant utils to core lib. Also fix the bug in
> measured_usleep, it was returning nsec slept not usec.
> 
> v2: Updated perf_pmu and some failing tests. They were expecting
> nanosec instead of usec.
> v3: Update one more call to measured_usleep.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Patch looks good to me.
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks
Riana
> ---
>   lib/igt_core.c                         | 20 +++++++
>   lib/igt_core.h                         | 20 +++++++
>   tests/intel/drm_fdinfo.c               | 68 ++++++---------------
>   tests/intel/gem_exec_nop.c             |  6 --
>   tests/intel/gem_spin_batch.c           |  6 --
>   tests/intel/i915_pm_rc6_residency.c    | 42 +++----------
>   tests/intel/perf_pmu.c                 | 82 ++++++++------------------
>   tests/intel/sysfs_heartbeat_interval.c | 19 +-----
>   tests/intel/xe_pm_residency.c          | 29 +--------
>   9 files changed, 95 insertions(+), 197 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 407f7b551..b95db1b25 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3553,3 +3553,23 @@ void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex)
>   	g_regex_unref(re);
>   	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
>   }
> +
> +/**
> + * @igt_measured_usleep: Helper to model accurate sleep time for tests
> + * @usec: usec to sleep
> + * Return: usec slept
> + */
> +unsigned int igt_measured_usleep(unsigned int usec)
> +{
> +	struct timespec ts = { };
> +	unsigned int slept_usec;
> +
> +	slept_usec = igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
> +	igt_assert(slept_usec == 0);
> +	do {
> +		usleep(usec - slept_usec);
> +		slept_usec = igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
> +	} while (slept_usec < usec);
> +
> +	return igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
> +}
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index f0ba1a381..0f2af950b 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1524,9 +1524,11 @@ void igt_kmsg(const char *format, ...);
>   #if __WORDSIZE == 64
>   #define MSEC_PER_SEC (1000ul)
>   #define USEC_PER_MSEC (1000ul)
> +#define NSEC_PER_USEC (1000ul)
>   #else
>   #define MSEC_PER_SEC (1000ull)
>   #define USEC_PER_MSEC (1000ull)
> +#define NSEC_PER_USEC (1000ull)
>   #endif
>   
>   #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
> @@ -1536,6 +1538,23 @@ void igt_kmsg(const char *format, ...);
>   
>   #define for_if(expr__) if (!(expr__)) {} else
>   
> +#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
> +	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
> +		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
> +		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n%s\n",\
> +		     #x, #ref, (double)(x), \
> +		     (tol_up) * 100.0, (tol_down) * 100.0, \
> +		     (double)(ref), debug_data)
> +
> +#define assert_within_epsilon(x, ref, tolerance) \
> +	__assert_within_epsilon(x, ref, tolerance, tolerance, "\0")
> +
> +#define assert_within_epsilon_up_down(x, ref, tol_up, tol_down) \
> +	__assert_within_epsilon(x, ref, tol_up, tol_down, "\0")
> +
> +#define assert_within_epsilon_debug(x, ref, tolerance, debug_data) \
> +	__assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
> +
>   /**
>    * igt_pci_system_init:
>    * IGT wrapper around pci_system_init()
> @@ -1578,4 +1597,5 @@ void igt_pci_system_cleanup(void);
>   
>   void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
>   
> +unsigned int igt_measured_usleep(unsigned int usec);
>   #endif /* IGT_CORE_H */
> diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
> index b66ac9e1b..3c1f0a739 100644
> --- a/tests/intel/drm_fdinfo.c
> +++ b/tests/intel/drm_fdinfo.c
> @@ -106,23 +106,6 @@ static const char *engine_map[] = {
>   	"compute",
>   };
>   
> -#define __assert_within_epsilon(x, ref, tol_up, tol_down) \
> -	do { \
> -		igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
> -			     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
> -			     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
> -			     #x, #ref, (double)(x), \
> -			     (tol_up) * 100.0, (tol_down) * 100.0, \
> -			     (double)(ref)); \
> -		igt_debug("%f within +%.1f%%/-%.1f%% tolerance of %f\n",\
> -			  (double)(x), \
> -			  (tol_up) * 100.0, (tol_down) * 100.0, \
> -			  (double)(ref)); \
> -	} while (0)
> -
> -#define assert_within_epsilon(x, ref, tolerance) \
> -	__assert_within_epsilon(x, ref, tolerance, tolerance)
> -
>   static void basics(int i915, unsigned int num_classes)
>   {
>   	struct drm_client_fdinfo info = { };
> @@ -137,26 +120,6 @@ static void basics(int i915, unsigned int num_classes)
>   	igt_assert_eq(info.num_engines, num_classes);
>   }
>   
> -/*
> - * Helper for cases where we assert on time spent sleeping (directly or
> - * indirectly), so make it more robust by ensuring the system sleep time
> - * is within test tolerance to start with.
> - */
> -static unsigned int measured_usleep(unsigned int usec)
> -{
> -	struct timespec ts = { };
> -	unsigned int slept;
> -
> -	slept = igt_nsec_elapsed(&ts);
> -	igt_assert(slept == 0);
> -	do {
> -		usleep(usec - slept);
> -		slept = igt_nsec_elapsed(&ts) / 1000;
> -	} while (slept < usec);
> -
> -	return igt_nsec_elapsed(&ts);
> -}
> -
>   #define TEST_BUSY (1)
>   #define FLAG_SYNC (2)
>   #define TEST_TRAILING_IDLE (4)
> @@ -239,7 +202,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
>   		spin = NULL;
>   
>   	val = read_engine_time(gem_fd, e->class);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(spin_fd, spin, flags);
>   	val = read_engine_time(gem_fd, e->class) - val;
> @@ -258,7 +221,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
>   		igt_assert(!gem_bo_busy(spin_fd, spin->handle));
>   
>   		val = read_engine_time(gem_fd, e->class);
> -		slept = measured_usleep(batch_duration_ns / 1000);
> +		slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   		val = read_engine_time(gem_fd, e->class) - val;
>   
>   		assert_within_epsilon(slept - val, slept, tolerance);
> @@ -320,7 +283,7 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
>   
>   	read_engine_time_all(gem_fd, tval[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	read_engine_time_all(gem_fd, tval[1]);
> @@ -335,7 +298,8 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	log_busy(num_classes, val);
>   
>   	for (i = 0; i < num_classes; i++)
> -		assert_within_epsilon(i == e->class ? val[i] : slept - val[i], slept, tolerance);
> +		assert_within_epsilon(i == e->class ? val[i] : slept - val[i],
> +				      slept, tolerance);
>   
>   	gem_quiescent_gpu(gem_fd);
>   }
> @@ -395,7 +359,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>   
>   	read_engine_time_all(gem_fd, tval[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	read_engine_time_all(gem_fd, tval[1]);
> @@ -412,7 +376,8 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	for (i = 0; i < num_classes; i++) {
>   		double target = slept * busy_class[i] ?: slept;
>   
> -		assert_within_epsilon(busy_class[i] ? val[i] : slept - val[i], target, tolerance);
> +		assert_within_epsilon(busy_class[i] ? val[i] : slept - val[i],
> +				      target, tolerance);
>   	}
>   	gem_quiescent_gpu(gem_fd);
>   }
> @@ -450,7 +415,7 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>   
>   	read_engine_time_all(gem_fd, tval[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	read_engine_time_all(gem_fd, tval[1]);
> @@ -467,7 +432,8 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	for (i = 0; i < num_classes; i++) {
>   		double target = slept * busy_class[i] ?: slept;
>   
> -		assert_within_epsilon(busy_class[i] ? val[i] : slept - val[i], target, tolerance);
> +		assert_within_epsilon(busy_class[i] ? val[i] : slept - val[i],
> +				      target, tolerance);
>   	}
>   	gem_quiescent_gpu(gem_fd);
>   }
> @@ -596,7 +562,7 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>   				spin = NULL;
>   
>   			val = read_engine_time(i915, class);
> -			slept = measured_usleep(batch_duration_ns / 1000);
> +			slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   			if (flags & TEST_TRAILING_IDLE)
>   				end_spin(i915, spin, flags);
>   			val = read_engine_time(i915, class) - val;
> @@ -615,8 +581,8 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>   				igt_assert(!gem_bo_busy(i915, spin->handle));
>   
>   				val = read_engine_time(i915, class);
> -				slept = measured_usleep(batch_duration_ns /
> -							1000);
> +				slept = igt_measured_usleep(batch_duration_ns /
> +							1000) * NSEC_PER_USEC;
>   				val = read_engine_time(i915, class) - val;
>   
>   				assert_within_epsilon(slept - val, slept, tolerance);
> @@ -705,7 +671,7 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>   		usleep(__igt_sync_spin_wait(i915, spin) * count / 1e3);
>   
>   		val = read_engine_time(i915, class);
> -		slept = measured_usleep(batch_duration_ns / 1000);
> +		slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   		if (flags & TEST_TRAILING_IDLE)
>   			end_spin(i915, spin, flags);
>   		val = read_engine_time(i915, class) - val;
> @@ -723,8 +689,8 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>   			igt_assert(!gem_bo_busy(i915, spin->handle));
>   
>   			val = read_engine_time(i915, class);
> -			slept = measured_usleep(batch_duration_ns /
> -						1000);
> +			slept = igt_measured_usleep(batch_duration_ns /
> +						1000) * NSEC_PER_USEC;
>   			val = read_engine_time(i915, class) - val;
>   
>   			assert_within_epsilon(slept - val, slept, tolerance);
> diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
> index 652f8deff..74593c085 100644
> --- a/tests/intel/gem_exec_nop.c
> +++ b/tests/intel/gem_exec_nop.c
> @@ -434,12 +434,6 @@ stable_nop_on_ring(int fd, uint32_t handle, const intel_ctx_t *ctx,
>   	return n;
>   }
>   
> -#define assert_within_epsilon(x, ref, tolerance) \
> -        igt_assert_f((x) <= (1.0 + tolerance) * ref && \
> -                     (x) >= (1.0 - tolerance) * ref, \
> -                     "'%s' != '%s' (%f not within %f%% tolerance of %f)\n",\
> -                     #x, #ref, x, tolerance * 100.0, ref)
> -
>   static void headless(int fd, uint32_t handle, const intel_ctx_t *ctx,
>   		     const struct intel_execution_engine2 *e)
>   {
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index 85408a4c0..dee892411 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -51,12 +51,6 @@
>   
>   #define MAX_ERROR 5 /* % */
>   
> -#define assert_within_epsilon(x, ref, tolerance) \
> -	igt_assert_f(100 * x <= (100 + tolerance) * ref && \
> -		     100 * x >= (100 - tolerance) * ref, \
> -		     "'%s' != '%s' (%lld not within %d%% tolerance of %lld)\n",\
> -		     #x, #ref, (long long)x, tolerance, (long long)ref)
> -
>   static void spin(int fd, const intel_ctx_t *ctx_id,
>   		 unsigned int engine,
>   		 unsigned int flags,
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index 7942d46d3..c9128481d 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -234,17 +234,6 @@ static uint64_t pmu_read_single(int fd)
>   	return __pmu_read_single(fd, NULL);
>   }
>   
> -#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
> -	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
> -		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
> -		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n %s\n",\
> -		     #x, #ref, (double)(x), \
> -		     (tol_up) * 100.0, (tol_down) * 100.0, \
> -		     (double)(ref), debug_data)
> -
> -#define assert_within_epsilon(x, ref, tolerance, debug_data) \
> -	__assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
> -
>   static char *get_drpc(int i915, int gt_id)
>   {
>   	int gt_dir;
> @@ -275,21 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>   	return false;
>   }
>   
> -static unsigned int measured_usleep(unsigned int usec)
> -{
> -	struct timespec ts = { };
> -	unsigned int slept;
> -
> -	slept = igt_nsec_elapsed(&ts);
> -	igt_assert(slept == 0);
> -	do {
> -		usleep(usec - slept);
> -		slept = igt_nsec_elapsed(&ts) / 1000;
> -	} while (slept < usec);
> -
> -	return igt_nsec_elapsed(&ts);
> -}
> -
>   static uint32_t batch_create(int fd)
>   {
>   	const uint32_t bbe = MI_BATCH_BUFFER_END;
> @@ -416,7 +390,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   	/* While idle check full RC6. */
>   	igt_power_get_energy(&gpu, &sample[0]);
>   	rc6 = -__pmu_read_single(fd, &ts[0]);
> -	slept = measured_usleep(duration_ns / 1000);
> +	slept = igt_measured_usleep(duration_ns / 1000) * NSEC_PER_USEC;
>   	rc6 += __pmu_read_single(fd, &ts[1]);
>   	igt_debug("slept=%lu perf=%"PRIu64", rc6=%"PRIu64"\n",
>   		  slept, ts[1] - ts[0], rc6);
> @@ -431,7 +405,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   	}
>   	drpc = get_drpc(i915, gt);
>   
> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
> +	assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>   
>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   
> @@ -443,7 +417,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   		igt_power_get_energy(&gpu, &sample[0]);
>   		cycles = -READ_ONCE(done[1]);
>   		rc6 = -__pmu_read_single(fd, &ts[0]);
> -		slept = measured_usleep(duration_ns / 1000);
> +		slept = igt_measured_usleep(duration_ns / 1000) * NSEC_PER_USEC;
>   		rc6 += __pmu_read_single(fd, &ts[1]);
>   		cycles += READ_ONCE(done[1]);
>   		igt_debug("%s: slept=%lu perf=%"PRIu64", cycles=%lu, rc6=%"PRIu64"\n",
> @@ -469,7 +443,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   		/* While very nearly idle, expect full RC6 */
>   		drpc = get_drpc(i915, gt);
>   
> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
> +		assert_within_epsilon_debug(rc6, ts[1] - ts[0], tolerance, drpc);
>   
>   		free(drpc);
>   		drpc = NULL;
> @@ -512,7 +486,7 @@ static void rc6_fence(int i915, unsigned int gt)
>   	/* While idle check full RC6. */
>   	igt_power_get_energy(&gpu, &sample[0]);
>   	rc6 = -__pmu_read_single(fd, &ts[0]);
> -	slept = measured_usleep(duration_ns / 1000);
> +	slept = igt_measured_usleep(duration_ns / 1000) * NSEC_PER_USEC;
>   	rc6 += __pmu_read_single(fd, &ts[1]);
>   	igt_debug("slept=%lu perf=%"PRIu64", rc6=%"PRIu64"\n",
>   		  slept, ts[1] - ts[0], rc6);
> @@ -527,7 +501,7 @@ static void rc6_fence(int i915, unsigned int gt)
>   	}
>   	drpc = get_drpc(i915, gt);
>   
> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
> +	assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>   
>   	/* Submit but delay execution, we should be idle and conserving power */
>   	ctx = intel_ctx_create_for_gt(i915, gt);
> @@ -549,7 +523,7 @@ static void rc6_fence(int i915, unsigned int gt)
>   
>   		igt_power_get_energy(&gpu, &sample[0]);
>   		rc6 = -__pmu_read_single(fd, &ts[0]);
> -		slept = measured_usleep(duration_ns / 1000);
> +		slept = igt_measured_usleep(duration_ns / 1000) * NSEC_PER_USEC;
>   		rc6 += __pmu_read_single(fd, &ts[1]);
>   		igt_debug("%s: slept=%lu perf=%"PRIu64", rc6=%"PRIu64"\n",
>   			  e->name, slept, ts[1] - ts[0], rc6);
> @@ -570,7 +544,7 @@ static void rc6_fence(int i915, unsigned int gt)
>   
>   		drpc = get_drpc(i915, gt);
>   
> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
> +		assert_within_epsilon_debug(rc6, ts[1] - ts[0], tolerance, drpc);
>   		gem_quiescent_gpu(i915);
>   
>   		free(drpc);
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 5d0467c02..7b2c64c1d 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -284,39 +284,6 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>   	return buf[1];
>   }
>   
> -#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
> -	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
> -		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
> -		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n%s\n",\
> -		     #x, #ref, (double)(x), \
> -		     (tol_up) * 100.0, (tol_down) * 100.0, \
> -		     (double)(ref), debug_data)
> -
> -#define assert_within_epsilon(x, ref, tolerance) \
> -	__assert_within_epsilon(x, ref, tolerance, tolerance, no_debug_data)
> -
> -#define assert_within_epsilon_debug(x, ref, tolerance, debug_data) \
> -	__assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
> -/*
> - * Helper for cases where we assert on time spent sleeping (directly or
> - * indirectly), so make it more robust by ensuring the system sleep time
> - * is within test tolerance to start with.
> - */
> -static unsigned int measured_usleep(unsigned int usec)
> -{
> -	struct timespec ts = { };
> -	unsigned int slept;
> -
> -	slept = igt_nsec_elapsed(&ts);
> -	igt_assert(slept == 0);
> -	do {
> -		usleep(usec - slept);
> -		slept = igt_nsec_elapsed(&ts) / 1000;
> -	} while (slept < usec);
> -
> -	return igt_nsec_elapsed(&ts);
> -}
> -
>   #define TEST_BUSY (1)
>   #define FLAG_SYNC (2)
>   #define TEST_TRAILING_IDLE (4)
> @@ -377,7 +344,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
>   		spin = NULL;
>   
>   	val = pmu_read_single(fd);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	val = pmu_read_single(fd) - val;
> @@ -395,7 +362,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
>   		igt_assert(!gem_bo_busy(gem_fd, spin->handle));
>   
>   		val = pmu_read_single(fd);
> -		slept = measured_usleep(batch_duration_ns / 1000);
> +		slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   		val = pmu_read_single(fd) - val;
>   
>   		assert_within_epsilon(val, 0, tolerance);
> @@ -429,7 +396,7 @@ busy_start(int gem_fd, const intel_ctx_t *ctx,
>   	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
>   
>   	val = __pmu_read_single(fd, &ts[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	val = __pmu_read_single(fd, &ts[1]) - val;
>   	igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
>   
> @@ -485,7 +452,7 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
>   	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
>   
>   	val = __pmu_read_single(fd, &ts[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	val = __pmu_read_single(fd, &ts[1]) - val;
>   	igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
>   
> @@ -565,7 +532,7 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   
>   	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
>   	pmu_read_multi(fd[0], num_engines, tval[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	pmu_read_multi(fd[0], num_engines, tval[1]);
> @@ -640,7 +607,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>   
>   	pmu_read_multi(fd[0], num_engines, tval[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	pmu_read_multi(fd[0], num_engines, tval[1]);
> @@ -698,7 +665,7 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>   
>   	pmu_read_multi(fd[0], num_engines, tval[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	pmu_read_multi(fd[0], num_engines, tval[1]);
> @@ -741,7 +708,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
>   		spin = NULL;
>   
>   	pmu_read_multi(fd[0], 2, val[0]);
> -	measured_usleep(batch_duration_ns / 1000);
> +	igt_measured_usleep(batch_duration_ns / 1000);
>   	if (flags & TEST_TRAILING_IDLE)
>   		end_spin(gem_fd, spin, flags);
>   	pmu_read_multi(fd[0], 2, val[1]);
> @@ -854,7 +821,7 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
>   		     "sampling failed to start withing 10ms\n");
>   
>   	val[0] = __pmu_read_single(fd, &ts[0]);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	if (flags & TEST_TRAILING_IDLE)
>   		obj_ptr[0] = 1;
>   	val[1] = __pmu_read_single(fd, &ts[1]);
> @@ -975,11 +942,12 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
>   
>   	total = pmu_read_multi(pmu, 2, start);
>   
> -	sema = measured_usleep(batch_duration_ns * sema_pct / 100 / 1000);
> +	sema = igt_measured_usleep(batch_duration_ns * sema_pct / 100 / 1000) * NSEC_PER_USEC;
>   	*map = 2; __sync_synchronize();
> -	busy = measured_usleep(batch_duration_ns * (busy_pct - sema_pct) / 100 / 1000);
> +	busy = igt_measured_usleep(batch_duration_ns * (busy_pct - sema_pct) / 100 / 1000)
> +	       * NSEC_PER_USEC;
>   	igt_spin_end(spin);
> -	measured_usleep(batch_duration_ns * (100 - busy_pct) / 100 / 1000);
> +	igt_measured_usleep(batch_duration_ns * (100 - busy_pct) / 100 / 1000);
>   
>   	total = pmu_read_multi(pmu, 2, val) - total;
>   	igt_spin_free(gem_fd, spin);
> @@ -1044,7 +1012,7 @@ static void test_awake(int i915, const intel_ctx_t *ctx)
>   		igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
>   
>   		val = pmu_read_single(fd);
> -		slept = measured_usleep(batch_duration_ns / 1000);
> +		slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   		val = pmu_read_single(fd) - val;
>   
>   		gem_quiescent_gpu(i915);
> @@ -1056,7 +1024,7 @@ static void test_awake(int i915, const intel_ctx_t *ctx)
>   		igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
>   
>   	val = pmu_read_single(fd);
> -	slept = measured_usleep(batch_duration_ns / 1000);
> +	slept = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	val = pmu_read_single(fd) - val;
>   
>   	gem_quiescent_gpu(i915);
> @@ -1297,13 +1265,13 @@ multi_client(int gem_fd, const intel_ctx_t *ctx,
>   	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
>   
>   	val[0] = val[1] = __pmu_read_single(fd[0], &ts[0]);
> -	slept[1] = measured_usleep(batch_duration_ns / 1000);
> +	slept[1] = igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC;
>   	val[1] = __pmu_read_single(fd[1], &ts[1]) - val[1];
>   	perf_slept[1] = ts[1] - ts[0];
>   	igt_debug("slept=%lu perf=%"PRIu64"\n", slept[1], perf_slept[1]);
>   	close(fd[1]);
>   
> -	slept[0] = measured_usleep(batch_duration_ns / 1000) + slept[1];
> +	slept[0] = (igt_measured_usleep(batch_duration_ns / 1000) * NSEC_PER_USEC) + slept[1];
>   	val[0] = __pmu_read_single(fd[0], &ts[1]) - val[0];
>   	perf_slept[0] = ts[1] - ts[0];
>   	igt_debug("slept=%lu perf=%"PRIu64"\n", slept[0], perf_slept[0]);
> @@ -1710,7 +1678,7 @@ test_frequency(int gem_fd, unsigned int gt)
>   	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
>   
>   	slept = pmu_read_multi(fd[0], 2, start);
> -	measured_usleep(batch_duration_ns / 1000);
> +	igt_measured_usleep(batch_duration_ns / 1000);
>   	slept = pmu_read_multi(fd[0], 2, val) - slept;
>   
>   	min[0] = 1e9*(val[0] - start[0]) / slept;
> @@ -1740,7 +1708,7 @@ test_frequency(int gem_fd, unsigned int gt)
>   	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
>   
>   	slept = pmu_read_multi(fd[0], 2, start);
> -	measured_usleep(batch_duration_ns / 1000);
> +	igt_measured_usleep(batch_duration_ns / 1000);
>   	slept = pmu_read_multi(fd[0], 2, val) - slept;
>   
>   	max[0] = 1e9*(val[0] - start[0]) / slept;
> @@ -1772,7 +1740,7 @@ test_frequency(int gem_fd, unsigned int gt)
>   	 * On thermally throttled devices we cannot be sure maximum frequency
>   	 * can be reached so use larger tolerance downards.
>   	 */
> -	__assert_within_epsilon(max[0], max_freq, tolerance, 0.15f, no_debug_data);
> +	assert_within_epsilon_up_down(max[0], max_freq, tolerance, 0.15f);
>   }
>   
>   static void
> @@ -1795,10 +1763,10 @@ test_frequency_idle(int gem_fd, unsigned int gt)
>   	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
>   
>   	gem_quiescent_gpu(gem_fd); /* Be idle! */
> -	measured_usleep(2000); /* Wait for timers to cease */
> +	igt_measured_usleep(2000); /* Wait for timers to cease */
>   
>   	slept = pmu_read_multi(fd[0], 2, start);
> -	measured_usleep(batch_duration_ns / 1000);
> +	igt_measured_usleep(batch_duration_ns / 1000);
>   	slept = pmu_read_multi(fd[0], 2, val) - slept;
>   
>   	close(fd[0]);
> @@ -1922,7 +1890,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   
>   	/* While idle check full RC6. */
>   	ts[0] = pmu_read_multi(fd[0], pmus, prev);
> -	slept = measured_usleep(duration_ns / 1000);
> +	slept = igt_measured_usleep(duration_ns / 1000) * NSEC_PER_USEC;
>   	ts[1] = pmu_read_multi(fd[0], pmus, idle);
>   
>   	for (gt_ = 0; gt_ < pmus; gt_++) {
> @@ -1962,7 +1930,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   		      "failed to enter c6 \n%s\n", drpc = get_drpc(gem_fd, test_idx));
>   
>   	ts[0] = pmu_read_multi(fd[0], pmus, prev);
> -	slept = measured_usleep(duration_ns / 1000);
> +	slept = igt_measured_usleep(duration_ns / 1000) * NSEC_PER_USEC;
>   	ts[1] = pmu_read_multi(fd[0], pmus, idle);
>   
>   	for (gt_ = 0; gt_ < pmus; gt_++) {
> @@ -1987,7 +1955,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   	usleep(1e3); /* wait for the rc6 cycle counter to stop ticking */
>   
>   	ts[0] = pmu_read_multi(fd[0], pmus, prev);
> -	slept = measured_usleep(duration_ns / 1000);
> +	slept = igt_measured_usleep(duration_ns / 1000) * NSEC_PER_USEC;
>   	ts[1] = pmu_read_multi(fd[0], pmus, busy);
>   
>   	for (gt_ = 0; gt_ < num_gt; gt_++) {
> diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
> index 486a1514d..b4ca4769f 100644
> --- a/tests/intel/sysfs_heartbeat_interval.c
> +++ b/tests/intel/sysfs_heartbeat_interval.c
> @@ -307,21 +307,6 @@ static void test_nopreempt(int i915, int engine)
>   	set_heartbeat(engine, saved);
>   }
>   
> -static unsigned int measured_usleep(unsigned int usec)
> -{
> -	struct timespec ts = { };
> -	unsigned int slept;
> -
> -	slept = igt_nsec_elapsed(&ts);
> -	igt_assert(slept == 0);
> -	do {
> -		usleep(usec - slept);
> -		slept = igt_nsec_elapsed(&ts) / 1000;
> -	} while (slept < usec);
> -
> -	return igt_nsec_elapsed(&ts);
> -}
> -
>   static void client(int i915, int engine, int *ctl, int duration, int expect)
>   {
>   	unsigned int class, inst;
> @@ -352,7 +337,7 @@ static void client(int i915, int engine, int *ctl, int duration, int expect)
>   			continue;
>   		}
>   
> -		elapsed = measured_usleep(duration * 1000);
> +		elapsed = igt_measured_usleep(duration * 1000);
>   		igt_spin_end(spin);
>   
>   		sync_fence_wait(spin->out_fence, -1);
> @@ -361,7 +346,7 @@ static void client(int i915, int engine, int *ctl, int duration, int expect)
>   
>   		igt_assert_f(sync_fence_status(spin->out_fence) == expect,
>   			     "%s client: elapsed: %.3fms, expected %d, got %d\n",
> -			     expect < 0 ? "Bad" : "Good", elapsed * 1e-6,
> +			     expect < 0 ? "Bad" : "Good", elapsed * 1e-3,
>   			     expect, sync_fence_status(spin->out_fence));
>   		igt_spin_free(i915, spin);
>   		count++;
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index f9e96d608..3432077cc 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -32,14 +32,6 @@
>   const double tolerance = 0.1;
>   int fw_handle = -1;
>   
> -#define assert_within_epsilon(x, ref, tol) \
> -	igt_assert_f((double)(x) <= (1.0 + (tol)) * (double)(ref) && \
> -		     (double)(x) >= (1.0 - (tol)) * (double)(ref), \
> -		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
> -		     #x, #ref, (double)(x), \
> -		     (tol) * 100.0, (tol) * 100.0, \
> -		     (double)(ref))
> -
>   enum test_type {
>   	TEST_S2IDLE,
>   	TEST_IDLE,
> @@ -177,21 +169,6 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>   	xe_vm_destroy(fd, vm);
>   }
>   
> -static unsigned int measured_usleep(unsigned int usec)
> -{
> -	struct timespec ts = { };
> -	unsigned int slept;
> -
> -	slept = igt_nsec_elapsed(&ts);
> -	igt_assert(slept == 0);
> -	do {
> -		usleep(usec - slept);
> -		slept = igt_nsec_elapsed(&ts) / 1000;
> -	} while (slept < usec);
> -
> -	return igt_nsec_elapsed(&ts) / 1000;
> -}
> -
>   static unsigned long read_idle_residency(int fd, int gt)
>   {
>   	unsigned long residency = 0;
> @@ -224,7 +201,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>   
>   	if (flag == TEST_IDLE) {
>   		residency_start = read_idle_residency(fd, gt);
> -		elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
> +		elapsed_ms = igt_measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
>   		residency_end = read_idle_residency(fd, gt);
>   	}
>   
> @@ -260,7 +237,7 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>   
>   	start = READ_ONCE(done[1]);
>   	residency_start = read_idle_residency(fd, hwe->gt_id);
> -	elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
> +	elapsed_ms = igt_measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
>   	residency_end = read_idle_residency(fd, hwe->gt_id);
>   	end = READ_ONCE(done[1]);
>   	*done = 1;
> @@ -281,7 +258,7 @@ static void measure_power(struct igt_power *gpu, double *power)
>   	struct power_sample power_sample[2];
>   
>   	igt_power_get_energy(gpu, &power_sample[0]);
> -	measured_usleep(SLEEP_DURATION * USEC_PER_SEC);
> +	igt_measured_usleep(SLEEP_DURATION * USEC_PER_SEC);
>   	igt_power_get_energy(gpu, &power_sample[1]);
>   	*power = igt_power_get_mW(gpu, &power_sample[0], &power_sample[1]);
>   }

