Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B10CC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 10:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA8410E240;
	Mon, 19 Aug 2024 10:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixL3vIeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269F10E240
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724062373; x=1755598373;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9F1gys9clGR8J/VlQH5TipkULo1Kyffr++xYMEiGif0=;
 b=ixL3vIeETc9G1Vf2xKMIhZ4FTPL2CtBF5nc57V7hcrvW6KY1d8i+twuV
 8yyU0HYLmJBQzMP3l1QSWSHN3YcCYRYHN6xI6/wIG6JEdqvBNDVnrunk+
 S9xCLPna3h7BQbU27PXuM6sAybI7N2ga2x+uUcEVSoKDtOK/tRF2Wu9Bp
 QnMD8IpVow3IYd9TrBe3QLtIfB93TLSR6f9JL39Xdb3/408/LA1h4ceHp
 x5s7aw7Tqgr9X6IH5PEARVOm9ke2BzoX7Srq8xvSxvl1urNfMaHiCQYvi
 3/+M56eiNF2pQjggdJPqU8LjMY6CB2FlNNPyaTVr+DSv2NGmLzAcANcFq w==;
X-CSE-ConnectionGUID: qcBy9qm8SgCXc2RuUzjlfg==
X-CSE-MsgGUID: a4cjE8bdQfWqngf0987HGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13089918"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="13089918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:12:53 -0700
X-CSE-ConnectionGUID: x549xoHQTkiTyCkRmwj4KA==
X-CSE-MsgGUID: vZdKpxY2StSaPigqp6fVfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60626994"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 03:12:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 03:12:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 03:12:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 03:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuS80w8OI2pvG1THeTN1cksbAfC55W7BGtXKlw3QG3ZVdrqRNwzFHjKFtniZ3Pcrev8NclwRwfnQzl3uM/YaL8DRv0N04bou9481jp1+v/xwBg9bnQJtL7hTeQQk4Zr0LbJJ6fdaf5C0vJ2B2aTahcJBNk6vBgA+m+NLOZbYgbuTV/39goGBzPTxMehBjosbdfN4/3ySO/PcsXRN4lpcGfBXMMllp9uWuipTuZJdIApizm5HW/JOud3Gl1XDU/AgKedsDwTUFewnr+t2xKSeHYJNAx8OGuSdiecGSEBUTNkYGJecfcNS9yNH29xF/7EOTSmv/rZZFpzqBzgjO9K2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F1gys9clGR8J/VlQH5TipkULo1Kyffr++xYMEiGif0=;
 b=UNe3YJ4rLOcTJa6LOIRNCcf2f2uOq5qckefNkxWS/XRvHJnFmh8ZxoCDJXdGA5m6Aqkz0LOsKhFxUCUah4fFAaBGCStWNFcry39J/mqROl7tdbhHoX+TyyHD2COo9vXhKgouPJ+63k1aiOSy+gkIVi4ZSU7QjkdJ/LTQ8QkSCJbn+tT1KyD0pswY/by4E7A9XPiE9oe9dnsj6sdo6nsAoVj8q3XMulPdwqDjdJb3UBpkMUIrhzFimigxZEEs87VVNYH55SuRowOSB2TI9MMt0s0u70levooUZtu8eU592rI+TcGArfX8iOvjcWonRbFu0lhzAt3kmmWJr967Yr5/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 10:12:50 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 10:12:50 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v3 10/14] lib/gpgpu_shader: Allow enabling illegal
 opcode exceptions in shader
Thread-Topic: [PATCH i-g-t v3 10/14] lib/gpgpu_shader: Allow enabling illegal
 opcode exceptions in shader
Thread-Index: AQHa6lk4zw41RvL0mUakmdePKoXvYLIua/2A
Date: Mon, 19 Aug 2024 10:12:50 +0000
Message-ID: <17d50d8b033a350648c39fe34c23b0807d38a7df.camel@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-11-christoph.manszewski@intel.com>
In-Reply-To: <20240809123813.109365-11-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|IA1PR11MB6515:EE_
x-ms-office365-filtering-correlation-id: 35ab9d05-30ef-42d7-db8b-08dcc0377b35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ajVXUHZqNFU5L1d3SmVHOU41OXAvK0JranpzTVhRWk9LWGJZcjQ1cVlBZ1Uy?=
 =?utf-8?B?NUE4VllDeG9nbEpJdVJmM1dGN04wSUFsOTFSb2tvMk5MZ3dSN2VERVZvSUVI?=
 =?utf-8?B?d0RZSm80akFIQTZ4ZktqNERaSHlaNS9wTGQwMExwQ3F2SThGYk5nMmorM2ZT?=
 =?utf-8?B?TmxxWWhUM29KSkwxSXhkWFN6UjJhR1VVVnYxL256Vi9SWGdBVktlckpBak1C?=
 =?utf-8?B?djRHRHFYZjRReVR5WklvbjdqNUl1UHhPUGlpODdRbXcrdVlrL1BTeklTd1NM?=
 =?utf-8?B?ZlZCbHBwTzl5MEdsR2h6aDlLSWZYektxS3RLajB1VUNsZkI1enV0ZTZ0TjAr?=
 =?utf-8?B?akdoUzhZencyUklaMFdGYUpidVFqK0JoR1NjcmNXN3BKSlcrYjlveU9ma1Y2?=
 =?utf-8?B?OGZKNFVEZWEyTitUVXBBSEcxdnZJOHZPSURBY1M2bnVhb3pGYmVrUFA3UnBS?=
 =?utf-8?B?aDRYM3A0ZE1lOE9ETUNaMmtiYlYwYW5RL3oweUtsVkR0ZXl6aEdqVjJkbXVE?=
 =?utf-8?B?VWNjRnhvTk9ZNXVKSm5VUVVramNCU0xJNmhaaTVhR1MvWDR4L0l3bFZLa3RI?=
 =?utf-8?B?UW83dEp5alE2MnZhVTNBSWNISEZRVjl6OHJRZ2FWNnpjdm5zNWpNY2JraUh1?=
 =?utf-8?B?eFMyZ09CTlk1UWc1RDdEMm9vSEl4U2h3c1J6N1V1ZDlpN3lJNkF2ck0wVFkr?=
 =?utf-8?B?b2xralFuUFJTdWxnVmFwNmFQNDB2Q1ZMb2ZJNzdNdE1DSFU4L3I2WWJodXQ2?=
 =?utf-8?B?NTNZQ0ljVEZaMUNKRm9kenRBRkhqUVFXZ1dINFNzeHF6eVE5L1lpeHVzeGZo?=
 =?utf-8?B?STFmV1gySStUWk83SDczcHYvc1k4WVVCMGcycVJnUVpkelBoWmZGL1VwVGtk?=
 =?utf-8?B?bExFYmE5Zk15SHJJako3YXVnamlmZHAyWmVWTmxRODJSTDNabkcxa2xQdi82?=
 =?utf-8?B?RHYxbUtLandQZ3JYdGEzck44OUtPOTFsbzBOTlFRVWVpVmUwUWlVclBjZ08r?=
 =?utf-8?B?MkZGbm5JVGdIRFFxWStmWFBJd3lTSTQweHprelRqVGtiRTVKUk5hay82RTgz?=
 =?utf-8?B?SktGUmxBRTZCZTNNd2RVcy84WmsvUTJUK2ErTE9yL3FGK045Z1g1NHRqYkdr?=
 =?utf-8?B?SFRSMDBtMll6VUw4OFBqT0NMWmtuVVliRFI1SEVNYkFzU09tQkRBMUR2WnVh?=
 =?utf-8?B?eFRNMFVSTHVBWGpJeGx4ZFRtNndGOWJTUnpOaTNuTXdNdjcxVU1kdW44S3pn?=
 =?utf-8?B?V2gySEl5MVJWRXpTTnpDUEJUZmo3dzFnTUw2V05KN1JHUnk0WC9MY3RsNUZX?=
 =?utf-8?B?R1BZWUNLVEhacnVUM0V6Ums1d01rYXVhU3g5aVQxbTFRQzM1S2pOUzBvY3Ft?=
 =?utf-8?B?SVZuc2E4TTdXV3h0YXFRNldwZ1dYRjNOS2h0MGQ2NUI0UHVKNitodW40OW16?=
 =?utf-8?B?U0x1TzFoT2xYK3RCUWs2RzV0MEtuamVHOHVLMGx3Yzkyd1hWOEhnZXE1L3Yx?=
 =?utf-8?B?K29hTG9XSnRFcDNJcVErY2lWSVExa1pJc3o2SVNzUnRQVk96Q1MzaEVkV1By?=
 =?utf-8?B?T2RReWVRZ1o2d2UwTFZmSUhBRjZoMDcxTEtsY3ZLWWJGUVR4aElDbEFweU1s?=
 =?utf-8?B?a3NzSnFPQXllZlFrSU1hK3BubG80NGtqeU4ybTBsWkVmUk5tcG54SWFyLzhl?=
 =?utf-8?B?b3A5d1FBMWdmRFhNaVRhSnJXS1FBQnpiR0w3WU4zTnFpVktvbHJucndiakNU?=
 =?utf-8?B?MUx5TEIyaHpEeFF4b0s5SnRvWHFpZXNNN3dxT1dZQkhYZ2FnSmR2OHdlY0VM?=
 =?utf-8?B?MmlYUUxXdHBaTmZCT3Y4QTNPd3JaVzFjeXVpYm5YU21uYlBUMmwvZjZnc0RZ?=
 =?utf-8?B?ZmNwOU1zUW9uVXlTUDljMGJyNUJkVUU2RTB3cUY4S0pJSkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MC9YSU9WUzFiZVlJTE1YYXV4d0tTSGhCcXpDbnVTV1drRnVQeDdGWWN5blpq?=
 =?utf-8?B?NEV6QU93bkpTRVdCSFdURW5LVGh0aGJoS2Uwa0pmR251dHgwT0ZrTWhjZnZx?=
 =?utf-8?B?RzBYeE5lamNOTWF0OEoxUFE1YnFteUF0Q01DSUVpdmNKS2NiR29uTkVJeE5h?=
 =?utf-8?B?NjNIcnVSNXJXUHBEMWE4TXNrWGpLbHp2R1FST01BSFBIU240MzZ4bU1OS1Uv?=
 =?utf-8?B?YjVWb1R6R3Mrb2NDMXZkamtlQXlBM1VwUG9GTmhFUEZVTzNRbkhmVXBZNzNR?=
 =?utf-8?B?SlJ3bkpIMHFTVjNXdkM0alRkZ0g0ZEhLSjNibFU3OEU3RFhNNlhRQ0NQdGZo?=
 =?utf-8?B?UTdCR040WkpkUWVaaUNQL05OSlA4di80K3dTWEJIV2pxS3JTREpCYlY0Znc1?=
 =?utf-8?B?RWczckNVZnpyS3o3QzRxMXYxd0RsQVhCSWU5di81NDNaZE8wZVdNR2t0RGJM?=
 =?utf-8?B?ekwxTnBDbXVBMVdQYUtCMVJrZG02Z0trYUJvbUFJcG5WQ1I0QmdzUUpzbVZN?=
 =?utf-8?B?YnFtNWVta29OM0UzdzdLNklFUjl2SEVoUERaWUxhM1ZhSW1haGNWRHp4NkZO?=
 =?utf-8?B?Z1RoV01wQWpDRmo5dU52ZU5mMlBneWY3ekJlR2lER1kwUHl5OTBhYzNKYTJq?=
 =?utf-8?B?a2NkdkhoanJzT3FObHVRd0hrSGlDZUVlOWpqVFNwU0trc0ZOR1dSa0lvQWFl?=
 =?utf-8?B?TVYwZWhXa3EwL1JpZmlkQ3MyVEh6SlRUV1o2aDkyQWxRS3phMk1SYnBrNUxn?=
 =?utf-8?B?a0Zxdk15S3VDMnVWb09XRVg3ZUVDNUoybFU0V1MyeEhtMzRWTVhrYmR1b2Rv?=
 =?utf-8?B?SDM2ZGxNcUZEY0hrVlVVbk5hVGlrbXU4VFhlbEp1VHRkT2txUm5GaS91NzhE?=
 =?utf-8?B?TzNaZHlSVG5kYTc5Ym1zcGM3QXRHcVRMSFdaanF4ekRJN0NHVkJySWY2Q2FQ?=
 =?utf-8?B?dkxsMHdVQyszOXV3T3R5MGdRQ3pnMEtqci9hNXZtRkVSbE1pN1RCK1haU0Z4?=
 =?utf-8?B?bFJNTjZtdjFqcmpIMDJZY1BIK2UzWG9GWTVnNytmUnhQMTMyRXJXL3AvWjhw?=
 =?utf-8?B?UmpvNW9LWFpxVEJlZnJPNnNYYkw0aHpzb2VRb3E3T0F3WFp1azFZcytNbUg2?=
 =?utf-8?B?WEJ2Z3dzS1p2elFDOE12MFBvaFV6OFV1UzlsNUt0M0RWeUxBa1o0WkxrcEFo?=
 =?utf-8?B?NmJsc0thVGRjeGN5Zm5RMU96ZE9wOEI3Y3g4TTVMYmNtUmdoVzRDNlFSZENR?=
 =?utf-8?B?TlVwRm5VblJ5YkhoaXY3MjkzRUpIY2Q2K2xBOFlOWUV3Wi9PalFJRnVUV01L?=
 =?utf-8?B?YnNPMHRhV2VNcVUzWDh4OVBJcjhXNm9XUlM2V0ZkUkszTGFOVFIwTjZaMktT?=
 =?utf-8?B?Mms2NXF5a2V3V1YxUDNlMXJJNUduNWthQ3c1UndZcjc4ZXdhaEJ4bFJobDg5?=
 =?utf-8?B?T0J0eXBlQ0VmRjMrQ2twRFBEVGhXYktMVUo3NlpicEFCNUMwTEw3YUgyR25r?=
 =?utf-8?B?QWROME1PN1laOFZUbEk4R05ZbFNLa3UzYmFOUXNvNTlnaWR2MEN4Q2hiNWxH?=
 =?utf-8?B?Z0ErYWUzdW5ack1Yc2x5RDczYzEyWWpBVWNLUzB6MW9ON1kvUFpmMlpUV3Rr?=
 =?utf-8?B?eUhvTkY3RmE3ZDJOQk5uOGdrZVcwaDhQRElLM3JnN2czeHV5STJuOTEwa0Nv?=
 =?utf-8?B?alRrcXRteERGQW5QQkFnTzhwNkZQRDNtdEpjZzdZbUNtVXlaanZVNkxaUUdr?=
 =?utf-8?B?WTFiVzRrVStXOHdTZmhNb3oyQk5hV3BiNkRGdWRsQ1FvV2RFcXEyV1N3TGJj?=
 =?utf-8?B?QW8rVmtLZUhhenplY3ErWGp3NkZKZnk3KzlMYy9ZT290eG9XTk1abkVPRXc0?=
 =?utf-8?B?UHhNblBweTkzR2RWbERVVnVkSlpSaHk4WVhHaGpCcVZWa3hkYkJwd0xkaUZ1?=
 =?utf-8?B?SFo4eG5xTjEzMk1YQ3FqalV2Ni9ET2taRXFQZmJubThTVDNnNm1ZeG9pZzdQ?=
 =?utf-8?B?Q3ZqT0pNdGwrekdrQXhGSXJFaEx6NDNIdnlRZUpPcmh5NFBMMElDbm1WTzRv?=
 =?utf-8?B?bis0SmpDaU9Xa3RaK1lwTVV4VVdaYVFlcGlOb09UbGlIR3R4NlR5Um1iQUEz?=
 =?utf-8?B?SVdodTh6NzhIL0FySFlOS3JQK0YrVHQvQUZBK2Q1R0l3T2FSNUFHaEpiR3l4?=
 =?utf-8?Q?ZqjzhPP4VUs4KIliTuTvN5k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01B6CA4E5528634BA707D0AAE03EF747@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ab9d05-30ef-42d7-db8b-08dcc0377b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 10:12:50.2078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtSJR21XFRVnCS599ECZ6aK/pJEJBoFbHDF+9vKerFTWdTP0reCB/nEXxpoY+ZKj/lxEQ1Q+V5eyqMgu5FU2g2f3D/JL49VVOEZRu910VeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
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

T24gRnJpLCAyMDI0LTA4LTA5IGF0IDE0OjM4ICswMjAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gRnJvbTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQo+
IA0KPiBJbGxlZ2FsIG9wY29kZSBleGNlcHRpb25zIGNhbiBiZSBlbmFibGVkIGluIGludGVyZmFj
ZSBkZXNjcmlwdG9yIGRhdGENCj4gcGFzc2VkIHRvIENPTVBVVEVfV0FMS0VSIGluc3RydWN0aW9u
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRl
bC5jb20+DQo+IENjOiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGludGVsLmNvbT4NCj4g
Q2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE1hbnN6ZXdza2kgPGNocmlzdG9waC5tYW5zemV3c2tp
QGludGVsLmNvbT4NCg0KTG9va3MgZ29vZCB0byBtZToNCg0KUmV2aWV3ZWQtYnk6IERvbWluaWsg
R3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIv
Z3BncHVfc2hhZGVyLmMgfCA0ICsrKysNCj4gIGxpYi9ncGdwdV9zaGFkZXIuaCB8IDEgKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIv
Z3BncHVfc2hhZGVyLmMgYi9saWIvZ3BncHVfc2hhZGVyLmMNCj4gaW5kZXggNDAxNjFjNTJiLi5l
NTNjNjE1NTMgMTAwNjQ0DQo+IC0tLSBhL2xpYi9ncGdwdV9zaGFkZXIuYw0KPiArKysgYi9saWIv
Z3BncHVfc2hhZGVyLmMNCj4gQEAgLTEwMyw2ICsxMDMsNyBAQCBfX3hlbHBfZ3BncHVfZXhlY2Z1
bmMoc3RydWN0IGludGVsX2JiICppYmIsDQo+ICAJCSAgICAgIHN0cnVjdCBncGdwdV9zaGFkZXIg
KnNpcCwNCj4gIAkJICAgICAgdWludDY0X3QgcmluZywgYm9vbCBleHBsaWNpdF9lbmdpbmUpDQo+
ICB7DQo+ICsJc3RydWN0IGdlbjhfaW50ZXJmYWNlX2Rlc2NyaXB0b3JfZGF0YSAqaWRkOw0KPiAg
CXVpbnQzMl90IGludGVyZmFjZV9kZXNjcmlwdG9yLCBzaXBfb2Zmc2V0Ow0KPiAgCXVpbnQ2NF90
IGVuZ2luZTsNCj4gIA0KPiBAQCAtMTEzLDYgKzExNCw4IEBAIF9feGVscF9ncGdwdV9leGVjZnVu
YyhzdHJ1Y3QgaW50ZWxfYmIgKmliYiwNCj4gIAlpbnRlcmZhY2VfZGVzY3JpcHRvciA9IGdlbjhf
ZmlsbF9pbnRlcmZhY2VfZGVzY3JpcHRvcihpYmIsIHRhcmdldCwNCj4gIAkJCQkJCQkgICAgICBz
aGRyLT5pbnN0ciwNCj4gIAkJCQkJCQkgICAgICA0ICogc2hkci0+c2l6ZSk7DQo+ICsJaWRkID0g
aW50ZWxfYmJfcHRyX2dldChpYmIsIGludGVyZmFjZV9kZXNjcmlwdG9yKTsNCj4gKwlpZGQtPmRl
c2MyLmlsbGVnYWxfb3Bjb2RlX2V4Y2VwdGlvbl9lbmFibGUgPSBzaGRyLT5pbGxlZ2FsX29wY29k
ZV9leGNlcHRpb25fZW5hYmxlOw0KPiAgDQo+ICAJaWYgKHNpcCAmJiBzaXAtPnNpemUpDQo+ICAJ
CXNpcF9vZmZzZXQgPSBmaWxsX3NpcChpYmIsIHNpcC0+aW5zdHIsIDQgKiBzaXAtPnNpemUpOw0K
PiBAQCAtMTYzLDYgKzE2Niw3IEBAIF9feGVocF9ncGdwdV9leGVjZnVuYyhzdHJ1Y3QgaW50ZWxf
YmIgKmliYiwNCj4gIA0KPiAgCXhlaHBfZmlsbF9pbnRlcmZhY2VfZGVzY3JpcHRvcihpYmIsIHRh
cmdldCwgc2hkci0+aW5zdHIsDQo+ICAJCQkJICAgICAgIDQgKiBzaGRyLT5zaXplLCAmaWRkKTsN
Cj4gKwlpZGQuZGVzYzIuaWxsZWdhbF9vcGNvZGVfZXhjZXB0aW9uX2VuYWJsZSA9IHNoZHItPmls
bGVnYWxfb3Bjb2RlX2V4Y2VwdGlvbl9lbmFibGU7DQo+ICANCj4gIAlpZiAoc2lwICYmIHNpcC0+
c2l6ZSkNCj4gIAkJc2lwX29mZnNldCA9IGZpbGxfc2lwKGliYiwgc2lwLT5pbnN0ciwgNCAqIHNp
cC0+c2l6ZSk7DQo+IGRpZmYgLS1naXQgYS9saWIvZ3BncHVfc2hhZGVyLmggYi9saWIvZ3BncHVf
c2hhZGVyLmgNCj4gaW5kZXggMGJiZWFlNjZmLi4yNmExMTdhMGIgMTAwNjQ0DQo+IC0tLSBhL2xp
Yi9ncGdwdV9zaGFkZXIuaA0KPiArKysgYi9saWIvZ3BncHVfc2hhZGVyLmgNCj4gQEAgLTIyLDYg
KzIyLDcgQEAgc3RydWN0IGdwZ3B1X3NoYWRlciB7DQo+ICAJCXVpbnQzMl90ICgqaW5zdHIpWzRd
Ow0KPiAgCX07DQo+ICAJc3RydWN0IGlndF9tYXAgKmxhYmVsczsNCj4gKwlib29sIGlsbGVnYWxf
b3Bjb2RlX2V4Y2VwdGlvbl9lbmFibGU7DQo+ICB9Ow0KPiAgDQo+ICBzdHJ1Y3QgaWdhNjRfdGVt
cGxhdGUgew0KDQo=
