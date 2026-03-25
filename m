Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2077FEA834
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 08:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905DB10E7DE;
	Wed, 25 Mar 2026 08:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVZOI+j4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F4E10E824
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774428044; x=1805964044;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h3J5kaNAPXWlVPORqSseJPS90fv9omPgd0ZfBEuZ7Z0=;
 b=TVZOI+j4XAlN0ucGwBIXVdxlwA5CRfh5inlRzPlD7ork9jukPFyE3ktO
 WGDZw8F4tAM3v7c68ekiaM8dDzrhPdVILmwNP+S77jtkEotagltyRdjOm
 7NrNxoh1xS7J3/o5b9/nIyLWA1OwfGZSD9mf8U/MrPEQcklwz1KnU0sQp
 xoyk/FAzCD5jz+Lr/ZiaPKFPwffdvAFfzLgRv7RyopKVivTpw32IhK5rN
 OThA58Si5TsfQjCPqnLNVq4p/kAWrjkH/aAQmPhY2s39lUr+kGHfgtobI
 7T99+ScUv0nHto+bpAZBEw5pVh90mXU769J/c1fuiBcMP/8nXkbXFdHuN g==;
X-CSE-ConnectionGUID: Xg6SMHO7T3WsTGYIH/ISEA==
X-CSE-MsgGUID: ATYurOsyTmuSrlhsyaEvkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74639389"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="74639389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 01:40:43 -0700
X-CSE-ConnectionGUID: 0lk0rO7DQPW6t6iS+GxsBw==
X-CSE-MsgGUID: 7B2NHE+mRlmlY/rfOtZGVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221724344"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 01:40:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 01:40:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 01:40:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 01:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEudjFhtDvPRZOh5UPqOt7mMc51WIqYzVakd24Zl8KHJsbYNLNXMFOTwMiBlqm3FbPh2jQtd+EnOOfwweLawUfb7uCaHseY5fHJ/lGL7F5PUiHNsv9/qjDpmwVND1tNR5jHnV1o2wBM4XI0RWjNhE0VTMsHsvgmu13SCBoDSM2UV+O48GkbMOujdR7GiM3dApo5HNOiAgNaD7A0E6f07Dlmm/HkLRAop3kNRaFVd7/9Uwe7L0Wj73FvJKjkOtKR1z7W8grTRCoPN+JCzwYPTosPb91RIYXR7D03+2c8S68ITkX0eVYDPoY3Q2yjIDk9Hcmn755ja83rzWl2EDoGmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3J5kaNAPXWlVPORqSseJPS90fv9omPgd0ZfBEuZ7Z0=;
 b=K+jskfJjm+a4x2ylX5ugVTXp2bTTNV/L3iRsjJuuofttqg9kqieQkIyG6DUmIA+zIizffhRdB0bhPekzOTNzYSshhBJgGF5OyB/8VSK5WJ7l4W/L7xHvYV5NjyhYhQnBlCxXrzPcNb2vYX6jBKUxU6Ie3UKrU7ssDuzV8qgWa0J4j645lx6hnbWB8TQFVv4T4NEep4aVaqe73YI2R0fLYul3qajAvZKnA5QKnu/Lgj1J8tF9X5AF6SCv3HKB+OHEjZneWgR3QQ3vE72Emv3oBNG5OdrMUEMxkWtRipZ/xwxWRmDYhC0zAe7kdodw6U5an2Vqdnkb/k42aXtscDobfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Wed, 25 Mar
 2026 08:40:40 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 08:40:40 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_async_flips: Fix timestamp print format
Thread-Topic: [PATCH i-g-t v2] tests/kms_async_flips: Fix timestamp print
 format
Thread-Index: AQHcvCxKQ523STCGlUaHoNqH21lXX7W+4QKAgAALZeA=
Date: Wed, 25 Mar 2026 08:40:40 +0000
Message-ID: <PH7PR11MB605374E3D731386C7A907E14E749A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260324081729.91949-1-santhosh.reddy.guddati@intel.com>
 <20260325074923.103348-1-santhosh.reddy.guddati@intel.com>
 <6144947a-1555-4bfd-b224-7048d1cbca66@intel.com>
In-Reply-To: <6144947a-1555-4bfd-b224-7048d1cbca66@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA3PR11MB9376:EE_
x-ms-office365-filtering-correlation-id: 786874b6-20e5-47c9-d252-08de8a4a3204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|7053199007|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: shR56Ha/D4oiH98uEmnLGVywHR3eWf7Ms0jm8X6NW56dOn6HeBujxTPzZUuyMofjnoGgY/TluKAsq3Swk5O5pra2tLBP0BzGojrN5neMmNnpPtSThsgJF32cQfOQEB4XVxbRm8ghcojK6dWmcmjfSXYSk+DJfxi+7uvHme/4BvY18uDO9k9EYYdSnNhti03gKmteNCC7wXNcped7FsADBKntMn3skgGa31XSEP2FBSfbalDZ9SofaJtzUtT0fD+MG1h3NCzDPhBRjvMvKFgPjM4Rmm0DFcEf91qEfVyQfiulNN4tNm+JoZMCYex6Mxi+vS01LIMQ2pV14b7qWSbUyG58weAV0QIXDwYj/OSphRD1p+pv5wFAJTOuYD6HuU6nRiL25eyA2D3HSajQJvbLkh9VJ+irck0Loued6fnwEKWcyCHZdevXPhAVplJZ3hbMZBHZcvH6Hvy3PvpYL8ISFDQmAj5sDx8QT0Ot+BXF+CDlzESaEArHWC+K6fwfl5BF1JAMXRhoUxTS9+kFmQ/KCFedOdrmYpoNraksK0wgs4+3Jylan3m/LGgM8IhFkdqJ+fH8AtXDLPcxAr3jEMUQsz/EvrhUDQuLIhAR1+CTXGsF7uY+EUrgWNJBgPrBBD8z/iqUZUds1zl6vxC9QHq/+3fJcFa28BJTAK3iPz77Z30AJkyoa/BYf3uLqjTObIsf9/asSVy6DZydQRaHAcyrrKR0lP0mqODJBprg7EVPn6s9ROng2bkxaXeq5ssB7RePAbMO9tNuEuhHh+t2rLhmSflJ5oZucOPos3CakA8uBeQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(7053199007)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3RhUys4SDdTc1hKeEYrYVVWcU9oNGhtK3Y0RTA4SUU2N0xySk05OS9yMUhk?=
 =?utf-8?B?Q0dvNjUxTHJmY0QxcjZXU2RTeTByMGhFR3pkNHM3d0NqUnptcU0xb01mT2VR?=
 =?utf-8?B?NndpQmRuZkEwWUJXN3M4RERJQjJjbUdhbXBZai9RVEt2a3c1bTFFN2RzQ2dL?=
 =?utf-8?B?THlBYVRzWWpldDdsNEQ5L1FKT3dCeTAvVWt5cVpJbHU1UFFjdzI3eGEwTnBR?=
 =?utf-8?B?UWxRTnRqSncrdngzV1BiQTNEcHMvV3hsMCtLZENheWhkOWpGM0RjM09xblNm?=
 =?utf-8?B?YmlCMURqQmFCY21tQ3JOQ0M4ak0wZnFTazBtZmNFeExSTFRzdXg2MHBhYlNv?=
 =?utf-8?B?TGhSdmJWUU1RK0tJZFdBdDR5S0hJekkwWWJaeFBydmlRMjltNHJEUTZLZm1B?=
 =?utf-8?B?RnBJUWtmdkZjN2VtRDBaWVVNT2RzSVp4WmR4T25LVnlGU3dFL1IyZWpwaVhN?=
 =?utf-8?B?Ynk4TnBQK3JGeWdlUzZPVTFtK1FlRTNyZWkvdU1RV3BKbHJPeHZnNlNocEw5?=
 =?utf-8?B?Y0VzdE90RUFla0EyVUJySG0ydTc5ZEh2VVJKR0NtaWhYMi82UEhpcVhncXY1?=
 =?utf-8?B?Y0dXSnFGL0VVZkovaTkvTVVOaUJ3YVZSREhGWkY3dXJtQllsbkNid1BUd1lH?=
 =?utf-8?B?T3lkeHUwaU5RR2hGdytlT0hpaXlhM1JZY1Nkc3J6TkZ4b2xlQXR6YjhEZkhj?=
 =?utf-8?B?YlNISU14YXZER21oNUdnUUN5aFYzemYxOVFxaUJId2FXZjhNdVp1Y21JQmt4?=
 =?utf-8?B?L2R0MjM2OXVOdGVYLzJOc2pQblA0OCtwR0RaR1B6b3o0ck1FMERTR3lVY2ZT?=
 =?utf-8?B?eW1QWGRKaEMzTHErY3V2YjJjbHJncUQ3dmZxQmhIa2l0QmdJb0cvdUthZlQ2?=
 =?utf-8?B?TDVtb0hUY2VSYlBHdGwvRXpuZDZobzRqbnFxR3ZEbFdoN0NyZDk4NVBjM0RZ?=
 =?utf-8?B?UjVFN1BiMXFkcDJWMUlvQ0ZqMmUxbjlIY3RGSGVNRFJXSzNnVFFRVnhsNGVs?=
 =?utf-8?B?VmEzakZSOU51Ni9RZloxbDNoM1N6R1NsZkdpNURRM3JMVzlSSmlLVDRndDV2?=
 =?utf-8?B?MDdxR1pKMXNjOVZLanFqN08yendINjNyWkxqRnZlcko4dnlrRTRiZHRBMEcy?=
 =?utf-8?B?MktBTmdzTTBsVHdCRTBSc1BTTVlXOGM1TUZTdkZUS1kyOG5RYzZiQ0lrRmZB?=
 =?utf-8?B?NWZNN0swajdJaXBYdk1pVitvWmduZ2FVMTE2cUtxMVlvWHNnTThRbjFFaUZW?=
 =?utf-8?B?U0RnbGhOUUpmMWtJbHNBbjRDd2xsUThiMGJ1QlpnUU1sUkMxZDcvLzBGTzhI?=
 =?utf-8?B?WWlrSU5pdEUvdEtobFc0WjBoaXJqRXR5NmZzRkhyTGc3SE9icUhwb0lDUllE?=
 =?utf-8?B?NmxWVHlLc0U1TjJqOEU1RCtxRGJUeVQzaG5sTmZaQ2JKVzlvU0hlMmg4dCtI?=
 =?utf-8?B?bVRZc0pWcGV6SkZlM3ZEL3Bqem4wSm1qaGVMRkdzU1luNHR6ZkZEQzZkbnJm?=
 =?utf-8?B?V1hmVVJaemRjYUx1ZEkvQUl1M3FCSk12dDVMd25PaCtTb0dmMjJWMEVXS2c0?=
 =?utf-8?B?WXIzR3ljTTQrZGlyTHpOcG84dzhrMjNsS0RtOThzMWVUQWdqWGxFVXo1dk0y?=
 =?utf-8?B?T01pdEZDTUZRYityc1I1ZXp2NzhMRHlybW1KemFxZVZJZDBJUzFJK01sY3Fo?=
 =?utf-8?B?VjFKcThHTFBDa2dUbmZOOWtkNEpKd2R4WmdJbUxQaXRxN1FvUG5pY2piYVRa?=
 =?utf-8?B?VmNyK09uM2M1NjVzTzFHbVp5YlQ3NGNyV2JWd1J0eVQ0U28yZWhhYWliejVH?=
 =?utf-8?B?QjBmZzU1Y1ZMeEFuZUVxVGQ0Qy95TjBVMjBiWGF4Z3BNNmNROVhhRmlaaXZq?=
 =?utf-8?B?Q0ZzUlBvbmpSZUVVZG1ocDlKL0NmanBTcFdTcDdOSENCYTJYSEtOcVA2YUx3?=
 =?utf-8?B?WW1GYm9xL2NSaVBsdkxxNlVJUkx1WkNqZ1JLWFNSa0tYOWJFMWJXamwvTldY?=
 =?utf-8?B?NE9tcTRjbS9JVXVZWXpuQVRMK1RuRSs2ZCtYWUlaaCtZN1plTnE3YzRVMUta?=
 =?utf-8?B?NlIwYmJnV2J5L0Uxb3cwK1VMNVRITE8vcktvN3V1SzNCU3FGeDdyMHVxNkU1?=
 =?utf-8?B?TWltUXEzakZ1UFBGMm9JeSt6ckNJQ2xlNm9jOVRKNXJObG1pZkxPckdlK1hT?=
 =?utf-8?B?QWxXZ0llQUMrUCtuU28wVDlIYk5OdElQZy9HZTJESUk4YWJkeE5xdjQ4QThk?=
 =?utf-8?B?S1NhOFd6bG9IbGNsK3pzT3B0NXZ3L3JRQ3A0Q210ZUdIcTFBQi95bkRwM3Za?=
 =?utf-8?B?czZOSEwrazF2TzgvZHNaelpyOVRaZ0F5b2lOMTVMUGZNQ3hqK1MwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oqAeVJ1j0EpA6PaG+Ywfe4qZiBaqtL2nXVwQt3OLMRGiPtE/tOEK2TY/V73AjMi4m/3W0kvTmgQCaNO21mmT8mqcm1z23ud68cjKvdRZ1JG5DmfsLjKjQjizxtqQUKVuW8uCi5xjBoT8wGhyLyaiZagjpBXYjmfckk18uPt8vntVpCq3kpQ7sn0iEDXl83drFe5ohg1T9iwyNO9KKp9sOtGyl4FQyRkzsPV8FEqzf5Otk5iudQsx2J/6Y1SuRy6IVbReRMR7ozvehEK/qVrLzpbHs4KPHSXKc/wXYfO1hYpikb7oh3XRhYAuCN6m8xG6jq0b1+YSkOjFaJ8WULSLJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786874b6-20e5-47c9-d252-08de8a4a3204
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 08:40:40.4182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24p2Bcz73V7VdH7nmQSW5fBbpKIR/GBjy2xO2GdZNl6kfBfHVSAD6EwjhroHhwILyP3r+k3Tr9BQFmRBB9UWTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
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

SGkgU2FudGhvc2gsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmVk
ZHkgR3VkZGF0aSwgU2FudGhvc2ggPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0K
PiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDI1LCAyMDI2IDE6MjUgUE0NCj4gVG86IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCIFMsIEthcnRoaWsgPGthcnRoaWsuYi5zQGlu
dGVsLmNvbT47IFNhbWFsYSwgUHJhbmF5DQo+IDxwcmFuYXkuc2FtYWxhQGludGVsLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2Ml0gdGVzdHMva21zX2FzeW5jX2ZsaXBzOiBGaXgg
dGltZXN0YW1wIHByaW50DQo+IGZvcm1hdA0KPiANCj4gSGkgUHJhbmF5LA0KPiANCj4gT24gMjUt
MDMtMjAyNiAxMzoxOSwgU2FudGhvc2ggUmVkZHkgR3VkZGF0aSB3cm90ZToNCj4gPiBVcGRhdGUg
dGltZXN0YW1wIHByaW50IHRvIHVzZSB1bnNpZ25lZCBmb3JtYXQgc3BlY2lmaWVycy4NCj4gPiBD
aGFuZ2UgZnJvbSAlbGQgdG8gJWx1Lg0KPiA+DQo+ID4gVGhpcyBjaGFuZ2VzIGZpeCB0aGUgYmVs
b3cgd3JvbmcgbG9nIGZvcm1hdHRpbmcuDQo+IA0KPiBNaXNzZWQgdG8gdXBkYXRlIHRoZSBjb21t
aXQgbWVzc2FnZSBhZnRlciByZW1vdmluZyB0aGUgbG9nLiB0aGlzICJiZWxvdyINCj4gd2lsbCBi
ZSByZW1vdmVkIGR1cmluZyBtZXJnZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IFNhbnRob3NoDQo+ID4N
Cj4gPiB2MjogRml4IGNvc21ldGljIGNoYW5nZXMuIChQcmFuYXkpDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBTYW50aG9zaCBSZWRkeSBHdWRkYXRpDQo+ID4gPHNhbnRob3NoLnJlZGR5Lmd1ZGRh
dGlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgfCA1
ICsrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jIGIvdGVz
dHMva21zX2FzeW5jX2ZsaXBzLmMgaW5kZXgNCj4gPiA0YTI5MzA5NjguLjMwNWJkNTE5MCAxMDA2
NDQNCj4gPiAtLS0gYS90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYw0KPiA+ICsrKyBiL3Rlc3RzL2tt
c19hc3luY19mbGlwcy5jDQo+ID4gQEAgLTU5OSw5ICs1OTksMTAgQEAgc3RhdGljIHZvaWQgdGVz
dF90aW1lc3RhbXAoZGF0YV90ICpkYXRhKQ0KPiA+ICAgCS8qIFRPRE86IE1ha2UgY2hhbmdlcyB0
byBkbyBhcyBtYW55IGZsaXBzIGFzIHBvc3NiaWxlIGJldHdlZW4gdHdvDQoNCldoaWxlIGVkaXRp
bmcgdGhlIGNvbW1pdCBtZXNzYWdlLCBhbHNvIGVkaXQgdGhpcyB0eXBvLg0KKnBvc3NpYmxlDQoN
CkFwYXJ0IGZyb20gdGhlc2UsIGNoYW5nZXMgTEdUTS4NClJldmlld2VkLWJ5OiBQcmFuYXkgU2Ft
YWxhIDxwcmFuYXkuc2FtYWxhQGludGVsLmNvbT4NCg0KPiA+IHZibGFua3MgKi8NCj4gPg0KPiA+
ICAgCWlndF9hc3NlcnRfZihzZXExID09IHNlcSArIDEsDQo+ID4gLQkJICAgICAiVmJsYW5rIHNl
cXVlbmNlIGlzIGV4cGVjdGVkIHRvIGJlIGluY3JlbWVudGVkIGJ5DQo+IG9uZSglZCAhPSAoJWQg
KyAxKVxuIiwgc2VxMSwgc2VxKTsNCj4gPiArCQkgICAgICJWYmxhbmsgc2VxdWVuY2UgaXMgZXhw
ZWN0ZWQgdG8gYmUgaW5jcmVtZW50ZWQgYnkNCj4gb25lKCV1ICE9ICgldSArIDEpXG4iLA0KPiA+
ICsJCSAgICAgc2VxMSwgc2VxKTsNCj4gPg0KPiA+IC0JaWd0X2luZm8oInZibDFfdGltZXN0YW1w
ID0gJWxkdXNcbmZsaXBfdGltZXN0YW1wID0NCj4gJWxkdXNcbnZibDJfdGltZXN0YW1wID0gJWxk
dXNcbiIsDQo+ID4gKwlpZ3RfaW5mbygidmJsMV90aW1lc3RhbXAgPSAlbHUgdXNcbmZsaXBfdGlt
ZXN0YW1wID0gJWx1DQo+ID4gK3VzXG52YmwyX3RpbWVzdGFtcCA9ICVsdSB1c1xuIiwNCj4gPiAg
IAkJIHZibF90aW1lLCBkYXRhLT5mbGlwX3RpbWVzdGFtcF91cywgdmJsX3RpbWUxKTsNCj4gPg0K
PiA+ICAgCWlndF9hc3NlcnRfZih2YmxfdGltZSA8PSBkYXRhLT5mbGlwX3RpbWVzdGFtcF91cyAm
JiB2YmxfdGltZTEgPg0KPiA+IGRhdGEtPmZsaXBfdGltZXN0YW1wX3VzLA0KDQo=
