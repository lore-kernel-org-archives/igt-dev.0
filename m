Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4547CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 12:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773FC10E379;
	Mon, 17 Nov 2025 12:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLuvz3Gm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F66A10E39E
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763382881; x=1794918881;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=8UPEdy8/h0A5BEzZZ0HqmZV5Y0ny0cbRVm/28O2cxSI=;
 b=nLuvz3GmKIoAXRPc+/478RGkgqz68A46cmKsHC8Vss/VYdb2nY2xKCVy
 qWJ0+OslEjkZxpi9nl5lR0pSUkOuSknP3Kk500Dk+FZeDGhkeqytVTSrw
 p8uTwAVfzBuRBUIoLRXuFhB6ochtUI20YJGzfEV6kQTxf3FFB2iUEnoYl
 AC7G+gDb6bNNPDd8I6IlRGcaM/ZpfV7dAjPhzjS1w4c4zG0p3srlhQjHn
 m79ggqktEIj3/eJxa6B+lshvakRdXiwXMFEJXqZjj1uZUSOZWDoW924A9
 PNQGOxYWGwUYQJSQIsd1iClmM+uJLViWn9KLgiCUfGpuu+p+Kq0Nw1Eq2 A==;
X-CSE-ConnectionGUID: 3wtX3gYFSCSpylqOxJ0ugg==
X-CSE-MsgGUID: kqJS3+bTSp6bgYE1XzvBgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65416783"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65416783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 04:34:36 -0800
X-CSE-ConnectionGUID: pvpXNFzSRnSyhTXKRsGCxg==
X-CSE-MsgGUID: pS0TTU/MSUiBOwmFFeNFaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="194894505"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 04:34:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 04:34:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 04:34:35 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 04:34:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8FcXpSM7Cm+Eft8msffI5aNq/oBOOHmBce/3mEKC/3HSYSDNJWSXPzPhOcOGw97SnQ72aYQEDoNLCyROgE+XoNijG5cjL4Y9aV+4EXPVQlo8orM8eOZkUIbRy5yKGqB4a6czXJme708cY3XAJdCrAytyx2QXjuPfjdrDqtYbxfwVg2A8mkp3HwQnr1z/Uv1cFXUn44a2RaqmPRIoBzfivYLie6N0q4tXGP8+y/6agwL9Rb5jfpFSam6XsPKDOqSGxNASYbtuxhHJgeLmsSpPCURoZheSXsx6Io80qgQH3hJZMIi1KdAb01Nk/dDrrozxEoh7dp5gdi1kAILCXkzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UPEdy8/h0A5BEzZZ0HqmZV5Y0ny0cbRVm/28O2cxSI=;
 b=uUO9cVUTgE+b38235FM+N/GzB86Tas3J3lN6+mbbA4cZAsuEF4EoB2WgY61lWXZjYt7zoVGQIZ+JoHqCUWTNLqELf2C64F0QuHYVslswMj2cNbO5iQU9wmCIx6TaDsGhAbaspJ4s211Vxznx3eMSViHFDFiGqab16257hcYKg+Ezh24PMCivgMg/SynqUtNvJxVO+84E50sB9wmId8Ag4t41gBtM46ae4/jHFqbrfiokmMRUjKyZu/HB3e2rSlQhPx9sFFHxKJMKucDtI17YjqUfUu0fVw7aeJj90VIegpxJqLP4npJ5ad+1HwXyHH4hkoHxE4HEskJP0RsdrmSI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Mon, 17 Nov 2025 12:34:33 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 12:34:33 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise and introduce lr_sync helpers
Thread-Topic: [PATCH i-g-t v7 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise and introduce lr_sync helpers
Thread-Index: AQHcVLs4ysFZmjr0y0KsLpDYH6RXELT205SA
Date: Mon, 17 Nov 2025 12:34:33 +0000
Message-ID: <2b0a163b988d0d148f04aa3cb8910c18964d2e6a.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-2-nishit.sharma@intel.com>
In-Reply-To: <20251113163308.633818-2-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM4PR11MB5310:EE_
x-ms-office365-filtering-correlation-id: 36aaec72-4576-4139-ec33-08de25d5a96d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?KzJ5SnVsVVJxQ0Fic1YyR2hkRkZjNFYwZGlwVUlHTkdpRGdaZGZ2Nk5QbFNz?=
 =?utf-8?B?Unp0djdMVnVPMmtYMmU2VnkzT1Y4ZEp4dWZHbytNR0Z6MHcyWmQ0V0liN3pH?=
 =?utf-8?B?alFyTzNlQUZ2M0QyRHZwVWFGRUo2dXVWWVFmMVd3M2JkMHNnUUdFYjd3YkFC?=
 =?utf-8?B?aE1iMVhmOXc0bng2TlN2cVhLRWtpc2duSG9temFQYlo3Ymk2L1A4RnhEYnRx?=
 =?utf-8?B?NC9palNhZ0kzRmtGcFc4QlVoMXRWb0J5Ujc2c1Q3eHJOWjJGM3pjV2J6UTB6?=
 =?utf-8?B?UTNrb0xOSlpRcEhpYmZrcHZ5aGFZNkNWUXpLY3JYR1pNWHRHKzg0b1loeW5W?=
 =?utf-8?B?UGx4cTd1aUdyU3pvSGpOQTQ0ZUM2VDlhL3IwanpwNnFzT3JaVFpGTEw4QUs0?=
 =?utf-8?B?UGZ6QU1lcDNaY1ZwV2tCc2tqSVpqZ1FNSTd4NEdFRHd0RFhOMmtxcDBzMnJs?=
 =?utf-8?B?LzU1c3RHQjVOKzQyTCtjRDlkaVdPdno2L2MxWU1nS1c4VDRIV2JKOGI4TFlD?=
 =?utf-8?B?Q1VZWC9DOVBpMjIwUkRONFludmx0cDBaekwxU1JwSmpmV25vNUxISFREVlZy?=
 =?utf-8?B?c1QwdTZ3dDE4SEF1UUFHOHllKzdaaUcreG0ySDFxbkdoVHIzQWk1RnA0Rmt3?=
 =?utf-8?B?NndKWU51V2l6a2RtTUtWMlFoWmNLVjdybzRlalB5OVRBOHNHemkvQ0lzSklB?=
 =?utf-8?B?eVdZWGdKZ0tPZmRVbktaalVQbG9mOTA4Y2pVQkxiVk1XYWgwNHhHbUxKVEF1?=
 =?utf-8?B?cEd1Qy9XS2JFWi9tSVB4eVp5QnJoYWdtR3BHOHJlMEZqcTBrYVF2bFJBaExz?=
 =?utf-8?B?YWNLeml1cGJ6K0Y5ZHVYNjVtc1Z0S0xUWTZKSzhIY042MGJ2enFIeDUzOWJq?=
 =?utf-8?B?OEdPV1dIT09EZERMNHdqZHBBQlBaTGpIU0doUDdBbTNEcURVL0VUV3hLMy91?=
 =?utf-8?B?bWo0RjBmVlR0dUJnV2tmVWdrMHBucVJPTWJvbVNiVFc2OC9BOVVzWkxob3N2?=
 =?utf-8?B?VkpldEhiRGJ2ZWZhUkR0eFRkZ2pxU1B6ZFpBQyszNGNhZG9ZcEMwNzN1MVVi?=
 =?utf-8?B?bXNSK2VzTHlHZjNTeFFrS0p5WW1ncG5RQkRZL3VSNk0xSUgzWW9ZQSs4Z3hh?=
 =?utf-8?B?SXltVXllUmVTblMyeVhpMXhhN01sRVBpelM5Q3hMaWlaWUdrSE9Rb3pwajVh?=
 =?utf-8?B?Ylk4dVVHZG5nM1kzYVN4UFc3N0l1K05Fa3JZSG9lam9SOVhCRVVobXZMVita?=
 =?utf-8?B?WWZhQWJoQWFMUlMvOTMrOTNkU3ZqS3RoNmY5K2lwN2ZDOEhGL2VxUldhK00x?=
 =?utf-8?B?Q2MvenJqeDI4Q3VVaVBHQzM1WC81dENSTE9ZY053NXAxTyt0RkJWVG4xTEgr?=
 =?utf-8?B?ZGZGL1M5WE52VkVWclRlQVZOZnVQVzh6RStoV3NUVVgyRkgzSEZzRHNQZnVR?=
 =?utf-8?B?c3h4SjliZGY5dzZjMGhuME9XaHZTWmpHaUZ1OWpEci9tQW1qWmplZTBKeVYx?=
 =?utf-8?B?eDdlVmtTVStMZUZzRjhPdGhla0hkS2Y2eXNEWHVnYUk3U25vZk9aUUlFY29W?=
 =?utf-8?B?eDRHUmhTR1FZaTVJOVg0R3RHTytCbWlJRDNuVE9nMVh5alEvS1JKN29HUWZo?=
 =?utf-8?B?WXczK21aT1NpL0VPMHQ5cVVTZjF3TXZZMlRidHI3N3dtODdMaUdCbjJKa1Zs?=
 =?utf-8?B?ZzZ0d3YzUGN6Sm5qanExK2k4VTllVlpzV29pMCtMOTAxZlptTm15dVlLQUR6?=
 =?utf-8?B?Tk1tM2dmcGl5RDJWY3N6TDhFUnY5a3MzVUErOE9oLzlxVWZXTEh0bWVaRkQ3?=
 =?utf-8?B?amgzSjhWaU5xVUU5UElQbEZHTndoaTVvbEx5N1dDTjFhRi9VN0pNZUVMNDVX?=
 =?utf-8?B?ZWRMNjlYUFdrdjEwRUpEZmw5WGJxNHlyUTk4QXRWT255MUlTZGxMc0IweXM0?=
 =?utf-8?B?cm1CR1VKSjA2cGdvNk85QmllOHBPeDBuaS9UZTlpbU9JYkVGNEF4cTNwN2hw?=
 =?utf-8?B?VWJTdTNwN3cyTGhKUnMyT20yenlUY2xNenZDc1F1Y01tM2YyL0t3dDY0RHpn?=
 =?utf-8?Q?kPaby1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTRqbzRvektNZlBRZFBpNTgxUzZGWkM5RTlaejdIUXZIUG1Xc3RDZWRRSDhk?=
 =?utf-8?B?djRiVGhzTmEvUUNCWjBWL2dSb1VLWjhDTVV2eXhsVGFrQnpxazdMNEdyU1Uz?=
 =?utf-8?B?L01VK2RETjZ0eFlsVnBXQXN6NzJFcjJnM3hPbWoxSXBoa1Jldjhja1BCWnRj?=
 =?utf-8?B?WHh4OWoyM2NHaDhJdHM5djBvc28zNGR4djNKQWwyNFFSd0ticm5hUUhSRVJU?=
 =?utf-8?B?amNxS0Ftbkxla0Y5dW5ZV3QxNjYyakpjQ0QrcmFlc3kyREY3UVEvVmlUeUhL?=
 =?utf-8?B?alN2RWtSYlY5aE84R1NLQzl2dEV6MDE1VHZDVHFSRmRvU05PdGV6RDcvYlVm?=
 =?utf-8?B?Z3VWdlQ1Z2tCS3BQd1haRTVhMk9VSmc2YU51akw0TDBvNVdQR2NzcDJnY0lV?=
 =?utf-8?B?T3E0REoxay9ZUUEyaVIwblhWUk9mVmlpaVh1amRDYVlOZzNvcWhMLzN0d1Ns?=
 =?utf-8?B?RStvMldQZFlpRGQrTmVxT3cwUHJnUG5lZ2N6TmRzSVZRY1IvS3g3eEZ1cGdE?=
 =?utf-8?B?WUlEMkN2dWFSZFUwUk16ZXVzYkJjMC9EdjJyTWpET1FuV0s5NHRVUU5JTVJx?=
 =?utf-8?B?RThZc3FUWjc0YXRJemRMQTByVlpnWTQreXpIUkV2TUR0TVZKZkhacTRrSU56?=
 =?utf-8?B?MmxhaEF5enk5M3dhemhuS1BxcnZWYUpLZlJ6aDlLV3A3WStkWVJteDdRNUow?=
 =?utf-8?B?Um5OUUprVzNDWHZHMEtNeVRuS2tTY0FPTTBBMFh3WWlBcVhEMDB4SlVDaXV1?=
 =?utf-8?B?cjZyM3g5NUFKY2E0UzE5aUYyV3BlUmVJcytraGpTVldqVkpSZTR2VzdReUJX?=
 =?utf-8?B?YzFaVnAzOUhJT0JaNjBUT0NzbjFtV3pENGVKT3NtQU1pMWQ5R0R5bVFvcmxE?=
 =?utf-8?B?N1V2emN5T1M1dVVNZGdZeXA2MXd5MnIwdlVWdjM4RXRRTGxPbm01MnJIZjNU?=
 =?utf-8?B?NkhqaVdyYTBCV0NzRzZ6VTU3cjRjRlpSMVdXN204VXdvc1NtYWlUYUhkVXFv?=
 =?utf-8?B?aThxcGVGbXkwRzJDc1FEVkJZTlR3V2ZvU2FRSXFwMUFRTzQ0eGFCN3FyRWt0?=
 =?utf-8?B?RVZkUU8yOTV2TXYxRlRJYzFMNlhUN0hDTEVEMXdFeVhxVE84bDdYN0lEUXZZ?=
 =?utf-8?B?Nys3NGt3NXB1WmRLYjdDRDQzS3M5VnpUY2lOYk1ha3pLK3dBMlJkNE9oREQ3?=
 =?utf-8?B?ZWJMWStqNWtPcXJ4bXhEcEVOVXBrN0RoVzVmQXNmeWRRSUtoM1VMSmtnU1Bw?=
 =?utf-8?B?bTR4dy9VSjhXbnVmcnJNNUJ4Rnk0b0grVFcxRnBaUUxFa2UzMzJtNWo5TXdo?=
 =?utf-8?B?WWErVXpNVEVOSlNQdzVmSzV5cGZQNW9nelpkMGxkeDAvUUszRk5iaXZpc1Jn?=
 =?utf-8?B?V211YUI2YVoreGVvbHIzamdGQVM1UXRVaW9SQ2x6NjBxYkpIb1hjS0JuOWlu?=
 =?utf-8?B?Yy9qS2dpcmJSMTV5Y2I3RUZYN0U1N2RXNWcrY1lhRWRVektYdE9yT1F1aXNB?=
 =?utf-8?B?bCtyT093Z1VZcVZKM3J3NlVNU3BwRTloUHk4Qy9YdHVIcTRxS01CUDFCejlF?=
 =?utf-8?B?bUhERVlCekdpNi9vbnpZek5wcDFtSlBxaFNsMXRkZkQ5ZldoOFBkVXFCaHNi?=
 =?utf-8?B?VDBuQW1Jb2RiMlM3djVSMHNRTWtEcStldDZSbzR2NnpQU1Y1S0lmTFhKdVZQ?=
 =?utf-8?B?amdIT0JHYnNCTzBZNHFxWWdQRUdEbE5IWDcxK2VzU3VqdkpHN2tNckdkK2FI?=
 =?utf-8?B?RXQxNElpOThFVE43MkhheFl6NlBSRlRHTnFpWVhVZERHWFpzbEtEOFk3eDRz?=
 =?utf-8?B?UVJTT3gzeEk3eml6RnFmN0hLT3JteGFqVmxkZTUrRTBrVDVoNFVaSURlR0x3?=
 =?utf-8?B?Z1J0d2RDSGZhQXdrajBpcTQ5RENvWGxNdmxJWm1hNE0xS0laMFI4RHpXRyt3?=
 =?utf-8?B?S1ZrOVZwTmZHZ0NxUEsxQlgyeGpyMFBKWXhzVzNOOTJRa2d4OGxDUzVGTjB2?=
 =?utf-8?B?OUswVXU0QjByRnU5cWFUT0RtMXJwdWpnUENWSEZ3eFJSRkI2NG4rZUhqUkRx?=
 =?utf-8?B?dmhtWld5aFJ3ZmlUNnhKTXN1NzdCeUhOVmhZTC9IRUxJTzZjNHRZY1Erai8r?=
 =?utf-8?B?TFV1Ly9kUDM2c1Y0aVJHeXcyVUVZbjVIVlZET0o2d1JHVlZ4TnBlenpaamQ3?=
 =?utf-8?Q?VtcJXPj61PCO8147/DcE9sw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D6D06192414D34CB6BAB700CD3E5F79@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36aaec72-4576-4139-ec33-08de25d5a96d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 12:34:33.3476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izR2k4061keATz+qHQDZtWI20FCmu/flMIJP7Tdd2NS1N5QRKrnN6gfJxL0lGva8vCtGbo2NNxvU3VbfrzgsxK3ZKvfZP7hdI6Vimm8weB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBBZGQgYW4gJ2luc3RhbmNlJyBwYXJhbWV0ZXIgdG8geGVfdm1fbWFkdmlzZSBhbmQg
X194ZV92bV9tYWR2aXNlIHRvDQo+IHN1cHBvcnQgcGVyLWluc3RhbmNlIG1lbW9yeSBhZHZpY2Ug
b3BlcmF0aW9ucy5JbXBsZW1lbnQNCj4geGVfdm1fYmluZF9scl9zeW5jDQo+IGFuZCB4ZV92bV91
bmJpbmRfbHJfc3luYyBoZWxwZXJzIGZvciBzeW5jaHJvbm91cyBWTSBiaW5kL3VuYmluZCB1c2lu
Zw0KPiB1c2VyDQo+IGZlbmNlcy4NCj4gVGhlc2UgY2hhbmdlcyBpbXByb3ZlIG1lbW9yeSBhZHZp
Y2UgYW5kIGJpbmRpbmcgb3BlcmF0aW9ucyBmb3IgbXVsdGktDQo+IEdQVQ0KPiBhbmQgbXVsdGkt
aW5zdGFuY2Ugc2NlbmFyaW9zIGluIElHVCB0ZXN0cy4NCg0KcyBtZW1vcnkgYWR2aWNlL21lbW9y
eSBhZHZpc2UvID8NCg0KQWxzbyB0aGUgbHJfc3luYyBwYXJ0IGlzIHVucmVsYXRlZCBhbmQgc2hv
dWxkIGJlIHNwbGl0IG91dCB0byBhDQpzZXBhcmF0ZSBwYXRjaC4NCg0KVGhhbmtzLA0KVGhvbWFz
DQoNCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1h
QGludGVsLmNvbT4NCj4gLS0tDQo+IMKgaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCB8wqAgNCAr
LS0NCj4gwqBsaWIveGUveGVfaW9jdGwuY8KgwqDCoMKgwqDCoMKgwqAgfCA1MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IC0tDQo+IMKgbGliL3hlL3hlX2lvY3RsLmjC
oMKgwqDCoMKgwqDCoMKgIHwgMTEgKysrKystLS0NCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDU4IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtLXVhcGkveGVfZHJtLmggYi9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oDQo+IGluZGV4IDg5
YWI1NDkzNS4uMzQ3MmVmYTU4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS11YXBpL3hlX2Ry
bS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCj4gQEAgLTIwNjAsOCArMjA2
MCw4IEBAIHN0cnVjdCBkcm1feGVfbWFkdmlzZSB7DQo+IMKgCQkJLyoqIEBwcmVmZXJyZWRfbWVt
X2xvYy5taWdyYXRpb25fcG9saWN5Og0KPiBQYWdlIG1pZ3JhdGlvbiBwb2xpY3kgKi8NCj4gwqAJ
CQlfX3UxNiBtaWdyYXRpb25fcG9saWN5Ow0KPiDCoA0KPiAtCQkJLyoqIEBwcmVmZXJyZWRfbWVt
X2xvYy5wYWQgOiBNQlogKi8NCj4gLQkJCV9fdTE2IHBhZDsNCj4gKwkJCS8qKiBAcHJlZmVycmVk
X21lbV9sb2MucmVnaW9uX2luc3RhbmNlOg0KPiBSZWdpb24gaW5zdGFuY2UgKi8NCj4gKwkJCV9f
dTE2IHJlZ2lvbl9pbnN0YW5jZTsNCj4gwqANCj4gwqAJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9j
LnJlc2VydmVkIDogUmVzZXJ2ZWQNCj4gKi8NCj4gwqAJCQlfX3U2NCByZXNlcnZlZDsNCj4gZGlm
ZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0bC5jIGIvbGliL3hlL3hlX2lvY3RsLmMNCj4gaW5kZXgg
MzljNDY2N2ExLi4wNmNlOGEzMzkgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9pb2N0bC5jDQo+
ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5jDQo+IEBAIC02ODcsNyArNjg3LDggQEAgaW50NjRfdCB4
ZV93YWl0X3VmZW5jZShpbnQgZmQsIHVpbnQ2NF90ICphZGRyLA0KPiB1aW50NjRfdCB2YWx1ZSwN
Cj4gwqB9DQo+IMKgDQo+IMKgaW50IF9feGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZt
LCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdA0KPiByYW5nZSwNCj4gLQkJwqDCoMKgIHVpbnQ2NF90
IGV4dCwgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLA0KPiB1aW50MTZfdCBwb2xpY3kp
DQo+ICsJCcKgwqDCoCB1aW50NjRfdCBleHQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3Zh
bCwNCj4gdWludDE2X3QgcG9saWN5LA0KPiArCQnCoMKgwqAgdWludDE2X3QgaW5zdGFuY2UpDQo+
IMKgew0KPiDCoAlzdHJ1Y3QgZHJtX3hlX21hZHZpc2UgbWFkdmlzZSA9IHsNCj4gwqAJCS50eXBl
ID0gdHlwZSwNCj4gQEAgLTcwNCw2ICs3MDUsNyBAQCBpbnQgX194ZV92bV9tYWR2aXNlKGludCBm
ZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90DQo+IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0KPiDCoAlj
YXNlIERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QUkVGRVJSRURfTE9DOg0KPiDCoAkJbWFkdmlzZS5w
cmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1fZmQgPSBvcF92YWw7DQo+IMKgCQltYWR2aXNlLnByZWZl
cnJlZF9tZW1fbG9jLm1pZ3JhdGlvbl9wb2xpY3kgPSBwb2xpY3k7DQo+ICsJCW1hZHZpc2UucHJl
ZmVycmVkX21lbV9sb2MucmVnaW9uX2luc3RhbmNlID0NCj4gaW5zdGFuY2U7DQo+IMKgCQlpZ3Rf
ZGVidWcoIm1hZHZpc2UucHJlZmVycmVkX21lbV9sb2MuZGV2bWVtX2ZkID0NCj4gJWRcbiIsDQo+
IMKgCQkJwqAgbWFkdmlzZS5wcmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1fZmQpOw0KPiDCoAkJYnJl
YWs7DQo+IEBAIC03MzEsMTQgKzczMyw1NSBAQCBpbnQgX194ZV92bV9tYWR2aXNlKGludCBmZCwg
dWludDMyX3Qgdm0sDQo+IHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0KPiDCoCAqIEB0
eXBlOiB0eXBlIG9mIGF0dHJpYnV0ZQ0KPiDCoCAqIEBvcF92YWw6IGZkL2F0b21pYyB2YWx1ZS9w
YXQgaW5kZXgsIGRlcGVuZGluZyB1cG9uIHR5cGUgb2YNCj4gb3BlcmF0aW9uDQo+IMKgICogQHBv
bGljeTogUGFnZSBtaWdyYXRpb24gcG9saWN5DQo+ICsgKiBAaW5zdGFuY2U6IHZyYW0gaW5zdGFu
Y2UNCj4gwqAgKg0KPiDCoCAqIEZ1bmN0aW9uIGluaXRpYWxpemVzIGRpZmZlcmVudCBtZW1iZXJz
IG9mIHN0cnVjdCBkcm1feGVfbWFkdmlzZQ0KPiBhbmQgY2FsbHMNCj4gwqAgKiBNQURWSVNFIElP
Q1RMIC4NCj4gwqAgKg0KPiAtICogQXNzZXJ0cyBpbiBjYXNlIG9mIGVycm9yIHJldHVybmVkIGJ5
IERSTV9JT0NUTF9YRV9NQURWSVNFLg0KPiArICogUmV0dXJucyBlcnJvciBudW1iZXIgaW4gZmFp
bHVyZSBhbmQgMCBpZiBwYXNzLg0KPiDCoCAqLw0KPiAtdm9pZCB4ZV92bV9tYWR2aXNlKGludCBm
ZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90DQo+IHJhbmdlLA0KPiAtCQnC
oMKgIHVpbnQ2NF90IGV4dCwgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLA0KPiB1aW50
MTZfdCBwb2xpY3kpDQo+ICtpbnQgeGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1
aW50NjRfdCBhZGRyLCB1aW50NjRfdA0KPiByYW5nZSwNCj4gKwkJwqDCoCB1aW50NjRfdCBleHQs
IHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwNCj4gdWludDE2X3QgcG9saWN5LA0KPiAr
CQnCoMKgIHVpbnQxNl90IGluc3RhbmNlKQ0KPiDCoHsNCj4gLQlpZ3RfYXNzZXJ0X2VxKF9feGVf
dm1fbWFkdmlzZShmZCwgdm0sIGFkZHIsIHJhbmdlLCBleHQsDQo+IHR5cGUsIG9wX3ZhbCwgcG9s
aWN5KSwgMCk7DQo+ICsJcmV0dXJuIF9feGVfdm1fbWFkdmlzZShmZCwgdm0sIGFkZHIsIHJhbmdl
LCBleHQsIHR5cGUsDQo+IG9wX3ZhbCwgcG9saWN5LCBpbnN0YW5jZSk7DQo+ICt9DQo+ICsNCj4g
KyNkZWZpbmXCoMKgwqDCoMKgwqDCoCBCSU5EX1NZTkNfVkFMwqDCoCAweDY4Njg2OA0KPiArdm9p
ZCB4ZV92bV9iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDMyX3QgYm8sIHVp
bnQ2NF90DQo+IG9mZnNldCwNCj4gKwkJCXVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHNpemUsIHVp
bnQzMl90DQo+IGZsYWdzKQ0KPiArew0KPiArCXZvbGF0aWxlIHVpbnQ2NF90ICpzeW5jX2FkZHIg
PSBtYWxsb2Moc2l6ZW9mKCpzeW5jX2FkZHIpKTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3lu
YyA9IHsNCj4gKwkJLmZsYWdzID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+ICsJCS50eXBl
ID0gRFJNX1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiArCQkuYWRkciA9IHRvX3VzZXJfcG9p
bnRlcigodWludDY0X3QgKilzeW5jX2FkZHIpLA0KPiArCQkudGltZWxpbmVfdmFsdWUgPSBCSU5E
X1NZTkNfVkFMLA0KPiArCX07DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0KCEhc3luY19hZGRyKTsNCj4g
Kwl4ZV92bV9iaW5kX2FzeW5jX2ZsYWdzKGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIHNpemUsICZz
eW5jLA0KPiAxLCBmbGFncyk7DQo+ICsJaWYgKCpzeW5jX2FkZHIgIT0gQklORF9TWU5DX1ZBTCkN
Cj4gKwkJeGVfd2FpdF91ZmVuY2UoZmQsICh1aW50NjRfdCAqKXN5bmNfYWRkciwNCj4gQklORF9T
WU5DX1ZBTCwgMCwgTlNFQ19QRVJfU0VDICogMTApOw0KPiArCS8qIE9ubHkgZnJlZSBpZiB0aGUg
d2FpdCBzdWNjZWVkcyAqLw0KPiArCWZyZWUoKHZvaWQgKilzeW5jX2FkZHIpOw0KPiArfQ0KPiAr
DQo+ICt2b2lkIHhlX3ZtX3VuYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2
NF90IG9mZnNldCwNCj4gKwkJCcKgIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHNpemUpDQo+ICt7
DQo+ICsJdm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkciA9IG1hbGxvYyhzaXplb2YoKnN5bmNf
YWRkcikpOw0KPiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jID0gew0KPiArCQkuZmxhZ3MgPSBE
Uk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VT
RVJfRkVOQ0UsDQo+ICsJCS5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCh1aW50NjRfdCAqKXN5bmNf
YWRkciksDQo+ICsJCS50aW1lbGluZV92YWx1ZSA9IEJJTkRfU1lOQ19WQUwsDQo+ICsJfTsNCj4g
Kw0KPiArCWlndF9hc3NlcnQoISFzeW5jX2FkZHIpOw0KPiArCSpzeW5jX2FkZHIgPSAwOw0KPiAr
CXhlX3ZtX3VuYmluZF9hc3luYyhmZCwgdm0sIDAsIDAsIGFkZHIsIHNpemUsICZzeW5jLCAxKTsN
Cj4gKwlpZiAoKnN5bmNfYWRkciAhPSBCSU5EX1NZTkNfVkFMKQ0KPiArCQl4ZV93YWl0X3VmZW5j
ZShmZCwgKHVpbnQ2NF90ICopc3luY19hZGRyLA0KPiBCSU5EX1NZTkNfVkFMLCAwLCBOU0VDX1BF
Ul9TRUMgKiAxMCk7DQo+ICsJZnJlZSgodm9pZCAqKXN5bmNfYWRkcik7DQo+IMKgfQ0KPiBkaWZm
IC0tZ2l0IGEvbGliL3hlL3hlX2lvY3RsLmggYi9saWIveGUveGVfaW9jdGwuaA0KPiBpbmRleCBh
ZThhMjNhNTQuLjFhZTM4MDI5ZCAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmgNCj4g
KysrIGIvbGliL3hlL3hlX2lvY3RsLmgNCj4gQEAgLTEwMCwxMyArMTAwLDE4IEBAIGludCBfX3hl
X3dhaXRfdWZlbmNlKGludCBmZCwgdWludDY0X3QgKmFkZHIsDQo+IHVpbnQ2NF90IHZhbHVlLA0K
PiDCoGludDY0X3QgeGVfd2FpdF91ZmVuY2UoaW50IGZkLCB1aW50NjRfdCAqYWRkciwgdWludDY0
X3QgdmFsdWUsDQo+IMKgCQnCoMKgwqDCoMKgwqAgdWludDMyX3QgZXhlY19xdWV1ZSwgaW50NjRf
dCB0aW1lb3V0KTsNCj4gwqBpbnQgX194ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMyX3Qgdm0s
IHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90DQo+IHJhbmdlLCB1aW50NjRfdCBleHQsDQo+IC0JCcKg
wqDCoCB1aW50MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92YWwsIHVpbnQxNl90DQo+IHBvbGljeSk7
DQo+IC12b2lkIHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3QgYWRk
ciwgdWludDY0X3QNCj4gcmFuZ2UsIHVpbnQ2NF90IGV4dCwNCj4gLQkJwqDCoCB1aW50MzJfdCB0
eXBlLCB1aW50MzJfdCBvcF92YWwsIHVpbnQxNl90IHBvbGljeSk7DQo+ICsJCcKgwqDCoCB1aW50
MzJfdCB0eXBlLCB1aW50MzJfdCBvcF92YWwsIHVpbnQxNl90IHBvbGljeSwNCj4gdWludDE2X3Qg
aW5zdGFuY2UpOw0KPiAraW50IHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWlu
dDY0X3QgYWRkciwgdWludDY0X3QNCj4gcmFuZ2UsIHVpbnQ2NF90IGV4dCwNCj4gKwkJwqAgdWlu
dDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLCB1aW50MTZfdCBwb2xpY3ksDQo+IHVpbnQxNl90
IGluc3RhbmNlKTsNCj4gwqBpbnQgeGVfdm1fbnVtYmVyX3ZtYXNfaW5fcmFuZ2UoaW50IGZkLCBz
dHJ1Y3QNCj4gZHJtX3hlX3ZtX3F1ZXJ5X21lbV9yYW5nZV9hdHRyICp2bWFzX2F0dHIpOw0KPiDC
oGludCB4ZV92bV92bWFfYXR0cnMoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX3ZtX3F1ZXJ5X21lbV9y
YW5nZV9hdHRyDQo+ICp2bWFzX2F0dHIsDQo+IMKgCQnCoMKgwqAgc3RydWN0IGRybV94ZV9tZW1f
cmFuZ2VfYXR0ciAqbWVtX2F0dHIpOw0KPiDCoHN0cnVjdCBkcm1feGVfbWVtX3JhbmdlX2F0dHIN
Cj4gwqAqeGVfdm1fZ2V0X21lbV9hdHRyX3ZhbHVlc19pbl9yYW5nZShpbnQgZmQsIHVpbnQzMl90
IHZtLCB1aW50NjRfdA0KPiBzdGFydCwNCj4gwqAJCQkJwqDCoMKgIHVpbnQ2NF90IHJhbmdlLCB1
aW50MzJfdA0KPiAqbnVtX3Jhbmdlcyk7DQo+ICt2b2lkIHhlX3ZtX2JpbmRfbHJfc3luYyhpbnQg
ZmQsIHVpbnQzMl90IHZtLCB1aW50MzJfdCBibywNCj4gKwkJCXVpbnQ2NF90IG9mZnNldCwgdWlu
dDY0X3QgYWRkciwNCj4gKwkJCXVpbnQ2NF90IHNpemUsIHVpbnQzMl90IGZsYWdzKTsNCj4gK3Zv
aWQgeGVfdm1fdW5iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3Qgb2Zm
c2V0LA0KPiArCQkJwqAgdWludDY0X3QgYWRkciwgdWludDY0X3Qgc2l6ZSk7DQo+IMKgI2VuZGlm
IC8qIFhFX0lPQ1RMX0ggKi8NCg0K
