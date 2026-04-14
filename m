Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ABBED7B84
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 08:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BEF10E25F;
	Tue, 14 Apr 2026 08:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agUkdcUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DECE10E25F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776155124; x=1807691124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JTK+MiZzIKQPnUeI0Ah/W5uS+/3CMzVxGivZBtRRokk=;
 b=agUkdcUKaGNeYLDT7q3QgnH4qzg7DBFbEum6n/jQDlXudVxkvJ3sqlG5
 Za/cAjZoRes1PjdvuhlngZvA15ayjyN6cW9sCTvwmwIoDIzeYcA3CplIu
 lIU1vnFvV/Ws9bQkJEAWVhsUf2CIEWseepV7OJQHM4pomTD6fUhIzRmxh
 WfeYzXz3VJqH4HY4yK6YFu/I5DNBExHm5kG81vhbhcDLUs5jHqxqL9aIn
 RG4uJ991Lj7gUynLtAYrDW8PvuDTws/T3rHO6pMRXrIx703dgmxNS6pQc
 JQFoj7RoW92BqlGshrfezw15gYgda1YNJPRBsEH1FcwIJuESy3JVHgicm A==;
X-CSE-ConnectionGUID: 8XEuPJgVSt2p/eOUu99W3w==
X-CSE-MsgGUID: gKJbaUyuRZOad6LyhhvfSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87808715"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87808715"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:25:24 -0700
X-CSE-ConnectionGUID: 6hRIHSBxTZ+4/bIJueTxVw==
X-CSE-MsgGUID: EppT9s4iSqWbDo8hSSrwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234427829"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:25:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:25:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 01:25:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ67FCkNYIFm8119Vm8Fx6fjpdCLn4lYYeRrdF+aRNVCUPLJ7VBTu/5xcCFi798faB+rKWgK4wHVAheZmbzA7F48W2kflKdyqCveqZvFMWEvS//OoxNc7q9W3juj7nx/aKRArYWPumYOdghiBfZ62yIiGJrisNc0rneohfSywvL6ZDgNnCGCYycZjjbzJ+wxI1QPlGtnflnMX6TZkawnzqgHBfIy93Kx43n8TWTGmxJBh+VYtB4Fk3+Bn5k6sW+knM2KENOfmAe+vGmSiMU/JdTEpgCTBuMzri09uDdmWFjrCctgj7E98ztU9dZSXwaeb+ZqwCLmlKEuEQJp9kVhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PztkFdBcCgoV9asI1fzioqqWKeOYujtY2zff6nBUto=;
 b=RWx2ET6ogqkQc/YQGGmwLAzjyZ5+qzcVhl2u2ohvWQB9wnBmoow73sHB0eKzl/SOMwF2o87nsXHYu8A/1EozfNn/dhGN9hpdGYCQQh9EGOvDsc0mGKepkPLR6bStkgWoH8RxETwYKGuDR4FmL986JWkUwLHKRCOf/vREhDYhbT7W6XH6mXvWmveju5W+HgOeszULgz/T2iVBSg7yrICk/Md2SeZ7DIc1YYuaDp4AQd9NKgtnw3A9E+rtXO0neaP2ypF2unORKNn+NeRCtB/TpespWrbGV5eadj87FWbF6H/z+z+J3FbzEmmuTQlKMvx9Z6noV5KV/Qu1ecYNU/q41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by LV0PR11MB9791.namprd11.prod.outlook.com (2603:10b6:408:382::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 08:25:21 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9769.017; Tue, 14 Apr 2026
 08:25:21 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 4/4] tests/intel/kms_pm_dc: Scope PSR handling to
 output
Thread-Topic: [PATCH i-g-t 4/4] tests/intel/kms_pm_dc: Scope PSR handling to
 output
Thread-Index: AQHcuqWaQKz2Blxq50mycgC7AeH/hLXeUEqQ
Date: Tue, 14 Apr 2026 08:25:21 +0000
Message-ID: <PH7PR11MB6053708DABA3C13B06FC7127E7252@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260323091205.100585-1-jeevan.b@intel.com>
 <20260323091205.100585-5-jeevan.b@intel.com>
In-Reply-To: <20260323091205.100585-5-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|LV0PR11MB9791:EE_
x-ms-office365-filtering-correlation-id: 9aeb1acc-bbd4-496d-009b-08de99ff5e8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 2bydMGHnCZPqLgyFm3GzOmqHVDJOu7qWdfg9d5xqzDps8Tx/ELaY+POUqS+7HwwWbO+v3MdMjq8h72Pfnk8neh2WGRfrI24lWmGv5efgD9qyi671yzd+6aLtydPN763s2Osc00wnFJmMM9/EejHLSZtIHqkLboJfZpeuAtnvH9ejT4ZgVtLYbEAr+vBmrY5UhBix4EYf+7ETEexYDOvwjs2NyoNUbOQQkscG8+bqvQQxJLPOd/7wTBY+AjgdBJ/Ugi0EBYgFuowoZxEuoyli9jc8dpsBsVMaScNWKvFHSTRi9ix5Sw6E4kYr5OqstNIHj/WrxIkM+jYq7ZpsjZIqQrVjhqj78cldjC5Seut3ncQ6n/t/ktAfDyjBYmAvGz2iL9BJMJ1TPKx/WWRUFcMDzgcFea7d9PUVerqrb74a3KxnpuLUsyWwmPhM/mIB+k1+QQWxc5eqfNcZqUobXgqv96zPnewLE1sNuKUow0VMSlKze63Jg+sZth9/fBgiPTpyVZvkRGcOKwvIqC8gQa1cmyJljcw8EUMyZg33xP+ft8qnzFG+9TPXXc8MehR0NJbQgN7iC3jT/42CHVo8O8qFoL72NEvqwtS1PNWTYBm789HVlvWskm26GT31yN/J28aP6m8TmJownb2aPDWmIG+vpOSLD9AJ491e3ncdJKWxGmU1lqr/YMQYLc/TwPf6CPxZCdRmATaslIQeKRmw8SFMIvD2rqcyZyaiVMyaFizMKYn2e+sHh3mw8c3jMB1ALn+1UVUF+GsOMQWiomrHKHtJrdzB7B0XkEvDPYGdLhsUh6A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?neMxuAZ5ywhEPu2cYute3fIlGetJ6qf85h+6opmjcmWyf6gNqGgvvqnbF2CZ?=
 =?us-ascii?Q?F9PCRwUkp/HpVSqr7OqRofTGd2qxuVs3fas8JtJCyCrYUg6q5JTSIw3CBwKc?=
 =?us-ascii?Q?IwCfp0tpdlrOtiiRR/pjQGhQYmHLEU3V4SIZ5vbZ+sX0usQMn1RXXvU/BccX?=
 =?us-ascii?Q?1YxiWvSeFSU983ednT19sXFzA5inOY8y9ZEiVyJOZChKNzmfFowWCubgiCev?=
 =?us-ascii?Q?g4Nj3JMbAkmKMJ/R3Rp3COb0JjqJt1A3endEC5nXcmxSlYXBbktqYGy1Cw7s?=
 =?us-ascii?Q?CbVHfbL+ekmjq1TNKGH0skaUvsWFlP3Y5vrUEViwtfZFZ5LdwLKBRq6dXn6Y?=
 =?us-ascii?Q?0As3SalIAb2Inr5lpDZWNEj9pM14mwD41xn7qBtfp2wzfWXwBg6z8yB/ap0j?=
 =?us-ascii?Q?YSgaphywbKlA3QMf3AWFFZ0A8PlJi1T9RszVNKId5w6bo4Etn5Bkwg/MjWd2?=
 =?us-ascii?Q?vUR6vPwKty/KKbEzILc6OLW70yKeV8s5M7e91PoBDL0+hHbru9khZxr2funs?=
 =?us-ascii?Q?gMsa1mJ4FPQgVBPT3zK1oZ7cxQoBFpQAOR0Q2UAU+fR9ACV4wt18xX0NpESt?=
 =?us-ascii?Q?cCNpIKL45blNpiCgWo22/3Lv8PFAJeont9pqW9cXs+EN4VHUSJJUNd8FCad9?=
 =?us-ascii?Q?QqHZW3/buwzaIKCG1YPxfbCAJzF9day6X8p/6s/dRlxXv8YK5tb3rUXUYWq7?=
 =?us-ascii?Q?6HuI87sDt6i8geSeVqdBh5dRXPYs0xkNza4b8yTpnfpTtdwih7SuPlOY4bnE?=
 =?us-ascii?Q?NkJp3SU2fVial1g6sGRA9hBAtvXbPIYeQ9BF1YKXgy1rt6R13eXs/SxtEx/n?=
 =?us-ascii?Q?qogXeLUpsvfhnZfnuIZic4fh0wgH18fTvfSS3lB8jMr8jvbZlQiII3M6hbq1?=
 =?us-ascii?Q?ReCBZwraL8tL4HmwYAcPhysiORmNEUyeJnVttyk2Wna+Q5xRCi5fgkSuUUbO?=
 =?us-ascii?Q?sXckXYth+TdWXl1OGUcWF9qTinMlJvV7Jwamabp2y/tqHgVh8gWOpSHvbRMF?=
 =?us-ascii?Q?CdqZsHiI4uykX4wCwGlZ+nvwgPkIHl5y94NHcAdw4b14Ug0ousn3r0XJlW/V?=
 =?us-ascii?Q?3q2jXok9tY4jaYyK6gxNmqRWc4/ZtFr7wuXEMPQohgiHq1uUlxZv9rCURj1N?=
 =?us-ascii?Q?i7tKt/GEvVAB7/NcanR4vbat0NsBXyfLMeiI+UOJvP5vcAc4q1g85UKRMGNU?=
 =?us-ascii?Q?XFKmz3qIUeOzD6WCFbvZcrwkupQp6S+kaRRf53JXMFsDqPcjXtbnpjYsgO5t?=
 =?us-ascii?Q?e1N1Eje6KEJDa8iC2GuIgn692+W9pPM+JjRu36bzNMXChJn2G5jFUauboudR?=
 =?us-ascii?Q?1FayDXqzm0LmZ2z3/tS+eVX5l3amB61zWLAG0lf53aIZwReUiKn/GDlNq7HQ?=
 =?us-ascii?Q?W1H9ohH1GqUIFkicl76j+bODdn20mvINJUDmYomsYqteIG1lr3lzBz6EwR82?=
 =?us-ascii?Q?nb0DL0QRQBJNdPWpBu26LYjusUGh0JllP28edZD2JUawUM/u8Xpquja6h7by?=
 =?us-ascii?Q?pCo974JTiM4qQR0KivrIS0GDpfJwuyErfRp/HlI1Ep/5+UHM3qYpb7REtV2p?=
 =?us-ascii?Q?zmPZgvNMsK1Bgu+ndY4Kkp85+T5hgOXGO+s1gYmOnPb+nXv6Ig7YjJXij3ZM?=
 =?us-ascii?Q?zcDu/LFkZMka/4phg0kq0EudpNBWeL84QJ04ZfWpSW/vfbKrPmbSrAW4HK8s?=
 =?us-ascii?Q?NJijafmZI1XPOdamACcEZkHzgSjCpeG8KLfCA7c/M4gMEODMZS04UrAdOiE1?=
 =?us-ascii?Q?7ajJleo+UQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vMZE/2ovcXwE5TzO7zTLoFbtyhoxxNBErJ/PK7oxfrxQ9xWVkJv0VycQWkNCN7XFa4zLNosqLmrRjkiIYibeUfCYj5niieruF3CIl7jD88CaATU21O4A6bfo2ZiJSz47/bN4unqFx0km3axK46uyUk4RIanvgC6m6XgWDjtNQYvmdGwga6FSBYJbDBcMTGcshqvTIG1m/QxiZhKdZx+GY9AKys1BW153GZ4luMlk+rqicBaUPIc9TDiJnk2u5pd714efi6LFOKhTEypMyV2J9Erwxh9ZScYilTgrN5Ym+UxNKU83vDFbIU+6FpBh2xQVE6YGLyFT9v3F2vgMTxF8+A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aeb1acc-bbd4-496d-009b-08de99ff5e8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 08:25:21.4643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpLdDT65CjGJZ7KyrIZRmcsyHf/BGPlQX2SovjNdwR9H67dhCkg9ReBS00ZM2r0aHIFJjOH2Lv84mUVAAVa0pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9791
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

Hi Jeevan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan
> B
> Sent: Monday, March 23, 2026 2:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t 4/4] tests/intel/kms_pm_dc: Scope PSR handling to
> output
>=20
> Stop using global PSR checks by passing NULL to PSR helpers.
> Select a PSR-capable eDP output and scope PSR enablement and verification
> to that output.
>=20
> This fixes incorrect behavior on multi-eDP systems where PSR capability
> differs across panels.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 39e94f36b..1a88c54bd 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -162,6 +162,10 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20
> +		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> +				      data->op_psr_mode, output))
> +			continue;
> +
>  		igt_output_set_crtc(output, crtc);
>  		data->output =3D output;
>  		data->mode =3D igt_output_get_mode(output); @@ -318,9
> +322,8 @@ static void check_dc3co_with_videoplayback_like_load(data_t
> *data)
>=20
>  static void setup_dc3co(data_t *data)
>  {
> -	data->op_psr_mode =3D PSR_MODE_2;
> -	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode,
> NULL);
> -	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> NULL),
> +	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode,
> data->output);
> +	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> +data->output),
>  		      "PSR2 is not enabled\n");
>  }
>=20
> @@ -342,7 +345,7 @@ static void test_dc5_retention_flops(data_t *data, in=
t
> dc_flag)
>  	dc_counter_before_psr =3D igt_read_dc_counter(data->debugfs_fd,
> dc_flag);
>  	set_output_on_pipe_b(data);
>  	setup_primary(data);
> -	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> NULL));
> +	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> +data->output));
>  	check_dc_counter(data, dc_flag, dc_counter_before_psr);
>  	cleanup_dc_psr(data);
>  }
> @@ -356,7 +359,7 @@ static void test_dc_state_psr(data_t *data, int
> dc_flag)
>  	setup_output(data);
>  	setup_primary(data);
>  	igt_require(!psr_disabled_check(data->debugfs_fd));
> -	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> NULL));
> +	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> +data->output));
>  	check_dc_counter(data, dc_flag, dc_counter_before_psr);
>  	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data-
> >output);
>  	cleanup_dc_psr(data);
> @@ -615,6 +618,7 @@ static void kms_poll_state_restore(int sig)  int
> igt_main()  {
>  	data_t data =3D {};
> +	data.op_psr_mode =3D PSR_MODE_1;

I think this will work when each subtest is executed explicitly. If full te=
st is executed,
with this below changes, some subtests rely on existing value of op_psr_mod=
e.
Imho, it would be better to keep the PSR mode assignment explicit within ea=
ch=20
subtest to avoid unintended dependencies.

And this looks like a cleanup/refactor rather than part of the functional f=
ix.
It would be better to split this into a separate patch so the current chang=
es=20
remains focused on PSR output handling.

Regards,
Pranay

>=20
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE); @@ -640,8 +644,9 @@ int igt_main()
>  	igt_describe("In this test we make sure that system enters DC3CO "
>  		     "when PSR2 is active and system is in SLEEP state");
>  	igt_subtest("dc3co-vpb-simulation") {
> +		data.op_psr_mode =3D PSR_MODE_2;
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_2, NULL));
> +					     data.op_psr_mode, NULL));
>  		test_dc3co_vpb_simulation(&data);
>  	}
>=20
> @@ -649,8 +654,7 @@ int igt_main()
>  		     "while PSR is active");
>  	igt_subtest("dc5-psr") {
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
> -		data.op_psr_mode =3D PSR_MODE_1;
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
>  	}
> @@ -659,8 +663,7 @@ int igt_main()
>  		     "while PSR is active");
>  	igt_subtest("dc6-psr") {
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
> -		data.op_psr_mode =3D PSR_MODE_1;
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>=20
> 	igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n"); @@ -688,8
> +691,7 @@ int igt_main()
>  		igt_require_f(intel_display_ver(data.devid) >=3D 30,
>  			      "Test not supported on this platform.\n");
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
> -		data.op_psr_mode =3D PSR_MODE_1;
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		igt_require(!psr_disabled_check(data.debugfs_fd));
>  		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
> --
> 2.43.0

