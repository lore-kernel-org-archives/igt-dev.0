Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153EDC021A0
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 04:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4E910E4B3;
	Sat, 15 Feb 2025 04:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXiZZYXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D3210E4B3
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 04:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739595007; x=1771131007;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Rjj25IgZZJ3oS/uVYjLsJ1kBYpB7tQa1/Upm9ySDQWU=;
 b=LXiZZYXlV9mzzz98RSq1zZQLEToPnDvwdl2lH67Lx3rLj65OBUV5buz+
 tNOPdTV6ULYiaSVWcJXObtoJ5QglheCqf8HouYSH0zx7CwonVJrLzSGXl
 /oL1Yds/wcisC/H7HLCjm9lBrfEHbBFP1U1mXL1KHeKVTcI7nMh92zsgt
 Po9wKRKRdxptB7G0uLX9Q5JzB6wuHqrY97BH0+rIPJlTmI4H7nnERihlE
 81sXF9PDqL/dPt64T9G7oWkiqlSSpgX4PGn8N6BEkHnYXfNou9D1OCrrC
 jNnV6Do4T9wgYDkSNOAUsgRiUl6S99z3Au3PhL3Fzw5ieiAjrDUvaSVt6 w==;
X-CSE-ConnectionGUID: mA3O1qFYToqMZ4FqKxdknw==
X-CSE-MsgGUID: M4HRYk5oS1+CMAtB2M/SUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39583291"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="39583291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 20:50:07 -0800
X-CSE-ConnectionGUID: SMDh+j2nSN+BnzkTmXj8/A==
X-CSE-MsgGUID: FkQUpUz6TR6lW3ISBDzY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113362762"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 20:50:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 14 Feb 2025 20:50:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 20:50:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 20:50:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvGcdY0XfC5spnWO13ptZu2q9D05QR1qzFsgp0aOyVSPE0oNzNGtmMXh36YyjUfTL9Ev3IoGIREjApQfBGsgKaPh9CqfFPh8YOKIhHIYymUQn2uXs6zWpoIStBBm6tSxCD66JJ2wCxG8enlVQTDCMOqgz/wpkCnsZuOLKXgEjWsW+sdH7QdHDTat9+BuRbvJL67BPRZXQ0lrLEBvKz7sMjPCtLydZeWDH/7RyHUU0/73yHqBhRVDIYGl8WTMrSEeUe1IuZirOWRQwV6eDYgSaOtRwjzOLBM3T2xC+F3sGqJS0BPJWTXyeX0gcM/iCe+eTYZDks072foN1GJ7Ye9W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjj25IgZZJ3oS/uVYjLsJ1kBYpB7tQa1/Upm9ySDQWU=;
 b=vJilxZjJxnYHZSnHSCC1a4G91O88qc1tsDrVh2gVeel1eeiwyDOwMtrgLWZKYJQMAbm2HSre/Yhl1IWvB6TaIm5++xZefYpEuPLGb2UOSb/T5y01T6A3V3Gd0mWnBq7wC8XqUMm6pkgCr8Vo3SHhTsMt9D2kKbzbugazaxOW691hb3Qpa3fZvpV1roAKgeVzvxgsSVXz3pOS/A1P4YJFURm3vkzV+3b63XvhSX1W0N46J4zAZiMbkc7lK3U92/RwNDTJCBSXwql6X8hkuJr7as37coLx8HNTLhTi6Wtwtuz5rn7It/Kz2RfOQQz1wHphYZQBoGT2h4iQBmuZOhNTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Sat, 15 Feb
 2025 04:49:21 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8445.016; Sat, 15 Feb 2025
 04:49:21 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH] lib/intel_compute_square_kernels: Extend compute test for
 ptl
Thread-Topic: [PATCH] lib/intel_compute_square_kernels: Extend compute test
 for ptl
Thread-Index: AQHbfq7WFqEfwu4Hwk288jrBswRKj7NHzGDg
Date: Sat, 15 Feb 2025 04:49:21 +0000
Message-ID: <CH3PR11MB84346750C0819E52806807E78DF92@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB8750:EE_
x-ms-office365-filtering-correlation-id: ba2b9187-28cc-437f-50bd-08dd4d7c1ce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dU9OT2V0SnVXRUlMZG5iL1pHWWNpOE51N3p3UGR4RURoelRtcUgzMURGNEc0?=
 =?utf-8?B?ZklVL2lCamlhNVFHTUh6SlZqckZxcjFzZVJQK2lDeWtMeERtMVhDOTNUZjZI?=
 =?utf-8?B?Z0ROeEtvMGxkK05BR1dVaHQvYklEOHdHdzZnNDJtTWhtTzV4Wmp3bmx3L1Br?=
 =?utf-8?B?Wno0RVhyQTBaMzRJcjZPb3dSUHpIWTFNVTI5TW9nSWNqdWkxMjZYM1V4L0Mv?=
 =?utf-8?B?ZGhlNEZNSGFzM0FmczBoSWdiMWRNcFBodzRLa09KT0ZRY1hrOVowWFhaS3hF?=
 =?utf-8?B?a01rQnJZdVdJS2xaZFk5clFmREJjYnIxRFhvcEQ3eG1JVlFnaGgyUk1rOTYy?=
 =?utf-8?B?N1N0Z3hJeFAzanJsbVNBVWtOMjNpRnFTckpMUHB6ODhRTmVEbm0rUk1Xc213?=
 =?utf-8?B?QzU3WDBDRW04ZXhSR3g1aFNncW1jd0tsUklpS2JKTmlpUnEyV1NWeVA4SlJV?=
 =?utf-8?B?TlRXRG4rRGg0NFlKSlJOZXM5Q2VybVA4THRNZjQxM0FreDdac2JDRy9zYWZ2?=
 =?utf-8?B?TzN2VDZXT1ZxMWE0eTBnRXlPMld6cTFJWGhyVmtybUZQU2VVMTlXRGpTdEYv?=
 =?utf-8?B?bjZQZE9wbnJJTVBiYVB3byswdENDVE1yOWNSbm5pKzZIMzRSTjFTOVI4VUIy?=
 =?utf-8?B?Y3RFaEhoV3QrNkRNSGxTSFR5WE9Rclc5SkVvMmIzNjk4NTk1QS81dU83aGly?=
 =?utf-8?B?NGpSQVpFYnc4Y1ZOcmR5K2ZLMUFtaTFNQWdKbE9HNXRuenoydXcvenRwRnFX?=
 =?utf-8?B?VkVJUWo1Nm1RS0F1N2tveGhRVlRxN2tzNXBCcnAwWDUyZXZpL3MxRHZwQkQr?=
 =?utf-8?B?VTBMNnhJTFZWemRKWjlzK0ludno2Sm8zbVhsSUxBZ1FxNUMrTFJVYUw2WkM0?=
 =?utf-8?B?QzdaTEpIZEpJM2NZZ0JvQkVQMkNTMk5wRlVtKzE3MUNaaVBKWktZbUN3eGRB?=
 =?utf-8?B?cVV1Zzg0V1hSeXFkMmtWNXZyY0UrS3V4TDhYeHhSUDZCOE1FQ2NhSk9rTHg2?=
 =?utf-8?B?SGcwME83N0pmbjAwMVp1Y0VGdjVyL01GTk1VVjhxMTFKb0lhbC9tMS9zR1Q0?=
 =?utf-8?B?eXNTS01MU0s4Q1pDWTJiRTFDNEJTMm00YXVPaEhVTmpvMHBZUWk3Mnl2cWJI?=
 =?utf-8?B?Z2JEYjZiUGVGS2kzSEtpNnVtaEhtYzZjdlVtOGlGNkdLbWttT1hzSFN2RzF5?=
 =?utf-8?B?N1ZDMjBJcit6YmxkZDF2OVRTalRaS3l5WFNtaDJTYk9FMnBFQ0NkWmx0Ungy?=
 =?utf-8?B?UDVZS3N3djJuenMxakx1OHNpbTh3cnNHdnQyVXVzeGRzcDh5QjR6ZHQyWHVV?=
 =?utf-8?B?L3dPR3RCaklrUDU5eG1pL0JLdUJWQUN0TzhEb1ZoQjVQdDZEQVZuRnkyZ3ow?=
 =?utf-8?B?bkpWaFV3c1NhRjNnNzV6d0pwS0k3VkM5d1p6SWFpL3dubFhqdk8rVWZnM0My?=
 =?utf-8?B?QWRvTVFVTXlITnUxUzZXWTJUbWw1Rm9BQ2ZucWhtbEN0cTIzS05kalVDVFRX?=
 =?utf-8?B?a0pCTENqYUV6anlnM1cva2FpZHozUG11a0xpVHZaUTlIUkdJenRYa2NrZHdl?=
 =?utf-8?B?R1Q2U3BxZEdvM1JZZnFXK29JVTA0VFczQkJnSlhaazRidnBzZ3FjOWl4N25k?=
 =?utf-8?B?RzcvY3FFMUtXVmlvd3h3OWcrbTUveGxobFl0UGl2bG1ucjVsVnlNWUZnNlNY?=
 =?utf-8?B?b0pJTncza1BSdnU2SFFYUTQ5ZTdCYzlkVzRtN2h6QkEreVYwdTB2eWpmbit5?=
 =?utf-8?B?N2VGcjQzWndOZnZsZ25ZLzVSdzJBQkhmamxVM1FXMmVBUEl5WXVGVC8zVHZa?=
 =?utf-8?B?VmpiYnpSSkJIaWF3YjFaUW9lQVNINmpNNWFHUis0S25TZ3ZycjJadFY3Q2sz?=
 =?utf-8?B?NWQ1dTBKeU50UXd0V3dlSXF1UFB6eDZNd2FERERiY0FSRTNVSUtTeEZXcDdM?=
 =?utf-8?Q?2R3uTmrg+kVY5P1cU1NuTyanP2eHefL/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkFKSTBOM1Q0YmZUcEx4VFpCZzJ5TzdnQktRdFNEQU56bWZ5L0kxdmpoWVlO?=
 =?utf-8?B?TDJlUnlsM3Y2R2ZyaGo4enRDaU5MT3V3Wk93ZFVPOEVYZlBSbVhnbjdsMEha?=
 =?utf-8?B?ZWY0cGJwNDlNZXVaT21QaXZSL09lVFUrUm5hRldUMkNER3FQTGlCbmYveW9m?=
 =?utf-8?B?ZDR5YS8xY2dTdHJJZldINU51d3hNa3RNME5XTklvZVFWT01nb2d0Tk40ZGxF?=
 =?utf-8?B?endRVlpqOUNITGR2VXhyQWp2VHRFMXhFSWpHQ2ZpeXFVWDF1MlRvbFYrMkk0?=
 =?utf-8?B?bkFPUDB0MUdvUlVkUXpFd3RNU2wzUllvK3Q2WXh6MUN5UC9tY3pYOWx4ejBz?=
 =?utf-8?B?WWhGalBaaEsyTEZrUjJtMS81QWtlanEyVHlpdkNWendkUm1EN0p6QkNVNm5p?=
 =?utf-8?B?Wld6MkdkNXI2ZjVuZ1BEQUI4V2ZESlVGaEtyUnBTOUJoOGVtMHRQbzdLdlpl?=
 =?utf-8?B?UXFtbjV3WVF3R1llL3M4RHd5SkR6bVBqSXU0UUV0a21LTldrVFFhZEVFckdp?=
 =?utf-8?B?eWxTRmlpaWZUMjhOMXhtazUrOU1KZENoWEY3ZnYvK3ZxOWcxM1NZaXRJakVG?=
 =?utf-8?B?QldndEJjVFd4K3g0TnBOcFNhU0JFb1FRQ1Y4VzNNckdvTjRzS25FalFVR3V4?=
 =?utf-8?B?NUhaS0xaOFJpV3dONHF2Skp3VkxiMU91MUhORUhYbEE1VENadGViSVRUNVNa?=
 =?utf-8?B?SUpsT0VEU0U0T25LUzBPWlRTS1B3VENnek1SUldwVWx0THFFcXY4bGgzWlFY?=
 =?utf-8?B?eHVjek14alZLeGhDNk1handDSU55aGJiV1FQWktYVFdQM3pkaC9jSzlaN3lP?=
 =?utf-8?B?SFBEVU9rS0NhUm9UTGU5RndXanNUTGRKWGY3UEpwQkZ1VU4zY2VVNTM3dldT?=
 =?utf-8?B?MDZBbmttVkJHN0NLN0Y2VFVtSzVFQVRnQ0o4anRTT3VNa0hmWnhYZlhvT0JO?=
 =?utf-8?B?WDYrU0phUVFBUnFHVDRFSXVEVzJJK05XYmptM0JHSStkcTBsZHNzb3lqYlJN?=
 =?utf-8?B?UldXMUNTMVRKVEs2RU1NWmdHN3ZDUXh0ZzZ5WDh3c1U2TkgvVGllbVFBNGR6?=
 =?utf-8?B?UFlGZkpUblRHOHFMZkMxUGh5TlFPMGdieFlEZ0JIT2pmUGtLZHA0TmM4L2hu?=
 =?utf-8?B?Sk1hQko5aFFIR0R5RCtkcDJYa3RZdHZTS05NdFF0R0xxeGhudnBYalhlYTlB?=
 =?utf-8?B?RVprTEQ3L3REOW1qaXNISmdRMkRMV0VFd0tWY0VtY1V2WGlid01FM0t2L3Nu?=
 =?utf-8?B?M3QvUFl3eE9qaUQ0Y3ZzSHA4N1FGb2VjMlNMaS9hRE1QRUpIVDVJV0lPZnIy?=
 =?utf-8?B?RTFrVzFGRFUrbFlERVlxQmJjS0hlcGg5cTNQTUZVUUIwaE84ajJvVXNLTmIv?=
 =?utf-8?B?cHdLWSswS3Nsc1d1R01NeWM1MW1nYnJabFhlN0FuYXJUajNITHR5c3p2RzJ0?=
 =?utf-8?B?TkxTSWw0NkVJU3BMNnB5Q3lYVTVMRkd0QURPekNJM0orNGtoWGRVRXpJQjhO?=
 =?utf-8?B?dTRyL1Ntd1JwbUhZdHNLQ3N2V2JNdUxPaXVWVk42WHB1ejkrWTZNdjcvNWQv?=
 =?utf-8?B?VXR4RkRKTngrcVljSkVjaExHSXFweFMvOGIzdVJtbEJ5eVVBZGRpdm9LS25D?=
 =?utf-8?B?YzhUd1QxQUtUU2hSNm5TbEgxUG1hN1ZLcDMzais1UldlT3RocUFvSkpFVmF4?=
 =?utf-8?B?UDNYQ2lqQXdrY0dBektLUmRMVjg4bkRIWElwcWhhMGVTS1hSMXFpMDZXdU1x?=
 =?utf-8?B?OFN4bzlySHFUTjBpd29zNlRyckFkRVFyZTJpbEJkQ2V3QnZJQUZtRmtWblQx?=
 =?utf-8?B?SDZYcjZVRUxCMmk1Mmpha09SWndNMG9ZMjdFNTAwSWhPVXV4bUo1RFJMT09j?=
 =?utf-8?B?OUxQclVLbjVjVEpaeDBYK3RvTzBlcW8zMG9pNWhGUVdWY1pxNjhhSXJnWkRw?=
 =?utf-8?B?dWZIeVczTUJ1M1ZxRUNIanZmcjgyaE5JVlpnTUlycCtIbEhhVjh2bWZSbXE4?=
 =?utf-8?B?VFFlU2M5MG13WkZIZGEyZkkwMUdXajladjQ2OTJMRE9obnI3SUxGZEs1TWV5?=
 =?utf-8?B?Uy85U1J4Sk9hUzJnMjlKVDZqZmdJMmVCRlFvbkQvais5cTQ5bCtyTEtWMUdJ?=
 =?utf-8?B?VUszcnJuT2ZVRHNpQVlvaXNxemxwSkU0citFY09xdUJEWjlOTjByYkVjVkNj?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2b9187-28cc-437f-50bd-08dd4d7c1ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 04:49:21.2344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RignB4xMQuRi2GE0pb8dcIaCoqLV6PyAZ2eiEGiiPlko1uEw6K+UqnfkvNF5MUPMPRDPQJtHdM3oz31X9jyWuAakgNvlW9Vyz4OJcFbkQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IHNhaS5nb3d0
aGFtLmNoQGludGVsLmNvbQ0KPiBTZW50OiAxNCBGZWJydWFyeSAyMDI1IDEyOjM1IFBNDQo+IFRv
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2gsIFNhaSBHb3d0aGFtDQo+IDxzYWku
Z293dGhhbS5jaEBpbnRlbC5jb20+OyBLZW1wY3p5bnNraSwgWmJpZ25pZXcNCj4gPHpiaWduaWV3
LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBsaWIvaW50ZWxfY29t
cHV0ZV9zcXVhcmVfa2VybmVsczogRXh0ZW5kIGNvbXB1dGUgdGVzdCBmb3INCj4gcHRsDQo+IA0K
PiBGcm9tOiBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiANCj4g
Q3VycmVudCBjb21wdXRlIHNxdWFyZSBrZXJuZWwgdGVzdHMgZG9zZW4ndCBzdXBwb3J0IG9uIFBU
TCwgdGhpcyBlbmFibGVzDQo+IHRlc3RzIHRvIHdvcmsgb24gUFRMLg0KPiANCj4gQ0M6IFpiaWdu
aWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiAt
LS0NCj4gIGxpYi9pbnRlbF9jb21wdXRlLmMgICAgICAgICAgICAgICAgfCAxMCArKysrKysrDQo+
ICBsaWIvaW50ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVscy5jIHwgNDINCj4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfY29tcHV0ZS5jIGIvbGliL2ludGVsX2NvbXB1
dGUuYyBpbmRleA0KPiAyMzM4MzVjNmMuLjUzNTAzODlkZiAxMDA2NDQNCj4gLS0tIGEvbGliL2lu
dGVsX2NvbXB1dGUuYw0KPiArKysgYi9saWIvaW50ZWxfY29tcHV0ZS5jDQo+IEBAIC0xNzI5LDYg
KzE3MjksMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB7DQo+ICAJCS5jb21wdXRlX2V4ZWMgPSB4
ZTJscGdfY29tcHV0ZV9leGVjLA0KPiAgCQkuY29tcGF0ID0gQ09NUEFUX0RSSVZFUl9YRSwNCj4g
IAl9LA0KPiArCXsNCj4gKwkJLmlwX3ZlciA9IElQX1ZFUigzMCwgMDApLA0KPiArCQkuY29tcHV0
ZV9leGVjID0geGUybHBnX2NvbXB1dGVfZXhlYywNCj4gKwkJLmNvbXBhdCA9IENPTVBBVF9EUklW
RVJfWEUsDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS5pcF92ZXIgPSBJUF9WRVIoMzAsIDAxKSwNCj4g
KwkJLmNvbXB1dGVfZXhlYyA9IHhlMmxwZ19jb21wdXRlX2V4ZWMsDQo+ICsJCS5jb21wYXQgPSBD
T01QQVRfRFJJVkVSX1hFLA0KPiArCX0sDQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBib29sIF9fcnVu
X2ludGVsX2NvbXB1dGVfa2VybmVsKGludCBmZCwgZGlmZiAtLWdpdA0KPiBhL2xpYi9pbnRlbF9j
b21wdXRlX3NxdWFyZV9rZXJuZWxzLmMgYi9saWIvaW50ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVs
cy5jDQo+IGluZGV4IGIwOTEyZTdlNC4uMThmOTBjNGZlIDEwMDY0NA0KPiAtLS0gYS9saWIvaW50
ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVscy5jDQo+ICsrKyBiL2xpYi9pbnRlbF9jb21wdXRlX3Nx
dWFyZV9rZXJuZWxzLmMNCj4gQEAgLTM4ODksNiArMzg4OSwzOCBAQCB1bnNpZ25lZCBjaGFyIHhl
bHBnX2tlcm5lbF9zcXVhcmVfYmluW10gPSB7DQo+ICAJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMA0K
PiAgfTsNCj4gDQo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBwdGxfa2VybmVsX3NxdWFy
ZV9iaW5bXSA9IHsNCj4gKwkweDY1LCAweGEwLCAweDAwLCAweDgwLCAweDIwLCAweDgyLCAweDA1
LCAweDFmLCAweDA0LCAweDAwLCAweDAwLA0KPiArCTB4MDIsIDB4YzAsIDB4ZmYsIDB4ZmYsIDB4
ZmYsIDB4NDAsIDB4MTksIDB4MDAsIDB4ODAsIDB4MjAsIDB4ODIsDQo+ICsJMHgwNSwgMHgxZiwg
MHgwNCwgMHgxZiwgMHgwMCwgMHgwMiwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgzMSwNCj4g
KwkweDIyLCAweDAzLCAweDgwLCAweDAwLCAweDAwLCAweDBjLCAweDA1LCAweDhmLCAweDFmLCAw
eDAwLCAweGZhLA0KPiArCTB4MDMsIDB4MDAsIDB4NzAsIDB4ZjYsIDB4NjEsIDB4ODAsIDB4MjQs
IDB4MmMsIDB4MDIsIDB4MDAsIDB4MTAsDQo+ICsJMHgwMCwgMHg2NiwgMHgwOSwgMHgwMCwgMHg4
MCwgMHgyMCwgMHg4MiwgMHgwMSwgMHg4MCwgMHgwMCwgMHg4MCwNCj4gKwkweDAwLCAweDAyLCAw
eGMwLCAweDA0LCAweDAwLCAweDQwLCAweDQxLCAweDIyLCAweDAzLCAweDgwLCAweDYwLA0KPiAr
CTB4MDYsIDB4MDEsIDB4MjAsIDB4NTQsIDB4MDUsIDB4MDAsIDB4MDEsIDB4MTQsIDB4MDIsIDB4
MDAsIDB4MDAsDQo+ICsJMHg1MywgMHg4MSwgMHgwMCwgMHg4MCwgMHg2MCwgMHgwNiwgMHgwNSwg
MHgwMywgMHg1NCwgMHgwNSwgMHgwMCwNCj4gKwkweDA2LCAweDE0LCAweDAyLCAweDAwLCAweDAw
LCAweDUyLCAweDE5LCAweDE0LCAweDAwLCAweDYwLCAweDA2LA0KPiArCTB4MDQsIDB4MDYsIDB4
MDQsIDB4MDMsIDB4MGUsIDB4MDEsIDB4MDQsIDB4MDEsIDB4MDQsIDB4MDQsIDB4NzAsDQo+ICsJ
MHgxOSwgMHgxNCwgMHgwMCwgMHgyMCwgMHgwMiwgMHgwMSwgMHgwMCwgMHgwNCwgMHgwNiwgMHgx
MCwgMHg1MiwNCj4gKwkweDQ0LCAweDA1LCAweDAwLCAweDAwLCAweDJlLCAweDAwLCAweDE0LCAw
eDE0LCAweDAwLCAweGMwLCAweDAwLA0KPiArCTB4MDAsIDB4ODgsIDB4MDAsIDB4MDAsIDB4MDAs
IDB4ODgsIDB4MDAsIDB4MDAsIDB4MDAsIDB4NjEsIDB4MDAsDQo+ICsJMHgwMCwgMHhiNCwgMHgx
NSwgMHgwNiwgMHgxMCwgMHgwMCwgMHg2MSwgMHgwMCwgMHgwOCwgMHhiNCwgMHgxNywNCj4gKwkw
eDA3LCAweDEwLCAweDAwLCAweDY5LCAweDFhLCAweDEwLCAweDAwLCAweDcwLCAweDg2LCAweDA1
LCAweDE5LA0KPiArCTB4MDQsIDB4MTUsIDB4MjAsIDB4MDUsIDB4MDIsIDB4MDAsIDB4MDIsIDB4
MDAsIDB4NjksIDB4MWEsIDB4MTAsDQo+ICsJMHgwMiwgMHg3MCwgMHg4NiwgMHgwNSwgMHgxYiwg
MHgwNCwgMHgxNywgMHgyMCwgMHgwNSwgMHgwMiwgMHgwMCwNCj4gKwkweDAyLCAweDAwLCAweDQw
LCAweDFhLCAweDAwLCAweDM4LCAweDA4LCAweDE5LCAweDEwLCAweDA1LCAweDQwLA0KPiArCTB4
MWEsIDB4MDgsIDB4MzgsIDB4MGEsIDB4MWIsIDB4MTAsIDB4MDUsIDB4MzEsIDB4MjMsIDB4MTcs
IDB4MDAsDQo+ICsJMHgwMCwgMHgwMCwgMHgxNCwgMHgwYywgMHgyNCwgMHgwOCwgMHgwMCwgMHhm
YiwgMHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkweDAwLCAweDQwLCAweDAwLCAweDAwLCAweDM4LCAw
eDEwLCAweDE5LCAweDMwLCAweDA1LCAweDQwLCAweDAwLA0KPiArCTB4MDgsIDB4MzgsIDB4MTIs
IDB4MWIsIDB4MzAsIDB4MDUsIDB4NDEsIDB4ODMsIDB4MjAsIDB4MjAsIDB4MGUsDQo+ICsJMHgw
YywgMHgwMCwgMHgwYywgMHgzMSwgMHgyNCwgMHgxNSwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCwNCj4gKwkweDI0LCAweDEwLCAweDA4LCAweGZiLCAweDE0LCAweDBlLCAweDAwLCAweDAw
LCAweDJmLCAweDAwLCAweDE0LA0KPiArCTB4MDAsIDB4MDAsIDB4NDAsIDB4MDAsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MTAsIDB4MDAsDQo+ICsJMHgwMCwgMHgwMCwgMHg2MSwg
MHgwMCwgMHgxMCwgMHgyOCwgMHgxNCwgMHgwMiwgMHgxMCwgMHgwMCwgMHgzMSwNCj4gKwkweDIw
LCAweDAyLCAweDgwLCAweDA0LCAweDAwLCAweDAwLCAweDAwLCAweDBjLCAweDE0LCAweDIwLCAw
eDMwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDAsIDB4MDANCj4gK307DQo+ICsNCj4gIGNvbnN0IHN0
cnVjdCBpbnRlbF9jb21wdXRlX2tlcm5lbHMgaW50ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVsc1td
ID0gew0KPiAgCXsNCj4gIAkJLmlwX3ZlciA9IElQX1ZFUigxMiwgMCksDQo+IEBAIC0zOTMzLDUg
KzM5NjUsMTUgQEAgY29uc3Qgc3RydWN0IGludGVsX2NvbXB1dGVfa2VybmVscw0KPiBpbnRlbF9j
b21wdXRlX3NxdWFyZV9rZXJuZWxzW10gPSB7DQo+ICAJCS5zaXBfa2VybmVsID0geGUybHBnX2tl
cm5lbF9zaXBfYmluLA0KPiAgCQkuc2lwX2tlcm5lbF9zaXplID0gc2l6ZW9mKHhlMmxwZ19rZXJu
ZWxfc2lwX2JpbiksDQo+ICAJfSwNCj4gKwl7DQo+ICsJCS5pcF92ZXIgPSBJUF9WRVIoMzAsIDAw
KSwNCj4gKwkJLnNpemUgPSBzaXplb2YocHRsX2tlcm5lbF9zcXVhcmVfYmluKSwNCj4gKwkJLmtl
cm5lbCA9IHB0bF9rZXJuZWxfc3F1YXJlX2JpbiwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLmlwX3Zl
ciA9IElQX1ZFUigzMCwgMDEpLA0KPiArCQkuc2l6ZSA9IHNpemVvZihwdGxfa2VybmVsX3NxdWFy
ZV9iaW4pLA0KPiArCQkua2VybmVsID0gcHRsX2tlcm5lbF9zcXVhcmVfYmluLA0KPiArCX0sDQo+
ICAJe30NCj4gIH07DQo+IC0tDQo+IDIuNDMuMA0KTEdUTQ0KUmV2aWV3ZWQtYnk6IFByaXlhbmth
IERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCg0K
