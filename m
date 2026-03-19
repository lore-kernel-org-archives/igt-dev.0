Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C49A108E1E6
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 10:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9710E97F;
	Thu, 19 Mar 2026 10:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBBr5enE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE8D10E97F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773917465; x=1805453465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FC/VkO5mPIUVkzBsAXq7IfPTGgkQt1pjpYnjHmhSHhM=;
 b=XBBr5enEQmc+oUW/MwTzG/xN7ozmiLDU4Ni932Mo5MWTdM7fGqNHVyXX
 8cE8M6Hzv29o8riSGWIKqBstKT/nQOmPTDz8Ch+92wvf5YwXMqEMa7Wfo
 HaJK8vW+RHlvwy2nEky+BKTTd4wvyobPS/VfYVY2b3Bj9kAqS25IE/ZXN
 wnGZypsdM7G3e6StmpRpbZ0T0fqeowGSYylu3UCdN0KLz/fKuWazWk1tT
 o4gD5daZuvPSKpnK4/97Iy3AvlSV0WMLd61zQ18VVT1fOhMh6BP/Fs8tG
 TkaImNO8WMF5ZumG+hMfy3EKvq0gA/Ovfg12QKJ8iPjFp9PqgydpBH9RH g==;
X-CSE-ConnectionGUID: Xb+LdwFFS2yMghtOTxCePg==
X-CSE-MsgGUID: koyaJCYZTW6QfPk6AFmwZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74000193"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="74000193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 03:51:05 -0700
X-CSE-ConnectionGUID: V44dprBpScuwBwajnnF1aw==
X-CSE-MsgGUID: DeEyOhFQQ0KMcgIfeg3AwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="222906831"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 03:51:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 03:51:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 03:51:04 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 03:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+PPrjKKAkjaIkn1ff+DwD4ie7s/eFIa1fzMwreD95Tn+bbX3OlgPTIkx1kK5WSbPCVEIpxle8RoGQM/bWR5g2nNlt4QwISDUVF6rKZqq+qL06VxkVuLVAyrc6POco9LFfItAwOCTwKzoY5enKN7QRlpChNwnQuAsBr/pFXISTQFyhxI8xU3l7daUwoCjtwF9zAhoVuGS3NhPWwkeJUkkl4nvabY0McBwvpGGqaqRsDOabHObA4vzi2z1DUupEPbaF/5laLOYSVfUxgh8sQsZm1gDacOEFN6ZHagcssInO9PEH1OWjVPZgXrfyuEYp4jyAIQC81z+6zM/nEOEiYT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8t4UQADAFqAqznxMVy38WIAyXD5tmTrr0LIdOqI+DQ=;
 b=W8llvkF7F5hiaJHwbqBvYChGDArPddTHu5QDza0w4VcaScBg3djt/rQ9o82bwxnroPTdQFUw/Sl3OeWC2nyOpgdtyWUfzkkeTK33Ao41WWeTPUiawRjTeIqFRJ7zTzWPMluOBpCiFmad2ZqrhH06JAeGXOdSuzJRtDrelXA1RI2+1QN9K3oMgJDN3JX2/d/DXt3zZb97v7wzrCI61kgY6yOHIcvJonJW695szfhZFEFeED/ALSfq5U02otBjTkcDlNKuJP5CSCT8PpUksLGw07YYCqCW8Vq7qTkr+3IAli6IVi/J48dYkjImJP74l1gnQDD2+armOS12jeOYZ4aIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 10:50:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 10:50:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v5 2/2] tests/kms_content_protection: Handle EDID
 lookup failures
Thread-Topic: [PATCH i-g-t v5 2/2] tests/kms_content_protection: Handle EDID
 lookup failures
Thread-Index: AQHct2vABnA5j3qzpkWvUOsFsy/TAbW1rNQA
Date: Thu, 19 Mar 2026 10:50:56 +0000
Message-ID: <DM3PPF208195D8DAC222A0188D2D82DE353E34FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <20260319064115.72836-1-santhosh.reddy.guddati@intel.com>
 <20260319064115.72836-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260319064115.72836-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB8660:EE_
x-ms-office365-filtering-correlation-id: aa1dd0d4-3dd6-4a3f-965e-08de85a5665f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: Kls+PfE38tHnDvSIY6vOS3Jg13s2FpI2P21QLJpwayu8iHqUvqO75VwF1q9eWhTLlZAhdxSlMC/I3XRxfeJqKi7F1EPHKE4xKolJ36zKSerTDg2+u/yPS3ir+0MTrykHxw9ZD/3qAV/8r/YumSGFFT3p+drbLPfbCa+n/eNL3jeje/yJDCxAjplG+ORC27WTNVGz91AR/9Y0damEjR7W8t93nhEfZqwyS2d2mqNixLjMF7oCzZrN/e0IKGyn1L7jcQVo+1Sc7IgkU4IV41sDEOWOJhqlUEQnsOphG0c6CET6PwNU0KQcdeOHqZsQX2vyJ8Q81wda44tYEYQYEv0fzrijVF5TBeasZJH97IVkMKVWOVoKOdMViyZGkhXMdrKRoOAIaaBE33dAIVPxSlAd8H5FP12puBhmIjzUpV2WwLbpbIkhqyeUfW22ks0fOPBz8QpnFXdnCypk9mWGrDA0iZediZOQEHBqVcOFLp8xQhkWPBWX5JZW86EIp8gjMt6JJ0FPUO1iiu8QJQITpW0e1ZnEjeiHAp/ojYmwg+XuY7lsRjbmKYa4xRJGtOdjbaEUTIAJYRzMiD0V+yRpC4yC1RaEO6UenSqJM/49omMu+kN/EirkvbCQFyUZQfOeh3ILrmEbZpXuVoGwFGpymrHlh2cEsBrYk61/0DK8jPSHiXQ185mz9WvH0vV8s5sBTXYpedC+iwB7yyGsP5JhE75oSkfTHG0oXTG9kIpxIGbP+B74ehL7zUcIF7NqtDBd6auRoqn6RmcEUnBeehXoGxGc+OXn3pTKBddodnw6MN8E+EY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IufFk3tb/nOQW1pnxxg7YwuVxabebcTIq+RAZrDOL9BjJlmqSTflJzGUVz54?=
 =?us-ascii?Q?YqUqySIUvK8MN2KKgq1tb6xGUSbNpXTndUv2Iy3rCF8fRysDK7by/MyJoqPa?=
 =?us-ascii?Q?2BY0BhxBiIgilOqkyzyT/WLiJ1CPNCTiAek/UTdyd4ZvysSbwAO97M/bJCQS?=
 =?us-ascii?Q?Sb2XxVm/7R21bwMp2fMEJxSZguMpv9cYZt3A+wW2DV2kM6AAG++qmqg8k2Ai?=
 =?us-ascii?Q?04OHP5IkFf+BP073PCLCwG4b2jusT/sBEhrbDJxPgYldA/yJKuVpZn9fgfgU?=
 =?us-ascii?Q?EFZ+W88qEv0DoUjBTyGwhtDzJK2aHkur00MPNtGhp4VpQ13HPP20lq/Y6ofp?=
 =?us-ascii?Q?gG0ajGmA+8zFXA41XEbcEzTDRVXGvWcBC/iVbMlBADa1VcFALEVkCcCJ208d?=
 =?us-ascii?Q?rI1cov/VlKGHCuBpwwOOl9p4poU5ZPrCDUzQ3LkcN3ZL22DIwn0iv1LmwZNu?=
 =?us-ascii?Q?doefIUKNJ3VxAOFPfqu7PyKTxTpeiqbPY4ocgtY0M8jY+B/EID1aRe1hjzgn?=
 =?us-ascii?Q?h8DUMkuSUBhMkC8gyOeUQV1CTd+396qQiQz5Zxl7WKFP5PHnBNGIkGNesNrJ?=
 =?us-ascii?Q?NuOlFvttHlulmoJrtkbCntUz+Ypb/PlDsSoKMsrp8blEhEYiuX/RT9roasw8?=
 =?us-ascii?Q?+XKIkZ9bnEPn8c/97ueU3guF7v6wAJaezdlYQEcFsG0xwYBjBRXlNN4UJawF?=
 =?us-ascii?Q?TBO2DOeOKdXs2lPLSLA/fyEqw/bLnSwv1Wmh3MG1D6LmliTHPVIe8tzL3vWZ?=
 =?us-ascii?Q?JGUHW2oS4JNFDqKAGBWsZU/EPrIsXXclXvdiqrVDP4uIS0pl0CX/ZTJ9Zf21?=
 =?us-ascii?Q?D9ttTMEukpI14epQYqiCJvHNocowAmOYNfSuRGg+BIOn8lY5h0Hale7h4QQc?=
 =?us-ascii?Q?vbYqhGZvEs8pdxzfc0byG+Pdf5BOSgD6qnHlFfq/08aPv74qDtxW9aRmsgq3?=
 =?us-ascii?Q?BhRTHir3pTVnNH3SgVuWnvOAOi5Pk+YrVRLQ13sHkviZCQjbabz46vq/IPrM?=
 =?us-ascii?Q?ioKgtcgOzmrCxg7BxRkPOGzI4rVdik3fibPQ3jRrmLmLnRYet4A4LfId4ZTM?=
 =?us-ascii?Q?7zYFilJ7fdn64xL03uTa9oh5qJFEtoivtvOs7NYD42OvnlAM3YX5V9YCzikM?=
 =?us-ascii?Q?1g/XAng2EfqIv4EIJWpMkfRpRd8S/h/5A8C2uuLu4x6oPSlbv5lf5x0MhELP?=
 =?us-ascii?Q?y3k6KfzIVHWNk0PTUQl+g52vR9uwDtqKl6qxiE2jlnhU+h1ViXiNcR+0iaqe?=
 =?us-ascii?Q?UKnc5n652tGVWwmYLLo6WuF2xIIfoKAEFHfMduTEWmsnnnjCORDdnES5Ap3Z?=
 =?us-ascii?Q?YsSaKwBWXOiX9vJtylNM5QchBf3aPC/kfigwOqffP3IVmQFHqZHeVF0K7CJK?=
 =?us-ascii?Q?WjwRLphMHaT65AhZrac4t+muhT5JS7CK8h6DMr98Ya5X7+coCTIV4tmvhiP4?=
 =?us-ascii?Q?i++hUr+KGh2gTJv6Hdhk8nh9fi/mPAj/qzC+ssqXbKPCWp78g1zqJzBv/yKj?=
 =?us-ascii?Q?EE7tJnOx67jgsYkrE8zM01KpiG03FV/HYt0tkP3TIKemASIZR5PCZ/LviP+z?=
 =?us-ascii?Q?U19Xi6VZ3mKKqajtCj0RbAQfKJrT7/OOFyZk55cXCZ0ADOdVkyEsMTC9uKkO?=
 =?us-ascii?Q?eMe4mfFWUHakiDniv2uJ9nhHYhDOHQBO0hMPokfSaeqfCT7KvW0CAnajVvFh?=
 =?us-ascii?Q?azUIxfw60qpGt9777HNjTa8z1a7Jt+lg8C84lrNm3q8TQhrBjcExUD5rCXSc?=
 =?us-ascii?Q?YBjhw1eNZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QSQZa88rcReQEGXJ5G/iWvxKGOyWyeoPXyoT06HYtgb0KJYEQcB1HuEsYj6uB10NzRWITmgPuxc3KzpH9ZwcBfEFQSSoXQ+AVSqD/Le6NmY3Sd+H4HLu2a+5C9wZ9b3ghGvJuC8KoTbjmuaqGIvTqBkbN/UIRG2LtfMcBkd9qu+1Ws4hCRqNvgaFh3ZKsAQCDObXTMme22D3qpF7FA0qwVhrBW0gQX2AyL54RKkP3LK+1rOsUPkyvGhSw1VrD/+2TwiMMX2id+M03DIYzELjXb7cvBbW3BgkuPwDdf2DUhGRTroAJOJs6G3wr6ZMYzz5ncyVtTMIm6neOAxz2FrjWg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1dd0d4-3dd6-4a3f-965e-08de85a5665f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 10:50:56.6214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u01ZWUC6Zo1Owzw+dQu0dwHHqeUripbYnIwvHKZJh0EhimkA379nVuAAxDlxeB3Ist4ddC3Ovho2RzDzlALq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

> Subject: [PATCH i-g-t v5 2/2] tests/kms_content_protection: Handle EDID
> lookup failures
>=20
> During output selection, connectors may disconnect or AUX reads may
> timeout. In that cases, EDID blob read fails instead of assert log the fa=
ilure so
> test dont asserts.

Does not make sense to have sudden connectors disconnection when you are ju=
st reading EDID.
The only time this happens is you are trying to ready when Connector does n=
ot have a CRTC.
Needs to be investigated more.
I suggest you do not add this to the current patch otherwise this will hold=
 up the previous patch

Regards,
Suraj Kandpal
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index caf3d7a56..006aeb510 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -683,13 +683,24 @@ static bool
> is_output_hdcp_test_exempt(igt_output_t *output)
>  	const struct edid *edid;
>  	char edid_vendor[4];
>  	char sink_name[20];
> +	bool ok;
> +
> +	ok =3D kmstest_get_property(data.drm_fd,
> +				  output->config.connector->connector_id,
> +				  DRM_MODE_OBJECT_CONNECTOR, "EDID",
> NULL,
> +				  &edid_blob_id, NULL);
> +	if (!ok || !edid_blob_id) {
> +		igt_debug("Unable to get EDID blob id for %s\n",
> +			  output->name);
> +		return false;
> +	}
>=20
> -	igt_assert(kmstest_get_property(data.drm_fd,
> -					output->config.connector-
> >connector_id,
> -					DRM_MODE_OBJECT_CONNECTOR,
> "EDID", NULL,
> -					&edid_blob_id, NULL));
> -
> -	igt_assert(edid_blob =3D drmModeGetPropertyBlob(data.drm_fd,
> edid_blob_id));
> +	edid_blob =3D drmModeGetPropertyBlob(data.drm_fd, edid_blob_id);
> +	if (!edid_blob) {
> +		igt_debug("Unable to fetch EDID blob for %s (blob id=3D%"
> PRIu64 ")\n",
> +			  output->name, edid_blob_id);
> +		return false;
> +	}
>=20
>  	edid =3D (const struct edid *)edid_blob->data;
>  	edid_get_mfg(edid, edid_vendor);
> @@ -724,7 +735,6 @@ static int get_hdcp_outputs(igt_display_t *display, i=
nt
> content_type,
>  			continue;
>  		}
>=20
> -
>  		if (count < MAX_HDCP_OUTPUTS)
>  			hdcp_outputs[count++] =3D output;
>  	}
> --
> 2.34.1

