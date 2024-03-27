Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EFEC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 08:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7CF10F91C;
	Wed, 27 Mar 2024 08:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQOqlnYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2885210F91A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711526644; x=1743062644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g4WrkI+mdz3lo4OJBx2hPC+Va+KbZsE+C+p6n3OFEcc=;
 b=OQOqlnYmBP1qeGJPcVKLBJxgQyEbf+J/Jk4+7IARdmh5lUVxw15KRqGV
 87QiUVE+KHbiAlbEwoWex9TYqjwJP1XMHnPlSMcZb1nSHgW3eRolEBz2j
 2LU5WcoEdnR+yJ5qXaQL9jSh7EaOTSWvD4PcDf9K0mBmOT8NSqzsEbIOK
 Vd2C75YpOnUJpxv6YPa4un2w2392r0HoTxZOQEBtF8UNlgdCTGTfHMBhf
 UVWULUbIz0iPblDZ24qW7sC7WPlc1af5RKAuWvd7WyPqQU6JOa9dW9IlR
 g0D89AY7EQi0SxgQvkSfY5lkQ8e0qRCcsjYFN/+WVuOYlYtCD6sUrQCvW g==;
X-CSE-ConnectionGUID: Pc01crGFS1OikX4ekcMWbw==
X-CSE-MsgGUID: ytoiUH9GSu+qLici+D0Hhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="32053674"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="32053674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 01:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16150996"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 01:04:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 01:04:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 01:04:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 01:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpgFbp+4epmCFBhUQXaCs3y6BbnnAJIKpo+GAnG/6qT9h3PR9EM1aAYziqDdiVEMkRUbRGJuVA+ymxhUtvgMIrlYFlQBED21SJ8TQi5GklmPBFqYA9EnOzw/YA/T03gR2dhf/OXBiinh1zA7fQ4F3NpwMui6FuT7obYejt0ORVRc0weEGM5y8RfCPprp7l2fDmYnWlahRLsVrVwPU1m65DTkwhuiDtJKypNumjPJ3VdGt2nzQPXqQyHus1IKgm0WmXIElMG0d4LZ25MZ0ZWHkOqvtuKbRT/fp9y8HutxKxAhHX277F5ElflHMiXEuPfCplNIa4VR2h3L7E8Z211JAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4WrkI+mdz3lo4OJBx2hPC+Va+KbZsE+C+p6n3OFEcc=;
 b=hh9kYeKo2BiYB/sF9vGUl/AI/++lgrez7u0ppCPPMe3itcz/CL8wxF2NwCNQX4r+lJVB1Kmt7wGy4VFup2vkN2L6ulGQ+vI708kmitMAsL4evuTAd4w4vTBYHvqvnu1a1PRtSSyZ7F/gkY+4n+H+4w4Y4hTHTEI3BJZaDLI1UXAsz7hUyTq3ZHt22eOKnZADgoN+Dx0kNgt5CiwBeZV+wOLuvAEeG/efp+DnhEHtXkVR4ojtUiLT5RJKBPzLxhDAomuEeSfAx1znSMN2iwLJ6Yo9GJ19KGdjshuSuLaq2Fb89vur2Q2wFPCZMu4kHPpKrxP3N0bYk8ML8S0xgPE/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 08:04:00 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::bc36:4845:4cad:88b1]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::bc36:4845:4cad:88b1%4]) with mapi id 15.20.7409.010; Wed, 27 Mar 2024
 08:04:00 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 2/2]  tests/kms_dirtyfb: Ensure PSR is enabled
Thread-Topic: [PATCH i-g-t 2/2]  tests/kms_dirtyfb: Ensure PSR is enabled
Thread-Index: AQHaf4BzKDiOohyPY0CzjXC7+V0aVbFLOzkA
Date: Wed, 27 Mar 2024 08:04:00 +0000
Message-ID: <PH0PR11MB4806DC2147E7DD8019839C45E4342@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240326132012.3747302-1-jouni.hogander@intel.com>
 <20240326132012.3747302-2-jouni.hogander@intel.com>
In-Reply-To: <20240326132012.3747302-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|DS0PR11MB7630:EE_
x-ms-office365-filtering-correlation-id: 41e60cbc-7788-49d3-f96c-08dc4e34761f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ehBlBJPKXN1hZI5EBCYFfplrB0LAeJDQiYYf1qS23kmyoOHRxRM0KgaXkDt4p9Yl6638k1wBSS+zwo9xW4onbEgegOg+nJYyvE3o05oChbwe8AYOkVY9PmAkKF1NQB+9GQjlgUtrZmCHt6rfzhHvkWUJ/BPGHcR0Q9yXkBqDBtKc60pKicK+UpxsltDzbiIGC9dAe3iUm0ii+U97fsoCrOKLIXNoGBUKqJb7s2gGoXEO4RV68ds/pE4YBJNMZ71ff4JH7JRctYBSCEsmtWLHxbGcniKZes8D8sR+QrsDGO4LmNueufLVnA1HbRpkqqn8AYcmtemCttey8mDGcTqTMg+3WyLz8VcUepFcs8bH8wzjPPPBAeC/UpBFx0ZzmrRk7gH9cYIKz+jJnoB4bIHpOJ3QqhJuhdjg6xk1ZytBrjJfAVxr6WPqpt/9T5yWiVRjXWimwfBZEExVCfRL2YOFKLz5OPktIAp5oviQAwBDB0oxLWFuFpe4o89lgLm3kG/txJ3Iocgw+/NJjzvh9gv2Nf1H5oz8RhVGpX5wNwRPbxjDM5RU+78xgBMSTj2850AaeMew5Tz/2tLiIbZ56t6Ogr0rwh8+oomMII9W26l1U244/8X8V54KPAixByNk4aSA3GEiMNGM2AolObuyhMvVx6sZL01S5d8W3rRnTN/eTtM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkkxS1hlZ3c1bEFrbHh2UWp1dmdPQ090byszWnVhbklBQ0VzbzVvSXRCRmpU?=
 =?utf-8?B?bDRtYUVGVFhTRG9zZlg0ZmZpMjlmcTIwa043UUxqVU5FRys3enZHa2ltUVZa?=
 =?utf-8?B?Yk5hQS9pVWtvRGlOTjdyMEl5d0VKZXEzTGlTTDdXUVNtTFNNSUFUcDI0RTlh?=
 =?utf-8?B?TXFKMHNVNE42Tmx0NUcyUk1ybXJMSDZkMTJZUmFiekM3SnpNcVM3UkxtbEJT?=
 =?utf-8?B?MzNPbzVuSHI4dEtiYUt4K0xiT0hBeGE4K2dEVjNOK0F0V3BJSG4yK2pyQk0r?=
 =?utf-8?B?QVVEb1pDMzZuY0dEU1BZaTNWd2szU2VqOFUxRmJaZXBHeXovbFdGZ3hHWURs?=
 =?utf-8?B?emdma1U2dEhvT3ltZllqUDY5Tm1PbElBSjd5cnBxN1VIVE9MUFB1VzN4dE9J?=
 =?utf-8?B?dmtUZ01rYnpqMFZDNHQyNTdGdFdST2JObmV1WVpFWkpnbG81WUlycjJ1bXJr?=
 =?utf-8?B?UW54YlVwU2lGL2xKcmpoODZUdTkzS01iajg0SnJibHZDK3FXT2pnSHVXdFly?=
 =?utf-8?B?bGdEellEV0poNVdzOWtHSm1MNk4zQ0UrRXdGOUlMVCtUOEF1ZHZBSmZWbWVW?=
 =?utf-8?B?Z1drSlRXQjdkcXhiVGIvemdBdnJ6VGFnS0JUZkRMQ0Y4T2FNSElCby9kd0lL?=
 =?utf-8?B?RTdmYWNscW1VOGNzeHhSUEtvdnJNMURxdUxOK1VxVFlNcmo5UEJSWGtUUEFq?=
 =?utf-8?B?QkZVV0czUnRydW5wd2VRT2syTVBpMm9OWCtYb0Z4emM5Skt0T2kvUk51STFB?=
 =?utf-8?B?ekU4d2pQaXJKNEdGQzQ2ZDJieWVtc2VXWHBaaXJpampGVlMxVzkyR2ZYZ0I5?=
 =?utf-8?B?aVQvYTFKd2xFVXdPdmtlcEduRk5zQnFsc3RTMjdldmwxbGRaT3BJQmp5RWV6?=
 =?utf-8?B?angxdlhIU3pjSTRpM1IwOWxCL2lxeGhiTkxyNzlmR1dpZG54RzE3dHZIZS82?=
 =?utf-8?B?YzBwbjZYdGdJRnF4WVJOSVI4QUV2bmh0SVN4S2R2cHZsdHAwODZYa0FOOXpj?=
 =?utf-8?B?dkJhQlltRkxsRDZWWkhsSUhkMUNZRnd2V0F3RVJ5Vjh1dE5GWllOc1dQV0kw?=
 =?utf-8?B?YzZUQWZmb1Rua2JOMVV5bjdSRGJEaUs1SElDTkZtUExlTlR1U2pmbi82cStY?=
 =?utf-8?B?OU91OXM3LzB4eEtwMnA3SjhZRHQ0L0RwM3g1WWtVTlozOFJxTDY1cnhSYkM5?=
 =?utf-8?B?MjV0cGsxTFErOHBHMkp5THBrb2plTytlSnpRNDJCek40MUpXcVpYTGpGV245?=
 =?utf-8?B?bTBhT2RGSE01K1NtZDVZKzhCT1gzQk8xY3FRay9kUWtpZDg1SmRldGFuUmts?=
 =?utf-8?B?aVUweWRSdnp0OTZKOTQrS1VRdFZ4aXlyeUpqcXBKaHZYMGlLcjFJK0NDSGxw?=
 =?utf-8?B?eWdkbFZqWDBhZ2phMERUU2k2WEFKNCsrc3J0NFhvZVJmMERtRjMybzJlQmdI?=
 =?utf-8?B?TWhlLzJ5emgzaEp1Z0lwU2UvWGNjbWU3eUdHUTdvTWZwN3F0RmRlUDVlZnpy?=
 =?utf-8?B?bWxHMENEM3RsdmZwcWFSc1R5SnpiUWNuQ05YcGI5dGMvVGsvOHV5NU80T1dw?=
 =?utf-8?B?NElaZkZ6RkI0aHhQNFN6MmNOb09STUpkV2J6UXI2ME1wOFNXYnkzVDBnUWkz?=
 =?utf-8?B?WXphSjRwalF1UkNPZnFrS20ramxhbzNLaUxTUkM3NGdjNm9keXk5ckx5VlZa?=
 =?utf-8?B?NnpPeGJEamJvMk5UWnI5Ym80bHlkdUVOK0U2UUxxVTVPaXczMnFwcUlPWmpG?=
 =?utf-8?B?NFhPUnorTzVXRmpUN2F1cDRoUkZQb1Fqc1dKRFp5SVpmRk12MFNkRVQwUlhQ?=
 =?utf-8?B?SVlEL2E1NTloN3Nmb3ozdkp5QTNCL1BrOGY2TTJjQlZ5YXAyaHppR3BuTzNF?=
 =?utf-8?B?ejc0N0hGdkR4NE54WWtwYTRDRkh0Q0poREJMUDRYaWpLTU9yWWRYSmdxcGJJ?=
 =?utf-8?B?anZEb2l5OWZxVDFiSWVuaHE2UGJWQ0E5QUlQVWUrOTMyQU15M29yY1BIMkNX?=
 =?utf-8?B?VG01ZUlnNVdJeitBdDNGUWVTeTBVVVJvb1FBUlUvblFGeGRoMEZhV09nN1FT?=
 =?utf-8?B?MnNzc0FmeHZPMlNHTkRyVFNnMHJGQk1LK0hwVEVQYVIzYzd3K2ZwNE5FT0tV?=
 =?utf-8?Q?1SHyi/EUa8WJm7dn4Oy9X97ot?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e60cbc-7788-49d3-f96c-08dc4e34761f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 08:04:00.6602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MF7o5RhyMBJ8cZCkiUbxKOAzZN0t5kN+bPfQ08qBoFry1mb4oT1nTTn8TcAKscVcmR6/wm2PwpairifP+Km3IDsSmigIQAo37mIRtD4kOeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
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
b2dhbmRlckBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMi8yXSB0ZXN0cy9rbXNf
ZGlydHlmYjogRW5zdXJlIFBTUiBpcyBlbmFibGVkDQoNCkluIGNlcnRhaW4gY2FzZXMgUFNSIHN1
cHBvcnQgaXMgaW5mb3JtZWQsIGJ1dCBpdCBkb2Vzbid0IGdldCBlbmFibGVkIGR1ZSB0byBzb21l
IGxpbWl0YXRpb25zLiBUaGlzIGlzIGNhdXNpbmcgZmFpbHVyZXMgd2hpY2ggYXJlIGFjdHVhbGx5
IGp1c3QgZXhwZWN0ZWQgYmVoYXZpb3VyLiBGaXggdGhpcyBieSBjaGVja2luZyBQU1IgaXMgcmVh
bGx5IGVuYWJsZWQgYW5kIHNraXAgaW4gY2FzZSBpdCBpcyBub3QNCg0KQ2xvc2VzOiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzk3MzUNClNpZ25lZC1v
ZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KLS0tDQog
dGVzdHMvaW50ZWwva21zX2RpcnR5ZmIuYyB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2RpcnR5ZmIuYyBiL3Rlc3Rz
L2ludGVsL2ttc19kaXJ0eWZiLmMgaW5kZXggOWU0ODMyOTI5Li42MTIxNTk5ZWMgMTAwNjQ0DQot
LS0gYS90ZXN0cy9pbnRlbC9rbXNfZGlydHlmYi5jDQorKysgYi90ZXN0cy9pbnRlbC9rbXNfZGly
dHlmYi5jDQpAQCAtMTUxLDYgKzE1MSw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2ZlYXR1cmUoZGF0
YV90ICpkYXRhKQ0KIAkJCSAgICAgIkZCQyBzdGlsbCBkaXNhYmxlZFxuIik7DQogCQlicmVhazsN
CiAJY2FzZSBGRUFUVVJFX1BTUjoNCisJCWlndF9yZXF1aXJlKCFwc3JfZGlzYWJsZWRfY2hlY2so
ZGF0YS0+ZGVidWdmc19mZCkpOw0KIAkJaWd0X2Fzc2VydF9mKHBzcl93YWl0X2VudHJ5KGRhdGEt
PmRlYnVnZnNfZmQsIFBTUl9NT0RFXzEsIE5VTEwpLA0KIAkJCSAgICAgIlBTUiBzdGlsbCBkaXNh
YmxlZFxuIik7DQogCQlicmVhazsNCi0tDQoyLjM0LjENCg0K
