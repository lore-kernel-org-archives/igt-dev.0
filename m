Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA747FF60ED
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 08:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743D710E169;
	Tue, 31 Mar 2026 08:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5ANzDXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E03C10E169
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 08:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774946990; x=1806482990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1m3x/GrAJKnWNIF0ZRiDddyZgzPkFyk3PQvFOlFexVY=;
 b=d5ANzDXmcog87ff/tMkYQTdn1GwOQ5s0L383yL2KQ6HbIQp9d21/3d2M
 0R/y/t71urbvk7FDhtXmTcPmN+blJ+IZdWnEoGddBGrpr49mApfYsYjE/
 MZSDLKJbHYLpHNbApjT/2kEHN8/98SZu0YHhj+PgdpWGJ/QL1LJXQGCzP
 8Z/PNH/VhjndFxCUrBSAnTVObkEkpCVa7I7daSKYwQWt0VZdClqKFLFi7
 QHHhMnMSDhecD4har+hdkwFfTybbkc3jzHjUufBdRjzTzFcYRZCIifod6
 SaL/Re6xhQUz1gZjx8a1GHxyJBlhpdl1Fv8fHpPaeM4zDIK2speiMEfZF A==;
X-CSE-ConnectionGUID: 069r+9xxTKe2flhmB3/94A==
X-CSE-MsgGUID: g5pJiirkSImagMGzr17DOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87417097"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="87417097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 01:49:50 -0700
X-CSE-ConnectionGUID: /MDL/pD7TWODezhQeSeT6Q==
X-CSE-MsgGUID: 1KNwXg2oRr++W5grc7WSJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="231237888"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 01:49:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 01:49:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 01:49:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 01:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsdQ1daYRRO94nwOzUbMaRuMoVT6DLq5Ef6CNKrpZ2+udNLoz4hwr2rP+rkmLyYtpce19xpuqbDIMAjMX5qIdhrQBxVVnP/5xkSyFQ+nWkt2C7bBCGA8LOzknVDsukeVX+Kl50A4wp6mGS6oPkO7xvmwgS4gi9JB0bOH9rZdbxGlGKfaScPs4xlmYHd27TgCPVVcLIlYDQvFyWYicA0WeWqScRVZpIrbMHkPhMzZnoeKmt2PTmlp4mcr1awScCbI44DajSIDmeP9SNHLyqg54FHNZ6FgytGXijR/uh4sQP2PeYLcnRMnCqL9fZ1LXjLdCwNO4a/61btesped2ABJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m3x/GrAJKnWNIF0ZRiDddyZgzPkFyk3PQvFOlFexVY=;
 b=d0aRbJXUj2s7mwMX4/PxHnyoQiw06t1AbIWQz3j1HPx0BTvSkhfoEKpP952VNfW7+x/Rl3IHO65a3O18YaV5VJMrkFjSQg3quLokYHhg6zYe1sBVuitvfk3R+r5HJCprY49SLEn5bg4BW0qgYdl+MpPwzNsu9sgSY8Dhcjz91di5r9Nx2u04M0l4YS925IIebIJTLWQGbkb8SZN1CIfFLJZmGAzTkfYdM+MaetwlBL7QQCSOf1jaa5GF5J3MRB/DpRbrHqqm4HBa3wtuRWF9ITMHUmuPgoTauXNrNOngTq8CPAbh0NsV/TBUKv82qXdULjiO22tiYtoERzwsySAsMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 (2603:10b6:518:1::d41) by PH8PR11MB9605.namprd11.prod.outlook.com
 (2603:10b6:510:3a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 08:49:46 +0000
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::df01:30b2:d465:e136]) by PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::df01:30b2:d465:e136%6]) with mapi id 15.20.9745.007; Tue, 31 Mar 2026
 08:49:46 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 0/3] lib/kms: only keep valid igt_crtc_t around
Thread-Topic: [PATCH i-g-t 0/3] lib/kms: only keep valid igt_crtc_t around
Thread-Index: AQHcwBgFVsNJlDzkiECXZ8bpmfu0HrXHsOYAgACVAICAABBrUA==
Date: Tue, 31 Mar 2026 08:49:46 +0000
Message-ID: <PH3PPFAB4263235553A305AE50782780C86E053A@PH3PPFAB4263235.namprd11.prod.outlook.com>
References: <cover.1774856079.git.jani.nikula@intel.com>
 <acr_yGTKiF9n2jVH@intel.com>
 <91b83f2ab9e75e887aeca01adff0647299a42987@intel.com>
In-Reply-To: <91b83f2ab9e75e887aeca01adff0647299a42987@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFAB4263235:EE_|PH8PR11MB9605:EE_
x-ms-office365-filtering-correlation-id: b14f1143-bb4f-4bad-8f89-08de8f027625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: UKJqCB/byJ0Br0HbLZGAODkxwGNbJ5BugCAWOZf/OWSfEUhWFBCaT9zllBJv7dedHBepbEZiQz6ackHg6aqgnD7QK74xhYY9Q0vIyV/eTZIMgOZnOfHm3+LNXvu71fOKc8qHkTuKaiJsLqTzkKAC40ikPj/a4zgl9o6NLsHR7QOvqbZIDJ/zoExqB8FDJgCHMx/KlKvzv9cJwcrmjmG7uYL+sukLXqlliM4Xl7UqwgbIdEt1AQyRh0YU629jd8kHl59IIOQUDo4LilHpX9+MLN2j8RdviAA+SKRNpotJTwDKXPpOPcrNuCT8Mi7o35UjhnOiC2papQKf2y+han5aPXQopXw6Tcug5yZsfM2sLhzz5zBrxmKf8UxJJ7ufNEGfVpyYh1jsSZlwIg2583AYlJBgSChpVJpUE14gEK+CU1boBH2Dt9MIr3ZNXPLfMzuNJC2R5FNftD+Za99WiEueniI92iv9iJildXFoaf5lN1sWZfktXEhvtAM8XUlhz1ouOG7Nk+yWvL5LT91WLhTbWN1GF44GLjEVxMU6NI31cNr8YBBee59u5KhONeybxANaE8kmHuvh2y1h6CO7V2WG9uZjHYUktFPDQ8SwCI4Ha41VvqxKlN8ReMMIuxrGP4khCyDVa/CniTHc3ix/CKwTsjmi4riq9FugXNp+s4nS4K3k7ctJi6IOKoNEGSLGbNh+m6gvzMZ5WzlXvp3DT+XJEkd/yGm4RrgfZpZhXKSGnDM0IPlO8u2m94KQY5VgfJilc+nubAhaov8cgpKbV1pn/zoL3+M4Mrtju/aQCUHoNy0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFAB4263235.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnUwRDdWcWZ1a1pTSkozd29iKzZubENBa2pWZWpqeXhMUGw3NWo5TVV5V1Zm?=
 =?utf-8?B?Y2xRZGRwemlUejhVR0lGSDN1a29vWHZsQ1NDcndsZ2EyNHdXcDNnM0VtUnZp?=
 =?utf-8?B?QnVrMHZCVUpwVWNMN3dGdWFYb3pUUjlkdjd2cFBBTkdobXVQUEo0VTR3TU9s?=
 =?utf-8?B?dUNQYVlyK09nSi9Zdk9uSXp2SkE5VC9pbGRzcU5TS25pZk9BUHpLZC9pOVlq?=
 =?utf-8?B?TlFNdkNkSmZGYVhueFNScktvNnZRbXpZWjdiZ2k1Mjlmd05Sc2xtdGV2Rzhq?=
 =?utf-8?B?S01rN05mY1creS96dXBoQzdLM01tWW9TeXhycThUZHB1SW03bTF0ZjlwbkZy?=
 =?utf-8?B?QzQ2dkMwMTRQSUI3VldFdGZneThLTTFVTGVCaVZVZGRPakUvQ3I4UnFIV2FP?=
 =?utf-8?B?Tm5jOXIzQVUraysrTzc5cHQ5SjVpM3U2SXBibFEwd291cDZvUWhVVXNwS2lq?=
 =?utf-8?B?TXMyOThIRld5VWQ0QlFjUW5VaS9LdWdqNnRKMUNlVm9BdDVCR1RsNzNWbkts?=
 =?utf-8?B?cExReEh6d2hnVDQ5aWNQZ2xzZmFpYTNTMWRWQ3BwaXd1d3JhMWxnTmcrTm1O?=
 =?utf-8?B?Z0JVbzB5bm9vNVRBSGEycDI1SVR3YUZiWDV5TTlpc3BnU011YU45dHN2MEw1?=
 =?utf-8?B?YXdveGJTaUhPUFA0RGczTzBZanpKQlhOSlNzUks0dWRJNUVEOWtzK2N6SHZ3?=
 =?utf-8?B?YmhqZE1xaUltQk9DY0lScitwWjNIWUpWUm1TdlNEeUN5UnpPN0oyY3d6a3Iy?=
 =?utf-8?B?ZU4yZkNlSHpUc0FlL1hqMTN4YlBuRWVVTHpKcmhMVzQvZHBCbHhUc3BZSlNz?=
 =?utf-8?B?YjFObnpPcUIyc0F3cTJHcGVZaVpaM2Y5VVhiVlBjdHRhM0l2V1pzSzNEWkNm?=
 =?utf-8?B?dXpsSVVERE9mdi8zN0poVmt1N204U2htRng0MjFLWVovL1hjTVpvT0ZjS29K?=
 =?utf-8?B?YmV4aTJmRDRuTXNHL29RcCtFcXliZ2JVOVVnSWk0d0owYXVJM2NZR3ZRUWdo?=
 =?utf-8?B?ZTg0NHNiNVkwMkxsZEpiaHVrTE9MR3pjeSs4cm9YYlh1US9NcVJBNnlpcW1y?=
 =?utf-8?B?TE8ycE5EN3hBM1Zsdk9hUWc1cDlLVldxSmZNclJ1T1pOMmhvWkNWQ3k5MmF5?=
 =?utf-8?B?UHpNUS9GKzF4QnZMU2RYYkZWUUU4ZWpJa1V3Y2JXVGVQYkpzQVJ1cG9HUWs1?=
 =?utf-8?B?VkpCOHV5L2c5MmVVK0g2a0FOUndmTmhPTGFwM1U0NWQwTWxNSG1yTFFVUHd4?=
 =?utf-8?B?aSttbEd0MkNYdzdYMnFQc3Q5bFdERktQYjA4R0hGV21uRlcySVdkQURLU3l6?=
 =?utf-8?B?b3ZMS3UyR2ZsOHJNNVlnT2pVazJ3d21UcXBwZC9tODJSRHdjbjRBOTdBaVZR?=
 =?utf-8?B?QUFoTmVXc25pUjN5RjVBZjJKOFdMSWlFbFV6aGlLQXNYaU1xUHVZSW5jcnJN?=
 =?utf-8?B?S1l0YldmRHArR0FWUG8zcW1YSUNSMTQyN3RYdW13anVCUXVvWFAzc3NSKzI2?=
 =?utf-8?B?RmVyakYyMk43R2dWUDllNHpPMm1PWSthbjZCRis4L2tNbDV0SzNST25SYUNq?=
 =?utf-8?B?VlBGUUJONElHVnZRMG9hVmRDaFlQbEpZbGdnaXRjWVUrbTJYWkdFT1VQcCtP?=
 =?utf-8?B?WUtoMHRyY2pLd2RVVjdRVUNXWGpHNkxzUWVubkErU0poUWtkRkE1RXpKTDNT?=
 =?utf-8?B?T2tmVEpodUEvazViMUFRTkpGRDRSdytHTXhYSm91aThDRWVIbHNNN1ZJdy9a?=
 =?utf-8?B?amtjUU1mRUhnYTB5Uk84WDB4MndibzdOYWFDL1UvYzNGMzZ2bjlEcGNhRmx0?=
 =?utf-8?B?RTNwWmgydzNxM1c0UGFNM2crWmNzc1FNa1JibU9PcG5CYVl0NEpWZXA1VEhZ?=
 =?utf-8?B?SldmN1V1dVZ6MzVLdlBwakRSS21pOUhpWWF2WW52endhd0hLQVhLNTJ6a1N5?=
 =?utf-8?B?WWdBeGlXcVZRZm9OQkl3NERjL2Y5SVptM3owYmdNZ0pHZjVuOUVseEp4OVVv?=
 =?utf-8?B?RnhKdzJER0pBRzhIeUFHeWo1VzBETnUzck1xOU0zanlyYlRNdElQek1aaFZo?=
 =?utf-8?B?ZXJiTzR3VWRHelg5NW12cW1QcUpKVk9YSlFvQzhlOEJmQkFkaGZoblhNKzRj?=
 =?utf-8?B?ZUwrYmhLNWt5TVlIVmIzTndOWDNNK21PdzAyNEpaVkN5eDFjOHdDUjNVUDYx?=
 =?utf-8?B?dFlydTNhWTRSeFFuVGtzMWNzYnVtaThpTElJYkhJcnppajJoR2lhRkZ5TWdB?=
 =?utf-8?B?RmJzOUZ2Wmk3ME1FMVl5b0o3TXFKT0FyaXE2ajV4eTFvMEVPUWRBVzF0SFhQ?=
 =?utf-8?B?ZEMwWUl5MVVXWWxzbWFvMUd1U1lmenFQdjJ3V0hkODVXcU9uWWMxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l1Gmpwzz6f+WUPzGcJD5Xwgl5B78qD3qNVYRo0CJqdp1weGhPbiuzh0L+gMrmb5N5xIZQtDlhVt31paiAzSJ93/nTqnZALkz0nFAewj0ON6eaUE2d3iC351ViX5qoOlArW4zCvNPaVUplifnnP6jRXHoKJ/g3o5H2Ba+TCJsaEgsHV8LcLQgSo48XoCnrMhT31QckGSzoK3Ga0KDqT12uqusndlFKqZHRXff/Jpk0e3VO6xoixN6OYcoYzC9OJKPS/zU4lYA8mCeWSDzWBD8b3dJjRAg4sXLi8hJ8Cx+nZZUN89U6IZXFvd1hwCRHBLCsOLifjS9StjoRkvRr1lMrw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFAB4263235.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14f1143-bb4f-4bad-8f89-08de8f027625
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 08:49:46.7155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1VwtV8kreRI0jzN8qXoUD7dWfhNqkE11qypCQNSQNJignXAh7Z/eKkKuUbXbVP8laniB8ZipAToW5AMhfnEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9605
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0
LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEphbmkNCj4g
TmlrdWxhDQo+IFNlbnQ6IFR1ZXNkYXksIDMxIE1hcmNoIDIwMjYgMTAuNTANCj4gVG86IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IDAvM10g
bGliL2ttczogb25seSBrZWVwIHZhbGlkIGlndF9jcnRjX3QgYXJvdW5kDQo+IA0KPiBPbiBUdWUs
IDMxIE1hciAyMDI2LCBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPiB3cm90ZToNCj4gPiBPbiBNb24sIE1hciAzMCwgMjAyNiBhdCAxMDozNjoyN0FNICswMzAw
LCBKYW5pIE5pa3VsYSB3cm90ZToNCj4gPj4gT25seSBrZWVwIHZhbGlkIGlndF9jcnRjX3QgaW4g
ZGlzcGxheS0+Y3J0Y3NbXSBhbmQgbWFrZQ0KPiA+PiBpZ3RfZGlzcGxheV9uX2NydGNzKCkgcmV0
dXJuIHRoZSBhY3R1YWwgbnVtYmVyIG9mIENSVENzIG9uIHRoZSBkZXZpY2UuDQo+ID4+DQo+ID4+
IEphbmkgTmlrdWxhICgzKToNCj4gPj4gICBsaWIva21zOiBzdGFydCByZXR1cm5pbmcgTlVMTCBm
b3IgaW52YWxpZCBwaXBlcyBmcm9tDQo+ID4+ICAgICBpZ3RfY3J0Y19mb3JfcGlwZSgpDQo+ID4+
ICAgbGliL2ttczogdXNlIGEgZm9yX2VhY2hfY3J0YygpIGxvb3AgaW4gaWd0X2NydGNfZm9yX3Bp
cGUoKQ0KPiA+PiAgIGxpYi9rbXM6IG9ubHkga2VlcCB2YWxpZCBDUlRDcyBpbiBkaXNwbGF5LT5j
cnRjc1tdDQo+ID4NCj4gPiBTZXJpZXMgaXMNCj4gPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFRoYW5rcywgcHVzaGVk
Lg0KPiANCj4gVGhpcyBwcmV0dHkgbXVjaCBtYXJrcyB0aGUgZW5kIG9mIHRoZSBwaXBlIDwtPiBD
UlRDIGluZGV4IGRlY29uZmxhdGlvbiBhbGwNCj4gb3ZlciBJR1QuIFxvLw0KQXdlc29tZS4gVGhh
bmtzIEphbmkgYW5kIFZpbGxlIGFuZCBvdGhlcnMgaW52b2x2ZWQuIA0KDQo+IA0KPiBTdXJlLCB0
aGVyZSdzIHN0aWxsIGNsZWFudXBzIGhlcmUgYW5kIHRoZXJlIHRoYXQgY291bGQgYmUgZG9uZSwg
YnV0IHRoZSBidWxrIG9mICB0aGUgZnVuY3Rpb25hbCBjaGFuZ2VzIGlzIHRoZXJlLg0KPiANCj4g
QlIsDQo+IEphbmkuDQo+IA0KPiANCj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsDQo=
