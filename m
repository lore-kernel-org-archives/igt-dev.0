Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4D4C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 10:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB6D10E7BA;
	Thu, 24 Apr 2025 10:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLkB3zQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CD710E7BA
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 10:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745489028; x=1777025028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kfQg1/pQvwRAWzy9agXx38Qbzr553bihiU2bWNg0cUw=;
 b=CLkB3zQIpJILcmw+Cf4UsZAY8c6oaM51QH02NMEJZUyVaaSNpGPNARJI
 8fWNAxGfdIax/C6TNzJlnyHO+EPbeuLXxngnsSmbWeW+galALB/wixT62
 IqNAy9DwM+gjAhQf67nk+D4jjyiCgTWVVVu3BbuVSCz4s8IBVg+Go2TvC
 kdDR+x9SWj/ZV/H0eJ/Z8HLsAkY5PbT719RQShq7Bhv9c4+nxWaiM8gw6
 ggODqSYvwbbg0avJz/fYcLUyW9siRD8FmLavCExQPOtPFqi4Qx3j51FTZ
 iEmxpXH3WIrEX8y9RVUijO1u9TUxZOSmdAIILd0kpT2EgMUxB74iPEKmP Q==;
X-CSE-ConnectionGUID: autS+Dp+QtStPlVGjp1eJQ==
X-CSE-MsgGUID: ED3B68aWSV6Q6nfIhfE0rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47286794"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="47286794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:03:48 -0700
X-CSE-ConnectionGUID: Pb22aS4CRMSlWjITRYS2MA==
X-CSE-MsgGUID: zmW/qVyKRpGwm/kKLCrU2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137364528"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:03:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 03:03:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 03:03:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 03:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVmOPhnJJE9ERtiBTknfRBxODwJxKfh0/YWd7gwmRfi9NmZR+YSJQioltOc7/L2paSKDBOvmsLLV/PTZyK6b67TEM7iydCtmUfMOIcsENc/eosJHu+FqPmdYApeyjtCmPF2lYczJ8+Vrbc6ZSBmN4SstLTHFOD3sFZupNP6m26n5KtMu5kHLKKKXm95lk8cSj9zoyZDw/fV/WbnipzuFsuTU3/hJN+1mMbISQc8oKwtG4MG9mGAAsvK+ojawNRuI1ibPogP5NcX2MbmGX8wZLibKKg1a5nYYwP3OuH8EBSW+Drocn8i1WQC/ATufEuaX/1GQdtQGULB/IGySlBR8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTIUJvTurIFGNdvLkPens+YVNCv/eXpN5pkgt/6iO8w=;
 b=aoyjBzEEDPAcKUhUkkEVicFv/ZF1u9jHtJFV6fWFfAUbfkpwEK4Dddfo0AEnOg1IQGCleXGZdngw8h03pN9MG1XKFHkN8YOW6LKvnDdMqddcQP5+Kh4rh51Q8Ib8ikVNvdq40prtdvBJt/ODRSeNJqi5jxL+6W10Q4mbvEtrU+W3YmCHzZlOtiM0BUAuiSj679oe9ucsZaS2lebrKnQg71RbkKSAUbcKhKv66oFHlB3DpmwOFR9XDL6saYbohUS+eVLYjLbcqfTd9YtPfNHczR1RTZeu2Qubtyk5kNUaZeVzEPxTjGpmE5jyp3sP87QgIpYLYgpFMcVUYuqakG0JSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by MW4PR11MB6934.namprd11.prod.outlook.com (2603:10b6:303:229::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 24 Apr
 2025 10:03:39 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%7]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 10:03:39 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Kolakowski, Jakub1"
 <jakub1.kolakowski@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_fault_injection: Skip OA test if Xe OA
 interface is not available
Thread-Topic: [PATCH i-g-t] tests/xe_fault_injection: Skip OA test if Xe OA
 interface is not available
Thread-Index: AQHbtE6R97yNnOpUHUWr7T5FPKRryrOylFHw
Date: Thu, 24 Apr 2025 10:03:39 +0000
Message-ID: <SN7PR11MB7489F4E0CDCF033D4D25969785852@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20250423125210.1385220-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250423125210.1385220-1-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|MW4PR11MB6934:EE_
x-ms-office365-filtering-correlation-id: 2573cada-3378-40cb-993a-08dd83174964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dsDPDP7i5nZe+Awf5WNLZGuQImzsSHB9S4UlO5ZBOvQgNldhdeDZEHm2ehja?=
 =?us-ascii?Q?m1a0hk+CjDfz5Pigd8TLdpp7xm/K65EtFDGJL4nSNnnDLeEUiTaxQTWM5KeP?=
 =?us-ascii?Q?YpdabcfDe2KBmlDuM2SUr1+OsIbRmMoLgN2VK9kLQuBkcYuJruglJQxWaho8?=
 =?us-ascii?Q?7kmZN6XpwooclNf3mBtafk8K81AK/jeXo6W8oZtfPjqaFknryxKSN05s9L6+?=
 =?us-ascii?Q?6gtFfCaIXKoKNmry3S/f7w8KwE+5YzfphynpOjoicJeriIBMWFrw+CCxfaXo?=
 =?us-ascii?Q?AD26ygxZqKel9kyU2ddvImvZtrDPLc06fpDZQ4Oxi5WjTUNCgsLM+SJI0WN/?=
 =?us-ascii?Q?ttwjFT5IseodlFhpG5JmawSuKberYxknBbo7p/VeGtl9hn81pe16y1aDaMuY?=
 =?us-ascii?Q?29F/vMYkGAcQoA3HELTL+tbbxMiYrY276C6W2BPA4GiIMaaAfmcnwWiSs5NW?=
 =?us-ascii?Q?Q8UK8DBjstlpLZAAgb23TNz4tqkzfOgkbRnOXvzBAABp2LxL+dojUF7Ok6vo?=
 =?us-ascii?Q?OrMpuLHnaAUkwHxHp8Vc+UIZuGolqRFXo9Kl+66kuhwJ4pKBKOqYzwxSd3ZD?=
 =?us-ascii?Q?K4y9uGLskQdaB8oTQp6ce0XK9k3HMkkXDTPKXOWSVk0GNdOvEqXsJfStvalD?=
 =?us-ascii?Q?+vpLbRdkwSpbqH6cM8gRAQLQ+HCsyLuwPwyBf+O0ZyE1bKXxs7g7Uxnm+DxW?=
 =?us-ascii?Q?zRxX4xVVhFtESFZaPVmZAZPtkYw522i2Bcj7ryR5Wx9HFLBdPuwri/0Fsyr7?=
 =?us-ascii?Q?a2IUMdY0qLzV/Et65IdKaMSH1vB0RUC8d9fJ1LPEUWybwaYkx8t/YuUua4Y8?=
 =?us-ascii?Q?UJYyIKLITh6m0hksYL13mvTPzDmMabdl5qkrjj9hwBDAtPYDymg4/26otZWC?=
 =?us-ascii?Q?XgiofMwVcOP9VNsU2UwcOUksgeR2FWTHT7yUxLnkyEAxPj7xW/FShrDikIb0?=
 =?us-ascii?Q?B0sClObsHVs10FM313bmsuTbRKmIrs2m4TqOclQjRJ/qEqoa75TXMjA0zMB6?=
 =?us-ascii?Q?2lK8mgUJbxHRSOiu7l66eVLgK7cGowPK8XD+1syjx2if27lwbzhboFHhb8SI?=
 =?us-ascii?Q?fZz9Wps+4z9SMEdlSOiRZsQXMbRcl45hLRDoMld+FTmlje3PPJLE86y7/FO/?=
 =?us-ascii?Q?GdhbKTgJUvBmPaMBoo4YgM410OLMYNCugk01vcRjS1V1HMF1Co0V6BhdrpuR?=
 =?us-ascii?Q?dPtGAggecSLt+lIcS5oQSmDs9sjNbFhpQVJ+TUW0+fMIHOB1+isa3Nyy0AGY?=
 =?us-ascii?Q?C4QwMXHb+KYVBGrgBh/0as0h3S7eZZwrKg14DNWUxvoiIFuui1x7mQHEuBQT?=
 =?us-ascii?Q?ombmojtP2fIpti2olDYphgvZky2e5PMd+YZfQetq+AKM0z6ZqSX5FciJ/or9?=
 =?us-ascii?Q?M8Sz4EXIMiFucc/ctLbTBmBNyM3SryNorg5qfRBfn0LoY30wJfSgIn6sdm8a?=
 =?us-ascii?Q?DLi3uk1x1IBPtEkn9jC+I/+7GMkIPoMHd8RR+hhxfc7rtj/6BTB63A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aCvpmjyPy4D7l20REGMtsmVW3bwp4+qRDJTg0s38AB+1UgnRZgYLnXBnwg24?=
 =?us-ascii?Q?wD5AcQ+W8s1vkko4VkFNVbVuDBETfQNPFRLsyRssbdYX5FjfKzpSPyX2AjTc?=
 =?us-ascii?Q?nN/GiyzEp1lIDjiUEg360F4oSr6dhiVh40jQR9Uij7T40a/VyUANT4CORBEp?=
 =?us-ascii?Q?E56FuEIv63GkFcYO7dyrhKc2YA5yjRPY8IR8vIXJ0Dc+c55AD3uo471rsEVI?=
 =?us-ascii?Q?reruUnNvk7px08y5JcsUUcLWBKGU36iYXxovleIZGjdgLM2/WiArimVcR0Vp?=
 =?us-ascii?Q?XWKK4p2KHzo7HtMtC5iDcKM0fvVp5+9v6CDqNcTY+BIxNVipljyY40MEI5h9?=
 =?us-ascii?Q?0swFHTfEtnXvu/x3vetPMq97iFkCmVydxhZl2GuN05WJnahVMsg/jNpilcao?=
 =?us-ascii?Q?4T1oE6DigviMSNGsChO5hkr8rygr/vxVgBy3eBNQkkOYhpCHVWbi20L59n2u?=
 =?us-ascii?Q?0kdZC9B7Dk2XcsadRYknKaO1sILCE5jWS/h15f10kXxkkXQ8A1TZXDnn6Sbz?=
 =?us-ascii?Q?tNxzW86zc3XMVSkDrfMjBOfgJyZMShtILsYoTP9TqBiQoez15aUo3BhjlSVS?=
 =?us-ascii?Q?pH1cue29o203jGuV4Ws8qXV+KZlwmF1tZJP7Ov/NJ0KYYd5c46rVmDkfHlML?=
 =?us-ascii?Q?fEh6NDvWU5lDS17LtnQ/Ks6l7hTF98t+pS4Zqd3AEOtcthFI4aEX2PxXVc4F?=
 =?us-ascii?Q?C+u3GeaYszAXuZLW8dXVr4wwYxSV5DKt2eUU24FWD9CxcmJ+QqtnLbSy1wEb?=
 =?us-ascii?Q?jr9acC2vZ4WzrXifelIxbM8OernNYU4TQ8UUUUH6O6ROBdwEsyXDaNMq2sK9?=
 =?us-ascii?Q?4nsNHRhTwyDmIhuWtilOMZNu5OK2wqCeAeifXjtONPF1A+H9kpWBTFs7xJNb?=
 =?us-ascii?Q?UrDLezDpyh/nlkE6YgwT7b1wS2QkpsN0aS7Ytct264+3gRBSGrxQz08R5Aw7?=
 =?us-ascii?Q?afbZ64uFfOLVQOp8bWL7QTaDHzP/Fst8xakZj2ujXnf0uWkS1VNcqoCBVFcA?=
 =?us-ascii?Q?z3Ki0ML/A05Cv9HfP/jarDkkm+rKIRQc7ONHlGi50ae18SPm0TzPu+3LwBan?=
 =?us-ascii?Q?/r/O7LsYfb4qDMph1SQ/hThiKTnuwLa8DtMDcEIRkQDfV0VHXzx90gIzmpng?=
 =?us-ascii?Q?RbVM+bNa2jDL48fbrkCNNqoSqk4CuiVf4I1Pk1ScldVRAEfvsc8TQJB2ChxP?=
 =?us-ascii?Q?Cc+qTySd4q8Kce3YGCVRlgSeeSnsKS9f9DNyEQRCuSUv2mzHxvyHvsR0GFxO?=
 =?us-ascii?Q?jYt8rYFn263TC8fRC6DB0okRw3+/UgY//2LhFjcAvX4GdDPOsczGlppLbiBs?=
 =?us-ascii?Q?IMKW26VBEDMQFdl39bueW0mCzjCUU6EL9I5newyR7HK1XPOcE/LCjakhcWRZ?=
 =?us-ascii?Q?CUbJ75dcf28G47BNRxF6Za7gl5x+XT6xAXEj2IR+uDkjKgJqolktWMW0Z+Bs?=
 =?us-ascii?Q?hyuPsq8lKmDD4MGtB73LJkXGqyzENuNzVf5+hjUq8XwHFgsXsGv31UoakFW2?=
 =?us-ascii?Q?gazLgIJyRDxD9DjsLVC9OreE5FyyL1WTjJ3pR5lVdIdG1koiYYpAWeaeQm05?=
 =?us-ascii?Q?lzxmCbGvfd1JoFOA2IJD5oCwae2grtixPO3zF1eC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2573cada-3378-40cb-993a-08dd83174964
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 10:03:39.4801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZAtkhvqvj+Qk5JqnUr9f6FqxH1BpZyQ+3xT3xg1ADbIqFK0DTlqo4Kp7+dXx4uXjKsLaIXVzwTOCzttySG+UH/13LS6/SvUBs41UlSop/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6934
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

> Handle the case where the Xe OA interface is not available by checking fo=
r
> ENODEV and skipping the test gracefully. This avoids test failures on pla=
tforms
> where the OA feature is not supported.
>=20
> No functional change to platforms where the interface is present.
>=20
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

LGTM.
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 24d3df572..42b467e73 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -349,6 +349,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, cons=
t
> char function_name[])
>  	uint32_t mux_regs[] =3D { SAMPLE_MUX_REG, 0x0 };
>  	struct drm_xe_oa_config config;
>  	const char *uuid =3D "01234567-0123-0123-0123-0123456789ab";
> +	int ret;
>=20
>  	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
>  	/* Destroy previous configuration if present */ @@ -361,7 +362,10
> @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_n=
ame[])
>  	config.n_regs =3D 1;
>  	config.regs_ptr =3D to_user_pointer(mux_regs);
>=20
> -	igt_assert_lt(0, intel_xe_perf_ioctl(fd,
> DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> +	ret =3D intel_xe_perf_ioctl(fd,
> DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
> +	igt_skip_on_f(ret =3D=3D -1 && errno =3D=3D ENODEV, "Xe OA interface no=
t
> +available\n");
> +
> +	igt_assert_lt(0, ret);
>  	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) =3D=3D =
1);
>  	igt_assert_eq(intel_xe_perf_ioctl(fd,
> DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
>=20
> --
> 2.31.1

