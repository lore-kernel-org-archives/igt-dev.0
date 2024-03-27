Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6464EC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 06:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DC610F8B8;
	Wed, 27 Mar 2024 06:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jy4wPW9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087A610F560
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711521777; x=1743057777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2RtWYOLC5ckdIvYqt2JclRBRWCqNs7IETdlEfU8Hntc=;
 b=Jy4wPW9BCZLwpII0rglzXJeycBO1PVUbvHfYFw5xpRazDqqtCVrIf5rn
 QjR0/4JKjTT1lZZFsbUx0kzV5Cv/KNYfQq4toq62caZjj5XQC7Xng88NK
 Me95jiUlJhlhZk7jvCaDFqNkJ8FovROuEneLSQl0IDcBUeB6R5T3aUI3y
 3nnD2k/K/vb7/auy0tR5fXENRNXKzNtcV8uRLSbYCs12P+AIuiIFaIdZn
 mg5cMD8Hb2O9VwkYoP/2dzIbupWABJajz5820BKTlkY5/2RrhnNxTWBTe
 9zlknai8TCRRZKWLvM7vf/2tBO5Y9XsjKXqylGnkFMM3hEGFnASVBS+Rm g==;
X-CSE-ConnectionGUID: ZstiISPDS6SPAhKfvnUocg==
X-CSE-MsgGUID: BuzAJDx4TuSxvJ1iCCx8hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6714577"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6714577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 23:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16294067"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 23:42:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 23:42:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 23:42:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 23:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8TrA9X4rzd+Gnz6A3BRbnXu03Nk0KpdGKMiUXSiFgWEIOpM19o8VSXi4lavMFuLxuMGt97P7g38KSBv8wvxrxn7YxQfNWteDrb03JpKie391BsOKdmHBzdNRAAIKUE3EBQElg7BWumWv00xTFdeemXq5D2wzhzXa+FzeoDTEXsd5PXDe6zSZ+3DEaGrIMuF0zm32oE8HpUSbYUxm2HxVHowMo6UzS2C44sQWVyh7Z47dEgmWQ/Djgv1fjCdHAY4Jr42TRxa4FA4zpy8Spf/oe0ULZE1/Gpob0dxepAJ4LSElQ/dl0zD3LLC59dahQtYMfp5TCk//hEksvJUvpnTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RtWYOLC5ckdIvYqt2JclRBRWCqNs7IETdlEfU8Hntc=;
 b=YdAqR78FSRahCqHIMnah3pqcP3wHb4f20YgEVDSvRWE1vPysaYfh+w/CoiexcXuR/phV37RykNtsZOI02OTv7IeEs4LRLvIFbtcR/cbQ3kEefaQXjVcaDkYZvYKtP/85gHRh4K06CkWryyDnBX66DPDSsTgBcrn2EnOnPQfn/C5URo3yC4ZmS9qwVm5IfgeptplMxxFgEwenlItxKlrzQGsiym0wuBu4Ii+qUH9j6oM1tpVZ9sjusPbuBG51rZX9IPqELGtFzXc/E5Y1JKtKH1u+CBjDWm40hxaoGhuJdMiyCLyrR+pnWEjPC6uqS/qTjOWz0txe4Zsx2Eg8zpSFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 06:42:53 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::bc36:4845:4cad:88b1]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::bc36:4845:4cad:88b1%4]) with mapi id 15.20.7409.010; Wed, 27 Mar 2024
 06:42:53 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_pm_dc: Ensure PSR is enabled
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_pm_dc: Ensure PSR is enabled
Thread-Index: AQHaf4ByTbrlEQ2pwUuS+k3F6yBKyLFLJFEg
Date: Wed, 27 Mar 2024 06:42:53 +0000
Message-ID: <PH0PR11MB480610DDB438FDEB0115C277E4342@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240326132012.3747302-1-jouni.hogander@intel.com>
In-Reply-To: <20240326132012.3747302-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|CH3PR11MB7796:EE_
x-ms-office365-filtering-correlation-id: 2301beeb-6c1c-415e-369d-08dc4e29211b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVSZRFhZtCVawUI7bBHFpz4/gXhoSZrn8N5aw7CPq7sVqHrv8xiKr/U2qIhBhHnMCpRy9vxapESiuEBk54wzwuC4MiMiyNZAtHKL9bkQySmaTYGpz+1i9tP5JIhK+vvb1EugVsOHzkeAuz0kvAUmzBpHgORuBxFKknZt+v1+pw8rehunmAdg327VKY4xiiBZ7dlIroz5HBmIx6dV1R+D8wyORjCQ3Gku7+gEQVGL3zYj959CNRT164xw7JozCYcFMszh+1NudeOe1KyjIOdvn1jq5iiwHfYwWben8fNLI06KIyURLmD0iB3b9ghzDZ5g8P3cmkDJrkShXqhPBeGSdIc767/idLoFycv/oav9i2s9WwvvaiQnFVsnwKNUtW5B4sSVoguyc0HXp1il4pX2btGic/iKgCHGtKCnzuXhG24EjIva8qeOuHbG8lVm1I4ErBY///NEmF/9gATnxs8d9xXMPzqLPUrAiocg5g1fc5CR/PEgNtn3c9FXn7o7r+fFB4phpEzQRyYc4rtUyPzMTMma65jJxkj2El1rCjyu0AVALplDHbVBxKTjD50kHo0llcYkV2+0vhgnpdMHzXa7qciL6QlJVW2ls/TncyoeUSfqA2uBBH26GfuDgot32l7LweKllKsidov0cnm/DPxaTIq6GVjunI0TXlhoZ/NIjYI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2tlMlZtYjJvdHBjaDBCSGhSb2lyU0RWMWZpM1VJZUtVMlNpa3ZtMG9LY3pP?=
 =?utf-8?B?QTBHc2dFSkNETjBzblBqeUhkVktFeVdGVnRkMkFJQjg2TGdIQ3gwOVhwK3Mv?=
 =?utf-8?B?UEUvTmxOaWl2NytsRlJDQ1VWSCtJaVloMVk5QWIyRllYS1U5VTFOdFlEaWE4?=
 =?utf-8?B?Z2hFazVRWlZQRHh0bEtjL2s1eXpFekRjQkxwZGVyajVaTjYyRmprYjM5WlBD?=
 =?utf-8?B?TVJEcHNPV1o1eE5HQ2hPdU1CR0lWclZHdkVJRm84MUI0WXlYeWhaaWVEdkFh?=
 =?utf-8?B?dlIyTEdYQ1dzZ2lGTnhXV21KRHg1N050emFBNnA3SHpaUnhobWIyMWVuR29U?=
 =?utf-8?B?ZFk0dFlPTDVUZHVSOFhmVWx6SHBjaEhFNkE0dmF3dGFGNTM1T2ZpSmQ3NGRt?=
 =?utf-8?B?YzJUbWhCbTV0T2RHY3NtU0V4QmdPa1R0ejUxQ2N1Zzg5RmpCS2N5cHVoc0Nl?=
 =?utf-8?B?R1A2OFg4Nm9RR2hML1BLWHdkZWIzb2JOeWJpYit2dnlPQk4xazg3NGN4SEtI?=
 =?utf-8?B?U1BiRHBCclZiRkRHekt5OHgrQjBtc0x2RFAzY3NKSHEyRld4ZXdXYWV1QldZ?=
 =?utf-8?B?OC9CR2U1UDFwZzlzc0o3ZHlSN2VndkN1Qmgvc2xCSEdSUitTSi8vMjRQU3Vo?=
 =?utf-8?B?Sm5Ob3R2ZzV3NnF4ajFSZ1R4Y2pwY3FNUTRoY2lLSWFYL1lHSXp5T1ZZNU5G?=
 =?utf-8?B?R1VLM2FGSXlNMHk2eThwTnhJM0ZOSWZHSnBjaGZLYlpXZjhJelZWTFpFK25a?=
 =?utf-8?B?aHlUU1B2QWJETEFRekF4eWtQcEloenJEQkNPV2N6RUx0aEhkbXJZeDZ0YmpY?=
 =?utf-8?B?Q2luVEhZc2t1K1o1U3doemptTzJMQkZUZUxkRnpFelBGVFpBbFR3bXZzZ2Za?=
 =?utf-8?B?Zm90NVFPU2h5d1ArSTRCRzJKZ2g2bXZSVXM4am5VdUNwSEJNTjB0RnM2d0lQ?=
 =?utf-8?B?S3J4YlBYQTBGc1d4dkJrUlNqS0lrRHZPRnMwNk9DMzMwTEpEY1cyNzNkN0Mv?=
 =?utf-8?B?dWsyNWl5RkE0Nm1jVGliSC94LzZYSmo3Q1RPOHRMRzVvcjZBU0Nqb1AvUXh6?=
 =?utf-8?B?Zk1zUmRSQjcyTnFFcFcyZXlTbjJYT1hnOGhjVGNtdjhsUjdJUGNVRXR3dGpL?=
 =?utf-8?B?WFAzRklhNWZ2SlExenVCK2x0WklQUThJQWZuQzF1bnJUU1Njb3g2a0IxWnNr?=
 =?utf-8?B?UXpvTFVRS2trcFBqQkpuZXF5ZGFXUkxPUUIrTXVzMHhCWDRPckFFUkpFYWVt?=
 =?utf-8?B?Y2x4eFlSTUJzd2dLa1ZwNVM2NEZ0MzB2akhweXdJZHJvdWdveTRpQnFydjhD?=
 =?utf-8?B?dHNLMklHeUw1TUhwa0lqNzNxcjYxOHVJNXhjS0hyT3dXdUlvRS9PVWQ1dERD?=
 =?utf-8?B?TkxKSXhjdXdwZ0FlL2l4eTdsTXlIQ1lxazdjQXQrZ3F5MUhlSG52ZU5jVUV4?=
 =?utf-8?B?S3l3ZVVVNkFDcFQ1UmIvUnlXMnpsRVJYbyswMFZhMUdNYTc4WEZmZnJwdjlz?=
 =?utf-8?B?SjZPU2hWZ0E0R05ETkFhYS9ZL28xVjRodVhoRDM1bE1nZ0JUZFpFMWxJWU9x?=
 =?utf-8?B?T2lsdlk4QlREYnJKdHdEVkZobkVwa2c0SjlRcUthZkxGa1BsZS82ajdzRzRs?=
 =?utf-8?B?UWxwWFJxR0RLUHhXTUdFaVBISUx0NjhucUZOV2EzOUQzUHVoQmNTSnRuWDZX?=
 =?utf-8?B?RHBDMlNVVER6K2RkbzlkR2JJSDRqSkxtSXBOTVZnbXFoK2x4U3NudjlOakdy?=
 =?utf-8?B?emkwVi9lOHBJR0dyRHZGWnVIZXcvM1YzVVhUVHNTS2d6QlF3ZzRpTWVPRkNP?=
 =?utf-8?B?STZIRWV2dFRBeG9SQmV1NnNseTEzOHFDaFR0R2pYWDFSYTV1Ujg1Qko2K3E2?=
 =?utf-8?B?L0doL0JpVE56NnVYSEdVaUF3bmZ4MFJ6SGsvSzF3eGR2M0RoUUVWWW1rMUJ4?=
 =?utf-8?B?dmdqeTVhK3BRTy9paDZFUzJoeHFkUDM4Uk1mU2VnYkFXTlVhME5ldWhGanRl?=
 =?utf-8?B?ZlFZMXg2VlJsc2NTclIrNVJDVzF1ejROWG04NlJSdGhYOWsrRERxQ3ZWWnZx?=
 =?utf-8?B?b2UwQTFPaHpHdmNkM1lwYTBaWlBLdTFMNEt3ZWh5aFYxUlQyU1hqODUvSFdy?=
 =?utf-8?Q?osUarXpxspRd0omZ3QeT8etLY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2301beeb-6c1c-415e-369d-08dc4e29211b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 06:42:53.5577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fslW2wzfvUhs/5XY7fHAl1XPw2TtztCq42AWCFrtFgAmy1c9OVMhjQux97ossVYYY/RP526CeLAWfepFPowk8Gn9BawuoD4/lRuHeAFqJNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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

TEdUTToNClJldmlld2VkLWJ5OiBNb2hhbW1lZCBUaGFzbGVlbSA8bW9oYW1tZWQudGhhc2xlZW1A
aW50ZWwuY29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogaWd0LWRldiA8
aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5p
IEjDtmdhbmRlcg0KU2VudDogVHVlc2RheSwgTWFyY2ggMjYsIDIwMjQgNjo1MCBQTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMS8yXSB0ZXN0cy9rbXNf
cG1fZGM6IEVuc3VyZSBQU1IgaXMgZW5hYmxlZA0KDQpJbiBjZXJ0YWluIGNhc2VzIFBTUiBzdXBw
b3J0IGlzIGluZm9ybWVkLCBidXQgaXQgZG9lc24ndCBnZXQgZW5hYmxlZCBkdWUgdG8gc29tZSBs
aW1pdGF0aW9ucy4gVGhpcyBpcyBjYXVzaW5nIGZhaWx1cmVzIHdoaWNoIGFyZSBhY3R1YWxseSBq
dXN0IGV4cGVjdGVkIGJlaGF2aW91ci4gRml4IHRoaXMgYnkgY2hlY2tpbmcgUFNSIGlzIHJlYWxs
eSBlbmFibGVkIGFuZCBza2lwIGluIGNhc2UgaXQgaXMgbm90DQoNCkNsb3NlczogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy85NzM3DQpTaWduZWQtb2Zm
LWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCi0tLQ0KIHRl
c3RzL2ludGVsL2ttc19wbV9kYy5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykNCg0KZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jIGIvdGVzdHMvaW50
ZWwva21zX3BtX2RjLmMgaW5kZXggN2RlZWJmODNkLi4xNzZmN2EwNGIgMTAwNjQ0DQotLS0gYS90
ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYw0KKysrIGIvdGVzdHMvaW50ZWwva21zX3BtX2RjLmMNCkBA
IC0zOTksNiArMzk5LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9kY19zdGF0ZV9wc3IoZGF0YV90ICpk
YXRhLCBpbnQgZGNfZmxhZykNCiAJZGNfY291bnRlcl9iZWZvcmVfcHNyID0gcmVhZF9kY19jb3Vu
dGVyKGRhdGEtPmRlYnVnZnNfZmQsIGRjX2ZsYWcpOw0KIAlzZXR1cF9vdXRwdXQoZGF0YSk7DQog
CXNldHVwX3ByaW1hcnkoZGF0YSk7DQorCWlndF9yZXF1aXJlKCFwc3JfZGlzYWJsZWRfY2hlY2so
ZGF0YS0+ZGVidWdmc19mZCkpOw0KIAlpZ3RfYXNzZXJ0KHBzcl93YWl0X2VudHJ5KGRhdGEtPmRl
YnVnZnNfZmQsIGRhdGEtPm9wX3Bzcl9tb2RlLCBOVUxMKSk7DQogCWNoZWNrX2RjX2NvdW50ZXIo
ZGF0YSwgZGNfZmxhZywgZGNfY291bnRlcl9iZWZvcmVfcHNyKTsNCiAJY2xlYW51cF9kY19wc3Io
ZGF0YSk7DQpAQCAtNjA1LDYgKzYwNiw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfcGtnY19zdGF0ZV9w
c3IoZGF0YV90ICpkYXRhKQ0KIAlwcmV2X3ZhbHVlID0gcmVhZF9wa2djX2NvdW50ZXIoZGF0YS0+
ZGVidWdmc19yb290X2ZkKTsNCiAJc2V0dXBfb3V0cHV0KGRhdGEpOw0KIAlzZXR1cF9wcmltYXJ5
KGRhdGEpOw0KKwlpZ3RfcmVxdWlyZSghcHNyX2Rpc2FibGVkX2NoZWNrKGRhdGEtPmRlYnVnZnNf
ZmQpKTsNCiAJaWd0X2Fzc2VydChwc3Jfd2FpdF9lbnRyeShkYXRhLT5kZWJ1Z2ZzX2ZkLCBkYXRh
LT5vcF9wc3JfbW9kZSwgTlVMTCkpOw0KIAlwc3JfZHBtcyhkYXRhLCBEUk1fTU9ERV9EUE1TX09G
Rik7DQogCWlndF93YWl0KChjdXJfdmFsdWUgPSByZWFkX3BrZ2NfY291bnRlcihkYXRhLT5kZWJ1
Z2ZzX3Jvb3RfZmQpKSA+IHByZXZfdmFsdWUsDQotLQ0KMi4zNC4xDQoNCg==
