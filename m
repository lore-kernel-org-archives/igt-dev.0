Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFF6C2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D322D10E050;
	Mon,  5 Jan 2026 05:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTVCbZZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A271210E050
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767590493; x=1799126493;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zFtlsB0JsiEa6xyoYkwN6K1rByJ31K3/XmffO1htJjU=;
 b=JTVCbZZVppgFQveQua6HMskUvI6SbvBebmDw+rvZ9au48RAh5PcuptpS
 tTqzNpm6vo4ph7j2sEq1RtF1G0NO/NYAQ1yHU1dv5PO5Mod6CgdlSh38O
 j3Pfv1F5GhuHl55WCxlN8Mt4/vnq4vswS74XwqWxgqAV9U3QI9YlyOwtO
 aWHxgW482nrn0znAEhKuSvn3aiAsJS+KH9TVDNRXH71HBpPxt9kk0hQR7
 g/p3H5gdBKGoN06JOO+NJwBiltVlAlogqYawPd0rjSL+2nFjOT98m0yB5
 KjL8la8nf03GqpISGKpumLyikPLwup4RnH6QTt5hr40aYhSs0XF5vfXG4 g==;
X-CSE-ConnectionGUID: 2lqQ4/avSCWZt1TBBiPasQ==
X-CSE-MsgGUID: zuihDmvASO66eizyEpC+yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69028671"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="69028671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:21:32 -0800
X-CSE-ConnectionGUID: 4Ysnyf1CQGOthR4urEeOxA==
X-CSE-MsgGUID: ANAkOaW2T5SA40C8lv6xGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202778756"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:21:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:21:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:21:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:21:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjN8XWnWZAQ2zHroQxLE3hxH7eraukKXyCK85UDJz1yV8zk1a9z8HIoT258MIE8b2wMUrt8q7BlR/ky3KWyE+4lRkGq1Wo6fJ7d86t9b3QZu+6oH+EKjcSVe81zNYpk6qrhCUnzHWgH7PL7qmAlHz+ozKpiZPPK9X/ewO+ZX6vW8dixGAe+xNXS8BneYmPRbH1tHfFnLHniiuG1VYmDScVIGkU8AIolgaf+3a1ldgIAWT3H50sxjL8rB7PGrOpK4DzDTjPJx0yEIM/7hjBqwN2AFJ1un/8ZUHeKPhq5b1d6j9oIeQPqiBwYECM9e1Xk3CE63oLXg7ZLj3iqI0wtOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSOliqzAZ9WEoq/KTA2tdEReE8nAw3r04fMvaTR61CM=;
 b=UndqlDV4fP2TAAm9IzIej60I6Mg9bbfeZWhiEs6GXzq2kf7DK2M5hO+XLMno33GVawHQ1BD/BUanwKbaASgdXRWYOYngzJ4JNsshojfxwFVhU+MJH4TOcGvEFJShEU5JSlM1eJ7UMIRA2EXPp47bdSvEZ/+UBrSgd0AkgEf9vl+xOaj15FEmhphPrZbozZUWk4DzK+H/Bc8qjhN+GUu2zwpqtpo1T1IJwy4Y2JZqIc65zvggamnltjRqEb5GFXqJmE9yIzEE72fsBV81oL7Q+2Y8kCZOBqPLWilzUvrSAcNGlcExrbZq/muk7f2CU/BYyYryD8klyMMr9poJwStqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:21:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:21:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v7 6/6] tools/intel_hdcp: Implement timer to the
 video playback
Thread-Topic: [PATCH i-g-t v7 6/6] tools/intel_hdcp: Implement timer to the
 video playback
Thread-Index: AQHce66MRRLaj8c7p0upAa1iHhK3JrVDDspw
Date: Mon, 5 Jan 2026 05:21:29 +0000
Message-ID: <DM3PPF208195D8D1DFB01467665C0CC418DE386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
 <20260102060835.89725-7-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260102060835.89725-7-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB8252:EE_
x-ms-office365-filtering-correlation-id: da4b0b25-76d0-4d23-fdae-08de4c1a4852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?j66h9wfTr77fNwaa3Cm0H28Z4hfP3r7Rbk+c/omTbIihJEQsP8NoXguMSByX?=
 =?us-ascii?Q?2OJ9LlTR83GKX54esb6wtqNz8UB0CoB7tYa+mkjfnhqBYIGLJ2k+pdm8tVrH?=
 =?us-ascii?Q?DPcrmDm9IbYRg+fpCf00RQQnBiEal/IJHG0+Qg/ZIurAHlBADkl5GC+oIwW6?=
 =?us-ascii?Q?6FGbPpXGZcxp1N5B0QE/KlTbB7TvyZ2bd71Ek1EQJfnNY/7B2IzioKTxAruK?=
 =?us-ascii?Q?I1Azgv9eU8ZrAqAXNXVTiOVRuhxyVMvlVc99HwiJghB2BwSRb1G/2FCJer3j?=
 =?us-ascii?Q?vk6EJx7XxIcHSRdxg+UHwkVUhOJnKnqq/Ed5Ys1l6s6kVz29OA67Y8hZofQV?=
 =?us-ascii?Q?bSk94x1gXpx+z/dDzUnU8WnyQy+5a7S/8/ECaqzebQwcbDF2tMRq6ABdLgKd?=
 =?us-ascii?Q?M6MPE4rvBqysyUt94P9FYDp7DQ+39G/B05fEU3shqOkxYRs0AZ+xfxdARybh?=
 =?us-ascii?Q?kDqrXKKjR5Ojekc0eVbAar/N7+iXH3z4WoXzWwct/HfD5i24h7yZhl1GQ4V3?=
 =?us-ascii?Q?GO7WFkOA80BaN10bXxXRwbIU/OSdEMhG8r+0sh28Vdn51iukBFGWcoPPjH5R?=
 =?us-ascii?Q?Lsk5MoT5UR9Hk5ONyORYx5Zd/wl3lrSP75HRHlazBhwcUfoszkvFRAc8CTB9?=
 =?us-ascii?Q?0UOp/BLMYui0HF0cIxdRmJ8vVRvlrFTnd4J2RJVt0YOPWYARjb7/rkRw1p05?=
 =?us-ascii?Q?kNVoNO2zxMh7W1/EE9arImrc0lTXURedmDhqRgNGGLOti2yY713A7GS/slZN?=
 =?us-ascii?Q?yZjwzyBouPNjKyGmB+/yhMLkR7efn/ktiF7MsadF8dNerVJ85IxtVV7CysAf?=
 =?us-ascii?Q?sp3WD1EZqFQt8M1yvm75i+g023xvUf280u7eYuinSYqsz5oHWjAZGHE57QdI?=
 =?us-ascii?Q?ndAvGQmThJQjSDcHjWikBrxi1SkRpMgFye5cTN0TfOZBZI90BVPzN0n/TUf9?=
 =?us-ascii?Q?DXHhD62uHlmSy8QjGEWFgjJCrTpc1TyUKLQy7UgRTr7RflxoyCPW4kU1B0OL?=
 =?us-ascii?Q?e7RKFZZZdTWGWdlaeaHUwKEPXEZ3qovLrXhVeCGucjl0xYVfAslqaCSE4MVe?=
 =?us-ascii?Q?qzMEZpC2kGvRRvuwxIdbQ7UhR7Y2DvlL1mKB1lIhfjQ+iAznmTi1PQ82P5WL?=
 =?us-ascii?Q?L0i6gYvRSsF6tUvvLz3A5UpfvfWLRDlmYSlyposHX8JWXuZinKiPgsYmgDXh?=
 =?us-ascii?Q?h2vV+z/IaJynlA8kqeNt02mo14Z6QwrcsLNw6Vy4wjBPXSez9cdU37QxMLot?=
 =?us-ascii?Q?f8RTm6/H4xARlZUraieT0P6OzbZr/zih6lUmOwuOnqoYLYM8EXYtGliq1sax?=
 =?us-ascii?Q?X6yOm7knPbEGnDmer7i6ebIaHg/x2+fyjSbc6fCK7HPQg8V906vieTEFsyl1?=
 =?us-ascii?Q?eJlwUujs7Y938wVD6S72eg0XPscF+hQ5/Y0OO2BKtm0EDMqQgfqxdfIeeZvt?=
 =?us-ascii?Q?W4RHlpGAXHjIq5fyIrogRkySegmvZLOnH1Z94Z1WVDRD+8ZhRs6dpxf9aV3V?=
 =?us-ascii?Q?oT4r1NJkpU5gfe3oVRfzF7PhLIUESd5jfvub?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NeYTrbz0if99hnxG/RBlEZxkyrXXrD6R+TjDq++QKCFz8gg0mlkhLGF63d6O?=
 =?us-ascii?Q?E7jya11Q6O2oRYidPAWUV0u8VwOP50ST/fPxYi8EajWWISEMB82r2HQi06mm?=
 =?us-ascii?Q?Gu8wVK8KN1Nj8x6jMdqXVFD6jViQQ8NyWIu2oh6Xu+IY1+tIoZWa+jEv9HoJ?=
 =?us-ascii?Q?YJHV/7MGPOmafRn5l9xAls5MmsXWghqrvKpIMt0Nq84XgROEsiOfC/LnJ1hm?=
 =?us-ascii?Q?vjqnXXXXwCrSAScwYj0MBOv9EXDTHGklvZDzMctwiAQvE7iRuULxRwBeQc/b?=
 =?us-ascii?Q?k1ySi8A4RzegTDe1rZk/6jbMXWhhBjxY664xw+QNgFhCZqDHQTJq74ujmQWg?=
 =?us-ascii?Q?krLUYcQZJEKPwz46/3cXSgTMMcZH1666elEfCcgHZI1aXjhkd99BWzfMEQJr?=
 =?us-ascii?Q?zCJ7zuoc3NG/2891DBecx51TR4dNkv/2xMwcFzFjY181ivZdBQXaKkFGguIR?=
 =?us-ascii?Q?EfGsULCJRe73mW/9lon3Y732ymXuYjAFHTT5JVqulGeEyL0MYVxfLZywzCzE?=
 =?us-ascii?Q?iA/XajDea12eOZ3jKuPZdoQGJNboVY63sPcH1cfY3Fb2mNwM7F6/Rem6qnKc?=
 =?us-ascii?Q?tLtoqygP55GqW2NwTTHsjaqKyWASb/pvmrkAY++tsXE4x4EuGAi7nzQKKfyb?=
 =?us-ascii?Q?g1LmIo8q3ifqisZXjuPLx3IKd2wjwbqKlr1gHUCTNvA8lIbqXV4frK6h61JA?=
 =?us-ascii?Q?5JoQzpnB5RzW8WccrD77oyK9NdIyAOnOmDh/EjbYqk93e9cfXopZtTNdBeKH?=
 =?us-ascii?Q?WTu4GZc8Y5dxduehbP52YH6B2LlVEb1F7q43lzoyKnC9EiiOAhZwPX7qFveq?=
 =?us-ascii?Q?oFzHSMgefOFMffAAhPZxlxviaUgY6VFxdc4gIE04xUiPMLfAnHjKeMG5ZR0t?=
 =?us-ascii?Q?qOMo877jSfazH60IO9l01OTYR+PGPToIOFC5nG5ticFSaeTRgDCRsOzuVWMQ?=
 =?us-ascii?Q?ND4qQtUykwDdC2SSU6Wqh5n9/8jx3q1H1nsW9sG8Rfd27hfLh8prQbI2gihc?=
 =?us-ascii?Q?tVp1CDk5Nmjqcto/ALNqwidE2GplX86YSqQ9TQ0ofU/NcOwK1zd1qRvVwJbr?=
 =?us-ascii?Q?/ZtfOYhTN3/+fU3DbL2tuDfd7ZBWQDdYLgZUPA1wUvorBxR4+ObQjLxJ4Uuv?=
 =?us-ascii?Q?21sA3w6mQnCQyGiVU+8StLo7mhkqjKFVDM7R+DF5gNnGBxU6Ob8QlHBZmI0b?=
 =?us-ascii?Q?RJ5p30X1Vou3SlAznZ22U6tibxh87UJhVvU+xiS3w53qw3wpd9YPjbGS+dFo?=
 =?us-ascii?Q?VldXD01HUfD/wwiAICNYfc5sV/JqOfJxhkMgqJ5+6miwq+1JfxeDSnJkY9J8?=
 =?us-ascii?Q?HAJFqk/7jeCsBt4tB4NAu8DaFVzxFKwV3wT/JY6JBykncRPdlvpefebnEHFT?=
 =?us-ascii?Q?fdKYNb8+5T9LJsprvJ737EjfN9Ac14gGkci7eimFfFx7NxitT4Pkxu5zOicK?=
 =?us-ascii?Q?gjSGxr9AfupktQHpCTTW9t3SrdEhS2zi+I1YNQJNrVMMVkachll4PwUG9OWH?=
 =?us-ascii?Q?GUgyuR+r7E+9EKazVFOHouLY45X2B37Gsv16yYZXZAFf5iZZV0WXXZaJGhQV?=
 =?us-ascii?Q?Q8ZEwpDcchJGxljTFiOEabBaHILqI0S97Qm+ALeWkihU6KlPvUspKAJby1Cq?=
 =?us-ascii?Q?5MNZsM+646LaJjDDSCz6J0KzKawv8XNaZDqFGK6PyQeJf9TR+A1YmVLtEWNs?=
 =?us-ascii?Q?fIXqW0U9SPlS92PUyYSM4uwGIxIOqg+l9tRY1SWfQaxXFCsFA2su4SNXom73?=
 =?us-ascii?Q?fzAYsycoCw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4b0b25-76d0-4d23-fdae-08de4c1a4852
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:21:29.9177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRZ7ptsy4qwaCFVnFxXJFE5vzy1KF4HrNufXKboLTBjTii3+J3ay0Qxd4nnU6c3BlBBordphV8UUdNX7ox7OvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
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

> Subject: [PATCH i-g-t v7 6/6] tools/intel_hdcp: Implement timer to the vi=
deo
> playback
>=20
> Introduce a timer to the video playback UI to indicate the current playba=
ck
> session and duration of the HDCP session with type that has been running.
> This keeps the timer align with the active HDCP state and reset upon
> switching modes.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tools/intel_hdcp.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> a04f85362..6aecd27eb 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -409,9 +409,15 @@ static void *video_player_thread(void *arg)
>  	const char *hdcp_str;
>  	double bg_r =3D 0.0, bg_g =3D 0.0, bg_b =3D 0.0;
>  	cairo_text_extents_t ext;
> +	char timer_str[32];
> +	time_t current_time, elapsed;
> +	int minutes, seconds;
>=20
>  	data_t *data =3D (data_t *)arg;
>  	enum hdcp_type cur_type =3D data->hdcp_type;
> +	enum hdcp_type prev_type =3D cur_type;
> +
> +	data->video_start_time =3D time(NULL);
>=20
>  	igt_create_color_fb(data->fd, data->width, data->height,
> DRM_FORMAT_XRGB8888,
>  			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &fb);
> @@ -421,6 +427,12 @@ static void *video_player_thread(void *arg)
>=20
>  		cur_type =3D data->hdcp_type;
>=20
> +		/* Reset timer if HDCP type changed */
> +		if (cur_type !=3D prev_type) {
> +			data->video_start_time =3D time(NULL);
> +			prev_type =3D cur_type;
> +		}
> +
>  		switch (cur_type) {
>  		case HDCP_TYPE_1_4:
>  			bg_r =3D 0.0; bg_g =3D 0.7; bg_b =3D 0.0;
> @@ -473,6 +485,18 @@ static void *video_player_thread(void *arg)
>  		cairo_move_to(cr, x, y);
>  		cairo_show_text(cr, hdcp_str);
>=20
> +		/* Add timer in bottom-right corner */
> +		current_time =3D time(NULL);
> +		elapsed =3D current_time - data->video_start_time;
> +		minutes =3D elapsed / 60;
> +		seconds =3D elapsed % 60;
> +		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes,
> +seconds);
> +
> +		cairo_set_font_size(cr, font_size / 2.0);
> +		cairo_text_extents(cr, timer_str, &ext);
> +		cairo_move_to(cr, data->width - ext.width - 20, data->height -
> 20);
> +		cairo_show_text(cr, timer_str);
> +
>  		cairo_destroy(cr);
>=20
>  		primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY); @@ -495,6 +519,7 @@ static void
> start_video_player(data_t *data)
>  		return;
>=20
>  	data->video_running =3D true;
> +	data->video_start_time =3D time(NULL);
>  	if (pthread_create(&data->video_tid, NULL, video_player_thread,
> data) !=3D 0) {
>  		fprintf(stderr, "Failed to create video player thread\n");
>  		data->video_running =3D false;
> --
> 2.34.1

