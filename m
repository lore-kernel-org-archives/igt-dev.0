Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C0C44512
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 05:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDAF10E40F;
	Wed, 22 Jul 2026 05:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OT+4Wpov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5BB10E40F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784698005; x=1816234005;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6VIuOoGc5ZW6kDaxL4R5+VLvRPg04TbUxBknKvb00XI=;
 b=OT+4WpovXHzOjW/ZMvQAqgQrf1rIBmuKNlI04KSQk8Z6foSzx8YUvrgN
 NoG8HV0Wv8XITjvTx9gjBo2/R67Qv+pI6b/M5mSpYu2QDPwQIA92ADRXo
 P9CdFyeF+dH9SSyw1tJP9jNtfCIqPquwtyPNVaqK8reImvKokPDsFe/fE
 CEcYVEIpBL9bAJz79K3FIkLwiTfLbtPztGMpcwy9LCMS2UHLhHjFPA/tx
 IP/pwT2Crhv4oOKXkTi1pEDM2LFf4IcW65LDBK2uPnuM/nUtbeOaEzufs
 L4GJgagxs54ULUKqyGd0qvjrggclWGNEMufLOjNLtycVCS3onh+ISLlrn g==;
X-CSE-ConnectionGUID: eAGdhjpOQZ64dwMSyhOuPw==
X-CSE-MsgGUID: PhtRSrCvSY2z930QGt/P/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="102868291"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="102868291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 22:26:44 -0700
X-CSE-ConnectionGUID: SthHBvDoQMeLcbC1d4dAPg==
X-CSE-MsgGUID: 1bC1O1EUR56bqQYf2e/tVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="254074580"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 22:26:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 22:26:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 22:26:44 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 22:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1CppJBC2BzJ86NxNsCAxhibpGmtbQ/YYM/1StBQbhrH4aryZkMj1YcaPfg+CkPMfG9d7P+/zfxXxzjhbRewk/v7tpiK0V8mk2TV+h5GzJtNWwCkk4xvwD2WFcZ0rBGF2ksaRMPnRmtXBybufg85s3OUygnvzAvksYYuLi7J4DYgiJmUGoul0EeuY0Gq2icHPJe+vLtM+qN+cRMYeJloyQ3/wsVB/csY59aov9+dU79rPjbz+Ltx4xfymCk0SKFG31sIN17dbJ975F93piXctGvnFUl1Dj8kCjArpHqGgM1k6HkanmXMAP+mlirzD4y6rfoy183YP2wLj+R/LkC9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfG9v9Qjq0o9vil8G1XjXeQjOqaiqXduygkfDycD3H8=;
 b=ockXfMFHADsehl5mKgd7qQ+bpoIeBtSqRwnKkcwj/BQ+xDISffpPzlplcsqaXl2KAeqDvy1Aw1nkeXBhAedwD+ehDyA09co/VaLyJPZyQLyJsUZjUvkWRhLJKqwmwA/EGwfUMSSg4PnzPHZD30Ttm1F2C47tpRpbRVEuNyEikdviqqoJyAd5BW5uUBBQuLDM9KFCqLILTaJvsMp/cXVA7voyEe5OS2GAD+pJ2bfalCnanFDFp6nY5A0Q4dKsiNnv+t4VhtbQvKerXdD+OVb2b2mMdbjOwAsUGMw4WmlpT37uQxaSOKZPvJsN8Zrdjf6UxLF+8iEx0tu+p6LFsB0eSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.19; Wed, 22 Jul
 2026 05:26:34 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 05:26:34 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_threads: whitelist expected
 multi-queue hang dmesg warns
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_threads: whitelist expected
 multi-queue hang dmesg warns
Thread-Index: AQHdGRGU6NeqZCzvdEy3yEU+o+rWC7Z4/9yw
Date: Wed, 22 Jul 2026 05:26:34 +0000
Message-ID: <CH3PR11MB8434B927E911FEEF3FA07A808DC12@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260721130405.25573-1-himanshu.girotra@intel.com>
In-Reply-To: <20260721130405.25573-1-himanshu.girotra@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH0PR11MB5831:EE_
x-ms-office365-filtering-correlation-id: 493b2909-ec98-4132-e764-08dee7b1cbc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|38070700021|11063799006|10067099003|6133799003|56012099006;
x-microsoft-antispam-message-info: IbY+alKdlaYyRZHWZSXSeb5SfCAL+MVtBRhwkVMHTZvTTlJOhTP3MD+/R6EvresucZYJv14OchiEjy7nhoVFh8wVHQWCMUIswPceWBFp8FZtzpX6MnXToJvNj6PKi/1RJdBO3FrW2YoZIy3jP6PQFQSOZi5ua1w8zIpU3TJ3q8GAiXzF8VAyBAJtnuxBpmsjEn4ef4FwCooi3jXXy2sKkYpSKtFaSLVRVpm2zE0mXOj+04sMx2grvoGRXf+nAKWZ+uOmEKy7Gy4xrl9/8gz5riw8hFO04mr+m6clpVt1ecBkqkG+D1hggmoWwo4C8Xjn37q96L8YzjnkUEcmdVy8SFkBgJRBhfPORQoAbJeqVNTE5+SND47UYkSGxlOGoFf3YJca2sYmpOm/UaWh6aOptIBHHqek0p0oQQWpprr8WJXWmXOC0SQ53WKMs7c4i3xU5nEII7Nedi4JyuaZrkmG4XVZwuPV2DHVy0FN7mnQor29dOXQeOw94azLdxenUih9iyqEfPirKsmAzJil6AOAzKKT29YVu+78t7r+jJhSh7+YmT4Ua7ZlM9YDoQAKmf1av48KxXHQcYNICY8E6WVtN9ZrzW6llmix2z58a1RMkprrJ6fdoigTWCwbfLuGnvSH5UfpT7cBQAPu9o5H56zELL/IGH1Rgeh2IblqzGymKUSgYDlaC4gAFuEXuA0c1Ub2HaRQVc5t/U63Sk3atQ9iU+8nFCNhaV5jM0SPmYBWYD8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(11063799006)(10067099003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SPOr4WU90M7nEYfGO0L8ATtoBkdTDbXi8sN2lZNzew4NxzNs5jHrJmtsDj6I?=
 =?us-ascii?Q?K+HZLad/nF5KGIoghSXaDPq9Rhea7VNzUEZAz+cP1D96SPdgxoPTVPuDDUlt?=
 =?us-ascii?Q?wmRVAQ2Pii7k+vjyGTqmC0KYEd22Mkhqr/AOOAEeXsOEpDp7fyEIsYUFRKaP?=
 =?us-ascii?Q?MSh+zBfNfLn1xC9tvmczzY6MkMBT0hr9rl+cuVmD/Q0zWb7mi6UnvJyIGHDX?=
 =?us-ascii?Q?vYCdZQUHCVOKrs5Syd8ZHQvQr6YyXHw/Opp4TEOPZt3zsa8R0B9CkQS4ax83?=
 =?us-ascii?Q?A1clQxH6MJIdm+RK2oj2/sXgg15if6Q8KDt9BhEqG01vFR/len4DWu0Vv3dI?=
 =?us-ascii?Q?rsMuc8rCj5uYyBAIAqYTMBIXfnzs+3pK9DqustJEqEKckcXmd3R+GHq9NfPq?=
 =?us-ascii?Q?qOMKtVOaMhcmXZaOxplBSX+ITSoyoLKL3UPKzGdURQgyL7E298Mdis2Vvl+I?=
 =?us-ascii?Q?uWzRPgXqk1oHJRn5GBPIZIxKsuyHY9+CDrevT4TnWHKnvB3QAM50BPbbelcX?=
 =?us-ascii?Q?qBYqqb08q/pPoMTe5BSecNXAu6NUeCiixrFK5+Ff/4O21qDg/2AA6ffSCQGR?=
 =?us-ascii?Q?ugHuVokDs2wDAKR3yhYe5GSejeg6nmDlbXNL0JVhSXec9MxecwGlcGj/PAIk?=
 =?us-ascii?Q?H78EJtF7oSl4dm9sv7RSoi946a5uJlVMNRaUQlvV3lyFfnGtHF7HP1vnoJ/7?=
 =?us-ascii?Q?P9xkvhcWA9Gkv6jZBNNa28smo0sLmMLL9oQPlUCxjibiT7MHpq00voDhSTab?=
 =?us-ascii?Q?COHXCvVbsLwAcL70iLVeekIlo+J833aq5Gq8H6Tl4P/iysVpmkjzq1uUq1Kg?=
 =?us-ascii?Q?swRDygVbUHM4gC6lMXqV1x35A1ZscY4SNmVFbNy9+4t0d7YIkAwnLyFiZsh4?=
 =?us-ascii?Q?+kinOgPIMvB4DfO9BpEPwMfKlj0n7iCjAf0RM6VEhERpzfFHiulh2GoRrgOV?=
 =?us-ascii?Q?3dRTuid2UhVXFErIO7d7SgWxEl9zhm8tMQE7de5bkKR0zAVB8XPEuGQ3wYwP?=
 =?us-ascii?Q?J924hYr5uYJUVfPcaDSeslGW/CPcD+ycl8hnR3Fn7yB42FCYz57wkIUGavtc?=
 =?us-ascii?Q?3SYrW2FjKpGwx8kkc8g7oJRphKH8zJZjpPyLuf7PxhrGCqzSc+Tixhx1mTEd?=
 =?us-ascii?Q?4y2cdKL9JwmGTfD/sABqqVwvS/6q6v1W3yxvlQl1nnK5Ir3gHT83qp8Ezpuc?=
 =?us-ascii?Q?9CjsCERxnGZ9gQPSopui4DfKplMG6Ob5emU5SzsnHYRpH0yVbTV9kZiBeVyv?=
 =?us-ascii?Q?LAbibJGqdwOx8nq16vfSvXqHQrYxSeJmBFAQI4Za2hZZm6XwW/p7Kl6BxIJX?=
 =?us-ascii?Q?srKPg+KPhQoEKMantcLfCVGIH13+L3TqYDFGyxes4wNSprDtnpIQJcdYq0Tq?=
 =?us-ascii?Q?yelqkRCr70TrB/UmAhMEAfuYT1BoGpsF6+04hI9ZuctoQqfhSKCfVJVv6C7Q?=
 =?us-ascii?Q?SYhva29RBVW901L/V+ek099cSuUdpoo9p4n6AccVp4o0rubSPsYYFRTEb8xo?=
 =?us-ascii?Q?Hsz5JN46JWyblZpKpWkaR/nr+vlLnjNZedMmZHH3K1LWXQlfHk/Da/vDXLCI?=
 =?us-ascii?Q?gt0BNrO10/goOCeo9m60dnKmriG6dgT3Z4z8ZcTrrY8mlw+Z0V3+3xZJj6HB?=
 =?us-ascii?Q?tb7BOekd/nRUxmmJFgEzPqDYp4yTnTFhwSoNzfDzLAPppb43urf5eNlVaimC?=
 =?us-ascii?Q?300/UiS/DELBNuM9JWr5MCwd+hbtujbecDwPyy11e3gc4RcAssgPzjKE3lQH?=
 =?us-ascii?Q?Q647068p7X6siLuA2ZlteInWzZXF+uk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hu3hIixWtQsm9TjY8apyyRcf3ApOV9AmQf0BnBuYNI7lvx/Y0hKXcESKPFKDRiUoKSZQQr4bI/IgwD+x7tb/d20MzEbAn4mAaB1GWmYP5R+CMcOJ1swU2FIm0sGTUp03cHQSlamhNgpxu4t8nvEfyvv1kCpIeK2UTkJJkso114I7ZVRkQKQTCTlO8xshpRLD9V9X7AX4pBe5gQx9zskZMnhURzPAJxHUW8bzXLkQCxEoD2trbHd8bnRZTn/BVbtcxGKwEaDjKrA/0fp+IOEaXOW06CqfjjOCfBxius8csMZoM52+7jybxFWPsGRmmhuzG/bdxuEzwnMKZ7g4S4u8og==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493b2909-ec98-4132-e764-08dee7b1cbc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 05:26:34.6058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9SKnSnO/n9NXCl0YoSXvcKUzMInIP1wBg/zlXlgTTiUe4E1odhkMBJDTWTSGDITx1t1f/R0Ovi6oBOxDa+7mXRLIBEc+XaPfNXiJoXe9Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> himanshu.girotra@intel.com
> Sent: 21 July 2026 06:34 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] tests/intel/xe_exec_threads: whitelist expected mu=
lti-
> queue hang dmesg warns
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Multi-queue hang subtests hang one queue and reset the whole group.
> Sibling jobs that never started get logged by the KMD as "Check job timeo=
ut:
> ... not started" at warn level, which shows up as a dmesg-warn in CI even
> though the test passes.
>=20
> These warnings are expected for multi-queue hangs (single-queue hangs
> don't hit this path), so whitelist them when the subtest has both
> MULTI_QUEUE and HANG set.
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c index
> 0480df779..21529e863 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1468,6 +1468,19 @@ static void threads(int fd, int flags)
>  	pthread_barrier_destroy(&barrier);
>  }
>=20
> +/*
> + * Multi-queue hang subtests hang one queue of a group. The group's
> +queues
> + * are scheduled together, so sibling jobs stay queued behind the hung
> +one and
> + * never start; when the TDR resets the group, the KMD reports each
> +unstarted
> + * sibling as "Check job timeout: ... not started". These warns are
> +expected
> + * (single-queue hangs don't hit this path); whitelist them to avoid
> +spurious
> + * dmesg-warn in CI.
> + */
> +static void ignore_multi_queue_hang_warnings_in_dmesg(void)
> +{
> +	igt_emit_ignore_dmesg_regex("Check job timeout: .*not started"); }
> +
The dmesg warning is of similar to other hang test as well and mean the sam=
e, but the print seems little different
Tile0: GT0: Check job timeout: seqno=3D4294967174, lrc_seqno=3D4294967174, =
guc_id=3D18, not started
<5> [1657.623342] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job: seqno=3D=
4294967174, lrc_seqno=3D4294967174, guc_id=3D18, flags=3D0x0 in xe_exec_thr=
eads [26621]
Above both lines mean same since this check job timeout line being caught b=
y CI as dmesg warning it's causing the failure and should be suppressed, co=
de seems correct
But the commit description and comments should be generic and in the above =
meaning.
--Priyanka
>  int igt_main()
>  {
>  	const struct section {
> @@ -1735,6 +1748,9 @@ int igt_main()
>  				igt_assert(!(s->flags & BALANCER));
>  			}
>=20
> +			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> +
> 	ignore_multi_queue_hang_warnings_in_dmesg();
> +
>  			threads(fd, s->flags);
>  		}
>  	}
> --
> 2.50.1

