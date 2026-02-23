Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F36EF5865
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE2110E219;
	Mon, 23 Feb 2026 05:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnjN8p3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A5210E219
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771823409; x=1803359409;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H4b5jmRMNH5orGypwjt5wHHMVhnYn2dfcwb/vnz3oPg=;
 b=FnjN8p3qPks3cusJGNAZyK7fDamsTH/EIG0Vt2vMUFZ/WeiQmHXgwiiZ
 fBIN84Vbsn11kuWffaV+ZgYeJ/y/T3sFYBd1iBYLAs3MT+O0QIwQXyYAD
 w6QRARS4O9wCLdYkCJIQQmG0ZLEjGiE97zimp6JTbqRUZhBv7YQuKdhxQ
 YJXN45xxrD4utpHd06QvmurFHr+kk0vSdFKTZ04zEaPjzzbDPIMC5gX+J
 Q71MRLtm1C1GFRdfUkPvOQClaOjD3ul9GT8oxnfrvCg0jEOb9/JpEaERT
 UzlJThiTG7Fm5inLvWyPmsUw2lhGVsrKR/NveP+x/W0p3bbxJiByBFxcm A==;
X-CSE-ConnectionGUID: cIL0oS+5Sui3u5w36/J9JA==
X-CSE-MsgGUID: kHKAibvfQUemz4cesrYP1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72852771"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72852771"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:10:08 -0800
X-CSE-ConnectionGUID: +y9iWGoiS1ao8kkua1Jeig==
X-CSE-MsgGUID: Tz55dBIeTTujQD4th/2SJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219013602"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:10:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:10:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:10:07 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:10:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyuMrmMDtOc2p/Gl1G2S9nATtHG4hTbRCq06er/OQFdS1AtlHC13zcfk6pMyPT8ZLTb0ZMvAE7gRrq6sH7QzAg8vlVMbHEZeNPBs1FudHCxqDxf9/95bLsiLfdc+H5XlN3tTJseotD/BwKJPXNQBLWG0zf9dL9QdOwy1djvAMwQVWiOm+DOqwys6ykrQlnUritGrcqTThbGWXs9WKeV+troyc2rljdsZeOFznizTpoI2V101zh68Gp9NaVs65g0qzUkpJYTU2iwvsYpfU6Num9QipmwOh7cRNDxdajnWhToUP8r6wxzJ8diWCIHxbv2n01s+19BBvLO7fBRYRCICTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4b5jmRMNH5orGypwjt5wHHMVhnYn2dfcwb/vnz3oPg=;
 b=nOuJYaVrru0ut2GLozaqaiS3SNrnw4h+vTnunUCeiGfx38GaBdED6cVp3zPehJxCzeZbwRCO23tK4xGjcsaaFYgXZnscOM0WEW1sD/1mx9FsNRboUwDA2Btl/t14TceAz5H/sHCEwEgcH09dPmnFVi5TLm8cGhRm8tX0L7h0wvF8WePe6KmQ3c+SBJgs+TujFBdg1J/ueGztztjq+dUfvX7x9L+EtyUy/Fs5OfbV1Smo8z13cVT2hxUu+TFG2kRgPsa40zzwUWWViQTW3XRTNhnZv3Fe2EvPPzIxJ/qkIfedttD52gAG938TJwrl/FMCQKXtARoOGuIRZkKar+p2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:10:04 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:10:04 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
Thread-Topic: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
Thread-Index: AQHcn7Ylj2e7iacx0UKoOR9eoB6OebWPxeHg
Date: Mon, 23 Feb 2026 05:10:04 +0000
Message-ID: <BL1PR11MB5525815CFC7A3B5CE8F07CB58477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-5-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-5-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: 67a45258-f731-4a90-80e9-08de7299cdea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?RkVWbjBSaDBnblc0dzJBeVkzOURUTFo3OTFHcmpyMGwxaktiTzVqbkttNlNw?=
 =?utf-8?B?Tkt5dDVMTlVGZmJLeWduUzY1bmJkamlENVdCeXVIVExIN0ZsNE1PMkEvaDg2?=
 =?utf-8?B?N3dUQ1poZ3R5YUxQYk9SRFgrQVhxOVE4VGxDSjNKbHRvTkdzSkUzZk9CQUh4?=
 =?utf-8?B?ZXZHSkJyYlJSVGZmaVR1WFlUeTNGR0F6RFRGajVvWUtLYTZDa3liSjlITG9Q?=
 =?utf-8?B?blRzT1NFUVF1V09TbE80VFp0THNSbUFzdlhUb0FkWHJYUWNudVQxQjhrbmVu?=
 =?utf-8?B?VnBETWlMM2RNK0lMLzE1T3A1QXZiQWh6WHdQd1BudTVpaDJTQ2p1RFRwSVZj?=
 =?utf-8?B?Z0REY1ZrMkhIZUFvNnhINVJOZ2R6eDN3Vko2U3AwNkIza2JOSS91akFkb1hP?=
 =?utf-8?B?MmVmd0VuNTZTTWtKc1U0U0Y5SnZCL2Y3cEVDRExzRitkbFJTblJPMjYxUGJo?=
 =?utf-8?B?T3FqS05vM1l3RmdESTlya0ZGdEtjRkxRTk9YT1hIVVYwaUFWMTRyNVlaKzBI?=
 =?utf-8?B?ZDFua0ZWNUs3RXdrTDNYMUZYTG5VSDFQN3pCeHZ3Y2w0dXgyMWRlc09aQ0li?=
 =?utf-8?B?MzFnRDk2WmhlT1lKaHdtcmxZdUhwa3VCbXltQ3VnSmVNcHFKVEtGTjNGd0o0?=
 =?utf-8?B?TmVCS2pJVHBtWDVRQXhIa0VuL3lWUk1wT1hrSTlyNmFmUy80WmpXUjlTNW1R?=
 =?utf-8?B?SVp3OUwzMXpUSTFLTTJ1Kzh5cWxlTEd1Z1VCSTdBR002WnhrTnVZdGxBV2Nz?=
 =?utf-8?B?L0NjbGxNT1c2b3FYbjc2SUY0RVE3TjJTbi91MXdyWGhyc3VHZ1FIRGhuLzA0?=
 =?utf-8?B?eWFEdTBWQkZ4M2x4dTExNnVqbU5mVzliSi9pWUlhRzI5NFExMmhlb1BvbCtE?=
 =?utf-8?B?V0NBR1RzUElaRDlqanRKSGVUbVNCNGlYSnkxeVdMSHkycGk1MDJ2VExPSEFp?=
 =?utf-8?B?TDFva0tCRFhpTlp5QWh5bDI2ajRtcVNuV2ZpRGRoZXlKcTZXczFqdy8wWjFx?=
 =?utf-8?B?citadFp0UUgwRnoyS09lQ3djY2dZSHZCeXh2YlRzZVhTMjl0M3c1VEVTSW1z?=
 =?utf-8?B?ekU5bDBGOElXRlI0WXdFQTRrTTRUU3VKajFTcjVRVi9rRTlONXNRTzdnWFVC?=
 =?utf-8?B?cXJDOXQvckRCUGw0QlNqc2pnd2VPZVNncE9adEI1dWh3dkw0Z0hLOU9DQzlr?=
 =?utf-8?B?UVJ2UG95QlllT3hpSHV5MWxSVGNVek1pbi9ScnBHK3B1U05LMisremJqZmVU?=
 =?utf-8?B?ak9QUlFQWkhhRE1VcitWZGhVckdzZmo3dnFnbEJ4K0p5SnhBalVhSDRWYXlw?=
 =?utf-8?B?UzRoRDY0U2dlUTZZamkrNzE4MG5PMEhHaU9JVlc3dmNHek1xeDYrNUtZQkpW?=
 =?utf-8?B?L2szM24xWHlMbjI4eXJVaDBFOXpCY291aHZMcXBSQnJBT2FrbitMUkRpY2ZR?=
 =?utf-8?B?Q2pEajIrVjJLaTZBN2NGK0N0R2M2TmRSeGdOUFBxWUFrbmJKd00zWkFVSU5k?=
 =?utf-8?B?dThLdDVBSjByaFpoTEdRWUh1UGVqQ0xDMnJZZDVxZUpZczNUN3VqZWp5WFBF?=
 =?utf-8?B?NDF6U0JYaW04OXVwMTliU1k1emNjTlJzNDhsVGNlS1dQaTZXQjEyV0doSU5v?=
 =?utf-8?B?UEdJOVFzMzhxM2RCV1J0eFJLTGJ4MFcyejdIbUt2K0FqaEltZG9BN1A2anJn?=
 =?utf-8?B?SFRkanhIN2F0anFGNVBUVWwrcTkzUGkxSGFTaE1IZy9aWGovTmR0WDJIR3Y3?=
 =?utf-8?B?VHZkMXpmYXY5Q0psMlhBYmo5eGh2UW5NcXpBQnQ1cWFSckpqSVA0K2NEMlNx?=
 =?utf-8?B?UU9JNlhlTWRVbXFkMldJYzEvaW5iT1VnVzdnUXVaQ1ZIeStCSThEenIwRndW?=
 =?utf-8?B?TkNIM0htZzZ4dXlpQ0E5ZnJsVzYyTG5VNytpU2RTUlF3UURJZ1ZmTHY5a3Ax?=
 =?utf-8?B?VWxFWDd3QWxmS2lKcXhsODNINGdZamJKdUFza1krTGxzVW9XOTRlUVhNNG5T?=
 =?utf-8?B?cjFJaFpsLyt0QWwxWDhSQzJSdkRiTHNGZ1Iwa0lZUEdycmZwNHY4RzN1eHoy?=
 =?utf-8?B?WTVvZldEY1VZZnBsWWwrKzJmNjRrVGFpRlJvTkxhOEZ6Z0NtM1czK2wyTHYy?=
 =?utf-8?B?TWI2U214R0JrY2QwQXV5eU92NWJlWXA3NjdjNG93ODBQVS9aT1FqV3hhUGQr?=
 =?utf-8?Q?RczLEu9zeNeP0d8LpBr3h8E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWdxUy9pSmJkeThNVnpWL3FGWDhiQ2gxVkRweDVoSVhnVG9CdC83ejZETDR0?=
 =?utf-8?B?VThhUEdHYzJKdHBlZU53N1VvODhMNmdOUmF6RXY1NFBiZmVsbzI5bkxFc2Vt?=
 =?utf-8?B?YUZjcGdlZ1BpSTRydElNYnptQ2k0N2hpZHlONVF4WUUvQ3VFWU1md21ETy9C?=
 =?utf-8?B?b0gvZFVoeFBpVmZLR3ZINnRoeDU2T0d1LzZyWkhQUmR0cC93R0xFTEpxTkli?=
 =?utf-8?B?cjczWGVzMk54TmtVZXRWOTYxdUJJdHR0R2pFdFJDSjc0cm9QenA4a2p5dm5S?=
 =?utf-8?B?cXZyWTgxeHhMUzhkRFZ3UHNHZFlUem5HamJ2Wk1lMEc0TTNaNXZqU0NyOU9l?=
 =?utf-8?B?TjVJS1phVlJWZElXUkNlTi9xV00wUVpRcUQrVmMwZk92d3pYbmY0elhqWUs5?=
 =?utf-8?B?bUNKWTZ2aFVzeVJTWnJZZVc4bGw4ZzJrTUZRWkRud29qNkFpTkx4Y1d3YWhW?=
 =?utf-8?B?azgreVk4OEVPNmtqaWxrUmpzMzBBdlJXdmNMSyszanhnNDREaGlIb0ltUmI1?=
 =?utf-8?B?c1IvM2szWHFKbmxxc0prMUFaclpWSHVaaDlvM1EwcGtzeWVINVZjRGJ1VHFT?=
 =?utf-8?B?djBTeGkrSVgzQTVCNkxtSnJSWlJRSWdoWW1UQmZDeHU2bnEvUlRMZUV6Ri9v?=
 =?utf-8?B?QmdETnB3MnZvU3cranhNYkkyWGoxUkFmOUlUZWJpUkRUZXIwMXZTRzk1T1M5?=
 =?utf-8?B?U21RTTVGa0RjQko0MlRpOXdvNnFFWldTajFQdWk1ZkRwNmtxZVBjN3JSN29x?=
 =?utf-8?B?ejBIMUJqNGdUNU4vQ0tRNWNNeTBYeW5aUkRic2pUVUlYUVZPazBtekk1c05V?=
 =?utf-8?B?T1Y3aWRrVDZzRFJXNlNZL05UcmYwczhOSUh6cHhaS3dPbUVJNjdhUG5EM0NQ?=
 =?utf-8?B?L3JjVmljZHZhYTZFREhEc3ZEL2FId1NiQUQrRkd3dytmbWdDSkNURkZsUGdW?=
 =?utf-8?B?S2tPWTRhYlhBbWxGUmZLbW8zMkFrZjl0QlNIMTUzLzcwd1J3UWtVc3pVa2k0?=
 =?utf-8?B?MzU5SVoxZmhSUHlqeUd3alBVT2YxMlhXVTczeTR2bEF2L2srMHVTd0plWUdl?=
 =?utf-8?B?YWNoMXM0MU93UjhXSlFraExJQjN0bzFzZlo4c3NTQndQOUtRNk43QkU3MmZq?=
 =?utf-8?B?NVhCOXhiL0NlOTBhZmNFaW5nMkpDTVVEZjRMdHVubkRRbEYySlBiZXRiYVZq?=
 =?utf-8?B?V0c0c3NUY3B5Q3F2M3YrcDB4UzhwMXB4ZWdBMGYxZ1FIWXdjUzVBVHJGcHJ4?=
 =?utf-8?B?UG5JeHJTb3VGQnVUaTlRZGVDeG8rYUpuNG5ZOVJFUFk4ekdBTjkvZlZkUkxB?=
 =?utf-8?B?NE9qREtnaGJuQkk4U2plU1RuSEpzUkZsNkNTNnR5RDR1WmFDcVRCQVFDc1BB?=
 =?utf-8?B?UkdzSHRiclorRjhMOXFEYndOZk9SSTJtdnc5SllHanF6QTlIcWk1ZW1VaHlH?=
 =?utf-8?B?bGpBMTBoOTJoaDR1UEVtWnNRa244aTdxQlZva0JxMlowbzNpMWR3NWcrL2M5?=
 =?utf-8?B?OTZFUHVhT04rMlRyei9ZQklTcUFCRUlWU25yY21iRER0VFUwM1N4eXRqOWRL?=
 =?utf-8?B?SGdIdmkvbExEYmJVdzRvZFF6Q0RkemFxbUYvVjRRTUVKY0pGY2lvOUVndUFo?=
 =?utf-8?B?TGVUVDQxaFFsRHEvZEtoU0pJQ0ttWWdSWXBsYzdCYlNrS29SM0NqdnhuSncz?=
 =?utf-8?B?ZUZTczFGc2gzanlwTExhNExxRW8rdnNwQTVuSm9kSlloYnllbE0vdVd2ZW5W?=
 =?utf-8?B?eEFXZnNUSTU3SmJmOEg0NHdPR0hmL2JJTTRQUjRLUTNIVjlOdjdrbGN1YTNG?=
 =?utf-8?B?SHRTRzB2d2M0V084L3BJRlZWS2xSS1JoZXNrL0JhYzFEZERnbnI2a2ZPYlgy?=
 =?utf-8?B?MHlUWXJhejdQNnV0a295aWxHVHd6TSs4VHE3ZmtRRDVnY0RydkdQQzhyMU9P?=
 =?utf-8?B?SXB1b2VVQVdjUlhLb1JEaFhTVUdFd2JhbUg2aG5rQzdmZU12Y09yZjl2TE5K?=
 =?utf-8?B?TTQxN3o5aVlWVXMvUXJ5bU0yUGpoWmYvdzZXbkJWQmxoamNrdnlrWFhzOGlU?=
 =?utf-8?B?MzlEZ1YrVFFEcVlpdm1nZDdPSEVNaVhLSURDdEQzbFlrT3pvSHZjbDR2bHB2?=
 =?utf-8?B?MWsvU1o4d292eTJYaTc5ZjFLTHV4OFFSclVyTWh2T0JQeDhRb1BEVUI4emd3?=
 =?utf-8?B?alNJS2oybnE3Q3JVR3l5UjBRVFRvamZTTHErNWhKaTdXZlpha09qcUdHaXNX?=
 =?utf-8?B?THNlb21lRmd1TWdPMUluSU9yZ3hVQ3NBdTBiUzVyNG1NQ3R5bW1WS1duMlFU?=
 =?utf-8?B?NkhqNnZYRmovV3dyNkpNaG5ZMVUzQWF4Y2hXUGo3Qld5SDlROHF1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a45258-f731-4a90-80e9-08de7299cdea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 05:10:04.3055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYCdMJ1EWHLyOYNE/SfioHBEawkRgGuDalS+3JXryURc+w9P1VMqg++FjfkaDtmFKiXNSKFddmaBx0hbKSuRm5XnHt+RYiu36o8zN1o+BEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDQvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIGRvbnRuZWVkLWFmdGVyLQ0KPiBtbWFwIHN1YnRlc3QNCj4gDQo+IFRoaXMgdGVzdCB2
ZXJpZmllcyB0aGF0IGFuIGV4aXN0aW5nIG1tYXAgYmVjb21lcyBpbnZhbGlkIGFmdGVyIHRoZSBC
TyBpcyBtYXJrZWQNCj4gYXMgcHVyZ2VhYmxlIGFuZCBwdXJnZWQuIFRoZSB0ZXN0IGNyZWF0ZXMg
YSBCTywgbWFwcyBpdCwgd3JpdGVzIGRhdGEsIHRoZW4NCj4gbWFya3MgaXQgRE9OVE5FRUQgYW5k
IHRyaWdnZXJzIG1lbW9yeSBwcmVzc3VyZS4NCj4gQWNjZXNzaW5nIHRoZSBwcmV2aW91c2x5IHZh
bGlkIG1hcHBpbmcgc2hvdWxkIG5vdyB0cmlnZ2VyIFNJR0JVUyBvciBTSUdTRUdWLA0KPiBjb25m
aXJtaW5nIHRoYXQgZXhpc3RpbmcgbWFwcGluZ3MgYXJlIGNvcnJlY3RseSBpbnZhbGlkYXRlZCB3
aGVuIHRoZSBiYWNraW5nDQo+IHN0b3JlIGlzIHB1cmdlZC4NCj4gDQo+IENjOiBOaXNoaXQgU2hh
cm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6IFByYXZhbGlrYSBHdXJyYW0gPHBy
YXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnBy
YXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFydmluZCBZYWRhdiA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9tYWR2aXNl
LmMgfCA1NA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL3hlX21hZHZpc2UuYyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYyBpbmRleA0KPiA3
ZGJlNzBmNDIuLjVjNmEyNDU1MyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYw0KPiBAQCAtMTk2LDYgKzE5Niw1
NCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RvbnRuZWVkX2JlZm9yZV9tbWFwKGludCBmZCwNCj4gc3Ry
dWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuYw0KPiAgCXhlX3ZtX2Rlc3Ryb3koZmQsIHZt
KTsNCj4gIH0NCj4gDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGRvbnRuZWVkLWFmdGVyLW1tYXAN
Cj4gKyAqIERlc2NyaXB0aW9uOiBNYXJrIEJPIGFzIERPTlRORUVEIGFmdGVyIG1tYXAsIHZlcmlm
eSBTSUdCVVMgb24NCj4gK2FjY2Vzc2luZyBwdXJnZWQgbWFwcGluZw0KPiArICogVGVzdCBjYXRl
Z29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkIHRlc3RfZG9u
dG5lZWRfYWZ0ZXJfbW1hcChpbnQgZmQsIHN0cnVjdA0KPiArZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqaHdlKSB7DQo+ICsJdWludDMyX3QgYm8sIHZtOw0KPiArCXVpbnQ2NF90IGFkZHIg
PSBQVVJHRUFCTEVfQUREUjsNCj4gKwlzaXplX3QgYm9fc2l6ZSA9IFBVUkdFQUJMRV9CT19TSVpF
Ow0KPiArCXZvaWQgKm1hcDsNCj4gKw0KPiArCXB1cmdlYWJsZV9zZXR1cF9zaW1wbGVfYm8oZmQs
ICZ2bSwgJmJvLCBhZGRyLCBib19zaXplLCB0cnVlKTsNCj4gKw0KPiArCW1hcCA9IHhlX2JvX21h
cChmZCwgYm8sIGJvX3NpemUpOw0KPiArCW1lbXNldChtYXAsIDB4QUIsIGJvX3NpemUpOw0KPiAr
DQo+ICsJaWYgKCFwdXJnZWFibGVfbWFya19hbmRfdmVyaWZ5X3B1cmdlZChmZCwgdm0sIGFkZHIs
IGJvX3NpemUpKQ0KPiArCQlpZ3Rfc2tpcCgiVW5hYmxlIHRvIGluZHVjZSBwdXJnZSBvbiB0aGlz
IHBsYXRmb3JtL2NvbmZpZyIpOw0KPiArDQo+ICsJLyogQWNjZXNzIHB1cmdlZCBtYXBwaW5nIC0g
c2hvdWxkIHRyaWdnZXIgU0lHQlVTL1NJR1NFR1YgKi8NCj4gKwl7DQo+ICsJCXNpZ2hhbmRsZXJf
dCBvbGRfc2lnc2Vndiwgb2xkX3NpZ2J1czsNCj4gKwkJY2hhciAqcHRyID0gKGNoYXIgKiltYXA7
DQo+ICsJCWludCBzaWc7DQo+ICsNCj4gKwkJb2xkX3NpZ3NlZ3YgPSBzaWduYWwoU0lHU0VHViwg
KF9fc2lnaGFuZGxlcl90KXNpZ3RyYXApOw0KPiArCQlvbGRfc2lnYnVzID0gc2lnbmFsKFNJR0JV
UywgKF9fc2lnaGFuZGxlcl90KXNpZ3RyYXApOw0KPiArDQo+ICsJCXNpZyA9IHNpZ3NldGptcChq
bXAsIFNJR0JVUyB8IFNJR1NFR1YpOw0KPiArCQlpZiAoc2lnID09IFNJR0JVUyB8fCBzaWcgPT0g
U0lHU0VHVikgew0KPiArCQkJLyogRXhwZWN0ZWQgLSBwdXJnZWQgbWFwcGluZyBhY2Nlc3MgZmFp
bGVkICovDQo+ICsJCX0gZWxzZSBpZiAoc2lnID09IDApIHsNCj4gKwkJCSpwdHIgPSAwOw0KPiAr
CQkJaWd0X2Fzc2VydF9mKGZhbHNlLCAiQWNjZXNzIHRvIHB1cmdlZCBtYXBwaW5nIHNob3VsZA0K
PiB0cmlnZ2VyIHNpZ25hbFxuIik7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQlpZ3RfYXNzZXJ0X2Yo
ZmFsc2UsICJ1bmV4cGVjdGVkIHNpZ25hbCAlZFxuIiwgc2lnKTsNCj4gKwkJfQ0KPiArDQo+ICsJ
CXNpZ25hbChTSUdCVVMsIG9sZF9zaWdidXMpOw0KPiArCQlzaWduYWwoU0lHU0VHViwgb2xkX3Np
Z3NlZ3YpOw0KPiArCX0NCj4gKw0KPiArCW11bm1hcChtYXAsIGJvX3NpemUpOw0KPiArCWdlbV9j
bG9zZShmZCwgYm8pOw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gK30NCj4gKw0KUmV2
aWV3ZWQtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0K
PiAgaW50IGlndF9tYWluKCkNCj4gIHsNCj4gIAlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqaHdlOyBAQCAtMjEyLDYgKzI2MCwxMiBAQA0KPiBpbnQgaWd0X21haW4oKQ0KPiAg
CQkJYnJlYWs7DQo+ICAJCX0NCj4gDQo+ICsJaWd0X3N1YnRlc3QoImRvbnRuZWVkLWFmdGVyLW1t
YXAiKQ0KPiArCQl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkgew0KPiArCQkJdGVzdF9kb250
bmVlZF9hZnRlcl9tbWFwKGZkLCBod2UpOw0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKw0KPiAg
CWlndF9maXh0dXJlKCkgew0KPiAgCQl4ZV9kZXZpY2VfcHV0KGZkKTsNCj4gIAkJZHJtX2Nsb3Nl
X2RyaXZlcihmZCk7DQo+IC0tDQo+IDIuNDMuMA0KDQo=
