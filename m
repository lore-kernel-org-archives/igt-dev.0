Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92231C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 05:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1D10F7A4;
	Fri,  8 Mar 2024 05:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G813Qw33";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4367810F7A4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 05:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874413; x=1741410413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X5mK07PiH1ki/ykXCEzSZC//vni4NelimdWnfPtum7Q=;
 b=G813Qw3324dHXOakut2Ngcst/P9JEb+eXOqFy05DOdYcTrr34UVRTpd0
 7kdImGv400CD6Uw9FYEP6k5qlFLHK2ktn1GDRMfi5JD6SRnoR+wHv3mNR
 kvTgZRL8OAAN46zlPsqTvcqVxTqVvi+7gbsNQTkoXG+v5UYcx0TFUC660
 m4P/rzBjlmeETSg4pIP6ci3tdXJr8BzyXKFmjuOTtprOuDVmQSPk8C6EE
 DXKffMu/OgaYAZd1Qzmfo1AWbnlBSnRHmqOjJZFdy1wjogYRIHrrKMlWk
 T3jDfwl2bAysX0AZZfFU3TmjOl6FTPUVhf4ZrJ/t9wUR0JmVikvUgKl61 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="5179377"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="5179377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:06:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="14915930"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 21:06:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 21:06:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 21:06:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 21:06:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpCuQNtumiy4e2A8MxpMIoKTxe//ULXVrrbB2TQyYmXlCuLHjGA+LsDYVDUnsvc5pmSLQI76PrpuOhCoMK189hXP+D+fddqCysppNKDpIKkiOLQO6rcOFpzHsIAKUFqSSEIrxwU+LYbDkd8j+dTmE8acnFlXhRQqUuETJVrSMHLLUL3BXOx5yZrC4w5rPmOIU3WDswBrrlXGneqYCA1T+5lrQhN+Ml53Ap/QNRjk+QNvViERHUG3n7ZP6UYW9HPYtjGQqBmkYjD1mR1xTYSvKKrQyyfYdlmHW3q2+NJB+fob/dryrWRP3rCKTihemjHnbdg7LvvZBFuqquzKKbiY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj+ornDRuwXLqIxGV10CdP4rhXTRJOJLXzodqRKcgdg=;
 b=MX15Go/9S2YChBdVaPAx3rp4e5x9eUbT/pGDPKec6HUXRxL7slXPtofzmuf0cvRw2XCxhSI2K4VXVsqWIALVpJFfqO2BVLHC0hK7chI7RkGY2Jvks1PJs47yCc2DYxG2DlZVYlZ7EGKkSo4p2Belv7Q7TGB5BXMHkG+Qrx1defkH9VLnGYWmb22h38cCUZtyTntEn3SOTKkhoCJRqryU5Wo4aTvKkGsAblTBilS7N2Ar67uixN35j7blfcQxpLX/hQARuijhGb/fD2cym996cwcrYp/c3XgDbK4aA+WfoWO0wt79aMngBoX5dIVhBYXjc01Ic5/4HNCtSkXUhPnj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 05:06:46 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 05:06:46 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm: Fix runtime_pm tests
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pm: Fix runtime_pm tests
Thread-Index: AQHacL2in7csUWB81km8bx8H6cIGiLEtSzdQ
Date: Fri, 8 Mar 2024 05:06:46 +0000
Message-ID: <CY5PR11MB6211D6C121C2A6A5BD46A1EB95272@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240307183103.188082-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240307183103.188082-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA1PR11MB6266:EE_
x-ms-office365-filtering-correlation-id: 21073660-e744-47c8-338f-08dc3f2d8dca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qJh/TtiebFNxwnbYMBZN2M/NV57wjudNu34RSYf1bwmlUXBsh5KNr3KoE7RJkQNHbBMG1AC8joHQR3XypW08qjXzidV+N93MtTjCg51Py6Y0urbZFSn6VgV4iKzVAPNdIF0paxE2mgkibnAQ26TcRzzzGS/Rbv5zoAV5K+NotYio7B1KIticz8DiZHIMeN367foYt00Ho2zpn6YVwuahzl1jtWH2PTGS2hztvryZ0RBslULRfMRE3U65i+f2dq9tNtaFobTsyocmiHWj+sAznVhernfxRlDtGmndHEsVnaagSJc1nes2oYOcrW8d8Cm51dYGVlFLWP2cSMtmF55PW1qHz+67UvlV/i7HVtLzBnxU9OPK8FXwJLIwviod7jY9oG5LSyWYzpVZBdlzASW1DLeOouwoQMCMZwXLXuSORf3wSzLXzYWrSm+6NT8GKFtYhxvQ8oqdGnXMzb84A2rkmaPq5Q+qvBBjpltlkGQZ0489MGRXQmPPxCwiJxr8rkNr83OaYF+NqbsqW5exy3v3Ysu8AG2Rg0FOdEwnE8TxsH5CHcn+77JwYswFDCc3qdEB6OII4fPaANCH6++Q7RtVhUH32SGjiptR4yj13d2UaGH0qPzUsls1xeDuomS5uCRAI+29Owtt702U0zgVVgqXlzFyQp2KNUxyak5/P19fSmMzjHqU3nsfuBI84WWWQP01YFIj2cxk10qlX12X17vcxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EVNPkvQki2o7DX3Hkt/VhZjcuxAAnfmUaQIswsgK0VY0DSHEsjfP4Ltdgx3i?=
 =?us-ascii?Q?760/vzHivEgLCdt6F15d1TCXCVcEyVmW4AiEgTkweMC3aYwUUgR0EMj84tQ3?=
 =?us-ascii?Q?v/5UpOV0EA/V3PBHg0RevTpEBO3OzuSsRfk5DQWvwn5FYQmGeSRhbD2oZGgO?=
 =?us-ascii?Q?ck1Z1MOxDlvtfA1Gf7sDacKEjVhywaStef4Tood/Xt+oOMuhYG49yeENWpFG?=
 =?us-ascii?Q?GcDYW/bccKEkKG3W+q0AQLiQybXEmpBtUNQNBL287xbWlAEkdEcy+zvTkegX?=
 =?us-ascii?Q?Zg+bLUHqH7Xmr+UeQWI6LcBjNcRHybOF90EJGZGvCegS0TdYV3ime0zVfqjz?=
 =?us-ascii?Q?oSfjuyEY6Z6PFOfCXLtlOxWbplWVpOb0cJTe5vHCDYEMFLoR8Cgvl2PCxLSx?=
 =?us-ascii?Q?7ts8M2EyRZRtoRPwywxi63mEJ5kaGSaZfqH+E/NXXr7lK5NhjJJy+thepb3K?=
 =?us-ascii?Q?iyp54PQNt+Rt6DG+OKXG5aL1wFuX7uPGZwwQn7BTpl/ag9/6J4Atb1uE9Avv?=
 =?us-ascii?Q?2WNHifwWd/tejFZgQol/YWQYdXWoCek5tKpgh3bCRGCdwKKtD2+eapzaahnk?=
 =?us-ascii?Q?fKzVkrfhx+bnFBUQSo4L5SbtTMnnSNlRQeXN+nWu+zmZNz5j7cbI4nWQ48z6?=
 =?us-ascii?Q?dm55P1EFuMNaD+8CY1s/9DFTRErcTZ3UXXUbV+etDUJasQIhHy5L57j34PIz?=
 =?us-ascii?Q?l61uD3WGrUpTQFoSR2FkZ60FJQsIdKboq2HlyGeLbG/NyyNASmqolVQZxIGy?=
 =?us-ascii?Q?e7H9As51IbHKccNWkJqilTj1E8u8cf7EIfrEvmgsMTmMcQa5ybnsk9QuGhpr?=
 =?us-ascii?Q?FiPD33KQtbbK6Fxt3W5gs4mE8nirzyx4jBA6Xb2/A1JuuA2CiHXaQT26ai6G?=
 =?us-ascii?Q?huG47onicaA5KHNJnIHBfQBlefWcJUz9R08l4Egzo379ARo589CRLF3PANhX?=
 =?us-ascii?Q?OcRzpVlBWNALuO1yQLS0s94eOecMhmyweM38Mde75M6YxkN55LYQD4m2NIn5?=
 =?us-ascii?Q?OjCZH3oj3x9L3Vc7T2xtxBMi149iyiz7WsE1jLZjuiNWSN7bniWftpT8fdTI?=
 =?us-ascii?Q?Plh2q+lncls3FnBvTEI10QKcx9dLiOJb2wAc/pm6XUS3MGC1ISFOPMaLOt9g?=
 =?us-ascii?Q?oGRh00jOqb+tLnjjoGXkQ/jpZqtLnJXhz3/+3QLuE3mny8upsTWF0vuKByI8?=
 =?us-ascii?Q?gU54E2VP7gHdBabL9z37PT2dB8cqwUpySN4VvKVJnU2wPvSlopZNyq8bxxK2?=
 =?us-ascii?Q?uZp3CSzInqd46B3LAJ2figMeLOdmW/iuiAVpWOV5NAPDEis0XDwVSoS7ZFbS?=
 =?us-ascii?Q?H/EuMpBIxxD4qFzUTR3fj4gA5RIBqQ25dcN/+LO5ExwNPNPc9pTptZbs4fj3?=
 =?us-ascii?Q?g5cPb8+7muUY5tlO8mUxBJlciFXVBsjatUZfajIO4R0YT70qjZ71Ye1Cgyc2?=
 =?us-ascii?Q?xoSj+uA4Es1A2fdH9k83XcO+GExIVO+9B6RBh74aTe4Fia0DWYmJh7APqfi5?=
 =?us-ascii?Q?KDgfKYIsA1SnqQsPZG9P59bxkxJCgG20JJOy2XWL6nQ8Xwu/TPklz5RKqIGK?=
 =?us-ascii?Q?Uj3zp1wBZrUete0vlnBATd6O6jLdAPpbISbC6C4b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21073660-e744-47c8-338f-08dc3f2d8dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 05:06:46.4152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnTZ3xBDFc0O5RUtsmzF5npCB3YdKidp2PK+dVXjPptaLrsiVW+QwIkMdXS39p/rciSNjlZ8JLrJk4aJXyl2QrNsn8aA2nN/fml+P+5BITM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6266
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Friday, March 8, 2024 12:01 AM
> To: igt-dev@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_pm: Fix runtime_pm tests
>=20
> After the introduction of kernel commit
> 23cf006beac3 ("drm/xe: Runtime PM wake on every IOCTL") the many ioctl
> called during dpms_on_off might be forcing rpm to transition back and for=
th
> active to suspend.
>=20
> Then, when setting the d3cold_allowed during a transitional runtime_state=
,
> we got some situation where the runtime pm might decide to keep the devic=
e
> awake for a very long time even with runtime_usage =3D=3D 0.
>=20
> Then our tests would start to break like crazy:
>=20
> (xe_pm:29453) igt_pm-WARNING: timeout: pm_status expected:suspended,
> got:active
> (xe_pm:29453) CRITICAL: Test assertion failure function
> __igt_unique____real_main473, file ../tests/intel/xe_pm.c:556:
> (xe_pm:29453) CRITICAL: Failed assertion: in_d3(device, d->state) Stack t=
race:
>   #0 ../lib/igt_core.c:1989 __igt_fail_assert()
>   #1 ../tests/intel/xe_pm.c:432 __igt_unique____real_main473()
>   #2 ../tests/intel/xe_pm.c:473 main()
>   #3 [__libc_start_call_main+0x7a]
>   #4 [__libc_start_main+0x8b]
>   #5 [_start+0x25]
> Subtest d3hot-basic failed.
> **** DEBUG ****
> (xe_pm:29453) igt_pm-WARNING: timeout: pm_status expected:suspended,
> got:active
>=20
> By simply waiting the suspended state before we touch d3cold_allowed, we
> get our tests back to a sane state.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_pm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> a0045da0b..fcbed6249 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -121,6 +121,16 @@ static bool setup_d3(device_t device, enum
> igt_acpi_d_state state)  {
>  	dpms_on_off(device, DRM_MODE_DPMS_OFF);
>=20
> +	/*
> +	 * The drm calls used for dpms status above will result in IOCTLs
> +	 * that might wake up the device. Let's ensure the device is back
> +	 * to a stable suspended state before we can proceed with the
> +	 * configuration below, since some strange failures were seen
> +	 * when d3cold_allowed is toggle while runtime is in a transition
> +	 * state.
> +	 */
> +	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> +
>  	switch (state) {
>  	case IGT_ACPI_D3Cold:
>  		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> --
> 2.43.2

