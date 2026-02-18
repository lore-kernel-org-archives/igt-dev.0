Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F92E9A03B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 08:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA96A10E596;
	Wed, 18 Feb 2026 08:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAWLENrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C482010E596
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771404145; x=1802940145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V2RxyoqjjAYkS4JZqMLKUgVfkcmZM8kQTn/KuawfUWo=;
 b=cAWLENrT0eEkP8KUVn+EO5kXiU1ItE5no0ixfZp6NcZsT/Tbo5jVixqs
 5Mdn8dLqFf5/c+yhU59AexAW5Wujt2yEq1BrhKE5JWW4baWgGPj0BAsD7
 FtX+wey9Pm13rP3Pmm7Ciyx+XDyruFUA9m9H2VteIk7G9t31UuoWZOkOq
 BiDKLwrYc0gItPHL79CKpmtVUC4RuBEjsD8/s5+dC1Fv/rWR4n5IzUXvE
 RcD2Ygtmb4oAvWwxClJs2S3PBrn3P0zgNwWxaayTaTHYItnZTReomNA1o
 yLdM0NQvjQPc/9BJYCyCwqpyin6Annl230kx0NSscycFM5Osh7rWQHmci Q==;
X-CSE-ConnectionGUID: HUIM+TCZQaGhzUv7h4aaeg==
X-CSE-MsgGUID: oUUUX4cJR5CfJxFrUw96RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71497778"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="71497778"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:42:25 -0800
X-CSE-ConnectionGUID: SSuivvLeTxuJrzA961mstQ==
X-CSE-MsgGUID: bplPXu9+RWaVQ6DFpGgUrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213224203"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:42:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 00:42:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 00:42:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 00:42:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdxxnHKzSl6bxKvCh36wFpL5fqBrmxQdbNyprwnGLhHxoTnqFwvlXItDNwVYcLJZVlNprL5hyz07JZGHAA7FD+/Z0Dgb5flRnBP5foxCi1tREf2tKv1nZjJIfCN6crCMeW9P86zBSH9YtwQsUZmXXkmf7kmBWLoq8wekFNTUkhRCgH6mS9JFdc/P6Yk1VteNoZ9vCgQ4mFBkcFGz5GZg+TuZYlmNQ7GNTgvL6GsElRVoSo4a2ehVcB2m+rbRgO4e3Zbsp42srOyFM4b3M4sh1SFg5YIV44Ky4g8+2sEdeYVTBtjjuxRZETFwY2AcruUMSXdOSUfKH5h2LARwrFY+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KRsYGbClDd38FOPGoEop3XqcocRourwhRahYrL0qIs=;
 b=exnrmHmh61mNYjNfEV9WcQJe4NMmdV/D/Coxo20fv2py9I1MN0ZvWmUpoajMR+QhyiQnLOAYvbHVSO5dPt6W8xxOx3fx5BfhJb9O/EU9zmRSheyFEeYRevvG2UjDV/Vf9j13pfRoWps/h70s9Noq2bDETt5AMxmfJmKxpo2JqlosxbX6gnDHCIf+F3Y3TgHbtLL2BErcWglrGjpKkcuJyf6wydo2BuCU5TqWCsuOOhgxOP7sb/sX8mVLAca1R3pTvazFY0GPBKY81+Bftcn6Ggdvevm6Pu2lXTVMiMUKY1Pzh3948u4zsczRM7affHiJIVBvOyFwMQcCjSc2kaPjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 08:42:21 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 08:42:21 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering for
 LOBF
Thread-Topic: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering for
 LOBF
Thread-Index: AQHcoK33+CTOaL7pAUaoPyxl4WKRD7WIIy/w
Date: Wed, 18 Feb 2026 08:42:21 +0000
Message-ID: <DM4PR11MB631221B056C8C98B3A06A014906AA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
 <20260218080511.2534901-3-mohammed.bilal@intel.com>
In-Reply-To: <20260218080511.2534901-3-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA2PR11MB5131:EE_
x-ms-office365-filtering-correlation-id: 52b994d2-7af5-4da1-d55f-08de6ec9a205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BY0Db9QYmRlAxqe9gcL5A/nrfhtDnumUvalzsXblK6ULaZ0soOp5hBOUseeH?=
 =?us-ascii?Q?lEB95uTJbQzRhEHAJJwQdHt2om/clKlxfTmFFrheQ6J7jUvH/jZLqFKVEFYd?=
 =?us-ascii?Q?raEH81QSFEFFnl3eZGaQpopcxFJzjwO0XPTdZORux1Z0b9y83PebFfxY2xxy?=
 =?us-ascii?Q?uCf1OQL9MCtLb/bDaF5pw5iAFyXn2KePFiI6ewOU3fsja2/jXFOYgnSmMlCx?=
 =?us-ascii?Q?hdZhVPmrC6o6+cu1iWJXAUb+4D6yc6b0FeZSf/PY0dx/Hi+n8z8yEbW6MLP5?=
 =?us-ascii?Q?vhEwSKwzw0sG5UPgo8owFsbmu9tE5lAtYXZKKpw2THK9x+MBvaCIBHlrPF78?=
 =?us-ascii?Q?MaBBVVnpVq4Gf6AgsCNZrzqLu0JiHjtH0gjXct6ofdVXz+Qkich1JmDVcUtQ?=
 =?us-ascii?Q?4pCjZ7PpCPGDmKr2fTbpaWI/0gboTW+N7/JKiOmLjnyi3uOVxV2lC7BsN5KI?=
 =?us-ascii?Q?5U48RMptvfqvu7MNQEviKYbchY95e/ooq+/f7wd7KV6QSB1mRxaGYamtb3kz?=
 =?us-ascii?Q?QSejZOk/3QLd584IwBKkoEVCtPIOjYdE+IjXARbh4WsfN9ER8xbGHCFP94Q0?=
 =?us-ascii?Q?Ca0CikZRzDnIezp5u0UKnUzLNmSk5bPzbXCuzwtYfU7uWpo+rOtklsMBAvWT?=
 =?us-ascii?Q?OTYW4mczNq2DQ6tBu+fO25gxNJqtoiWL6JFzPtFDzuuC5f+szdMdNdIThyTM?=
 =?us-ascii?Q?2weHHGfRdltKqrjYl66wdh7n6FCAgRdH+O4JSV3plfinSBfzLDL9svUrKpNw?=
 =?us-ascii?Q?c2ayGFNPB8Zl8KUzXj3tSjVAYXJhEzlW9W0gLqSjqd3+ArEpCCp5vZX6Wwkz?=
 =?us-ascii?Q?DUL3ykUj4gK9F1RXwoxuoLuMqMNbOpDyNTKIsjSueQyan+Pc+5e1gfmMotHQ?=
 =?us-ascii?Q?viEPrg6E6iTfmb3ciMhD5PnZLZGR9RLIkvfn3Y6hlSveP8fJsG+4ogdkdbtR?=
 =?us-ascii?Q?N4ymIRZG5/C8ZXp9QJl2xK8bufyFXc0nf7Z1XIZizI1TTxeXpep+UNSMYzhg?=
 =?us-ascii?Q?vS4uNA3zdNwPThXiF0URfkxD5fWRCwzye+vl21804BxjTtioTOgTSbIKTzsQ?=
 =?us-ascii?Q?hHBPLqigWaUNsJrLyLjLMeGOxPvyf7DXDa3ZX9KlbEFbgDms6NOyud6BJocv?=
 =?us-ascii?Q?MKp8CarFdoXKk8VpwuzmJtJs+AYlUar6c9m2BdDVjPm94+ewi4GmuTCdXvYj?=
 =?us-ascii?Q?wLNb70DetcMEwm5mwFgMNiM7uj8ZAnfWdaWPinp3FRM0fGySS4IO51Fj71PT?=
 =?us-ascii?Q?axgS38nkXVF1qI1dEzDWzpZ3zAlrsm7AURwfU+q68GtUWtuaM7fouxboGr+J?=
 =?us-ascii?Q?HKnaiRYzm5v7wfFelz8KzNmXXna3I+e6Q7KwJSaw9Zmqc4SvXBkMpCiZ/iWb?=
 =?us-ascii?Q?9YswvFvTFyw4IbI6CQjIPI6Gg9nntmhGHR0vcOcD6g1+X4PU59Eqmu5PCG6B?=
 =?us-ascii?Q?A5YNGBbobsoYDNMnCfKe6+Cn3KJ28SjYYiA4QJagp1mcO2kJyTKjF/GcJLvX?=
 =?us-ascii?Q?5ojpHxdgIPbWj+Wk+totn+AkoRGk+aO/eGB8mUkiIn10GVWG6Es/KYKiT6ry?=
 =?us-ascii?Q?zOBDChlpgxOjvlbRpbmzukAFsl+YzVbvXFBn0NHRWf5ngVeTnqRc8+Faj13n?=
 =?us-ascii?Q?YpcMHWr9aKDKy81Pa3Vfk4w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GepG6potyuIHD7q5pEPzCd/ZGMWRplHzGluspAaEQlLmvo59tyqBp1IOt+E8?=
 =?us-ascii?Q?Bv+wVpDCnJe5NNgo6yKfIlcqwqoU9ODKS/oZqfZ6bSiGrm6CYpi7jc9L7ltn?=
 =?us-ascii?Q?2SmR51u2qm2bJcHzBxO8TlOj34WBV528QvHjfyVGWIABrzh4zwmdIuT5d5jF?=
 =?us-ascii?Q?HdKu2xVYoRRLMfyjMHdiy2KSaBI+Kp2Nkg5bFLuvVx3CO7tFgwLl0505l/1Y?=
 =?us-ascii?Q?QmlGhqQDnBJqNJwMcUZXJ9XjcoDLAQlP7SrpQwDhlBhz9Od4wwW0FA1WRPwY?=
 =?us-ascii?Q?sojozHOtEHhHY4dSGnWXOUZo1M8n585qqL7YlAYF5DD+iyfXoJX6l8er0Ak3?=
 =?us-ascii?Q?X9Btj7RiYVEHIk9FK5lbaybJfbdXaAR40DGkZWSEu8Y51BSAkdwKHoRJDMuR?=
 =?us-ascii?Q?NORs8vVqzf7HodcCMYl7LTZavkO9Q9euB3CNHw65UOWHfdeUkbl817wqdhLM?=
 =?us-ascii?Q?TK43BkGKS05BC9iIA1RTHTivNx95lIej8BvlphOesZ/tTabAFFleH2EYNqbh?=
 =?us-ascii?Q?7BzQhlDyFCbF7SfakSkuZSqaXMOmQ4v3mk49O0JMwEqS6urOkNmF78vKWb+I?=
 =?us-ascii?Q?D5eSqXc9ofaxzRGf7fSRRjAaKkVow80h3bDJX1UORScRu1Lp1iDXRreYHK8m?=
 =?us-ascii?Q?VbSbKidpKHU98vLJj/QOQWct6HqAUSdFihDIXtoKkYttDmw+AxpiS2eiFuxI?=
 =?us-ascii?Q?BAmKc6K8qkKoUNdb+4NwqEIZNVBqwiD4PxO+caH+hp13dq4QtBM1jlV7Gz7F?=
 =?us-ascii?Q?if4atJaAbydJByp222L5pBICSH5GPCVwe4rsJUpzzI718uSXjCZe24ZZ9mhC?=
 =?us-ascii?Q?DU4kQ0NEfTQXN9NIs9dJ/K8EZ+us/oe11KiW+aiOp/aw04tK5cTzE6tLGUSD?=
 =?us-ascii?Q?gw9Iux+uqFizMNYbw01BEqD4kA3ezPy9EA/FKzZaiFN8U9YKkzhXU5jqCC5W?=
 =?us-ascii?Q?2nNvA+ZN6aaDyWYQerIjISypwbOg2qCrYrnSHmoKy2brFBGR5W+sG2WOwAUU?=
 =?us-ascii?Q?2NV8wV4T/xUqG4Y7MlcvW1ewHVJEqTtYno8GRUaAREb8z3ZEEmzZrul33+lD?=
 =?us-ascii?Q?G5Onm9bVs3eqk+nvtDP3HVh9trxskw0g659w1alzLB+cLj0uYgV9NsARvaE8?=
 =?us-ascii?Q?L5U7tmUCv28SCtDwecEtU7L9SCYKTv/SqPZ+V1PqjZ/lsxwVxSlmfNB9Ln5Y?=
 =?us-ascii?Q?anDRkbXCLImTv552qu6SU7mldExmPeXxtXmp0YRu3QpNOwoIOqOz/EMtDW3a?=
 =?us-ascii?Q?oXruHjiI+rDtcD+BRMVBHpZJoGxA5aKUyeEw+ypgIAXdoYD0zpvVjMJimWAh?=
 =?us-ascii?Q?KULJWhz/b8HtUDcLo4oNzpYOsr7m1ExsxSKgUJJruDub3KmfKXw9meOgm7LK?=
 =?us-ascii?Q?ZA8YtJcezRow8Nskf57KMk7yor5JHu0QEZZ645b9DdxqC2ymRaUCF0Ed19Ff?=
 =?us-ascii?Q?tZL3HtDAaN6V3oEY5KJA1RoNJxuWTFiGHzAtTB8Jy09qkYCPU7I8acOw2ReT?=
 =?us-ascii?Q?OOI7tO7B+3t9VqL2NaWMUBAATDW8gd4KO3oRCYS18NFJw5w47osaahFeA7sz?=
 =?us-ascii?Q?lvC3qyVMiFE1Np1xBCb+HdsJJZnTVd0kWYFKLyWer2XjXsiZPiM38lTwiJ0D?=
 =?us-ascii?Q?UXbZCj5ddCYZJGkHocNZxsyMb1HvL6LOqaLWD5YzbCSqvovzCh1t6Dw0cvQY?=
 =?us-ascii?Q?RPq4eobZDOF7wh1Es9Q4AY2HSqp/xb88h5f8kOb7RuaepfYY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b994d2-7af5-4da1-d55f-08de6ec9a205
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 08:42:21.8365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /NI/GMcDxZmNRKNxZhc28f0az0vY2YjmaBZWt3492/Kc+ANa0FBcSHqWBTV+uArr8DIvPbEAWljvt0SVb3zfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Wednesday, February 18, 2026 1:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Brzezinka, Sebastian
> <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> <mohammed.bilal@intel.com>
> Subject: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering for L=
OBF
>=20
> LOBF is supported only on eDP connectors for display ver < 35.
> From display ver >=3D 35 onwards, both eDP and DP connectors are supporte=
d. Add
> connector type checks in output_constraint() to skip unsupported connecto=
r types
> based on the display version.
>=20
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---

igt_has_lobf_debugfs check already validates kernel support,=20
so this change adds an additional layer of connector type validation.
Is this really needed ??=20

Thanks=20
Jeevan B=20

>  tests/kms_vrr.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index e46e98727..cc43ce587
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1007,6 +1007,30 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	}
>=20
>  	if (flags & TEST_LINK_OFF) {
> +		unsigned int display_ver =3D
> +			intel_display_ver(intel_get_drm_devid(data->drm_fd));
> +		uint32_t connector_type =3D
> +			output->config.connector->connector_type;
> +
> +		/*
> +		 * LOBF is supported only on eDP for display ver < 35.
> +		 * From display ver >=3D 35 onwards, both eDP and DP are
> supported.
> +		 */
> +		if (display_ver < 35 &&
> +		    connector_type !=3D DRM_MODE_CONNECTOR_eDP) {
> +			igt_info("%s: LOBF requires eDP on display ver %u.\n",
> +				 igt_output_name(output), display_ver);
> +			return false;
> +		}
> +
> +		if (display_ver >=3D 35 &&
> +		    connector_type !=3D DRM_MODE_CONNECTOR_eDP &&
> +		    connector_type !=3D DRM_MODE_CONNECTOR_DisplayPort) {
> +			igt_info("%s: LOBF requires eDP or DP connector.\n",
> +				 igt_output_name(output));
> +			return false;
> +		}
> +
>  		if (!igt_has_lobf_debugfs(data->drm_fd, output)) {
>  			igt_info("i915_edp_lobf_status not present for %s\n",
>  				 igt_output_name(output));
> --
> 2.48.1

