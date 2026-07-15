Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A33C44501
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 08:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269A10F1C0;
	Thu, 16 Jul 2026 08:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVf1DBip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3654110E13E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784105268; x=1815641268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HcrYR/9NfpabNnE5GeiSGXjhOZKh85GmigVRIxkZFQY=;
 b=dVf1DBipiXhMT0rgrl5bZBKtHOyLJKDiiyJrH6zS7nM65+9jJhvyTvIl
 6PlMlA4W4eCpwoDOeqWz0i9L5cPW66uIua+TAF3Iw283TQtpDskoHOkdO
 4IEjqBrHFK5taOFsSibLLI6b7eJdSqA12ub7RvUU30fFnW44zKNnn+oep
 NYdFFQRR8SQNpg0fYdNl3driQh0H4aFrnabk6eRu23IBJJQczP7YiOJ26
 VTejSZmgyoQp3bALRt9MnC1PFLl8b5Fe40yC/2rmD55+0khHwna5Dqqjq
 7F0TcHiHlKtDjldgRJob02v6WQJpZvrDHfap9RwxsqBDbhurKsB721TqP g==;
X-CSE-ConnectionGUID: TJYsrfapR5e1j9oCoz2feg==
X-CSE-MsgGUID: 9LjfCRIeQgSiYRgVbspGFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110282429"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="110282429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 01:47:47 -0700
X-CSE-ConnectionGUID: /c4nCVp0RSut1xdVh8V3rw==
X-CSE-MsgGUID: FeyRNj0SQuKiz3oMSKKS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="251709159"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 01:47:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 01:47:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 01:47:46 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 01:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4C6TJIMuE8VUJjALrKpiRK0NMxIK2wV2OXglzKXvCim7Qr+4jRGJZATKZ7AzG8q0b7+9oHzRpMc8G/uu3hb3dSz2ai/yoKS0ueg0argwRAA6LSU/HqVyXx0mMjpWc7vgO1EE3L5G3W45olbEU8M8TkIBPF9RT7BXAJ7DDeDGnKqMGPmgiSmcjqzNBfbgpkOTMHdrbm69bd2p09Rtk9WnLIGY/KiaBBsXBUV59RPEpq4rsPe5CGKtgKcOjy9wlqakxjbjSSek4GZaaKcLacKvA6Xs9X9ogbiUYKspFw4Ksk/XSMk0nVhlKS+T9bKc6GozCP9Vcg+254RCLr2Cgje3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/TEclbY8FZ6Fzr66mZNBJLTLhTH2RvGrJGz2fCp/CM=;
 b=KxKRIwygDQzhjIIzrpYiw4dqIT/ip8zd5y2db3nZ29Rt7o44S+eICGlwwbEVaVGVnGPLy9z8KaDQ1eTIyJDoyv2XiNbA9QC0hUv/wNuxMg4f/oQhOzqTeF3Kx33wt+vgfvWZh+JE72LjyYJCGFbgJxi5HWWA5DAHrzZlnBW+JhvslZdSHFWaXugvO4Lh8sD6gOXhIcoXu4TZHULrNQ/hNUyEq6IM/DGPQbrjVMug7hXBxKi2qHfDe0/2yQSb+DTXuPWP+FP71L0rC1veSNheIH3U6VzwciWlCRGmSdjccMCGb8wwWHI0e4PkQ+4EFC6c+733rr2zsUZhXd9hOs12TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 08:47:42 +0000
Received: from LV2PR11MB6072.namprd11.prod.outlook.com
 ([fe80::8afa:b964:cae5:aa8d]) by LV2PR11MB6072.namprd11.prod.outlook.com
 ([fe80::8afa:b964:cae5:aa8d%3]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 08:47:42 +0000
From: "Nallamothu, VijayaKumar" <vijayakumar.nallamothu@intel.com>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on
 VF/VM runs
Thread-Topic: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on
 VF/VM runs
Thread-Index: AQHdEuDhPbJNPD1n50e0zQKbLMRZnbZr1XgAgAEtKwCAAUOFQA==
Date: Wed, 15 Jul 2026 08:47:42 +0000
Message-ID: <LV2PR11MB607205EFBD0DEBA95ADA2E7E88F82@LV2PR11MB6072.namprd11.prod.outlook.com>
References: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
 <6373280c-ac15-4bbb-88e1-e35dd820b610@intel.com>
 <dd4d6e2e-a816-46c8-b2fb-4eb4c9a1d8db@intel.com>
In-Reply-To: <dd4d6e2e-a816-46c8-b2fb-4eb4c9a1d8db@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6072:EE_|MN6PR11MB8194:EE_
x-ms-office365-filtering-correlation-id: 4a52172f-cdcf-403e-896d-08dee24dbbe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: oLCxHHAncUC4x13Ls77rzDvUivjSOVwDojICnKWcBy/oRu3vqqE6SZlbKtnZPdAVhaYfWFyulgUzl+TUGg9BGXPAuy+D8rPQLyEB675ydRx4oovZ8YKkXRdHg0qhFTGqrDANeEvSGCBWfxMyvjFdtMoqlKXjvha4w8mfwrFj0KsjWhNlkeYcjMLfKPtMASgF2ircHZpqYySK704he542skunTMUoz9IlkTw2slPXhcod47/862tBjRdwvYrLChNvHWqHzTpRvL27fhM8xxnGGoVlJGbHiF9ac1dAsFnCJUI6/MLkfbconPx2OoKB4HlS1TTNsUoS35/KXz9oyrVohVVhns9L6aEfFVtQ0GhKX2ztj7CCPxH8g38gUNjPD/21mhwpp7x1MQFRhATWUfl0uaxURS9xVHbOKMnyQ51twgj7Ejx8dqjiu0yqNjEhsL3g/iSlIaDamuFsD/zgTjBhUzQ+Gj3MJ2naY1LxvCDBWwnY5ECa69/0MuYA1jCfMVA+w188l2MIVfjcuNtpHVa6bwCFnnZnNViLP81jxAWc38jNKdBlv+WnCM0IdwIVbXHc/7TW6v9OG8jeOLsVHqCQTmIfPOo/wsjzKHk2Kr7Pz3H0HVjCO9gIGXJeWJiFEWKa1ebWaFEnxYporOAwJkWNZwwVO6n7AXazJir7cVvtmf8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6072.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yLL5eVE20xeydQdEnbgnsDXNJrtUVEcY6tnoUDq2Td2gjCeZewwbCip7j4fl?=
 =?us-ascii?Q?rx21SMLnnWwGPK4g7DnejxnhnyzJp68jSnSdV1EXgdnxmDzim06ygxVDKncg?=
 =?us-ascii?Q?FTnrx8Lucsq/YRyg65VgTXCKE2HLy4piSvKbyJ0GkfKd+obwv62DPaCzy+Va?=
 =?us-ascii?Q?ixecX7ZVqvfEjaPNma+eVg4i/gqVwTodxyd+HvQB5SE7duI2IyaZvg1sNlWh?=
 =?us-ascii?Q?Jwk9m7yYaC3xyLIdN+VrnfNzxzjTbrUQgBBJWqrWRWMjWQd5EJgf/G1MndmU?=
 =?us-ascii?Q?SGPbaP4A+IbL0tfEtFn+qZqW6jXDWGml8s8gvnU3Z/AQxuzGF71WGHF0A3jO?=
 =?us-ascii?Q?4Lt3wk2Cl3kYwztG+ShEhQoIJLciRt4/5WBcZLkPZ/0cWo8mE2QXDs/n/CsR?=
 =?us-ascii?Q?MbxUkhPEpjJ3e52tnZUqjIbSkOLPc/ZhyEhsQAdbkzlEasFvAadwmNhwKr1E?=
 =?us-ascii?Q?UIKYuS8RsmMHVmj+ZWqWuC3+vbgi7pgOxkmcipm4Gw99kPRIBvvlRAnWAgpq?=
 =?us-ascii?Q?/G+FiHCLe/L64OLhc5mxBNJKPMfCM9nrdCrBMfRTDfbY/T8UracGzrbTkGxd?=
 =?us-ascii?Q?JqZAlonhtTB1TrvrO80bXLaGeAr1m489zg7H3L/HVPItwTpqfTsuGn1JxYbi?=
 =?us-ascii?Q?a0VW4ZS3QJ0aYrMfofOoyd4zT0ZR/kYUcCF1xJTYb+Jqdyx9EFLp/srR2POS?=
 =?us-ascii?Q?B+HuH7/X4jO/PUEGld9W+TgpbvKlHUIb001j/ezSw2MuC9pb/ZxhUn8xtUGA?=
 =?us-ascii?Q?Ohmz8idFiEJX6jurQYEpsk1R4vXJDGlwIdpqup2/yhbhPNY7plwj8l1hIXaI?=
 =?us-ascii?Q?e1hTIw0brm6ZFsMZ0jvRCXrXxEHyuVnKibakjfMPaj4KtdBQUQG8MDHuYHWy?=
 =?us-ascii?Q?ly1KK7CscP063fQKjqtJUddzdVpIseU9sqF+dUYtuKvtjteqiX+A0ihzeJ8g?=
 =?us-ascii?Q?7suSiAkAtNZWm7+FM8kcMffrFGX5F2C6UaoVaAAe32gRGyWvOJEzEVwOLhsr?=
 =?us-ascii?Q?0pJOXkh1Lp7w924hgNea+8psfy1ebTEcZHTqhaoDS6TIoq7QBJPtqyzFAmdK?=
 =?us-ascii?Q?jX9ywVs07b1ySoPRqMwbXkQ7vuR8ZwyfmnsvjmBtmC1gPXFIwta8zIAjGyMi?=
 =?us-ascii?Q?zV68QeYXCXlhtetDZG9+VmsXOratuVNnEuiMRwH0vBblWx/D08lBTJ10+aZ0?=
 =?us-ascii?Q?vEPa4RBkEb43YWi075xGevGm7BB3i6m2RAseKA3J0EQaLXvbltrt65d53lDc?=
 =?us-ascii?Q?himeWd9ZuSJxo9OZDwRdIhpnCS6Jn5tY0s3065dLuDBIhSQ4TqNNO2/IDKSj?=
 =?us-ascii?Q?XUnNsaW4EDcZCUVO1hItAPPw4Cf3NsmEJUmgmLFQB58FmC3/yzNjQB55Kh+n?=
 =?us-ascii?Q?tNOYkGhdSsm+6xYNguTCIAwVaNxqSytyjuBCd2HwMMG1hepkvXRHfwS9/409?=
 =?us-ascii?Q?6rf1tDOEGPNvL3DrhAJc0yR8bxubA+sf7zAEG5lqctzGDcYSDwrPbQCKcuFw?=
 =?us-ascii?Q?8Z3SYaxkeyZxkMZlzrEvp+Mz4SvEtIttPORo+kkCebBcsFFAHd2YhfsXsRFv?=
 =?us-ascii?Q?BG9pM3AyFXUtoH56gfXtUlCn/EouM2K++i1Z7ulNWI1L3rM7QTmvm4xWPoTQ?=
 =?us-ascii?Q?AqkdV4tHvVgC+v4grmqlVhy4LeYjzZIWsK+C6zYf1m7sh8R/Z8T3gk24YWOU?=
 =?us-ascii?Q?uz/P//F3mrahnuTeJAGNaowPLHVckzHiBZEDAJ4ZWw7OehIAAAb5MsTEqtyf?=
 =?us-ascii?Q?uurA8rj/AxqZxI1UUPpnLgw/Mnd1Fog=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CYeDTRw3L2mTN7e4ltogRHEuI7+04DvHoKPgjf8maWpOa/2KC1KWF8vWCOk0AbHIJ8LrUTL0L/YgUaozISo9tUPwsCF3vczmRukzXh80q3dpup6x22o7RF0JWs3CaOVmcC+EvmGvZgAzaceaF0J93OtEwh14dOgeq07LpYq0xcLp6qLcmpcxD09UluCg7z200haoAbGPO3Mde/HHxFVENJvjgAQvmpxe4OEE6v213qRHknLOSLRYMwwpCtG48h5XsCwYFKccgzoPlmQ8uIPoyaVBqdHevBT04nq70kYF2TLcdG+ZSs7DhqumSVzxEDWqAFkP9OgJMz3aC82hL1nH5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a52172f-cdcf-403e-896d-08dee24dbbe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 08:47:42.5710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSYJCWrzv8rTWmlVHJ7IWdweM3B44LnWHEKMp3r7pFo3geGAHCe7Fpz1wJ43W5JNyaezuF3aSGMPV8j8ovTJrvgtmUfl8CmxlRPYT3u5GRQYG3NrF8sp7ZwtW7+od4Mp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 16 Jul 2026 08:12:27 +0000
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

> -----Original Message-----
> From: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
> Sent: Tuesday, July 14, 2026 6:55 PM
> To: Wajdeczko, Michal <michal.wajdeczko@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>; Marcin Bernatowicz
> <marcin.bernatowicz@linux.intel.com>; Laguna, Lukasz
> <lukasz.laguna@intel.com>; Nallamothu, VijayaKumar
> <vijayakumar.nallamothu@intel.com>; Rudnicki, Piotr <piotr.rudnicki@intel=
.com>
> Subject: Re: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on=
 VF/VM
> runs
>=20
>=20
> On 7/13/2026 9:27 PM, Michal Wajdeczko wrote:
> >
> > On 7/13/2026 6:53 PM, Jakub Kolakowski wrote:
> >> SR-IOV and EUdebug are mutually exclusive features.
> >> Block EUdebug tests on SR-IOV VF/VM runs since they will inevitably
> >> skip.
> >>
> >> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> >> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> >> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> >> Cc: VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>
> >> Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
> >> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

The change looks good to me, you are good to go.=20
Reviewed-by: VijayaKumar Nallamothu < vijayakumar.nallamothu@intel.com>

> >> ---
> >>   tests/intel-ci/xe.sriov-vf.blocklist.txt | 8 ++++++--
> >>   tests/intel-ci/xe.sriov-vm.blocklist.txt | 9 +++++++--
> >>   2 files changed, 13 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> >> b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> >> index 4a19aa943..7b5bd2165 100644
> >> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> >> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> >> @@ -9,7 +9,6 @@ igt@xe_module_load@.*
> >>   # tests applicable for PF only
> >>   #
> >>   igt@sriov_basic.*
> >> -igt@xe_eudebug_sriov.*
> >>   igt@xe_pmu@.*fn-engine-activity.*
> >>   igt@xe_sriov.*
> >>   #
> >> @@ -60,4 +59,9 @@ igt@xe_query@.*cs-cycles
> >>   #
> >>   # Tests that need to be executed in VM instead.
> >>   #
> >> -igt@xe_live_ktest.*
> >> \ No newline at end of file
> >> +igt@xe_live_ktest.*
> >> +#
> >> +# Tests related to EUdebug
> >> +#
> >> +igt@xe_eudebug.*
> >> +igt@xe_exec_sip_eudebug@.*
> >> diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt
> >> b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> >> index 6271b1a70..0a02abaa8 100644
> >> --- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
> >> +++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> >> @@ -10,7 +10,6 @@ igt@xe_ccs@suspend-resume
> >>   # tests applicable for PF only
> >>   #
> >>   igt@sriov_basic.*
> >> -igt@xe_eudebug_sriov.*
> >>   igt@xe_pmu@.*fn-engine-activity.*
> >>   igt@xe_sriov.*
> >>   #
> >> @@ -57,4 +56,10 @@ igt@xe_pmu@gt-frequency
> >>   #
> >>   # The feature query_cs_cycles is not supported on VF
> >>   #
> >> -igt@xe_query@.*cs-cycles
> >> \ No newline at end of file
> >> +igt@xe_query@.*cs-cycles
> >> +#
> >> +# Tests related to EUdebug
> >> +#
> >> +igt@xe_eudebug.*
> > are you sure you need this?
> > it looks that we don't build this test anymore [1]
> >
> > [1]
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/ba8c03812b25
> > 93752b1d7ab31c104bec63ca21ec
> EUdebug support may be added to the kernel in the future along with the t=
ests for
> it in the IGT, this patch will ensure that once it's added testing won't =
be triggered
> on VMs (or VFs).
> >> +igt@xe_exec_sip_eudebug@.*
> >> +igt@xe_live_ktest@xe_eudebug
