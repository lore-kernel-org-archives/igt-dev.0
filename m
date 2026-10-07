Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14242CA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 21:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADF510E6A4;
	Wed,  7 Oct 2026 21:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kB7THOEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D2D10E6CC
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407479; x=1822943479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=myor8dknDk9m3PsmMk0P3ynXKoe4SSdTmxHai1mz3JQ=;
 b=kB7THOEa12JhqkSqUCzTVuI4ZphQNZz/AbtU71dC6EL8HiHzIQy9a50p
 9MNkwoDpnKh6vmPRZrsbDAsaYt7l3SzJA9L6h/vosZIU52+InP3CqBMqN
 i2g8WWpwC2DCMePyL0mBXL/8zHDLpOhEhEYtQE05qkf0wv7fo81eDgLi1
 FBnXJwTk9x6q6W5vZtz7Ccb4qwJFXbci9Q+GI+xJLbj6tmBx6r2ahPnvM
 qol4x4oaHvY5u95PjIZQKZTChmOpISkFaeMGb5lY6TP2/n5+ZDPf0ny7M
 KWCJUqbhdgxEGH6/OuHSn7AeYzP4PwBjbqq22gHoU8y5Qrgm3Wz5rEsI5 g==;
X-CSE-ConnectionGUID: 7CnKHHf6SkmNtXcmrxUS1Q==
X-CSE-MsgGUID: kS7yJ2JVSMGaFoS1poXqNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="190902"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="190902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:11:18 -0700
X-CSE-ConnectionGUID: wyBxvcrIQ4C9VAyMPqqcaA==
X-CSE-MsgGUID: JK9gqSl0TCCvdMvkM8gVjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="280843157"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:11:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 14:11:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 14:11:16 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 14:11:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvQqsrUiPSclgia7ap1jrRmsg+f4rnUAXk6XNKVqq7oYkWPUzK8hjH1yqIW0AHsfF1gJBmCp4j4W/pw+B2O1266MkuokwC8BE+Njag8oNMZk5/knaIBuMWuAym8GqjdQ/tAc6RxEXr0esjSf2X+REu5+49xYwruUp7YZrIB9pEfHZMDANyJGOdvS+/+xLWe+hMYPaStVHjJZQGwaAAwYHGPpWkGvDmtNb1fIn5gaPTlWAx7VBIoNt5LuOqWX5SIjl6BH+MtW+jJn5lmw5LLI9k9g7MObcsI4s/WykoW/+cyOsu8LQLTJnMPRmCBO/wNQNiRlg7v1GO5eFrCxO7priQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DkxZi0MLx6PvwoSflEaF9pIlr+AIjYeuhVnzr/ozMA=;
 b=s8YzwcPh2yUUQBHvyXEPK/XrxI8Zm1GfH0oIrAa4ixvXi/KB4jhs43oF0NUpH/9ls7iV5NWPPQwnPyL77dzUpBJQ9X9uUxcdwdVgMDtg1SD/5i4tBqFSRxbP7NiVgXxzm0dDLVUHAMpNlOF9mHmtlxqmhbIuyRa7l67N3cmiGX3OmNeTAEgGp9TnN7hI2dSR5WShcBuPMbVl5MyzuKP+bUUhwJh5ixtrq9GerRlq8ajTQa6ZLqrqYumv9EDyz0Qzl5NPzJexZq7RHW3OGOAPmMcbzQyVR74NvfIsCpwdNKpoUUeRq5Hj5xBvegoz34z9O6Wpkp2r/MJXbRJuI3O3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 21:11:06 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 21:11:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/4] tests/intel/xe_exec_reset: Fix gt reset fault dmesg
 ignore regex
Thread-Topic: [PATCH 1/4] tests/intel/xe_exec_reset: Fix gt reset fault dmesg
 ignore regex
Thread-Index: AQHdVp+9SjyerLBco0mCV0FoCkmwi7byksgQ
Date: Wed, 7 Oct 2026 21:11:06 +0000
Message-ID: <CH0PR11MB53953B78C75B9E0E577AF80DE5942@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
 <20261007210603.1350158-2-shuicheng.lin@intel.com>
In-Reply-To: <20261007210603.1350158-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|MN0PR11MB6010:EE_
x-ms-office365-filtering-correlation-id: cdd0d688-388e-446c-6e5c-08df24b780a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|38070700021|11063799006|4143699003|6133799003|10067099003|56012099006;
x-microsoft-antispam-message-info: zDBZOHDpXxXmG9LR+16OyZwBrsg3v1x/z4COZmH9DbZ/mBMuGWSonkf4lZh9cHzEuuQmQQwOwacxFLqAYAcj6gcS3BNx2ccwWxb4UxfuZlbLbcHruggXTAvLukyLzFookhPjF5uxAoTpHklC+apN5g1vZs2FIM48iOumN3wfW5DMlZwr5t2MZVngfOaxws7nyNts3hITvL0ugVxmgIDYthvhwNrKGg80vbMXJKQuVEomozqelfXqij/Uk+V2RQsDsAzOmhAjhMx6qVhkGHSp4+Umbnr2MLKj0iqOxq6H4a/SxQgAdM1kKSboW3kvTXJ/MdtoZVavHY4TrVuwVAFvATrhlA4GRsr2nzy4wkKVRj5vL5hc8UPeOs/nmL+wjYhZ7Dq4zQmKsYIKjnq3z5LEZlsgbChLTTIKCF4F7je3P1DacwAowfCaqkJOpGIhW3Znh8LUSci2vqGDUZvlFT3X7/a5Ifio02MTubd43NU+mCJr6xoXXfOJXyIYROXhzT/DWFXSRr/XK9NtwPpPCdH7OTNG55Q76m5vR3JhVovh8BkvJpTnVgi8KxBOJKmeVCqM9HVk/ONwLI6PLOY/uYYpQYutdba1PYznD115yi150o3aeZVP6Gk2GDud9v34UyQdqddP3+oNMHUkjBfr7uN+rQZK2yIq90/Y68oDbXF5NozCB7fzqAE2B6JJn2J7yxi1XCcIvTxlh8WzlUySAylnFQi4j8hceCLdyQj5HX2I/+4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(6133799003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sqe/tiKHmq5tYiAdyUBN1y0tchbcwfoVVf4wULdUhgN0D9dYgFee+EhHA86J?=
 =?us-ascii?Q?8gfozNsMAH9o7clssANI5SP85xAH9XRnuX/FVWxGB5RRQyUXsWHMCd5eZR+B?=
 =?us-ascii?Q?nu4TWXQCFZ4A1vwceA644OBh5ZuCU2bOKbJygZ7oScHon6jW9e6eotWcwl3h?=
 =?us-ascii?Q?vb9pjDIPFFbNeuS+SJCEEMr/1C2hV3z6C1zwDQBtOY9lyZB/plCLexnPQLMO?=
 =?us-ascii?Q?g/55KfvwK/tDHxl+vvU6ZZNNCPI8W9+X6SquBjLnXPzFbK/Ii2nn61jovHcW?=
 =?us-ascii?Q?bU/c5aXa15o7prhk0eu06nAk0ZvRU/pV9moWiy0u/XV90boK6fPZtdaKa7EV?=
 =?us-ascii?Q?C9ysMSaNpzq8jmTmr4+7CqF0uewr6yaXBiJcp9KGjY88uwrhGdB2Perk/YOZ?=
 =?us-ascii?Q?ri1+uf74coIj/LVz0WFR4SsBKrsaggPLTBgL5SQ58WupiLh1RemJ1WbvYyP4?=
 =?us-ascii?Q?hzHU97L7URQG7OWBfvOwqynslODaNY1lS0q1fBvTCul6cER88VzzlPouUcxf?=
 =?us-ascii?Q?c2DDf2IQ6/OzhwI8xq9wABYl02jdKZHNWWR5Bl76HkOypvz9uJnmbRSH69lJ?=
 =?us-ascii?Q?iZqUEtlHqk/r6S39Kw296RyR1DuG5ifvsF/yZkh3Dd9cQpQO0jLJKs2eJhVZ?=
 =?us-ascii?Q?2NKOLw1F9t6zGxTzMcpEvcgANdj8nqYO0EUpnUVlrRlxHD+T3iB9lvynNDNS?=
 =?us-ascii?Q?xMHY9seEcACoLCqGj3u1ssLLJ1YMcIAsz53iT0FJyuv/2mM0eGJS8WLZ/U3D?=
 =?us-ascii?Q?q6WRSDo2Rjv3fn2iiJtvp64s9Shk5VpvDGbGmXMrTl9vePAISK0SN/JoG601?=
 =?us-ascii?Q?sVYiNrU+OlBky1md74a024z4KCZn6a9XP3IFGvWjuXV8glCYXi7nACVx8207?=
 =?us-ascii?Q?8FZTflYHP+710meu+tLICczTjQy6ZIxaaTeBUdqNYRdXRStHf3Ql6m1FwpaV?=
 =?us-ascii?Q?Y7TJQoWyWFXgJnyeew0JVTD9kgqEtVz8gn/vGeNJeCz4hUlemDAF9hW80imS?=
 =?us-ascii?Q?tOOsDo7V11qGbnjU9SK/NgL/mcnWC5ATg5gDJ1ZDHxAT9uK5xtuzlyk9qpzY?=
 =?us-ascii?Q?Ulv9x3dMJYwAMFw1Pveb3dOBh7twU5ccVJ8N0t5IZSeTUmzBqvnzaIT98Gof?=
 =?us-ascii?Q?ZUgsJsC80vSF+TIWqQvxou4kg/B40U8CKsCmxg8+gPPg3ItfCOjjRZ7AvP48?=
 =?us-ascii?Q?We6vPe5EOQo4qhoaWVt/dhcmLN6jWjG6D6Z/68BFyDVUweb9L5bBxL+hI6yq?=
 =?us-ascii?Q?8kRW2crd/hJNPUKEQl7mKWiXSS13n8RkhnPMQNh2MpDDdpOChv0qPz7AvH9C?=
 =?us-ascii?Q?hMtq0VvjIS3yU3SrmmAabdINAzHM2cHj8q840ycHhRZAdg17JXwkMBYxB/BH?=
 =?us-ascii?Q?tXtRkDSC9QQNFSsOu9DKDBuqyzwQqly2V0tZmydkWLEjMapETjFbj2Cog5P7?=
 =?us-ascii?Q?sDS0cA/TyfEIn2C+5fyr6G1bGEo7+oji6JW886HZ0WsTE9CTK+uVGJm6eoYG?=
 =?us-ascii?Q?L5POoZgUlD0NG+VvZpUA1WnutSezt7oovWEvQls543ewOPhHBIHZ3V6sVJFa?=
 =?us-ascii?Q?lyJj73Zyxlc5Y1/P9QXrljhwGpq8trBY/YnLE4z+VGAbmTBPlGqvhaOzrhyB?=
 =?us-ascii?Q?3441ZiKAkbJ3eE61yzpSGYwotU4FRSMJ2dvmaMVSb+XdPwMlEXsFupkES1E1?=
 =?us-ascii?Q?WfqviMZxdxO456Dd1uyOYv4Tr7RnIXghfz+97IeM1yKdkpD3xn1hvucl04Ff?=
 =?us-ascii?Q?g0vSVZuDIw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kFFKJ6X2tLzvtKwkivC3Zo++CwBaEkkKBfioEhy70V6FhbzqoRoZb2cIT+A1I9th+psgzURq+AzvjJzFHdNCSXYtPoSRbU8/K3sG/sFwbUSI7nbp/o+nc7l4hBTeM/L7jJKwKX4RUKAwafJfLnSA412SMPNiP91TwvO//YH/ViVOzONA5CLIam3cyLLM/XbJwAaSOGTeCFe1daufeeGmS8b4EOxDTa6Fcr3UkOsCVtpSfrcKz8ZzzqUffBKPoU/X5xQgOiaz0+9JSchfx7fh2dhRLWW2TpUwUkjYiYWzfFJIV1TTx7kbvvvFEcFXopN0mWHs3s9HW3d72/Y3N6CxKQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd0d688-388e-446c-6e5c-08df24b780a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 21:11:06.5105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJcuWRjXkdhE17Qycvv0SJiBoZwHEznDb+6BCk4F4eI65JJgaYTYb8WjUItURSGNcL0TmWPgU37ChIA0kjZsPnMzc0Re2C40l3FtCQNLuDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

-----Original Message-----
From: Lin, Shuicheng <shuicheng.lin@intel.com>=20
Sent: Wednesday, October 7, 2026 2:06 PM
To: igt-dev@lists.freedesktop.org
Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Sharma, Nishit <nishit.sharma=
@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH 1/4] tests/intel/xe_exec_reset: Fix gt reset fault dmesg ig=
nore regex
>=20
> igt_emit_ignore_dmesg_regex() passes the regex to igt_runner through
> /dev/kmsg, and the kernel escapes '\' as "\x5c" in kmsg records.
> igt_runner compiles the ignore regex from the escaped record, so
> "\(-ECANCELED\)" turns into "\x5c(-ECANCELED\x5c)", which requires a
> literal backslash and never matches. As a result the expected
> "(-ECANCELED) ... GT: reset failed" and "(-EIO) WEDGED" errors are
> reported as dmesg-warn/dmesg-fail in gt-reset-fault-injection.

Oh!
Well, that's annoying and unintuitive!  But it explains a lot.
Thanks for catching and fixing that.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Use bracket expressions for the literal parentheses so the regex
> survives kmsg escaping.
>=20
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 50771af53..901ce2f3f 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -928,12 +928,17 @@ static int try_vm_create(int fd)
> =20
>  static void ignore_gt_reset_fault_dmesg(void)
>  {
> -	igt_emit_ignore_dmesg_regex("\\(-ECANCELED\\) .* GT: reset failed"
> -				    "|\\(-EIO\\) WEDGED: Device declared wedged"
> +	/*
> +	 * The regex is passed to igt_runner through /dev/kmsg, which escapes
> +	 * '\\' as "\\x5c", so use bracket expressions instead of backslash
> +	 * escapes for literal parentheses.
> +	 */
> +	igt_emit_ignore_dmesg_regex("[(]-ECANCELED[)] .* GT: reset failed"
> +				    "|[(]-EIO[)] WEDGED: Device declared wedged"
>  				    "|IOCTLs and executions are now blocked"
>  				    "|For recovery procedure, refer to"
>  				    "|Please file a _new_ bug report at"
> -				    "|Failed to invalidate GGTT \\(-ENOTRECOVERABLE\\)"
> +				    "|Failed to invalidate GGTT [(]-ENOTRECOVERABLE[)]"
>  				    "|GPU HANG"
>  				    "|Failed to reset");
>  }
> --=20
> 2.43.0
>=20
>=20
