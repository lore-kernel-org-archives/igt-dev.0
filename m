Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226F2C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 10:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE80F10E550;
	Tue,  1 Apr 2025 10:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imj90Sno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B268310E550
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743501810; x=1775037810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fWkXp4BzCjamWsBc76GLldj0Qqh8QsshhDWi8cTznNM=;
 b=imj90SnoOmnyamRzWC90KEsWcYVE8Nj5BSh0wbolMAyLGRnlmvGNy5QM
 OAJ9fHTEfQHzxrfQgrbiUELAxtV02MozoWP0GWW+KFCDPDZRCw7+JtXad
 IKT3Vs9r2wa/P/H0BTEYnz7QGFLZBC+prnJ0cTVXoTgEqBG5ma+bWg5rX
 4U99aLPbcawlf7Chp0HrLpgu+UAY95zos3lB7f7Y4E11jvNLgtQV800lP
 Cps0bl/hY3cP6XWcEQIs7WweYw0uLHBceGLDKEiie2efncKOnIDFFUnzG
 0BcZVHqDvX45hXQdEzdovCi4NNQM4Y/MNwDR06A4VVaVyKIjn3f7AD9U8 Q==;
X-CSE-ConnectionGUID: ETXjZ3HUSq2ZfV9phMW+mA==
X-CSE-MsgGUID: NCRKIuw+T2yNHOC7vSMt6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56184790"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="56184790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:03:30 -0700
X-CSE-ConnectionGUID: RbdWyG7bSoihyJhfSsLd2w==
X-CSE-MsgGUID: lxv5BRsdSK2eC2CoLD8Bjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131345786"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 03:03:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 03:03:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 03:03:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 03:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUjf3OzGTRwArMi8u8iCWl31c0br1/9RXatuDjeD4PRKvjp9hqZ4/yNgDertxJz0iVXlbtTg87FKRsvZkymvh+ONRhq6qXPcuVlcCNcsJ2uDLmFePfPcKP3S8ATyC7lwaqeMT8C6X2Li/HUQbIZXU5AyA/5E4mRY5pt0GQIKQwUkKjkpcoHuD4EkmxgJzxD/k+oRLwnutIjELvgLUItV+DB6yaCpQ1BulOZizkuufzNDA9iYt5F4DBc2VZZZIebt6F2X3tHy089KF6HwlQaYTpwQ50LA0UaW4JhxE1pXYNrREJf3A3F8Ij4tq89/DzdqkEjvttKFxIUYCgmlVTKarg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvQP/mACLNuVebQVYI1jUHXnnQqIOjb0ZQKDhjkYHgM=;
 b=pgAarHlh9GV9fw4XMuECnQ4ikrjnbmK4AI+j16KVIkusEu6A5WNIH6VXg4VmxdWukDAbaGfwrzISMqyHrn/Dgr6C9bGKPwLIpKplBFXskfJiMCsYfc3rZGytk9JlpoZUDqBF1C2NNtFlu1yNLSp4EqDPiixlTs8u5WPxGG4mkOYiPJwTgWhj3C1jj5WqkGfpEg2KFG1prZ1xoTFuKlwEOLNkUaD7b7+P4+7kMOyXYy7yCbFHxRh0lP8LKrft1ZJBVAcP23RP1GOtxiRGd6z6dg+sWuoBl4oD9HhVykePBOgd9piU9nYxbHxBlTZ0cw4WntrRrZQNX7sj7i8cK2nEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 10:02:59 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 10:02:59 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Shankar, 
 Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
 compared_frames_dump()
Thread-Topic: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
 compared_frames_dump()
Thread-Index: AQHboAwHTw8DR55wVUKwN7IMMAMAO7OOmjvw
Date: Tue, 1 Apr 2025 10:02:59 +0000
Message-ID: <SJ1PR11MB6129427045970796E2FD5BFEB9AC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250328181055.642777-1-swati2.sharma@intel.com>
 <20250328181055.642777-3-swati2.sharma@intel.com>
In-Reply-To: <20250328181055.642777-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CYYPR11MB8358:EE_
x-ms-office365-filtering-correlation-id: 30fc7ce1-956a-4a22-16d6-08dd710461d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aqQjxyNWvFZrX8GXVPsbv3HbsjFrQtBmXyFUWk0YsbACqNAinjBQVHV+JnFr?=
 =?us-ascii?Q?wE6Jtyd1uMTZdXMJWFkRwTke6IR4LX9ptJcv6+SdANb7QTCWzzDIl0LLAI9V?=
 =?us-ascii?Q?T+soK1NQI9eFuX76OZU8Ejy4ChvE3MP9PuNIgz99aHjEOeBFYtrlOt5qlEwE?=
 =?us-ascii?Q?Hv2kmAafqwjdjx3pDTyXnSEplbDWETRxTdhoel55gmoMg1F9pDYcX4wGXPta?=
 =?us-ascii?Q?SuduDMA6M3dY7FsakQIrhGV2hYKXV2uvihmj8zngHnoHW/SI1xUMxE5TpLo2?=
 =?us-ascii?Q?8yb2vyp4EuDaCm2VNAN+WFrxxvtPkPimqLmhvVsDIItGnpnar5KVvqHjudrh?=
 =?us-ascii?Q?PfXh5zodkMXJW0O40bfCWZQUvmoKS57lmAlmXfc6/jBOky/eVsJXpscWIMC3?=
 =?us-ascii?Q?m84fi7kaGD+86JcCvQPwqEawsPVdr8b2RVcuLwIAwyDegRGGj+tnxIwgpTXp?=
 =?us-ascii?Q?tFrBGPv8Mt+w6BcvIs8DzKVtOMhMevEFf3y8F/9CFKnJNJxFzalyuYvi/60a?=
 =?us-ascii?Q?oka3R3KgBJ8YtyQFZz7ZgIiN//FynwTc+kRP/oQYlOBEtaKHRKUu4DX6gxnG?=
 =?us-ascii?Q?R202qI9CZWdjzkhdiLeYQylWb56/v68SuZcTxZRxnZO2jtvyt79n6Tx2G+Ha?=
 =?us-ascii?Q?qBgY1nih3LY3v9fILsimD7pI5REBsRxkTSXgLVVUnq2FlC/EEvr/gWv8xe9m?=
 =?us-ascii?Q?vHBQhw6zkRUI6L/L/46D6u6Fvja0KOLb0UMacMAZUiRwyNH382HHWr9njY/F?=
 =?us-ascii?Q?9IAopFgDW3Nq0xzkst+/Odw4bvTlYtMm/aZIyMml5SYSjAy7LVJllw1zK/cR?=
 =?us-ascii?Q?ETHxpODlf/DDP2ev3qig6rvtynvc+LPJfyDJ74HEL+nTbM2vPFmHVDq10IJa?=
 =?us-ascii?Q?FWy/bMtX7zvb6hGkUgR7AsRtaqIdOzSaXwFO64e2dZcwCn+i1cXD0qY+uBLa?=
 =?us-ascii?Q?Ck0vYwoN4IE+o8BGcHSQBGBMwoeBorBZgg66h1ETUv+/V/HwmKIC2eCdcv7n?=
 =?us-ascii?Q?3lGuGgQ9Dqs+Rvma7kBn1tyarH3rW4azruwnh3f69iAbzJXMr/bwTynxr0yr?=
 =?us-ascii?Q?Dr0YYBsxICHL9P9jF1uA9r6atGDfYQPHL7KMfNEd/ScCqImN9yC2B7miE4cw?=
 =?us-ascii?Q?woei18DHD8UPtkXtvBcdHWy0f01UmF7yq1dhetyOsWcxBfHDDX16z8iTC7K0?=
 =?us-ascii?Q?T8rx4EpV8g3J0or8E2Eek5qflWivSLllFYF4w/S9uGtc1eZlLgt/sYFrkcKU?=
 =?us-ascii?Q?TIRJDQUr/vq/iBSxYpFcN6zJXnYspGVm9qAktMq2Tk9rNXoSvgie5LDvoZdk?=
 =?us-ascii?Q?3Hw42v2JCevxKuiihny5z+qd3XGPfLTFHJmu8sdvjhNIXSYQeNPHez6Gi/Oz?=
 =?us-ascii?Q?78vvs/8m1BeK8cAOklHynoAM7yJjIxr9mIfigfpnFveBPrW2g2eEAo75rMep?=
 =?us-ascii?Q?KRVpBWKqf4c49fGYaTA5D7Kr+L6pxEMAmx0lEHFFzn3nzI13+ObxO+3+ESb2?=
 =?us-ascii?Q?Sp3DWSS1XNX2E+Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qIUSd8I0gEf9iWN+TznDLdg8Ov1R626Ra9fSTwFqoaR2Yy3G1uQrVpkJOwuv?=
 =?us-ascii?Q?n8Yc/9tjG4yBYsBlP+BJrLgGSMvo7Tus4V50uWfunTjmRTod1aOmuU9U7oyc?=
 =?us-ascii?Q?Fm8G73Vc1DOTqjgxKj96xH6H3YjiokbNNRt2Djr7JBKBej1MkenNcSEWmjS9?=
 =?us-ascii?Q?u/hDKb3ORWog7HIidx01kAUZUw4ROSiDR6euHEIPO4WiTZHsLDNRbnz5jEKg?=
 =?us-ascii?Q?uHVFoKo2EqVTWd1XVUnbrYm30Gy3L1TpcYp8y2FCWPg53I+hmMyzZ6hNt2pr?=
 =?us-ascii?Q?ufhZeWJE8u00dI8jvyIHhgmge4gCPC04Vv2/Qnvwn9CLFrL4OPJ8cE2E+0kR?=
 =?us-ascii?Q?AyzDtHi2XaEzulxvGM/HqBGZX8T4mXocttY/ipM3pkc254FFziIZHUGHncNX?=
 =?us-ascii?Q?06mD+RWpgyxto6L13s+BU+EaOP1kRDMK5AsZyfYQLCmQcMYBcvXTDvvgHobB?=
 =?us-ascii?Q?ZA0AA1EMJGlM10tC94VafTRE04AjA5iAX+KM6YtWIZnYN6dSktbgng3Xxa3B?=
 =?us-ascii?Q?TNQmU+48CkOtc1ZQqBGRr6UGbo1cs/ppX8nMBbCxgM/dka8rwVkWk0csKavn?=
 =?us-ascii?Q?pnZ7/5c3Lkl18vBaRSKlj6+7W3jxQHDJVjG3AWMBfhPRqYVeEi5Mxa52ToNy?=
 =?us-ascii?Q?GO78fG7UBJ1FObcOqQ0WSWQPBRIwSFC+R8E9g+YijCYoNIxliB6auqT+sslZ?=
 =?us-ascii?Q?o8uZpTDne7TgACc19UQxpxDDGq+ava/G0CMHqXCm+1bp0eqWaBt3GmH4ahpV?=
 =?us-ascii?Q?Y0CRwlH/gO750Lgw6WjEuv5yM1ska5ok1WScT62iBgQDW4MUfWOfzPZH7lFp?=
 =?us-ascii?Q?980YJK4Z5QTDwVSFzqIPNikRgT64zi6wRgBoWpDfk73jPAx3sQGEGjgmjpFl?=
 =?us-ascii?Q?GieHXnuDjcxIGYUnTwcLrl47RnM/1PFRbnRQf+tfuMMRVmmKTsdllFJc5Oo2?=
 =?us-ascii?Q?cxSG/CuVDUaYkDrlBg/MaKzpVlnVO3L6C5QqHy1iS3sxCgf6Xh7boUVkarbt?=
 =?us-ascii?Q?iLxmqRUddSocVBy2MJ4UA6AtvMBl/3Vs0xSvzordRZ55Hhf5QQsQnik6+Sn+?=
 =?us-ascii?Q?kcIQaeuddjRFIuFp3vBxYrQHlCzgog4Aq0prW9Le4Ccj4BzefPJgZbR1+oY7?=
 =?us-ascii?Q?M6w/MR7rXd0/u0/Z12sl5bI3LhCRMgG6KYg2+Mhh2lW7HW2h/fCGX+5VKQez?=
 =?us-ascii?Q?w3GTq9HJYbZgLq8pIXiTQFPnTQ7W71tVBdRTokmMd21DJSD3VtOcdOQizh+3?=
 =?us-ascii?Q?RGF8cEWorV184FetAopZfDq8B9/8CJt91GeVj0eG9uIjqq1UHDCT7x5rgwmW?=
 =?us-ascii?Q?tGxYoNAMwtKIMMt4FcY657YIeyiezzVDxnZnvftGN4zeEkhIpePXipNNPheE?=
 =?us-ascii?Q?I7RP2+5LWa5XcIKkGwvDqGS0/8iS6XhotHO1OlZ5F6D4JHxvu26jOXpTbub6?=
 =?us-ascii?Q?GVT/JHvOGyWPB0PedpeKi0cPGzqwxKMSCc4LnJy+F/8FmoAPC5V2ZjsqIOyT?=
 =?us-ascii?Q?geqjMd6ZDshH1cxnnEWMLRD5TN1uOYsA6CFmmZLLgFy16jmvG/cS/yOTSe7e?=
 =?us-ascii?Q?5Gbm6kGWZs/3QGB7hLysxio1floKXjqy6NoFCaJQtVSjLNubX8sGrG45t7sH?=
 =?us-ascii?Q?hQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fc7ce1-956a-4a22-16d6-08dd710461d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 10:02:59.1595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQoikk4nUNdfcyVmVO0bsyUAYsEiSaka6pwgpyXj7pzdJb/q7jLjUynnwKibhSxs5T84BEgrHxjOw/ECS/rkQ2U1aUZpZEzt6Ya31qa7vkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Friday, March 28, 2025 11:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; Shankar, Uma <uma.shankar@intel.com>;
> Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Sharma,
> Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
> compared_frames_dump()
>=20
> The CRC calculation in compared_frames_dump is incorrectly using the
> reference frame instead of the captured frame when capture_crc is NULL.
>=20
> Fix this by correctly passing the captured frame to
> chamelium_do_calculate_fb_crc().

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>



>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_chamelium.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> c86773898..a96e36b5b 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -1878,7 +1878,7 @@ static void
> compared_frames_dump(cairo_surface_t *reference,
>  	}
>=20
>  	if (!capture_crc) {
> -		chamelium_do_calculate_fb_crc(reference,
> &local_capture_crc);
> +		chamelium_do_calculate_fb_crc(capture, &local_capture_crc);
>  		capture_crc =3D &local_capture_crc;
>  	}
>=20
> --
> 2.25.1

