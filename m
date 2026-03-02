Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E610D58E47
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 02:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926210E348;
	Mon,  2 Mar 2026 02:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxK0+UUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E83210E348
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 02:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772419633; x=1803955633;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pywp9jwa311wUyakOT2ozREns7G4rnb/vKksobV3h8E=;
 b=OxK0+UUjd+2rc7HGXCsZrIxsAEXexcbvOk62qUqtS9sUhgplu/Fofhf2
 BX1CNFJxNLTeFjnpim2evX8zZeRttrVNdnSon6nzs9JttUgJUEAC6SBjF
 eXYc6vGkkfZKPRDbbcg8Qg2NaZTQ7irRWB+0pQEQn7UwTTtlvR1Wq0Ra1
 NCwlm5rVoqzJ8NLY7m2tObOUlyf+CgfirBXdI1Zfa169Oa8GE+0D5vnQF
 DoQH7NKlrIfIxiBwgT+3VGg/yM++M+Hruz+3OCmbI/kkwaQl+t4PtG51U
 utu81UL3gBckCE8p2UP6uJUt2XRnoaV4w4t0n64ZEUs1s+ec3pBZd7s9z A==;
X-CSE-ConnectionGUID: X5Gp8+ZyRZCdWzDLrioyVg==
X-CSE-MsgGUID: Ib2PWo5HS8iE/A9Mi2JIwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83755600"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83755600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 18:47:12 -0800
X-CSE-ConnectionGUID: W9phQNitTB6GGZYNRd0zIQ==
X-CSE-MsgGUID: mquB584BR0Gyy5+g06AEBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217524422"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 18:47:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 18:47:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 18:47:11 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 18:47:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vfs1wnllAE7Z8dQ8lCANoQeYmygsibeZpQxC7XQuuPqtFIdbd/GjYmcgLjeWhZQaRSUzUdtygaJIY8PyeOovmFTqwsjVBZb8ZDetQZQ+V0FaonWMWiPCLuXxG/HeuENBKX4S13zTirYSYBCo+nJBygEeshDLa/XKteqYWCCvP9q4w6cHUO01qzd1s71fy8Fz4XH/Y1tGgTCnzxfwIeELQq0G08lZ+Loc+FAQ4Hjer/Tb4Zhw0Mf2pr5ckTkuGFvWMZSxI4CXV7xEElkKCQ5TcqbRxZXBLMnt/yqpZ+G7+Wf7Z9hnN9NmebUAZUSqTxTyaKhXt755TrooyC8v1SKe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvilx0jOoFuVF3bUR9VmsoSlb5F6V2Fxy0F/8LkoCdg=;
 b=lZ/2XLDihvdby/zB/2H2D+N4IjTLyiXxEGWUwi7vLvQA1JsAdMsHe7vGHGJxS5FO0Z3CMC6EtagyWB7i1jxFzqa9LIeIq5NjZ6nTECohHuBTcUo0S51qZMs5mW+ch0dF2wo2GjmxOk1Ys6BaAoJDtZ6bzuJj6qir96s35QC4BzqiGAFqWcAOXBoyFrkynJMgaTWj0BHr9jFCXUM5d9D1ge2o96jBj4rRzXypOzlBgkRkxF1c3mnPr2zChQ2uwjtY63p4CnX1QtuMKdxJHxwz8UiaRG06NCuiG3Um2rGtP6iF56CwZSQRECIsE+trqZwM0ReUzrqWDhTuvtTx0izGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6382.namprd11.prod.outlook.com
 (2603:10b6:8:be::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 02:47:09 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa%8]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 02:47:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1] test/kms_content_protection: add debug prints
 and remove non-traceable check
Thread-Topic: [PATCH i-g-t v1] test/kms_content_protection: add debug prints
 and remove non-traceable check
Thread-Index: AQHcp9l1KkBvqCM8y0i/FXYzu0Rcn7WaitfQ
Date: Mon, 2 Mar 2026 02:47:08 +0000
Message-ID: <DM3PPF208195D8DCB3C2324ADEFAA1BD8DEE37EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260227110745.203101-1-sumit.kishore@intel.com>
In-Reply-To: <20260227110745.203101-1-sumit.kishore@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6382:EE_
x-ms-office365-filtering-correlation-id: b3549a4b-9a78-4c8c-92d6-08de7805ff7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: m1JL71f+qOOh5p3TvqzhQa+kHjlVNI3d80n0i4aoIkPqnes6ukiRA8ba1cquNRVm5aTv38VJP52LRQrpZzUlwjUKyzTmsdRSvWn00POq/ZFriwoPzD1gKLsXTMqWprgEn94xc1UBosLqHyEQgv02iHeYff2HswWQJHAj/PfuGGVZr+KKkqS/kVt2novN5UzP2ZmD2zeOZqJyCHq7h5xlHQ3RGoL29Ix27Rqp+nAQo2W4KnJpUMMOvWy8SEbANuKKte6ED/p9/q++QRUK5V/vouLUuTMIPEPOhGgMj/8YhQtvJu6ylycCNY717jJppgbgHwIY/Yja/7JuFkdyFpPbOmHKJK6tDHKRxE9gEuYhIN9CbgcDKcCZsFd5kQATzryKvd4RkXq0qi0tX7WplKL2stxC8q4QHxXAjkEpYKhzfi2ernFxqWkQIDRI36rEv6Tp/JZrjrktV5ChVRddLOOOPreePk8hERuQ/bhGLje5beXxJ4x7a6ZQmRUAjjuWxCTQf88vC7vP7HcZN6Vg6KZoQgzCBCBbAw5hxMklZ2X9p7rnd4AmK0J5hZWrVKxsQqIaGyZME0bcXN69ou5KuNgfwi7hmhxt1JdIPiUXWgBHwxSa+76Mt3xIuiszTLdOCH3OwBtePTjMOHcmM7HfYSlY7iJZeiR0mXlI/2sgrvhScZkzCnMAlizPK3j8Dqr2sC8utK26CFCSwGoubrVfS5VzfuJ+q53PdJfdR8V5CVVUmlAiHbNtb5gvah/Hrbh7AVnlTvfb0izgqWYmgAGr7sW4RsrNYd57JuEuC/s33uHItQg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QhZ/5WOBvVEjFQWbbS3goJw6440kiQlJgZI3XSlsMVJRR7MLjHDBom/3aI8s?=
 =?us-ascii?Q?ipKarfJdWyiGsxO2c4Uy5ZTs75k9WVB0N5gQqncsZ6NENE5NUcZfCxvRRO/7?=
 =?us-ascii?Q?aT6fx1JMREoUAO2X30KwXEXC0ibvG28oQyLl2F9RDIg529vUwUHqBzY8RG6m?=
 =?us-ascii?Q?hwI1U5tXWmEZvCzZJ5diAUsTgxbIzbRMI4LsSC6sFp2mv70QMmBkXIG8Irzg?=
 =?us-ascii?Q?iNugxgAihIuq/+NFByzLpFy28oCur5p4ff3mYCt/n+LdBX7g0zAE3775AcAa?=
 =?us-ascii?Q?SqHkb+NMfupMcUG8J8emgDXKA7LRWzMReX1wH2tPuwpT0mKN+9CVCMn7zuyh?=
 =?us-ascii?Q?TzQ+uqiRKZfwwqpvJUdEu0lqrP/qZ14cID9NzMeHYtCWRLEBTLETCgnV5EuE?=
 =?us-ascii?Q?jn0AILpLBnfFmYIkI8vjDDWzqbMbgRWbeB9rY1zhpHXH2bach2/zK1Ss1YE5?=
 =?us-ascii?Q?jrVes3Nrk4UgyGxmTz9AGAT5+IvpTjXpLxSjdTE/OD55zDbjkEe3zyvX36JY?=
 =?us-ascii?Q?rvg2Iud/4AcBjPnevzOB5p9t2ivE1Oc4LrTliR95+3ln1AGePVqtYZ2RzSM1?=
 =?us-ascii?Q?chKCSiJKxVBmzUVCBibGRy8zzwN0eYa4cNnfLUUHD+6T5e9H9agN4wl7iUAD?=
 =?us-ascii?Q?k9HOfpFPcrUBECI6fSPdfLDJsFZ624nXZtKsFFC15TRTSQoeavsL+RGEzxAj?=
 =?us-ascii?Q?H9dQVblpTUzzg4y6QjsE6E9Yy9cRgmBkV9XhxZmKRE+8DsZdxZckmCTKS76F?=
 =?us-ascii?Q?6dYxF1fMPHr+j3wzVu310QqTUrlLgrJHTAKVq3+RRZiXAJM6nlQZ+py2DHL1?=
 =?us-ascii?Q?FcDSae9/QFeC3Xn7PYEzMHFgykKAlI/hqKsfT/f2TYuZmowSSwlkGNXs67tr?=
 =?us-ascii?Q?OtftfpnkbqnQuPep5VazwKyYwQCKWviP5gsiPBZ6z/7J09TnooGgAFMwvBZu?=
 =?us-ascii?Q?hxaeBn/DBElPvm3F/BD2/wj1Silbw7a5i75p+tBHw7Q0c9EPBjaW0zjDvm3d?=
 =?us-ascii?Q?y3ksr/ZjK6CgOzazGv/HmC0/4pwlLDUZE3EHIfLFOOdLnVDIX/0G4rsJLi9q?=
 =?us-ascii?Q?0Kn1JiNlMhBGEGFZdZDnyPE2ZhE3d8jVVgyauZhBVrDj1L5xzIT68cYjy3fm?=
 =?us-ascii?Q?maXnn8BpSrQJfD/bnAWwF0ROzeVBhzErmpd956nK615IhCDTaISaOar/mJHP?=
 =?us-ascii?Q?YYrdeazgQYjAxao/lkjA9BhlqRmvS7/1KjSpixhqaG3RN/rz8pEUPsVWgdSk?=
 =?us-ascii?Q?GfDhTR/ctKUN6W6KiLXX1e0Db97SeXVQchzT3hE+sD5sXov2o7+asMCrH7/K?=
 =?us-ascii?Q?pKNVWhDAs4VaeuNuf5nSWHdudusS4/DEbHsFGeBklbvQbJqkm+8hvnfcBOb6?=
 =?us-ascii?Q?6Sc4E0kLDPjJfK2kfYL/UsZJXqLaVRsZXPEmcTMzvrDKPhTfJfJwoZezfgd2?=
 =?us-ascii?Q?4RbpXDbxFJ7ubZyViB+jO2AxPReU2DV5GVhOnHOgMiIUSLxx71pbStyHcSe+?=
 =?us-ascii?Q?7YI/VVSUPxQmTfUHaYPl1vjWUi37wIw+64awwY0XX95Xv5K73nDIxxxk8sky?=
 =?us-ascii?Q?W2bwxhQIP+fW4meYVQZ35BIlEqaLd2MjRCuP/pHTjHi4EqtRXwozTdbF+6ff?=
 =?us-ascii?Q?eWWnXekzYrNgp227AvpXYhqY23D+ob8z4Eexb7REKRX0deAhJpeTqLCxPz9H?=
 =?us-ascii?Q?+wXA2der4vMYbcgCmNTg4NgaLon44MTONYNj4Yjan6yPciiOaNwrP+myJoXd?=
 =?us-ascii?Q?BK0lrrxmoQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3549a4b-9a78-4c8c-92d6-08de7805ff7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 02:47:08.9350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tR2Dmh8Sm5lTZSwIBxjqnptKc0C3vUvM5UAuGRcPkc4/uF5vQ/bvlGI+50IPkfT4dcJt0OHEpiGVwZ54AqwUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
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

> Subject: [PATCH i-g-t v1] test/kms_content_protection: add debug prints a=
nd
> remove non-traceable check

* Add
Also each patch is supposed to do one thing if you have to add & it require=
s two patches

>=20
> improve the debug logging, when tests are skipping and remove the non-
> traceable check

* Improve

>=20
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>

*Sumit
*Kishore

> ---
>  tests/kms_content_protection.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index f35c9fa73..034c2439c 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -597,12 +597,11 @@ static void
> prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
>=20
>  static bool output_hdcp_capable(igt_output_t *output, int content_type) =
 {
> -		if (!output-
> >props[IGT_CONNECTOR_CONTENT_PROTECTION])
> -			return false;
> -
> -		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE]
> &&
> -		    content_type)

Why is this removed this check is needed.
This is to check if content_type is set to 1 then we need to set the conten=
t type property

> +		if (!output-
> >props[IGT_CONNECTOR_CONTENT_PROTECTION]) {
> +			igt_info("\tSkip %s (Connector does not supports
> HDCP protocol)\n",
> +				output->name);
>  			return false;
> +		}
>=20
>  		if (content_type && !sink_hdcp2_capable(output)) {
>  			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
> @@ -614,7 +613,11 @@ static bool output_hdcp_capable(igt_output_t
> *output, int content_type)
>  			return false;
>  		}
>=20
> +		igt_info("\t%s (Connector supports HDCP protocol)\n",
> +			output->name);
> +

TBH I really do not see why this patch is being introduced
To add logging to know if your out is HDCP capable or not? If so you have i=
915_display_info. Also=20
We already print if a certain connector does not have HDCP support and skip=
 the test.
No point in printing if a connector has HDCP support because the test runs =
if it has support.

Regards,
Suraj Kandpal

>  		return true;
> +
>  }
>=20
>  static void set_i915_force_hdcp14(igt_output_t *output)
> --
> 2.43.0

