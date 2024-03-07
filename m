Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46959C48BF6
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 09:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0919113745;
	Thu,  7 Mar 2024 09:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZfBJflI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57E113743
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709805006; x=1741341006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ekRi6zujNdjWLnfPiGSQsHtFpz75JQYglwhtG0OLFnc=;
 b=WZfBJflISKEEi4x7SiFCbPqAwNq6vWG9XOQJRvbTKdj335cY71ZWGyFu
 NBKH/T6sGfCnRD5EyWfOi2B6lI0JSITtuANiiqj73i6LEDiak1f2ULUG6
 rGsqAAhr7hA7vpf73jIrL6gl39LJB5Jyv7XFiDPPIHYfsryY4pnl21NV0
 PYaHcWgXMY0h0tME+yNxSn2AfCV7i21ES7Ultrt/KnI4T257i6IU23M1m
 DR1hWhWP6knlvXKmkSke4QA+kp3+ZjgeR3EcuH3TxxSpDlRTp/ezPbtjz
 tbVdLZvl9mqm26VIORGznhRqhcRZiyQweooJyczOTd6vkTUY4OqYzyXtY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4634039"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="4634039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 01:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="14724958"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 01:50:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 01:50:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 01:50:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 01:50:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 01:50:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwXd+C/qONJD3y3pBNdBmgHjkV0L6uQncnx+AFVE/Q4gG6PQ3LpkkqbTWdWApwx+k2kSgHKJGQp3Jy0C/o5+aiU9+unEqQnHM2ZhK38xY3KGiLGxCR0mTICj0gbyJgVSxTbDotYbi5fZXMJsjSwIfAV7DzzdS7lCgClmk/ddUhnqQVOdWp5j2l1b1PGGr/3fpQTQ78BUfufrz0gUdR21a4Wa1PEZlNMUd+69yYERqakbem2O4nMkaaFzGQVmwkYdN/1/GroVEJADqSpvlUEDm8IVkF0vBe/afnYlVJA/C+CwpnIcrwBwx9GUWf8FM5LcWTlkxnRUXbW9O7Lwj0LuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekRi6zujNdjWLnfPiGSQsHtFpz75JQYglwhtG0OLFnc=;
 b=FPQHFxK8a+X+WDW8/rBNwlD5Vo59WhkTmRAv/KgJjEYnSjh5bQV9XEGz1QK+W5BZQlBHzyYmcmKfeD5bRtCaXLKfXBK/dvc12iekYiECliwVSF27NaNcfpzGI3lBA/sUPCzCZ8j9yO75zWh0OosKM0jC4wG2mraa2S/e6fghfQ830TXvKH6CH/h15inog16n7hZAa2Qqjd4AX/dg7ZzjYwMrM6KKm2I6/7P9xK37EV//hbYYLt4TUoJHCePoVa1I2gol8eU/O9jywosZvbXKR83QBt8/QMbNgu7G/1iZf9bTUXJUnxM7kEp+f8nGCqQl53ncoacA3Z8wdMdJnVdSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Thu, 7 Mar
 2024 09:50:03 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 09:50:03 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 10/24] tests/intel: Introduce Flat-ccs subcategory
Thread-Topic: [PATCH i-g-t 10/24] tests/intel: Introduce Flat-ccs subcategory
Thread-Index: AQHabiWteV09yyEk/EGfpOA5tcmn0LEnsauAgARbXOA=
Date: Thu, 7 Mar 2024 09:50:02 +0000
Message-ID: <IA1PR11MB60975081ED0579C87D1E6E9786202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-11-katarzyna.piecielska@intel.com>
 <20240304161651.2cc0f015@maurocar-mobl2>
In-Reply-To: <20240304161651.2cc0f015@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|IA0PR11MB7816:EE_
x-ms-office365-filtering-correlation-id: a386010c-eb7c-4eea-f99c-08dc3e8bf61b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hWyDWnK8KDSJp/qmjFgg2tzu4XsGEURhus0OCzm2tJoJbU2TjBUx8RwPfowXxvtObsUDpors01zy/Z7NuA0gLzwphFaPNxSUiNKbLmcJJcye+4kI4O64+uDvhsbhzoQH4nhANcrwAPSU6cEWeuG+1CNd4fsnk7RqzIlsQtexJEHwuneXUJ5TdaItj6uK5K44wnlphWW1uXhcUPF2ka1q0t4x6diKAe4Xed2FjHQJQ64GrZFQlY6gJzCg3btHSqIFrGbEoSiFXO4dW/Ja/ejNibYRREx8kip7dIxxPXJpExmKhZfuqmwb7/DgOGzevVGCJ0dZ/ayoywWHiHWRYO3SkW8cEKYhILeVxMdBsgjJsL4Vw5iwtkjTpVVbEE/fdsFhGcQgoHAVEkp7+cUvrYGEFCdWZZKo/sfO3OpB+vlq8n58M2P7pM/hu+cKbcY1p1SE30/OkPv2uemShk5vxq/xPKzXlU75BVIC/BrE/lKzAs1/ArwG8UaGmFBCfBivlVIZ4b4QehSzQhy99rs7/b8qYXhvvwZBhXv/V3u4iyhkuB7DNsW2ykyAB5u68s69Cm442or71jS4rTnPM0LWde/r/nDoTNUMG3ixErEnOX/QpMJJg3BkUJi7nCzeuBz5g0Dg70CwTFQA98cF4sS6QmmWDbjzXTHprUqf+2oxQ0r0vFPllFBH9CxcJxzOdYk/nnmz+nAi4TMJ6s69dPbmvL5CwA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnNreGNEUnBHR3ppR0xya2VvZmh4aVkwQ0UxQU9hQktWdHFUUUswNUFveDNS?=
 =?utf-8?B?bHljWGRKRFlpUjZVY3dHWnAyT1lnNUZKbDlSbHBhYkFJYjE2SUtlTXlOUzEv?=
 =?utf-8?B?WnNqalRIQ1o3L2lJWFdseVVWV1RWbXgyYU4xUklTcFNrSG5NcFhselNXYlFB?=
 =?utf-8?B?RkpDVFFlQTZIVGY3bmU3MnZjSmhoa3N4M2xOVW4wcWdzZXc3bkNLSmh3Q1JV?=
 =?utf-8?B?K0svUlk0MFVvQWdYb3hzTEdsazI3NmF3ZlF5cjV3SnUxdHBtQml1TU9ML2ty?=
 =?utf-8?B?Y1lEaVFMelZEcnlRZHlZeWNsaGVQNGNvWWNWUXhqczYzZGJUVU1vMGNmeGN1?=
 =?utf-8?B?bklpdFFjaGVGcjN6OHhkUDBYaThkYlpic1hMZ3UxYWFWOWM2alQ4TFByVUUy?=
 =?utf-8?B?cU45cVRmQVRVYjVneklZVjBWODJ4M1phRnlJUXJJOHpraXJxemlyNHQxS1pl?=
 =?utf-8?B?UjBjbE41TWxscm9Ha1NYVDhvU3YxOFEyVzdFUFRSWVZOa1QxVkNhN0ZzMmd1?=
 =?utf-8?B?aDZ3TDU0alZ3a1l3TTE3OG0wSkV4RDMvTlM5UDlyV2gwZFhQdkdVQkt2Y1pM?=
 =?utf-8?B?cS9rYVJhQUFRcUhtMkR0OU02dE5pS1FFQi9oNG5nekR2MVFTc1Ivbk81ZDRp?=
 =?utf-8?B?TFBGcVdLeER4MFdpNkZUUzNJR1JONWszcTgyMDNvU2xRYndvY2Nad01PMFkz?=
 =?utf-8?B?eXJnRmk3U1BWTGdoQ0RSN1NHL2dLZHhhOVdhdncxZEExdExWSTZ0UG1iZW1w?=
 =?utf-8?B?empucmhUNHJnMzZwMnFOcmFqY2VBS0h2ekVueDZRTmRDandZNmVXanVKVm1M?=
 =?utf-8?B?ZG0ra2ZSak1WR1ZYY0k4am9lVEs2UzczcmwrKzBGODU3c0J5ZG1CbnpDMFNQ?=
 =?utf-8?B?NUhienB3L3o4R1BkYlZHT01pemx4L1pWMUVacEdCV2sxU1hTM0hzNjJGbURu?=
 =?utf-8?B?d1UwT0g0Vk1nRUxPQ2NSQysxU0RUVkZ3YTZwazJua0NscVNoYVo2bVlGWTJ3?=
 =?utf-8?B?Vi9lMUxhVFFtMGpOK0xOZkdLNnpqWkVIVUJDN3hjNWlEYjlpbEVjWUJlVzZV?=
 =?utf-8?B?dHoySlBNMk4vS3h2SkJaUmlydVM1Y3B3MEp2RjNDeXJINkQ4OEtXVDdjWThu?=
 =?utf-8?B?NmdzMEdQbFoyeE95TE9vcXRVYmNrQStvTEJCVVFNSTRMakJsUVN4R0xFSVlB?=
 =?utf-8?B?NkhNK3A5bGhUSUNzQzFVS1F4NEFCY2c4Z0hLYlNjNnZ0bndsTUF6dWMvWXBT?=
 =?utf-8?B?NEVGZFF0cFh1TnBmRG5oeXpGRXFUemlTZ1FnSjk2M1JiOVlOT1dMN3l5ajZ3?=
 =?utf-8?B?S2d3TG1oUWVvSHpDWktGR2taejB5VlZ4aGsydnRJY2xZY3I3OEJRZG5DdmtZ?=
 =?utf-8?B?eWN6L05HalBaQU5jTDVIcWVXSmxXTm91bnNjbk83ZHRJaG9DSFhPeUpaODlP?=
 =?utf-8?B?d1NWQ0ZlWmF4WC91ellzbXhNOUJldVIybHpXSDZuaTRRaWRLbzlDS0ExNlF5?=
 =?utf-8?B?RE82UGJieHdUVjVDUXcwdFc4TllGNS9aWkRyNUd5RUR3TDFMOEZzQXBzR1VB?=
 =?utf-8?B?MFdtbDVyTnlsRjdSQzRTdjhyY2hJWUl6RkFjaFZiZXYvdDRSa09MT1l5aW1T?=
 =?utf-8?B?MjBsS0dRUDNFcGlqbVVMQWQ0MlNtS2NNc0hjbVBYTm85SGFYUWgrN3oxc2Fr?=
 =?utf-8?B?clZpS1Z0cm4zWFB3d3k3T1RFQklDTnNXWjZRYkpuWWNac1A4aDJ4c2NEK1dP?=
 =?utf-8?B?dS9sRERXZDVJL1ZERTc2ZmNvSG54VXhWYnJieUcxZDkwZDFudkxSaGNyR3Fh?=
 =?utf-8?B?TnV3eWM4bWs5cTZPV1lHRmZESkszMkNLakpIaUhCcnEzRTV5NUhnQU5iUzA5?=
 =?utf-8?B?cTdIcytIbUhvaGg2cEhWTmR6ZEJIb0ZtTFFpQlQzWFUvNDZYN1N3UjRDSjdL?=
 =?utf-8?B?MWl6NHpMSjlDZ21hRGwrdk91eTRsRUtMMEhoMlRsaDB6UlN1NmpsMlZBc3l3?=
 =?utf-8?B?ZHg0cjRZK000cURLcHB0dnprbUcvbUtIa0hTU09wa1F4MEZCd3BLbFRpazVm?=
 =?utf-8?B?a1phWEZTZVFZN1BJOFdIemxhS2lLakpEOUFXbWE3QlQ2NUtGKytUUWhERGV5?=
 =?utf-8?B?dFNDZDNyTzhaS25FVmN3cVlLV1NlcTJ5RjJEWkFzdjJLQXh1SjV0RGd4ZmFj?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a386010c-eb7c-4eea-f99c-08dc3e8bf61b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 09:50:02.9903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ca2iLtNfoMrS6x0IIM3uK2ImrJAsQcWJGl+VvePrZ6Lm85/UJSAroD7XrcWRmKJ0t4LImHdgTJVhRnD1ah1CZnJdQcpbDKuHL58NAGWRKp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

PiBMZXQncyBpbnRyb2R1Y2UgZmxhdC1jY3Mgc3ViY2F0ZWdvcnkuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29t
Pg0KPiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtYXVyby5jaGVoYWJAbGludXguaW50ZWwu
Y29tPg0KPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPg0KPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwvZ2VtX2Njcy5jIHwgMyArKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC9nZW1fY2NzLmMgYi90ZXN0cy9pbnRlbC9nZW1fY2NzLmMgaW5kZXggDQo+IDM0NDJlY2Zk
My4uZTYyNTdhZWFjIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9nZW1fY2NzLmMNCj4gKysr
IGIvdGVzdHMvaW50ZWwvZ2VtX2Njcy5jDQo+IEBAIC0yMCw2ICsyMCw5IEBADQo+ICAgKiBURVNU
OiBnZW0gY2NzDQo+ICAgKiBEZXNjcmlwdGlvbjogRXhlcmNpc2UgZ2VuMTIgYmxpdHRlciB3aXRo
IGFuZCB3aXRob3V0IGZsYXRjY3MgY29tcHJlc3Npb24NCj4gICAqIEZlYXR1cmU6IGZsYXRfY2Nz
X21hcHBpbmcNCj4gKyAqIFN1Yi1jYXRlZ29yeTogRmxhdC1jY3MNCj4gKyAqIENhdGVnb3J5OiBE
ZXNrdG9wIFwgU2VydmVyDQo+ICsgKiBGdW5jdGlvbmFsaXR5OiBibG9jay1jb3B5DQoNCkxHVE0u
DQoNCkEgbWlub3Igbml0cGljazogb24gc29tZSBwbGFjZXMgbGlrZSAiRGVza3RvcCBcIFNlcnZl
ciIgeW91J3JlIHVzaW5nIHRoZSBsZWZ0L3JldmVyc2UgYmFja3NsYXNoLCB3aGlsZSBvbiBvdGhl
cnMsIHlvdSdyZSB1c2luZyB0aGUgcmlnaHQgb25lLiANCg0KSSB3b3VsZCBzdGFuZGFyZGl6ZSBp
dCB0byBhbHdheXMgdXNlICIvIi4NCltLYXRhcnp5bmFdIExvb2tpbmcgYXQgaTkxNSBmb3IgRElJ
IEkgc2VlIG9ubHkgJ0Rlc2t0b3AgXCBTZXJ2ZXInLiBJZiB3ZSB3YW50IHRvIHN0YW5kYXJkaXpl
IHRoYXQgLSBsZXQncyBkbyB0aGF0IGluIHNlcGFyYXRlIGNvbW1pdC4NCg0KSSBndWVzcyB0aGlz
IGNhbiBiZSBzb2x2ZWQgb24gYSBzZXBhcmF0ZSBzZXJpZXMuIFNvLCBmb3IgdGhpcyBvbmU6DQoN
ClJldmlld2VkLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4N
Cg0KPiAgICogUnVuIHR5cGU6IEZVTEwNCj4gICAqDQo+ICAgKiBTVUJURVNUOiBibG9jay1jb3B5
LWNvbXByZXNzZWQNCg==
