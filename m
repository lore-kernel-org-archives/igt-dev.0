Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF16CC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 10:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CAE10FC78;
	Wed, 14 Oct 2026 10:45:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FD410E642
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791974654; x=1823510654;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VwlS9lTMR90SQlrtlQ2Nw8+VILqKH92U756lC1s7Qag=;
 b=AoaHanftcp2i8jhfnCRKf9VVQj1zSZkxFrTiQN+X9D7T/r9WfyvXNxaf
 Ci9PJRIpKCO/L7JHLDs3/08qvcnsTgZEZieDhFayQWcCaXnkjnS+z7liU
 Ru9bslP4s1kGRwUUzsV/CKKIzKpvgJqjCXuIIglvmojqCstQF+ypVnWr4
 rppawayGVpw8yTdmVj3jHdeF591Ybz8c3Y/n/tehNzbiSKAHL5npudPTk
 nA56NqGq8sD/ntZ8JuqimZCu3UywU7ltgqnDute9TiTlaeIFXrI/yntJ9
 cxVxGyax6zPep5W3FBgi8TkSnM8JDGGD9N2/zulhowiGDuSEtXa+SOOjH Q==;
X-CSE-ConnectionGUID: lRV2AOgUTS+uFQ09jc+flA==
X-CSE-MsgGUID: nJ54RurcRRWK5lHLWGCNNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="604229"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="604229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:44:14 -0700
X-CSE-ConnectionGUID: sGp+/dgFQ3ueAVjMbtFKKQ==
X-CSE-MsgGUID: r7fTVCk1QAGPi9rry7t4Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1721543"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:44:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:44:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:44:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:44:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYVThYeNdt7A2FigvdKMBQiXZz37RlCgfXAyx/u3G2uR0kyLQTZCr8dtFgbJ64mF7o3foUAOYePDNxRqFbSKyLJI97QC1XUPl0tbJn5sKjE5MfsH6Klao6cAiBl1dyZgUHn4mUow0zS8JwOMvnEaqKAl4TQNiQG2HTOXWzC55ey89y2+gbEbFnTnDuZZLhd2KaVI7FeQY5s38hwkWqM3M5CCQICZvZ4V5GHbFL6w2/t/82hil6taxzD3APJH+kxtiRNf2n9TBiNYizBL97CYbuhM4nkIddEtfgcDIoKM/afUzcH+8HqzFT3A0vyg9X6P4rmY/YPTQa53lMw21hbEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtXVo3EKK9n3s0VrLRewEiSRVijchn/4IM/1aJUEddQ=;
 b=TAJ1P0cJPPRT13AbWbGaULuLFPNolobsIMac6vIUOtSPrdvg6LLlA1qbKUa54fEForkTrW8Ys9d3M0ZAdLIb6UBqQLkQ7cDqlqRkRGl/EHOukwAoBiQkeSb6CEk+73n2ROSdc13XOfccfnPn33QumMk6+67ZqfS3u4QwR8FICTpMqam8jANvfaV8H78hOTb2bDGBpVj+3q0ot0EJSUjnzS2uuIx/jQxUXt3cTZXacZIBIJevpgf2cdjxo+2Z8RQMvufyn3IQrIwIkriQNmitIHNUw7Lj+OOrg++h9goK54+cKZjbLj9Uu6f8xaQ072gbTmAWm8/+gx49zmHUfYQIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:44:10 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 10:44:10 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 6/7] lib/igt_pm: Add drm_kms_helper.poll
 save/restore helpers
Thread-Topic: [PATCH i-g-t v2 6/7] lib/igt_pm: Add drm_kms_helper.poll
 save/restore helpers
Thread-Index: AQHdV67N3fBvTCmH8kqrmQoCincSuLb84IbA
Date: Wed, 14 Oct 2026 10:44:10 +0000
Message-ID: <MW4PR11MB57761561C3BBF5F8669D9AA5DA9D2@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
 <20261009052625.419259-7-pranay.samala@intel.com>
In-Reply-To: <20261009052625.419259-7-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|CH3PR11MB8466:EE_
x-ms-office365-filtering-correlation-id: 6185904c-e05e-412d-0be6-08df29e01495
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|5023799004|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: Wy7K9mvoEqMDD3lpbBFLAlrH8It9SXa728uwV65ap83H7rbezRP40rdEuRxfERqpedSl14Y9UwIhVS6h52lVwzdZkLIIQ8hwS8vFQ1JMPp/sLBAgEfdVZoggJzLkmqotv+QTA0YX68elgAUf7//d4KOjE9ZEWLkny/w40SbqzRIiJe9NJtIcqJoM2Ak3kpSnxVP8whx/oU3Lo1JfEcsCKkZQtLLJscFFXHt2joMSS1/MM5+h6vQM4h3vOzMK+OTSvQLxKZ+uLJzyZgpGoDNaawiTJvMVuxpODaT7fyVjcsjLCZnvfDni+gHO9RHIKip9Rpx4xd+wnSOAHvFgAqo5xrUi1gVSwYVMYSVBIqzXZ2rXB+ygGmbgMtc6jvZTVw0VhQhE6/vZ0BYa7Gv6RxtvTZxAwlNkgs7I/5Xu2kxZUwwf8kf7rANWxWCUG/55kRTIlNG8nbFWS1xhSrOUkbPNhjNMDX5jXRuKRbLQOUJZWAT1DfJ62YvecEvYpwoP6a5P1jong7i27QjB4BzNLutwGMcUMN9mhBPdIt3sINJsbeDwnREITP+iffGvIxJrRcvIUZjZqTqUlEQEnh0fUvtg+zvWLQhvGGYjIn9HShTbiz7sc3eCdPzGlEwiQs6yp0kTjpVDGjmSHk+yzWyPIz2olIwAaTdgsP3RSNH+2RCKcbVjs/q6RX07vksBjPqlELlvAh90YTrSyzgso/WASagqY56ahAYS9CvtemdIAi0Th2s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(5023799004)(4143699003)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1LV+0ptqY7HEyS2r5Kn4QfUFIP8zXLwa1l3y4604G2ShPRC3NQIM6K3crJNX?=
 =?us-ascii?Q?pJz/pS7ejRG63vZE4iWVNpE2Q7qfFs8DIIep61JWIvVS91+xTPf/HiaC40cm?=
 =?us-ascii?Q?wMnlfCr0n0+FXym6Pv2H199H9TmegTl8ulIEzYycwbpXc6rD1o2HxZuRQ9T2?=
 =?us-ascii?Q?OT06Wtai3XxEELzVieZbCC5xnXTvIGidEVkXGuohjErQgeJw/w9eMegal3kj?=
 =?us-ascii?Q?jYaHEZ8zfXgmfh9baZrmVrTmXOyBkI+Zci8mAHwBG9u2bWleMGjs+N1IGpTx?=
 =?us-ascii?Q?UFxF4DwlNx1b7zDEaRDOpEUi3r2Sbqru0R+i6X3UNVpukkVv8qVmG2N9j8hx?=
 =?us-ascii?Q?liUuxodATDcp35a4FbGslsbLVJ8oKzAYRySOcFY27XUmfD+xdgppWCR40QuA?=
 =?us-ascii?Q?Z9ad3MJxqadIwY3dEVxSdi8PJ8R+0cvAZ5RoaoSVnFeTD7A2Z6fxn0CAOnJE?=
 =?us-ascii?Q?sm///d4yMnkMIs6JZlOqQF2wkRLul/sTG8ykaZLjR2S9P+bGw32nKUz+sOdu?=
 =?us-ascii?Q?+0mwbRrC06SEX0hdArO5GFDcYddS0Ozdy98JqK58OFhS64PVhRTDorsVP6Z/?=
 =?us-ascii?Q?TZ1pfA6Do0o6uI28iMwMCtR39dbw6Dh/XYnu86f856GTMkAL5yJGbGHZTZtv?=
 =?us-ascii?Q?dP0AbZkdHB0n71wO282pS3hsk4GpEcHbEP8xMpad/mPtsnqiv8MLhRLCIweh?=
 =?us-ascii?Q?hJ8DKqQku4juMfvS0mwWcLVZjkVcYjJ+Av7ueTjH3N72l8eXZtVg83C5J6qr?=
 =?us-ascii?Q?NM215pTX0ukeWxk1fl/uu8kFSekZcBEUqI/DNSy0FM28WC46vcBvyHyq/F55?=
 =?us-ascii?Q?easoSjJIo6psymZyxJu3mK803sBkNI4Li+T9DpdR+9ylFpFx4qd+1fkkicIQ?=
 =?us-ascii?Q?5QWVXuC9O5/bX1DrQm9psB3GbYMrqR3FtI6pgDpYTRi1LcKLiZ6TUHCSYiQR?=
 =?us-ascii?Q?+acsScZxu/oVAUF7SipmGRRPbFQMdPJ40pfbF6F+Rb+oIDRMq0ZDCfML5RRl?=
 =?us-ascii?Q?KBx7+2UFN+5zDfzrnjwl8eYv8a0v+cV1GxpY1mxRuortWVrKAFg9ncqxNSpX?=
 =?us-ascii?Q?E6rnv2Kkg8A6FP4HTjSE0QW2KUV4qm/WM2iG/S4eIHSwPORrIxNVGz7MXcyh?=
 =?us-ascii?Q?y2XyrDCDe13orPzOOeDkdF7u8o/71SeRGss+Y73oBhZBZNmXl1ZNP8+NJMi6?=
 =?us-ascii?Q?lmZNj2rDxaSPaO8dFC7+L8gk9pKxfFdcLAEM86pZbKMlDZSGaGrYTZG59+zf?=
 =?us-ascii?Q?DTrcdhZnDC4sI+XN5TLO5CXQfhl/VK/w5F//bRpgDmK8kv1qUmzJctkyRtOL?=
 =?us-ascii?Q?/gUG80cfTqx1drzHHmahkxp0+uB2m0jrHPPJA4g5qKEcT0LiN5jIRwGm4c2U?=
 =?us-ascii?Q?spGPRVBoOPVRJlBCSaPkRqqsiIKbhzOed7wSMpLZ0SQ1UKclKBNLWQVYtzgF?=
 =?us-ascii?Q?U1UsMQvEqOm6A1StN0tJhMe4M6+f77IZq4We23uigCK74QJVFIwQzJOPhWrn?=
 =?us-ascii?Q?moukvBKssW6fLnQ/nK1ddw/osMaRZ5KfrBrDGLN2hN9UHpKKVPq2R123MtFv?=
 =?us-ascii?Q?MTpDLnTR5ylrCm/khRxRf/qLzmqd1ro060hrYZMun3+JhLMt4a2xtqWrAbjy?=
 =?us-ascii?Q?O8sivYeuuEc6AG3DMnn9SiiLxpBZj5dUfw8DM7iycEr8XnJnjw7whWbtCQ+o?=
 =?us-ascii?Q?PZrd9lpl8RYAcEqn47KuX0LrvqYk9FLGSwnvnKJKmRNMXXZHC8yar+96OuwP?=
 =?us-ascii?Q?oUbrxsL15w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EN6ezlhDA0BE0oleK2ClEAojqi/jcwhGQ9eaRyqmhi+kIYCqgDX0P4Bi58F3wSbbAaXbj7hmkG3t3jkmCl8BAiBALul0T9pnCpYvxPS+Eg8arcRxaFjdAXQKR++/xTB48K1gya/8S12iAgamX+ayxKgT4LTlJ0MUDcJz3qqg4wqdruAkcr8uRSOHaqTrVSAMEw2F4tXBuK5/ndlYx6zzK9Sp6VJjGbhvEXhziveOm7HGxMHBu1GjXs23ODPYp9HdHeOfjQdZRNKCTDZWR9j12rTPsF+0DRMmFPUwtfUr03uuwvfLyerlUO/Je9ZGUf1EqXADhz2fJWLmbEntJG1j9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6185904c-e05e-412d-0be6-08df29e01495
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 10:44:10.4390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KwwSQ5TKt/Mo4Aa6pw5xN460A9v/MDdDVQEdYNdhRyauX6PtdGXqsMtMb3UqYBThUwSCZywwjfEtGBR55L5qSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
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

Hello Pranay,

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Friday, October 9, 2026 10:56 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v2 6/7] lib/igt_pm: Add drm_kms_helper.poll
> save/restore helpers
>=20
> The new PME hotplug subtest needs to save the drm_kms_helper.poll
> module parameter and put it back on exit, so that an earlier test cannot =
leave
> polling disabled and make the measurement pass for the wrong reason.
>=20
> tests/intel/kms_pm_dc.c and tests/kms_prime.c already open code exactly
> that, each with its own copy of the KMS_HELPER and KMS_POLL_DISABLE
> defines and its own file scope kms_poll_saved_state global. Rather than a=
dd
> a third copy, add igt_pm_kms_poll_save(), _set() and _restore().
> Converting those two existing callers is left to a separate patch.
>=20
> Save and set stay separate rather than becoming one "save and disable"
> helper, because a caller may want to record the original value and put it=
 back
> on exit while leaving polling switched on.
>=20
> igt_pm_kms_poll_save() installs the exit handler itself, and
> igt_pm_kms_poll_restore() does nothing unless a save actually happened, s=
o
> a restore can never run without a matching save.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_pm.c | 90
> ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |  3 ++
>  2 files changed, 93 insertions(+)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 4ed80b27a..5c4c86036 10064=
4
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1679,6 +1679,96 @@ uint64_t igt_pm_get_wakeup_active_count(struct
> pci_device *pci_dev)
>  	return igt_pm_read_power_attr_u64(pci_dev,
> "wakeup_active_count");  }
>=20
> +#define IGT_KMS_HELPER_PARAMS
> "/sys/module/drm_kms_helper/parameters"
> +
> +static struct {
> +	bool saved;
> +	bool orig_poll;
> +} __igt_pm_kms_poll;
> +
> +static void __igt_pm_kms_poll_exit_handler(int sig) {
> +	igt_pm_kms_poll_restore();
> +}
> +
> +/**
> + * igt_pm_kms_poll_save:
> + *
> + * Saves the current drm_kms_helper.poll value and installs an exit
> +handler to
> + * restore it. Safe to call more than once, only the first value is kept=
.
> + *
> + * Returns: false if the module parameter is not available, in which
> +case
> + * nothing was saved.
> + */
> +bool igt_pm_kms_poll_save(void)
> +{
> +	int dir;
> +
> +	if (__igt_pm_kms_poll.saved)
> +		return true;
> +
> +	dir =3D open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
> +	if (dir < 0)
> +		return false;
> +
> +	if (!__igt_sysfs_get_boolean(dir, "poll",
> &__igt_pm_kms_poll.orig_poll)) {
> +		close(dir);
> +		return false;
> +	}
> +	close(dir);
> +
> +	__igt_pm_kms_poll.saved =3D true;
> +	igt_install_exit_handler(__igt_pm_kms_poll_exit_handler);
> +
> +	igt_debug("Saved drm_kms_helper.poll =3D %s\n",
> +		  __igt_pm_kms_poll.orig_poll ? "Y" : "N");
> +
> +	return true;
> +}
> +
> +/**
> + * igt_pm_kms_poll_set:
> + * @enable: whether to enable connector polling

Please check if this alone enable's connector polling
Else document so callers can handle accordingly,


Also all the 3 functions seems to be well suited for igt_kms

Thanks and Regards
Kunal Joshi

> + *
> + * Writes the drm_kms_helper.poll module parameter. Callers are
> +expected to have
> + * called igt_pm_kms_poll_save() first so the original value is restored=
 on
> exit.
> + */
> +void igt_pm_kms_poll_set(bool enable)
> +{
> +	int dir;
> +
> +	dir =3D open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Can't open %s\n", IGT_KMS_HELPER_PARAMS);
> +
> +	igt_sysfs_set_boolean(dir, "poll", enable);
> +	close(dir);
> +
> +	igt_debug("drm_kms_helper.poll =3D %s\n", enable ? "Y" : "N"); }
> +
> +/**
> + * igt_pm_kms_poll_restore:
> + *
> + * Restores drm_kms_helper.poll to the value saved by
> + * igt_pm_kms_poll_save(). Does nothing if it was never saved, so it is
> +safe to
> + * use as an exit handler that may run before any save happened.
> + */
> +void igt_pm_kms_poll_restore(void)
> +{
> +	int dir;
> +
> +	if (!__igt_pm_kms_poll.saved)
> +		return;
> +
> +	dir =3D open(IGT_KMS_HELPER_PARAMS, O_RDONLY);
> +	if (dir >=3D 0) {
> +		__igt_sysfs_set_boolean(dir, "poll",
> __igt_pm_kms_poll.orig_poll);
> +		close(dir);
> +	}
> +
> +	__igt_pm_kms_poll.saved =3D false;
> +}
> +
>  /**
>   * igt_pm_ignore_slpc_efficient_freq:
>   * @i915: open i915 drm file descriptor diff --git a/lib/igt_pm.h
> b/lib/igt_pm.h index 1e9234154..5d91c4d5a 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -107,6 +107,9 @@ bool igt_pm_has_wakeup_support(struct pci_device
> *pci_dev);  void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev,
> bool enable);  void igt_pm_restore_wakeup(void);  uint64_t
> igt_pm_get_wakeup_active_count(struct pci_device *pci_dev);
> +bool igt_pm_kms_poll_save(void);
> +void igt_pm_kms_poll_set(bool enable);
> +void igt_pm_kms_poll_restore(void);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);  b=
ool
> igt_has_pci_pm_capability(struct pci_device *pci_dev);  bool
> igt_pm_pci_pme_supported(struct pci_device *pci_dev,
> --
> 2.53.0

