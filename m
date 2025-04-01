Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0407C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 11:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802CF10E0E1;
	Tue,  1 Apr 2025 11:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbWNdC1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B2310E031;
 Tue,  1 Apr 2025 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743506646; x=1775042646;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UzE2if6gMzkeZcz+p+pXAQzBk2fka8mE++j9w9TWzWc=;
 b=gbWNdC1u0Sj49ixWKTcc4g3nyZFjr4m1ZBDC8TDBYR5qIsWKyg91ce0R
 jNr+PXyfIImFsrXR+jrzFlEGUsHmKpHKdsitrW+wYAbcJXgeqpQaNiUZU
 mUxctSuRXGH0gS2FRFRZQL+4HEkfEuwoL2hd8cTOPOGn0qm+nujAPqZLE
 /LNX4i7CzkWY9twlB610kJz8nCvWjZrRKZ6OSwuUDu+F9uC+QdQ8JqsTG
 BRWlVq+tLXxy61jxQV4LnUW53mvAPtsFczfY7ccLArVzeydS73dPgdT0m
 r7V7O0obP7EEOLln5Cmjis+QCHX4hVTQGy7acShsQsahajae/d8lXVtpJ w==;
X-CSE-ConnectionGUID: yPl80qgdTzGpeLo/E6MYdA==
X-CSE-MsgGUID: pVXjkscYQJmzWjz78ukV2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="67296063"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67296063"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 04:24:06 -0700
X-CSE-ConnectionGUID: nFUuWXzZQQm8lp2ddMgPsA==
X-CSE-MsgGUID: ls/4VFHoQ0yrubpNuEZfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="130491418"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 04:24:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 04:24:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 04:24:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 04:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE6fe+X9fwP2RbJeDc6WgM2Cz/X0FK61PyCo7+VECHmqNLuZcs4S5/sZNyGF+3dus7CSuxxC6cn9Bf/KoyruH8dOHPQ6cYXe5XITOaFA6FaglnSO3fTLcqBc5k7Xj44GJGnV2cMH35I+g0HqKxKZIX+veVxN099pl5QSNURKg8CkmsduapPrVibHv5ARaBOU6AQsNt2e6larNfcxssQzqYStEBpxZos8veMys3HlKyRqsP1CBkSwfZiwCTF/393ZNs/2QXkMx6g8CAo4DwEx71IS/HMskzildQL1LMzvKFpnMFTTk/sXSAiWtmC1ZxZ+kgIYvoXwzjgjElI73Zrp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzE2if6gMzkeZcz+p+pXAQzBk2fka8mE++j9w9TWzWc=;
 b=H5uxQzy2JOzfe0o0l67GlkHZHnizGnwi9427r49IFmVkVon0+pJ49HBtJNKlIxU3Fwd/YBayslQWe/8g6dng6coQ0psGO7Igsgd9+wWtEjx/Q8NQsa5LZo1Kj5hSi23Zz9S5B0YRBGYERLBfHNmU/w00UQXPZoNPoagVRynLYtdqS/UrVZZln+vKVcrwYSrBXCkpFTC9rwOIKjJy6Joima69rOvRsl24jrE17Su+xkHopyF26CA+/O67RZCg+rLk2UvRFJ/nbKFlKYrUa9LeZVAa1UXtidYhI9uwyQ6jaolDOy+tWardtR7vNBVk7gbYwpsP589WRT2C+VGlHmUbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Tue, 1 Apr
 2025 11:23:21 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%3]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 11:23:21 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwv?=
 =?utf-8?B?aW50ZWxfc3lzZnNfZGVidWdmczogVW5pZnkgc3lzZnMgYW5kIGRlYnVnZnMg?=
 =?utf-8?Q?testing_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9pbnRl?=
 =?utf-8?B?bF9zeXNmc19kZWJ1Z2ZzOiBVbmlmeSBzeXNmcyBhbmQgZGVidWdmcyB0ZXN0?=
 =?utf-8?Q?ing_(rev2)?=
Thread-Index: AQHbouCzUsvCWCSsz0SojH1K3arvWbOOrBgA
Date: Tue, 1 Apr 2025 11:23:21 +0000
Message-ID: <CH0PR11MB5491AD955DFBEAC49421CC30EFAC2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250331180538.57393-1-peter.senna@linux.intel.com>
 <174345303947.21282.16998098774139701799@e6b6f09ec485>
 <7db3db71-2d7a-46a3-b078-5e70ff358189@linux.intel.com>
In-Reply-To: <7db3db71-2d7a-46a3-b078-5e70ff358189@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CY8PR11MB6842:EE_
x-ms-office365-filtering-correlation-id: 566afb48-d43c-4bfc-7925-08dd710f9c27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UDVHczRRd0hMUVkxaTlLSmZjcXlVbXlOK1d2MXQrdVVoNW9aWjl2WGJKY0Uw?=
 =?utf-8?B?NzZIb1BoN3BRaFJtU2FBUGp6eUMxNzVlbmxxMTBzUUdHS211bXZjNkpGV0Js?=
 =?utf-8?B?akJuN1ZObzVPNmo3ajB0WkVuWmtIZmJGN3V1YWJ3Y0VHMjBQK21Ea1lxdjcy?=
 =?utf-8?B?L2RoQm9TbnpaTG9jSlJuWXQ2NTBBaE1ZYjhWeWhRVWdBcVdmQUowYVppSGtm?=
 =?utf-8?B?YWNpNlpMNklaY1QxSzZvYnlaYlBvc1pINi9sNGlNU0JZeDR2U1M2d05oeGtu?=
 =?utf-8?B?N0dxYWpWbHBJTkFiY2NyaHF6QTVnQ3pBMHdrVlFSUGY4NlAxVnR3OFZpWEJX?=
 =?utf-8?B?eGVvalZaZm9aQWhENzkvT2VzcG5Qd1dDRHJ4dm1ibFdGckl0THlRdEZRVEVz?=
 =?utf-8?B?ZTQ0U0JwVWhRaXBkeUtCK0ROTTI2Nm5kS3ZrVEtVNzVSdktyS0JmN2lUOFdS?=
 =?utf-8?B?UTBDREVIL2xseDNrNEovQ2tMek1DSkpOU3BQcEVydmdxYVVnQzhmL2JxYWxH?=
 =?utf-8?B?ajVPZnVndmx6eXRCTk1uOXcyOTJWbi9wWGkrRzRubzBFOTZsQkhsaUpTQjBZ?=
 =?utf-8?B?cWhieXpKdHBVdlN5aVFBbVBFTmx5WE92cHZWQVF6cUdxMkxVV2VQTDNOREdw?=
 =?utf-8?B?YnFYRlF2SGFkWjhIdVh3cW4vM2JRZlZYckcxYUdzaHc3dXFqS2dhcktLYUFm?=
 =?utf-8?B?em9QSGFid2wwS0hhdmt5blhsMCtUYVllM1Y4N25naTh3ZytoYXRpSHJ3YkdQ?=
 =?utf-8?B?WE1MZ3I4aTNBZHJ0eGZvWlNDRWJlbkhTRUZqS05Wc21yVVlCdWUzQXhUbzM1?=
 =?utf-8?B?bDNOc1RWOVdYaktCT3hRVDJoWHA3eUJiTGxydFZ6UXZ2YU5mSjUwV0tHRDNY?=
 =?utf-8?B?N080blFJWDJPQlV2dXNlbUh5UDA2eTFWbjRlYVhtb0RvaWY2VVpMb3h5SUV2?=
 =?utf-8?B?S0NhdzJXM1grNnJFeTdaazhRZVRVVGZaOE5mdXg3NHg4ZTRwWWdCVXpnM3pH?=
 =?utf-8?B?WVEyeEF5STVhWFBjclhZeFgzZHpwVENnd2FJN2U3YlFCL09Vd0xQZkhSTzJl?=
 =?utf-8?B?amx6U2VVMnhuSVo3SkVnUURCRmJ3K3orUUlWTmgxaG04NjZHV0gwakhwQmth?=
 =?utf-8?B?dHYzbDhxem5JZkJUK3daU1NnM201dTdlaHgwVnpldjV5elR2NUorYWlkejdB?=
 =?utf-8?B?UDd0VndwV1lYR1FpallPeUZPcldkSjNITCtPcDN6eXRGeUhTcWhLQ09LUXdK?=
 =?utf-8?B?ZDNEQTVlc0w2UGo3eTVvU2IvYU1NT2FscEE5RUZHYlV0K2ZCYkNGOGx5TGZ2?=
 =?utf-8?B?NXkyMFFwZUlSZ3NiMFdiZms3VlRMTFBPblVpa0FmY2dTUG1pbmdFS2cyL3lT?=
 =?utf-8?B?TXJUbVIxYW1nK2d0cjVhai8zaGFYNllOLyt3SzQyWlRaSExvdkMwVUpxZzZr?=
 =?utf-8?B?NFZhcUxzZDFWYWtJemxKejZSUFNxTlBPQ0N1cFJHWXdqSCsvcFJDWW5VbEJl?=
 =?utf-8?B?QWJ6ZmttYUhuZUMvendUZjdNRnFvL0JtYU5RNnRTSlh2NXBRdm0rcmx4S0xD?=
 =?utf-8?B?aEc0QUdPNk5YWGM4a3AvM2hwQjFxOTZPMElicEd2cDBybmJoaE9OK2UvRzNG?=
 =?utf-8?B?U2RMRjV4WVRpVVlndFZKNEEwWnBtY0JUWjBqYXp2U2NkK2hjbTRwUnB4SHpV?=
 =?utf-8?B?akFvVnFhV2lXSnZqcUlRVkVjNWU5TnpsZFpFcjJFd0E4ZlFQNFhhR2dUaE9M?=
 =?utf-8?B?SjZpSE56RlRsS2Q2TnE3VEcrT2phNlYvZVR5bXg3WEdUd25hZ0dMdmdWNU02?=
 =?utf-8?B?V1I4RkxFTzh5UUpBNk11MEcyQ2dwTzBRN0szK1AwSUJBb0FnTXVYWStGT1Na?=
 =?utf-8?B?RFZIWGRhK1puVHoxazlXZHgvTFdOVEFreDhDV3dxdUI3SHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?em1JSjMxcnZqSkhsMXZ4bkxMMkNVNS9DZHU5UEZsNTMrc0VEREV0ZjV4UnBm?=
 =?utf-8?B?dnVXb29MOGZBSk9tVG82bS96TXJrVS9MT3VETGxTeU13RjY0R3VOczR4V1ZP?=
 =?utf-8?B?c1pKZVd3dUVGREhneVdpbTlqUzkzOGZubjEvSVJjY3dqT0RlT2JCSXBtTUNj?=
 =?utf-8?B?dDBlaXA2M1NzeWlsUU55ODlSVHBucGZnUHZLRCt6WUJ6bndCK2IzRTRHMFdE?=
 =?utf-8?B?OS9id2I0Vjh3bEhlY1h2MFdoTWVnbjU3KzlpR2RtR1lHL3NJLzc3QXZaTTJL?=
 =?utf-8?B?WDVBUW93Ymg0U0doQStpeDd6eU9VOGxNcVYvTGxkbksrb2tQTDhoNFgxaEdC?=
 =?utf-8?B?cDJydlRwUGxJMC9ZaWlramhvV1dMVUhTY1h2SlZaTWdzWDR0WG5hOHk1NlFk?=
 =?utf-8?B?M1pzeTVYUlByM0ZwZTVyVVZNUHVRNnFMdUQ0d1V4V1dLS3MvcUU5a2UyM3ZL?=
 =?utf-8?B?THc3L0dUSFdkVnc0dTRXZDMreFVpYUxvbkNEUHRQMllhS3RVWG40UFNubHBy?=
 =?utf-8?B?SnlGNnp6UCtJb1FWUzdEcjduQ3dkdXVCTURoZHU3Y1BzeFNoVlViWTErejlW?=
 =?utf-8?B?SjB0WnJSMnM1dmJmT3VqMWN5SlRmWWpwTSszeWM0MUJ0TC9YMjJUbjg4L1RS?=
 =?utf-8?B?bFBQcmwwcTJ3a1NHU1RseTFlc25Wd0UwZzNjZzl1ZHVBVEtLYWtCbS92eVZn?=
 =?utf-8?B?cVRlOURJNElCQ21PeWc0L0ZxU1ZySE1YTmdoMXJ3NTJyTTZFWDdpWXc4aVZk?=
 =?utf-8?B?S0xCYURRSkpRbUVHQ1dueFlSQUVaQlFuRXBMQkxZZUZ3Z3UvOTU2RUZDL0lM?=
 =?utf-8?B?ZTZNQ1NTQk9ldzV0QVFtSmtsNzY5NitoMWVXTVl3cnB2ZjdUVm1NT243SjNr?=
 =?utf-8?B?cDc2WlBHcDJyMHF6ejBTRVNTV2hBSGZUeFAwQ0pzM01haVVRSHNhZXluMGt1?=
 =?utf-8?B?cFVMNzNiYmJvNzZYd0VuOWxoaVlxUkdORlAvYWEzZlQ0M1BDRmdIRzgzK250?=
 =?utf-8?B?SkNzU1BaZUZCNHVYZG13YW5HT2Z6MVVXd1p6bkxhT0xZTnFwUlYvd3VOQkx3?=
 =?utf-8?B?bnl2UVh2UjNiUjIxSHlxUXNGa2I5V0U0b1o5cm1QMjE1Vi9Mekx4ajBpMmtJ?=
 =?utf-8?B?OWJOSlNKL1V0ZUtiQko0RjRVSklUYVFLcHh1c3RVcU1rYkI0V0ZTWHpBTkhI?=
 =?utf-8?B?eUdVTkN1OUFVb1VDRkk0RlduaitjTmovYlk2TW5NSjZ4SG1Yd3Q3UVBYQ3Vy?=
 =?utf-8?B?MzUvR1YxRCt4RHEyWUE5WEsvWEdtY2Zzek8wNW1FdlZvZWdZSHgzSWVrRDlL?=
 =?utf-8?B?VlptWkJIOTVNZFEwWGNGV2xLNnlYZUU1NllFUW51azNseDhMalN2NFpXQUo2?=
 =?utf-8?B?NnJvMk1SQWt1QUZrQ3VFanpSM1BVUEFKVVQvQnpMM1JZK0NEUDFEQVEvenVW?=
 =?utf-8?B?bkFhQnFXMWt5ckV6ajFFZnpXa2VWMkphT3ZtY01XRER0dHNkYXYzclgxMjJz?=
 =?utf-8?B?Q1RKTExiRjgzSGpLaWYzaE42MFlLNTQxRjVYQ1I4K0p4NklkR0pab3JWa3pI?=
 =?utf-8?B?SFUyYXNpMjZ1RHhpUDQ0UE1Wc05DNFhnUStXU1hCdzgrRUxGdGxLbHpGMlV2?=
 =?utf-8?B?VHUrRGVkMGp4VUFRSUdyUlFKYnpKcy9rSm1LQkF1ZjhzdmtuZjlGUWFJZmRY?=
 =?utf-8?B?Z25lNDQ2UHpPODVSaU9zZk1zMjFMREhRY1JweXZuMTRMTUJxU21nUDVFWGVQ?=
 =?utf-8?B?NnRkeGtVOS8xVHJ0Ri9adlI1Z1VXMlFCUG0vdFNNRXI0U2t0cDBpNGR2T1VZ?=
 =?utf-8?B?bitIQUNrY2kwMXJwYkdDblI1OWdheWd0azBGcFNDekN0OVE5enljdG42UGs5?=
 =?utf-8?B?ckEwYlRmcnhRVkZvT2RRV1ZKSjE0YisvUW1UczZHR2szU0g2Y0k5RVR3K00v?=
 =?utf-8?B?b3BSN2FwZnYycG95QzFpL2FCUEs0S2Z4NGNpQ2hMNXZLeS9FUHdHdW9HYkFV?=
 =?utf-8?B?SnloY2R3R205RzJ5dUpYL2RJVGZuS3hpa2FNTDVQcDVxVXRNR2NDaGgvUVpM?=
 =?utf-8?B?ejFWcTZDTUU4SnhBdDVVQThjZElHZzRFYUZPQyt0Szh4VFdZTVkzMWpNSW0w?=
 =?utf-8?Q?GPlrSgtF72KNWq9o2bgflWWU9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566afb48-d43c-4bfc-7925-08dd710f9c27
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 11:23:21.4301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1nvm+7omfCydNlfN023CZZPPUomdKe6M+UIjzTMEFuoSRIJvN0L5hR3CNr9aNQ8ROAy2Raa6UmejgdTWjvfL3j38t1GNXD8WRrDqzfrRHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ2OTQwLyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KDQpUaGFua3MsDQpS
YXZhbGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJh
IDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYg
T2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDAxIEFwcmlsIDIwMjUgMTQ6MDMNClRvOiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3Rz
L2ludGVsL2ludGVsX3N5c2ZzX2RlYnVnZnM6IFVuaWZ5IHN5c2ZzIGFuZCBkZWJ1Z2ZzIHRlc3Rp
bmcgKHJldjIpDQoNCkRlYXIgSTkxNSwNCg0KT24gMy8zMS8yMDI1IDEwOjMwIFBNLCBQYXRjaHdv
cmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2lu
dGVsL2ludGVsX3N5c2ZzX2RlYnVnZnM6IFVuaWZ5IHN5c2ZzIGFuZCBkZWJ1Z2ZzIHRlc3Rpbmcg
KHJldjIpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xNDY5NDAvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4g
Q0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBJR1RfODI5NCAtPiBJR1RQV18xMjg5MSANCj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4g
U3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMg
dW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEyODkxIGFic29sdXRlbHkgbmVlZCB0
byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUg
cmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAg
IGludHJvZHVjZWQgaW4gSUdUUFdfMTI4OTEsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAo
STkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0
byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNl
IHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjg5MS9pbmRleC5odG1sDQo+IA0K
PiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg0MyAtPiA0MikNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+IA0KPiAgIE1pc3NpbmcgICAgKDEpOiBmaS1zbmItMjUyMG0gDQo+IA0KPiBQ
b3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBh
cmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJ
R1RQV18xMjg5MToNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2li
bGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+
ICAgICAtIGJhdC1tdGxwLTg6ICAgICAgICAgW1BBU1NdWzFdIC0+IFtBQk9SVF1bMl0gKzEgb3Ro
ZXIgdGVzdCBhYm9ydA0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUXzgyOTQvYmF0LW10bHAtOC9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlLmh0bWwN
Cj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RQV18xMjg5MS9iYXQtbXRscC04L2lndEBpOQ0KPiAxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4g
DQo+ICAgDQpUaGVzZSBhcmUgdW5yZWxhdGVkIHRvIG15IGNoYW5nZS4gUGxlYXNlIGZpeCBhbmQg
cmVydW4uDQoNCg==
