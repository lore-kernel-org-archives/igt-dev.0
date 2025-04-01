Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080E1C36008
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 04:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEC810E075;
	Tue,  1 Apr 2025 04:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4crdpBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD4210E075
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 04:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743482648; x=1775018648;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7TNgHBCnYx98kTjvqkflx0J3SFAt+XVslJvIEGAPSHU=;
 b=m4crdpBqtIq+kymhnNGi9xibPwWQJkEGThsKDt73qSW0MXSkldX6u+F9
 Lt/Y/8WbwmzMDtEGYBt8scc3dabtIs3cTZ4S5Be/4HcsPUpSzUuWcv7pY
 YKX7z82MiTXkWdWeYSs+FaF0Is/qlgLZj6kCjsfNSKJt505oTp6PtZiiE
 WAngCHU1DQOqyFe62sCkf7hcvTPjiLnvoRyriUbq4m1BKt6phvRtkU3+R
 Y99IWCzog8qvmUWWg4o9PaArUJQcGSBUtiTdi/rrmP77jjW75HsbuBw1E
 k4HY49S4UxLdjgDDM6YJU4uydyC6LGy/tITvRFZ0Ntz7NTV/XrvZ9YhSO w==;
X-CSE-ConnectionGUID: sG1sKHhDTGewEdKQwC9a8w==
X-CSE-MsgGUID: df8olpAHQ5ScxeHHB6bt8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56153470"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="56153470"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 21:44:00 -0700
X-CSE-ConnectionGUID: i+ZO8l/RQs+MwJvAwjoeVQ==
X-CSE-MsgGUID: gDFFVY3QR/Sb/y9Tv3e3vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="130394963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 21:43:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 31 Mar 2025 21:43:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 21:43:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 21:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5Wk/VP1k1ibLBurbg6j/jo1jpkX0pG0cPLKCCv7O2oazuXZYRWaWhbnjJ1qFMnEgeun7pcsHObsmJfuL77spkadoN7ujKUC1IeBRBiVEM9/e72+0IaQtNP0sksxZJo2U8OLWvTkk6FHXTgSUnLtrXZa10fCSKXiORG2B4PldxWMYsodYv0Pert5ZCxUfWpV8nZFsqw6N2T/yOol8pKqYqRdPH2hPTsLN0BoUCm6DrgbmoxO/XM/UmvJlEZ21aAraKQWRIcQDYeZnIGTOWQ/qqg0Y+BkjkwAeSDgIJEUw4NNECE5pC3V5FrsTqL0JPbBEJWqMlZFTMO4XJ8WUgWNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0qYwwGTp0RQhR5KC1EQmx/ZuLlK4wDFTsjUON9vgR0=;
 b=dQhRvqsbsU0WXBON6yDguwnOUOutcnIbs3rYNPThohVIoTikPyB82PFktbj/Hx0JwejQP0AD+sm6M8zVWdTWAz+VSSbJNDYsfeFTHRW/k9RDL0giBZxXfxRLp6qC2pmeAjm9fMcCjAsgErqOZx6KDOjjeMfe+OyzDjhnlMe63dj1O3v+uzGQpXvmtlW1+f/Q4RPioFE+5pIOVaM6j0tO7x2Vd4dJ56FFvKbzbnfQGk5zP176RiHPoH2QdWRtTtHI9cdZN+5VW62076rAzFNBTHszXmbEUJ/zSLJEmrvpoawyJl9uMmvu4aq/NkljV/LgOHGho4cmU/oVOT23ZN0oGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 04:43:57 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 04:43:56 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/igt_fb: simulate i915 linear fb behavior on xe
Thread-Topic: [PATCH i-g-t] lib/igt_fb: simulate i915 linear fb behavior on xe
Thread-Index: AQHbnzM7NkUBazk6gUWzv21gc3h6rLOOQoFw
Date: Tue, 1 Apr 2025 04:43:56 +0000
Message-ID: <SJ1PR11MB6129513590A22A5B3849DA61B9AC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: 69703699-7df6-457c-b187-08dd70d7cfe2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/ns1tgtdhq4uNIJ+bZ+AsLGFqzv+dEOses4RcdNAl/eRtqmHCBKyeeH06pwC?=
 =?us-ascii?Q?+KWDW2OJLbrGHDX+XtWwbxTZrGEDip+X63bxUrTyI/QT+VFQ4cO9DO9jtdf9?=
 =?us-ascii?Q?Je8DhB4DIxVGKEuHipoY+IflV625NSD+c/DJPyzpvhYthl6DtkfJqcmCcfcW?=
 =?us-ascii?Q?NLeBngXrDDciJcSD9Pag0WQegr6fUm6Q8K6c0HM4nrBSlzZBaOwpn5aOl7x+?=
 =?us-ascii?Q?KOFKP2iYETtiBGI1kfHcEO5sSPjrBqhNfGGPtsHCTzv5VYyzcOgpLqlWoNlf?=
 =?us-ascii?Q?LHBf9qD2MxgdyrgDQFLaH9nCCS2Y++mImrpUrG/PIHeTv071mpuVsvgwqaoc?=
 =?us-ascii?Q?qhgMcXMKYHcQF/eg51RUB/5l4kz5GFg1Bkz9593H4M3TOk6kAoKb6wDzTmlZ?=
 =?us-ascii?Q?jvDei2sf35d0bQJXCBsUFZ/RFmQP15oSaGx9xsbmvm2AXE9J5rzWPgHEjTGW?=
 =?us-ascii?Q?mbr8BpyG/jys0NKoysU1oe8auAQxchNy3YfnMmVf63zJ/MPVzq2hrBw9nMgN?=
 =?us-ascii?Q?Hg1/+k8ObXl7+fQaWxWvE97WwqK4XBQmx2Df+wvpj0HH1Vm0iZ0neQltQJ+Q?=
 =?us-ascii?Q?TbfrFET7HsRz2cc9GstaW+WESzhzaNRZ0FsfgAaWUG20MSvVQ4k6/qzW9fqP?=
 =?us-ascii?Q?eEeFqRxyJosyNQvrFNFPAjlXp90/9AuBUto+gRYbIr/EHzFLJBGWO/tMH4iE?=
 =?us-ascii?Q?EOMX3eMsfyiMdqcs3HrMUktfQSd2bZ3kufxXpgpxL1DYBTD7O28/uPa+FRMS?=
 =?us-ascii?Q?ir3Bcap1u5RIsuBon8moa2tLbt66PSTx4oWrQBsdpB03VMLek6n8/gROI+E4?=
 =?us-ascii?Q?J682JXpewrIda6frfKkpmKmtCUuiussaeXtzzCrqgmrUzl9V8ZnKqLTnbPec?=
 =?us-ascii?Q?Z8nuFjtTWQtQjX313ivb8kOt60txudlugbCGYyLYr2ula/64QSuCjnxf2Qbh?=
 =?us-ascii?Q?MW7iqN+05l52t7xhSi4AeX3NcRgO9rxuEMKhkjv87GTn8LBIy4d/4SfynKnh?=
 =?us-ascii?Q?d5kRfRPAxXHkOnyIwlzbN7fM1H29CHTdE56etqgkTXk/I8t8o1QrIKkDoy8p?=
 =?us-ascii?Q?g3BAz9ODqY3VHA2Qw+PhTRU6zzrdp4rp4N2BrkAnYz81ZOBlBrYHtag2SMtC?=
 =?us-ascii?Q?y0uvACpT3U70pLrpmrpR9J2FemRB4n5XhkzmEA0qn7R1FW1XAsEOm7m3HCvc?=
 =?us-ascii?Q?rlCUwTCLzSHmIuFkelTI4h7PJdTP6jz7mxenGcuqtq2Lbn7OeVH46w809bJs?=
 =?us-ascii?Q?xGLEcII2s1OajxWIE9DXKqNz6zBN5HOpTDinwiStfrR6HEZUqeNzRdanmNBo?=
 =?us-ascii?Q?0jUX9IPoHrolieGCIQfBAXge53maULXfgTlAfAmUxYpy8HCw4v/5HyRa/wKA?=
 =?us-ascii?Q?CjfJYidCx0SvJrFppQ4HirH8rrUXPtiENTByTUNx76F8XIi523XiFtyvv87h?=
 =?us-ascii?Q?jMM/yteGi3nfT42yfVIhx3AOyWT7AbOJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hXgd+lDtsD6AWsODwtU1vP/LpxVpcDz3KqC/Tky01qE7z5LW0U/TuO/6TYhW?=
 =?us-ascii?Q?fBDeA5Yc44yEi/jrSAeU1iH86UIHPUgbqdchJEVo94x+mCawDeE/yaZE1d85?=
 =?us-ascii?Q?aJBfLKUvwsU0lCcimtK1YbGUzkcYyy07Cjdimz1dIMjerr6qOjshIayip8vm?=
 =?us-ascii?Q?UfhHBiPoo2Ui0EXwkegb8XgnRjwIYfMs0J+0b03pEYJv8Eq6DHMLGO4kB3JA?=
 =?us-ascii?Q?2CkRmW1N2uqEVcX6rClur000W0Mvfqb1iO5u0XJNazx3N7qA2AA7sqKuv904?=
 =?us-ascii?Q?0XJpstcjI0KZf/HY/yBLkZvz/yoWFCjvU2PSCHhCUHP4NRSLRvRau7zWbjoo?=
 =?us-ascii?Q?TB9rX4PvuJIzCw5dJW22JfnrI7GWm49TJ1YMjjdJI1WwJes6vT1DHbto4n6J?=
 =?us-ascii?Q?mDtqiyJycIHV6EflG+bt2uMu/Q50it0RdapUO043QNxY/ATl/t3+5GSunIfP?=
 =?us-ascii?Q?NGVpYcaZBFZkVnZcgq2+4KwqC7BNwLMYXclQKA2/qgVL70L1sNEL2x8YGg1T?=
 =?us-ascii?Q?rw6umVJDZkMjWo8lVDPsVLyGkzMydrT5A8FT47IIeakFFF6sG5TzCLY37fKL?=
 =?us-ascii?Q?iN7PMeHTmrXucdTxSJEpZiHxdf2jvChH4hSqXa3kvEbUpXt0t3RMZvptkKYf?=
 =?us-ascii?Q?NptmY6srJ0A6xT1TEaKer03ju5LpfeHxA35WH5DOMBv/E7saw1olXo/P9T2M?=
 =?us-ascii?Q?PllFZS+tvGB8vVU3neiHF7n3ySsw+0/QXd4nRY1OmP6El3ET2vKuxFZGKr01?=
 =?us-ascii?Q?ywQmi7GdtvVyYnXrDIt9uFmq+hWStR7LcAKua/EzRS2FcRziqM2mfPpcZoM6?=
 =?us-ascii?Q?5r+5q98dMMmee6KVURi7tc4NE+Im6lJ5nVcWwjq2d+hyjajjuO656F9vN65E?=
 =?us-ascii?Q?T0DsCDi4NqZPoHQKmxexAlGCl1vLlwIZ5mRqAo+nlhh7y+nCInM6+38qcBlR?=
 =?us-ascii?Q?0t/29gs0m5CndC13hNNtybRsr06FUADevtN5plglnOxaWc7/k5g1cg03xaLW?=
 =?us-ascii?Q?myka/+tK9ZiAGOAY/A+1FDoYVgw5YoyE3PLgBOxlF3JzN6ru6g3ir9sRS/w0?=
 =?us-ascii?Q?2Syi/FThye9yPovH1oIToAWNNCLyXj09/tE014vBKnxanfs+fRWStcyRWsSk?=
 =?us-ascii?Q?9C+lMUvdq2pu5oomwLbigRpj/MVeFBOeecnH2C7fMtSMFKokSCQV1G2rXmRq?=
 =?us-ascii?Q?lF/XVq4bCKUzLj3u/LvcWe3SPYiDwdHWnbGGjfY5vABwShHuBEt9hP9wz6i8?=
 =?us-ascii?Q?kQCn+fWTgr5a+4p0iaPDIL52tEpT+3Z+IZry6M818x+TKs41cF99kOAbuN6D?=
 =?us-ascii?Q?KMqeL8Zeb8rDqDDDJuYa45jhNXU1Q3jADmnPeulf2BwVcSYs7TMZoqxhzS6W?=
 =?us-ascii?Q?SURvbq60AOLFQlZTccd7JfaRRlbk1Nyc1wdzIKxAe1RzDSp2yDU2Yve0lgSE?=
 =?us-ascii?Q?DmLd/IZq9QEXzTAK2bIenttA9DqCcF7K8NqmSIgfN0YyvBOC44s4BL8UrpY9?=
 =?us-ascii?Q?s5v4tow4TV6XkhWuG4fsNpPIXTUTaJnyKtb+Lqwy2gZXkQPurkyuOwcBMmrP?=
 =?us-ascii?Q?x4ibFOEJWooTRpVfG8hnORlWoqiFwq17FanhLaanchvNyUOEhgd39ryHlqTX?=
 =?us-ascii?Q?sA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69703699-7df6-457c-b187-08dd70d7cfe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 04:43:56.4318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thW7DT75989+p8G7wlVR6a0y5BDTdSRpAFhbg6jk5eHiGuOm5SD0ejWEYF7YkoY29b+b/KG5m4hpym1StNXnq3GQvf9zuv+njFlJw6SYDfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
> Pekka Heikkila
> Sent: Thursday, March 27, 2025 9:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Subject: [PATCH i-g-t] lib/igt_fb: simulate i915 linear fb behavior on xe
>=20
> even if all framebuffer as marked as slow on xe let's still use cpu for l=
inear
> framebuffers

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>



>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index d62a94e51..9fc1bfc65 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2602,7 +2602,7 @@ static bool use_blitter(const struct igt_fb *fb)
>  	       fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED ||
>  	       fb->modifier =3D=3D I915_FORMAT_MOD_Yf_TILED ||
>  	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
> -	       is_xe_device(fb->fd);
> +	       (is_xe_device(fb->fd) && xe_has_vram(fb->fd));
>  }
>=20
>  static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
> --
> 2.45.2

