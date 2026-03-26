Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D72B106F2FC
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CD010E265;
	Thu, 26 Mar 2026 08:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMQQqAE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8769E10E265
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774514408; x=1806050408;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JWpIOzAIML3V7bsXaygTGnQVvq2/UZ3uQEy55G2FzjM=;
 b=OMQQqAE4gbTaOilD8YG7U/WSgcsT2ASpDug35OqzSZl6cmBiw0vDoEpL
 nmad9zcoHtIJZSLqWZOFIJnlnbh3TOjXcAJLmgcahLf8Bwez4Nz56l+0H
 8C4sMr4OPpMKRWFQ8VOTznF2z5PLzRwSrHXtFTSzekXeFV2pQqzrHfD1d
 WFbw0p6cSu84BCcQPZlrsoxrFSFM1EwpvKfZyau/JDaPqaS5Vi3KoBa/7
 IZisXDIStEYT3vNKhkLCp6HX+h0ovZZMHt2ayHcBr4pKRn3NjDghf+iwx
 nd5FVJpHHArBFRqEwxL2mpzw1i5osNR2OIIRH3y79tL9qQaJpHh8WyQSm w==;
X-CSE-ConnectionGUID: fVAqUlyvRR62c6wHEfv38Q==
X-CSE-MsgGUID: qDe19g+4R0+pnk82zHm5rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74747946"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="74747946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:40:08 -0700
X-CSE-ConnectionGUID: pPETm9bISViDB/ln54q4RA==
X-CSE-MsgGUID: KLOWTnvFRDaXTr3cNf4mCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="247977296"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:40:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 01:40:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 01:40:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 01:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZAUfJ3pExfGiaZIK9Sa6E17gwfoKMxzaO1SAfkLA5kcE4uyhcXQvQCSu+58gB6em3+oIDPJABivWhB0eMecNwN0GrQl1OWYNFjLQf12+9Z1NYKqgTzg7LjCTmXoDn6lYTgx1YPxb7lHc2dQ8BUS5AxJyiIwFg/y6ffVuR+x57vL1WMs1M8Y++Q14M3vJWieu9iso3iulPTzIqjdFIEhgUn30uo9Wlfnpnn3Pmu0NKb9GhD/7fasHqzXYjPm1B1fJ8cfNS/75ExMIEx+L40IJ7SHFMprnLfOTLj+KPWcEfYxoIINlBCqZ8t69kxuGZgD1UbG4+rYkgYvEeCnaHM0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSxmucQbKsHZayitGXOr7DYkvSY0CcklCIuDTFRlxPg=;
 b=CnkBm95EdHOSBJ5dOiwkHE33y+clUs5/fIN5BIDQsn2MiKbPw4hzhEdBoA9+EUldp1VFGFVcqt+s3tiL2Lwmc9ZRgJVJmwUXcy2faf0ZhHSV15mAC2qgTtXT97W4veTQCQ0OMGOD52cdKR568ZikDPX91aWxMcrtBV/oAn8MIfBBBTuZIBTroHurlpjccnSjTlhvnCjpsB/TnTwsVZDFRxYBs7T0YxgSK6lDErKnLqnr1QDIS9uBF0rCQ3Gg80eVx5dNNqrpxdXuo9qTLxTG51Bz2B+WY8UQz6fqm6O3uNfexONQ2xNDKcT8+cY4raQhdHuYaeOVLEV7FBuhPLudyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CHXPR11MB9626.namprd11.prod.outlook.com (2603:10b6:610:2fa::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 08:40:06 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 08:40:06 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 1/4] tests/intel/kms_fbc_dirty_rect: Use
 per-output PSR check before disabling
Thread-Topic: [PATCH i-g-t v2 1/4] tests/intel/kms_fbc_dirty_rect: Use
 per-output PSR check before disabling
Thread-Index: AQHcvHfjO+L012IRJka2BCUnOUgVzbXAflQw
Date: Thu, 26 Mar 2026 08:40:05 +0000
Message-ID: <PH7PR11MB6053F099BB3480835A4C15DDE756A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260325165140.115520-1-jeevan.b@intel.com>
 <20260325165140.115520-2-jeevan.b@intel.com>
In-Reply-To: <20260325165140.115520-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CHXPR11MB9626:EE_
x-ms-office365-filtering-correlation-id: 62a21a9c-e001-420c-dca4-08de8b1347e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: IGNvzqtZDw5EiVjL2sAQQdghtIesBazCJQ8rpWzOe6mKyGwXhgG09MySv0KcNI2WV2NJRsF8fY+XK+SVAfA0bitm59pu5T+8AawmnaIurM2qLM1sDtxKFNoF0M2ISD6b0p9CRecVwQ35/EvpGvL5fYcMg6XoBrZ4jrMpMMIES/+lMc26OSW+kkMm0aP9EtfFQqNLrQfo2/3MWvS2x0B1XJdB1PYvZhHDabZX9/QZL7dW6oZ7JygGm/4+lm4QdBFH9tGjFu90E0PsS8mUuaoT30jgDrfvfcMEyU7B3RFtrGr0g+NewZum62GSbqDKhtmjlN6p3qhUJll/18AWKJ6ZaUlwffzYhlw/j2+fscQWCKSJbYTAIyZnGZlG3UJflYgkh83MnMsFrkAh8YEMBlTH+oKXZiRKllEQS6tTcjXaaTu+6hRXwGvCuDgJ46INcxOmhAipH/bAjpYNgHIWaF3BJtEu+5GQbs8+zt0HSKAZkxJEw9JzWgCBUvvjsUddRXjSkjcHKpcHQvIY9X1W2A4SsawRvm5ux7KutBDccraIPnd84P4VxlaPt5BemAsn3tKQw8yznl+ULM8CxMbxAE0zCk+tmqZEMmr16J3Swa1sul+VqShoDz4lHZ04pvir63Vokd5Eblh9VUsFgw5MPriFOl/ekHxNMY2eHU+q2BUwcVH683dCzDOxpl5CATKd5ObJC2QEhtOoBBvJE/ct5LC6dzw6fBhEHD6sKIDs8BlBlTdHpYruh898/DYmWs9p1g24J2d8HvpMENVx5vE4FDStmZn4STLlexm5RsoF1jtL63c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EPzsfh5rBRkzJoYNifABgr5uZBo9wRo3USah+TXOkZNRJ6xSavfp0R1ZLa2b?=
 =?us-ascii?Q?Emlxt/HdpRm1p7w6NTds5o3xz38gufJxXcQPqUGmFwMH2OQIIk+knR+mfAy7?=
 =?us-ascii?Q?BgRV6iPVbNEQrDwGMXbaZDL0AQ3m801ithclJ9LCJMWubKBxLSgD4Bw1MLSQ?=
 =?us-ascii?Q?m9lUD/Dh3mLrQzMApoamfPCywF92CfpevhQG1ZTfUwlcCKe9WItGjPju5aKK?=
 =?us-ascii?Q?F7gJkwWe11EEwqelvG7D+C3IlGQU1lqZjrcPZzGc/TrSmuQ8VTQdzYwTecQb?=
 =?us-ascii?Q?Lw0opH/deQGPh3nl0etWjlkEsAzgQ23drtyhhdR69P/+oymnUHdt2WS3yh3/?=
 =?us-ascii?Q?wHKKeryMNaOnWZFfnJ5ia7GVipkRbJlDsxtYKs8X28TcAiRMxuALsMHWCu7H?=
 =?us-ascii?Q?8uscm8hl8gRe9oxKN3DqHQaRStalU3Xjg0hCP1banjhA63SJUT/xnt5ViiB2?=
 =?us-ascii?Q?GJHDzYVnNSWmOSYyIbfOAUYmxTQJf9sPnbpIl6dGp0VuJzWG6C1RIaAxzy0N?=
 =?us-ascii?Q?ZxIePbkhocpqs+oyf9ULKpD9CLMq5ptVjyB0bWb+9Mbgr1M8L3ePbrzFmQCS?=
 =?us-ascii?Q?VqEcp2g8bCX20If1ZZamD71OAh1Diac7KyZFiB1rMNDdt5FWLlrXBr3KHVJA?=
 =?us-ascii?Q?vLe1sh93pw2Ln2EEkwlmyTjiIEl2OgEYogj/sBBAQEmdCf2BrudKRE3GRw2I?=
 =?us-ascii?Q?X2lftxUeVyFTdqEVh6q5L04B4o8hdtvnyOJ7YJhnIq8dzD9txcIP0X+8g3z4?=
 =?us-ascii?Q?JK5OcuEDswfwj2ZWr7l8450nkZD9NZH2HkzWRPF8bR9fd9A7o1VIYrCnKVeQ?=
 =?us-ascii?Q?0iT/okBDGevj9MKiZjTVScKhJn3EZ8NWyimhssFBBZJt9u2bTTg99m6Y8evg?=
 =?us-ascii?Q?gp2aEcQQOUDUZVTLKTbo607ae/WkRSGKoNLkZZRxl7lQ0zrPFB6XsR1tan2l?=
 =?us-ascii?Q?5LmHh9IFoRdlpfYeMHmo0wLpf+3weGC3LY8k5DcfEQNH7po8Rwfh4G0paZn0?=
 =?us-ascii?Q?7HXXS7v1ZmX4b4fum923tzBIj21Z2a2j841yv8Sbfeorwp9efQGES0XT2s+E?=
 =?us-ascii?Q?sRV8NbAaxs7y24E2pzvwkDKU/aRYX5BbvuWq72gymVgKhb+ZuHQDa6j7XW7P?=
 =?us-ascii?Q?y0zDs2TXQG++mY24rC5ipm1ro2yWv84Hch5kQ7InHxTBVobK2uD1SOk4KY0i?=
 =?us-ascii?Q?FXaUC++pqpOjYrsPdbjygRNHoJ9C4IEo79cU9K4WgBBtXHKAHzok4ba4zTCT?=
 =?us-ascii?Q?giSnfUdkTBAuurqsX0E6iFxZP6jb42u9iGHGh80bL1IA9/Bn6Sl5SpuH7PyO?=
 =?us-ascii?Q?ha588HQDQUEjjzf2ODAY4kSNMeQSWIZ+q7m8L54DYIXHJAo3AYZ6Etk1YGBL?=
 =?us-ascii?Q?N6F36Y5HBvq3ZGaO3giN22PPEQUsUmJqkwC2ZUpELwQB8obOdpBY6aiiiajK?=
 =?us-ascii?Q?8La1xOFkHlxWTnc7M7bvvVAMkjsr4uhqlJ1y9gbMZppIgQRgseDF40HWl0ra?=
 =?us-ascii?Q?MogmLYz3Ou3uDKXpTRHSQUle84WTyzmmlAoWYa7rODKFDHSeJt01zW9QyjN+?=
 =?us-ascii?Q?nOg09+tQJErIW7huDUu5UxBdQhLjrl48ZvHYG5gxPn3+7y0Wu1gujCXfCSIB?=
 =?us-ascii?Q?ZZ3OodVwrFaQPJI/7YcAERoEQzcdVAu1Bqf9OV8bd5ZrU9VK/PEH9rH9k87J?=
 =?us-ascii?Q?UzvMp49g+KV9rwQFtq4uAw6YQFhKJcxlp+80vvqJJunb63XhtFbBtjtlVxB6?=
 =?us-ascii?Q?yB93PZT7ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LWKSwfBb/tqP9j2cXiZgDeEvmbr7Xm9iOIfjGGxjsLZ9n9VeCo3FJePNQnaOU2r96WlBk81nHpDN7kUnfiTIgxQQG/22HOUOLsU8xiy0GlRBDxuZk/vdanmnBUi33Sj50goFhKbd1S2CYcPqkpXLqPGJs1n9GsAXXsIXstWFP/QnmPVeYqxpH5jQSPN5h4JkuDicHsOzJFhoKb0rORSMLVheOKOzc61eIsnBlNlnpAiq93JtyRI0SElSW98hXeLbq6T12ww79E8gvohSH1AAbq6m2yrDcPGl8VruiZwT95ibtyAZEpC7lhOST8I1IZ8tUoLr3+/QN+t0BSq/OpJqIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a21a9c-e001-420c-dca4-08de8b1347e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 08:40:05.9604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6i8BPvuz2Bza8Ijj9zWHOb8nLPe5TuevFMJwu7DLFrxE84x8BjO0a3nBzJakWSu4G/KvG4uLpmXraIfIAnyxpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9626
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
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Wednesday, March 25, 2026 10:22 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t v2 1/4] tests/intel/kms_fbc_dirty_rect: Use per-out=
put
> PSR check before disabling
>=20
> Pass output to psr_sink_support so PSR/PR is disabled only when the sink
> supports it. Using NULL performs a global check and can be incorrect on
> multi-eDP systems.
>=20
> v2: Update title, include PR and output name in log, check
>     psr_disable return value.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Changes LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> ---
>  tests/intel/kms_fbc_dirty_rect.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty=
_rect.c
> index efbd46985..c58ab3465 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -414,11 +414,15 @@ static bool prepare_test(data_t *data)
>  	igt_require_f(intel_fbc_supported(data->crtc),
>  		      "FBC not supported by the chipset on pipe\n");
>=20
> -	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> NULL) ||
> -	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> NULL) ||
> -	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> NULL)) {
> -		igt_info("PSR is supported by the sink. Disabling PSR to test
> Dirty FBC functionality.\n");
> -		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
> +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> data->output) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> data->output) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> data->output)) {
> +		igt_info("PSR/PR supported on %s, disabling for dirty FBC
> test\n",
> +			 igt_output_name(data->output));
> +
> +		igt_require_f(psr_disable(data->drm_fd, data->debugfs_fd,
> data->output),
> +			      "Failed to disable PSR/PR on %s\n",
> +			      igt_output_name(data->output));
>  	}
>=20
>  	if (data->feature & FEATURE_FBC)
> --
> 2.43.0

