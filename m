Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143D9C021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 16:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F2810E3D4;
	Tue, 18 Feb 2025 16:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oh37cuHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1153010E3D4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739896774; x=1771432774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yDlWCX/h9DHYrrYFsWurLiaE1U6hK2mFYlO0anZ0BsQ=;
 b=Oh37cuHtqs/oMdDmHGqWmhvoY3iIUpQPamgFe2gfqq0k0HnqBHgACXpo
 liEuNYDuYoWG1M1dgRFQNii+BkHpeJiAKoevkISNFdi47/GBTFG11SCMQ
 mjIx8CL8Exgw6XHGlbZvA9vXUBsXmZLVXnLJndPWarzI30BT3H9rteRMv
 VVVCVaewRY+psnhBZOOJ0jQhncwgiZ3UClLudOci5lJl04EyIhIVzJOEt
 tWIFAc+2D5Z+OviZ/lJTX7PxYCjIGqvRJPmnU3uWtOieNJ9qLgEM8dMvh
 ZEUVQIbNZVs5LqBOllYcNmyR6SalVAgbM2uJawx0mu8UdNTgG9v5MSuxP Q==;
X-CSE-ConnectionGUID: doNbbX+1SYqxeUOt0S9kqA==
X-CSE-MsgGUID: RuaubdA/TfiwWC55k1S+ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51222750"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="51222750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:39:33 -0800
X-CSE-ConnectionGUID: NUQXRczwQIunH7t58IYsSw==
X-CSE-MsgGUID: cS3BbTLNQu2iLMugaFRKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151661237"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:39:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 08:39:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 08:39:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 08:39:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7qoGTzahwkJvPHtnOPjwWHgnPFPm93Lv0PDCRH5pdxH2Wa4WnXMaM9d2yab8AbmeJaIeS2tJwUDJ/ZMmsnC/kck8tqg4N66p6hmMR3RwJugDscqqzn04GQe1+Fo+jY53HmF+yaNinMcP3ZAv0TrrL3PYD0/SXLzimbxzn6YhNC7eexo7lnczzpkCmnWettAmc8wxWBjxSRq3nv6rmic7Hk7H0Ljz8VEve68KsaaaenpjDjjwcz5SFwi3vmAzJRx0JO4Yt7qqa9D5KBtm1NOYd34FepVFhyYDOKOaqqsRpiqomZpw6V2qhWYEooL97cSlO32lGMC/HyLvd36mk7b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLBzuG6JbW8drqWdaP0+uX2eIb6rySkvQMG5J2AXFB8=;
 b=Ch7+nweRYSlRyXYB+RoCyYpOiyyjF33eM6u7BEfa/Zr7H3QIGa9D/gbJ2Tp0xq4rMBGFDULMOHtAvmDcA4x1z23QvnyIvzqBFCPdNhSzpLSiY2jpXQGIg17kcSKK49TS8t/oBb9aW6iCHLsWnxElgKeB/VufxHI6Sy//+FzOG5KLuR99Z+FhLeCUrG6AZOyzp32OP+7LwBVjTMD5wpg5JLncfF2l9bOLE1dbiC7RVZWd+YmprmqsCFHfteYKgF9IONCWczuLiDdIei82UAN1OiAanC1zYzSEG8p3vocerCd2kMBfO+kK9If49LLGFDqigPUsjdQDuP+4BcIvMIVS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 16:38:58 +0000
Received: from MW3PR11MB4731.namprd11.prod.outlook.com
 ([fe80::3ea7:b5f0:2f72:c615]) by MW3PR11MB4731.namprd11.prod.outlook.com
 ([fe80::3ea7:b5f0:2f72:c615%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 16:38:58 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [i-g-t v2 2/4] lib/xe/xe_util: Introduce helper functions
Thread-Topic: [i-g-t v2 2/4] lib/xe/xe_util: Introduce helper functions
Thread-Index: AQHbgdKNRraRh6sU0Emvcn6R+IaYKLNNORdg
Date: Tue, 18 Feb 2025 16:38:57 +0000
Message-ID: <MW3PR11MB4731087A0BBBA655D0FC44D492FA2@MW3PR11MB4731.namprd11.prod.outlook.com>
References: <20250214215920.282425-1-oak.zeng@intel.com>
 <20250214215920.282425-3-oak.zeng@intel.com>
 <20250218065831.zdxx3aqmdnorzo4l@zkempczy-mobl2>
In-Reply-To: <20250218065831.zdxx3aqmdnorzo4l@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4731:EE_|BL3PR11MB6388:EE_
x-ms-office365-filtering-correlation-id: f5b32f96-466d-4790-1834-08dd503abdda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5YOv6kgRh2fgeSrJjBFSMa7quOGw+47TY/bnKZbYJyTHB1xuyB3hmVj8RE37?=
 =?us-ascii?Q?Fg0osA/0vM5evVRgwhJ2ggMZTqLWCIkYhqaF4/ZL4Y238XUrKf/rWltO/Zd2?=
 =?us-ascii?Q?56zWT8pQZxlCGz+KHw/UO0F12gD4TJXNE9T5xcYYFd6564LuFKqlfFoi2lzI?=
 =?us-ascii?Q?JV1tpzs9IWpqBFwOgPxioPuNUFd64j0j0EaBTph2K8t3ToIx7vThkH1NNK62?=
 =?us-ascii?Q?H2E1+x38YwJnJLoplsbuH2ODubHdqWFkNMWWxAEEh3bFDQUUoVp6x56AYVIP?=
 =?us-ascii?Q?sLEIUmv7h7ZVlmUB45zqC9jk2Mfaj6J4+VNzv0lLqQTGkimnKOCJqe+rZTn8?=
 =?us-ascii?Q?2m7dzU3PcMrYykvYIoOS5VAd1up1D8/Osi+VzuH17TkRVwGiMs027ZYjfQP0?=
 =?us-ascii?Q?AE4Iqw8CQ8I1XycmgEhrsa3UWHxQ4FfKS4zi8P2W81av3J4uPMKVZvrfnJl0?=
 =?us-ascii?Q?Ib9V2svIUh+5MN7CLbbmoPM+wLa8L7c0WfjTPQncxwO6ey50df0b46BKQJpc?=
 =?us-ascii?Q?OECEegPu+QRTASKnBVezoovcA44f1aIIBBQYV6NTG7c/2nnsGX1d3qrpKY8+?=
 =?us-ascii?Q?0qXmri9eNk3eSmSnhOBglyNTrB0pXXux0Bp+DWqAU8W4zKBjm6HeD1xZztSj?=
 =?us-ascii?Q?xs7ElGnHA+Lm2mv7jDA41Z/HJvizgWaWZRZdST8gU7LSvmfOm3tQbSTexL3M?=
 =?us-ascii?Q?scE/ML3R3OJeVry/0JPP0rhNkpkvFi7mgWDEVHqLm0USE0zwY24HbDhiJ0Le?=
 =?us-ascii?Q?sW2nwOTUzBAn77SSqF3UaLRtqacAC3oSoyCTfttkzmxxI/oej5IiE6vXDkNh?=
 =?us-ascii?Q?1MhSPGwWeWghcd+fO2ir93JWRmAp7JPwBpWbIGHRglzugJV00fhFySuUOTSf?=
 =?us-ascii?Q?6UubYLIt7U46rckx+RhEcWSIzg5WogSToMpWJsAwXLT3BBo9joU9mOj56xvS?=
 =?us-ascii?Q?vy2S6inW796FEjgNDFcNCzBB8fRog86EPV9m10NmZcJXckBvxLSFqWgRyjCX?=
 =?us-ascii?Q?qgypOO8rLnmvYQWqn1dWgl7x+1fHLPAAGJLF1MfE8XykxUYD9cnHsvjsfqMu?=
 =?us-ascii?Q?AGEM4umvYFRbVRJ+SymnMQaf0j+ywCAfPG7RqXjkPeZWCgbvYb7God+FXvNO?=
 =?us-ascii?Q?9oT737TKF9LxjU53Xf+0fGGA7ov68rmswwukVWR/qNe5+1lz75XpH7/S34VR?=
 =?us-ascii?Q?0pnoTg/25+DEw/6UrQnPBVp/arhrmCIX9FZyuGScAEsiqorpNg4FBznavkD6?=
 =?us-ascii?Q?2ZFVgO+O+b+jvR0Qxd3zzgJXY8+OUbnJ5VqSKCch0x1mH+dHIWcerleGYCqU?=
 =?us-ascii?Q?ITrUQQ4BAODgqcXmp+/CihnhNpP+cahpVJ6HgrkbZeWEq99zfVcv8/JutQl/?=
 =?us-ascii?Q?1LddWUcjf9kGpfidYGKhowxpwJ7M5Tm9rn1Ko3x48wD+VYrgZ4MseelQmQWg?=
 =?us-ascii?Q?cgUkc3AyedGwUuJYb8u8Fq3D168b2pLe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4731.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Eiu5VwKOtcp4yDb2vC+ZXtjf6BlbLUijFTp4ycC5Vo5uexQJ6ftwbjRFs6Ek?=
 =?us-ascii?Q?dPBwoco8Qg844w9WvwomCuceGT87ACHgXRQjYJHdyPtQzQxJaS7YBt7M8TTB?=
 =?us-ascii?Q?KGDN0DXUo5LbJmC9JUeHD0rqCyBOKKk0Pg8k4TjYv3FXH/2d8VIsM2UySWI7?=
 =?us-ascii?Q?z3q2XZbYSk0VrerJpDGmqCy10C+l+OR7Vgmxr1tdDa7mySqFWifxpoWxwNcK?=
 =?us-ascii?Q?fRbotCRp5rtP2ueGeif6bfHEX5VFfMKNzrHjPjhDZJcgsZzrL+ic6piq5kd8?=
 =?us-ascii?Q?aEby6vVPl8/8tBUdONXlKdyu1PPWuylojx1hQkIghIWsDeVeUyvUbAI19LUB?=
 =?us-ascii?Q?Hskg9sH+5ZuJd+djJb8ZwvWARokQsUvOta2e5gFBjQqLJNr175qJO9Roj3JY?=
 =?us-ascii?Q?PvlG0B6LBvk04gHAn1pDW+sSdrOZ4vzixBX6IDtZekmft7zFzjQNzLBPMHvD?=
 =?us-ascii?Q?Se+HjUJOwqqXdSp2JDs3pW2kBroD76UJYzwhCdf/e/QgHHnpRUKh0RC1r64f?=
 =?us-ascii?Q?UKjybmJOwCjEBHFH1dE6figQFajcTdWOCO8byLTUeEA6VQLt97mdSIOhLwuu?=
 =?us-ascii?Q?cO+IHdctOkH6WVdDFD+9CYL1Lj1oMj+sVFc/UpKBqVM6Qh2/zopJSZyZ6vik?=
 =?us-ascii?Q?ouwgcSEZl9FkN4gcDlGa13NbaYIfyzScHQ11ee+jNDi0bWTv72rQZlizPGX9?=
 =?us-ascii?Q?9ghW40QO68RTkU2kDAqVoAbZP32iF5FF3F0UACv2c02T1EishYi4Ne36tusZ?=
 =?us-ascii?Q?zrzEc0wWt7cUzgh8AsXiiK1YBhudq/RQjoHXe0DP4ZsCWRY5SNsoZ5ifdVLY?=
 =?us-ascii?Q?cbrNG/tUsBQPEzal5VvjyC7LQnLHQpYYjoFS1GZvPZuXfzhSX0YB3MfcDDRe?=
 =?us-ascii?Q?T6QFkuQGdaKyd06YCgbifPaiJorLXbJNFKCDsaX/jAbGw45BBtuccObbAWc2?=
 =?us-ascii?Q?6Ft3zzs43t9QE37jlakpwjFsnNEwt4SKg8HsSGVQe/a85Vjx6YOdB+9qtEx9?=
 =?us-ascii?Q?FgghQrk/N+GdwJyM+WpW29iXa/FfY23ILHxUMFQ0HksrlD/pKxvE2F1hw9ga?=
 =?us-ascii?Q?LDlDBmt6CiRzBRg6VL94+wxPT43cq1N9MnknLHNT2vVbs6zMSctTI9Ykh7bk?=
 =?us-ascii?Q?NTZ2HDnKYfjSu4HItlMGyHtIOUVIaYistVxL0nZHv9ZUHqv0/aGmR9enN4x1?=
 =?us-ascii?Q?G51oE4liMzz5R0IUKlb2FObscx899dk/wXvM+9281OMKZgMRxNsOf+W1FN+M?=
 =?us-ascii?Q?aJanPdv+PZSRIsozRq93Vhy1dthz8yLCPpm45USBM/iEzwzYKq14ube816nK?=
 =?us-ascii?Q?nKLUfzsbxVKu+b2LyuO7UmnR9wBt7MOnYXrq16XkRiTgbDIElOcC6bhzeov5?=
 =?us-ascii?Q?xV8alWp8RfGWga6rv1yCzMUOJuXkiDLtgwYh/eoxC7hgiZEu0aebh5XSLEys?=
 =?us-ascii?Q?ID0zS+0NoZxO6shIZN3TlLIBQNVqZET3jzw5pc/Detpsl3s+t+cZTxPh8sjp?=
 =?us-ascii?Q?Jy4DUqJApa5ofpulWuz53B8NMFMnkxZKWhJ8mVaJJqiBB2OPr4DBbjLJU5NT?=
 =?us-ascii?Q?B2Q97bQ4DQKpn+qGM8E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4731.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b32f96-466d-4790-1834-08dd503abdda
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 16:38:57.9439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWTI+QLfnR3If1omugkhh92JPSEpWKQbpEWufP5MGhSVPuUH7XDqGRWiJ4t49HYsVoQgAqHl9cqkfBP5M4mZgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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

Hi Zbigniew,

> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: February 18, 2025 1:59 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Thomas.Hellstrom@linux.intel.com;
> Brost, Matthew <matthew.brost@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Heikkila, Juha-pekka <juha-
> pekka.heikkila@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [i-g-t v2 2/4] lib/xe/xe_util: Introduce helper functions
>=20
> On Fri, Feb 14, 2025 at 04:59:18PM -0500, Oak Zeng wrote:
> > From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> >
> > Introduce helper functions for buffer creation, binding,
> > destruction and command submission etc. With those helpers,
> > writing a xe igt test will be much easier, which will be
> > showed in a coming example.
> >
> > v2: use to_user_pointer to cast a pointer (Kamil)
> >     s/insert_store/xe_insert_store (Kamil)
> >     s/cmdbuf_fill_func_t/xe_cmdbuf_fill_func_t (Kamil)
> >
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  lib/xe/xe_util.c | 201
> +++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/xe/xe_util.h |  33 ++++++++
> >  2 files changed, 234 insertions(+)
> >
> > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > index 06b378ce0..fcb904ce7 100644
> > --- a/lib/xe/xe_util.c
> > +++ b/lib/xe/xe_util.c
> > @@ -13,6 +13,207 @@
> >  #include "xe/xe_query.h"
> >  #include "xe/xe_util.h"
> >
> > +/**
> > + * __xe_submit_cmd:
> > + * @cmdbuf Pointer to the command buffer structure
> > + *
> > + * Submits a command buffer to the GPU, waits for its completion,
> and verifies
> > + * the user fence value
> > + *
> > + * Return: The result of waiting for the user fence value
> > + */
> > +int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf)
> > +{
> > +	int64_t timeout =3D NSEC_PER_SEC;
> > +	int ret;
> > +
> > +	struct drm_xe_sync sync[1] =3D {
> > +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value =3D USER_FENCE_VALUE,
> > +			.addr =3D
> xe_cmdbuf_exec_ufence_gpuva(cmdbuf),},
> > +	};
> > +	struct drm_xe_exec exec =3D {
> > +		.num_batch_buffer =3D 1,
> > +		.num_syncs =3D 1,
> > +		.syncs =3D to_user_pointer(&sync),
> > +		.exec_queue_id =3D cmdbuf->exec_queue,
> > +		.address =3D cmdbuf->gpu_addr,
> > +	};
> > +
> > +	xe_exec(cmdbuf->fd, &exec);
> > +	ret =3D __xe_wait_ufence(cmdbuf->fd,
> xe_cmdbuf_exec_ufence_cpuva(cmdbuf),
> > +			       USER_FENCE_VALUE, cmdbuf-
> >exec_queue, &timeout);
> > +	/* Reset the fence so next fence wait won't return
> immediately */
> > +	memset(xe_cmdbuf_exec_ufence_cpuva(cmdbuf), 0,
> UFENCE_LENGTH);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_submit_cmd:
> > + * @cmdbuf Pointer to the command buffer structure
> > + *
> > + * Wrapper function to submit a command buffer and assert its
> successful
> > + * execution.
> > + */
> > +void xe_submit_cmd(struct xe_buffer *cmdbuf)
> > +{
> > +	int64_t ret;
> > +
> > +	ret =3D __xe_submit_cmd(cmdbuf);
> > +	igt_assert_eq(ret, 0);
> > +}
> > +
> > +/**
> > + *xe_create_buffer:
> > + * @buffer Pointer to the xe_buffer structure containing buffer
> details.
> > + *
> > + * Creates a buffer, maps it to both CPU and GPU address spaces,
> and binds it
> > + * to a virtual memory (VM) space.
> > + */
> > +void xe_create_buffer(struct xe_buffer *buffer)
> > +{
> > +	struct drm_xe_sync sync[1] =3D {
> > +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > +		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > +		  .timeline_value =3D USER_FENCE_VALUE },
> > +	};
> > +
> > +	buffer->bind_queue =3D xe_bind_exec_queue_create(buffer-
> >fd,
> > +						       buffer->vm, 0);
> > +	buffer->bind_ufence =3D
> aligned_alloc(xe_get_default_alignment(buffer->fd),
> > +					    PAGE_ALIGN_UFENCE);
> > +	sync->addr =3D to_user_pointer(buffer->bind_ufence);
> > +
> > +
> > +	/* create and bind the buffer->bo */
> > +	buffer->bo =3D xe_bo_create(buffer->fd, 0, buffer->size,
> > +				  buffer->placement, buffer->flag);
> > +	buffer->cpu_addr =3D xe_bo_map(buffer->fd, buffer->bo,
> buffer->size);
> > +	xe_vm_bind_async(buffer->fd, buffer->vm, buffer-
> >bind_queue,
> > +			 buffer->bo, 0, buffer->gpu_addr,
> > +			 buffer->size, sync, 1);
> > +
> > +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> > +		       USER_FENCE_VALUE, buffer->bind_queue,
> NSEC_PER_SEC);
> > +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> > +}
> > +
> > +/**
> > + * xe_destroy_buffer:
> > + * @buffer Pointer to the xe_buffer structure containing buffer
> details
> > + *
> > + * Destroys a buffer created by xe_create_buffer and releases
> associated
> > + * resources.
> > + */
> > +void xe_destroy_buffer(struct xe_buffer *buffer)
> > +{
> > +	struct drm_xe_sync sync[1] =3D {
> > +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > +		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > +		  .timeline_value =3D USER_FENCE_VALUE },
> > +	};
> > +	sync->addr =3D to_user_pointer(buffer->bind_ufence);
> > +
> > +	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer-
> >bind_queue,
> > +			   0, buffer->gpu_addr, buffer->size, sync, 1);
> > +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> > +		       USER_FENCE_VALUE, buffer->bind_queue,
> NSEC_PER_SEC);
> > +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> > +
> > +	munmap(buffer->cpu_addr, buffer->size);
> > +	gem_close(buffer->fd, buffer->bo);
> > +
> > +	free(buffer->bind_ufence);
> > +	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
> > +}
> > +
> > +/**
> > + * xe_insert_store:
> > + * @batch Pointer to the batch buffer where commands will be
> inserted.
> > + * @dst_va Destination virtual address to store the value.
> > + * @val Value to be stored.
> > + *
> > + * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a
> batch buffer, which stores
> > + * an immediate value to a given destination virtual address.
> > + */
> > +void xe_insert_store(uint32_t *batch, uint64_t dst_va, uint32_t
> val)
> > +{
> > +	int i =3D 0;
> > +
> > +	batch[i] =3D MI_STORE_DWORD_IMM_GEN4;
> > +	batch[++i] =3D dst_va;
> > +	batch[++i] =3D dst_va >> 32;
> > +	batch[++i] =3D val;
> > +	batch[++i] =3D MI_BATCH_BUFFER_END;
>=20
> What BBE is doing here? Function name is confusing, you can't
> glued this with something else. I would suggest to at least
> return index of last written dword, to allow adding other
> commands to same batch (I mean passing &batch[last_index]
> to other functions).

Good point. I agree the interface should allow appending multiple
Commands to one batch buffer. It will make this library more flexible.
Here is what I plan to do:

1) remove the BBE from above xe_insert_store function. This basically
Leave the command buffer open to add more command
2) introduce a new class xe_cmd_buffer, inherit from xe_buffer. Xe_cmd_buff=
er
Has a private member to store the last_index. Obviously last_index doesn't =
belong
To xe_buffer. Plus xec_queue also doesn't belong to xe_buffer, only belong =
to=20
Xe_cmd_buffer. This give us enough reason to create new xe_cmd_buffer class=
.
3) reparameter/repurpose the xe_create_cmdbuf function: only create buffer =
and
Initialize class members, but not fill commands to command buffer yet.
4) introduce separate interface to stuff commands to command buffer
5) introduce separate interface to close command buffer by add a BBE comman=
d
To the end of command buffer.

With this refactor, we do requires extra codes in writing a test. With the =
current
Interface, we can create and fill command buffer calling one API. With abov=
e refactor
We would need call 3 APIs (create_cmd_buffer, fill_cmd_buffer, close_cmd_bu=
ffer).
But the new approach does look more flexible.

I will implement above. Please let me know whether this is a ideal plan for=
 you.

Thanks for the review Zbigniew!

Oak

>=20
> --
> Zbigniew
>=20
> > +}
> > +
> > +/**
> > + * xe_create_cmdbuf:
> > + * @cmd_buf Pointer to the xe_buffer structure representing the
> command buffer.
> > + * @fill_func Pointer to the function that fills the command buffer.
> > + * @dst_va Virtual address of the memory location where val need
> to store.
> > + * @val Value to be written to the memory locations.
> > + * @eci Pointer to the engine class instance for execution.
> > + *
> > + * Creates a command buffer, fills it with commands using the
> provided fill
> > + * function, and sets up the execution queue for submission.
> > + */
> > +void xe_create_cmdbuf(struct xe_buffer *cmd_buf,
> xe_cmdbuf_fill_func_t fill_func,
> > +		      uint64_t dst_va, uint32_t val,
> > +		      struct drm_xe_engine_class_instance *eci)
> > +{
> > +	/*
> > +	 * make some room for a exec_ufence, which will be used to
> sync the
> > +	 * submission of this command....
> > +	 */
> > +	cmd_buf->size =3D xe_bb_size(cmd_buf->fd,
> > +				   cmd_buf->size +
> PAGE_ALIGN_UFENCE);
> > +	xe_create_buffer(cmd_buf);
> > +	cmd_buf->exec_queue =3D xe_exec_queue_create(cmd_buf-
> >fd,
> > +						   cmd_buf->vm, eci,
> 0);
> > +	fill_func(cmd_buf->cpu_addr, dst_va, val);
> > +}
> > +
> > +/**
> > + * xe_destroy_cmdbuf:
> > + * @cmd_buf Pointer to the xe_buffer structure representing the
> command buffer.
> > + *
> > + * Destroys a command buffer created by xe_create_cmdbuf and
> releases
> > + * associated resources.
> > + */
> > +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf)
> > +{
> > +	xe_exec_queue_destroy(cmd_buf->fd, cmd_buf-
> >exec_queue);
> > +	xe_destroy_buffer(cmd_buf);
> > +}
> > +
> > +/**
> > + * xe_cmdbuf_exec_ufence_gpuva:
> > + * @cmd_buf Pointer to the xe_buffer structure representing the
> command buffer.
> > + *
> > + * Returns the GPU virtual address of the execution user fence
> located at the
> > + * end of the command buffer.
> > + */
> > +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer
> *cmd_buf)
> > +{
> > +	/* the last 8 bytes of the cmd buffer is used as ufence */
> > +	return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size -
> UFENCE_LENGTH;
> > +}
> > +
> > +/**
> > + * xe_cmdbuf_exec_ufence_cpuva:
> > + * @cmd_buf Pointer to the xe_buffer structure representing the
> command buffer.
> > + *
> > + * Returns the CPU virtual address of the execution user fence
> located at the
> > + * end of the command buffer.
> > + */
> > +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer
> *cmd_buf)
> > +{
> > +	/* the last 8 bytes of the cmd buffer is used as ufence */
> > +	return cmd_buf->cpu_addr + cmd_buf->size -
> UFENCE_LENGTH;
> > +}
> > +
> >  static bool __region_belongs_to_regions_type(struct
> drm_xe_mem_region *region,
> >  					     uint32_t
> *mem_regions_type,
> >  					     int num_regions)
> > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > index 06ebd3c2a..df3d81801 100644
> > --- a/lib/xe/xe_util.h
> > +++ b/lib/xe/xe_util.h
> > @@ -14,6 +14,39 @@
> >
> >  #include "xe_query.h"
> >
> > +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> > +#define PAGE_ALIGN_UFENCE	4096
> > +#define UFENCE_LENGTH		8
> > +
> > +struct xe_buffer {
> > +	void *cpu_addr;
> > +	uint64_t gpu_addr;
> > +	/*the user fence used to vm bind this buffer*/
> > +	uint64_t *bind_ufence;
> > +	uint64_t size;
> > +	uint32_t flag;
> > +	uint32_t vm;
> > +	uint32_t bo;
> > +	uint32_t placement;
> > +	uint32_t bind_queue;
> > +	/*only a cmd buffer has a exec queue*/
> > +	uint32_t exec_queue;
> > +	int fd;
> > +	bool is_userptr;
> > +};
> > +
> > +typedef void (*xe_cmdbuf_fill_func_t) (uint32_t *batch, uint64_t
> dst_gpu_va, uint32_t val);
> > +void xe_create_buffer(struct xe_buffer *buffer);
> > +void xe_create_cmdbuf(struct xe_buffer *cmd_buf,
> xe_cmdbuf_fill_func_t fill_func,
> > +		uint64_t dst_va, uint32_t val, struct
> drm_xe_engine_class_instance *eci);
> > +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer
> *cmd_buf);
> > +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer
> *cmd_buf);
> > +void xe_insert_store(uint32_t *batch, uint64_t dst_va, uint32_t
> val);
> > +void xe_submit_cmd(struct xe_buffer *cmdbuf);
> > +int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
> > +void xe_destroy_buffer(struct xe_buffer *buffer);
> > +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf);
> > +
> >  #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
> >  	(xe_region_class(fd, region) =3D=3D
> DRM_XE_MEM_REGION_CLASS_SYSMEM)
> >  #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> > --
> > 2.26.3
> >
