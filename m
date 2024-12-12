Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838BDE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 07:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0425310E0FE;
	Thu, 12 Dec 2024 07:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hE1j64lK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E915D10E0FE
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733990347; x=1765526347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N1cGCzu0magQvJ2LK6Mf6Lmzcf0v4fLt4M7q+x02rTE=;
 b=hE1j64lK5l66GsH9vKJ7aDoO//ikPx5TwJsHmC1SPLAjIBvY2vlk5MJb
 KfVxYlSIyGz5WW7pYywOAy2P7f3ux2FjLk+vw+xwaY7fNvuulT48dEpii
 9qeGHNBfIHZcmfkOW7XqFM2vbsFfvwFng0ZvZjAkzYgrtVFE7JjYClrVa
 sCFsuCvzNrBtVFpf7fonp8CTn809Uj04eKu5OnnxTlyFW5ckU3ZNV8pNh
 9pfWjnpjSwNdW68sWmEU1y219AG0ry95Hh5Np+q62DXMBq0RAjfgcyXhE
 6TsxvI7WxtTLUefz95zBYf+t9uSA7DQNqzLLF5H0z4vwgIYDHL9eAjUvb g==;
X-CSE-ConnectionGUID: bplYzgoQSgS7v2oavQ8neA==
X-CSE-MsgGUID: rXuvTKFWQDaxv5c/bGWDhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="56870692"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="56870692"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 23:59:03 -0800
X-CSE-ConnectionGUID: bw59+oQ4RRCpqA8gTpwhFQ==
X-CSE-MsgGUID: yNhCDY88SRqP3EN91yzgBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96041915"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 23:59:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Dec 2024 23:59:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 11 Dec 2024 23:59:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 23:59:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVAZv11sKW4Evu9993yoCxyb3noHwWqmrdfwFi9SWM/36MzKiOqKO5W7nA+AMVCUb/2zulDfKBqcPEiV/U2ip0rnC92wFsKWHmvbqjk+a8YOoRhUDXUBCDrtgBCGzRKHDDzaXO73KeyJ3n4j15ezOI0EU7f2OhklZVHtLLgfRHXS3OmSQinWZFREGUEVSkcPWSQKYqnlmqf1izhDuzNb/qAaIF3mudDG40CFYzhYK/KbBV8VmKxWQIetj59Qz1D0YckNhuH2qUn4kTOW9R54vfSFjDI0THy3cIwU11l6t7x7rhZX8mnfrbOP9M1LOoSO+NVJO9xyAKcjEU54jkOMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtrAlPFWS2ZFgKNt56Nlg/lY9RJj4Rqy+AmF32bMkoc=;
 b=fSdDcg7qRIEg/3BkGwxjiuliW7uYafStIDBhrtxWb4VsAB6HiRGKiv+fN1oKRgwgSxWKArda7qKt0l7HwZJ9xSLBRaZuHFLNAWp0AneWC1J0GE0BLoLczabrj+VTvY6B824G5iQUjXrTo3bWsN06CTHXBFyk38LkMmCZGB4p2qbd4sJYYneUL3mVX89coXjappOUZ2qvzWyqg48MRBVakkAODpqRYyiRlflnJd2n5SFn2syhiJ8Nz/Qasj6RHkBSFbdpOkmX6vNSIM0EEkkoPwOHxQVHmT31DK8ynjjy4DWFfCDMavld0Jo83LYrVPeJTcnQ4rfXmxgZ1A+ADkkVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 07:59:00 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 07:58:59 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v2 1/1] tests/kms_invalid_mode: Add ultrajoiner
 support to adjust_mode_clock_too_high
Thread-Topic: [PATCH i-g-t v2 1/1] tests/kms_invalid_mode: Add ultrajoiner
 support to adjust_mode_clock_too_high
Thread-Index: AQHbTFCZ+3qcBILTv0GaG2HolEOeTrLiPnvA
Date: Thu, 12 Dec 2024 07:58:59 +0000
Message-ID: <PH7PR11MB605316C690DC269C4D398B86E73F2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
 <20241212043903.2255318-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241212043903.2255318-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|BL3PR11MB6508:EE_
x-ms-office365-filtering-correlation-id: 6a5132e1-79fc-4d25-048b-08dd1a82d62e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1N2skw5XpWBexZ0KDVK4s+YIK0+LalX6lBf3nKHoKLfreWFeYUatj2BamS3d?=
 =?us-ascii?Q?QJDZbwAk4KraMyx+XvWuo8W5ZhFbOxp+DaGcKQ2xpIz2Dq9uQqaGUCfM/Iwu?=
 =?us-ascii?Q?cx7M0aRtnZU1T/XR5mBvFinjGH40qj33Flv9vtkXJd1kS17RtIeFnl7S+iNN?=
 =?us-ascii?Q?YuxW+uEXs8CUrQSu7zb2yTVOvjG5O4EsnwSAeSNGgHHnXe2ip6jgmfhkYuWa?=
 =?us-ascii?Q?JIVIS7UDMyULeP1fFJ0N4PkL2n7ZY5OECAitpL7jI0DBtszX65x1lNEVDGQn?=
 =?us-ascii?Q?dIuq8hnBIah3kGl6yIp5h9Ea0L+3Wi+V0rDuvHLibTdI03bYcYyz4iM1zMe5?=
 =?us-ascii?Q?CvcpcGIEiQ/BTWPbdOEnk+cIffSRlV5bn/b/NYh1t2QS0sUuXYw0caJTcJY9?=
 =?us-ascii?Q?+gS1MXNk3q7VLfqF6ZEHIUe9iX5nCBKo+pPpDlHjy8AR9DKVeIZe2fYBDdwH?=
 =?us-ascii?Q?W3XGRIHM4922xO77l6wDDB00f1upQQvYnB0y4GljxGP1T5YTy1nk6rudE8Ul?=
 =?us-ascii?Q?8kItDaaoalA44eoo3NEkTzz5o6M6mO3xtXqyCiw39mu65RvAthGc8BeHwqru?=
 =?us-ascii?Q?6aoGlqFAhMIjE+cTNaTrYGPjtL851sB1+lQ+/zDRiCDvKlAteRJmCI1Jp/T9?=
 =?us-ascii?Q?jHGKo76QqypgCysknrNDFAOo7CBdzqZj5t+OxP2U1y8yeOHWGsp8sn387K4f?=
 =?us-ascii?Q?WM01HMYZLrjOm1gnIC2MLXMebbDYuuHF0xsKyv8HmR+N5+iqjSIMYk75yb4V?=
 =?us-ascii?Q?U4RDv9c6AUidmDEmgyKEfGvrYu41xhivdpxBhu0V1fQjD5/6DqnFC7T51ywN?=
 =?us-ascii?Q?A8i5p4VYb4Ki3PcR3Vq1opFu+Ol/c4RpuE3Il3RdEiM3xqo6JxMXc6Ugl54a?=
 =?us-ascii?Q?BmRevoTEaRUUyiX5CEe4nty6o0iXQY4UTifW9VAbl8kmnTnlNkfMNNa64QW1?=
 =?us-ascii?Q?DFdOFDhGbG79tIyTf4JW04O23R4rxJK1GrB7hbBqzDHn3OCKB388sXvu3t+6?=
 =?us-ascii?Q?Q7H/Yfw6n3bkFMAsGuzmuD/X4+PYZJRgJjnZ+fN26hPeaqmobRqJkJjh9rX1?=
 =?us-ascii?Q?3gJtRHPtTxqg3lLYwsHn1H2RQM/N83xa6X38htvOd8veOv+305vKLMKgDnXZ?=
 =?us-ascii?Q?kR+54wQ2UWiF/T8YQYEzxlolHESi+WqOAuVuNfYZRjo8MFg3QuRo5kf08cnd?=
 =?us-ascii?Q?Xxtj4YZaEf4buI10YNpktIXK4REbQuV68tEZUgpE4EHjPWSdKckyEfje1E/A?=
 =?us-ascii?Q?mGAc7K3UaQRJe3OdEwCyXc9wdrRT6moysLTU6g/JL5S2euduGqgOB6n1pmvo?=
 =?us-ascii?Q?MxAWNvBAeG2/vHlv7o+G8+qA9oMhFRlhiIV57iIzd73b829p7/23y44/Mhwb?=
 =?us-ascii?Q?5TRL/8uBZ+1o1cAQQ6BJiLHL5cTScwAVVeTlv9i2blxDw4aGeg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/I6/DSHN+Del53aAOXii/KV6jppuHyKWdGAtv+jdz4e2140I2aaS/2Y56k1c?=
 =?us-ascii?Q?dIFvDgb2qJXD4AcDnaWnMg+4tKUDo9laNQlBVbrg4M4OZiAWl+w4PEcTAZFu?=
 =?us-ascii?Q?IykcXir4NWwvyHG2ya7b1s2TkQvXlVTpNOWKe9vXof+kaxHmGnMC1NMXHcK0?=
 =?us-ascii?Q?v0Rng91tdrd/OtNPVw23e02M31tq1CttHNoFfZk2hibWgSTPOe+rGlTVIzwr?=
 =?us-ascii?Q?ns1tEx0cSZafWTeKgHhlpbPe+CnA9gYMYVjJ7lW5NqTmDG44q1hXzSaTgo3R?=
 =?us-ascii?Q?SU30TMns7qiqLyrV3wBOkXEUiK1HVuQSGFj5yYki060Ec3uMkegYHnDF+1rI?=
 =?us-ascii?Q?sA+YydsMusrIEObOMal8C7rgq0MnBhZVJpM2dqqhhDoShMzDQl+JsAoeLvCJ?=
 =?us-ascii?Q?rCbPzNeVt6kJN9jfGGJ4M2qg+YsRWlAynyypxg5/C015C555QxAOXRq0ahcL?=
 =?us-ascii?Q?c39/fzLSEg2T6cfiFfcuPEn7Ybtm3dAHTCIhKGbUDT/C3fwoHasp0vCIBWmd?=
 =?us-ascii?Q?UNfa4ik9z3X7U1hdlvoHh4orLMqdzLVYuuFbUoCwdrqCoD5IQqgjXESQTDeI?=
 =?us-ascii?Q?CtJlZ0z/Doc+dz7gjx+fQEy+Ok81wLqbh+EUZUfZX5VI6ZVLFC0uSYSLsLPE?=
 =?us-ascii?Q?ZJ0Hr7GzEu774b1HZe3JMgwxcfEdq5csNnoS222y/LjwvWSZsvMO2WowWFwA?=
 =?us-ascii?Q?xgnnpePGs0S45Wa7m3Z4rDwIut1AeIpEM/+GGyMZ0SpcrjKx6z9JWGl1r2Zi?=
 =?us-ascii?Q?JdN10bSkpouYwLQAXbsMyPZ9h7pOXA+Sf/TLgES7QikwOSh/k6qkaSj/SvI6?=
 =?us-ascii?Q?+U/eHnROnVJfMGtDE7X4PKGvdi33mD147nwmAzjYgGi3TEOT1AYuj9D4a0ND?=
 =?us-ascii?Q?iXBZLZ31J0K+YeoDQIGvgbSm99QL0ldzXoiDN8853tmrGNDDmkKvEHJQdSQf?=
 =?us-ascii?Q?eDFGVzbZcOFdV9DkkeqJCzBvF69ErgMMs18t/9Iuq27FjwKt7hFElvOtvoUR?=
 =?us-ascii?Q?myRvGnghCu8IXxFkggH3jnp1H0uZRQpQBHzdpagkWPoy4tBClWHmZsNfsfLI?=
 =?us-ascii?Q?ieG/9zoh0RCQdfY46I5/i28PEt6t3Sh7w9qatLYx4PywB+fchR/Vs2X7E7J0?=
 =?us-ascii?Q?rDYc7dcp4kC4d7HPKjr0t8gDNf1ZKrHHmEye1nnhe3CbIcxPTemY4iGbjCnz?=
 =?us-ascii?Q?Me3nm5UT8KMh3UJ4WH8q6GdXpX3J0kmQ4LoLYH+g9voM5z3t4LDnetNQ3/Un?=
 =?us-ascii?Q?I/zyC6UFIxFsFU0ysySV05EWT/NvvUXd6MgkzTM6PaSnkjfqjpTEZ7IE54uh?=
 =?us-ascii?Q?0VkuMGKjwsgB2JT2ux7pADraqof5WAHeJHWV1HTBYzux++hIWV3qDeUkOxtt?=
 =?us-ascii?Q?tNZWHDF37bms9OnhqRD3eTjvk/p6NlL+5LQHYQ1up4hiCy5A9CFVN2sN30cD?=
 =?us-ascii?Q?XOrvwWhjF0agSPyWLsEAd0WNJvWdSmDW1RVh7HKKl/A8KYjn6Tj/e+31oF+t?=
 =?us-ascii?Q?O7vSLDrqK//FgKJ9WkJcYii1pvHsNO0mW6Ub9DVWRR7TBIuF6XgMLJZ0wAvo?=
 =?us-ascii?Q?WjFJbYTNBY3cEv9e06lV+6jK8kkg7Pd2qKoWWANR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5132e1-79fc-4d25-048b-08dd1a82d62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 07:58:59.7809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPsw0SLc8k8XWrCsPUKSFl4ZB2gOXdgp6jcm3uC65hsIpGB8DbNqMQN+51HOHjjrkYmSwxlwNGj/55U+VojkYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, December 12, 2024 10:09 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2 1/1] tests/kms_invalid_mode: Add ultrajoiner sup=
port to
> adjust_mode_clock_too_high
>=20
> Check ultrajoiner support on the output and adjust `max_dotclock` accordi=
ngly.
>=20
> v2: remove extra parenthesis, indentation (Pranay)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> 4fd644594..0c0765ec0 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -34,6 +34,7 @@
>   */
>=20
>  #include "igt.h"
> +#include "xe/xe_query.h"
>  #include <limits.h>
>  #include <stdbool.h>
>=20
> @@ -99,6 +100,28 @@ can_bigjoiner(data_t *data)
>  	return false;
>  }
>=20
> +static bool
> +can_ultrajoiner(data_t *data)
> +{
> +	bool ultra_joiner_supported =3D false;
> +	bool is_dgfx;
> +	int display_ver;
> +
> +	is_dgfx =3D is_xe_device(data->drm_fd) ? xe_has_vram(data->drm_fd) :
> +					       gem_has_lmem(data->drm_fd);
> +	display_ver =3D intel_display_ver(intel_get_drm_devid(data->drm_fd));
> +
> +	if ((is_dgfx && display_ver =3D=3D 14) || display_ver > 14)
> +		ultra_joiner_supported =3D true;
> +
> +	if (ultra_joiner_supported) {
> +		igt_debug("Platform supports ultrajoiner\n");
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static bool
>  adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)  { @@
> -128,6 +151,12 @@ adjust_mode_clock_too_high(data_t *data,
> drmModeModeInfoPtr mode)
>  		max_dotclock *=3D 2;
>  	}
>=20
> +	if (can_ultrajoiner(data)) {
> +		igt_info("Platform supports ultrajoiner with %s\n",
> +			 data->output->name);
> +		max_dotclock *=3D 4;
> +	}
> +
>  	mode->clock =3D max_dotclock + 1;
>=20
>  	return true;
> --
> 2.34.1

