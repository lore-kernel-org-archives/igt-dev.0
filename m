Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73A0CD8CAE
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 06:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8D710E0A1;
	Tue,  9 Jun 2026 06:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Elljyppw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B5210E0A1
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 06:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780985100; x=1812521100;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z71lgsaxPx2rnMdL7X7wxDmvq0whiMExbH+IdGwytJk=;
 b=Elljyppwj7iS9duHZieBKqez6Wxw6DDJL339AYbeUN5kwMCfaRRg8UPj
 n/tMj2wr3/HUgvx6hU6oHxQPEqTh+QZ/EQeJX+OsoXPM5SuWGlhj03CxQ
 V6YomimYOzYA+guVrDmDB0QtFgZkmg/R6H2h0PYl+hcgscjj8FhtxVTg5
 65EN3+qDhUux4cFfcM3CwgqZVa1Viy97+84lFYvMnQWMGLH0ZI9POEUJ1
 4ohm2BaI2RSgyZWio5EwkQOVOrVzOOwKzcmohQu2sBm9ZvCPIox9SpXvd
 odA/r/AVVhfzxTTi6XeI5oZnnGJqZ4/rVYlCkztlArksLExHiX57aEdnY Q==;
X-CSE-ConnectionGUID: 2iUrnBk+REmMEQmE5QfLdA==
X-CSE-MsgGUID: JSBmoqmqQP2f5pUyeYDMtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99155172"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="99155172"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 23:04:58 -0700
X-CSE-ConnectionGUID: WMAULIb6QriSwW8V2TlqpQ==
X-CSE-MsgGUID: SslOwf3tQD2JgutHDLO4dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242823695"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 23:04:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 23:04:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 23:04:57 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 23:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1cvA2l1K5zwS/vrI87rfE/y3zcwM7ZXxD5f90lGQu+s3ctDR7rzvN1P05Y97IaRKpooDCYvYlehKZpkQaYAmE8RPd/BScdoFiLQrUwJkvVgDvMAg1gBy0aMQd1si+8wQAX2dp5dh+Ly4Z6Glh5cZcSuAM3kCUh+xAtNsnvZ63qUWnzWyMQYV78aBLGr0XGpSx1GG9HP334ckjFZjg/md+G2iqiUQRMkKBds6rc4cVNgQpSvowgzHhHNVBuo5Ku+BYSlrphFRVELZgarQZiQ0HsHpbvZCC2oIIpICQoXD03TwymLVRaIaUFhIDrH8Pw9G8M1pIBkMld8bv92zx0Q9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFzx6PJrigqSBhUFVrNmd/8XGNlbiGxIHBEvrWcVXhI=;
 b=WCafIbW8bOKehfgbjfsqHjbKiv9UnJKS3nD1wNtyYvK0sw40/18AgrWz5yZyw3d76EZ+KXAml5ck/8xmiXHkzCf14kTHQ1/HnhPnDSG30ohukz0ZYydzIV+RHgNJnkeAZmD3uvz+yCca0/egcODJehlgABbeZBgntiSjN1jCLjyL/MRsLumkB1elRl8tmXxOj2EL1EblK/xKMfVAltSNgZM4XIduzkIEh/cx8K7+0oVJJPDK1m/Xo82+Mw2aNwxlyUORz831NX4HqOxtb1UEHFMfeRD3zgs8ENAPBBLJzO/WUDtXSbkNg4xtL4eJDjEYjiryLrS0IinEarifNxRZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 06:04:50 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:04:49 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Thread-Topic: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Thread-Index: AQHc94XoCeh06hJi90y+W/AnJXD4jrY1usRQ
Date: Tue, 9 Jun 2026 06:04:49 +0000
Message-ID: <PH7PR11MB6053F8E955C46F21EF5F3C11E71D2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260608204019.2618145-1-swati2.sharma@intel.com>
In-Reply-To: <20260608204019.2618145-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS7PR11MB6199:EE_
x-ms-office365-filtering-correlation-id: 2cf25908-83c7-400e-3118-08dec5ed03f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|56012099006|3023799007|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: Yn+40UscV/WLI7poKHzhm9bHC+ceyLg1LDAv3ZHNkQlDSYhpnb7P/aMyK493LHF5KvDMmzM/ipqKjttST88aZRP45UP3q5myRbYaSu5uspG5zNb/JgxUDw6mQcoNyC+6aAm9xcfStUX1gzb03lBO0jB+g+aP4gEiKOUTQS0P5v3OJrqp08Bw46qGm6yCybdSi83qZEz+1y0iZP0ZSnieP1EEjr36vH8fFw2jH1kkcQplIajTRVnUAd46A/j/g8eC3n3ntfIcLzZUZBkCfmE3Eof8iKzIizypbo59CAjTyhHV41BvJpREKwH+Kl5Y42OxHMhvLxxPTW98vX0vAdqmwSGSqDtKI10S0VgvPgGK8fpkyZdYvzqnaAqvHDjTPgt2ILb3NuQ2f52AqcNX10Fzf7RL7w1giyS+LCIxun+iN0qjMT/vkD5hf4eXs886Erx5wgv4yOdmky+r0pFtENn02E+9GnX7q9Z2KmdFFZeRP1t1M9vje1h0ZW5MXoKE5lb6Hb/QC06kscQMNbY3VPsONFx7bvtcOiN9e1KQG6C4MTNAx0JIXFzpYwQaeSwe3yVWCupAcMMWsyM/h/CKt1Wq0svQZNbhADtZ71POUB+bCpTlC6W+/p8ZnOe76wFvWY8zayXYN4IRjeAOAgzWDDg0l3eoKUqd8y//R/yFoR708LKEqXuKx2/MgIv0cUrZhg44zjJbtmCbhBQkw2UYJqL+UNKkksOc/9eecc3OH/7Z77yA6lgk1jnJ6LLQpI8VRGU8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(56012099006)(3023799007)(6133799003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VIufLYe2wyJQ4AFaUZ9DmrwauF4hXAFf8qw5XY69npjjYPLaQS+OkRnwF0zL?=
 =?us-ascii?Q?tl+rEvPeT+vIkJPwCcxpdZA38zha9sQZvbuvwtrlIfZvkm1aTn+eduTBD5Oi?=
 =?us-ascii?Q?tvIimhVtf0i/a234lUmFTLRjmPc+CfvwtstPPENX35YboeRxGQ/GYptJZOxi?=
 =?us-ascii?Q?Gg3Yoc58s7CXrRFK9NpVg4JsNGhBQXLpKWKBuCpZLHgv25ldse8vyWei44El?=
 =?us-ascii?Q?Au80j9FrEVIPJUbIQTIIqEUk2bFB3ZZ3urf5k0MA4VaCXp5jLNZs7EkAcywz?=
 =?us-ascii?Q?hbJgH+ojBKmudA3ChE2+/x/MCLbMgtu5SCB72PcaX+B/78Qh+To50iH0TCvq?=
 =?us-ascii?Q?jMHxPRiam88wOBNyZsBSQ7FWNFZvY0M1EIX8VLc7O/TzsqooN7MVThBj/dKL?=
 =?us-ascii?Q?3ExafB1/ZWgrRzyIMdwN1Ba8O8z3OP1YNiJ4UO/zBE9ZCQif4V3ATj0hB13l?=
 =?us-ascii?Q?niwZNpaClJ04vJOBV9NrrZ3mb9zY/86VroDxBs0bc5E9itJsMMdHYSU13fNB?=
 =?us-ascii?Q?bUJ+/hL1Im3JekyD0oDRM7QEPT/kUbeY61EoSiLJKH8ndyvG89K3cGOaaka4?=
 =?us-ascii?Q?6s0Li57pHDcMMdNu3koU4N041lTgxZdAXqgLL31dNlfrs2+DDg9y+5g14wfP?=
 =?us-ascii?Q?4a0kczRx4R2KdUVFRdNqpL3JchNaMEQWhzVOJf7VwMkoX+33yago/arfCK/+?=
 =?us-ascii?Q?eNBOSQCjGMRvmlomAmZtvuZp9r9LHlTBuTA9tUnZ/Mc32d4G5+a16rz0FWZs?=
 =?us-ascii?Q?FgnW1pjrycYXs4DXE61Cfjj1TDlqVIvHbfqPyF2Vf1fXWEGae0KVg3zGFSIx?=
 =?us-ascii?Q?FSWmnbTlQKRf/cz6+O/U0S2uGSTO6GJf/O/+1wM8+NV9vIFGLSUxLp5exAcT?=
 =?us-ascii?Q?hexO9U0NfuchagtlCOaGNoz75rna5HbJ15mT5M/ZnVdi1bS75FPO5E6oPgV/?=
 =?us-ascii?Q?nH4s250DUwmGGR0+Z7Ac7Kqihe3Ulk0IgmYWYCkrV4ZCV3frWK5TkEsR/Evt?=
 =?us-ascii?Q?7R33pfyErZcmP+bRgQONBTf9YVFqHlTWhR7ea4fXK4/56Ds6+T0HYgdhy7SE?=
 =?us-ascii?Q?bBvWQALXgF4O+Zb0fph94YDrOqp9k9emShhnDaBGeQOe3Y1Ywpl31gCsNjCy?=
 =?us-ascii?Q?qFcRGeh24zqFdq3z9lXQ58VQUFiYoBXalciBUkGm90qZRpyrzMOwFETo4s29?=
 =?us-ascii?Q?o1NHyCb635i+LXotVpoN3nkPfYi5x7EcVJwRE+sUF2f2MDZYsLdbdkZAGwz8?=
 =?us-ascii?Q?Gj8OheE82RrIvkRdRU4yaxTguWdxhtv9D9lGl82OVJ+rVJXeNsaZxSYy7dzU?=
 =?us-ascii?Q?AOVfzJjNaYz5SFfuzozrKcqjXJN4fk/MxGEg0LbGqZf6/m2pig32/WHukZRo?=
 =?us-ascii?Q?7KNzMaxHMY11pqHYEg5Yz3Th3EeVnBP2XnsLwrjRICyE8f1aOkRRqHqb8ct0?=
 =?us-ascii?Q?xhUzAwl+VD5GnX04DSVj1q+/DNAfIHjEpIev+qvZlBlfBl0VyDnNHXtJY0bJ?=
 =?us-ascii?Q?9LmC7gDYkZ2g8OS2teVI2r8FJNRVIqhdN+3wwrfGVxgXICcc+OwjAnoQRDrL?=
 =?us-ascii?Q?ck+Npkv3OHAEEcs4qZWuv0u9dEQk2m7YLSSszjb6rU1XvrnM8sCICjkr57J6?=
 =?us-ascii?Q?LMGfjRU4RtJ7u+ri9WN6sDOXJP/szVrfv6ChOGiqHPPc4TDv/Ribw5oaCt+M?=
 =?us-ascii?Q?hLIgKH8S1FH+VPMqqipfT7wn5ztSXk1DM58AqQaeaZNXY26t4KkAQ3wBUM++?=
 =?us-ascii?Q?bzBtGm/P+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dQu+ATuz7TA0wlU+C1nIxJeNsMReJu+cKdE7LCD360FI8IiQm4ljxB7q0zW4uw5lMpYnrZXhlD/eLRetnpZXzu14gEre0h24LZDWdDKszEzx1D428DWB0K5a9UBfZiY4250FcVOKvQa+16Gb1Q5ByKlCgpgGg3JT1Px9AP1sBlP4PQuXSXHlEK/TIQFvyVZ8hW4+5tqVJwXS6L3YF9X9VQjQZh4asrrhoHjvyON4gIO5jsgX8hXIpR12oidI/rxEkXGpisU80kGsB+JXOZy2UcekM4MOGtZ4naePn979deoL8IFGJLMMecC/f4lbtiblloYpWp6I9SoQx7dZqhUKLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf25908-83c7-400e-3118-08dec5ed03f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 06:04:49.6945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IuVmOp5I+uq3JWnfz/+svL6mvwSgc9Axk+Gzhi6oMa6sYz/D/PmHFBkAnFBk4V24OVpRZHqg4ddSVGuylXSBTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Tuesday, June 9, 2026 2:10 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
> invalid-hdr subtest
>=20
> The invalid-hdr subtest validates that HDR is not enabled on non-HDR pane=
ls
> by checking for "Unknown EOTF" messages in dmesg. These messages are
> emitted via drm_dbg_kms() which requires DRM_UT_KMS to be set in the
> debug mask.
>=20
> Ensure DRM_UT_KMS is enabled at test startup so the subtest does not
> silently fail when the debug level is not already configured. Install an =
exit
> handler to restore the original debug mask on test completion.
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_hdr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index affd38887..07e93270b
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -34,6 +34,7 @@
>  #include <unistd.h>
>  #include "igt_edid.h"
>  #include "igt_hdr.h"
> +#include "igt_sysfs.h"
>=20
>  /**
>   * SUBTEST: bpc-switch
> @@ -647,6 +648,9 @@ int igt_main()
>  		igt_require(data.display.is_atomic);
>=20
>  		igt_display_require_output(&data.display);
> +
> +
> 	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		igt_drm_debug_mask_update(DRM_UT_KMS);

Since this requirement is specific to invalid-hdr subtest as per commit mes=
sage,=20
please scope this to invalid-hdr subtest only.
Enabling it globally is broader than needed and will impact other subtests.

Regards,
Pranay

>  	}
>=20
>  	igt_describe("Tests switching between different display output bpc
> modes");
> --
> 2.25.1

