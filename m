Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA37CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315CC10E4C9;
	Thu, 21 May 2026 14:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WElq4Rvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CD910E4C9
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779373658; x=1810909658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c9TZOYPcnMQ6rtaDEN+gXOufRHV5lXgkWpNdU9YQehI=;
 b=WElq4Rvokm5re2EvXckBXAdFQSJjCoKX0WLf6PGfHK9OWAgwsM6+/apw
 IAjiTzxyxatljZ60rwH5OYogNhZVDjh00X8URcjDk8/e4VfS33KTty9DL
 TXCHo/LnIv1rAV2NIVbQG+MigYuhifm86IS06o1ZJ/xhVlY9bQrpqY53R
 OURqALgW2DFRU+BFlEEsUdA9cx2eVdYBrv0lru1mkUi4OU+rv0Il6tCKf
 yVS/B3e523F2A2/EPcjTjWJ9DLbXvN/e1dKy7vv3ghhFw33Ka1OXs48Sk
 OCtpRwCJPlBQEHBmMiKmKpJxZb+kSpqbDtuiP4pNW6xx4Z49JG9Z/OETs Q==;
X-CSE-ConnectionGUID: x2++4j4zTdKPcw5LteuFqg==
X-CSE-MsgGUID: /6qIneVBRaal41lQIFegqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="67816734"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="67816734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:27:37 -0700
X-CSE-ConnectionGUID: XgvekVRHRg2HbYltKtir2g==
X-CSE-MsgGUID: Orz0BynrQLyI//MOFzXC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="239691069"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:27:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:27:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 07:27:36 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY1SmYnlDd26M0ss3jV09pQQG1d4Q3NV9Xx+oK+ItpVtxNT7XAePV8EDojgle0nYteWs+T4dDulov1un/RBo9/p520nwosk2ZKjdLbFgFGR/eEmXkClK/s1WvzCrn5mCV6w4Y8DEXt88UelyWVBQaVZ1bz5HE3V5D6V8huaDTHrJYzyjbYPWxIvZemTRVMkRQKUObNiU8SsUqqzUGdpwseMIg0Dii3h2BaDfXR7kWezihNCmTAaILEMnsBWPe4bID9g4rnPHW3GQSGusxyG0lNScyvGvmZsGt+UINq83xuv5vfm/I3AJJn0r+Kg6rNVRCU/d0uwthGnJUTa5FWkwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQGrt/KZv7Mrhsv47dgEPYzs8zra+7xzlkezGfksfxg=;
 b=ecNBfQWUrG+Lbv/zk+te7Osgdin5KLvubGCyDG1qVhLNngosBG8cT3scKH96/vSAcNB9nqTSDrtdE1ct3inS+rd42HApXCUZcMx8GgyQ03A8L+NWJ2ayGG1ietUMiWQihYTA/GC8Plk/2/F4yv4K1EHTz/jNExmwkrSoyVSHDW1f5YDRHPcGUfDdSiTfzP7/zOd1gq88MTS2FrgMXf/OznLwOz4eVCnqOb7eB0HCdMn4wDbOzqSPcTyhtqJ0AZwwtJKtQVr0NZigawYqDGbeBwfPPaEosgGcfruToJ5kqOEK95+7vEaTb82Q4zTrOmVlr6fErv0hUrAB/kJ0iO0mDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2717.namprd11.prod.outlook.com (2603:10b6:805:60::32)
 by MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 14:27:30 +0000
Received: from SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90]) by SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 14:27:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 2/2] tests/intel/xe_exec_store: increase batchbuffer
 size
Thread-Topic: [PATCH v2 2/2] tests/intel/xe_exec_store: increase batchbuffer
 size
Thread-Index: AQHc6SesCJzE1B62BkOEwTL2MHBdkLYYhbyg
Date: Thu, 21 May 2026 14:27:29 +0000
Message-ID: <SN6PR11MB27177F06A4A29C6A109C68FAE50E2@SN6PR11MB2717.namprd11.prod.outlook.com>
References: <20260521-ibb_fixes2-v2-0-a36d7a9e71e5@intel.com>
 <20260521-ibb_fixes2-v2-2-a36d7a9e71e5@intel.com>
In-Reply-To: <20260521-ibb_fixes2-v2-2-a36d7a9e71e5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2717:EE_|MN6PR11MB8193:EE_
x-ms-office365-filtering-correlation-id: 2c8890e3-18a2-4fd7-0e62-08deb7451705
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|56012099003|4143699003|11063799006|3023799007|38070700021;
x-microsoft-antispam-message-info: vOPJo0kOqW3gu0uu6XqISzkuGViPyTN9SIml6onSkD/0v5GQxbgs2MnpUISlJafHy3DJyVwytRPtzGVte1p1WhwSU+osJDXFJbtCvC9ruf23SaLxxBWeg+JIBuqZdz1+Nd0y8pk2hevyLrRKMsIZDlw8Y7znV/xCdeOZZc5NiwagT0JDNeJcGEQMqf56ASSIZiZtIagSxTCXuZCOW0s8oShmyP6jYgRyERv8BhyaMA9Wg7dIJ4duD/N+E5DkwK+nQKGj0w3HGxbErnqDtU+rk9ekl7+9lV66O3CwEKP6zXOyWp9xQ3gx3Uix6L1OBlgOl55urZ+uAIlgkPSOKiX2DHs+wM+WCskVMlHTPXo8ngw7x/L/+OuVY5xp8YqvZW1HYp1j6b5/XV4BFKRzIwSMlOIni+I3CVH4HYBhmnApHnytu3cNwWsGwziCfErfVaybgg6x07WJA5tB16FbOlkAboYtNVbcQ1MBVuXQNulwrvnDYB7iTA51TL9/oOoEfFwMRMGSNaK8ZolL8/76UorN9vdyatfdBSMyk5Cim1jv3kMbkbU9STT4sJl/IrRW4lxkKqOfgnC/atSBRuYfLpddK9uP/jXwHMkFSPAeFdhBZ7mOXrOTuqrSjZ8aeIUZzI3cn/tWbZB3rSfIadOwKvcwrafFpuddAfIMWaV/Q07Jx08mHF2Y/87ziGNLjtK9ojP2nLJxFzw3YgKCP0fkl1/f9ep1v+UArydqjiffgBIILR3RE/yfc+qn0gkPWYic4MJ8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8LRvNdMe7kIVcjRZoudx+iWzeqQq21zW8ZyI2AdiSu84MdGmUJWpGQBwM+po?=
 =?us-ascii?Q?Jv8Ryz/Zux8XqxhZi70YV5VT1eyS9SH6AabRln0DLhgy+YlzLLQmmydzvv0M?=
 =?us-ascii?Q?W5p2TQs3Kw0MQNGE4p9NNtkrS8JWgVzzccBXuHwv/Mx4YtdWoprzkEjLxDvW?=
 =?us-ascii?Q?NIHnv8Y0iq+O9FlJtcYIPuugQ3xQAfvpJ0BXJ9kMeII2pFP5KU6eXKS7hKoH?=
 =?us-ascii?Q?G02PMReaMFAzh0vcNU03sWPO95J0znbfigRCbuU7KDfg2ZtxhtfKTnf4ZdPz?=
 =?us-ascii?Q?uFzXnRyfZrtBA6xdeBAb+lRfhlGlh7cn5AlSMBFO+73pg95lSKDiX6JmKw/E?=
 =?us-ascii?Q?ZXEYebVCTra6qsd1ApDu5DmotNjp6nJ86dhn0BCpRIzNAtPU3AfDGAC0M0Jt?=
 =?us-ascii?Q?XzvK4jtYucS6tFMHb9xj7RVPV2qhSvNyGEepBu5NTtf4mOLgdcfweVDCxJPi?=
 =?us-ascii?Q?ZojyMxT6ksQAeSzczlFMbn4mb9dirSN9OUv9faw3kxuBGmsyYG+utQrbBQzm?=
 =?us-ascii?Q?d9TP18UN8+EZuL5lpKQeFtFUHi99fWc7ai9AZ2tau2oVB6TyhN+t7XThYYz6?=
 =?us-ascii?Q?MF0ILijXpBtfLXkTvi8SHaN5M+aEFC90n4fu97wk068TheRF7Y73P0bv/PrT?=
 =?us-ascii?Q?kkAqW4QMKB56SmqgUuzRZHh7GDB5EUK5hqg9AcxHt0AMK1GXQzau8joH0ctV?=
 =?us-ascii?Q?V0aXSmsrJAqXnauEipQTjgp/k2mYUoolsfryfcoJlj02Ai7SBgKb19Kk4ygU?=
 =?us-ascii?Q?V88aki1irU8ydQnOk0HYa/fxg738wThN5oY/aAC7qH9TKEja8jLo7UCmFcZk?=
 =?us-ascii?Q?BWP62fQ6zJFiGGprLfUebw9rjoQqZb582EVMayY5vVLuEFyQ245LwfI+B5rP?=
 =?us-ascii?Q?KYwBgsLZ4GJdFtOpCS+4VHynb7Wajs2uJjcYNIWpRTvAghiusKJaFGx4T8NK?=
 =?us-ascii?Q?Etp5a1jZtISnxKZqymoSo3lIMJHBDk+ACfRfOT+1Q5vuJvJqC0XBAi9q1OrT?=
 =?us-ascii?Q?4Wb1yK4DcffCoiMTRUPS8Vl0O4JS/V9Q2pzVA7jvUGp1OFObTBTydF2dR4p+?=
 =?us-ascii?Q?6o+eTK1Oiaep1zjZo7Ke2SsOQMS/aMGz6uxWQ716/nJZh0xJcSTWjZ+a7iXf?=
 =?us-ascii?Q?cMCCRIgYojzr3IfCgsp8yklbFIF0rpvmQO+SWP8xgSd/W+wE7VgEE32LR1kt?=
 =?us-ascii?Q?pSKcT+CI6vJCUVB8XM74LcvmBl88rPrh08NoLYWVKffyi/qGCexXpYtIaw12?=
 =?us-ascii?Q?o5WX2Kimn8ynahIHjKD/7e9p5LNAivojcgfhwTW+Y7tqyur5kcigOS+ZX/3v?=
 =?us-ascii?Q?Bm/GZCn7PgvPmrPZruFLHauRcH1kfPsH4Xwi3Y9ovlLIyNyNPr+3vZyQy7WO?=
 =?us-ascii?Q?fttshhVNlMw+O2EmoGAVrwF1Fycl4KEXc5ORZMpJqtNIgt5jlygmY/ADmi4e?=
 =?us-ascii?Q?Wzekoz7gAesZLMy+zmFekcMykTaXIIN825xgGVCQaQMDeyRFxvEnvTFQaC1v?=
 =?us-ascii?Q?uiF+CZHoHSeZeDJBlkLTvMnwfRTz5L26tbdmIdNpZG6utyAn3yyJmy6O812R?=
 =?us-ascii?Q?wp5ev0T7nTHfZPmeUOSqll2gVePpgrH1ht7fhm+R8GgLnS3WwL0yQ3bscgmx?=
 =?us-ascii?Q?Lt7hhTDyQ23ae2GDXbCPB4ewG3RBzQjalW/tZy5VoF1ncGbzLHod18wZoOG1?=
 =?us-ascii?Q?sTXNCYlDGTM79L4BwYhQD6Q6LrS+Uii3gM0ZBwdx3JH0qsaRTF1fYWTUO8M4?=
 =?us-ascii?Q?ZDfOTdlDcfBPIMBs6mTnqYIYilWEA/U3KMN2EQd351nMO1jCmXhbycSljVig?=
x-ms-exchange-antispam-messagedata-1: d6C/kEihYbzG5Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D9Apd9ZACkyXg4wnRnnnRRptciTAqFTYkBWlqp3K3UivSmvOWHyzan4+K6znMRwn7F+JKXxsufVYq3Z9z1+yYqmLANra2Ti1zDv5fYoUr4Ei68znEKzwF5mHsfJDxrJ/v8dmzoOz6gm3zDtwxiygj/86NjawVOMQv0IBmK9DL6IF+7MvwwQS7UzO6nUJGhD0lqrg/Uwh0xcI2R/KTWNonqZxXXhsPjd/0FB3b6Lgv2MH9C/6kpMYEzWWF1R3T+rvJgMh23RCD401Unz/TN1+4+0r8Ve2f9yQCjPoFmkGI0G0UTkiFyxfkUlhOI+s/6L93GW3QluDpnRiqo52fODMTQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8890e3-18a2-4fd7-0e62-08deb7451705
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 14:27:29.9491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hR/QO2fZ6FW6m9ioSlZ1SRMzLgyVnqjTfw9Ou6b5N3BEWT7i/95JXMCLBhW2/phAZVi2PBSUnFfzFZQnNOf+M0lf6l2EtBNPhtVmlKpJ6xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
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

-----Original Message-----
From: Hajda, Andrzej <andrzej.hajda@intel.com>=20
Sent: Thursday, May 21, 2026 6:41 AM
To: igt-dev@lists.freedesktop.org
Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Cavitt, Jonatha=
n <jonathan.cavitt@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel=
.com>; Hajda, Andrzej <andrzej.hajda@intel.com>
Subject: [PATCH v2 2/2] tests/intel/xe_exec_store: increase batchbuffer siz=
e
>=20
> In case of some platforms 32K is too small for the shader.
>=20
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index faf2c7fa86ce..b9753dc22f9a 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -352,7 +352,7 @@ static void long_shader(int fd, struct drm_xe_engine_=
class_instance *hwe,
>  {
>  	const uint64_t target_offset =3D 0x1a000000;
>  	const uint64_t bb_offset =3D 0x1b000000;
> -	const size_t bb_size =3D 32768;
> +	const size_t bb_size =3D 65536;

I can verify that this resolves one of the issues I have been observing.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	uint32_t vm_id;
>  	uint32_t exec_queue;
>  	const unsigned int instruction_count =3D 128;
>=20
> --=20
> 2.54.0
>=20
>=20
