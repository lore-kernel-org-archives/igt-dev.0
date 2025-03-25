Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E25C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 09:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C69210E2CD;
	Tue, 25 Mar 2025 09:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apftEinI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764310E2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742895565; x=1774431565;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vywsrhoX7uRe+I3Cjg4Pw4sWFcJLE/ahMTKyQXQtZUA=;
 b=apftEinIDL7ucOR+/wYcvbUodr/c7keALBDS2oJYoLVCctqnSAHh0x5D
 7tlhJK6Invwk9MB4IM+Cn8ntFwh2oNBDTp6S+PjBEukl3DqoPNCSHWIsg
 /QkZLpNleM4H3sZkhIuK7bBSI2ZPZjGRtPi7KGG8V4w2Gz4WLudFru7ue
 7koaDk6fQ0Zxu0RsNTl9qHM1jo30I704Vsg7Vx+0B7wvblcHLVk/pX5QL
 8tkNYCjQrtuHg+XSjCnoCmOXEuytPeyeBA/vKTLDcJYbQQpBzQxrUH7M7
 3r7L2mtNTsGtyarJvXqr+d5Ac30WKloVJ9h1SNjN+le2UAXeVLN0w9FbU Q==;
X-CSE-ConnectionGUID: cJt3u5W9R+W2eTQGIFhNTA==
X-CSE-MsgGUID: +32dGSzESoylGykvvzle4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55512323"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="55512323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:39:25 -0700
X-CSE-ConnectionGUID: 9a2v9h+bS/+AiBF9CzJw/Q==
X-CSE-MsgGUID: OWS3F3i0QlWTw2WVZZnbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="128479147"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:39:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 02:39:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:39:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:39:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8nN1KyVij8p9ZV1D7C8fgLbNVmK5GsGHMn9gZBukmd1OxDAkvMVRNm3a/rXa2HQdUszGd8WbYw4tYYv0mreqXsGIU+Q2ap4nwZ/+LB6aByluxV1iL6sF0Nt1KSGUJsZ1U3HQh/nNdDeEvz1/jCdWx49KD0ShOcAJLzgez0m+vg/RV669yrDFfZEmR43F59HRuCpTYUOP3cKOXB6XDNLVO6hB7Ip3mNvzmRgJz8jT5a1nHE0Wt+htoj+zCaoW6d7gQTKZlnWoQly/G6NaN6uw8IRLY+YfM3/T5yNVUAADtfI+s/PI81kWkV6a3yj19f/R3EEdgsOxwkVdgx6ERUY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIckilth39MFM89xRRJ8WYC05ErKmYSR66MI7gA/Vyk=;
 b=XnMEhtUGxXHd5jfjJ8xLqInuCwohxstKgztUKBO3JOba1W6GD4y6o8TQrj7MnJa1Qe0s+9bMyGoi3LUxQWy2uG9gsorCIlZ3WPHLMVLW/nbp2RG5JmDDenxdp0ZRvvA7UOOZYW+7e6zk6ebHl3i6PiRi/33GqIsovTNdVWWyAGFwt8bfQfPLyyjK8ypjDrIGkHgTxv3b8ozngsAXPUBMqKpy7N+mN8zB3hKNmBIXzM/+e33R44smOOtID6oF4C6Hub7FUqBBPCvqIV8YeTcG9HnUYIYEMiCVo+A8RHqw8iNvySUUDscF2bHqoauXOPcya+uvgUTzrrm9XkXOfg5NCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:39:22 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:39:21 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
Thread-Topic: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip
 subtest
Thread-Index: AQHbnNh7QnSI50/Eh0CSMEqfwzhtvrODkwRg
Date: Tue, 25 Mar 2025 09:39:21 +0000
Message-ID: <SJ1PR11MB61291F7642B213E82128C89CB9A72@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8033:EE_
x-ms-office365-filtering-correlation-id: 24fff6db-06a9-45fe-0a14-08dd6b80ec20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dshAHq29aZpVJEKA7TUq44ia30YsvC81y3PkaNVddeByCwqxojAdFQrhulpY?=
 =?us-ascii?Q?i3cy/LpO7wmByhzVbrCTGKT+D3cI8M2rrtPDmicOGWAwy/2aenv68Q7YBXzR?=
 =?us-ascii?Q?mko+wJZupQO5DYWceTR1yPlz8Sem35Ypu5yMepEPTtVVj01Yd9wPyOXCD8oy?=
 =?us-ascii?Q?EFs5llKtLSiKiBZxU3kdi15W73teUX6v/UExg2Th8/ccLucIDotsIvQA9SFZ?=
 =?us-ascii?Q?r0Yh/exMKjXmD9GZiM2sQRSJ+qwN5BLw9LBaL1kfyl47ILWYBPkJ1CxYgjAG?=
 =?us-ascii?Q?4RWkmBXytlRwAWwYcbMLTN1OqOm98Io8SISj+nHhoLGzFktaA9sI5BYPC656?=
 =?us-ascii?Q?N2BSL4yfyAjtt98jzkP1TlS7rVQeval3dnDPBnvddK/daTwmiRm9Q4nFmCNU?=
 =?us-ascii?Q?q8SwFFzDkkHeB9I9bqDSTCklh5F+bHu0TP0S7klSZibTeRn5XGsfINoPVGH7?=
 =?us-ascii?Q?uthBMDJZwrevDLiqzdDQ58TpludfO5Qi7BqAi6e45tF+HY9utuxFlGt00YGF?=
 =?us-ascii?Q?G+WqOO7w/pfPxpU0LoZjSDBaj2RzF6ytz/EsoFcvRcRq8j4x6GDhfYOhK1wJ?=
 =?us-ascii?Q?8jSSSH6BYQUaCIXgezkfQkV5b7PyVJRNaNMkuCZBT7tVq1H6fZ6XG+V/bfR+?=
 =?us-ascii?Q?fxG+JkKmbfRVwKEtSfRR9Nv/kuAuILsgMf98h5fYgIG8KnuDWOFynYLlhxYY?=
 =?us-ascii?Q?amPNj5Rp2HGzTV1xmt8QhR38Q2G6NjEaEhfUbctXLi3WFto+En+C+8gfBuc0?=
 =?us-ascii?Q?n7zpfKsDO9UdxNjqW+p1KMTBa1w4ruYym+dNFdf8ipeKHvKZBzUTFKXl2pbv?=
 =?us-ascii?Q?NMifbI3B9JAwJ3TvCVaq9hEEc3wxXoX8+gLVwEFrhzCTmYaxn8B+nmdV4jVz?=
 =?us-ascii?Q?ECx/W2VkFwYqaGQgUvzKXC9VPCy1n9Qo0Jqssa0aD/FpcxLoJE5wEkhOBCH4?=
 =?us-ascii?Q?vmQ2b7KXUMnMT+AkVQulouG2pOC80uUdR1ypP+5nkg8wjd9V0vr/4eFBlODc?=
 =?us-ascii?Q?TFEJhKkyI3T3bkaQyMoknwKwOD5zSESi1TzCExhnnzPxDD4+1yJjLquTpkCK?=
 =?us-ascii?Q?UZjFBLV3Amvo2dC6M7Wln46PSzDUpn5y1dEZC3NiBRltX8JuI4fdgS0ODdfy?=
 =?us-ascii?Q?+HgV8fv6aYwkNBFOi/Qf3h54KBFeCe5Es6atHPiRKELVCJckZxhWtwok60jq?=
 =?us-ascii?Q?pwZv8gE8nCpcNBoOxRb4alcJnVZxKbtvqM6m9GkMp0owzCoeUvfvj8J6LvHt?=
 =?us-ascii?Q?QkR7fkSoPVtsMpcJNKu+oWY0XRvRsuHmnjpSa0ZOx5qsBqoqMqFeMrZgqcET?=
 =?us-ascii?Q?RSsoyUp1/kFR9wR33a2H5n2Ysuq4PxBFuUbwO5XixtX/vKtKic4TIFCaUEx+?=
 =?us-ascii?Q?WIPn9p6d+hJztVHqzjq5dlOFIiF/PmZb1va+Cn3r9gNbLcoZD54RTXQpT0yX?=
 =?us-ascii?Q?Wsi/b1BqVJKqoWo0mVb3xrgbK11M51nc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IeXYCAJXxMW6/ZLEe5/RMedxs8UvM8FsqiYX7hhssfrC2fAl0oOzF/tlecSy?=
 =?us-ascii?Q?rvW0Z40WkyJ7nP/XxeVFGR29/GKr/3t1LTExlonKWbMFQA2IjS1AxU6eVNub?=
 =?us-ascii?Q?rYu0OG2yV2CFMl+Bin/H8keyDf/kq6X7Jd+1EF6lRdQjU7D5gvivuefsdwz8?=
 =?us-ascii?Q?4xhmW2tVpgahlPTKSkiAwEBEToJ0e0y017wdkQFRwaKzh3wGaiTABEeNrWsC?=
 =?us-ascii?Q?tRN4lw9bIfbZ0BJGaegtOOCej/FyeC6sJtzVRyE1KKmmaxTpkdzotenlo0qb?=
 =?us-ascii?Q?GJChqpnsDHXnS3ioHly2hysTM5ULU30ImWSJ9RKFkbLVsDzEkGRx5q3qg+9k?=
 =?us-ascii?Q?TbjyZUl2CiBhisNxuT+HmmheJL/vlkauYNSXHhIwAKBEibHoDA09T346rIqp?=
 =?us-ascii?Q?IEZ5Fb6TXu1vhqh1z/M4aduro2TULsaGqneG0EwRIKnIYsXIQbu4xvE1IFdj?=
 =?us-ascii?Q?hGtvT8WNDXBtDLJM4H2DVAsvkxDjuY3akDPolOjNdBIE29tMh4m4a8Y/39H0?=
 =?us-ascii?Q?Dt7ad3RIlA4+abGfyKynULmMgLGLBc8ZDTb1Nm+5TBX2DQzOn79uiISl54yF?=
 =?us-ascii?Q?3eSD4WwUw/MXiow1vunAbJNt5eeIPcHhSiz7j7nCrrD3etr4V4FlYhver5ez?=
 =?us-ascii?Q?3cKX0YI/wJOzu5Y8JUWZBrdlZZ1dKLNMYFjHQ25uQoUonadSmo/yRCDmaCLD?=
 =?us-ascii?Q?LMUe8BSMTgTqaQ7yl0WVA3gSyJPzN5pJmlaAwvf/ZAMaaaxlxAF3FKQfAWXk?=
 =?us-ascii?Q?3yoWJZhrFlnNpgE9azdw5sUQ0V9nfHtwN5VdJx3WGLq/NDypBETls5HbuPt6?=
 =?us-ascii?Q?xiG5K/ezsEXGICFb8qMLlVTXgLf4kcJb3YWnDDGFnlrWLWDFN2qH6Hvdhxqr?=
 =?us-ascii?Q?7aZ1nxdI7/Y52x6gM1g7GEOtf9FQV7C+d97pNboURUQiW1S55twW412eYqbn?=
 =?us-ascii?Q?w1xgX0Ol9OGSSdmU6ZPdc2WS/VozkkDL0uyZfgqyTsGO+s9IdA9FvgPQdcF9?=
 =?us-ascii?Q?V+vDX9xvnEQqAwZGht1q+niJuGWOeNlmSuPF91EYASel8ltY4atLPAMdCpyW?=
 =?us-ascii?Q?GKDS/MoQ0yfA1yMT2SRVn877G3MOhc7sZWp1OPrnwEJmFTp2Cwqy4uECL20z?=
 =?us-ascii?Q?MO2UIJPICGL8WFGrtJ+URollVY401Co9ycxxE/LfhPamuyz/1xVy3960I6gG?=
 =?us-ascii?Q?DxHlCs1c5fJrYS277lS1OcaZrCPrFjOSdZU4QAnow3aj8+aModV0uaWE191f?=
 =?us-ascii?Q?7VyDbGqbDhcfXJzJ0jmE5vGF8QdsPILbZvfORb/akucmBR6JhR+fksj1DrEl?=
 =?us-ascii?Q?gLbWxEYPcKxNNvquZUske8UvGnkbEcVgGFYPysjbZTU82oi3/Xy1hclxu2/A?=
 =?us-ascii?Q?VkncQr5gK/VLqngpkCCecvqBkYWj1RiasizHBzDyeus28KCFQm5zeNAgIkH5?=
 =?us-ascii?Q?EhewWjVZHEP190514gj11HeRG18Av+QTEaWVPRDQn+TnPDZXEfOzmmEflQ1h?=
 =?us-ascii?Q?zTyE3HmbnpGxWFVNUkgxz7li1s3lJFzKRA4v0vAfGEnrOuGPbWECvzFR+XpK?=
 =?us-ascii?Q?ZnEE6NrCz01c2jVPg4yyYi5t+R99StYNHgOAR4Gx2ts0r5hDADyqolzZBWgi?=
 =?us-ascii?Q?4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fff6db-06a9-45fe-0a14-08dd6b80ec20
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:39:21.7901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hSdjRneFI1irYj0mXlHqfX+fhC3fyYMHfgCyggj2EfiA4ktQrA9265mpabARXZJgpR4nV11t9/dgu33fcVOsDh0bSxWdyrq5jyb7OhzTK7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
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
> Sent: Monday, March 24, 2025 9:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subte=
st
>=20
> Add a new subtest to verify async flips does not cause PSR exit.
> Enable PSR and execute async flips to verify system remains in PSR mode a=
fter
> async flips.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> da426f753..cf6b63b3e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -85,6 +85,9 @@
>   *
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and res=
ume
> cycle
> + *
> + * SUBTEST: psr-async-flip
> + * Description: Verify that async flips do not cause PSR exit
>   */
>=20
>  #define CURSOR_POS 128
> @@ -102,6 +105,7 @@ IGT_TEST_DESCRIPTION("Test asynchronous page
> flips.");
>=20
>  typedef struct {
>  	int drm_fd;
> +	int debugfs_fd;
>  	uint32_t crtc_id;
>  	uint32_t refresh_rate;
>  	struct igt_fb bufs[NUM_FBS];
> @@ -740,6 +744,33 @@ static void run_test_with_modifiers(data_t *data,
> void (*test)(data_t *))
>  	}
>  }
>=20
> +static bool psr_wait_entry_if_enabled(data_t *data) {
> +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, PSR_MODE_1),
> +		      "enable_psr modparam doesn't allow PSR mode 1\n");
> +
> +	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data-
> >output); }
> +
> +static void test_psr_async_flip(data_t *data) {
> +	if (!psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> data->output))
> +		igt_skip("PSR mode 1 is not supported on this output\n");
> +
> +	psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
> +	igt_display_commit(&data->display);

Why only PSR_MODE_1?

> +
> +	/* Confirm PSR entry before starting async flips */
> +	igt_assert_f(psr_wait_entry_if_enabled(data),
> +			 "PSR is not enabled before async flip test\n");
> +
> +	test_async_flip(data);

This will still do the performance check

        if (!data->alternate_sync_async) {
                fps =3D frame * 1000 / RUN_TIME;
                igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS=
_PER_FRAME),
                             "FPS should be significantly higher than the r=
efresh rate\n");
        }

I think there is no harm in it but something to be aware of.

Regards

Chaitanya

> +
> +	/* Confirm PSR is still active after async flips */
> +	igt_assert_f(psr_wait_entry_if_enabled(data),
> +			 "PSR is not enabled after async flip test\n"); }
> +
>  static data_t data;
>=20
>  igt_main
> @@ -748,6 +779,7 @@ igt_main
>=20
>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
> @@ -896,6 +928,12 @@ igt_main
>  		run_test(&data, test_async_flip);
>  	}
>=20
> +	igt_describe("Verify that async flips do not cause PSR exit");
> +	igt_subtest_with_dynamic("psr-async-flip") {
> +		data.atomic_path =3D false;
> +		run_test(&data, test_psr_async_flip);
> +	}
> +
>  	igt_fixture {
>  		for (i =3D 0; i < NUM_FBS; i++)
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> --
> 2.34.1

