Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73829CD98CE
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 05:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0666F882AF;
	Tue, 16 Jun 2026 05:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YL0fEGGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D332010E812
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781587124; x=1813123124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W/rWPbUH/CVgVeOzn7zs6fvBEV5KxEyW91Udcl9o9R0=;
 b=YL0fEGGn3lRxNIz+tIlXm08qr29yUHS6IRqasSXqhJT4D+LoNe5MEfv+
 8j+uGKScpr/GFx3trASz14f7gKXzyFmYoATk9/hh5N00gN1LVDooxpQpD
 84nucHipHITuSkgR+VlwMuWW/wYgdlRSZn9oXHAY7CNECAMjO1D3VE2yA
 s+0I2TIdskhs9SZA3XM62+9UwuxA26EcBIEM9UJ5K9snjf6aiSeSOzbYj
 swRU1X/dY6idTFpnXJ/F89XFaG5nyvvZt3VTpb0SZHtR1IApNHg5qrb+6
 YltvPc17uCH2ib93ATw9zcTYf6nBlCk3R3O2y97o77QNPOZNNryI/kp3n A==;
X-CSE-ConnectionGUID: VGd4x/IlT4qMMkp1T/vLTA==
X-CSE-MsgGUID: 4JlOYfdZSD2taSlpRCr11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93831056"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93831056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:18:43 -0700
X-CSE-ConnectionGUID: 0lfyUAobSgy4TxkSMEry4g==
X-CSE-MsgGUID: 1Q7bdtfuQ7Sa+HK6bQCz/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="247530928"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:18:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 22:18:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 22:18:43 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 22:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf3BgoK1rhgn9+3ztDWPKPHPSug/7TNHGMTgTwJWFBsaA6ymJy1N1A01a4kXR+2omfMSnXl2Nc5VXwITu5p/qm8Oc8YSfvF8WdKUs+t5/6YibrhwktlDRoWpZ2X0a24mr1QlzGwp//T+NDyFc2JZQpN/rBc4M74zTaLijJ4Gu59kKTph4W27L44IwOpEDCeCpanAqWrlfxLXyqF5sovv9NiXWlgIe9IvuOcM2k4Vln+TtNsgHshM4mx1l2dUA1KSOijxoRtly+S9UbbzrD4tpczfGPV1erxzrM3yDN9bCd2hPdZk/Ad43hs7b1swpJzucjwTHo/53EuC/140ioVy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEkZ87BhYblaN/gjaZP+Ube25of8+6SG58ZslatGygI=;
 b=YdkcyVImAdpoy4J4Gme/0kIcipzEcCsLAkLbWz7HVX5/7LgRN1dS2C65x7e+Op9IjrkAYZYqZEv/KfCVAI8tscSqYDTQ3QIKoQzMSEWaQaB4xa4e1fY2P5plQvL6NdqQx3c2ueaEBV27h8aAunG+avKH+gLtnsBZXpEUkbWvgBg2UH62zhwW92g6n2Lzht9OzoRih/57yKFSyN9L3MtyiaPEtAc4LBbA8JDZOo6E43ujvvqSzSCm2xiIc8AfNYqj0/ST4nNbfyTs5bhN6ODm1hiEFlqwo/hiDp+xnQaVj+coNojeTbVMu83j+/bm/+6PHwLL6TUCtQOGTGE8zY2b2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS4PPF2F49754B6.namprd11.prod.outlook.com (2603:10b6:f:fc02::1a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 05:18:35 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 05:18:35 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHc+jCcexrdwvYlzU2icxklJyP6DLY/aNmAgAFAVYA=
Date: Tue, 16 Jun 2026 05:18:35 +0000
Message-ID: <DM4PR11MB6312E509E6FC514860EE184490E52@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260612055857.2465378-1-jeevan.b@intel.com>
 <PH7PR11MB6053FDC4877E947DDDD81380E7E62@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053FDC4877E947DDDD81380E7E62@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS4PPF2F49754B6:EE_
x-ms-office365-filtering-correlation-id: afde7feb-b165-4411-95c4-08decb66b745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|18002099003|22082099003|56012099006|4143699003|5023799004|3023799007|11063799006|6133799003;
x-microsoft-antispam-message-info: 2Rs/T2xS142u7OUeDUwFRbRkmdFmbLIIOcxtL0S0QTZbBfeyA5aUgo///5ZjEhcol0LK4c8d6THtBAOegzSSOjTSo85qreQSUSWWptFjF0njHVAk6QZgNFJFfj0//Icy5srUqXs9W5uE6ZSanTG0l4GqZRxuDubc5bqm56NPG8N4SVHd9sia2UXBBQqTbinRtwLTORpf8woh0SvXq+uRTWP7s1kSZXB93J2hk2pC8uR2Pp93gWLHh2o/HaIJhPfwuYnPcwDwF+Y7BiLHM7um8Ks/LRjSXKFbKYJfSEZGN2T/nPwW5cYaTmhZCqmjt7vxjt18n8pziOTIVUWJL64l8cJPNJZb02CmJTdjlyDEFJWGHdc0rTOI0E3oVg4uZCK1S4E6kBN4pt4JBjw4YYVlzv3udgGaEHWJAYHVPQ2UoTjDsDuhp/p5luVoFI88O0cVSCY/wmFbgT9O+Ze51EDM5F0Bop6mLrINSROa7oyPHbdIWVBQ/GnUGxXYWwe58dJtNpOqigncmvNJymdSVGfDOGEM1KbE4IfNjRTqVnq84Ou7miKvr4vTfsW3YhZESDTeNNt5aR9hfcxBVgEEaz0lkwoFEeTnDPB7LHTiYWPJwFFS30SZx4xEfZpjC4P6J7krcp83gqh96zFhznqoRbk3FnLjuU/0t3KoX+DP0NbnqiQNIqQTSOQALB4s3aVw3G3tkRirCWYUu+xQZrcVJ9oCtNIKI6y7xIOvWd/ovF6dYna5FDlWiT0ObQsZ2MUK0Jys
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(5023799004)(3023799007)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H0FaaPXTQfyU9xcOxB4W5VOnOqhkYJ8YTLt5LCt2fsoEqQZ45RqZYW/Bho9t?=
 =?us-ascii?Q?lrhx63OmwYdb9Tnzrb0/KGFYUTCzAkMM68yedTKzhiJ0Owe45FthcahoOwnB?=
 =?us-ascii?Q?X+3Sz6jEAXe0bu8o3aBNghHFpT1FPmZx6kSkY8HNB0loLutdA7/wFj0NU7BM?=
 =?us-ascii?Q?mlJrg+DPItJa1ztrN72pmAtu/12iF0oicxt0xhE4W/7LE1fhG4EMLF3h489M?=
 =?us-ascii?Q?pYHBmztjtftJbPKTiGFDopU9s/Y3mX5OSVkC09E2G8nGTg6i6gcYd+VMWK/W?=
 =?us-ascii?Q?dUZPCeLLOkV7bqE6jj66GXLBXonFhJxhjj3iFjtBaXdY0w5AC0zIbO6tL6nK?=
 =?us-ascii?Q?fFAuJiy70iR5uBVnmWEk9GWXsa5Noprk4jHXkiToZ4q7XwZszAwdkYo81c+5?=
 =?us-ascii?Q?2bG3McMbWkSj/+jwk91YEFqgvuvjTIqgoLYVP+4sTdscTAuWatrn4okVvT5W?=
 =?us-ascii?Q?Zkpwe0SKoHyHkFv3SFSpVWfgBffbgIXu7acdwD3wzsXuvoLI1nefCU9d6ccn?=
 =?us-ascii?Q?BsnD8/WKlBwqGgw1T4/a/35k21mi2iQW5xP29GJKzvDvfnsv9RtqFyYZ7TaT?=
 =?us-ascii?Q?YatbCsLly7dTeoKbAqEOrCHk8lIyjtSk5HZr6XLqr/VY6p04NUUscLOtqwlX?=
 =?us-ascii?Q?Zo4t9fo7hjQerbq83Am4eyICeDhmll9BLvwU0jTo7G9Z1pN5AhJddwv8lEWg?=
 =?us-ascii?Q?sbO7oVhFevNMKUg7ty8wsazRMdo9SPr4vRoqWxUejdJPXdSUBzGf/4DbrEj0?=
 =?us-ascii?Q?adej2owP0VkZBU9kRQWbAMXLO5jBs2sVE0F28nWSMLiXWo+4bx7qvup3IaNv?=
 =?us-ascii?Q?T8f+3Ehqol5ZFYyA4EpYaLX5hbtbbqYqsHyah0ddQ73qZi5XRnMyv99BxGnE?=
 =?us-ascii?Q?nU+O2/ShXEXZZEUrTqkCDHyxOl2mSfLOKBjiSYnx/AvGpQU8Kr9XDnrH9CDz?=
 =?us-ascii?Q?B2Kyzr5YxcCWVsERO60X16e3K5s8B69sSaItn3Y8sjahJHntML0/SZ19MoyA?=
 =?us-ascii?Q?90a5qXiOnwGL+P8UdJyyHwI25z5b8NnUW+cwifi0lyPXfQZFZDJ0XAMUxkwd?=
 =?us-ascii?Q?/9KTOuMQNXKX24bGWy2RF2UoZRL3YU4LU/uyKg19E76PyzUeAQPaLPNm8Z2E?=
 =?us-ascii?Q?5AF3ZBjvqFxuBgdRkEjmQj+g91bZ7l1tCDlPjenOVsdzn1cp73hjZoAMWwE4?=
 =?us-ascii?Q?H8cyx8c6+aX5WClOWpKMe41ap6WR/l5QOcTtXgawhBn5YEP7tuAK3781/NRi?=
 =?us-ascii?Q?hBBGn7WTsaJ/12vyUZNCNfM12+3+yYwSmyvU3hS/0yoe3wqsSJg4SfBk+dMs?=
 =?us-ascii?Q?EPr6J44uIyEHKjwxqXk+uKyLmZX1q83jq4t/zdS8VghYGUtOZwFIdxoNxwu9?=
 =?us-ascii?Q?+bgfG62kt8cFYGMf7G/MOp7jCFK7KBun0rJ9HsGN0abuUPRzIUvVTpuCESpF?=
 =?us-ascii?Q?kWQ2WwYxjbKldlzeIsREPcHxWcR5h+EWnCwz9/lXCw3ubeREP4WOk5YUu30O?=
 =?us-ascii?Q?D5xsO9vtbQLvKCpt1NDcw9pyhRyOs2hNSbr4NHifmBKsGy7dtUN68z+0g0uI?=
 =?us-ascii?Q?NBO/p7a+Qqurhw850kYxZr+7ZoCv7pWswdNQpmZJDbVgC/rGlK8EZ8l5Ivib?=
 =?us-ascii?Q?tY8BBUQT2eOwzovNegW1rzqpk0JY0Egf9HWxxzn+8QnVeAtQ8SEJznH65/g4?=
 =?us-ascii?Q?DSsvPPp3KbO9aB1aej9df0T790+88iKVQ4gvWAJOTys7YuDC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: USM1U5HIy8ksbvl1gfpsgVxftZJFFqAqZVqqL+MoW2LubAyGppN+qx8x9ZgiG2aoJbnyRZlmJsLi2aT9QUjTsmscQfKY+GznOccvk02rhU0/v6khsVtbbuHkCxiv89G6lKB7tUatA5vnhYL++XdKA9+dLGWZa3+0ge9lZV8D6JkB9LAm5j3Tz6lmi44yyAoD2mYoOgQJNW/JZ97l7dvdQZ+JD4ypkD8twmin5CSHId9ulvvkAtytqUUD/+i0qloOGNcStTEsT/7r1Xo9lx6/XvO1j0hfj/ql4LoHRqTjVKtlHAUklb6SoszaFrDTTGJz/lOn411S5CSn/nwmOPSEpw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afde7feb-b165-4411-95c4-08decb66b745
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 05:18:35.5047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lTtaAagPhFbUJKLd92WHaZ3ZIjZgj9rLF4x6pjezi1wBqa2g9Q80kQ8qVaPg1dtOL0RZCD1BmTV+Z58tU8TKPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2F49754B6
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Monday, June 15, 2026 3:36 PM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan <jeevan.b@intel.com=
>
> Subject: RE: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> Hi Jeevan,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Jeevan B
> > Sent: Friday, June 12, 2026 11:29 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan
> > <jeevan.b@intel.com>
> > Subject: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
> > suspend/resume audio tests
> >
> > Add test to validate audio works before and after suspend/resume on
> > HDMI/DP connector.
> >
> > v2: Perform a single suspend/resume for all audio combinations.
> >     Re-enable chamelium after suspend and separate pre-suspend
> >     and post-resume validation paths for clearer failure diagnostics.
> > v3: Drop commit and use igt_assert_f with explicit messages to
> >     distinguish failure in audio tests.
> > v4: Updated test to avoid false-pass on zero executed configs.
> >     Replace post-suspend forced re-enable with connector
> >     re-probe/connected checks.
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/chamelium/kms_chamelium_audio.c | 159
> > +++++++++++++++++++++++++-
> >  1 file changed, 158 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/chamelium/kms_chamelium_audio.c
> > b/tests/chamelium/kms_chamelium_audio.c
> > index df8d27c0c..cc106f52a 100644
> > --- a/tests/chamelium/kms_chamelium_audio.c
> > +++ b/tests/chamelium/kms_chamelium_audio.c
> > @@ -52,6 +52,12 @@
> >   * SUBTEST: hdmi-audio-edid
> >   * Description: Plug a connector with an EDID suitable for audio,
> > check ALSA's
> >   *              EDID-Like Data reports the correct audio parameters
> > + *
> > + * SUBTEST: dp-audio-after-suspend
> > + * Description: Verify audio works before and after system
> > + suspend/resume
> > + *
> > + * SUBTEST: hdmi-audio-after-suspend
> > + * Description: Verify audio works before and after system
> > + suspend/resume
> >   */
> >
> >  /* Playback parameters control the audio signal we synthesize and
> > send */ @@ -695,6 +701,66 @@ static bool
> > check_audio_configuration(struct alsa *alsa,
> >  	return true;
> >  }
> >
> > +static bool run_audio_test_once(chamelium_data_t *data,
> > +				struct alsa *alsa,
> > +				struct chamelium_port *port,
> > +				snd_pcm_format_t format,
> > +				int channels,
> > +				int sampling_rate)
> > +{
> > +	struct audio_state state;
> > +	bool success;
> > +
> > +	audio_state_init(&state, data, alsa, port, format, channels,
> > +			 sampling_rate);
> > +	success =3D test_audio_frequencies(&state);
> > +	success &=3D test_audio_flatline(&state);
> > +	audio_state_fini(&state);
> > +
> > +	return success;
> > +}
> > +
> > +static bool run_audio_tests(chamelium_data_t *data,
> > +			    struct alsa *alsa,
> > +			    struct chamelium_port *port,
> > +			    const char *audio_device)
> > +{
> > +	bool run =3D false;
> > +	bool success =3D true;
> > +	int ret, i, j;
> > +	int channels, sampling_rate;
> > +	snd_pcm_format_t format;
> > +
> > +	for (i =3D 0; i < test_sampling_rates_count; i++) {
> > +		for (j =3D 0; j < test_formats_count; j++) {
>=20
> Please consider restructuring this format/rate loop execution into one
> common path (single helper) and reusing it in both test_display_audio() a=
nd
> test_display_audio_suspend_resume(). This keeps behavior consistent and
> avoids duplicated loop logic.
This will work as a helper, Once this goes through, I will float a patch to=
 update the basic audio test to use this function.=20
>=20
> > +			ret =3D alsa_open_output(alsa, audio_device);
> > +			igt_assert_f(ret >=3D 0,
> > +				     "Failed to open ALSA output\n");
> > +
> > +			format =3D test_formats[j];
> > +			channels =3D PLAYBACK_CHANNELS;
> > +			sampling_rate =3D test_sampling_rates[i];
> > +
> > +			if (!check_audio_configuration(alsa, format,
> > +						       channels,
> > +						       sampling_rate)) {
> > +				alsa_close_output(alsa);
> > +				continue;
> > +			}
> > +
> > +			run =3D true;
> > +
> > +			success &=3D run_audio_test_once(data, alsa, port,
> > +					      format, channels,
> > +					      sampling_rate);
> > +
> > +			alsa_close_output(alsa);
> > +		}
> > +	}
> > +
> > +	return run && success;
> > +}
> > +
> >  static const char test_display_audio_desc[] =3D
> >  	"Playback various audio signals with various audio formats/rates, "
> >  	"capture them and check they are correct"; @@ -762,8 +828,10 @@
> > static void test_display_audio(chamelium_data_t *data,
> >  			sampling_rate =3D test_sampling_rates[i];
> >
> >  			if (!check_audio_configuration(alsa, format, channels,
> > -						       sampling_rate))
> > +					       sampling_rate)) {
> > +				alsa_close_output(alsa);
> >  				continue;
> > +			}
> >
> >  			run =3D true;
> >
> > @@ -789,6 +857,85 @@ static void test_display_audio(chamelium_data_t
> > *data,
> >  	free(alsa);
> >  }
> >
> > +static const char test_display_audio_suspend_resume_desc[] =3D
> > +	"Verify audio works before and after system suspend/resume"; static
> > +void test_display_audio_suspend_resume(
> > +				chamelium_data_t *data,
> > +				struct chamelium_port *port,
> > +				const char *audio_device,
> > +				enum igt_custom_edid_type edid)
> > +{
> > +	struct alsa *alsa;
> > +	igt_output_t *output;
> > +	igt_plane_t *primary;
> > +	struct igt_fb fb;
> > +	drmModeModeInfo *mode;
> > +	drmModeConnector *connector;
> > +	int fb_id;
> > +
> > +	igt_require(alsa_has_exclusive_access());
> > +
> > +	igt_require(chamelium_has_audio_support(data->chamelium,
> > +						port));
> > +
> > +	alsa =3D alsa_init();
> > +	igt_assert(alsa);
> > +
> > +	igt_modeset_disable_all_outputs(&data->display);
> > +
> > +	chamelium_reset_state(&data->display, data->chamelium,
> > +			      port, data->ports,
> > +			      data->port_count);
> > +
> > +	output =3D chamelium_prepare_output(data, port, edid);
> > +
> > +	connector =3D chamelium_port_get_connector(data->chamelium,
> > +						 port, false);
> > +
> > +	primary =3D igt_output_get_plane_type(output,
> > +					    DRM_PLANE_TYPE_PRIMARY);
> > +	igt_assert(primary);
>=20
> Primary plane is fetched and asserted but never used afterward. This can =
be
> dropped if not required.
I agree it looks unused, but this was kept as an explicit readability/sanit=
y gate to document that a primary plane must exist before proceeding.
>=20
> > +
> > +	igt_assert(connector->count_modes > 0);
> > +
> > +	mode =3D &connector->modes[0];
> > +
> > +	fb_id =3D igt_create_color_pattern_fb(data->drm_fd,
> > +					    mode->hdisplay,
> > +					    mode->vdisplay,
> > +					    DRM_FORMAT_XRGB8888,
> > +					    DRM_FORMAT_MOD_LINEAR,
> > +					    0, 0, 0, &fb);
> > +
> > +	igt_assert(fb_id > 0);
> > +
> > +	chamelium_enable_output(data, port, output,
> > +				mode, &fb);
> > +
> > +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> > +		     "Audio test failed before suspend\n");
> > +
> > +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > +				      SUSPEND_TEST_NONE);
> > +
> > +	/* Re-probe connector state after resume instead of forcing a re-
> > enable. */
> > +	drmModeFreeConnector(connector);
> > +	connector =3D chamelium_port_get_connector(data->chamelium, port,
> > true);
> > +	igt_assert_f(connector->connection =3D=3D DRM_MODE_CONNECTED,
> > +		     "Connector disconnected after suspend/resume\n");
> > +	igt_assert_f(connector->count_modes > 0,
> > +		     "No modes available after suspend/resume\n");
> > +
> > +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> > +		     "Audio test failed after suspend\n");
>=20
> Update the message
> "Audio test failed after suspend/resume\n".
Sure, will update this.=20

Thanks=20
Jeevan B=20
>=20
> Regards,
> Pranay
>=20
> > +
> > +	igt_remove_fb(data->drm_fd, &fb);
> > +
> > +	drmModeFreeConnector(connector);
> > +
> > +	free(alsa);
> > +}
> > +
> >  static const char test_display_audio_edid_desc[] =3D
> >  	"Plug a connector with an EDID suitable for audio, check ALSA's "
> >  	"EDID-Like Data reports the correct audio parameters"; @@ -866,6
> > +1013,11 @@ int igt_main()
> >  	connector_subtest("dp-audio-edid", DisplayPort, &data,
> > test_display_audio_edid,
> >  			  IGT_CUSTOM_EDID_DP_AUDIO);
> >
> > +	igt_describe(test_display_audio_suspend_resume_desc);
> > +	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
> > +			  test_display_audio_suspend_resume,
> > +			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
> > +
> >  	igt_describe("HDMI tests");
> >
> >  	igt_describe(test_display_audio_desc);
> > @@ -876,6 +1028,11 @@ int igt_main()
> >  	connector_subtest("hdmi-audio-edid", HDMIA, &data,
> > test_display_audio_edid,
> >  			  IGT_CUSTOM_EDID_HDMI_AUDIO);
> >
> > +	igt_describe(test_display_audio_suspend_resume_desc);
> > +	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
> > +			  test_display_audio_suspend_resume,
> > +			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
> > +
> >  	igt_fixture() {
> >  		igt_display_fini(&data.display);
> >  		drm_close_driver(data.drm_fd);
> > --
> > 2.43.0

