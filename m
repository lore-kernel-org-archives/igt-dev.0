Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA47BCA5FFC
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 07:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B87D10EA04;
	Mon,  5 Oct 2026 07:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2qm3Zcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC95D10EBEB
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791186847; x=1822722847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aRRDNWdyg5E5veCHgTtvUg/fl0B4Qa5qCc5oflqshX0=;
 b=H2qm3ZcnCqE7DhO5boXYDehmzAdn8qiOat9TJ759myftDOLPEiHGD0M7
 ueIa9teGXYC0tVvEta1sTYlptPogQRjWkx90UdCFhEUc0iiNpvwb7j/aC
 /Ot4xF/dgRxK7wsr0uiEhsjnXorfUMHV2z+iNYBboIbMhhCRA6FkTFcrh
 hV96VFonKjbAv/wYbXNckkmqN9o0vD8v+uqk9aaKCqesz53e8v96/zjH+
 hJzSuVuZixoKk8HHr1Pqun8tRzhtEIst9t5c5Tbh6nu1zcsXWAnxKrIho
 xGKgWVN50iXk4394ApnEfQnUg4lQIsAbC/3R8FokigYI+jDDBdk7jMT7t A==;
X-CSE-ConnectionGUID: 2ivSPzppSYm1hX+BaD55Ww==
X-CSE-MsgGUID: aYOfDzRDQv+OTmjNDAuUVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="79409670"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="79409670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:54:07 -0700
X-CSE-ConnectionGUID: OS7H7Us9RFm/Ah5fAMty/Q==
X-CSE-MsgGUID: ZZMXShAPRNK5lLCoHab9hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="280028379"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:54:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:54:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 00:54:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vy3jSabmoiC8zYh9pWVfpY/9yY28IN50L5uvPnbPffDUFkoTPaoayr7iewnJIGBmiDK8RTXUZ3IEL0UZpdcxDU1wmOQgXb6gfPB5BxQcIeWuaKHWm6KUEo0/G+aVBRi0Up7jlcaYvCUknvhV8KR3T1PyX2quzwmSyTXt7bNen9GJ6imQ3xEFoj4VoB/SO8vTlPo2HYI/Kl9wWuxgRuLqXfxZASIupidn2BY9wrCeacec7Xu+wLX9GPwTond23hHXi2qRqQlSErsanxnatfEGEu3VxEzr8nFyvTPPfvuzPuD+oe+tnSwu7oh0DxoM573LJG/4jMnCsEIDVeGItWTesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNxI8x2Su508orl/xzlkCVvDJapqpb55VBnti5ieza0=;
 b=W1Y6aP6cXkUF6qQoxo64IJ5tI1gjZiB94ni0NJuM7W2gr+b4DFBNkahG2pnQxhszJQ/l0ZxLVlNvjkzsLqoB3KfSKNtPeBLfZVhxbCnouQIjl/d/3Y72PizGipBIVHo4uNbCcpPVrtquz7xvhYdnMv8qAG8HvZslOLAT+vRmMSCU7nOEsIUMnlMzQRitfac/jzuBjBgSdGgE4pxJ02birsFnqMK7MtTvtSnVk6pfSX/zGXPqhxAcnFjFzjRpLCdvUiJ399gc79OWmSLudWVHdc/x8h5gzo0FS8bf6lozHWLlbdEGvQ2dT+Uwy8hx8vSSQnrwUmjaMzt2oE/SSIoZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 07:53:28 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0%5]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 07:53:27 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_cw_post_sync: Destroy exec queue
 and vm on cleanup
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_cw_post_sync: Destroy exec
 queue and vm on cleanup
Thread-Index: AQHdTB6YzAuJrutBvkCpBCWHvN+tsrbupM7Q
Date: Mon, 5 Oct 2026 07:53:27 +0000
Message-ID: <SA1PR11MB8428275ADA23833DA041048A8D962@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20260924120438.1485077-1-dnyaneshwar.bhadane@intel.com>
 <20260924120438.1485077-2-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260924120438.1485077-2-dnyaneshwar.bhadane@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|SJ0PR11MB5104:EE_
x-ms-office365-filtering-correlation-id: abc013f7-7eb8-4662-a3f5-08df22b5bdda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|10067099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: zRtAgIhIZYWvkPfQg2dU4m1tUB9ApgCTPMxBRdvNvzQ9sR6DNLBAIIG92t2pphVCMbu4RQ+yNIGowveLWWRAd5nys3W5SVEfI/BNNT1pRuGrtMVx/tD4Eh9vIyGTU3HJdgcDbq/JfO0oVzzzMVr0uimL3kCbuGKENi1aomVnFCu6Lo8lLrawueJTyY+CoBOjxLovhktDpwjMKpD5zX79MJHlgYb3z8ldUXDwqW9W5MU9AEWRrDyYIuBwy02RqxLhjJp0oFNLIf/PFpBR0vAOcLW9zaTl1oj+xNNBhFm4MoaAZObnBrVgdD6eNku40WETLXdHuX344yy7LH/EHDo6S8plt6cEI/5V3nrkU0TL/L9Lw4WZVJl4VXAR9nAiSNJYEfgnnzeGjWfvk9AO6t8JYTA8gd9u1C7RVPhS0guEtWj8bC1N/3mdxO3A6S1wU5+aRFC9ri6eJKmDdQaEsgMZ+G36HfGB5BaJ7u9SZG58KxLK/j0acqeR5SSLQul9lehjXRZrHg02XxGY1UeZ1EGNfA2z8tj7/P7CEfaNU+6IuuPwn8HqwfS95UPti+WJhHFdRLiZP8RlkflO5n3y1gcmksKt5wpPci5oe0Lg03U2RKW+DULZtMvg05yg/ES+JuILIfnvuIV4RFt+rRMvzCT1fyha/gWnCUXCDtD3hkpHt+6fqeQKI5YybbVpgo8NIq/LljkJPPUo//Swm3i5n4SKaEpmvvoK7souORahtzGteWI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lurSf7v4YddeC0Zcm+XHbpxwOi7ThOQd66bp8SQ58RR5MZ5vgp1+df9zAICb?=
 =?us-ascii?Q?eXILIPqAA5DyuPgMpTQTeW8PYIWnuN+lKWTDK/bhNy8pGFCLcJfSfENVuloY?=
 =?us-ascii?Q?8WqC+Htl96yF3raIDrrAD6yqnKrBOe5saDRZxisc9x4VR7gLdBxsv8+uKNlY?=
 =?us-ascii?Q?dyaGG1aabRy/0CJUH1zLONEzb9NbdKLGIsvYx+6T1cFpxWzcBbPa7H2BXVN2?=
 =?us-ascii?Q?wsf3HnbKvdEyeMRqUj4TW/maqYb0GSKCxxQbhXqrMbxfZbGWsjKYt6ZPYFN6?=
 =?us-ascii?Q?FgBmq3TXdT9D7D1nVnD/zV1gmkAFZBC2kGShJE3j7KTWmDd+iy/I+FLEiDFh?=
 =?us-ascii?Q?mbVL1PFYEJBeGGMSVayiXPGcgPWXuakSUTreOqlg+4aKaymr2sdDWHGNmED6?=
 =?us-ascii?Q?Ug2MEcTEI4s0o+VrI56TLG+4/CLD4soHfJjf7YUWEkAmKUvZq/RySc2h8ey3?=
 =?us-ascii?Q?53/Rn6DNw8YrPh1uirIT0XmwBghJM7bDQrwA5usjwPmdgH8W3H6x6/3ZuxmD?=
 =?us-ascii?Q?ytjOe4ru8DicQkJybEqcp0G2yNJvYXaVRT/O4nuKwRrHmOvpRNMOVK2GHuz4?=
 =?us-ascii?Q?Hp2nK0MnSkT18bhkqc51ClI7RI11PgpcCJp2RRKQKKj5DSp6xTJmceD5H3w8?=
 =?us-ascii?Q?2J6BJ7WKWYUOBZ5RU0gzevc8A7B6xAEcYurBXRq8F988/PoJ5bNsHikcS1sR?=
 =?us-ascii?Q?7hMYD9YBaWFAV7oNWW9gCSMZuZqLwK1VIsikLSj/YNuR72E4eckjP+1aAeGe?=
 =?us-ascii?Q?iyV9WOY1PSRvY8F0RncI77b307KXVJ68cmkFX7McRMg3GXsvtRwTvHbjpFtI?=
 =?us-ascii?Q?LCB42TDgpbZ+oV2GdhbqCr6klFtr62jdvMPWNxU7AP78Zv/vanavmLi/t2V8?=
 =?us-ascii?Q?nseGYgusWzvWeGi66ivOp6YBOkPShR2MlsRXha63w42G6OdBBIFKTEck4vMH?=
 =?us-ascii?Q?OKlq2xKQXqSPC7VWV7Um1dL778Yjakb4L3dso8UhP0pa5abcI10AWj6EiU4Q?=
 =?us-ascii?Q?cF+MZT7+ryE5nY3/KK7I28r/cDaiTXVwiRyaavV1x1F4al09oqcEay85NoiO?=
 =?us-ascii?Q?QDc22OJHyr6e/tC5ghlvnJ3Wjai2fRsArQhKWcEOCDQV3Gp4ttW+TggOoRcV?=
 =?us-ascii?Q?75P0GCP6ND2cy6taNPsT/mw88VvoFZt03vDYrWEmjyIwxkP3CXzOEkxeP1ft?=
 =?us-ascii?Q?xjAxaeYZQiVjhoH5NC0I784tA1IQGeYphWQ3GprkMdcJBR70HaND8Hxh7UMo?=
 =?us-ascii?Q?vXh32FgQcLKB0+OVTSVkMEcoxfatitLS82coiZaMooivodEhRVfchjANf/Ww?=
 =?us-ascii?Q?mDbX2glppbL04PQjyeeTfTC71NYIPjU4lhlAwz/7S1vnZjdRz60vRzCd7g3D?=
 =?us-ascii?Q?XzXL1qv2N1skRllX+8Cuu0cAXZLgjezL8FYrdDxU90yGEOZKloIO6L6+N8VP?=
 =?us-ascii?Q?Gqm+zPJCIiMhlrf7lp6DfTbbDv8Lpvd4LfN5oPP4W8/meC17uQ6WNH8D9slh?=
 =?us-ascii?Q?uV1yC/JEf8AX+iA1+zK9xCnhkWS90zHR0yT1C342aG4hBCfl5rZUuYDhKPtJ?=
 =?us-ascii?Q?lO+oS7hSfTnQUCzs1pNVlRGTh359OY9HqXsjs4kz35xK7fq9Uv1z1Nk1C+ed?=
 =?us-ascii?Q?2VPW3ErR6nSqCm/S7Rb31gVn+LM3Pl9vhMBXUAttH1OBHiRmhG2FGa6BIS6F?=
 =?us-ascii?Q?A/owQIqAsHYpVlTI2MtrvXVMV6MRUasrV3xOc+bsiFGN4Ot6Hkfk59/e2/i3?=
 =?us-ascii?Q?Bum4rj+dSA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FAf+kunB3MbAcBg/LwzXN3WGwT4KizHGfjcIXqqwibZMW7aLSOGoEnKp+QAKkfpzsFY2ElH4QM52HSfNpByOvZEbZntp3CaVENcA9JChImVklp2xa5Xm0/fq7RHAS66QtWyOEdhnFwYQH0AE/FIjrzp2Pz3d5qefaNTM235wzWkm+I+RBQgnBKcV8L8zViUNy97mo1QVl/64e+as01xJCsgyAZiU1kDFbQkZajV37jcaaBfxxYMZKg9PoWA/8m30p0Qab/jh5MuSU2fgd47vEiSmXpbi9Jno7tWyW8Ok63oFPLK9SbCVVRKNc9R2PS4QP3lKfPxOluk4nl27oM5lNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc013f7-7eb8-4662-a3f5-08df22b5bdda
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 07:53:27.9004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IvH2uT3Q/XI3Fs2DY1q9/f1HYs5cTV21ZkHtsxj0j5AV+lfzGRUFqlChLqFdxRHkqq4qiClUp9cb1IBtr3cvFAWbp8dw3npsfOqIYvQloLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
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
> Dnyaneshwar Bhadane
> Sent: 24 September 2026 17:35
> To: igt-dev@lists.freedesktop.org
> Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/xe_cw_post_sync: Destroy exec queu=
e and
> vm on cleanup
>=20
> In the test_walker_notification() vm and exec queue are never destroyed a=
nd
> leak on test runs.  Destroy them at the end of the test.
>=20
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  tests/intel/xe_cw_post_sync.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_cw_post_sync.c b/tests/intel/xe_cw_post_sync.=
c index
> 1aa2f1313..2e7224782 100644
> --- a/tests/intel/xe_cw_post_sync.c
> +++ b/tests/intel/xe_cw_post_sync.c
> @@ -272,6 +272,8 @@ static void test_walker_notification(int fd, struct
> drm_xe_engine_class_instance
>  	pthread_barrier_destroy(&t_data.barrier);
>  	munmap(t_data.post_sync_ptr, t_data.post_sync->size);
>  	intel_buf_destroy(t_data.post_sync);
> +	xe_exec_queue_destroy(fd, t_data.exec_queue_id);
> +	xe_vm_destroy(fd, t_data.vm);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  }
>=20
>  int igt_main()
> --
> 2.54.0

