Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481A7C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 12:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E954510E220;
	Wed, 25 Jun 2025 12:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ktapzr+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E977710E220
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 12:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750854129; x=1782390129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rA5y9upTQA4FpWBqIinTv8EL5/dpqFIeKEUafbJ6yBY=;
 b=Ktapzr+9KlpntGlASuCp1ScpBex/t4aY+nAdd+h1Lwn527PKYygf4k2T
 TidLQ20wrPgkLM508Wmzf9F/eYuqUSUYefYIqXC2an5mS/zG9YQbUOuXw
 ubSsrOoFLy1MUzkt8QzdOTEitBxXowtNk/7UyVRydRpKoXH03NN1LYBl0
 4bSnLZ6IPxA/nDi3l7UDSsrvjSwfQ86lI+WOuSG2mULsvv9frd7RyiSV2
 Q2YUwT7I7R2NbCh1ld+8hjJWzOS6vHZmwi/L5b4YLXfEKSytSGyLRIISL
 xLNHHCs1nak9Qn7zf+ey9/2R1c0CfNiKKZV/ytJE9m3+R3gkqpMRIKzJm Q==;
X-CSE-ConnectionGUID: BJAe3Xd1T/6QeXfeyo4SPQ==
X-CSE-MsgGUID: zfn1qhIdTlSDLLqtGM3v8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40741540"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="40741540"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:22:09 -0700
X-CSE-ConnectionGUID: rKAMcG4RRnGLbeHK8YlV/A==
X-CSE-MsgGUID: jRg6DlTyTb6gQx3JHbp8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="152694622"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:22:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:22:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 05:22:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:22:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyxV+j3IeJcVnbpxh5vs1KLgHcDTJ0gJQCOL/XTZfaw53h3mzCmLpC1PG0IwJlqvj7RSW942c4KCXBdS1X43lKyx82n4ophylmTNo4tj36BHBV95uFpjMPIXHOrXuPnsn4AoUZ2GfV5fcga/GL2pOoG9sxpLmLZCYGbT25T8YorcPkQ2eE+O0NnmLTMNpJUvD0yYFfmVg+OAGGEsJMTXtZdiPgneID559LUhsBunKkY+uLZpntXIgtAj9l0oyLLxEhQNuH5tPe4eX18CtNzLdV88CciSnsahS+I04QlZsEFeF1VNy1BYmMD1Og1dRbBa9OpsouOrZ2F92WrSo+uZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kluyHV0B/Xy9Y/TsY+jZhqwVho4esBhh0o1Rn/nCBE=;
 b=BuZS37iHzXUB5/UJpxtuZfQK69ZhmJr9YbnDLngwT7wsmt3Z6Ge4UFUiJyfTo+bq8r7n/DjkEnKZobBHMy+3INUp8E0deYD9631L9UZIJUVppxoW1OwBKfuHZxrENcsj5uoJvwpacZpzX7f4qq/KM9JeJnYrAoAM3uHk9x4rdrk+vnHr/5kGeZ1okO1wAebrBHL81Z2s1R0MCLvaSMkr1hOrdgmnHy5x0cdiWNiihs8ulERObzBk4W5CRvlRNWCPOVjmCYA8qDam5wRRCvNDsRdM/X2hBzcLmZLx1ux6uDkTDImtO2IJUoCB1dgp7sqgZF84ES8TDwDdr1xJ6Z7Hpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by SA1PR11MB8795.namprd11.prod.outlook.com (2603:10b6:806:468::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 12:22:05 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 12:22:05 +0000
Message-ID: <2a212b1d-b98b-484e-8c01-89a46ffc5fc2@intel.com>
Date: Wed, 25 Jun 2025 17:51:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v5,
 2/2] tests/kms_flip: Track and report unexpected events
 with pass rate metric
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <uma.shankar@intel.com>
References: <20250619200549.66329-3-ramanaidu.naladala@intel.com>
 <d59df2cc-dcce-473e-ad6c-073511c17655@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <d59df2cc-dcce-473e-ad6c-073511c17655@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|SA1PR11MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5091ef-071b-4eb5-3915-08ddb3e2e560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUFYdjhIN0N5OUw2N2FyU2VheFBxMUhCcW9NdWlvVTNUMTd0OXVIZktqcDly?=
 =?utf-8?B?U21UU1NmdzdQc3JEQXV4T2tVdm9vWDREVjR0N2hyOXF6eUhMaFZ3cG0wVXZN?=
 =?utf-8?B?OW8rem0wakc3MlB6cFNsYjMzemJHRk1ENGpQbmM2UzlZbTlCR1F4QjJvUWZl?=
 =?utf-8?B?Qm5wam9GOExYK2pUM0lDeTdELzNJbm9ma3dNYW9tdi9UR2FTSTF3NkxRS05z?=
 =?utf-8?B?QjU3RndqdlVieTNsaEhjRWxqNGpNRFVUWnZnSXh0anVMTDlXSENIS1JqMnhL?=
 =?utf-8?B?WCtzTlNrTjJ0NnVsTGVNb2tSMksrNXhpTWpNQlZaNjAySlNVVGg4Y2F6MGdn?=
 =?utf-8?B?RFZJcXU4dTJnMVcxL2c2ajJkRDVFMENWeUhuVlR4akJZZ0tIck80U2ZEQWFS?=
 =?utf-8?B?WDk0WWtXUVZqaFQrbXlUWnFFa1ZPWUtNb3p5cHNGaTEweVdhOHZoYXdQTzFn?=
 =?utf-8?B?SnE0ZEUwK1FIVUlaMFZZNG9Hd3hzZndiNHdjQkNMSVlTaTlOSmVzWFJWc05s?=
 =?utf-8?B?ZWp2ZlN0L2hLQzFsOTd4aHN3ZWV5YmFWL2xMVStLcWd4R3BJSlBVc1hiSFNK?=
 =?utf-8?B?aW1yL3V0T3p0YUVxQUxxd2V3T3M1QXlzNUFtNndleXROZlRhV1VvVk9kdHA2?=
 =?utf-8?B?ay80Q0h4M3E0UnNDWU5tM1hiVFlqNXVReERONzZvUWVHd0FlazFDamRMU0l6?=
 =?utf-8?B?UWxkQVExcjdnQS9pTklyYVk5cDBtcURNVHNCcTVMcXY3NWtCamdSNXdFeFNy?=
 =?utf-8?B?eVVZYnQvUWRWT1BYMFBLWFRiOHlRbkRJc2wzNUNJWEtOTUNobHFpZ1ZBbWZG?=
 =?utf-8?B?ZlU1elhzbVQzZlFHMitVYUVaQTZwZVVGU0F0K0xtY1ByakdML05OZkRNWHk5?=
 =?utf-8?B?dHNveENMdmtKNVRNL0FBSkdhQUJUMFNlQllKckJ2T3JYV3FYNTA0SEhRWGZk?=
 =?utf-8?B?Wkpqd05zVHNIRW5UWEhwVzNIT24zUjhFcGZXbE1Uak96YlJna0tneFN5Nncv?=
 =?utf-8?B?SGlxRm1LNGEzRERWRWwxVmcrUm85SEQ2c09RUGU0YjBCOHlqdXFLeGxxWEZK?=
 =?utf-8?B?NTdPekluejdvL0ZUNTRuazdtVVBKT2V3Y1lJdXo4bmVtRUMxYWYyc2xUV0w1?=
 =?utf-8?B?Uy9MY0I4L1lCdC84MHNnYXZMV2s0dXAyc3o2Yi9jckwvSDhXMFV0eHZvNWtI?=
 =?utf-8?B?UGpmWVlrNDlBc1ZqR1VNOTd0T3o1eHB0dkNQSDJnWUp1UnZJQWNoWmZQRlZE?=
 =?utf-8?B?b1g2SlRnbmFoN3lOOFR2Uk5zRDlwanhPZVlxNzFCdVlqTXUvUjhuZ3puYTVL?=
 =?utf-8?B?RVI4TUlPcmZueCtCVVQ5V29xU3YyaVpXM0tiOXpyWnNnY29OMjFmK1NIdWN1?=
 =?utf-8?B?bHU2TnVhK1VRTDJUTG9zQ3JQVjVia3QrakpLZnJvaGkwSFdyUzMyRFVQNVpG?=
 =?utf-8?B?QTZCKzBLam44Z3lvdHREZWJPbWhMRklsRjlzeU1BdmM2UnZnR2tJMEloZGhr?=
 =?utf-8?B?Zmh1NjBDTnNITjV0cFNMQ0hXc3JERW9PNC94TThZWEdYeEY4enNCUjk0QjAx?=
 =?utf-8?B?d2ZKT2tYcUZTTG82TjJ5a0NkeGE1ejJjckl1bzVrYkVFbHp0SnV5SlVOaUh1?=
 =?utf-8?B?WHgyQ2tJeHdIeG01V3VWbUg4bWlOQUx0dzZwZUMxNXZsWXBpcGFub0d6UmFD?=
 =?utf-8?B?NGZRNCttOVZHNVl2NUVoRTArZy9FY3BBc2gzNTQ1K2tMbHJLZUtLa0NhYllx?=
 =?utf-8?B?RWlrV1pqS3B1bDZZK2c0RE83N0tOazNzSS9DKzVWYVVEcm9OK2lyb1NpZjlk?=
 =?utf-8?B?SzdNQmRMZERjVG1XeEpLOXRPSlBlOGZEblkvL2QwUmhQZHd3Ry9VcWpXVGgv?=
 =?utf-8?B?UVNuNlZXYjNRU2dldHZNMUtCVHZRVUZOVEZEdW1LemQzeU9SUS9jOWZ0c3pP?=
 =?utf-8?Q?6/X19gHMZ/A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU5aUEpVSkhvQVlCekpkYm1JNDBKVEw5ZkNnNml3QmRuM1VVa3ZtM3BXZDYr?=
 =?utf-8?B?SHBiVDJTU2drR3BXM1B6cUZ2Wng3TTQ0MTVRN2ZUSURvUDBPWEZyUUVSbVpu?=
 =?utf-8?B?SENibXBpZDhINEpYYTI1bW5JWXRaMVM0NDI1TkhZR24wa2hsQ0pzTEIvV0ww?=
 =?utf-8?B?Mi9wMUxkUFZVREcvOE5rWkRpRzVsdk1La1BPNDlMYkdoYmlTdTBsL1UwdjQx?=
 =?utf-8?B?MFQ2OUlFQlQ0bVZHR2s2ZXJoU21USjgrL2xSTDdrall5WXhVMEE3NTNCSXkz?=
 =?utf-8?B?UkkwUG9PVk5zT3Avbm9mSUJZRW1RMmN4OUo3Y0o3NmdOMkhKR2t5Vlc0dHAx?=
 =?utf-8?B?ZWRTTG9HVVIrQ0dLN2kvRnk2a1lXd1M2emFyK0hicEhDMnJ1Zi9iMTZmRVVa?=
 =?utf-8?B?NHg2QU9weHI0emNtcmliYjJtWFN3d3Z5czExNlB5MEJGbm10N1FTSXJGSmdF?=
 =?utf-8?B?NVFnMjhpMGFzS2dxZVZacGFVQTlYZlRxSnh3ZmVITjU5blpmcHNSeVlSaGhm?=
 =?utf-8?B?WHZnaUxwaHNWSlBoOWhIT203U0FZUXRqZmJJUVVENmJkUi9aNlA4T1NkdzZ5?=
 =?utf-8?B?cjNpeXlENE9NaHNXelJZeU9wR2VncmhBSk1aZklGQkt5TGwwMUZ5UXI3bW5S?=
 =?utf-8?B?Qi9NdTErMmVCOTZHb3IxdXRQT0ZoU1NlQjR3bW5YSDRWSVpHeGEvT1Q0dk1z?=
 =?utf-8?B?ZXdMRkUyL3dlNTBXa2hoRFdIa3hPSlU4aFR0OHBPbnZhRGZEVW9QTFdUL1Fj?=
 =?utf-8?B?VXNIMDcydlFDKytwVUxFL1gwWVBQVENJRmU2NWRBak1CNkZGN0VnY01UL1RJ?=
 =?utf-8?B?WjNZaVpzMzh5dFUrTG9NRTBoVjljd0Y4MGhEVU1qTEplOVorV2N4UUM5ek9j?=
 =?utf-8?B?bisyOTNqQmRYL2JxcVd0RUl0a0piNXN5YUZJdzNJcG1HZWdQMWhGWW1Ed3Nk?=
 =?utf-8?B?Z3lKYnB0Slc0RmhOTWZWUWxMWmFWR0Y4Ly9IdHQrbW5IK2RWdGphSGlzbG5F?=
 =?utf-8?B?TFZMMnZEbm9XTnQwQ0RrelRCYlFzazJsYjY0RGlETG13UTRGa01LUTlGZFFs?=
 =?utf-8?B?MGpvVk9uVEYreDNISHppWnJqRHlFdXJ0dTN6WmsvKzFIRFZrcWF2K2YwQnhV?=
 =?utf-8?B?VmduVWcvRzZIVldpYzZpaUJnUzdyQVJNWXlNZEcvd0ZjK2cyR3gwNmdtOEFu?=
 =?utf-8?B?NUc5bm11anZLak9kRFdXWi9LMjdXa0poS1l4bUhpTGthWXR2d281cVY2STI3?=
 =?utf-8?B?cDFJSDFRdENaQzFEdjNqRjBEQVYzaUdBbUdLSFA0NTJNRXJ6OWNwRlF4cjVQ?=
 =?utf-8?B?ZzNWUFZMRDBmZkJ5OHNOZlhsUzNBbkRpb0NaUitabWZWUS9ML0h6Q205aWRZ?=
 =?utf-8?B?QWx2RWtaTnNvMFpUUXgvU0JxY04zeDdxN0NyMTdTVjZnekFjWlQ0bEZSTXFh?=
 =?utf-8?B?cTkrMVNKeXB1NmFocXI1S2J0emJPTDRPdms2T0xKRHltTWZiaDBTV2xsSFR5?=
 =?utf-8?B?K24yc2twRkhkNi9KMm1NaWxRanQ1aG9CWERmVGdDb0FLSy9OVlJ3SGJTaHJG?=
 =?utf-8?B?d1NFU2lkUGtXRU13cHlnRVA4ZUpJQjNUc3BNcVo4RFZUSzJXL2tSaHRPVG5T?=
 =?utf-8?B?REpYYWlSZjBTaEVVTTFYTWo1ZzJ2NTdvRjROZ2JWNU1DZUVPc0hpd1FEQmpU?=
 =?utf-8?B?VnVoNVdDKzdFd3ZRYlZlZVVHTGJqSjBvWk1kMVIwZ1BFOWJPQ0RLZzFCQ1dY?=
 =?utf-8?B?VWovSk5HV0NhckpNd01KbTlmT21HbjZIZEJBTUM3MHlLQUdLa2tJRjZJREdW?=
 =?utf-8?B?UGo0VlV5MTVRMXh3REF2SEt5anEyWDVLMUlMWGhZem1ENVBoYnYrNjFmZmFm?=
 =?utf-8?B?T1hjWWpOSTF5SnFrd01IdDhkU3ZOa0pCSFo4VXI5RU9JRXBkejQ3YSt6NEd0?=
 =?utf-8?B?UjNKT0JvRTZadHN6NWVrQmNXMEpsNGZQVlFLQTFZMTljbDNMWlF6NWZUUzlL?=
 =?utf-8?B?ZFJqZ3lIREVOQkU1ODJBZGxOWXJ3Y2tuSDFzbVNwdklYSlBsTjFQemhVRE8x?=
 =?utf-8?B?ZU9DdkYrWVFUK1pRRUtNcjByZEc1NVQzZUdrb0tIdlhMK0FURHlCMldhQWdo?=
 =?utf-8?B?Q2JpRGFaaWpPMmJRbGt2R3lqanZlcS9sWlAvc2ZmajdmR2FsRzBqZnpzSXZM?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5091ef-071b-4eb5-3915-08ddb3e2e560
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:22:05.2822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9jEPtiBssnLWs8130YdQ/pO53Js0talmBz5v9LK97PysSATAhK1r5xbR3+7INC0nFZ8dYPPAx6X1vzkVht71iqlwV/i8Np9F37SViQkf+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8795
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

Hi Arun,

Thanks for reviewing my patch.

On 6/25/2025 3:57 PM, Murthy, Arun R wrote:
> On 20-06-2025 01:35, Naladala Ramanaidu wrote:
>> At higher refresh rates, there is a possibility of flips being
>> submitted during the evasion window, which can result in one extra
>> frame and cause the test to fail. To address this, the test has
>> been modified to calculate a pass rate based on the number of
>> expected versus erroneous frames. A threshold of 85% is enforced
>> to determine test success.
>>
>> v1: Patch #2 and #4 merge into single patch. (Karthik)
>> v2: Address the regression failures.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_flip.c | 31 ++++++++++++++++---------------
>>   1 file changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>> index ca31ef7dd..94a414ba7 100755
>> --- a/tests/kms_flip.c
>> +++ b/tests/kms_flip.c
>> @@ -309,6 +309,7 @@ struct event_state {
>>       unsigned int current_seq;        /* kernel reported seq. num */
>>         int count;                /* # of events of this type */
>> +    int err_frames;                /* # of unexpected events */
>>         /* Step between the current and next 'target' sequence 
>> number. */
>>       int seq_step;
>> @@ -677,7 +678,7 @@ static void vblank_handler(int fd, unsigned int 
>> frame, unsigned int sec,
>>       fixup_premature_vblank_ts(o, &o->vblank_state);
>>   }
>>   -static bool check_state(const struct test_output *o, const struct 
>> event_state *es)
>> +static bool check_state(const struct test_output *o, struct 
>> event_state *es)
>>   {
>>       struct timeval diff;
>>   @@ -706,7 +707,8 @@ static bool check_state(const struct 
>> test_output *o, const struct event_state *e
>>           es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
>>           igt_debug("unexpected %s seq %u, should be >= %u\n",
>>                 es->name, es->current_seq, es->last_seq + o->seq_step);
>> -        return false;
>> +        es->err_frames++;
>> +        return true;
>>       }
>>         if (o->flags & TEST_CHECK_TS) {
>> @@ -727,16 +729,16 @@ static bool check_state(const struct 
>> test_output *o, const struct event_state *e
>>                     es->name, timeval_float(&es->last_ts), es->last_seq,
>>                     timeval_float(&es->current_ts), es->current_seq,
>>                     elapsed, expected);
>> -
>> -            return false;
>> +            es->err_frames++;
>> +            return true;
>>           }
>>             if (es->current_seq != es->last_seq + o->seq_step) {
>>               igt_debug("unexpected %s seq %u, expected %u\n",
>>                     es->name, es->current_seq,
>>                     es->last_seq + o->seq_step);
>> -
>> -            return false;
>> +            es->err_frames++;
>> +            return true;
>>           }
>>       }
>>   @@ -1233,17 +1235,16 @@ static bool check_final_state(const struct 
>> test_output *o,
>>        * those use some funny fake timings behind userspace's back. */
>>       if (o->flags & TEST_CHECK_TS) {
>>           int count = es->count * o->seq_step;
>> -        unsigned int min = actual_frame_time(o) * (count - 1);
>> -        unsigned int max = actual_frame_time(o) * (count + 1);
>> +        int error_count = es->err_frames * o->seq_step;
>> +        int expected = elapsed / actual_frame_time(o);
>> +        float pass_rate = ((float)(count - error_count) / count) * 100;
>>   -        igt_debug("expected %d, counted %d, encoder type %d\n",
>> -              (int)(elapsed / actual_frame_time(o)), count,
>> -              o->kencoder[0]->encoder_type);
>> -        if (elapsed < min || elapsed > max) {
>> -            igt_debug("dropped frames, expected %d, counted %d, 
>> encoder type %d\n",
>> -                  (int)(elapsed / actual_frame_time(o)), count,
>> -                  o->kencoder[0]->encoder_type);
>> +        igt_info("Event %s: expected %d, counted %d, passrate = 
>> %.2f%%, encoder type %d\n",
>> +             es->name, expected, count, pass_rate, 
>> o->kencoder[0]->encoder_type);
>>   +        if (pass_rate < 85) {
>
> For now this magic number 85 should be fine.
> But we need a justification for this magic number or calculate the 
> frames close to the evasion time and exclude them in our calculation.
> Adding a Re-visit/TODO would help in keeping an eye on this.
>
> Reviewed-by: Arun R Murthy
>
> Thanks and Regards,
> Arun R Murthy
> --------------------

Sure Arun, i will add below TODO in comment while merging

/*
  * TODO: Review the use of the hard coded threshold (85).
  * This value is currently a placeholder for the acceptable pass rate.
  * In the future, we should either justify this value or refine the logic
  * to skip frames near the evasion time.
  */

>
>> +            igt_debug("dropped frames, expected %d, counted %d, 
>> passrate = %.2f%%, encoder type %d\n",
>> +                  expected, count, pass_rate, 
>> o->kencoder[0]->encoder_type);
>>               return false;
>>           }
>>       }
