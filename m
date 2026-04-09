Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19354E9DE68
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 09:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7C810E777;
	Thu,  9 Apr 2026 09:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEHsoDJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C053710E779
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775725693; x=1807261693;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2UjewxhNjkD7AtK/2jHgLO56FmRQ3c2fK8x6yU0k+YA=;
 b=ZEHsoDJ8kmJZCsJEvrfLK/wTl16RzR7ZTSRXAAvYMTvaZHATSSVLz2aE
 lMGCGVUCndRnZ1NfL/q7qVnAkusKVdR69XSUmA+AygM1vWMuetswJr4M2
 SA7J0ApIcaJV0KZadRhUEfhCTZaKDtS5pOhGWjPgQgPfvnZRRCEd0D14q
 6+vO8o2xhPczW9WjJg6uGjf3I1+bMqcnIpyzq4/pFXoghon67R+JxVi3w
 sJSfL8SrvynYhlF0kWMYNEodvEX3GqXlK3IzT+sWFyboL2QXUlwCQqImt
 3kf9b7DLW6G9PrLBf+dqt8I6t3B1A7T0JZHcce3gefNvLiryHK7FFuLx7 w==;
X-CSE-ConnectionGUID: k21j80MGTcmtv9tv70Pviw==
X-CSE-MsgGUID: I9mnxDfOSLGx14LNbMuD9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80610884"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="80610884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:08:13 -0700
X-CSE-ConnectionGUID: 3aad2LLaRBmDT10shNqZLw==
X-CSE-MsgGUID: Ewkl8u7GQzi27OWby+5blA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="232759770"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:08:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 02:08:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 02:08:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 02:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9tM5bjeoN0dfJi9neI2z1WpI5Rr5SpGhiMLnr7+hHmjQG/u1NKad4FXh5Z5OJbmlPyc6khYJ95vvHyWe8cB+/P0m4woNt94c8OLEUgXfcBTJjRbzbAABUfcotZv8PadOZoSwHRi43S5/QVuBdTFRFDj3C75IcFbl1xzoNQWtqKZbJFCC6ETBEmZUYXPGSl9YXbDHejoEzpP2rmU14bt7Mb3UgpSJ6EQGBQHuJt77d61ciFSiCeFILQ15ngWZG0XuS/Dscd4/FOfcvwNyoUR1u/r5lC/D9ZC0BYQSeLmfwwmMXBOvKXFp2XkEcI+Ucm7HLarEVjMtXlOhyC9PdIbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDiuwXyEiOyACleR1vtYgJR5MVr0HZFjCnBd9OYlr7U=;
 b=K++LAWLLd9jw3SFRDImkrZZKzrOnaJ3mTDVYV+3l7kV0bMMUaNjB890QjiGiKbQdnsUUt7llxiwfq73XM8EnHGx+SyIbW3uGCkpfSii0ER9/r82b64mz46JjRoh4SxpwLWeJd6e6VuUgGtIha4E517bz+LIDtByKsd+mnAZ0J4i8NbIRY4NXIjEf9VghTbvuNaFl6Hnm36daiuR/H5J1llVrgqI3CZfJuBjeXlyV80QNPjNKGeU7khnWcqF9OT3y2LzaxRuXc8vii64tfUrKTpajANaAlqrtEFR9UZ5W85A8843TLR/NTyT2zbWmQ59IwnsPr4u7Tyg8j1xLGNQiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 09:08:07 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 09:08:07 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3] tests/kms_properties: Add skip on headless
 machines
Thread-Topic: [PATCH i-g-t v3] tests/kms_properties: Add skip on headless
 machines
Thread-Index: AQHcwczijSO8j7RtF0uHawvIOmpjirXWeu9g
Date: Thu, 9 Apr 2026 09:08:07 +0000
Message-ID: <PH7PR11MB605305C77A4430A6D91E6A74E7582@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260401114244.410255-1-sumit.kishore@intel.com>
In-Reply-To: <20260401114244.410255-1-sumit.kishore@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB8187:EE_
x-ms-office365-filtering-correlation-id: 3386dc9c-91e4-4a68-ca22-08de961783cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: be9Az0QxAByT7CULaNXor2uoy588k+P3O6/DDgIBtvlXxC0V1WrH6gyu+qlGJ1PowwBncpkyNgRWqMh0huCPqpLR+w4x1ChkPQSnZapg5KxlwopyaUhIM4p5huxWrG0+FH+XPrfVSkRcYfKGblWunkkMJBkfzU5u7ztEGWrKdAPG7IXnOApZqarlA5j3oi+PW44oIpXJkzYnODpgjsZab9YjQjoewUWQi1bYAywm8uAUUqoQFA0vTv0FGC58Ucy7CsCmFPItEuhsd+OLU9IF9dIKfO1ctieDcRuHLC5unbJPg322XfKNqCgKg1lKrWAaqkiE03N6Rij4mCgIxRHna08RWhaVNd82UjDnRBPkE08vbS5a7N14p9O0MYPBiA1Qgqm6QRVtPig2ZIYYrmfB9qTpx4f8zHgn++P7iZe56AAOvsOeaZBDCa8LUNwZDBo9T6mVfP8bI9zjNh4dp4+95CLXm/+MZwLZXm9sE3VxUPuoqn9BHKQktXpg87JcXlbg2Z9jY8LNQUGDs/aMlWmGUCoEUWKz5HPcsIRNBNnTxLgByRjqAvIQ0MuKGwpJsl0r16WUAhsZ5XJ6LE0YOf4TWYrKX4zrquGThjHbPqjJHbksgkRLfUyo78ctARPuuTAK2glq3S+YOdhh2GgU1I/Lx2ppjMlPnGNOeNeqtIj573otpZTjN6qDjV0HGJz0kwnFYeicHeUzMBKKV0oY+3eqLeCvQwrKCQEi+SaAV/M3blGtKtPU6XF3lwkju/yXfHgLpfwCjGqLyX1nfQao/DbvgOei+JkHxD6twTY+l8m7rHQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8CkcJfHGSUOYl146PC9bTu3UIo4phHpc+LSsDlqmu2fxMdTjn1iyXF8MsY7I?=
 =?us-ascii?Q?cpfZnB4hCxiIxXwBheZ+We/GJ/1/CAeaX45D/jID+4qrVOfX7p5XHLSgQM6f?=
 =?us-ascii?Q?/blaZwfW+ddfZDl3t1v8WtpqyWyTtEkH5VZcu47y6unf5P1zaN7hsyh1u/Vm?=
 =?us-ascii?Q?/hr8IepueLBSwKfixFz1PrsoONg1vL6/2QcZGwRcjnXwleZ+GzCr2G+JDrW3?=
 =?us-ascii?Q?4kJJ5m92n9CPQ69wqDHvsOREUYzFnCE7Z5q+VrldZVe+IpCdcNcXfVUHTMHM?=
 =?us-ascii?Q?OgtjB71y3dCNqsc3E/6kqfndiEigK2BLdEu/8okpJRcn35dluzTemdA5Ljqb?=
 =?us-ascii?Q?Gr/USDgazPAeEk9ZrDqVyTzXPxqCOlmVKHP7c57rhh4/cf1qFPGk9zjmMVL/?=
 =?us-ascii?Q?sClFsQjW9S2antYo3uVe+afwWwfvS3DEnvuLw6I3G251UPOZUZZZtAJT1N2r?=
 =?us-ascii?Q?mjiW8HVpxDzw1zPE1lUwPSYaCuxtUG+EaDoHS/eli4s7UGlujTQH4f6QD4Jq?=
 =?us-ascii?Q?iiHy/x3bdb9irunoZyJOSMoaz2m57U9uHOJ39HNCpwxK5tDw+PFyT5uNet5N?=
 =?us-ascii?Q?lFLo4j8j/3sB6FlrqXYN5HvXJH8qSTDUmeAnZVrPFQYkO5fcQQKsm+2ii+lz?=
 =?us-ascii?Q?r2R+2BrfG0edk0sr8INMw1iNQBXVcZ4U33JdlUuE05/mfNLZuc2vM8RN0qjR?=
 =?us-ascii?Q?koIdLSAt6PxY9yDrc9XRcWMA+6USYiXND2Ir+SAZig12iwZs/TkAMlBJJnux?=
 =?us-ascii?Q?rzfqvRML7umYOUhQLLWC2AMl3TFUdpNhoLOepmr/MTG6V/g78Ducd2q5T4W7?=
 =?us-ascii?Q?rS2/NdEmgFepAJYLd0hRm2GPthXqYCueWh4DrkM1mCjzmXasoqE4cDKdl76W?=
 =?us-ascii?Q?JbiZ4hPeKBanQf+AU0h9WbTCVvz1+3Vv2L813u6ZSPWuKT99Bz+dVgwWdeXG?=
 =?us-ascii?Q?kYYJ4mBKwbwbJBmyqzsRwNMN6imLZyO7D9PsXXFkSDR6Tvm3pp4iemOrjd0h?=
 =?us-ascii?Q?yFu+ZrAsHoDqYfz3pN7tmofI6cj7IRlg7WVxGFo4V75tI2Ki+CxtSXCMsnwF?=
 =?us-ascii?Q?NdTSOcBjcc5vW2TbaYzM5MjzWjy4NXGRjEZF/RFFiXF7zcDYXV5jxmAR5TLa?=
 =?us-ascii?Q?qwoR8DhcRtm+WbSHn+jtyiI3QJezZ/O4eZS9+qJVp0pM6PtfZ6ugXPxSLonC?=
 =?us-ascii?Q?HoPYgsjJ1eUsiP10kQinEGQPrPK1zarQkLtud2Fte+BkqovN43Ux9hGWkv2d?=
 =?us-ascii?Q?zGknTNRxxYdBJxJHnkFo6hzOirGQVfvcQB42PLFhp31b6mdEmkY2OSdMjLvQ?=
 =?us-ascii?Q?6jTRWpw+kterWNRGHCa51LYRCWlHCX2BQ6JRqK/HPL/RG9KlQimhAatjcxXP?=
 =?us-ascii?Q?BeTPaUtS1KgxZ7V65B+GSz+1rFox7FAIeZqoMlwjBbg92RM7642DSScI4efY?=
 =?us-ascii?Q?Msac5JRWJ/vUQhMd5W3CiIjxAnKlEzB6VxSIKYTvyBlHecWyFZR9sbxABPN8?=
 =?us-ascii?Q?LBntoAjTgZdEar1/4gJt6lCkSPKCmwsfdd/7HFspn1b2M0xYxiGtPHccz9+1?=
 =?us-ascii?Q?ojcDicrCvSp75RzszQCe4tYrSI9XPzn6VEF0brgRTBtPUMTNq2/ihBHj5Cpq?=
 =?us-ascii?Q?F+hXDLQOg1/pjFsr5IaVCc6hqCvK+wSXofRQ85nkm1eckb/VMRC2CjaLV+l9?=
 =?us-ascii?Q?hoz9Dvm/+4qYDLhyCn1rofKOZnzcYtnfhzsPAR0KlJ87Ie4BXB1/bypSMAJv?=
 =?us-ascii?Q?cYJWyVGjzA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YsGCo7P36AScD5FTgpIW4RPRy+7Berx5KIXEc/E4sF3cXbognifgpzGeAb4BtYGpJPB3Y+Q7/iXeAtVYtsW6rC30gYv0bslxvqs4ZQcVq4X+nWJE1nABNII/B67bB9sZlGQuysxwWVU9kPKQnKgQxhfSwWp2mQr64bBdIRW3YKUEnrap5QVMJwy9K4n+l80s8PEo6NaSJjGd/9dvriaIbudBgdFwYJAa+x/joa5j+GRLkFjjh5a5JNsuncNOvDQ7iepbqtFKqj8xHxq8fb81A9Q6pL2YiD3KyYSn2d132vh7SOYLiKshIIzOcu4fMGIfFQCSthl2ZnTJK0Urw59glw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3386dc9c-91e4-4a68-ca22-08de961783cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 09:08:07.1741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ic3wnoZAU0BEhw+RDI5XSToXJ2RlyVV3om2is/mcyooylDnB6r/LD1QnO82cULXZDgVbD8+UjhSX1WLllmxPcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
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

Hi Sumit,

> -----Original Message-----
> From: Kishore, Sumit <sumit.kishore@intel.com>
> Sent: Wednesday, April 1, 2026 5:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Kishore, Sumit
> <sumit.kishore@intel.com>
> Subject: [PATCH i-g-t v3] tests/kms_properties: Add skip on headless
> machines
>=20
> From: Sumit Kishore <sumit.kishore@intel.com>
>=20
> Print debug messages for sub-tests which are expected to skip on headless
> display systems.

I feel you missed to address this but pasting the comment here again.

Commit message says print debug message but changes just skip, but doesn't=
=20
print any debug message.
Please update the commit message as per the code changes.

Apart from this, changes LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>=20
> v2: Use existing library function, instead of
>     defining new (karthik)
> v3: Add headless display check in,
>     colorop_properties function (Pranay)
>=20
> Signed-off-by: Sumit Kishore <sumit.kishore@intel.com>
> ---
>  tests/kms_properties.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index
> f735839da..5164277b3 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -341,6 +341,8 @@ static void colorop_properties(igt_display_t *display=
,
> bool atomic)
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>=20
> +	igt_display_require_output(display);
> +
>  	/* colorops are only available with atomic */
>  	igt_skip_on(!display->is_atomic);
>=20
> @@ -377,6 +379,8 @@ static void plane_properties(igt_display_t *display,
> bool atomic)
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>=20
> +	igt_display_require_output(display);
> +
>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20
> @@ -400,6 +404,8 @@ static void crtc_properties(igt_display_t *display, b=
ool
> atomic)
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>=20
> +	igt_display_require_output(display);
> +
>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20
> --
> 2.43.0

