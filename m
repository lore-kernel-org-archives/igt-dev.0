Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB29C48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 08:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7104210E047;
	Tue, 20 Feb 2024 08:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKJvz9hK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C044610E227
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708418940; x=1739954940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DfWlF1ccWb2g2Q+0ddvOZuE/XgFcfua0V1HN1sd7NhU=;
 b=NKJvz9hKIdLUrmu9vrR29sOtRZYUj5nGjNL/6DgNL8SxS0MzU7hd81su
 weTomgN70k4fRZ2yhOLbcXwnOvlzCbAwfaf5VZ4CrRK/RNu4m3C5zQvcn
 NIMY5N2vnUUy13tnxL97tYIV1U+7Zcy8mrO+hU5IsermB3duC2wIUyFAg
 VADBCXcw19M2VCu2VWf6cl/Rkgoza3ewAh26mSkZbjaCJqIHx3Jj8Bq8J
 N9FqLEj52FT5SMvUcc7AQ5AzkPWppwa4mw33lujYBOfLa8Q4o16Ihs7zb
 FfCt7YlGOwDD3Nn3sLLkjdhdx2xMb6nG4qohFFR1oJ7YY1aPgec96jQYl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="20042597"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="20042597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4961821"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 00:48:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 00:48:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 00:48:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 00:48:51 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 00:48:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hnf1ErPFxTNDzhiI2wnHFRnVdDh7iUgbsko0ESq7fmhdRXpNzHnlw9Rj7CDP0jAH20o1oPgbE85YUyJQG9Ijo3jPTMjHtLX7q0CPY1z5CiY5fCV7l1EMgWX+KyofSznKVR1nHq4zLGV8S53sZW+amuD4TUKrc4ElRadz43UtsoHhlVKxvIBXFOkqpT11NrsF/Qn85Z0djadVBnGrxVutAMDgbHkf3DeHVPPadu1PcnhR7lTo4EqUAXZwUE7XboTQP755KLudvdZFxOm+4Onmxqn/r/T9uqY1y/HuqvZe25xHCsXktPhnWX/cw5eeI84vSQsVRuTeOrcX4YkQu55CTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfWlF1ccWb2g2Q+0ddvOZuE/XgFcfua0V1HN1sd7NhU=;
 b=LSaugkWgJmSD0QQLsWaBN/y49hRohfmOmOx7AL9OoF8JxLqW8w+BTUS3eq22VLD/ISIks3IZplYxYjVgGrOagQl/tWK2scJF3pIyLWjJw4u7gEwPxfr6aW8vsi2uiBWXnTdEWMhjQr9ObmVGwr3MnKSwq20ThYchVCY7/650wEoDtbTtziMYhW3399Q3vTHJ8HdbGky1oLUwx4HvsCRbi+ofRwXWffoBQjlSpSte5PF7dEYalFqtYzubKGLponwrP/FeY+5LhBuUTRZuXD9p8O8m28jZoLmomaJsaI2Ke9Tno9rrz46I0bI9mzEP2mTCdWuyVaPGGT2CpDvyOPOclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 08:48:47 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 08:48:47 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective update
Thread-Topic: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective
 update
Thread-Index: AQHaY1AUu9lSSaCXVESFzan+9A/PIbES7JmA
Date: Tue, 20 Feb 2024 08:48:47 +0000
Message-ID: <9ee822b2bb74e359cdc3696d3d0b5afc9a21efda.camel@intel.com>
References: <20240219163333.2339647-1-kunal1.joshi@intel.com>
 <20240219163333.2339647-3-kunal1.joshi@intel.com>
In-Reply-To: <20240219163333.2339647-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB5802:EE_
x-ms-office365-filtering-correlation-id: e65e5046-27f3-4aa2-044e-08dc31f0c089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yjwjWZCCpY9hV70g7HXCPlKK3rnZY8n3IX8grmxnujKLv8OtGM6RfanzjyzNGC6Dg9sZxru0jqipQbLNABR0qc1abhaxBh1S/XIIoUBbIMASWyafHUxP9bys/PQwbiczHmuOnfHYiLvWknklVIuRG3tEMY0ecLLRUsnJzGhdN2DgxRPYMxfLQHIqkz6O9uXFg3VXs4N76GTGNtrjCPMM2B1tcqoWhq57FgxPvRqAHefSvl0QJLXAWMtWBm25mmI1N4kIhu1x47nrkRrjQ2Q9vmQWwpVXENpK7Jmm2hPKxNx4su3KOpFedMJXRnR2KeKdMPW8963bjobt1/M6HuI79No/BJR5AU5WGv9JgcAxNL7Bg4vTPKCj6Vd6IeZms2F2joHU7p8d4tk9hQbkU+e2DBVirq0HzQJMfvJWzeWrjxNA/PJKmdK522Mlzj+pzij7/bPquhWk6D7lQ9ER5cDBq5WGd/xOoYsjjC/ppsXWZjpIFhtEG8PEVfzZKQk4M7XD8uHqZJzQc0h7fBkHS98gc6OzI0c9VLdu2lpHdmiPjUoHOuOuEAgwzNB9VH+qTEFdWstt1sCtzUT0AEoRFMPIAvAZeWHjbpeX++qW4EN3sWk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTAya21YY0pUMHpUK1ZuUlE4TGgzYm9wTkRFTVhIMk1vSHpCNlNOaGo4anRE?=
 =?utf-8?B?V2toQktYalAzTnM2S1VzQkhDWjVWQXA0VWZJOGkvVUcrU1hrMnduejdocHc3?=
 =?utf-8?B?VDNFN09JbXpxOTh5REhFSUg5S1JEL3h3WnhhWGRncU5SN2RteXRWcm5EUFp2?=
 =?utf-8?B?T1VVMHVQU1VFekQyYngzaGRhOXdlSmdzSldHY3dnWTUreXRVS0hnV1ZBWFBa?=
 =?utf-8?B?ZkJoOEY0ZVJjSlVlTWpRYjhMcGR1Zzg0VkdOdzI2WW4xR09JQTRVZE9PeHJU?=
 =?utf-8?B?amREck1CMTRjd2JzdWZOZ2xLK0pKOUJ4eXEwSUJHMTV3UEd0NjNZZVpzelJp?=
 =?utf-8?B?NmhXVU4ra1BQcGtmckhXMVQ1dFNvVSs5TEs4anBPQWVockkwYmZmekE5anBS?=
 =?utf-8?B?eG4zbzZWRlF3eS9Pcko2cnRJa3lrdnRHMFJTSEd3MnZoT005TGllLzh0WVZk?=
 =?utf-8?B?eE83amFwRyt4Sy9Hc1FXM1ZwMGlDRDAwNEt4RFZ1bENoYzdHbkpsQmk4cW0r?=
 =?utf-8?B?TEtlOGtUR28vQ2dhT05PdFAzaHFHMXR5R1lpUFc2cTJzSTdZUzlzZVM2MFkz?=
 =?utf-8?B?bGRjZUdaLzhLVWVvS2R1YkJIaFM0NnFPZ0YzSzRrK2ZGdVNUeVE0bE9CZ2pM?=
 =?utf-8?B?Vm1kTWQ5dy96ZldtcDhHWnptbllGbHErRWFBQTd6ZkIxZWZLV2FqUlI3Smhv?=
 =?utf-8?B?SHFXRGJZVzRVeEFOd1Rtb2k2N25vNC9hdnhNWXdWZ2RReTBWUlFXUlZ1SmR5?=
 =?utf-8?B?NERSWnZqWTArbnBEcWY5WWlaWEIzV3lWNHZMZWtQNi9FM3NNR0ZDY1VQWUVW?=
 =?utf-8?B?dlU0eTZ0SFN6aWp6VnFLUXVjb24wZ1VER2ZVSEsybitXNEdTT2crR2tqSmdq?=
 =?utf-8?B?NUdXRk9MWTlDM2toZ0t0UGl3MitiMllneENpY2prYldOVzQ2YW1rNkFkOTZ2?=
 =?utf-8?B?Q3NNeC9IVm10aldLUDM1NVNQUUZrcmNNQTcxemtKMnlKN2Z2YmZxbElkOUpH?=
 =?utf-8?B?Rjh1eGlDdmdzdXl1akNxUGtESmtsVjNiQnVGUzFaejN0aEgvVjJEcHV0KzFq?=
 =?utf-8?B?aWQ5dWVWeVNlSno3Q2xaR0VEL0RtVjRvckpPVFNKSVFqRGZ4cjZlVnZqaTFU?=
 =?utf-8?B?ZkJuYWpaeUk1VDl4WWZ2OVQrZzBQWjc5WWRWZlJOZng1TXpvMjdkUTFnZkUy?=
 =?utf-8?B?UGVHdGdMTlBmWXhBQUZhU0dFbGJtR0xseU9RemFtOUpHcVQvVjF5TW5QK2Jl?=
 =?utf-8?B?NGlsWUJBODNpa3huMVIrMktDbEZqOExmckdLTmhWUGJhNXAyOGhkUXZqS2I3?=
 =?utf-8?B?M1JYbFU3WnFaY1BCTG9xYzdESFJHL0ZXQ1luTDJEbHpZZUtMbHpQR2FBRkla?=
 =?utf-8?B?WklJTVZYS2lLb2cxWDJURFNuYjhvTU90MCs1dnllejNadXlnWTlIb0Fta2x5?=
 =?utf-8?B?OW0veE5tTEJvcmpwQlNXU0Zaa2ZTNUxLSW5SWVdXUnFCUzFVOURvOVVmMGpk?=
 =?utf-8?B?YlN4WEx1dVlMTStpOVVKeTNuNE00OVBqbW93U0ppTWg5NG91UVdsdXR2ZE1u?=
 =?utf-8?B?b2xUeVViOFEwb2l6QnJONkYwYVBsNWhSN2NtQnBiMUhtT3p0M1Q1MnNpVXlw?=
 =?utf-8?B?aFRUMVE2S3c4a3JYL05ialozTTEybmg3SVIwN2YzWjZ0WXhtT0h3cGtJR0lw?=
 =?utf-8?B?YjF0SStZVmQyTGQxc1RsdkVvbE5adnplVGFrbCszb2ZwOTFjN3k1WlUycVBX?=
 =?utf-8?B?blFCclliaEFLR3ZpWVpXZml1YjFQOUZxdUNEek1qcDVoSVFhMHFkS2FUK2JR?=
 =?utf-8?B?UnR3N01PNjIwd1lhN1BqdFk0K1orekNnTWxteTBMTThleStORStkekREUG8x?=
 =?utf-8?B?aWRMb3F1VGpTeE93clY3NlRwMkU1dU5aT2hDTS8vVFdLYzU1TW4vZS9yVEVS?=
 =?utf-8?B?cnJHVGVwcVdvc0JqL1ExT0w5YlhYSUFiOXorSHpNSzBkS3Q3V3Z2TWo1TFdP?=
 =?utf-8?B?NnNQQWFmcFcyQXp6eG0wS1VKelU5WWRkR2hNVnBkMEMwbDJ6MXZGUmtDWHZR?=
 =?utf-8?B?NFRmL0dXNEE0V0Z0Ri9xOXZkTk9UUUhrNGhwSUEzSHFrQ1U1WGpjVm1taklL?=
 =?utf-8?B?L1dSUEdZWnVSb2dnN1ZsZ24zTnhPeXB1Uzl3TjRLSGFXN0Z0bzdTZ2VDVk9s?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B22E770C7A817043913956CEBA957C75@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e65e5046-27f3-4aa2-044e-08dc31f0c089
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:48:47.1597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSVABPnFA1UkerY9t7iLvev4o7hliER0pP3ZO98c9AO+VbPPASelM9NP4VkFMvsnDQigr651YSXYOHx2l7I8+J5Cvih0FN5RkERFXmneyZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
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

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDIyOjAzICswNTMwLCBLdW5hbCBKb3NoaSB3cm90ZToKPiBh
ZGFwdCB0byBrbWQgY2hhbmdlcyB0byBzdXBwb3J0IFBSIHNlbGVjdGl2ZSB1cGRhdGUKPiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTc1MTYzLz9zZXJpZXM9MTI4MTkz
JnJldj0zCj4gCj4gdjI6ICJQU1IyIHNlbGVjdGl2ZSBmZXRjaDogZW5hYmxlIiB2YWxpZCBmb3Ig
Ym90aCBjYXNlcyAoSm91bmkpCj4gdjM6IHVzZSBjaGVja19wc3IyX3N1cHBvcnQgKEpvdW5pKQo+
IHY0OiBzcGxpdCBwYXRjaGVzIChKb3VuaSkKPiB2NTogZHJvcCBjaGFuZ2VzIG9uIHBzcjJfc2Vs
X2ZldGNoX3RvX3BzcjEgYW5kICpfcmVzdG9yZSAoSm91bmkpCj4gCj4gQ2M6IEpvdW5pIEjDtmdh
bmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPgo+IENjOiBBbmltZXNoIE1hbm5hIDxhbmlt
ZXNoLm1hbm5hQGludGVsLmNvbT4KPiBDYzogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBp
bnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS3VuYWwgSm9zaGkgPGt1bmFsMS5qb3NoaUBpbnRl
bC5jb20+CgpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+Cj4gLS0tCj4gwqBsaWIvaWd0X3Bzci5jIHwgMjAgKysrKysrKysrKysrKystLS0tLS0K
PiDCoGxpYi9pZ3RfcHNyLmggfMKgIDIgKy0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBi
L2xpYi9pZ3RfcHNyLmMKPiBpbmRleCBjYWQ4Y2NlMDUuLjYwMDhiNzNhNiAxMDA2NDQKPiAtLS0g
YS9saWIvaWd0X3Bzci5jCj4gKysrIGIvbGliL2lndF9wc3IuYwo+IEBAIC00MSw3ICs0MSw3IEBA
IGJvb2wgcHNyX2Rpc2FibGVkX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKQo+IMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gc3Ryc3RyKGJ1ZiwgIlBTUiBtb2RlOiBkaXNhYmxlZFxuIik7Cj4gwqB9Cj4gwqAK
PiAtYm9vbCBwc3IyX3NlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQgZGVidWdmc19mZCwgaWd0X291
dHB1dF90Cj4gKm91dHB1dCkKPiArYm9vbCBzZWxlY3RpdmVfZmV0Y2hfY2hlY2soaW50IGRlYnVn
ZnNfZmQsIGlndF9vdXRwdXRfdCAqb3V0cHV0KQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBjaGFy
IGJ1ZltQU1JfU1RBVFVTX01BWF9MRU5dOwo+IMKgwqDCoMKgwqDCoMKgwqBjaGFyIGRlYnVnZnNf
ZmlsZVsxMjhdID0gezB9Owo+IEBAIC0yNDgsNyArMjQ4LDkgQEAgYm9vbCBwc3Jfc2lua19zdXBw
b3J0KGludCBkZXZpY2UsIGludCBkZWJ1Z2ZzX2ZkLAo+IGVudW0gcHNyX21vZGUgbW9kZSwgaWd0
X291dHB1dAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChz
dHJzdHIobGluZSwgIlBTUiA9IHllcyIpICYmCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKHN0cnN0cihsaW5lLCAiWzB4MDNdIikgfHwgc3Ryc3RyKGxpbmUs
Cj4gIlsweDA0XSIpKSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgUFJfTU9ERToKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHN0cnN0cihsaW5lLCAiUGFuZWwgUmVwbGF5
ID0geWVzIik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBzdHJzdHIo
bGluZSwgIlBhbmVsIFJlcGxheSA9IHllcywgUGFuZWwgUmVwbGF5Cj4gU2VsZWN0aXZlIFVwZGF0
ZSA9IG5vIik7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBQUl9NT0RFX1NFTF9GRVRDSDoKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHN0cnN0cihsaW5lLCAiUGFuZWwgUmVw
bGF5ID0geWVzLCBQYW5lbCBSZXBsYXkKPiBTZWxlY3RpdmUgVXBkYXRlID0geWVzIik7Cj4gwqDC
oMKgwqDCoMKgwqDCoGRlZmF1bHQ6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
Z3RfYXNzZXJ0X2YoZmFsc2UsICJJbnZhbGlkIHBzciBtb2RlXG4iKTsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsKPiBAQCAtMzE3LDcgKzMxOSw3IEBAIGJv
b2wgaTkxNV9wc3IyX3NlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQgZHJtX2ZkLAo+IGlndF9vdXRw
dXRfdCAqb3V0cHV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZh
bHNlOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGRlYnVnZnNfZmQgPSBpZ3RfZGVidWdmc19kaXIo
ZHJtX2ZkKTsKPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBwc3IyX3NlbGVjdGl2ZV9mZXRjaF9jaGVj
ayhkZWJ1Z2ZzX2ZkLCBvdXRwdXQpOwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHNlbGVjdGl2ZV9m
ZXRjaF9jaGVjayhkZWJ1Z2ZzX2ZkLCBvdXRwdXQpOwo+IMKgwqDCoMKgwqDCoMKgwqBjbG9zZShk
ZWJ1Z2ZzX2ZkKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IEBAIC0zNDMs
NyArMzQ1LDExIEBAIGJvb2wgaTkxNV9wc3IyX3NlbF9mZXRjaF90b19wc3IxKGludCBkcm1fZmQs
Cj4gaWd0X291dHB1dF90ICpvdXRwdXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gcmV0Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGRlYnVnZnNfZmQgPSBpZ3RfZGVi
dWdmc19kaXIoZHJtX2ZkKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAocHNyMl9zZWxlY3RpdmVfZmV0
Y2hfY2hlY2soZGVidWdmc19mZCwgb3V0cHV0KSkgewo+ICvCoMKgwqDCoMKgwqDCoGlmIChzZWxl
Y3RpdmVfZmV0Y2hfY2hlY2soZGVidWdmc19mZCwgb3V0cHV0KSkgewo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBX
aXRoIGJlbG93IHdlIHN3aXRjaCB0byBQU1IxIGluY2FzZSBvZiBQU1IgYW5kCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFBhbmVsIFJlcGxheSBGdWxsIEZyYW1lIHVwZGF0ZSBp
biBjYXNlIG9mIFBhbmVsCj4gUmVwbGF5Lgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKi8KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBzcl9zZXQoZHJtX2ZkLCBk
ZWJ1Z2ZzX2ZkLCBQU1JfTU9ERV8xLCBvdXRwdXQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0ID0gdHJ1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IEBAIC0zODksMTEgKzM5
NSwxMyBAQCBlbnVtIHBzcl9tb2RlIHBzcl9nZXRfbW9kZShpbnQgZGVidWdmc19mZCwKPiBpZ3Rf
b3V0cHV0X3QgKm91dHB1dCkKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoc3Ryc3RyKGJ1Ziwg
IlBhbmVsIFJlcGxheSBFbmFibGVkIikpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gUFJfTU9ERTsKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChzdHJzdHIoYnVmLCAi
UGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUKPiBFbmFibGVkIikpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBQUl9NT0RFX1NFTF9GRVRDSDsKPiDCoMKgwqDCoMKg
wqDCoMKgZWxzZSBpZiAoc3Ryc3RyKGJ1ZiwgIlBTUjIgc2VsZWN0aXZlIGZldGNoOiBlbmFibGVk
IikpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFNSX01PREVfMl9T
RUxfRkVUQ0g7Cj4gLcKgwqDCoMKgwqDCoMKgZWxzZSBpZiAoc3Ryc3RyKGJ1ZiwgIlBTUjIgZW5h
YmxlZCIpKQo+ICvCoMKgwqDCoMKgwqDCoGVsc2UgaWYgKHN0cnN0cihidWYsICJQU1IyIikpCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFNSX01PREVfMjsKPiAtwqDC
oMKgwqDCoMKgwqBlbHNlIGlmIChzdHJzdHIoYnVmLCAiUFNSMSBlbmFibGVkIikpCj4gK8KgwqDC
oMKgwqDCoMKgZWxzZSBpZiAoc3Ryc3RyKGJ1ZiwgIlBTUjEiKSkKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBQU1JfTU9ERV8xOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oHJldHVybiBQU1JfRElTQUJMRUQ7Cj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmggYi9saWIv
aWd0X3Bzci5oCj4gaW5kZXggMzcyYmVmMmIyLi5lODU5NWZkOGMgMTAwNjQ0Cj4gLS0tIGEvbGli
L2lndF9wc3IuaAo+ICsrKyBiL2xpYi9pZ3RfcHNyLmgKPiBAQCAtNDYsNyArNDYsNyBAQCBlbnVt
IGZiY19tb2RlIHsKPiDCoH07Cj4gwqAKPiDCoGJvb2wgcHNyX2Rpc2FibGVkX2NoZWNrKGludCBk
ZWJ1Z2ZzX2ZkKTsKPiAtYm9vbCBwc3IyX3NlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQgZGVidWdm
c19mZCwgaWd0X291dHB1dF90Cj4gKm91dHB1dCk7Cj4gK2Jvb2wgc2VsZWN0aXZlX2ZldGNoX2No
ZWNrKGludCBkZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk7Cj4gwqBib29sIHBzcl93
YWl0X2VudHJ5KGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRf
dAo+ICpvdXRwdXQpOwo+IMKgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVu
dW0gcHNyX21vZGUgbW9kZSwKPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk7Cj4gwqBib29sIHBzcl9s
b25nX3dhaXRfdXBkYXRlKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2RlIG1vZGUsCj4gaWd0
X291dHB1dF90ICpvdXRwdXQpOwoK
