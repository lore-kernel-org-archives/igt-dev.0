Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BA9C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28DE10E4E0;
	Mon,  7 Jul 2025 16:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdmbrqvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4C10E4D2
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751904440; x=1783440440;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eS7t/HjQtvz4S/LBMxy2cw15WPY1EcUkxBPgmun+wsQ=;
 b=gdmbrqvTZ+Z8u+pdA/evGAje/CEY+vE9fRK2W7TCzRgBMDos3XZ8YZ1T
 x0kWpwGyXSuVeD2EYwDeEajpmDdwLNXtCI012AY2eF4oBLp/HvwWrx3Uq
 Aq9mvtt9KgSvHx+MHzZse7BG7Oqk07fA4JO+p+j/HmNbEViyUtAvdojcu
 QjIwo38QjENwj8eybmQnkjXdHgArmxIT04f1r3MiWlNqRaPMYrbREtg0P
 ll+MjDqmw7eF7YCLnfv6gbPTrLmQE1nZrvW0RO/fx0n0ATYkK3GrbHSMJ
 hUHyNxRJu0DnORzjFDAmQzeIFjiLxG8ikdO9W0JJM9fOgohgc78OtdmJR g==;
X-CSE-ConnectionGUID: RcOemrfxRgKFukKjaYgVLQ==
X-CSE-MsgGUID: X4xHFu3cQHWAmy+jvG+Gug==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64721488"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="64721488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:07:01 -0700
X-CSE-ConnectionGUID: 04Uc+G7ZTbGJ6fBeiU0e7A==
X-CSE-MsgGUID: y9y7wWpbRxuXjTXQJI0lHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="154654044"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:07:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:07:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 09:07:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF4r/0POjyZN9LVO5GmwRwWWakS+ZrxeUSk81rYsqLax7p+Y+eKCPOzIc0pJnm4EIemFm3jJGYBQ6GKSMzCdob6zWPxf8XmFKLfAQA5LqRIBdUq3EnqPddGZApt/lsefeaU2LH+EmBHZidrNj6cssCGsOlfxIQeT3BQUuzdw9CJFL4H3kMgoBEjym2BDZ14uqSo9WfXXNCL0l/PZcGK0owVxErT/0PL/LAqD2gUQtpqjQ3NWPfwsW5ydBtgO6xZ1fcOtSwh8nDWh8T+Why98KDyCf7pwACsm3dFdZg4r70kGgZFXK19kPjSMZl/iYS5G5+JlPu6PICMkLtn3AqCK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtraME2QJkwwQ0YIaDt7wrkrmYoihWhNRloAlRFfEUI=;
 b=koB5sy0pd4mqUG3OFUpYJUP4u+T5K0FwHLK/9WMGj0gt0k9IM86sEeAtZrDhqZl7E7KXzIPaV6wq3sKMQ1iz0055JZHsdY9a3FXAAIwgMu1NZY4Ob/AXjNXQDG+YmUTmXLCCar5Kthvk3YFZ2Pw2ZlivWIQbC21EoSfHB/kZ9kQ/Qe09yWLU6ZSy41DV0bGMFiX38xfTJhTZS3m/GaggJT3JiBmbTTYZetgkjewsQGmgw30HJVwZWwa5iOBZXQB4t/e3guEaLtL6KTBPS5UbUylQOX8D5ojvrsDn2/D5egw59kO0/3/1xFuHU4Brst8PBCsGS/e1k2vWpre7t7VBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS4PPFE396822D5.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 16:06:44 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 16:06:44 +0000
Message-ID: <4a2276ff-0f82-46b1-9e07-19bf49a89ac6@intel.com>
Date: Mon, 7 Jul 2025 18:06:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib/gpu_cmds: expose num_threads_in_tg parameter for
 tests
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <gwan-gyeong.mun@intel.com>
References: <20250701135307.68147-1-jan.maslak@intel.com>
 <20250701135307.68147-2-jan.maslak@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250701135307.68147-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0274.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::41) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS4PPFE396822D5:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f45fa2a-0b52-4d4e-35c5-08ddbd704427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXRTc1lhQ1lLZWpxZW9VTGcxS1dLR1lRZHFETXBuM2lZUmlCWmZOU1ZEbWFF?=
 =?utf-8?B?MlRYVnNjK3V1V2VMQ05wazhYNEd2KzhFV0NFS0lEL0dSQlVLUnhDVjlBVm5i?=
 =?utf-8?B?Yk0zVFc4MVArOWg0Z2Z6emZaRW1oeGhvSlV1aDBNYU5Kd01oRXplWHRTeUFZ?=
 =?utf-8?B?cFRVRHJuMnk3QUNTeTU1Y2FuRSs5NE5IOVBtZk1aU25KTS9LRUxKcjBvRFFU?=
 =?utf-8?B?ZGJibG5qN24ybGkveEZWZnhlSFpsZGhMZ2E2QWpBQzk5L0lIcVF0dkdqSFJZ?=
 =?utf-8?B?T3huZzZLQm9lMFU1T21JSEhqSHZjYnc4WDBkUWJYYlFBYk9kdW5pbGhqRnFt?=
 =?utf-8?B?Z2NxWGdDMGl2RDRoSHpRY0g3MGhaY1pnYWhvVDJBRVR1RDdRSmFSejNZcFFP?=
 =?utf-8?B?STBQaUs3VG9BMnI4SXpBS2NJZkx2M0dmSnZzUUJ1NW5UQi9NQy8vOFdLQnRC?=
 =?utf-8?B?b2JhaW5JcDZvSEY4a2RHUFhURm9Sd0tGcmg3UEUwbDVETjFsbndUWHJnRUJx?=
 =?utf-8?B?bnBVUHArMkZxZGNzK1pmZzZaQXhmd0VhR3VtVTVCQzZSMkFUMW16OVpjVWhm?=
 =?utf-8?B?aHlkV05saVhoem9HMUdhV3VlT09YaFcweCtIRXR1NlBNK1oyd09VVjVrazRN?=
 =?utf-8?B?TDRTVUtiaWY4S1MwYldYWmdjZVF3WlJJVTNSZzlJY1B0eHNmRFZES1hxUVZI?=
 =?utf-8?B?cXNLcnVsbndQckFNSVVNampNVUlvUnkwZmRWdWEyWUxrbHV5RUIxNFQxdmJT?=
 =?utf-8?B?a0kwdkQ3TEozSlZtVnBuQ0hVQUNvRFNoUEZ6M2tlbjRMejdsTXZ2UXZmeUtM?=
 =?utf-8?B?V0NjYjZpcTVsWHRxdWNKbTZ4TEx0ajhQUXdyWTVpYVJqUUVSNkpsYUFHSjN5?=
 =?utf-8?B?ZjZ6ZS9IQmg1dStKazJTVzNsdVhvVVN4NktrbnRiT1Jjai9jUDhweGx6d0pT?=
 =?utf-8?B?TVZGZkx5a3NZMDY1RExZWmx5SkRtSk1PQkp6YzlDMmV3a0RiMG9KZXQwN2tZ?=
 =?utf-8?B?d2w4WkFIZm5hM2k5aFpEaDV0d0VzNXFqVVlDUWZ3WTBRY2xxRDRTU2ZOU2E4?=
 =?utf-8?B?WFdlbGNtRUxhSUxVN0VIeEZMN3FLZHZmOGs3cTFleE1Dd0sxcHRkdlhmVUxH?=
 =?utf-8?B?aDRvcS9pMHlyeVhGekdlbWZ6Q3pRSW1GWXhCZm1iTU1aNDY2VFN4YUdQM0xF?=
 =?utf-8?B?NEpzcGFwUWMyTFJINVhMVmRuSTI0a2l6bWlrREVVSWxVREpZN2U0N0w3dnVu?=
 =?utf-8?B?bitNVllLbkFEY3NIQmlKZU02NnZnMkE2Sk9DTnoyMUJiNnN2ZFhKUkdkbHpu?=
 =?utf-8?B?ZllzT3R2RnZvaGs3Z1dJSyttNERvcTljbEJrQkpRNVZKVnpKaWVqU043ekZj?=
 =?utf-8?B?SUJVeWQ2VnZINVMzd0FFcFNvTWtwV2I2SWZ0MlJldnhnVkl4NklOZGxEckF5?=
 =?utf-8?B?bFRvZlFJWWljRUJMVCtBRzZBaXNoamRKQURyanRHK1ByNElwZVZoeFJSaWpR?=
 =?utf-8?B?V1B6c25IRysxOU0yeFJHcFpMNWNoSEVCSHZXUE5CZmIzZWhTaE9yb1hCZDVp?=
 =?utf-8?B?OWk1Qys3Q1F2akNwaUZwZklhODc2c1VRUGRrNGtoVHhQRXloeHArUlZUMklX?=
 =?utf-8?B?eFVnNzZobVVTcENQNWZzaWJwZWZZVGJxTlZhSDZLalhDYi9VL011OFNUUDl2?=
 =?utf-8?B?b3N0UGdSa1BnR1lWUUl0Y1dCSFFmeGpHcnpPYXVxVm00V05LMUxTSXJheHdm?=
 =?utf-8?B?aisyZVBHdWNWTUNXQlJHRFoxYVVyaHNtbmVZdHdHRGFOOTJvNmlOS3ZxOGdC?=
 =?utf-8?B?bThQT25ieURaQnBPa1g4YjRMQWxPeTNQNENXVXBEb0xiajkzd2EyZmRnd00v?=
 =?utf-8?B?SU5OV2M3dTZ1NUdyUVhtODhHejB3dmpkSTFEUkx6NjA4Rmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STlzWFo3bDNNN1pRalVvN2Fpd28xbk9MVStIRWROUzBuc3BDanlROS9BcnAw?=
 =?utf-8?B?YkdqV2kyOVA1NkYzZThBTmVmTVJ4QkZ4MExmUXArbDAvRnBzSTdHcHRtWWZP?=
 =?utf-8?B?UmhlNWJtOC8vdHFCeVhLa080RnVPdldpK1pGUDlZdTZmWUQyRkFwOGp6Z2Rj?=
 =?utf-8?B?R2pGRy80S3FpUEpoZUl5Y0dmTDR1bUpTbWgvVk9CYko5NkJDUTlzaU9ackxI?=
 =?utf-8?B?c0lENmJmbVlCQ3k3SStteXhzZlhneXlJZXhzREJHWmdrVDFZeklETnltVHE0?=
 =?utf-8?B?WWRiZUQ3T3hGazVuR0k3WGt5OWh6YUJiakFxWSs0Tk0yMG5Xb0tnc2RBTUFO?=
 =?utf-8?B?bEJ2TXJNTXd1V0VxcGdINGY1NFc5bWxxZUJYck9SeGl0Q0dDRWF2Qjg2T1RI?=
 =?utf-8?B?NlZWNjlhL2puSkVta1Vqd0E4WW16VTVWZG5Ca0tNWUNKRHk0YXBYNGxJNXhm?=
 =?utf-8?B?VkFYb2RDQlRsQ3l1dllGWCtyOHFPYnJaeFJhSE5PLzc5WHRTTmt4Z2xhcmR3?=
 =?utf-8?B?elNlM2lIbkRHcUliZWlrTmIyUTFXTEttUkxnT2JSUXhzcEg2OFNuYm5mUlhY?=
 =?utf-8?B?WjdzT2VmZStZR0FnanpsbWRyOUx1UHQrUmRyNmhObVZUeUpmT0MxRmttMGVP?=
 =?utf-8?B?Q0FqbERSZzhNakFkRy95NUpYc1poZ1NiWjErNHloa2xGd09yKzVQODFIZzEx?=
 =?utf-8?B?NTF1cUQxaXQ1TXJnVUQyRWt3YzB1Sis5a2VEK1ZYNytZLzMvQUJKOC84MWxU?=
 =?utf-8?B?VkxaT2ZBWmQ1RFhrL3ZxWldKdDR5cmF4bHNvbTlqZFdueU1pQ3h6UlJHTlhU?=
 =?utf-8?B?OVpSczNqd2pPSlluZXNhNnlFSVFncVRPRlBtc0tDRXF3RFZrdUxjbFpQcXRO?=
 =?utf-8?B?VXE3RlNaNW1FZFJWVmhTT3lRVTY1RHhUN3hOYmR2dk1UamtoT1RLZnFsSkl2?=
 =?utf-8?B?MkU1eFFUQlRIV05KQUhNY3N2cVBsd1REeHBGc1BYKzE0dXd0Z1ZpaU9ZVU5O?=
 =?utf-8?B?d0NxRjUxaG5yMWYzejVJc0xSODZMbk5PUVZKNUFKRDdreWM2MzJXVTNtTGNa?=
 =?utf-8?B?MDRCelp6RGJtL0kxQVBFeW1YWHZEVUdrNjFqU0l2K1lvYUMwQUcyaGY5dXJl?=
 =?utf-8?B?dUMwNEFlaVlPanhUSnZhWFlZL2txMmdhQ3gwZnFCSTA0UTdYWGtnaXgzMjFQ?=
 =?utf-8?B?S3FnTkdJWnlPeURaQ285WG1weTJIRzhHNTN6cXhSbi9MSFRYcTN2K1QyYUxN?=
 =?utf-8?B?ZlQ2ajA3VGpNa2J2VlhxNTQrQVBnRW5sL2lhTE5ZOFlQRHdHbE5iQWFkVW02?=
 =?utf-8?B?NTJKdm5KVGVuOGZEWXlMeWhEV01xaHdzcVVFMTdBdktWVHNwQWo1K0xZVkhP?=
 =?utf-8?B?R3pBZFovd1ZPT3Z0R3VLU3B5ckd6c1p6YjZ2VTJpdW51YXpENTJzVmZ4L3ls?=
 =?utf-8?B?ZWNFbmZZZkFOSEl1REFTZFJqRHhxQy9zRk9tbTVjRGVmWlRIR3FoZC91OEJZ?=
 =?utf-8?B?cEQ1VDR6UTZiRjRBdTVUeEVxNjhVbzBxUmk0QWJLdkZwRHJlMTZwQ0dCL1Vt?=
 =?utf-8?B?ZjBJRDJveW9vamU1Y21GclMwd2U3aGJKMm9QM1lpNGhCZFozNEIwbzFzc3ZC?=
 =?utf-8?B?bHk1bExhR0tBa1VtZ3ZtbE9DMElvWW52MDkwSk5SSmx0TU0xUHQ5STZzWGVu?=
 =?utf-8?B?eHZVYW1ycHVJcUN3OHU5QzhjS2ZHb1RWZ3RWVjZCY29XM2Ztc0JEZDBlbXdC?=
 =?utf-8?B?Q2Y4RGtOUEZPZjNSL0lPUXhETXd2TjVyWkY0Y2NXaU9KTWFXNGd1M0xvR05P?=
 =?utf-8?B?Yy9TcG8vcjFVR3VrZTdQdjEvbkRMb2dOMmtFbDBnaGtJUlZmY2FRNEF6WnhH?=
 =?utf-8?B?RVdhVzZUZWFpN0NHNHdpYnZNeHQxc3lYN3Z6enFyS2Q4VjZXNmNaTEIzSEty?=
 =?utf-8?B?clNEUldjMGsxd0NTa1NrWlRNbzVaZFRVNGkwNGRJL0s4am8rSkx3Q1d3dG1O?=
 =?utf-8?B?OFlpcGp3aXhXT0lZU1NFN3lJWjhWTGdJL0NpeGt4UVJPMUViSFQ2Y2tIajhM?=
 =?utf-8?B?S0NYc0ZtK2V5WnRRdktBNm9xVEUwajFsaDFqWWpKdm1nb054Yy9LTlVaclM2?=
 =?utf-8?Q?HV2nXCkgqc1YTWuugMld6B/tG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f45fa2a-0b52-4d4e-35c5-08ddbd704427
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:06:43.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBI6FwfU+yD3I4fEWH9eMTWkLlko6JEeYbDVGITNtzp7vfei7EyMbZF/TByMePMis706jowa/UFoT903OqSZww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE396822D5
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


W dniu 01.07.2025 o 15:53, Jan Maslak pisze:
> Expose parameter num_threads_in_tg in (gen8|xehp)_fill_interface_descriptor
> functions, so that it can be set from the tests.
> Also update rest of the code to accommodate this change, passing in
> the default value - 1.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

The patch looks correct. The problem I see is inflation of parameters - 
adding single parameter requires touching signatures

of multiple (too many) functions just to allow passing the parameter 
from the top (gpgpu_shader_exec) to the bottom of calling hierarchy 
(*_fill_interface_descriptor).

I see few solutions to this:

1. Minimal one - leave *_fill_interface_descriptor as is, and fill idd 
directly in the caller,  like in case of 
idd.dw02.illegal_opcode_exception_enable.

2. Better - add num_threads_in_tg to struct gpgpu_shader, on shader 
creation (gpgpu_shader_create) set it to 1, then in test adjust it 
accordingly,

and in *_gpgpu_execfunc copy it to IDD (in 
fact illegal_opcode_exception_enable and exceptions fields are passed 
this way).

3. The best - re-think abstraction model for shaders and propose sth 
better than 2, if possible :)


After writing this I think the minimal should be 2, but I am open to 
other suggestions.


Regards

Andrzej


> ---
>   lib/gpgpu_fill.c                  |  6 +++---
>   lib/gpgpu_shader.c                | 16 ++++++++++------
>   lib/gpgpu_shader.h                |  1 +
>   lib/gpu_cmds.c                    |  8 +++++---
>   lib/gpu_cmds.h                    |  4 +++-
>   lib/media_fill.c                  |  4 ++--
>   lib/media_spin.c                  |  4 ++--
>   tests/intel/xe_eudebug_online.c   |  2 +-
>   tests/intel/xe_exec_sip.c         |  2 +-
>   tests/intel/xe_exec_sip_eudebug.c |  2 +-
>   tests/intel/xe_exec_store.c       |  2 +-
>   11 files changed, 30 insertions(+), 21 deletions(-)
>
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index f83eee5f2..09408112c 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -203,7 +203,7 @@ gen8_gpgpu_fillfunc(int i915,
>   	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
>   
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
> -				gen8_gpgpu_kernel, sizeof(gen8_gpgpu_kernel));
> +				gen8_gpgpu_kernel, sizeof(gen8_gpgpu_kernel), 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> @@ -254,7 +254,7 @@ __gen9_gpgpu_fillfunc(int i915,
>   
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
>   							      kernel,
> -							      kernel_size);
> +							      kernel_size, 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> @@ -350,7 +350,7 @@ void xehp_gpgpu_fillfunc(int i915,
>   
>   	kernel = __xehp_gpgpu_kernel(i915);
>   	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
> -				       kernel->size * 4, &idd);
> +				       kernel->size * 4, 1, &idd);
>   	gpgpu_shader_destroy(kernel);
>   
>   	intel_bb_ptr_set(ibb, 0);
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index a63af0d23..b83e645e3 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -99,6 +99,7 @@ static void
>   __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>   		      struct intel_buf *target,
>   		      unsigned int x_dim, unsigned int y_dim,
> +		      uint32_t num_threads_in_tg,
>   		      struct gpgpu_shader *shdr,
>   		      struct gpgpu_shader *sip,
>   		      uint64_t ring, bool explicit_engine)
> @@ -113,7 +114,8 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>   
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, target,
>   							      shdr->instr,
> -							      4 * shdr->size);
> +							      4 * shdr->size,
> +							      num_threads_in_tg);
>   	idd = intel_bb_ptr_get(ibb, interface_descriptor);
>   	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
>   
> @@ -162,6 +164,7 @@ static void
>   __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>   		      struct intel_buf *target,
>   		      unsigned int x_dim, unsigned int y_dim,
> +		      uint32_t num_threads_in_tg,
>   		      struct gpgpu_shader *shdr,
>   		      struct gpgpu_shader *sip,
>   		      uint64_t ring, bool explicit_engine)
> @@ -176,7 +179,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>   	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
>   
>   	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
> -				       4 * shdr->size, &idd);
> +				       4 * shdr->size, num_threads_in_tg, &idd);
>   	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
>   
>   	if (shdr->vrt != VRT_DISABLED)
> @@ -241,6 +244,7 @@ static void gpgpu_alloc_gpu_addr(struct intel_bb *ibb, struct intel_buf *target)
>   void gpgpu_shader_exec(struct intel_bb *ibb,
>   		       struct intel_buf *target,
>   		       unsigned int x_dim, unsigned int y_dim,
> +		       uint32_t num_threads_in_tg,
>   		       struct gpgpu_shader *shdr,
>   		       struct gpgpu_shader *sip,
>   		       uint64_t ring, bool explicit_engine)
> @@ -253,11 +257,11 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>   		gpgpu_alloc_gpu_addr(ibb, target);
>   
>   	if (shdr->gen_ver >= 1250)
> -		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
> -				      ring, explicit_engine);
> +		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, num_threads_in_tg,
> +				      shdr, sip, ring, explicit_engine);
>   	else
> -		__xelp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
> -				      ring, explicit_engine);
> +		__xelp_gpgpu_execfunc(ibb, target, x_dim, y_dim, num_threads_in_tg,
> +				      shdr, sip, ring, explicit_engine);
>   }
>   
>   /**
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index ca996d574..411ad6292 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -60,6 +60,7 @@ void gpgpu_shader_dump(struct gpgpu_shader *shdr);
>   void gpgpu_shader_exec(struct intel_bb *ibb,
>   		       struct intel_buf *target,
>   		       unsigned int x_dim, unsigned int y_dim,
> +		       uint32_t num_threads_in_tg,
>   		       struct gpgpu_shader *shdr,
>   		       struct gpgpu_shader *sip,
>   		       uint64_t ring, bool explicit_engine);
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index a6a9247dc..5c6a6e632 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -424,7 +424,8 @@ uint32_t
>   gen8_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *buf,
>   			       const uint32_t kernel[][4],
> -			       size_t size)
> +			       size_t size,
> +			       uint32_t num_threads_in_tg)
>   {
>   	struct gen8_interface_descriptor_data *idd;
>   	uint32_t offset;
> @@ -451,7 +452,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
>   	idd->desc5.constant_urb_entry_read_offset = 0;
>   	idd->desc5.constant_urb_entry_read_length = 1; /* grf 1 */
>   
> -	idd->desc6.num_threads_in_tg = 1;
> +	idd->desc6.num_threads_in_tg = num_threads_in_tg;
>   
>   	intel_bb_ptr_add(ibb, sizeof(*idd));
>   
> @@ -912,6 +913,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *dst,
>   			       const uint32_t kernel[][4],
>   			       size_t size,
> +			       uint32_t num_threads_in_tg,
>   			       struct xehp_interface_descriptor_data *idd)
>   {
>   	uint32_t binding_table_offset, kernel_offset;
> @@ -931,7 +933,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   	idd->desc4.binding_table_entry_count = 0;
>   	idd->desc4.binding_table_pointer = (binding_table_offset >> 5);
>   
> -	idd->desc5.num_threads_in_tg = 1;
> +	idd->desc5.num_threads_in_tg = num_threads_in_tg;
>   }
>   
>   static uint32_t
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 846d2122a..20e35f9bf 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -55,7 +55,8 @@ uint32_t
>   gen8_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *buf,
>   			       const uint32_t kernel[][4],
> -			       size_t size);
> +			       size_t size,
> +			       uint32_t num_threads_in_tg);
>   
>   uint32_t
>   gen11_fill_interface_descriptor(struct intel_bb *ibb,
> @@ -121,6 +122,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *dst,
>   			       const uint32_t kernel[][4],
>   			       size_t size,
> +			       uint32_t num_threads_in_tg,
>   			       struct xehp_interface_descriptor_data *idd);
>   
>   void
> diff --git a/lib/media_fill.c b/lib/media_fill.c
> index 88d83061a..a2f2e8666 100644
> --- a/lib/media_fill.c
> +++ b/lib/media_fill.c
> @@ -205,7 +205,7 @@ gen8_media_fillfunc(int i915,
>   	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
>   					gen8_media_kernel,
> -					sizeof(gen8_media_kernel));
> +					sizeof(gen8_media_kernel), 1);
>   	intel_bb_ptr_set(ibb, 0);
>   
>   	/* media pipeline */
> @@ -250,7 +250,7 @@ __gen9_media_fillfunc(int i915,
>   	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
>   							      kernel,
> -							      kernel_size);
> +							      kernel_size, 1);
>   	intel_bb_ptr_set(ibb, 0);
>   
>   	/* media pipeline */
> diff --git a/lib/media_spin.c b/lib/media_spin.c
> index d2345d153..2b81e99d1 100644
> --- a/lib/media_spin.c
> +++ b/lib/media_spin.c
> @@ -109,7 +109,7 @@ gen8_media_spinfunc(int i915, struct intel_buf *buf, uint32_t spins)
>   
>   	curbe_buffer = gen8_spin_curbe_buffer_data(ibb, spins);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
> -					      spin_kernel, sizeof(spin_kernel));
> +					      spin_kernel, sizeof(spin_kernel), 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> @@ -149,7 +149,7 @@ gen9_media_spinfunc(int i915, struct intel_buf *buf, uint32_t spins)
>   
>   	curbe_buffer = gen8_spin_curbe_buffer_data(ibb, spins);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
> -					      spin_kernel, sizeof(spin_kernel));
> +					      spin_kernel, sizeof(spin_kernel), 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 535f00818..0498be80a 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1116,7 +1116,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	sip = get_sip(fd, c->flags);
>   
>   	igt_nsec_elapsed(&ts);
> -	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, 1, shader, sip, 0, 0);
>   
>   	gpgpu_shader_destroy(sip);
>   	gpgpu_shader_destroy(shader);
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index 310526531..62fe48303 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -146,7 +146,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>   	struct gpgpu_shader *sip = get_sip(fd, sip_type, height / 2);
>   	struct gpgpu_shader *shader = get_shader(fd, shader_type);
>   
> -	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, 1, threads, 1, shader, sip, 0, 0);
>   
>   	if (sip)
>   		gpgpu_shader_destroy(sip);
> diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
> index e5b8ba418..b723b0b58 100644
> --- a/tests/intel/xe_exec_sip_eudebug.c
> +++ b/tests/intel/xe_exec_sip_eudebug.c
> @@ -138,7 +138,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>   	struct gpgpu_shader *sip = get_sip(fd, sip_type, shader_type, height / 2);
>   	struct gpgpu_shader *shader = get_shader(fd, shader_type);
>   
> -	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, 1, threads, 1, shader, sip, 0, 0);
>   
>   	if (sip)
>   		gpgpu_shader_destroy(sip);
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index bf22c3475..364169fdc 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -390,7 +390,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
>   	gpgpu_shader__nop(shader);
>   	gpgpu_shader__eot(shader);
>   
> -	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, shader, NULL, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, 1, shader, NULL, 0, 0);
>   	intel_bb_sync(ibb);
>   
>   	ptr = xe_bo_map(fd, ibb->handle, ibb->size);
