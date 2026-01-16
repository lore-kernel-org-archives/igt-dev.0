Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBAAD4A5F9
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 04:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5DA10E7DE;
	Fri, 16 Jan 2026 04:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfHBdb3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BD510E0CE;
 Fri, 16 Jan 2026 04:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768536111; x=1800072111;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YAlx7GzYEkXo7Rch+nAKnPDJw9W9axxu9Km6mxXhOoI=;
 b=TfHBdb3JLgJc2HH2dtpSQp2SwI9y3tIrY+1UY65SU2cRnLukOyh2uvu2
 n1rOHFOgLGNq9MqfkpR2BtUWHrrThrtjGMmkdlrDBumLkcRMMzSlD0PNw
 siAYoZQ56snyBNnBPmtYnBW7E785d8JmFJ9iJXp3lbUGXiby+y9jyY0Mx
 1df3hxZn626rU3HCMaAAvTukr9Ol7MJl/u2NFmVLOAXK4GJF69kuY7HCG
 FgY5mG45GUHEHw7AmmxcGLH1Rdr4fFujsf5qGWTtavQr9xS8vn4PNto/L
 l30rKfbD73xrI3LnNETFkiicHmsgcEHjsExvcnCPqT0T1PLyHnd+Vqt+9 w==;
X-CSE-ConnectionGUID: wZpHcX+CToWvSLTvxnJZqA==
X-CSE-MsgGUID: qJixruS5S+25hcXEadFFRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73481880"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="73481880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 20:01:51 -0800
X-CSE-ConnectionGUID: +kem9a76SHq2k7P57sG7gg==
X-CSE-MsgGUID: 7kdEg/1xQ6WkyhjDPiOGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="204279001"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 20:01:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 20:01:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 20:01:50 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 20:01:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izE/AUOvZ0wmtvn15g8qMIbgzpcf8qtG0FTGFE0aJS/3DwGK3eOH3z43M2vT6ren65nihWhCo8OsKVdQhAwl7iG2Tez+BqUZISFLaEr5ZOPb+MGPMrynLGxEnHEXfP+DdCtPuO1BGGnPbTzLeRuqKHB5l7KQtCpEzZecUtY7/imknQGd1L35r9G621F9RWagI3h0p+H4nmp+5QCQjqty8T3f5XGH/VJKRcoyLT+kGXJkLUwjAU1ldi1ve6+r4VQAOZrNR+/rHXp9pE7WowC6wc1SrhDgPJ8PYGSodqVzyl+nA9bWZ1nJBc4YpJELCq7NAqN3zrxLiV2dj2GOCJci1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAlx7GzYEkXo7Rch+nAKnPDJw9W9axxu9Km6mxXhOoI=;
 b=McPNvcf+3V8FrUEUpyUC/QOq1mMCRYTwXQOGOLps/HFpIK3p1FUqLxDRVfHiLXF9N8SDq5PAu9a1F4DitHDTFKQPPOnDD9FacovGEggU9SkWhG5ebzxh9ZuRoDEcm3S7VC6yAs0oVlkf6VkMoZ/zUNeE5lp2KcHqCeNjTpDGWRTIm4MbQiYjU6FHV3zXDQBFp+NCvhMGy1eNgGDpmNQGVQA02fa3Usf+aNa644sjKZUh+kHyo6+h3uXGTxOhLL+ydEDXntmZ0nEZEVYDIBwbI1TMlg/RviZiRltIymvJzpy64fBeKUSBNEVtbYfkqOVB+XSxYGrl8lXSZ0SUO54d6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 04:01:47 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 04:01:47 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIveGUveGVfbGVn?=
 =?utf-8?B?YWN5OiBDbGVhbnVwcyBpbiB4ZV9sZWdhY3lfdGVzdF9tb2RlKCkgKHJldjIp?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGxpYi94ZS94ZV9sZWdhY3k6?=
 =?utf-8?B?IENsZWFudXBzIGluIHhlX2xlZ2FjeV90ZXN0X21vZGUoKSAocmV2Mik=?=
Thread-Index: AQHchpnKGyOoiELGGUWnxsu0jSYGuLVUK16g
Date: Fri, 16 Jan 2026 04:01:47 +0000
Message-ID: <DM4PR11MB5456777E0A1168FD193917A5EA8DA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <176853478226.160168.5527437129785314071@a3b018990fe9>
In-Reply-To: <176853478226.160168.5527437129785314071@a3b018990fe9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS7PR11MB7783:EE_
x-ms-office365-filtering-correlation-id: 44ffef04-0929-45fa-af07-08de54b3f83d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ci9Ec0tOR3c4WUZRN3NtWGVaSjNEQUloQnJ5U0toZ2ZTaThmUUZCeWNNcjFT?=
 =?utf-8?B?SE1Cb1g1MUErejREYkhicjQxeVQ5Z09sMXY0UmJRU2RSaDh2SXgxdWNDMmJW?=
 =?utf-8?B?Y21OQy9qRksySDV0VHUzbEp4Y3MxNFZicnVPb1l5OXIyM3dMRUV5QWh3UTVB?=
 =?utf-8?B?RHo0ZWxGTk42WndoRlNvTDBuUjBlNzdQZTJSMXBwc2JacGRiNmtlQnpJdnVJ?=
 =?utf-8?B?c2FHS29CZGZobjNMRjU0Q1cxaWIzOWNNVGpyVzFkOTJzVzZVOVZ5RDF3RFRQ?=
 =?utf-8?B?Q1RrM2FWQ2RDNTUrY3dFZ3ZROXlMZ0Z5eXZWWnlYejdacE9ON3JyRVN1a1Zi?=
 =?utf-8?B?RDZJQ29lSEE4YnlEeEtsSFF2dkN5RUNhWkY5di9XalFLM3lFS3J3UGFnc3VC?=
 =?utf-8?B?T2k0YmxUNXFCZjRqSzV0YmtjUDJMZkdXNjZ4OW5QbDZqWEJpVGg5cU5YYWdm?=
 =?utf-8?B?dS9uWVVDYXJ5WktYMmMvZFhON1g5Y0dkY3BicGtwbFFOb3JkUDhBa3NYMVdH?=
 =?utf-8?B?ZmZsSk82NjQ4SllZc2ZwRjdRaytTazgvTGZoaGQ3Unc2aXo3Tkd5cExucXNQ?=
 =?utf-8?B?bk5pQ2NmaCtLKy81aDEyR0RXemE2MDF4ZnZGVVU3a0oxUzVuR1VGYlRubWVv?=
 =?utf-8?B?NlJxYVlsSG9IeXd3eW5PZldJZ00ySDhUbXBSU2w3MnpLZXJWQ0pvU0NDVlNP?=
 =?utf-8?B?RmdVbGVIQjFUVWQ4WEpVYWRValpENUNxVEM1VG1qYnBTMUhhelJvYlUvVExs?=
 =?utf-8?B?MHlkN0swT28yOW9aeDhWL0pWWldCaHI0d0JXNGlOU3dJYk1ZS3o3cDExbmxa?=
 =?utf-8?B?eG14bkx5NEdPSmgvbEdrdFRmUHU4QWNCckg4VGNWeDZHM00xaGhJTkIxdUxZ?=
 =?utf-8?B?clNRU0djZmFWS1g5Z2MyWGJscUUxOUJRWCtIeFo5WWVWSVlSVXY1MDlybjhQ?=
 =?utf-8?B?b0hrekxqMWhJZ2xPYUxVVHJBUlVoc3lTMWlhZ0hQY2VTay96Wi9kbXdjc2FW?=
 =?utf-8?B?cVE2NDhmRWRCaXNEMDlldVlZYmllQU85aGUrYnNwd2xkeFVJakpwNzlUQnk5?=
 =?utf-8?B?ekM0T3JNN1BEZG9QbURQTVFjOW1UMUZacjIrQjJjc1hjTTJqMUhRSzJ3WnYz?=
 =?utf-8?B?aStYemUwRWMwdVdJL3BwRHZtL3pjdDZqUFdVMERTNTA4TFJOdDNRUTFOUWpH?=
 =?utf-8?B?K1hyWGlwK2RNbE1JZ2FqbmFzT00xYnlhNHAreDN3b1NyTHh6WGorSDd3ZFNH?=
 =?utf-8?B?Mll5NHRJMGhWalJ5NlB4UGtON1JKcmp6TmlzOHk5ZUJpTGtmRXIrcnhieEtX?=
 =?utf-8?B?cmdySDJDelNkWjVFZjB6cXhocUZEbVNUNmkvaDgvRDh1TmV5enhSSDJQamFZ?=
 =?utf-8?B?alBvL0dpZ29EdjRwcUF2R0x5dHN5V05wejlnVVk3dDVmN0hyb3FiS0p3SGs2?=
 =?utf-8?B?VVBqNXB6SzdCdXdYMHh0YzdJL3NscElQd3hVdHYwVW55emlDNFEwVGNyakN1?=
 =?utf-8?B?b0hKRjhUbTUyMXd4WWxmeStTRmFIZWpzMm83TVN1U1JqMTZwTGVoQXN4WXZr?=
 =?utf-8?B?NUxCaW05RSsxbGUwWjZ5QmhkSCtVOGhiWmlWRjBER3NGaXRqdUJhTnF2UGJw?=
 =?utf-8?B?b3Bxa2ZFbVRhOFJKODh0ckVPK3owT0g0UkpNdHQxUnpVMGkvRjRtQUlXZVdj?=
 =?utf-8?B?T3BDanZNN09ncXNuVE93UEtBWVd6WFhuSzJVNW9wLzhWVm5IVk1GakcxTWw1?=
 =?utf-8?B?OWI4a2Z1Mlluem5mOVh6VjRBd3llUFNzOTk2UE9uWGZjOGg4ODRQVlFXUVFj?=
 =?utf-8?B?WWlWcnBPK0ZHcEtmcFlzNHRpUTZ2Ym5NaUxmck1IbzdhU3ZIMlFYRzg0eGV5?=
 =?utf-8?B?VlVzTWZ0cStJQTEvNFZFaGI1eEJMbnRrSFlsaHc0Z0NGb3pOSy9UYUdkWTI1?=
 =?utf-8?B?NUZ2QVZoUnFPWGw5QmVmMk43MzJ5ZGNKaXJrQXF2UmtwUXd5M2RVUlR1Yklt?=
 =?utf-8?B?SW1TRFh1SnZOcHIvREJtSXF1NjJiQzVkSmF2ckVzVXZSQmpWZ3V3SStmRlFC?=
 =?utf-8?B?by9NbVA3WGxjUXd3NnJZWGkzNXVsdCt4YU1IcnJtYUZGRDZzdmFOcjAxSFNE?=
 =?utf-8?Q?uZJRw1/3ZSJN/o22BG65+gvjL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2txaExvTTZNdWhGVE9MVUpZeVZQa1NsNlhvRVFGd29VY0JyYVgvaCtNTkds?=
 =?utf-8?B?STFpcytLUEg5RnJWQTkwTXhVNGZYc2xSN1I2WmUzUEFwYktZNXovaWVGci9I?=
 =?utf-8?B?R3V6cTNzTDhCR1ZjQ2xuMm4rWVZtRkh6cVdQbEFhL2N5N3hpN0R1NWJ6RmxP?=
 =?utf-8?B?RzYzWXdudFJ3anRoSE1TSjlqdFg0eG4rdUFkODYyZ2h5bTgwVzhNbllTR1pi?=
 =?utf-8?B?a3RxZVFDbG82eXM4NHVZcXl2UmYrUS83K2ZNTjhNVTQ4Z0o5SE81VWVZWTRH?=
 =?utf-8?B?Q0JQZEV5ckJiNFZ3bzF3OHNSbENOMlltWmhmNTNVdXlJMkR0S2tRTTEyKzN6?=
 =?utf-8?B?azRERkkvOHpDdFpDVVd1RzJkQjVNNmxObnlhTFFLdXZTWFpxbWlUOEJQTWNz?=
 =?utf-8?B?UE1hT3F4L1N1dTlBdFd5UVk2cFN3d3lsUmVLZFllUHpwNGxHemk1QSsvV3hq?=
 =?utf-8?B?cGpYazYxMWJmeXVvU2RhTkhrd0o3YUJ0OC9aT2czYzJNMmIrNHRTNDdZSDZK?=
 =?utf-8?B?eHNCR2N3bElqNXpPN0MzbnB4RnNnWDFlWSthNTZieTkxcXFkdjRLMGhPV2VU?=
 =?utf-8?B?eTR5QWZuYU9qN1BIM1BiMjFrOFI3S2hwZG1Xc3k1aHFrS3hETDllRXJJeEFh?=
 =?utf-8?B?NHppb1J6NjBKR2U1VlU1NFdHV0ZNaFBka1pJSUVvN20zL2J2emZ1b2YwYzNr?=
 =?utf-8?B?NWYzaitWaU5vWmVmVE9rb1JOZFdLc0xyTnpJR2Zrc2lCaXEzeEJ4OG5YdWtQ?=
 =?utf-8?B?eXczSk1PZzhyM3E4UDFzb3pMOFQ2TDY1a2NTREJBaS90TjRSdHpZaWdTdXho?=
 =?utf-8?B?QUVaWDFRaWFsN0Zld290QmhnMmo1RXk1c01JQU1nWUN3OThWOVhwVXgyYitG?=
 =?utf-8?B?VG5lcjVlM1dwam03UE5KY2RBR2hyUkc3UnpsUE9HNjJSWlc0cTdSMDhTbkRl?=
 =?utf-8?B?V2w5TkQ5OFRBN0NiVlpEWDQvVkhBYys1N2lUVWNGcDAzd01TNWNrcUx1ZzhP?=
 =?utf-8?B?TjYySVIrbnllRGd4MTNPYnVYdjhKZVhRdjFNdnhtdFFSUmVSODcyVjhHdEEr?=
 =?utf-8?B?V0I3VmRCWG53a29heGl4bkQrSE9HQmZ0RFFSZnlYcW5hUFliVmhqMW5saDMx?=
 =?utf-8?B?VXFFRFpVamtkR1NHY1g4R3FxYzhlZEE3TDRJSE13VXUyWExJODJxd3N6RFB1?=
 =?utf-8?B?VGUvdy9NM1pnLy96VzNqcEczd0FOWEtWOWlNM3QyNjlWaEdtZkRJall4NlZw?=
 =?utf-8?B?ZktpV3VaMDJEQ29RYUQ4akdPK2NCbi9pL0NuKzFqUFhXS2prTk9oUkRzTHMx?=
 =?utf-8?B?a3lhVEp2ekhST2dYQTJ1bUc4eUhoaDVSY3BXS1kyVk8wM1crTnlXc3NEbWth?=
 =?utf-8?B?Z0RZUlBJQmNvcGszTElxWjNuZm9kRXg1dGFWckxCbVF3TUVIekdrc0lUUUhG?=
 =?utf-8?B?aW95TmluemNvaDhPR0pCNUpQaWNjaGxYQk4xemRyWlZvTG1nazd2ejhEZ0xx?=
 =?utf-8?B?bHNwSHNnVDZlbjZWL1FEQmo3STVjNFVFV1NmTDh3Q3BYamdGcUJxQmFGbTZj?=
 =?utf-8?B?aWZPMTVzc3ZrbldRcWhIQ3dnci84dmJMdG0wY1phMHpYWHVVSXZWYWJIbkl4?=
 =?utf-8?B?Ry9lSFB2blRPZGFVeTZYWkhONERYNm1mS0JjTVhSWnp1T09yRnlNU1BUV3VH?=
 =?utf-8?B?M3B2eTg5SFBBK0JZT2hKamxqcmRLNWNkayszT3hjRVdmYTVJeXN1eWMwVUY3?=
 =?utf-8?B?N1JiSEozTkJpTkNLRXBNcEZpek1QUXFiaWNQc2N1UHIzT0RCU3dHN05qWTRB?=
 =?utf-8?B?UG5oeWZmVVBPNjY5T083bk9nekxRamdaSkxFc3prNnNqU2k3dnBjdEJDYVB4?=
 =?utf-8?B?OHJpQ3MzMlZsUXBpalF6UENwc1dXak8yMkZCd0JkRnAvN25NdExMREJxUHgr?=
 =?utf-8?B?ZWgyTWFMR2xsN3BMR3JaUmVwblp0MGg2cWJBemxGcklYYnhST3Z6ZUN5Z3A0?=
 =?utf-8?B?WTRHR203Wkw2aWU0SFMxTlFjYzhFUHhESVNyYkZGSDNKUldleExVdXRQVmdm?=
 =?utf-8?B?TFFwcTJXaUhONEpnMit0VGRqYkVHMk5DMmR6Qmw5YWY0VVM2V0xRTzRQQlIx?=
 =?utf-8?B?c3dTN2lNZ1ZPdDZTaG9Tc0p4cnpVcEs0RWtRcnRFRnZwblc4cmdIYlExMnAx?=
 =?utf-8?B?L2V3SkRYa0xRb1Q2ZkpsMmdOa0J1aWhUTmhpcDJGRmJQMGlKT1QwNHVZYk45?=
 =?utf-8?B?MjVMWDIzazZVc0w3UUdMcmVndXRBYmk1eUF4aWJWU1hacjBHY2k3Mk5SYXRJ?=
 =?utf-8?B?Um1Jc0loN1FkZ055TmhVU1lRNmlTc3l2TUh1YXhod2lSNWhBQ3VMR0JTUE9h?=
 =?utf-8?Q?KiyUwc1XXBZYm+6n+M9SzV9OSkenTTTrJIpO76yxfcgu6?=
x-ms-exchange-antispam-messagedata-1: 4dPmHNfZiCbj6w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ffef04-0929-45fa-af07-08de54b3f83d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 04:01:47.3623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DA3JRQ2jiFK0tvcJIKWKFWTLQj+XYsdLnh4Nmo7MirSeR+dyJevlNwWuSor9Dzc2Kdz9rZ7yUyWqBdWptzrXRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

PkZyb206IFBhdGNod29yayA8cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+IA0KPlNl
bnQ6IFRodXJzZGF5LCBKYW51YXJ5IDE1LCAyMDI2IDc6NDAgUE0NCj5UbzogTGluLCBTaHVpY2hl
bmcgPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPlN1YmplY3Q6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIveGUveGVf
bGVnYWN5OiBDbGVhbnVwcyBpbiB4ZV9sZWdhY3lfdGVzdF9tb2RlKCkgKHJldjIpDQoNCj5QYXRj
aCBEZXRhaWxzIA0KPlNlcmllczogbGliL3hlL3hlX2xlZ2FjeTogQ2xlYW51cHMgaW4geGVfbGVn
YWN5X3Rlc3RfbW9kZSgpIChyZXYyKQ0KPlVSTDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy8xNjAxNjIvDQo+U3RhdGU6IGZhaWx1cmUNCj5EZXRhaWxzOiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xNDM1NS9pbmRleC5odG1s
DQo+Q0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBYRUlHVF84NzA0X0ZVTEwgLT4gWEVJR1RQV18x
NDM1NV9GVUxMDQo+U3VtbWFyeQ0KPkZBSUxVUkUNCj5TZXJpb3VzIHVua25vd24gY2hhbmdlcyBj
b21pbmcgd2l0aCBYRUlHVFBXXzE0MzU1X0ZVTEwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+dmVy
aWZpZWQgbWFudWFsbHkuDQo+SWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUg
bm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+aW50cm9kdWNlZCBpbiBYRUlHVFBXXzE0
MzU1X0ZVTEwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAobWFpbHRvOkk5MTUtY2ktaW5m
cmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+dG8gZG9jdW1lbnQgdGhp
cyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4g
Q0kuDQo+UGFydGljaXBhdGluZyBob3N0cyAoMiAtPiAyKQ0KPk5vIGNoYW5nZXMgaW4gcGFydGlj
aXBhdGluZyBob3N0cw0KPlBvc3NpYmxlIG5ldyBpc3N1ZXMNCj5IZXJlIGFyZSB0aGUgdW5rbm93
biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTQzNTVf
RlVMTDoNCj5JR1QgY2hhbmdlcw0KPlBvc3NpYmxlIHJlZ3Jlc3Npb25zDQo+4oCiIGlndEBrbXNf
YWRkZmJfYmFzaWNAYmFkLXBpdGNoLTYzOg0KPm8gc2hhcmQtbG5sOiBOT1RSVU4gLT4gaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTQzNTUvc2hhcmQtbG5s
LTUvaWd0QGttc19hZGRmYl9iYXNpY0BiYWQtcGl0Y2gtNjMuaHRtbA0KPuKAoiBpZ3RAeGVfZXhl
Y19jb21wdXRlX21vZGVAbWFueS1leGVjcXVldWVzLWJpbmRleGVjcXVldWUtdXNlcnB0ci1yZWJp
bmQ6DQo+byBzaGFyZC1sbmw6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVs
LXhlL0lHVF84NzA0L3NoYXJkLWxubC00L2lndEB4ZV9leGVjX2NvbXB1dGVfbW9kZUBtYW55LWV4
ZWNxdWV1ZXMtYmluZGV4ZWNxdWV1ZS11c2VycHRyLXJlYmluZC5odG1sIC0+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzE0MzU1L3NoYXJkLWxubC01L2ln
dEB4ZV9leGVjX2NvbXB1dGVfbW9kZUBtYW55LWV4ZWNxdWV1ZXMtYmluZGV4ZWNxdWV1ZS11c2Vy
cHRyLT5yZWJpbmQuaHRtbCArNiBvdGhlciB0ZXN0cyBkbWVzZy13YXJuDQoNCk15IHBhdGNoIGRv
ZXMgbm90IHRvdWNoIHRoZXNlIHRlc3RzLiBUaGUgaXNzdWUgaXMgbm90IHJlbGF0ZWQgdG8gbXkg
cGF0Y2guDQpUaGFua3MuDQoNClNodWljaGVuZw0KDQo+TmV3IHRlc3RzDQo+TmV3IHRlc3RzIGhh
dmUgYmVlbiBpbnRyb2R1Y2VkIGJldHdlZW4gWEVJR1RfODcwNF9GVUxMIGFuZCBYRUlHVFBXXzE0
MzU1X0ZVTEw6DQo+TmV3IElHVCB0ZXN0cyAoMSkNCj7igKIgaWd0QHhlX2V4ZWNfYmFzaWNAb25j
ZS1iaW5kZXhlY3F1ZXVlLXVzZXJwdHItaW52YWxpZGF0ZS1yYWNlQHZlY3MxOg0KPm8gU3RhdHVz
ZXMgOiAxIHBhc3MocykNCj5vIEV4ZWMgdGltZTogWzAuMDBdIHMNCj5Lbm93biBpc3N1ZXMNCj5I
ZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBYRUlHVFBXXzE0MzU1X0ZVTEwgdGhhdCBjb21l
IGZyb20ga25vd24gaXNzdWVzOg0K
