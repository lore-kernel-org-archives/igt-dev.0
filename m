Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972ACEEF317
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 08:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FF110EB7B;
	Thu,  5 Mar 2026 08:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRHZOzvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E266110EB7B
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772698706; x=1804234706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6INo03/6Bwazryot2n2ijroLQ4gRsNPWkDZkljWHe84=;
 b=IRHZOzvmIx+ecfVIQNXwX8hVRnGKLkLdnW0DQ95e+3kLUCXYdQEeDdAQ
 UESMe2PbhbOItnBo7rB0wgtBhnSJByjLpthmm5981sn+0JuwplJqqc+Fe
 gDsTffpr4FsKo7h5WKEJ6wHj7WK/OsVSQ45D7ibGk7todXbiqTOlkITFv
 ayzmIskvl25QuIxjCHen704Ul9wsO+WBQtPtCNtTQx1eTebFxMV/MWfMy
 SaVwGjKZ8Ex7b4mf6qavXrBjVtOpKbNMLtGbuVorqmjjiVTweBpQHzT1H
 u6X0HFmK6hiYYWmG9elj4ajY5QBfa3xxz562y1B9TAwYu4NCBwg3vl6I4 w==;
X-CSE-ConnectionGUID: A7tO5zQcT7+nyNnJyofCZg==
X-CSE-MsgGUID: lwvfFw5/QOKWTB+Mv3SE9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72977344"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="72977344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:18:26 -0800
X-CSE-ConnectionGUID: rDuwsDRXQdGoLwT8J0uDhQ==
X-CSE-MsgGUID: 56cyWk++RBaLfgk386Rang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="249070837"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:18:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 00:18:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 00:18:24 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 00:18:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry7cJaLayxt3sCCI2G2VphQIkNlEtloT6RkSgSoJg5UcIgJNo2cv5PyND9jisRmzD2izvsdRKQmLI+06cR8/ahXEV4cIK1vI6ah3kl/Ae05Rk1wBWU+68NvUObCFfodimEAwqYTr1m3KxvJctg2rSLEYjapo2tuztcqQv9zbja9XI2+8U8GU+abKeWPaFHbKcDg52Y6w09NmgnUfTokX9TKoNbWunk7qbd/m8/b91pa2wF+KMXFSLpt9sfW/z9+K5l1nymm9g0AgMqOOWuJhwIPtRLkbdb7aLD4BaCFPJzhVw3BPUfIidSQXYi9JsqJ4Ukutl1ID/Xq7miIOWahNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+RdKzIz9x072rLub+ia5YTtwYraoySeAiMgrmtScnU=;
 b=t2dYXPzaQFQnq8SzexNi/v99OWpjiJmcsDcGUeHG3sFHE9NJlN1rllzHf68i8+fWQIzLM/sYXTJH+5Oe+mNnoVfAlnaagHcdpWYLtWJNiofIUAoPg67UsGfIii8oBfT0PPLqEuMcdLOqjpDwdsrUBY0+oDj3+ZAL/D+el+B2ZEevo2SKZ5LY1KEWxSJKisZenpsdCg0zzg0DWDTrGvHl2v/B2mAiqaJXUm6bFHhE005ML8Dq3J/fyvOIyypGu1PGp3Pj7HjwI2SmtMAP1vrbQY/sZsOWouSJ0c51Y04QGYA1q37tEfTmpd/F9JYNPLcKyHIgL8Z7WaHYgDXxpxWLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 08:18:21 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%5]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 08:18:20 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Kishore, Sumit"
 <sumit.kishore@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_properties: Add skip on headless
 machines
Thread-Topic: [PATCH i-g-t v1] tests/kms_properties: Add skip on headless
 machines
Thread-Index: AQHcrHEVqeM6/XJQxEeFMHQPseCnWrWflsww
Date: Thu, 5 Mar 2026 08:18:20 +0000
Message-ID: <BL1PR11MB605001891EEB63E22EBCD962E77DA@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20260305072257.233432-1-sumit.kishore@intel.com>
In-Reply-To: <20260305072257.233432-1-sumit.kishore@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|MW5PR11MB5929:EE_
x-ms-office365-filtering-correlation-id: 1cbca17f-7e54-4338-27d4-08de7a8fc339
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: B3TCPkc4gZJxtuI2zG2mT3C/D+/1LG+4ypYh/Q30QojhqrRUktZR3Iyw8ofs0yYKziwTM5UOj44KaS4Wbs9movxPEbPBlLQwTDrlzwS5vg9WpGLSXf/e/KoZn6QDZ2ORmITzDVcHYBIQiozIONgfgPtuoqwSo5eQSGg+LJ7BIXjfuLxmOeicY5KtjeAdPh1yfqlZaCd2tvr2O7UOJ9vcLrtzwerevuH5qPnRRYcQO1GPJARvTFj7FxK41TloPuvAhhPzt3xYfMq9oE33BUWpbtcluWZo1yHzwOJQapdouvCh/6akVO0Nei0qbsT9lobDNAhqg4liwU7zuQhjmylKtjfkHUg97BDRIyTyk1HjSxu3J85XBstYhiqE0LyFWULZm/il9R2RPdOuRZa3BtP0e49dMmRDjPCzQO9KQUkRVoMXKjotGcjRLxG+jHVNf5aTkd3BC5u28YLVgjUng4XO32lUe3pZUZH+0mm3wx7dJgjQAxIosZVmzqsMIACB/SKd3rAOB5sdwzMx01VA7xAWQLL4BHl3TQVD4/yZLAJyNMxEeBQjX6aRHkWaW4lSI/bX7Vdw6mirm6WOM3msD1fmfpkUT4MA89T59wysQwQk4D32WNe0ZsCQi7+KIOKPCAa9pF1pVXtsW7uK10RyWf/Kj3/u7wCaPM7OMnUXKN9HTJWrM8kuNN4Kf0qvvpGqybkVralZs1BrAMc7NQY6v9K6foLPXJWORThRwq+PVhqTUG35uzBDYtOXH9/DKHOaIbWr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZNefxKzQYJJwi9snwPn+5ihUYl47eK+g/gMtWQnMulKRUV0jgswOiMHzxk2p?=
 =?us-ascii?Q?vx2ZoI0qcewsxeWGunVQQzdgBqvNCtceogHQy45BnsR8rCJJt/hOb5D7ar04?=
 =?us-ascii?Q?QU1Kfn5638mSI/+/Rtb81769FyabpJOh9HlSImfLQ3kCPEhvNAhUyrDjW6qm?=
 =?us-ascii?Q?YLOkMF7hvVKdE/ZUpdFhYBmMZeI5qfQuKlHQL2nIS8Qk6gyVIe4leDgIeE13?=
 =?us-ascii?Q?ii7GDGF2dVCeifaP1QpvFbgrEcNdTQjf4EDYKOEf49DewcwkvoTyPuRp0wyN?=
 =?us-ascii?Q?8x4yzOMycrR5FWgW9BGJ2rtWrpZ6Am4gRlW3qWQglDqciG1+9E+O1AJoW64b?=
 =?us-ascii?Q?R1ffjxJYgJG7nYQl+ynNEqUHPZWO73jRh+uur3w7GXPcu5p4mXovT00XcxVD?=
 =?us-ascii?Q?46yTMdelmgIGLjR1/ZrxhcxMUW3QFecX3JehD1CEK3k5nigHWr7gQWo2JHMq?=
 =?us-ascii?Q?J23Dl7j1kQHTlAKn5As2adCWqkp+CCHjNwTdr8sRqHajYeWq6m9OiWvB6hO9?=
 =?us-ascii?Q?M2i2T2akyUsYm9/fL+qmXivVjL1kyN50m/wM3RfS4bfroOkUOrc43RWtfIGF?=
 =?us-ascii?Q?TQhzMZq6w60w9SAvZZAInNv0adKYjgk1M9H+ujM7ur0uNSbOJ1fpFqfQfKUI?=
 =?us-ascii?Q?bpIWiKSQwA9VKOJHxuHivjLNfx1SBwyaR4v+t/QVYEeoXtcIP45T1NQwZI4t?=
 =?us-ascii?Q?toBiwyvUbbaNMpj6lQ8HkCC4J36FMWrcoqCXs4RqGUc+zBdq6ovAayUdi934?=
 =?us-ascii?Q?dbX59AhIgivL5v+AIML6AN7s3k/c7Kbn6ruGRvjvn1TQpRd3JpWKHbjSJVRf?=
 =?us-ascii?Q?Sb0EsgWp+krBtqBP1/ne3fEi986Df8GWkSwnofk6ILJl+KVK0YxHP+aQLr4I?=
 =?us-ascii?Q?m46+zP61qvRKyScgx7kidOpULdS2yQVc4KfO7CNDOa/ygScx4012QHdsl/nA?=
 =?us-ascii?Q?HdPGI69Fi+ov2uuSPANFFk1dysz3cSvD1t8hPVJfF3BRc2Q43C0Ax396SR+q?=
 =?us-ascii?Q?TJMaZDCCwlEza9pFWlKIltZIhyf7BXmyp1fyWtE2URy0aEyISzP5a0VtX6Sp?=
 =?us-ascii?Q?D1ihossZpFrpx65vdynepRSo4RWpenV+h1bR10ylvHjMnKlNNRJtqb3EgoBX?=
 =?us-ascii?Q?ywaLsWJ0lTDhbXYzjpbwNre3eTOneLbJLYXaNusmqpHTsyS9YukE056Hzgge?=
 =?us-ascii?Q?nE8ExGZtLFeDX79f0mmpIu0e+Dl2u/gXA97TRFFNA+JRE/FGfO1y0YBUXuX0?=
 =?us-ascii?Q?wPTDrPUdLKrKZuLKyUeIO/VZeoHYJliyHshAQRNrCpX94Gh1RDULrrTgVE4f?=
 =?us-ascii?Q?afjXNP2nS8w5Yy4RoCdsxLzDocWCkUbGc3dQNWr4eNLZ1v04E6sk6G5j3KPR?=
 =?us-ascii?Q?qiJiGa+ohXVdySJ2g2UMQ9aDfsHXLT/0+ZmD2cRFQuBUPlKgnvYge1n/kWpl?=
 =?us-ascii?Q?DF4Mwn7R4LWH8Ls1hDKJtMejGBBc16zTa4zu6eVbxGB7AqtOLdFrQXiEqn9R?=
 =?us-ascii?Q?xe5sUoX1zpVVib9Ijd4jxqeIIseWIRkjbqz4JUWMUt7EUJmXYqQhQ531nwA8?=
 =?us-ascii?Q?58EfnXkOX4iNNTBxqa4m6MfqJbDQRzhHiJIqDRLTKPvjC4A7GUv4NmS2KhSi?=
 =?us-ascii?Q?ouxlvBzwG9mU9rpWaLvrYDdApVqMElOkzkb79c/SAC7VYqfvzlzwyeox82Ed?=
 =?us-ascii?Q?D6a9gk3aaeUtSUvugZvmtFRBlbycxmNaFRdFTpUkupAtbBBHQFdpZkVzWhm/?=
 =?us-ascii?Q?OXUP+iMo8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbca17f-7e54-4338-27d4-08de7a8fc339
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 08:18:20.6832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NxRsKmNgwKrbWG2B8TwpVrr4gdjYC4XIl7qSMDYfbpR7JS1jwYT73IjBYzjuqSp/2RRLZ5QjSjiJuj7jD4SD2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
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

Hi Sumit,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sumit
> kishore
> Sent: Thursday, March 5, 2026 12:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Kishore, Sumit
> <sumit.kishore@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_properties: Add skip on headless
> machines
>=20
> Print debug messages for sub-tests which are expected to skip on headless
> display systems.
>=20
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>

*Sumit
*Kishore

> ---
>  tests/kms_properties.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index
> 86d05c6d4..01f0d5867 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -73,6 +73,19 @@ struct additional_test {
>  			  uint32_t prop_id, uint64_t prop_value, bool
> atomic);  };
>=20
> +static void is_headless_display(igt_display_t *display) {
> +	igt_output_t *output;
> +	bool display_connected =3D false;
> +
> +	for_each_connected_output(display, output) {
> +		display_connected =3D true;
> +		break;
> +	}
> +

The same review comments mentioned for the below patch apply here as well.
https://patchwork.freedesktop.org/patch/708585/?series=3D162500&rev=3D1

Regards,
Pranay

> +	igt_skip_on_f(!display_connected, "No active display connected,
> +skipping sub-test\n"); }
> +
>  static void prepare_pipe(igt_display_t *display, igt_crtc_t *crtc,
>  			 igt_output_t *output, struct igt_fb *fb)  { @@ -377,6
> +390,8 @@ static void plane_properties(igt_display_t *display, bool atomi=
c)
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>=20
> +	is_headless_display(display);
> +
>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20
> @@ -400,6 +415,8 @@ static void crtc_properties(igt_display_t *display, b=
ool
> atomic)
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>=20
> +	is_headless_display(display);
> +
>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20
> --
> 2.43.0

