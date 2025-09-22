Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91E4CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 08:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8868D10E3D4;
	Mon, 22 Sep 2025 08:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvzn6qFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B9D10E3D4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758529108; x=1790065108;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zfh+SwIuM1DSSNMPhqLeRMYzxbgsvOfvzDxADe747QY=;
 b=gvzn6qFQDdv9OsYI98LDyAYSlBrma711B68rxdj+I3A8+zJipF5zRqkU
 Ss5UuqsXulBBuYSafkPjzmOjyf3aose2ujhUDdIn6/FIep0xXl+K5HYmb
 OLmJI+PzM5uELNCyyQCfvzGPX+ivvA+SqzBVRRiAupo2RzU7mSfec13Rg
 ObJ1L/FxSRW2s3dRBY+gE6zoP1lmWLXe2VfnK5rh28ROK4U+cOMRFZxLe
 ruo5BJBV+h0zHmM1ld01+8VJRmTQeBEa70DY0+bSHH6IdxRjYqLCLsCyW
 MJFVX+EmE8FvSjV8wY4/0BM4YmoWk0yAkVpJV8jh+w8qKmG7iTiR2xWFq w==;
X-CSE-ConnectionGUID: qIOJxTsDQESnxQUVAiB0Gg==
X-CSE-MsgGUID: gu9O4mNPQJSql6aKZr3m/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="59824638"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="59824638"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 01:18:27 -0700
X-CSE-ConnectionGUID: p+2+MQZ+Ta2Hk3bB2qUMVA==
X-CSE-MsgGUID: 9FrdqPv0TX+Tf+VHjhYXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176487858"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 01:18:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 01:18:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 01:18:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 01:18:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7EFok7N0O4jL1rF9Y4r3tJlVxsS+tBBJccEdRb9Cn9ZP8Ugx6UkHB7e989M3nKil5lMcCzvTkZKrkzUJD7bx+Rxqm1e45i1H0R6qjj3lMU+XPWbeUNXSI9ykq9dLp6TQZ3i3trdtrm+24Kd1czrlDy52r+CwpHCQpYVWb5V+n20k69E/1SlikjEbugTly58INCC/57BgHS7GA0+8JZLS4J4yIW0LUrpg7S202pGUdEYTSiNWkBLTDupsQK/DICnDcupamxit5RC6pBA7SOxF4sRKEfvqKdbr3Bz5Qh4Y/gn9QJ2gTOAOh5lLiAs3G90IyiLZp+o6iXDbmnq1ADmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugkaEFqb+2VpgJ4bKUya8qQOuP8ON9NiHByODpc3k/I=;
 b=p+7NV4FSoTxTLw9JsneyGmd32O6ADgwSnXo43fp8pnPh/SifpOXYIp+apUvRKRDigo4VUaqIiNVkRCQ8X+m1nnoyk1adPlVa0iAn03OHYtGI47yrDGPUYVWrxdr/QZI+Kb5FlZdRncQDvhmQq250GG3YBW8dxxWbtK5f+/11Rf5NQ07bYkK6+o5asgaItoNgNRAcjiPPvCNDdT/6lLDWhFw1qpVBfbr3DVn7+vXLObVkj48CPjWlGuezgMk0sq/YtietwpCLIlRFJFg11pLBR9zMY4M3Wc7j7lYExzXMdNLX4t2gF57H0OoLs1FYtXvIPgD5sPGa2u74Q1zI+RaXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:148::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Mon, 22 Sep 2025 08:18:24 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 08:18:24 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of
 lobf debugfs
Thread-Topic: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of
 lobf debugfs
Thread-Index: AQHcK5J8AsOD4DE920C4t57wYBXmILSe24jw
Date: Mon, 22 Sep 2025 08:18:24 +0000
Message-ID: <DM4PR11MB6312F4F31178A37E28DC6A989012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250922074401.2494339-1-kunal1.joshi@intel.com>
 <20250922074401.2494339-2-kunal1.joshi@intel.com>
In-Reply-To: <20250922074401.2494339-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB7761:EE_
x-ms-office365-filtering-correlation-id: d134ac15-12aa-4029-c161-08ddf9b09990
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?E6/4AtOcaUmiKSQ8iUbZ/OLAdTH2UFTJUud0zbF9UX/XKAJiQsT8aHRJqFg9?=
 =?us-ascii?Q?knPduJXqNNbvKDQkhYQrDMCHCaa43nlWn0Iye5ky1yrQ7Om/SwagKe3aNPwI?=
 =?us-ascii?Q?AqelyLUM09w6kpsRyiXec/T/mOhrQZ/iMq72oF90lRkDFm3HFJEn04TcKjyb?=
 =?us-ascii?Q?OpDaE82lAwzBpAhTnX/qHJtHMHBDs145qDRfAEMtFySwR0ye9+xydZyHUq74?=
 =?us-ascii?Q?7/GPPGNfYs+8QfIURgr1zb7+YFwNIFzt7HaNss6/70HnulaMaqFPycLmE+8X?=
 =?us-ascii?Q?bpHAeYrhjKJa/7hAwae19BmD+8STBTTTsRCS+0m7fO+cJ/ZccZgg3Y9Jf8kx?=
 =?us-ascii?Q?rm4oZSSWPwlSKA7qZe56ZRk38zJy9KeWvVU4QXza8s7QUWRqKhBF+ZvB1EZi?=
 =?us-ascii?Q?Zy1TGCztZ7J81X9uPgC/1/azPxXN40025dihv/+z1y5n2GHA8TjzltSw1U5D?=
 =?us-ascii?Q?xXfRkKM85B9S66oO+wJqVKbCd1NuQ4SqaYKoUBTpMkx3Kn4ibt/Do5p0xW9b?=
 =?us-ascii?Q?ehN4a5dRhq+fClryRYkBexCir+WTetGurPr4S7Pp9z+O+SIIz8h/8QXWvRMh?=
 =?us-ascii?Q?yJEahiIOXquY7w2z1um1qdXiOZKRyclP4yOzlmZNCx3hFXGgHyLs64f4zt7N?=
 =?us-ascii?Q?/FiVDNLg+Hy71EI6A2KXbVpJr6FZ/QUUMKI4DnvmdLCySKPxddtJdYWAJdke?=
 =?us-ascii?Q?2+4Cdfrqj+yApL9JGWy1dCyjx6DZFxG3ULgL+enOGbZ+dQqKMnzZoQwjJUV/?=
 =?us-ascii?Q?2tqNZMUoNVERzJPC5EnvmHlyA4edJ9lQuDx+g65ibEi/uPh/qEUm02/oz+nR?=
 =?us-ascii?Q?ijDDcNSPXt5Odv+4TamDYICLwioHYmS7wX3kKl74NPeFHnDZOZojfw13z/kv?=
 =?us-ascii?Q?fC6ECmURvsfxNDwKHNGPKn3TNUfGJcu8+zLEGvJVpQwgm5W+dIjQlXddzAvn?=
 =?us-ascii?Q?p+0Ga2gQPgt0cnRnin869VsSz680VIB3p1JX00DtnVkyLaBIFORMsJCTD5dG?=
 =?us-ascii?Q?YQKNAzSfw/dOQvS7yyCsTdQ0jiIyPQPRxivTgNMKuFFuCLeiiKFnwsmUWxaM?=
 =?us-ascii?Q?phwN/g2MpU4/Oihxw4iTWIjuA2fUYxFkfksIa5HuFuVFk8w/c/XyoOMawn/U?=
 =?us-ascii?Q?PSCxaX0a0LodvKpD0bk3fwp5nBfCzIwiXGW8JP/nqWM5Lqa9RHR/JJwzdtN1?=
 =?us-ascii?Q?tljzcf1utbuqkaSxSFKJA0LBpTXvlWAvADEklpb2PclN3T51pU5vbGexnfPw?=
 =?us-ascii?Q?NExeTjXZighUT66euU+8lePy/g6P14YliO5iK5qTtgKXaVivxWgFB2N6za21?=
 =?us-ascii?Q?IOyceIgFN5vW8OmkRSGTxkNVKTorRARNtz/vZNnPToKLges6G/2n85WC40Jy?=
 =?us-ascii?Q?OI0ylvKQEoJrh4Diu/BEgFaaxG8l3H4okrRlk5QhFdVVNhyfuV7xZkI2m23a?=
 =?us-ascii?Q?Mlg6E4mwhWHlA8czryLb0P6IErRPr11kNa5bLQFjYf5dWN6D4qyCtCt6jMYr?=
 =?us-ascii?Q?TXL+n46WTIiSRUM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K7sU2QUHk2rTelNfwEaFdcgQs3lbvlqAie15ieZqov7bDt0rCxyeOzaEQt63?=
 =?us-ascii?Q?DJFLCv+VTrCsZmrJ362VcUzlRkG0/al+OtZaCcmUNS6kbMza0//i0rXdOTlF?=
 =?us-ascii?Q?emZX0vYtwRhUHfDbJBCggn80PTKvnt/eVX4NrjcaYTZopeodh+dS5reo9KOY?=
 =?us-ascii?Q?+zSiB5vDlEouKMFXHqsr6fxumXtjmOYHF6+rPtLz20LqykzgX56QeCkMRUSP?=
 =?us-ascii?Q?SNjC26rwVKCaqBYx4506cwUAuQNE7O4ts44t4HQ4LtOsDdmr9zvaj7GLh/JP?=
 =?us-ascii?Q?GYSq+n9BxolBO5q0iqLFEpukJf0TOIo96wIolEptuGx8KsRNhy4Vf17nxU3V?=
 =?us-ascii?Q?AJNnWOZEXWRE6hIV+nU/WlV8GwI0ZlOBojDTRoGUAOOVFMbaglvDNHjnlIV+?=
 =?us-ascii?Q?0xbgsMcxRufitIpw2bZQ17Eiv8u5k70ZdRDIJzJAzponIWNqBgC4tyaOvPa2?=
 =?us-ascii?Q?KqZUMwVpqIC60C++u3GOc1g5K9+SPWGLSwyGc9iSdedj1prTiLy+Jgn9tCW1?=
 =?us-ascii?Q?QGo0fz8A/DSD2jzxro+6TJ5+flTiesXgQLCoIIBa+YjWdWhCncCD4K3+GXO1?=
 =?us-ascii?Q?uUVVn53NXIJ7rE0jQAltemlLzYbjeyC2D/81TwDvS+8PVTmT9w9mAQ4k81+O?=
 =?us-ascii?Q?QDnyT5t2AWCjpMWgueqAcqP3O0/HWeeTC2BXEXzpaBbyeVj8VDlxcEsqMkeq?=
 =?us-ascii?Q?L2R/OhOfIHTUTu/kSxcgyXKmgE0czGzBHy5mltxOjOR/tlGcd19JDdErRavE?=
 =?us-ascii?Q?qzXTm4uzSbVv1Z5rmcpryHAHum+g2Nic5Rjs6uUr8gjTYGcLd1YDTNeZ+4ut?=
 =?us-ascii?Q?gB3Gj+0OmuAmF5cj1sIYf71zMtzZnB5M5VH7HyalSbCpSOsKFUcpkXrqv3NQ?=
 =?us-ascii?Q?EGaPTXcmU5pBjSIidLTxd6z3Z+LJ3/I0Y8obhseG/Y1zFA2yl1H7PzzMh7bq?=
 =?us-ascii?Q?MN8mkNxtZeIN5x9iw5yGYmQyPd6BZ9JdNzJoNgOidnbjssU5yLusqGPyIWuf?=
 =?us-ascii?Q?to0sXeiMNaY/wXF1WVngQ96lupYNJZmuwClTmE4YL7c9LHRQ+21JLIIe+I2L?=
 =?us-ascii?Q?KrYBLWwuIV6zLYTEaFa3VVS5fJKQcBO3oso7JUB9GodLU8UwHTIXuv8pgvDd?=
 =?us-ascii?Q?Ty2sPFbfO+WeaGyNbU3k3goKVcvxbRicCWTqqMdkuuG65R1hKFclP03CvCNm?=
 =?us-ascii?Q?rQHopKdoahua1YjZZ2I9njgJkXA1mpetHV5DbYt8PzIMZtug18CN+nNo8OjV?=
 =?us-ascii?Q?FDDRkyyLcor9l49xuASXDkn3PFk6muoPS1v5Yo3BeAlV2nIMrWfhfkJnT8JD?=
 =?us-ascii?Q?RRd1Dm050yUgQRBBsl0MbKD5vG5AHJG/PecwLbXJ+MIGxbzWIQtZY3lieWzA?=
 =?us-ascii?Q?2e+k7Tcg15TijPzuGn7ion7w6L4+bmx/3D57eYR4rozJrbb3VE9Dc1AqNZcn?=
 =?us-ascii?Q?CQCcWivyVl/hj81TCzjlvXV+2vDTNBDpItlJ0RtgS3617f0+0FLDQhRFotk2?=
 =?us-ascii?Q?bU+me2pmAGxeWgwhRTNplHRQn6+6kvL8bBEVDgUOWI4CNUQTH+YBs2eds4JD?=
 =?us-ascii?Q?jEjHiR2wob+fHrLQofM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d134ac15-12aa-4029-c161-08ddf9b09990
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 08:18:24.2013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rUmQL38mlRY1dxwe018H+92c4kj/JxYARKU+bi5TEPpz5azNnYdnBHbVcYqtnZbN1EItH07uKQu2BXvRZmzsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
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

LGTM from igt POV.=20
Please get ack from KMD.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: Monday, September 22, 2025 1:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>
> Subject: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of l=
obf
> debugfs
>=20
> Added helper to check if i915_edp_lobf_info debugfs exists for given outp=
ut.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 20 ++++++++++++++++++++  lib/igt_kms.h |  1 +
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index df4a96a17..eab4cb92f 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7540,3 +7540,23 @@ uint32_t
> igt_get_connected_output_count(igt_display_t *display)
>  	}
>  	return conn_outputs;
>  }
> +
> +/**
> + * Checks if the lobf debugfs
> + * is available for a specific output.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output) {
> +        char buf[512];
> +        int res;
> +
> +        res =3D igt_debugfs_read_connector_file(drmfd, output->name,
> +                                              "i915_edp_lobf_info",
> +                                              buf, sizeof(buf));
> +        return res =3D=3D 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 6ef6871d5..7121ab985 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1232,6 +1232,7 @@ void igt_dump_connectors_fd(int drmfd);  void
> igt_dump_crtcs_fd(int drmfd);  bool
> igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);  =
bool
> igt_fit_modes_in_bw(igt_display_t *display);
> +bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>  bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);  uns=
igned
> int igt_get_output_max_bpc(int drmfd, char *connector_name);  unsigned in=
t
> igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
> --
> 2.25.1

