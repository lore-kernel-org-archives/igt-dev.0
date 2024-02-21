Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11D8C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 10:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DC510E88B;
	Tue, 27 Feb 2024 10:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+dCWsmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8871A10E45D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708520496; x=1740056496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QMmym8ZF0/KM9AfIPYSVI0Ldkdb2bOnWfQKYI7xvOfE=;
 b=Y+dCWsmJhseOjHy1tmeLVktrLpAFvOJZm+w1RMEC/GjeQw+MSBnO0xJr
 7wTFLjLJufM4POdU7vl9Ftukl0XfKitaCeMHpj/ZykEJqvIuLZeDmUmq2
 PD79Agwg6yWDq/2SfV+sVbEsUQWzKpi/8HRKCB6694Rij4ZQ9KqQbgTGE
 NDn3HbaENKMZrXHbVWBFn3+s5uX/qKmsWz8GLXhJ3kNTekGKEBzXrlVNI
 OR0WDo+89tIWYOWaLgeOBx7PmP6wqK3XkcsgfdIbiHahaGc6WS1Pj4awg
 qLVXSmhq3yCTROmM89KsMCF2nn21h1islNs4Q1DQbgcjySiuEM1e1GjBU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2800527"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2800527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 05:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9822529"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 05:01:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 05:01:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 05:01:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 05:01:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKCqR1xsKTqBJwfVtvEzPajdQeH9nItuyOM8qOzRSJHvtmoHYC49xHadbugtDA/nyaTQukiMjrPmmphRYd/wZImAgDEg6JI6dazifw6uu2D6RAyvxcvxj0Wr5Aa86wAHbaHVP58umROFmGdHiYe4V301+RidX23VvD/ZeFVbQ/JPhmgwnP0+AQNpCGVJUcfcC5pFeDseDR1TVFSglo7KY5GlwSyZImwpjG1vfcw2qvpxc1kJEiV6F2FA3bbfiz4vhk4AwEXUi0nF/0DGuephltIpgWyaw6Ot2Yf65bUeHAeNioPKweSUsA8lehVt7wNzZq9BIq++W+5ZTelDGSPeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMmym8ZF0/KM9AfIPYSVI0Ldkdb2bOnWfQKYI7xvOfE=;
 b=aeiuphYTG1JPPMetBN/YrakiVpoPKHnubdbTMO7V+nuxfI1SQdNkwwlTQs9w0OV0WNy/Mm+guQznTHpGjEsmHEPiVelGNYRN3sGwCKxtz8MQLrgupjWC3SKfYVH1ow3VUXo/y9mPY4GoZPHDQelkg1MwVB8yQfMVUuQKA+v0jRYBKFN5Ht6ALkDJ/bMwxJoLIdxkPB6ohqLQrm1Y0C979yxJB2NZ/Rfg0o/T+1j3aluF7t2JKH9z6w+5E0tDXL0R8bQauKg2fimpfqA47tCHXccWrSGKIwaAUy8MQIm4cE3VHCDoxYpi5nB7ELafxeBOUybGt1rp808tarX3310ZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 by CYXPR11MB8662.namprd11.prod.outlook.com (2603:10b6:930:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 13:01:17 +0000
Received: from PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::4edd:6545:5699:32ce]) by PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::4edd:6545:5699:32ce%7]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 13:01:17 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel-ci: Add debugfs subtest to i915 BAT
 testlist
Thread-Topic: [PATCH i-g-t] tests/intel-ci: Add debugfs subtest to i915 BAT
 testlist
Thread-Index: AQHaZLkqLZLRe2yHoUqwb5n1N2DSBLEUwniw
Date: Wed, 21 Feb 2024 13:01:17 +0000
Message-ID: <PH0PR11MB5949DADAAFD267880210FA5885572@PH0PR11MB5949.namprd11.prod.outlook.com>
References: <20240221104106.32576-1-aditya.chauhan@intel.com>
 <20240221104712.2vwb7nviacebhdmn@kamilkon-desk.igk.intel.com>
 <20240221112848.zg6dfpqaurm4y5mi@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240221112848.zg6dfpqaurm4y5mi@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5949:EE_|CYXPR11MB8662:EE_
x-ms-office365-filtering-correlation-id: eca7b49f-6559-4721-8ce6-08dc32dd3149
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l0+ZDP/lZIUZEKO0yanYGZhg9VtxlflI48FgsQc9ZfErZ/5ulgFaAg1r8J5gr+wccXbG0lkJGbI/WrSJ8Ty/behBn7T4gwp5hkg9dNVT+C19qLZvZkNTw+cv3lL3ZUE3lt//PSlqATt/zAqJJ1T7CmvbDvhXHQHjncQPLnUeUUylQJN6pnIWQJ6OkrT9Au+gyVxzxgAcgxIv02PTH/055gNKbOPstAcJ+bGxX0YdE1GuRI1yWDLerlW/UK3tC3XE0tI9nm5y8EDXne13lg04ylioVYUhQ7/FBggJDsq04E5Nnpo7MRMn64iJid4w/rH1nTpyOrqAIDpP7YOeb00O7kyBzu5gf/bw3Djhmxt6QsyYuNTc3KJqGrQ22/td8gZejOIEMpHNZ4zQxXSlS8BjSTMh+Sr2ElCUsqt4dFMmCnMvyWcoVm6NG3Imh0hsZUX8WMMNFf6mVlRxAO6vrMoZH2IAorir2fTDITriFwyHaHHSnEW2phpAsM0k4dcM+gNZmw33XlJApGu0pG/yLqT0FKJGV68BhCwKu1SkgOCq8NCOvwGrkOMVNJW0w9p87ztkGVnSqlsUaF+1Wkvo4dnXM82pvwFaNKnMvniPAjFWkzoeeRjJ2gAeWRIcnzARVvxM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5949.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFZvV3F4QnpYNHpSOG5aM1kxb1JJTW5oaVEvbnJpVzlZSWlEVm8yUEhNdlBt?=
 =?utf-8?B?Z1I4Y2d4ZjJJelFva0FkeFZhVHgxaDlBcW1UQzZkRXdNVmtlL1NpVlZUS0hM?=
 =?utf-8?B?aTAxYUFIYzJVUXdvdHJyNEpmQ2dpOGUzVmRlYVZVNzVETkJxczV6Rmc4bEEw?=
 =?utf-8?B?VS9GTFZORStQWkt6NjdINTE0ZVpJcE52UWtrZGRrREpTZXNkS25uYWV6ZnVs?=
 =?utf-8?B?K0Y4ZURjVjFYYU81VmRkQnJmdEtqTVFNZzhtTWV1blVDQ1U2VDNaMFJjYUR5?=
 =?utf-8?B?Uzh4KzhtWVNJTlpJRktKb0JZTkRzTWFPT1NjdlNEMTVXVTQrYnN6VXNEWmlu?=
 =?utf-8?B?dXUyRVZTSzRXWU1MNUNGdHd5NTJRRzZjMnIvejFUb1I5aHBGR0pBRUErS1hD?=
 =?utf-8?B?clN5OTNrOEVub3VZNTgvYU44eEdURXFoZGJJYWY4NGxxTGVoS0lnRDFMNHNH?=
 =?utf-8?B?S21IL3ArYVUrTDJNVUl0a3pDaGpWZWdIWjFXZmtJa1VHUDdHWXhsZTIxUmV1?=
 =?utf-8?B?VGdROVUzS3dQSnVhUmpPdm9EeU9JNEg2dEZRcmE0Q2QzdEFQY3V6UHV3VXJM?=
 =?utf-8?B?Mnh3bDlTNldhRGc5dVkyWnhJLzc1Zk9VZUtzNlZLcE1MNWVOSURMaHB0Uldo?=
 =?utf-8?B?TVZWWnM3enRjUnVTNjlGY0h4dVlvYlNhRTFRRzdBdjdhbE9TU0RBRGZLMitm?=
 =?utf-8?B?YjlNUi9PbWtjeVhkSE1GMGxXZElUWVgrdWc0L2QwWVRLZkpqUlVrUThXYjY2?=
 =?utf-8?B?K052dVJUV3RYSG5pejZ1VU4wN0VuY05ZaUZXbkc2KzRlNm1GVVF6TnYvU3RK?=
 =?utf-8?B?TkNnaG4xODBUcmpYczF4ZlEvdVE5M3MwWFRHSG5yUmV2eXkrUmsvSHBNZDNa?=
 =?utf-8?B?YklRM2JoTzIrMmdrQ3M4VGdrVWNvZGVNZDhpNDA2WFhRVit2NGlMWGtURUNP?=
 =?utf-8?B?d3I1N1BKL2JHRXRuNklTWDY2OVlnNHNVbzF1dE5CUC83cURuZE1pNzBLa29h?=
 =?utf-8?B?T3hQUWhJMzd5V1dQYVdBaTU3amtoNm5WQ05DUUI0dWFLamxpNVFvellTZWRw?=
 =?utf-8?B?d1daalVyOEl1ejVHbThGdklNTWlqUFdUMlhmckJnMkJSd2k4R2ZpNjdkVzNR?=
 =?utf-8?B?emZsL1c1eXB3NDc5L1ZMa1dyOHV2eEpEZjJ4UHhPSFVabldDYjJ1UHBtVWph?=
 =?utf-8?B?amtOSWQ1c3ZaNnZ5WEhkTUQwL1hSZUhQa3AzN3p3SkVzWXVIeVk4c2Q0ak4v?=
 =?utf-8?B?SWFzOCt3dGlCNS9GR0NQaFhqWkNJcHZLR2pmbGNFNzY2cDI0aVFvZk5XbTF0?=
 =?utf-8?B?WXdrRXloaHp0MU1tTzlhN3pZVXdHUXhPNjlJUHlvdXR4c3dFUTZZVTRYTGdM?=
 =?utf-8?B?ZUhYRWlJUkJycmNLY3grT1pWY0t4Q1ZYTHFTRDFLNnF3dTBuVnpjQnlXbHJC?=
 =?utf-8?B?VFI1SnZKUGJoM1I0UytoS1BTWnB6UUVRZFVERElTdit2MWNaRFB4T2ZKeVNR?=
 =?utf-8?B?NGdZdlpLSm1EVXNLR2cyU0ZKY3A5aFhtTmFKOXg0bmQ0YWlyQzVENHVMS2xt?=
 =?utf-8?B?dStMYm1senY5dlJabTJKcmhZOFlKK0VIS3I0SWk2dWtqK0lsT083dmNxTTIw?=
 =?utf-8?B?eXVkSWk3OCszTC9kdXBDVkVhTjN4WWp3QnMxbUhOcU1qK0p4d2FhMXhuUEFN?=
 =?utf-8?B?VmR3a2R4aStNMW8waUxjS0I2L2M3VEZVKzNaM3VKYmlnR24yRjhrV1JJUi9S?=
 =?utf-8?B?RG9kZnloUVFaV1BkdUd2Qm5jWWJhZlpOV0JoUERJNjRrdnJWMENteHdiQjAy?=
 =?utf-8?B?SHVwbGM5UDVMOFAwUjVsZWkzRVptV00vZk1IWlBybnNFaHk5by9NdkIzdkxt?=
 =?utf-8?B?RjgzM1FYR1l3SWdQTHFTZDlIbE9UWkloN1ErQWdCZ0lLUHI4QTdPUnBGR3N4?=
 =?utf-8?B?Vzd1UFA1SUxxVmlUQXR6K0ZWTU9UTS9pRXV4MGp4THZIa2ZSQ3FmcThRa1U3?=
 =?utf-8?B?ZzFEeEU5aU55dGlCSUlOWHd0L2oyMHllOVJOcWlHZHVtSHZjL1ZKT09ZdUZi?=
 =?utf-8?B?YVVXanF2ZFZGeUQ5QXVxQUQzbnRxVDBWeEpKdHI2MStWQlg5VUpKZGRJb3NM?=
 =?utf-8?Q?t/aPpyLciUOTdZVLWD9P8OenZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5949.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca7b49f-6559-4721-8ce6-08dc32dd3149
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 13:01:17.5731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOjpIttRi1lAAPg3FU+vnfB7zp/2YqeXB8BRrd+zzCLHdZnhf1yLNPXI1X8ov4mjII4nvqqtKaFR1T1U8dXEZxF9vpDV8uW7rXY2Ll9u4d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8662
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 27 Feb 2024 10:48:03 +0000
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZl
YnJ1YXJ5IDIxLCAyMDI0IDQ6NTkgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBDaGF1aGFuLCBBZGl0eWEgPGFkaXR5YS5jaGF1aGFuQGludGVsLmNvbT47IEdp
cm90cmEsIEhpbWFuc2h1DQo+IDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNvbT47IEdhbmRpLCBS
YW1hZGV2aQ0KPiA8cmFtYWRldmkuZ2FuZGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIGktZy10XSB0ZXN0cy9pbnRlbC1jaTogQWRkIGRlYnVnZnMgc3VidGVzdCB0byBpOTE1IEJB
VA0KPiB0ZXN0bGlzdA0KPiANCj4gSGksDQo+IA0KPiBPbiAyMDI0LTAyLTIxIGF0IDExOjQ3OjMy
ICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+ID4gSGkgQWRpdHlhLA0KPiA+DQo+ID4g
T24gMjAyNC0wMi0yMSBhdCAxNjoxMTowNiArMDUzMCwgYWRpdHlhLmNoYXVoYW5AaW50ZWwuY29t
IHdyb3RlOg0KPiA+ID4gRnJvbTogQWRpdHlhIENoYXVoYW4gPGFkaXR5YS5jaGF1aGFuQGludGVs
LmNvbT4NCj4gPiA+DQo+ID4gPiBBZGQgZGVidWdmc190ZXN0QHN5c2ZzIHN1YnRlc3QgdG8gaTkx
NSBmYXN0IGZlZWRiYWNrIHRlc3RsaXN0IHRvDQo+ID4gPiBpbXByb3ZlIHZhbGlkYXRpb24gaWYg
YW55IGNoYW5nZXMgYXJlIGFkZGVkIGluIHN5c2ZzIG5vZGUNCj4gPiA+DQo+IA0KPiBTb21ldGhp
bmcgc3RyYW5nZSBoYXBwZW5zIG9uIHBhdGNod29yaywgaXQgZGlkbid0IGFwcGVhciBpbiBmZG8g
aWd0LWRldg0KPiBwYXRjaHdvcmsgYnV0IGl0IGlzIG9uIE1MLiBJIHdpbGwgbWVyZ2UgdGhpcyBz
b29uLCBhbnkgb2JqZWN0aW9ucz8NCj4gDQo+IFJhbWFkZXZpPyBIaW1hbnNodT8JDQpbR2FuZGks
IFJhbWFkZXZpXSBMR1RNLg0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBZGl0eWEgQ2hhdWhhbiA8YWRpdHlhLmNoYXVoYW5AaW50ZWwuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiAgdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8IDEg
Kw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4NCj4gPiA+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+ID4gPiBi
L3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QNCj4gPiA+IGluZGV4IDY2MmU0
OWNjMy4uYmUwOTY1MTEwIDEwMDY0NA0KPiA+ID4gLS0tIGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1m
ZWVkYmFjay50ZXN0bGlzdA0KPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFj
ay50ZXN0bGlzdA0KPiA+ID4gQEAgLTUsNiArNSw3IEBAIGlndEBpOTE1X21vZHVsZV9sb2FkQGxv
YWQgIGlndEBjb3JlX2F1dGhAYmFzaWMtDQo+IGF1dGgNCj4gPiA+IGlndEBkZWJ1Z2ZzX3Rlc3RA
cmVhZF9hbGxfZW50cmllcyAgaWd0QGRlYnVnZnNfdGVzdEBiYXNpYy1od21vbg0KPiA+ID4gK2ln
dEBkZWJ1Z2ZzX3Rlc3RAc3lzZnMNCj4gPg0KPiA+IEFja2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkg
PGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+ID4NCj4gPiA+ICBpZ3RAZmJkZXZA
ZW9mDQo+ID4gPiAgaWd0QGZiZGV2QGluZm8NCj4gPiA+ICBpZ3RAZmJkZXZAbnVsbHB0cg0KPiA+
ID4gLS0NCj4gPiA+IDIuMzkuMA0KPiA+ID4NCg==
