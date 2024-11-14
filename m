Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651FFD65C45
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198D310E794;
	Thu, 14 Nov 2024 06:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKZCswT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277D310E33E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731564653; x=1763100653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wzONXW99FDJNXBo/1sWSk/UW/n76y8Zhd/DzgJo4WF0=;
 b=AKZCswT+lL7PvrIPK7RUvTqOT3YjPteI4hnmwSJb1TVlGjYQp8HBY4yq
 OGrZ3S4o/ejVTcVfmRwt8jOjXr0lZmFMgLndPGfYLJUHZbHdMlWgkYcVa
 8rxrVymiR71c+vWiibut40qTtksnxVwp326Shu0EdLNbWpJtRwicq6rzU
 o+OF9aYPFdi7leCjxT3ojG9TbGpu3say4ifWe3TUalJ5TARzd6lQ9Obyz
 1Tsc4Zy8tuzseyecQ+XggNU9u7/BH8s8NKKjeJ/ZEQ6dF1vF+gOav05Jb
 h+qVtEXPpitDDFaXkPlylNy7/Km8uyBttn2M0qLdX0Ut4q7UtWKjvAapn g==;
X-CSE-ConnectionGUID: NvM2FA9RR++twPJKGS18Kg==
X-CSE-MsgGUID: 5toH9G/DTtW4Y91ikmWmMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="34350203"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="34350203"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:10:53 -0800
X-CSE-ConnectionGUID: pGKpNXH8ROmodEnVeKYbvQ==
X-CSE-MsgGUID: yd2XjriyTAm7z3Py2WH+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88881767"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:10:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:10:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:10:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:10:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIWUz5MFQzwRupVfgbXThUBCxuhAnFw0Y+GPvXGZZdsWc53ZyzoHpPhf6cVEE74IrPavIeorGkoEHng64XqXEaCmxbjPDyOppC/zPtBIF3HiznND6DcRG/EyYzNxjLRPy+7B4wT0sAnHSMCetImC1UfcgDdtMZxq40VCUd57uSmmMRmYWXXZWP6bTmcK35Qje8N7WcRyn0UIwR4jVelD5UqUc+X93x2g3saer8IAlmIa3M+ZuGebnaMDt8FIhLXRqQgTMkkG+vFhnKtrgT9oxqwH2WggFnYbo+ASfqmRlHPDH89rd2bGorHxu8pnKy+K20mHHrjqpBH6jFZ+KzbgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/W57uyq7ZxszphGuyy/8SktSiEIeEq6kyPeeczEc4I=;
 b=wfBCLacHE2KVJH20cYEe0x3CcEhtNtBmz8Raim4zgEtFvcf8Fixo6Ucfq8Nth2KVMomasrmJbVmm6EMOU37XKEYf98JIemLtl4GKSv3s2i0GcicYJvsevIB5FRAfHazfK+hcdMLORuHB4inHTv8o74OCrPafAX/cfliRc3sW1zWjH8rUFpD4p1GMtq2o6J9cp8+gP9bMgzfv7kXmu1gPEPbZkpUTE6zZFeFVtiIbFJcjUcn7W9FNuKPZOJiMj98XjBUTXZX7msqs4jT+qgXdZyDOZmd6HrIa2OJvNsihrTfra+mch57Qlyx9LGhSby1kMKN65UnbWC3BP/MBiF9uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:10:49 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:10:49 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_hdr: Skip brightness on non-internal
 panels
Thread-Topic: [PATCH i-g-t v1] tests/kms_hdr: Skip brightness on non-internal
 panels
Thread-Index: AQHbNdiI1aoYggzvekqLeAkGyMLSMLK2S82w
Date: Thu, 14 Nov 2024 06:10:49 +0000
Message-ID: <PH7PR11MB60536103C374FC7EE5E9BB16E75B2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241113142555.2974018-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241113142555.2974018-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB8444:EE_
x-ms-office365-filtering-correlation-id: d11ed45d-f6f5-449c-370f-08dd04731602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KCjqY1CjcBb6EoZxqxfgrhnYFKZ2+SlwzUnnTvO9Ctx7e9yb0ZrcqYO+uwJc?=
 =?us-ascii?Q?UDdIVPZRFBtpJ1rumlFWDhQgKEtuYNtUl6A3bcqQjajkZp3GMdMuIJHrJ/Wp?=
 =?us-ascii?Q?jiQiP+W+F158ASndN96vIAEoJS4ML0+C56vPGf8HsvKQUFhW8oauoy6M1ODT?=
 =?us-ascii?Q?6pSR13ozl+4/g4/N5CuODCcpLKAqBFodbapYlnwC/B7dlIC/fb9b9qUnBL+d?=
 =?us-ascii?Q?XjQHNq7s2HEclWKJO1TobmFE/rJaeK1Hvrnz7cX8AFocRe2nnmVY5EPXQatt?=
 =?us-ascii?Q?YmTIgTECrBk7qTGTaeyacPHXlrhyxEGxTZd/ZFQJa30YAW0QWmRknkLdpDvQ?=
 =?us-ascii?Q?s5jwW4XduqtxRrpu5exMSpYmeeT8Q9HqNCS0JwCGcfcuEQP7EgKdA5OoeeST?=
 =?us-ascii?Q?yVpRMW0Om48uDPJdd44wOTD2nn/xwGDuBUNDzYVJS6k4BEcRpkWLKhfTE3sB?=
 =?us-ascii?Q?RMDt17TIXvmxCkR3gBeBFWFJ6QwHWzkW90SuZ9Az/OZy9OjXNm/mUcXEhX9I?=
 =?us-ascii?Q?80euE79GaNofN+m+cvn2Uf3rFiBKMLeBHLsSBRIEoWGN+nBkHyIJ9QPJAEkA?=
 =?us-ascii?Q?ocWDIGFG/wU53KKpugOFcVYin5dzwENKquVaz+1GSLDG48YGpM3YXm3zkv4K?=
 =?us-ascii?Q?uYSvg2DJvQus3XNxqfJTDNZwzX3TStah6cJ6WJZNT/t2rWV060/gK4QuhmZF?=
 =?us-ascii?Q?WOcNpOLYWKu1Z2rDzXiLxtZ6yhxRugovvQ6tci7MRzl215k8tZ4/ccK9Xq1h?=
 =?us-ascii?Q?VquJPXf0MW6kg/WPuekEwWkez2YJ33uCX02SSH7xmUdNtxRTmqrlY+2xot6+?=
 =?us-ascii?Q?tfha+DzHZw50YF6oFVIqJJVFB2pZv0zo+FZKZnzwScs6xY7e1L7LS78yyr8F?=
 =?us-ascii?Q?nSOE3U06pNE3b0oC77GhD5lBoB7Un/J+vvuxT++Jgn+aAYgOk0iUbyD8oavA?=
 =?us-ascii?Q?GygP+JqPJVXM837smwv2WBE1S0Ipa66i1we7vTs+7KrnpcQvb611NdjoTK62?=
 =?us-ascii?Q?MogvYmBYgqTH2DzBMKXiOf8TYTUlQ+ERrtDhTvqoL3ed/YG9egqsHVu2Qq1f?=
 =?us-ascii?Q?g1G0NiGocpWoVWmxwEsh00FgZH3w0d/03+thKe2QHzbFwH05YFBPDm2FvoER?=
 =?us-ascii?Q?B0qkWulJfLuL8jeoXrLJv0ElQKOGzNxwGNKsdDUfzF7AOp8lIB0p80l6MRnD?=
 =?us-ascii?Q?O1DR2D7vujPFksjreCrfmWOnQtJ7NEEsGL+2c64e9z7T+C8fmjm6k1sh09Cx?=
 =?us-ascii?Q?dqq0lMrF2d8YgQhhBHVCqHInKv29XeNreFweWxaNFn9wBS5Lz4aTZFslc+Rz?=
 =?us-ascii?Q?vBec3NVToUuxLCiT9pjVCJ2RdKAYFnbVsdbbtkWlys0mDGCZj8yQFMrXxqxS?=
 =?us-ascii?Q?0F066vY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9l0zGASIvAIBoFIUh/O1T8r6MJ1KwfFKfxRC3MTNGWBld4WVs+VOQz31Icge?=
 =?us-ascii?Q?M+/BeOvEYd4rbVt/eKhsJKZKgERN66bQeh+MYAGXKzg0ubnUfysslcIi8G3N?=
 =?us-ascii?Q?B6UN/z5VXgyLot6qtDLYCkJoIMhtf5h7+p0gz8iaFAr88Yb8kqavc5TXVA+B?=
 =?us-ascii?Q?yVpew3b+5IaamIqUUgQYK7wlSmCVL1binmZnw2Bnc1463r9tujOm/ALwZa0k?=
 =?us-ascii?Q?LYxpQ9BmhwlsdOJ3kG/+m3Mx1v8zRQ9psM0Ra0UMODKmdqtbQ1iiywZzSbdt?=
 =?us-ascii?Q?jptHO9mxhLNxMZ9t9FahuclA685bUvs9rfKwbqE1ucI6aUlkXtzgfevxAnxG?=
 =?us-ascii?Q?S5FNxz3hdHcjJE5eU9NtrkPobpLi4/3vnXphcKbjg51HXSr/h0dLtj6mL3dM?=
 =?us-ascii?Q?uStr4PZMal8Ymq6EFPKwvaEyWO7v4QlfvxXe5Tnu/ujbVhX/+Oiazov7Kx3U?=
 =?us-ascii?Q?QNrulLnvta0sFAp/9QsYZZT78NENJ+v1FfT3aJsk74OCLVh5A4SdLE9/P8l8?=
 =?us-ascii?Q?2EwcD+8VkLUpDE7st+rTdX1852n+3aurB70n8jwsaGz1u28ZwkfqrbIvBJ12?=
 =?us-ascii?Q?jkvcLHIAQRWiTjkdgJIZymKj5wvdxECH02k9joyjiZGD5kblpwx15V4/ohlD?=
 =?us-ascii?Q?o8hk4DA0Iukh/NQ759dt45SvO5TO8uI15ivNCn4DWyp4VzVZT7MAvAu1HJcY?=
 =?us-ascii?Q?hzxM+AYosNFSqe3wALHYvtk7E+rFDne0oa8MObEgygk5w9Ea7yC1N6Wnh65U?=
 =?us-ascii?Q?1lPl8AvCqmDFRC5QWhtx8/V0fh6rm50I0F5S9gQQbi85lyo0gWUVOMyzddxq?=
 =?us-ascii?Q?U3upuJT4kH15glBuKuO/dfx0Be+cxCJhpqoLU/6Q8dYaquexRf4UDyBRjT3H?=
 =?us-ascii?Q?LvZtJMR1W956H06afs6VQcmdKQ1iltAQOm39WaCetfYCdCIo9BkKybgPeBvA?=
 =?us-ascii?Q?zz0lCooqXRw1p1eJyV6+854sVvBqRaVMlKY6i9sN+LlN+amGk29smSPsx1XM?=
 =?us-ascii?Q?woFRT6E8+CrxHmu9udn+uwbTo5Xa6RD84TI9Xj+SFbVD/944OGt56U/gUQ4T?=
 =?us-ascii?Q?mV1vq5LSqOKnpP4Vo7Ojhd0Wh6SZdw8t/NQLMgUKWKrwUK4zu1oGesuyKEAu?=
 =?us-ascii?Q?eHDF3bLziodITzu9kcC0FVhSL8wZ5nL6rvHmb6OurTk0/8U9XB1NstgMUfTo?=
 =?us-ascii?Q?IMHsFdo+me9KFglEWYznfUvUOSdrPtMHOGl8FU7QFdXv6ekb4IhTNwdj7onq?=
 =?us-ascii?Q?v+yYs8Bp6iNQkGdJtC4bV7vozwakEjYAMH3SFxkLqQSxsuQSj6mY1n9FukyY?=
 =?us-ascii?Q?+SFBZ7GAmp1VHYi1i1EBLatbd1U03x2pDUhM4WYdVYJVa1TKYC/1EK9d9K0X?=
 =?us-ascii?Q?33we95dt4Q67v8IzxiNpbFJPJuqZNEpeuS9uuftOezZs+hYHTlCwdQNHP1ma?=
 =?us-ascii?Q?btQWcxc78l8OmfRJQrtnaABuWpJSEw0aP4Ws63rSh+5zqXfK2cBjitq583S8?=
 =?us-ascii?Q?yx6w0MtdNxPD6WP9nBnL49C+9Ju8Kdp3AM3kUzXXi/Ukr/Lol8r9Z2fzkpYF?=
 =?us-ascii?Q?Udye6ozd3zGctSJdfvLaGyMIafM0CMhCg2ryxHDG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11ed45d-f6f5-449c-370f-08dd04731602
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 06:10:49.3313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYS2U58/+mLe05xs4HXtN5bkUESJ0RgL0odeSenIUAghUI8ioRbacaYAdKCcC42eO4Fa9yg0NhLJZBBJT/5q0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Wednesday, November 13, 2024 7:56 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_hdr: Skip brightness on non-internal =
panels
>=20
> Skip the brightness test if the output is not an internal panel and log t=
he skip
> message.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Code LGTM.=20
Get the CI results green.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_hdr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index b67902d43..c4c9df3fc
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -696,6 +696,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>  			continue;
>  		}
>=20
> +		if ((flags & TEST_BRIGHTNESS) &&
> !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal
> panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>  		for_each_pipe(display, pipe) {
>  			igt_output_set_pipe(output, pipe);
>  			if (!intel_pipe_output_combo_valid(display)) {
> --
> 2.34.1

