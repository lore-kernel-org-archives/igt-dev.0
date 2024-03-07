Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB376C48BF6
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 11:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185B110E0D2;
	Thu,  7 Mar 2024 11:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBf4gWnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AFA10E0D2
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709812768; x=1741348768;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A2Kj8Xi4Px8ifI8SSiGPo8wQ2Q6tv651VvXutBjp8RM=;
 b=VBf4gWnLNQupfx/BpqT9urwhVPFq02SFOshW6Vq0+Qx0qnuuEI97+IOs
 /RPcMOeuvGh+ySQ3Q2aT9l44H18ZCtq0UogiSvJIrSJIPeM2JL4YA//O2
 VkJxStUnAugrUNUXPpXTKK9XIt7GmS+j/StFX4O2sXc13D1+S0mGwKoW4
 dWCpHejcaEJZeoZl1lPw9MKgKoi7twKJGNc+j6V4+IfuVv7OqYBrVYvdp
 ZD6VUurSxF/qRZJOmv5rDHjbO1G94uBZf01cEVP1ufjATZSql12PsfyMG
 ZVP/6Un7qWALRG3bLZ8FlvaqPwu/gB+96b4f8H5ov3QNOF3Z4KbQpZTi7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4646521"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4646521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 03:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="40979925"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 03:59:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 03:59:23 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 03:59:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 03:59:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 03:59:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUPUQvnVLoJ5+1EjtV2F4hkMymDc94HE40mTAHH7p1e+rel7duLJ0BzYs0EIUkilP48/O1pGQgunjwR4bSjgwGwOFPCQuYe4eWV44SeYY8zYCuWcg1mFAsP20nkVk1GlW/tCpq9Eo7mpQHfBrNcuiGARLMG9Bn6qg66nqln4ToSwGODDskpTMa8y/LYRnxXw8ATZKAWveZLSDBMP0iuofnjSxk5CD842Ygac5a8xqwbc8SC55fzcJLzpNLsudWoiLGBAGl+jPy3b5RnhR2nNv0j6fdNwQsPgETR+IIeqk71/N2/peW9Kd+vM9qkkTkzcp8xRub/bb+E7aaonL1Nwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2Kj8Xi4Px8ifI8SSiGPo8wQ2Q6tv651VvXutBjp8RM=;
 b=dZJLABnz3CNqUnZIfxAvWyL5vPm/RXGispm78N12Ipz2gJB/3jCj2x5zPffRp3T512WdiS1YTL0DU2IVuIYrm/GKiAuC+BBvYbIo8aToaxoCxe+NE0dkpGfD70Kq6Km+ZSz/iiA9IG4wmhmfpYEGAoAWOvrV1MHErS/TRL4bgs47cECXYt3o6XPpf8JTtGcyePcgtKgVNIsUnaQnMEAeygzUrsLNhiuE5ABaDaweJtwSfD6haGASJGXz5rly7LKXtTaAR4Q14etGurGPE+jMVH3j3iL1pr/GiKjXgig7r01bEAYCZq7DROQqNK+JXpLbTk8mmzB01GmBVG9dBMP0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Thu, 7 Mar
 2024 11:59:19 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 11:59:19 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 13/24] tests/intel: Introduce Render copy subcategory
Thread-Topic: [PATCH i-g-t 13/24] tests/intel: Introduce Render copy
 subcategory
Thread-Index: AQHabiW8dww8W8Lbu0WqWJ8NfLZs5rEnsiOAgAR/QFA=
Date: Thu, 7 Mar 2024 11:59:19 +0000
Message-ID: <IA1PR11MB60971B46902F84FFDCDA697F86202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-14-katarzyna.piecielska@intel.com>
 <20240304161831.29223674@maurocar-mobl2>
In-Reply-To: <20240304161831.29223674@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CH3PR11MB8413:EE_
x-ms-office365-filtering-correlation-id: 40231b40-8bda-4934-a7a0-08dc3e9e0559
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hyEgFo7wkB36/Ix24ea2N8hPePhhWnlNyIdVYnr5bQN0p44tD1ltd4jrK9/PAdyLrhaxVNwpvnJCngsDN96niHpEKAQVQBxKvgRcqtOtH4Xne/ScXNrXqrWVL9C7N0O9f+z/Zq9oj9WSBvFa4C1Q9KzTXnnv+uFb9T+VJuaZbsuhmwHcXuKajmd68i3QqLIvK4dvY22c7IRUeqPUqbxIAcbwsjtf6T8fHmo9Rubr7eMvaHTA28lkte6sSdGYGRAYjckhy+j4omyWNCMhtnxpr3kLY/+vpgU2QT/BRLA5HWI6sPaeH1wKLpc4Wcbiv3cXjf9gtsMAhjjL3WiF5jYB+g5DBRm1zmcM6Uigy0EI8giiNiXxthlQ/JtTlW0qOUuQpoyi6wO3ZzxsDmWQhxNBoJBIvvL5GB1Hzz8EBMjC35u1D/xLCp7Y9I2YbQrCt1xucu2aT1DKg94rlylypU2J3WfdW+UoZFiyOBgwIll78r4M71onBYCKTFVZh7bVFBSbkcBv5W2/o54iiOXXjUJSTEQ1WL6oTZP0EivJeJAG67TVnyo5e+KUNL12oIQ/rDqoVPO2J5uBk4usdIrMGcx5MtZC2nc+o+TFVpLIE6Loos9Aei8+xqpFcuOSAaZdOxJXrTjMPAoWwtTdAgwhm6K5JvocHfpvlujiQawcqWMgeQM1dCPmH8NdPtfhaVHdVuFcIBPi+r/N1hEDKQZDO9UQeESKtjD0nUug5ToLjxlczq0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmpsbWh6d3kxRUQzOWo2bjFpcnh5Z0ZrMGVFMEpxK05EaEJJMm9IZUxZaFhQ?=
 =?utf-8?B?aEFMekp6V3U3eGZmaWZNOTV6MFlWQS85VUE1SENjem9EQ2ZmWTlyalk1NHdr?=
 =?utf-8?B?czN2Q1dkU0hzTVlpQXQ5bHArZGFpMGd6QjdURTJPbEdRd0lCQ09QbjlnZFhK?=
 =?utf-8?B?THJuSVVHNlU5VUdINm1yUWE0Q1lWZU8zQlNPTkFrbFpvZE5obEVoR1AvT1BY?=
 =?utf-8?B?eTJ6d1hkMzhTSEtIRzArU1A2Yk5CU0RvNDRwUTFScDVmRmNQK01ZcXEvU2t3?=
 =?utf-8?B?cm1kL09HeEQxbGUwR2NTSHV1WitEYTVzbzg4VTd4cFBOZjRyb0NXeU93dWpk?=
 =?utf-8?B?SWJLclVoMWxZMTNNNFVPODJOOTY3WUhOUjdpcmtFRnA2WnhLdTJTSXlTellu?=
 =?utf-8?B?RHhHTVZBaHVaUjUzWndkV2gxVGhDZ2c2Wmd1Y0g3L2RuamdLSVFLVWY3eTlj?=
 =?utf-8?B?U1k5VCtucHNxS1llYzI2WlNKTUN2NkpRTUNiOTI5QnhlalkzQ0J2azNmMjdV?=
 =?utf-8?B?ZlZJcDJBYVphUU9GL1Q1ZWdhWTFPNHlHejk4UDErVWNhSmN6VjF6bmN3cWlH?=
 =?utf-8?B?cDVVMzdMMy85Ymdxdi9GWlZhbzUwUS9hNnRIMWlYZTBIUnA2emFoaE9PRFZa?=
 =?utf-8?B?THFCcDJua3FMQ3VyZDdYczNvTUFvMWdpQnl6YnhDM2l6U21VTXc4ODJDQ1Nt?=
 =?utf-8?B?YXl4cGtzQ2tPWDJ2TUtKdlI2b3NnSjVIbWhZeHVlQ2R5UWhjdUxHTysxcTlj?=
 =?utf-8?B?bGpJZmczd0dMVjBqZ0lXQUtwZXM1b0UxZXBPWHdsUGQyb0FscHkwdjRlNWhk?=
 =?utf-8?B?UU16cERpWk1yUlhrQlU4N09TMnVKdXhDQis0WnBsSXVaVHJIRCtoOVg3U3c0?=
 =?utf-8?B?dVlRVyt3K0wvNHRkZWI1ZEdxaHdUaDc2ZmxNSm01UVp1d2hWYUlPOG1xemhu?=
 =?utf-8?B?UXlreTF0TjhWRXF2NjU2RGRTYldaWU1ZeFBnUFFMTFk0dnp4TW13WFdNWkV1?=
 =?utf-8?B?Wjg1QTh4eklQTUFWQzNjNnRIQ2dheFN0elBoazJkNUVDY0tacnROYmF6aENl?=
 =?utf-8?B?YVpObUtCbHlqd20vRkx2TWQ3bHZPeHlVWTUvelNJdFZ1cDRPb3hqOWFaMnRa?=
 =?utf-8?B?OGdmd1NjM1l1OUZFTFpvM3RnUXBKY3V6QkMveXZzSlhSTHM4WVpabG5KQVlS?=
 =?utf-8?B?aXNyZzU5VUZ5ZWkxVHVtQXF0ZzhORW5DM3RZS2pOblFORWhzTm43WklrL21I?=
 =?utf-8?B?bGswR2tJVFZxSmNaODNCQmIyYTBhOXZNRFNoL3VaMVNEQkx0amV3Ym93Q3Ro?=
 =?utf-8?B?MWUxTmFBWkZkeFlwU2FGOFFYQ1FzMUcyMTY2Q0xOeUJTQzRzVzcrcmJDRisr?=
 =?utf-8?B?YXRVenBWR29JZEdXb2d3YU1xZ1ZaM05LNXZtNnNBcmw1NlFWYnBCTHNHdjdI?=
 =?utf-8?B?SWo3Z3JZZGVKTnhrYzVmY1QyZkZWdnorVGRSZXlES2hTYklHUnI4dzJubjQ5?=
 =?utf-8?B?UTF0a2NQMi9oakwvbTJuQ3d5clRIbUZpWFN0bHFjS0Q2dThLSG1KRlh2M0hj?=
 =?utf-8?B?R292eWpiQWROVEhaQU9sVFo2U1VqYVFnT0tIUWoxT1VycjZjNEtvTmJPZGYz?=
 =?utf-8?B?RWo1WXdZclV3ZVNoeGorYkYzUUFTY1Q5K3pkR1k0emdDQTk1cjZDK0hxQ1dy?=
 =?utf-8?B?enJNK1oxNVd0QVI1NFB5eklwbDdzRXNPNitMYWVEYnJ1QjVMbGFWbWlLNmlF?=
 =?utf-8?B?NHIzamdnTWlsUWVhWXRYakpoWnJ3L3EvOXM5TDV4K3EzeHVvSkxHR1NLdVdq?=
 =?utf-8?B?NVo2WEVraHh4TFNQNmp2SW1JUDZNbzFKM1BraFlzdThET2hMY1hGR1gyZTkx?=
 =?utf-8?B?YVQ1UG9vcHBBUG5ibElXa3V6SWUvOXZYV2tOb3FsNWNWY0ZXbEtUVEJDU1Fm?=
 =?utf-8?B?R1JJZEFVWDRHV0VzSmwvSitlN2UxWmNEOTVsVGJtbUlGbGg2ZVlpTmpHS3NX?=
 =?utf-8?B?UTlaSksvRVZKQXFWRW93dXF0WHYvQW9haGUvWjQrN0VkNjdETUdZVVQrazVO?=
 =?utf-8?B?QnNWMUNiV1d0LzBlU0pnVkYrTW0xTFlmRFF1ZFhmUG8vQlpJYTlpeTFpSWpv?=
 =?utf-8?B?SmZJNDBCNHM5SGY1dUVDVlNvV091NGU3TSs4ZU1YUDlrNHo2NjZNYkMzM0Yx?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40231b40-8bda-4934-a7a0-08dc3e9e0559
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 11:59:19.4754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rMYo47GvHx0dV8ViWRdjMqDIKRYerC+klc9VzshwU5nmNrkVR+Zyy9aDm4bHzSQQ3X17ezDM0EFGJrTZp9uL/xExjw2Vp4rq2ugmqtu6OG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

PiBMZXQncyBwdXQgcmVuZGVyIHRlc3RzIHVuZGVyIFJlbmRlciBjb3B5IHN1YmNhdGVnb3J5Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVj
aWVsc2thQGludGVsLmNvbT4NCj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hl
aGFiQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVj
em55QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL2dlbV9yZW5k
ZXJfY29weS5jICAgICAgIHwgMyArKysNCj4gIHRlc3RzL2ludGVsL2dlbV9yZW5kZXJfY29weV9y
ZWR1eC5jIHwgMyArKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwvZ2VtX3JlbmRlcl9jb3B5LmMgDQo+IGIvdGVzdHMv
aW50ZWwvZ2VtX3JlbmRlcl9jb3B5LmMgaW5kZXggNTdjYTJjOWVjLi5mOTdhM2YzZjkgMTAwNjQ0
DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2dlbV9yZW5kZXJfY29weS5jDQo+ICsrKyBiL3Rlc3RzL2lu
dGVsL2dlbV9yZW5kZXJfY29weS5jDQo+IEBAIC01Miw2ICs1Miw5IEBADQo+ICAgKiBURVNUOiBn
ZW0gcmVuZGVyIGNvcHkNCj4gICAqIERlc2NyaXB0aW9uOiBCYXNpYyB0ZXN0IGZvciB0aGUgcmVu
ZGVyX2NvcHkoKSBmdW5jdGlvbi4NCj4gICAqIEZlYXR1cmU6IG1hcHBpbmcNCj4gKyAqIFN1Yi1j
YXRlZ29yeTogUmVuZGVyIGNvcHkNCj4gKyAqIENhdGVnb3J5OiBEZXNrdG9wIGNsaWVudA0KPiAr
ICogRnVuY3Rpb25hbGl0eTogcmVuZGVyIGNvcHkNCg0Kc2FtZSBoZXJlLg0KWyBLYXRhcnp5bmFd
IHdpbGwgYmUgZml4ZWQgaW4gdjIg8J+Yig0KDQo+ICAgKiBSdW4gdHlwZTogRlVMTA0KPiAgICoN
Cj4gICAqIFNVQlRFU1Q6IGxpbmVhcg0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwvZ2VtX3Jl
bmRlcl9jb3B5X3JlZHV4LmMgDQo+IGIvdGVzdHMvaW50ZWwvZ2VtX3JlbmRlcl9jb3B5X3JlZHV4
LmMNCj4gaW5kZXggMDY3NzdkZDdmLi5iOGU3OTYxMDkgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2lu
dGVsL2dlbV9yZW5kZXJfY29weV9yZWR1eC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2dlbV9yZW5k
ZXJfY29weV9yZWR1eC5jDQo+IEBAIC01MSw2ICs1MSw5IEBADQo+ICAvKioNCj4gICAqIFRFU1Q6
IGdlbSByZW5kZXIgY29weSByZWR1eA0KPiAgICogRGVzY3JpcHRpb246IEFkdmFuY2VkIHRlc3Qg
Zm9yIHRoZSByZW5kZXJfY29weSgpIGZ1bmN0aW9uLg0KPiArICogU3ViLWNhdGVnb3J5OiBSZW5k
ZXIgY29weQ0KPiArICogQ2F0ZWdvcnk6IERlc2t0b3AgY2xpZW50DQo+ICsgKiBGdW5jdGlvbmFs
aXR5OiByZW5kZXIgY29weQ0KPiAgICogUnVuIHR5cGU6IEZVTEwNCj4gICAqDQo+ICAgKiBTVUJU
RVNUOiBmbGluaw0K
