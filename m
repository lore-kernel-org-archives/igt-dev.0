Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B644C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 14:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEAB10E5AC;
	Tue, 23 Jan 2024 14:44:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63F210E0D4
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706021047; x=1737557047;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sUmFyC0sDm7T3PhYH8S5Mias5aRAlfkBMViojvXDOWU=;
 b=UKstqOGcJ0/VknCE+Thf5DyPk+iJP73y1MN+hmnYRH5p+3pNJZRcM9Ch
 dxE/M+toIcTiV6Xgl1iM9+CAjqEbUSkMZmRBpvhKaEa7tAQhidyRVIOl5
 8JaO1/5qr55Sw05FOn8N4v1317MlKDhAkWou3IIr9hPBt4sEmAVP9LfHU
 afZc2BzgRIpy9yl3kE8LSuPmkGGiXeVSA2kaD+ke+BpVGiynhfuQgza+F
 j3JnFCY9Lky5mLlvVm+odXVBniu7ocgGCfFm8J8XIPGUiAYvu94ORYVzQ
 GfH9XV3uh8b9Ji+qBhVeF9BSVyVwY1ia9m65NGVy/czdTwi4QDtHX6tGS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405296553"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="405296553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 06:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="34427294"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 06:44:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 06:44:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 06:44:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 06:44:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 06:44:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksOv5h8U5njgmHcyTrp3JJIvN4RNSIl7tVDVpjJ2STRsP9ByP2QB/vsFqLgrp34jFGdV6GZgG22/QpEJHAgQvCJzppKG2e+n2/o6rCJbOcYJqRlxnK8DLJCm92QgEVr+K1OunBJwxlkEilSR7CXQUXz+aK6VNckfPYPkt10XRYVP9xMhcRKYTUY1A3IrEY/aXBeuIpzHxoUGx99GVXqoHDsOMEHjzhtPdGwuzi/eOAq85ceQtZDHVbm1D2PoX2v0DMw7QTZusuXtStxf2W47vPvpolf898508+YAfEzLNJpoQAl2tHeH3Gqc21WgCV8ZKArd56AGl4yEXUIcQMnKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gc8WZlU7dTyVeVbyIvugaRtT822N4fMl21wIhS87JE=;
 b=LJl8BUklg5tuNF+IdnVEjx5dZmIrIk0cm3c9Lh3ep31fTskp/YLmyCb3E5uAR6wK8v89Uep3lNMrVzdH6e0M775Y9XU1Kb/7aMEZNMXTovjNh0OKMEtsBp7olHHZoVdhTLaSWEtKkpaSPLpTNMMaFYKdlMMS76ZYkzoMThcbpBQO4S9zz7CHaggA/LMivbhwuv9aMWvZK/N8x8Nu+1EKdQA/U43rOyBewM9rfiC+sMFOegpP1cK47SqZdGZXPr7P/1g3zwyxinVRhnzTSPf4irZtrln7HT+1N9ONCmsQQbQSeqkA/omRJDaCVj/sqbQn6u9Mq5xzWRZ7iesyRsvX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5583.namprd11.prod.outlook.com (2603:10b6:a03:3bb::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.37; Tue, 23 Jan 2024 14:44:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553%5]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 14:44:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr
 mode can be enabled
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr
 mode can be enabled
Thread-Index: AQHaTgXDR/gmJvfumUOr9Wgh6OhW2LDneMvQ
Date: Tue, 23 Jan 2024 14:44:04 +0000
Message-ID: <DM4PR11MB63122CB024D1EA3DC968C78A90742@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240123141835.1211107-1-kunal1.joshi@intel.com>
 <20240123141835.1211107-2-kunal1.joshi@intel.com>
In-Reply-To: <20240123141835.1211107-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5583:EE_
x-ms-office365-filtering-correlation-id: b981e953-418d-43f8-a8d0-08dc1c21bf20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fhKARxCHdHISTlJCyaKZ8IWIe/mY1mFglWiusWOh4yk/otuMHihbxOoOdE6ZNg7xMOJnGHiht5HID0aq4kMnpp5P13zHuHkpXT+iOuxw2ysUBz96DX7D+zJ00FGzgiT+sTG0STQFYpxabzbdSxw4dpNVAJv6IgpWxcfUdayzLTupRytN0b0Ez7qhzyjQ35qb5s/GsU1q4M8CmtSoNeEqZg+qp5ocN5NfMcmmmIwbv1vrHktvcxecOHQDfPWqToxCCa58kq7PfShhZVJUufjqsXTH1eDFKAFE8prehm4NTArSH2GMuFUY4hXm+WFN1SXfqV1amA948RAnXxAcTxjypQMZfaG4ErxkeCHUEZHe0fnYWz0COXxk2IFizwM2VwFntC6bvHZilgZbUWLChwUC9fJEw+RnkyxoKb7OIm0owZgfnB269g5N3VZoflEo5ITnjIlcPb00qyY0IYRJnocKIAMAxVMfREfzlp7h53n3ZXodrfID1kfUGKtHinqH4e7l1T9/owpqtXyjpZxtMilyvtMLzVegHJJW1RP2+DWc33RFBHzbe0hBQypZEoywFj8EOTdvXyhiHpoBIyI+cNpG/83TBoTZbtWXNXGA9zxND3URQbJndxYVLnNftyO71KgT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(52536014)(8676002)(8936002)(4326008)(38070700009)(83380400001)(122000001)(55016003)(316002)(2906002)(41300700001)(33656002)(86362001)(71200400001)(5660300002)(26005)(66946007)(66556008)(66446008)(66476007)(64756008)(107886003)(110136005)(76116006)(82960400001)(38100700002)(9686003)(7696005)(6506007)(478600001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7aubOW5bSA1ya6uIwWnwrFDm/epolr5lT/c4U3G3XnEVA6a7xr9z1Kt3wA26?=
 =?us-ascii?Q?OhyO1juwsBlxzD2CsNTw0KEo+2STCaukdcMhqekCsFOHfaHd9q+wOc7eNo1s?=
 =?us-ascii?Q?QRah+sUulhE9wS5E6JUWgpQgr5RR4+XO2cSIRD+ZYZBrkb8dwwmqJkx4wXKr?=
 =?us-ascii?Q?c86H1dkcmq4popZTIARiRiWvPw0JpcGoq/PAaN7IGEbWBuwSaAPorh2NN6/l?=
 =?us-ascii?Q?lBsm0ntCpm1iTGMazZctrn0/O6KTHR/HxCrRzY5E2qY+iLxR0Gh+u8xrOjEA?=
 =?us-ascii?Q?pPY94tU8P5QaG36jV1jbNw/Sv3jIvZafXizDiH4OBkGzZHshBVsNEO+GCZKB?=
 =?us-ascii?Q?KX41HbxrasRDVjbUJuzBugGPp+Rn2v50l3QnA1+VpOyy1If0OxIENhuo5keQ?=
 =?us-ascii?Q?3aafYcEE06vYZVc7TRsbvC4TCMSjcXX+5fQ8XltPDnP6WWxP2i8FYB14Fwzg?=
 =?us-ascii?Q?Orxl8R7SJYwl4Q9vmnT1JACpALleSp/QmFAW3yam5V6IsnTvlbzjWcRll/Cl?=
 =?us-ascii?Q?adBm/8lrydSQwvCPtq6gegYt+YNfTtlda+3+pWn/QPLfRrAS5wRUlWrz5mPI?=
 =?us-ascii?Q?drfRNwGhxnofCG8JOHz+roNkYpN1xt3DQKQT8QMYQfprIw4F6bovvpAvvO8d?=
 =?us-ascii?Q?eF+RpMbDJqCpq48XSzzMHyS17Q0Qwyyko1Jn5iL6PlZQaFC36rW9vwT3Zp3a?=
 =?us-ascii?Q?za9jMwZXnw60DURKdVxoQumgyQKM3df9tjKJzJEoviYQo/4dk/9K/wYjnWCD?=
 =?us-ascii?Q?x3L5ssFxPoOLtPcPZbUNq7FUvmOiPShiUXtwbt4r/praj6RQEmGvy7Imlyyn?=
 =?us-ascii?Q?cgu47BME6i7UTE/YWmmlIAyWj2lPjqZHHSR3RRQYJcACApCeELxWGTO393P3?=
 =?us-ascii?Q?KozwKPOcWa61jDzS2zdG1fVh+jtPEPApJ5r1SMBTRsI2qUBaIbQrZ6P+u3vo?=
 =?us-ascii?Q?lfA5rcO/nhnbNlQHg0hHg8REaB0SSlA32wfShJCZvfb6xDkkdocx9EwlFwhO?=
 =?us-ascii?Q?KeDUI4YngrmFB21ZltdbJ87DcjwcASTjx+XagUzYfzkf8sjDp/VKuH5kXd7B?=
 =?us-ascii?Q?Kiu4AvIQq3te31wH3whAd+c/hhlVFpZQD0xtmV9tl7sq3xveu+XZpMKTGxv6?=
 =?us-ascii?Q?Gt2ry3GeKNxVJ+lCmCHR3zD3deG5jTPZcz6ICCIaJ64k4pPaTKi4KHTTO81g?=
 =?us-ascii?Q?meFIC/fjpPymaiCT/d4nILfeB8a1HPAjc3CDCfduEz19NX6Zsr7+QHTWQL1i?=
 =?us-ascii?Q?ZHs6P8R3wxwxeQSK7JqBHhSe0FwezjH3ZEEDZPJ1BlsP2dVpWuyOcBE09R91?=
 =?us-ascii?Q?qAm4YUXakaFfkp4cY+D0ZZgNuSR1EkWkEiMM68CZH+S4tN/DnUzHrdosBHpz?=
 =?us-ascii?Q?vAz1FmwT4wWrOEGrEK+j8QP/JyUAHpFh4wFcNXqNiswfOpAxnortz1pVf86A?=
 =?us-ascii?Q?6dCjdCmIjua8FwdpRBHgyW211A1X/k0phdiuVUrNAYf0znXXiaJ6FIrBTHYh?=
 =?us-ascii?Q?LdlLSQg5eVhT0JddpOiuVkf/Cjm6P8J+MtVlWCfz581Kn/H7VjVAPm17nQt8?=
 =?us-ascii?Q?W6ESGJApoHlpnSDqkcc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b981e953-418d-43f8-a8d0-08dc1c21bf20
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 14:44:04.5684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UN9LY7ZS/neiWtf7KHVnEEk5YXFzWCu1STgAHIekc2K4q4N+ksO/aTs98MIL7nwy8tJj5i7wDHI1rC/VrfVEmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5583
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
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Tuesday, January 23, 2024 7:49 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr =
mode can
> be enabled
>=20
> Check if given psr mode can be enabled by reading enable_psr modparam
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  lib/igt_psr.c | 23 +++++++++++++++++++++++  lib/igt_psr.h |  1 +
>  2 files changed, 24 insertions(+)
>=20
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c index 663bac163..181499cf7 100=
644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -394,3 +394,26 @@ enum psr_mode psr_get_mode(int debugfs_fd)
>=20
>  	return PSR_DISABLED;
>  }
> +
> +/**
> + * is_psr_enable_possible
> + * Check if given psr mode can be enabled by reading enable_psr
> + * modparam
> + *
> + * Returns:
> + * True if given psr mode can be enabled, false otherwise.
> + */
> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode) {
> +	char *param_value;
> +	int enable_psr;
> +
> +	param_value =3D __igt_params_get(drm_fd, "enable_psr");
> +	if (!is_i915_device(drm_fd) && !param_value) {
> +		igt_info("Failed to retrieve module parameter enable_psr\n");
> +		return false;
> +	}
> +	enable_psr =3D atoi(param_value);
> +	free(param_value);
> +	return enable_psr > mode;
> +}
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h index 36711c0d4..82a4e8c5e 100=
644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -61,5 +61,6 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
>=20
>  bool i915_psr2_sel_fetch_to_psr1(int drm_fd);  void
> i915_psr2_sel_fetch_restore(int drm_fd);
> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>=20
>  #endif
> --
> 2.25.1

