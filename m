Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DFD3B996
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD55910E21E;
	Tue,  9 Dec 2025 21:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwpr0urt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B527A10E21E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765315342; x=1796851342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d6uO6StBubFB4xvjISbDTAphurjV4eGBnt6QrRTrIdE=;
 b=bwpr0urtrMjbatih4f2Ao0zRVnLVxJd+yO7VchraMbHg/GaVbPd1pakv
 2NF28No+uLsvo/8T6YVYJ23gcz/CvkUCEfh3JPLKmYmwl0TcUoaYrnp76
 WbyPdO9UE3kDaSsS5b7QjuXRGn0ylbYgsNBBD96/ak/20O+CZF25osS97
 Ox5T6JoSw9T4wPKap/8af+NrUZOS2PL88UterBjwl9+ruHgNzuR1OUg/I
 /jJPy/Rv7+LtiG2S8XHFh6Gklt2qgxLKGe/J3dZzOSpWBfyKW9Zgd2RRD
 dvB9iBj6g4n/UAIxrUnQcWzXFJjO9cz1SAiP5prMJzhHxou1LH4uplwXd Q==;
X-CSE-ConnectionGUID: EFi43Fj/SFGYfpbeYmM9jA==
X-CSE-MsgGUID: ejJD7y6PRhmXkOLsBAc6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54826233"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="54826233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:22:22 -0800
X-CSE-ConnectionGUID: jtIXQ4MlR8mt9l5muMmYAg==
X-CSE-MsgGUID: iaJCpQUESTuIWNAST4bmow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200498646"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:22:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:22:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:22:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:22:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm1ldHs2gimqut8LL8xNBVXR0zTrSraegLhtdmw1twzSwIkIXwiu4TQJOEMjp9bRnUDzM9J48F+f1B6qqFC9yOB6z8EuuB3zy4lqFy6KeRwF0wGRJiuT8MVFdqWx1h8cEgypHK9+Zq1YLpzvaYdC3BI5OpcnagM2h4f99BgMzC0zmzS6OReb1D9RyQPX+ZKrLihqt3rpbjazrtxzF0OEsYkzm5sluJc9MSRx+WRTqx4AhYbs2+Ux20aV34KNCSUOel0R75pVQpWdj7b5PvubExwp29GasMHsYoM/ysyWUcBwWx5P9HmxPwtxTozADJxxcUSAcFTUP9oSvF38xPZnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6uO6StBubFB4xvjISbDTAphurjV4eGBnt6QrRTrIdE=;
 b=jcaVqoFZYeLOThoxyrnIzEtNe8W6E4dan/Ute9QD59P8FASjrcujmeI3Zx94rzSVw9i1/ecLOrL7GVscMpjROrxXM1XFiBV1bCw6deynWL5KOcvOtUkPMLI9eHKDQh3cQqiEoK3Ha9urpXOS/AOxs1itxS9v4DZHbpiCAikxl7yLW6HwQCMz2gDfmfl7JUuZKCw/ARhSDRATLzUc+anNQnujWajyOrBCC9QufSYHL8FXcO41o8qbTgzHGBMK5ezuhj2gzjECDvPDVOxhPB5uGwscppeDkKGdZbbiuwMLDhiBGwXyChtR9/oiBJqG+HxlB+afVqCIJmxyjv6AnihHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ5PPF56FDAD370.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 21:22:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 21:22:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 09/18] lib/xe: Add exec_queue set_property ioctl support
Thread-Topic: [PATCH v3 09/18] lib/xe: Add exec_queue set_property ioctl
 support
Thread-Index: AQHcaLsRIs/d2pXNDUGGJjDhKV4yBrUZ0kQA
Date: Tue, 9 Dec 2025 21:22:05 +0000
Message-ID: <f460ae7831ea65b0a424c810c0953005512db9ff.camel@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
 <20251209032208.1540217-29-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032208.1540217-29-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ5PPF56FDAD370:EE_
x-ms-office365-filtering-correlation-id: 3111c876-c8d9-4a82-b9ca-08de376900db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eWxTVklnZ1NZd0FsWW5pT3FvVnF5Q3BubXg4T214V2phQWZGNGdRZTBXbFc1?=
 =?utf-8?B?dUpPOE85czhCN2c5ckJjaEJ3K2JldWpqQlZFRW1sTXZTMmg5aXNRZ1RJVU1U?=
 =?utf-8?B?WUtIMkpQaEtPc1JXOXBwd1lib0cxeXhJeTNMOVhld2JSM1VyM1lmb1NvbDI0?=
 =?utf-8?B?OFNlSWpIVHdWM2NoYXVMaVRISE0xUmgyaXV0MHhKS3J1L2ZBYkVFWkJKTlNt?=
 =?utf-8?B?bG1sMmpXQkhCZWVMbHhKYTY2NlVHakltRjRDT0dhSTlGb3BMY1NZeGd6bWNR?=
 =?utf-8?B?MGdvdVpKcjVvZWt1WXFBVDFmL25zUkVvazBnTERuSnk0ZlZRQ3dQOGdnRE1S?=
 =?utf-8?B?Z0ttWGhxdnN4T2x6TmlQWXhXZSsweGszT1FDUUIrYzVqbGljamFneStvT1hP?=
 =?utf-8?B?dmYzaUptU2xwb2h4aTY3dFBlV3U3UlJwZ0Zmd0RNNWxMS1RGVSt2Q2FQaXBj?=
 =?utf-8?B?SGlmYkYyb054QWx6ajYzMlRFaWVFajFab2ZacVg2SklFMytIOHY0dmVLNHVB?=
 =?utf-8?B?L1pNSVpyWnlIV1c5WFRURHFpYkF2MFBMR2dBK2s3Uy9PK3R5NG1SRXNxM3lR?=
 =?utf-8?B?KzloMUJ6MnZFMmNwcjloOUhmbndZUjc2SEtHdmpTNWZOTk9DRzZ4VGFOUjFR?=
 =?utf-8?B?QnJYMVE2MktnSVk5a1MwQkJiMkRROFpPcXgzMGpIRTUxNytMeE1JMjBhTzlQ?=
 =?utf-8?B?ODIvd2JmaDZxeW9kMjR5WktmaE01MEU3Q0JaMjh1elNIR2tlaEg0RWtOWVhD?=
 =?utf-8?B?QmxjYkV4dC9XY2VKeDNxRm81Qks3by9rYjJPeWJsa2tZb3ViQ01WcDlLZEFq?=
 =?utf-8?B?OXhobU1NZ21LMVJ4UFErb2FpNlhiNHFZQmNzNjBJSE11MEQwaEc4azY5WXJJ?=
 =?utf-8?B?Qng3OU9pMFBwY2l2eEpyVEM0enVvU0ZZU3pCOVExTWRveDNpWHV0Q1FDcGho?=
 =?utf-8?B?eHF2UFptSmRLdnkvWFF6dy8wZjB6WFpESE5OUFNHelJlR2doMnZUQUllVjRX?=
 =?utf-8?B?WEZUdXY4QkY0N3gvWGhPQ2t0WlV0ck5KM1dxK2l0dFkvWTZyZ1lJdHlFUTlT?=
 =?utf-8?B?ODVTWnVTWUNoSFBpb1BHTG5GZlhBNExHeEZ2eXhsdS9yTklJTTY5QTFpam9X?=
 =?utf-8?B?RjhPN3F1NmQ3M3l2UndGZ1J3bUIzbUpRVFNwU0VnZTFHaWdDQzBEVkF2OU9C?=
 =?utf-8?B?aHZRR1RpVDVZZ1ZIdHV4MStQbi9BOGtGMXhzWnR3Qzh1b0lFMXdhc2R4by91?=
 =?utf-8?B?QWcyQXNicGNnZEZ3Uk5xZTdzUUJDNGhPUEloSDZkMnFUbHJNVW9EZjVXL3Ja?=
 =?utf-8?B?aXFzY2hJa0o5MFJXd1IyclBOQlEwZENKNWlPTHFBak1iWXRLRjVpZlQwa3VX?=
 =?utf-8?B?aFlyQXZLKzNCMEtkWjc0NzRmM0RLQUY1aVAzVFZmOURFUkQrekQvcHBwVFBm?=
 =?utf-8?B?WkZQekpCbEwzUVI4ZE9VejV1R3ZxMzFxN1k5UHRrWWVCbDlyNzUyYzUva05X?=
 =?utf-8?B?YmRsbUZ2ZUN0OUFCVll1WENTcURCNUVUVVk1bWlUWDlBMFRPdG1sQVJMd2NF?=
 =?utf-8?B?RHhBbGtXekxoZ2dvL0tuOHBGZ09qZWFDaEttcVczckpMckFvVjRlVE55dTZj?=
 =?utf-8?B?bDFqclBuYjBlcWM4Rnh3NktlRVB2aXZzSExwa2V3WkhET1Azd0NzUHZ6VDhx?=
 =?utf-8?B?TldTcitKYU82N3ROc0FZOVpKbFFHRUpoYU0zZENLR2RzcklBQmJCSjdTSDdz?=
 =?utf-8?B?UGhDQzZYVEZwZXB0RnBBbkV4UEwxYlRkSkthMVd4Y2s0N0dXR2tOSythVE04?=
 =?utf-8?B?K1VqQXdTQW5Jb0lIUndOd3VVYkZUM0Z0eGF4S3lMTWF2TWFQZ3N2azAvZkN1?=
 =?utf-8?B?dlpET3pkZnZOYllySUxvRGZxSkprTmZPQ1lmemtadGYrblpLT0plczVPYStS?=
 =?utf-8?B?WEkwc2p0N2I5aDZHdmRVL042SStEanhmOXQvWVA0L0JYWHc1UE9LY2RPQ3d0?=
 =?utf-8?B?ckNvNXRjT3FQVEdXVGxVTDhtSXFjWW5DbEZycnhDQXhLZ0c0SVA4VFZ3YUhz?=
 =?utf-8?Q?ezK49Z?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzlSYlZuUkNvYnlPOU1oVEpJTUJ1NUxJU3pTR0xKL3BuSzdxTmpDQVF0Umdv?=
 =?utf-8?B?TWMyMDdIMFRQRXkzUy9ob0k4ekttQ1BzS01adnljRzBiejUzc1ZhNnM5QWxN?=
 =?utf-8?B?SjJkZ3p2UHVKb3d0VlBOMUxlNk9HY09pN1lTalJQbVVrbWY2UUJ6T1hoK1pE?=
 =?utf-8?B?d2FzZCtoSUN1L216YzIwMFJKdnNRdnh2OGlyZjdRZUk2dXJ3bUNPRnVMemFm?=
 =?utf-8?B?Q210WlJTTGxRV2d2OUUvMXBDeG5DWXFKQUV4ZXh6ZytacFh3UXl2WFZDVXFl?=
 =?utf-8?B?dXplUFJlNG00TURTa2FkZlVzaU80Wm9Ja1puWFphNCtyQlkwUUppQ0ZxcHEy?=
 =?utf-8?B?MDdjQ3BFbG1NYnFWUmo0UmdOOG9TaHJqNVhSYlVmZlYydjRvbEppSnVkNG5M?=
 =?utf-8?B?WUw5YzlPZFVSMlMwcWF6bVBWYlo3S0tRSHR6eHZLbnpzdDF1dXJMNStVeDdO?=
 =?utf-8?B?Rk9aemZzL1FkQlEzRUZadTBmUjlNcktJenA4dkJKa2FQSFBFeW9Kc3B2NUVF?=
 =?utf-8?B?dmZMK05EMnNCVU1odnhyOUdpK1FvdnhxS25NMnhXK2NvVEJwQUY1SjBBK0hH?=
 =?utf-8?B?N1BSMmh5aFhpa0IwcmtheXZZYUNMUjhiWmswTHg5R3M0R3ZEdDN6dm95b2Zv?=
 =?utf-8?B?cVJWZE5kbmpRY3I4M1BUVm1YWXl1UGJjN1ozUkFRaU0rOE1EVGlLczVtckpi?=
 =?utf-8?B?a01GQkFLMmJoT2ladVp5UWMzclMyVWd6cDFJRDNqYkMydGlkK1hpQUR3ZTBo?=
 =?utf-8?B?WnBzUHUwV0hoRnRQM210WGtKbHRWbkpXQkNOQzFjTVV0Ulg1czJNKzA3NHpQ?=
 =?utf-8?B?TzlwQ3piZmdSSkx1akMwcWhuRFRGSmRWUU5IcHV6TFZ2MTJNMm9COXppeUhm?=
 =?utf-8?B?NVFQVXJ6Vm55RFNjV3NYaGRjS1FZU1BFZk5EcUUwZWYwQnFLTTk4dEhGY09h?=
 =?utf-8?B?OFN5TXI0QjVucHJ0VDZqNjZ6Tzl3UTdhUEZyV29lOS81RmJsTHhmUU5kNElv?=
 =?utf-8?B?bURoMmtyTExjZUIveXhjbUt0T04yakVZYzROamxxNDh2eWdSWmhBT1JFUFJF?=
 =?utf-8?B?dkFqMlFWRDEzczhaM0RsQ3JQeGJ0NzdyTDhVY2w5OTR3M0M4RjlIWGRPN0dw?=
 =?utf-8?B?ZWFHUml3WWdGYy9CQXZvcmxDTmYwNStvR0tDSjhzdHdOTDM1K1BrSEY3MDZO?=
 =?utf-8?B?WTFObUhMRjZtSXA0R2JmbU9tdGxWdmFlK0dhYlR4WnVwMWVWRjYvRmdyWkdX?=
 =?utf-8?B?ZWRWeFN3ci93eTV5WGJ4elhLRExPdHlDU2tWUm9BT1dMQ3MxUmVQWnhPN1Br?=
 =?utf-8?B?bHZJTzYrSm1VY1FjaDhIT0JHYmgxWHkxczhTSlNYcmpsbEpnZHVicnZndHU3?=
 =?utf-8?B?SUdhMTNwWVdkYTBIdVFWaGxxTTlHYTc0empqOVcza1hXRkhWb1JIam1CT3lC?=
 =?utf-8?B?Z00xVnllTlptVzVTOFk2SW1PeG1HTS92OEtGTGJuWHRacnJVZnBNVkZ6ZEJZ?=
 =?utf-8?B?dHlreE9wVGlmSDR0R3JGL0J5cWM1SmxSRXdxRUFRQWc2bXN1THNYK2VEZ3Bp?=
 =?utf-8?B?UGR3d1FmcC8zTERxS0RzeVorZHBmR2tNQmRobkREc3ljbnQ2TmFPWFdGT3NR?=
 =?utf-8?B?UjlZNlNtTk45dUZrRWpOZTZBN3VuZVEwUGhlSWVUR1U4MWM3RUt1Qmt4aXcr?=
 =?utf-8?B?eW42ZG45S3g5YkFSTTlzVlZSVUtyeUljR0RhMm9ITEZQZXEzSmwwL05IZ09h?=
 =?utf-8?B?eENiVUFZRDdES3ZxZTRYUlNBTStveUVCS2lFbmY1TnNGdk5UR1VsYlhEMUpS?=
 =?utf-8?B?VTBmWlNyaE1EOGRoWjh1U2pOYy9ya2ZwaU1rVHQ2UlZxWExtcFBJKzFIandG?=
 =?utf-8?B?Q1VVYUVCdjdpVms0ZVV2MytzdVpEWlFDMEExUjlzVGlOMFZUeHluaUJaRzA1?=
 =?utf-8?B?aE9uNlNiOXJDNWRiVFVwV1FhNzdkblBkd09hZHRWNzZGZ0pkeU8yYVlSdXZu?=
 =?utf-8?B?RXhqeGdhMmZURDR2LzVQbzFxdXdCejRqVTd1bXVvZGZtTkZ2ZGhNdE9nSVRG?=
 =?utf-8?B?UW8va3U3UGpnbWNXNEhyeVBrNXJ5TnJObmZUMEVHNlVldGFmUzd4Q3lCazJk?=
 =?utf-8?B?T1dMREtEOHhDWjQwa3k4UXd3cTJndHNBd204bVBBVk94NjUwNGp1dzVJWlFJ?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6110381D81ED584A9A8FDE3F88323844@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3111c876-c8d9-4a82-b9ca-08de376900db
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 21:22:05.8139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EB5L5ZvL7utdzyHQLzJCzcEKbhlJsXzTN3C57zjFwm/NPSnevg2flfLBj0XbKrv8v9P5DjDLwvxavMBQ3ZMGsoB0dXbI1Jl5HstA5DIjEOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF56FDAD370
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

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDE5OjIyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEFkZCBpbmZyYXN0cnVjdHVyZSB0byBzdXBwb3J0IHhlX2V4ZWNfcXVldWVf
c2V0X3Byb3BlcnR5X2lvY3RsKCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZpIE1pc2hyYSA8
cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNo
d2FuYXRoYXB1cmEKPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+CgpSZXZp
ZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KCj4gLS0t
Cj4gwqBsaWIveGUveGVfaW9jdGwuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
IMKgbGliL3hlL3hlX2lvY3RsLmggfMKgIDQgKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0bC5jIGIvbGliL3hl
L3hlX2lvY3RsLmMKPiBpbmRleCAzOWM0NjY3YTEuLjMxOTg1M2RhMCAxMDA2NDQKPiAtLS0gYS9s
aWIveGUveGVfaW9jdGwuYwo+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5jCj4gQEAgLTUwMyw2ICs1
MDMsMzMgQEAgdWludDMyX3QgeGVfZXhlY19xdWV1ZV9jcmVhdGVfY2xhc3MoaW50IGZkLAo+IHVp
bnQzMl90IHZtLCB1aW50MTZfdCBjbGFzcykKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGNyZWF0
ZS5leGVjX3F1ZXVlX2lkOwo+IMKgfQo+IMKgCj4gK2ludCBfX3hlX2V4ZWNfcXVldWVfc2V0X3By
b3BlcnR5KGludCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSwKPiB1aW50MzJfdCBwcm9wZXJ0eSwK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdWludDY0X3QgdmFsdWUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJt
X3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5IHhlX3ByaW9yaXR5ID0gewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAucHJvcGVydHkgPSBwcm9wZXJ0eSwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAudmFsdWXCoCA9IHZhbHVlLAo+ICvCoMKgwqDCoMKgwqDC
oH07Cj4gK8KgwqDCoMKgwqDCoMKgaW50IGVycjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZXJyID0g
aWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFksCj4gJnhl
X3ByaW9yaXR5KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJyKSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGVyciA9IC1lcnJubzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X2Fzc3VtZShlcnIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBl
cnJubyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4g
K8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArfQo+ICsK
PiArdm9pZCB4ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eShpbnQgZmQsIHVpbnQzMl90IGV4ZWNf
cXVldWUsCj4gdWludDMyX3QgcHJvcGVydHksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3QgdmFsdWUpCj4gK3sK
PiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVy
dHkoZmQsIGV4ZWNfcXVldWUsCj4gcHJvcGVydHksIHZhbHVlKSwgMCk7Cj4gK30KPiArCj4gwqB2
b2lkIHhlX2V4ZWNfcXVldWVfZGVzdHJveShpbnQgZmQsIHVpbnQzMl90IGV4ZWNfcXVldWUpCj4g
wqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9kZXN0cm95IGRl
c3Ryb3kgPSB7Cj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0bC5oIGIvbGliL3hlL3hlX2lv
Y3RsLmgKPiBpbmRleCBhZThhMjNhNTQuLmE3ZmQ0M2M5ZSAxMDA2NDQKPiAtLS0gYS9saWIveGUv
eGVfaW9jdGwuaAo+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5oCj4gQEAgLTgzLDYgKzgzLDEwIEBA
IHVpbnQzMl90IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGludCBmZCwgdWludDMyX3Qgdm0sCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3Qg
ZXh0KTsKPiDCoHVpbnQzMl90IHhlX2JpbmRfZXhlY19xdWV1ZV9jcmVhdGUoaW50IGZkLCB1aW50
MzJfdCB2bSwgdWludDY0X3QKPiBleHQpOwo+IMKgdWludDMyX3QgeGVfZXhlY19xdWV1ZV9jcmVh
dGVfY2xhc3MoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDE2X3QKPiBjbGFzcyk7Cj4gK2ludCBf
X3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5KGludCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSwK
PiB1aW50MzJfdCBwcm9wZXJ0eSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgdmFsdWUpOwo+ICt2b2lkIHhl
X2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5KGludCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSwKPiB1
aW50MzJfdCBwcm9wZXJ0eSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1aW50NjRfdCB2YWx1ZSk7Cj4gwqB2b2lkIHhlX2V4
ZWNfcXVldWVfZGVzdHJveShpbnQgZmQsIHVpbnQzMl90IGV4ZWNfcXVldWUpOwo+IMKgdWludDY0
X3QgeGVfYm9fbW1hcF9vZmZzZXQoaW50IGZkLCB1aW50MzJfdCBibyk7Cj4gwqB2b2lkICp4ZV9i
b19tYXAoaW50IGZkLCB1aW50MzJfdCBibywgc2l6ZV90IHNpemUpOwoK
