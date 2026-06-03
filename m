Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2F4CD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 10:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4F610FB62;
	Wed,  3 Jun 2026 10:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+2TZw0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F26B10FB63
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780481767; x=1812017767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g46F+cojcZ9I3jnXIuE1sxU7PM4uaIPjcrFgiULlJT4=;
 b=d+2TZw0WqLc1FfP7bF8C4UiOpPvWQN+hkOwbU7/f8WELc3xOs9faF7y6
 fHPJOpESWdXlsHFv+wSUP7bqAZ0rQVE2b+UGOJCsVI9mHtOii+QnJ+xXl
 +RFCBnHutm4dGA0mWwIJP35m10R7jF+0x8H4rO8eftL2UtTMR+2VfHjxA
 FUm9Aam86Soyf/rTZl0IJYjb4UuKaf1dooknkzQmdAI+nhhq5c/+yQi8n
 T27/Tr9Kmmq7OdulJAjifIzjdlFJO/KdFzmiH3+hp6a3nVAiQ4AyRXvr/
 M0iNWCHAQiYTbSkvh++Pz/he+QeKT9GLp5hy945rIwY+AEX4pKrKsI0Gg A==;
X-CSE-ConnectionGUID: Byz2M2lqQPO85ElS7OODRw==
X-CSE-MsgGUID: wAFPAXD1QUq37P1cqtxe7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91857327"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="91857327"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:16:06 -0700
X-CSE-ConnectionGUID: nKZqYh9tQti1S+JovmQqLA==
X-CSE-MsgGUID: q16XwB2dSUGUWaAXIZE6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="282291651"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:16:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:16:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 03:16:05 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A875yOMtBYWXc8UCnhj0rFw6kdv6booh6z/LMtXeZNVoi2TVWaglIz0d0iagX2vEInnUU+NKkZAPx3XFigIRnu3MZGEJQvzdNN67Hq6KGxFbnH8XrqkFc/Mdt9dz2kyxOEt7AEVATqcdmKNgh6sduLqhmiC2+fvACY6YMxhmwHhof+CimFixxq8TuoKvqAbTMlZXhqUejEN4yC4ZTCvuQHppp1sdg1FX7SZFJfCvaue/P7feCY9xezI5FJAObU8omHKRUNL7KRt6GyOPPjTcQc41Did6FqJa/PDTMFDZOUcOkkMMfNRklILtC+bp/qJGiYj9zsXMWVZHRn536OHxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x3nsnnSj0WabSlBd+8Zhl+WnYRD07/zu8EIFGxrshs=;
 b=RFJAbst1S3vLP7HUmFmkFjDUsFjy6nBAkK9JuORZuGIbqYF5U3ArE1MaupIoe8r1ggI4olbplac2aUsGU6ZIc28XdumBHxjuh2GDagYoMIKTlfmGHM+U1RSQPbRrR+HYFOwP5Js5Gw1S8JDmMVCj6YmQEOcM3HlmWvYGdzUv2Jmxflc8FEmTFGc6LVBmn3FfG8Nnb7mgCp2tOvYG3u7HC0ide13xE/Jf5794WhehCefFJICc5H+FZBWFfiONxZuTaAZ6jheTQ5rlmKQ00eMax6vDv27F9IeoNbgSwD00881MFdfEGX6UtrMO8w5OX4c9sZwVs8DCGTgus27R2WazeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ5PPF0D019E8BF.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::809)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:15:57 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0048.013; Wed, 3 Jun 2026
 10:15:57 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
Thread-Topic: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
Thread-Index: AQHc8yuuP2f9PlcsqE6vCuj9mR07qbYsjEqAgAAFKcCAAAVcAIAAAxlQ
Date: Wed, 3 Jun 2026 10:15:57 +0000
Message-ID: <DM4PR11MB63127CCC196E9AA6BE2BAADE90132@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260603073606.2168574-1-jeevan.b@intel.com>
 <1c24b284f0559a5ae985ddedc833c0db086f59b4@intel.com>
 <DM4PR11MB631277E7C22661CF39FF173890132@DM4PR11MB6312.namprd11.prod.outlook.com>
 <145752419eed3d785042b44e844193f621c152ac@intel.com>
In-Reply-To: <145752419eed3d785042b44e844193f621c152ac@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ5PPF0D019E8BF:EE_
x-ms-office365-filtering-correlation-id: 3fd3a170-d963-4d99-dd5c-08dec1591a84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|56012099006|11063799006|4143699003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: e2x63kQLkkn9nujT6Mjt8/Yd9kdUf513F+rJxhJMRt1iHEsiN3B6qFViHE6gJ4FKvxFh0LWNGyK/uwok+xBylLsGEAZDGPmUdl17tYY22WPX/R9ysSBv7PE1MYjqxRcnvbaoreoda4HSFtepA6kW3kSwdp8Nm2kqWN6W0erHTBXTnpRlvDeQYjALpNnp+IGWd+s7xM2Y7UEliq8ziI1lH6AIZlY2xFw573npTPH33glqnUbemBAiJ8VNO996uqenqtfdMSAf2pHTEpEM5nra9/EsM/4QF5S17EZkSxrjqx7GlINgEDUlUxTIqseQ18wj4wSacMRp4zC6CXH9AWQEUz5bNZgg4lHXSs95qIcj/ECUgxi2AY4gmy/mqziZkByB1iwJye9Wr3+fLWVAcBwQ8BAojaEO/0uQht+66Bt9Q2kc1qYDOY9LaDmhiYToHXcBxYKQnkQNKucBn2XGjL7mQrLZoHn7lsEoyf2Ll66c0ndAB14RusugUfN2x+waE4hPrmW359QaWcSxukuPmE/OiEyTlumwh/0inVhMP8FMPQAMJV6lvX+1/tB+d8YLPfHa8NhdL0cZgoj3HbtEa/RTN2GtF+o8arKKm+6zEYVbnWvB24ZK4nZiUszcSpvdhOrevZseUexsCq0ugOMG2EGLlZlJsRnJJUhE05RoBt8+ew3cvr4j4t5THpsELQvT0gCS1N9zjc9x+xKJP4NeJHfyGvYkzvrZlv/PNi4OjkD6oUgxxgZnpxRz3WFvUF4Kyf4M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kqfT+BvXTwu6zVS1D9e80jiLGZ89SSmA/al1oFyC9tJubv8mBSIUGbFGxpCQ?=
 =?us-ascii?Q?jWs1K/jJXdK0DUbMbXBlctEYJI4n9aOCDVCs0QbT8BLogTrG8UkdmMELe1EG?=
 =?us-ascii?Q?MlmGa+OuR9OPUQjV1PmKqR7jSthBQmoL7eBouusdZDxNG+GWv3F45oDTnE84?=
 =?us-ascii?Q?T8Ae/b8X61BaAeoB54MPlyvJVtMGmuUO95qyTPL976e0P/sMm9h0FZ/vbJG4?=
 =?us-ascii?Q?tmBuPAjyq5GfizMqvgLb1gDDXC0XqBdoh2AkYWcgg0KSsVNPli/wv735NQ6/?=
 =?us-ascii?Q?tpIJd5/+7Q5mn7GVvNlx21YesxTLqtD+JLeyPJgrd1kCKgDLpToXCNV9QvC8?=
 =?us-ascii?Q?g5KO5UISxBQ/JFK9acnJlQF1XT12PniNcVdcMP0aEuw5/WoBfm7fpIR8zn5+?=
 =?us-ascii?Q?dVW2F703Xk74V0QPr8UbEDZr8JqJpErFNhwl8Fx849Eb1xEVYfgZsf5BOVaR?=
 =?us-ascii?Q?MXJt5l97wartDxgGADKl07aiInlWnGPb1stsqN5CZQwMaEkjL22hzEG0eAm/?=
 =?us-ascii?Q?zV0nDoIXPxmX6Droz475yr0XClkLsQYSVsrc4kwPwaxtgkDSFQaBq5KDuGAx?=
 =?us-ascii?Q?c5aK83OnCHdSazoYv/RI/H2UGg8Qtnp8qA3z4E5GRCu9HlohjQ+zq+HfF4SL?=
 =?us-ascii?Q?70OuyZzkXeOBGx2AUK8CGnsWb6YIEXiL5A4WjTJFOYk+PpqzUQykrSbMwJDX?=
 =?us-ascii?Q?Inknl6qddbF2sNxA9oFynq8+eL20rv3hArkntzb+pcm5CCVuvj5c8XQOQ9QT?=
 =?us-ascii?Q?a/Bv1Uc5zEG5YG4ByVT0K4do7it8+lyS2U9aK7WDOPuHXyr7qvPKlipobWGx?=
 =?us-ascii?Q?ZB/D1Bjhq87UvnDk7raPZ6OMPsm/EUhKsAB1L8aLso4j2GlAYYmnRQ5GvYLX?=
 =?us-ascii?Q?U2eYaWCb/yY8vnxoWGb4w83JdIlhz4YuZ5z4ImW6dfQJ+6+R8tC1wmwDXDxb?=
 =?us-ascii?Q?GITYpVWXJNdyz9wlNU2y1Wg6yat+80Rgs+wEg7HOeibRbsLjShYZ08JeHaO6?=
 =?us-ascii?Q?VvkfVlUdB5rNhgv0twKHD0X5DnBMfyzULmO2/j1QyvfCvh+hP4YAJWplHW5J?=
 =?us-ascii?Q?OJkVdB7icbnrS+iaCg0tul4jeN3WritsX24GiE1Ll2AbZV2sQDA82EXXwxEV?=
 =?us-ascii?Q?rTye9iziKcD/TaizlaUEz83J0zGClxW6VCjNRUSeT7tLuAWPibB6klyie/SN?=
 =?us-ascii?Q?bR63/6Z8B5ZQReadhJWPJgcwvElq/5kXfZ276ls5/dwMXigKB2zd/rQfACQL?=
 =?us-ascii?Q?Z3ZrOtbR0JNUzctZGJigRNI19+ju+iKZx3WU13HeQW+3mi5x3EGmLpdEU9eI?=
 =?us-ascii?Q?plDuasxJ3Xjlt4arG4x3pvWzbTKmk3QHdnZarENK2O/RRigIr/gpyG1y4Qtk?=
 =?us-ascii?Q?t5cv/DnUnib/gyywqdavDlrCntfpt0XAICvUp9dpGU1OYfKGEtIqvWTT889H?=
 =?us-ascii?Q?SZ4hhM2Tm0tuBChbiv6oJHA4h3zNmKbQibZN0O/2BnGCJLpvZIlUfzXpptCw?=
 =?us-ascii?Q?eBIMmbscS8m4y+68+R+Q7Xdlcse2x/GByobIjeGv2y1CVB2H8gYcOnxWh4LH?=
 =?us-ascii?Q?xnhQ0Bb0RvtAGj9jRNpu6RLMzVR/RTdVc9aQZjOU0DX9QZdbr6D3EoDQ7JMe?=
 =?us-ascii?Q?xtj2+ZH4hoyP0PH1WO+rQDIt+Y7OkpSo3kNa7wF+SAxeHdHAMhNMPl0tdIYy?=
 =?us-ascii?Q?zrRAINQ6k0phF1qAU4ExkPVSD+ui788W7UATonw4m83/nIqF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ApbtGK5RTK23+3Jx3AqWjwXkKETPD8wAREwVE6+4OGD9RrdJLlTkNIAtPHot5wclfKBC0s56D80XsORFAkG5xJ4tWICHU2CqKT+sltH1+bUBrqCd6c1s8ROmoItDQGazxoickVWUlm44fCix33GngtDumNs67wxO+WJB9wmISXIPYTHpooKZxhBra2dCiSKcwUHzvPa10LpObFdXqYWOvWLrFrgYP+27OlO6Y/HILsI4qFBeyxU7haSl3IzKbifG8mEz8Rqi7S1gZ4uCBQ1Rc6K2wjavVknhFy2xGuYks9/7WmkKjGz0Q7shQnkPMo+Tj7OXGLsm/7KvSwSNhb/9dw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd3a170-d963-4d99-dd5c-08dec1591a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 10:15:57.3753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHnvwxCoXM38BUOar03MRg+PsM7U9s2z/hgZqSkirllQBAAfn3/xcrKqMmDp7yXq2OoHCpQ6FtzugIqbrpP8Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D019E8BF
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Wednesday, June 3, 2026 3:22 PM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Subject: RE: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
>=20
> On Wed, 03 Jun 2026, "B, Jeevan" <jeevan.b@intel.com> wrote:
> >> -----Original Message-----
> >> From: Nikula, Jani <jani.nikula@intel.com>
> >> Sent: Wednesday, June 3, 2026 2:44 PM
> >> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> >> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan
> >> <jeevan.b@intel.com>
> >> Subject: Re: [PATCH i-g-t] lib/igt_kms: treat equal limits as
> >> bigjoiner
> >>
> >> On Wed, 03 Jun 2026, Jeevan B <jeevan.b@intel.com> wrote:
> >> > Use '>=3D' instead of '>' so modes equal to max hdisplay or dotclock
> >> > are considered for bigjoiner.
> >>
> >> I can see that from the code changes.
> >>
> >> Why?
> > Boundary modes like 6144 and 5140 are skipped with >, even though they
> require a joiner. Switching to >=3D ensures they are correctly handled an=
d fixes the
> test failures.
>=20
> The point is, all of that should be in the commit message.
>=20
> And then we'd immediately see the discrepancy in that
> get_max_pipe_hdisplay() is supposed to return "The maximum hdisplay suppo=
rted
> per pipe" i.e. joiner shouldn't be required.
>=20
> I think ditto for max dotclock.
>=20
> Whatever the problem is, all of these need to be consistent.
>=20
> Side note, igt_bigjoiner_possible() documentation comment mentions 5K, wh=
ich is
> also outdated.
>=20

Hi Jani,

Thanks, agreed. I will address them and refloat.=20

Thanks,
Jeevan
> >>
> >> >
> >> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> >> > ---
> >> >  lib/igt_kms.c | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index
> >> > 0f1ce03a9..e5ffaeac1
> >> > 100644
> >> > --- a/lib/igt_kms.c
> >> > +++ b/lib/igt_kms.c
> >> > @@ -6946,8 +6946,8 @@ static int get_max_pipe_hdisplay(int drm_fd)
> >> >   */
> >> >  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> >> > max_dotclock)  {
> >> > -	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
> >> > -		mode->clock > max_dotclock);
> >> > +	return (mode->hdisplay >=3D get_max_pipe_hdisplay(drm_fd) ||
> >> > +		mode->clock >=3D max_dotclock);
> >> >  }
> >> >
> >> >  /**
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
