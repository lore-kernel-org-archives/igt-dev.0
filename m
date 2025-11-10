Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26F4CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 18:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863BE10E2E1;
	Mon, 10 Nov 2025 18:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gncb//XG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8A910E2E1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762799412; x=1794335412;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DLIaa9cAsvyzK2XQZ1qV2lfV7ixoKqYqdscA0PwtJVY=;
 b=gncb//XGwGuHYSUrPvXd1SuTM5QK13f1RB1QEWPArQTXnNhSBEvFlqaf
 0FHcK8hN44Xla847uxGrAOmReMrf5CwCIm6sR3qrf0TtrcBaaI4a/wsGq
 oE7ZE6WW8UuldTdslBK0I9xBw+K5glmk05trSEwnA1ao2SXpTyjUxdN1C
 mgdlrlSfavD3Fgf6fZSH2mqihrlFuLEf0hUA9jrt6hZgufaOrRiIwSPNK
 7vi1pJUN9/QdYiHTeJvtNGhzB7yvSS7PiIhFwWd4Rv1nn7Zh9zyVWXZDX
 jN7aQjqSgSwx8blIV6mEMMn/R8LZk4OqlHDVR9pGWWWrETuZefCrppqYq g==;
X-CSE-ConnectionGUID: Wxz758bORr+dTGDcbW4zXA==
X-CSE-MsgGUID: Q5ZwFUrzT32WkfRxHIRc3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64890400"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64890400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:30:11 -0800
X-CSE-ConnectionGUID: DuCGZF0mSkeeuO2bIWYLPA==
X-CSE-MsgGUID: gZfMAr1EQniIjMcTVJIvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="219456716"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:30:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:30:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 10:30:10 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:30:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e92wakZrWBLcURh7es54vMvC6x45sfALmyBOtlEdxNp2Ad8hUUVaaTzOwyxo//XVUfSUxj/QBYSxVrLvUFHph1LbAuYnhU+UGD/C/6zLt6jc0vW3kwiq0+lR6D79Av0FArKX4xDdplDKJIxOHqlE2emlWAyVUXjGlx4JaqLtIbDsMdaMpZHhzs8hHhLdu8vQLTIMveujFwG4fVZ/IDPQ4WYhKJ5e7KsjKauVzH0JVYX3wQGCnjNEochbEL7P6NO8SzxThMYnQjrCiimm5enfCPxmqqylbMpFHL8F1vq1tx4YEgA5m4/2MCVBhIJmyuT9nRjKGUavi2b/fGvm9WP5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92CIdoRFRIYmU0WzKLS0+dVJq+m+ASmIjQGpaep12D8=;
 b=Mv3YnVm108hoYtwWGFjMxmw3DCjVeFqCdZt2Ir3c9IvWNWHNpqk25t2tAtQmkQksGJyixXZ7/uNbSrIIz0X0Ux0lZrDXvCRymXkLDMMGA4RNEo41XS15D9E3TZWrIPh5YizUNULPchLJmYwHj17qJBQG3NRnmrW/QqJP7mhy4/nJPx+SHke+pZodTc97LhhVK7WbFs1nmEZzkvTmmBtVBPQHzGvxp4tb2o3ckF07j+YikEp4BYUR6ce6PAKYQtoqH+7qvSO1v+PWlLN04BTVmxa7xe8GvjqKlwKjHUlv6PUsWrO0AQVJyLdxK0c9SlYc+aW+JOQCs/FJ+/1M+e5Scg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 18:30:07 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 18:30:07 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 04/18] tests/xe_exec_multi_queue: Validate exec submissions
Thread-Topic: [PATCH 04/18] tests/xe_exec_multi_queue: Validate exec
 submissions
Thread-Index: AQHcSpVEObM4IhcCEUWd3gbU+5n8UrTsRjSw
Date: Mon, 10 Nov 2025 18:30:07 +0000
Message-ID: <BL3PR11MB5747BC427D0369D4E078B285D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-5-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|SJ0PR11MB6672:EE_
x-ms-office365-filtering-correlation-id: e972b875-47f8-4353-7ff2-08de20872cbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?z0/0DpKvXLn+W7VMZC57MfehbEj3vle5i4FSKwSq+Tl2FLciwyIeuB6enPCs?=
 =?us-ascii?Q?HMuk1WcJkpvoLsjg3AOPPjwvEXB/CIHvTVDyfZBaI2OQpRo6Uok9Ns/L7LCx?=
 =?us-ascii?Q?FprurlOe8NOU+3FqHHF8C+/FmEhXjir3EmAuVaVUvLSIiMTi+JSTqmDCU8bN?=
 =?us-ascii?Q?XswsdhshmVAmAVrSwiD11nAvpNldxnAd3dGOzfKOL5aKZZE+ddax0iNriHae?=
 =?us-ascii?Q?VO+GjLCh4u0zzYvZ3oo12B3Op4koqgxw2J6qITXSGnPyhRWj7mo30PcEEnoe?=
 =?us-ascii?Q?Za87whIXjlU7q0QrsCpmzfdar0lB+aCZb/yPR7eQErHxigNN/lFf1hKRXmQP?=
 =?us-ascii?Q?cUb/Kid5IW30+lK1y0PJ/pplkeCGPX0Oo9R0+UkZ8q/IqEhWV7s+Ll6zilM1?=
 =?us-ascii?Q?OPUbtUrmB9g2BnN4Y638lp1HCvaQjS/xK18ZA30fJx8NAC3S3jyvHZDI2/WW?=
 =?us-ascii?Q?PvTiXXoXeP+QDYYkERXGYg7atU3DXNtQM2lrmNoyDyHoaNaQussdFkDmZ4sW?=
 =?us-ascii?Q?LnNvUoc+tis+UBWJcUEYVaIBmFeEBekV9gK8r+vSR9hhIHF7A68mStV4B9bG?=
 =?us-ascii?Q?G0ouwstTNPQbj9BSQdWGWLiD6PQCyPfBYmzWinadRXdqhmty1pwd0ItYz2Ei?=
 =?us-ascii?Q?PTJ0xPak4wTD78BcGjfC/HkAWlaXJjao8vsCgtA5liAHQPsdvT63TG77tVQg?=
 =?us-ascii?Q?X91TMxv2Xogk/LvJ8Sx5uxkL8uS7EeFz5ek2pHFgc3aN1h6hy8pdlHtVid04?=
 =?us-ascii?Q?OzpRCUgy+mQbFsRw3O85FYKtD3p5aV4g/trr43wU+z94CHM7gRlz0a+be3t3?=
 =?us-ascii?Q?28XoABOPHSPx+POSk+Fof+28Onuo1dPQC2HH4EiJQaOdqZaiqptCHLqPgycR?=
 =?us-ascii?Q?I++BprIQbfxaO4v0+igqTUqdZ+akHlg1lJKlPA4I9WTE1wfwDi+4uoqMoOiy?=
 =?us-ascii?Q?Sx/zxMLv0YZV4VTjOvuEo+qnWzA1zU0UlRyvX/ee1c+nFXKODfQ4fH6N3AOf?=
 =?us-ascii?Q?CvbtUzDYNxpnOXvX4THkIKtwekzn11a+sO+DpQjIYPsnZ7zckDbzcqRYinu5?=
 =?us-ascii?Q?MXFl8lxxv/SP7YQNCjeke3bM0LiL40NUAcm9ZgbA8yAtOV66UHxEiJvUfaiO?=
 =?us-ascii?Q?qt4YLm758oOpBqUef0VvwTUa1XBS74+ama8+c69N4RC0VGFw+8lf2GLxDd63?=
 =?us-ascii?Q?eWK23KmQPB24yKwWorErscYJ01bumzkFhhjsq5VYmOjUKlYj86vsp0/K+W4i?=
 =?us-ascii?Q?gFsWpXndrPyo58TlTjKpG5QlP6PQdq0nhkHz9HDGuZpgGldWwR+qr+xvOJwC?=
 =?us-ascii?Q?//j+2/uhVodqaqcsyNekQu9kJVQdJhLoDNPL1sBx46iAdRhYVXH9G4tCqEzU?=
 =?us-ascii?Q?v4APAnGY8ohGGJ3Gezv1m5Ap+ebtZah329G73eMFM0Kh8jo2TAjOjMnXEfGz?=
 =?us-ascii?Q?LpZj4MM61V0gBQiVvpZhXo06mybbWAMYBdaNdnXuBvjaCKYUxKbfgZAoqeQ/?=
 =?us-ascii?Q?akOXR2VbMFdwWnFc77oTuTFKoaidBcw/jlQf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DfpgblaeNie0cZwUJru3fHoe9AKzjx7M/TdsJTj0eHIITEpYnZClx7EtDFZX?=
 =?us-ascii?Q?mAxCf4l8EY6KS18UHAVxOUutE1FOD9VEzxqrnE9X4COBs8Bg8+IZdEPTMt60?=
 =?us-ascii?Q?c2aO1TZ4CQHa995o3hXHunYPEYt6GznhuknbJfbNhlET2u5svVTPvFjkRLPK?=
 =?us-ascii?Q?GVuAgK6oUYRl7L0NqA9vG6FOJkZHSDgHwEtN7yNFw9g8Cz9Fnta0StPTETOr?=
 =?us-ascii?Q?mCprFI6pOISMtwBWFsc6SlPBM/n4VtYoFBWnACzj1XV6QDWTR0+VPDhhkFhb?=
 =?us-ascii?Q?NuL6Z1IgPxgEUuQnCgDlz9FUb9vU/J8pFeH6pEKj3yfW9+QT+RDMrY8n+550?=
 =?us-ascii?Q?6guCyU1+nYsJVECVyuPlBg+ndaANcxNqo2UduxO4sXANwzma5j0GBlB6wkJn?=
 =?us-ascii?Q?bcZi7nxXXDsmgFMk1dO2F9aWpxU8GlXXpaJN5gdFmU6VRKVGrSuyTzYEv+8+?=
 =?us-ascii?Q?61xs+/m9zGPzH2nzm1K0HOHYeX08rlrQivx8Qq/f+Xsi9aTKidJ6lES1m40N?=
 =?us-ascii?Q?RhayaIYEsT4JIj/MQCcWq3Bj/VkmFfTgDrCRiIobBpGhKuzHLWgFLSLVBphX?=
 =?us-ascii?Q?dnTW/cqIUTjfARH6UEGLwC8ERz6uKOTBaxaUOEbOU04Zs5/iX60HpARIwvDa?=
 =?us-ascii?Q?8OVpKmYuM3LItvkTxEZK9cwy3OhJmDaeNkMEFLP5JWYYRAoYkIJFPU2SNYLH?=
 =?us-ascii?Q?mFj6szHFuVJvmYcq+Nb6qIGAQsLDlhO22jnxRAHLjYv096b2PkRnpSYwqMdN?=
 =?us-ascii?Q?bZkkVUabnDvbVjoFM+PNUlc4OfTisrwA8OT7u6/xRALXfcbiFY2E966zqlz7?=
 =?us-ascii?Q?fx0855xOUjY8iAWBvMh16Fx9/YYZnzxKj8xELpAyqKn5XN92tzae49SZxtda?=
 =?us-ascii?Q?P/wuL2VVU9Kge92jmJf/9IHxhPHRyAje/rYPp+YanlC0z+rP5nAhE/z6QqZ7?=
 =?us-ascii?Q?VQZ24WqLYrY0ovcurqL/rf+syWIpUAXziuyENkvII9xHziUAvWjChGHYBHap?=
 =?us-ascii?Q?uZmANkKXjIF5XPyFUDATAhYi7icluyyEqZk/FiswAsUkS4F8Aoa/RYbrBxdc?=
 =?us-ascii?Q?Sf+CXnyq5VMcTcxauNGgB8EBbqwjdsiPvfXWO3euGeubcAUdMNEmAVq+ig1X?=
 =?us-ascii?Q?ttWlmOUwtKj/bohhyyDruDrEM7SQGIxUFfk3S+mzfURuEIKgMKWVBNiRMapA?=
 =?us-ascii?Q?6vLxeFx0WgF6R/fAo3l7iKUVWqyAPJ/RqatugC9S9X7PBqP4K1oci7MXwlh3?=
 =?us-ascii?Q?4UDH3Inpw2p4ozklkGO8zzSh28u3YWBFotsHOQAUV9q1yzVxtoQmMskDKunk?=
 =?us-ascii?Q?ykAVbrm3h9xtR9/iCnL5fMscyoqZqMvSkcQtFRHhrUidSF/bHWUdzRfx2G2d?=
 =?us-ascii?Q?FyQ4LhCkoyee4hZVW41Ev/vWRBV6RgTU+bp3jSc/71xaPU1In/9wzyXiIUdO?=
 =?us-ascii?Q?52QtAUad5Nr7t9YVo/Slttz+NSZc5LTr0pkrmIGpm2I/p4aH3M+7ugFxmjc5?=
 =?us-ascii?Q?+uVjJ1yzLbgfujISGD5PefByE/0Zy4SQYnk9lFCC/UnCI7y/Y+3Zf4/GG0Gp?=
 =?us-ascii?Q?KDfTSVsQYLczXhCUV4sPhEjwoM8uH5DNwZ4yzLO2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e972b875-47f8-4353-7ff2-08de20872cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 18:30:07.6369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GIQHgUQ2OgsOpBaah71U8u/WFJuz5VLMn3tC2z7xpqnxCSWhAz5bWFJd8OLgWb4+x/KztLkMPRY2jdZvUquE5jkj79x0GW+eNJnX58+sMbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6672
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

Hi Niranjana,

Please find my comments below,

>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranja=
na
>Vishwanathapura
>Sent: Saturday, November 1, 2025 12:06 AM
>To: igt-dev@lists.freedesktop.org
>Subject: [PATCH 04/18] tests/xe_exec_multi_queue: Validate exec submission=
s
>
>Validate multi queue feature with different queue group size and with exec=
buf
>submissions.
>
>Signed-off-by: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 197
>++++++++++++++++++++++++++++++
> 1 file changed, 197 insertions(+)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c
>b/tests/intel/xe_exec_multi_queue.c
>index 03b920dc8..de2aae8f2 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -13,12 +13,15 @@
>
> #include "igt.h"
> #include "xe_drm.h"
>+#include "lib/igt_syncobj.h"
>
> #include "xe/xe_ioctl.h"
> #include "xe/xe_query.h"
>
> #define MAX_N_EXEC_QUEUES	64
>
>+#define USERPTR			(0x1 << 0)
>+
> #define MAX_INSTANCE 9
>
> #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>@@ -144,8 +147,175 @@ test_sanity(int fd, int gt, int class)
> 	__test_sanity(fd, gt, class);
> }
>
>+static void
>+test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int
>num_placement,
>+		 int n_exec_queues, int n_execs, unsigned int flags) {
>+	struct drm_xe_sync sync[2] =3D {
>+		{ .flags =3D DRM_XE_SYNC_TYPE_SYNCOBJ |
>DRM_XE_SYNC_FLAG_SIGNAL, },
>+		{ .flags =3D DRM_XE_SYNC_TYPE_SYNCOBJ |
>DRM_XE_SYNC_FLAG_SIGNAL, },
>+	};
>+
>+	struct drm_xe_exec exec =3D {
>+		.num_batch_buffer =3D 1,
>+		.num_syncs =3D 2,
>+		.syncs =3D to_user_pointer(sync),
>+	};
>+	uint32_t vm;
>+	uint64_t addr =3D 0x1a0000;
>+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>+	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>+	uint32_t bind_syncobj;
>+	size_t bo_size;
>+	uint32_t bo =3D 0;
>+	struct {
>+		uint32_t batch[16];
>+		uint64_t pad;
>+		uint32_t data;
>+	} *data;
>+	int i, b;
>+
>+	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
>+	vm =3D xe_vm_create(fd, 0, 0);
>+	bo_size =3D xe_bb_size(fd, sizeof(*data) * n_execs);
>+
>+	if (flags & USERPTR) {
>+		data =3D aligned_alloc(xe_get_default_alignment(fd), bo_size);
>+		igt_assert(data);
>+
>+		memset(data, 0, bo_size);
>+	} else {
>+		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>eci[0].gt_id),
>+
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+		data =3D xe_bo_map(fd, bo, bo_size);
>+	}
>+
>+	for (i =3D 0; i < n_exec_queues; i++) {
>+		struct drm_xe_ext_set_property multi_queue =3D {
>+			.base.name =3D
>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+			.property =3D
>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+		};
>+		uint64_t ext =3D to_user_pointer(&multi_queue);
>+
>+		multi_queue.value =3D i ? exec_queues[0] :
>DRM_XE_MULTI_GROUP_CREATE;
>+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
>num_placement, eci,
>+						     ext, &exec_queues[i]), 0);
>+
>+		syncobjs[i] =3D syncobj_create(fd, 0);
>+	};
>+
>+	bind_syncobj =3D syncobj_create(fd, 0);
>+	sync[0].handle =3D bind_syncobj;
>+	if (bo)
>+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>+	else
>+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data),
>+					 addr, bo_size, sync, 1);
>+
>+	for (i =3D 0; i < n_execs; i++) {
>+		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
>+		uint64_t batch_addr =3D addr + batch_offset;
>+		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
>+		uint64_t sdi_addr =3D addr + sdi_offset;
>+		int e =3D i % n_exec_queues;
>+
>+		b =3D 0;
>+		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>+		data[i].batch[b++] =3D sdi_addr;
>+		data[i].batch[b++] =3D sdi_addr >> 32;
>+		data[i].batch[b++] =3D 0xc0ffee;
>+		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
>+		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
Batch buffer construction logic can be extracted into a helper function tha=
t can be reused across different test scenarios
>+
>+		sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
>+		sync[0].handle =3D bind_syncobj;
>+		sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>+		sync[1].handle =3D syncobjs[e];
>+
>+		exec.exec_queue_id =3D exec_queues[e];
>+		exec.address =3D batch_addr;
>+		if (e !=3D i)
>+			syncobj_reset(fd, &syncobjs[e], 1);
>+
>+		xe_exec(fd, &exec);
>+	}
>+
>+	for (i =3D 0; i < n_exec_queues && i < n_execs; i++)
>+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>NULL));
>+
>+	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
>+	sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>+	syncobj_reset(fd, &sync[0].handle, 1);
>+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1,	INT64_MAX, 0,
>NULL));
>+
>+	for (i =3D 0; i < n_execs; i++)
>+		igt_assert_eq(data[i].data, 0xc0ffee);
>+
>+	for (i =3D 0; i < n_exec_queues; i++) {
>+		syncobj_destroy(fd, syncobjs[i]);
>+		xe_exec_queue_destroy(fd, exec_queues[i]);
>+	}
>+
>+	if (bo) {
>+		munmap(data, bo_size);
>+		gem_close(fd, bo);
>+	} else {
>+		free(data);
>+	}
>+
>+	syncobj_destroy(fd, bind_syncobj);
>+	xe_vm_destroy(fd, vm);
>+}
>+
>+/**
>+ * SUBTEST: one-queue-%s
>+ * Description: Run %arg[1] test with one exec queue
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: two-queues-%s
>+ * Description: Run %arg[1] test with two exec queues
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: many-queues-%s
>+ * Description: Run %arg[1] test with many exec queues
>+ * Test category: stress test
>+ *
>+ * SUBTEST: max-queues-%s
>+ * Description: Run %arg[1] test with max exec queues
>+ * Test category: stress test
>+ *
>+ * SUBTEST: many-execs-%s
>+ * Description: Run %arg[1] test with many exec submissions per exec
>+queue
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: few-execs-%s
>+ * Description: Run %arg[1] test with exec submissions only on few exec
>+queues
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @basic:					basic
>+ * @userptr:					userptr
>+ */
>+static void
>+test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
>num_placement,
>+	  int n_exec_queues, int n_execs, unsigned int flags) {
>+	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
>+flags); }
>+
> igt_main
> {
>+	struct drm_xe_engine_class_instance *hwe;
>+	const struct section {
>+		const char *name;
>+		unsigned int flags;
>+	} sections[] =3D {
>+		{ "basic", 0 },
>+		{ "userptr", USERPTR },
>+		{ NULL },
>+	};
> 	int fd, gt, class;
>
> 	igt_fixture {
>@@ -158,6 +328,33 @@ igt_main
> 			xe_for_each_multi_queue_engine_class(class)
> 				test_sanity(fd, gt, class);
>
>+	for (const struct section *s =3D sections; s->name; s++) {
>+		igt_subtest_f("one-queue-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 1, 1, s->flags);
>+
>+		igt_subtest_f("two-queues-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 2, 2, s->flags);
>+
>+		igt_subtest_f("many-queues-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 16, 16, s->flags);
>+
>+		igt_subtest_f("max-queues-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, MAX_N_EXEC_QUEUES,
>+					  MAX_N_EXEC_QUEUES, s->flags);
>+
>+		igt_subtest_f("many-execs-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 16, 64, s->flags);
>+
>+		igt_subtest_f("few-execs-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 16, 8, s->flags);
>+	}
>+
Not sure if this is worth changing, but I noticed the test definitions are =
quite repetitive,=20
May be tests can be configured more structured something like=20
struct test_config {
    const char *name;
    unsigned int flags;
    int n_queues;
    int n_execs;
};
This would allow looping through test configurations in minimal lines of co=
de instead of the current repetitive subtest definitions.
What's your opinion ?

Rest of the code looks good to me.=20

-----
Sai Gowtham Ch
> 	igt_fixture
> 		drm_close_driver(fd);
> }
>--
>2.43.0

