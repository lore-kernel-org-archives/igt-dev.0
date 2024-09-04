Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46666CA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 03:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F179B10E321;
	Wed,  4 Sep 2024 03:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQylo6iL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F7210E321
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 03:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725422374; x=1756958374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3/Tq83SC+Nr7QKP18tBplv3xa/FpQHGS1He9muH/oTA=;
 b=lQylo6iLoZDC0yxxCeYmTYUaEhEzRHAJ0Nucg1CGpy9akVUuQEWR49Ux
 PyfPGiS7uRz4eQHrSdVEFAdyt7nGqqh12Ff6Rj9dCWv76I/drhkWpwc6F
 WLYvGC7zqxM5FHS3eSfsXFGIfhm71oGdZhR34IlBslULeujAHInts0+JQ
 PZgWGDHFSt+hoUguD80rSb+F9Y+cQAtYevQweDyj3X6Z66gyN3c/ftDEu
 qUHUztZTRG4olVu3epNJAxW89A6UDlnZxq0gtkTmWTd80y6VB9C8rnBh9
 l5NIaZlbQgQuXJmVUKDsD1q5iZCkpsnDO4/DPJXmoOalrBProlf4lSkhD g==;
X-CSE-ConnectionGUID: xq6YN7skRt+mwtzDi6auMA==
X-CSE-MsgGUID: AqJCy2FbSySZxrHeUMdWNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24192502"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="24192502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 20:59:22 -0700
X-CSE-ConnectionGUID: vW2/wBDjSraMwyRoi0MyiA==
X-CSE-MsgGUID: bbRDVE2mTbSnmqNvZGC7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="64809576"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 20:59:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 20:59:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 20:59:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 20:59:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 20:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8APGoFoeFR1gssO3QTAoNDt3fkqPjtfyVsHFJbpqUHLI28RF4WFDjEEH1zt6ozb3yIDt+dxOBfrFvk93WNBTY5DyraUt0QeuIWvFgXRDt90Zn+Z1NWZU0xFbvTye8pQXvJntC0S/9KmRi++T8p/QGGLJgqGdzlqPn/HUJ/tLuC2K85zENPh+WSFvrTfdJcLhxQRD25oBaCAD3ivSd0LaOD5VjJHizBFOE7vbNiSdGCZAWEN6l8agrDSzSmD/WFSROibv+Zpyg27bqnkpbGbCFsA5hy/q6OquO2HssU7nOfF0ZYCo+IN80j+ErcRFcT9RpyKUaxgUPXMll+RL+wmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXf3jrUph2lG5lEFaWM+52NKSrmPDWKcGhtUdTeiqcc=;
 b=undEFr5Dcr7QXDAIW8beXuA7CX0UT7wtkM/mTw6yRX11eLYBotSdICyDIl7S+SadHwsZxGUZbpq1MJO4Yonrw2lUs1ZZhwJOYqdklC9UwG4F6R7Cuso/a4pOCJ8a1WJPnA34pidxcfDird3xe8Xzzeig45M5QCh6sgf4WqhGhZlA92811/PjwYi9qi6RY9SuH9dNtLOu+mydMoasIs5Kdhpq4EG4pUy/lNJH/1cAtpYVcanQhGz+f6mYgFrJe+BE/HcY6EoRREzGnUuFEX7gr3m1rUO9eV1s82KFtx9gKhzirqsk/GNKTyVG7PXAp/dYOGHkhLq+WxFtjL/f6cPojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 03:59:18 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 03:59:17 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Thread-Topic: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Thread-Index: AQHa9xkARTOp8TRuY0+5PeE0qBmjYbJHDW+g
Date: Wed, 4 Sep 2024 03:59:17 +0000
Message-ID: <PH7PR11MB60537E70F2E4645FE35BDE3AE79C2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
 <20240825181424.4034541-4-kunal1.joshi@intel.com>
In-Reply-To: <20240825181424.4034541-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB7350:EE_
x-ms-office365-filtering-correlation-id: 99aa859b-e5cb-40c2-3cd9-08dccc95f2ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DXcM0/Cc0HN5u/HwTdsWz3IvTpCEjcJnDk7NHMmuxYGLk1M+tVqrUyIqIAYQ?=
 =?us-ascii?Q?l0uqkriFoMJWSJwG1tQ6+EMaZhyzq3hKf6M6pJ6rQCQL+ou2kVR1IlahGzO4?=
 =?us-ascii?Q?+RMrisR6SUFPW8tS5X/5GBHhKFmQt1s0w3acWuAHUjTimbR7xFfXK3zyh3iA?=
 =?us-ascii?Q?SBy4cM+BaBozbY/DajROouGnjWNl2a9iGSg3m1YLh7iLE/8j/ghNwNJaWSn7?=
 =?us-ascii?Q?c6FJBS1toD5y1Yc6C5sp/rjTLPPMJcxvocQ8hhKy73h3PA35X9dRweGHg4nR?=
 =?us-ascii?Q?703Dr4fdZE6oH8AHT0GsZV0Q7fclJW0Yvu5ZcyltcLfVsISJseEDRoPq60oR?=
 =?us-ascii?Q?bUn//pFZMVZpqzCDug7RqaRnA44ft2sI/ryWCpph6n1yHxvQW2EAgYVf07Is?=
 =?us-ascii?Q?tlhck4Jx0XgjA1we9BG2BVttxCAtrrLrQKCiTafp6cz5Dv6+lH6T60mYbJif?=
 =?us-ascii?Q?bPEE9ZKBmYx4odNxG+7d0D971/WiGw2rfJj1NEvpZnnNgOY8tUdrTdwjVik9?=
 =?us-ascii?Q?j04mwP3ATh2hxt3ffwXGG01Lw3mb3TjqahSmxnEU8AQqJwCFUlJX31/anfdz?=
 =?us-ascii?Q?RhXAmndnuo5zIJqhdnkih5U+OZ1YUj/bYVDvDtL1HcKoM1bWhlTbiCQ1BsKa?=
 =?us-ascii?Q?QE29iXW2rbhqpL/sGwSVLYr1HttisMYF4cbv69k1ZaB0VZ1WlN/B9IqTkhCg?=
 =?us-ascii?Q?NAATxZBSNoMaidAGX9y5TpV7nx+EM8G60R9DMdLNFXRhQE++4cI9UZREFnWp?=
 =?us-ascii?Q?+cwD2rB8KdGspIO6KYiKv1Ak6USvxEG+WejPG31LjCyZD+qAd1DCE4n98+Og?=
 =?us-ascii?Q?+1Fov0IShzgAcABZdUhSjVxdHR28s8f7R3wzcrAKZsy23qwQ4wjHhn7Xyook?=
 =?us-ascii?Q?zBrM2ymmz+r1/c2T3F5XzXJepg5LlmQeq7QIc/MFohVBVa3eTtFGNO2f2i4Q?=
 =?us-ascii?Q?Mttx7K8mGZIAw3y8xp7XOex/40aoZRX7MHMxPN0aHkKY6ZcMGHPcP/P1cmhr?=
 =?us-ascii?Q?XFUG+gre6ML2YgAu99eK+Q/lGomT2MteeWLlvDApXuLDKGNJVMcQSeuccFQ7?=
 =?us-ascii?Q?kwCJ/2TqUP4t8r/IXyFVny4qpZrGQpUXSjBbcD7Lp1GTp9QnO0l/1nOmpRwQ?=
 =?us-ascii?Q?25Vz1pK8ocueL/0oc9HLKJdEyfWoPg74ib5N9fDWhFVTAEtCXeERXTKBuXfR?=
 =?us-ascii?Q?JHojPR7H10tYMl9My1s7CbL5qGL8as+br1xLeP1fqKuqtR1kBMpMFLhfmkbX?=
 =?us-ascii?Q?4FsgSgHxvaxU3LRf/rSCwtVLETi9D/Nv3sJbRkwyJsrUujS9T94iJc2bFeMn?=
 =?us-ascii?Q?vi5KY2xGJctLP17ULy/xUNPXBjERL/3DCXvc+kkQjMenyt662+YiqtYkG65j?=
 =?us-ascii?Q?l1PJj22tLkr4OHPYIzmJgRmlfwGKyyHFr+PLQCxoa65yAoI4aA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KydA24jFhqNS9r0B7bjMzgp3cbrQ/vLNbIRzRS+wIgcQyfLheCZR9XDkBsVt?=
 =?us-ascii?Q?9zIeAnKxKCVexmwSWlxWwTyWGDi28a2JhwYEvR3dy2SrIsMtpUv5CSx4ubSN?=
 =?us-ascii?Q?2+WvxSP/Uxh8XauUrOAItFuLFOcDTvya1rZTaF92PHLnQi+E4BDs72uPkk9r?=
 =?us-ascii?Q?/Z6oHGLdUAN9Jqy9TWIoqEz8ADyyBfTZsEVv+jy4ia6U5M4rwB0KbFb00U23?=
 =?us-ascii?Q?MFg+sqhKPNheITh5iAUcqwl//oXxnnfNJhY0OoM4ml2KfCM+yit1KMj21KMX?=
 =?us-ascii?Q?h3o1jc9XNu53Xi2EEt8uYKkxPfeyspVRqaFvOFPZqvBZy0Dp/L607/GroKmb?=
 =?us-ascii?Q?UO1wkWvxM5/QqEY+EsYZvtvKouTrK6tYiCudRssaR781ZsJIQDbeCbTN7RfE?=
 =?us-ascii?Q?JKsWtTnw8+Tby/CZTzoIAKnULblnLnPvfsv6Ca25FVd58RcD47dSavNHLsg/?=
 =?us-ascii?Q?PM9IKc0lzwdbE0J9hPZpbqXEiy5vHb5HsLF1Ufn9ToERVJP8Mk6jTGf3Bwgt?=
 =?us-ascii?Q?gek7g2WpCKo0MXvYdueVruLHKi70qSHh+iXoyWfcTqyQ46IMWw+I5rerY6zQ?=
 =?us-ascii?Q?yDpe8i4cUlnMDHSSd92FsI5oXHJ2mntvTYS2S4+NhxJ8B8fbhJZU53jEyie3?=
 =?us-ascii?Q?fGOm2cvZ9TfGkkPfKhfw26IyAJOH6v0s1XQFaVzZKMKrHBhhR1J0+msJuRAZ?=
 =?us-ascii?Q?xyZzQ5RZybZ3HR5pQWO9S92aZviKeEaCoFuG9X77VxKi2ykPRR6ueKgRTewP?=
 =?us-ascii?Q?yKjNpiUq+C+i+maFzLy5rGPilp01yc97BG7m7aDUaYMu7SMUQd1uPC4fuy00?=
 =?us-ascii?Q?ZbSJOZ7EUWRetZ9JwmqWPJxYf5Zo1+Q48PCLy5znlbinAfiyNjqxS9y/0cCS?=
 =?us-ascii?Q?1yE+H3jyobFhtuLAFsyhq94pT02gpx3e++Wg2Bjn+sBnzd6hSPqtQlhomju4?=
 =?us-ascii?Q?y6gmumd75E3hZiAk+MkzoixjVY2LTlS8xf56Lrk2pB3aBW4DD5pKt1CUCzJ9?=
 =?us-ascii?Q?cEiwbyjwdk4Vb8eUfqgWBo78Z80LvKM7JjzP88zpIAYxhx6CCWPRyGJhpxXK?=
 =?us-ascii?Q?eMPzS+44RGQ1ci5BXeppJu5oXyn4/8XB1kUXRASN1DrLo0VHOTcP9DbTGY8v?=
 =?us-ascii?Q?TSGu11Vb+Qu5s+EB1hR+2SiJTWP26RwWEhWkaFV+z02MK6W46bHsdtRgDRTX?=
 =?us-ascii?Q?tj3leH04OivGVqmQnVniOBMCgYgiIAmQ4sJUGMgmiIILiZ3ikJVmQ1uTdeeJ?=
 =?us-ascii?Q?UTVP3tfYh3GxgdrWaGwd4gb2fbQ15k+fxY5wseLfLmX1GcHTBKpXcjV26HWI?=
 =?us-ascii?Q?e6See4lVOKIQn1BF9LSfNATwh0T2Z4/0hmuWpakjrEquGj/t1Tin9pIhiozm?=
 =?us-ascii?Q?LK8va8/SUES8ddk+azbT6KamA8YrCDd6npRf4ldOcODiixo0pNt/ErhUphjA?=
 =?us-ascii?Q?S/sAIgzUotnhY8++4jflipQ1WKM9+TX9lXpYo44hKvNilDeh8Z1pu+PnjQv3?=
 =?us-ascii?Q?p1sZjRy37rakVW4MRV4RMJW/3BtIAQ80MlhXZL46dOdmTvu5Ulea97/uVf8R?=
 =?us-ascii?Q?eqDDK03xJPmavjQ8GThWPRHR2z+PmI7S+6kLV3et?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99aa859b-e5cb-40c2-3cd9-08dccc95f2ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 03:59:17.7504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYbM20+90WQQb2nv/Mk7Zm3tquFCv/rShi0MY+YP2qUZkyl5hiEaIK3GtlDYa9wASiCRCeDmwB0KoTWnrljkKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Sunday, August 25, 2024 11:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link ra=
te/lane
> count
>=20
> i915_dp_max_(lane_count/link_rate) debugfs files expose max link rate/lan=
e
> count for connector.add function to get max link rate/lane lane count for
> connector
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 58
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 60 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 4ef7f4d7f..21ea8550c 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6763,3 +6763,61 @@ enum dp_lane_count
> igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
>=20
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
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t
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

Alignment should match open parenthesis

> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_max_link_rate",
> +								  buf,
> sizeof(buf));

Same as above

> +	close(dir);
> +	igt_require_f(res > 0, "Couldn't read i915_dp_max_link_rate");
> +
> +	igt_assert(sscanf(buf, "%d", &max_link_rate) =3D=3D 1);
> +
> +	return max_link_rate;
> +}
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
> +enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t
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

Same as above

> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_max_lane_count",
> +								  buf,
> sizeof(buf));

Same as above

Regards,
Pranay Samala
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	igt_assert(sscanf(buf, "%d", &max_lane_count) =3D=3D 1);
> +
> +	return max_lane_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 9d42a2b35..1d3226c5c 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1249,5 +1249,7 @@ int igt_get_dp_mst_connector_id(igt_output_t
> *output);  int get_num_scalers(igt_display_t *display, enum pipe pipe);  =
enum
> dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t
> *output);  enum dp_lane_count igt_get_dp_lane_count_set_for_output(int
> drm_fd, igt_output_t *output);
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t
> +*output); enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd,
> +igt_output_t *output);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.43.0

