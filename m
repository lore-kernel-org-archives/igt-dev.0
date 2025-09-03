Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B647BCA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 14:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBC510E8A7;
	Wed,  3 Sep 2025 14:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmgx2e2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A9310E8A7
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756909426; x=1788445426;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zQupWMP2J9tAwTp/Xwb7Z1i82qBiZnvPZ1sj0WlvlYg=;
 b=hmgx2e2fA41RFmYRWEE9DruYjcaawnh+aOqiSGvjTFTOx/Nu2bV5JPk0
 MZo1u6I+zZh47inG/15rH1Mf7qc8S7LB36DHDCWbCFNZW83wSSJZiqtax
 thyTZaCzOxltBIts3hrJItYo4Blk2ZOyzbNqs+1bgQXHpVkstYfWCvYTk
 mhHRI7N3LZd7OVkuaXE9F0sDb4bvL1iECvRgjuBFQ6pC5naZw3B92Bb26
 CCx5/5e5lDB82BJf2lLQnNoA0KyGFDl+Dw5QnuRHZpAfGrST1JXwVyae9
 zgh7xKIpS2pfEoEI4PZM7yk9P6iXpkX+VZOjWMmVYdSV+hQGaNidaVqeb Q==;
X-CSE-ConnectionGUID: xVXCVwWnQLO7JOab/vqwIw==
X-CSE-MsgGUID: Y8o3REWfRxuxPYdurS+mXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59369873"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59369873"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:23:45 -0700
X-CSE-ConnectionGUID: S8lrD3P/RkSzi2QIfBObSA==
X-CSE-MsgGUID: EiAubxczRhO5+vjdu0FmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171553385"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:23:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:23:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 07:23:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:23:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsNi5pjpvCBfXZwfngP2fO9GY8N28CXrhB7U1csOVF2CTM97/EB3c3IZFb5ztH5NsQDGC9YsRI6MiJ/svQbHmQD4CC3QXq9IXaeJP9GPo3TUGid4bQdWpAEqmpXIuZ/nwkDYn2ZDvkWKFLd0WseKgIlfmVXlgpxW8WS1C5DlWhw+rS/4VZZN1kg4HkC+mYkMBjpxrBAZUgKxauO+KM6zxt6yQa/xvgdj33fLh6mAmImlhSPplpYHSryNCtYGddG7aW6tezGlp1J/yWrSYZy4b7fWYJBH34qaJIIezB5nC9R8srLVU2Q7q3GIJ/dRNP8f81WIdgESPeG0ipUVTRtCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyx9zaVdfZfP6ONud8nfKl9unxyyazmuNwM3GB8Gq8M=;
 b=TrcO8QcIeIzzGWhOOzqozrrPWJ+csoG4nLsxC3K3JRIQ+yPZ2ShQbuHhGFufzFhQG8kmPYMAtMANTQhQxsooPvwSDLA1gmQsSnjuIxfRoGxpEqjl4DuZ5LIMwLAfLFRspunq498hNm2gIqn3qRiv+YiYUhPnNJeKrFnhnR4Mhyo553s07mn1Mi7po1je34rsYgO/vUrGPLvrhcD7OCVA+oopDWxG11Xa8Y/Fv9U60hD0bLmwqZOVW1o4gdMpObitgEfq2UkKNXwLgLhh8tYtTGY/KAw9OWi4UcOKPcHuK+BfcH/uCU368dxsH0+Q1kkNJjtgkr++mzTzcTXxKLMmqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MN0PR11MB6181.namprd11.prod.outlook.com (2603:10b6:208:3c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 14:23:41 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:23:40 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v11 1/5] uapi/xe: Sync latest uAPI KMD header
Thread-Topic: [PATCH i-g-t v11 1/5] uapi/xe: Sync latest uAPI KMD header
Thread-Index: AQHcHNz6+KM3P+ydyU2VRTNiqiyGobSBgt8w
Date: Wed, 3 Sep 2025 14:23:40 +0000
Message-ID: <BL1PR11MB5525DA58A9C1A0BF17CAC5B68401A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250903141339.1859497-1-nishit.sharma@intel.com>
 <20250903141339.1859497-2-nishit.sharma@intel.com>
In-Reply-To: <20250903141339.1859497-2-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MN0PR11MB6181:EE_
x-ms-office365-filtering-correlation-id: 423642a1-dd3b-4331-aa8e-08ddeaf57b06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SsWAq2cj7ZiQfi5ov8iFbIxXZ/UAQhKw8gqMuSRSiswAI2ne1u9k4xap+MNn?=
 =?us-ascii?Q?2DDd2uIWEsJl0tTlxCa8GrLxqSw/oJH8ik7cvcC4fcrbtgKqia5GNDbRZAzh?=
 =?us-ascii?Q?3SofOIX/H3EMlEwk93k+URTFHb2H/TmcVmoB2rwjPvMOcsNIjBfPoLU8LPuD?=
 =?us-ascii?Q?M2Q5+LoaD5SRYQA/rrrIe+suGUlhc+BYy6p1QwL5dup1br2wWLgKyncdZ9OB?=
 =?us-ascii?Q?WxdDDhhj9FsB+3YgUv/PtEUKP1Orf7Hcb6w1vLYVclEN8z1R0cjgyKXD7M3u?=
 =?us-ascii?Q?kPQuLCysMBnxtop8dgopXtEztaZknWDWm/MNTKzE/2zPXri0Z0agz6Q54EXi?=
 =?us-ascii?Q?oN3PdTKPjeO3SXy5pYZ13fH16EMsu0QRnWOSwHbQFAkzY+WV+AzZ4nk7SpdB?=
 =?us-ascii?Q?DD8r0Wn3NL/xF/iVHi5QjnqlEQIPcH8syeaIbm3OrzNQYCVRh7F3brS9Rl8C?=
 =?us-ascii?Q?W8ny66eQGnnviLtaFRn+GYaVJ88BBRrba5qnT3DNd7HroFlD14p8FSrqolAw?=
 =?us-ascii?Q?EJYqxOEIth/vbf4ASzxRYJzfEt1fraSQfj8L8ldL7Gf66Oxf2+95v4Qx9sYt?=
 =?us-ascii?Q?Li64V3d3ssYHRe0h7NpKhi/fm4JAFDLJXtA0OR1hVCwKtAFmECtSljgRI7XU?=
 =?us-ascii?Q?JW6zr3uWIdGAPYI7pPuZg+ly8j1H7J6mMM1MiSQfCWZxn9wUfy51qjB+Pev3?=
 =?us-ascii?Q?HVUpqvwiJ4uYXCUHMrIX4CnDBICM55mlPlir050QrIfebz+G6Q3WWRghZZas?=
 =?us-ascii?Q?h1wO5+/mchYp3ls8Pnfo2bJ91rJf4++bi27gzWed0Z+pqmS0xNmpLu5Qa4wc?=
 =?us-ascii?Q?ILZ77gIeBI6e307IIkh3AxGB1V2m+VzhPFpXFTnKFammrlOtROS9T6m+E1x6?=
 =?us-ascii?Q?4GXFu5UXJLLYBGpz7uEoPh3tZqIpDkZTHD8xrFOqvTiD96kNC7Eh/XCihOfl?=
 =?us-ascii?Q?QXyiTSaKVBIwrHyqJvMzIYUC/Qze16perkK77GMcZeP4t9/bJ5mxPFn9ZzGN?=
 =?us-ascii?Q?1UaUmWb+4f1EZV2+BQ4QLbJZ8fuCvlObvoSluw51B5vYU61g9gp55Xp9pLWc?=
 =?us-ascii?Q?zU8UQYwFdN7IYDeHAIBrQbcsDe7xvQMOBZSVcXU2fQiXEmasfc6nRd7KAzfE?=
 =?us-ascii?Q?dqXqOEgKE7rLb6OfDXyrVWl1F6kp0FlLONer2hIr4c+WXeobKQ4UlRet8nNu?=
 =?us-ascii?Q?za3kXUaOqeTyS0Gddp5zHMShXxCFWe1tft66TiDfe/BaGyfI2fc/xpKYhw0+?=
 =?us-ascii?Q?vyBSETlXjn7Hhc96SaDix1IQyChPq23dT67smFfyOjEJIkTchFZVybwepIDi?=
 =?us-ascii?Q?5ST2MuBL72hZNE0cy5wDrb/0y4nZdF+oX4qv/frfrR6lsxxAPXyrmHaNLNWC?=
 =?us-ascii?Q?7kDUC7XDozeXT/d77odsIVTrki7MQmGESvIOQFLvODryceERZXuOETL0/Onp?=
 =?us-ascii?Q?1Nga0R3yh+UYrpsNNcGTGcr4B4kf1moBK/8SNuRSzFPjQtZnHDiqt4xY801m?=
 =?us-ascii?Q?2/SKPLTfTw1GNgE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JkUP0a6NBwtHA89aEjYNzvmKHzYrtkjquwJzFw9oXI3S0Ezm1ZmI20SRzcaV?=
 =?us-ascii?Q?QnVy1HjOmLIIrhudWnmBRkE78NJ22vuMiLRRQQyhCw0ApJUiBZKYjgFEqcix?=
 =?us-ascii?Q?2ip4DQtFrY+73Vdn7Jc2905JQPCK/e4lStWSy2ljTX565FXk4pdoXpxNupdM?=
 =?us-ascii?Q?MYVpLrKxSj/ICq3H9UdP9auRzS1biDPcR17J9hfwbjgxPOH1yB6fFgZKDMaG?=
 =?us-ascii?Q?Pkth76U1vB4IRBmrb29/Lr3Bw/gxRfg2cGFnI7iXnd0d3VwjoM7fbnw0R6hz?=
 =?us-ascii?Q?xKmn9sC9uQpi5sYeRetk/XsgtUXCdSVKGu0gtJrtvNVBUhErX6fIZx6SpNcx?=
 =?us-ascii?Q?lNpWvGUrkQ0Y3XmY9KJaMpBSQZkcf0CCKHrutXZhZ+uW4ub8pFR4yPB2Om0/?=
 =?us-ascii?Q?CH5GbPmkUdYxY+IoxmEOuxdiNq8cIVZ7CKAOrKS3O9yer3z+bSzohJQ9B+6h?=
 =?us-ascii?Q?ciWKnwiN51QpK09BCbA3SQRod3wd4NIlXk1cpiG/A2gJtgpRxkd08dF7P4U6?=
 =?us-ascii?Q?xJVL9ZNbV5aB3xBsYW5Huord9Ojczyhyp/TjtJqdjfhVSd3IiOj34dfiRXag?=
 =?us-ascii?Q?vHLRRliX92GNg2XVZFhbBrYdhBAevExlxU02+kbHJR94uGiLymSnv8F3KQGM?=
 =?us-ascii?Q?tCFVDR5/1If2vprsELSj3XfyAfETOfMXeGzBFBWYkpMtRksvewnZrkq7iXeL?=
 =?us-ascii?Q?l2X/At9jjylXDOaqNXaXIfWS1N0VXC/J5gGt77Se5IHoBhMx7LBPXnYn17Ww?=
 =?us-ascii?Q?vBxBes73pewXPU4r0IbpShSQ4rH6K5dSL/WTaWr3fVy9E3VQD8ZGNjbcdCfr?=
 =?us-ascii?Q?+c/Q1svAJ8iULTprSGqqNGhKjJKu0Nnl25GU8KdXzV1jU0U7dGSq0lIKBcw2?=
 =?us-ascii?Q?62fRI28q9IDM16g9CUIx1xMWvpvsiaulDSRuAqvFtp7Tz7dYZN+Mq+QgQW1e?=
 =?us-ascii?Q?5sj68CAdXcJBKRVAy4BLMmZw6dU744uJlV8DbNcqNIzBYQjcu5cZNuRopO++?=
 =?us-ascii?Q?JebDhbSwZQ8F789YvNcAFBkx7rZHPOnYc40FD6o19pChVjHaBmLwbwjaX0bK?=
 =?us-ascii?Q?kzZTjfsxweukHCc03hcOQX4No2WY00Z7d6bQKC5EZrPoRkgTWDRP47SlxDHf?=
 =?us-ascii?Q?pgpHE+CQC4UdCk71VgM1+34nVETdNbqc0zqLErGgcILuY4HmbN89KPpR14sp?=
 =?us-ascii?Q?12AKl1cVtf4cujpKV3BsclqO4iRRgckPG/wZVBbYJ8AL93WQ8tIZXQ9ALhQA?=
 =?us-ascii?Q?IvE9DngjEaAxPdFKK7F9pUIV6EEXSPRzrJ5zSyNRh54sVv/cl62xYzPnE9pm?=
 =?us-ascii?Q?yoVzj4Eqzxw+DFK+Bmuw1B9Ces/1llJiWmHKywlCjW6Mv8FXKFirGAGai94B?=
 =?us-ascii?Q?fESLiwzx6tdHkrriuY6xiQCv7lb+TRel48m5D5eOau5ov2A03YdVrKN3E4LG?=
 =?us-ascii?Q?+e7XagOII0XaGHBfKuFuDvsGR1XHuKXeHmpXd7JZ+4sI3PRU91vUgSrmGp64?=
 =?us-ascii?Q?NiCYssmDR5NfF0raONW0SOryK2sfNvE1tLTsmyRLuV5nZJYXeoiLpQAcHleW?=
 =?us-ascii?Q?O92l2xrumvJIgUnLqWwArwZR3TSMwYuwLQ9SzLgygSj99aD/KwwACQmpwCzX?=
 =?us-ascii?Q?BA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423642a1-dd3b-4331-aa8e-08ddeaf57b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:23:40.7756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lnGv6SgYpFH2X1tZZpB0r9xknRNwB1SM2rs2PfVD1f8cGMkBfFjKQg8gCBfHW6oY/9gJjFmJg7NKX+8MJCW6lPHsyL0KdTBr5+bfm3TVmAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6181
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Wednesday, September 3, 2025 7:44 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v11 1/5] uapi/xe: Sync latest uAPI KMD header
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Pull in latest uAPI KMD header to enable testing of madvise feature.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 290
> +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 285 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h index
> a52f95593..89ab54935 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -81,6 +81,8 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_MADVISE
> + *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>   */
>=20
>  /*
> @@ -102,6 +104,8 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_MADVISE			0x0c
> +#define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>=20
>  /* Must be kept compact -- no holes */
>=20
> @@ -117,6 +121,8 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC
> 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct
> drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE
> 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE,
> struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION
> 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct
> drm_xe_observation_param)
> +#define DRM_IOCTL_XE_MADVISE
> 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct
> drm_xe_madvise)
> +#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> 	DRM_IOWR(DRM_COMMAND_BASE +
> DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct
> drm_xe_vm_query_mem_range_attr)
>=20
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -760,7 +766,11 @@ struct drm_xe_device_query {
>   * gem creation
>   *
>   * The @flags can be:
> - *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
> + *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING - Modify the GEM object
> + *    allocation strategy by deferring physical memory allocation
> + *    until the object is either bound to a virtual memory region via
> + *    VM_BIND or accessed by the CPU. As a result, no backing memory is
> + *    reserved at the time of GEM object creation.
>   *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
>   *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using
> VRAM as a
>   *    possible placement, ensure that the corresponding VRAM allocation
> @@ -925,9 +935,9 @@ struct drm_xe_gem_mmap_offset {
>   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM
> accepts
>   *    exec submissions to its exec_queues that don't have an upper time
>   *    limit on the job execution time. But exec submissions to these
> - *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
> - *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ,
> DRM_XE_SYNC_FLAG_DMA_BUF,
> - *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGN=
AL.
> + *    don't allow any of the sync types DRM_XE_SYNC_TYPE_SYNCOBJ,
> + *    DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ, used as out-syncobjs, that is,
> + *    together with sync flag DRM_XE_SYNC_FLAG_SIGNAL.
>   *    LR VMs can be created in recoverable page-fault mode using
>   *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
>   *    If that flag is omitted, the UMD can not rely on the slightly
> @@ -1003,6 +1013,10 @@ struct drm_xe_vm_destroy {
>   *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU
> address
>   *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, t=
he
> BO
>   *    handle MBZ, and the BO offset MBZ.
> + *
> + * The @prefetch_mem_region_instance for
> %DRM_XE_VM_BIND_OP_PREFETCH can also be:
> + *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures
> prefetching occurs in
> + *    the memory region advised by madvise.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */ @@ -
> 1108,6 +1122,7 @@ struct drm_xe_vm_bind_op {
>  	/** @flags: Bind flags */
>  	__u32 flags;
>=20
> +#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
>  	/**
>  	 * @prefetch_mem_region_instance: Memory region to prefetch VMA
> to.
>  	 * It is a region instance, not a mask.
> @@ -1394,7 +1409,7 @@ struct drm_xe_sync {
>=20
>  	/**
>  	 * @timeline_value: Input for the timeline sync object. Needs to be
> -	 * different than 0 when used with
> %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
> +	 * different than 0 when used with
> %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
>  	 */
>  	__u64 timeline_value;
>=20
> @@ -1974,6 +1989,271 @@ struct drm_xe_query_eu_stall {
>  	__u64 sampling_rates[];
>  };
>=20
> +/**
> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> + *
> + * This structure is used to set memory attributes for a virtual
> +address range
> + * in a VM. The type of attribute is specified by @type, and the
> +corresponding
> + * union member is used to provide additional parameters for @type.
> + *
> + * Supported attribute types:
> + *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory
> location.
> + *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
> + *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *
> + *    struct drm_xe_madvise madvise =3D {
> + *         .vm_id =3D vm_id,
> + *         .start =3D 0x100000,
> + *         .range =3D 0x2000,
> + *         .type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> + *         .atomic_val =3D DRM_XE_ATOMIC_DEVICE,
> + *    };
> + *
> + *    ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> + *
> + */
> +struct drm_xe_madvise {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @range: size of the virtual address range */
> +	__u64 range;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +#define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
> +#define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
> +#define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +	/** @type: type of attribute */
> +	__u32 type;
> +
> +	union {
> +		/**
> +		 * @preferred_mem_loc: preferred memory location
> +		 *
> +		 * Used when @type =3D=3D
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
> +		 *
> +		 * Supported values for @preferred_mem_loc.devmem_fd:
> +		 *  - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of
> fault tile as preferred loc
> +		 *  - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem
> as preferred loc
> +		 *
> +		 * Supported values for @preferred_mem_loc.migration_policy:
> +		 *  - DRM_XE_MIGRATE_ALL_PAGES
> +		 *  - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
> +		 */
> +		struct {
> +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
> +#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
> +			/** @preferred_mem_loc.devmem_fd: fd for preferred
> loc */
> +			__u32 devmem_fd;
> +
> +#define DRM_XE_MIGRATE_ALL_PAGES		0
> +#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
> +			/** @preferred_mem_loc.migration_policy: Page
> migration policy */
> +			__u16 migration_policy;
> +
> +			/** @preferred_mem_loc.pad : MBZ */
> +			__u16 pad;
> +
> +			/** @preferred_mem_loc.reserved : Reserved */
> +			__u64 reserved;
> +		} preferred_mem_loc;
> +
> +		/**
> +		 * @atomic: Atomic access policy
> +		 *
> +		 * Used when @type =3D=3D
> DRM_XE_MEM_RANGE_ATTR_ATOMIC.
> +		 *
> +		 * Supported values for @atomic.val:
> +		 *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default
> behaviour.
> +		 *    Support both GPU and CPU atomic operations for system
> allocator.
> +		 *    Support GPU atomic operations for normal(bo) allocator.
> +		 *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic
> operations.
> +		 *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU
> atomic operations.
> +		 *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU
> atomics supported.
> +		 */
> +		struct {
> +#define DRM_XE_ATOMIC_UNDEFINED	0
> +#define DRM_XE_ATOMIC_DEVICE	1
> +#define DRM_XE_ATOMIC_GLOBAL	2
> +#define DRM_XE_ATOMIC_CPU	3
> +			/** @atomic.val: value of atomic operation */
> +			__u32 val;
> +
> +			/** @atomic.pad: MBZ */
> +			__u32 pad;
> +
> +			/** @atomic.reserved: Reserved */
> +			__u64 reserved;
> +		} atomic;
> +
> +		/**
> +		 * @pat_index: Page attribute table index
> +		 *
> +		 * Used when @type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT.
> +		 */
> +		struct {
> +			/** @pat_index.val: PAT index value */
> +			__u32 val;
> +
> +			/** @pat_index.pad: MBZ */
> +			__u32 pad;
> +
> +			/** @pat_index.reserved: Reserved */
> +			__u64 reserved;
> +		} pat_index;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_mem_range_attr - Output of
> +&DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
> + *
> + * This structure is provided by userspace and filled by KMD in
> +response to the
> + * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes
> memory
> +attributes of
> + * a memory ranges within a user specified address range in a VM.
> + *
> + * The structure includes information such as atomic access policy,
> + * page attribute table (PAT) index, and preferred memory location.
> + * Userspace allocates an array of these structures and passes a
> +pointer to the
> + * ioctl to retrieve attributes for each memory ranges
> + *
> + * @extensions: Pointer to the first extension struct, if any
> + * @start: Start address of the memory range
> + * @end: End address of the virtual memory range
> + *
> + */
> +struct drm_xe_mem_range_attr {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the memory range */
> +	__u64 start;
> +
> +	/** @end: end of the memory range */
> +	__u64 end;
> +
> +	/** @preferred_mem_loc: preferred memory location */
> +	struct {
> +		/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
> +		__u32 devmem_fd;
> +
> +		/** @preferred_mem_loc.migration_policy: Page migration
> policy */
> +		__u32 migration_policy;
> +	} preferred_mem_loc;
> +
> +	/** @atomic: Atomic access policy */
> +	struct {
> +		/** @atomic.val: atomic attribute */
> +		__u32 val;
> +
> +		/** @atomic.reserved: Reserved */
> +		__u32 reserved;
> +	} atomic;
> +
> +	 /** @pat_index: Page attribute table index */
> +	struct {
> +		/** @pat_index.val: PAT index */
> +		__u32 val;
> +
> +		/** @pat_index.reserved: Reserved */
> +		__u32 reserved;
> +	} pat_index;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_vm_query_mem_range_attr - Input of
> +&DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + *
> + * This structure is used to query memory attributes of memory regions
> + * within a user specified address range in a VM. It provides detailed
> + * information about each memory range, including atomic access policy,
> + * page attribute table (PAT) index, and preferred memory location.
> + *
> + * Userspace first calls the ioctl with @num_mem_ranges =3D 0,
> + * @sizeof_mem_ranges_attr =3D 0 and @vector_of_vma_mem_attr =3D NULL to
> +retrieve
> + * the number of memory regions and size of each memory range attribute.
> + * Then, it allocates a buffer of that size and calls the ioctl again
> +to fill
> + * the buffer with memory range attributes.
> + *
> + * If second call fails with -ENOSPC, it means memory ranges changed
> +between
> + * first call and now, retry IOCTL again with @num_mem_ranges =3D 0,
> + * @sizeof_mem_ranges_attr =3D 0 and @vector_of_vma_mem_attr =3D NULL
> +followed by
> + * Second ioctl call.
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *
> + *    struct drm_xe_vm_query_mem_range_attr query =3D {
> + *         .vm_id =3D vm_id,
> + *         .start =3D 0x100000,
> + *         .range =3D 0x2000,
> + *     };
> + *
> + *    // First ioctl call to get num of mem regions and sizeof each attr=
ibute
> + *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
> + *
> + *    // Allocate buffer for the memory region attributes
> + *    void *ptr =3D malloc(query.num_mem_ranges *
> query.sizeof_mem_range_attr);
> + *    void *ptr_start =3D ptr;
> + *
> + *    query.vector_of_mem_attr =3D (uintptr_t)ptr;
> + *
> + *    // Second ioctl call to actually fill the memory attributes
> + *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
> + *
> + *    // Iterate over the returned memory region attributes
> + *    for (unsigned int i =3D 0; i < query.num_mem_ranges; ++i) {
> + *       struct drm_xe_mem_range_attr *attr =3D (struct drm_xe_mem_range=
_attr
> *)ptr;
> + *
> + *       // Do something with attr
> + *
> + *       // Move pointer by one entry
> + *       ptr +=3D query.sizeof_mem_range_attr;
> + *     }
> + *
> + *    free(ptr_start);
> + */
> +struct drm_xe_vm_query_mem_range_attr {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_mem_ranges: number of mem_ranges in range */
> +	__u32 num_mem_ranges;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @range: size of the virtual address range */
> +	__u64 range;
> +
> +	/** @sizeof_mem_range_attr: size of struct drm_xe_mem_range_attr
> */
> +	__u64 sizeof_mem_range_attr;
> +
> +	/** @vector_of_mem_attr: userptr to array of struct
> drm_xe_mem_range_attr */
> +	__u64 vector_of_mem_attr;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.43.0

