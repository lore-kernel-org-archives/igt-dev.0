Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD12510F3DC8
	for <igt-dev@archiver.kernel.org>; Sat, 28 Mar 2026 03:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F8610E076;
	Sat, 28 Mar 2026 03:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChPjrYIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6623E10E076
 for <igt-dev@lists.freedesktop.org>; Sat, 28 Mar 2026 03:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774666906; x=1806202906;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=APn5ohRUDFy8+yrmdMMubdJVV89GxFPYDmjXY5j7quc=;
 b=ChPjrYIH4iUvrcAY0cTHLz3NHhEZZ5ErZ3h7WwH+aHze9PIHS6uVPx7x
 Fgp6Z1txFJ9siqqbaCm4F4He8yZV/y+aY2wwckRL9dL+X61QbbjiMoXx2
 P0W+SSAPaUbdArsg3GLTm/EVCudPmzuGJVTGRdz82znJ4YV0b9mVRXyhg
 ZTGPmycTXhWalh8ej9SgSQPpz+eIfCSL8oPamGmJAGDaN3dLVdCrDsXIK
 P60Wz4TU+uHQk/52ECyisG+tehS2lZkD9qMm5y8kMK1XygMAvtyK9ke2L
 WzdqpiTtZDwiBehEH9kjdfuPThc8nms0mVP/pA6Yjfcd3G6UX8vYDBynJ w==;
X-CSE-ConnectionGUID: hkbjNlqnRQyt7MfrkC+C0A==
X-CSE-MsgGUID: wUfdML7gSTC9gNqsXBJXYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75857480"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; d="scan'208";a="75857480"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 20:01:45 -0700
X-CSE-ConnectionGUID: 4kPZ3w5eRZaoDZSHmQoZFQ==
X-CSE-MsgGUID: aBETqI6FT86zXHaOAv3PxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; d="scan'208";a="224686742"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 20:01:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 20:01:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 20:01:44 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 20:01:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOzTY8g//bIWaACyGOUJeemQaqQsl08rrP9pEgiorQ+t3FRMbSkkfNnyh2BGrK5Pr0xZcxZQah/vmqw0gGAMsYToFEYAnzHlEKwm5hhMx9zYM58MJCD0KCqrEj9+h+o7JXiA/Sq+i5rBeLMS8yzuhuH/HXTYK5QWO0fkSe4Va1wv+qtxe+5iQTOhyZUZoKnqos8OhmlV8o6mg2SMK9qYTSM5Rnivp08kJQ+wBL7Z0nh9G2oWSzrZPImFv60hRkArixO6cM4Ewabm6kOFjn+3jxsjeY4dAg3K1TZqJ1Rw30U+qO8cGXkh0jv9xwbJZuMBS+InDkHZesHbyC9nXSzp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APn5ohRUDFy8+yrmdMMubdJVV89GxFPYDmjXY5j7quc=;
 b=MhDH7rHHbbY0xqdv6tjyC/peR2NjgNPnC0mOTOeMk5jU3k0tbk8gp/ETQnkXPMczxtr2SNW2mrXlXeD03iz/vmPPUlMqLLHa37+1oBYzF0IpbIJz76vflChxvOUTNVX8W1/ZLjAsxi8vHrF4UVyoH80FRPqHtF4tgmna32IjORNbN3MFico3P1gKquUp+1C8o9yn2gkB8GmmiT+Ptmcqtr4/WlA4X177VEZ1s9pfwKErzN2Q8TeJxO6BjWKGlO/WhZNjbkcF6OofOiSHlPNbvylJ7TXEL5Vyy48N6Q+xY1QgecrLDrmsSWKHqQB3DCkLT//5+hirTH1cp6MIgo7yUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Sat, 28 Mar
 2026 03:01:41 +0000
Received: from LV2PR11MB6045.namprd11.prod.outlook.com
 ([fe80::1f72:3d49:b6ba:91ae]) by LV2PR11MB6045.namprd11.prod.outlook.com
 ([fe80::1f72:3d49:b6ba:91ae%4]) with mapi id 15.20.9769.009; Sat, 28 Mar 2026
 03:01:41 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "S, Sowmiya"
 <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v5 5/5] intel-ci: Add *-planes-random chamelium test
 to Xe blocklist
Thread-Topic: [PATCH i-g-t v5 5/5] intel-ci: Add *-planes-random chamelium
 test to Xe blocklist
Thread-Index: AQHcvPyhE4UO/07IOUaR3B7O7X5KArXAlK+AgAKuvEA=
Date: Sat, 28 Mar 2026 03:01:41 +0000
Message-ID: <LV2PR11MB604535A1FEA4837234C0C9218154A@LV2PR11MB6045.namprd11.prod.outlook.com>
References: <20260326090417.864673-1-sowmiya.s@intel.com>
 <20260326090417.864673-6-sowmiya.s@intel.com>
 <0fd0f19a-3f33-4d89-8b50-2be59b3a1cd1@intel.com>
In-Reply-To: <0fd0f19a-3f33-4d89-8b50-2be59b3a1cd1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6045:EE_|DM6PR11MB4657:EE_
x-ms-office365-filtering-correlation-id: 9d3a0616-2b5b-4427-be76-08de8c765634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: HRxSvHNTp4gotTk6zPVS5PoCT0a8TibU6YotiCK/xzbndzj3PqmGPMhuq1Y2TQPnl02cjdUVh2yeMtxhw9q8b6sZ/CCxUp7X5ptdRH0AC0o9qiuv8q2mqjHJhzXF0xU25IzwRMqANiYAWuazMoGlr16ulKNbU6d5OVKLNXrXlEAWkUFoQHKvcQk1b5/ffN78s0sy7E2VZMTkimGvsHqsZDWaAGILD0BBlfHNUsr1PTMoarmXuprzdyuI7UjA/EvGi7k9zHnFVGpbDfqFxBOAt3snGFM8wVsAicvL+JcIu0TeRG2byNH7IcVIqBNUanPASgQPG8YKTSAsht+liMxdAL3H6pt6YeueoxA2fmbwlHAnV7JGcFMIplxD96sSgAZ/jGIM3AqbtQCp3MlkStiPNUDIXWW7PpVSkCNXBUKTdm2V1jqEM/M1PgTDpAkkDqdgLAl0+SdFNaPfwsVJv1cFgWPl9VTv6q4EUJTtGVFVyFth9OSlqRUPMbJKCCldIJu4/IbE5ffV/lFqLrIFnYTcTmbYts1kgPy67KG6uXNH93ggo8zKOPnMUS4+IVrLgOGAh3Opq1AkyRwpHfPP+LO49MapgywmYW87H4OCRhsJnc8kCwJ36fZJYtLdgx+OGXeHjyJYiiejGOGTPpaGZ/HPYT8zubmWZFLS+OPw252Ak7yb8+VphQYr940n0WWQtuMakey4Uk89R+oPt+HiX7JR/ipP/Ajponv84RnwGL/uNfCZnn73zAK37ik7Tf+m3EJJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6045.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NENMSndKU210RytZenJvUnErL3lRYlYrSElyM2lUY1J3VVBhc1FSaEFKZXFM?=
 =?utf-8?B?OXFWR3VUQ3hva05sRjFyV2xZQjJGai9zYUNOdFpzNWkvMlVpQ2Z3VWdjeEg5?=
 =?utf-8?B?eEtwOWdIU29vWGdYSi9xbFZ5cGpFcDUxNkFtRmJrNmpyOGRDMSsyYjlnR1cy?=
 =?utf-8?B?QlVLK2pVRXNnL0VkRUZyUFpPR0RGcEsvQURGaUFYL2VqSEZENCtEUzdhWnFl?=
 =?utf-8?B?dzZodGJHaXhqeSsxZHlWd0NxVVIzSVhFWDF6MkxjZE10M2ROQ094Y0FQd0Zn?=
 =?utf-8?B?THdXdmIwTzZhdFIvNzA1djh2MVQ2NjllWENkSS81V2F4OXpOK2ZldGpEVVVk?=
 =?utf-8?B?bjdhUUxOVFVKQXkrQ0RTbVNmWnZkSy9aTWcrQUtTSy95TUlsSlFyMlFlR24w?=
 =?utf-8?B?K3RPOWhQM0FQSEIvU0NyQ21OdFBIZ1lxMzVtRzlRMW90em1qbHZoVUowMWtY?=
 =?utf-8?B?Qmc3enNVbCs2RG84WWpBTE9QcEhEQnVETk01bGtvZ005d1BwZWh4WXNzYVpx?=
 =?utf-8?B?QVdaVk44MTlKSFIwUXA1M0ZCYXVRMHAzcDZVbURFK1daUnd5RGtMYWhFelJL?=
 =?utf-8?B?NVlDOWxaRjBwZEFCUnJWd3NOQTJCZ3hGQklSbE9MQ1NLcWVZekRpUTNVZWNP?=
 =?utf-8?B?YXdjdHVRN05lSW9GdW1md2hzakFuS1Z0VWxuenlLTVJVWHB2NXM2S3hGU1pW?=
 =?utf-8?B?RkhpeHdnck5HdEQyTVN5dG9ZcGJIR29EQnR1TE5vMVRiNml1bnIxRE9MblZP?=
 =?utf-8?B?bXN5OE53emRYWjdOUld2cW01UlhzQUp1WXUvbTRuSUNZV2N4eTcwd01tWWZz?=
 =?utf-8?B?MkVLV3Q0ZzIwNDRhUTFpaU9EQmllUUxrOFJyVlNYbERqSEFQUHdaWi9MM29i?=
 =?utf-8?B?dm1KNWpZZHNydFBNR1RkZWpoWklORlQ4SzhHNCsxNzN6cXhpaHliT3JIakZZ?=
 =?utf-8?B?UlBpVCtCanQrbHpvUzdsWm1HaU05NjlUSkNuNUNjSXc2blo3RE1uRytTSzZ0?=
 =?utf-8?B?RlUwcXZzM1dzYmNDYjdBRm9jY0pVOTF4WVQ5STJqd0hBUU56Y3dvUStDYmpQ?=
 =?utf-8?B?ZUVCdjhVQlAxa1hwUzBYbmdEMDkzbUdFZDN6dkxBTHlNS2pxNUVWVkhyRFBy?=
 =?utf-8?B?aDVvRjlUQXVSN2I0QTZEeUsyeTJJaFgrL28wQW1kd3dzb0V4Z280MTRCdThJ?=
 =?utf-8?B?V0NVRnluaGtkTlJHQ0Z5dkN0NCtHNEJtMWRIM09LMWZBWFNEeld5cUk5MEpO?=
 =?utf-8?B?QkwrN2dvNHpYZHNQc0U2c2xBRjBOZnZMaW16YUJ5eW1YRDJwREpRTXc3UWJr?=
 =?utf-8?B?MUJPakpVSUdUKzMrR21nNG54aDVPc0xEYjU2VDF3NEUwQTlodjVreU44K1hX?=
 =?utf-8?B?Vmt5ZjFBRzg1YTJPcDRkSHBuT2o4TUtJVU1xYzcwTzZYUFJiaStVUFBiTTRO?=
 =?utf-8?B?TnpqamZ0akdvUXhhUkRqRkJjblVwYUIweklOMEJaY0RlOC9TQUpacjAwbDll?=
 =?utf-8?B?SEM2Tm9mcUJobXpMUUUraGI3c2t0T3N2ZnFKV084WGRaeVNiL1VQazAxU2lh?=
 =?utf-8?B?dVJlbjErQ1FRUkF0b1QxeUw5aERMWUlzQzF1Q1g1QWNvNWFlUi9ES3h1NGVw?=
 =?utf-8?B?RFlWbkIzVDRWclhFZWJiMlczL0V3VTNTb05lMTVqdUNReU5rYUFVR3ZFekk2?=
 =?utf-8?B?OS9yYzdGOFZDeGMvTndqR2ROM1h0OUhiN1FsOXJPeGRsK05JQXk4SjkxSjN4?=
 =?utf-8?B?emNUcnN0WU9vMEM0NXgzd2tURzdYbHNjQ2ZkUWlJSU5rbFlhbmp0TXFiUk1h?=
 =?utf-8?B?ZmhjQlJqejNMZFZUSkZzdkYzVitrYnhNRDZGaWZCLzJUbCt4QW1uaEt2ZEEv?=
 =?utf-8?B?TVJBeHZTb0dIclc0TlhseTJqbDAwR0dkL0h5QmkwUnZRK3dpU243emVuUmVW?=
 =?utf-8?B?cFVrc24xZnJzeURVYmJacUtSL2lIUUEvVGZvMzZ6MWRLU2VHZDFWMnBERThZ?=
 =?utf-8?B?R1dGdlI2dnBVdTdJeThmWUkvVzdZZEpYd28xUGR1REVWQ0liYzY4dEpHQ2tZ?=
 =?utf-8?B?ZU12dzNOSS96eFp1cFVGTVFhZHo2V2ZUOWFxQUlZc2tobmRCSGJjLzZoNjZt?=
 =?utf-8?B?RFp5ME1lNnNnL09hVkE1V2dvVEEwUVpLOThYQWFuYUNiRExPUXdhSGF1aFY1?=
 =?utf-8?B?aXdLamY2Y2Q0NnNYaGdDaFNya3NubzJRMmh2NzQwV25PakxvcUFJZmp3QmJC?=
 =?utf-8?B?WkRhVjBzaXFDditNVWhLOWxnVFh3dHRsdTlXWVViU256MmtRMDdnajNPYmZT?=
 =?utf-8?B?QmdvUGxTTkJwU1YxdWNwQXdUZFI3WEhnMTBjWjRvM2dmUDRiV1lrOWtBeVJY?=
 =?utf-8?Q?r+XCUKgjaL09NFtoO7lG0W8oboawzOMDO8KteBC87gC0j?=
x-ms-exchange-antispam-messagedata-1: BMy/4ky2FnuC0g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TNBKj7vftBUu6lhnK19C801Pbgj3Sf/AkM9XNVXDUqbOksmA8mYx8tvKKQRbt1L3lDESwsVX2Wch/jiW4tSAT3FVtp6HfX0T4gBTwOFheed1aG32KavLhFao3sjwBcLwUG6pY+Yiwdt2TRZ3Wchol+KmZvgrJkMuD6fCAeqRXQaAvGDXPDwLjqY43/wSZt3QIpD4uvXlCdTx1H7Gum+GBwUwjYwC7Xze8NOjejMBBgpO9vhzZOiY25MWFf3B6h6O29NxUCyTAdkTJEqtWTYLOCEBfiWHAd7itwmyhtWc1bBtLfmSJNSSyx+2vWHI7mDp5mUBfrQGs2c4iqmltPipjw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6045.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3a0616-2b5b-4427-be76-08de8c765634
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2026 03:01:41.3105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcVez5ZjXVleV+k52WuIRppOt1OccpbtcluynvpN1N2x14M76DToC36OzrK/5L7qgGxs5ILtlokHZ7Kkt2h4UGrzX87VVYkrRZW/5IYUN+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

SGkgU3dhdGksDQoNCkZvciB0aGlzIHJhbmRvbSBwbGFuZSwgZG8geW91IHRoaW5rIHRoaXMgcGF0
Y2ggd2lsbCBoZWxwPw0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzcx
MjE0NC8/c2VyaWVzPTE2MzI5NiZyZXY9MQ0KDQpJZiBzbywgd2Ugd291bGRu4oCZdCBuZWVkIHRv
IGJsb2NrIHRoaXMgdGVzdCBpbiB4ZSBhbmQgY291bGQgYWxzbyB1bmJsb2NrIGl0IGluIGk5MTUu
DQoNClRoYW5rcy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGFy
bWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFNlbnQ6IDI2IE1hcmNoIDIw
MjYgMTU6MzANCj4gVG86IFMsIFNvd21peWEgPHNvd21peWEuc0BpbnRlbC5jb20+OyBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQmlsYWwsIE1vaGFtbWVkIDxtb2hhbW1lZC5i
aWxhbEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjUgNS81XSBpbnRl
bC1jaTogQWRkICotcGxhbmVzLXJhbmRvbSBjaGFtZWxpdW0gdGVzdCB0bw0KPiBYZSBibG9ja2xp
c3QNCj4gDQo+IEhpIFNvd21peWENCj4gDQo+IFBhdGNoIExHVE0NCj4gDQo+IFJldmlld2VkLWJ5
OiBTd2F0aSBTaGFybWEgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiANCj4gT24gMjYtMDMt
MjAyNiAwMjozNCBwbSwgU293bWl5YSBTIHdyb3RlOg0KPiA+IEZyb206IE1vaGFtbWVkIEJpbGFs
IDxtb2hhbW1lZC5iaWxhbEBpbnRlbC5jb20+DQo+ID4NCj4gPiBUZXN0cyBhcmUgZXhoYXVzdGl2
ZSBhbmQgcGljayByYW5kb20gY29uZmlndXJhdGlvbnMsIHJlc3VsdHMgYXJlDQo+ID4gbm9uLWRl
dGVybWluaXN0aWMgb24gZWFjaCBydW4uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNb2hhbW1l
ZCBCaWxhbCA8bW9oYW1tZWQuYmlsYWxAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMv
aW50ZWwtY2kveGUuYmxvY2tsaXN0LnR4dCB8IDExICsrKysrKysrKysrDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsLWNpL3hlLmJsb2NrbGlzdC50eHQNCj4gPiBiL3Rlc3RzL2ludGVsLWNpL3hlLmJsb2NrbGlz
dC50eHQgaW5kZXggODBhMGVlOTA0Li44MGNjOTg2MDggMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMv
aW50ZWwtY2kveGUuYmxvY2tsaXN0LnR4dA0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsLWNpL3hlLmJs
b2NrbGlzdC50eHQNCj4gPiBAQCAtMTMyLDMgKzEzMiwxNCBAQCBpZ3RAa21zX2FzeW5jX2ZsaXBz
QGFzeW5jLWZsaXAtd2l0aC1wYWdlLWZsaXAtDQo+IGV2ZW50cy1saW5lYXIuKg0KPiA+ICAgIyBk
cml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBWR0EgY29ubmVjdG9yIHR5cGVzLg0KPiA+DQo+ICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjDQo+ICMNCj4gPiAgIGlndEBrbXNfY2hhbWVsaXVtLipALip2Z2EuKg0KPiA+ICsjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICsjIFRlbmRzIHRv
IGdlbmVyYXRlIGludmFsaWQgY29uZmlndXJhdGlvbnMgIyB1c2luZyBDQ1MgcGxhbmVzIG9yDQo+
ID4gK2NvbmZpZ3VyYXRpb25zIHRoYXQgIyBleGNlZWQgSFcgY2FwYWJpbGl0aWVzIHJlc3VsdGlu
ZyBpbiBzcG9yYWRpYyAjDQo+ID4gK2ZhaWx1cmUgd2l0aCAtRUlOVkFMLg0KPiA+ICsjDQo+ID4g
KyMgTWFpbnRhaW5pbmcgZXh0cmEgY29uc3RyYWludHMgZm9yIEludGVsJ3MgSFcgIyBpcyB0b28g
Y29zdGx5IGluDQo+ID4gK2NvbXBhcmlzb24gdG8gdGhlIHZhbHVlICMgcHJvdmlkZWQuDQo+ID4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ID4gK2ln
dEBrbXNfY2hhbWVsaXVtX2ZyYW1lc0BoZG1pLS4qLXBsYW5lcy1yYW5kb20NCg==
