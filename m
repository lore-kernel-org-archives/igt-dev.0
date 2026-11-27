Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3D4606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afbuDC5J;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JatAmgJS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C53F112A57;
	Fri, 27 Nov 2026 11:31:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689CE10E045
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795778999; x=1827314999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x2KELGRdlkAKt7pRzPMpJdTC+lEfHALzpmTRwSDGbLA=;
 b=afbuDC5J/4uDBmDFyHDwbyP44VQynOBinNtKFLVr5Hsn5+KHNGD24Fc7
 +FyDN4KuUukb+uu4RQs3CDC2qVIQZCthHEo+whpNY7lv1NsUmwcGtm1ok
 eSyaaXE7bJgxD5fUn7CVJD95e+6Mo2vqq31U1RKx6yJ45b3jAFS7iTjoz
 C/8atUw0MHlHBdXsrGDdi10zKz8GROIpMPNDR5qEqxqmAapfJoQzyMRg9
 f12PiIBbVgBKPrjnieJB9k916Y2HtOCfAERauecr0Uxar1o1Gc20LoWX7
 NTkYYcJC9H9JZ6A6MnQI6gQEZombs4NOqn4dh/adv5r0tCjW3CI3EJoPK g==;
X-CSE-ConnectionGUID: 4jMujTYMQb+21Js9EKvMWg==
X-CSE-MsgGUID: ZO/kwRlOQV6fMY64DdTb9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4701390"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4701390"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 03:29:58 -0800
X-CSE-ConnectionGUID: O6cwZXVcRc2IC3xdFVGMPQ==
X-CSE-MsgGUID: dfvH1yZuReiwqJe4rkIrqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12713750"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 03:29:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 03:29:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 03:29:57 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 03:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8QBr4sRGFix6WK1/SRQIQfPvGmj6/q26P1xsTTgbV1EWu8s5HoRcm1qhX7olYsVIDIIJ2VOsQyAUzOZZgS1PoJsEIqojjX7kgC3FoXciqaYbibeuoWTk0ELln3rxEJeMekiu7BVJz0sr6l4UweNFeBTFC35Z/a09VSZlh7DBOVPGnPuW5RKidAVznsqcAlzaFO/FupJ44oy6nJdbdpWJvXI9klYVa1rVFYej8unIfn372pS63vldH8PavDebiN3188CRjYQ/edAr2RTfE2uEYNFWUjok1uxpNY/X9oJWly3hsq5TGW9ZS1gp9ZkFi6tzKj77X7lDZDHJUkwwsZZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKYp3XspImwmakxdh0FOa3ldCFoTO+prjSWGd/zX/Aw=;
 b=sFs7/HF6KGT0pE735RNByGrAayt9CxBVP1+7K9wtTuREPNZKyZb/b2VMNWKkMRMS3nd/wNuMGUTNvQdAaEHdJeU8can/aD+KLX8nBFeHKm09XK2i6JPaE5dwM+S1YlKLCbXfajQQvt45CY5fTbougHletBKh9poZidAqmwveSXxyWnWKXaNgcFvOvXCXPO+ZzF20E2HTZq+WrLxRvSG97YGXTKRsle1mNkrh6CY3z4wqkN7UrKWKOy62jq9qDZzC7A6ivd99AloHVAFYmOzBdR72Ef3tbMq5lMWEfcjdfmhk/QlbDrM1cuo9sYly/KAs9fiRhQ5ThWq998muqlJQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKYp3XspImwmakxdh0FOa3ldCFoTO+prjSWGd/zX/Aw=;
 b=JatAmgJS2W2E7bY5Ur1br9MGbMJibp0LfCgdNX5eztMghEB3kodbydDUWabxGqEKvlCXfU54BOqZ7ysm0SxD72WIfec6jcwimV6lFItSmCuQSMKnSDLpD82cRB6qEbf8Z1biaveh3EACYZbAsdLu/kcZlGD46Pg+SKu6cCAxfvY=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by MN0PR11MB6009.namprd11.prod.outlook.com
 (2603:10b6:208:370::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 11:29:54 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 11:29:54 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: RE: [PATCH] lib/pciids: sync with kernel commit 78b2ef7a0c02
Thread-Topic: [PATCH] lib/pciids: sync with kernel commit 78b2ef7a0c02
Thread-Index: AQHdfmClprY7Nf121UyJLOfS2tsp+rdByAJA
Date: Fri, 27 Nov 2026 11:29:54 +0000
Message-ID: <AT6PR11MB0728446E0B35E5F116FF5BF66698412@AT6PR11MB072844.namprd11.prod.outlook.com>
References: <20261127112441.762644-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20261127112441.762644-2-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|MN0PR11MB6009:EE_
x-ms-office365-filtering-correlation-id: e5002475-c3c7-4d40-bdf9-08df4c79c26c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|11063799006|56012099006|10067099003|261021121427099003|261021123027099003|261102123227099003|18002099003|22082099003;
x-microsoft-antispam-message-info: dbOypotKEbVkd/q28/a90xzOgQNidLKcfnZn+SU8dgcUeBKVnnMedwbVVnLNTr2mg31St07MDhp3OpHTKStKWaUXUXvLng2yzdUBjxPfgnLNGwV/Fd/XJpa1Aim58qiudu9f5iTAWFgtJTF5bDs7jRnQOYNEma8zdN0k7cxRXP7Uceb6viyE4Z8E63odU/ndXraztWAnXoWQc/tWdOW+OxMNrb+XP3aXtsdKGO9c4TvFY5SncNonBVTDw0E3nDSaPdjQIx8pE3Sex0jtZDgpx3A9OgZiXtf72+53z7+OsyRuaFHlrSMNV0OkzwPXlunVBo0Bde5KPFr52hrgGNduAlS7Dyx9x44Z1msBJTgWnVVgJHXj3SGO9R8UuHDpgGliKpEzBvph9uGd2iG6UmQMiY8kiNI1UuY05ri8azYGLhad9PtBevVG6J2IUBQXcPgk2aSRtK1JBnxAXbUG4o79LWaKTltzCBAWF5MJ2ucf/G6yrv2dw8CgUUj1+FfR9+Kg3gxsdmjE43DzTeAf+L7+86Pp3Y3jAgy5KvLXIrP9vrQ/w3YzO0xaTQfvSRObss8acDjcJlv1YZiC7BfMDUoAnD2OAD8Fy62GgO4aiEyG1UMJ0+ykzX0nfy2U3zTJd5DTzJJfwqIOIN9PtEk0uF9PGzHfrgpvSk3cGPwyDoHV/sB8SxXvU4MKLURicBxJHzxqRxiiBWDiN52okuRBca+rs9mma07DIbDhbM24fkUP9w0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(261021121427099003)(261021123027099003)(261102123227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dJf7PhGoh3w0fh5wAvuwUoVFgRfKo+wBfVCi+VUCgrNmjPo/zFAAdgbMlEhx?=
 =?us-ascii?Q?xcWDTY9SUoOfTmE54459STleCZisBk9zDuud1YgayM0U0vDUJY/Fu8tJelD5?=
 =?us-ascii?Q?tyUoHjsx3kti73Ja7HJ1ubSWrnb27V8JCpQRJ/iP8lZNeKsibu8g0h4UVLRQ?=
 =?us-ascii?Q?7SIx/klZswiFx6ea1NT+0750OVznvbYtsD0G6AY9vxaTSZ6P3vWTq6uv418Y?=
 =?us-ascii?Q?B0NWRmPXP7T7L7k1ic/pSQOg5ay4tgdOeNBZEFbd2XdPMK0crLXedjGOy8dd?=
 =?us-ascii?Q?PZorGwTcstWzY81rK86kAoGflFYs2YpMJYfi5C3hZeJTGiTwVaLg4DbxEtGM?=
 =?us-ascii?Q?U/BiWm7rfOHr2S3183l4g7yJ8XOS5JVVQUsk0p7uke1oFDIVuixp1oUouH8D?=
 =?us-ascii?Q?XYCj5fwQ143Ck0UocTf9s+tUjFdIIWE47DQbDOTKREuu5VpH9u/3YbKXjHFb?=
 =?us-ascii?Q?whxom2qHs3rVfScnmnWuzJXBoYR4XDMbVU4gosh3Zskd6jy8+M3bPBoVUQc4?=
 =?us-ascii?Q?0yJmlxpR7ti8PJg/iFwSddpBwbq6lEgm3YW8yrHVOd7GTbb0XP1WZzQor97/?=
 =?us-ascii?Q?5QmkAuEUTpxX1u2x4Y/1xVedAf9kQAwphWIs3XlsGICAqNUZbLye/fMwLAM4?=
 =?us-ascii?Q?n+vxSm7AhtscmVy4GFtEFfVHD5KYWZGTgwRMsb1QGFdSE3W4BYhQvnvWv48e?=
 =?us-ascii?Q?0fu78P7qIfpMyS1bDKrBUBsPHuYw3h/N5jqE21n86PwjCnJttW0g0Lu7baoe?=
 =?us-ascii?Q?xqe1k96/vLt7jSjJU7dThv4C8lKBUqRJjTULICRIXgoBZBulmclGPYgBCQGx?=
 =?us-ascii?Q?96OneLLLJp0Tbj9XZw5F0TTosZ6PIHQkwPAHKFyQLnD1quLv4hl05EsMBvEf?=
 =?us-ascii?Q?DfiWka9aWyRaQ5tEEOroBwQDP/V8CNRO5LvrY7drZmAMmcTwIljnti4RJ+k8?=
 =?us-ascii?Q?m2vyghKQfsR5N+Bn9k/XWFmXGIxvZaHBdpkYHNxEpe4ZQdeQ07QFuQo6d8Qc?=
 =?us-ascii?Q?CAJBCL2k30E5Ir1TYFtf/qj/rci2zG+SMY4kD9KE6EZxm0dynR0/wkC4lpP2?=
 =?us-ascii?Q?/0HNGxTpCJmnAYPdBUYjdwd6upwLrfR6WY8MDL8+9HJl+opBCD9Mp9ipwWhR?=
 =?us-ascii?Q?BrMf8l85f6BuH6CDJP3gcolNjC6QAonctbV+kdef1PqVxS5wgHSDL2a5z9Sw?=
 =?us-ascii?Q?95X6WWHdDzmU675Wk2CKRAqxAri8XPHCiEz0IVeOaFxcXZh9PQsQKtMifXLs?=
 =?us-ascii?Q?NfqERpYfUKSoYg8KYKqE9EdtXj6WT0HZNToWIpkfU5YYExkczdEs6khzx1il?=
 =?us-ascii?Q?qrX6HPF3QL8pvJwq6+e0JUyzTrB0WALiMhUYUk47OJokvk0tCCkSAY7H+ofI?=
 =?us-ascii?Q?9pPQnwm4OOWf0RhMRFrkjfc/DEySuHQYNsG7Hggcqdz6WrI6HFcNpYVcNW/c?=
 =?us-ascii?Q?uO1L9ThMznYsPnevOpAz22jDQxrRwHM/JlDDLSkNjKBQrT0kSxP35pzE2A3B?=
 =?us-ascii?Q?fMzlINoQr/VPuF91KpZ4OaayXaK51vOnaN91WB/IcFh3ffc8FECctYGezF1N?=
 =?us-ascii?Q?Zb5HL+Qi+rjVY6lX4i9THd109Sd5iIPH+YvyHvHeyfKimJjx4koY2t32drBQ?=
 =?us-ascii?Q?6Y6sykQSMWFhF6gj5JYO9MvAThCv6ZgVMOQ551n/UC/funnDsZqnZD2tWcD/?=
 =?us-ascii?Q?NOeyUHlWUY3c9htBZe8Q81FbbIQOqLpo+eVuI+fifH0iJ3vx9rMYL/hKvyP3?=
 =?us-ascii?Q?tOHf0bnB3g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RxmkEe58sIVmon4ZUJWPwCELzd78NGNMPPw5ASHRzxRmZJYyic+XdbMdlQhSCGVkvnlDzhjK+X6d1g9I/mjTbzDykW99QyOeppSnTZ7Bu5bDT0kGRFFD3dvM/heCi/ToFG0sNf2L/J8FcoILqlZjVFIMRssOxPcz4RtdX8TjuweN+wOGOLeZ89V5cnyVs0Izz7FYaOHGyFgCCpKMiDq9KbMgCgcuad1Vvj8QMKI81XAbTsv9i1nsn1LATT+ABcNRn2rpJiknxfoELfes7bPSaZx3mB+6qProyuHx1/QyqwgsgJInZEZkPBEvFNtCgzwY4v3KqsZDWdXFi29vTq44/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5002475-c3c7-4d40-bdf9-08df4c79c26c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 11:29:54.6425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YmBhh64ZLNfTMbNunvxnySOO9VEcgOR5cz7NQD83iFzz7oIib/oZWV2BgM3Erf0MBBLuRlPcWFNK9mLWrdcJYqYXussCu/MyqWF1Qu9t44I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Balasubramani Vivekanandan
> Sent: 27 November 2026 16:55
> To: igt-dev@lists.freedesktop.org
> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>
> Subject: [PATCH] lib/pciids: sync with kernel commit 78b2ef7a0c02
>=20
> Sync brings new PCI IDs for CRI.
>=20
> Signed-off-by: Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com>
> ---
>  lib/pciids.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> diff --git a/lib/pciids.h b/lib/pciids.h index a21609207..ab02bef26 10064=
4
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -905,7 +905,12 @@
>  	MACRO__(0x674E, ## __VA_ARGS__), \
>  	MACRO__(0x674F, ## __VA_ARGS__), \
>  	MACRO__(0x6750, ## __VA_ARGS__), \
> -	MACRO__(0x6751, ## __VA_ARGS__)
> +	MACRO__(0x6751, ## __VA_ARGS__), \
> +	MACRO__(0x6752, ## __VA_ARGS__), \
> +	MACRO__(0x6753, ## __VA_ARGS__), \
> +	MACRO__(0x6754, ## __VA_ARGS__), \
> +	MACRO__(0x6755, ## __VA_ARGS__), \
> +	MACRO__(0x6756, ## __VA_ARGS__)
>=20
>  /* NVL-P */
>  #define INTEL_NVLP_IDS(MACRO__, ...) \
> --
> 2.53.0

