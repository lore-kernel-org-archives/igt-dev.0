Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C76CCD193
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 18:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80810E235;
	Tue, 14 Oct 2025 18:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbhHNlIX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD7E10E235
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465362; x=1792001362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1UeqKAYlmoxlk7Cl76NmQv97sFj4FuW/K6meX8MCwh0=;
 b=mbhHNlIXtUBS1cZd84t91i/pcxP8lBDzfQcgQOv7l+FSLsGzVrr6UHt7
 WQP4vo9ayl+3gBNBOYTskPIahCDONoV0q63p2aR9538XdjQJmulw/7Y65
 rRBvyxCYYZGefKaCDuUoQX8cSmXShL653/i3nsc/Vg4GCgP4B4IBbrea6
 ApC8tvcZeULqk0gLMbXZBMao/LYCaL0Ff3p7Jq1w8TF+Gfboe13jrMpIh
 l82nT7CBvHRdDQOFzEe0STTGABBW+P5lZ0kGhB/+UtAVWmrf10aLdk9Cp
 Xi6UVMlZA9NXJPX8lihtQa5cZnWoC+TKKxygsLVY5DHMpy+jC9Ws6d5ej w==;
X-CSE-ConnectionGUID: VgltstZZSaKcCvF/wHzzqA==
X-CSE-MsgGUID: 6qD/NTXTTd2azIsM/ps1Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73234826"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="73234826"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:21 -0700
X-CSE-ConnectionGUID: zs92xnIiToOydn55FhkrYQ==
X-CSE-MsgGUID: XUyxxe/aSPKaxfIwguHKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181501536"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:09:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:09:20 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3rQxzn/K9Kv1HwKg/RUEgeE2rWVk33DGknetispBQHm5CB9AGC17MOgftzCy0b81SPXNHGIgqetD1XlHXVYFH2akc48+Z0QDnilybdLZCBuJ2e1sAEIUG+6yqipuuK42kUB8JsXZuLPNfinsAcNdOeZRaBACxXkrDwrP/aheruJwvOk1JVGJatA859VdwPNzwVImek3G6QgI620PL3uGAeFrTTpJM1raaCea7gxecuXApufkJlLtS3BqG4zBe779xUw1KH2Sc0Lphj2gtoz9n2P8vM6Q7EmwXnkFjXN/qG7+zdw2tz5U0MTC2Wb3MzGENm317qCaH/UlnU8hYSZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAr/eEcYytCz2XVWUVtcA8J+zFkGPoKAIaAJv2p+KPE=;
 b=SjTzuCfpfJAUGOSFeAyPGyBM0KGYj970GOm+zq13aWIbF/EEuCze1KCQN5pzjDumK8r78ZIb2MFqZSJ/aiTgxAZyIBAguVqYgpcEq29Pf/gx2mNTmYnoi9uf4GIk6obmZ3P02xpBL6ZBnxFL0rI0gAQMBcL2bcVU5wOx6PRKbGEhtzVs7V8qSqHWYbIzMl2cPLdQ7a6FAhSc1IXMxvm3TotNb1vCU7V67wr1aQiq5J0vWygKq4+FDtQkK41BU/672IKpxK6ER2dJEUrRBi1yEVI3f8GwjLZyid6u/RZJhKFx1xEkupxMQ5oaLcA1CCBFQQPBkE4und/57A008Fetyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 18:09:17 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 18:09:17 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Thread-Topic: [PATCH i-g-t v2] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Thread-Index: AQHcPQkBU7W62ERzbEa+SH6rbAyYr7TB8M8g
Date: Tue, 14 Oct 2025 18:09:17 +0000
Message-ID: <DM4PR11MB6312B7D146A2FD95D54A295890EBA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251010085708.273552-1-ramanaidu.naladala@intel.com>
 <20251014124854.425479-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251014124854.425479-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB8658:EE_
x-ms-office365-filtering-correlation-id: 724f43b2-5de3-48af-5fa1-08de0b4cca85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KcT8g185/Gs3Kwd3yR/4K+jNGPyRqQhjiNIeSS/U08Ak4C7TwY98y8d8kg/H?=
 =?us-ascii?Q?iTI8SgmT+8J2gBeSPyI8MLatULqzGW9l4F0oMfZKiKQHj3Ji1/ahOnT/CTLM?=
 =?us-ascii?Q?Qw9+0nYPgIgDS4P8LoGtrO5Fkiqp2dzB5ZFXWPt+F3p+rgNzpUEIFpObwb4v?=
 =?us-ascii?Q?lb/oQ7AsuCmgkFdCCGaDosF9cahBrRcyDMNKLsSD3VP595ejf6xp0euPA/iT?=
 =?us-ascii?Q?qbzqW3zxbK0RAeb0TWG3wU57WvILWN/ERuTma2jcT4bEWhoejdxh7GxPUcrv?=
 =?us-ascii?Q?SEX390vSufNzpYrhCaF+Qo0qY+7jU3Z9uh/RqMiiznF+NiNdVm7CX2hVNWzV?=
 =?us-ascii?Q?Jx/c7n/41YfEf9RLn8Ey864/VtobmctdrMDgMGtNa4V0ndG9Qu6swrj0kNY2?=
 =?us-ascii?Q?u3JtS8VWsduPk4c1+2jkpcxiboiN+uX92Xr+8pcPAocDcx3JICAgqXbEjT/j?=
 =?us-ascii?Q?XHYzv5m2YR+CVblK/l7rBIU8y04T2fx6M7z/EHWQ7QBveX+J7QQYW2pSBstE?=
 =?us-ascii?Q?OEjrlqmg9MEINYvLoXraT0JxVNOoZ5Pe/9/TCcPT5kYuG3Vk3tgV8f92dfw7?=
 =?us-ascii?Q?zwQRgn3ZPfyGu/7H8nAXh+HRM9vjyGe0+31y8KXEyQS+se8enqKSU4qAz7mY?=
 =?us-ascii?Q?dLUTf9apYGdpQmnbe/E5JrPaTr5X6MXzpL0EjTDFZxQT5FP54mZXcbjyPFC0?=
 =?us-ascii?Q?qpb3yYBjVKnRmAl+mwFU1NbLdVNwcFG+vKyjc+uXJe7PWWw5xYiZ8iLL1Mi3?=
 =?us-ascii?Q?HKBN7WPFsJ1C2AqyBumNcoYmtGekWU6GR+tUnER9OzVlePvRI2bJ33MBSC+o?=
 =?us-ascii?Q?7UhIc44IKAFVNKoWjwQ3iRJKO0u9f6HTD9cScPixH+/JdKHaPMpOby1/oHrU?=
 =?us-ascii?Q?h68KHlBDPYdHMdDSislDLaV61P2jQbND7W3fiFBLAyH/l3C49ZYWYbOHZ25m?=
 =?us-ascii?Q?hsY5ivXxMRMI0yMLNm4e6oNq0unV6K08SoEgWkmAJauwj2NKqGDwuTLZjbIN?=
 =?us-ascii?Q?trB9c0S4YuLuODRzWRcKV0ScsM26WpnsQmczPHiM1Hvg8bf2Va60ghKyp4Oj?=
 =?us-ascii?Q?PiZ9MQfavzNevSiysG8rAsXoWOeqRvSN/MFtG9INoH7x1mhWlRa3OP/ABYze?=
 =?us-ascii?Q?tQiZkkuWg6lPzd6qucLvGkcaA0fPLBBtyHQVFuRfzplXaER1WCKfiQW9SwHt?=
 =?us-ascii?Q?rJj6M7b6s78X5Nm53Tu3MK967FUBTYiIMEuI5u3FO3C6Qt6AiVf1ZwT4kY4I?=
 =?us-ascii?Q?2vGRgKS5ANswqNPj4g+epR3nplNrjbf9lW8WniTwP60SQ1qSs3SljxWuU+H3?=
 =?us-ascii?Q?T1x1EzpYXYDzh/zmwmGoeM2gPxBHNfAlZ+muPyy31jcnRq0cp+weXINMgB+t?=
 =?us-ascii?Q?/Kt9nAIrcYBlqSs52iUuP8bEaPplYoFCtRi+0IKlVOEZ9h8UyaGiBOIP0r5p?=
 =?us-ascii?Q?o7VnLy/iYGYiw2E6h9YFVtI8uQm46YxcrkR17tbh2Nwh582EreGPGxl1p6AQ?=
 =?us-ascii?Q?mZ8ggd86dWOzHVOhtPGc1XNPF8F9Wq0+G+lI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FGy6K4M0lifYZrD0KJ1UVMjJDeEoNSOCve+JSYq/TcyXRPz6cc1Jki18QRde?=
 =?us-ascii?Q?n4J68fCXY5sdHI/DLvWb56Hp3wRTbsxj6YZcTOX7ydvnm0exLvKCprkm/Y+D?=
 =?us-ascii?Q?kS4jZf7a3zjdUmQeCPKEGtAyfvo5LHIrXXDGd/oNoGK33e/7lbq/ZSIMcBZD?=
 =?us-ascii?Q?aDeuhB6UWXxZL3uDEnLZRXA1ZMwcoMZ6pfb+O0s01H+1vAN+cNbeO4724ea4?=
 =?us-ascii?Q?9xhjxZAoXb/HxSrVZySa7GjWGmyPUzrlMN7ZYnu1TlcO4aiGU0XfZtfed7BI?=
 =?us-ascii?Q?q8pWd1PdhJsaP2lD7F9eOeMCxzXyqkmE66sBufstu7ZcaZ6l80dFIKUvbOjr?=
 =?us-ascii?Q?lBmS9TnXVTeNFrg4Zk/WiFkqSFCV9egyx9rDXIflSX+7zaMNE7cRIBv4g59W?=
 =?us-ascii?Q?pIM+XrE4R8fptYGGXDBDAVax8CLQ6yxz0uB63XOmZpI0A4my33ucrUKGj6cu?=
 =?us-ascii?Q?dmJFeKzv61xZ3w3ATFIKdF8AwH0LnVITBLZy8XfkHNVwlqk19nr7nVwsKHLy?=
 =?us-ascii?Q?Yq7kjVUqeY+s8nJpw+xTTKCVaKfae+gnCfUR7ICTUSkX/aXkvOcYhdZb3AgE?=
 =?us-ascii?Q?JFph+UtCkF4eD+SAnTtHb+sHNjXovc6fymehVwJBoXftpoL2BwRnY5UYCrLT?=
 =?us-ascii?Q?ktcUIbswgsJH0+VSIJV/haypCT9JUmx+jSTVcC69FVCI7CSUHyRw008aZg4T?=
 =?us-ascii?Q?u0lfy9xcDZTXP/DTx42Mmd2cexhYFf+iVwVa32A7/mMjovE8W/U3sGN4TTY0?=
 =?us-ascii?Q?bKF7z+T8UYM1WLYSBLacjQZVOAo13X512YethuYwdgwFU1xy3fmQr85WQ7XZ?=
 =?us-ascii?Q?+Tv+8x6tSlPSsWTEaCbC5l22Nk3vx3bCcPBsSMOOjUDwrnmcRme3IzFk7Xgo?=
 =?us-ascii?Q?DxWypj7eUcmK3ApK8zC4bXqW5Vg9jncqrUUg9zZQQIE5EENDTySunVYQlD7I?=
 =?us-ascii?Q?BhH9wgCZDdQ6HpvzutxQCMLnYn7BlPU8JNFjtzi5WSE7j3xjFoewfWBA6dkA?=
 =?us-ascii?Q?Gn1N51sp07uiwL+hLJJcsmDfGRiU4QXbVcuJYk84AceiFjMtXCUzAaW2M7Hd?=
 =?us-ascii?Q?SvymE0t9Pmggsi+Hl3pose5vr5zq9y3WvVN8mDgLCyQ33j0r6/QXp7YNM3MA?=
 =?us-ascii?Q?jUzBY6XO/3j0j/zoMT11JxBpQ7MUU6yJ6gD8P4Md+w08jFlXhz8dg7vRG2ec?=
 =?us-ascii?Q?IJKBQneCKrIcgMUW2iehYJFX4e60I7Qucclwfbu4Z5cHrnr7E0pZ9NvSRy2g?=
 =?us-ascii?Q?F3pREgXclijFeFa6wiJ/5k4aq73wo8mqsFix0+KQn0ncQe6hYci+Cvy8atpi?=
 =?us-ascii?Q?XG4ewqv3x6SjwqKBaAn2VTINm9ez28s2kjrZ8HHmWfnZ8KVGX/FtKY4yo61S?=
 =?us-ascii?Q?GYFWrRaIm3DjpDMMPdJ0B3KUQUFDDTc+B+cKUvBH/Aovy5MOGp4x1n2fId3h?=
 =?us-ascii?Q?DhycE050/p6hl7C/aQCrYCnCv5sEXyG0ABB5UGpx2z0MnMgTNDPGeSG5/0IR?=
 =?us-ascii?Q?7xOOzIVJ4wKF22nHvzaMaPGmccQkJ7LT671bsiumP4VLe+vXalIlGYg9SD21?=
 =?us-ascii?Q?j+HubHy0zuAkCLi1O94=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724f43b2-5de3-48af-5fa1-08de0b4cca85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 18:09:17.5963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v2Ae2BUNULusxIv5Eq/2q17kPWl/ZvLnnVrcIP3rbe5t0fVGkixNPQQQZ6wkt6EBV8SQ32rvw/OogZNQ76Pp2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Tuesday, October 14, 2025 6:19 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_vrr: Dynamically verify LOBF across v=
refresh
> steps
>=20
> Replace the static LOBF check with iterative vrefresh stepping to detect =
LOBF
> enablement. Add a configurable mechanism to control test output verbosity=
,
> enabling selective suppression of detailed logs under specific conditions=
.
>=20
> v2: Add info logs.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 51 ++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 15 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index ee0f057d5..23722182f
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
Change looks good, I think we need to split the change into 2 patches,=20
1. For log clean up between lobf and other tests then=20
2. for stepdown logic=20
> @@ -154,6 +154,7 @@ typedef struct data {
>  	vtest_ns_t vtest_ns;
>  	uint64_t duration_ns;
>  	bool static_image;
> +	uint32_t flag;
>  } data_t;
>=20
>  typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t); @@ =
-512,10
> +513,11 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe
> pipe,
>=20
>  		calculate_tolerance(&threshold_hi[i], &threshold_lo[i],
> exp_rate_ns);
>=20
> -		igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected
> rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
> -			 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i],
> threshold_hi[i],
> -			 (float)NSECS_PER_SEC / threshold_hi[i], threshold_lo[i],
> -			 (float)NSECS_PER_SEC / threshold_lo[i]);
> +		if (data->flag !=3D TEST_LINK_OFF)
> +			igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz),
> Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f H=
z)\n",
> +				 i, rates_ns[i], (float)NSECS_PER_SEC /
> rates_ns[i],
> +				 threshold_hi[i], (float)NSECS_PER_SEC /
> threshold_hi[i],
> +				 threshold_lo[i], (float)NSECS_PER_SEC /
> threshold_lo[i]);
>  	}
>=20
>  	/* Align with the flip completion event to speed up convergence. */ @@
> -581,14 +583,18 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
>  		while (get_time_ns() < target_ns - 10);
>  	}
>=20
> -	igt_info("Completed %u flips, %u were in threshold for [", total_flip,
> total_pass);
> -	for (int i =3D 0; i < num_rates; ++i) {
> -		igt_info("(%llu Hz) %"PRIu64"ns%s",
> (NSECS_PER_SEC/rates_ns[i]), rates_ns[i],
> -			 i < num_rates - 1 ? "," : "");
> +	if (data->flag !=3D TEST_LINK_OFF) {
> +		igt_info("Completed %u flips, %u were in threshold for [",
> total_flip, total_pass);
> +		for (int i =3D 0; i < num_rates; ++i) {
> +			igt_info("(%llu Hz) %" PRIu64 "ns%s", (NSECS_PER_SEC /
> rates_ns[i]),
> +				 rates_ns[i], i < num_rates - 1 ? "," : "");
> +		}
> +		igt_info("]\n");
> +
> +		return total_flip ? ((total_pass * 100) / total_flip) : 0;
>  	}
> -	igt_info("]\n");
>=20
> -	return total_flip ? ((total_pass * 100) / total_flip) : 0;
> +	return 0;
>  }
>=20
>  static uint32_t
> @@ -870,20 +876,35 @@ static void
>  test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t f=
lags)  {
>  	uint64_t rate[] =3D {0};
> +	uint32_t step_size, vrefresh;
> +	bool lobf_enabled =3D false;
>=20
>  	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
>  	prepare_test(data, output, pipe);
> +	data->flag =3D flags;
>=20
>  	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u)
> Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), data->range.min,
> data->range.max);
>=20
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>  	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -	igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
> -	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[LOW_RR_MODE].vrefresh);
> -	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> -	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name),
> -		     "LOBF not enabled\n");
> +
> +	step_size =3D (data->range.max - data->range.min) / 5;
> +
> +	for (vrefresh =3D data->range.max - step_size;
> +	     vrefresh >=3D data->range.min; vrefresh -=3D step_size) {
> +		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel
> refresh rate\n",
> +			 vrefresh, data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
> +		flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> +
> +		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
> +			lobf_enabled =3D true;
> +			break;
> +		}
> +	}
> +
> +	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>  }
>=20
>  static void
> --
> 2.43.0

