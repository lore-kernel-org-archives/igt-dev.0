Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D8ECA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 09:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6B010E2CB;
	Wed, 10 Sep 2025 09:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgA85iT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CB210E2CB
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757496335; x=1789032335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XKvhoEPPfS2w2QMPQRBolzhi7Gz2CsoQgPrYfagrshs=;
 b=SgA85iT6AGiy3AQU4jTRfyiAA6dEw8xIxuyuj8H3GUDA6AlMclkOscCr
 t+r7zN5aivJJjq+gSNEHfRlog1YqXvNbr5IfPTGaxWWtfXprvXxosh6Ir
 g/PF7RoOWtC68qWrVJumx8YvggD4PUD9aIZPIDO2sPcWVr+V2kn1wLvnW
 aIXdNDCU/B1SPRP8KiuEhTptAxd8lodQJrd7uvLDu/I955oZodnQ9AEjk
 MPscDrVoiWuC2R9nOhzZRo3bfhUpcIhMLacSNX8q9ErYBhppXLIi2y8W/
 B+Ynl2zBgGVdlg3+k5w12SC66rA7NGQ46GuQrgKbpm1Nw+jbWrs4dRIN0 Q==;
X-CSE-ConnectionGUID: q1mW0ckfSXSyJ0XIoTXr6g==
X-CSE-MsgGUID: AjkdnAfBSm6GP/mVzzrJgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71215597"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="71215597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:25:34 -0700
X-CSE-ConnectionGUID: 83vM0Z3pR1K46notWE+5lQ==
X-CSE-MsgGUID: nZ/i6E9QQwuG7iNOp27NSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173253564"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:25:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 02:25:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 02:25:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 02:25:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Isg24GpYY2tDkwm7vqwdgBZevKKXQ7kYne5R+Wu9hmW71e87Ickk62iG71XjmNaidlu2kVHkga9wLBaMpWxvnfjJ03VCQWKtE8kVdglZvbZbaF3o6S2v66oghJnTW6+1uZWRKRqXi9vQEkxfjo82p61fJeA750lraeQ4laKncNGTJSgT1JlOLvVkAFZiylSetzqz5cO/DlpTVlkwF643GwtzbV/S0sPQNhp8nNa0eOSVzr0hAxSFN5M6qFK0OFIqYi4oxWBeDCSKXdmcH79saLqkKRHbl/YGl0VWn6V10HOk960iPxiJrgnWfAP57klFz2ao1X98rKwpiYZQ3GG3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yiDL6wD7y6IezR1FVgDDGkwbnL48AebO+KFeBrl3BQ=;
 b=cPpctjmE3MP+xXlJS0oVcbc0fL5hgu19ED3qw7rnplCirAXe/WrJIU5eF2gRF+MwvP1WIOvDJgcbQj6bBoPjZFN+fzKE5/gOwNvfVTVHTo+fvtwJlcY7jDr4TbeWfmR5BuvPwdppr8V+pwVl1Hxtq7u5S3iU0KaTOar7Z7qYHa3Q11Ipz/xHLd/y4L9q81XBO+hvWKxiP+g4BfsZnNuyYFdRhowt+KsaAS74j9YTDEE88L1WbtwW+Kk5dEnfnyR8z6Z8zHV1ypzP5EWhQo5HbADEx2hvbyrjz5kiD5pBFmyHY/ODPwWZJDAKQXp3zLAB+RXL2lCN+S0kN4qY9gl0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:25:24 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:25:24 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta, Varun"
 <varun.gupta@intel.com>
Subject: RE: [PATCH] tests/intel/xe_query: Print both GT and tile in
 query-engines test
Thread-Topic: [PATCH] tests/intel/xe_query: Print both GT and tile in
 query-engines test
Thread-Index: AQHcIjEKP3hX1Q6Z006XO4VotNzRJrSMI0qg
Date: Wed, 10 Sep 2025 09:25:24 +0000
Message-ID: <CH3PR11MB84340C43C079A2C095CDDDE28D0EA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250910085736.428669-1-varun.gupta@intel.com>
In-Reply-To: <20250910085736.428669-1-varun.gupta@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA0PR11MB7305:EE_
x-ms-office365-filtering-correlation-id: 0fcabeb7-1c87-40fb-3d66-08ddf04bf8e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4OZ+q8AqzWsQ2ZmX/qiWfwJEc08VRL1kpZE8Gt9EwY7UrHgo8UwRlkujV2X9?=
 =?us-ascii?Q?5apEMMETw6x82kM5cW1M1ybUssxPtls3J5D4wa4g2Vq6KIroyNZA//eM4/vs?=
 =?us-ascii?Q?/LWfssbxFbFRIEawHMlXtHLLlfyYhUSjqtiZF8U1CAUshH8Jig5/4AV4GpaS?=
 =?us-ascii?Q?rYMKSlx+EmmN9NK8rRgVz5tNvFuziKgtzOgBRBThONOnEY9HYLPyULYAaG3g?=
 =?us-ascii?Q?kV6lg5TBU6dzSl72VoHDxr5mhkFbSBRIagzRNdJkTDMoIjuQZIRl0JIJGpRO?=
 =?us-ascii?Q?7MelaNCMK7Q8ouKwPRBtZfVcICxIPO2dqtBCSNgeD272v4RNfig+Sn6MVr0S?=
 =?us-ascii?Q?41/oFuRWGLv8mmrtoIcNXIYxtg4fEySPJS2RR9Byiaz8615G+xmQSVQbkpUs?=
 =?us-ascii?Q?sxQ2eY1XU28YcOW8L+kUrsfMFYNjfsQoi2GT9kp/FhZ5MauM6CbTVI6x3F6D?=
 =?us-ascii?Q?wf3SD0YpSWR6Hpi+EEUDjaelxw2E7Hn4dIcuP88eRwjw9tt5Jt68t0dGOicR?=
 =?us-ascii?Q?xsjbEeDZNJNDXDEgsMZUugw0H0MbN8JC16I6SpuLhqY/AQYreJWSoMmE15up?=
 =?us-ascii?Q?QN3blQLaYxUWsT/kIZI9d3BuvrIR7R4NJPXtvlryjwCNir/9/+WSlT+06Nh8?=
 =?us-ascii?Q?2LDldhZTc+RXSP4pKL5eMm7VPvB/TrGCts2cYdYpx+faCbuNa3QW/HK3wffk?=
 =?us-ascii?Q?bw8DOUoTUvgsHZIet4+09vZXoIafRL6b8htRkH7kXmQvA2cN1j0MWffWGxM/?=
 =?us-ascii?Q?9kTppPD5MKmgKTZAFQuKaayBvU69WzsLAWa72yPM2a0XAOHURRh11SF/t4QJ?=
 =?us-ascii?Q?H6GACXlo44DsCyg2K88yDyY34ck1G6CxWq/PRYqAwrmMJ5yjQ1MuyGQQJi07?=
 =?us-ascii?Q?RsFNj3cWnTpniaFIiesv7Zl/GmKJNLezAPHfCeITsEfNrlxqeS2c98G9xi8H?=
 =?us-ascii?Q?QQkT2nSbVsvogNgAmHFTGBFnsTvYnSGLTbS+MXF/a58HxZUK0Gc4X+UfGl5Q?=
 =?us-ascii?Q?VBgi/8aY4prnvBVpZRSH08M1oHKyXMrUyt35MeDUC0gqURW5xx8PC9d1B7Ls?=
 =?us-ascii?Q?sln6mxBRnhr0O+91YyV3SeunB7Cr1DmpbRv3VcMsJQeq/PiFuC9Nuq3U8axr?=
 =?us-ascii?Q?5v8gKkFnVsJw2TLR06IuFaCFBwkLOpvQbLgJ1UXq9X7dQpfyjLuBXMaZmxmZ?=
 =?us-ascii?Q?6NGQtFRZfqZnQ7yhiyO0rZMDPX9oTMjwCwjr9IUfljD5Qbpg3NaCyIZW/1Ab?=
 =?us-ascii?Q?90HCmNTvvaHj/UFXowLXd9N3iqF9kQe5SN9NstA88WOTUfdOL0cQ0a+8TUBG?=
 =?us-ascii?Q?9fmptj+tid7HkY+Nu0DReyZ572QUg62qeSo+DnBzAa47DI5e2SlVctIkgIJ7?=
 =?us-ascii?Q?bW4CEYJupx8PbvY0e4A6mvaTFO3eOY8hKWzg60oF0uw1jV2ibYRt/5LnWmas?=
 =?us-ascii?Q?2Wnq3nkkZv0E3LfDXhth0soCaB9xHxP7cVdEQ4uyWcMy0QGitrcaQA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8DfxEQ9ikyeW81WA3wq8zZoaKtpgq44yaOh1FD2dkDiTFeV1vejpuPC7nTfk?=
 =?us-ascii?Q?SY5IqU+3U7/TlHH2OACYs2RCOkeiWP1XtUySzmbif5IhXUWycR3ERSZiQE3W?=
 =?us-ascii?Q?gAWTQ9rpHtCxXJ5/xmDc+6s29uplYi71Omyg+gqZfNWpOM1jmJiMtVQgtvU7?=
 =?us-ascii?Q?PoIpd1t2TKeD2p5u6diwHAT4eoGspwxcC5fkTJMisHQ/7I+7jF2dZ05NLhu9?=
 =?us-ascii?Q?sydRXa3+e1ajFPglXNUDasDWMTtDAwwbarBasRkYrpZm9hxObtdkctQA9DMI?=
 =?us-ascii?Q?9HFZQ0+pEZjqQjCqUfmw1s1nM5bkAIMc0k+T6/ICW04/Z4z6HAojX7wyyMHl?=
 =?us-ascii?Q?/KIIIspNySqcpEMTxoEz+sXj8jVjTVj0iyNU15F1Ocxul1f4FHhmIUHTz5/Z?=
 =?us-ascii?Q?X5tk8TjnA06c+0IjhXB19zL/B81cM6Rsp6RXt3tLqoVtAx5fcB8NghXe74kd?=
 =?us-ascii?Q?oCnB6du+Ny1w4rYe7vw20FjA64OF+Tck6TgDtTlgfQljO3heTp9H9mIxX678?=
 =?us-ascii?Q?zsQRCwPKYmJk2c0c33x5KMQ9wZURrjy4QlIjnvWi9zUXdyEefqwwQUxMv1F6?=
 =?us-ascii?Q?RCZ3unnPpqj0jdxcaIrSb3vZ0FL05BucLxs4ZlI6xevzEPk7uH1dgjlKt+bV?=
 =?us-ascii?Q?UBzN7BThHBppuRKppQGMW0yFUV1Xb1OBJB+Oe6CMKaWvQzs5u6hRUnHh8Pqa?=
 =?us-ascii?Q?L7gtzHy0dK82hKDgy9XJDaiBXJrneSBqmk6PqINO9GZV3cY/1U8OH2ZrViCL?=
 =?us-ascii?Q?9yWIjOVMWJlDnasclga7lcN/vWjyDVDGeUeT7uCLzvYvhH1tOxWJ861jXPTW?=
 =?us-ascii?Q?VFzkmMO0wly0SozvgC1DGZVxkFLTELoXru3pEFNHj8q75Z3zX73ZlGc8YBR+?=
 =?us-ascii?Q?Wfcc3yjeITJe2lX8EasfCxXoMtMSi9ydeeg5IjsQznltrP7X7V/ThsnmZAK0?=
 =?us-ascii?Q?gORv3QMjSbGbIGg/Km1AQmuTXTQSpSF+FL4KaSgqUqAmq4aeMjqdc96TxcoZ?=
 =?us-ascii?Q?xZhkIGdH6oVrCaCHSq/BHGLg0qIisIWwHNNx1lHrJCtLVIER2Bkf8pGOJFIn?=
 =?us-ascii?Q?JjatxuCtsUKVJ1MvX9p1wmsp7a739k6MdCzyf6Sx97EZxOFm/HXw7Bc/MNv9?=
 =?us-ascii?Q?DDcLUJU/zkWWC8msr2YhedCPgb2gs965uJhHdpA9LVrFQUJa5wIisubcUtFo?=
 =?us-ascii?Q?gxIxgnXGj0sLgnsWMcNi4mOta2enwifc2Sb2Y9F6NNjz1asI882IJbtJ/c5w?=
 =?us-ascii?Q?xtigxSOiznqxt7NQvT4ZOCm9tJzR7Kz5EhOWrTBfVyspsysffdc1Y2do3t7V?=
 =?us-ascii?Q?DnwnR7YOi92EzjjQ5ARFHbVKQxGvEXVCovfcskIgjvYl9Mv0ogmXqwQTa/cQ?=
 =?us-ascii?Q?IfllIwGX+OVaYvuFnDY/EB5tM18FyCGffrTAkUnDMMhYQWjmsEvtCq8jWluf?=
 =?us-ascii?Q?3Lw6z2iBVU3pFUHrMWgv7eiAxCFuhcGATQ4/zAetEXgdwcEYr0nXeXn17IZh?=
 =?us-ascii?Q?J9xSBHt+OhFtK1PRi9u8s3pTRg3bm9vq0D66iGarMZdMl+m99ECaleXcOY7Q?=
 =?us-ascii?Q?xcWeUC0Papgk7gPuelHO1nwDV1FyTcj1a0b/w1NubpgOX1iKw8GKa7ZZslgq?=
 =?us-ascii?Q?3VSbRZ+xMWONAbQjXjEScqLwPN/tDg3cVv5Bpczg0PAZ3+ztaIvMpJ0FbhEI?=
 =?us-ascii?Q?mwgusg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcabeb7-1c87-40fb-3d66-08ddf04bf8e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 09:25:24.5115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATvDfGypS3cuhRnf4HViH/j173W7cnDz6cN3o5XZPJ8Y4YzyufJXvHylAckicVIqn9skpNw+MLfpG3LgNNsWAZZCPfkFAmBREEFy8EDEjRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Varun
> Gupta
> Sent: 10 September 2025 02:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Gupta, Varu=
n
> <varun.gupta@intel.com>
> Subject: [PATCH] tests/intel/xe_query: Print both GT and tile in query-en=
gines
> test
>=20
> The query-engines subtest currently reports GT id as Tile id.
> Update the output to explicitly print both the GT id and its associated T=
ile id.
>=20
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  tests/intel/xe_query.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> 96352da2c..18f8d7a3e 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -196,9 +196,9 @@ test_query_engines(int fd)
>=20
>  	xe_for_each_engine(fd, hwe) {
>  		igt_assert(hwe);
> -		igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n",
> i++,
> -			 xe_engine_class_string(hwe->engine_class), hwe-
> >engine_instance,
> -								    hwe-
> >gt_id);
> +		igt_info("engine %d: %s, engine instance: %d, gt: GT%d, tile:
> TILE-%d\n",
Small NIT, make GT%d to GT-%d which would follow similar TILE signature.
Rest LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> +			i++, xe_engine_class_string(hwe->engine_class),
> +			hwe->engine_instance, hwe->gt_id,
> xe_gt_get_tile_id(fd,
> +hwe->gt_id));
>  	}
>=20
>  	igt_assert_lt(0, i);
> --
> 2.43.0

