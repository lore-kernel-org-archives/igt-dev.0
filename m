Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0171DD1039A
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 09:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A051F10E599;
	Wed, 26 Nov 2025 09:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoiJyT+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719D10E599
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764150805; x=1795686805;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YGk8AGIIB22tg/rn9gzumlQS/9XaJcoJ+xAR2deDJT0=;
 b=XoiJyT+0nZzpMSqdbKqnO+ZWl+ffhdb5BCvyBXaaY+BT7ZjV+FUaKF8Z
 UyoAYJmbh9hKQdqon1Alj8vSlEVsTWRgOmgXF5PFaqCxrIlrvAI3zbp+C
 XNUiMcWJAo92p4DUSygmsDtw+pkQqt2HlC9twgZVLWDwCKHgYEjP8KOEs
 iZ4mwx8YBMiU8Du1SKMhh3PfucffTH/kIX1NgaPE4w5Lx1gdkLSQrDolb
 Hneyd0fdPZsDv0k8HYL9dM8bpY/feHZ+0cg0JT8a6blcgB89D+5l28PRn
 sxIuNdIqxu9/SrJosTZEquJ2J6L+hJT4B/1nFa8POXsX6c0+kDR+/m1Xf Q==;
X-CSE-ConnectionGUID: KnLdv4PwS8WN9M/Ju+gAPA==
X-CSE-MsgGUID: HeeMeFBsTUe7gItlJal28Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70046469"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="70046469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:53:25 -0800
X-CSE-ConnectionGUID: 2DKck42JQwm0XEnXa4/8Qw==
X-CSE-MsgGUID: TKd1X9AUS0Cmm4JmCi27Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192984465"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:53:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 01:53:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 01:53:24 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 01:53:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NngMe2unw0QEzqb/g1S6TmG5j4GxwpyqIJMGetzBcWF4mali1YdzmbBGjamPAHJKvnFym5Llwo0hoCSjCP7sQgn4SBzPSV/Fy8/vhwWsA0BaplDxos+MVQfWHd98vz5egn5iDsoxQaNnNnoARkV0Nqzqbc4EB3Ve+KLEBEuk6i5PmCLk8Oat6u7J2cBm2oxxELKxwPYIbcXei8t5GuTs8OfKgFkJ4wFyOnWMWMfPZ58mzyFl6MUedye+2CGKry1ipaUh20Cp4tACs5f93O4+S0o53VllEVWvbJlr11hVPvHxWUjpry5GXAGupZ2TyfBox24u7j17aSFfyqEcUhyE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGk8AGIIB22tg/rn9gzumlQS/9XaJcoJ+xAR2deDJT0=;
 b=M/1Ce3p10770Tdzf78xvCoDivq6nQ3Dw5u3DtNTJ8xmxJFGbi++0lAmDSGl3yYj185SVgwHZ/tGLD0xQiICmhqirZBkr0c4YcWq0RzfeiWHR4sCp4JocTWHFCNsrvgaxu8GG1n1PdUdVjLBYpsOY0KiMwMAHjlOrrH9gDsD4d5gEjTCgGhjPVtnlqs1U6AlUZ0WMqh9JK2ouni54Rb7bXR1g0P0Yfr/jnI7y/GpSq57gy/QrcrLNVskNo+2UUNnVc7FVJ1J8QNHAFPKG6QP1mynrHpUow35SaHg2H9BDKm4ZYI+KDqy72HSmmhYqJJC0MN6ZHCxvFMHM9GOBHsKD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:53:10 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 09:53:10 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v8 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Topic: [PATCH i-g-t v8 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Index: AQHcWwN/GQ4PUP5HXEW2GDD2/Kd+wrUErg0AgAAQhrA=
Date: Wed, 26 Nov 2025 09:53:09 +0000
Message-ID: <MW4PR11MB715168051FCD69FEE07F1CC9E4DEA@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-2-nishit.sharma@intel.com>
 <92e6fc8a1fa843c36eb3432c3611c32339d204ad.camel@intel.com>
In-Reply-To: <92e6fc8a1fa843c36eb3432c3611c32339d204ad.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|DS0PR11MB7441:EE_
x-ms-office365-filtering-correlation-id: eeaed9ee-abe8-431c-c8b2-08de2cd19b62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?bDNLaTdCSEVRYnI5eW1FYTlRMjdMUGRCZGNlem5qaklhUDJxRmdtVG40ZUhu?=
 =?utf-8?B?ZU1TQUsxR1ZJbnQvK3NQY25TQVo5R2pnd3VJYlFqa2VmT0YxaFA0QW1ITFVF?=
 =?utf-8?B?NFpobjNCWFNkemJ1N1Zzd3czTWRBUTdwNFRyS0VvYkczZnFCMEl0bkNqRGZH?=
 =?utf-8?B?SzhQZytxQU5DWWhPOGc4SzFVVSsrSUZJU0ZCVy81eG5qK2I1WVJVdUtSK1Jn?=
 =?utf-8?B?aURpTENWS0F5MEFLMGQvMC9XN3VHZVNkMDhJajBPWEoyeXR0U1hFd2lmUFZw?=
 =?utf-8?B?bFh2bFI0c0EwZ0VKQnh6dXBFRm1FTXlGUWNhMkRTZVRqa1UxZXdpcWVMV1p3?=
 =?utf-8?B?YjE3ZlhFNXVPZnBKc1BaL205QXdRb0RDZGFGY3dkR3RUaU1zaVdmQi8zUjlP?=
 =?utf-8?B?T0xzbGxLQTBjb2FZM1VPY2ovbGlxR3dnNFZNSzRkUTFMb3puenlqQVBQYVNX?=
 =?utf-8?B?ZTRSTmtncWF5TGc3Y1lFNHUrR1I1M2RwZnN6VlBJcUFrdHNjTHhMbStnL2sy?=
 =?utf-8?B?S0k4WXU1TEM0K0FkaVhraFYva3VXcWtlYmQ0L0NydUpoZmxFK1BCZ2RwNWZa?=
 =?utf-8?B?ekZ0N3NDYVRGU01zK0p3N3FrNzlZVlVLN3VyNlE2NnJHK28yc2tSQlBScng1?=
 =?utf-8?B?Ty9mRnFraTdXRHRjTHdYcGRwM3N4OFA1RnhNa2hOZGNObUlIVFRFYjNKQzd4?=
 =?utf-8?B?V1J6MVZJQXBIbFY0d29KMmNzc04vQ3pnZHMzMWxkQ1VLamx1dFY4Q0s5RDNz?=
 =?utf-8?B?TGVueTlYczFPTFNsekthUU94SkhaaUZhSFl6bTlKUTNzTFU0STN1cmpxZmdV?=
 =?utf-8?B?ZUl3ZXl6NExLN2piR3hZTi9ZcWlzTk5lNEltYTV3cVpUNTk5S24yeks0Tjlw?=
 =?utf-8?B?b2tZTWNEeGZKZTdka2JGZWtJS2xmZThZNHhLRkpuRjNSQm5QK0RzWFlYRmlF?=
 =?utf-8?B?Y1NZT2hsWkp4ejIwODZXTzJEcEtGbCtsZXJnRjRXR0lFTUZTSmtqTVhjbGNN?=
 =?utf-8?B?OHV5SjBhYitkZ3BiVXFKWnJOWmxCU05TeVhNMno3U1E2bXlaQUt0VmdHck1k?=
 =?utf-8?B?RkI1V1JyUFVXZUlQM01iMzE2SFU4aGhnckVsVkx3a1dhTnB2UFhPSkpXdDJ1?=
 =?utf-8?B?eTR3S1NJTTczc3NOcCs2WVhuT0Q4Y0lVV05vRWhyODFqaHd3c0x4RzZLcHI2?=
 =?utf-8?B?Y3RDbG1ZNndSK0RkSGUrSWZDcFdqK0dJM2tjdXRjZXVjZ3pNQVJGcUdnNjVv?=
 =?utf-8?B?QnllWlg0R2QrcHRLTWo1TTdzdmlZRlphYkNieDdXM2EzRWRUNVMvMDBhR2E0?=
 =?utf-8?B?Q2crZEE5Rk5mcWk1ampMNzZXM084QTMyQWFiK2JlaUVWbW84dDNJNHJieVJk?=
 =?utf-8?B?T2JmVi9pQms0a2RyUis3d1F3bXlLQi9ER0lnTVNTMmpOT0I0cmRxOEp3REdu?=
 =?utf-8?B?dlhOMmMyWDhWYnd3blNLcndjVTlnb3UxRm8xS0E1elFJc1Z4ZFh6UEdJdUZ4?=
 =?utf-8?B?aFVLQWp2UGQ4SWdud3l5L1NOVStReGs0RW1aS1VPWDdMU0JMWWFGTHVXYWY4?=
 =?utf-8?B?cVlGQ1RJc1h6WG9oam5ZZEVES2tndEpCaTA3bDFLTlBZK285bUJiUFJRRDdx?=
 =?utf-8?B?QTJiMm1zMVpjQ01TUmVYVEtUVTRhUkVhd3lsejBoa0dwK2FUMXpRaVJpVE5i?=
 =?utf-8?B?QURLTVZQSEEvNDhWUng2dkJkclFLdGdCZGxVU0VhZGNRc29SaGZncDNuY0Rv?=
 =?utf-8?B?bGMycFlxbGlTQnlLY0UxZE9JRmFGVndmTnQvbFFIcGR2WTdwZDNoZmx3OGFi?=
 =?utf-8?B?aHNwY3lpWXRVOTVQZTZ1L25kQWFLK3UxekxFT0FhdlMvZStLZUJVdlNlTFNr?=
 =?utf-8?B?QUxZTklTTXd4N2dIb2wza1YxMkw5M1V1MnYrODZkMU1RQisxWHROVzNzc1R3?=
 =?utf-8?B?eW8xMFpGZWF1cVBLVUFDUFE1M2FvNUs0eDd1NkgyNXh6TEdZRjRPQ0ZYY0dI?=
 =?utf-8?B?K084WDRvd0FvOGpFTDhvNDhzTjFuY3pzaldXcEJtRzJFditRVHZjQWt2ZlIw?=
 =?utf-8?Q?iYB9pt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d05vZlJVdnBFdFNBdzl1bk1lMERrZk9nbk5jeW9OVnZYM2JhWWtENW1lVmlz?=
 =?utf-8?B?NVNvSjZBQWQ2Mmc0WmZJNldzY010UzUyUWJCSHg2MENyUkd3K0RqbVNhMTZQ?=
 =?utf-8?B?UFhMZUxzQzZYdWFNN1pweDlXWjlVdEJDTWdQc3pFajhhVzQyUWtnRzhFN09a?=
 =?utf-8?B?cDIya3MvQW4vY011NGIybW1YRzY1NnlVZUZKMS9odXdVZStaNSt1ZEJjTTJL?=
 =?utf-8?B?NHJDZE1DRC9ZSmlIaldYcDZSMTlEd3dUeW1iZGVLY2l6NU9ZaHZ5d2c4c3Vx?=
 =?utf-8?B?L2l0OWJvSWRBVFk3cTlTVldaazhaM2pTMVdIcXhhV3RXVHVuWkwxK09saTh0?=
 =?utf-8?B?S0lINFR1TTA1YktqdS9vNW1leW14SVdnRGtQVjduRSswQlpRVXF6MnpxTE9V?=
 =?utf-8?B?cFN5d3RGclkvL3BYVzU4dWdKTlF5L2NHajZONWVuQTI5M2ttZG8xYWlIMytm?=
 =?utf-8?B?UllqUW92U2RQd0ZzR1pKOThTcUZ1RkJzdnZTSENZR1NqZkMreGNXOUJ3WVNN?=
 =?utf-8?B?eXVqaXpDaXdnblk2VkdMUi8xSno1UVVTNTdndkdBaTFyMW13aStIaGtmS0xv?=
 =?utf-8?B?L0lOdm5kd3VOR0tyUmlqa0tSTFJ3M3EvdmorbTUvUXQ5TkxkWk9CSkhsQktj?=
 =?utf-8?B?WlVWdnV1V3RpUklrcHdtRVdENk5hOFFDZ2dOVlI5OCswWlI3VncrWkhTWjND?=
 =?utf-8?B?NVI2S3VmY20rMk54WksvOEczVFBrY2pGNVg2eEc3Z0Vydm9HZGJWNWFsVEdE?=
 =?utf-8?B?L29ySWJUTkJNMnVFWFJmcVRCa2tiMFdqb0kzalZzeUNGMzlLVkE4NFBwS1B2?=
 =?utf-8?B?UnZkL21hS2NhSmdJMXg2Vml6QmlMUURHN25UZEgrUkwzR0xqZDNnZlM5NExu?=
 =?utf-8?B?SHJXN3RXa2NJMEUxZHp0bTUvaXQ3bEcwcmwwR0NuMUdzYi9MNVRYZHRjVjlj?=
 =?utf-8?B?Zm41V0Z0WVNKNkRyM0N4OE1kZ3pwR3Q3am4rS0lrTWNVbGhjcG80M1dZR1RD?=
 =?utf-8?B?T0xLZ1dtVmttTTZQYU9LbzhIREMzemtVeExMT0JuWCtlRXI3Ky9rZ0hwekJt?=
 =?utf-8?B?QVNleEo4a3ZFVlJzemtSdE91VlpIQUtUL0tHLzVSTG1pNDlRRGhNYUhQdUFp?=
 =?utf-8?B?KzF3MW5CZG9JQm9ZT2lrMWIrSWEwaytyeS84eDN0eEtkRGVOblhyZ3ZoS21Z?=
 =?utf-8?B?c2F5bkFnTVVhRFc1MEl2Qlc3L3lHY3JFKytNTW85KzJzYm40ZmExaUdDNEFT?=
 =?utf-8?B?eFVvYWZzT0U0TTVjVkNaRVJ3MnJJV2dRd0xNVDFmbElERkQzNm5icWY4TzBs?=
 =?utf-8?B?Z1FrdVhkK0paNGFlTEtOYXM0czRVWWMrOFhWOGZpbHhjdXpCN0NtV0FnSkdt?=
 =?utf-8?B?WDZicndJZDU2NXZic0NqNU1VZVNWOCt6MUZxWnNGTWptT2l4M0x5RTE5YnVR?=
 =?utf-8?B?RUNqZUtXYXdRaDV4Uk5JdnhRL2trOUtnNUh5MkNhVkQrTTllQ3ZhN1Z2K3hq?=
 =?utf-8?B?R0o4NEZXa0Q5RW1icDQrT2FzY3QxSXVTNDB6aTg0ZDZjSDV4V09Ga0xFQmJB?=
 =?utf-8?B?WC90eTd2QmhxQXlqM2FvakdMVXJpVjVKSHZNbExvaHRiZ0FSS3dadDFXU0Uw?=
 =?utf-8?B?U0ZjenNleXAya1k1LzBjNTVJVHdGdjZWVmd4VGZPbS9RVTlSUE5RN3lUU3BS?=
 =?utf-8?B?clhaaW4ya0d4SjlqTkhWNkRTa2VXVjFOMW9HM01iM2tWZ1dacVpFcEZ6TXg3?=
 =?utf-8?B?ZXlXNVptVTBuT3NYRFVmMFJlRVQvNmRwNlZ0MDhPNzBzNmd6WkdxWXhRRjMw?=
 =?utf-8?B?Q2JkVU54RFNicnZLSi9ibHpydjlkaUgxeGlOR0lWVUhJRTRRVmhQQ1ltZGFp?=
 =?utf-8?B?MzJhaW9hZGpxY0lxRVhaNENLeFlyV21kcUVPRWM1NllOeGhFV2NyZ2YraG5T?=
 =?utf-8?B?dndySVlyaEF2OHROanBUanYvVnA5NEd0UDVZdWJBNDRTU3BGQ0lxTVMyNWpz?=
 =?utf-8?B?OVplMmVyczFFRmdEb2o4eFMwdnE5QkNYamJPZVdZZGRQZVVpUjg2d0VFQ1JO?=
 =?utf-8?B?S05GenRBclAxMThYaUhBcFgwUlRGYzloVHVRekZWdXFuSFczVU45MDBaMVY1?=
 =?utf-8?Q?a40QmuKWhlTm0TGdpe8mstH7d?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaed9ee-abe8-431c-c8b2-08de2cd19b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 09:53:09.9794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YElnROfBA8hVYEq5QExdgc+Jz99IwZ700Rn9hdu2QNQ3TmoErZ9KZIXFLTN+VxAaR9VvmShr4iEYTmiOFFAieg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
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

SWRlYSB3YXMgdG8gZ2V0IHJldHVybiB2YWx1ZSBhZnRlciBjYWxsaW5nIHhlX3ZtX21hZHZpc2Uo
KS4gSW5jb3Jwb3JhdGVkIHlvdXIgY29tbWVudHMgYW5kIHVwZGF0ZWQgY29kZS4gV2lsbCBzaGFy
ZSBpbiBuZXh0IHZlcnNpb24uDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBI
ZWxsc3Ryb20sIFRob21hcyA8dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+IA0KU2VudDogV2Vk
bmVzZGF5LCBOb3ZlbWJlciAyNiwgMjAyNSAyOjIzIFBNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NClN1
YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjggMDEvMTBdIGxpYi94ZTogQWRkIGluc3RhbmNlIHBh
cmFtZXRlciB0byB4ZV92bV9tYWR2aXNlDQoNCkhpLCBOaXNoaXQsDQoNCk9uIEZyaSwgMjAyNS0x
MS0yMSBhdCAxNjoyNSArMDAwMCwgbmlzaGl0LnNoYXJtYUBpbnRlbC5jb20gd3JvdGU6DQo+IEZy
b206IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiANCj4gdGVzdHMv
aW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yOiBBZGQgcGFyYW1ldGVyIGluIG1hZHZpc2Ug
Y2FsbA0KPiANCj4gQWRkIGFuICdpbnN0YW5jZScgcGFyYW1ldGVyIHRvIF9feGVfdm1fbWFkdmlz
ZSgpIGFuZCB4ZV92bV9tYWR2aXNlKCkgDQo+IHRvIHNwZWNpZnkgd2hpY2ggVlJBTSBpbnN0YW5j
ZSBzaG91bGQgYmUgdGFyZ2V0ZWQgZm9yIG1lbW9yeSBhZHZpc2UgDQo+IG9wZXJhdGlvbnMuDQo+
IEdldHRpbmcgY29tcGlsYXRpb24gaXNzdWVzIGluIHhlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvciB0
ZXN0IGFmdGVyIA0KPiBhZGRpbmcgJ2luc3RhbmNlJyBwYXJhbWV0ZXJzIGluIHhlX3ZtX21hZHZp
c2UoKS4gQXMgYSBmaXggMCBhcyANCj4gaW5zdGFuY2UgcGFyYW1ldGVyIHBhc3NlZCBpbiB4ZV92
bV9tYWR2aXNlKCkgY2FsbHMgYXZhaWxhYmxlIGluIA0KPiB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0
b3IgdGVzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFy
bWFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBpbmNsdWRlL2RybS11YXBpL3hlX2RybS5owqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKystLQ0KPiDCoGxpYi94ZS94ZV9pb2N0bC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTQgKysrKysrKysrLS0t
LS0NCj4gwqBsaWIveGUveGVfaW9jdGwuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDExICsrKysrKysrLS0tDQo+IMKgdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0
ZW1fYWxsb2NhdG9yLmMgfMKgIDggKysrKy0tLS0NCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtLXVhcGkveGVfZHJtLmggYi9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oIA0KPiBpbmRleCA4
OWFiNTQ5MzUuLjM0NzJlZmE1OCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9k
cm0uaA0KPiArKysgYi9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oDQo+IEBAIC0yMDYwLDggKzIw
NjAsOCBAQCBzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ugew0KPiDCoAkJCS8qKiBAcHJlZmVycmVkX21l
bV9sb2MubWlncmF0aW9uX3BvbGljeToNCj4gUGFnZSBtaWdyYXRpb24gcG9saWN5ICovDQo+IMKg
CQkJX191MTYgbWlncmF0aW9uX3BvbGljeTsNCj4gwqANCj4gLQkJCS8qKiBAcHJlZmVycmVkX21l
bV9sb2MucGFkIDogTUJaICovDQo+IC0JCQlfX3UxNiBwYWQ7DQo+ICsJCQkvKiogQHByZWZlcnJl
ZF9tZW1fbG9jLnJlZ2lvbl9pbnN0YW5jZToNCj4gUmVnaW9uIGluc3RhbmNlICovDQo+ICsJCQlf
X3UxNiByZWdpb25faW5zdGFuY2U7DQo+IMKgDQo+IMKgCQkJLyoqIEBwcmVmZXJyZWRfbWVtX2xv
Yy5yZXNlcnZlZCA6IFJlc2VydmVkICovDQo+IMKgCQkJX191NjQgcmVzZXJ2ZWQ7DQo+IGRpZmYg
LS1naXQgYS9saWIveGUveGVfaW9jdGwuYyBiL2xpYi94ZS94ZV9pb2N0bC5jIGluZGV4IA0KPiAz
OWM0NjY3YTEuLmVhMTdlZmRkOSAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmMNCj4g
KysrIGIvbGliL3hlL3hlX2lvY3RsLmMNCj4gQEAgLTY4Nyw3ICs2ODcsOCBAQCBpbnQ2NF90IHhl
X3dhaXRfdWZlbmNlKGludCBmZCwgdWludDY0X3QgKmFkZHIsIA0KPiB1aW50NjRfdCB2YWx1ZSwN
Cj4gwqB9DQo+IMKgDQo+IMKgaW50IF9feGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZt
LCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCANCj4gcmFuZ2UsDQo+IC0JCcKgwqDCoCB1aW50NjRf
dCBleHQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwNCj4gdWludDE2X3QgcG9saWN5
KQ0KPiArCQnCoMKgwqAgdWludDY0X3QgZXh0LCB1aW50MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92
YWwsDQo+IHVpbnQxNl90IHBvbGljeSwNCj4gKwkJwqDCoMKgIHVpbnQxNl90IGluc3RhbmNlKQ0K
PiDCoHsNCj4gwqAJc3RydWN0IGRybV94ZV9tYWR2aXNlIG1hZHZpc2UgPSB7DQo+IMKgCQkudHlw
ZSA9IHR5cGUsDQo+IEBAIC03MDQsNiArNzA1LDcgQEAgaW50IF9feGVfdm1fbWFkdmlzZShpbnQg
ZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCANCj4gYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+IMKg
CWNhc2UgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BSRUZFUlJFRF9MT0M6DQo+IMKgCQltYWR2aXNl
LnByZWZlcnJlZF9tZW1fbG9jLmRldm1lbV9mZCA9IG9wX3ZhbDsNCj4gwqAJCW1hZHZpc2UucHJl
ZmVycmVkX21lbV9sb2MubWlncmF0aW9uX3BvbGljeSA9IHBvbGljeTsNCj4gKwkJbWFkdmlzZS5w
cmVmZXJyZWRfbWVtX2xvYy5yZWdpb25faW5zdGFuY2UgPQ0KPiBpbnN0YW5jZTsNCj4gwqAJCWln
dF9kZWJ1ZygibWFkdmlzZS5wcmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1fZmQgPSAlZFxuIiwNCj4g
wqAJCQnCoCBtYWR2aXNlLnByZWZlcnJlZF9tZW1fbG9jLmRldm1lbV9mZCk7DQo+IMKgCQlicmVh
azsNCj4gQEAgLTczMSwxNCArNzMzLDE2IEBAIGludCBfX3hlX3ZtX21hZHZpc2UoaW50IGZkLCB1
aW50MzJfdCB2bSwgDQo+IHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0KPiDCoCAqIEB0
eXBlOiB0eXBlIG9mIGF0dHJpYnV0ZQ0KPiDCoCAqIEBvcF92YWw6IGZkL2F0b21pYyB2YWx1ZS9w
YXQgaW5kZXgsIGRlcGVuZGluZyB1cG9uIHR5cGUgb2YgDQo+IG9wZXJhdGlvbg0KPiDCoCAqIEBw
b2xpY3k6IFBhZ2UgbWlncmF0aW9uIHBvbGljeQ0KPiArICogQGluc3RhbmNlOiB2cmFtIGluc3Rh
bmNlDQo+IMKgICoNCj4gwqAgKiBGdW5jdGlvbiBpbml0aWFsaXplcyBkaWZmZXJlbnQgbWVtYmVy
cyBvZiBzdHJ1Y3QgZHJtX3hlX21hZHZpc2UgDQo+IGFuZCBjYWxscw0KPiDCoCAqIE1BRFZJU0Ug
SU9DVEwgLg0KPiDCoCAqDQo+IC0gKiBBc3NlcnRzIGluIGNhc2Ugb2YgZXJyb3IgcmV0dXJuZWQg
YnkgRFJNX0lPQ1RMX1hFX01BRFZJU0UuDQo+ICsgKiBSZXR1cm5zIGVycm9yIG51bWJlciBpbiBm
YWlsdXJlIGFuZCAwIGlmIHBhc3MuDQo+IMKgICovDQo+IC12b2lkIHhlX3ZtX21hZHZpc2UoaW50
IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3QgYWRkciwgdWludDY0X3QgDQo+IHJhbmdlLA0KPiAt
CQnCoMKgIHVpbnQ2NF90IGV4dCwgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLA0KPiB1
aW50MTZfdCBwb2xpY3kpDQo+ICtpbnQgeGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZt
LCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdA0KPiByYW5nZSwNCj4gKwkJwqDCoCB1aW50NjRfdCBl
eHQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwNCj4gdWludDE2X3QgcG9saWN5LA0K
PiArCQnCoMKgIHVpbnQxNl90IGluc3RhbmNlKQ0KPiDCoHsNCj4gLQlpZ3RfYXNzZXJ0X2VxKF9f
eGVfdm1fbWFkdmlzZShmZCwgdm0sIGFkZHIsIHJhbmdlLCBleHQsDQo+IHR5cGUsIG9wX3ZhbCwg
cG9saWN5KSwgMCk7DQo+ICsJcmV0dXJuIF9feGVfdm1fbWFkdmlzZShmZCwgdm0sIGFkZHIsIHJh
bmdlLCBleHQsIHR5cGUsDQo+IG9wX3ZhbCwgcG9saWN5LCBpbnN0YW5jZSk7DQoNCldoeSBhcmUg
eW91IHJlbW92aW5nIHRoZSBhc3NlcnQgZnJvbSB0aGlzIGZ1bmN0aW9uLiBJc24ndCB0aGUgY29u
dmVudGlvbiB0aGF0IHlvdSBzaG91bGQgYmUgdXNpbmcgX194ZV92bV9tYWR2aXNlKCkgaWYgeW91
J3JlIGludGVyZXN0ZWQgaW4gdGhlIHJldHVybiB2YWx1ZSwgYnV0IHhlX3ZtX21hZHZpc2UoKSBp
ZiB5b3Ugd2FudCB0aGUgZnVuY3Rpb24gdG8gYWJvcnQgb24gZmFpbHVyZT8NCg0KVGhhbmtzLA0K
VGhvbWFzDQoNCg0KDQoNCj4gwqB9DQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9jdGwuaCBi
L2xpYi94ZS94ZV9pb2N0bC5oIGluZGV4IA0KPiBhZThhMjNhNTQuLjFhZTM4MDI5ZCAxMDA2NDQN
Cj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmgNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmgNCj4g
QEAgLTEwMCwxMyArMTAwLDE4IEBAIGludCBfX3hlX3dhaXRfdWZlbmNlKGludCBmZCwgdWludDY0
X3QgKmFkZHIsIA0KPiB1aW50NjRfdCB2YWx1ZSwNCj4gwqBpbnQ2NF90IHhlX3dhaXRfdWZlbmNl
KGludCBmZCwgdWludDY0X3QgKmFkZHIsIHVpbnQ2NF90IHZhbHVlLA0KPiDCoAkJwqDCoMKgwqDC
oMKgIHVpbnQzMl90IGV4ZWNfcXVldWUsIGludDY0X3QgdGltZW91dCk7DQo+IMKgaW50IF9feGVf
dm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCAN
Cj4gcmFuZ2UsIHVpbnQ2NF90IGV4dCwNCj4gLQkJwqDCoMKgIHVpbnQzMl90IHR5cGUsIHVpbnQz
Ml90IG9wX3ZhbCwgdWludDE2X3QNCj4gcG9saWN5KTsNCj4gLXZvaWQgeGVfdm1fbWFkdmlzZShp
bnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCANCj4gcmFuZ2UsIHVp
bnQ2NF90IGV4dCwNCj4gLQkJwqDCoCB1aW50MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92YWwsIHVp
bnQxNl90IHBvbGljeSk7DQo+ICsJCcKgwqDCoCB1aW50MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92
YWwsIHVpbnQxNl90IHBvbGljeSwNCj4gdWludDE2X3QgaW5zdGFuY2UpOw0KPiAraW50IHhlX3Zt
X21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3QgYWRkciwgdWludDY0X3QNCj4g
cmFuZ2UsIHVpbnQ2NF90IGV4dCwNCj4gKwkJwqAgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3Bf
dmFsLCB1aW50MTZfdCBwb2xpY3ksDQo+IHVpbnQxNl90IGluc3RhbmNlKTsNCj4gwqBpbnQgeGVf
dm1fbnVtYmVyX3ZtYXNfaW5fcmFuZ2UoaW50IGZkLCBzdHJ1Y3QgDQo+IGRybV94ZV92bV9xdWVy
eV9tZW1fcmFuZ2VfYXR0ciAqdm1hc19hdHRyKTsNCj4gwqBpbnQgeGVfdm1fdm1hX2F0dHJzKGlu
dCBmZCwgc3RydWN0IGRybV94ZV92bV9xdWVyeV9tZW1fcmFuZ2VfYXR0ciANCj4gKnZtYXNfYXR0
ciwNCj4gwqAJCcKgwqDCoCBzdHJ1Y3QgZHJtX3hlX21lbV9yYW5nZV9hdHRyICptZW1fYXR0cik7
DQo+IMKgc3RydWN0IGRybV94ZV9tZW1fcmFuZ2VfYXR0cg0KPiDCoCp4ZV92bV9nZXRfbWVtX2F0
dHJfdmFsdWVzX2luX3JhbmdlKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IA0KPiBzdGFy
dCwNCj4gwqAJCQkJwqDCoMKgIHVpbnQ2NF90IHJhbmdlLCB1aW50MzJfdA0KPiAqbnVtX3Jhbmdl
cyk7DQo+ICt2b2lkIHhlX3ZtX2JpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50
MzJfdCBibywNCj4gKwkJCXVpbnQ2NF90IG9mZnNldCwgdWludDY0X3QgYWRkciwNCj4gKwkJCXVp
bnQ2NF90IHNpemUsIHVpbnQzMl90IGZsYWdzKTsNCj4gK3ZvaWQgeGVfdm1fdW5iaW5kX2xyX3N5
bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3Qgb2Zmc2V0LA0KPiArCQkJwqAgdWludDY0
X3QgYWRkciwgdWludDY0X3Qgc2l6ZSk7DQo+IMKgI2VuZGlmIC8qIFhFX0lPQ1RMX0ggKi8NCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5jDQo+IGIv
dGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gaW5kZXggYjg4OTY3ZTU4
Li4xZTcxNzUwNjEgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2Fs
bG9jYXRvci5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5j
DQo+IEBAIC0xMTY0LDcgKzExNjQsNyBAQCBtYWR2aXNlX3N3aXp6bGVfb3BfZXhlYyhpbnQgZmQs
IHVpbnQzMl90IHZtLCANCj4gc3RydWN0IHRlc3RfZXhlY19kYXRhICpkYXRhLA0KPiDCoAl4ZV92
bV9tYWR2aXNlKGZkLCB2bSwgdG9fdXNlcl9wb2ludGVyKGRhdGEpLCBib19zaXplLCAwLA0KPiDC
oAkJwqDCoMKgwqDCoCBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUFJFRkVSUkVEX0xPQywNCj4gwqAJ
CcKgwqDCoMKgwqAgcHJlZmVycmVkX2xvYywNCj4gLQkJwqDCoMKgwqDCoCAwKTsNCj4gKwkJwqDC
oMKgwqDCoCAwLCAwKTsNCj4gwqB9DQo+IMKgDQo+IMKgc3RhdGljIHZvaWQNCj4gQEAgLTExNzIs
NyArMTE3Miw3IEBAIHhlX3ZtX21hZHZpeGVfcGF0X2F0dHIoaW50IGZkLCB1aW50MzJfdCB2bSwg
DQo+IHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0KPiDCoAkJwqDCoMKgwqDCoMKgIGlu
dCBwYXRfaW5kZXgpDQo+IMKgew0KPiDCoAl4ZV92bV9tYWR2aXNlKGZkLCB2bSwgYWRkciwgcmFu
Z2UsIDAsDQo+IC0JCcKgwqDCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BBVCwgcGF0X2lu
ZGV4LCAwKTsNCj4gKwkJwqDCoMKgwqDCoCBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUEFULCBwYXRf
aW5kZXgsIDAsIDApOw0KPiDCoH0NCj4gwqANCj4gwqBzdGF0aWMgdm9pZA0KPiBAQCAtMTE4MSw3
ICsxMTgxLDcgQEAgeGVfdm1fbWFkdmlzZV9hdG9taWNfYXR0cihpbnQgZmQsIHVpbnQzMl90IHZt
LCANCj4gdWludDY0X3QgYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+IMKgew0KPiDCoAl4ZV92bV9t
YWR2aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2UsIDAsDQo+IMKgCQnCoMKgwqDCoMKgIERSTV9YRV9N
RU1fUkFOR0VfQVRUUl9BVE9NSUMsDQo+IC0JCcKgwqDCoMKgwqAgbWVtX2F0dHIsIDApOw0KPiAr
CQnCoMKgwqDCoMKgIG1lbV9hdHRyLCAwLCAwKTsNCj4gwqB9DQo+IMKgDQo+IMKgc3RhdGljIHZv
aWQNCj4gQEAgLTExOTAsNyArMTE5MCw3IEBAIHhlX3ZtX21hZHZpc2VfbWlncmF0ZV9wYWdlcyhp
bnQgZmQsIHVpbnQzMl90IHZtLCANCj4gdWludDY0X3QgYWRkciwgdWludDY0X3QgcmFuZ2UpDQo+
IMKgCXhlX3ZtX21hZHZpc2UoZmQsIHZtLCBhZGRyLCByYW5nZSwgMCwNCj4gwqAJCcKgwqDCoMKg
wqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BSRUZFUlJFRF9MT0MsDQo+IMKgCQnCoMKgwqDCoMKg
IERSTV9YRV9QUkVGRVJSRURfTE9DX0RFRkFVTFRfU1lTVEVNLA0KPiAtCQnCoMKgwqDCoMKgIERS
TV9YRV9NSUdSQVRFX0FMTF9QQUdFUyk7DQo+ICsJCcKgwqDCoMKgwqAgRFJNX1hFX01JR1JBVEVf
QUxMX1BBR0VTLCAwKTsNCj4gwqB9DQo+IMKgDQo+IMKgc3RhdGljIHZvaWQNCg0K
