Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E2DC54798
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 03:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137C510EDA7;
	Mon, 26 Feb 2024 03:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+KwPjBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC4E10EDA5
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 03:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708917851; x=1740453851;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+p1TVSGCU8d1oEIvU+c8l+VwQJsEJTjCMSxnECQUaaY=;
 b=m+KwPjBIsnTXuHCkuhwP7BZ+dINsJt7HCghoKXgxHyZD8Rzvb5RVH7iN
 Y5bc4H0LVWzs+M+K51ejzR8bZw6Vwj4oPdISmzBa9R7DVyX2q08VmmKxO
 RwM2WaBjlbRoo1RbF0sRB5GJj5IK0LNPGX2/zNED9aIyjuknZStFElwrV
 8ZK6M52VXk5V2fyriByQwiSHUqF0UobL+0KXc6XoWCV8xq9xeNe1V4lJP
 HjHbgmDak6HgLUxUbJocrWQ3tC6RUcJumyDfyC98U+K89j+2lbY2aJ3tp
 rllJz/3uM1imM2ca9q9dy6rjo5bOsV4mTx+hqgiEmqvxz4ZSymzDOPAV5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14315524"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14315524"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 19:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7026222"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 19:24:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:24:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:24:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 19:24:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 19:24:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfzGFC6ROgd8sSPyA4TvCp0f1xQq8mHqy2qBbDVhsEKXxU3rC0+QWdNtD1LjRPJ0bXAI+J0cymL3Bjj8wflCuScEi0+kJ3wB+Jh8F7UKfBEnA5J0ryhT8R63JwWYKJMXndAEDyJgCM+eZK6fACLjboHJsWUPw2PifDf7NR5shW4eaLfJ3KA4KVVGzibtEtH/hhkU2xuU5Ac461E/skbS8OxanwMrEJQX2Z8dLyszGwsLKpm0z7a1so/DMN7nBAi1RNBWqqOgsTPyMZ/lDf++ZTqktuV6CZEIYgIeoUo37t2nzBP50k0kRvHnAuxUmgYYx2lOwFSV1KVZbVQ7wWXM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+p1TVSGCU8d1oEIvU+c8l+VwQJsEJTjCMSxnECQUaaY=;
 b=dXlbZgl8uaLVkbRe8nOfEWnloDq1mRc7sy4xQQv0epu4//Td7xgaIVI4rPc7NulbNAvYDXW/7IvSfZu4Vace0qN+ly7Q7lWKgYcE9gQjFK1rhymTfXCTYcYg6sxUfD8UzsfG4PwvkH6hNQ9KVc6CPO1JFZYti+e4xfpNldM88Cn666/2F3JuyDxKmLok67y7N9AFYzAN7wjILNnCzcFxu9Kq0usDNmVc0Ln/koI1nkMAsuqn3BJqLBlk2/X6/21YVLJZB/zPUY1ESKCnHnNcewh4HImBslUXHzF6q2vHF8QKcpFxb2JEUFuMFIBr3yaebVY6Djva2NkD++nEjDyxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB5535.namprd11.prod.outlook.com (2603:10b6:5:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 03:24:07 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7339.019; Mon, 26 Feb 2024
 03:24:06 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Subject: RE: [i-g-t] tests/intel: Add tests to run suspend without display
Thread-Topic: [i-g-t] tests/intel: Add tests to run suspend without display
Thread-Index: AQHaZVtVRH8Lo8hLLk6vd6Uhpo4XJbEV7Z0AgAABEbCAAAV7AIAGBsWAgAAAm7A=
Date: Mon, 26 Feb 2024 03:24:06 +0000
Message-ID: <CY5PR11MB6211A70489616B08222467A8955A2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
 <cb29fe35-0e68-402e-ac9b-a18addd3a48c@intel.com>
 <CY5PR11MB62114DF7228979346319F8DB95562@CY5PR11MB6211.namprd11.prod.outlook.com>
 <42bccfef-c5e1-48cd-a6ce-9f3bdc1efd30@intel.com>
 <3cc2055d-7ffe-41ad-8d55-40873373be44@intel.com>
In-Reply-To: <3cc2055d-7ffe-41ad-8d55-40873373be44@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB5535:EE_
x-ms-office365-filtering-correlation-id: 68928fbe-4ddf-470a-3c87-08dc367a6371
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CI0YUsiLTV7bUDNUOIn2vkPb9KdZBt1gZbhNbrmul6eQMT3OuyeF+GcNwAbQx7RJWn0L/aR+vfIkHFUURE303K7mSf6gi52iQDihdphBFinJ5qUoofDg79ThiEzIGYxzL9Kd5yu8yVWdNof/r5hf7u1D6K+Vi7N5qdp9zOIme03YSp6SNpRzz91XQEsEYSe7lgqTAHloPfjpPxllOX30rD0PCN0vcBqHl7G9wgKqYp82gYYKpyH7ZSm6rt6+A0oB3djoWfNl11r42+vegc3EcChZr4LU9GGPLXJXr1uztWBjtjkm1gPUmmjISgIqw6ND9tDOCfYAlsjo0DaoUSn67VJp9ltZtBBbeS38Z1EEFwf+RUFcoBinVGSEkjLslkUNWexaCMSNKxRFMG4k61h1Qv8NbXMF75iet+UF5YUtVMSO9S9mRdr6m1kxEnD3zm08aLNL0PvXIH/zWUzLr1aZqa3RjddaUUTDZ+L/2TBJUBoOHOsG2uj20r1TIXzyiX9tz2bM8nIN19nmTOCFaQziWBje7rok/hnInxY5clPmMtwkaIyltb52bteSYCmSNnVNfssSoz6IaR4xRTyrF2CKg2HErLBD84NjvCYNzIamaOs6Kz2xGbsjqVp9CyStsDyni9rM8hQCsQ0OvfE498iLQUER3C1+LXinQcuJyMSNOny11ZSU08zGJz4F8XeHcz+wzWXQgPrrNNULEZ97Io4qEQnY9GK53S8VhAZ7Y5+3VGc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U01kN1hYWUVmRjliMDAvOUlNWExmck1zbzZQa1pqTmlZQ2RsNW4wYWRBaUJK?=
 =?utf-8?B?a1B4RTBESWYrd2FOMlA5YVNFclVXYkpEVGg0a3ptM2ZhRzR0WVhpUStEb0FK?=
 =?utf-8?B?dmVpMTFicUZRRTNBZlpoUFNsWTVwblozbVY2YVJFWHk4OUxOWnVjMHRlbEt6?=
 =?utf-8?B?aVVmZXFZQUdPSnF6WGo4UXB0ZHh1cytjNjJmaEtsMUxNSy9RODJuR1BLd2F4?=
 =?utf-8?B?WEZ5K1lxQVVGNW1EVmJxanVLR09PZzZGMlVtQVdCVWZRRmNpRmNma1FCSEJI?=
 =?utf-8?B?MGc2aytNV1N6QThrMFVmSm91UVpBK3NhTVpDdUdMU0ZkYXVyNmxNYmxDbllT?=
 =?utf-8?B?RzJsV1Vja2xTMFRBTlIxRzAzeGlxTEVWNDlUVVdTQ0NyS3J1a0pHWDJxM1FH?=
 =?utf-8?B?L09oYkpETC9Kai9KbmY4UE81QURCUWtlODhUQkFKU2ZUREJZeCtzM05Va0lK?=
 =?utf-8?B?TElIcWpzVWQ3akY1T21ZNzBPa2w3MHNmekNSbzBFWnROSkZZY1lKR2ozekt0?=
 =?utf-8?B?dFFPVXJ6YkEwczhidUlTZHFNVHM5VS9WUVB0VW4zWnpTSUZnK3JjdDRHanlS?=
 =?utf-8?B?SjQ4MEthUGFvYUZDQldCeVZlY1Fud2F3TTJzZlFUTkZhNG9zenN4bXRKelY2?=
 =?utf-8?B?V0ZqVm83UitHUXlDZE4rT3F3TGdhU1FnZG9TbERyendEVjUzRzIvbUU5Z1BY?=
 =?utf-8?B?eFRvc1p5SXlBRlF4MGxCZm9jeUVGU3FtNXNRbTVCQmlNeHRYVktLOHorQjI3?=
 =?utf-8?B?b3FjUWNkWjcxZ2l1dzJUOE1jbjdTdHpBMWpnRVdYSWdGaXgrSXB1ZzVRTE5i?=
 =?utf-8?B?UjRpVmxqNlJpc3RaQ1hCck14ZmZoZk1OTHA5UnM4TWN4RXFEWUxONHBZN2R2?=
 =?utf-8?B?Tk1MMnU3Y2hvMDB5OXZvdHVjMWhHb0VmOVYxanZUVUNwYmlKQTVyNStDMVJL?=
 =?utf-8?B?ZDhTSHNmMkQwVHB4REdUK1BsYkhBeUR4WmJ1RW1KY2FjVUV3U3JpOStLZDVz?=
 =?utf-8?B?NWZXQ3lDb05VR0ZxOFdpeXBGek1yYWxiR0JJT2IrS0lhTkNJanZrWTkxTVNP?=
 =?utf-8?B?UkZVbUI3bTY5VU95V293NHRTamZqaElBMFRONSs3N3dFa2k4YnlxeWhtZzgv?=
 =?utf-8?B?a1FrRlNITEVtUmp1ZExQelV2TU02Wjd3MU8wWkFwQnNrQ2pPT21zWG5WV1VH?=
 =?utf-8?B?VW54MHM2SUZjM0hBcFgxQkRIVGhlS3VVZVlvV04rQitpMUZRY1BVN0d4UmZm?=
 =?utf-8?B?TjFpNFd2ZGFmNjNiZC8zQlRrbFJDczFZZTcvN3c1Qkc1MmFvMzhaWStDT1Nv?=
 =?utf-8?B?ZG1OUEtMeGFtam43TWFRTGh0bkNyNEdPL0phZHJBeDd5RDM2ZHBPVDBUOVMv?=
 =?utf-8?B?NkhsdmpsYmF3MzVYeEo3aDA3R2UvdU52SVdiWUJJYWx2WktOR1UwVnJFVzZG?=
 =?utf-8?B?d1VJdWpWRktXR2dRVWpVaEZIeDZLcmVRNnB2NTcwa3Q4SXIyYnNadEUxMmcv?=
 =?utf-8?B?NXErdE10R3g3SHZRNUNwbXNyN3RlOUt5SWpIVFp4WjQ5bHNsZHJlN0c0RHdX?=
 =?utf-8?B?QWd5WkQ4dVZUSStGZFFYOFF0Z2hUNWhQUnVyUzU2M0JxM3FlYWdHVDRISjRN?=
 =?utf-8?B?bFB5RUVCWmgzQkRGeHkreGo5WnY1R2gwR3JYek1rT2ppVmNTM0daWEZiL2Uv?=
 =?utf-8?B?b1BDOEdBYnRrdVE3ZGR4V1ZWVHRxSjArZDFPdXdpWnI5L1FoMzFoaE5aYVNy?=
 =?utf-8?B?cllmdk5tSHRWLzh3SUdXRmpZWXlRMVIyZGFnbTVUY1AzMzFkVFErdit6Qkh5?=
 =?utf-8?B?K0d5b2x5WEhNN2l6eVhJOGhBYS9jWERaTFZObmJyV2I3cFpFMVdmZ2FmSUJT?=
 =?utf-8?B?U2NsNVQwdWJHeFVsaUg4NFZrMWp5Nm9hZHdjU3NtNWVrbkphcTFVYjFHNGdZ?=
 =?utf-8?B?ak5wOEN5RFJraERoS1VlbFU5MVVmK0V0cVN0VnNUaUVkZHg1a0RBSE1yQVlj?=
 =?utf-8?B?VWJmL2RWYnlQM3ZzMUdiN1BWS3YwNzA5UnVXWjUwVXNzOXlRU0ZjU3lwd1p2?=
 =?utf-8?B?dEFJZ2RuYy8vbENWNWloaWp5ZXBaMXdpL04yU04wa0t1T3NWajh3MFp3M3Js?=
 =?utf-8?Q?B/cGMFT5Mg9xo0kmRVWt8kwWH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68928fbe-4ddf-470a-3c87-08dc367a6371
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 03:24:06.1589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yiumlfNkhQOtzULRFm1Ilz68Gnwe9wnrsDp6MJ1gPl3KUe1Zc4ACV2YZReuyZERLy+muTib6o4WAtph1EuSEL1hytHh9/hL+kyf4xVb/ils=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5535
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
RmVicnVhcnkgMjYsIDIwMjQgODo1MSBBTQ0KPiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1h
bi5ndXB0YUBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U3ViamVjdDogUmU6IFtpLWctdF0gdGVzdHMvaW50ZWw6IEFkZCB0ZXN0cyB0byBydW4gc3VzcGVu
ZCB3aXRob3V0IGRpc3BsYXkNCj4gDQo+IA0KPiBPbiAyLzIyLzIwMjQgMTI6NDkgUE0sIFN1bmRh
cmVzYW4sIFN1amFyaXRoYSB3cm90ZToNCj4gPg0KPiA+IE9uIDIvMjIvMjAyNCAxMjozMyBQTSwg
R3VwdGEsIEFuc2h1bWFuIHdyb3RlOg0KPiA+Pg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4+IEZyb206IFN1bmRhcmVzYW4sIFN1amFyaXRoYSA8c3VqYXJpdGhhLnN1bmRh
cmVzYW5AaW50ZWwuY29tPg0KPiA+Pj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIyLCAyMDI0
IDEyOjI2IFBNDQo+ID4+PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+
IENjOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gPj4+IFN1
YmplY3Q6IFJlOiBbaS1nLXRdIHRlc3RzL2ludGVsOiBBZGQgdGVzdHMgdG8gcnVuIHN1c3BlbmQg
d2l0aG91dA0KPiA+Pj4gZGlzcGxheQ0KPiA+Pj4NCj4gPj4+IEhpIGFsbCwNCj4gPj4+DQo+ID4+
PiBBcyBhIGhlYWRzIHVwIHRvIHRob3NlIHJldmlld2luZyB0aGUgcGF0Y2gsIHRoZSBwcmUtbWVy
Z2UgdGVzdGluZw0KPiA+Pj4gZm9yIHRoZSBhZGRlZCBzdWJ0ZXN0cyBpcyBsaWtlbHkgdG8gZmFp
bCBkdWUgdG8gYSBrbm93biBzcG9yYWRpYw0KPiA+Pj4gaXNzdWUgd2l0aCB1bmxvYWRpbmcgYW5k
IHJlbG9hZGluZyB0aGUgZHJpdmVyIHdpdGggbm8gZGlzcGxheS4NCj4gPj4+DQo+ID4+PiBUaGFu
a3MsDQo+ID4+Pg0KPiA+Pj4gU3VqYQ0KPiA+Pj4NCj4gPj4+IE9uIDIvMjIvMjAyNCAxMjozNiBQ
TSwgU3VqYXJpdGhhIFN1bmRhcmVzYW4gd3JvdGU6DQo+ID4+Pj4gQWRkIHRlc3RzIHRvIHZhbGlk
YXRlIGJhc2ljIGV4ZWN1dGlvbiBzdXNwZW5kL3Jlc3VtZSBjeWNsZSB3aXRob3V0DQo+ID4+Pj4g
ZGlzcGxheSBtb2R1bGUgdG8gcnVsZSBvdXQgZGlzcGxheSByZWxhdGVkIGlzc3VlcyBmcm9tIHRo
ZQ0KPiA+Pj4+IHN1c3BlbmQvcmVzdW1lIHN0YWNrLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9m
Zi1ieTogU3VqYXJpdGhhIFN1bmRhcmVzYW4NCj4gPj4+PiA8c3VqYXJpdGhhLnN1bmRhcmVzYW5A
aW50ZWwuY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+IMKgwqAgdGVzdHMvaW50ZWwveGVfcG0uYyB8
IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwv
eGVfcG0uYyBiL3Rlc3RzL2ludGVsL3hlX3BtLmMgaW5kZXgNCj4gPj4+PiBhMDA0NWRhMGIuLmU5
NDgzNWYwZCAxMDA2NDQNCj4gPj4+PiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9wbS5jDQo+ID4+Pj4g
KysrIGIvdGVzdHMvaW50ZWwveGVfcG0uYw0KPiA+Pj4+IEBAIC0xNiw2ICsxNiw3IEBADQo+ID4+
Pj4NCj4gPj4+PiDCoMKgICNpbmNsdWRlICJpZ3QuaCINCj4gPj4+PiDCoMKgICNpbmNsdWRlICJs
aWIvaWd0X2RldmljZS5oIg0KPiA+Pj4+ICsjaW5jbHVkZSAibGliL2lndF9rbW9kLmgiDQo+ID4+
Pj4gwqDCoCAjaW5jbHVkZSAibGliL2lndF9wbS5oIg0KPiA+Pj4+IMKgwqAgI2luY2x1ZGUgImxp
Yi9pZ3Rfc3lzZnMuaCINCj4gPj4+PiDCoMKgICNpbmNsdWRlICJsaWIvaWd0X3N5bmNvYmouaCIN
Cj4gPj4+PiBAQCAtMjM2LDYgKzIzNywxMCBAQCBzdGF0aWMgdm9pZCBjbG9zZV9md19oYW5kbGUo
aW50IHNpZykNCj4gPj4+PiDCoMKgwqAgKiBEZXNjcmlwdGlvbjogc3VzcGVuZC9hdXRvcmVzdW1l
IG9uICVhcmdbMV0gc3RhdGUgYW5kIGV4ZWMNCj4gPj4+PiBhZnRlciBSUE0NCj4gPj4+PiDCoMKg
wqAgKiBGdW5jdGlvbmFsaXR5OiBwbSAtICVhcmdbMV0NCj4gPj4+PiDCoMKgwqAgKg0KPiA+Pj4+
ICsgKiBTVUJURVNUOiAlcy13aXRob3V0LWRpc3BsYXkNCj4gPj4+PiArICogRGVzY3JpcHRpb246
IHN1c3BlbmQvYXV0b3Jlc3VtZSBvbiAlYXJnWzFdIHN0YXRlIHdpdGhvdXQNCj4gPj4+PiArIGRp
c3BsYXkNCj4gPj4+PiArICogRnVuY3Rpb25hbGl0eTogcG0gLSAlYXJnWzFdDQo+ID4+Pj4gKyAq
DQo+ID4+Pj4gwqDCoMKgICogYXJnWzFdOg0KPiA+Pj4+IMKgwqDCoCAqDQo+ID4+Pj4gwqDCoMKg
ICogQHMyaWRsZTrCoMKgwqAgczJpZGxlDQo+ID4+Pj4gQEAgLTYxOCw2ICs2MjMsMjMgQEAgaWd0
X21haW4NCj4gPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTk9fUlBNKTsNCj4gPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+ID4+Pj4NCj4g
Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWd0X3N1YnRlc3RfZigiJXMtd2l0aG91dC1kaXNwbGF5Iiwg
cy0+bmFtZSkgew0KPiA+Pj4+ICsNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
IWRybU1vZGVHZXRSZXNvdXJjZXMoZGV2aWNlLmZkX3hlKSkNCj4gPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4gPj4+PiArDQo+ID4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgeGVfZm9yX2VhY2hfZW5naW5lKGRldmljZS5mZF94ZSwgaHdlKSB7DQo+ID4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZ3Rfa21zZyhLTVNHX0lORk8gIlVu
bG9hZGluZyBYZVxuIik7DQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
Z3RfYXNzZXJ0X2VxKGlndF94ZV9kcml2ZXJfdW5sb2FkKCksMCk7DQo+ID4+Pj4gKw0KPiA+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWd0X2ttc2coS01TR19JTkZPICJSZS1s
b2FkaW5nIFhlIHdpdGhvdXQNCj4gPj4+IGRpc3BsYXlcbiIpOw0KPiA+Pj4+ICsNCj4gPj4+IMKg
wqDCoMKgaWd0X2Fzc2VydF9lcShpZ3RfeGVfZHJpdmVyX2xvYWQoImVuYWJsZV9kaXNwbGF5PTAi
KSwwKTsNCj4gPj4+PiArDQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
ZXN0X2V4ZWMoZGV2aWNlLCBod2UsIDEsIDIsIHMtPnN0YXRlLA0KPiA+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTk9fUlBNKTsNCj4gPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9DQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4gPj4gV2UgbmVl
ZCB0byByZWxvYWQgdGhlIGRyaXZlciB3aXRoIGRpc3BsYXkgYXMgbm9ybWFsID8NCj4gPj4gQW5z
aHVtYW4uDQo+ID4NCj4gPiBIbW0gbWF5YmUuIFRoYXQgd2lsbCBuZWVkIGFub3RoZXIgdW5sb2Fk
IGFuZCBub24tY29uZGl0aW9uYWwgcmUtbG9hZA0KPiA+IGN5Y2xlIHJpZ2h0ID8NCj4gPg0KPiA+
IFN1amENCj4gPg0KPiBIaSBBbnNodW1hbiwNCj4gDQo+IFNob3VsZCBJIGdvIGFoZWFkIHdpdGgg
dGhlIGFib3ZlIGNoYW5nZSA/DQpAU2hhcm1hLCBTd2F0aTIgZG8gd2UgbmVlZCBhYm92ZSA/DQpU
aGFua3MsDQpBbnNodW1hbi4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IFN1amENCj4gDQo+ID4+Pj4g
Kw0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoY29uc3Qgc3RydWN0IGRfc3RhdGUg
KmQgPSBkX3N0YXRlczsgZC0+bmFtZTsgZCsrKSB7DQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZ3Rfc3VidGVzdF9mKCIlcy0lcy1iYXNpYy1leGVjIiwgcy0+bmFtZSwgZC0+
bmFtZSkNCj4gPj4+IHsNCj4gPj4+PiBpZ3RfYXNzZXJ0KHNldHVwX2QzKGRldmljZSwgZC0+c3Rh
dGUpKTsNCg==
