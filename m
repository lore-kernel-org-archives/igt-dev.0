Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17DCFED3F2
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 18:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8961610E00E;
	Fri, 24 Apr 2026 18:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7IFQORJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC510E00E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777056913; x=1808592913;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ebnp4rHN8dD+5oMZCEfr2rn1MTDr8rk4yeCAGTZBTBE=;
 b=l7IFQORJ7IG9gBEprMry0vfVlkJ3jV9hNS/omDmD+PeEyZSP6wNr7ZB6
 o2XtZBQlNSyBZubiC4ZiFXkNAzLZ3iP38UU0hC9G4gJEz9pXo1X3uFIES
 d23rCrmKnm4PA9nxnenWqKRd7TeHzoSVLewXm+SO/POJmTlguZKS2hqYy
 2A560EuAOCSKiRvpuWuhOd2ADuisYLQS2dF3p4xWX56R4Xl6zGHPn2fdO
 CC1RJHZsJ4n/0yS+Rl5sdtFDI/hbifr1HOnViEosweLW4pKCvQa7WHzDL
 bpQ5t6uViUVnwlDjzN7QKSW8BZRTTHmZbpcrhX8kZGKI2gEiKxhf+pFYh g==;
X-CSE-ConnectionGUID: xiL0oduHTaqqhM1yubAHyw==
X-CSE-MsgGUID: Ttt3UJz+RsCHImSISsK0jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78027324"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="78027324"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 11:55:09 -0700
X-CSE-ConnectionGUID: TAfb3hRaSIiB5d9/1BFyRA==
X-CSE-MsgGUID: crGgDofwRFqHocgJDrK1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="232163190"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 11:55:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 11:55:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 11:55:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 11:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy+nO/lkLNCRvJuY558CFXEGzMg01gpO8EHnMa+90NAErjrw9yie+B4aPu8kcRw0rYEE//Tr64hM/nUvjAaimdVjsBlau06QH+SqWyr+TMVnr6kOx6J9uhYY4lDlnARexfuwUbxwmLnsU6HD8Xj7hnFXVKAYdbONzIKzpVHz9remDwBcly7NFHJviSp0HJHL2wSZW6iOrHCa/QPEnbFfmPE0qZqcxtkzOjTnq5O0cE0S1vymki/G8k4Bh7IP11m+WU0d+lStPe3zP1E4rFLqJOyL34Wk5Sg/0jXwV6pRF+YW65VdenGIcvyLzEqDO+dz+1FGEZ1mLnHSd57Ayk957g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4vwvRq1w7zbOZuXt8Ye972nJcQEGDdRNySXemtKuZE=;
 b=Kqs3RNAwlYi3NYA4u2j//QVMB7bXzBNoz78WPi0Re2vtvH/Jp8jBLj4wNjPIuxlmoBQvOCZ03i/fmCEWCcze/OfW5crYfM7ZFbLL6nKuAwz9oLbr1taDlGGlD8nbE61JZdf66lVjd8ZMWqrQEZZcbVH8pIiZe06LAMjqvXu3qty1n72I92hGQCg9QMn5Qto+KBT1C3XE2ZK/vAwDzAvr7b9l1gFjhqGfAmF7uo4X1WJZYRd2ZOd1k7W8S6BD3d8aja/Ff+r8qJE4l6itzCKwebtgjMxF3jH790FzSNlSCORQZbieU91qhFYjENZatqAUFczVNcY6PiXN92IgqfxwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 18:55:04 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 18:55:04 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 0/2] kms_plane planar-pixel-format-settings
 restructure
Thread-Topic: [PATCH i-g-t 0/2] kms_plane planar-pixel-format-settings
 restructure
Thread-Index: AQHc1A1w5yX3xeI4ikeYKKJAIONqC7Xuj1hQ
Date: Fri, 24 Apr 2026 18:55:04 +0000
Message-ID: <PH7PR11MB8252821A1F9778DD87F8A40B892B2@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|CH3PR11MB7250:EE_
x-ms-office365-filtering-correlation-id: 79460eaa-ffa6-499c-fad8-08dea232ff24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: NywJ4z736eGOqW3HOFKp5gTwUQpD+uJpLg0G061GtoZPrfe/dPfGgXJFV7YajCtSF/OaQkE2FoMThCls7d3IVoIIYZdZbFQJO036gL1cvSPaRp20G3wW7SbbFTY1l+RjLV4mr3uG2GrIqE06LaO36jdLg2MwAnYwXJlLoKW6BNTJt1WEAovJSQYxNb7gYd0uQmz20bjbxl6iXXJyV/4As7HIPqwBbr0NU8GeEJFDxx4Uvu7CFkg1tLXiooboJNndmDwlDYARfHbe5VrEwcFSDylR2RG8O2gQ6GmZLIa70kNEbrTP6AispAAWjs5QYYf1vFi4e05u57bJp56MiUmsv7Ph7FuthI5EMbKZCxj3DP5R73X1UZMGQ9BXWUBXf5fcwCoF7+8oIwTA3VNOacR/Sa4bLcHozNESvl2/SWnSMS1Xq6FRSGoGTNOBSJlT4ih3ikciow1LFS2mVRIIAFc/jng5ueHde93LX+0TO0gB8oaOkB+vwv4/jooiv5OnpzenD0e7uslyprh8O0EPJmyWqYXq/LRr5zpZXsQg0Ht+PSAdBomretIjoMZofWPqrWlrUa2+MrFpY5Z2X6YfYFtOGAurN13oegcjXpwnc6X5grnY/JlkqjgplecRJMMOZvZYJ3MV3XBMFPyQ4OtMvot4HLskmRud4RA3sSsHieXaIlrp0gzBi5Sh9WqR2n4u90gISUd8smioSYHV2LymdYDmR+0CW59RAKAqOlKfKLSBEU8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dmDISaUyzXXpETDg11+mozoHxB0Iwy3SuJ6aEM0BrNv3txVf6XxD5v6Olmmb?=
 =?us-ascii?Q?F5ABX1A72Fxfn/ETtCAu8JcMtMQrAtk5l9pbAO3srEV3lK5Sgy7VOhpa/vsV?=
 =?us-ascii?Q?hMSlZ0O17tGQVpXEwBBot3aCzERMtcFMgb6QhDSCRZpVRfY708cZDnZqCLB5?=
 =?us-ascii?Q?/66DetyvpbAieG2Hwfuy59fuM357LN+JEtCj1vP/J9eaoGdPIVZBrBOl8iX5?=
 =?us-ascii?Q?cj8Vk9JBDRVvlNv8wJnE9AsA02EOaKmCWDq6kWtN4M+sYC+7Hu3XvYnbuSp3?=
 =?us-ascii?Q?o1058Wo7Q2VNKYmSgZKKy6t/eengL0xDgoXAfWXmieKRTr7G7Mnn9RoIK7cl?=
 =?us-ascii?Q?a8jaWfP3SflUVka+uwCxUBmhzwz9itC697aj+QQUWtUsrBrLnfPbrU/VJqKp?=
 =?us-ascii?Q?n6gEkwKXaCOcTKxppGDk2kR0A/MgZirkqEFkrnpQgp8OTic4Tzdxf7mxvujB?=
 =?us-ascii?Q?i62jjdN2Wl3cLP8Rb7AFodL/MtrKBZzGKRkfUxBKgIwN7r5JnNvT4FPSBYg3?=
 =?us-ascii?Q?2kWvp8eG+ci0t36x9gX/AktHKIpX1phJTDOMgkvaKZbEiMSAz946yvXKmzew?=
 =?us-ascii?Q?ejyDnhdzjZhSj9AtL9gK/QqIhZ4+jm2q9B1D6vuodPATj1ccV0laG6/dd7EQ?=
 =?us-ascii?Q?K3dSxXqx3Q3KKJhsJD5Ey0UTyuMgvNJIokJa4XP9Yb8ACTSkv+6Xq0IX0mu/?=
 =?us-ascii?Q?fDOuE20guGh0o7GfNPoAHk0s+CYQ+bnkJ6LikYaTTgcFYuuEk0JmSSsJE3E/?=
 =?us-ascii?Q?+U+k7gJdLD6/+n3cCJ5qa25FEUThYlnayXMDzXNh25uJTXf4nowMq6gsxTBD?=
 =?us-ascii?Q?YTjWqNtyCuRIX71HHF5/Wu3eIjEO+NAhJ7ktk+9aBlxIs/gK9ncgIofUBh5n?=
 =?us-ascii?Q?Gtgf81WRNr53E41S8jTrlNMuOvHHVovY0SInErd4VPexEuHBcaWYMMAioMqY?=
 =?us-ascii?Q?OzL80ShtYyrXh9qVbiqNVX1/wbC48wHtQ+KuWP93Bp3Xa2kzg1+5Q+4Oq5YU?=
 =?us-ascii?Q?Xt3ls6BPomNFk+g6YScCJZzTtUGaSbrNVnAqz2UhYiodLzvWBzruTexneuUO?=
 =?us-ascii?Q?1HFM0R6J73krEUvr1PoKSEFYjGW4t/6KjFS5Hb3gKUu2tJUTlFQ/mBS7fQNR?=
 =?us-ascii?Q?wD/U6e2hcurQ9aDFoadWGTgHGnClY4ZJmP9cAXIbXx4zfZKGZzjC/6mi9Rit?=
 =?us-ascii?Q?vyiYDCCpfel45AzMn6f3eSbzWkMFEKZhhgrQrLO4V2Y0t83rXn4jIuAeWNRn?=
 =?us-ascii?Q?X3VVfQIVmYWmI/2vYBKjtrWnoqKEdhvzxO6mp6jvYLxUROf8+e9pPkP46AfX?=
 =?us-ascii?Q?ke/XNGvkjUMT1B9R3MFF9aynnlH4MtzKLfYPAvyX1JQag0wVSvMM9XrjZKN3?=
 =?us-ascii?Q?1BBc3yUQsVYoPl49wCBfdldG4HRBGadPe8v04C2DWecBhopTsiEHD5vmVY0F?=
 =?us-ascii?Q?gV7xvCPHk7LJcQyuRW4wsyLB8LRJnljOOCIm7rFNCLQ4GBmdT0a5WZaEAwI0?=
 =?us-ascii?Q?1oHUJF0Z6c4VVnpCqEdrAXQwbGCITetMZz1uTlwJzTYkzXYp2K0F+pSE4Etq?=
 =?us-ascii?Q?+pccd3GSeweLQStMszbnK5MAF2Uq+ysg70we/96p/qxEEWZn4ikuq9pMU0gh?=
 =?us-ascii?Q?73/DIh265XiPk9oSMSvaq6UfWHKgcLUqgQSa+8PZOeBP/F0m98EtES3TUOZ3?=
 =?us-ascii?Q?d8lQNIq/ApmVR13ijUdZ2Qcmk0KWn50wvSU9ibcggrICqdIfvp8wOIP5/RGp?=
 =?us-ascii?Q?QAexuJmF5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Mwi+nP1ouUQg2Xj9a4qlCo5OQq+8ECDBsRYvnFvD6O79qdaa3s3dk5fjpZflD3NzEOwLz03+RbxaE/v9lQle8r+UVFjvst9R0Ktd2r9rufF+C5rvtmXzhj53FLc9pgHrHC7ckVOu/04FKx+AO0h9WOBzyr1EZNo+d+TGALFDLMX+wQXelR3k90VEQhYBehGOmXZZUUVOtERnsLFy9aBP5740/SbxG3FrT/gmDs69yepyU+D+lQNkL2/atJhFmh1Dbatn08kYCS0CUrinRbLz9POyqXcJDPHxerxsw6xSAyD01jbyJ9YwoISkxkh5BvtMxXmhvPEuZ5usRvudYWpGvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79460eaa-ffa6-499c-fad8-08dea232ff24
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 18:55:04.5488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Js3EwD7k8lR9wJRKSkjDDJt/KOwfQS/8/7Fwd7sDJQhN7eH7zXthvUt/xMTICKhxipd6R45D8rqVf+euDH9CBBs9CJEAgOKtYBao4bpeXe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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

Thank you very much Juha.

Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>

> -----Original Message-----
> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Sent: 24 April 2026 22:41
> To: igt-dev@lists.freedesktop.org
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>; Srinivas, Vidya
> <vidya.srinivas@intel.com>
> Subject: [PATCH i-g-t 0/2] kms_plane planar-pixel-format-settings restruc=
ture
>=20
> Here restructured planar-pixel-format-settings test into dynamic subtests=
 and
> put back in place requirement for Intel hw as all those tests are testing=
 Intel
> display engine specific limitations; there's no idea in running them on n=
on-
> Intel hw.
>=20
> Added new dynamic subtests for found corner case. test_nv12_tile4_src_y
> subtest will fail until Vidya's fix is merged for the issue:
> https://patchwork.freedesktop.org/series/164739/
>=20
> /Juha-Pekka
>=20
> Juha-Pekka Heikkila (2):
>   tests/kms_plane: Restructure planar-pixel-format-settings test and
>     make it Intel only
>   tests/kms_plane: Add test_nv12_tile4_src_y planar settings test
>=20
>  tests/kms_plane.c | 413 +++++++++++++++++++++++++++++++---------------
>  1 file changed, 279 insertions(+), 134 deletions(-)
>=20
> --
> 2.43.0

