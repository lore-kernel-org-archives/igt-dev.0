Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8F2E9128E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 08:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3B810E7F2;
	Thu,  5 Feb 2026 08:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+67ZHf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFBC10E7F3
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770280138; x=1801816138;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ceqkoHrdEZlATaZJA/UUG6Fa/9mdAxa/GuDwfZk3TM8=;
 b=e+67ZHf1gb3aTvubJ0C2WqzolYyyuzEFrYTG2ATNJFbegM/fNgebYhFn
 J4s8GtodiS+rr0IJj8TaB8qcRi/LHzZ1lrnErIiU0z60beTckG6UuCqJq
 Q3tSroLtCzwkrBS8bqrVT7tK4UHWrfMSx67/yZAAe9WxWl6b5wSh2j+bT
 xRG0om9fSy1CCnE3UXzvcJS7450GKc1qXoKeVY9k4UUOIPJZ+IeMGE4fV
 NT1EoVK4RXHHq7++se5qCkurCMM6J9K/DdqzJ56xIt34oBThyCfX1HM5l
 0PsUylJvwW/Tl7BZzGRrxTvDy8/R97NQAAJ+dqPyijTkiUvLr5/Crl6PU g==;
X-CSE-ConnectionGUID: PN/9hP57SjiwpJDE+P3FUw==
X-CSE-MsgGUID: IXzVrZxURzOuIGErMW9WKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94123448"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="94123448"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:28:57 -0800
X-CSE-ConnectionGUID: 1mfgDfyXTVaVeFfCPitPLQ==
X-CSE-MsgGUID: +0yE2Y7cRqCTU0L8/qq9NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210387809"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:28:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 00:28:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 00:28:56 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 00:28:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owt8kE390cyH7PMVpGjQHvjd7+lgs327FkJ4WKj83TRkJrWEefJkoApkQ5qB7Y0DdvRLLoGF7rnAlDdhjP0jiUdKGKY3Ms5cZIzRPYRPDdJRo9gI3VstY0eK0jH1EI3va1OcbegBHXptAajOdw2IHK0j616V59Uu1ExRrXQ5yISYL9Zgxbko+HsTtHia5ognkssTdB05sHE/LVw/LdPQrVT0Mfv+llpjQA3RORH6j6LFNQdtn3KzD9HxXk6CPocewxwIYT6SYv8GMogkxcl8Hrx1FOoguxVCpcj/L9R6Vzhc/RJej5/amTUL69T4idYCiWCxb681IT5pTzerSyYdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceqkoHrdEZlATaZJA/UUG6Fa/9mdAxa/GuDwfZk3TM8=;
 b=HxPWeBawjmrKkkqYYOROEBzoeimxCaJ5CzcycPFcTNZiW+76a86HE/NJC1vBJhWzcORiix8xoXUYDGDhAayXKRyomzJMiv0sMRR9dv3t1KzDPE1+MGz01UXz3qp7Xvjh2MLcZNO1oU+zG4F9S5ywjQ5RYDBcCqwZ4h+UO8kG0Nz4dzHbNMemaSjxvtOts5OYnW6OYkO8JJ5ijEm8Nb6T0h/lTRnhKRewyGY0HAQX1noKW6yXD2hvYH7WVoodIhiCABuiwFocJVbM+YXFhurTu1VARhOgqPuaOrcCh1D8qyyT15Z6ocdAoJ8T93a1S1ifH5px3bnouH9sx33wFfGrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 08:28:45 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 08:28:45 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas, 
 Sobin" <sobin.thomas@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH v4 i-g-t 0/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Thread-Topic: [PATCH v4 i-g-t 0/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Thread-Index: AQHcllKzP1bjTA1bWUOYSDGjx6GYhrVzxjsA
Date: Thu, 5 Feb 2026 08:28:45 +0000
Message-ID: <df2273c453d947192416925bfd25df4cf86c9cf1.camel@intel.com>
References: <20260205035041.413552-1-sobin.thomas@intel.com>
In-Reply-To: <20260205035041.413552-1-sobin.thomas@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.2 (3.58.2-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SA1PR11MB6757:EE_
x-ms-office365-filtering-correlation-id: a20638ca-8982-4507-b4d4-08de649093f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?L3VTQzNUaGxTeTRuam5mazRuaDh2VVZQZURSQW4rSTBmL3kzYUhETER2UzlH?=
 =?utf-8?B?bWJHNDFqSE43MGpWTGRLYmliYU41WllwcjEzSk5zM09Fc05FTUdCY2xQeWQw?=
 =?utf-8?B?cWV4Yi9jVUhkdUhCNXo3OVZZeTJqbTVHV01zZm1GRXdMWS8raTZHbVdoSEZE?=
 =?utf-8?B?eUtJb2QyQ3N2Yy9sWXNkeHFkRmFzQU5XYXZOTHRwR3BabktMeG9JZkFEdDVz?=
 =?utf-8?B?Ym5ocnd3SytFbStMdGVvWHhsSmNGdUNMWXRwNXRTeWJvdHQ2ZmZHdEpxZ0Z0?=
 =?utf-8?B?bTVySC9GRm9UZGgzcDlzNk1RV01VUmRjalRVUTBYak9kR3d1TlEzTHVrdEhz?=
 =?utf-8?B?M1BzRVBvanRpRTEzeG5SVkY4bkMvNzJnNGQ5SU1JQjhEUXJjSDgyNnFHcmFJ?=
 =?utf-8?B?U0hNK05qVXhVVjJ5Z0oyYmE0Z3ZWNVJvYkVyKzdEN0toa1IxNGdERjRKaVBH?=
 =?utf-8?B?N1M4NjJQN2hMQmg2bzZ2aWVXd2JtaWhLdWFIREJ3aFhzaGpzZGxCNkxkVHR0?=
 =?utf-8?B?aWw2Tm5nUkxrTHdtM2dsbHd0SjhTTHJUajB2SUYxOGZ3dURlcUROYjVBL0Y5?=
 =?utf-8?B?UkE3WGFSUXpNNFpjc1VXcGdsV2pQc2tsaXhGY0xhRTJmSjJ2M1ptdnhKRVN1?=
 =?utf-8?B?ZWFBUGxuKzBnVWF2SnV6OUEvSWp4WStwZFdLSHIrRS94ME5NSlRZbWtLTlVh?=
 =?utf-8?B?SUcxMGJDaGVuS1U3VEJUWG9kdDVTOVUrR0g4b3RKNVVpVUUwZS9pTFlNOXlT?=
 =?utf-8?B?SjY1OGorRVZvTHR2bFZ4c0pYeU9EV3NVa1d0dHZ1VC9IUGIzVjVxelo1NWd4?=
 =?utf-8?B?T0R6dldMWmswaHRjd0cxa3VtbHpzbGJPbXJ3bWZPNk9CWEM3SEVFSjB4S2xM?=
 =?utf-8?B?Q3cveGorUmRzZERGMnU3SXk3VnlkZDdHemViSC8ydXdVWFdrZ1Z6dlpBZkd3?=
 =?utf-8?B?dFBpazNkc2tZamczUmxnRnpNdUY3YWs5ck9acGtia1hKVWo3d2RHRlRuTGtN?=
 =?utf-8?B?OURXbTAxZTNhbGxZSThIdFJSVnMxVGY5V1F2M2FYRjREcnBxakVGNHhnM1pw?=
 =?utf-8?B?S2w3NjdhUjlYckR6dWJ3NGZIbWdSOXF0UWN5Qml6d3lCbTFJMHd6MElhbWEx?=
 =?utf-8?B?MEY4VE5UTnRsdjk4ZnZqQ2p6dHFVaFM0RTBMNUx1aWVta3JHWkRjcy81K0p6?=
 =?utf-8?B?SG8yeld4QzFzRnNUYVpjNW5lRENvczc4aTRzVWJhMVRyNk1yaFdjY1QwMEh0?=
 =?utf-8?B?QzNQOTVqUDRSYXBmZlVON25jZllxUWcwUndZWFRGK0pLTW1obXdQRVR4Y3ZI?=
 =?utf-8?B?WUU4djY2SDVWakFVVXlIZGVjMjBLcG1MemtFUHFTeEtxTExTQlVScXI0S3Ez?=
 =?utf-8?B?Um4vaTlEYlFQbmN4Y29NUEV3TDl5QTVBL1FYdUhjdGpNT1lHNURVdGlsMWpn?=
 =?utf-8?B?ZVVGbGE5c2dWcEFodThuRzFRcWNVV1Y2ejlyaFV5VlpYK3NsMFF3bjRVSVVs?=
 =?utf-8?B?dUhYUE1paFptY3NYV1BGSXhObzArcXliOXBDR2NmQ1M4Tk16ZzNTSXZUdnFV?=
 =?utf-8?B?Y1hlb3hSSTc1RkNweUtoNjBhK2dISDl4ZVRlRHpuVWtlZGFsa2dvMjk5QVZK?=
 =?utf-8?B?TGNQUC9kWUZCZ1ExdytYTVQvYkE0NUdRYlFjeHFieVZSWG9QWTdMa3Z2c1l4?=
 =?utf-8?B?V2taU3IwbFIvOS9jRnd5ZXdHU2hQcDRiY3hBLzhpU2NZaHhiSEdyc05idW0x?=
 =?utf-8?B?R2h0azJ1RllqdEVEZ0haWGRyTmxpL1RzUUt6aExERmRFY1V2UWxpOFZyazhp?=
 =?utf-8?B?SkhhR1VQNmNGcWxVTXBzUHFmNGJyK3JkRU95NkZJWnVBRGZxcHo1WCt2MUhl?=
 =?utf-8?B?cTJBbG5CR0NOaXZxVHhoZEc0WWlnVmZLR1hKazVRdGs0bGI2OTBsMklVNWNq?=
 =?utf-8?B?aFZRbjFkNGovSnVQM3ZxcmFFTDJRUnkxb21LZGYySEY3T01tUlVQQTRRZlBB?=
 =?utf-8?B?SXlrakFGbHVVS1p5eTMvcmdvNWdjUmlyeXV5dEM1Q3Jldll0ZnBmQnY2VzQ4?=
 =?utf-8?B?TUs2R3Uza01nZVF2L1B0aDZ5YjNnWnEzeG1aSXowaExjM2pNUU5Bc1ZiMFpD?=
 =?utf-8?Q?tEGi2K5XPMwOZzisw7CEEDpBB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzliWXZKeVN0SDZVYmdNVkI0b1oyZlpLN21TOEZMaEo4amQ3T1dCcGlqa3NC?=
 =?utf-8?B?bml1UjFWcHJ1TCszWFc4K0J4K2ZDK2VhQXhIckJvY1dLL2llNklKSW9tTEJH?=
 =?utf-8?B?b2V1aGU5Y1hmSURDRFJrWkdLdTd1Qy9teGM0VVJkRlM1Q3o5UHQxdVJqQnQz?=
 =?utf-8?B?THBYRDF5b3dmWllOWUlQVVNMdHg2bzRsZXlIVE9NL2pqRWhLMlkvVHovSkxs?=
 =?utf-8?B?MmJYaXR0M3dXMTJzUjhDOTBKaktEM21idUY2WWJMR0FjbTVia3dYcGNSYmh5?=
 =?utf-8?B?NUhuMXNMTURFN1hsQ2FUR2E3SnFKR0NSMEZ0MVlIZkpuc0doeTRLak5OT1J6?=
 =?utf-8?B?bWEybitaN3h1aWI4enQwK1daaHFuZEhKSGV0cHhBM2tBMXViRWVjNTVZQnlD?=
 =?utf-8?B?NzdOaGVLeFRQK2d2WHZOQ0c5SDA0cWJwdmIxYWRCeGNXMjJ3ZTUrZ0NuaDBX?=
 =?utf-8?B?TFp2QWpJRmg3YlIrS0ZibVpkeHE1SXN0M2g0dmtLcGdBWFFnRElITEZmZ0Vx?=
 =?utf-8?B?anNiUENzU3I1NnBwVXp1WVBMZVNCOXd4UlloSkNCRk1aY0Z4T1RGeWNXaUUz?=
 =?utf-8?B?WVAyWlJvMlIyYU1qNC84ZDhRWWlybFdEb0RnMXVnWkNjQVkwNVgrRHVlMHRX?=
 =?utf-8?B?N1dNNVFFYnJ4U0ZMMHpvM1VucVFyZTFqVDAxZC9HT1R4UEZnbzI3YkN0NmxX?=
 =?utf-8?B?WlQ4MzlGZ1VacFF0MnhyenQ5RUh0Ujg1VndROGVySEo4elczbjJKYVhxeW9L?=
 =?utf-8?B?VGRRcTBuMkg1SVhWQTl3bUVmQkdSOC9lSGVxRTJsTkNqcjFvVWp3TU53dk9x?=
 =?utf-8?B?YjJYVSthTElFdWFrQjlQN1owMFZvN09ucjMwajJLVyt6YTFyQ3B6NC9wR1JM?=
 =?utf-8?B?OGRiUTJ4Y1E2TzdlZWk2Z1NSVGhpQ2FBWlNLd1JtTm9hcTR3ZWxiQ05kUjl4?=
 =?utf-8?B?OE9Wbzh5UW9HMlA4NUNIRTVuMzI3STJzaHQrUlk5WmQ3dllCaWJybXlrV1Q5?=
 =?utf-8?B?U2NQYlNBdHBlN0hvbEpnVG8yU0VvUTA2NGxGNDNKdVFnQUdVdXk1cyt2Wnp0?=
 =?utf-8?B?WTRKelpIM2tEM1NTWFgxZWxJZDQ0SjY4eXVpSDVwMkNYVk5MVE5iclpvclJs?=
 =?utf-8?B?UlQrRElJTUpaTTNFVE4xVisxdDdOaWpTSS9WOU1HNkFYRWxJbHRsNmI2bmY5?=
 =?utf-8?B?OEJtZFBNZ1FqZjVuQ2xNMWFCRWx3L29pQlpWRjIvdHBZSWZUbXZnUTBHSWRX?=
 =?utf-8?B?bHhBUGlqMkJEQm9ONkpmcjYyOUdZN2JManl5T1lrekNrb0ZKekozdUVYcWsr?=
 =?utf-8?B?RUVONm5Va3ZuTnkvZzk2ZUdIbjRiWGtYM3paOUdUd0dlWnFFTys1eHc5VVNu?=
 =?utf-8?B?Z1hGOFoydDArclFWN0hzTnJnL1hYVHk1YkhVelBvclBlMXV4T2tNNDBRa0JN?=
 =?utf-8?B?a2dsd3FDQ3QrVkxISDlLWTZ3a01waHpPNSthRER6dDFYUDhod2tzWGpSWEFi?=
 =?utf-8?B?MURRNjI5QlN4ajg4dlhGSU5pQjJiUnQ0ZEJmWjRBR21XOXRma200OXpLdDhv?=
 =?utf-8?B?Q2Uveno5VmVET0tpK1pGTmRXa0gvbElzU1dPRTltNUxGVVMvRGpKRVg3dndo?=
 =?utf-8?B?c090SzJRRVh4ZkhZdVdLd2JobFBKZElrSFhVQUJ1QkxLcU93ZExLRmhDUU1w?=
 =?utf-8?B?WU4vWksvZm9rVnBURE5mRGFzRVFNdVFkbUFxTHdkdG9TYys4WGMvcm1LR25C?=
 =?utf-8?B?TytlT1R1NjR1ZG9QLzBwM2RIZHcyaHRGMWw2WWgvMHR0VmJWSlZOWXVLcWJB?=
 =?utf-8?B?S0FKb3UzOWRqeVpzOXNjRFQ4NnBmeHVlSVJYb3B6NlRzeVN0WiswdUgvZUlI?=
 =?utf-8?B?Wm5CZWN4bk1yNWtCblV3aUJ4Ry96S1RFVmFkb1Y3Si9VemJEMDRDdUJmUHY0?=
 =?utf-8?B?SjdlVDVQK1h5TkV5VUFFTWJZTWdYQnlCanFwQzQ2OG5lSVJmVzY2SmZxWUNl?=
 =?utf-8?B?Ly9FQjNyZjB1R1AxSm43L3VZOXdMT0xCbzNWZVgwVWgvbGJCVDlGaEQzcjU2?=
 =?utf-8?B?elJUTXlMTUd5em1qWnhQTXZBc1NpRFFFakFKY3oybzdTRjJKaEd1TFhzTlN1?=
 =?utf-8?B?TVlVYlZRamZ5WnFLUk5sMTdhSXA3RkNLWmR0SjM4VWkvUk5HOGRleGtCZXNF?=
 =?utf-8?B?MS9IQ1d6TlBha1dzWFBQU2JwbkVibFF5aVpqcVNGcWE0T2txUFRUTDREdUFm?=
 =?utf-8?B?NmZ1UHV3ZTA2c3pQMG9QU294QzhTSVBuMmZyUXpDVjR4TzFDMHlJeVk5UElw?=
 =?utf-8?B?OW1scXNNaWdhbDlPeWFVUWZMUnF6Q2ZQcXlrL3BGSWFwcXR0SEtGcWZqVnJI?=
 =?utf-8?Q?m9qqiHyoLgQpecEX7KoZwRn9gHulnBamtDwhicH/GlLu5?=
x-ms-exchange-antispam-messagedata-1: FayMFpERbPjexQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <40C2415A0D71394483E289A68E2437B0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20638ca-8982-4507-b4d4-08de649093f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 08:28:45.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5DhYTS4tUwmeIKCPqJeiiR0HZC1k/A9yRObYEfMUTteXlzJDFEUQVupQ6Q8SMdhTLrLryADoJySCuJWiQ60K2PyiQzrZ8PoonJk2xHlt78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
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

SGksIFRob21hcw0KDQpPbiBUaHUsIDIwMjYtMDItMDUgYXQgMDM6NTAgKzAwMDAsIFNvYmluIFRo
b21hcyB3cm90ZToNCj4gVGhlIGV4aXN0aW5nIHRlc3RzIGluIHhlX2V2aWN0IGZvY3VzZXMgb24g
c3lzdGVtLXdpZGUgbWVtb3J5DQo+IGFsbG9jYXRpb24NCj4gYWNyb3NzIG11bHRpcGxlIHByb2Nl
c3Nlcy4gSG93ZXZlciwgT09NIGVycm9yIGhhbmRsaW5nIGluIGRpZmZlcmVudA0KPiBWTQ0KPiBt
b2RlcyB3YXMgbm90IGJlaW5nIHRlc3RlZCwgYW5kIHRoZSBwcmV2aW91cyB0ZXN0X3N2bV9vdmVy
Y29tbWl0KCkNCj4gaGFkDQo+IGEgY3JpdGljYWwgYnVnIHRoYXQgcHJldmVudGVkIHByb3BlciBv
dmVyY29tbWl0IHNjZW5hcmlvcy4NCj4gDQo+IEFkZCB0aHJlZSBuZXcgdGVzdHMgdG8gdmVyaWZ5
IGdyYWNlZnVsIE9PTSBmYWlsdXJlIGhhbmRsaW5nOg0KPiANCj4gLSB0ZXN0X2V2aWN0X29vbSgp
OiBBbGxvY2F0ZXMgQk9zIGFnZ3Jlc3NpdmVseSBpbiBhIGxvb3AgdW50aWwNCj4gwqAgT09NIG9j
Y3Vycy4gVGVzdHMgZXJyb3IgaGFuZGxpbmcgaW4gTFIgbW9kZSBhbmQgZXhwZWN0cw0KPiDCoCAt
RU5PU1BDIG9yIC1FTk9NRU0uDQo+IA0KPiAtIHRlc3Rfdm1fbm9uZmF1bHRfbW9kZV9vdmVyY29t
bWl0KCk6IFZlcmlmaWVzIHRoYXQgbm9uLWZhdWx0IG1vZGUNCj4gVk1zDQo+IMKgIHByb3Blcmx5
IHJlamVjdCBvdmVyY29tbWl0IGF0dGVtcHRzIHdpdGggLUVOT1NQQyBvciAtRU5PTUVNIGFzDQo+
IMKgIGV4cGVjdGVkLg0KPiANCj4gLSB0ZXN0X3ZtX2ZhdWx0X21vZGVfb3ZlcmNvbW1pdCgpOiBW
YWxpZGF0ZXMgdGhhdCBmYXVsdC1tb2RlIFZNcyBjYW4NCj4gwqAgaGFuZGxlIG1lbW9yeSBwcmVz
c3VyZSBncmFjZWZ1bGx5IGJ5IHRvdWNoaW5nIHBhZ2VzIHRvIHRyaWdnZXIgcGFnZQ0KPiDCoCBm
YXVsdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTb2JpbiBUaG9tYXMgPHNvYmluLnRob21hc0Bp
bnRlbC5jb20+DQo+IA0KPiBTb2JpbiBUaG9tYXMgKDEpOg0KPiDCoCB0ZXN0cy9pbnRlbC94ZV9l
dmljdDogb3ZlcmNvbW1pdCB0ZXN0cyBmb3IgZmF1bHQtbW9kZSBhbmQNCj4gwqDCoMKgIG5vbi1m
YXVsdC1tb2RlIFZNcw0KPiANCj4gwqB0ZXN0cy9pbnRlbC94ZV9ldmljdC5jIHwgNjg5DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDY4NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpXaGF0J3MgdGhlIHJlbGF0
aW9uIHRvIHRoZSB4ZV92bUBvdXQtb2YtbWVtb3J5IHRlc3Q/IENvdWxkbid0IHdlIGJ1aWxkDQpv
biBhbmQgcG9zc2libHkgZXh0ZW5kIHRoYXQ/IChJIGFsc28gaGF2ZSBhIG1vZGlmaWNhdGlvbiBp
biB0aGUgcGlwZSB0bw0KdGVzdCB0aGlzIG1vZGlmaWNhdGlvbjoNCg0KaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjExNDgvDQoNClRoYW5rcywNClRob21hcw0KDQoN
Cg0K
