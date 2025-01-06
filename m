Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E398EE77199
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 15:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B0910E6A1;
	Mon,  6 Jan 2025 15:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gycv6cN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6512F10E00B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736176169; x=1767712169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EiudCyNGPIIslq5usno+f3J33l1GyvZA4bMabnkM3RA=;
 b=Gycv6cN+YETqXcKd5QJ/HfiLZ7Vtw89cHVpYdymZvDUh98VWpgG/iQA5
 MvEj5PP3IliLx82V3/Tx9iNQPDThk/NmIHesxA1xEVqc6S1JT0om6J2c2
 dhPHWuwuBfdcYH2O4skN/V0ZyPBVW+M7TA9+0/2hWpADoswmTTJk47Izc
 b95cd8YMtLNcTs6Q5aVzR1Tm1ntHnsUqIen+TnqJlLU0jIpoaYPxAb0Bw
 QmBc6qIpae4BRnvLXamA3BPfnDsV5L+KvVv/SXAsFvFsNDEsx4ETaL7eB
 kTEsjLx5eeG6ikVnS0BKL3Oac7WwT+Plzv2aLJoa5MUcpwk9r+EW6AdNb g==;
X-CSE-ConnectionGUID: cZ2CPx7iRBejpQC4AZT0fw==
X-CSE-MsgGUID: 5nb3fg1OSWakjkkd7gFunA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40095907"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="40095907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 07:09:28 -0800
X-CSE-ConnectionGUID: H/GAGgtMTd+ilmQWRaX2PQ==
X-CSE-MsgGUID: 6rudWSTmTS2/viEWJ2HFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="102289807"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 07:09:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 07:09:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 07:09:26 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 07:09:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhaDED7CHDYrvXEvgtXiM2fVWM0f9xJ1W/JEAypeBgJiJFfX8c9zRqSUs54tWgzFdLyOlh6FpRiXeNQMhoOrbmXY3z2QHPiJr3v7hmX9i1OxqLwaoIU/mSagSunyuVvaHD2/BFlFR2B9Zfd3NLpDy9R1YhmIwAiKGxkBcIShLePWBYltvb/s7EimxigvVWsy55QlvA1GU3AvUwQuJBpws7WBP7SwfPVNe/m0MNB+4JWVEarM9FRjlmGTJMO8UTuB4uhcjlYkR32z2ON3O9N1dgC3RzhHzg0lPFXXcyUclqufnw8wbUE3O/eblxBHOHW5zMy6lr8LFnvDU4VNcEe9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe7j3qtrL6HMIefhMuliilGhXoTILxMcQPD90X8n2pI=;
 b=tnsSYH2EWspIsFqnUA0TJhBaAEAwANeiZB+LwhD/eQe/PZMRRcF64aRee7Ay0LWtrVRNdUNC411ky9Pi0RjfUINpQcr6zwaSG2u9xP+SocpjfdgxmYKwAzbgvD/njgvtJ18SURfSDx4sgEelYbP7NMtJsq1pUYySBrumY8p/k0MTuklTDqg8MLvo1OrO3OQEtDQiovlJ5+VPsdb8OZ9RhjM2Lx6cl+cHjMR3bve7C/YOUJ2QGax0g14lj43MvzJeLrCs+omrfWTz6hCj4oEVCdLHKq4Wy4Mqf4XuWYhstPxs6bM3rfWpd3PTf8OFwpLBjXS1CN8OIPsYFwQoYnLoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 15:08:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 15:08:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Do not end cork not
 started
Thread-Topic: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Do not end cork not
 started
Thread-Index: AQHbXniH35aRwpeNxUm6Gg71dQI507MJ28Ig
Date: Mon, 6 Jan 2025 15:08:54 +0000
Message-ID: <CH0PR11MB5444AB1337D3B6E2DCFDFBF9E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4766:EE_
x-ms-office365-filtering-correlation-id: 726d6006-4c37-41c7-dd23-08dd2e640951
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?i9lu8t96Uz6qNE8vKVEQaczyMnCttOyORVkkKF/I+wwyMPNRTmXoOgTqoTs/?=
 =?us-ascii?Q?rHqI6MRmEYMblQ0vYLcWr/A2fzXOaaxadaZG/0jhY66zOVxqksjZjqIh1Omg?=
 =?us-ascii?Q?xez3t8VHEcMMUhBJpe3oHM+gjHul5i13D4oG58N0PdNUp5kom9ElN3ebx6Kd?=
 =?us-ascii?Q?20aSMmEmk73Bapt/Is/NHJr5rsEq85cSQEysIFQ2+UX9sI8q3jzxdvr29T9Y?=
 =?us-ascii?Q?iSTdyWVDJM/FHTeIxihfPJsGjI3fY93PykNqxi4VrayOXO0jMp9Qm1/hYt8q?=
 =?us-ascii?Q?c8cHoUzCUKNEmHuYf8JuyWu5hkS2BvtlDI9vHda6F3XMTgJRXy4ka7/UycWo?=
 =?us-ascii?Q?faJ4J4X1Y8gYaoIBTNSgbzhQAYQC1qySWp4hP6Kg9+sm5HUNs7XlOW4CsbrW?=
 =?us-ascii?Q?hZ0icTVLRJk153qyBliI5NRZUiYphE6yI/6d2zjvvbDVRXY3JryjhXB/qHkU?=
 =?us-ascii?Q?0RjE/zDY3L+PIs7bBW+fbecJatx8ptZ7N8WkVooRSDYFRuigrWkcGPG6m7n1?=
 =?us-ascii?Q?yyQ3c9Jg55hWiILdLCEZrFzKwI4Zjmk//JwBGA3IG9+IAHalvldC/PJyQITX?=
 =?us-ascii?Q?G1ByO2VeV1ORtKHjemJ/N2N54W/Xa/BrlgK++rnwmSPuZe0Xc/AaSBxm4JHp?=
 =?us-ascii?Q?u+D9P3Ii7Ym17sKBf3jootBBWcq3eCGWwjdaCR9bUS7fnxVHuGTUMLc3pV0d?=
 =?us-ascii?Q?BwlKisMOONMfZ8lvtpH76RWP8mHEos0etB39lap61myWMt3kJLymB5I7faYl?=
 =?us-ascii?Q?G7bFSqrMXMnHZj91xHkZQFDOmfWIHjanydPbRDNOqT2NDM3ZV9MPpfzz+rRi?=
 =?us-ascii?Q?uEgluHNLx8+A5fkLcw2BHE7cyvgO184XtiSWAy4/AvNAF5oveu6nN7D41pKc?=
 =?us-ascii?Q?F/Ge5COWcImMLG1KCgdT7XxWK2eVAJ2jzVJeDVrLRibPJQu76sAsiyzGKqak?=
 =?us-ascii?Q?2xJOBF49u5lJJjCKX3VelN64IZZpHO1eoonfQGMSnQCInDZvrSp0x4mrheLb?=
 =?us-ascii?Q?mOEYdHlP1w9PhRHlDccRED7tMxsaSMzrbF7+WNeftKyJDteo/8pvl2vvitgy?=
 =?us-ascii?Q?DTOvBEI2mv/JU+eROSOtMf1ni86GZgzSnNtxGrtBy67CG0jNAsmIq+At3+f3?=
 =?us-ascii?Q?hlQ1XF/rLYqitDL6ez6ghYW2hcXQ+6jzycsvSbFG56ZFoAtkQ4iFWKkwITkn?=
 =?us-ascii?Q?h/oJrTeORXDNLx/qXPF24pOyhCiUjd2wvIoHqwraZD2N/U56f79Rg9o5t1it?=
 =?us-ascii?Q?S7LbtQ7K41CEujlsX+1NI0wiukeBlo7FBPZDcf+nth8dLPTOhi3k73T+OzUC?=
 =?us-ascii?Q?Uq2H3a3mO12bpjjrS28qawgGp4Kj5QkL1qC3pE8n+PAH5A2ZLVGSyh21+qEM?=
 =?us-ascii?Q?vTbvgg9kd1w64lWjNqzZQQvb4c5qh/vKEEKSzVbEjotEYWMo/Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YMqzrg+jDrnnKoDxwgphchJg/yO0Th6wL4GX10yUMy85IKPLMtDdetRWrEsd?=
 =?us-ascii?Q?dj8r97Y3g8Eruoh+Ml+WEgcbMPlMfCHE3+P7pyaC7Hh17HfUxsjH568IT5Tc?=
 =?us-ascii?Q?FCeRseZt9xQv4S6AoUvx9fE9CtEJiGCDOWH05vQYFpZw7BGvzoD0JS8Zs77v?=
 =?us-ascii?Q?kubRWuqMTZJxU/2vu19pH1Qi9+pzoX+cYYuQQn4JbM9xm3YGHV7548IoluGH?=
 =?us-ascii?Q?jNFkvRTgEGD7ICDl7dv0LWKZQaYCOe/FF68XhNzJwBjYxHxkt2maKkMiEDLm?=
 =?us-ascii?Q?YDrWVBp6HbCa+CcB5IY06SNgXdavLEQ1DBEr9A5cB9hKEozh3p/H/RhdR6Q9?=
 =?us-ascii?Q?vd+EW5ITmW/OFIkXl8YGGYAQSeh8g5T+xtF3MLkb2VQg2ca8Hp7+jQIROU+I?=
 =?us-ascii?Q?iLlf2fC9R5QTXD7r9cRu5YXU/6CTOXnWleTBWfz7aWWG33aJDbdfAbLGIfKL?=
 =?us-ascii?Q?ogps28foce4IYVmmjDLNhWysz7xNZiJwQkFdR2Cxmb5D/PqygDXBRoyRFf6i?=
 =?us-ascii?Q?OhxEC8R8U86XNao3TL8xwBpXHdEcaJ5RfxmPd+I5AMwpYRx4jISAgPTqu0iT?=
 =?us-ascii?Q?ZvW04NUWMKnV4riq/K3bZ0vZ/b0qwPbQJSRUoYdo4noTVn9dNVimOVGV52/Y?=
 =?us-ascii?Q?ktTbZfmA4IAEgohAZWr28tlBWeGYGzd3pR1UOYNAvFtHQOTcYYbksw43ObKD?=
 =?us-ascii?Q?D+X9IVWUKCLqnc5BcnDgPugenLnE/3VM8jXBHzjeTso8UtlP1SGiYYb/Shgh?=
 =?us-ascii?Q?YKwQDAeTT003RyJtilTuWGjh52MPHxqtNcb/hXlr0bNhrmrG0KsbMbJ9zLvH?=
 =?us-ascii?Q?G03yQUZPkcGcGnRYTMzxZdFZV0jsT/krxQumXKhnd1aUcE205huq6VW22Ura?=
 =?us-ascii?Q?wqknZnS4Sod6wZI4K+nG4IKvREaKj8vfcmicMtU4E97/wjkjvBqX5Syz6y7T?=
 =?us-ascii?Q?47r8hCf2VqplfF5Q0b1jZ075LWrQBZAYdi8tYpro/6XLPGPCA8qB0coHE5O2?=
 =?us-ascii?Q?O89dbijIhKshvqpEmOns6uNcBRknmWn6e+L9qgAHqkYtwILIElue+YYMdwGT?=
 =?us-ascii?Q?JJeOBmcKbT0WbKp0mje522f415dupb8J/aVHA9Iod/b8jIvpBk32s2WAE3Iu?=
 =?us-ascii?Q?FnCN4TCbIDnMq3boIV4+DWPJg0jFSRbZQUE4Qt8ijnFZ8MyP4fWEfh4AXqft?=
 =?us-ascii?Q?NkQaVkYXLyJJFD27gcfoYD8hbrHLtim4m2HzuVUtsN5T4ic6z0vIVqj8/S3z?=
 =?us-ascii?Q?z6vrRyjtZSNwqT2+/Rbthhmwbhf0xYvBlgWR1QdmrQDQsavCyTrkY0IUBDCN?=
 =?us-ascii?Q?AwGCUFhbHAm9+9t9dsmej+crv58OdPEyir1SOuNyprvL/7THSa1qN9SfdliR?=
 =?us-ascii?Q?p8te0Dm/1oVMqhpTkrE3j1xwA5noEZ6x44MO3ej4KTLW1M9BtEg27W2644V+?=
 =?us-ascii?Q?KbBD3FrkRSvpGhxu9KecbveNUGjFfGVMwHsJSUBUJgc+hv1R77Rxr90PIuuW?=
 =?us-ascii?Q?pn50O6AAOHynuAiijr7OfbO+j2f5682mVuzsrXBKdpNFnAPsINeQrRbUHlW7?=
 =?us-ascii?Q?OOyHF83xZZcK5T6OJdjx3q4r8LoKzaRZvB6CeXAg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726d6006-4c37-41c7-dd23-08dd2e640951
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 15:08:54.4078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HiQpOy+W/GbJg9itvulRS4lfzAuDjUuNT3v8TC8XbbpRDBrL9gzBzLz2lb5X0pIjzkRgjYLJ4bxiGc0LVhctyohX3Abq9Ca26wWjLeV5PjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Friday, January 3, 2025 11:16 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan <jonathan=
.cavitt@intel.com>; Gurram, Pravalika <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Do not end cork not s=
tarted
>=20
> If cork was not started, do not try to end it. Similar fix to commit
> 598c268686f4 ("tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork").
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3869
> Fixes: 2feb1d6718a1 ("lib/xe/xe_spin: move the spinner related functions =
to lib")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_drm_fdinfo.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index e83c55c64..6549629b4 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -533,7 +533,9 @@ utilization_others_full_load(int fd, struct drm_xe_en=
gine_class_instance *hwe)
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
>  	xe_for_each_engine_class(class)
> -		xe_cork_sync_end(fd, ctx[class]);
> +		if (ctx[class])
> +			xe_cork_sync_end(fd, ctx[class]);
> +

This also needs to be applied to utilization_all_full_load.
Also: https://patchwork.freedesktop.org/series/143066/
-Jonathan Cavitt

>  	read_engine_cycles(fd, pceu2);
> =20
>  	xe_for_each_engine_class(class) {
> --=20
> 2.47.0
>=20
>=20
