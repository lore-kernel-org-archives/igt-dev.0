Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C291DD58CAB
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 03:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE9310E09D;
	Mon, 23 Mar 2026 03:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkDgxSjH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D8110E09D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774236189; x=1805772189;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rcYkdkmK60KJc3exv4/erlocB7e/278xg4an7nGAUrw=;
 b=fkDgxSjHytszd/FgesWeZynB7oTZEGOE6bIbREH9EXJ/Y8JKzhMAPDoD
 pQNJKHeqmdL4eOh5tNxAnx0oksF5j4hmpzZwH7yqwPl9WvJXGhLVHxgDm
 4C4IvvTqsmZRnXxMFzYruwSavo0q4rYVjy5AkK+Q1R1UOHbZoqyd3/4RE
 cWkVfzRkAcLI6FF3OGzvSPog9lQEM7uOEmRu09VcC0XRCHABDHomD4DJJ
 ijqnk4VzesI5S2HeUe2ugIYg5v0d4gQv1FBqhVXkfS/t1QywxKCnlUPHq
 018MkO30gZtL0sBr1taN1cDNbCQtG+wbTyVDxZ3AI87Tr83KT9oovMX73 w==;
X-CSE-ConnectionGUID: VM1AVaZEQp6Keqvl7iOxHA==
X-CSE-MsgGUID: SQQ+P3NkSZe8pVWqyG5zuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85542560"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="85542560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 20:23:08 -0700
X-CSE-ConnectionGUID: cgAEgsS2Tkmd4HT2KoezTw==
X-CSE-MsgGUID: N6xXIzUtQn+NQ86LlwoTPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="219112040"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 20:23:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 20:23:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 20:23:07 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 20:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yg3ht3cwbxUh7waoylb24q2/TYnN2L5wF+F+mPkbVU9t9EMh6A8QDcaYZVt++UkG/MapOCp0N0HN7OqszS0K7Ivc277ns/QW5zw0t2pxwjsgV8lOLAycDfdVcY2cYDC7xvfJnkx1c+oARrxbUpSugmaPgWj3ebh+hLzYczXU0JV2HdLmBT5Q5BS4v0ogfKINm/FsTXp3ZDcFVK3k86y+0eAiG+PRCViqwtcaBNaHRS3XwKncMMPWc2hlmjs+gUqiboAfYAnTF6QtZuUs+5Ahktyq0aFNRoPIhdupsDASsxxUahocP0i5dNYEK2INnQqnScAKBehXFUw7fQvSHkl/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcYkdkmK60KJc3exv4/erlocB7e/278xg4an7nGAUrw=;
 b=aKrJGKCUikL7XKNQrJTciPV1FIGotNPh/0i07zN7dLNMFxVRsEPslz5sNK/APpTpwfiyJqm7Yw99s4ilpJ3FjWBo8NUu0J2eEYb+Iz97f5TavJDVa2SwYpYcdJQju/Lmq9CvpA7aBer6eLxYbO9yPTzIScdjQPSY7JUoNu6N7NRDFtO67xkF45/xiEey7kmNqVPangjiEMBSsnDESRrrVXvEx5IkNpFkdi/93IcFDg5Kl9cJxoEyHG8r8WgkA3rTDZ987JHxews76dL6D6fBCb+zDgbkwhsMAebScAfLfjsZoqNXTOP1x3qRjbSTpLdV8e/T/tBusEyN6XUIKarMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 03:23:03 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 03:23:03 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_rotation_crc: Add vblank wait for
 multiplane rotation synchronization
Thread-Topic: [PATCH i-g-t] tests/kms_rotation_crc: Add vblank wait for
 multiplane rotation synchronization
Thread-Index: AQHcn9PSWSpYKYcXwU6lG3SS64k7vbWLfZOAgDAq91A=
Date: Mon, 23 Mar 2026 03:23:03 +0000
Message-ID: <DM4PR11MB63121EDAF7DCC9694D8A21C9904BA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260217060825.517098-1-jeevan.b@intel.com>
 <ca27ff12-cec1-458e-82c6-311185ff40a6@intel.com>
In-Reply-To: <ca27ff12-cec1-458e-82c6-311185ff40a6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB7633:EE_
x-ms-office365-filtering-correlation-id: 768f8762-e881-4ec2-91c9-08de888b7e57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|7053199007|56012099003;
x-microsoft-antispam-message-info: Afn7cVukVRhVyCnJ4kWBICDkMKwcCT9kqErnHrLhbxpgl0L0XqNQAhYzDtyq2YcsEe9hr+NSvJtEidY6N4vVx+5ZXfmtdzULs0iFFnBNgP+V2NvNOWh3nqKOJg6ptEp4WeOgVPcwA/JgFqRBLIuwyvc3kToYq9C04+QalTxkAVHwIw3K1fEZhKatxItWY8sLx7nEPuzxZingnFHmKYbyT4woMSZZwZkW4NrFI+tkwjH7bz8YBLGrGfllj0fgVv2N8/AL4zXgqv92khKF5Y3bPovKteDw1278euYHuPei4ndgVB12v9iy/RgCNfwZxfE4YJCHCVMZ/SxJfdSLZHAO2K0+DHAviC4YWsbWr+0zZ15ellt0PrgsiZ89KQSv40NjBc1M5Xk1JCoxD3MtTerx1o59DKFDNTE8KZDINnxZdGoKegJjDT3ytS/N6BQSrPx73baREv+jrPbOyi7A/FLH8g3UGEPxZvMxXormmj6gdIWT98//idvejfF9pkYgWnLdroNMfVSSBbRUe7HpahByK0B5S+alXKPx4C55+ygO2zabU+Sy1+TDw6kVBPNwv986Bjfvi/PCe5ZMFqKLLWAr3+bGfbtmBhb8pZMmGlR8aR15ApUfR++UWOWfkFHcUgrNsVYehFsUdDfYnJM3Vc5vgVed9dGqgdYldoJhcXWgbfngnsAfZ28mhxTRE33LiQMc2y7JjRONemHl1hAMivHQGuk7Oa64Rq4JFvsrV//fYWIdv6+KyfDM73pIcT1Eymjt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(7053199007)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjBtSzVobk1MRmV5UlZHK29nRU9SU0ZUczg0dEpuUXRnQ1VKeG9VS2E3TGJw?=
 =?utf-8?B?UGZwRGVPVlkvWXlrNWtUbDFCWE8rQThIYkNJNXIxSkhreERnOE50WGJtbjVD?=
 =?utf-8?B?VFVxTEMzNm1NK0hWMk5tbUtXS3E4QkwwMWt1aFRpQVVIQVZ0K09rcGg3THJ4?=
 =?utf-8?B?WTZnWHRKWFVFb3pTVlBsdHgrdTArbWt4UjRabEp5VkdsamQxcHM5cHMwTVFi?=
 =?utf-8?B?YVgzUU5JVHlnMFV5K1dhcGdwR3V4MVRXR1dyUzlJb3BhVXQrYnRyTGUyT1Y3?=
 =?utf-8?B?cDV6c093YTdlM0lyWHhLZEtONDZBQXUrS3M1VXBZa0dyMWdpdS9JQ0phWHA1?=
 =?utf-8?B?d0g4NzlaWmFiWGg3SnVScUgyemJRWE9OZU9XVlFFTm5mdmM5d211YkVNaWhn?=
 =?utf-8?B?N1Vld1pQbGNuQXFmZUh2dzNGazBKa0lzZFR3UHRDRk1nQUdLZk9SSHgzLzN3?=
 =?utf-8?B?dldjbGcza29rdTNrQW0rVE5BUjF4RFpHUzI2V3F1UGVoSTNrRmEyUHRwMzRW?=
 =?utf-8?B?KzlVaDF2N3V2eDhGcEV5UC91NklRMnpUakdoWGZyMGdMNVNtKzM4dktrSTZi?=
 =?utf-8?B?anM2bHJGMUhmZlRreVUxdVlLNksrU0d6NXI4ZHdFSU5mSVJwM05vTmFpTGNV?=
 =?utf-8?B?akY0M296QS8wbm9PRm1zTkxLbGJNcEJPRzltWG5zRDJsMTJoWVQrUWtDVFJC?=
 =?utf-8?B?eFBQb0pzdkJORENleGpkU0RteDRvdnFwNDZYOVFPN3pkMlR4UGJ2blpvSHIr?=
 =?utf-8?B?SWJzVzZwNUQ0cmFmV2xkRXprUXhTdis0Q2RkVTVPbnJSQzhVeld2ZE42M3JI?=
 =?utf-8?B?aU4wV2RqUnFrWVhxd2s4YkJiQm41SXZmdlhjbHE2cWZ6UzZuU3ZlMzh0N1dW?=
 =?utf-8?B?MnJIMEh4UitQb0srSndUc01tM1NNei96endPbjNCenkwNkdkUWpQaUdRS3lq?=
 =?utf-8?B?c2V6OElxWVlDQnVXREJuVEZ1c1VtaEsrMlVNZXFJNk5TWDJEdVlBOFdtVytw?=
 =?utf-8?B?d0JJUVo1S1AzWVFBaThqL0lIM3l2ZEJjb0hMUWV0V0VTaE82WG4rSFoyS1gy?=
 =?utf-8?B?ZHFucWNHL2ZPY043WGQvSGg4UHowYW5HMzIzTTR0dWNJMmF2eVpYQ1ROR3Vn?=
 =?utf-8?B?aXR5UkY5SUp2b1RvSzFvejkzcjM2d3hLV2M1aUlUcnhDSnVWTXl5dm1oV1Bw?=
 =?utf-8?B?cXZSTzRXeG01LzVGalpXak5pTjVhT3Qzc00wVFdpMzBPOFEvSFYxcEdQT2Q2?=
 =?utf-8?B?QWVISmcwVFc4c2o1eUdIREdILzZPeVhLTzI2TnhuUVU0TEp2aStKSnhUYVFz?=
 =?utf-8?B?bmNPVVJFM3pUU0t2SjF5MklxWmkvMjZEanlodG9hTXpHeURuRVVJR0tkdWI1?=
 =?utf-8?B?WGJ0QnFkd2ZUQnFFNjZWajRSdkxUbDhucE1PK3N4THFMcmVqbkgzNG1QVkFy?=
 =?utf-8?B?cnI1b2dHRVFvQmc0czljTzFQelhUR0c1dll1M2xIR1VWS0tIbm00cHdEZkND?=
 =?utf-8?B?dEFVTVdMWUlIN1pSNFlCZmRSVzZvUi80Rkl5eEZjbDlXck04ZG5EQVlnMUVP?=
 =?utf-8?B?VnhISFFtRktYZ2V2RGxOU1dHYkx2aXZwejU0YWYzcmtJYjJhdXJqTXJrQk8v?=
 =?utf-8?B?ZkttZlF3TE1LcVRUOXgySEh2RGhSRGx0STJyTkV4V0Q3dm1DOHdIMVRTSjJ4?=
 =?utf-8?B?MFR6NElBNUJBeFB3aUx1Q3MxSUxqUUI5L2QyV1NnRVl3SE9KRDdQYkg0MjNa?=
 =?utf-8?B?dDlMMWVubFFjRUlyVms2Y3gzWTV4T0U3aG1naWJRUUI2REpDZ2ZaNTI1a1VW?=
 =?utf-8?B?azBSUUZqd0U2ejZLWXNrQTA3cWFHNnVvc0QyN0NqY255MGlOajY4aE9JcnNZ?=
 =?utf-8?B?TUlmYkhDY1VFUVZUdTFEYlVhVVBTTDJGVW1MNVBoeitlUnVsYTVOYWJlRmRD?=
 =?utf-8?B?ZGc4bk5sTzVDdVhRWkUxaElrSC9nTkFidlNWMnE3c3dPZTdLL0pvSitud2dx?=
 =?utf-8?B?VWx3ZmhxWmxxNjBNTFFKckFSSnFHbEg2a3ljY3h2N1BEZzdtRzJzUFVDRnVQ?=
 =?utf-8?B?REhma1o3dTZ5Zk1Ud1JnOHdiVXEwNlJ3MWE4T0pCcVptdWVDUW1yOWNjTE9T?=
 =?utf-8?B?eC9aNVVNRmpuMSt4UXlKVUo0bS91VUQ5Nlc0MmRoSVhvZU15Y1UxaVdvdCs5?=
 =?utf-8?B?YUJrSlBFSG1ZVC9DTi9jRldJR3I5eEl1RldDSnQraFhwUGlRR0pTWTA5L0Vl?=
 =?utf-8?B?S0M5dFEyaVg1RzZDUGZWeFVMN01iODVPTHFLNVFkeE9qM2xqUE5WYWE4RHdz?=
 =?utf-8?Q?YmhSJpDSE0+MzPYqoa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hs5STNGTmZAr+fdik4b9C+ObUWZ51ik9D0DFNCFy5Z1StyUgjIKJ29bhra5Y4MyT13sUNs6Rw3cWkZFYB0YgnqYjtnWL/rVG9B7P84UmRotCNbj+Vka3jNEbOVwV7KiWViGSOmY+br4aGTj8hqNxQzKUV/IOo1GesC8bAW7W7WOtuSWjkPg6laJeMv0SZpWJofwILucKaqzA7wuZ50g/zTSOFePhYZBqzvz7j4a9u/59XF3GbK33OQQ4XR0f84azdX+LWMqQLKOoFt14u/1YRu0opqEguOfQ/0WENnF7SBe3+f040CYYH0jOYKvehKYUiEwRSoTEy8Epb7BV4kT2ZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768f8762-e881-4ec2-91c9-08de888b7e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 03:23:03.4642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFQ8K13Y/tzj8GD2GsmhRNAAFsgb+n2PlJkMgulSMRgE3yOEG6WJkP7KKxiaIhdPDksy0aXXeyeyxYLOtwbCtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGFybWEsIFN3YXRpMiA8c3dh
dGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjAsIDIwMjYg
NToxNyBQTQ0KPiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+OyBpZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRl
bC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ttc19yb3RhdGlvbl9j
cmM6IEFkZCB2Ymxhbmsgd2FpdCBmb3INCj4gbXVsdGlwbGFuZSByb3RhdGlvbiBzeW5jaHJvbml6
YXRpb24NCj4gDQo+IEhpIEplZXZhbg0KPiANCj4gSSBzZWUgdGVzdCBwYXNzaW5nIHdpdGggYW5k
IHcvbyB5b3VyIHBhdGNoIGh0dHBzOi8vaW50ZWwtZ2Z4LQ0KPiBjaS4wMS5vcmcvdHJlZS9pbnRl
bC14ZS9JR1RQV18xNDU2Mi9zaGFyZHMtYWxsLmh0bWw/dGVzdGZpbHRlcj1tdWx0aXBsYW5lLQ0K
PiByb3RhdGlvbg0KPiANCg0KVGhpcyBpc3N1ZSBpcyBub3Qgc2VlbiBjb25zaXN0ZW50bHkuDQoN
Cj4gT24gMTctMDItMjAyNiAxMTozOCBhbSwgSmVldmFuIEIgd3JvdGU6DQo+ID4gQWRkIGV4cGxp
Y2l0IHZibGFuayB3YWl0IGFmdGVyIGF0b21pYyBjb21taXQgaW4NCj4gPiB0ZXN0X211bHRpX3Bs
YW5lX3JvdGF0aW9uKCkgdG8gZW5zdXJlIGJvdGggcGxhbmVzIGFyZSBmdWxseQ0KPiA+IHN5bmNo
cm9uaXplZCBiZWZvcmUgQ1JDIGNhcHR1cmUuIFRoaXMgZml4ZXMgc3BvcmFkaWMgQ1JDIG1pc21h
dGNoZXMNCj4gb2JzZXJ2ZWQgb24gQ0kuDQo+ID4NCj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsL2lzc3Vlcy82OTQ2DQo+ID4gU2lnbmVkLW9m
Zi1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRlc3Rz
L2ttc19yb3RhdGlvbl9jcmMuYyB8IDEgKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jIGIv
dGVzdHMva21zX3JvdGF0aW9uX2NyYy5jIGluZGV4DQo+ID4gODcyMWE4MzExLi45M2U1YzNlOTEg
MTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jDQo+ID4gKysrIGIvdGVz
dHMva21zX3JvdGF0aW9uX2NyYy5jDQo+ID4gQEAgLTEwMzIsNiArMTAzMiw3IEBAIHN0YXRpYyB2
b2lkIHRlc3RfbXVsdGlfcGxhbmVfcm90YXRpb24oZGF0YV90DQo+ICpkYXRhLCBlbnVtIHBpcGUg
cGlwZSkNCj4gPiAgIAkJCQkJCQljb250aW51ZTsNCj4gPg0KPiA+DQo+IAlpZ3RfZGlzcGxheV9j
b21taXRfYXRvbWljKGRpc3BsYXksDQo+ID4gRFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQs
IE5VTEwpOw0KPiA+ICsJCQkJCQlpZ3Rfd2FpdF9mb3JfdmJsYW5rKGNydGMpOw0KPiA+ICAgCQkJ
CQkJZmxpcGh3ID0NCj4ga21zdGVzdF9nZXRfdmJsYW5rKGRhdGEtPmdmeF9mZCwNCj4gPg0KPiBj
cnRjLT5waXBlLA0KPiA+ICAgCQkJCQkJCQkJICAgIDApICsNCj4gMTsNCg==
