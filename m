Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2580CD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958FC10E337;
	Mon, 15 Jun 2026 10:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXcRB4JF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFF210E337
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781517990; x=1813053990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XYNbZa8z2nXs8DFTVOLR28Fb9OKZjFQkvvGmh5dMKKs=;
 b=mXcRB4JFVRhbj5OemPQVoR2e73bYHihSOW0+v33jxUCbYxQrTRf/M0aJ
 S1f1jUOxy+cJ0Zrx2RRCsJMMkIowPuy96w5fm3n53/Ou0fOqhyD4jw463
 Sjsds3wQq24uUjq6zPMNbS204DMaJMjfFsojDGGBS81lzuh+79njeYjmi
 qvWxsfPq0ddCbvR+jBMSpRJIvTcZZe5ItJn2gaJTWX1HVtopImqzqIbri
 n8S/iQtRmK1uEebzhbTOevxGZF0CBDDXfcM/BaikcuFFR2Fn62DCI3iMR
 0l1ou2zrh9RTvF7K/a36Oo4AEKd87tyZKyuv0dK6mPPHvkX3S+dCamJCd g==;
X-CSE-ConnectionGUID: bP9Nwt8zQ5eRRIBU+o7pOg==
X-CSE-MsgGUID: o2+E5SvlQaGn7b0LI87Lbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82101179"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82101179"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:06:29 -0700
X-CSE-ConnectionGUID: q1m4U92YTJ6wQuXOCZw2og==
X-CSE-MsgGUID: EEQAtdPPTgO6JGNsczwVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246541994"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:06:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 03:06:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 03:06:28 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 03:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pN2RwMOWt+FBy3wS8whnOY4diX/fpSaoigX8ItqB1ZOkF6saXcmm9/GHOMyN9kdjjdocuYZUJmzOdhXYDhZZa1wcaYzLgyO39oMHWgaRUCiV/pQx583R/OomxDaN3atNSjbWUr79XFsirK1KB4jrVG7or0f7B2dzRlxiz0XNdx91zml1c+iSo1otwYHKYv+o7K61krHYUvyU2bk6eBDxN59c/vWdwPerjV0zAXVeIxaRQ4YYtRoHJwvdqC1Dne+mLOAWyWf/ahn7PeBCEYkhNtNldF6tX1tW/eGRP4RJfArxjBUUdb83YWph2CgrvujHHBOL+QfyAgTaWN7xzqe81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Inv4KnU7/v96u4HAIKlgWwnxptgaC230tLxla3vXC18=;
 b=WDcZ1r5C2kp3zmzIwpGkSGUvVNjrJQ/GiHJ0CsAEzK8vbPI5G6s4N4KsZQI0kiWF+L+ccvVD7V63iReSL9LCllWg5CBM5Qs0Gh/85IunXou8nVb3NY8aIySD4Wpu1BHbhTDCtL2EkTNLt7H1j9DEBRNvhlGH78ojFd4qJU37Pu1KPqJwkPjCEBAnQaXVzI9d2wXa/AMKNAdNZ5djmmpoUGEICM1mbkIjqZzmNESbMQ0imCfQjw8wcekrz/FmyCdR1qLaLuvhi6U797vwNMtA+4mpJRK3BSRikMHQ6RcRPNNppv7B7ucG6FzYi6+rSXi27Lcq4sMNClKyisxE1dKVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA7PR11MB9595.namprd11.prod.outlook.com (2603:10b6:806:4d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 10:06:22 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 10:06:21 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHc+jCrHtR0AuIHJUiy08vAkf9F7rY/YzvQ
Date: Mon, 15 Jun 2026 10:06:21 +0000
Message-ID: <PH7PR11MB6053FDC4877E947DDDD81380E7E62@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260612055857.2465378-1-jeevan.b@intel.com>
In-Reply-To: <20260612055857.2465378-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA7PR11MB9595:EE_
x-ms-office365-filtering-correlation-id: 9ffec9a2-55d8-49cf-a375-08decac5c071
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007|6133799003|38070700021;
x-microsoft-antispam-message-info: tBQPhOuH7/orifp8/E1UlSumcFvrLfv4lEKRM07FbqOQlj5dFHskY2dMVF2Lwr03lKiTA/q2uE8tdVBwVjMvBmMP2BeKMzFA4tLsQJZYjV1F/lF0y2jJLkJFbGm2FiQOAi93TPTYNuAg1XXa9C6AGfzv90e9oyuN6OK4d3wyHzkzT7+GBf4glUlFRM27e8v910wg89ksXInYlXUQsW3rhojcA0xgwZoGR3XxVDqv3DpGEmxE58ASX1QSuQWG6F/h5VoVWMNI3K6H4dtK1rzYg8VOuJQ1bMnzsiKQ3qK9KsF+g+YOKYBXRptp0zyYPpduDmbT4BVdSpDU8MF2bBEcvHYgdVHhC6BLIgNrXQQuxMMrSzo+MXtAlH7U3cCWORe7EukyJbyJoqeFTiFUAWls70hNCBcJaX1aCWgoiNhgI/TmWUt+FqjFJkMmybcNei8YUhgHHFwOf9sA8uTl7HLLbCoHTu5L3kZdXjHtS4Meyvo1ZMVQlWJHLJScahmaICPtlkoo8S2wThBbQuoK097Kjb1Z6h7jGWOVbCi6GUK10gynaGNg16mdaFLokSL1oOrDBh6EIVlBOhOcaZSQrYMt+XgtbYU0MQorN/ZQxSw3iTZWBk1WB8ygYdqwwnGZGrRJdIPlM0VJ4iPqjZ/qQB/jfcKFoGsvlw8Z4lsQU+EsMbdk//vmKG0zcwQjEogRDRzAjItOapEGhllOIi7BVOn5md4WPgl4yBnH3DHbYHGtt253fnFkK69Ua0dVsxy3ZoGs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007)(6133799003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ge0MCkbtDMnlEkfPCurivC8LN1eN9vRvZVC5GJhPCmINWoHFSSUYZXBmqOPu?=
 =?us-ascii?Q?Q2inkuANiW88pJgE2Wdhc/suG/rgOAbkI+AF3706eMpBr6EGlPmnd7RIujgF?=
 =?us-ascii?Q?AoHWkIuPIdrqQSc8uCVFZYgie+sesiFFPf21UoQd5QWpiYLKBQctmOE0mICP?=
 =?us-ascii?Q?vXAmK4r7VRLqCarjZVeLGgdW3OSCxCXReDJgigzkeanx+zoSpU2tdiayBDKz?=
 =?us-ascii?Q?WvZ6A/KB1u/QjxSCkmxO9SXfgWxqEqefhquTIiwa9YFkoDDlTZZre59Bk0zu?=
 =?us-ascii?Q?SX6cToPYm8/pP06BnxW0FvoiiKcKHu1gzO3/y8YA+m+Q9k++FaTHwuT9/BpW?=
 =?us-ascii?Q?rCAsz3F9cHwZMBXz+y0n3BHi6agQ0fQCPIazvyGY5uA8Y9+IaRM+oDyZDUxY?=
 =?us-ascii?Q?dNIXuhHdyMJCuX4r2XY5N6Gig8NK6TDU6wSs1uG7kkg0iS1uN4JV5Q+V3XgN?=
 =?us-ascii?Q?DgM3kmFpoXuBaqKyFSQLk79KAL78wGHmm1cgiMhb3rKFG8VomoOiEoyEzfTz?=
 =?us-ascii?Q?ljYYdEf3ii1IHUT3osYa+AnU3oH7ZR6HhKhZ/7pOA2wRtv0qMa65mVmlE+aI?=
 =?us-ascii?Q?HCX7S4JOHx/AF8oHwuUN76r4rDN7pXkN/BAUEw3t4KufR91JYW8ZTIsQGg1r?=
 =?us-ascii?Q?KnxPO5yhMYfGCV7sxoMXNh7jYP3V5sqA/0+zio2tAFUvMrvdmzZk69/s5gXI?=
 =?us-ascii?Q?YskGgNVJAerSyOnqmv4ZUzsEMpbaQMiDE398HKeWNQF+OfrhAzSGHXY6PDT/?=
 =?us-ascii?Q?aSS5ggow2J49vGrCeHSNbroOrXYarCA5OZ1xF+SpYhpA+gpHDKpyHQ+oR4ns?=
 =?us-ascii?Q?DsKllDXzdlr28KGYfBdDqNXjl163iLfnqpxw6F2+Pv3/CTIZuQx+C/QBIayX?=
 =?us-ascii?Q?ySLlrxg5u4FoNs7YJ3zWt8szYdorUBi58qj+1t0BElDeWDA1RosX1SPY387X?=
 =?us-ascii?Q?T7+T3O3pM8/eNiLjN1znhj3LyXqSyMO7x0IQTn7kDGvTpkKsVLCDQm0iW0qs?=
 =?us-ascii?Q?Q/Ry7fbUNf0Rschm3HmPQ+QU0tMc+DKe966bYQspZII5GcHOmZWnWA4iEyhT?=
 =?us-ascii?Q?hGHGwk0U40UkWCC1iAiX2+0UQhzqPwZvbjufWMm9826ZXoN1MjAh8npB6unB?=
 =?us-ascii?Q?Tf91Vw0CJbKQsNtVUZ4QA1FZrRgPcJyTcrvJTtYjs4Xbjsp4J2MLvvSo//nX?=
 =?us-ascii?Q?f3+8izaVEMSkhN/sypoAEWeVOr+u1VMG0q/pZ+r8K/ozI5d1U5hwQqTWVE6L?=
 =?us-ascii?Q?6s2pdlCdHCyaoB+//hmkkCoD52gGC1fHM1J2FY3dpvc/BakHG/WU/NHvzT/P?=
 =?us-ascii?Q?sh37NsWA1R/05N1QiU6AUtYRe28G21G9HzHoY6Yd090uvwZ4AgFXpWDyn+lu?=
 =?us-ascii?Q?/bgdG2i4cdMN/y/igLi0e67hnN3CghMOWcGp6Y8cP4enOxBIXxr+rtVrgZ3J?=
 =?us-ascii?Q?ifIxmiIb9PZt2tSEOy3jZlzLCniVBYao9NWvHBi5z0bOj9PyhOUhGcWhpZIr?=
 =?us-ascii?Q?gbK5EibZBTkqPCvFrNO1uFqoCLBdXDcGk8UuoI/jpVg3Ow1YtGx+MFBs+gZK?=
 =?us-ascii?Q?p+wPW+a/tyf3WApmq7cxqyAfog86svYwS4Z7URWRU97Me4xkJG1FOdsNZ9sC?=
 =?us-ascii?Q?nf7jneGhs4/hKyxN4Tjapnra+pwW30vwk2B/be+BCQ+nR5UOSL0ve47ARJQv?=
 =?us-ascii?Q?28ZHk1B01Nb42VOIbF6VA0weNJEiR9UsPyIN03ppMrkXIwZmOUZpdQQaGHJB?=
 =?us-ascii?Q?77fhdcSRKw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: anCc8BidfEgq95GfBW6DdG/SAsgjOev5BT2iOrN+HAC4S8WWZEuz2cC9H6MKIb2QdsX/S/0kUMkb+KDcPy4CAMEtJzg7iykgxCO3U1Q7LLMD7paPK8ik6HoPhlhA9GjLWcxzPDNzwEa0HwogCa4rVjiKxalHkvvIw0jidiSIxOqeyGy9Den6CKZrRNMhg1q69EeruCB+/vuyJe+PzEZA+XWSRzfcoBwdxLBiNFV8evVmuyxHAnFTae5aM852RsuYseCdcNJ6eBPSt+QQODkC0+7w5HqtjVBCcKPAat4p/Fa2zMhr1HhAl12G69dIL0zDcbVETeYg1kdh9JihbaN/9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffec9a2-55d8-49cf-a375-08decac5c071
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 10:06:21.9016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dyf3X3lU+uDXG9IL4QnUcD+mom26Trd+EA6NnAt7VxhlbHIWcPLqpMoIPQ5n+W+tenO/C9h/qBR6pT1M3qHyvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9595
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

Hi Jeevan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan
> B
> Sent: Friday, June 12, 2026 11:29 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan <jeevan.b@intel.com=
>
> Subject: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> Add test to validate audio works before and after suspend/resume on
> HDMI/DP connector.
>=20
> v2: Perform a single suspend/resume for all audio combinations.
>     Re-enable chamelium after suspend and separate pre-suspend
>     and post-resume validation paths for clearer failure diagnostics.
> v3: Drop commit and use igt_assert_f with explicit messages to
>     distinguish failure in audio tests.
> v4: Updated test to avoid false-pass on zero executed configs.
>     Replace post-suspend forced re-enable with connector
>     re-probe/connected checks.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 159
> +++++++++++++++++++++++++-
>  1 file changed, 158 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_audio.c
> b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..cc106f52a 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -52,6 +52,12 @@
>   * SUBTEST: hdmi-audio-edid
>   * Description: Plug a connector with an EDID suitable for audio, check
> ALSA's
>   *              EDID-Like Data reports the correct audio parameters
> + *
> + * SUBTEST: dp-audio-after-suspend
> + * Description: Verify audio works before and after system
> + suspend/resume
> + *
> + * SUBTEST: hdmi-audio-after-suspend
> + * Description: Verify audio works before and after system
> + suspend/resume
>   */
>=20
>  /* Playback parameters control the audio signal we synthesize and send *=
/
> @@ -695,6 +701,66 @@ static bool check_audio_configuration(struct alsa
> *alsa,
>  	return true;
>  }
>=20
> +static bool run_audio_test_once(chamelium_data_t *data,
> +				struct alsa *alsa,
> +				struct chamelium_port *port,
> +				snd_pcm_format_t format,
> +				int channels,
> +				int sampling_rate)
> +{
> +	struct audio_state state;
> +	bool success;
> +
> +	audio_state_init(&state, data, alsa, port, format, channels,
> +			 sampling_rate);
> +	success =3D test_audio_frequencies(&state);
> +	success &=3D test_audio_flatline(&state);
> +	audio_state_fini(&state);
> +
> +	return success;
> +}
> +
> +static bool run_audio_tests(chamelium_data_t *data,
> +			    struct alsa *alsa,
> +			    struct chamelium_port *port,
> +			    const char *audio_device)
> +{
> +	bool run =3D false;
> +	bool success =3D true;
> +	int ret, i, j;
> +	int channels, sampling_rate;
> +	snd_pcm_format_t format;
> +
> +	for (i =3D 0; i < test_sampling_rates_count; i++) {
> +		for (j =3D 0; j < test_formats_count; j++) {

Please consider restructuring this format/rate loop execution into one comm=
on=20
path (single helper) and reusing it in both test_display_audio() and=20
test_display_audio_suspend_resume(). This keeps behavior consistent and avo=
ids=20
duplicated loop logic.

> +			ret =3D alsa_open_output(alsa, audio_device);
> +			igt_assert_f(ret >=3D 0,
> +				     "Failed to open ALSA output\n");
> +
> +			format =3D test_formats[j];
> +			channels =3D PLAYBACK_CHANNELS;
> +			sampling_rate =3D test_sampling_rates[i];
> +
> +			if (!check_audio_configuration(alsa, format,
> +						       channels,
> +						       sampling_rate)) {
> +				alsa_close_output(alsa);
> +				continue;
> +			}
> +
> +			run =3D true;
> +
> +			success &=3D run_audio_test_once(data, alsa, port,
> +					      format, channels,
> +					      sampling_rate);
> +
> +			alsa_close_output(alsa);
> +		}
> +	}
> +
> +	return run && success;
> +}
> +
>  static const char test_display_audio_desc[] =3D
>  	"Playback various audio signals with various audio formats/rates, "
>  	"capture them and check they are correct"; @@ -762,8 +828,10 @@
> static void test_display_audio(chamelium_data_t *data,
>  			sampling_rate =3D test_sampling_rates[i];
>=20
>  			if (!check_audio_configuration(alsa, format, channels,
> -						       sampling_rate))
> +					       sampling_rate)) {
> +				alsa_close_output(alsa);
>  				continue;
> +			}
>=20
>  			run =3D true;
>=20
> @@ -789,6 +857,85 @@ static void test_display_audio(chamelium_data_t
> *data,
>  	free(alsa);
>  }
>=20
> +static const char test_display_audio_suspend_resume_desc[] =3D
> +	"Verify audio works before and after system suspend/resume"; static
> +void test_display_audio_suspend_resume(
> +				chamelium_data_t *data,
> +				struct chamelium_port *port,
> +				const char *audio_device,
> +				enum igt_custom_edid_type edid)
> +{
> +	struct alsa *alsa;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	drmModeConnector *connector;
> +	int fb_id;
> +
> +	igt_require(alsa_has_exclusive_access());
> +
> +	igt_require(chamelium_has_audio_support(data->chamelium,
> +						port));
> +
> +	alsa =3D alsa_init();
> +	igt_assert(alsa);
> +
> +	igt_modeset_disable_all_outputs(&data->display);
> +
> +	chamelium_reset_state(&data->display, data->chamelium,
> +			      port, data->ports,
> +			      data->port_count);
> +
> +	output =3D chamelium_prepare_output(data, port, edid);
> +
> +	connector =3D chamelium_port_get_connector(data->chamelium,
> +						 port, false);
> +
> +	primary =3D igt_output_get_plane_type(output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(primary);

Primary plane is fetched and asserted but never used afterward. This can=20
be dropped if not required.

> +
> +	igt_assert(connector->count_modes > 0);
> +
> +	mode =3D &connector->modes[0];
> +
> +	fb_id =3D igt_create_color_pattern_fb(data->drm_fd,
> +					    mode->hdisplay,
> +					    mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
> +					    0, 0, 0, &fb);
> +
> +	igt_assert(fb_id > 0);
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
> +
> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> +		     "Audio test failed before suspend\n");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +				      SUSPEND_TEST_NONE);
> +
> +	/* Re-probe connector state after resume instead of forcing a re-
> enable. */
> +	drmModeFreeConnector(connector);
> +	connector =3D chamelium_port_get_connector(data->chamelium, port,
> true);
> +	igt_assert_f(connector->connection =3D=3D DRM_MODE_CONNECTED,
> +		     "Connector disconnected after suspend/resume\n");
> +	igt_assert_f(connector->count_modes > 0,
> +		     "No modes available after suspend/resume\n");
> +
> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> +		     "Audio test failed after suspend\n");

Update the message=20
"Audio test failed after suspend/resume\n".

Regards,
Pranay

> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +
> +	drmModeFreeConnector(connector);
> +
> +	free(alsa);
> +}
> +
>  static const char test_display_audio_edid_desc[] =3D
>  	"Plug a connector with an EDID suitable for audio, check ALSA's "
>  	"EDID-Like Data reports the correct audio parameters"; @@ -866,6
> +1013,11 @@ int igt_main()
>  	connector_subtest("dp-audio-edid", DisplayPort, &data,
> test_display_audio_edid,
>  			  IGT_CUSTOM_EDID_DP_AUDIO);
>=20
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
> +
>  	igt_describe("HDMI tests");
>=20
>  	igt_describe(test_display_audio_desc);
> @@ -876,6 +1028,11 @@ int igt_main()
>  	connector_subtest("hdmi-audio-edid", HDMIA, &data,
> test_display_audio_edid,
>  			  IGT_CUSTOM_EDID_HDMI_AUDIO);
>=20
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
> +
>  	igt_fixture() {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.43.0

