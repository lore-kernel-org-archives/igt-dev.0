Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62A4C5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 06:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C7410E4E3;
	Tue, 18 Aug 2026 06:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdsoNOTn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916B210E4E3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 06:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787033635; x=1818569635;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6uup2ZDreKlTzTuCZykltrCHTVqEIHQbPbh+vhhuhaM=;
 b=WdsoNOTnasNMDk5lwNMUn1ERHOtIAaYaUFt14dVXlxqHf+sSEdgnynFs
 BYdc7iIVNRMTmH/oU1wbs7fHHfMaufPku6m3WeM7uQ8hvxGXp+DYseMyY
 YlgtHnxSYpaYYeVcu0NSHYSQ+whgLM5tl5E6icOvEWDhLsFvJ+lxAMZI/
 9g4sZ3Z6eVV+qrXRn+sobLWPBz1fGT1nA0aIJrprKdIOInShWtiuB6GPm
 B9+EAPZG+ZD2vZ4OSk3sWaUTHomWVfJ5A98ousbYC5EhXobDhOAg0ZzyW
 9vAJPioV0c+DmW4LYWszMLJC8AJUgitjL0xffNKUQGeHnmgMeEUi2yCrs g==;
X-CSE-ConnectionGUID: 4M2P8xuKRryNHPVZ5wD4lg==
X-CSE-MsgGUID: oMNoQ6clSAW3JGdJWa13qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98877665"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98877665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:13:55 -0700
X-CSE-ConnectionGUID: SLlC/EY9TROkX6MpMpbTkw==
X-CSE-MsgGUID: jUQ/Tms8R+qivCn1jj7/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288623307"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:13:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:12:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 23:12:05 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXKZeA7aEybe8aK+o9JMeYc1Q0S1juZq1LddjOBpumm7ZTN/Mc+r+UVfzh4l9UCPGZnvMos/7c3IqOUARPixDenaGKyUyXRTYMVphwvtktl+aJlfCtu28L+C4agudUdg8GSDgpy5OG8V/7YsjkohRE+NlwTEDLFXw4GaXotyfAqnoQSjwa9+NP0CU1fLP4l3WwDhJhrnmWXI8JnvM0F/MZEzcYlL66FqK6xY6fQYnLKvVu588RLnCCJNvpUmRVBpiBbjGFgZwcXGCT12Z7X6Fx4Iv3NuWZsZqPF55GT55z2RQAlel02xAzVhRgJmPYGPME1l/e6lnI1z85vyrZArOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh0/6oOyQgHkaM8sScQsNV0+5kUfqA5UWIp1QKY9FjA=;
 b=lAJGXTI9YtQYpYlC8xu7nt+KKMkIQUjgQAkekYAmP4MhJLd3mU34d9YxMzMUxxtujyroB9H21EkrqVe6Nab2qdVKWa7CdTQX0PMBSA4umUGN/CD2y2x6c7HKJO/VCnr/mV/1ZuvNeCRMk6KQfUPHnokKTXYrju32c4YCs/fKnP5haAsUUM4vs+bZQQFtA2j4bdSe8egZdGxzJ9dUTH0gFn6pKkael4DhkY/R27rV9iRDzhx7ejYMyYYcHC6r9uFa0Ax/p6zPOnMfxGUB4BQqzeu2R/Ncjp93Hw1iDV/7K5mPq3gy+/41BbS6PbPzDrmPy1PcmNzX8zd6wWRV4aHIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 06:11:58 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 06:11:57 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor test to
 accept shader function pointer
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor test
 to accept shader function pointer
Thread-Index: AQHdLtJJPfQkN0NEG0Ov5JiyxJr0PbajUzCg
Date: Tue, 18 Aug 2026 06:11:57 +0000
Message-ID: <CH3PR11MB843416DECAF595448C4167438DA62@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260818052716.156973-1-varun.gupta@intel.com>
 <20260818052716.156973-2-varun.gupta@intel.com>
In-Reply-To: <20260818052716.156973-2-varun.gupta@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN2PR11MB4758:EE_
x-ms-office365-filtering-correlation-id: e20b8a74-339d-4254-ef39-08defcef9ba2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|23010399003|376014|6133799003|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: m3m8Ntmyy5Lm3aFpLvYCiHonH3aEEWrzc8Bd8lznsGpN+yUY3Ys2sPtnJ/N7A247s2GGoSxZ7Qh1EC7y6s+83xuC/Gf5KltR6O5PvMacBd4FuWiMlLcTQ5+ONepRO5n/yJzeERIZTwqUseidYK6n/Z7ZPzbJ3U7PRgna9WwEUPHsHSYBkkAbz+9rXBI/8Cayf8wFbKZrYJ3966jeddGgj1UI18WW/Di/EZrCASwGuJex/J7nPEP7PGmxpmlhgbkHx9IuNzDT+5W2MxotTTbZczvbQTbgQ1HvNYAsQmH5HpRRrf00q7eltu4Erk6bOuVR20vZCdljh5V3wE7a1ixopDZ8KMajmi+RdLTDDFnQFTO/5P5fjVId8Uu7E8yZkLsoQWQTVdBSXjo/1PBGvaF88BnOLrUXa1dNMz7e0aABgR9h2AyEH5l1J6LGw1zxQXEq5BLsiZYwi8UKZi3xR7p6RUBccEmW+ldokxEIG3CRLN7VYcdWaECAXRArqX61X2P6wqXg3IOf4Ods4hx1aLc+OmaHBydVIPxQyAGv9YpHpWYO61ZE7JaWpR0+Rzokfjk5ujaen61qd0BJFU9/75dfXHrPIImlyR9PZN7CiSuNspq05MvF/Kr+Or/LvYEMtoc+XTXPVHRieyu+rxKW1SmYM9gemRHhck5S4OOxHpcsxVPYEHLXahCnNkUoXW/JmCPYo03CYGjElrZOzlDxSsm4dYbOj7PyedHtx0mPAZGrl8k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F8OF0rN+bur8CUV2fWBNTV2srg/spBjU+tGCgnzhK1mVN0jKVALe+UdpLCS4?=
 =?us-ascii?Q?xxHxB9eZcrozuqIr2JJXNnR7ahLcd1RhzJl5JFqA/Ul5Ytdj/J6NQfQTQLcl?=
 =?us-ascii?Q?1RfxF/OBhsgLMffIoa5LTAXETe+kYCPbh+QjkBxtfxzKPMrWlzDmL0XcuVvB?=
 =?us-ascii?Q?p8rT0ivTJx4xhqiaWVfkB403P4FMsdXIPfqpsHwwxdkphhs8DY6RNoEEBnHb?=
 =?us-ascii?Q?C+FjGP7+egvG3VSB03pxdB8L323Hq7NcxcuaKep4RnXELDQeS3CpXy+L0Z2F?=
 =?us-ascii?Q?X/OlXvTbsKEn0EpIaqqitYwjCIqmfptDvlZUQA6a4PQxXjm7rtiyVnHRNN2x?=
 =?us-ascii?Q?ZsxH4fs114LT+SMMBVymjRKVnjh8zqIPq9qMf4nUJvfgEslhTVRLNCb32bll?=
 =?us-ascii?Q?A3sE7R/jm23pMrmZggA49jH4cR2e5dypnClJ0jfqWepy0XbY/UkAbCgoQtNt?=
 =?us-ascii?Q?ItURYhhbkIIx5MLtlurtEOKKRPdqEeeKslhoXQASGIkjA9f856/ecQyTJY0A?=
 =?us-ascii?Q?te/60Aw0rpri1PkB/Ds22cx+YulxZq6U+PSaAoFZQEv5w68b1wlw2dsHMSCV?=
 =?us-ascii?Q?ANdydnT/l2Z+O3VwV8qoQRlphIuj9c+sO4+CfyoI3gspZj6TnWvvLjAvhs6H?=
 =?us-ascii?Q?Acot30o2ok7Tr72qbXyZxO8a2bqsF7Iyxpy1PzXyXBMuv50X4YcFrMyU794F?=
 =?us-ascii?Q?F2q89t1aiQfgn7ySEePDlL0Qvuf6y+mIiXK9bqtncOgs4J2sxZW5YTyQPumD?=
 =?us-ascii?Q?yCpYZt44gUaeoGTrAhJv8tBvaJ4jotPbKFWC/N62HphK2zHxwuzca5wrTxTk?=
 =?us-ascii?Q?giQlqVIIG7lMEQXezsnFazHnEBCp+gMUmh/P61Dh1BmT9QxU78Ec11RCH6pj?=
 =?us-ascii?Q?YY7MNv7PckR5Zzx2vBN8nKV9Yb13cFP54oYTHS3AWVPwp9Dm6YnuywisyBh0?=
 =?us-ascii?Q?ouOPTmvKIc8jlN5GKifzy3J4QBs92eK66gCg9Jjc+Ct1Nmi+EOXWnxUKYH3Y?=
 =?us-ascii?Q?qRGUKybCDIUSmdcvgHeR6eneUcoTtKDKKl0yfuqsgXhg14+WJ+mTaEneLkud?=
 =?us-ascii?Q?YVn17pFcLthV1jOO9/ChqwBwe8zl64miN2a1JIYfDQhC1hT3hMeCIQd/oFn4?=
 =?us-ascii?Q?87MSCs4KDPa3SRIRw/tgUNT3Yq+SnMCSWrMqzC5Px0Rm9Cbo7cdP1s3NQQaX?=
 =?us-ascii?Q?MIjwEVjvG8xOqEEmrYnmhYvkcyxn342aOM6i3+b3tlUBOC9t1pzVHdobwBSu?=
 =?us-ascii?Q?K8GsHONdpDnGRZThxpgv2hj/C1+tD1AF+X+65cK9D94fOEFyTXk4PkpUYXa0?=
 =?us-ascii?Q?yl2QJsLEN2cbogh/yLjuNHp7T/c4wFwiahAVHSLHPHa6M+g70dyMCSI0V2sO?=
 =?us-ascii?Q?aFkIJG2TWbNmqVBguQyWTWhYiCsKnafZZtSFPyHhqVhsutXHos1k3IfzqCSD?=
 =?us-ascii?Q?pTVBCd7bxEoQvNsHrxtUYQcCkwg7ZZ7Gp6yTiEMfvXJhaT623t2caohF9A++?=
 =?us-ascii?Q?0fQV6Rejmxv7ZeGLLFIzQsRcSEPgYrMvZPKI6DqFpK8/ETToSd77aNNUvxBX?=
 =?us-ascii?Q?b88ZQbcZuPf8dfgL8ogFrKUVQYdNQ08Fyn2fMrC1gCBiocRm+1EdxIKXutBD?=
 =?us-ascii?Q?wevExgO7PDU+8So0c5rgQhwlIQgXYDRzdaXeXMKEjj8SrbXiOrCmON86Dz9h?=
 =?us-ascii?Q?NkvXeQ7Ef2jQVdmasS8dthxCDkRYZGQZJVA8WM2QhgdTbewSmLOxanRwYV/y?=
 =?us-ascii?Q?gPH03lDb5GkHU38EaS6bumxLIp7l+tgN1nTWC97Q4q/RD6+j93+RwZ5muZvB?=
x-ms-exchange-antispam-messagedata-1: kGBLVOHpjE6+Mg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hSZFuz7It8iZ3xqX6tUjIN9ABAJ9PJrSg3AMEjNffeR+7VWKFJkNHuYyKM3tdQb7XGgzPUdmmyoCFqA4PuyxAIUHcMKZviBLHHt+lzsEFhmB2UUx6dtHHbOw/FazVnYWPq1WDoOz4YevfCbW6rHFyW99PmIvK8c13KqRwe/9O91/DAQEjDeRFLzXNlPPaSXELCno1yF1bBVNxW+TZ383Wm1TQJkoDRjAecFvwGAo3xsqOKJj4lSJFhmuEGuVf1ewV12czM4qcsIn9f11xJBn6RHwvDxb3HYTMxE6ybaYSAbjARi7hAEJUTYLT74ca4lxVEgx6/lFGJ7QfIaNyCFwSA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20b8a74-339d-4254-ef39-08defcef9ba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 06:11:57.1684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LoN8E6GBbx8Av7N1+rCUZzz5+5bb70HFOjFGdqSEBLCHfaQFJT8lVyy8ixLUeDw07ir4NpbEOimLUuY6m/et01sEXNj1+qXh9/2vEfWYTMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 18 August 2026 10:57 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor test t=
o accept
> shader function pointer
>=20
> Parameterize test_prefetch_fault() to accept a shader getter function poi=
nter
> instead of hardcoding get_prefetch_shader(). This enables reuse of the sa=
me
> test logic with different shader configurations (e.g., L2 prefetch fault =
shaders)
> without duplicating the test function.
>=20
> No functional change for existing subtests.
>=20
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  tests/intel/xe_prefetch_fault.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fa=
ult.c
> index d3b5aff47..e86cd68d9 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -117,9 +117,11 @@ static struct intel_bb *xe_bb_create_on_offset(int f=
d,
> uint32_t exec_queue, uint
>  	return ibb;
>  }
>=20
> +typedef struct gpgpu_shader *(*get_shader_fn)(int fd);
> +
>  static struct gpgpu_shader *get_prefetch_shader(int fd)  {
> -	static struct gpgpu_shader *shader;
> +	struct gpgpu_shader *shader;
>=20
>  	shader =3D gpgpu_shader_create(fd);
>  	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd,
> PREFETCH_ADDR)); @@ -130,14 +132,17 @@ static struct gpgpu_shader
> *get_prefetch_shader(int fd)
>=20
>  /**
>   * SUBTEST: prefetch-fault
> - * Description: Validate prefetch fault and hit-under-miss behavior
> + * Description: Validate L1 prefetch fault and hit-under-miss behavior w=
ith
> + *		L1 cached, L2 cached cache policy (fault source: LSC)
>   * Run type: FULL
>   *
>   * SUBTEST: prefetch-fault-svm
> - * Description: Validate prefetch fault and hit-under-miss behavior in S=
VM
> mode
> + * Description: Validate L1 prefetch fault and hit-under-miss behavior i=
n SVM
> + *		mode with L1 cached, L2 cached cache policy (fault source:
> LSC)
>   * Run type: FULL
>   */
> -static void test_prefetch_fault(int fd, struct drm_xe_engine_class_insta=
nce
> *hwe, bool svm)
> +static void test_prefetch_fault(int fd, struct drm_xe_engine_class_insta=
nce
> *hwe,
> +				bool svm, get_shader_fn get_shader)
>  {
>  	uint64_t bb_offset =3D BB_OFFSET;
>  	/*
> @@ -191,7 +196,7 @@ static void test_prefetch_fault(int fd, struct
> drm_xe_engine_class_instance *hwe
>  	ibb =3D xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset,
> bb_size);
>  	intel_bb_set_lr_mode(ibb, true);
>=20
> -	shader =3D get_prefetch_shader(fd);
> +	shader =3D get_shader(fd);
>  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
>  	gpgpu_shader_destroy(shader);
>  	intel_bb_sync(ibb);
> @@ -225,7 +230,7 @@ static void test_prefetch_fault(int fd, struct
> drm_xe_engine_class_instance *hwe
>  	ibb =3D xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2,
> bb_size);
>  	intel_bb_set_lr_mode(ibb, true);
>=20
> -	shader =3D get_prefetch_shader(fd);
> +	shader =3D get_shader(fd);
>  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
>  	gpgpu_shader_destroy(shader);
>  	intel_bb_sync(ibb);
> @@ -271,7 +276,8 @@ int igt_main()
>  			    hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE) {
>  				igt_dynamic_f("%s%d",
> xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance)
> -					test_prefetch_fault(fd, hwe, false);
> +					test_prefetch_fault(fd, hwe, false,
> +
> get_prefetch_shader);
>  			}
>  		}
>  	}
> @@ -284,7 +290,8 @@ int igt_main()
>  			    hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE) {
>  				igt_dynamic_f("%s%d",
> xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance)
> -					test_prefetch_fault(fd, hwe, true);
> +					test_prefetch_fault(fd, hwe, true,
> +
> get_prefetch_shader);
>  			}
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  		}
>  	}
> --
> 2.43.0

