Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E02CC6B03
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 05:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8627410F07E;
	Thu,  2 Apr 2026 05:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bpgt6+pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9B110F07E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 05:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775106928; x=1806642928;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sS0fMHI8+ZbJ3pRL/Xp7tZFEEe6sJ1nNjn3IyAvWF0Q=;
 b=Bpgt6+plLYzITu3efRrcpiknWTY0jrvYwfFe+BcDcp2FgcQ984Bq5QYB
 P9fr8kpTRlvdE0haLq/RXnHfixVNpV8rz6LvcvJwU4DFaJS4h3/4y6ouj
 31xVN/+m3w4q7vVF0RkVYrNdRcwKLZLjysM07YitiKTAv7dCszZ9dAdye
 5jbancvRbU93OlZNZTNgudRMi7JXpjjwi3rLTkv0Ux7Nfuy/OQyvd0Tk6
 bCyh4kWsrhG5UjwaOVMvushtUECIfpNe45gnl/qWKTn1oWDYsnicJuW2E
 moBrvn8u0wIpxZPm0xydiWUYni7iU7plc83PXP7KUTkAlIgbjFHLbqImD A==;
X-CSE-ConnectionGUID: no6ILAgmTVOWxLEOVIe7Bw==
X-CSE-MsgGUID: bmHn2mJDRoudBMkB7OW8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75333864"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="75333864"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:15:28 -0700
X-CSE-ConnectionGUID: WAxmRwBgQfKtXeHj614OfA==
X-CSE-MsgGUID: zlMZd//1T0iYj71whjpbQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="231676128"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:15:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:15:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 22:15:26 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvL7zrOlE0wNQtj6LT3icB+AHbxYoJZGaxKI5/LyN4IzS+rZqag7+/xPC+zC1rWuEiErccgwPfQjvBKQuDGVccC0ovS/mHAVUKLPXNnbXmY1JLz0/A26w0VIcrHa5uLD2+REr7O1LM63K8aJHnDKm5OiMoHZT7cowcsOkSYEqxCeLrqr2acsglwNUnR/M1FH3T8RX0MwviwyRDBxKQzKesh3f5urLvP3ri2cViSO/qe7u8qgdZ6AF9Ni0flHGFJ00CurZ0pRkYv1jpqHSpLjw+25VtzmcnlPMxCjmwJW0C9EeyR7sewgndJKkjFHWVrKzOUSnNaG3jYV8AIE/OLaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0jeV3DSMxIkCDCE7F5Ntp7fghQfLPgUH/gHFuZs3qE=;
 b=kHly9TL8Lrl/2+Ovdl1Zo6jDKtqvK/hum/IIY6EMRWNYYCQsxypwMUxG5TC8hplxV+r7w0XcggEI/fr7QKZma6rDUuSAhbBx0lvTNTVTtDk4rw6+VaqYf84XVmVJtwQnwOszoESM6+xbNLUM+BFcSym7eBRukY81+HwuzCf1913RcvbkH49k1pmz8yVnmwd/CggsiYKRc9RrtZzJuyxY1X79Mfihg9IgThT0TfaHgi5Tn3ykh64ePxj7nqzl0K34AF1Cd0+LZLCWmZpUbqatSEZ4WC5q5vYIpRQzDLuz1OZec+t0SNmC3ReBEBKN5swmYw/a1LR+9DmgRXPbuITwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) by IA3PR11MB9183.namprd11.prod.outlook.com
 (2603:10b6:208:57e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 05:15:23 +0000
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22]) by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22%4]) with mapi id 15.20.9769.009; Thu, 2 Apr 2026
 05:15:22 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t 2/7] tests/intel/kms_mst_helper: Add helper to check
 for MST outputs
Thread-Topic: [PATCH i-g-t 2/7] tests/intel/kms_mst_helper: Add helper to
 check for MST outputs
Thread-Index: AQHcwe6vX/oBpuj6WkKdrYdzIMCTU7XLOw+g
Date: Thu, 2 Apr 2026 05:15:22 +0000
Message-ID: <SJ5PPF1611BC49E85A372FE6FDFE0CF9897E351A@SJ5PPF1611BC49E.namprd11.prod.outlook.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-3-kunal1.joshi@intel.com>
In-Reply-To: <20260401160627.1338526-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF1611BC49E:EE_|IA3PR11MB9183:EE_
x-ms-office365-filtering-correlation-id: 29f32c74-feee-4c75-52ae-08de9076d758
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: hHTqnSFL7pF0g7PC9OvjF6XvO9GBndt01veHGWGwi8JWghrCqC/D7fFoBHA3etB0zyVeVqFVbVKPta6tbywft3gLuMVuk6aHd+Pm5FTOvUrR950b/qD6ZguqB1XNPwKiSTGuPwCXlu9ghPRiRNyvbuaGzjrJQf3YxXNqbNAbF8jz9GtNQEHRou/ELoT86jEGFGzTt41O24uiFnB8TtZhIs4gSfNNDCNpWr+lU0ZvSrsI777Trca5okhrz1SiUY2nMIq/YHBIusUPwLKHRmIhb8iK0nG+EX35vS8dcZOUiBUGnBt9tp48bezberuzF0gPqG17+e4mSKBWad7fn+Ov4bjH3AjTkN/RQb/0CU3jYjN0q2ELuBesPNm9YldpOda6bXG5twhystfeqbh87U6qD5Zk9xZoWLuDfz/hH/rvmjSjG6qLKtflNctVaM7DyrW6lGGuLXD+Lfualc0IBchoKDPf4trxYCSG1Xn00+b34aaAewgQGBz18FQ63J0bPVTYXT6MackOVzdNvFq+L22xTod7NNt6EBd8UH/HAmiG+N8fNmWiunfAB3FQDyuurp10X6JrFiuTGiBIEv8r4QKbBCviAkGfawR05s3kD2e+fFjFa+12dGHyXxtpjqKFrM6W7CxrB+ZgF5OyCCVBWUBkCFUef7MQt7S34dOXtXtMdHs8pVRnVGP47h9h6gmNMm8gTPzraMBm+gDoGAejf6EpKnVqH68Zi8MvMyWcMOOyastnvG6uNyyGr1PEqTWM4N5TU8Jdx3eSsOuPrY/wfhZVIvTUQ1nKkxfgbWziych2xcE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF1611BC49E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?njS4ctmYfSYbB60ZFd2GTFW9NrhnfXUnljsVjiJphEDtYYOzpMVBWEDeX7ZM?=
 =?us-ascii?Q?khjLTY7VuC9PwukuOiLObG/YvFoyRwyL8+G2eLmPK3IvNqOKXrgPSrzN6c6P?=
 =?us-ascii?Q?2+YKTUlsjkpO+g6r7uNvu8AoWybb2Z9nW3QUbtBPkqeL29sdKUA/1R1x9m+j?=
 =?us-ascii?Q?9GoNvgl7yXGSyb6ANb6EsD0/DMd+LXP4Mlq9QnIGuh58qSKsGEVeM8aKKLV7?=
 =?us-ascii?Q?NIo2AtuwNDe9xPOK9KAHa2/id5ftAi/wZYbI8rcrQAeZFpV0nDBw4l8k/D+C?=
 =?us-ascii?Q?YXsl0glEyh7n1Ff/enh8668CKV/osF1LpqCUyPSpcY0D7F3wIyeb1PJPljAB?=
 =?us-ascii?Q?dYU53fKUvpj7x3aDCPKiukfrOqYPt4eVqkHlmBhNmfDgalPopsomRoc9+zyt?=
 =?us-ascii?Q?YmDgZFIqh+fkMNvaRg0Eq9I6UkkjTtMyDp03Zec2VBWsJq/dVZKYUD7ggNXV?=
 =?us-ascii?Q?/gQq8vDfih8ZqrTqlZNUczEK29CJ/XRFZ/sKmMVFb10AUcvCUxw2wc1ozyVK?=
 =?us-ascii?Q?6jELusnvKHUH0njx/FNdemJ7JYdUdNx+wIIiesreXGxx7eQZwbIEeKm8tvZd?=
 =?us-ascii?Q?U9g47gUPt9mXPnsdnCSlY3pa3BE/SLAqZ1gH/ifG3Na6MqaohmxMjdt1Pjj3?=
 =?us-ascii?Q?Iha0uIxAj9jZhPeQ/G/DDm2cAPnlZc3/OQWdFAzMdDIkSAASjDmI9iG7tUkL?=
 =?us-ascii?Q?Gj+MlEF6aQm0X9WL7WLLl1aRrn8R9eYPzfaU3c6Hfm8+zj/JhrcUc/6uG2uB?=
 =?us-ascii?Q?urBAIEhXJ3l8lyV3iENrancWT6xNZC8MHNNZH74TiY5kFRYGRpP6F//8HHRF?=
 =?us-ascii?Q?vkFdP/SbEqsRg6Aba8nRh7I67CaOGvIM//C0WEjqyTI8G43We6QyRvcO0Ny/?=
 =?us-ascii?Q?g/7ZbdYH12KY+kqgnbaUBjZ/MSaAzJW7AzfR0PtKasxtqZz0r8tx+8qgF39w?=
 =?us-ascii?Q?Nbx0eNfM20EOsuMbpZ06N3WZCeh1oe3rXgD8FXCiG6GwZ36R++7qdM5ktPtz?=
 =?us-ascii?Q?RRe4txmYLwm09B3+XcYokevyd6JOjWCozzwFL32W+sIX1hdDGYYxst4ZpcWh?=
 =?us-ascii?Q?qvOJf2B767b1yEkiozk6PjxXyXk38svI2WsIezML8Dj9capOUg1jU3MphaEA?=
 =?us-ascii?Q?vZM/zDeVv8G2wowrHCciKUvnawreKA0kKWfRqf/hgq0p09Uj9/ganWzFhs5v?=
 =?us-ascii?Q?dV79Mqtd5n5IaU6ewAVsxz4hK7RB8zqYhzgJJM5mww8mH7WzVgoeSFl7Yo14?=
 =?us-ascii?Q?jCflZHPOsnCOCRMHb3yhcEZhsbRsBn0pCpq/9iMgKsvwh203QDYfmJZzgz26?=
 =?us-ascii?Q?DEoaEXQw3mzG3XFAQrj5SrGkBaMwEbDWy0pUbpzI4aaI4got1MluW/dm6sD1?=
 =?us-ascii?Q?9862Bsj4qkLJ8MQMKDv0eSsOcN0n+aYH4mH7OMMOjcRqPKhdtF/44fP6fzWL?=
 =?us-ascii?Q?mJKOMGdvkJjLBgJuD+lYqx0ODtgPayGt/yCkGDPL/TLSlaBfPXE1Ahx8WF1O?=
 =?us-ascii?Q?9IEOBTlTV8yLx1DKFL6Tsq59eALHDN144JJZ3SVdqhFr3xe7MY9nXmxgnIiz?=
 =?us-ascii?Q?qoGtCD9BhckSZNQNsMlb8rWXBSCs62tKvlvxAY/5BA32MF2TX8kGwCFIlNNe?=
 =?us-ascii?Q?+ozWKDWhsNEHRj2LUUC5TiBF19AVBX8AWzBRgmrHAJWROh2hEF16pSwVnZvb?=
 =?us-ascii?Q?dEu8hXbCDPcLX0vUVKuELctMWF8DlYwrLxIvIVMjVu0WShYw2vdMQy+WjRmM?=
 =?us-ascii?Q?3wFqA+L5Tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B81iFw7ORrQMurrF4t9CUb7bS+8n+EvkupBU5CI+VM2aUOBIRbcJP5681VuyK/+vnkZu5n7WQHk0a41wX8MZP/cmxhq8RovriHztrlZ+s7f+B7LctQyhGorrFvJek35NeMyJWdFDcwCGl7lBMac4szDSvNdrbKX5AxtYS0Ts4pQWFTlyNIKPNPGiFlQQYl7TsR91A5NYU6g9P4YRZ7G6yaQJwYow6s6FbiQVkOuJA9R0q7ARVKNe5iNxZm3+s55W5skR7K++34aJ5N0Ej9u5BXFUMECoP1Qit5YcYO6KqZmwCKu7l8Y3Jr3A0+6m1RjYnrztsbiZBRDDV5XXpHgeYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF1611BC49E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f32c74-feee-4c75-52ae-08de9076d758
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 05:15:22.6143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQquR4mEpWzRNnX8LC0a/yntT1+324EfovroH327YpGsbDHyZj7ThXyFyh9uy7nS/xYCVMtW+WQqlqbjD1Iz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9183
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

> Subject: [PATCH i-g-t 2/7] tests/intel/kms_mst_helper: Add helper to chec=
k
> for MST outputs
>=20
> Add igt_display_has_mst_output() to check if a display has at least one D=
P
> MST output connected. This is useful for tests that need to verify MST ou=
tput
> availability before running.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_mst_helper.c | 19 +++++++++++++++++++
> tests/intel/kms_mst_helper.h |  1 +
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> index 38859cffc..1918c8d10 100644
> --- a/tests/intel/kms_mst_helper.c
> +++ b/tests/intel/kms_mst_helper.c
> @@ -47,3 +47,22 @@ int igt_find_all_mst_output_in_topology(int drm_fd,
> igt_display_t *display,
>  	}
>  	return 0;
>  }
> +
> +/**
> + * igt_display_has_mst_output:
> + * @display: pointer to #igt_display_t structure
> + *
> + * Check if a display has at least one DP MST output connected.
> + *

Check my previous condition when it comes to the documentation

Otherwise
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> + * Returns: true if MST output is found, false otherwise  */ bool
> +igt_display_has_mst_output(igt_display_t *display) {
> +	igt_output_t *output;
> +
> +	for_each_connected_output(display, output) {
> +		if (igt_check_output_is_dp_mst(output))
> +			return true;
> +	}
> +	return false;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> index 7391494ab..0e8ece0a0 100644
> --- a/tests/intel/kms_mst_helper.h
> +++ b/tests/intel/kms_mst_helper.h
> @@ -12,4 +12,5 @@ int igt_find_all_mst_output_in_topology(int drm_fd,
> igt_display_t *display,
>  					igt_output_t *output,
>  					igt_output_t *mst_outputs[],
>  					int *num_mst_outputs);
> +bool igt_display_has_mst_output(igt_display_t *display);
>  #endif
> --
> 2.25.1

