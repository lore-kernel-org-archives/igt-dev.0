Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B40ECFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 07:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400810E180;
	Thu, 27 Nov 2025 07:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6YBMDwB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF14210E180
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764228600; x=1795764600;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ekP2DE/JtuITqMEQ5qNwJZV+/bdMWX2RMB0Y4FuQiyc=;
 b=m6YBMDwBWX6buSgbuUPlqw/PeCPym7n9AguLUDXkkgrGH8t+Ntu+doUS
 uhqTQiMwIm4ExhkyrXZXUt0TFMf4u+Lzwz+ZfQowfIPJetUxUhHyaUEhA
 wsoo7vRcQBmryYdHo44OL0x1ky8rBZTM21NDYShdyT+AMVYGQA5+Ir5ds
 NGRP6A36hfxYSW1T2R9yOWW3/jOBH7TwxxUxGBwJM08Hofci6brKa1XyE
 VcIl+wf7Zaula3m0wuJ9slkxbr+XHNBf8a6Mp+zSH6hQfGVYfTIzBrjUS
 OkgD06R2FaC7B+CKDH5+khEIkOHYdqhG/8qMb8iDa9g1oGdPOig0S8fmD g==;
X-CSE-ConnectionGUID: B3x6P/6ERk6b47jJeU5Zhg==
X-CSE-MsgGUID: jJ6wfWYiTdygU+5Jl7aecw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76960891"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="76960891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:29:59 -0800
X-CSE-ConnectionGUID: T24B3fQESL6V6ogMZZceCw==
X-CSE-MsgGUID: /73UaZNnQNq7A6A2hXc2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193179560"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:30:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:29:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 23:29:58 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:29:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYUTIEAClEdvkaXEt1o6/b0nXl9gqf0jSeegoUE8AoChwP0bO+dtRiskX5szOjI8xBmKj5FA9DriQ/ygbarI4ZRsx5aANKxm8OlYOd/RihSIeI5LoSVdj8SjN+FDgARr/G+sR0xkpxv8HwRYPvbKvYZKGSWV7DyxuZDXSfQ1yIW3BjW6pE0Eh21eXpGRflcX1yJl18t/29IFEW8+9Jp8ASecYFX/bf3XZ25mRZZtBDnFm52ztA9r+JmWlyS6Y9zR2TKqY2wpQv9JAiRaXNdPkUXFwXJVW9vUnVAPYsIGTkk28DRc/u+XpPMlQdROIFa+j4d/Jk4fdqxJeW5XYRCWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wSlLUlSZL5FyX81yN8JHdYW+eT9a5y+83xuRlyPJCA=;
 b=uoI28uRYzKYvItAcQ/TofwMvOb2HRBcE4mJPgGmlLMI53/8wQc8QbM0dXLzHbjjLa4s0aPqZ7Yfu8wR1IKoANMY8tveB++MQfWIQ5uLALu5+IY2rNbJr6znovEeGZazVr1u3d2Fd0BL77i2KgBhS6R9EUtEIUioSqkQj4urhHw5YSpuAoGAzwGGelQkpWGcAzN7+/x2LGPLGR6Yw8JrNyUmzkHjBal37US+PxHfOyc6Ynio+MLxZswq8wRjPwjSPOyqDls+2oEbA9x+4pxdesKTPDKibvtExnrqAyPqNsu9VlqNn9IqhmQf9DNwbKYAhzWIHeuIgNT5YlXrV/2WeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 07:29:55 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 07:29:55 +0000
Date: Thu, 27 Nov 2025 07:29:46 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, S Sebinraj <s.sebinraj@intel.com>, "Xin
 Wang" <x.wang@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tools/intel_gpu_frequency: Allow printing
 by regular user
Message-ID: <dxcvl3oulbtgurrurezgv6l6ipopgtiw3a2tte7jyypybh4hzh@fjx7f4e563rv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
 <20251121193539.195005-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251121193539.195005-4-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA3PR11MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: fa75720c-0819-4dfa-f01b-08de2d86c324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3VKTUZrdzJxMkRUWkJKV29kZFd3dG5MSzFZWXRtbDdHRkk2UUpjekRSUGlu?=
 =?utf-8?B?K01CQ0FBU0pILzhaNXdjMEovSUtuNlYwck1BeEFFVGFHV0pTTUp0Q25tYThY?=
 =?utf-8?B?eGt0R2d2OWUrRzk2ZUI1Zmd2Y01GVDdqZ3VGZnZpeUhZK3NLSTFmSS90bVBm?=
 =?utf-8?B?VUtSYXkzM2ZCWjRNNXhWdWNnMGprenNsZWdhSTN3cmZ4Z3BIRWxCSkhBdWI5?=
 =?utf-8?B?SEhpWlpIaEhja0xwamlrb0h6WDJuaXUxcWdRZlIwV0svMHFKTlFLUXpLNlE5?=
 =?utf-8?B?NzdKT3BEeWRQOHJ3Y2VMZHJoK2dzRVBSZzZuZWgxTnIra3VEU0pCYmQ3Q0M4?=
 =?utf-8?B?emVLZUJsTlpETFVUaFY4WDFZaG9xQldnNDZrWlQzYWVId1Y4ZmwrMXpaZWxw?=
 =?utf-8?B?ZjJoS2x4aHZMY2hUMzZ3U0dYOUNRbENBN0Z1VXZMQnhRTmNHZTVEclVxRmRz?=
 =?utf-8?B?akdUTi9NcFkyaXExYXU0K2VQdWljVlNGeERwalRsV0p0OFZqdDdnZUJ4V083?=
 =?utf-8?B?RDJ2TTdnZy9XcjZETFU2UDlNVnRhWHJFRlAxZDFMU0Rmd2Q3VytUQ2U4OHhh?=
 =?utf-8?B?WEhMVXBuSWt6dEJHV2xCVzlnblc1UE5pMXRQdHptcGRac203cTBoTkZtYUdn?=
 =?utf-8?B?WDhVYXIrZXFJbm5pS2FEQ1dCblZrZ0hCT0YrUWpoL3cvczh1cVZPRy8yVGFZ?=
 =?utf-8?B?dXdiTU5YU0dXVnVVdUtCQnBZUGllTWFkRVhJTTdzblVscm5aZ3ljWU9VZWYx?=
 =?utf-8?B?NDVPSU5FWkpLbEhIMHV4R2M2YktSMFlITmxMTGVLcDIvQll1TXJRc0NGbVYx?=
 =?utf-8?B?ZWVqQUFhc3NoaUpnbDBCa2FnVlhJTG9DazBhd1FQdGhxd2NOTmxVV0VSQytS?=
 =?utf-8?B?Uzk3OXhPWlRjSlppODNsTSsvL2NBUjlNMldTRU5xa0pQZ0NmZjhiTkdsTkhr?=
 =?utf-8?B?aE1Lb3NEZjU5MERaYnZJa1J6UzFUbzQxazN5SUxLV3FUbHNYQk5uTjdRK2hI?=
 =?utf-8?B?cm00em9sWENWWXpSZFBoM1V2eTU3Z3ZqSWhMNFprd2JJTWY0bVZCbmVGM0JU?=
 =?utf-8?B?OXZEMVNLSmJLQS9haE9XRXlld1NJQVlORXdmYkRsem0rYnlsR3pqOFp2b3B1?=
 =?utf-8?B?dFBYbXM4b0xXdmphNUtWWFJyMHN2REhQR3h6QjI0UXZQblEybjFMS002N204?=
 =?utf-8?B?LzlQRkVJenkvdmNQWFhBc2xha0JsbXpRaC9LM0xNTW1DKzcyNmJzb3FSZjNQ?=
 =?utf-8?B?V1NYdnhrOWltUTY1aU5VTVE4UnlJR2hJQldmOXZnemRxSjNFVFlOSUlvT09o?=
 =?utf-8?B?aFQ3cUZ1VkZhbzJwZWZRZnlySWR4eHhiekpzbkswcEQ3NUtzZitGa0pvS1lD?=
 =?utf-8?B?MFgzaXVYZW1zMGhuU0FONFlGUytlLzRWQ2RMallvdmxQN0M3bmI3R2RiUVFH?=
 =?utf-8?B?OHl5aVhQNy9OZmZZbjc2b09IVkhrUS9STnAvS2gwbk01SEFSTGczYStsbDFF?=
 =?utf-8?B?cXoxV1hSL202ZmF0Q2ZJbHo1ZjhBM1NFOFoxVGJpcUtOd0JqRDVzVEhXOEp4?=
 =?utf-8?B?UHpPSENlN2tXVkEyTWw4QU5uQUI4ZnYvOUZYMU13Q0YwTms0cGlCekROaXRi?=
 =?utf-8?B?bFFEYlB4WWNzZkg1aWp0THFBM0xxcmlhZkZyb0RqakhtcE4vOE82WDlvRmNj?=
 =?utf-8?B?TTMxM3J4Mkd0dCtPZENXMk1POFZqU0JTMHhtU05UaElMRHhhTE1oVFVYd0JS?=
 =?utf-8?B?Q2YzQk03NkhocUM4Yit4Y1k4d0s5YWpKbHBPcnlGYXN4T05HOHIzSHJJcGtr?=
 =?utf-8?B?MnlOcklRbk9oZWpqRDZ6TWZHMmE2VytLWWJFK25GUkxDOU1CUGlOYkhmbHhS?=
 =?utf-8?B?dzNKdnpHTEJtMHVyeW5pNzNMcHErUm1QZ2NDRFRLdm40ME16K1YvQ2lUV1Vs?=
 =?utf-8?Q?JXuB10Dl9hbIvgbMyIJxoT2sfAsWcc13?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHcxZ2haWW16VHVINldvZDlTYXZ4RnhOYUVjVmJmNXZhOVB1UFd6c1FKeERV?=
 =?utf-8?B?UkExRjRQRFlqeEs3QTAzM2pBTjVWeE82VldIWTl2MHlaRTd6aUdoWlByQ0dB?=
 =?utf-8?B?UU4vV1hnM0wvVmNnMVhQbTBCOVZJYkNhUXNEMHpRc25NZDRKUGtxRmJRbFJ0?=
 =?utf-8?B?dTFEazdRNm05T2hQbGticFRtMkRGRFRNUURWbGhsbHIzcGE0VEFCTEZKMHFP?=
 =?utf-8?B?dzNZYWp5K3c2WXh6c1VGRk5SNG1nV2xibmhXN3c3TUdEVDUvVWRoQjE1MlhS?=
 =?utf-8?B?T3htYk1kNERiTk8xZFlqZmhDYkUwMlZQdFBYYWxwKzdNWW9QYXJZTXRMTytT?=
 =?utf-8?B?ZkR4SFNjWmVHWGdvUEdSL3NweFZXdjVWUU53ajM3Y0tweFNmQjhRWTBWUm12?=
 =?utf-8?B?WUN0dGRDMjErZWNObEZ4SE43cTloaEMrSERXSktsQi9RTndIendUUnhsQlZx?=
 =?utf-8?B?Z0V4bjd6K1JIaXlsU2ZxbFpmcGJVTlYyZ1ZHdUJZUUlFa2hXWHJQcnY0VEd4?=
 =?utf-8?B?WTYyTGFsTFNwTVNzeGtOUUlmZk9rcVZWWEJTdEZBSkxKTjJ0Y2FadXM4S2lz?=
 =?utf-8?B?VDgzYzFtNGFrTGVTOGtHUzJ1cWZZcmJ5V1FBdW5MTkJUZXV2dXhpRzVZSlB2?=
 =?utf-8?B?ekxZaEM1cFVOb1VVY1kyOGVoM2pvUHBkVjJ2dVpCQk5IVzdjcHFDMzJiaWNk?=
 =?utf-8?B?K0JUeFRxaXk0dTBWUDlCK3pSR0VTc1c4M2xzemNrTGIxek03Uy9mRWVwcGlp?=
 =?utf-8?B?cTJYRzF5NXF2d2JqcUd1a2ZvNWszNXRieTM3dWFwNVg5VkR3Z2lPWi94R25U?=
 =?utf-8?B?RXplN0FoRVQ0ZXBNZ0NjREFIN0JyQm1QWTY3MCt2S3NGcmg2NE1wT01LN25k?=
 =?utf-8?B?eGJWdHR6U2d2QzlMeGpRQ1BZY1J0UGE4dnBLNUJmR21pWUxOcFZOMTlvTmNR?=
 =?utf-8?B?eFRxWGk2SG1Tc1VnY3VsRituY3FuL25IT2tUUFlsUDFEc2pSQ0xDV3orWEYw?=
 =?utf-8?B?QUFxaFhlMjU2Y0NWc1lONlJNSHIwRVdnc2lLNDBrWFJ4dFZwWk9nUGRWRW5V?=
 =?utf-8?B?akNZWGkvSFNTRFc4eGRybjgxeHZqMm42MEF5cjV0Z3g0MTBscG92akdOS1J4?=
 =?utf-8?B?OEFUYjE2QklCYVBaZlozUWorVUhZOUJVOXphczAvYm9FRmIvUWI4ZE5HV2Jr?=
 =?utf-8?B?UU93VWRvSElQZnE3c25UQ29ISGxPaVhqbnN2T0c4K1Iya3ppUHhyeVY0UGl0?=
 =?utf-8?B?M2kvNEtkS1l2bnZzbXZIRW1pQTZYbmYwOFI2UGdQRU1IcW4ybjQzUGhrYUFU?=
 =?utf-8?B?TFFzVkZKKzdNMlF6eFAzRnVvdHBkeEN5cjdWb2txVitOMENIZ29tNEc5N2tp?=
 =?utf-8?B?bktTSmF1R1JLSlQwSDQxZTJpb3hzMjRrMDVqVVV0RFlJQUNPNHF3RUxsZXlh?=
 =?utf-8?B?bEFaRzUxZkxVOEV6ZHpZc1FIL25GRkVjRG5sUjAwY1Qza2FSQ1lZTkozOUFp?=
 =?utf-8?B?Mnc5SnlaRHdLeHRtYy9nM0E5Nzd6ZFE5L1BTMTJCOHJKV0l0ZHlLTElIMXU5?=
 =?utf-8?B?ckxNd2Z6SENmSjNuMUxudDZBN0dyNjV5dEp6b0c4WDN4citKb1crWDBPeXhZ?=
 =?utf-8?B?emJrMFNQNGlsVG9LV082U21MMGh0UHhQUE1Nc1ozd1VCWTBDcTJIcml6OFpI?=
 =?utf-8?B?VUhyV1NERkJQUlFBbURsL1V1OGRMeXNJeVlmTWxvNUNZMDZZQ00wNWJlWXVt?=
 =?utf-8?B?azdUZm1RTVJ0WEZ2MjY3TEN3VVFtRWVsbVNCazBZVXJNRUZ3di80ZGtiYitp?=
 =?utf-8?B?ckY1Sy9mZkhUSUlMTzFiV0Zsa1JzQ0dHT3BiU3BvczVabUxtM1lCZjdteHhk?=
 =?utf-8?B?aUY4aWx3MWhiQ2l5TERTbkFNbVpINDBWaUVuMmFBT3FVblJRZ2JzM3lyZkQ5?=
 =?utf-8?B?MTUrZEsxazJINjgzS2RGQmlJdFFsbDk0VVdQQkhkWGk0NDRpQW00SkNKMWJ5?=
 =?utf-8?B?RkJGczFNek5UVldPTEkxNWFqaG50dEpYVFU4emo3bHduMDdMR2pDaWhBZHBV?=
 =?utf-8?B?QnhhUDJJZDhKaTdvUnJiQjVpL1o4ZTVNdmJ3cHpaSGlSand0WUV3cWFRbVN3?=
 =?utf-8?B?b3pDS3gwV1RSdnlldlhzTUNXMWV5QUFhUHZPYnZuSXBQNklVWWRzR211K2Zr?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa75720c-0819-4dfa-f01b-08de2d86c324
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 07:29:55.7149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ai1hC91sqOSyeWo28x/a5LWteHRy9C5Jdz94blsgxotEz1aFsM5CmOTujU3ZLnqBj2TPgnWzDWDweT3/1he0mxezERbxTCb6ArZunmHp1CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
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

Hi Kamil,

On 2025-11-21 at 20:35:24 +0100, Kamil Konieczny wrote:
> Printing frequencies by non-root user is now not possible as it
> ends up with an assert. However, reading corresponding sysfs as
> non-priviliged user and printing frequencies is possible:
> 
> $ cd /sys/class/drm/card1/
> 
> $ ls -1 gt_*
> gt_RP0_freq_mhz
> gt_RP1_freq_mhz
> gt_RPn_freq_mhz
> gt_act_freq_mhz
> gt_boost_freq_mhz
> gt_cur_freq_mhz
> gt_max_freq_mhz
> gt_min_freq_mhz
> 
> $ cat gt_*
> 1300
> 350
> 100
> 0
> 1300
> 350
> 1300
> 100
> 
> Add such feature to this tool, with this:
> 
> $ ./intel_gpu_frequency
> cur: 350 MHz
> min: 100 MHz
> RP1: 350 MHz
> max: 1300 MHz
> 
> v2: split out card detection to simplify review, rewritten
>   opening for write (Kamil)
> 
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---

The change works as intended.
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
