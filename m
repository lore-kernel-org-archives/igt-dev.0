Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84348606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P3FvxcZ4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321E110F7CB;
	Tue,  3 Nov 2026 19:31:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D7010F7CB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793734217; x=1825270217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ydv3B3972ZRoYalUcKx7SrGdl0eaG7EregMtM2GOcQ8=;
 b=P3FvxcZ45oj4ewOL+WqoLaDKwOcOhyct2zRLJYEJCdy9i2baLkmKanRH
 ODUS9LfZDEWdbE4PNYm5iHzctyG9j1y0p+MdTq4lHcnnEwTApgbVKr+Ls
 E9F4WwgosDlOZPSL9oKmsyvkF/y9XOjgsLD22Tq5f0Up3Ih9yTYUYUF8w
 lITFTw+mgUWJT3ioVCgfNuKdjUKgp7YozQm7U18Z3QTYvzmyY6WDdUzov
 aQ4w/4VQPsR5XM3p3aeLq/Z944sGP2R30sO+XsI/EGk9lPqiHuboRbfCn
 zQivDQFZxKHkmjz/VnydzVmRbmatmI3L+ABfok0Y2v6hCJodRcH3GUf7M g==;
X-CSE-ConnectionGUID: N1todD8QQb+n4oROZr3Hvg==
X-CSE-MsgGUID: VdUvYq9CQ1aa3EZgcCBSNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2363494"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2363494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:30:17 -0800
X-CSE-ConnectionGUID: qZacnJTdSxGplDl9RnRW2g==
X-CSE-MsgGUID: 3w4NFOeuRlKNjpf1gYoooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6518070"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:30:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:30:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 11:30:16 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:30:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE0AFZxb/XY9lozmTLp6bPF8NS4v4wDiRRppRITPw78TyI+106JkKwhien6BIcGpheVYDv8iM17l3lfQr0cyb8iVmvlPUEtaSDo1E+CynYeyiDBXpdiow8R/twGXyLhxXJZqc19jdSnMMKzJHfxqMCc9Qj6zdGg1uYt8QVfDi/Yn8t5zCTF7GnqsHAMXNezv7vqm8NCX7baiJGwt1bwNopzAgxQOM1X4iuXVooyFoXMvq8gXhZ9kSCayrZopu5P400AxnnSLJbapKkZR5v3v0C79uk3egmH45ngclQOkJbgeAXzGkOmPoXWPaznVq/Gc8JDOoxcwsOGAE4Nv/lrTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdRezYm1bDnk+Ol9yhUoB8+lljuTTOiczKRI+496KH8=;
 b=aKZK1MYpafZxsWqHDcqPFgjNEEhazF5Jxy7ZkCrqCNHQT7ShMZSY3pUkko5vR9NBQTgBTJYMdgeRdcgbcqFpcWHacH7rRsabi9zD1onv43QsuupeJVYOHiQMWkL7jR82Ucr8x4/2xumVXjnD19/OSM5NJpgpd/paQqlC5nMQRR85AW60lwyLbSjFGWCX8jyCMRaMUzeaJCzvSx7aJ/fvS/b0gzjIdHlPpdVu3CjnZBzHzh1+gVFP0YTzPxcG1Xq7u3rsM2D8Ta1LqHn87EdHLMonToMNHJKmW4QCE0bbyHRUl5SwkwCidlTPX189SuIBVveKX+SsdL36S79ZAE1S/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by CH9PR11MB604688.namprd11.prod.outlook.com (2603:10b6:610:30f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 19:30:14 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 19:30:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Maslak, Jan" <jan.maslak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_capture: Add coredump
 decode validation subtests
Thread-Topic: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_capture: Add coredump
 decode validation subtests
Thread-Index: AQHda3dMZgthCqzlQ0+1YqFqo7daWbccu6jQ
Date: Tue, 3 Nov 2026 19:30:13 +0000
Message-ID: <CH0PR11MB53958EDF412EB9408C9C0D92E5692@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261103093927.1668349-1-jan.maslak@intel.com>
 <20261103093927.1668349-2-jan.maslak@intel.com>
In-Reply-To: <20261103093927.1668349-2-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|CH9PR11MB604688:EE_
x-ms-office365-filtering-correlation-id: 416426f4-4448-4e00-16b3-08df39e0e209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10070799003|38070700021|261021123027099003|261022115727099003|261022113327099003|4143699003|11063799006|261009223027099003|261026121527099003|261022105027099003|261022075727099003|261021133027099003|56012099006|261021135927099003|261021121427099003|261102123227099003|261021130227099003|261026140227099003|261028144727099003|261026135527099003|261026130827099003|10067099003|6133799003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: squ33+yGMvvxzwgsbie0hs3w5+E8vNVQ5/2y4/2gfJG2Qvw1n/VvLzjfQiH/FcqbC9qw8yQxdowZ24NjGDYtDwIu4YzoQTq/tScOOd4CxRTti6B+n0t9tceELHOuYZRI9kwOkFe/ww25kwA8OAitwdN0mjcm8BvCyCUqmlN42F+db+qr3dgEOiVkMwJ1laZqyXcbd7cRp0qXH0oCGLcb8YuOfhW2o/i3/8rtsaBq05O9iic9fueIrBFTUz3z6DCdmL/gFgBTsDlZdO13Yp6jHDxCWAiefrWJCPmpTzUUKXTfZmjWGL4kpyDtSmPemg4YJYtlIRURfBJd8BzFvwk+gjYD88gfc1Q+VdShpkdL/58rfAgDzY3XNVjHVmA2IsKBJy5sXGdv4jh/6oeKvp0uq+2qCmTVMRbp5csAq6f8FVYEHulsvUheLM28wsl2K3Whz2Hm8NZcibgRyBa6XoWkRtRAgy/JGpWMlTWPgNaug7EM0hj6NEFSFM6ub15x5Mq9kZSIys9eGfj3sre7DEmr00L9vbVzJTW5zlJHrAZgi7rtOqxa+yhp6HONgN8EGhU/34vB4CjFRb03MtYK5kDE9rL+dwnK+7MsaUCsgxgtBbbxfc4YvwkE9qwLkuZOEJmnBcxqhudCKx2AJIRmWXO5uY87w8y8g66kL1habOVT8sa6ugDH3t/VRxjI/RbY/FfCRFADV692NsJMBHj8KkOF3u3JKQq7JW3J073Pw6vTMK0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(38070700021)(261021123027099003)(261022115727099003)(261022113327099003)(4143699003)(11063799006)(261009223027099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021133027099003)(56012099006)(261021135927099003)(261021121427099003)(261102123227099003)(261021130227099003)(261026140227099003)(261028144727099003)(261026135527099003)(261026130827099003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xexb42XbFYLwRdfOEDbbMcqgeDQiEA19uV4Qfzx/YrD/FchLsQ3Ofe3tp5oZ?=
 =?us-ascii?Q?ckOw9kDIBfpvPcRg5WJzvLA/YYpCDjk9tFxlYf/tQ4iPkDUAzc/jvbTLd/Ra?=
 =?us-ascii?Q?gI5l5qoMCkfK4JIiJgEaTdp3cfqiZ7t3II8ZYiCTwLaa+kjMlaADahyDzfV2?=
 =?us-ascii?Q?WGCDnTpCJaAhzjkNVPh6rX/7mtpm7hTbpexXCdwbkAfy1c/6AElXH8TfycrG?=
 =?us-ascii?Q?KaaHfQ0lcW8M/mPjNkqkOlrh96yfknMFu19KnEk2DNdgB+14zLwHzBVWx8x9?=
 =?us-ascii?Q?y19MKKgk82AFYDN7dCvcNCPIDlUE5JOLLmfPU/kP5pSgiON9zerUc1+Cp0VU?=
 =?us-ascii?Q?sj0tMxomk6v1DhYtpZ94ATk5qyxspswJQUYE1xWvQic8zR5C6ea/indL8Vlf?=
 =?us-ascii?Q?UOHmaSFWy2KCdvD70jib8V+X349OLMhw/+lcyXpWJPW5hly9rF6DGz79i//X?=
 =?us-ascii?Q?ZO0IQekm7r7JErc/sFZoLMXSDbFYfdw5JeVKcJ/0KqafuEAoznIxOqynMTqB?=
 =?us-ascii?Q?DROVxaSvyDiyb3YIeGOLvnZNVHsmOb6XkeaRNEhZwxh0FaLoVpCO44yTAP+t?=
 =?us-ascii?Q?5zTinvzkFBa9klIpj7/PU0A0Zju/p+z1VpomLypJnxZBmPvpzBu34wH7YtAf?=
 =?us-ascii?Q?lHjKH2TjzmbO9tGxuf1gzp6Mh+PWzDqXF/iyDwWK3Ah47rw2yKE6meRaJF5H?=
 =?us-ascii?Q?Hj7VgEHVC4ID1ny3VsIvzUJGIN4dB9DR9of9vdDHwAETF/KBWAvWWlxsTjeg?=
 =?us-ascii?Q?3b2Z7tgzXXGq75x9qHSUYYBcKcK07179i/c3MI42rU0vRNgOv6p5wnfn/nEa?=
 =?us-ascii?Q?1Lgxo9EDgwcQyeq2tA5JUxsA3daO1OcbsXS28V42XCEQAqaYbWxGgTshnIy+?=
 =?us-ascii?Q?td2W2oPTyuXFYqXPoHGk19oGCdYdiv0ZqFl+kUfpotURxwm32F2YscXbomQr?=
 =?us-ascii?Q?yU/c13O+CvgIKaO3ChviVoGyA+yUJalS/daIGwqWt3IvBVSnLBOvBMeuJ/fC?=
 =?us-ascii?Q?UAvBrw61aen7oOUoRJHW9hf6h/K+0ckSohUftcl2URj9pIrdJSXFv26eL5Am?=
 =?us-ascii?Q?a5VUJ7BBqxSPeo2HmwbFyEsoURlY9BM3dwyzmY/tEBo49JYCIUehJnj++tHR?=
 =?us-ascii?Q?ZAX7uUWAhqKRRWYe4KEFDCf/MmeZ3QC7BSDneWGY4E9xANDItiPa3C5SetRp?=
 =?us-ascii?Q?cw9XxFtO+PRzBDvj2i8pvRVQYJIT2JaffP+4fF0cAfNrDaxx00UwBRrs4ZGZ?=
 =?us-ascii?Q?lf+rMYMhQOcwz/+5otZ/iX9R5SQPlwD5WbM8/EJbhSpveD05UTQos3qxw46R?=
 =?us-ascii?Q?ImFIWW2yqZCtiLRWDiuPTx+WimViY+lhasoRpei+5hppyA0zues7/oSVy0uO?=
 =?us-ascii?Q?rmADk6sb1O5+EQMLhtrM68yv2hk+lKt0ZD5Id5X852vhZ8Gotzx0CyXAhgDs?=
 =?us-ascii?Q?X7NtuNTqqIYeMUNot0ILrk0BMoHfUvEZgW8wvljLQLy1Lbq6Udm1ikB+gsdU?=
 =?us-ascii?Q?ISf3+3GZT+kET8XyJPZ0DUfLdZKWupFAGuDejIX3BF8f8tybBJlNPhzQPgo8?=
 =?us-ascii?Q?4mE8RUw7z4URX5GbFmC32DaBgB1A5pmfTbc/qdNd4jz212Jp0EZBMV8xQyzB?=
 =?us-ascii?Q?KuTcwJDnAQdKN1gPNjZYTZkmIGWXu/332DKrf0OWMlGnpRXN0F5xo0VIJ83a?=
 =?us-ascii?Q?HwFt9SWltaVdx89B+9Ba4ACXD5ZwKVnfx5DlbOMAOTdQEvACLm45Y5DYtL9M?=
 =?us-ascii?Q?YYYhlfYAqk3hA55ziX23vhhHBRXU79b+XLCWSpHgzQKUi4ZRHEJ/wnBVZyEW?=
x-ms-exchange-antispam-messagedata-1: WTW97z34f8G8Ag==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Rp7PBe9Ply1EpxJijfTJRv++ALeRuz2JjDE6jSIh7yLe3MHC+n5y/TImgkiGGdBMIro4thZhCqAMIfhdP6E+RwguGFOT+JBVQFoV+14AEjxU/1HoVby3EEn1mcxglcftdeRjpoDHUMiKbtPYqyLDW8F61nr5d8Ryw3jf4NQOBQjqzezawZLbA02kZ8urr8CwZ1HoAR+nmS5GCqUyqzinYxzoLYchp9X0CwuL2lpXpjyAp1dpKgzJ2/Bz6GRAj3exGoy9JrSHWs/5q8ph3ZAeDFgdInmquR9taX4YCrkk8ZORXEOzmAbwhlQwUiQYaoq009Fj583+xDXvE1QmikaXfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416426f4-4448-4e00-16b3-08df39e0e209
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 19:30:13.7162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVJRo3ddP9kExu/f65nAsLtsZoCUiycGjkU586QQvkrxUw7B3c0TiZhucClPzOO+wlJiiBvj9Lqd8yAeUltObeSxatv+HXCrhr4CaWCNn6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB604688
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

-----Original Message-----
From: Maslak, Jan <jan.maslak@intel.com>=20
Sent: Tuesday, November 3, 2026 1:39 AM
To: igt-dev@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Cavitt, Jonathan <jonathan.cavi=
tt@intel.com>; Maslak, Jan <jan.maslak@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_capture: Add coredump dec=
ode validation subtests
>=20
> Add decode-data and decode-data-large subtests that create dumpable VM
> buffers with deterministic contents, hang an engine, and validate the
> resulting devcoredump.
>=20
> Decode every ASCII85 blob, decompress Zstd blobs when present, and verify
> the decoded size matches the advertised original length. For test-created
> VM blobs, also verify the decoded contents. The large variant crosses the
> kernel coredump chunking threshold and legacy rendering limit.
>=20
> Require libzstd when building Xe tests and add it to the CI build images.
>=20
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

As I mentioned before, since all revision notes have been addressed and I
see no reason to block this otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Oh, and Rodrigo asked me to add this:
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

-Jonathan Cavitt
> ---
>  Dockerfile.build-debian-arm64   |   1 +
>  Dockerfile.build-debian-armhf   |   1 +
>  Dockerfile.build-debian-minimal |   1 +
>  Dockerfile.build-fedora         |   1 +
>  tests/intel/xe_exec_capture.c   | 669 +++++++++++++++++++++++++++++++-
>  tests/meson.build               |   3 +
>  6 files changed, 675 insertions(+), 1 deletion(-)
>=20
> diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm6=
4
> index d46bdb150b..114b9760d1 100644
> --- a/Dockerfile.build-debian-arm64
> +++ b/Dockerfile.build-debian-arm64
> @@ -20,6 +20,7 @@ RUN apt-get install -y \
>  			libunwind-dev:arm64 \
>  			libdw-dev:arm64 \
>  			zlib1g-dev:arm64 \
> +			libzstd-dev:arm64 \
>  			liblzma-dev:arm64 \
>  			libcairo-dev:arm64 \
>  			libpci-dev:arm64 \
> diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armh=
f
> index 847cc74240..c6527ea1eb 100644
> --- a/Dockerfile.build-debian-armhf
> +++ b/Dockerfile.build-debian-armhf
> @@ -20,6 +20,7 @@ RUN apt-get install -y \
>  			libunwind-dev:armhf \
>  			libdw-dev:armhf \
>  			zlib1g-dev:armhf \
> +			libzstd-dev:armhf \
>  			liblzma-dev:armhf \
>  			libcairo-dev:armhf \
>  			libpci-dev:armhf \
> diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-mi=
nimal
> index ad58aa70ea..573bb5139c 100644
> --- a/Dockerfile.build-debian-minimal
> +++ b/Dockerfile.build-debian-minimal
> @@ -11,6 +11,7 @@ RUN apt-get install -y \
>  			libkmod-dev \
>  			libdw-dev \
>  			zlib1g-dev \
> +			libzstd-dev \
>  			liblzma-dev \
>  			libcairo-dev \
>  			libpci-dev \
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index a65f1030d1..aacc6a87c8 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -8,6 +8,7 @@ RUN dnf install -y \
>  	'pkgconfig(libkmod)' \
>  	'pkgconfig(libunwind)' \
>  	'pkgconfig(libdw)' \
> +	'pkgconfig(libzstd)' \
>  	'pkgconfig(pixman-1)' \
>  	'pkgconfig(valgrind)' \
>  	'pkgconfig(cairo)' \
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.=
c
> index 6e454cfff3..653bca1fdb 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -13,14 +13,19 @@
>   */
> =20
>  #include <ctype.h>
> +#include <errno.h>
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <regex.h>
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <string.h>
> +#include <sys/mman.h>
> +#include <zstd.h>
> =20
>  #include "igt.h"
>  #include "igt_device.h"
> +#include "igt_os.h"
>  #include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
> @@ -82,6 +87,44 @@
>  #define INDEX_VM_LENGTH			2
>  #define INDEX_VM_SIZE			3
> =20
> +/*
> + * Binary sections of the dump are encoded with the kernel's
> + * include/linux/ascii85.h: a zero dword becomes a single 'z', every oth=
er
> + * dword becomes 5 characters in the '!'..'u' range.
> + */
> +#define ASCII85_ZERO			'z'
> +#define ASCII85_MIN			'!'
> +#define ASCII85_MAX			'u'
> +#define ASCII85_GROUP_LEN		5
> +
> +#define LENGTH_SUFFIX			"].length:"
> +#define DATA_SUFFIX			"].data:"
> +#define ERROR_SUFFIX			"].error:"
> +#define PROPERTIES_SUFFIX		"].properties:"
> +#define MAX_BLOB_NAME_LEN		64
> +
> +#define CAPTURE_SPIN_ADDRESS		0x1a0000ull
> +#define CAPTURE_PAYLOAD_ADDRESS		0x100000000ull
> +
> +/* Largest dump size the kernel could render before it learned to chunk =
(VLK-71080) */
> +#define DEVCOREDUMP_LEGACY_MAX_SIZE	((uint64_t)INT_MAX)
> +
> +/*
> + * The test payloads contain no zero dwords, so their ASCII85 size is ex=
actly
> + * 5/4 of their binary size. The decoder still supports zero dwords.
> + */
> +#define ASCII85_ENCODED_SIZE(bytes)	((bytes) / 4 * 5)
> +
> +/* Small, but already far past any line-oriented parser */
> +#define DECODE_PAYLOAD_SIZE		SZ_2M
> +#define DECODE_PAYLOAD_COUNT		2
> +
> +#define LARGE_PAYLOAD_SIZE		SZ_64M
> +/* One extra buffer makes the encoded payload exceed the legacy cap */
> +#define LARGE_PAYLOAD_COUNT		\
> +	((int)(DEVCOREDUMP_LEGACY_MAX_SIZE / \
> +	       ASCII85_ENCODED_SIZE(LARGE_PAYLOAD_SIZE)) + 1)
> +
>  static u64
>  xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance =
*eci)
>  {
> @@ -224,6 +267,440 @@ static bool rm_devcoredump(char *path)
>  	return false;
>  }
> =20
> +static bool devcoredump_exists(char *path)
> +{
> +	return access_devcoredump(path, NULL, NULL) !=3D 0;
> +}
> +
> +/**
> + * struct payload_bo - A buffer object the test fills with known dword v=
alues
> + * @handle: GEM handle
> + * @addr: GPU virtual address the buffer is bound at, which is also the =
name the
> + *	  dump gives it, i.e. "[<addr>].data:"
> + * @size: buffer size in bytes
> + * @payload_index: zero-based payload index, used to generate this buffe=
r's
> + *		   dword values
> + * @seen: set once the dump has been found to carry this buffer intact
> + */
> +struct payload_bo {
> +	uint32_t handle;
> +	uint64_t addr;
> +	uint64_t size;
> +	uint32_t payload_index;
> +	bool seen;
> +};
> +
> +/* Keep each payload's dword values distinct and non-zero. */
> +#define PAYLOAD_INDEX_STRIDE		0x04000000u
> +
> +/**
> + * payload_dword - Return the expected dword at a payload offset
> + * @payload_index: zero-based payload index
> + * @dword_index: dword offset in the payload
> + *
> + * Returns: expected dword value
> + */
> +static uint32_t payload_dword(uint32_t payload_index, uint64_t dword_ind=
ex)
> +{
> +	return (payload_index + 1) * PAYLOAD_INDEX_STRIDE + (uint32_t)dword_ind=
ex;
> +}
> +
> +/**
> + * struct ascii85_decoder - Position within one encoded blob
> + * @pos: next character to consume
> + * @bad: set once a group is found that no encoder could have produced
> + * @truncated: set when the blob ends part way through a group
> + */
> +struct ascii85_decoder {
> +	const char *pos;
> +	bool bad;
> +	bool truncated;
> +};
> +
> +/**
> + * ascii85_next_dword - Decode the next dword of a blob
> + * @dec: decoder positioned at the start of a group
> + * @out: filled with the decoded value
> + *
> + * Returns: false at the end of the blob, on the first malformed group o=
r on a
> + * group cut short, the last two reported through @dec->bad and @dec->tr=
uncated.
> + */
> +static bool ascii85_next_dword(struct ascii85_decoder *dec, uint32_t *ou=
t)
> +{
> +	uint64_t acc =3D 0;
> +	int i;
> +
> +	if (!*dec->pos || *dec->pos =3D=3D '\n')
> +		return false;
> +
> +	/* A zero dword is abbreviated to one character */
> +	if (*dec->pos =3D=3D ASCII85_ZERO) {
> +		dec->pos++;
> +		*out =3D 0;
> +		return true;
> +	}
> +
> +	/* Otherwise five base-85 digits, most significant first */
> +	for (i =3D 0; i < ASCII85_GROUP_LEN; i++) {
> +		if (!dec->pos[i] || dec->pos[i] =3D=3D '\n') {
> +			dec->truncated =3D true;
> +			return false;
> +		}
> +		if (dec->pos[i] < ASCII85_MIN || dec->pos[i] > ASCII85_MAX) {
> +			dec->bad =3D true;
> +			return false;
> +		}
> +		acc =3D acc * 85 + (dec->pos[i] - ASCII85_MIN);
> +	}
> +
> +	/* 85^5 exceeds 2^32, so not every group is encodable */
> +	if (acc > UINT32_MAX) {
> +		dec->bad =3D true;
> +		return false;
> +	}
> +
> +	dec->pos +=3D ASCII85_GROUP_LEN;
> +	*out =3D acc;
> +
> +	return true;
> +}
> +
> +/**
> + * parse_blob_field - Split a "[<name>]<suffix> <value>" devcoredump lin=
e
> + * @line: line to match, e.g. "[4e4800000].length: 0x4000000"
> + * @suffix: field suffix, matched literally so that
> + *	    "].replay_length:" does not look like "].length:"
> + * @name: filled with the bracketed name on success
> + * @name_size: size of @name
> + * @value: set to the first character of the value on success
> + *
> + * Returns: true when @line carries @suffix, false otherwise.
> + */
> +static bool
> +parse_blob_field(const char *line, const char *suffix, char *name, size_=
t name_size,
> +		 const char **value)
> +{
> +	const char *open =3D strchr(line, '[');
> +	const char *close;
> +	size_t len;
> +
> +	if (!open)
> +		return false;
> +
> +	open++;
> +	close =3D strchr(open, ']');
> +	if (!close || strncmp(close, suffix, strlen(suffix)))
> +		return false;
> +
> +	len =3D close - open;
> +	if (len >=3D name_size)
> +		return false;
> +
> +	memcpy(name, open, len);
> +	name[len] =3D '\0';
> +
> +	*value =3D close + strlen(suffix);
> +	while (**value =3D=3D ' ' || **value =3D=3D '\t')
> +		(*value)++;
> +
> +	return true;
> +}
> +
> +/**
> + * payload_by_name - Find the payload a blob name refers to
> + * @name: bracketed blob name, e.g. "4e4800000" or "HWSP"
> + * @payloads: buffers the test bound before hanging, or NULL
> + * @n_payloads: number of entries in @payloads
> + *
> + * Returns: the matching payload, or NULL when @name is not one of them.=
 The
> + * dump also uses labels such as "HWSP" and "CTB" for driver-owned secti=
ons;
> + * names that are not entirely hexadecimal never match, which keeps "CTB=
" from
> + * resolving as the address 0xc.
> + */
> +static struct payload_bo *
> +payload_by_name(const char *name, struct payload_bo *payloads, int n_pay=
loads)
> +{
> +	uint64_t addr;
> +	char *end;
> +	int i;
> +
> +	if (!payloads)
> +		return NULL;
> +
> +	addr =3D strtoull(name, &end, 16);
> +	if (end =3D=3D name || *end)
> +		return NULL;
> +
> +	for (i =3D 0; i < n_payloads; i++)
> +		if (payloads[i].addr =3D=3D addr)
> +			return &payloads[i];
> +
> +	return NULL;
> +}
> +
> +struct blob_length {
> +	uint64_t size;
> +	uint64_t compressed_size;
> +};
> +
> +static uint64_t parse_blob_size(const char *name, const char **value)
> +{
> +	uint64_t size;
> +	char *end;
> +
> +	*value +=3D strspn(*value, " \t");
> +	igt_assert_f(isdigit((unsigned char)**value),
> +		     "[%s]: invalid blob size: %s\n", name, *value);
> +
> +	errno =3D 0;
> +	size =3D strtoull(*value, &end, 0);
> +	igt_assert_f(!errno && end !=3D *value,
> +		     "[%s]: invalid blob size: %s\n", name, *value);
> +	*value =3D end;
> +
> +	return size;
> +}
> +
> +static struct blob_length parse_blob_length(const char *name, const char=
 *value)
> +{
> +	struct blob_length length =3D {0};
> +
> +	length.size =3D parse_blob_size(name, &value);
> +	value +=3D strspn(value, " \t\r\n");
> +	if (!*value)
> +		return length;
> +
> +	if (!strncmp(value, "->", 2)) {
> +		value +=3D 2;
> +		length.compressed_size =3D parse_blob_size(name, &value);
> +		igt_assert_f(length.compressed_size,
> +			     "[%s]: compressed blob has zero size\n", name);
> +		value +=3D strspn(value, " \t");
> +		igt_assert_f(!strncmp(value, "Algo: ZSTD", strlen("Algo: ZSTD")),
> +			     "[%s]: unsupported compression metadata: %s\n", name, value);
> +		value +=3D strlen("Algo: ZSTD");
> +	} else {
> +		igt_assert_f(!strncmp(value, "Algo: RAW", strlen("Algo: RAW")),
> +			     "[%s]: unsupported compression metadata: %s\n", name, value);
> +		value +=3D strlen("Algo: RAW");
> +	}
> +
> +	value +=3D strspn(value, " \t\r\n");
> +	igt_assert_f(!*value, "[%s]: unexpected blob length metadata: %s\n", na=
me, value);
> +
> +	return length;
> +}
> +
> +/**
> + * check_blob - Validate one ".length"/".data" pair of a devcoredump
> + * @name: bracketed blob name, a hex VMA address for VM state sections
> + * @length: original and compressed byte counts from the ".length" line
> + * @data: encoded payload of the ".data" line
> + * @payloads: buffers the test bound before hanging, or NULL
> + * @n_payloads: number of entries in @payloads
> + *
> + * Checks ASCII85 decoding, optional Zstd decompression, and advertised =
sizes.
> + * Test-created payloads are also checked against their expected content=
s.
> + */
> +static void
> +check_blob(const char *name, const struct blob_length *length, const cha=
r *data,
> +	   struct payload_bo *payloads, int n_payloads)
> +{
> +	struct ascii85_decoder dec =3D { .pos =3D data };
> +	struct payload_bo *expected_payload;
> +	uint32_t *compressed =3D NULL;
> +	uint64_t encoded_length =3D length->size;
> +	uint64_t expected_dwords =3D 0;
> +	uint64_t dwords =3D 0;
> +	uint32_t val;
> +
> +	expected_payload =3D payload_by_name(name, payloads, n_payloads);
> +	if (expected_payload) {
> +		igt_assert_f(length->size =3D=3D expected_payload->size,
> +			     "[%s]: .length reports 0x%" PRIx64
> +			     " bytes, bound VMA is 0x%" PRIx64 " bytes\n",
> +			     name, length->size, expected_payload->size);
> +		expected_dwords =3D expected_payload->size / sizeof(uint32_t);
> +	}
> +
> +	if (length->compressed_size) {
> +		igt_assert_f(length->compressed_size <=3D SIZE_MAX - (sizeof(uint32_t)=
 - 1),
> +			     "[%s]: compressed size is too large\n", name);
> +		encoded_length =3D ALIGN(length->compressed_size, sizeof(uint32_t));
> +		compressed =3D malloc(encoded_length);
> +		igt_assert_f(compressed, "[%s]: failed to allocate compressed buffer\n=
", name);
> +	}
> +
> +	/*
> +	 * Decode every blob for structural validation. Only test-created paylo=
ads
> +	 * need the additional content comparison.
> +	 */
> +	while (ascii85_next_dword(&dec, &val)) {
> +		if (compressed) {
> +			igt_assert_f(dwords < encoded_length / sizeof(uint32_t),
> +				     "[%s]: .data exceeds the compressed size\n", name);
> +			compressed[dwords] =3D val;
> +		} else if (expected_payload) {
> +			igt_assert_f(dwords < expected_dwords,
> +				     "[%s]: .data contains more dwords than the bound payload\n",
> +				     name);
> +			igt_assert_f(val =3D=3D payload_dword(expected_payload->payload_index=
,
> +							  dwords),
> +				     "[%s]: decoded dword %" PRIu64
> +				     " differs from the content written to the buffer\n",
> +				     name, dwords);
> +		}
> +		dwords++;
> +	}
> +
> +	igt_assert_f(!dec.truncated,
> +		     "[%s]: .data ends mid-ASCII85 group after %" PRIu64 " of %" PRIu6=
4
> +		     " dwords, the dump was cut short\n",
> +		     name, dwords, encoded_length / sizeof(uint32_t));
> +
> +	igt_assert_f(!dec.bad,
> +		     "[%s]: .data is not valid ASCII85 at dword %" PRIu64
> +		     " of %" PRIu64 " announced by .length\n",
> +		     name, dwords, encoded_length / sizeof(uint32_t));
> +
> +	igt_assert_f(dwords * sizeof(uint32_t) =3D=3D encoded_length,
> +		     "[%s]: expected 0x%" PRIx64 " ASCII85-decoded bytes but got"
> +		     " 0x%" PRIx64 " bytes\n",
> +		     name, encoded_length, dwords * sizeof(uint32_t));
> +
> +	if (compressed) {
> +		uint32_t *decoded;
> +		size_t decoded_size;
> +		uint64_t i;
> +
> +		igt_assert_f(length->size <=3D SIZE_MAX,
> +			     "[%s]: uncompressed size is too large\n", name);
> +		decoded =3D malloc(length->size ? length->size : 1);
> +		igt_assert_f(decoded, "[%s]: failed to allocate decompression buffer\n=
", name);
> +
> +		/* Exclude the dword padding added for ASCII85 encoding. */
> +		decoded_size =3D ZSTD_decompress(decoded, length->size,
> +					      compressed, length->compressed_size);
> +		igt_assert_f(!ZSTD_isError(decoded_size),
> +			     "[%s]: Zstd decompression failed: %s\n",
> +			     name, ZSTD_getErrorName(decoded_size));
> +		igt_assert_f(decoded_size =3D=3D length->size,
> +			     "[%s]: .length reports 0x%" PRIx64
> +			     " bytes but Zstd decompresses to 0x%zx bytes\n",
> +			     name, length->size, decoded_size);
> +
> +		if (expected_payload)
> +			for (i =3D 0; i < expected_dwords; i++)
> +				igt_assert_f(decoded[i] =3D=3D
> +					     payload_dword(expected_payload->payload_index, i),
> +					     "[%s]: decoded dword %" PRIu64
> +					     " differs from the content written to the buffer\n",
> +					     name, i);
> +
> +		free(decoded);
> +		free(compressed);
> +	}
> +
> +	if (!expected_payload)
> +		return;
> +
> +	expected_payload->seen =3D true;
> +	igt_debug("Cross-validated 0x%" PRIx64 " bytes of VMA [%s]\n", length->=
size, name);
> +}
> +
> +/**
> + * validate_devcoredump - Check every ASCII85 blob of a devcoredump
> + * @path: path of the devcoredump data file
> + * @payloads: buffers the test bound before hanging, or NULL
> + * @n_payloads: number of entries in @payloads
> + *
> + * Walks the whole dump, checks each blob's decoded size, and verifies t=
hat all
> + * test-created payloads are present with the expected contents.
> + */
> +static void
> +validate_devcoredump(const char *path, struct payload_bo *payloads, int =
n_payloads)
> +{
> +	char pending_name[MAX_BLOB_NAME_LEN] =3D {0};
> +	char name[MAX_BLOB_NAME_LEN];
> +	struct blob_length pending_length =3D {0};
> +	bool have_pending =3D false;
> +	bool read_error;
> +	size_t line_size =3D 0;
> +	char *line =3D NULL;
> +	const char *value;
> +	int n_blobs =3D 0, read_errno, i;
> +	FILE *f;
> +
> +	f =3D fopen(path, "r");
> +	igt_assert_f(f, "Failed to open %s, errno=3D%d\n", path, errno);
> +
> +	/* .data lines can be megabytes long, so let getline() grow the buffer.=
 */
> +	while (getline(&line, &line_size, f) > 0) {
> +		if (parse_blob_field(line, LENGTH_SUFFIX, name, sizeof(name), &value))=
 {
> +			igt_assert_f(!have_pending,
> +				     "[%s].length has no matching .data, .error"
> +				     " or null_sparse .properties line\n",
> +				     pending_name);
> +			pending_length =3D parse_blob_length(name, value);
> +			memcpy(pending_name, name, strlen(name) + 1);
> +			have_pending =3D true;
> +			continue;
> +		}
> +
> +		if (parse_blob_field(line, PROPERTIES_SUFFIX, name, sizeof(name), &val=
ue)) {
> +			/* NULL bindings have metadata but no captured data. */
> +			if (have_pending && !strcmp(name, pending_name) &&
> +			    strstr(value, "|null_sparse|")) {
> +				igt_assert_f(!payload_by_name(name, payloads, n_payloads),
> +					     "[%s]: expected payload is a NULL/sparse binding\n",
> +					     name);
> +				have_pending =3D false;
> +			}
> +			continue;
> +		}
> +
> +		if (parse_blob_field(line, ERROR_SUFFIX, name, sizeof(name), &value)) =
{
> +			if (have_pending && !strcmp(name, pending_name))
> +				have_pending =3D false;
> +
> +			igt_assert_f(!payload_by_name(name, payloads, n_payloads),
> +				     "[%s]: kernel could not snapshot the buffer: %s",
> +				     name, value);
> +			continue;
> +		}
> +
> +		if (!parse_blob_field(line, DATA_SUFFIX, name, sizeof(name), &value))
> +			continue;
> +
> +		igt_assert_f(have_pending && !strcmp(name, pending_name),
> +			     "[%s].data is not preceded by a matching .length line\n",
> +			     name);
> +
> +		have_pending =3D false;
> +		n_blobs++;
> +		check_blob(name, &pending_length, value, payloads, n_payloads);
> +	}
> +
> +	read_error =3D ferror(f);
> +	read_errno =3D read_error ? errno : 0;
> +	free(line);
> +	fclose(f);
> +
> +	igt_assert_f(!read_error, "Failed to read %s, errno=3D%d\n", path, read=
_errno);
> +	igt_assert_f(!have_pending,
> +		     "[%s].length has no matching .data, .error"
> +		     " or null_sparse .properties line\n",
> +		     pending_name);
> +
> +	igt_assert_f(n_blobs, "No ASCII85 blob found in %s\n", path);
> +	igt_debug("Validated %d ASCII85 blobs\n", n_blobs);
> +
> +	for (i =3D 0; i < n_payloads; i++)
> +		igt_assert_f(payloads[i].seen,
> +			     "VMA 0x%" PRIx64 " missing from the devcoredump VM state\n",
> +			     payloads[i].addr);
> +}
> +
>  static char
>  *get_coredump_item(regex_t *regex, char **lines, const char *tag, int ta=
g_index, int target_index)
>  {
> @@ -392,6 +869,8 @@ static void test_card(int fd)
>  		check_item_u64(&regex, lines, "length:", addr,
>  			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
> =20
> +		validate_devcoredump(path, NULL, 0);
> +
>  		/* clear devcoredump */
>  		rm_devcoredump(path);
>  		sleep(1);
> @@ -404,10 +883,183 @@ static void test_card(int fd)
>  	regfree(&regex);
>  }
> =20
> +/**
> + * hang_with_payloads - Hang @eci with dumpable buffers of known content
> + * @fd: xe device file descriptor
> + * @eci: engine to hang
> + * @payloads: buffers to create, fill and bind; handles are returned to =
the
> + *	      caller, which owns them
> + * @n_payloads: number of entries in @payloads
> + *
> + * Submits a batch that spins forever, so the job timeout fires and the =
driver
> + * writes a devcoredump. The payloads share the address space of that ba=
tch and
> + * are bound DUMPABLE, which is what tells the driver to copy their cont=
ents
> + * into the dump, giving us blobs whose expected bytes are known exactly=
.
> + */
> +static void
> +hang_with_payloads(int fd, struct drm_xe_engine_class_instance *eci,
> +		   struct payload_bo *payloads, int n_payloads)
> +{
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	struct xe_spin_opts spin_opts =3D { .addr =3D CAPTURE_SPIN_ADDRESS };
> +	uint64_t spin_size =3D xe_bb_size(fd, sizeof(struct xe_spin));
> +	uint32_t vm =3D xe_vm_create(fd, 0, 0);
> +	uint32_t spin_bo, exec_queue, bind_syncobj, exec_syncobj;
> +	struct xe_spin *spin;
> +	int i;
> +
> +	spin_bo =3D xe_bo_create(fd, vm, spin_size, vram_if_possible(fd, eci->g=
t_id),
> +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	spin =3D xe_bo_map(fd, spin_bo, spin_size);
> +
> +	bind_syncobj =3D syncobj_create(fd, 0);
> +	sync.handle =3D bind_syncobj;
> +
> +	__xe_vm_bind_assert(fd, vm, 0, spin_bo, 0, CAPTURE_SPIN_ADDRESS, spin_s=
ize,
> +			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_DUMPABLE,
> +			    &sync, 1, 0, 0);
> +	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	for (i =3D 0; i < n_payloads; i++) {
> +		uint32_t *map;
> +		uint64_t j;
> +
> +		/* Use system memory so the large capture does not require large VRAM.=
 */
> +		payloads[i].handle =3D xe_bo_create(fd, vm, payloads[i].size,
> +						  system_memory(fd), 0);
> +		map =3D xe_bo_map(fd, payloads[i].handle, payloads[i].size);
> +		for (j =3D 0; j < payloads[i].size / sizeof(*map); j++)
> +			map[j] =3D payload_dword(payloads[i].payload_index, j);
> +		munmap(map, payloads[i].size);
> +
> +		syncobj_reset(fd, &bind_syncobj, 1);
> +		__xe_vm_bind_assert(fd, vm, 0, payloads[i].handle, 0, payloads[i].addr=
,
> +				    payloads[i].size, DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_DUMPABLE, &sync, 1, 0, 0);
> +		igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
> +	}
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	exec_syncobj =3D syncobj_create(fd, 0);
> +
> +	xe_spin_init(spin, &spin_opts);
> +
> +	sync.handle =3D exec_syncobj;
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D CAPTURE_SPIN_ADDRESS;
> +	xe_exec(fd, &exec);
> +
> +	xe_spin_wait_started(spin);
> +
> +	/* The job timeout resets the queue, which is what creates the dump */
> +	igt_assert(syncobj_wait(fd, &exec_syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, exec_syncobj);
> +	syncobj_destroy(fd, bind_syncobj);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(spin, spin_size);
> +	gem_close(fd, spin_bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: decode-data
> + * Description: Create payloads with known contents, hang an engine, and
> + * 		verify the resulting coredump's blob lengths and payload
> + * 		contents before removing it
> + *
> + * SUBTEST: decode-data-large
> + * Description: Same as decode-data, but with enough data to exercise ke=
rnel's
> + * 		coredump chunking and the legacy size limit
> + */
> +static void
> +test_capture_payload(int fd, struct drm_xe_engine_class_instance *eci,
> +		     int n_payloads, uint64_t payload_size)
> +{
> +	char path[MAX_SYSFS_PATH_LEN];
> +	struct payload_bo *payloads;
> +	int i;
> +
> +	/* Every buffer needs its own slice of the 32-bit value space */
> +	igt_assert(payload_size / sizeof(uint32_t) <=3D PAYLOAD_INDEX_STRIDE &&
> +		   n_payloads <=3D UINT32_MAX / PAYLOAD_INDEX_STRIDE);
> +
> +	payloads =3D calloc(n_payloads, sizeof(*payloads));
> +	igt_assert(payloads);
> +
> +	for (i =3D 0; i < n_payloads; i++) {
> +		payloads[i].addr =3D CAPTURE_PAYLOAD_ADDRESS + i * payload_size;
> +		payloads[i].size =3D payload_size;
> +		payloads[i].payload_index =3D i;
> +	}
> +
> +	get_devcoredump_path(igt_device_get_card_index(fd), path);
> +	rm_devcoredump(path);
> +
> +	/* Wait for the previous coredump to disappear before creating another.=
 */
> +	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
> +		     "Devcoredump not removed, errno=3D%d.\n", errno);
> +
> +	hang_with_payloads(fd, eci, payloads, n_payloads);
> +
> +	/*
> +	 * Close our BO handles; the snapshot holds BO references until it copi=
es
> +	 * their contents into kernel-owned buffers for the coredump.
> +	 */
> +	for (i =3D 0; i < n_payloads; i++)
> +		gem_close(fd, payloads[i].handle);
> +
> +	igt_assert_f(igt_wait(devcoredump_exists(path), 5000, 100),
> +		     "Devcoredump not created, a previous dump may still be held\n");
> +
> +	validate_devcoredump(path, payloads, n_payloads);
> +
> +	free(payloads);
> +
> +	rm_devcoredump(path);
> +
> +	/* Wait for the dump to disappear so its large buffers can be released.=
 */
> +	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
> +		     "Devcoredump not removed, errno=3D%d.\n", errno);
> +}
> +
> +/**
> + * require_capture_memory - Skip unless the machine can hold the whole c=
apture
> + * @n_payloads: number of buffers the subtest binds
> + * @payload_size: size of each buffer
> + *
> + * Upper bound on the footprint: the payloads, the snapshot copy the ker=
nel
> + * takes of them, the chunk the kernel renders and the longest line getl=
ine()
> + * has to buffer. Not all of them peak at the same instant. The renderin=
g buffer
> + * is sized for the unfixed kernel, which is the one this has to survive=
.
> + */
> +static void require_capture_memory(int n_payloads, uint64_t payload_size=
)
> +{
> +	uint64_t payload =3D (uint64_t)n_payloads * payload_size;
> +	uint64_t encoded =3D ASCII85_ENCODED_SIZE(payload);
> +	uint64_t rendered =3D encoded < DEVCOREDUMP_LEGACY_MAX_SIZE ?
> +			    encoded : DEVCOREDUMP_LEGACY_MAX_SIZE;
> +
> +	igt_require_memory(1, 2 * payload + rendered +
> +			   ASCII85_ENCODED_SIZE(payload_size), CHECK_RAM);
> +}
> +
>  int igt_main()
>  {
>  	int xe;
> -	struct drm_xe_engine_class_instance *hwe;
> +	/*
> +	 * The payload tests exercise VM capture and need one engine to trigger=
 it.
> +	 * The reset subtest separately iterates over every available engine.
> +	 */
> +	struct drm_xe_engine_class_instance *hwe, *hang_hwe =3D NULL;
>  	u64 timeouts[DRM_XE_ENGINE_CLASS_VM_BIND] =3D {0};
> =20
>  	igt_fixture() {
> @@ -416,6 +1068,8 @@ int igt_main()
>  			/* Skip kernel only classes */
>  			if (hwe->engine_class >=3D DRM_XE_ENGINE_CLASS_VM_BIND)
>  				continue;
> +			if (!hang_hwe)
> +				hang_hwe =3D hwe;
>  			/* Skip classes already set */
>  			if (timeouts[hwe->engine_class])
>  				continue;
> @@ -433,6 +1087,19 @@ int igt_main()
>  	igt_subtest("reset")
>  		test_card(xe);
> =20
> +	igt_subtest("decode-data") {
> +		igt_require(hang_hwe);
> +		test_capture_payload(xe, hang_hwe, DECODE_PAYLOAD_COUNT,
> +				     DECODE_PAYLOAD_SIZE);
> +	}
> +
> +	igt_subtest("decode-data-large") {
> +		igt_require(hang_hwe);
> +		require_capture_memory(LARGE_PAYLOAD_COUNT, LARGE_PAYLOAD_SIZE);
> +		test_capture_payload(xe, hang_hwe, LARGE_PAYLOAD_COUNT,
> +				     LARGE_PAYLOAD_SIZE);
> +	}
> +
>  	igt_fixture() {
>  		xe_for_each_engine(xe, hwe) {
>  			u64 store, timeout;
> diff --git a/tests/meson.build b/tests/meson.build
> index 519a9e727d..61fd34316e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -463,6 +463,9 @@ intel_progs =3D intel_i915_xe_progs
>  intel_progs +=3D intel_i915_progs + intel_kms_progs
>  if build_xe
>  	intel_progs +=3D intel_xe_progs
> +	extra_dependencies +=3D {
> +		'xe_exec_capture': [ dependency('libzstd') ],
> +	}
>  endif
> =20
>  foreach prog : intel_progs
> --=20
> 2.43.0
>=20
>=20
