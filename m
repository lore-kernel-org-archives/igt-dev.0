Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF92DC98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 13:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4538510F078;
	Wed, 23 Sep 2026 13:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exUJBqeh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A7A10E0A4
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790170455; x=1821706455;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IrSHzQVAgDsUaCOtXmnrjK2P7/bEs5c/28c79TbyZEc=;
 b=exUJBqehSzOToRdRqk4qS9QQ1aGxaWJ+NwXi9qRCBPw0DNymKgz+Thuh
 f0o8DxKEDVDl/uQW7jd42T5QFMMBfUdeGIitRTYeWw7NObzUnWkd8S+Iw
 eFtnwOVPaw8hVUadUNn1I2MIk0rcsmxIZ5fK3GGeeJRqowB9pWqjkh1rM
 nNa6OqjpajUmVBZf+u71xDIXqNWyvtYf1TOjH2tpfHA+28w98Nbi6orII
 Zn+wVGsahFvaw/3vjvvFe6cTuebDDRJcChiKuVpLt+qbmbq5cUsPvxEQf
 rLPXjyccJw3WGVaEmLqIq+K9Awvqw1S+mp91d62K/XOkpVQAlHg+Qd77A g==;
X-CSE-ConnectionGUID: +FFU+YS8RFSMTYc67DtCwA==
X-CSE-MsgGUID: VAEl4abnQjeIU8ckId78pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93365729"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="93365729"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:34:15 -0700
X-CSE-ConnectionGUID: MhouCBdOS4aVQFSXfPj/GA==
X-CSE-MsgGUID: qVQvJCi6Tq+9Uw8ZMw8W2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="270125643"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:34:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:34:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 06:34:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:34:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cy39ayDBxeoFvdxWHNHnacCBLHrdFyOEv8f9XesJ3yE1qAQUjbibg3uvnC5Ino8TuBXoaxKrp/4aPcGJFDNeruQ2H/mke2rlHbR8PlnJOdKpuqEEZ3XldGdJqyj74hk1JoPK7a8BVfoTKsRnmR4ecMsgrijVoAUciwZGdm7GJYABJDvZgkJobPiDEFanMlNyl5U/nneFETqcjxlJdN5Z75Oh3+QPxhe4GeRTeo4OAYK4awzdaKCPF4tah0UcbjrqhhF8zO5xWVlGlMt3ANdbi71F7d26BoFdzDbkM0Ze6OkrZ9j1VFH/l7oDdgRNpj0qMK+PnT9lJUGjX/2xIuj7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGqC4uHlWyzt2R5tcKpeonasPEgYrlCE56wR81kr6S0=;
 b=Qw9JMN93KyuMiF4zG78jx5SL52079d5Bj60LxlMGGoozeJLuGzfczQtjJB2Qsi2RnVWdyvtzIbZL9dYtJb1+dXz4fhjaKfXwf4/2KRDjCCVMOqu2dy/pqskbfr4NNGyyhav4OE6LbHgW7X7lqb72j7wvqMrA/837rnx/ky0lQY+t52fN0vR8HTsJeZ6b6tx4NkG30D+kSTgCQhO/2h74pY0Zm2JDEE3Vq9/FfhqSdZONF3b625sIYAI1H4bA44WhqkUTtN9ytY/etN6Xl8QK94GVUOJ0/Nt4rTEfVSB7T+8ldOkI9Pb2g9IfnP7XRUFB6zV0ch/YyLLVBIM0xHZVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH3PPF066A3CD44.namprd11.prod.outlook.com (2603:10b6:518:1::d07)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 13:34:12 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 13:34:12 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 11/13] lib/igt_dp: Add DPCD read helpers
Thread-Topic: [PATCH i-g-t 11/13] lib/igt_dp: Add DPCD read helpers
Thread-Index: AQHdRZTw8luv0uiBOEWXS0hnZOXIGbbcNSGw
Date: Wed, 23 Sep 2026 13:34:11 +0000
Message-ID: <PH7PR11MB6796C766D495E3F66D3DF0D6E5822@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-12-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-12-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH3PPF066A3CD44:EE_
x-ms-office365-filtering-correlation-id: b15316db-da2b-41f5-db28-08df19775a97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|3023799007|4143699003|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: Ti5S7D0+KSzTTPia4so2kPgPD67DSR8s4snq/tsAt9wj2R4Ev1RkTctKilTG5C4YNULhFe2Ez/nI/kVJcJRlWZ/Km/XSnxsGJlXTKeh/esIvRUmssw8xHF7QBLkoYcxDrLq5S/MlvyRcyR/UFPZwYBAgFxGkvSWmOlTASMw/47PfzRmXUngmxGiH6gWTMYnt5TXRvazirX4Eln12W77VVPWyC+EGR2FIlynKKnZOAeOet+aPPnlpSOkT2KbbFnegp4S/WeKR/7dR/yzV/KNPcEELiMyMXWLekEf2APPJj7Z8raFjWLbliQQFv0+/xHHYGmAL8C6LRraTFcej1OyzxScEZMCbnegsuPQ7oJq6fRDHg2FGVtc2byxlupj9dFTdmaF4Qsx429BpUTGBGmFbFKRAuRCrFcHk/WJlJJDYJfePm8Ay7QdZrsux8D1eRFcS10J/A4kt+rZhzojWIyXNTqSMfdj0OD4vnjReKE/UFV9w7YyWwoiyZA7sFJUoxSPaxwddBxOmx8CWICzFoh/TRjW6aBEdgBZ88WPyhAHSgfO+ER4+BletVQDk8CNqTrQb80ODdz4pqU6/q1LYETCcfjR/zffhn7pgv0KVyLM7vnHaQ16T4E7Deiy+9Wr6UdEtvr8ErvYe57071yuWXiSk0BtFq79m50ADRbuvDW2sUrvs2Tc3y7gHP55uOPpHdpUFwQ6IAJgITxgCcY8F7fGQg0C9YQBFFRTuvnu430KmWNs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fSI26QxFO6oe6zyMIRt6+fmPXE9KfRVYoEJWqmHtx6skw4eTPFD8iuTdbkcj?=
 =?us-ascii?Q?xm1EA8pRu7IOPvxUVwYyVl7dA8NZyTUIx9gc1mPAa6nrSHyN8ersXzHfcrYw?=
 =?us-ascii?Q?P7CrZgRVd8qcgSQRuoJwCuEHzsrL8U/DHpp8sn2Vf2EyFVWPcxUVBjYC9L1z?=
 =?us-ascii?Q?MT2iiqLuygz8Wjnkj5plNXNlib/Y1XhF+dWMi188MR7BlXEYGeYU+xlKk0r9?=
 =?us-ascii?Q?y1ZxUAW+RtGYSjDUkhzXS8o5q3UQajDa4CbzJU3bWUNR3vPH4h2Q5GmdEGQm?=
 =?us-ascii?Q?URLU8rJ6nhROtN6xGALVn7TBh3wHlRAlVm1nwCE4bCMU49rgrutEs5v4SNu1?=
 =?us-ascii?Q?xbqAtg4VP6S9vuJrsPI1HPe/l4la0iKQBU4rv3INk+NG3f/6vXov6EhATPcR?=
 =?us-ascii?Q?dnx3BFzvRPCl7ctgCgSy5k8qhLayeFbv/9pjs8HkmNPEdo2Sk4+HCad3w5K/?=
 =?us-ascii?Q?mkNu/ZVlIeEfQze/QRoGR4Lq2O7LYL7cNQ2H834RaBtbDt7V+ezl8YE7czRl?=
 =?us-ascii?Q?E5PXGNkVSKWmkO/C1/2F7TjbgCUsqYXmg1hUsnw20PtxIcPgtwHmqmBpd/8x?=
 =?us-ascii?Q?cUPPtgh5DwZFjG+OuAetD6TUDGeEgqALFwyXixbZ2EJmYotzNAywdKZ/Rtam?=
 =?us-ascii?Q?Sw5xAkcUuXXfdkjjhbg6gGSU1dk29I+g8C9tpqO3hdc55KewwyWXV8tqtdlS?=
 =?us-ascii?Q?h6Nrqy5RFLk7dAyRR5kzr24AaaQmZS0XuIrbw3MYUJ3WDWhHIi2BcXv6stKH?=
 =?us-ascii?Q?l2ElJnUlIJq/OOwPmMsri6uFggcmcdQX+xkpB0ZriZ0sSYSdHFUH2q2sVdSo?=
 =?us-ascii?Q?DJ19CQqdNrZm/QNg3jhfDAvDVCQBOeLqpEJeWob4zGb770CU8aomzEM2//he?=
 =?us-ascii?Q?q7Qp3pYczlFtZIO1R8SWKq07BMAHZDEFRjPHiNSirDXvU5TYYxa5lrDRdQHD?=
 =?us-ascii?Q?UWVkJFMCd+tUr53VG+zfCNJg3ofqjbGXMIZyofRHhPe86r27IFrV3FcV+xnU?=
 =?us-ascii?Q?P7nPbNYZQ+hYilhtJgyJxs7BvSHVvJ5/5EA7qMlAN9+HHnTCCCDJEpuP+3gW?=
 =?us-ascii?Q?L9CvBaQ2rxpIdPTbpnVbB+qOZxPXKMvZ7wusq3lT6wB9tbC+1belujv7vicJ?=
 =?us-ascii?Q?6RWPTFzjlpRjDCk7xgvyRUEPcsJAJZf22jsAo2GGcccpF6vrixjfUttgaO6u?=
 =?us-ascii?Q?JcEE3IVk/wWo9eEIvG5iOHj1tv3y/Qpc6h5NXhRsQ+t4/deXzaOOiRgkr9ys?=
 =?us-ascii?Q?LCEnza2n8IBY6MZuAAp764tpGLXH6iDZVDHykXI6oXCrJfeGHHLqRCPEK7+T?=
 =?us-ascii?Q?dhwgoX+MIr+5ThhtALwLKH2z1zwwyldjH1FW4lOwmf02fLIIs08gJ42R52xb?=
 =?us-ascii?Q?9BxlkTdq/e4t/hbtLh2goqBkmT/5cqrRvkYyGquPv2tudotiXxmMgvMZqKdT?=
 =?us-ascii?Q?VjmKUfz3ENqqUdqDmQObNmE7gsPJ6m0qB+DB5n7pDUFHCa9XobEjgM0lIJxl?=
 =?us-ascii?Q?Y/z+QyGvAHu2T1m/XULpRzGH5t6Dne6qE8UNgvxMRn7bC3cUnlXeIr0p+9Cz?=
 =?us-ascii?Q?Wz0TWB776uvXip8ADfcN+vgoO97IGNW3FvwnzhNWujipO+4pz4uG8UH/QuoQ?=
 =?us-ascii?Q?sqe/hGBj/aNhwWvF26mCifaqJ6B6ZnZQ/IT1Fz+TZ/cd9Sfx7vL4/TjBnyMa?=
 =?us-ascii?Q?gFkmc1RgWS3tVqxJBHp7lBTHgwMeQvUbZYP3vtRAceG9Rkhc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 51Q8uw9+MLkGadMLRCVezPiAN/7qZaVWJjp6QWOiHTKMMnjXrPOYJQxTmEKyrreDjl/b3WjqJvLZlBbcVutz6ezkcwwD76Iox+aAAud0ctossMKQzPibj+a5sPo0ciTOLrwMQoeL7gifD9StFVBWTnTytqUujEXfdWCZ4TW2UoEN6666uhb9ZPIMLNbwS7hST4VUZfLPyUQOoZACStwp+QbRhILdFYRmz/UGLmFRbkwJcA8rqHiywO+eZ/1lyl78m1i6gph2yJEA/T/kMy9VEr0J+Pd3BuuW9NFHy435qBsSWGs948/gLKIjbxyaXUaGpItZKk+Qx3ghHfPN5tvHEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15316db-da2b-41f5-db28-08df19775a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 13:34:12.1433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwU5Na11clqeVEMQSQvelcdinEuLI4YdLeYJlGYumd4K0c3S1c50RVYoJjNSCWP4nnZ1puUOppzSUX3z9NppvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF066A3CD44
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 11/13] lib/igt_dp: Add DPCD read helpers
>=20
> Reading the DPCD of a connector means finding the drm_dp_aux child of its
> sysfs directory and reading from the matching character device.
> Four tests already carry their own copy of that: kms_dp_aux_dev, amd_assr=
,
> amd_replay and amd_multidisplay_modeset.
>=20
> Add the AUX channel lookup and the DPCD read to the library so that new t=
ests
> do not have to add a fifth. The helpers are read only, since writing DPCD=
 from
> userspace races with the driver doing the same.
>=20
> Use pread() rather than lseek() plus read(), which is both shorter and fr=
ee of the
> failure the amd_assr copy has, where the lseek() return value is asserted=
 to be
> non-zero and a read at DPCD offset 0 would therefore fail.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_dp.c | 108
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_dp.h |   9 +++++
>  2 files changed, 117 insertions(+)
>=20
> diff --git a/lib/igt_dp.c b/lib/igt_dp.c index 9f71c9e72..0b1fe73de 10064=
4
> --- a/lib/igt_dp.c
> +++ b/lib/igt_dp.c
> @@ -6,7 +6,13 @@
>   *   Louis Chauvet <louis.chauvet@bootlin.com>
>   */
>=20
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
>  #include <stdint.h>
> +#include <string.h>
> +#include <unistd.h>
>=20
>  #include "drmtest.h"
>  #include "i915/i915_dp.h"
> @@ -173,3 +179,105 @@ void igt_dp_wait_pending_retrain(int drm_fd,
> igt_output_t *output)
>  	}
>  	igt_assert_f(false, "Timeout waiting for pending retrain to
> complete\n");  }
> +
> +/**
> + * igt_dp_aux_open: Open the AUX channel device of a display port
> + * @drm_fd: DRM file descriptor
> + * @output: igt_output_t object representing the display port
> + *
> + * The AUX channel of a connector is exposed as a character device when
> +the
> + * kernel is built with CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV. The device
> +is
> + * parented to the connector, so it is the connector's own sysfs
> +directory
> + * which is scanned here and not /dev, and there is at most one entry
> +in it to
> + * match. /dev is only where the matched entry is then opened from.
> + *
> + * Returns:
> + * A file descriptor for the AUX channel device, or a negative error
> +code on
> + * failure.
> + */
> +int igt_dp_aux_open(int drm_fd, igt_output_t *output) {
> +	struct dirent *entry;
> +	int aux_fd =3D -ENOENT;
> +	int dir_fd;
> +	DIR *dir;
> +
> +	dir_fd =3D igt_connector_sysfs_open(drm_fd, output->config.connector);
> +	if (dir_fd < 0)
> +		return -ENOENT;
> +
> +	dir =3D fdopendir(dir_fd);
> +	if (!dir) {
> +		/* Save the error before close() gets a chance to overwrite it. */
> +		int err =3D -errno;
> +
> +		close(dir_fd);
> +		return err;
> +	}
> +
> +	errno =3D 0;
> +
> +	while ((entry =3D readdir(dir))) {
> +		char path[NAME_MAX + sizeof("/dev/")];
> +
> +		if (strncmp(entry->d_name, "drm_dp_aux",
> strlen("drm_dp_aux")))
> +			continue;
> +
> +		snprintf(path, sizeof(path), "/dev/%s", entry->d_name);
> +
> +		aux_fd =3D open(path, O_RDONLY);
> +		if (aux_fd < 0)
> +			aux_fd =3D -errno;
> +
> +		break;
> +	}
> +
> +	/* readdir() reports both the end of the directory and an error as NULL=
.
> */
> +	if (!entry && errno)
> +		aux_fd =3D -errno;
> +
> +	closedir(dir);
> +
> +	return aux_fd;
> +}
> +
> +/**
> + * igt_dp_dpcd_read: Read from the DPCD of a display port
> + * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
> + * @offset:	DPCD offset to read from
> + * @buf:	Buffer to read into
> + * @size:	Number of bytes to read
> + *
> + * Returns:
> + * The number of bytes read, or a negative error code on failure.
> + */
> +int igt_dp_dpcd_read(int aux_fd, unsigned int offset, void *buf, size_t
> +size) {
> +	ssize_t ret;
> +
> +	ret =3D pread(aux_fd, buf, size, offset);
> +	if (ret < 0)
> +		return -errno;
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_dp_dpcd_read_byte: Read a single byte from the DPCD of a display =
port
> + * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
> + * @offset:	DPCD offset to read from
> + * @val:	Location to store the value read
> + *
> + * Returns:
> + * 0 on success, or a negative error code on failure.
> + */
> +int igt_dp_dpcd_read_byte(int aux_fd, unsigned int offset, uint8_t
> +*val) {
> +	int ret;
> +
> +	ret =3D igt_dp_dpcd_read(aux_fd, offset, val, sizeof(*val));
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret =3D=3D 1 ? 0 : -EIO;
> +}
> diff --git a/lib/igt_dp.h b/lib/igt_dp.h index 0c56ad2ec..44f3b11a1 10064=
4
> --- a/lib/igt_dp.h
> +++ b/lib/igt_dp.h
> @@ -9,6 +9,9 @@
>  #ifndef _IGT_DP_H_
>  #define _IGT_DP_H_
>=20
> +#include <stddef.h>
> +#include <stdint.h>
> +
>  #include "igt_kms.h"
>=20
>  int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output); @@ -=
27,4
> +30,10 @@ int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output=
);
>=20
>  void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output);
>=20
> +int igt_dp_aux_open(int drm_fd, igt_output_t *output);
> +
> +int igt_dp_dpcd_read(int aux_fd, unsigned int offset, void *buf, size_t
> +size);
> +
> +int igt_dp_dpcd_read_byte(int aux_fd, unsigned int offset, uint8_t
> +*val);
> +
>  #endif
> --
> 2.25.1

