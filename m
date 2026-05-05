Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E10CCD3430
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 09:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F02910E0F1;
	Tue,  5 May 2026 09:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSg/rJ6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B614910E0F1
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777972305; x=1809508305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4kR9HCt2sHHfrbD5/e2+ufOxZxKl7nbf41SkSn17CVk=;
 b=GSg/rJ6yGPh7o8CZ3C/pHG5bupQ7ActkLObfO2iQ4sPbqn2YNqy65eAV
 P+iMI5mvwEdlFeGcgmuG4yQOfio1GUu5h5OxTIy9L9moEYGWGcq8iRJ5Y
 68p3yO1Eqk8OjBlUuQNogUHJNusV3i9RWJUzIm7QaxfnI2sICDAhjQ75S
 lO6+8eI/oN6hZvz9VyQ8Rv04JZ//l5RjiVbSA7fVFVtDGzGHDxX+w5hGe
 16e5yIs33unyyEU45A5zI3IAcOgch08mt3JwZJ7nkjCraXIYiador/CPi
 rIbxSFfJ5IXcbwFQEFp4X+dKvGW5gUAm2VbYoc1L8A3xXLy5ZJ2i09Kiq w==;
X-CSE-ConnectionGUID: 2ZAfCr8PS36SMSP+mMRrQg==
X-CSE-MsgGUID: WbSjeBTATkKrVHAt0uVA4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78698993"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78698993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:11:41 -0700
X-CSE-ConnectionGUID: 0CX8D23DSTalrQ+ePgIbrQ==
X-CSE-MsgGUID: rIop6C47SVuSdolV5YklAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="237535388"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:11:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 02:11:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 02:11:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 02:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hh7KdwEbEOG21OKyf4iJTlDjKxPpOfRATwFq6qt1IrcAOQu4l5Mwb6MHzVUw2pUNeLiFiTgkrMKkXHbLAp7/htczMYCImctYQfcMGfVarF23rJLtvP03Fyoyp/ZQlskZ1kh761DjyEuEKgLeSMpDM7IjYXCijA6UqBfQLQ8JwusdhEHzkYqsbx051OJfST3blCL4vnbuPznQLCzqJz6mazFdDKGyC6Rtj7J6fxjDwhFI/A5y//vCjOIuU8fZeBqeKjUp31mCiVZzUMFjfCs/HrpGm9jZt24PId6EoPj+uSJguUD032T9oOipLwYu5ldf+7S/ax/98B2OF0rCPPU5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kR9HCt2sHHfrbD5/e2+ufOxZxKl7nbf41SkSn17CVk=;
 b=RbGvbV6Yhk9B7RFIKf0Remyh/CxLxKfkvdpZhYS7ltBBB3MtDl9Y+tsM7rJvvWr24JwqyRPBV9lljwSpqrODH/MTJwmY1F8ku3+zPzpsGqABnGbxrBEzHd3hBOv8yBdBZIUW/XLGBMbqXWU/M4gbBmtDB/06+m7VA6f4CnT3urfyH+kusY5RGkPfiZu/55bFjWLZIsOsNKhTe2Q9Ir7IzjyBBQg/+rwdHmjAaQ79SiDQ7Zfl4EOgb9keLdiJzqYNy1jfBlM5LyIzOVTHTcSmHihb9nCDVronHK0WT/A8bloDDKlyTlWVMQmipWb4Vr0CkPyUuXIPbeiE2x6FK4GbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 09:11:36 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 09:11:36 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/kms_sharpness_filter: Add
 invalid-filter-with-nearest-neighbor
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/kms_sharpness_filter: Add
 invalid-filter-with-nearest-neighbor
Thread-Index: AQHc2WY6O7QmeBAI6U6UBSTWujXXgLX/K3UQ
Date: Tue, 5 May 2026 09:11:36 +0000
Message-ID: <IA1PR11MB6467845133427DCDF3622EACE33E2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260501123738.2360414-1-swati2.sharma@intel.com>
 <20260501123738.2360414-4-swati2.sharma@intel.com>
In-Reply-To: <20260501123738.2360414-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|LV3PR11MB8726:EE_
x-ms-office365-filtering-correlation-id: a46b7181-56b1-432e-7d50-08deaa864f2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: IJEgUNsUJlvK/DzfL4B9zTXRZ5p6lF9oK6jzwddzy0b2hDu6ijSupjzHoYBWs/HxkOfYhHchFEUipNQPS/O24acNYz57DN/VBvOavjAcuGFmvVs7nYp/vReoQVf03PDWnp2h9GKwm2NgyWBNrIONHqN0aCU39OTtupsm+YmEcHJ2fAn506CvaKiwZ8JTIdFKG2B3tNG3bL8l+C5Z03T+AXmDxbzq/lVq4fa2Pnn0OrDtpthH8+dyLKtLfrACrALhX5CNfcHDfHMTdIIuBprY0iHy8F/T+nAYB40ZIaC8qHplWpVeFWdToELcJJuLezwMjUPKr6rowPtuAjfdNh7qR5UgjeUeULG2NTDXJxUzQJlLc9+8zi1V/dsd5IN2sd1nl3AaUOI70mdIDH4g5zHh8IdflBwfnyl17ExCyurv5TaNbYF9MhzByGBxipIlGzMAwau63HUHtaC36TQ0O/HpSmliIL2+QTZn5JQ+OQOxg8MGSFjBsazRzBEYJsFWHSjLT6JDJ31jOnjbbYQgHVjto5eBiNaErdP+HmYMRudrVAmJTFwel7W/1z9a8qPQe72ET9tBfBEJwp3hHGtZyDNDvgJ1YMeMU/jwgNNUWddduoyubGVXtjFdp8m96sqdVMS5hIwJcFw6kDkwbIAXOKsFi7BiFNZcixAETWuHFwpI8jliAeXK831PyHCYTXgHL9IuQyFafvMac5bJW6/czggGeJkBlqsCmjEzYHIHdwA7Ldqmy5oXk4wZc8jQCeecqos5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUhsb3J1dEI1eEVueDZEVEZubG9SOVMzY0hjWUUzcjgyRXkzd0dPaUd4VmZx?=
 =?utf-8?B?WlZqRkZwNThqL2F1SEJiQ0JzYU1iS1RjK2hFWDcxNngvTCszWFR6d3ZVNjVm?=
 =?utf-8?B?SFJUcjlYUXVnNFNBMk5uYzJTWHVQaGM2Wis4YmRTa2lyMlhSNWVKZDBoQkV3?=
 =?utf-8?B?cFlqdkhydVFUQ3YyZ0lmSlF2eUg0aFVTM1VUOENoNUZ0QkQydVRPL1QrVG1T?=
 =?utf-8?B?T3duT05kWjFjZGwwemlpNjlOMDZHbHpJeU5Td3A3NXJVM0NFRjY1Nmp5Vmtr?=
 =?utf-8?B?M1cvRU5JZndKLzJjTjRYQ21pVnFjbTVPdWY3ZHdybTd4aWFESlRmNlBTTkVX?=
 =?utf-8?B?OXRqYXQrYkxwSFhLL0JNRit5bytFditCOXd0U3RVQmxsM29QZ3FFK3libXA2?=
 =?utf-8?B?dFltamxxaldOWnlyMnBLbExuYkNqUUJUYXZ5MFlJUmpJUDhldmEyRk5ZSjBk?=
 =?utf-8?B?SFZCUDJHVENmZDVnVUM5TjJRaGl6d1RJSDRQMVBtMkVHNWhPOGpjWUNiYThG?=
 =?utf-8?B?ZkNmeklnZGsyMGhIQUNTY1U1WjV2Z2VUbFhvU0ovTzNxVUN5SW1IWG5LNXhQ?=
 =?utf-8?B?N0lrMWd1MHBkYTlZY3VsNjJrelJ6aTcwc1o5WU0rT3JhQmhPeTlyUkNNZ0ZU?=
 =?utf-8?B?d1VYN1ZVbUdob0lVMDBZcEhMWURYZjdkYWNYQU80aUU3ZTgxbUhDWHBxZFZz?=
 =?utf-8?B?LzRmZ2djcE1kQ0dPY0ppeVNHNkwzNFhyVGtuS1djMW5xNDNpZU93M2FTQ0lF?=
 =?utf-8?B?SWtadG9TQmV6UEc2WGt0SmdsQUswaHE2bGo0ZkRmdm40L3ZmYXV5Nng5UnVW?=
 =?utf-8?B?ZW5MTTlNN0FVZ3NvLzlmQ3RCTS9tY3N1SUh0REVRL08vSkRVd2lnVE9RWGhu?=
 =?utf-8?B?RWhyTERNQUJrbmZZenJlMm5CSVd1NXBhY2J3dEljUTVsV0NJamhHeGxKSUtU?=
 =?utf-8?B?a2JvRk1saXFxWTd1V0pwbS8wb0NSb1lVTXNLa3hUa2poMURTbm4zSkMwU1BX?=
 =?utf-8?B?ZEs4UU1VNS9EZGpqWEJWWkc1eDBXSnllUmVrV3pIZi80SnVLN2N3ZDRvWDE3?=
 =?utf-8?B?ZEQyOVRwd2VJMmdWdzlua1piZ00yeU44THFmU0loS2dCakk1ekpJdGZKaUVx?=
 =?utf-8?B?dXJOQXNVeEVROWovci9GaXloWGdycEYvT1MrVk5GZHRMOFR5SVl1WUJNY2xU?=
 =?utf-8?B?WkdFUE5rRmJtcHdYMXhXVGJBVCt5L0lUTXJkUG5BRVgrRWo5UkZIcWt2Lzdm?=
 =?utf-8?B?SHFrV1FScUNlWXRyK0ZER21Ybm1PZkh2ZFV0OURKM2ZlNEtCTDV1NkpiUnlv?=
 =?utf-8?B?elQ2ZllWZHRRcWlZYlJyZ21wN1JydlJudkdYQUt0cVdrT0NQRnZROWVZSHpJ?=
 =?utf-8?B?aHZTT3hhUkV0WXpYQVRPbDNkdlNDZ1MwU1ovSU1TOThkRXFWays4RlJ3cFNV?=
 =?utf-8?B?SEZ0Z1RYY3M4N2hDekZkeEllTXZUdThtTVFHVGxNUS9vcXlhdm9ycDlPcW1n?=
 =?utf-8?B?U3BPd2ZMTGMyRWxJSUN4aEVjUWcwZnpjRXNmcWxZaTBMUTMwMjhjdmZvUXJG?=
 =?utf-8?B?NUF4QlRyVC9JcmRKTzVyTitNdG8yVmQ2clBqVDZlTXdzcTVuUVoxQitCZnNm?=
 =?utf-8?B?TU1IMVdPemdoaWszME9oZ2dsZG1za1Joc3cxYTVPMlFXekZGOUNkeFhxNWxj?=
 =?utf-8?B?aVQrMHg2TW0wTWlqVDQ0bXBIOUc1RU1ER3hvdWh3RXF5UDlHSXFFUnh6Z1pV?=
 =?utf-8?B?VDRiR0pJVnk1WmwxOFlyeFpUcXhsOWowNWFIc1JrM2ZQQ2FYV3E5TUk4c25H?=
 =?utf-8?B?ZmdyNlJzdGF1YjBTRHgxbjBVa096RmpGTE81RnJ0NDBrelJUNDZxL01JazdU?=
 =?utf-8?B?UkpJc0g4NHZ1TXlyVG04dDJNQnVlRlJkcjg3THo0a1VXNkdVbE11UFh0N0Js?=
 =?utf-8?B?S1ZCY2NITG1KbWxKTjg0aGowMkhYbkllczBFQlc2bFEwSDU0ZFNsN1RiU3FB?=
 =?utf-8?B?bkVhS2M0eTBiQmFjeEZzZ1BZT0R4c3pZWkMxOHVqL0JNRk9iMk5Bb0RQNE9n?=
 =?utf-8?B?Nnc2M1NIZ2VpSVVncnFMSEg0c0VZem4yN3dNT0V3ZmFQdWVWUlhWcjVMeXQz?=
 =?utf-8?B?ekpCM1A0emFRNHZ3eHR2OURJeVJXQUU2MzZlMm9QZjVNQUZ4anRaKzBZWHFm?=
 =?utf-8?B?OEt4blRFdU1qVHNhZTlReDNzRWlNbDNXRUFHMFU4dFpJckZXQkRTMzF1UWN1?=
 =?utf-8?B?NGExYk80Yk1LeTczK2NGcTA1Zldjb0FOeEF2V1h2L3ZHZVVka0t5TGxvRGJp?=
 =?utf-8?B?czJWaWRCRDFvaDQzV1cxN3BaZVJ0eVRlUCt4ZG1lMis3UWs1NFo1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e7CsOvJWjE6xrk4TxsAgkFKy6HvoowK1WfzafiknaVtjbBCmwaZO22GaSRvh2AcsRoOSTIoMYYOBZE4VatXDHdxibvySrAxQjSVppM1Gx2zGy8tTgWKhYlke2a6TrvFMicyA95HXCx4loJl6YeEEK1heUa/AGwt9oy+UduOK3m84/mcyPvlzou4t0/iHc36zh6Ss09sRU7wgqNooe8swibmWoXWGT67LRPSko03n6XKsepKmZn+3vu30xovFA53gPyo3Jc1m7l+l9NeFKt7Lerv8tKohNKllvr7eds0NogHOlydMMrs0FyhO/ScOT1fnIRf5exdLSyptyxmEWHKzyQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46b7181-56b1-432e-7d50-08deaa864f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 09:11:36.3342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jx8IPo4g7cxNhBdGR3Lbb32ihbQ/MMW3OgVKCTwpbCAG14UXVxgOVKplUgZ101Jw6td0cu581Xpbe4YlsFn+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFN3YXRpDQo+IFNo
YXJtYQ0KPiBTZW50OiBGcmlkYXksIE1heSAxLCAyMDI2IDY6MDggUE0NCj4gVG86IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bTsganVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbTsgU2hhcm1hLA0KPiBTd2F0aTIgPHN3YXRp
Mi5zaGFybWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMy8zXSB0ZXN0cy9p
bnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlcjogQWRkIGludmFsaWQtZmlsdGVyLQ0KPiB3aXRoLW5l
YXJlc3QtbmVpZ2hib3INCj4gDQo+IEFkZCBhIG5lZ2F0aXZlIHN1YnRlc3QgdGhhdCBzZXRzIHRo
ZSBDUlRDIHNjYWxpbmcgZmlsdGVyIHRvICJOZWFyZXN0IE5laWdoYm9yIg0KPiB0b2dldGhlciB3
aXRoIHRoZSBjb250ZW50IGFkYXB0aXZlIHNoYXJwbmVzcyBmaWx0ZXIuIFRoZSBkcml2ZXIgbXVz
dCByZWplY3QgdGhpcw0KPiBjb21iaW5hdGlvbiBzaW5jZSB0aGUgcGlwZSBzY2FsZXIgY2Fubm90
IHJ1biB0aGUgc2hhcnBuZXNzIGZpbHRlciBhbmQgTmVhcmVzdA0KPiBOZWlnaGJvciBzY2FsaW5n
IGF0IHRoZSBzYW1lIHRpbWUuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogQ2xhdWRl
IE9wdXMgNC42DQo+IFNpZ25lZC1vZmYtYnk6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19maWx0ZXIuYyB8
IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19m
aWx0ZXIuYw0KPiBiL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4gaW5kZXgg
MDYyYTk2OTFjLi5iMWFjZDExODggMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19zaGFy
cG5lc3NfZmlsdGVyLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19maWx0ZXIu
Yw0KPiBAQCAtNTksNiArNTksMTEgQEANCj4gICAqIERlc2NyaXB0aW9uOiBOZWdhdGl2ZSBjaGVj
ayBmb3IgY29udGVudCBhZGFwdGl2ZSBzaGFycG5lc3MgZmlsdGVyDQo+ICAgKiAgICAgICAgICAg
ICAgd2hlbiBzY2FsaW5nIG1vZGUgaXMgYWxyZWFkeSBlbmFibGVkIGFuZCBhdHRlbXB0IGlzIG1h
ZGUgdG8NCj4gZW5hYmxlDQo+ICAgKiAgICAgICAgICAgICAgc2hhcnBuZXNzIGZpbHRlci4NCj4g
KyAqDQo+ICsgKiBTVUJURVNUOiBpbnZhbGlkLWZpbHRlci13aXRoLW5lYXJlc3QtbmVpZ2hib3IN
Cj4gKyAqIERlc2NyaXB0aW9uOiBOZWdhdGl2ZSBjaGVjayBmb3IgY29udGVudCBhZGFwdGl2ZSBz
aGFycG5lc3MgZmlsdGVyIHdoZW4NCj4gKyAqICAgICAgICAgICAgICB0aGUgcGlwZSBzY2FsaW5n
IGZpbHRlciBpcyBzZXQgdG8gTmVhcmVzdCBOZWlnaGJvciBhbmQgYW4NCj4gKyAqICAgICAgICAg
ICAgICBhdHRlbXB0IGlzIG1hZGUgdG8gZW5hYmxlIHRoZSBzaGFycG5lc3MgZmlsdGVyLg0KPiAg
Ki8NCj4gDQo+ICBJR1RfVEVTVF9ERVNDUklQVElPTigiVGVzdCB0byB2YWxpZGF0ZSBjb250ZW50
IGFkYXB0aXZlIHNoYXJwbmVzcyBmaWx0ZXIiKTsNCj4gQEAgLTk0LDYgKzk5LDcgQEAgZW51bSB0
ZXN0X3R5cGUgew0KPiAgCVRFU1RfSU5WQUxJRF9GSUxURVJfV0lUSF9QTEFORSwNCj4gIAlURVNU
X0lOVkFMSURfUExBTkVfV0lUSF9GSUxURVIsDQo+ICAJVEVTVF9JTlZBTElEX0ZJTFRFUl9XSVRI
X1NDQUxJTkdfTU9ERSwNCj4gKwlURVNUX0lOVkFMSURfRklMVEVSX1dJVEhfTkVBUkVTVF9ORUlH
SEJPUiwNCj4gIH07DQo+IA0KPiAgY29uc3QgaW50IGZpbHRlcl9zdHJlbmd0aF9saXN0W10gPSB7
DQo+IEBAIC0yMTIsNiArMjE4LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VidGVzdF9lbnRy
eSB7DQo+ICAJCS5maWx0ZXJfc3RyZW5ndGggPSBERUZBVUxUX0ZJTFRFUl9TVFJFTkdUSCwNCj4g
IAkJLml0ZXIgICAgID0gSVRFUl9TQ0FMSU5HX01PREUsDQo+ICAJfSwNCj4gKwl7DQo+ICsJCS5u
YW1lICAgICA9ICJpbnZhbGlkLWZpbHRlci13aXRoLW5lYXJlc3QtbmVpZ2hib3IiLA0KPiArCQku
ZGVzY3JpYmUgPSAiTmVnYXRpdmUgY2hlY2sgZm9yIGNvbnRlbnQgYWRhcHRpdmUgc2hhcnBuZXNz
DQo+IGZpbHRlciAiDQo+ICsJCQkgICAgIndoZW4gdGhlIHBpcGUgc2NhbGluZyBmaWx0ZXIgaXMg
c2V0IHRvIE5lYXJlc3QNCj4gTmVpZ2hib3IgIg0KPiArCQkJICAgICJhbmQgYW4gYXR0ZW1wdCBp
cyBtYWRlIHRvIGVuYWJsZSB0aGUgc2hhcnBuZXNzDQo+IGZpbHRlci4iLA0KPiArCQkudHlwZSAg
ICAgPSBURVNUX0lOVkFMSURfRklMVEVSX1dJVEhfTkVBUkVTVF9ORUlHSEJPUiwNCj4gKwkJLmZp
bHRlcl9zdHJlbmd0aCA9IERFRkFVTFRfRklMVEVSX1NUUkVOR1RILA0KPiArCX0sDQo+ICB9Ow0K
PiANCj4gIHR5cGVkZWYgc3RydWN0IHsNCj4gQEAgLTM5NCw2ICs0MDgsNyBAQCBzdGF0aWMgYm9v
bCBpc19pbnZhbGlkX3Rlc3QoZW51bSB0ZXN0X3R5cGUgdHlwZSkNCj4gIAljYXNlIFRFU1RfSU5W
QUxJRF9GSUxURVJfV0lUSF9QTEFORToNCj4gIAljYXNlIFRFU1RfSU5WQUxJRF9QTEFORV9XSVRI
X0ZJTFRFUjoNCj4gIAljYXNlIFRFU1RfSU5WQUxJRF9GSUxURVJfV0lUSF9TQ0FMSU5HX01PREU6
DQo+ICsJY2FzZSBURVNUX0lOVkFMSURfRklMVEVSX1dJVEhfTkVBUkVTVF9ORUlHSEJPUjoNCj4g
IAkJcmV0dXJuIHRydWU7DQo+ICAJZGVmYXVsdDoNCj4gIAkJcmV0dXJuIGZhbHNlOw0KPiBAQCAt
NDM1LDYgKzQ1MCwxMSBAQCBzdGF0aWMgdm9pZCB0ZXN0X3NoYXJwbmVzc19maWx0ZXIoZGF0YV90
ICpkYXRhLCBlbnVtDQo+IHRlc3RfdHlwZSB0eXBlKQ0KPiAgCWlmICh0eXBlID09IFRFU1RfSU5W
QUxJRF9GSUxURVJfV0lUSF9TQ0FMSU5HX01PREUpDQo+ICAJCWlndF9yZXF1aXJlX2YoaGFzX3Nj
YWxpbmdfbW9kZShvdXRwdXQpLCAiTm8gY29ubmVjdGVyDQo+IHNjYWxpbmcgbW9kZSBmb3VuZCBv
biAlc1xuIiwgb3V0cHV0LT5uYW1lKTsNCj4gDQo+ICsJaWYgKHR5cGUgPT0gVEVTVF9JTlZBTElE
X0ZJTFRFUl9XSVRIX05FQVJFU1RfTkVJR0hCT1IpDQo+ICsJCWlndF9yZXF1aXJlX2YoaWd0X2Ny
dGNfaGFzX3Byb3AoZGF0YS0+Y3J0YywNCj4gSUdUX0NSVENfU0NBTElOR19GSUxURVIpLA0KPiAr
CQkJICAgICAgIk5vIENSVEMgU0NBTElOR19GSUxURVIgcHJvcGVydHkgb24gcGlwZQ0KPiAlc1xu
IiwNCj4gKwkJCSAgICAgIGlndF9jcnRjX25hbWUoZGF0YS0+Y3J0YykpOw0KPiArDQo+ICAJaWYg
KG5lZWRzX2V4dHJhX3BsYW5lcyh0eXBlKSkNCj4gIAkJc2V0X3BsYW5lcyhkYXRhLCB0eXBlKTsN
Cj4gDQo+IEBAIC00NTIsNiArNDcyLDEwIEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2hhcnBuZXNzX2Zp
bHRlcihkYXRhX3QgKmRhdGEsIGVudW0NCj4gdGVzdF90eXBlIHR5cGUpDQo+IA0KPiAgCXNldF9m
aWx0ZXJfc3RyZW5ndGhfb25fcGlwZShkYXRhKTsNCj4gDQo+ICsJaWYgKHR5cGUgPT0gVEVTVF9J
TlZBTElEX0ZJTFRFUl9XSVRIX05FQVJFU1RfTkVJR0hCT1IpDQo+ICsJCWlndF9jcnRjX3NldF9w
cm9wX2VudW0oZGF0YS0+Y3J0YywNCj4gSUdUX0NSVENfU0NBTElOR19GSUxURVIsDQo+ICsJCQkJ
ICAgICAgICJOZWFyZXN0IE5laWdoYm9yIik7DQo+ICsNCj4gIAlpZiAodHlwZSA9PSBURVNUX0lO
VkFMSURfRklMVEVSX1dJVEhfU0NBTElOR19NT0RFKQ0KPiAgCQlyZXQgPSBpZ3RfZGlzcGxheV90
cnlfY29tbWl0X2F0b21pYygmZGF0YS0+ZGlzcGxheSwgMCwgTlVMTCk7DQo+ICAJZWxzZQ0KPiBA
QCAtNTI3LDYgKzU1MSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgdGVzdF90eXBlX25h
bWVzW10gPSB7DQo+ICAJW1RFU1RfSU5WQUxJRF9GSUxURVJfV0lUSF9QTEFORV0gICAgICAgID0g
ImludmFsaWQtZmlsdGVyLXdpdGgtDQo+IHBsYW5lIiwNCj4gIAlbVEVTVF9JTlZBTElEX1BMQU5F
X1dJVEhfRklMVEVSXSAgICAgICAgPSAiaW52YWxpZC1wbGFuZS13aXRoLQ0KPiBmaWx0ZXIiLA0K
PiAgCVtURVNUX0lOVkFMSURfRklMVEVSX1dJVEhfU0NBTElOR19NT0RFXSA9IE5VTEwsDQo+ICsJ
W1RFU1RfSU5WQUxJRF9GSUxURVJfV0lUSF9ORUFSRVNUX05FSUdIQk9SXSA9DQo+ICsiaW52YWxp
ZC1maWx0ZXItd2l0aC1uZWFyZXN0LW5laWdoYm9yIiwNCj4gIH07DQo+IA0KTEdUTSwNClJldmll
d2VkLWJ5OiBOZW1lc2EgR2FyZyA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0KDQo+ICBzdGF0aWMg
dm9pZCBidWlsZF90ZXN0X3N1ZmZpeChkYXRhX3QgKmRhdGEsIGVudW0gdGVzdF90eXBlIHR5cGUs
DQo+IC0tDQo+IDIuMjUuMQ0KDQo=
