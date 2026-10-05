Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8252CA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 17:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DA110E3CC;
	Mon,  5 Oct 2026 17:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJJiMewp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C4510E36C
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 16:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791219588; x=1822755588;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YUwub8wYcmdRm9dPCD+nBSko6EWaUejqvYCL09bFGpA=;
 b=EJJiMewp+vD84yCyi/7u924N59hpfWJgQlchkWZBSs6accr6Uy6y3kJI
 6SGBxmxGAyly9uIY822osynqfZtkRSkwKR/Z67sptVo4qwFo0N+nIxrpm
 9TKjFB6jzMZFebX7zmpuw1qlt4FU7aARvQ4PynppaXBS71VhAM8dS0XYB
 VJ3oQ9q5e3XjuGlAOkGqMroQ8pbjyA5vheQUvHlzGUFXiwmAHJJbgp/vb
 8kkBfdzg1/Q7pHu0NNmPthSJEOFTFxTtWkQ5f5kKO0lXyOtbOJD0gVlkY
 7RUhUOp0i8CjyvdaA+ASGAg2m2Q4cgIZAchHqE42/ZeCtw76CHQliulap Q==;
X-CSE-ConnectionGUID: WkRA6TEWQsuRcaIWsiGKCg==
X-CSE-MsgGUID: 8yB4clbLQsGgXjEah57Hgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91920536"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="91920536"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 09:59:47 -0700
X-CSE-ConnectionGUID: Vv5ilfFsSmykWz9Xc2oGCA==
X-CSE-MsgGUID: 2qLDHjE1QL29+QAd2Pc5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="890679"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 09:59:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 09:59:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 09:59:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 09:59:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCNSSglSEkCuv2s/Bvy4P4na+4SKNOUreRB97oOBxY2ZtU4Wd+w8ULFMbsoYLa2HVAMC9NCWRgVHP0+QxbKjKTSSDbHJF4Fumg0F3AoguGfuNFiDDyML7hAgLM3sN/GjVBOwrR6MQ1EIn2sawO8ThORhD/9I/pwJhergqVTuPNsmxLT7MChIJoYGN/z++XyXpJJbcBPk8WDkliKHXnaQQGuHwQ8wpUrzneEFUilHDLDB5wabB/GqIlgAYuScx4QXDV2wh5Vb6AKYVBZvzPx4ISP2x0onNBJMp5+6d0D0fAR6DIbvAjjNnD0gnxUrAmS+//dHz1MMan0u9atdaivBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB5DGyU7aWRSiPPoKjuQ6wtQD9laEq81nTO3U/cWt9w=;
 b=CoN+CmfvD9r773xWdGcxE+iOCMv394eAR8ZtFTdpzwBTRYhj6wnsuHIr7cGcAqbwipeXefjY0qYl5jMi9njZoFFNqhTQwOFppB3wMINLO9WvtfONoVqwbS6EjlPFGCRHQ5MXT5YMRTyjbcLDFiDChyzTQsJPNa+fM1rsp1th4zSNX2jeZAiTEV2l1I3YB+tahYBgRHtU+TxKLKX+427BSkIevCf2DKrIkN1ui4prDG+s5JT8Rw0WOiMk5eFCYRNRfucYiyzVAdetaEjSDxQ4qDhqzNnin9CECd0N9XolSWjRzXvnwugjzs57o4G1bvjTBZYXHfOp64QuulfoIwoDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by DS0PR11MB8052.namprd11.prod.outlook.com (2603:10b6:8:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Mon, 5 Oct
 2026 16:59:41 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:59:39 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 1/5] tests/intel/kms_alpm: add ALPM test structure
Thread-Topic: [PATCH i-g-t v1 1/5] tests/intel/kms_alpm: add ALPM test
 structure
Thread-Index: AQHdT/GrgMu0dsz8eEGco55NKQYGlbbvNQ2g
Date: Mon, 5 Oct 2026 16:59:39 +0000
Message-ID: <MW4PR11MB5776337C751E3DFE2F35012FDA962@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
 <20260929090454.2796967-2-sowmiya.s@intel.com>
In-Reply-To: <20260929090454.2796967-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|DS0PR11MB8052:EE_
x-ms-office365-filtering-correlation-id: 890f7b5b-c859-4526-3c22-08df23020b68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|5023799004|11063799006|56012099006|10067099003|4143699003|38070700021|6133799003|3023799007;
x-microsoft-antispam-message-info: 4EHhrlL2Qq7+bnQoVkyUG4RNRpUR+vRutE7IhFcoiSz/CLfchMJhrVKg64jOCxlC0hJXLAzEd80ltopMcuK/EaOMbrYdjgwBwa3tq2zcx1XW+lYD9aA/E5p81B0B2LUTtJ7Yhbvm3Yetyk5EoOEHsbOPSLDukEqa1bFbVi5lxQPLOb2R2Q92gEygWhej8oo99MqEqY/dJrkwcWKA146IW7rYuG0zmwjDWhCm/82VHERgXcEHiv9pbbyOkvdQw6q6BcI9ue9zJQY02NY+nXQ170D9xUfhXjW6FMu7TIeGdDQMbK/kQGOD2rTI+/BZRkkk/ajCW5THOx8pJVuKNA2yyy5GEmhANmqUhfxdMtGZDZqWWsAw1ymPMAf4+Egs0epi2xVw60nb8RmUbCXWpJfBN2bPOpbtqEzDLPhG9q9XOPsZ6P1YuaK5RHJs9m+/+dCwbnKus9nGDHrmHEuJXB8Q22hwfp9uG4ZlRNrrGE8M2klNRH2zUY4nf1tG12ryKcvbj5CQcyg0Wb6mKRlAScru9v5z9FQYwK4ZpQxyZqusj4Ap8sdWQ5U4cZfdy49xVpAU+bN9Tu2yusCv3FLI9ejepsv7Q65JL1n2R/6r0JQ3Bi3O2sul9BvxRXySyX1rI2JMirhyJHr1Vq63TxLZAg61XIbkzc+gV4LWMHhqzUI/8+ZxcoYLe6IOTAiH6sEySdUWYI39ogDWbI1p3XqYtwS4+1hynONlcm9H1OuBG21VvT8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(38070700021)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HJZSn4s+2Ps6iapBajjYtcv1mIXMBcO1kqNH5p/NEUmStGbzQHp7kqJ4xM?=
 =?iso-8859-1?Q?z+E38ETiFbbmACuarq2tp3pwCrGOX66vyNY63vwlCJAtNXl0lc9OwfsLla?=
 =?iso-8859-1?Q?vOx3TrXU9bYWGsY7v1M8itOIpt5Yy9YSzZN/I0FEmdkzlW1WsvOmBVq1R2?=
 =?iso-8859-1?Q?kUgB4683RFAgfL7z6WqMp2/bNksPAl/yAmvy5pwEOjtgyjkCnLN+TBz7sf?=
 =?iso-8859-1?Q?sxSryyu9R4IqScOs0NxUsplFdExjgYfLd0iBWQz/gsgmMc9+oWAJ8UYubS?=
 =?iso-8859-1?Q?AOfz864W1YYSgFawKNLAhJ8WAmq0A1roZGUBW5kLn+MWxIWNL27CyT8xWN?=
 =?iso-8859-1?Q?lREUKl5DwKa5/yAKlP4Uh43p2Exr25wBlb5sLQMyi6uTbXYTjvK3adUiud?=
 =?iso-8859-1?Q?j/XnME26q+R0ThrRe+L0uhGBBBkFlnupopq5cKL6Fy+lr0Dak4YimMmqhC?=
 =?iso-8859-1?Q?4SEOGAgNARJ3CykKENICJqp/jOlBK3tSZff+T/PMCCBM/Qk5ypFjjDEpYM?=
 =?iso-8859-1?Q?DbZttRHjJrdXQuSDfkaWQYaX6y4xfiPA90dF50TIVbgJqqXkpuiN3y+13A?=
 =?iso-8859-1?Q?o/N2fdWJIN3AKosXqEFTIh98RfCIFAjqsqd5Wi2Tz1ToMXR4omkI6bUPcZ?=
 =?iso-8859-1?Q?2rVhBVVZwhICITJWm1xZwkRg1Fv6Uw4OiunVsoRaaFiTtkEPMYdrbQQcMB?=
 =?iso-8859-1?Q?HgOx/Acg7MN3ZJjVgFQKWbeDWULCFR5Rt5aykUU1zi9Tn0iw5DrAdiUB5B?=
 =?iso-8859-1?Q?sDde3CI5pZsRIwagT18zutCaACNbXYGw1fqwAE7/mk7EOkzN7E193NGbxl?=
 =?iso-8859-1?Q?XP6VTsDaHvTmPNXFhHla9zlOluOAMbGWjmE1my0hq1xTHadsQb1Pp5eVGq?=
 =?iso-8859-1?Q?jxcwiVafLwPrgD8eALN+TzX1uUR9t5ip78GSC5UZwIgMXF/EnmD4XWRFYF?=
 =?iso-8859-1?Q?je0lv+8UXc4zCYNc24SChUFyQO/J5qDJ+L9CFCa5TrrFXkRFI1IdQHw/Ii?=
 =?iso-8859-1?Q?MUOfPeQzMbfOXhuhPjEpH6XUU1iQQbP+SlsHEdlbFsZh5Yf3VxmsMA1xe0?=
 =?iso-8859-1?Q?JQ9T9Os56CBP6OecQferYbZGx5/ow8XAltpFku6XtMpCRiQS/ZgLSlLEGT?=
 =?iso-8859-1?Q?Jx4se7rDKbqNLlqAHVhZrdSK4+bpYNcKtAGvtjDR3dWdfn2VlHsxqEzbHt?=
 =?iso-8859-1?Q?0zMJ3MFwP/Bd4vnjD4y7AWslvLTUCt7KyYQsceLCYtzPsQb/eFPY8rz3Jg?=
 =?iso-8859-1?Q?PGSPxA7DGkJk5SZ8mxt69V5afCYhJZ52P6WQLdPnI2LGRiJCneljBCowak?=
 =?iso-8859-1?Q?in7jOqrSD4Pq6DtzVp0WrNeMcEkiaIIT/cKA35E94x5rPFXTjZnW4ohBhu?=
 =?iso-8859-1?Q?uoG0WuEloRe9LK20u+7BvZEdIwJmEhFWpRRNZ14pWMU6LCGCSiwtz2R5Dt?=
 =?iso-8859-1?Q?bXd/++viQ+hfr+veAhBc4hmlO160lzrjjh6EWShvKmKvZnWpOdn7IKos3E?=
 =?iso-8859-1?Q?oK0KGapm1AOVydlCaCvSe44QxZqI2TdWKsTfTdztwc6+am6q4HH3Pa7TpY?=
 =?iso-8859-1?Q?2DAG407lzI92x4vWc8Ce10XBh5Adakpv4XpoqvNX6FV5T185zbnk4PTZH5?=
 =?iso-8859-1?Q?ZVbMBARZ+0NAC1lYAKDbekXXvYh9cZOvaS5m90sLPW5L+ESYbgMO4Fl2tQ?=
 =?iso-8859-1?Q?dHUwUfWjYaAEYSypi5DYdsGZaZOvTy3ROD8giwyBHZ30bWlapGkXtkkwiq?=
 =?iso-8859-1?Q?vBCLlZEKYO1bD2/yQEYS7hI3FBMkVqygI1jRPl4gxciyaJ1aEw15sksYVt?=
 =?iso-8859-1?Q?M6RR5O79bA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IlC/mu74JUYrxWZme0TDSUD19qPx6CRz2BOKyuA1emqs7JVhrSVyFB86KCPXXg4IcOxLgKVfhMb+cQ9+eKWhbTnU+M7BylD0Yxiw0H+zB6VxjRbF1p4zyjKbhhGWIwkOSoUTCUrIqOeV9TqDVKhiHpstIoHQoG0uDdFcdXoYpayWxbKMIN2HqkjwtQoEIkwEtdrM3v3eKcvYmBkrzsAxTPmd3Y0ct9dGSIQGAcw7B193KazQa8evgPhc/5NqEhdUMiewY2S6Gp6YcIV35BCTWL2D7s5SMPiN+hJ/CkKraqdXplkrJX4YOI0EbR/DIhWqvwkItMArq63tljSIpF5Qrg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890f7b5b-c859-4526-3c22-08df23020b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:59:39.7552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bI8XNbchM2/1iVU/z7TAyZAbQ54CElcSbWfdkfxqFcR6Z+581+K+NL6EYZCY0tlJCavl+xW9ohoRev6Fs3uY1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8052
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

Hello Sowmiya,

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, September 29, 2026 2:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 1/5] tests/intel/kms_alpm: add ALPM test structu=
re
>=20
> Add the kms_alpm test scaffolding covering ALPM (Advanced Link Power
> Management) on eDP and DP 2.1 outputs: the shared alpm_status/data_t
> types and the igt_main() fixture that opens the driver, requires an atomi=
c
> display and enumerates outputs.

Could you please squash this into a single patch?
Any lib/ changes can stay in a separate patch.

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Assisted-by: Gnai_Claude:sonnet-5
> ---
>  tests/intel/kms_alpm.c | 96
> ++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |  1 +
>  2 files changed, 97 insertions(+)
>  create mode 100644 tests/intel/kms_alpm.c
>=20
> diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c new file mod=
e
> 100644 index 000000000..8bd71a981
> --- /dev/null
> +++ b/tests/intel/kms_alpm.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms alpm
> + * Category: Display
> + * Description: Test ALPM (Advanced Link Power Management) on eDP and
> DP2.1
> + *              outputs
> + * Driver requirement: i915, xe
> + * Mega feature: Panel Replay
> + */

alpm-lobf only works with Panel Replay off, so "Panel Replay" isn't the rig=
ht
mega feature for it

> +
> +#include <fcntl.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_edid.h"
> +#include "igt_psr.h"
> +#include "igt_sysfs.h"
> +#include "intel_chipset.h"
> +
> +#define ALPM_INFO_FILE		"i915_edp_lobf_info"
> +#define ALPM_INFO_MAX_LEN	512
> +#define ALPM_TIMEOUT_MS		100
> +
> +/*
> + * The kernel gates creation of the ALPM debugfs files on
> + * intel_alpm_source_supported(): external DisplayPort needs display
> +ver 35,
> + * eDP needs display ver 20.
> + */
> +#define ALPM_DP_MIN_DISPLAY_VER		35
> +#define ALPM_EDP_MIN_DISPLAY_VER	20

intel_alpm_source_supported() doesn't exist in drm-tip, please specify if
tests are based against any floated patches which aren't merged yet. (in co=
ver-letter)

Thanks and Regards
Kunal Joshi

> +
> +/**
> + * struct alpm_status - parsed contents of the ALPM info debugfs
> + * @lobf: ALPM_CTL_LOBF_ENABLE is set
> + * @aux_less: ALPM_CTL_ALPM_AUX_LESS_ENABLE is set
> + * @aux_wake: the aux-wake line as printed by the kernel
> + *
> + * The kernel dumps three lines derived from ALPM_CTL. Note that it
> +never
> + * prints ALPM_CTL_ALPM_ENABLE directly, which constrains what can be
> + * asserted; see alpm_is_enabled().
> + *
> + * @aux_wake's meaning is connector-type dependent. Per the HAS, DP
> +only ever
> + * uses AUX-Less ALPM flows - AUX-Wake is not supported by this feature
> +on DP
> + * at all - so on a DP link @aux_wake is just the observed complement
> +of
> + * @aux_less and carries no independent information (confirmed on a
> +NovaLake
> + * DP link: "LOBF disabled, Aux-wake disabled, Aux-less enabled"). eDP
> +is
> + * different: classic PSR2 genuinely runs over AUX-Wake ALPM (distinct
> +from
> + * Panel Replay's AUX-Less), so there @aux_wake is real, independent
> +evidence
> + * that ALPM is up. alpm_is_enabled() branches on connector type for
> +exactly
> + * this reason - never read @aux_wake on its own, go through it (or
> + * alpm_mode_str(), which resolves the mode only once ALPM is known to
> be up).
> + */
> +struct alpm_status {
> +	bool lobf;
> +	bool aux_less;
> +	bool aux_wake;
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	int debugfs_fd;
> +	uint32_t devid;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	struct igt_fb fb;
> +} data_t;
> +
> +int igt_main()
> +{
> +	data_t data =3D {};
> +
> +	igt_fixture() {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE);
> +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> +		data.devid =3D intel_get_drm_devid(data.drm_fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_fixture() {
> +		close(data.debugfs_fd);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build index
> 1ac89bab7..8ad4d096f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -246,6 +246,7 @@ intel_i915_progs =3D [  ]
>=20
>  intel_kms_progs =3D [
> +	'kms_alpm',
>  	'kms_big_fb',
>  	'kms_busy',
>  	'kms_ccs',
> --
> 2.43.0

