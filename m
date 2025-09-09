Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B245CCAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 14:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE0310E734;
	Tue,  9 Sep 2025 14:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4UjOrOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8266110E734
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757428069; x=1788964069;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TzdDBMR5hVcc87wU6cosrZx+x8fmE2HuZnKLPmePxwI=;
 b=V4UjOrOyr2z6b1sKVjvO5rOiPUQPpPCWRp2GF6B7PCqnE2YzCwFLLmSn
 2n8anGrziakgVRgpqqILa/JcBLaiUBhndPFRIuRDyu5yiBRwBbOFbIsRk
 2YKgBqFTHkZ+w9UNQKK5A3gkIkCOfpHjrZSPUvoHvtYqZiXU/SAGGxOm6
 Sub5G4PQUu/+jHy5ZRxI1PXNxTp2mWRUKy+Ngh+q+CSimWqRn+crCrqKI
 ULSb5Zn+HenH/cu7iIU7EWrsLucvx+Oq7gGT2TUBNuVKeEDA5aeatKbFd
 z0+vQ+d8cCYL7JNV8vzPvaNdsmeH5sA1nK1iJ2JpkwQzhNbFyPhfrrpAp w==;
X-CSE-ConnectionGUID: DYei0yYhTQeQe9BJJTDSlA==
X-CSE-MsgGUID: K5WXGU/+QmqfU8ZcvS6uYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58755752"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="58755752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:27:49 -0700
X-CSE-ConnectionGUID: r9T3wY92RhabgkScsqKsJg==
X-CSE-MsgGUID: 1jNsqDM3QZigUcWF0Atbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177391219"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:27:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:27:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 07:27:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.88)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPCtpYoje+1wmPwc/bHZIgD6d1gR1dMl/0QMhqN4pafR73g+WsXeNk3F/C2wkSLav+n8sjymbok+hnGwYCPv8DvlHdNcq9CxhUMgtKUoCvlgDvYXJB9i0VwSECTVyKqQ+8t3Z817Xs1Tv37LRUcKyt9b0JfhZB0XOqF1h03vu8xWJb0Y6vWOt7Rkyn9jmMdFdWlh8NfFfsyOwNH5ox7DPDO7VtFxBJW/dxa4VKBPcvl6ZIdU3j6lyMWFmFGcU6FZfyMwIbBRg8UuAvOZs5zTz/AmFQrE4L5MgHEOFSnB2Jep0vpvkKBuilir/HqpUtAxjiYpnw1DK2hR7+ydKYPSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6dumR5csZ9S0HOTCnybkmvIkZK+dUbIJZ5quoeB2t8=;
 b=baEONxclqwmezQaWO6Kl7WJoMrkSdGtAqB2Wsu2tEGhnJvblHxrgVAdcLhvGYZQW4Rfvn+F0BhkhZFMQr/yzo7zH74RQGtSmUXXwFPbcW4ZjRCaWnpBEcUCAZcXRM0wrNRLlppP0Eg8SMSFtlwI2laqG8lmfbxMwHynGKcU9aJZ1ruxCcxWFUQNRxYKrSEZ5RAISOKlEf8ibjfa6tOIIiwI/5WOUmsfW9sIlThSZQhsOCQSJsDYBlK4A9F1Y3fN8LYUCHvyAtaKoOsQm7WHpn3y+57viuo5jBGPHS5NMStmqO2DViyMU2iDg6fU3kibAeGUeZz3Z6h1tbnX9Xg8Ywg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:27:42 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:27:42 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/xe: Track valid Tile IDs
Thread-Topic: [PATCH i-g-t] lib/xe: Track valid Tile IDs
Thread-Index: AQHcIXKKgdA83WA7DkeiX25Ms+21vrSK5yjQ
Date: Tue, 9 Sep 2025 14:27:42 +0000
Message-ID: <CH3PR11MB84341AE4EA8CB1595A2840098D0FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250909101421.1254774-1-nishit.sharma@intel.com>
In-Reply-To: <20250909101421.1254774-1-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN0PR11MB6112:EE_
x-ms-office365-filtering-correlation-id: 1c0403c0-6bf4-42af-a0ce-08ddefad098a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?t9/olkSGHMeOw+HQ4q+HszaeWoXd0f9d5D3AZCBvTtdIoSXGfKMyskLCUO+g?=
 =?us-ascii?Q?L1VF7B7HuOifCyaUZDUDi3SNk6Z/mAgFvhj6XnvSdH0eJiI/eyFQONkac0gs?=
 =?us-ascii?Q?gckB3IddgbHKgfu6jC22KWHdnhUdI03jYcLjZ2/0Eg33kPV+RIqovP3aAMq4?=
 =?us-ascii?Q?haQ8eD0Ovvw2t6am0zjNah/eTArGZ7Rb7FImG6iy3d5bitDyGVzP+kUsyhIa?=
 =?us-ascii?Q?G55TIAJU9s2cXf4it9UDFJWZSlx6mVCUza9evnI2hAc09E8IVL7DZIwtA47K?=
 =?us-ascii?Q?5KueaYCmYFRUoFuKm5Pn98OmmnuWff6r+pv5H02A6Thz8DXWG1XZ8jRCRTc9?=
 =?us-ascii?Q?9M3MfE3X1eeyznIAdf0Mts5jKvZg5OJCrKVSm/WO6GP6fqiBNfl3DfMBEgQ/?=
 =?us-ascii?Q?kzQxO3h79302WH5x3fcIk+o2OX5M36OLaK8vUXg3DkkE5aP8egjyX/vmMwOM?=
 =?us-ascii?Q?tOX3pC1kKvMVuTDzGlCY2enftEcF51fF+txG+S+ZKCwBK0ClnKDXPPAJmXL0?=
 =?us-ascii?Q?hoRJBtSbjCWwIi8N40vYr9f2t8bXhjRri1+V2ZUh3V1vRQ9JZEHJySwk505O?=
 =?us-ascii?Q?N9aGxsVQtbN39drL8FopB/ch4ac3SMebC7oRD8u9YEjHK9hojdvDNwfXRKkU?=
 =?us-ascii?Q?X/1rj0EUtUEVZo56rcq6lQgVp/fxXdheyEsxAFQ4X093FfqBR+WXTOnbKSYy?=
 =?us-ascii?Q?d+ioAvk/E25Mrh3uVqk0KpBSj9ibV9FPUfgiUql1htFjxN6Jgr5dwd72AAd/?=
 =?us-ascii?Q?/kvCwPZaOzbdz7IxpHvkjDIIzf8h95RuW2wC+AngXtdDOcy2bj8e1YyNihT3?=
 =?us-ascii?Q?F5A2cHov1HvfoXaFyF3hoY9vEe368s1aCsVeBfWVniKU79MdlaG0OQZWyqsn?=
 =?us-ascii?Q?nRuWN/4LdvAxBxnLXICReuicPO1GRmE2wHcss6oufXfPShynJk2C6+YMjtzO?=
 =?us-ascii?Q?dlwsL81h9tmjtQfC4DH/Z1hWYkQA20bJA1hX6DiIgSdpBIGFoSUukAmW8jo2?=
 =?us-ascii?Q?T3mz1GhX1iaFpIZxv9aYf9/uaVvku1sOjXR9pL5fRCn2cNNTJepJmVxrjfrW?=
 =?us-ascii?Q?nZ3i4NS9S/a24WGiCbpEespVVaAv8K8a+Y+tmp7x74z01A5d0N0JQJ1SDDyQ?=
 =?us-ascii?Q?BhjFjTxXF/l5avTu1XMBYWHUm2+Q1ET0n9P3RP3Fi7OLdW14Wt/M7+5T390u?=
 =?us-ascii?Q?2vfGDS9eRpEPz+TVBAnCGjKCawcm8Hi19YQM64yT7e9OYLJNlhY0cnkQotBY?=
 =?us-ascii?Q?k/CrbOdCiyiBCsckVGTlnbUCN3X8iGaRUvmzaZ2NLg3E3p0ZxVcnwuA4DVPf?=
 =?us-ascii?Q?xM9YHI5Dxk9v4CeSkiiWH6EmCgJgvvc51Q1YfrX8ZHOy8URaxrhFsGPhi2I1?=
 =?us-ascii?Q?P5W9WuHsnLWybu7sDjCborEOAlkv0TMSmkjhjIvvcOI3kV7+J+qZPaP7KIxH?=
 =?us-ascii?Q?3tPpkILg+wc4XyDRozGcDZ0gIAob2KYxdr+4W8Jge95Itz1jpYBuTfZ7rXh4?=
 =?us-ascii?Q?aguB10YfkjHE0zs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xkB/uJuPZI/05TEfj+BDej2zsPTpyCP067ablHfCwqTyDFaFad41nRcU/vt8?=
 =?us-ascii?Q?hx+w8vtpM5CYomwSlnzxD3MDv6ZKygpiYm58xUqB+MnQXcGh1i6c0zXNjZCM?=
 =?us-ascii?Q?DRdrKUMFEF4ORBmKOvH5tRN2hfRtYfNztj8lIwJQQ4yxIfTCP36QuKKVsd2P?=
 =?us-ascii?Q?IyU/Ke6wSQa0iqNbdAjlV1pdc4mssAMiTJwk1XHMS8liRxzE7W7APFzJ9yvl?=
 =?us-ascii?Q?EbtCq+jpKCR1d1i6erigkAkFOSylPXE033ucUEktoBdqsbZD/0+oeB5j/8Od?=
 =?us-ascii?Q?lOKjnZAuU9Up40qYH+JXLbciT5lgZf1+bI7TozfDGG2JT3DHt2ahkcaObmqo?=
 =?us-ascii?Q?VwPz6vRuvM7FOvFGZk0LH+EpQeW/+waqOogscJ51LNgXjLW5F93He783hEa9?=
 =?us-ascii?Q?Dg1rGBZTLTpSu+YOVlzKHwGdV5a4mCi08wBPJmB38BbAq9r3egei8y+dX6eM?=
 =?us-ascii?Q?1A+vGdGyeK79fQfOD0/bcnQWJQCaEYSpx/wiAfMi1K4iQDPxrgp5mSIP/O5v?=
 =?us-ascii?Q?FHMNP2Xb4UmdedZSB5VE01hgApH5XAccEKitqGrDby7wXZH7cjlD2oo2MDmI?=
 =?us-ascii?Q?cIHcemzwCuo3/9GGmBy6qCzLwEa0+zOYWqBLNbu2C9Es+MPlBfphK4zOKZ/Q?=
 =?us-ascii?Q?pR65Dv0Eh4x2LrVg9/gJUndz2L+q0vJmUjGv4De+VBLVGaPXvZ+uMA9hNWhJ?=
 =?us-ascii?Q?7ZublFvdH1R4UzB1MKJ6F9jJyt+NoXqQ5szkfgVbFSyGESgNt80zR+pnwbc8?=
 =?us-ascii?Q?4ImUBVBWcc2dl71Pr4vL8ajB1sVyHXvhLLskO75q2AR4LC3vqUGmW3JQHNv+?=
 =?us-ascii?Q?oHEHzNJWU4jvn3zpGDzk5MnfBY4xmBHmhHBxqjqbRaOERWOTFzNHtublJw9l?=
 =?us-ascii?Q?vAI9wQTwqWqk2Z3O70CYY6XkqU4SkK+UszlHHekRAmknTQBTuUnb1nVdfigH?=
 =?us-ascii?Q?UXoXryeuDE03/2InmG7tfV45ZXSz4IuCm9JWC8YCgbxj2asNJpDajgID+oNM?=
 =?us-ascii?Q?/SRKLY9MbzJrdn6hZvaCgBoQZ5GsKeklPVmfwIqBErX0BCuZA9kVC5Gvhet/?=
 =?us-ascii?Q?ED4/40Uek1gQqW0nP0jWdqsMGn9233ghtyqUb5eImnznVQhYzjJD/MBecIhQ?=
 =?us-ascii?Q?Nks6M93psDVAM/ZnIdo/DrkqcdeV2aQASGcfJ2icJD5Xll92gH82p1hC1f9l?=
 =?us-ascii?Q?kHheSDoRbJ14DJtYRZQZHz1nnrwUzv4MvLxaPzSTG9Kh25vzK/ZQMzhHa93q?=
 =?us-ascii?Q?QJOVXg3wgYORllYt3cg7UasE+N5VZ5TYTP2keO/ODqDKCfneUHjWh5jEtUvn?=
 =?us-ascii?Q?+IgFI0r0ZT2CGFWqlm98nS0sBqOKcJds1wmrQdTOptFZ4IeYIpnEIjkI5OC0?=
 =?us-ascii?Q?y6uZehHrHRqVp1oFudgf7QVs0RG0vyEt5ShG6jNzfVa7RCiyx0VDHjh7sweq?=
 =?us-ascii?Q?XB9MYu5mE95Xhi0XAv1hAdwUPa+JMpkJTf952PjPHbiQ71T1DYYkg6oLHhLk?=
 =?us-ascii?Q?LDWwK8x033E59Dq74IbjrfKodIY2nqtubAaWwBh40aY9a9Ky2YCGYmFcsd/l?=
 =?us-ascii?Q?+zokgGCTZr4Zt2DwHvIiFpwi7jbyG0Yc+cgBiBtjvy0o9aPl15bLFWnIU3N6?=
 =?us-ascii?Q?JA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0403c0-6bf4-42af-a0ce-08ddefad098a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 14:27:42.4569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ll9C9MqPArJnJvVo6RisQk1zbuZX+3AOmO8pXF2fmuR6fqOH7tfLPeKEX373WjUBICVM+rlIJ7R7QXTItLL8LrjIeAjA4f/Fff88cU0fsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: 09 September 2025 03:44 PM
> To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Sharma, Nishit
> <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t] lib/xe: Track valid Tile IDs
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Iterating drm_xe_gt structure to get valid tile ID instead of assuming ti=
le_id =3D=3D
> gt_id and finding sysfs path for GTS in multi-tile platforms. Initially i=
t was
> assumed tile_id =3D=3D gt_id in multi-tile platform and if gt_id =3D X pa=
ssed as input,
> it was considered tileX.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/igt_sysfs.c   | 19 ++++++++++---------
>  lib/xe/xe_query.c | 16 ++++++++++++++++  lib/xe/xe_query.h |  4 ++++
>  3 files changed, 30 insertions(+), 9 deletions(-)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index 96ca57ed9..68f7a19e8=
 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -226,6 +226,7 @@ int igt_sysfs_open(int device)  char
> *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)  {
>  	struct stat st;
> +	struct xe_device *xe_dev;
>=20
>  	if (xe_device < 0)
>  		return NULL;
> @@ -233,12 +234,12 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char
> *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) ||
> igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>=20
> -	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
> -		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> -	else
> -		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile0/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt);
> +	xe_dev =3D xe_device_get(xe_device);
> +
> +	igt_assert(xe_dev);
> +
> +	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> +		 major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev,
> gt),
> +gt);
>=20
>  	if (!access(path, F_OK))
>  		return path;
> @@ -307,7 +308,7 @@ char *
>  xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int p=
athlen)  {
>  	struct stat st;
> -	int tile =3D IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
> +	char base_path[96];
>=20
>  	if (xe_device < 0)
>  		return NULL;
> @@ -315,8 +316,8 @@ xe_sysfs_engine_path(int xe_device, int gt, int class=
,
> char *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) ||
> igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>=20
> -	snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> -		 major(st.st_rdev), minor(st.st_rdev), tile, gt,
> +	xe_sysfs_gt_path(xe_device, gt, base_path, sizeof(base_path));
> +	snprintf(path, pathlen, "%s/engines/%s", base_path,
>  		 xe_engine_class_short_string(class));
>=20
>  	if (!access(path, F_OK))
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index 9b88cce8d..d735e=
df30
> 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -379,6 +379,10 @@ struct xe_device *xe_device_get(int fd)
>  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->gt_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].gt_id);
>=20
> +	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> +	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		xe_dev->tile_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].tile_id);
> +
>  	xe_dev->memory_regions =3D __memory_regions(xe_dev->gt_list);
>  	xe_dev->engines =3D xe_query_engines(fd);
>  	xe_dev->mem_regions =3D xe_query_mem_regions_new(fd); @@ -
> 545,6 +549,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct xe_device
> *xe_dev, int gt_id)
>  	return NULL;
>  }
>=20
> +/*
> + * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in
> +the
> + * GT list and return valid tile_id otherwise invalid.
> + */
> +int drm_xe_get_tile(struct xe_device *xe_dev, int gt_id) {
> +	for (int i =3D 0; i < xe_dev->gt_list->num_gt; i++)
> +		if (xe_dev->gt_list->gt_list[i].gt_id =3D=3D gt_id)
> +			return xe_dev->gt_list->gt_list[i].tile_id;
> +
> +	return -EINVAL;
This error means its invalid parameter or invalid but I feel we need to thr=
ow not found error as gtid provided is not matching with available gtid.
-ENOENT --> this would be good error to add here.
Apart from this code looks fine to me.
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> +}
>=20
>  /**
>   * vram_memory:
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index 4b8a6ee77..2fdd8=
60cd
> 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -39,6 +39,9 @@ struct xe_device {
>  	/** @gt_mask: bitmask of GT IDs */
>  	uint64_t gt_mask;
>=20
> +	/** @tile_mask: bitmask of Tile IDs */
> +	uint64_t tile_mask;
> +
>  	/** @memory_regions: bitmask of all memory regions */
>  	uint64_t memory_regions;
>=20
> @@ -101,6 +104,7 @@ unsigned int xe_dev_max_gt(int fd);  uint64_t
> all_memory_regions(int fd);  uint64_t system_memory(int fd);  const struc=
t
> drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
> +int drm_xe_get_tile(struct xe_device *xe_dev, int gt_id);
>  uint64_t vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);  struct drm_xe_engine
> *xe_engines(int fd);
> --
> 2.43.0

