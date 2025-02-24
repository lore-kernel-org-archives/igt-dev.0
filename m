Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9881DC021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 15:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CCB10E40B;
	Mon, 24 Feb 2025 15:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/CXGATU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542EF10E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740412195; x=1771948195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r4G+rsGSV+kbYOQ9LTllaGvZF5kvOYaksk77KdgMkhs=;
 b=L/CXGATUKozEIyPK9k5/NjllgYonO2JTslF8vQmQG2+H7DjChmScNuVR
 UAa4iwIeSLjCc+sHdEOxefJ0Oxa0oI/+RZ6dv20Jz8CCtkPZHjMGIlRJ7
 QcwvccQ5O0tcZXEUG4bIsrCGGNsUjO6XYQaZNmsM1K+OnreUlelURuAR0
 D8L+UzaG9qTh1NOhYCC3IapjKeJp/pOYt11jrAY6hinOBNNPl/JEEjXNO
 ig/POJzAX/Zg8TBoPoC1lVMebQ6RpgVTsOVjHZ+KJQNduN7sQPJRtdy+5
 rkq+QCKROe3pYZP27mu1pugPiXk0NIyOTUrFKmD4B2OZQ5Gq7v7dJBHvH A==;
X-CSE-ConnectionGUID: 0OgwnYjXSKumSfGT1H+YEg==
X-CSE-MsgGUID: gTlcYu8vRf+URyW6B2wtug==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41380648"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41380648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:49:55 -0800
X-CSE-ConnectionGUID: XD4leT4NTsi6t9hg54rIzQ==
X-CSE-MsgGUID: vlHxfJIQR66/NCNn9oNSGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121191069"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:49:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 07:49:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 07:49:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 07:49:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbB0hsEjqK+M4vByQBQvZvQZVc3NNsP/L8e4Rq6W/AEhUy0Zxve2nnD1sJLL0J3Xby8NbvWN3GyIVJlXtZlYeJnUsDaHQ/VJSkdK4jLdK6AnFFMzvwyBpzc/DVCujZorORSTmfXx/rF3VrUKsu1xZhDY0JZSuluSLFQuSSKzH8qtTkkFWdFn90SWFqGkdglyyrCE5jooNJxPN4UmhvYMBdRypSykEJvFOm0jVwRYPLjji9VWPrIxVivzTR606CdXVkdS8+VzHcg1UBEIsF4e/9FZ4U9bzjYNtG6b/gMRMvL59S/tVeTXvEnCmvVWTdMRk/gmobanMrtxRwpFfgloHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi7NbeNgygNW+P2J9nREIKVIF/qEvIdaGLarWjeFsDM=;
 b=lnSnDVCpeNyJy+45MnDpUGtITnYDU5oi4+zhr4kBQKJ9NR+wHV42EySCWnI3gUVoMzIwvX7Lh89nWkixdBcvAPcS42j6UC7wiyQRP3Y95uAhXXjoTRc1qF2QaLuPzI1n1dAbKxoKs3+lf2urIv/G7inL0xuO5eyfL/RJPAuVIkMm11Uca+hkuTqB8+JXCHnVo++gXc99DcKJ10o5AbG1QVQ1JWuyVMdyR5CE3a/psgZ4akObNAA7nOLTOpW5jlNdNGVjQ3TXvvMpCMVlYNzYNkv1VJgUnpOoEXV58mNSXWodYgfHixh2gUyXR+KWqCN01FbOWdLamtNsKdhItCADgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:48:46 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:48:46 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Topic: [PATCH i-g-t v2 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Index: AQHbhCX1IsI+4xHw/UquJU/bCbcXHrNWcYKQ
Date: Mon, 24 Feb 2025 15:48:46 +0000
Message-ID: <SJ1PR11MB6129709C679B2AB0A1E08EEBB9C02@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250221055647.2014355-1-santhosh.reddy.guddati@intel.com>
 <20250221055647.2014355-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250221055647.2014355-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH8PR11MB6999:EE_
x-ms-office365-filtering-correlation-id: ff079376-f40f-4b85-c2e5-08dd54eab911
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZpjvHx5rPHzTKvEhQwzmlWizi74zdZ9ADKvFfB+l98iCB3Vkw62jSbWvCHXX?=
 =?us-ascii?Q?HbVs08E/1A7x2Vq/oOctEU4+IaITVf/nWzOZzRkxfV8DQyBOS1KMhKEt0vyH?=
 =?us-ascii?Q?5HTicjoameqXCD9e+TcF6bMOpM/GmV9sWDl0Gsakcg/Wc4G7N2E12tmH172L?=
 =?us-ascii?Q?1Glox31/jO4J+1k6XUcpaZdtNeWTy0emYi5vOwzVYk9Gx+GICil6NtNYXn+V?=
 =?us-ascii?Q?klB6Lmq+NlMe5Snlyf1C5DSNMdtOdRZw3KIzid/1IYYKvAD7oIrI5D90U1SW?=
 =?us-ascii?Q?DmstpYVrofYgQ+CvKQi5Kderq+5rFL1Mtp+txF1hOvPUcN3swMwtkdPOX+DO?=
 =?us-ascii?Q?6PLRC8UlFf0Olh+A3+nmxJgtNWEETCXrCvyhQsQIB776KsLK+BNhyyGykgQy?=
 =?us-ascii?Q?3UEt9DHo8A41qcew45w2CPOgPaYiSI9cZ6Ic39wmrkw0oFV12GNGlM8K+Le/?=
 =?us-ascii?Q?Wu95aLaVltozBNhNSLrhj6WZoUeDr+oR/gU+yB+tiIJVvOP2qWcl5dRgsjOk?=
 =?us-ascii?Q?IMHmPQlXIBPJTvn8HVKS9UxwzyuN4sfCuGoRdCmN3/LsnBT+q2AeRfeRwCQl?=
 =?us-ascii?Q?OBdpvlx84HfuyW3pvoVohCN38blH9P0pHQI0V4agRE0cnm89tD2/AQ8pEzx3?=
 =?us-ascii?Q?xivy0p9JFVokbqhv8uqk3brinHOXlvFR7Govyb0k+4X7H0Qapv6F6NOEifDc?=
 =?us-ascii?Q?ZehyxD+MfANmJGPWiM8ATMnG2FXazwnASR64hE9Kd+vchd/lwoNMdI9q2oeC?=
 =?us-ascii?Q?up2VFotSZcIUoi12mHWl5NUk9iHGRdPMZR5mvtCiaR4he7WOhjHWEDyFIoNA?=
 =?us-ascii?Q?EqBxTq3fU1rdkkpNpizlxxxlLhJwMCj0laxt1sDQjUhZfK2Od2U8M3bOGdG4?=
 =?us-ascii?Q?tWmFK40EEBWyF1H3f+ZhD28Tcub5od1rTPFofBWlJE7uOqf5UcGsZjKJHh4L?=
 =?us-ascii?Q?sMQrtbWgW6s7AeukNSmHa+k3d6PeAsUw9FdTbXL1+o/CJDKTXZiT/zwEw9Ji?=
 =?us-ascii?Q?/+ynyTtlrH0LQG+BbvOQ/GG8QwHw7MYvXtV74SJ3ekO5hSnSJHHa3qblWPlC?=
 =?us-ascii?Q?tajJSCeTT36grcPvDVQv02G7DXBFJUkNeg0zAOp15gedPs2teexHBb84jqoU?=
 =?us-ascii?Q?BLNmeGVtV3n/qlrf0Pm5LfTyShB9Wyq7fCLGXMjggugl9O2xzngi0EXTW4rt?=
 =?us-ascii?Q?1aqvIzcH6dvifpDSjcHMVIIDSMoRE2H/+qLpUN7GCAuDCPyxV/WIJRgDRcYA?=
 =?us-ascii?Q?rvPpKz6NrJvhMbPgFKdj2TxX4dFQTaQwvU+zCzjpENfyNwzxi8UOHg1wuCzy?=
 =?us-ascii?Q?Vg3Ylho978c9Tv4KsAyVhz75v2w91v2WR+zIW0tMKzKOPsZ9wVIusw//I3K/?=
 =?us-ascii?Q?yTF6jHhYx/ivMjo3+60TGAymjCaQ6JYwFqAa22m50RzHa/bR+2PcqICVQ2UX?=
 =?us-ascii?Q?uMpG7iQD/5qYeRatkNjna/ZrEC7LrLig?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FdK05v4LO9yIv+cv3ZztjX5ynTbieYIfps6ptj9fxzD782J8GWqp8HOhemaP?=
 =?us-ascii?Q?Xl3kS/AVeEqpZ0mOkcLRXTHoSg4G/Elb6WXeXnAb10FKCUyL0aIqQfLE32rU?=
 =?us-ascii?Q?yYIB3/uVSIb1d5mBst3e/RbLYE4P/FUpkckrW+8iamvRF7dVSznH4GsiO6Qx?=
 =?us-ascii?Q?pLMVqZAojOjuEveByvbYn8kMC1+JGFLYrS9rXSuYtDVk0U3ZBOvvE8RXGaWr?=
 =?us-ascii?Q?Nb4jCL7bL3WsXAIGQJhACUhgHKUYJUe0fIhR9aPkxVrpnI+P6qT+ANk5JQxC?=
 =?us-ascii?Q?/kMyubLcYmv6OwjPTnrtYbPXmGh7W1CWjNuRTW5BXuP4Yu/Yc/yGvmtC/lxi?=
 =?us-ascii?Q?e8P8N8Q3a0D/xtlJis8prY1NqeJemhmpbB2mikPmnGTJYr1omoW4opY/1O8w?=
 =?us-ascii?Q?O0EaHDOvkh9sFQp0O8aYIe44zD9+iSY9MI8Ut60FJDSkO9hb+CYneglfNWto?=
 =?us-ascii?Q?+UH4MelKuGYhOVxe7uxz1znRLvnJAkAcNWGMznuZM2hIsR92l0xtNOinJVa5?=
 =?us-ascii?Q?AKdqDeOY/euRzYA99Hnr/9Cu1UfFURapHzG92VrGbJeJb2otLrLmkKfZYfHK?=
 =?us-ascii?Q?J6klBIYuYnfD7YLNPtL5ijqXrRjCW+7IagV/CEWyEOkPtN3MRxdT43/vYO8q?=
 =?us-ascii?Q?QMlPWX2Qib/lGoIGDotniPx98nvPEBk6B9RfEwQiOILw86oIc0RV+6Cg0GKT?=
 =?us-ascii?Q?sy9dgnXEWoZGiO762My94g/8hGK7voBJkuMB8Zo13MOUaTiq6vaiaSx37Bzo?=
 =?us-ascii?Q?swXF61xvVyI19Z/Jwlc/vI4W9ZOnj7RUUycaakFcyGftuLIM88v32WYClO8K?=
 =?us-ascii?Q?19PP3jh2Ir3UFGGhXMVrNo+wg5Kb//O/efkA9AwAIDR0OiXjIo619ogwYwzQ?=
 =?us-ascii?Q?zed67bgp6tBdSXVSFbp2Le68kHs/evagtrx496nqEnt0f253iOQLdjxxW0Xh?=
 =?us-ascii?Q?cPOia4IgijVDRwBxr6exV3VVfJeT6vZZGr2Ip4G2rqNCbI8G0v79b5Z6pdI3?=
 =?us-ascii?Q?94uvKQoL5liOnBwvhPdDAcjTxPmvwU/ZuaZDh0KWZibFwj4gjUf23Z8AtHEv?=
 =?us-ascii?Q?NbzSnF+fyjfLInhZyHNjPHWPr9y/CNXkFY+wZNmyz6mO++N4+b9xiBqqknnC?=
 =?us-ascii?Q?QypoDqX+6gmXmVKKzdmXPCgdv/x4NPyOsyRkm+1Qs3UK/dPU+PVgFWYq8w5S?=
 =?us-ascii?Q?RoynFJ7bO37A1wfDYaFMMBIMOokmxdKtnhiny71+dEMryUc4Slz5YGA4dnnT?=
 =?us-ascii?Q?Kg4skg6pZ3RZrpSqTuZInKiS2DBgGB3Jx4dlr6nO4R0t25entXl4jVTlhBCP?=
 =?us-ascii?Q?2dUlKldhi/y+wHgttks0LxWkfWJ+AbMyUc6/QeghYclKWSdNk078Bxxp8l5M?=
 =?us-ascii?Q?jTsQcgo8A8ZZVCpiqVaAF1PLe54KrsG0tf71T6kAmcgsj5sj8NPk3p1AvwQa?=
 =?us-ascii?Q?hqieztkWbDcvp0V/5k1QzA91tTOLvifiIKyfvhAQQSYSJZRDC+OOzD1TVx7z?=
 =?us-ascii?Q?bAby1bgMS0PdsWHhfE5T0VW9URmvELekBiaK77q5AVQpKNhX4a9EUHUPOdlM?=
 =?us-ascii?Q?D6xa1HoS3EWBvKj6hPZhzj+C7LBycppcYd/tu1D/IWmw9npofC1hiCT8bwSd?=
 =?us-ascii?Q?Wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff079376-f40f-4b85-c2e5-08dd54eab911
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:48:46.0199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPZa1PA7eBlYfFYKCqLjiZ/UP19jF970h9mZ22mZb1V9brX9vZqN+iGe8g+dxr/bpSNQR4U/aAPsVb3etIDbDNqAOMy+StIwzZ+dkWQ7fkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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
> Sent: Friday, February 21, 2025 11:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Add support to retrieve async
> modifiers and formats
>=20
> This patch introduces async_blob_data to handle asynchronous format
> modifiers.Processes asynchronous format modifiers and update plane's
> format and modifiers.

Nit: This could be better phrased. Details like async_blob_data need not be=
 part of the commit message.
Something as follows:

This patch helps parse through the plane property  "IN_FORMATS_ASYNC" to id=
entify
format modifier pairs supported by the plane for async flips.

>=20
> Handles 'IN_FORMATS_ASYNC' property.
>=20
> V2: Add new fields async_formats and reset idx.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>  lib/igt_kms.h |  8 +++++++-
>  2 files changed, 52 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 0ba1afb08..8623235a9 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -701,6 +701,7 @@ const char * const
> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {
>  	[IGT_PLANE_FB_DAMAGE_CLIPS] =3D "FB_DAMAGE_CLIPS",
>  	[IGT_PLANE_SCALING_FILTER] =3D "SCALING_FILTER",
>  	[IGT_PLANE_SIZE_HINTS] =3D "SIZE_HINTS",
> +	[IGT_PLANE_IN_FORMATS_ASYNC] =3D "IN_FORMATS_ASYNC",
>  };
>=20
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D { @@ -
> 5724,11 +5725,14 @@ static int igt_count_plane_format_mod(const struct
> drm_format_modifier_blob *blo
>=20
>  static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_=
t
> *plane)  {
> -	const struct drm_format_modifier_blob *blob_data;
> +	const struct drm_format_modifier_blob *blob_data,
> *async_blob_data;
> +	const struct drm_format_modifier *async_modifiers;
>  	drmModePropertyBlobPtr blob;
>  	uint64_t blob_id;
>  	int idx =3D 0;
>  	int count;
> +	int async_count;
> +	const uint32_t *async_formats;
>=20
>  	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>  		drmModePlanePtr p =3D plane->drm_plane; @@ -5788,6
> +5792,46 @@ static void igt_fill_plane_format_mod(igt_display_t *display,
> igt_plane_t *plane
>  	}
>=20
>  	igt_assert_eq(idx, plane->format_mod_count);
> +
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
> +		return;
> +
> +	blob_id =3D igt_plane_get_prop(plane,
> IGT_PLANE_IN_FORMATS_ASYNC);
> +	blob =3D drmModeGetPropertyBlob(display->drm_fd, blob_id);
> +
> +	if (!blob)
> +		return;
> +
> +	async_blob_data =3D (const struct drm_format_modifier_blob *)blob-
> >data;
> +	async_count =3D igt_count_plane_format_mod(async_blob_data);
> +
> +	if (!async_count)
> +		return;
> +
> +	plane->async_format_mod_count =3D async_count;
> +	plane->async_modifiers =3D calloc(async_count, sizeof(plane-
> >async_modifiers[0]));
> +	igt_assert(plane->async_modifiers);
> +
> +	plane->async_formats =3D calloc(async_count, sizeof(plane-
> >async_formats[0]));
> +	igt_assert(plane->async_formats);
> +
> +	idx =3D 0;
> +	for (int i =3D 0; i < async_blob_data->count_modifiers; i++) {
> +		for (int j =3D 0; j < 64; j++) {
> +			async_modifiers =3D modifiers_ptr(async_blob_data);
> +			async_formats =3D formats_ptr(async_blob_data);
> +
> +			if (!(async_modifiers[i].formats & (1ULL << j)))
> +				continue;
> +
> +			plane->async_formats[idx] =3D
> async_formats[async_modifiers[i].offset + j];
> +			plane->async_modifiers[idx] =3D
> async_modifiers[i].modifier;
> +			idx++;
> +			igt_assert_lte(idx, plane->async_format_mod_count);
> +		}
> +	}
> +
> +	igt_assert_eq(idx, plane->async_format_mod_count);
>  }
>=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 7227f0b0e..7bc5fc06c 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>         IGT_PLANE_HOTSPOT_X,
>         IGT_PLANE_HOTSPOT_Y,
>         IGT_PLANE_SIZE_HINTS,
> -       IGT_NUM_PLANE_PROPS
> +       IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_NUM_PLANE_PROPS,
>  };
>=20
>  /**
> @@ -438,6 +439,10 @@ typedef struct igt_plane {
>  	uint64_t *modifiers;
>  	uint32_t *formats;
>  	int format_mod_count;
> +
> +	uint64_t *async_modifiers;
> +	uint32_t *async_formats;
> +	int async_format_mod_count;
>  } igt_plane_t;
>=20
>  /*
> @@ -1273,5 +1278,6 @@ int igt_get_dp_pending_retrain(int drm_fd,
> igt_output_t *output);  void igt_reset_link_params(int drm_fd, igt_output=
_t
> *output);  int igt_backlight_read(int *result, const char *fname,
> igt_backlight_context_t *context);  int igt_backlight_write(int value, co=
nst char
> *fname, igt_backlight_context_t *context);
> +bool igt_get_supported_async_modifier(igt_plane_t *plane);

Where is the definition of this and where is this being used?

Regards

Chaitanya

>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.25.1

