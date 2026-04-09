Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45AFE9DE6D
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 08:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655B610E779;
	Thu,  9 Apr 2026 08:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpOL7LJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB26A10E778
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775725072; x=1807261072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RVtg3mF6vs9GxVIgJYax5lAgLrURMwTgV1uF82nNTNE=;
 b=lpOL7LJnfPiU+2pLF/gB5pMiuQH0QMNWfZDeanFTvhOCTVSS7xgcc9kD
 O1Cxp2QvyIn1q1fU8ZYD2e8kneq3Vxb0fWYyWBsJZvyG436zLrPqodN1f
 7qJT53fTgqdKgATwe3CbwAL5PNvcZyv9SOLzgZp4YDko10UGUeCrAzuEY
 4lh0aXPXIjrX3esP37OmMaiQCnQu40gfm36bWn0gZ+Kpatj2QvYPG+LXz
 PyF6KLBJGVTkHY8hFBiyxfasmy3TRcVT9Gh+s4cQ5snYRluw7oP5XYGnf
 +s0mYJl0w5GwiHAZ1UoKy8qQYB8X3tmoME9ZWBFgDOuIaQdqCiLorgCb1 w==;
X-CSE-ConnectionGUID: T2EOf+MMT+2hfZHg9YQ1ew==
X-CSE-MsgGUID: vgsVN1AkQxy4rbq+oLd0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="79312674"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="79312674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 01:57:52 -0700
X-CSE-ConnectionGUID: 48r3W+LdTg2j8vNPxKqiXA==
X-CSE-MsgGUID: 3WMY9Gb1TPG0OFL/go6UNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="251853466"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 01:57:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 01:57:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 01:57:51 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 01:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzIOcZhY4g8HGlSqxc9jn1lDt9JCdPMaailgAelxYSP+IQbX19Fx789zNNrtwFgVyFppYc6kPGD//zOOSVuj5fCvUfa1dKbU5KMuCrOOHqF8kUelcgPkLsKqueyPv1nG0/8Y3T8nuTc9zu+Zq8AuwcMnfGaOygQutAZd6y4QyfSwXqigtLobSydSVOTW4oxvfygX1vRKIni2veeBi5sFE3ZayaO9eWT7//koLBwvnBsAJ/gHQIaQf8O9SOgE0eCqXWUTBU3uSTbJBkk1tXk5h2PkX93YjA4QGtkvuIAffi342XcnK0fpa5GFbWb8g+yDRO8n9r4kPHTcDG5NDCGUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BS+ewlthevmkOyAx+CjZF65cYkAWGZjoapTYJj9Qmg=;
 b=JsRKwWasHap4e7Y7a2iq93mwSdpFl2+Rwsv/ABYW5nCyS8cOFWj38BKbGgMz7uZAKa/S+tQrw+sUNKZn3Q1lVEKly0MEai8gfpYtgq6KkENMcXlj8v1yPY5tnsDmsxzYjT8yfWLxMnub9RxzbTTGSsxMk0Kv5OT2kRV9a7mKcxBb9GMlZo90DTlt8rM/Xkp4UHP4OPahHA/CjIaoDOWV4asOsYDiXUdywS5nGx3SllnJUypCkHTf/zzRm9fU821Kq580CfefU5bDfghxHcsuzWrIQyElnwl97Af0WB8f8DurbKIGXeau+rYRlpWYi4pl+Uw8MMqegMTJEbcUxpLD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 08:57:42 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 08:57:42 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external panels
Thread-Topic: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external
 panels
Thread-Index: AQHcxnTcgtQFP2dEDk2zRY0r+m5D7bXWZ0Gg
Date: Thu, 9 Apr 2026 08:57:42 +0000
Message-ID: <PH7PR11MB60533AC5B809DE83844C1009E7582@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260407095234.1728691-1-karthik.b.s@intel.com>
In-Reply-To: <20260407095234.1728691-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB6860:EE_
x-ms-office365-filtering-correlation-id: 1b161bd1-1fab-47e8-f7de-08de96160f22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: XgsOHZeWcvJVNuNtykZryf5MzwaB/fpH5c6qefcRYN6yPQ/aQRgH031FUcYwWxQj+5owtEGdm8+JL2aPA1ohfF2jHtYM5ZLTC8imzCk4UvJK8oYhxGmfBnex1MT6BOcC4okg6NGHKzkFZvqfk65qmHjjJHmG4LpbBfLQMlJ8dpjK9cJNGASvgw3XNU8Gwu6P74CSaPepprQfhDPrcRkiRAzrEodh1nTO+NlnU2qlFXV1T+QS4eTfuPrfoyY8A5ty7/mTCaP7A3r2WT2sjEAHVv8p2b4kacW05B+B0AEo8MADKYcx0kP5IXdId46YsTaNL4zABfFFj1fXMcXCeTl6NGWgrJpOneJGEfRZPZejeawdNnTbI7fyLtR4cxGMrEW2JveUD+YFBxAvcClqjfWt06cIWbcEdIA0bQJE6670eKJtwyYWtQKIwRaKzjoka/fLMB52z4wv/2K8KGA/pJYkXgp7yKKwASaqLEC6/GWNj1cvLpQYegK6Iutiuo87bnSHLVcpoMlK7aPLcHuQL0gtxbEw9DvmzPm73RFlJA01EbZSZ9/IrdH+hXWDkY7EYkM/jWHUkYl8S2vXs4EhvM8Ph8x5Kzc2weWAdG2hesJU6NLu1RT3LT46CXM2fVC9Ufh2ZEkkmtRdV3jTI4gSDpv+OL8km2tKilFoEOwPbSl8yBQy8DQT+slVQC1W74JseSAFd0+PFwSBue5cMFvnULLJTnSVyUm00Wz5TFpr3AcGa5W0vwuYUEoR6PdmamEkYrtFjXoKN6UqnkR/3EZngzKD1PPHbK0vEVyEI+uF9mfIyU0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E1j6rocLOy4gu1Vsb1tsxccjD+JT7sYgm1ocy87VO1HooNsQcw8Qp5kDt+6x?=
 =?us-ascii?Q?MUWEgiV/RtkkWPvkbXhTvF+SPbublyMBRPc/8ChIATj5baUl6W7ZW2p6oWXq?=
 =?us-ascii?Q?moOFIAwO0o6GsO10vShIC55Wrd+aZE9qo4yGdzDVIrQvGWfrRCfKYYhiU73c?=
 =?us-ascii?Q?C9an1tG4hMpRuY3Z20p2f32inFb7FPv10z2VfAheSzoTdY/PAawMVCAiYwiH?=
 =?us-ascii?Q?zo9QvOSQ4L9dQWg9cxIzb8fjXwrBcxUgnkxVysGICHf+Qx32k15A6wIMzbx5?=
 =?us-ascii?Q?wMo9vvREaEjLUIYwhjSWrVos3oPhrDSMwQj6D40fmlsCxZFoNDO6zUteA2TD?=
 =?us-ascii?Q?SzjKgKAoRlXzdA6vNaDLDMWgPTtB6P4cmPgNlbV8WQw4LPucRRD4DJl+aaMz?=
 =?us-ascii?Q?/lbGyy7hiqQojnQjoTe/q9wyqb97c5UhykEiUAf5yVJuv5oDCTLGuKp5mMLB?=
 =?us-ascii?Q?H/NG8YFdh905hgRDwsfJHSNn174tSUqFJyRYh5hUx25smyg5ZuSxBkNxeyhb?=
 =?us-ascii?Q?nX8ae2kZ2NYDKYu1re1ZmNmDFcsoGVb/c8Wt8nHpJvZ+UqRq0QCiiOMJlQwb?=
 =?us-ascii?Q?bpjhUz6PS/dnIr/wktM6QQVu87rn6tMhhqzlhtkAczoR1Y3YIKtuBR4Hirtp?=
 =?us-ascii?Q?DSUkg19hmsJ4AxWhyVBpF/OQEQp/CRQ6bxfBavfZO3CKUl29i2SA28+7cCIv?=
 =?us-ascii?Q?Plw80df4YEKbtoJY39Y7ko/SjybpMgSngeAH9JU5wwqGXO/shgsNQRVdpTPK?=
 =?us-ascii?Q?873tYtJLEjShbdJNB7B+5IUMQIO4VIeOKc8700SutJJWSzBCKrJjMsMUB23F?=
 =?us-ascii?Q?NF7uTUpiSKOGidZ35Bxfh1aMm/EvcVug0b8kjMLLkgnYR4jqo+0XkaQLexAn?=
 =?us-ascii?Q?/7RDT0pa9Bk94DEnSGjqmg0v5ac8yMauXVNQ/ZWhANKi0Jn19UuYkA7XoKqB?=
 =?us-ascii?Q?vJ/HbixHkWWC9eb5jmgeGSJI0Hl22mch2HGQ7pGetDop+4gbY2qVuCTt/5Nt?=
 =?us-ascii?Q?d9NUSK9n3+kn7i2CSzJanu8Mh1oHbc3/XnfK/H6DEZsG8mXqwNHsAugi5eg2?=
 =?us-ascii?Q?rRc+7KZ1FJy0+HiYlniTZ86sviJX17xzgrRd7Mv1Io75kU4XFC1ORC4JKvrd?=
 =?us-ascii?Q?9HmZ4Qbt0vNHDdeaHhzb+M5CIkb5B9+42kKDkGlBdZxdOc953gHHCW1fhfiG?=
 =?us-ascii?Q?PMW3cZERt38+p67Th1YaOuEtzfHhmrX1ttLA6chsc/hDYzV875p0lkplVlUr?=
 =?us-ascii?Q?nHqTS/zFizFn67R9GjqNfyOp45G8JMc8l52x8gfq0WTSD6Jz20jTMeAkJ7hO?=
 =?us-ascii?Q?+ahpIq2gNuRH1AdEZ+EfuXSqf/w3r/3IkTn3/LZCL74W9v5jf+xuix9UKE+J?=
 =?us-ascii?Q?C1eUYhx6vTqo88rqTnGSC4ewZUliwL1xbuZ/+dJ6MGa8mtPe4H4pqqEQnLHR?=
 =?us-ascii?Q?cBDqRgDIr03eIk8E9I3C8rA+S37GPEI+MrKbUNMTUlDtk0sP2Bf/9vkE+/80?=
 =?us-ascii?Q?Teb0mlWu2u6Lq1U5wF4wV4Odf1k1jVlkr/Hq1Yyy72bT7VDtVzM/EOYbVO1Z?=
 =?us-ascii?Q?btLCsXRRJtzCCdldWdDtitmza3isDRkJMdEHWliW0PqSYXkEfNFtfODr/o8M?=
 =?us-ascii?Q?Fa3dzDLd08MUsIwjIAtZ60ejHipYUxBnfcCFVx9N9RlfkBEBboWoFCzQZ3iY?=
 =?us-ascii?Q?m/RUubYROI7yCnPa4QRGugdgWl4cy2M2vb+0UM4gBtBLQLMo4J/5RLvx6oQP?=
 =?us-ascii?Q?s3ceAQ07/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dXffJIEFmYRgu1UT4rxRWuj8CoRv4IqqEFjHtkJQXTBW6zWc7pXaDC7An/pgM315EntE7f7vyPJepCGp7uoQze6Us3Vmi5Q+sorVUJsYoB98b7ROGlYyww2nASfAV6Skb2tEgbY0p8xDnlSTBh++W+kkt68f9zvwOaFOMwkFKbmMnLvVzBDz+88qW9O1e6j55OLyac9PA+hIGkQ380Sl9CAPiJX0jYoTsgG07xc5ZY/uIPWV6OKbA7fnE3FanTXzgd8vsGM+PB4fkZyTgxxKk+K5BHXBE4C7z7JJYrTAALIXYgSFEKQsnDChKSWwK2H9rFQegfmqusPXRmvw23hWVA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b161bd1-1fab-47e8-f7de-08de96160f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 08:57:42.0396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g18ckZUgiyhts5klAXBrSK39pMSfq7/Lx3gHBDF1lJdEayKnA1yd89lMrCxFvZrnI6u4YPf02fkolYxqkvFpEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
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

Hi Karthik,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k
> B S
> Sent: Tuesday, April 7, 2026 3:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Jason-JH Lin <jason-
> jh.lin@mediatek.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external pane=
ls
>=20
> Currently the test is rejecting all the outputs where the mode is not
> matching. This is leading to excessive skips on configs wherer the tests =
were
> passing previouly.
>=20
> Instead of this, use default mode for fixed mode panels if the required
> custom mode is not found. And use custom mode for external panels as

The current code always uses default mode on internal panels even=20
if the custom mode is missing.=20
Imho, if this behavior is intentional, please update the commit message.
Remove this " if the required custom mode is not found".

> these are allowed and have also been passing previously.
>=20
> Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_bw.c | 57 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>=20
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c index 4df5c2cee..4a32ec811
> 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -186,14 +186,16 @@ static void force_output_mode(data_t *d,
> igt_output_t *output,
>  	igt_output_override_mode(output, mode);  }
>=20
> -static bool output_mode_supported(igt_output_t *output, const
> drmModeModeInfo *mode)
> +/* Check if output has a matching mode and call it out if mode is being
> +forced */ static void output_mode_supported(igt_output_t *output, const
> +drmModeModeInfo *mode)
>  {
>  	drmModeConnector *connector =3D output->config.connector;
> +	drmModeModeInfo *default_mode;
>  	int i;
>=20
>  	/* Virtual/forced sinks support all modes */
>  	if (!igt_output_is_connected(output))
> -		return true;
> +		return;
>=20
>  	for (i =3D 0; i < connector->count_modes; i++) {
>  		drmModeModeInfo *conn_mode =3D &connector->modes[i];
> @@ -204,26 +206,32 @@ static bool output_mode_supported(igt_output_t
> *output, const drmModeModeInfo *m
>  			igt_debug("Found matching mode for %dx%d@%dHz
> on %s\n",
>  				  mode->hdisplay, mode->vdisplay, mode-
> >vrefresh,
>  				  igt_output_name(output));
> -			return true;
>  		}
>  	}
>=20
> -	igt_info("Mode %dx%d@%dHz not supported by %s (has %d
> modes)\n",
> -		 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> -		 igt_output_name(output), connector->count_modes);
> -
> -	return false;
> +	if (output_is_internal_panel(output)) {
> +		default_mode =3D igt_output_get_mode(output);
> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d
> modes).\n"
> +			 "%s Default mode: %dx%d@%dHz\n",
> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +			 igt_output_name(output), connector-
> >count_modes, igt_output_name(output),
> +			 default_mode->hdisplay, default_mode->vdisplay,
> default_mode->vrefresh);
> +	} else {
> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d
> modes). Forcing mode.\n",
> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +			 igt_output_name(output), connector-
> >count_modes);
> +	}

Here since we are anyhow never using the requested mode even if we found it=
,=20
A suggestion, can we move this internal panel "if check" before scanning fo=
r the=20
requested mode for loop earlier.

For eg:
Void output_mode_supported() {
	If (internal_panel)
		Get default mode and return
	Else
		Scan and get the requested mode if exists and return
	Log & force it.
}

>  }
>=20
>  static void run_test_linear_tiling(data_t *data, int n_crtcs, const
> drmModeModeInfo *mode, bool physical) {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> +	drmModeModeInfo fb_mode;
>  	struct igt_fb buffer[IGT_MAX_PIPES];
>  	igt_crc_t zero, captured[IGT_MAX_PIPES];
>  	int i =3D 0, num_pipes =3D 0;
>  	igt_crtc_t *crtc;
>  	int ret;
> -	bool has_supported_mode =3D false;
>=20
>  	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where
> they do
>  	 * not give the numver of valid crtcs and always return
> IGT_MAX_PIPES */ @@ -242,14 +250,26 @@ static void
> run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>  		crtc =3D data->crtc[i];
>=20
>  		output =3D physical ? data->connected_output[i] : data-
> >output[i];
> -		if (!output || !output_mode_supported(output, mode)) {
> +		if (!output)
>  			continue;
> -		}
>=20
> -		force_output_mode(data, output, mode);
> +		output_mode_supported(output, mode);
> +
> +		/*
> +		 * On fixed mode panels trying to force a custom mode can
> lead to failures or
> +		 * implicit handling where the default mode is used even
> though custom mode is requested.

Line length exceeds 100 columns.

Regards,
Pranay.

> +		 * To avoid this use default mode on fixed mode panels and
> +		 * use custom modes only on external panels.
> +		 */
> +		if (output_is_internal_panel(output)) {
> +			fb_mode =3D *igt_output_get_mode(output);
> +		} else {
> +			force_output_mode(data, output, mode);
> +			fb_mode =3D *mode;
> +		}
>=20
> -		igt_create_color_fb(display->drm_fd, mode->hdisplay,
> -				    mode->vdisplay, DRM_FORMAT_XRGB8888,
> +		igt_create_color_fb(display->drm_fd, fb_mode.hdisplay,
> +				    fb_mode.vdisplay,
> DRM_FORMAT_XRGB8888,
>  				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
>  				    &buffer[i]);
>=20
> @@ -258,10 +278,8 @@ static void run_test_linear_tiling(data_t *data, int
> n_crtcs, const drmModeModeI
>  		igt_plane_set_fb(data->primary[i], &buffer[i]);
>  		igt_info("Assigning pipe %s to output %s with mode %s\n",
>  			 igt_crtc_name(crtc), igt_output_name(output),
> -			 mode->name);
> -		has_supported_mode =3D true;
> +			 fb_mode.name);
>  	}
> -	igt_skip_on_f(!has_supported_mode, "Unsupported mode for all
> pipes\n");
>=20
>  	ret =3D igt_display_try_commit_atomic(display,
>=20
> DRM_MODE_ATOMIC_ALLOW_MODESET | @@ -273,9 +291,8 @@ static void
> run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>=20
>  	for (i =3D 0; i < n_crtcs; i++) {
>  		output =3D physical ? data->connected_output[i] : data-
> >output[i];
> -		if (!output || !output_mode_supported(output, mode)) {
> +		if (!output)
>  			continue;
> -		}
>=20
>  		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
>  		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]), @@
> -284,7 +301,7 @@ static void run_test_linear_tiling(data_t *data, int n_c=
rtcs,
> const drmModeModeI
>=20
>  	for (i =3D n_crtcs - 1; i >=3D 0; i--) {
>  		output =3D physical ? data->connected_output[i] : data-
> >output[i];
> -		if (!output || !output_mode_supported(output, mode))
> +		if (!output)
>  			continue;
>=20
>  		igt_remove_fb(display->drm_fd, &buffer[i]);
> --
> 2.43.0

