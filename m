Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC4CC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 06:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AFE10E05E;
	Thu, 29 May 2025 06:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaMA/8WY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8270710E05E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 06:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748498482; x=1780034482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b2EU4DufS9onC8VKY7oGiwc2ZzRJ+Q1TGNfsA3aU1kw=;
 b=NaMA/8WYAj2GwRaOgkwyBAAUIHq8aGd++hOvSiFHcmWG/mxJqTVIySnL
 dIcGY6ruk6A5Gx/sYYvYhaCKb0knpcZHQXlZDGbIdASqVgegp5oM7E41u
 kwzCGSF89wy+cSg17JnpPuPDt2YEPrVpp2Wqqv5tzvF06LHC8nKQYGHe3
 ezVKBRDayKfQAfRfjbdyUQSHIk0tdWypQLjAdRdtN/c5LgQWiATOg4mG7
 88LbHSmXYaqc5tX0JhB1tb/0EMb2sGUyYiYhmJgOqrkUxYsC6q93hYXsC
 holgNGGjnwWwzL5EqUtQ+24uezdfqi9mvW1Y9cCztHXitEmb+amtyY/Bj w==;
X-CSE-ConnectionGUID: wkm0kbBxRwOoN6vGCM+F/Q==
X-CSE-MsgGUID: UE6PYSKUTnqtTjSIjMTtMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50697544"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="50697544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:01:21 -0700
X-CSE-ConnectionGUID: x5cfG5nuRx+w3SNSJdzTIQ==
X-CSE-MsgGUID: iy565Gm7Thq1HeO7Nvb5qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144101931"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:01:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 23:01:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 23:01:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 23:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnFztPp/XmP9u+072p885QEj31zsRnS533uwYm8nBooNP9ISypo6pWhHCHMO5qgkZqz1FGArLhVQ/Q0pQdV0ci0jEn3RIKDr9HdgcXbGa6FCOd8oi0O49ft42KrGvZ3HnVvZ3T3LH4CyAsSbejUh4Ivwl9e8s1YgfdHOWklcirrTF6THnfSl44EBFFD4rO/rcpqS4DrFzPxcnLs7x+m6/hJEU5DMIHYnXaSmFrGp2txtFkQbU8Sg1p9F93Cb7csWHkXwD/nVzUFu+FMF6FbIVeTxo1TAjJGvvm290m4jjU78SgTSW5PB7FH8qTD/4mHfraMXB2saX/5xsItJPoWoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu6zm0PhSc5CZpisRCZBu/i4lmrqXtN6eDlKEJteL+o=;
 b=UhCkO0qy/ziJ8/9uCcRG8SOp6WjQgyrcRgHCSCSE5KYsFtrLmfYpvdbx6ipTgX2d60KFIqao1npZ/Kqh/ePivOqG102XhKm3KqKzap0AaJRszypuBTSa8MFgvEMf7Besc6P8pQju82W3fF9jh7Lx6Hqw0RVMgItZ2SvIj7VrzmMxeijgrli7r62kTNmalIIF8R3AYF95ZCmFJrmaNP/MY6oaZa/UlTG6soIXJTBmOEk3CvSB1wblWYQspEXj9eVhb/SwHuSnerkSebpEZ9/HdlKwlIp9+VM0URhKQWGYIfC7jcbshloAUc+CYh03dqV0wrnWkQS+03MUi8/y/tEoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 06:01:18 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 06:01:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Whitelist
 check for panel support
Thread-Topic: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Whitelist
 check for panel support
Thread-Index: AQHb0DzgSXQtyLlN5k6sbeBhQ8quHbPpHXUQ
Date: Thu, 29 May 2025 06:01:18 +0000
Message-ID: <SN7PR11MB67506B911CAEE753F97D535DE366A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
 <20250529015522.298460-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250529015522.298460-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MN6PR11MB8103:EE_
x-ms-office365-filtering-correlation-id: be0a6a70-65c0-4cde-b32d-08dd9e763aa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Kaud/8ntnNCsKm07InH0nvjG0J4HONFA1YaM5XFzmzpLZbse/vI9emqW8rqI?=
 =?us-ascii?Q?thiwJRis9DtEbAoUylpQHfR/klOs7n/pGteclLuGfbU96kJIBG4eOnAFdzTs?=
 =?us-ascii?Q?rBHFZ/lElLZzTAu/MEej0k6/pw2TOlsju8JokX8RPhNHAZbxu6dxGIXjy2En?=
 =?us-ascii?Q?rPyyd8WvrGhtyPmmKucV8bvvOM9e5MXlB7wTE6E1X1R7iVYHpJaJ290dru4B?=
 =?us-ascii?Q?ZJ2VCTjxIVBWE7BRK7DZvPKKxScT2jj9RC0BmeMC0Eo3m/gjCm6voWQ1ImIo?=
 =?us-ascii?Q?HWybdFGDDc0TYQpT/RI1XCHXMYd6qH2jjV0qguMuBHIBtHpM/+o3pHTAOmYC?=
 =?us-ascii?Q?QCnlhDJcg/vFNqA7VDJIqwf67SGnV8C7t+06EtgpF49LM3WbS7TmnXwrG5m8?=
 =?us-ascii?Q?wcFwUuEEZjYm+xbvD4PJED7abjJ4ldJAIJTjM3195F8cCEJdVLo7Wi+YjehH?=
 =?us-ascii?Q?MWOnZ/YULJKOrOVXlTGw4IoUBhD2z/F9fVv4Iu4baWNk/uSEh0nEqrA5S5CA?=
 =?us-ascii?Q?9xSwma9laaNVumEdzWh1bzkG8dcHkM9cGNH6qMX9KWWOtTuGDNf1K22ygBfj?=
 =?us-ascii?Q?8s/eAw31yhbNX+XCnIVJuo2gWEiMee0nBRKI7dGwgvN17Soz3LB+FiIb6bVB?=
 =?us-ascii?Q?x76CRbIswyy0MsmEUANAy+JDm5sR/v7gvdN2WLIaUnFLYx8AD80zxSmJKDny?=
 =?us-ascii?Q?ygNzih9G1h+2eDJm5gtznj7sErhRCAVV+R1PDFm62kIk/EhQEVlGUQqnhmxH?=
 =?us-ascii?Q?p6hsK3DQd+rcAeStTF/KeF6scE0CBeX4/dOxc2DIZBeL6pvv2XSJ4Bi3k8q7?=
 =?us-ascii?Q?mGw+Idt+fyvn2T4eR+lS1ERzkncNn+KtHsOcPO2uo83bu6SSDqd0XP9zos1d?=
 =?us-ascii?Q?GIFshy8+C9PJkYjKeIh9ilaPlosf+WaAkUdHM+15MefNmSgo70XIHzid9Zuf?=
 =?us-ascii?Q?Z/F+8qQD50Epdz7vkWMdy0gR8aPX5cmqBsob6ggZkqYXv0j8KoW3HmxmEeeR?=
 =?us-ascii?Q?2GHLI4JZnJ41IJXrXxV0L9wR6e20q04lMUJrpphW4W2F7vpa5t5CvpQd6UVn?=
 =?us-ascii?Q?qpgQTWuSaHlz+ynPiDpnXAx1kHEnFG/Q9IWXkAAYTVBB2UJRrKyj23HwJkET?=
 =?us-ascii?Q?drbN93rFz06pu3S/Nt21ZW0WYelw0egbjXvKKknsh73g3Z8DPXVuivDEBpf7?=
 =?us-ascii?Q?aBnYMJzpq2ZYibw/9L0kUBdMrQXzfvg8PhK8goCc5cOhwxEvR5NYxqBPl4Du?=
 =?us-ascii?Q?CBKANTVpSasIyR3nntTfptnO70aekih1PWpwW38WuoybSYi92wIAWfXPfA0K?=
 =?us-ascii?Q?IJ6NaYkHUY8j2fXlfdgg572hNt1sOloLR1r0BnZ44HOs37sdJO+D/b9PHtAy?=
 =?us-ascii?Q?H9u6NY0yDu5l0KRfTv7yIa7DsogJvb9B9Fmri+AYhNVDtfQQgECmGSGIAW4B?=
 =?us-ascii?Q?eVyJb1XcWxqa38YKMNoeTyS5R6BHCcWhq61D62CKOBz+4xykwgcm1A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H5wmg/949GPuEBulXT3c1IWLYZNWebiAGsMuXYYZROrpxMvszObngwY6NCN9?=
 =?us-ascii?Q?87GWxF420q4BhJjHCc6ms6Pl0A+grfLPTypihc1Lz2i0/6oX/4ccDjcnGY3A?=
 =?us-ascii?Q?uqydEIB6zaRnUXenU8R4bw1a98u4HpN8lCJIPsUq95xcMFxmj593ZsYX/dEE?=
 =?us-ascii?Q?V3LwwpXqPGuL9HtmQH/nYXBHqsBfetX/WJeRwAwZeE3F5xr4NpaWTc17AYY3?=
 =?us-ascii?Q?ZJ/U8pyk3GprPlMHd4mM0B36iiUTpGMRU1PFnMmAjhtq2WYvpOTqREbf0H6i?=
 =?us-ascii?Q?RCpNOfx0vEFOe2m/Aynkg6E4/IMVHeq6oTq43KAHwKbuzXZdtxnkH4lS7y9+?=
 =?us-ascii?Q?SFViz7XCHoga1bMMdkc/lM348nyOSRdanNPqQs8AzjQDsSyv9upKzeRGtPXY?=
 =?us-ascii?Q?g0xqjPgg3PHr6ngXdvskcNXblw8adzNFdEa8FmNKysaHHEAg0e/qNMu8eG6l?=
 =?us-ascii?Q?YOBO5el6pmiiYKisrYG6vm+uUfDeE7EGySgUh3C0TCQ4qIO5vMoELMvY6/4L?=
 =?us-ascii?Q?tc0m9lHafrJ2OnTL1g8FDsOGoREeVXvBQ+OPrUbVhhaCkO7XNeGPm8gF/qNv?=
 =?us-ascii?Q?IIKXmsH2U4d0VC8v0jH1JQEGeQWYcs9QnNbR6aNO/5KcI3d0Zx+pkBJB78iB?=
 =?us-ascii?Q?7KAieE+sk0woqz6ad054uCytsk9cmd0hTFTViyOfE0H1O/qQvY2N9VLGDPIN?=
 =?us-ascii?Q?pw5UfXHskpvAF8zdeTh0mWl9sDXRpdqrejRqa1tSF6HInAQ+KsjFi4lWV6Cb?=
 =?us-ascii?Q?Ng8NW15AvoKcuM+oFUt+UHK5ddvQnGn+kAn6ep+rvK10z8CCkmFXhFVu89kw?=
 =?us-ascii?Q?LRSDIAkyhUCOSfqErr3555BrGWnUZmtFL5mcvq41JdcYVMkm6HHVD859JZqV?=
 =?us-ascii?Q?6T2AVm9axyPzkz9Ugg4R9IThzcKzfsQObAtbobsgi29I2oBMB3r98cKiX7wX?=
 =?us-ascii?Q?p6XaQJjX7zlGQeukkcagakTJhT141UIDilfQOYhMO0U3vGP9PBpl7BZtYXbj?=
 =?us-ascii?Q?BINstJ2qo8Idt8GVklydDwIemdAi9vIMRucIVGTyYJDotY1bsxOVS0ZZ6U7g?=
 =?us-ascii?Q?Fsv5NZKJor9sxrUvjw+mMP5iJcrqmaJzWoHLG62/NaDeUL+hLfJ2FDqNI9l6?=
 =?us-ascii?Q?oKlK3N0kOZZmrDo/AstYb6m4XfWxgZ+s59Wecddcwt8Kdx40LOUWUmNl52ay?=
 =?us-ascii?Q?dj5R4DgpI6I+Mdc/Cl4nUwePAdRaiAxiWrlkXTvm9OjGGlmiyvYx5yndwhoY?=
 =?us-ascii?Q?RLRYzb7nSBSQj+GK90/dmJ5B/mtU+fnBpB1rlAm4FHJuMDSBUCkQ6OREAw6f?=
 =?us-ascii?Q?qkG8MpmVK8mg8XV0jY/vhIvypX1MfwZzN0+VdI289dhJAKV07RlAHsmdRurs?=
 =?us-ascii?Q?nqK3curn3HUT+9VahVaoNTtJv0JhtZ2YArzX6/jHmBwUxkyAsoy7iXkiskND?=
 =?us-ascii?Q?M2pYsIfWrXKPpv9vWRpsC6bWtSj/Bp8fpkcsVMHGT/FeWwcJ6JaGBHbtEtNL?=
 =?us-ascii?Q?FuH0j2fWzvyucSe/Cvf1ysiyG2qUFH5rcJ13LTFVAFFkHtH42t8zve5XhM8m?=
 =?us-ascii?Q?02oJ045dYT/uNmYVirgJBVi4w/nGRzk+DaCylCrl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0a6a70-65c0-4cde-b32d-08dd9e763aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 06:01:18.3841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIl9rkiAAU038vvVVUtq6tlyPpggvfzFgHUgZjEJnixNmDIvaJ4aftEaG/EPAJhqm441f50Y4snVOs1APilUcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, May 29, 2025 7:25 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Whitelist che=
ck for
> panel support
>=20
> Verify the connected output is not blacklisted and if the blacklist is fo=
und ,
> skip the test on the output.
>=20
> V2: Rename the function names to reflect the test exemption on panels.
>=20
> V3: Add blocklist array to content_protection and use igt_is_panel_blocke=
d
> (Suraj)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 47
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 6fe1edbc4..90e2ee79c 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -36,9 +36,11 @@
>  #include <sys/stat.h>
>  #include <libudev.h>
>  #include "igt.h"
> +#include "igt_edid.h"
>  #include "igt_sysfs.h"
>  #include "igt_kms.h"
>  #include "igt_kmod.h"
> +#include "igt_panel.h"
>=20
>  /**
>   * SUBTEST: lic-type-0
> @@ -128,6 +130,20 @@ __u8 facsimile_srm[] =3D {
>  	0x83, 0xAA, 0xC2, 0x5B, 0x24, 0xB3, 0x36, 0x84, 0x94, 0x75, 0x34,
> 0xDB,
>  	0x10, 0x9E, 0x3B, 0x23, 0x13, 0xD8, 0x7A, 0xC2, 0x30, 0x79, 0x84};
>=20
> +/**
> + * List of Panels that should be excluded from hdcp tests
> + *
> + * This array is used to identify and handle scenarios where the test
> +is
> + * executed on dummy monitors, such as those found on shard machines.
> + * Since these dummy monitors are not real and always the test is not
> +consistent,
> + * the test is skipped in such cases to avoid false negatives or
> + * irrelevant test results.
> + */
> +static const char *const hdcp_blocklist[] =3D {
> +	"DPF90435", /* Example monitor name */
> +	/* Add more monitor names here as needed */ };
> +
>  static void flip_handler(int fd, unsigned int sequence, unsigned int tv_=
sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -578,6 +594,32 @@ test_fini(igt_output_t *output, enum
> igt_commit_style commit_style)
>  	igt_display_commit2(&data.display, commit_style);  }
>=20
> +static bool is_output_hdcp_test_exempt(igt_output_t *output) {
> +	drmModePropertyBlobPtr edid_blob =3D NULL;
> +	uint64_t edid_blob_id;
> +	const struct edid *edid;
> +	char edid_vendor[4];
> +	char sink_name[20];
> +
> +	igt_assert(kmstest_get_property(data.drm_fd,
> +					output->config.connector-
> >connector_id,
> +					DRM_MODE_OBJECT_CONNECTOR,
> "EDID", NULL,
> +					&edid_blob_id, NULL));
> +
> +	igt_assert(edid_blob =3D drmModeGetPropertyBlob(data.drm_fd,
> +edid_blob_id));
> +
> +	edid =3D (const struct edid *)edid_blob->data;
> +	edid_get_mfg(edid, edid_vendor);
> +	edid_vendor[3] =3D '\0';
> +
> +	edid_get_monitor_name(edid, sink_name, ARRAY_SIZE(sink_name));
> +
> +	drmModeFreePropertyBlob(edid_blob);
> +
> +	return igt_is_panel_blocked(sink_name, hdcp_blocklist,
> +ARRAY_SIZE(hdcp_blocklist)); }
> +
>  static void
>  test_content_protection(enum igt_commit_style commit_style, int
> content_type)  { @@ -595,6 +637,9 @@ test_content_protection(enum
> igt_commit_style commit_style, int content_type)
>  	}
>=20
>  	for_each_connected_output(display, output) {
> +		igt_require_f(!is_output_hdcp_test_exempt(output),
> +			      "Skipped as the panel is blacklisted");
> +
>  		for_each_pipe(display, pipe) {
>  			igt_display_reset(display);
>=20
> @@ -923,6 +968,8 @@ static const struct {
>  	},
>  };
>=20
> +
> +

No need for these extra lines

With that fixed
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>  igt_main
>  {
>  	igt_fixture {
> --
> 2.34.1

