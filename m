Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86136C02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 05:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0E910E041;
	Fri,  7 Feb 2025 05:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFe+4gbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E210E041
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 05:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738904591; x=1770440591;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eyObqxnFxCyPn76cUDCGOSnsS7MhAEpPn6f3Eag6rKQ=;
 b=OFe+4gbmJV1g0xaG2z82mo77tIkugJgwjnFaCUNTMORW2uLcMwYvZn2e
 QU+q/NgjnAKwOqJg1/zU1UXTtmeT+bEx/9IHkAEvfUjOxIvAwCX17A1ru
 bLz92i8yV3DGzy0i+Jfuz25RKEnrhHZnOgcU7HVrdJeNL8vbQJfc+e7Ut
 YPosvqtjAEblZl/3OYkudh53MWAe43UuskIpgZMQH2xVVWNlS9xmKAiAc
 ihkUVB4nw56v2kV5ZqvitTvH01jTNbqhrmD1PAqOQ+QA7WMwo7rvDI9BL
 462dq9SjuV2zI9lg7FlAqZ/d/RD3+fwXJWTUY1XTbaAvt6lWuPPwG0ozo g==;
X-CSE-ConnectionGUID: 26LRlGfxSLKasWk2aNafXg==
X-CSE-MsgGUID: kmSmKxVXRm623+OpVLeDWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43299001"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="43299001"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 21:03:11 -0800
X-CSE-ConnectionGUID: eJdtulzqQUyBiiFeSt425g==
X-CSE-MsgGUID: xQLJMPYARheLj3HExpmf7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116358071"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 21:03:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 21:03:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 21:03:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 21:03:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHws+uDmjaEasT0dSY4T9R4P1oPQ/gwyd/YHoUlNwTLL86Bddrsa+jVvgzRYmeKFp5zphr+uIDMy3iL5zJGrJkjt41pUeLHfQ8oENCNAgkYNW97qXciF07zoiOojSZcSDKBWw17Qd+sODhuEKkSRu+Qf92+lxMOk+djwqyvRTJQvQUzpUZTUDKrNECZ91bbTMa9dziwG+ylmJ/lsvJ/bwZK+2GC8unpZ1HpwM94pFpPsDiavVLnGPQR0/XsnzL1U+vwVFE2uEHIfJDp7gOa+CmB2L+f0wAh8C5OQH0jfU6qTjNkJKXF2yu6/T36GxwZCVvQ2ShEc4UCSuFrpIs4OCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFyMsN+HUdkZNuYf0jmSuABHSwDnhRdEO9Y70xK2wQE=;
 b=lXNf4oZ9PQIYwcAJc8iFfhIlvXVoIOtZPGdRAAmlK+mVW+1x1/DXsTgV0Hc0mZZjmWC1qsmG5xP18S18VjY5aj4YQ/g41a8jPuSIdnfT6GgJXm3bNDv2py2Z0jStiuLzRN7V9e/HoZ0dq7/w2AZkfi9QmgGJY3HsQImSJDBOOFZ8QBzgHFliY1WcrHJ6/WPfm4KCNq966Q3xfYQhbtSA1nVuiGl6b626h5e8/2IlXNdV6bcZUSZeZR+AiyFogk57LQwq5/stgZfPW4IidW3F7GS7Y3ywNFTmdWcEQCSYGrESHB2Xt2bYJx500cMu7NpSgESQ8Q9+KeZm3j17fG3TYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.14; Fri, 7 Feb 2025 05:03:08 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 05:03:08 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
Thread-Index: AQHbeK3/D1Js4fsX4U2Yr+TtMm45c7M7QgiAgAAHi4A=
Date: Fri, 7 Feb 2025 05:03:08 +0000
Message-ID: <DM4PR11MB631204BBEAAD8892ED87624290F12@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250206155947.973010-1-jeevan.b@intel.com>
 <PH7PR11MB605305D39B8935AC4B047801E7F12@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB605305D39B8935AC4B047801E7F12@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW3PR11MB4764:EE_
x-ms-office365-filtering-correlation-id: 46c2403e-b8aa-44db-d15d-08dd4734b6ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BDLTqwDqg1uq/JxKmNy9oTshgyhBhVeUfqbt7QN5AAOYXEQTmo8SHHjgddae?=
 =?us-ascii?Q?bfOtdt5r6BPaqLlyMGBguWWOZozzFgfBRRjBsqtqazxKMu7pcNDi2O3x3LQF?=
 =?us-ascii?Q?eNzNDbczxpjmiKZkgTi+972YZeCx9MkxUSiwQVQbdZzOUFjccLxpEPbzxjHA?=
 =?us-ascii?Q?upnzzuJtk4aMsRq5o2UNYaBw8p3QEp70LOvdSOox4OCJdgWxzjTFJBsjq1nf?=
 =?us-ascii?Q?wy4JVJqG3sqJPg6ZbgJidMMB91SzfC0WpTzZoUAAoodD4VqpmKLcJvSM4ayn?=
 =?us-ascii?Q?3uxdlHCKnS1uBlB8yGw6FFrlHcguHCIPyYJrhyVjcp0LYlXVz+NwAM7vGuBH?=
 =?us-ascii?Q?UGX5JKSMI/R4jbcbPZ3uY+lLE2r7zMp58diwA8xV5MlUQhjlv18m7AgwqI4x?=
 =?us-ascii?Q?GV8/uX0XuYM+eGQXQ+5rDOX17UwUMOyCztENCBraUijJ/omdg0M6UR2hy5gw?=
 =?us-ascii?Q?ZiW7akkwMGFvyUsz69MBJblCpeD33w44SXxxT4EHPQevPrpAKtIOpjfzXwbN?=
 =?us-ascii?Q?oVZoClUVE4EoR5rfqxkrbIHMFPBZk5npsfuSJpmCI8gLZCXCpMhvGmnuzvDF?=
 =?us-ascii?Q?XKd2V26Licyq9kdOFgRA0J6Ql97UI+5/TyeAfF9Zxm+qh5TekmR41R0lB0UA?=
 =?us-ascii?Q?+eY4tHXJ547g2JSdUS5jjssHHgJsi6Nbj8qx4BFUOvhIjZQ0lYnT5SrYYkyx?=
 =?us-ascii?Q?zgvkIKNKdylJWzc739saIdgP8PEqdIXou8eC4Jlpxe4DSCIXVvkOPdPFr8ky?=
 =?us-ascii?Q?o+xaZcggZPKNWMlgrX013Fq+ZKLN6NubradQGUNJMLadaoo8UtK004BlkQb/?=
 =?us-ascii?Q?9sURhGFd1DNo8NJTAu7iwRjnDhJK/QReYBe4iXtDKrCjcQrTdwDHUkTTxaAl?=
 =?us-ascii?Q?wzeaApRJH3G7I0gF95PkcyKvezs2IApKefiMcgTFzZ6pomwXvsofSooLGlCN?=
 =?us-ascii?Q?zDXDaUDadat/481vVUiImFF8RdacyVISP0++7y81BesVKabNdQlnrDue1h7E?=
 =?us-ascii?Q?hFonbbKSSfnkthRr4+3eEtJY1na7JS9IOS08RWzbgLw9TD/HC2ufAlXFZNZy?=
 =?us-ascii?Q?/73hkXzPd7hAtBXBcNxSF5gJ/CkRQLRZQQl5OtfkUqSgdzVyg+y0ZmfEm4XL?=
 =?us-ascii?Q?3Xu31vcB44g1UUMXYA+MF1VKeC+MmVNlYQjDuVRojb9oWUA5/EE7xkirLqxH?=
 =?us-ascii?Q?pHm60I6v61otk/XQVGqOBVAaclQQyjoL8jeqXVfy9ZjlsIBryntZnBNKRwlt?=
 =?us-ascii?Q?d3FydfLF79EeOUxmWHRjczfUtBY/l8SLs6pj9ydEnF1FmIVy8PHO0BgqOdML?=
 =?us-ascii?Q?LVAPhL1fZSn6lfI9d4eete/FT7kefRJ8435nsF9i3u41/hOM+dzJ5tCWLB8i?=
 =?us-ascii?Q?8FjdBHf10HLaKI1qmasaQOAR+DLaLfQbz5ktDbtWl1lwzKJiHUkD5xowzXq2?=
 =?us-ascii?Q?ZxINqUN7lqUFjrMcEEri4D6xMmHZS/PC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fEVyz4vPxph5+PDC0Q9g1qEApsVhfxPUPL9lpw+jhYmE3frWRdVJUKnMPJEH?=
 =?us-ascii?Q?FZsEcdy8hO7mp05zfEAqCmpOauZHzKVJ5E5YiQdIWpp+i2KTh8s58z08DPt6?=
 =?us-ascii?Q?efW6O9+PIaIuFI1vziQVPpAHNOdF+UKTOUE7Yn9AP/rVkJLIyKlZs2RUe9ev?=
 =?us-ascii?Q?6bvsr/Yd3vrHhte6acXpP+IU2j8mM3zFdO4uVDN74SIuXWDx4tw+WAnWQuZH?=
 =?us-ascii?Q?j/PlDORighwhHtmCb/Y3Iigc9kAZrSzoSr1edFJxwaShJ5olqhPN2oPlHvGU?=
 =?us-ascii?Q?88GoWtzJVHa1xBxmLuTBjiQbuQ/vEFqKCoweAuZJQYg/osQU8etWdxoFWgJJ?=
 =?us-ascii?Q?1kP79/D0KUY2IBRoXArDFpiDUCMd78FAMtnZE9gTzSCr9PFtFNkuN+1bzdAZ?=
 =?us-ascii?Q?dlr+4h1394+ZZ+wR41TLlFDbZo+KkwHwGR6czQMQVwcZTilUd01pYk99tsD+?=
 =?us-ascii?Q?rujMk/wul/XYT+R+/XgX43N4nwixtOCM4qNECOyciUsnNyo9oh17b1JiQK16?=
 =?us-ascii?Q?c+M87HL+kekWANl2IRPSoTxn4WQv0ExaUGMA6TKfdLiA39tfEUsQPKAPEN9R?=
 =?us-ascii?Q?7NOBKHLmeCLkPm6ljGKHlbulOGzMoF/Uw6fCfDSjspUtV8d72e9ZL0wq9mnb?=
 =?us-ascii?Q?q5m6WbNFiVRui3Kourwe95qLsImIz7bp72/Ip6sY3Ubi3fs7TyqZ2nXlg0Ic?=
 =?us-ascii?Q?zZItLe+K2ohPqAV5Viwhn0Bk/xLskYVdAjvDLMSZBMGEQn0mC1p7N3Ed+Ngd?=
 =?us-ascii?Q?5JO/fko9thd3qFo+PI80XxvWEC1n4rM0P/j4+Y2iDVM8Uhz6AJeTTmC8tZJ5?=
 =?us-ascii?Q?rV2PUwlZfJuHjqaYLBIL4a74fbYLwnj3YEsUHXKJHIbE/xlC8XR+MPUKHLhd?=
 =?us-ascii?Q?XXV7vfF0mvW1GdDbH2wokbPXKdPGNoGWumS1CHX7MEANrvTiPwmDcMd+p2IF?=
 =?us-ascii?Q?g9zfTu68c6erZe5/KuLp+h2bioR38OcF4Wu9ndGHKXITJLGh9npKV0Ox76UI?=
 =?us-ascii?Q?NbDmTma95kE1tSn8MejwBH/kw1j8vQ3H0i9t3FfL5KgFyZm4lTkaYncbnhu8?=
 =?us-ascii?Q?2wqtB8JT1FnImZITpV2qt4Dmw7GPMwINcN6/Ohvp8WfOedVIynIBqrGNUumf?=
 =?us-ascii?Q?cN0Pku4YimUGgwCum4yB4DEpKhRkkGh2X70LOTqfJeHoG23l5ketPgrKI7LI?=
 =?us-ascii?Q?wGkGMdbRdXfRNlG5w6nK3Zo5MOj5Qh2pYfcSH7uPJlPMbgEiZ/CwnxWiCmo9?=
 =?us-ascii?Q?EPltFInB0X4pRnct5CN+dUzlkDbBK2UmRpS4Dr4NXqJ+8OLDVWnuL3lMpA6s?=
 =?us-ascii?Q?zFKeAbK3PF+DB5g7+sSnaOhYDAzZU7inscjj9GDU1bMUidDkXXwS7BJWXEK/?=
 =?us-ascii?Q?ayIe0id4pD0RFoRAhJ585kX/O7RQYdN3E/2OOfHQ0hfCvyiOjVgINhjUw/8c?=
 =?us-ascii?Q?AO0PLHUayLg2zLBC3gcgoZfXYZz/NwVJPgoc+0Yh9YHaTbYF8BmPqo7OBU3o?=
 =?us-ascii?Q?kZwsv5vX/tCP2eqDDUF9zG1IqMjlEJu2RTiqzfdMSed8uR3Bu6JIgqR/WSXx?=
 =?us-ascii?Q?FFKuvyDgpGUXR8HNOIo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c2403e-b8aa-44db-d15d-08dd4734b6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 05:03:08.6829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJht4xStCy7Bd7QGYIgxKtAweJ92i0Mu9QGPTWiT5lRGuN1fbxPX5jgAgkY7FFswd9HmX2D8/vIToOo5sRwi8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
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
> Sent: Friday, February 7, 2025 10:05 AM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection
> before skipping test
>=20
> Hi Jeevan,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Jeevan B
> > Sent: Thursday, February 6, 2025 9:30 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B, Jeevan <jeevan.b@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection
> > before skipping test
> >
> > Ensure all outputs are checked before skipping the test, preventing
> > premature exits when an eDP is available later.
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/intel/kms_pm_dc.c | 39 ++++++++++++++++++++++++---------------
> >  1 file changed, 24 insertions(+), 15 deletions(-)
> >
> > diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> > 9551cc6b9..aaf057b68 100644
> > --- a/tests/intel/kms_pm_dc.c
> > +++ b/tests/intel/kms_pm_dc.c
> > @@ -640,30 +640,39 @@ static void test_deep_pkgc_state(data_t *data)
> >  	time_t delay;
> >  	enum pipe pipe;
> >  	bool pkgc_flag =3D false;
> > -	bool flip =3D true;
> > +	bool flip =3D true, edp_found =3D false;
> >
> >  	igt_display_t *display =3D &data->display;
> >  	igt_plane_t *primary;
> >  	igt_output_t *output =3D NULL;
> >
> >  	for_each_pipe_with_valid_output(display, pipe, output) {
> > -		if (output->config.connector->connector_type !=3D
> > DRM_MODE_CONNECTOR_eDP)
> > -			igt_skip("No eDP output found, skipping the test.\n");
> > -		/* Check VRR capabilities before setting up */
> > -		if (igt_output_has_prop(output,
> > IGT_CONNECTOR_VRR_CAPABLE) &&
> > -		    igt_output_get_prop(output,
> > IGT_CONNECTOR_VRR_CAPABLE)) {
> > -			/*
> > -			 * TODO: Add check for vmin =3D vmax =3D flipline if VRR
> > enabled
> > -			 * when KMD allows for such capability.
> > -			 */
> > -			igt_pipe_set_prop_value(display, pipe,
> > -						IGT_CRTC_VRR_ENABLED,
> > false);
> > -			igt_assert(igt_display_try_commit_atomic(display,
> > -
> > DRM_MODE_ATOMIC_ALLOW_MODESET,
> > -								 NULL) =3D=3D 0);
> > +		if (output->config.connector->connector_type =3D=3D
> > DRM_MODE_CONNECTOR_eDP) {
> > +			edp_found =3D true;
> >  			break;
> >  		}
> >  	}
> > +
> > +	igt_require_f(edp_found, "No eDP output found, skipping the
> > +test.\n");
> > +
> > +	for_each_pipe_with_valid_output(display, pipe, output) {
> > +		if (output->config.connector->connector_type =3D=3D
> > DRM_MODE_CONNECTOR_eDP) {
> > +			/* Check VRR capabilities before setting up */
> > +			if (igt_output_has_prop(output,
> > IGT_CONNECTOR_VRR_CAPABLE) &&
> > +			    igt_output_get_prop(output,
> > IGT_CONNECTOR_VRR_CAPABLE)) {
> > +				/*
> > +				 * TODO: Add check for vmin =3D vmax =3D flipline
> if
> > VRR enabled
> > +				 * when KMD allows for such capability.
> > +				 */
> > +				igt_pipe_set_prop_value(display, pipe,
> > +
> > 	IGT_CRTC_VRR_ENABLED, false);
> > +
> > 	igt_assert(igt_display_try_commit_atomic(display,
> > +
> > DRM_MODE_ATOMIC_ALLOW_MODESET,
>=20
> Line length is of 103 columns, exceeds 100 columns Apart from this code
This can't be fixed. As it will spoil the structure.=20
> LGTM.
>=20
> Regards,
> Pranay
> > +
> > NULL) =3D=3D 0);
> > +				break;
> > +			}
> > +		}
> > +	}
> >  	igt_display_reset(display);
> >
> >  	igt_output_set_pipe(output, pipe);
> > --
> > 2.25.1

