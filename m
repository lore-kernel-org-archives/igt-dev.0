Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDF5CEBF92
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 08:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA5510E14C;
	Tue, 18 Nov 2025 08:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSlDFVpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372E510E14C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763454309; x=1794990309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KrfE3I2Qf38FyEB9hKDIR2LDV7FcuqHTN9AOFHLFxe8=;
 b=OSlDFVpgn0Zdb3muylfavLykPZJTRKdEKPDl9s/hPWb/gtDyYCseYs9P
 x0WDJC4dWxKCpMyKr8R2AVhkQ7sthk9QGRp9ztfS+uwyfPOXVACTtiX4W
 JJqNmyEEnqHe84LcoRo4ta7ZUSvI0D+UCf53VQXyYkf1u3Sl1OAdfXN8m
 IFy7ze5woiohCaBuWF9Im5ED+YpjDOU2zsTzJ1QvHlm3rc+cJNzq4Z3um
 iXaDzsaMoANIfVKl/pvMYAq6cdjJvjf8cOc15xcyff1icKOpZBRk0oX7q
 UK7QTh+gfEopExQkIttAtsPM9Kf10XBy0uvnQvSETFqsaS7CqDCjyVhP3 g==;
X-CSE-ConnectionGUID: zihoFzomQhuD5D/mtvkAuw==
X-CSE-MsgGUID: i715nuEiS1GUeqeHaKtL9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69320783"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69320783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:25:08 -0800
X-CSE-ConnectionGUID: RKB6sK0MQNqVOG3OksP03g==
X-CSE-MsgGUID: nwBtFWZ7RkiHvOzdFylevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="189956286"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:25:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:25:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:25:07 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:25:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4fVwgWi4h3YemXWNOVzDmby0la+bTp34jEr6IGb13z+auFJXhVADHWSuIpqtga0PY8nuL25DwRWMpDwb6WPQy86Alx3FroefLb+Kb4EtMiIqNG6t20L117R2KEiryE1OJPONRJZdF0Kscx9A2AtoeAtInKCvRedio6Qweag2o9DxORgZGH10aV+t9PGg5Og6m9VjlkeYr6PlwzrfLilp3TyyMMB+N0qjK+4oHS3MQgewHWlvUYTOXmwoLrkzd0i8G4teWSvvJt6PbalNrmmtSZErB2VdRZnx9qVUnB2WHGDrSc/rLy65jDQGJZtdwxVVkux0/yEX2tVoE+6Dxjf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZ6hoAInlx/UEYiFkcPjNfOa8kjJRYepylH7dYs2bnM=;
 b=xkH4jUuwQrnqqi5dBQoIq/CcggnYIoP2ZNm3XYqCDpxB6NLXIO0xAcsd3c+LIjtYyFnDvceC/TFsyyvyjpvJm9SGQKn64kpifZEc/SmqinCkRj9hdNZM5h79PWDespkjI3QgaxxE1Nk3fTYmTUNN+SvdzOZnyjgaBzocCHhIfrrgNeuX9xQVJnK097nut7vQJDt7MfAxWlljkC8LDVDeLp/Ht3FmBEkiKbUYF2g/4TMHpfZLt0Grh77UZ466RpL1QrfEsJ96d2s0BpuRMoDVwvDmqVNYWgeiq9c2Pzyw4DOSD2SYnVPKcLcp1cCOoo5js6bOd90qc8PH/rO3A+cZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 08:25:04 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 08:25:04 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2 3/9] tests/kms_writeback: Validate supported
 formats
Thread-Topic: [PATCH i-g-t v2 3/9] tests/kms_writeback: Validate supported
 formats
Thread-Index: AQHcVHky4FsPkSeitU6XRkT/ZBr7irT4IKjA
Date: Tue, 18 Nov 2025 08:25:04 +0000
Message-ID: <PH7PR11MB60530BE6959F3FE97451C4F9E7D6A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
 <20251113085801.3088957-4-sowmiya.s@intel.com>
In-Reply-To: <20251113085801.3088957-4-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CO1PR11MB4979:EE_
x-ms-office365-filtering-correlation-id: 2b11e545-a1a6-41c2-7be3-08de267bf9d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qg6TsBRg5GNboN8/5kx7NCIrJp/BFDLDXKRfA2ze5sFrj4QBEG+o8k+P3OeA?=
 =?us-ascii?Q?O9c+wCgvVSuu9+mL0vG+RojBCka8TlShyDd1SzsrdO/2w35yLu4l/ujCATI2?=
 =?us-ascii?Q?jzwhkmxObHSkCc/vjGum/Kkrq6NWxBrfBn5Os7IW5+5t5aXcNylE8MjCOguc?=
 =?us-ascii?Q?DC7nN9KND6tZhtLOO4XSsRAx7DVrEYFFPNzw59ehS/arw9XTj1OHsi3BSuZd?=
 =?us-ascii?Q?Ucg25qo3ux6Ujf9N2nMte5LQN3meL+Yynr8Cc3Wadqav0hf4Wp8nzdRxFZn3?=
 =?us-ascii?Q?3GI3Byq+BOix5trBkzaat6JF6hlGOWFeNkfmubqgkTu4vv3TH3UYfNGd1ZYp?=
 =?us-ascii?Q?6vEIEEIKT42lsoV0d9WmND8IgSL8FGmGQtf48OG6id1vj9GYtSQkxv3zuiB+?=
 =?us-ascii?Q?jvNmcROe/VKv3lcAvlXSgATUi5rf4Ywi1XjnEZbufaT3pllKQBrAVqIbMv/x?=
 =?us-ascii?Q?wqjcinJIIKm8hsLXMn2ua+PUymsOOMQteItY4kTKC98Z31EuGr31f8AdJxsY?=
 =?us-ascii?Q?6X4pOFYgEKIgPMf7IfP2CsmKAGuG8p2XjiYY9xjXCTjCsczv8V/KfyNqVVNw?=
 =?us-ascii?Q?YGB5Au6oiaqM2eoWme0VOiGWU1zxkiRY1Fgy5MMfAENTBW6JlFG5MgmkaPe8?=
 =?us-ascii?Q?ypGjOHLl4x2c1+OLQYPSbnSQHrUlNOITkA+fjUZZXaMIPUW5/tUmWZsQSV9d?=
 =?us-ascii?Q?Yc8V88qpk8/sy1oGefWpO8Q9Tj0jaoirq01Uhl+YsOzUF9VTk8d3ssfUTWId?=
 =?us-ascii?Q?W7J2n7apXspoCxuVuo7VlOI4dqRfS0AzL6McjCAObP0waYxVRPpzxvMeBGnu?=
 =?us-ascii?Q?X6Hp6X7X/MdAhh01kokut2Fs4QSJerjUgcDOofLSj8fSpS02vYOs/w5JJ63c?=
 =?us-ascii?Q?LKHejHzO7pB6txALfzT95PdxdDljR1HMPh1Aph/Q/U7lkmjx71oPs3/WGLei?=
 =?us-ascii?Q?EO19k1nXy7zoDSka0tOdOy2eLyjazZtECehcTBRxVhrKHJMFFC5Tq/aF88t6?=
 =?us-ascii?Q?z74S5Egc+lOPsNtekSc/xXJ0z7YFUbdtLsA2/HrS0XI8q7kTNnQwQ9k4lMOi?=
 =?us-ascii?Q?TBKMWUEAIQJz3NQxvHR/5hX8diKpixJbkcQ/1/yr06AktRTPlayZkr8Vyd56?=
 =?us-ascii?Q?NmH1CIBN9iLPeNDHyDpcrO2ISbssRaLE0h/G3qF/b0Kv64qCPycCoonPNPaI?=
 =?us-ascii?Q?jf/Cvibo7WaX+YIHt+EQgzncAByFMfauGqLhXhwIzVYeLB8rXY5JcbbALNe8?=
 =?us-ascii?Q?6boPdtyV1xiHpJJwLyRI0tS/hvnnqKyIMycvkxiPRWzaQ++3TubU1x+gVJZh?=
 =?us-ascii?Q?0D/e2OTpID2xmP6KM9QpferUr6i9T0tsFKCiXebta6/aa5gY9mVaS5gDw/jx?=
 =?us-ascii?Q?P/OylZ6QgqAx5gtLfHtXrsAWSGA/c97W7rrbqyl6Nm3HUOi9orzvoQ2IwICb?=
 =?us-ascii?Q?QlBq/AEHxrveNIp23B5ptMqj8QM3pnrvvdhTPKpzyHFB+rPUn4gfqBeb134H?=
 =?us-ascii?Q?f3ATt4m+NEGNIEoVs0ldRFMI2/gNGg7hBe4k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?00JCDtrqRJSd+T17hBZLGVTEdpOgUh86zhwWZvULMzLBC8mnE2A/87nloXBn?=
 =?us-ascii?Q?7ruCbdUZQNV323ipPRF+wcaWi4su+lLhB1yrf6RsbyOdOsDM2mxva1RyphQ5?=
 =?us-ascii?Q?lwXe5fgPPcyAQXWT5dKlak5KU9xemFuhcrmzZX0lMZm/y0vc+pne9JezZjfg?=
 =?us-ascii?Q?LtceWK57rLUwwQasRZatYjB+3JV/mZCzDbqciVYHNjz6wvbMtc1raVcyicPq?=
 =?us-ascii?Q?+DhMV62IslQlfobFbvV85+zQEA7o4E/qsXqK7a+JhZ6h1voE1KIZObL+g7SD?=
 =?us-ascii?Q?YNNkXBb1996avIU6Ia/DD9+hsU1ahARTi/x38z4aO/RNuAV6149tNEZCSkqg?=
 =?us-ascii?Q?q7/khdpOuakWGsciUp6VsBZBQHmpH2TMqqnUGIdakmNY5h7/NY1d9JFzjN8O?=
 =?us-ascii?Q?Pqv/4Xk7YrI3kadTcP3f1VieKMrODl0LZgVk/D6NOmwE+OuJW1RmcmBC1uH+?=
 =?us-ascii?Q?+RJcLnsN2ec/hUu90sPcOsgKyJsN6WjBpPaiKN6xyadwrCZvXcdbyNMqnplP?=
 =?us-ascii?Q?tSDjfTDU37/4OdUg38hKl9prES2QX/EJ758kpOktPOljUO4G5HNFeBblfZ1T?=
 =?us-ascii?Q?S/RurcAmBinijh3BGrD4hGXjt5ugjO031WJC8i0uc/dIEIWgNcKVYf0GUGbX?=
 =?us-ascii?Q?04mD/yJeby/vBi4lKafTaqDSJ3E/l28ZNrJtq5XmPnNITSRUpCjej6PAKECi?=
 =?us-ascii?Q?bOAP+4bOjD76IT3XhN8aLiH99IZn/Xz2qVwSTTaUeaMwshAOMn+kT7Lph72J?=
 =?us-ascii?Q?DVvjLGmChuWD4+Z6vJiAVWKdHZirC+e47kb97EWCKt13h8zhG3Op6l4GNCy3?=
 =?us-ascii?Q?ZcWd2eHFolDGramiNnuVZBR+TZYBpGnSwsphJtFqAHKZhEaTuz70Iy0/QFwx?=
 =?us-ascii?Q?De9w3USc7cMOdvCXc48cK2lLTRhD7bNrX29euHsr8DBQj4m1TswZlvTZHt68?=
 =?us-ascii?Q?YRHKOu2ETQ6reMlp9EeIcJ5uoTD9I2QpetASeaiBmHOjUQSsfUV7KE/qGdiZ?=
 =?us-ascii?Q?xys+exVAAgZhC+gsFPLbVdnciRFUv5x+LOeUcNIOmTGPDBixn0BYpeKFx7Zt?=
 =?us-ascii?Q?JQ+H4C9ZbBgC9GHI1tZnYW+mYHaDwfAiA05jbG00oGzz3CclfYu3NL7LVFTF?=
 =?us-ascii?Q?gh0D4MM+DPNdx7zLCtlDZ8lmrOS/KBaynMWY0SbpeI+1z3ZGhLeOtdOeB2jQ?=
 =?us-ascii?Q?y+k5zFWWV7e8EvIKo2fdO72zVPJfoOaj2en+Y2XkIGr/Uw5ppZrh1Fs8h+V7?=
 =?us-ascii?Q?2XeDKaCtWQ/TE/+ec15z6UZmxw5Cq/tbTS9Z5ob8livDPFXUCl8NRESJEiqb?=
 =?us-ascii?Q?VBp3aKuuCPUAYz+C3u11nLz2iUL7HH5lcKaxjL9mAoNyFjaubUyrA4fbrbJl?=
 =?us-ascii?Q?y+QxOWkHMcxAOXVdqGSHDo12zvpGgEuL9IfT6sLqiUNqIO4UDd1eVKAcFWYr?=
 =?us-ascii?Q?k7mmPKbhsjdq4bD6VcmFcYa92/Fwh+ahoAefv4pss63Jged5Vogx4bCmeNXx?=
 =?us-ascii?Q?DrYm3fgGF+kYpeHY/gKn06WUuDacURaXkAvdRa0TOR3EUKpOCVI2Ta0sJB1e?=
 =?us-ascii?Q?ThTVAOkQ1yAeSV7nHo4oyiuzfY8dE5P6Vc4mRAsh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b11e545-a1a6-41c2-7be3-08de267bf9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:25:04.7235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LK4Kwit8NOTYTRxAMtU61ASt/Y2kTIrB9cXod/xovNokr4aGYynB3SKhUH/iMd2p3YoB+OZUCE0feUq2CeuIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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
> Sowmiya S
> Sent: Thursday, November 13, 2025 2:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2 3/9] tests/kms_writeback: Validate supported
> formats
>=20
> Add logic to verify that provided formats are supported before proceeding
> with test execution
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
LGTM
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_writeback.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> de0f67a58..e9173ea4a 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -299,7 +299,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
>  	uint32_t *ptr;
>  	int64_t pixel_count, i;
>=20
> -	igt_assert(fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 || fb-
> >drm_format =3D=3D DRM_FORMAT_XRGB2101010);
> +	igt_assert(fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XRGB2101010 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XBGR8888 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XBGR2101010);
>=20
>  	ptr =3D igt_fb_map_buffer(fb->fd, fb);
>  	igt_assert(ptr);
> @@ -334,7 +337,8 @@ static void writeback_sequence(igt_output_t
> *output, igt_plane_t *plane,
>  	uint32_t clear_color =3D 0xffffffff;
>  	igt_crc_t cleared_crc, out_expected;
>=20
> -	if (fourcc_color =3D=3D DRM_FORMAT_XRGB2101010)
> +	if (fourcc_color =3D=3D DRM_FORMAT_XRGB2101010 ||
> +	    fourcc_color =3D=3D DRM_FORMAT_XBGR2101010)
>  		in_fb_colors =3D in_fb_colors_10bits;
>  	else
>  		in_fb_colors =3D in_fb_colors_8bits;
> @@ -420,7 +424,12 @@ static void writeback_check_output(igt_output_t
> *output, igt_plane_t *plane,  static void do_single_commit(igt_output_t
> *output, igt_plane_t *plane, igt_fb_t *in_fb,
>  			      igt_fb_t *out_fb)
>  {
> -	uint32_t in_fb_color =3D 0xffff0000;
> +	uint32_t in_fb_color;
> +
> +	if (data.format =3D=3D DRM_FORMAT_XRGB8888 || data.format =3D=3D
> DRM_FORMAT_XBGR8888)
> +		in_fb_color =3D 0xffff0000;
> +	else
> +		in_fb_color =3D 0x3ff00000;
>=20
>  	fill_fb(in_fb, in_fb_color);
>=20
> --
> 2.43.0

