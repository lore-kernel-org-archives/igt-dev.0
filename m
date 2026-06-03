Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1931CD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 09:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7300F10FACB;
	Wed,  3 Jun 2026 09:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGtR/n11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEF510FACA
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780479412; x=1812015412;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p43BVrsNrZxXvN3Cz/aWiCFm5b4F+X5xr7WIWP10Gok=;
 b=TGtR/n11jlezK4gTSUB/9faWIlCLbtitVr3IhkWIbSFJ97g4dcF6DEzF
 K19ktbYzfEaMVxfIDIMZrRUfY3nwbpOZ++xccU6SkjtSZRuXS5gViWNcT
 IKCAg2jKT2+G2sXe75ie3JT88qrVyCDYH0Dh28HcgaDPzWVWPOtco9boH
 2nt4SgngdIKj0GNhgJm6l2VdPK6U4Q4ty+rzDAn8VKm8cd6X581xS7Qg6
 4RQYi+/cGBbvWfDPi52Ie5YVp9mVK3NszKdQUHVo22/tAOCjyAN8o7ELM
 kLaI/96OHZQWL+k32VkXEkAKnBP1gWZs0aQnLf9bubtcy+PGo2vI5IBvm g==;
X-CSE-ConnectionGUID: 2zJ90pW+Rya9iBgrlflCCw==
X-CSE-MsgGUID: /93+BzLXQjSFOhfBiSboQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83859865"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="83859865"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:36:52 -0700
X-CSE-ConnectionGUID: MrajDlNeQ0+sgFK3Ae1ZDw==
X-CSE-MsgGUID: lbi+wmNJSTGXnO7TzVVE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="244013723"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:36:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:36:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 02:36:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:36:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxA0M0yEa39hdvG4H1jtfHKwN0UovZhSaPTnihQzutGo/UvF5SB+RBe4csErtP2LHvXtcoCLSmLpAP6B6RWU9wvCfoXjNRq77GEssDjuOb4QN/mYSIhUp+vMO0PBYJ5KgnX3yJlccEg3UXTuCZ/6EdYvpK+1JsGM4kiPTx0utOKYa1HKhEtVo6Uv0X1MvgEGN21e4+b6sdOucbm2p+QTAAOu1Pligt1BIftLSQEiiqhrNlsHjy7FgYyokPsmlFGMdP26DO+GyuiNUeuDNYeEhSIOZYTdYGmpUZ3APgajNolxcBG7bCXOz/NdA0AH9gflKe9VYieuCnORqfsyZgtUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbU512/Zf36RcZlhpseIKhJnnCB30HzI5qUBlpjlS6I=;
 b=DEk6OF0/wdGxy9JKjZhxVtoHAd1CJm/TY3DQcTn//szQzRta3gRthUwATaxrESfPUNoKHDJkKelbp+l4PIuKLBfY9cWkGzMtveaMJsuVy28rPP4Nq4JsgCyDtn2PuEB+AvCh+lmlyaVbqLzPZxKks3aTs8oIqqARngjODzVh6OxuhaHGaFxl+2UOcszmM0cBEVQqp7gK0i8X6+4rVubozChFkQ1RaaQhRcJFKqiY64Cad7AMjzbjDOrsqKgYwTaQyTvH8NJ2blHc+jHdBwYCFRSDu8NcBrASwECCrDjwNMaAXVWA8sgDFVICTurQS+HefWZMF080e3KzugnwnUd8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:36:49 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0048.013; Wed, 3 Jun 2026
 09:36:48 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
Thread-Topic: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
Thread-Index: AQHc8yuuP2f9PlcsqE6vCuj9mR07qbYsjEqAgAAFKcA=
Date: Wed, 3 Jun 2026 09:36:48 +0000
Message-ID: <DM4PR11MB631277E7C22661CF39FF173890132@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260603073606.2168574-1-jeevan.b@intel.com>
 <1c24b284f0559a5ae985ddedc833c0db086f59b4@intel.com>
In-Reply-To: <1c24b284f0559a5ae985ddedc833c0db086f59b4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|BL1PR11MB5954:EE_
x-ms-office365-filtering-correlation-id: 5bcb8c44-1973-485e-35db-08dec153a291
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: tRkfynD+fi9bqlBreJoQOqAcFw2rDR56YRHQj8K9lLbe//1lVTslLgschF7vuERp2AOMPRF609quRzmOdLByb5SeiyrV/rFhlmC5Y5yltp6464wqYr2SAGYLhVx38c+G5H4Fd3oK13fUm3+Uxy+YUHxI9z0NiKhiglsHMmNhEHTbJgOLC/oU7rMvLAs60n1EklkVWpsQ5ePVhK/LiahWOXlWNC2uef0+B3kBfOeP4+GvVkY/J1kNjd0o0vGlK4E14Z2AtXk3gSoMdZtwdIH8Ps6wnzRK/dFt49VoJLJrOXkWUFTiBj0kt99R8UjH4pBnJzUY2J28xGeq/XoX4zibefi6GgL9slvpommzHtfSzui6hSjIJ1ii0FbWCQGouM/JIsUvRNdBrwKnh2RPbcrk6PtQKuTyWrZaoI1f1CfL1EErtJI2qIu/wDwfy10S0RxVp/xqX24FDDHvU1xR9vRNOk1kIfgIkrIO1sOscXZUAHPTVZrbJcNYquRsaF9VUqrEmsuOCr3im5BJGJw7JCeJ6FfJU2Mva89EwoM9YXtlgmdMgmr3qCtP4H2+85zc0h02W+Dfn51YEv/CmMCQYZ+IS3xkl9YSa2wArP0eXAt8PySPYGw5Tm6BnR/QgN6y3zjuTp5CRoza54WXX1HKI1+G26uD4skmagM9BQz0cjQVAYR8+M0EXNzsEG/vHkovjAyMMhsOkf2NnpETvVMN/3QlPo0pqVdsa6QAP2f0xrTkxRBjMJFNKFtkn6OkKTsScdB9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(6133799003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ov23hWwzxgS4PwAG5V2akBxqRhTDGBWbUd4BZpWzfOUgCqQh7blk5GHl7wA2?=
 =?us-ascii?Q?/+VcNDmqYTMhPnWYDXhZch5oesbfnShG7LhqdN8ePWHWksVjPdrXy6RmTGTK?=
 =?us-ascii?Q?TCRjlvuwSsV9Z/Qhl0sJezxbBqcNeOxhwVyFJxWDD4IHP7I9f/ahNKssfXQL?=
 =?us-ascii?Q?y0XFsUwG4MN35P79sBXRsccsic2CKvuM9Rfuvgjy5/8/pyBdX1U7F9E5Qtfl?=
 =?us-ascii?Q?Kncl+RXFEYolqzLkojaEonbrJQ3R60Aco1dNUsMEbkq0ttS4gllK36ZuubNk?=
 =?us-ascii?Q?2LsC3Acitj3kzh2rrGcg3VgYc5HjEJiM7AI9cZhSLyCQKSbGfiQ6lgC78Jg4?=
 =?us-ascii?Q?/xwboXdvbi8JGGfeUZFnOHMrtHNND7Zk/dd8LK0DPVEGF5Rymo3RzMOuyMwT?=
 =?us-ascii?Q?V47lAep2jGuR6yLEhx7ZBDOXDSas2WEGhlKASNGdTU8PFIdufbpMUTSZayt5?=
 =?us-ascii?Q?BBrMC5a2MDZpQllzBJy6SqI4mfkOthHOTDbKuqS0r4B+zH0QjN4lg+JoFVnl?=
 =?us-ascii?Q?Bp/5nbwKWjFmS2sTGC6Xs6NwJjTxXnyN/Gd0WPHnGkrvNn/rlTQZbJV6A75E?=
 =?us-ascii?Q?k3tjKwjxfzd5aXyLzFcV6gAnR9lvB4AjxrS/gdAIuVPk05RcrMxBdWoxNp9G?=
 =?us-ascii?Q?N/Xa064pK7FCTFULsiqWDoPWdre1BQ90QapElTlPJB70gHrXVpYFsysB/xAu?=
 =?us-ascii?Q?+zg8gJ6QjzmjHhnWoJl5guaqjCjmM0J6bUF8JEojX+9FKkvICpf9DfhhJYxf?=
 =?us-ascii?Q?oiNXKbtBAdSW8xutO2OH56E+NfXF0J49JzZTTBp9UdK+DFOcmwz1Ambw5gNG?=
 =?us-ascii?Q?UXca2SGE3AoMHLO5WVHYp/xxsjZ2HBK2V7PyK+oMl5xPyPiiwew69KrTtuQ9?=
 =?us-ascii?Q?N+0cU54xP6BNm7FJ+4+p/75lCvGY505X6+Rr3qATcCOh4/zat6p0lpeTD1+C?=
 =?us-ascii?Q?T8UvzAOGMaQIDCl8pAKr/UdAVgAo3wFd8aGqeOpIpdnsyzZTnAncF8eI9NIl?=
 =?us-ascii?Q?n0wf20CMc5zUrosAVDYho0RY4ADdTsS+UyP9BxX1isTPwuLCaSL4S0+lsqO4?=
 =?us-ascii?Q?Pl2HzwfKt5JuxBGjBGV//ZsoKMZUXxZ064g7M8ydy0xPdskEAvfbMIlckV+8?=
 =?us-ascii?Q?ILsbNaOhz4UerxxUuVXhss6Mosh+iSkSH+wSoJuni/Q8uAnXkO8gnjeoB5Hv?=
 =?us-ascii?Q?D8oRTri2kngm0KQvXnKUOgXVYQ+7sOIFYHcK6lJvcXaJTXOvZPx4unL4ZogA?=
 =?us-ascii?Q?yjmTjilKe04Rngr/n59kOAH+w3E9u45u84aqX7uJ6O7H13jjNDVxkz79bxKP?=
 =?us-ascii?Q?A8ZvbOsA77sc5r1+ILv/oAWt3EdV+JIhaPDL9OSR2tK0k06CK4Zzj0HsEZo5?=
 =?us-ascii?Q?i/pu0Pp7GTWsHxuyl7cOA4w2D7nP2LXuXR7I8tpg/BgZnqphqaQnSL50t0WN?=
 =?us-ascii?Q?YKSDQNj40cQBSSff7K6jCN2ss3wU2VblmkzNQTgxd9zorlv+DMfwP6f5qCZw?=
 =?us-ascii?Q?DWzsEcOU5/YcV8geHFUt61mxxOKhcy1+Gj82qF5kWae19RWXJHS4H5zYTb/n?=
 =?us-ascii?Q?YSbA3Pu0YzDs/rA1L6/hsOxFGPKNDh+5xOoo/t52Y1Bcfq9RIn9FOlyS+Vt6?=
 =?us-ascii?Q?stYTCafy++CrLVW0bLrylbnNwghugLkWbuHtQ04IXrbtz8vTxqxBM/6R3Dl4?=
 =?us-ascii?Q?4bxB96eZpX8PrOnASf8J8INcG/DeK3IBFM1GnJVGf7JflOxO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OKxu/43mz45VwK+l6yMVl/aAoAziAVOHnUApFSTgkfJbbWbUFuGs0WQVXOdUTq06zsIAz8PsfYCp+K/XPecRbIOyfjGYC7zYC7Tlj5AN/TQ3E0fq/XYJPLRHorPeEb0/I73inpL8/o5TtzhCnGYEFMu/l0TDvKREHbnY2HUiR5kWZTA5KQITOp3NlQPQF/OTNhkXtT8T5WvMIb1Logr4259TSQ/de2Tpl6H71ij+46qmHCLzMPO5QByNw56iATW8vqeq2gqqgr6E2mkM+/Lw4JyxQbnWrjFvkuW3nsI6d/mZcCg7hOElGisT+YOZ52vKvajGYciKKIlpC9R+waREfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcb8c44-1973-485e-35db-08dec153a291
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 09:36:48.6987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JZOwlgXsr2XkRYndBbM9AaBSgbK0JBWVYVxrlPjwyjdLi0AlSUfuN458kwY0Ch3OKR3xZlRb7M+KzaW2FLnrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
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
> Sent: Wednesday, June 3, 2026 2:44 PM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: Re: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
>=20
> On Wed, 03 Jun 2026, Jeevan B <jeevan.b@intel.com> wrote:
> > Use '>=3D' instead of '>' so modes equal to max hdisplay or dotclock ar=
e
> > considered for bigjoiner.
>=20
> I can see that from the code changes.
>=20
> Why?
Boundary modes like 6144 and 5140 are skipped with >, even though they requ=
ire a joiner. Switching to >=3D ensures they are correctly handled and fixe=
s the test failures.

Thanks=20
Jeevan B=20
>=20
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  lib/igt_kms.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 0f1ce03a9..e5ffaeac1
> > 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -6946,8 +6946,8 @@ static int get_max_pipe_hdisplay(int drm_fd)
> >   */
> >  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> > max_dotclock)  {
> > -	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
> > -		mode->clock > max_dotclock);
> > +	return (mode->hdisplay >=3D get_max_pipe_hdisplay(drm_fd) ||
> > +		mode->clock >=3D max_dotclock);
> >  }
> >
> >  /**
>=20
> --
> Jani Nikula, Intel
