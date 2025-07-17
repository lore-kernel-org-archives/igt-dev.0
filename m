Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D82C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 04:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC19310E2E5;
	Thu, 17 Jul 2025 04:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3KaVhME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C8410E2E5
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 04:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752726639; x=1784262639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ivAYRLFgCA3rqhrI74Ue4vb6qzE7XTx0vInEKVOUNlc=;
 b=R3KaVhMEEsUM/Ixex7Ei3MCm7bTZJz2/K1oZLuGAKxd1vzecLtldNr1m
 zSRIZeuG7dGT16YAS0g5JhFXgx4wpglK9BIndz3vH+DqcZWx1w7XHcxd3
 gZzHhRgnHFyI7HvFz3/6vXSlVcel7Hgw8OsqOwGY4lEj789udLhcb0lDm
 3odiyMgvS4o2t942RKmFKo4JCZmSDbvNn89NXU0eI5cX155TNfNwNFNxl
 haPLBCoXDSJhO2zDVW3UArpEmpSGCQI2whkaTb87eOdOGp6e/Snep+rqY
 PaZz1oeOdNRB6l5QNcz2a/b368BHJgxJ0ObG1QB1aPtB23zbKiO6wyQqU A==;
X-CSE-ConnectionGUID: uHMY7XfSQEa8p4Mu3A8etA==
X-CSE-MsgGUID: 7q1iYo17RYyDMHp7IC8UWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65555994"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="65555994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 21:30:36 -0700
X-CSE-ConnectionGUID: yD0TtVNKRuKOyVG4e+B2AQ==
X-CSE-MsgGUID: PV+sluDFROqRdPM6++fyjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="161993805"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 21:30:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 21:30:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 21:30:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 16 Jul 2025 21:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaKts8CHalMMVLO7IgiCLn2itT+p6DGzjDkUKxwLWl2J6QBpVTAFkUbgo3WxS+4Etx+k2LTzVW4EkbFMGUgxB4CbYoOrNX2OgGBgnXtuKGJA2elOA1d5MBuMQisC3aJbWcBC4F9SgXURZkycZvtJBz95tVBM/1yreJ28WKIbxwzTIPe57dkEOE0ZHfdcgPldKSZMKKoOgoW8AKOu0+SIFvro2CVsN0Red5oBZP7tg/HtFs8e8j1d1K2elPGF70GPaE+T4K1izvT6emosBsgG48pknymWpWQm9MPZLrInj0tV1Qo5ykOBfBCbSDNW9HAFtLdlc8U437JLI2NVtO0MyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRG9C7dyRWZw+v922x33wEHF9vNmjlAItxscuk0eKLk=;
 b=VhWcYoJuE7wuoNTzWafsq1guoNuwDKcThB5fxZQ3hCWtzrO6IXzZQdP96pBCv5MHH8woS7B8WZPE/u9NdyzvqpG7+NI/7nXRnm6cKP6KXzD8qbR4rNmpaLNeBzyA6DwNjKGfS6NFYUY8Cfw+16ycAvAgylVDOvirjZj76f/a0Fs21K5MWHWQWXyYscO3es/yM4l9ySMANtqLFmd5dt+AFZ29Tg56CtyKREsx8kr+OG2Dax2WHinFOHfmUkCOIvLDUX3JbYk0FXcdpEyGUN6RuqOeNyzK+Rl1psGfwZaYQ+OLMOcHWIZ2yVTTidNZfyZuJy8idCP6POhLda5PEhNO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ5PPF0FD67B0BC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::80f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 04:30:32 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 04:30:31 +0000
Message-ID: <ce6f1b2b-917d-45a6-b57c-39a61c6eafea@intel.com>
Date: Thu, 17 Jul 2025 10:00:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded
 modifiers with async modifiers
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
References: <20250716161231.410389-1-santhosh.reddy.guddati@intel.com>
 <IA0PR11MB7307E2B609981E658DF1F188BA51A@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <IA0PR11MB7307E2B609981E658DF1F188BA51A@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0116.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b3::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ5PPF0FD67B0BC:EE_
X-MS-Office365-Filtering-Correlation-Id: 3423abc4-7244-48df-7006-08ddc4eaaa17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlFaS1RBb1RJdXlNYjVPbFZQU0NmTlk0YldKNWpLcXBqSUNvUEQyZ01leDlN?=
 =?utf-8?B?NjR5Z1Vwd2NzVHRNZmdsbmFoOTJUQlovRnRaSldwRy8xMzA5SUNBZXZybVVT?=
 =?utf-8?B?S1lkNDI3Q3hoOE1vZkFHeERudklOU2lreVBpRnM5QjQ2QlBvN1lTME0rS3Ns?=
 =?utf-8?B?cFgvV1VBK2hsWEdEMngzalkvNk8yNmQzTnVSSlFReTBqMWJhTmpzSWRLQ1Va?=
 =?utf-8?B?N29ZcytiVytzVkpRN2RVbmJtNHlHcm1PMWswejlEK000SWxCcVhzczdhZk5z?=
 =?utf-8?B?RmgwVWV0alZYWER1bEt0YVZYUjJYS3NBdWpxNE9aQ2VIZWVDeCtqVGJzcWdk?=
 =?utf-8?B?T24vc3N6TmxMV3lMcGxjR3FncDFSeVlzVnM2c1BDOUYwRkR3Nkw3bmE0UmhQ?=
 =?utf-8?B?eVJuNGF1Y3FJV2laejlzL2VtdDIzZUhmbi94cEhvTTZWRktXTDNTZHdiZUha?=
 =?utf-8?B?L3NyYjRMN0pvQ2VSekx0eGIyczZvMHM5ZzVnb2pUVXVKV2xKMFZMNjg2QnRN?=
 =?utf-8?B?REllcFhwRXNpUnA2Q2pTZzdjd3I2OE5MZWsyK3FNRlM1YjJ1RXJYeXBpeGNm?=
 =?utf-8?B?ZUprN0QzRWlxcSs0U2NzaklGK2xYNER1N2hSTkR2Ty9lbWVBUEJHQXdSNzlv?=
 =?utf-8?B?b1BwaldLbGpmcmI1eVNoZlFuUGw2ekU0VjVtdC8vcFFINzF3M1VjTmJaWERk?=
 =?utf-8?B?WEVmK3dMNHdQNWhwTnRNaXk1NDJKWlltOWNKRHhMdExRNzF0c3RtQVgvSXly?=
 =?utf-8?B?cnFuZlFwd0t0MTN0MjhFaGlENWJhN2kxOFJBQlUvRE5GYXRQZFhBT3JPRTNC?=
 =?utf-8?B?WWJHV28xdjhjcDBBUDVyWVBoemlleFdzcGRpWjZ5RWV0UWNmbzY5R1BweVBU?=
 =?utf-8?B?STlvZmNlMTIrN05HUkthM09ndlVjYkNpMlZjQitrY3g5Ny9oOTFCZHM4bkxV?=
 =?utf-8?B?c2pCOEp6TjhQQWVFbmVIQ0p4N1o4NFkwcGZFZ1VpenNCUmg3clgrSmtuNU5V?=
 =?utf-8?B?aEl1cWplZlVSWEVnWFpsbTNGUzJCOUdRQ1Z6NUN1dlIxaWhFcDZqOWJQU3pO?=
 =?utf-8?B?VTM5ck54enpSb2wzRXg3eExSVlBNbDIwT0QvN2hZL2YzcGtBa3Ixbk9MSzIy?=
 =?utf-8?B?c0l4UVBseXlyVVBuRlAzTjE5Wm5OT2d0WHJzbHlCZFhOOU5wMFFRVDQxOHZH?=
 =?utf-8?B?eGp2WTg2bEtFaHVQL3k2MGtBMkorTzFiVHNiUmxQZjRiWDFzVTRCUTZWZ3NM?=
 =?utf-8?B?Q3MxaDVoeTlsUHJsckpMQ3YySlg3QW0zK0JKOTFEQlorNy9tSHAvNStUVnBD?=
 =?utf-8?B?UHhqcjNpZktYbU9wN2swU2svNFRqZHprMHRsVit0MFZoT1R6Tm9ZRWJkdkht?=
 =?utf-8?B?K2EzOVY4N0dsMlAxVW05RnllbG03dEpiOXg0cXBqektQVlNwWVJ2Wm5mQ3Y2?=
 =?utf-8?B?TkZQTWd6MXkzRGFRNmNRZ1BzRlZFc04wVTFYd2JSUHpUd2k0YUJLaU8vcXlm?=
 =?utf-8?B?dmtFVzRKTDg1TTJXRWFSQ0paanprR0hnRGJjZU5RaU1wMG41RmEvRXZKNG9p?=
 =?utf-8?B?c2pLVVVmd0wrQlhDN3Blc0hKcmN1U1pFMkJuM08yMmphYnJBWTliWk5wRnZX?=
 =?utf-8?B?OEc4dmh4K2RUWUd4YitRUHh1UDYyeFRSeU9EcDNwSGg3dDdYd2I5S3l5eFJn?=
 =?utf-8?B?WDA1UXBzNWJoeWZHa2lIQXFRWlpYRWtUUzhoNW9yZ2xQT3YyMCtic0htYWRG?=
 =?utf-8?B?bmpoUUpnUnRqZzFDT0wwQzVQY215K1NMSkc3M1VteHd2RmFyeU15N0ltNmd2?=
 =?utf-8?Q?fS9v/GmfrxCXwuJVQiYSutJTw1AxcdjgjR2g4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmxtSDVhc3RNektoTmZBb01XUXAwd3YzNkplK0s3UjAvMnNNcnJDNFE2WDRJ?=
 =?utf-8?B?ajdiYi9GL204THF0UWU0Z0cyTzhla1ROUG55MjROSnpTWUNyYUtkY0Q3ODFl?=
 =?utf-8?B?TU52L2tMQy8xckpnajB4ajF1Rm1XelFZdjRVLythT0ZQWndsbncxK2NkbE16?=
 =?utf-8?B?SXdxdVc4aTVLQTdUM1pRK1l4SEZjZXJVb0Q2T1RpL2NOV2llejRUZnV0OXg5?=
 =?utf-8?B?dldadHA0a1J6aFl5WlM3YWdnL251cHRqMmIxT2UwOVA3S3kwb0tDbWRMSnph?=
 =?utf-8?B?aHBxVUxQVHQxbFZrWlphZzBrZTVvOHRxQXIvMzNNYTNEcytlM3VNZndiRS9Z?=
 =?utf-8?B?WWp6ZUZtTGJOS3V3OGJMc3YyNy9EdmdCR2hQamZDZ2UweVoyQ2lleXJWZmpv?=
 =?utf-8?B?U1hvSVhoLzZuamkwVURnTmJPYlJBcmtxV3hkYkJaME85b21BQmFZdjQ3WGtH?=
 =?utf-8?B?QjgwemRsZC9qazV6SHBwT3N4M1lkZHQwYVRJWUZJWVZwVUZ5Rkl1NlV5cjZv?=
 =?utf-8?B?T1dZellVM1Z6NDRKR2M3cEdkMVFmTnRCcDRkRi9acnBWbWtvcDh4Tlc1WE5V?=
 =?utf-8?B?MUFKYitFRGJtZVpqbVJpdm1iVGVLQjhxZ1Ewa0lqc094dVdWTXZLVTNaQkRE?=
 =?utf-8?B?RTF2OE00dmdiQVFRcUkxMTA0eXgxaEdZSnVuTGlFN05QS3NrdXRmRk1xd3lk?=
 =?utf-8?B?aXpIQWwvQWE0Tk41NTdCTGxTTTdaRVFYRXhGTUNtc2RrMXhjNXdjY1BwOVRi?=
 =?utf-8?B?UXo0L21kS3ZDejdkeVNEaldmU1NSTk1WRVo4dksralVySTRtY0Nuc05iYWpD?=
 =?utf-8?B?UW9uUi9NMHp1OEFyemVuMnRHUTd0eDBpWEtUNllEZk9Vamc2bktaQmpuUTgw?=
 =?utf-8?B?dnFiNktQOUYzMkFzemhnRmp4RGNGMURsenpPZkNtSERhOVBoRTFzUjBnd3N1?=
 =?utf-8?B?TDdac2dqMEg4N1krSzlZSUpSSjg0enEwTkJ4VUU3NWdnVnd5dFV6dEkyU0RT?=
 =?utf-8?B?U3g2OXhoYVRHOW5lOEpQRnRRR25jTGZQdHUyYXltb25NUUN0bEMyWURDeEEz?=
 =?utf-8?B?WTBvMHJDQ25tWk5oa3o5WUpwa1N2M1BFZ2hGbmwyd3JOR2tBMTIzQXova29B?=
 =?utf-8?B?VERuelordmdQTWliTUtBQnpXVEtBNjFMdlphR0hWM1BmOU5KUEhFK3g0ZUNO?=
 =?utf-8?B?amsveGxrTVFvREQ5RlVNTlBOTmxxS05RaUxNQ2dFTVhObVBjYTlsRGR5QjNw?=
 =?utf-8?B?SGJ4dUJPT0NuK1ZvTHl3UVUrVkxEVUpFeGpMeWpLMUI1R3pmM0JhZTN0dTFk?=
 =?utf-8?B?VGIzc09HdUxkdE5vN3lYNmo5ei9SdGVOOGdEOXFZYU5IOHYxUlh3Um9LeUxH?=
 =?utf-8?B?WWQ4elNZNVNqRC9yYXNJVGdBU2lXMWdhdVh6Z1pQRkhxOG82aFB2NXlwaE93?=
 =?utf-8?B?eFFlcDJnSjdqenBBNE96cGQ2UTlFOTQrYy9nMlFVbVR4Qm0xcXpCZzlSNzRt?=
 =?utf-8?B?aU1PdU9GOEYxbHF0a1NpWVQzaUcxcFdrempVaVJsZkZ0QWlnajNPcEViY3ZT?=
 =?utf-8?B?cmVEanFZYWQvSGg2YnhyREY4WGJwU0EzUTdzV2REY01WUzE0OTVNOFBWaEdV?=
 =?utf-8?B?YlJXRHZkWHN2dWR1T3JxZzAwN2FkS0RwVnhMQ0lqY3FDR1VKK3Y0djg2VGUv?=
 =?utf-8?B?bzRPTnEycjB4cVlycWJHTDdlWW5MN05xdGFnclBTVk5iNy9ReGZ5UVByVGpp?=
 =?utf-8?B?VnJGYU8rWkpiWW1lOFJXSGxBb1o1Sm5jQVZpa0RBZDg2QXZWSERqL1VjVmhv?=
 =?utf-8?B?c3pSa2E0T244amtHTkR3UzF0UWQ1dFFFT0xaVXBkVXFDMS9DNTJ3YkhyY1ZU?=
 =?utf-8?B?SXA1N1RjMmplQlp5S3MrWUVoWUl3Q3dHRE1YYmlnOFp2NlBCdDg5ZW51ZUVF?=
 =?utf-8?B?R2V5QTY0dDdNNGVYMkR1Q3lzY0VVQjRQR1lGcnRnNStyRHB6KzJuVHpEMEw4?=
 =?utf-8?B?TDFFK09ualFyNW9wWVN6WERCb0IvOVg4UHZ3UFhQc21ybFc2YUQyRmN0TFJh?=
 =?utf-8?B?S0lhZGJ1c3llcnA2enVKbXZzeU5sL0NTaGZzVjZhN0k3YWExaUpid3VVeVpL?=
 =?utf-8?B?ZUw3UE0zMzEycngwNkJERDA1d2RIZC9sajVKbUNRcFpTSDhYdXNXUk5KSWl1?=
 =?utf-8?Q?ZwIuxRSsZS8zCJwJAweWjGY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3423abc4-7244-48df-7006-08ddc4eaaa17
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 04:30:31.2992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3MbrHEFYUqCX+j/Dr597XbinlTXH4Z9gzt926GHyQ41/J7Nw4VFbTbIcXhXITfDIkaB/xQasbDoqS2ZL3nSvqxvVePFmrQg5Me12Ch6011f9V42UUBfdEidudw3Wy+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0FD67B0BC
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



On 17-07-2025 09:54, Murthy, Arun R wrote:
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Wednesday, July 16, 2025 9:43 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Murthy, Arun R
>> <arun.r.murthy@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded modifiers
>> with async modifiers
>>
>> Use the IN_FORMATS_ASYNC uAPI to get the list of async supported modifiers.
>> select the 2 unique modifiers from this list to test invalid async test, removing
>> the hard coded dependency across platforms.
>>
>> v2: Use first and last modifier from the async supported format list for invalid
>> subtest.
>>
>> closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> ddac904ce..1d4684c51 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -598,6 +598,7 @@ static void test_invalid(data_t *data)
>>   	struct igt_fb fb[2];
>>   	drmModeModeInfo *mode;
>>   	int flags;
>> +	uint64_t mod1, mod2;
>>
>>   	igt_display_commit2(&data->display, data->display.is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>
>> @@ -607,10 +608,16 @@ static void test_invalid(data_t *data)
>>
>>   	flags = DRM_MODE_PAGE_FLIP_ASYNC |
>> DRM_MODE_PAGE_FLIP_EVENT;
>>
>> +	mod1 = data->plane->async_modifiers[0];
>> +	mod2 =
>> +data->plane->async_modifiers[(data->plane->async_format_mod_count) -
>> +1];
> I think we need to check for IN_FORMATS_ASYNC and then assign. There are other vendors who are still not using this IN_FORMATS_ASYNC so for them data->plane->async_modifiers will be NULL. So in case on NULL use the existing static modifiers.

Currently the test is intel-specific and will not run on non-intel 
platforms.

igt_subtest_with_dynamic("invalid-async-flip") {
		test_init_ops(&data);
		/* TODO: support more vendors */
		igt_require(is_intel_device(data.drm_fd));

Thanks,
Santhosh>
> Thanks and Regards,
> Arun R Murthy
> --------------------
>> +
>> +	igt_info("using modifier1 %s and modifier2 %s\n",
>> +		 igt_fb_modifier_name(mod1), igt_fb_modifier_name(mod2));
>> +
>>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> -		      I915_FORMAT_MOD_X_TILED, &fb[0]);
>> +		      mod1, &fb[0]);
>>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> -		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
>> +		      mod2, &fb[1]);
>>
>>   	igt_plane_set_fb(data->plane, &fb[0]);
>>   	igt_display_commit2(&data->display, data->display.is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY); @@ -1113,11 +1120,6 @@ igt_main
>>   		test_init_ops(&data);
>>   		/* TODO: support more vendors */
>>   		igt_require(is_intel_device(data.drm_fd));
>> -		igt_require(igt_display_has_format_mod(&data.display,
>> DRM_FORMAT_XRGB8888,
>> -
>> I915_FORMAT_MOD_X_TILED));
>> -		igt_require(igt_display_has_format_mod(&data.display,
>> DRM_FORMAT_XRGB8888,
>> -
>> I915_FORMAT_MOD_Y_TILED));
>> -
>>   		run_test(&data, test_invalid);
>>   	}
>>
>> --
>> 2.34.1
> 

