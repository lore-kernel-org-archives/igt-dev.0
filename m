Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8593BD6DDDC
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 07:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B13010E06D;
	Fri, 15 Nov 2024 07:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjamIPna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E9810E06D
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 07:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731655256; x=1763191256;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lMpCjItxmp9Ra7ygUsiVCqR5KidsLF3sjFS48O2nYAc=;
 b=mjamIPnaQcHH2JKqRxE6OYC5SruNxxJI1Zs4iJz9nceIAy00VsNDgqx5
 v6IX2y2TALfH65A/LpP2pujfpxeRnVXo3sWBp+W4D/yMOCgeAbQdagRfJ
 QsMs9rMTwDdJ9vRzX46t5ZyeOiYEbQEkjGLrFs9ZLeFf5HDZ0AVAtmv37
 eUuZxjfKrv0Db4IbXIGLDLEhGiHvDrRSGR5IZXc7gGCBS0aEKw5yrJnBh
 weh7d+/8Tz1TJUzz7ac/1lyFpRVbW0DKZmrbCoExj2/h23ZI1xw6dWJv0
 VIiAKum6GYkGDDlF6Gyepi/gAIAClU5DCTg2NZe+pcLeNSuaS/tV0XCUb g==;
X-CSE-ConnectionGUID: HfvmhgrvSZKigeCv6M5GSA==
X-CSE-MsgGUID: BZKTmD8ASAepuFsI+k81vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31495489"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31495489"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 23:20:33 -0800
X-CSE-ConnectionGUID: 1YfDVsxrRJuVB+Mkmso/4Q==
X-CSE-MsgGUID: qy5M+IgnR5GQMGqf1JAZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="111756987"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 23:20:31 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 23:20:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 23:20:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 23:20:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye4E4dO8B9Jym23fVWTrJvxSGRRB4ewSoBOUboEzSBjuJHLhdV+cI6IavYzZpzcPnI6YbLUoWnH2OXWVnxwMfyF3gHYu6Mw5U8chX5Slpmf1go3BBx4Smx+FsP+F/Cf05IzYaSlMOACG+xblZFWgXyHrBbLiQaYyHNeU4jafGzrVa42yd0oivw/CnE0mJ+K1i6SNEohkc2I1szmIFZwn+Bc9wkqrE6ea+AH8LK/rMt7zzqDC+fCIlwREbM1sb/AE1UKV6U++RlHvpY/BHypICCbUg+xbERXNqeaAzSFyL6MZFEdQZ5uFSXV5Zw2S+Ws+1AigEPksqHLGwknbpZN70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMpCjItxmp9Ra7ygUsiVCqR5KidsLF3sjFS48O2nYAc=;
 b=YUkl+gxpm3xSXErj101x8efT/h9//IUyhjy7bckSslAQH6DrS/HAe8kWg37c9cLr5xDTau3WtdUxIqiHNDu36UVDgbPrGcH8JqX4iVuR0Upx2F2n9MAlEAFaCPMspMumhtjdi5LAmo1T4GxSvIPR+hHNDfZB/RbEoFTsQfUrql9NgkJgQDTSh3Lh9/nhmNivGtjev13k/mD5JYBejAdGJDdHxU9hxQxhPgN+LoXnaiyoog/a5/SosMssWbsmyXkNgsIcwJ6iT5vEZJQHU/wEK3BpiWNcuwqQER/6VXMlLNZDUWpVpUAuBTT+u1Kr79kCM1680LMS5O7O70n9teZtNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.31; Fri, 15 Nov 2024 07:20:26 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 07:20:26 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_vrr: Set VRR_ENABLED property as false
 for non-VRR panel as well
Thread-Topic: [PATCH i-g-t] tests/kms_vrr: Set VRR_ENABLED property as false
 for non-VRR panel as well
Thread-Index: AQHbNoaLojVZGMADcUOpWJcqWD0H57K32/aAgAAUqoA=
Date: Fri, 15 Nov 2024 07:20:26 +0000
Message-ID: <7386f206597a71aa6df60684d034923eeb69fade.camel@intel.com>
References: <20241114111445.3249373-1-jouni.hogander@intel.com>
 <501659ef-b454-4670-a5ff-c8d855a63787@intel.com>
In-Reply-To: <501659ef-b454-4670-a5ff-c8d855a63787@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA0PR11MB7837:EE_
x-ms-office365-filtering-correlation-id: 01d5600a-6d74-46cc-9125-08dd0545fa54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZVAvLzhXM2I3STcrY2lrN2U2cHUwczhoME9wZDUvVm5XcDhnU0xiT0JEelNq?=
 =?utf-8?B?V2VPejFYVGtGRjhFallJVldjT2ZYMlJqMVU3M1c5Mmt5c0wrbFJrbThVVFM1?=
 =?utf-8?B?UkR2VzFkQk91T1lTWG1ZRUV6TGYraGhlMENtUlBwcmpSb3JrV2ZEYWgwR2N6?=
 =?utf-8?B?NXVCYUxodTVaY0FvMzJnelhWME1MbmU5UUY0d2pTYnZwUHJhSEFnb3pyaU9T?=
 =?utf-8?B?YWRzVSs5Y2F5eXAxbGh0WWVGaWhBNU5mV3lZTWM5cm14Vk4vVjdFVTFyVDI3?=
 =?utf-8?B?SnBzQmYwVzJQOVFISGM4RnlTVkd3dndpVlVPbWM5UXZGcEEwU2d3SUZONHl2?=
 =?utf-8?B?Q3lqQ1RJRlZSU3BSRWtKM3k3REtJdE9PdWppa3pUZFcyUDBFWmlHZ3BSSzFy?=
 =?utf-8?B?YUJMbDFUQ0JIQ09KTmVIdEpLUUNBN3NzeW10ckEreHlnR3JhWmprRjY1M0h5?=
 =?utf-8?B?T0tYSnBZdW9ndWwrcTFhcTVnd3drcmYrZ2pZWVZXVXQyUGVYTSt5UmEwU2NG?=
 =?utf-8?B?VHJac0RUR0xsazJDeHlOcUVEZEFISlBqdm1oSU85SmFXdzBrRzgyRmdhVTVK?=
 =?utf-8?B?RWYzQ2dVL3dVcnRKRmUyaEZYeThuQmNXOCt3S2sxaHg3UFVoRURQazlid1ZN?=
 =?utf-8?B?NXZSZURYR3VHakNEY3M1UFh0SlFZVzlHSFVSYXZJVHo5TmE1TDh3OEU0QnNU?=
 =?utf-8?B?dlN1cFFMKzJ0dWV6NVMxZVo4bGxWUnc2cms2MkdPbWZKLzRZK25BanFKOVNm?=
 =?utf-8?B?anVyVGZ0aHdyckYzcXZ2V2IxeXFsN1BXS21oSEI3cTZxQkFPUnJhZ3QzSjlj?=
 =?utf-8?B?MkpIOSs0d05Oa2tVVUZOUVgxS3pkZVVHWk83NG1lbzR1ZSt6bXdqY2FXS2M2?=
 =?utf-8?B?dXZyTTE5UUlFenRzR09GOGVtLzdPTk5odE9TUk9lMEZSeXhOSE1EM1JoditX?=
 =?utf-8?B?QTFWTnhyWUtYaGt3RzhyYi9GWVF6Qy91OVNzTjdDamY2enp2NFFpVDd3VlRa?=
 =?utf-8?B?cnFMelFLSm5mYVRTUU52dWFabmR5Wk1PS2wzUFRFREdkeGV3RzB5Q3JCWXg2?=
 =?utf-8?B?cjBQMmpZb1NrS3B5OHhWQWRlamxmT3Zmdkkvc1FnYjZSNDhXYVFZc1RFbW96?=
 =?utf-8?B?YStJMkwrYytpMFRkR2UwRmdwcVQ4YTB5MG1NMVM4d2VMV01hczlwa0ZGUzRv?=
 =?utf-8?B?SkRDdDZKRkdCalM0bldiRE5rM0ZnOEpzL3liWmp4N3ZIclViQi8wbEF6L1pj?=
 =?utf-8?B?TjF5TEZMMEVucmFOdHR5VFZFNjlJQzVyREdydVVlbmNEQ3BSNUZ6L25GQnl6?=
 =?utf-8?B?RmRRSmMvZUtvSHEvTUpqQWQvTXhjOXhqMUZQYlpabVYyaDhveEowUVM0STUz?=
 =?utf-8?B?WUZyWDBBKzlGRnc4QTk3aWJlRnpSbGlYcVVPeXIrWlk0emJhRlFnbmJBZjda?=
 =?utf-8?B?Y2lGTS9NTHZZRXo4OXVWclZzTThaZTNacXpiOVQ2M3BiU2xxL1lBQisvQlUr?=
 =?utf-8?B?N2JydWtERzN0VE0vQnBPdWVFZGtwVzltQW9zMjR4STNQWXhNNmFlR0xzTnRr?=
 =?utf-8?B?RlhEWEFaTm1UNEUrWWdnUkxnQ2pmUU9VQWJpZkx2OVZ4cCt6anNuUmJBVUZ0?=
 =?utf-8?B?M3JORHpVZ3BtL001UW9PbXExNGlwSFF0amhkemZxaGlGK3dTdkk2RmxBM0pm?=
 =?utf-8?B?U0NGVEt6RlF6VHRqdzBGOWsrZHdaRVVKS25ycHI0VmhCY0RXM0ZjS3RuM3JC?=
 =?utf-8?B?YWlsRFArNWt5TVE0cER1Zmk2M0d2Wnl6MjJSR2lYQVV2bklVVHIvdlltZmsx?=
 =?utf-8?Q?dVc+jC2Cm1uRTOIi6J06Lo6IzXk0AOPXrgnc4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXVBajQ1S3hKU1IwR0N4elVNLzdtKy9lZjJsRmcwVlZsTkkzSVlRVnBVdDVB?=
 =?utf-8?B?TWFMVkxuS0NvODRodTNlWkVJOFZkZGpXTlFYRE5WQnpZdFFvNmp0K1JHYXVI?=
 =?utf-8?B?WkpFK3pyclNQeHczT0NGTTV2MDNVTnEzbjVwbmVZQ0UrTTBncnZ4d245VGlM?=
 =?utf-8?B?MjcyWDZSMmI5YloyYmt5dktVZkdjNGw1NUsrR3F3MTN3TWxCbW95dDhMM0ww?=
 =?utf-8?B?VWpGVzM1YjNZR0QwNUxydERscS9qZjRVbXV5TlkwSENIT2VPMkt3aHl2bWVr?=
 =?utf-8?B?cDF4dzdhbVVmZ2gxMlYreTNmL2thZi9ZYXB5bGdySDRBL0hkT3Exa1Vhd2Mz?=
 =?utf-8?B?YnJjVXpibGlwalVlVkE2b1dBV3BZVFBjV01rU1oyS3dJRk1GSnJwOVN2WDgx?=
 =?utf-8?B?cFVsYlRmclJRMDc2dWo0MElkcU5Edm1mdWwyZXY3VEwrNktIbDFiVkhPZndj?=
 =?utf-8?B?aGdFWWV4dFlLR2RLaGIwSEkwclV5dnplS0VoTlM4emR2S2kvSXhDYUphY1F3?=
 =?utf-8?B?anBVTW8vUXN4ekR1T1kvVGhpQ3ZpTGhhWUkvM0VJMEV0VDh5VFF6SWphR2hS?=
 =?utf-8?B?eEwyWDVBZmthd3VxZmhpdnJ2ZTEra3VyZEVtUTlJRTJ3RzRKd0E2a0VZdEd0?=
 =?utf-8?B?T0k1WER2UCswelh3VWNLazYxTGRzRUVxZFgxOTVCbFZYWUM1VC9kV2s4K1pB?=
 =?utf-8?B?eG1nQkRJRmM0eURoZGxUb056UzBua3piRFRuMnQyalc0ZytVeGF6OTljMjN0?=
 =?utf-8?B?QVU4Q2tVWld5MzBNY0tHbURIbE5hWEh4RmV3VXN0NHZkT2FWVFJreVNMeU90?=
 =?utf-8?B?bC9WQ25oYWJjQ0JLcmlqbXFqdXJieXYyNmlFWUFJTEQxVDdER1hGZjl5U2U1?=
 =?utf-8?B?RWl3QWM1a2pKRnRJa1A4ZnRRbFRYMVEvSHhCdmpTdlFZYjI2ZXVzdWpSQmZI?=
 =?utf-8?B?YzJYQXpNR1pTTW9GRXFCR0tLVVI2YmluT3BWbnFVbnJ0bVFyOUorLzZVRldm?=
 =?utf-8?B?QzFGSEFVdXpIcmdhaXVibm14ZFc5SzNUT0hlTzg5K090Uy9ndHJGOE5idnRL?=
 =?utf-8?B?aHZEUHZ0NnlVZ3JpUjkxNnBIWitnYVF6cEVPVHdlb1NvRFRiZ0FXM2NCSnBz?=
 =?utf-8?B?OGRBN2VkSkh1M2dYeGNKMGduejZXVDd6TGM0aE5SdnJJcVJVUW41c3JWRnAx?=
 =?utf-8?B?RnZpd29iemNtbkIwWTkycHk5S2FoVHRadE5RRy9XWEM4dkp4d1pyUVpLeCth?=
 =?utf-8?B?cUVtQ0NpNjJlY3NCZmljU0xTMkZvdkZQMDlXMC9HR1ZqQVpaUjJMMTk5aGxK?=
 =?utf-8?B?RGE4WnVHNnlPMzlSZEJkZ0FDTjI2dWIvbzQxdzhOOG1ZdEl1dHdiV3RxMWVr?=
 =?utf-8?B?OHdKaDgxTjlpREgzL2t5OUdvQ1IzaEN0NG95NTFrT1RIaGoyN09oTE9OSTNW?=
 =?utf-8?B?REIzQ0FFNk0yUE1QQnZJTm5FeVRac0pJRWs2QytORjVScEJnM1BTTGpNOS93?=
 =?utf-8?B?Wi83MFBlckZDWHlXR0VmN1NJbjJ6Z1NWQXl4S21FTHlMYTFiK2lsUDdKRW9r?=
 =?utf-8?B?enZJaFdFZjlhTjlJaktNNVdsanh3RHJ2YTlNajdNVktOZXd6TDJlMVhOUmlu?=
 =?utf-8?B?eEExMWJ0RGgzaU9xL1lqMTZhUGwxZ3JFV1hKL2VDMTRlVENQWVQ3UzFOTWFR?=
 =?utf-8?B?eENTbGM1cUkwTW9XQVo0cnRGN3pYcjJXdmwwdXBJRWZWcjFyaGFwNlFUSVBL?=
 =?utf-8?B?R0dCRTdLNjh4eFdqUFo5UzdYZ3VQa1BlS1k2bkdiTVZUZVkvRWVtSlpzTVdw?=
 =?utf-8?B?VVVmYmFvSkhqZTNJZUs1S3ovR1dsejMrK1hwV0tPZWFNR0gvSGFLSE4xejFK?=
 =?utf-8?B?VXJQeGpnYUFqeC9tcWZuNG12NDVzWlFPRXZTbjhPSXNGbjZyZVNwSStoQkhl?=
 =?utf-8?B?NlhOaXl2bkUzN2I3TUd4bGplTG9BOWVQdlJORkVzQVRHaHdqaVhDdy8zOHBT?=
 =?utf-8?B?YW1ZSEEzT2pzREtTVnZ3NFRJcWtMNnR0QTVNZnNYOFd3d2lXWEFkUmZSam9Y?=
 =?utf-8?B?TjBtVCtBbHIzeHNPRmxrR2hmbE1KelIwaDZadW9zSzNhTWtpc3p4SGhMa3pn?=
 =?utf-8?B?UEhKR0sweGNaVVJhd2RGUzN3cCtCOFBZZWhXRDlQeFRFRGgyM094RWFQWHdH?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2FA68650B9B8E4FB5B9F683896587E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d5600a-6d74-46cc-9125-08dd0545fa54
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 07:20:26.6932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1WPpm51H7/Y8ZYh8FiIzxreVD3ImL5oIYEBoBpxhz+6OnOqxWbLlEGJclo9iBe9AnfA2CxGUBuhBagavqU1ROi2uk6WUljb/YPIKPAnpEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
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

T24gRnJpLCAyMDI0LTExLTE1IGF0IDExOjM2ICswNTMwLCBTaGFybWEsIFN3YXRpMiB3cm90ZToN
Cj4gSGkgSm91bmksDQo+IA0KPiBDYW4gd2UgYWRkIENsb3NlcyB0YWc/DQoNCkkgY291bGRuJ3Qg
ZmluZCByZWxhdGVkIHRpY2tldCBpbiBnaXRsYWIuDQoNCj4gDQo+IFJlc3QgTEdUTQ0KPiBSZXZp
ZXdlZC1ieTogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4NCg0KVGhhbmsg
eW91IFN3YXRpIGZvciBjaGVja2luZyBteSBwYXRjaC4gVGhpcyBpcyBub3cgcHVzaGVkIHRvIG1h
c3Rlci4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBPbiAxNC0xMS0yMDI0IDA0
OjQ0IHBtLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6DQo+ID4gQ3VycmVudGx5IHdlIGFyZSBmYWNp
bmcgcHJvYmxlbXMgd2l0aCBQU1IgdGVzdGNhc2VzIGFmdGVyIHJ1bm5pbmcNCj4gPiBuZWdhdGl2
ZS1iYXNpYyBzdWJ0ZXN0LiBUaGVzZSBhcmUgYmVjYXVzZSBWUlJfRU5BQkxFRCBwcm9wZXJ0eSBp
cw0KPiA+IGxlZnQNCj4gPiBlbmFibGVkIGJ5IG5lZ2F0aXZlLWJhc2ljIHN1YnRlc3QgYW5kIGhh
dmluZyBWUlIgZW5hYmxlZCBkaXNhYmxlcw0KPiA+IFBTUg0KPiA+IGN1cnJlbnRseS4gRml4IHRo
aXMgYnkgc2V0dGluZyB0aGUgcHJvcGVydHkgYXMgZmFsc2UgZm9yIG5vbi1WUlINCj4gPiBwYW5l
bCBhcw0KPiA+IHdlbGwuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVy
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqAgdGVzdHMva21zX3Zy
ci5jIHwgMyArLS0NCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc192cnIuYyBiL3Rlc3Rz
L2ttc192cnIuYw0KPiA+IGluZGV4IGQwZGI5NTRmYS4uODMwZmQ4YmE4IDEwMDY0NA0KPiA+IC0t
LSBhL3Rlc3RzL2ttc192cnIuYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc192cnIuYw0KPiA+IEBAIC04
NjIsOCArODYyLDcgQEAgdGVzdF9jbXJyKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHBpcGUsDQo+
ID4gaWd0X291dHB1dF90ICpvdXRwdXQsIHVpbnQzMl90IGZsYWdzKQ0KPiA+IMKgIA0KPiA+IMKg
IHN0YXRpYyB2b2lkIHRlc3RfY2xlYW51cChkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLA0K
PiA+IGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiA+IMKgIHsNCj4gPiAtwqDCoMKgwqDCoMKgwqBp
ZiAodnJyX2NhcGFibGUob3V0cHV0KSkNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWd0X3BpcGVfc2V0X3Byb3BfdmFsdWUoJmRhdGEtPmRpc3BsYXksIHBpcGUsDQo+ID4gSUdU
X0NSVENfVlJSX0VOQUJMRUQsIGZhbHNlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZ3RfcGlwZV9z
ZXRfcHJvcF92YWx1ZSgmZGF0YS0+ZGlzcGxheSwgcGlwZSwNCj4gPiBJR1RfQ1JUQ19WUlJfRU5B
QkxFRCwgZmFsc2UpOw0KPiA+IMKgIA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZ3RfcGxhbmVfc2V0
X2ZiKGRhdGEtPnByaW1hcnksIE5VTEwpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZ3Rfb3V0cHV0
X3NldF9waXBlKG91dHB1dCwgUElQRV9OT05FKTsNCg0K
