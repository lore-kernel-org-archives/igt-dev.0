Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA0DE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 09:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F0010EF52;
	Fri, 20 Dec 2024 09:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5g7mRCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D2210EF67
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734688441; x=1766224441;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CZSIt5zvYSDpII59vsXsXuYpqweO1GPu2bu3qoaXTTQ=;
 b=I5g7mRCYPBuHRQQdqfoXwcojwRIsmcsaIVal8HKbechzj0BdtMsFpDYe
 6YR7pbdpbIdoAVh0Sv5YmoJLNJFxsSrylR9jN8wcUlqSec3twDPgjrxeb
 I78C31k8q5tmtg3c519tbKf48MNTCUwoXUkzs48kES4GqFnJ8Zinz226n
 ydHZF2BqPCKpYK2HjXK/NEYvnuwqhH5xmpjVCa6Ey8UxJTF0AJuRvU9C9
 UWu4YwW+TKewScmqB8bJUNVy7AUU2gZodesk8TmqXrCAJQXQWJNf8+XaK
 5RHMXkJdHvraHtgnwywpG6rW3R284XrBi1/1jjLOGHP9b+11gMiUsnbSZ w==;
X-CSE-ConnectionGUID: qd/ad0P6RV+iXjz6CwhZ9w==
X-CSE-MsgGUID: ZJoJf7XhTLuGH3sQ8rYogA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34554497"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="34554497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 01:54:00 -0800
X-CSE-ConnectionGUID: AeEhOd6ySC6oA/Gf3pn55Q==
X-CSE-MsgGUID: 5tgrYrNASVGlY4RBW75d4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98259068"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 01:53:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 01:53:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 01:53:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 01:53:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GebExj5jcIv2TsP5ESOz6G6j/FqMmRCex2xyOSG5dp0TPpptcroW+LhDz1SdW3ntjflF+wNBMydxvmTBnGnoOWmQ846M/mbLUo33IlCK3GSlAzuFgDbp6bm4ZdtPe1NThiPGp22TwR4txNZ4XhHEtv1Xoa8mtzHWwohpZ003iSl73m4n9dj1CvnSjsdKyHLEuJZLTr4s7CNmEBQeEyfSpIVZBV3tessZ/32PlYeNGO18vxRx579fDw3IM/idSWbs0StBCecPjHwG4TlYAEs5QreL+9UsKmb5f8hQVfxXYai+bkl2H0Vq5JnSnCWP1NeW9K6sjchgcNMKoJayBOYinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZSIt5zvYSDpII59vsXsXuYpqweO1GPu2bu3qoaXTTQ=;
 b=JK/7t5E59g7syWhg5kwfbvu09euyK7i9sNrzpmi6GqizjBmL8Y4F2pGyQ2BWerxULCz0299wZPU2fSy7yjwOEhYBEJ+ifg+l4cZks4vITCMFQTThLRf5cUSRRGyj3RFYx/0oiiYpUbJ8dvuAY3nIbVNR0jND1/COqA6W0DEX95KC95NXrmXp7yWuVNB0Ke127Wsk9LdFhySptjAX6xSxiZ0egEZwT45KYWY1JBJnbAJb9NjNOw3tlBhrj8oYdhkN/08vdCTmo2cZzcoLLeCETr6yyYMmH8lAlUUH50yR/ePcHWIOWx0OwRt+iHYht+9apL9SiaqXhdG4sqCt+S/iHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 09:53:08 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 09:53:08 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v5 0/7] Initial PTL support
Thread-Topic: [PATCH i-g-t v5 0/7] Initial PTL support
Thread-Index: AQHbUZUIPq15tEcL/Ua4pIMDzdhd/bLu5Z7g
Date: Fri, 20 Dec 2024 09:53:08 +0000
Message-ID: <DM8PR11MB565572B56AC319039C8A6984E0072@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|IA1PR11MB8224:EE_
x-ms-office365-filtering-correlation-id: ab305d23-0c85-452a-1eb7-08dd20dc1bba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QTRLTGNYNXI1NW1DQUJiQ0p2aDFkYXhUS2JMQy8wdlFTUFBMcW5vZmNjbmds?=
 =?utf-8?B?bWV4UTBXc25yNVk3STRFbWIwK0F6UlVVeWs2TXFvdHg0RERURmltUE1NcXUr?=
 =?utf-8?B?OFlURGttSDR4VlpMZnh2a3NzVlB1YkVKZzR4eEhKK01QMW44SjM1dWpLczly?=
 =?utf-8?B?dFBER2lGMnVIcVM2TzNpYW1maWVNckZWcnYxMyt5YjF1NFZtNFdkOFpXRnNk?=
 =?utf-8?B?OEM1ajNFbnl6a1JjY3JiL2tDdU85c0hZOGhCbHpGQ0ZIOFhWZWhFZ24zOFlh?=
 =?utf-8?B?V28zZGdXRUlZWnRIVmtLUkY1OEJXRm05c1VFbTAvZ1NaTHpqeEdpa05BOGhZ?=
 =?utf-8?B?M3JuN3pKUXFXejAybi9HaTRkNGRiT1RoUmtUbXNQT3djTEhIMEkzQi8xK0JI?=
 =?utf-8?B?MjFMOElvN2ZSNjlydXR3K1JsQkUyT2ROT0hvVEN5ZWlleXEyL1doM2EyYkRl?=
 =?utf-8?B?M01tVDVZUFZkckt2b001UlVxWURlVjhyaG1mR0o2ZkcwS3N0N2ppT1F0SUQ5?=
 =?utf-8?B?bXpRckY1dFpNYWs1ZXN4aVhIeWE4aFB3bHlLVEI0Vnd2amhYa3FTTmNmNTZo?=
 =?utf-8?B?cjZvYVJuWUw4YmxVazRCUXMvY3JiZnFEVG0vY0lML01VcUxMUW1PZWpyWS9p?=
 =?utf-8?B?aHZ4WHhGMkF0WXpBMlpwNEl5cmpEdEZISDZIRkFHWXZ2YUR1ZncraklUeVgr?=
 =?utf-8?B?NUpKNU5aZ28zVnhCRDRBNTB4Nzg2ODlnc1BOYm9JVUw0emVCWHdTOUcwSFBH?=
 =?utf-8?B?dEMzR2FxTDNVc2FhZUZXR0JTTk9uZnFJclR5TDZETENhU2VzTXhXOTFWQW9o?=
 =?utf-8?B?TnJBZlZ1YVVvSzcvcHRxbWRXM2xCdlhBblBMWHRiMDNGM09rRi9nU3VsVTY1?=
 =?utf-8?B?cDQwRjhXMlA1eW5HSm4wYzhLNUNDT1JQc1VPU3phV0JEQ0U4TURXbmhpYjg2?=
 =?utf-8?B?eVk2MGtUZGFMUzFOV21ibWJiQmw5VmxiTk8rV3c3WFArZVFReTk4amRzN1N5?=
 =?utf-8?B?S3dDakZWM05hSGo2aVVhZGR1VVFxZmsvM1lZVVBBR2JSTS96UjBBWURCejNL?=
 =?utf-8?B?MHErajVXc2xJam9naEZ5VWFBUzhYanZSQUovdDVnTVN6OVY1RFVmRGhrZnlR?=
 =?utf-8?B?ZWFUNExSQTMxNjdybVZLZWZiSHJBc1lZL09UY2F4V3dDN3BSZ1hsajg4YVBa?=
 =?utf-8?B?TElXL3k1SXp4aGNUQmhCZm94YWpPNkw0b2FqMStleDJ2Yk42S25NMFY3QURG?=
 =?utf-8?B?UVdRSUoydTdIRnR0ekw0K3kvMW44VDhiVmhTTytyOFBLazRpZ1I0VVJSbjls?=
 =?utf-8?B?MGl0ckxlSUpkVzhwWG5uMUJoVlZXcThINVphU2pDb1puQm93M1VzN3RJUnF0?=
 =?utf-8?B?WGpoK2FhQnJ4YUNJUnRxamVqeUJMWGlMcWRwMGxEMEwyWjhSZjBHdU53TEc2?=
 =?utf-8?B?cS8yNG0xcUgrdkZ1TE54alhMSWpZRk9BYUo1c28vTUxlQjhodnZjUFBNWlI2?=
 =?utf-8?B?bERoa2pRMFE2VmNjMFdNdlJWcVJtQjBDSXoxZ2Q0SGtYNmhXQVlMN2ViamxM?=
 =?utf-8?B?cEppcFdXSzg4aHFqLzVESjQxS1FxakRIS0VEODZLa0dmUEFqajlac2RPQndJ?=
 =?utf-8?B?VENIVHBPQlplbFdtUmNxa2wwbXV3ZzdVOFpSWUsyMkhZSlNsRVRFdS9IUk9z?=
 =?utf-8?B?eW9wZGFHNy9EcjZ6bHpuZ0U1ZVM2Nm9FNHQ5TFgvWTJWbUdJNTBYTjM1NktX?=
 =?utf-8?B?UkhibWhZOGdDdTlPQk1mcnNsRXZCYmVsYzlQM0IzYlJzRG9tamM5aURLbXk4?=
 =?utf-8?B?dnU0aXhzTnN3am9yZjlWU2l6dGJ6czR4Ylp5Rm5tM0hTaXA0Uk91WFZSZllG?=
 =?utf-8?B?cm9xZEN1VVg4MndvQVNjU2k1U24zaWJIUExuZU9GdDRHU0pGV1BJazNNQ25x?=
 =?utf-8?Q?0GLDrtPFMD49f2OxOWWWxDIvXGtYF0yD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2FOaFlGS3ZuV0NRekFRWG1jMk1IVFhRTzZnODc3Q05ZazBOcmlFS3RDL0xM?=
 =?utf-8?B?U2tqaldvMmtocjBwTnQ2U2FlT3d1ZnVDcWFkQS9ZVUhna3liNlVCL1EvV1Qy?=
 =?utf-8?B?OW1XTzBUWEFXaXB5WWtmMlNBTFNoTm9SWkhMNmdiSEozQlFuUE9TTmpuclN6?=
 =?utf-8?B?SmFKdUZYMzhNTGFzb0FPUmZxSGNkRGpZK2x4MG5uT1hrTVZHbUFIR2VpRFJZ?=
 =?utf-8?B?QlJIWWFLZGtqYUFlM0NVcDRCdjlUcklqWi9NTUFJZ0kzbTUxMW1XWmptMnA5?=
 =?utf-8?B?UUlkRlJ0NFhaRFdKRVN2dHJjL0JBQ0xlTy9FM2xiOHJFSHZLWXBUcXpCZWlq?=
 =?utf-8?B?dzhmNUd4OTFqZ0pEaXk1NFFNOHRpc2M2NUtoemR4Qit0SWc4QkY0blJLZlRX?=
 =?utf-8?B?WTBpd3NtbFl0bHBuSk9FdHovTE1DR21XNllBZVVwa3BHZWlySEdLSkpJWFNs?=
 =?utf-8?B?YXcxSWJZODlxT2U4YTVMbEJQNE13WkY5YzJGUFQ3R1BkOElKVDFyb0puRFdk?=
 =?utf-8?B?S1R0WnNqOUVlc0tMSlRxM2xqRnVIb29kYWZ6SDZMQ2x2SU5QQzhYbVVoejhI?=
 =?utf-8?B?NjMvS0xCcnVBWjZHVjJWMms4dzFRa3BDMHE2WFh2NzJ5OHpGbjJ0aEJyOGNR?=
 =?utf-8?B?cllUL1hYWmN3bVV2R3ZMVGNHdjdUUWttZmxObDRqLzV3RWwzRDhtZFU3WVJF?=
 =?utf-8?B?dWsyeDJBWUZtQVM3cG9nTE5VeW1mR0kyTFR2OXdFS2p3ZkF1TVRSSXVDMVly?=
 =?utf-8?B?bDlRVFY4NUQ4dTJFejhOMTNxaEhNMzZKaHlUMURGTmFXcmdrWmI5UTJQLzlT?=
 =?utf-8?B?TCtSTUNBMW5IcllWRndHV0ZKYVZYRlpLQ0oybWNxZ2xzUmk2Wit0VE5ISlkw?=
 =?utf-8?B?MUlMcmNOYXlxYTVKVVpHeXRTNGFJd081S0FDdkRjeTBVN2FzWEZ2STNjSEta?=
 =?utf-8?B?eFJleCtXT0FHSVhDR3pnT01Md3d4akVPWHE3K1VzR1ozYVpxZHFwaUhwUE5J?=
 =?utf-8?B?ZEJtcWRpUmgyLzducFNEU3pBcFVXN2txYUxQdlI1OGVKb28zdEZGdGdaLzdB?=
 =?utf-8?B?cldOUXZVWDlFSmMvTE1lb2trSUluS243eXpBK0tyTEpTejhlbkhPZVVsSHUx?=
 =?utf-8?B?akpjRWhSVjh2SUZNQWhBSERueTFTZTNHK2puQnFRQVRqVTZiRW9wZlQ4UWg4?=
 =?utf-8?B?d20xSHFFVksvRW1uUHRQeSsvRmszeFNtWjcwL2RFaDdyYkJ5L01mSmN2cmE2?=
 =?utf-8?B?dm9CM0w4Q3dCVE95K1ZQOGREcGQvbU01ZW9LN1BNdWRBWmVyT3ZlK2xyd3JR?=
 =?utf-8?B?Y3lJdDd0TFJKQWd6bkVvdlUxY1ROTUtHZWF0bXpqZkkvSWNnNEI5TVE4UmhW?=
 =?utf-8?B?cVhXdk9CMmNXNFg5VEc1OGI0cFkzQjVEMEhLWW1WL01DYmFDSmdySU5Wd3gx?=
 =?utf-8?B?S3NjU3hmTlBnNFNKQ3R3QTJYYVhWTTdldE12YXFKMXovYjlkMU9ab2dKa0Fk?=
 =?utf-8?B?RHJXaVVtNDN3NCt2Vm9aandIazRmYXVzdndxdmlvYXhDejBMYUNhTkxQalpx?=
 =?utf-8?B?V3dGQ0tQVlcvRERtc3c2UXpFdWcrVHlVVkQxM2h3TldkUVI3dFVZQXRuVGJB?=
 =?utf-8?B?V2xUQmxuM3JQdjNnenYrTjFudi8weDNGVHdpbGVUaVVZN09zMzY3ZmZyTUZY?=
 =?utf-8?B?cmRPNEFpUWUrV1dzRHdxb0ZZemdyNHZNRFp0TE1vSzdBVDF2UXkzMklJakxF?=
 =?utf-8?B?dFM3UzY0cThHOWpvT05nVzZaZno2NVlqTVNLN2JqalZaRW5vWFRWZ0JuRWl5?=
 =?utf-8?B?K0hydFZROHZMSHN0T2F6Zzl4QTNrWHlDWkZKMitlSFZOck5SVXhNbURVb2pz?=
 =?utf-8?B?aWFSN3RVTUtJUjdyeG15dytwSkVwblRvOXBYeUNwdUw3YzQ1TklOemNEcHpN?=
 =?utf-8?B?YjBSYnZHdE5LL0JnaGFTV0w2bzN1a2hISkcrdVRpMS9tUVNGUzlKNkptOGs2?=
 =?utf-8?B?NHVNQzEyZ0pyRm8zSkVjRi8ySk9qMEdNWkx0Qkl0Y2NvdzgwYkFSdzdGdlpu?=
 =?utf-8?B?Z1VJVm5qeUxZbUxOSGw4MUUzejZnUGdKRXd4VnRXUjQ1UUR4ejhkT1IwT25H?=
 =?utf-8?Q?6aAzCiIlB1ZsASplKFQJNLf3K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab305d23-0c85-452a-1eb7-08dd20dc1bba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 09:53:08.6379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pieBGFo+k8gAkdofJdiPKCkjBVp654cY1W89DGjVaF9ud3Vj3sGhO3Q+i2uDAt2fc6O36ZQNNEV3Kfoxgaps9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2xpbnQNCj4g
VGF5bG9yDQo+IFNlbnQ6IFdlZG5lc2RheSwgMTggRGVjZW1iZXIgMjAyNCAyMy4zNw0KPiBUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIGktZy10IHY1
IDAvN10gSW5pdGlhbCBQVEwgc3VwcG9ydA0KPiANCj4gSW5pdGlhbCBzZXQgb2YgcGF0Y2hlcyB0
byBlbmFibGUgdGVzdGluZyBQYW50aGVybGFrZS4NCj4gDQo+IEp1aGEtcGVra2EgSGVpa2tpbGEg
KDQpOg0KPiAgIHRlc3RzL2ttc19hZGRmYl9iYXNpYzogZml4IHgtdGlsZWQgdGVzdHMgZm9yIGNh
c2Ugd2hlbiB0aGVyZSBpcyBubw0KPiAgICAgeC10aWxlDQo+ICAgdGVzdHMvaW50ZWwva21zX2Ry
YXdfY3JjOiBmaXggeC10aWxlZCB0ZXN0cyBmb3IgY2FzZSB3aGVuIHRoZXJlIGlzIG5vDQo+ICAg
ICB4LXRpbGUNCj4gICB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeTogZmxpcF92c19jdXJzb3JfYnVz
eV9jcmMgd2FzIHJlcXVpcmluZyBhbnkNCj4gICAgIGRyaXZlciBidXQgdXNlZCBpbnRlbCB4LXRp
bGUNCj4gICB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmc6IGZpeCB4LXRpbGVk
IHRlc3RzIGZvciBjYXNlIHdoZW4NCj4gICAgIHRoZXJlIGlzIG5vIHgtdGlsZQ0KVGVzdGVkIGxv
Y2FsbHkgb24gUFRMIGFuZCBzZWVtcyB0byB3b3JrIGFuZCBnZXR0aW5nIEJBVCBsaXN0IGdvaW5n
IHRocm91Z2ggZmluZSB3aXRoIHNvbWUga25vd24gaXNzdWVzLiANCldpdGggdGhhdDogDQpUZXN0
ZWQtQnk6IEphbmkgU2FhcmluZW4gPGphbmkuc2FhcmluZW5AaW50ZWwuY29tPg0KDQpTb21lb25l
IGZyb20gb3VyIGRpc3BsYXkgc2lkZSBjb3VsZCBhbHNvIGFjayBjaGFuZ2VzLiANCg0KQnIsDQpK
YW5pDQo+IA0KPiBNYXR0IEF0d29vZCAoMSk6DQo+ICAgbGliL2ludGVsX2NoaXBzZXQ6IGFkZCBw
YW50aGVybGFrZSBkZWZpbml0aW9uIGFuZCBzdXBwb3J0DQo+IA0KPiBNYXR0aGV3IEF1bGQgKDIp
Og0KPiAgIGxpYi9pbnRlbF9wYXQ6IGV4dGVuZCBmb3IgeGUzDQo+ICAgdGVzdHMvaW50ZWwveGVf
cGF0OiBleHRlbmQgZm9yIHhlMw0KPiANCj4gIGxpYi9pbnRlbF9jaGlwc2V0LmggICAgICAgICAg
ICAgICAgICAgIHwgIDIgKysNCj4gIGxpYi9pbnRlbF9kZXZpY2VfaW5mby5jICAgICAgICAgICAg
ICAgIHwgMTMgKysrKysrKysrKysrKw0KPiAgbGliL2ludGVsX3BhdC5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMyArKy0NCj4gIHRlc3RzL2ludGVsL2ttc19kcmF3X2NyYy5jICAgICAgICAg
ICAgIHwgIDYgKysrKy0tDQo+ICB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
YyB8IDIwICsrKysrKysrKysrKysrKystLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9wYXQuYyAgICAg
ICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4gIHRlc3RzL2ttc19hZGRmYl9iYXNpYy5jICAgICAg
ICAgICAgICAgIHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgdGVzdHMva21zX2N1cnNv
cl9sZWdhY3kuYyAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgOCBmaWxlcyBjaGFuZ2VkLCA1MiBp
bnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
