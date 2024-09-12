Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70CBEE644E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 05:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3644F10EACC;
	Thu, 12 Sep 2024 05:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvvNqIKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD0010EACC
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726120699; x=1757656699;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0BWl8l0wZY/deiKMDYGmH66+lPZ7G62SQWgGOPrGKj4=;
 b=lvvNqIKkq02DePRFft4kHy8A5CEqe0Yyk4cigSJTGkAI+wlOvVBjmeh5
 7XkPPiEY0Ik96XMrMfkGX+KTtoB9Bdi2XEulSPz3s4QwwtlX7KMLVC3e/
 yXD1duWH6xqIEUmYTHjLD5eRAfgFG5mrzpeafM1rblrGeR3+1TcGSsoeF
 HVidX97x0035J9n+z7hijvozd/KkEJLYzIpLOQFaLe+FseA62xw6TWtzo
 gcmeFrQ4B1u2rHJvoBJUgL2Nfirdh1ZOI5F0ht1xGtsCGwOTZoexuYmzV
 M6cJlipv1kNippkPuTF6k/Xz4lk6Z80E/FoTXSiwxzjHvv5BSGwyh4+8/ A==;
X-CSE-ConnectionGUID: LhuFdXv8QPesQjxhhcqacQ==
X-CSE-MsgGUID: R5SulcjcQcmBSF1Lz3axUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42428816"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="42428816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 22:58:19 -0700
X-CSE-ConnectionGUID: FXcTSgIzT1mfgvfAJbT3lA==
X-CSE-MsgGUID: G5greFodTBqGduGGYyz4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="68106393"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 22:58:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 22:58:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 22:58:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 22:58:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 22:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlJg2EJsO95GmWiuLQgNiX7rcVif3gArrFmm1n/ukqx+yTJWbCXLYqTFP32a24eMKz3AJPkw9anTqgkHQBS1Zee7PY06K7jUaXt8kkqj+Eq1PtMzSlkrVq2D1i2oYRyAjHERt7PR2fO9NHeBU7AK2D56/wJgyLX3mobk0XsKgWHPNC2+3ujBB1bZS850ypeOdww7Cw6Ao52Bshov+PSK9qeKDHYgMr095stq67YjzbbMHHFConpK/UB/llIbHqzIVaGYr6QlzivbGPj33xmR5O6j/ORRVTo0J1nQR0ChLxbXXvVmFgnBnIn2vf0yvLQegSfgQCj2HT9PPSW1YuomFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNOlaoUnvicRXQ1nikqc4zkOwq+tp54rD2aR9rXPCS8=;
 b=FDJms4USToD9fIXo9fRtKtZUn7Bul/pfFZ7RZfgYu5rk+aFfr2ZmQtiWzzJ1CgC2BEdQzcNPo3S7kbkRp0cgSqKfVr3t1GbDCkl21P97XLAbUABi/bNkg9SWZci2C9MeZhLBQCqXepCjeqQ74cHPAXWSA2j+4pGXd2L1ihXBz2n5cP2QFK6u7OhKV+Bi099if9rpF37rCGjM6P5B9RUptw5A+7ClHhaXZUMsYLjMZ1Ql28P6+MXgY7aIa4qRin8TjUVCNnT5o3nsOV92oN3GQ/vL1y824T85oam8IEzRIOg+AJkRz+MoUWQntWhqF3rcvwDFNLmzfb3a4Rlt5m/ZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Thu, 12 Sep
 2024 05:58:16 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 05:58:15 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Thread-Topic: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Thread-Index: AQHa9yiX1WIaZntDd0WV1ZDczIe42LJGF08AgA2rrnA=
Date: Thu, 12 Sep 2024 05:58:15 +0000
Message-ID: <CY8PR11MB688982EECBB7B8B290088320DA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-4-kunal1.joshi@intel.com>
 <ZtcLDMfaefI28u2d@ideak-desk.fi.intel.com>
In-Reply-To: <ZtcLDMfaefI28u2d@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|MW3PR11MB4649:EE_
x-ms-office365-filtering-correlation-id: 5bcac82b-78e3-427d-b273-08dcd2efe49e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?B0OykqxnPKi0xUdPmcXJWNvo1k7dq+ZhJWQtLztVxP8GcVrecmmjsd2gw8K9?=
 =?us-ascii?Q?ExAIKAo6Sb4VljfFNlZ46fKCT/D7qCGZxT7DeifCmgJeOJPrEmZQQ+o3hy18?=
 =?us-ascii?Q?h44BKalRJBblSsKF+w0HBLwy/ZGUVH97dAbBYSvvz45FC/QP5576N8S0qnwf?=
 =?us-ascii?Q?JlRL9I/l7ncPxU0S8i3tUTRlmDH5SX4yOmYuYQ8vj0KBdRlH01YBS8X/dhTm?=
 =?us-ascii?Q?mYADQ/uVYOoyf2jn0f0yJvGL73fo4EsVth0ffUXYwp9JnmuSmOl4Kv0rpSw2?=
 =?us-ascii?Q?pXAnVyEblCVBOHV03YYIfMBC76etX/YIN2s1s4+rU4bhE7QCOQVLfibVNnKN?=
 =?us-ascii?Q?O9ruwqGvnWC/qQ1/m6A6HZYr7zobbrOhoP8F7fjlS+u5tD55Iq2brfdFbVn5?=
 =?us-ascii?Q?u5LAGwzeE0JEf3YRPk+1EmnC54vZ/bafWWmA776/K52IXRQ30Rgc3sCEX+kk?=
 =?us-ascii?Q?eZipaOjs2F08vrB5FzUdaD6Zex7VQx+L8NjMbHUug7N2smq+tySHQ8nCvcwE?=
 =?us-ascii?Q?5xB+HdHSZp32B8N9vjEFu3/h/NiKdcgAULuiKKGaP7AYa2c9zXVA/AW1MPnE?=
 =?us-ascii?Q?LexQema20dMmZurwLgBsWw2PmHH7VsylSTXqz9oN/N9YL6E7ZGriOlevtS4W?=
 =?us-ascii?Q?LPdj96SIqisUmLNHu3lG6qQkSDyWZKnLM2TJMszCMkez983P1KCBt9WXqLYT?=
 =?us-ascii?Q?rH5hFlraGXu/q5aa3usUqSCG7Kn3x+1TNMb/9219En7AA1w29zj5ZHPKvBjS?=
 =?us-ascii?Q?Cr951SWHixycDycRXE2wpE9Ut5Iq4rdzMCcpmz+bz62kPrCXXZzg+kGk408X?=
 =?us-ascii?Q?sUhYVmACJWgC2tumo6CbmDVYcAh/LSXEXTDPlDuXO+3aYI7gzKEDcHD6uZbC?=
 =?us-ascii?Q?PGuI3NuKGJsQDj+l94usMFoWpOQDHTDsXhP8iXzNnGxhiKwa1ji/JOehp6I7?=
 =?us-ascii?Q?B5ouRqb/1e297VVXTxdZxw/TwYsB+qUKquvzFmtkr5rdtnOW2JOiFcVXuW2Z?=
 =?us-ascii?Q?HmmPFrGS0KX+ZdISlR0hxCIHp14U3MFjKV/efHe8vv82GKclwDM00lY/NbPl?=
 =?us-ascii?Q?eorfoGRVsWNl9802xBYKWBZtd18vPdz/GTEwCwjyZyZZS+Ik0RkHuQ+fHdjy?=
 =?us-ascii?Q?3g7HVnKArMFigHSQnkJ+X8Ez7qnI9YxTkFKTKN0eQmhznVI9acelx134Kg+J?=
 =?us-ascii?Q?OAfDwJwaFOnBhav/FW3sMnYVVIpetItDekIseafMNABZsO4Ylx1iAfvl+ToV?=
 =?us-ascii?Q?dZ35LDuNBYgcmWdVv4ujvjYS+UWRpRg41CyNoyUHEEfOOA5ffYyekCZ12+Bd?=
 =?us-ascii?Q?Xm4HESj3dH4BdNGjymi4Rmj69yqX5NmXOfhtJT8IeVeNR97gpBnRtfu/xLws?=
 =?us-ascii?Q?ddeeeXtyDeAnvpmPCY+u6fMWZFivOc9X6Vp6RmW4KF1XH+w6Aw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2+2/KyOHt+4ph9dNWufU1hORbFlb2Cljk9kzBe9J6FDaeUI8Mxkjn5Bmu0mA?=
 =?us-ascii?Q?S9Va8oIpcktz2YLj0rrdiBgBDAwy7zCSLQGD20C/op6pYKoFVC0VzaBiSLRF?=
 =?us-ascii?Q?lRf6fIWQey+SCZcYVEXgCQ649k9K8V3OBJpmdNH7uVuZojDXh4bTQla9YIhH?=
 =?us-ascii?Q?6JkRh2hbw7Y9BcNbKSVv9/3G2j9wdkfQ1wGTDEy8UIa412fl/iFerh+kx30n?=
 =?us-ascii?Q?gDQZBcUOG9EArU3pPF+eFBcQYv0wmHiWsh3KncOUFykszhn8UP5I7I+5LUd4?=
 =?us-ascii?Q?Jzbu/UreR3M42gejRJJClzB5nc/cmgitoWVc1xqDxZvzvjiQjaafbMl1Pjng?=
 =?us-ascii?Q?T0kKP5AKS3ir8w/+PLJx8TjsX18CV7rMUCwJTrSg70ZuyJ/fl34LKxKuP3FP?=
 =?us-ascii?Q?mQg3aTmhVFaAE+StSongskh8jwIWjs3FYiKqjOLqdtI0PzRkbT0xO/lEBl2w?=
 =?us-ascii?Q?qAv0WqxoLaiau3IQxkk2wYSs8zd/2JTpXW1F+yaOjEeQ5OmDqR42r/2FC8PK?=
 =?us-ascii?Q?4tlxMxsNy+nr3TaAHAUvWeFYnefWg7iGOLfUESwwklUxCPct+X4fvktJm11c?=
 =?us-ascii?Q?YLWSxjuV7WZhX2K+OOTQ9EISgXEdcf9xtHW8DUIqOGgtslTHf8xNJMqioCgu?=
 =?us-ascii?Q?MCqTM0o3ElpGi+LMNFUkgyhgBhyHj7ilGipoBvqhwG7DVTn5h0dwY22dLsri?=
 =?us-ascii?Q?K/KvHN9RJiNRut+6cEK83TinRcrf6cEVAWjxlnf2F1X3z9ui0a8ft65Zci4u?=
 =?us-ascii?Q?OZChq/jJnFOPg7LiETVDigHXqdztuz/rJtFWD2FJuORU/A3RU1GzACOfOc3F?=
 =?us-ascii?Q?xzkAEmy9jbS4tiBDaBhHScOR3ZEt/oiukYVej5tjuxwgrn0FZeKOkhanTl5e?=
 =?us-ascii?Q?HuP3gQnFMkdEQkcqC6P/eRVS7m63+Q1mmp1FpS56weUD2dBJRyAkh1zA1Sbb?=
 =?us-ascii?Q?S2udffTd/2jP4uZ3aEWkg/V+g1PSL7/PFiFEdgge/RBeLGetdkefPBlH4BMc?=
 =?us-ascii?Q?sMnhEcCQuoAWOPxvRRL4j7Qym4Oi4bBl6NbYvrj0lSzN6kVQSas/Vhgoou2q?=
 =?us-ascii?Q?7vMq/TCUDYHCWFsWwLAljzrmVw/MXzUYXY2HdcumJE/T9ApgBx+lAD1rZA4+?=
 =?us-ascii?Q?V4DrUmceNgK72akRmGOmnjPAO/2WopqgJ2Cw1t73g8ERRCkwbz+tf2jXZ4eP?=
 =?us-ascii?Q?qqZTrYgq3wj5Zt4Qv4o9rd/DSWErGlCxOBvdH8rNqjFlRzr9iXH44fJasMIf?=
 =?us-ascii?Q?qxh3noo1/alCZR+tlWD5RmchNE5GLbtYgP/wLbJrKWopOyx/ab0fMBM+oAmi?=
 =?us-ascii?Q?8Gcp2B6iz9YBj+SUPIk49NqiptmgRLf6xIpZQl+49iYQ/kBjYiDBLA+Xe5St?=
 =?us-ascii?Q?aAEXDkQseoSs/H5HctOY1wt78pisT1lbgktZL47wWgDw3r7xDIpuaR/wAcNn?=
 =?us-ascii?Q?eqlXVHTLKGAR0p2m7vshppGDkam/qCl9MM4iOynNxdmrHgBnACwoQY5Zo74L?=
 =?us-ascii?Q?orqZc99Yl+UQ4c1JT43TdNd/BSXdgJzrwRwMikfUfFvqtoDQZA0Uui274r+D?=
 =?us-ascii?Q?JQApfsHX6Zi8Epy2+cEUrKVfy3ca7UMUK0cqwcgF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcac82b-78e3-427d-b273-08dcd2efe49e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 05:58:15.3885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Ed4JuOfG14TQ9JXKaF+9SYhVEcTUjBg4fJCuZR7Dm6CvAwNxE20UPV1nfdys3mPqeHgaBN6bgdK4jHlpkUeBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

Hello Imre,

-----Original Message-----
From: Deak, Imre <imre.deak@intel.com>=20
Sent: Tuesday, September 3, 2024 6:42 PM
To: Joshi, Kunal1 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link =
rate/lane count

On Mon, Aug 26, 2024 at 01:36:01AM +0530, Kunal Joshi wrote:
> i915_dp_max_(lane_count/link_rate) debugfs files expose max link=20
> rate/lane count for connector.add function to get max link rate/lane=20
> lane count for connector
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 58=20
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 60 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 4ef7f4d7f..21ea8550c=20
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6763,3 +6763,61 @@ enum dp_lane_count=20
> igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
> =20
>  	return lane_count;
>  }
> +
> +/**
> + * igt_get_dp_max_link_rate:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + *
> + * Get the max link rate supported by the sink.
> + *
> + * Returns: Max link rate supported by the sink.
> + */
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t=20
> +*output) {
> +	char buf[512];
> +	int dir, res;
> +	int max_link_rate;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_DIRECTORY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_max_link_rate",
> +								  buf, sizeof(buf));
> +	close(dir);
> +	igt_require_f(res > 0, "Couldn't read i915_dp_max_link_rate");
> +
> +	igt_assert(sscanf(buf, "%d", &max_link_rate) =3D=3D 1);
> +
> +	return max_link_rate;
> +}

The comments from the previous patch apply here too. This makes me wonder i=
f it'd make more sense to add all these DP link training debugfs entries fr=
om one patch.
---------------------------------------------------------------------------=
-------------------
Ok sure let me combine all in 1

Thanks and Regards
Kunal Joshi
> +
> +/**
> + * igt_get_dp_max_lane_count:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + *
> + * Get the max lane count supported by the sink.
> + *
> + * Returns: Max lane count supported by the sink.
> + */
> +enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t=20
> +*output) {
> +	char buf[512];
> +	int dir, res;
> +	int max_lane_count;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_max_lane_count",
> +								  buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	igt_assert(sscanf(buf, "%d", &max_lane_count) =3D=3D 1);
> +
> +	return max_lane_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 9d42a2b35..1d3226c5c=20
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1249,5 +1249,7 @@ int igt_get_dp_mst_connector_id(igt_output_t=20
> *output);  int get_num_scalers(igt_display_t *display, enum pipe=20
> pipe);  enum dp_link_rate igt_get_dp_link_rate_set_for_output(int=20
> drm_fd, igt_output_t *output);  enum dp_lane_count=20
> igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t=20
> *output);
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t=20
> +*output); enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd,=20
> +igt_output_t *output);
> =20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1
>=20
