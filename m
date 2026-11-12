Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2AB606A899
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdG/RJWh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SB3aXFec
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1901B10E196;
	Thu, 12 Nov 2026 14:22:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E8710E62E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794493262; x=1826029262;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Qcx4H/cNuM6QZrcsKXSpitnLg1P+bUkSNBoYsSUoqE=;
 b=IdG/RJWh7RnR3Xbk+GeTcB167IeVOOqNByI9nQFk0K/vqkka7oTBtzhx
 XcwOYCDNSeMZPBPRPOsrvbudelY5M2GyV2opyy1s9bK1Lsj4Mn/FK4ysN
 lc520a0ZEIhd4s9diFS7B6L7yLkc+o64HlQ8o41UySxR5hTqrCfrqodLo
 xRzRWrWX7MvwaLVvQQl1cSBqdisDt1YCOwPYK/dGkzZkJvNXkD89ha8Ga
 yGueQdiGvAzdTOWHM4yOAmicLOYJ/tw1Q0NPiVTFaed0DEE+QLlD0QFQj
 KNRwaOwx3pp16Z72gwId/vvsORzAF9dIWJP2YvfC/3cMA71yPC+LlK/Rs w==;
X-CSE-ConnectionGUID: ARimtQyASCe+x5xOP5LOfQ==
X-CSE-MsgGUID: RWpc19/LR1qhYCWo09ANAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3314074"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3314074"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:20:57 -0800
X-CSE-ConnectionGUID: /locse0zTm2yTqN1M5rmYw==
X-CSE-MsgGUID: 2rl4xHeCTfSoNFtaER5cLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10566676"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:20:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:20:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 06:20:56 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:20:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6mVKYLHm2TWaALHneP0xmXON4Z9kdKxRDHP17EnCn/fcVI5S+AIY3otJKd+eigAlx0xa2MRPuM0roSle0iigMoh/s+QHWIdudSpD8Cf5d3HHbo2l31NoY78tLl0nMMzSaNEbKpb/ZZg093IK/g3Y8QDLPhcfQGzeuDIPzTr4YSuYARF1bF7Ia9+tX+ymPIH+8RvZ9iYZ6s5suLl8Yp2d7icsieNylAkPbzZunYG99FRUE6OST0almyOKZG1kYaoNrbLR1wJRzVojmQ3xPFNWkY3DLvBedeL9L/hiLecqXEl40NZirbAeskzYwpr4Q0gSOlSYKlc0OXus/hyQTHyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WojmHkQpFcZl0DjUlip3IMMtYQOpjDcAVx08zHNZDPQ=;
 b=cvcsPY1q/232K5gJxq2ln78TE6O9ScL0TRzaUEnb0CS0RbOgraylExHhvqqAbiVJBsyrmlxs5Zr9rh8JfP/zNKQvZsBK4Vr3n2AQtFeq7eUnpXviepOx6Tc3auxiW9v8/4HQtxZGTxNpU5n2mcHcHIArEX26/5wqWohjcRGWuY2pHCHxJLF+d0G+iUcmfzgH6t0LBIj0Km6kpb49nY/N4PxCLWGuiozFnrcFn8YlMj7xnLXSXuZy6f4MoWR+YVtYKCp+HoPl3Cw1y5TpzT8DB8uRmWola5kuarHLv3nVbsrfBETYrEjNi4x7/4IjUqlIQnwASD0m2Z4oROuFIS+JvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WojmHkQpFcZl0DjUlip3IMMtYQOpjDcAVx08zHNZDPQ=;
 b=SB3aXFecW/pL0WPzCbC4oSpBR3XZrEfZhXe17Sgoh3zlhkqHe3BkJtx+XWaOh5zP8vKqi3PP4mLFLzY5gNRkXR7JRhKX8OwPh1dvxTkJJl9IX7qNh9d2y29ECxf9QeZjxejKAImKQcwIvGUP4DbjZsKSfQS4CJMGmVawi9wr1Hk=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by FT1PR11MB145389.namprd11.prod.outlook.com
 (2603:10b6:170:c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 14:20:22 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 14:20:22 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] test/intel/xe_pmt: Add testing for BMG PMT
 features
Thread-Topic: [PATCH i-g-t v2 1/2] test/intel/xe_pmt: Add testing for BMG PMT
 features
Thread-Index: AQHdZxgHzlxyIHnoRkmcjY6qUAQN6LcpVfIAgAE9K7A=
Date: Thu, 12 Nov 2026 14:20:22 +0000
Message-ID: <CH3PR11MB0461498AC12B150A1412EB87F9C1702@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261028200500.4005780-4-michael.j.ruhl@intel.com>
 <20261028200500.4005780-5-michael.j.ruhl@intel.com>
 <avTAlrBoCVKfrSds@intel.com>
In-Reply-To: <avTAlrBoCVKfrSds@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|FT1PR11MB145389:EE_
x-ms-office365-filtering-correlation-id: 5ae9dbcf-7c1a-4d1e-c397-08df40c81658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|10067099003|4143699003|11063799006|261022105027099003|261022113327099003|261022075727099003|261028144727099003|261022115727099003|261021121427099003|261026121527099003|261009223027099003|261102123227099003|56012099006|261026140227099003|38070700021;
x-microsoft-antispam-message-info: IA7MLGq1y/0sdnMI7t+nOR4Wo1Awkj7WGnleyN7tj9VIcqQjqWu+utn5QaT8Hzm3Z6Js+qWPHiHCENUOEBDiocG7u4Ym0iNyCA0jF7p4e9qo24t9opmsYNdgYBiu3T0ak3lgMkktpY9pKU/CvBHDmyssQXwWBIDovCMVSwF+TYEMCWNO16C1leevlc+IJbykKSDNwAsa+sBqwPvuTZ28S/e4UA+Gs9oiZwT1xk0EhgLtyUpO9Ie/+oIX24AKlVYra35kZdFJdd8ezknhAnzsnpdtKC6IbtcWrJ35OA/+OXA8kp0luwODNpsg3E9Mzw3Vnp8QF8nE4xY0MAfUSnwTk6bIcLqFqVSMgk7ma3KxziDNhpCbgJAiopL+pTqrJrw4w5tga1vzV1AVD/DAuAu8McAms+Mvc2Ke0lJM5Ab3MHjTf2NYT9GdbqJzFryaBEwj0NZ+9MX/kYHuqusccdUzrB2jEaO2yYMAzdktQwm1ReAgbzI8F1AdSjNrbjQOCJ3wtrLBNcyJmTfcQjZdrMkyU4b3PO92quGt9EhFeWmp7eWuczO30iuuxUaDYCvWRvxpjGlv3o3cGIQYLbW5c6P/R/68+YEfUn02VV2R2SPE+W1cSZUwvNPyvdAw8xJ1sIAlziaUygPvAr3nw6VzkM5liF0is8s0uxXSKV5hX2815EkNyqEk7F5gz4A35dWvMW5kDGV39s285KoKP/OaCDSOiT06gf2H9SeVVhNyVc1zHVE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(11063799006)(261022105027099003)(261022113327099003)(261022075727099003)(261028144727099003)(261022115727099003)(261021121427099003)(261026121527099003)(261009223027099003)(261102123227099003)(56012099006)(261026140227099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4PjcKd6jn1TDoBkPAzm+sHr3tPRXAEyWZ1tSAUoKinpJylgtGZs1ayHV/XxV?=
 =?us-ascii?Q?afSzgVOB08rHEy9s7XIw96EN6P8AhdX1NEAl15qr/ZOPSXV2thvl48JFJPZA?=
 =?us-ascii?Q?Ntl08yFFpZTOSMThknMbH3nzaIRX0gfElGvtSUAbH75P0n59fhZ9tYu8hVZp?=
 =?us-ascii?Q?x2B7nfmyrfyg0rvl42y9i5+TYy4eW9/0puIb5HZuDTkw//E7XImrHXXACtSP?=
 =?us-ascii?Q?FCcsaJeLlfr5ShBm5E/PM9Ybmm0Vgj3H1MPEYOxNbXE4fEujWyv0/TSCsvor?=
 =?us-ascii?Q?/pOPzV9KbckDrFOJbEgAiAG2nqqe8ASeTog7d9UnkX4U15nJkbg3oRiik94R?=
 =?us-ascii?Q?Z3iHed1IsE5SNhsHSJGfJG1X4/N6uw6W2P7INsUDiGRltIjMRYbbYW61scuy?=
 =?us-ascii?Q?3ZqPF13GJqL88n44AiJCZnBySi9/h+RtsaalRJFZXATM/PnjFf+tTSMHx1Wv?=
 =?us-ascii?Q?+Vhuv8k9/ytEWiTPcSWv9pi28/jRUkU9k6e+RuVkI+6vlWfKR8tY4CG5pwQG?=
 =?us-ascii?Q?QUX31rgGtjdntjnKlPu1yH1Jue5Gwc0V3YyuGfOfGEgypVAcdefY/kf0cv7X?=
 =?us-ascii?Q?DtZzCVYg54UFgqkaeRACR6h4fqB1wke7DAlRKMX6PW+tTFAjjlkBpQj/ZhA4?=
 =?us-ascii?Q?eDLktvJZG2vD8OzRcVIOYxSHxsO+NLQJKHLS9ZmBIoGMk0/enT9W5eMoXZ+o?=
 =?us-ascii?Q?1dEbvDZ2BScff07tFuLO0vrLg2TAvj1VkrsCIQ4YwSGSoUA0/kXDotlG7E2Z?=
 =?us-ascii?Q?bsyKZzWncTDYX/+b2YX9mw0IFpM7kSL8Qe2GwFXiV2CXSwv1SO7EeTfhhZB2?=
 =?us-ascii?Q?bxyUt5aZ2kgiOv/QvFGa/WSlXAs2xjfRWF7YmHDns4iGOG1kw0bwpR5aaizB?=
 =?us-ascii?Q?u8e5HyfUaIClYv5srTBhTxTivNUyX+kf5rYYKAMgnYx0IQtHLxVlqJNuDTpD?=
 =?us-ascii?Q?U8S0nMLokZDMDVZp9eAmjWqaOI9cZ1UhhN/L/8b2goO03k/MeDO5paPFPfWw?=
 =?us-ascii?Q?HW7++/P2MmWHnzT+IQKpHix1eSrf7XRTwRhKVCBXrg7L6HAj7R1sJ3amoi8p?=
 =?us-ascii?Q?MDqSQscyxwwLhpToELo5T889rsg3F5FrRSzilqaYO1R/drg2bueZuyMwV+pU?=
 =?us-ascii?Q?1Z46tMGulu2E13cIZ5FTE3sNEcZP/At7XLxyCbo15n+7MxYfJbh4zXvVO9tK?=
 =?us-ascii?Q?g6Ia6J3YYOGlMxnqVRj48s0maRgzhSqFU4V+Xnb7SFoJugk7r4Rd7n5xdYS+?=
 =?us-ascii?Q?/F30EqPvIXL1kr9YvmWXjVFJZFJ/GhphGKI8HO4YjAAwi/YFlsiexVLjzDJT?=
 =?us-ascii?Q?B4gnIgw7FSQTdcWRmY06BySI8JjXsFBIfkOQWcs+tLWiafdMWG5ZQ3H/3+N2?=
 =?us-ascii?Q?m6I96o0Rn6R5M5Fz94jbL7zK51mbziJUY2g4dCHIgVMjU/7KAcgA6XDsYeZq?=
 =?us-ascii?Q?WjpsgRBIhZT19QkCwYd7niPzjRtsaV10Gb/S7u0JIIHBvV/aKIlWnNRf8YHk?=
 =?us-ascii?Q?Z2KRudtc75kx30x4qbcX84V11kbNL/p6dwCI1zvKhtbZuWR/Xopz0nDJSQiW?=
 =?us-ascii?Q?lJpaVokG7Tpr3L12wjMME1FwlQ+oImucU4UEvSjYyKbEF3DWUH/PphUxLQWw?=
 =?us-ascii?Q?0L4OUTTxw4U47RBg1y1QLS78wFg8N405Px1vDh3pMclY4b4qUNb3Li9xXHxs?=
 =?us-ascii?Q?TjZogQvnWR6BzDtuf3Oba0dn9p4cURF8Yym8/s7xVUzWcCEKjMW5140HpjX4?=
 =?us-ascii?Q?j1ckLynRsg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JJEzWaYZpU8tGtl8QJypBo6GgoiMiq8VDUKYty4i7rwuT1Z0sGRaY2t6FtLY43nwW3cgWLNSuS/Z4LFhECf+ho77kZOvGtNcjX3FNsJTKlp9NgN/JhIWV5uM343qRv/wxydrJMRnLSmp4sU9fj8JDJZ4brOFVsP7+vQlXSaHd80Kj+Kd1epJwFaOwFKw7uBKJaX+BzBUVAvBYuC9x4rBN7ojZtv9dLrf6ZTy3xmK6IQ9YnFzHOlyU3XCm6T6tpqBC19aoBCpEnul7tErl7YDnmXuaZ/mAH0MNZwDhtb9pm1g7D09dylGlTh7dLKhGRpd2aLmzHPx/3F8yVV0aqsGMQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae9dbcf-7c1a-4d1e-c397-08df40c81658
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 14:20:22.1760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGzjdfB13VdPdA3n0HFsV43wwfidHhWJYsM+SUIAZt5ixLgR8SIxe6Af5tgA7D02wIAfgNlgd1PcAKo4SibqENumfqK0WZAoskwNatY82NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB145389
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Wednesday, November 11, 2026 2:23 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Scarbrough, Frank
><frank.scarbrough@intel.com>; david.e.box@linux.intel.com
>Subject: Re: [PATCH i-g-t v2 1/2] test/intel/xe_pmt: Add testing for BMG P=
MT
>features
>
>On Wed, Oct 28, 2026 at 01:05:01PM -0700, Michael J. Ruhl wrote:
>> Battlemage (BMG) devices have the Platform Monitoring
>> Technology (PMT) telemetry and crashlog features. If the
>> device present is a BMG, test the PMT API.
>>
>> NOTE: the testing order is not flexible and must be done in
>> the currently specified order.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  tests/intel/xe_pmt.c | 562
>+++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 562 insertions(+)
>>  create mode 100644 tests/intel/xe_pmt.c
>>
>> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
>> new file mode 100644
>> index 000000000..af5d470b5
>> --- /dev/null
>> +++ b/tests/intel/xe_pmt.c
>> @@ -0,0 +1,562 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (c) 2025 Intel Corporation
>> + */
>> +
>> +#include <unistd.h>
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +#include <limits.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +#include "linux_scaffold.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * TEST: Verify Platform Monitoring Technology (PMT) files operations
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: sysfs
>> + * Description: Verify that the available PMT files (crashlog and telem=
etry)
>> + *   are created, are accessable, and respond as per design.
>> + *
>> + * SUBTEST: pmt-bmg-all
>> + * Description:
>> + *   Exercise the BMG PMT feature
>> + *
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Verify Platform Monitoring Technology (PMT) files
>operations");
>> +
>> +/* base directory names */
>> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
>> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
>> +#define CRASHLOG_DIR "crashlog"
>> +#define TELEMETRY_DIR "telem"
>> +
>> +/* itemize the available instances for the specific device */
>> +enum bmg_crashlog_instances {
>> +	bmg_crashlog_punit =3D 0,
>> +	bmg_crashlog_oobmsm,
>> +	bmg_crashlog_max
>> +};
>> +
>> +enum bmg_telemety_instances {
>> +	bmg_telemetry_punit =3D 0,
>> +	bmg_telemetry_oobmsm,
>> +	bmg_telemetry_max
>> +};
>> +
>> +static char dev_path[PATH_MAX];
>> +static char work_path[PATH_MAX * 2];
>> +
>> +/*
>> + * In most case there should be a single instance of the crashlog and
>telemetry
>> + * directories. If DVSEC entries are not contiguous the structure will =
be
>different,
>> + * and the code will need to reflect the structure.
>> + */
>> +static char crashlog_vsec_dir[32];
>> +static char telemetry_vsec_dir[32];
>> +
>> +/* This needs to be specific for each supported device */
>> +static char crashlog_dir[bmg_crashlog_max][32];
>> +static char telemetry_dir[bmg_telemetry_max][32];
>> +
>> +/* telemetry file names */
>> +static const char *telem =3D "telem";
>> +
>> +/* crashlog filenames and descriptors */
>> +static const char *clear =3D "clear";
>> +static const char *consumed =3D "consumed";
>> +static const char *crashlog =3D "crashlog";
>> +static const char *enable =3D "enable";
>> +static const char *error =3D "error";
>> +static const char *dev_guid =3D "guid";
>> +static const char *rearm =3D "rearm";
>> +static const char *trigger =3D "trigger";
>> +
>> +struct crashlog_v2_info {
>> +	int clear_fd;
>> +	int consumed_fd;
>> +	int crashlog_fd;
>> +	int enable_fd;
>> +	int error_fd;
>> +	int guid_fd;
>> +	int rearm_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +} bmg_info[bmg_crashlog_max];
>> +
>> +#define DEV_PATH_LEN 80
>> +
>> +/*
>> + * device_sysfs_path:
>> + * @fd: opened device file descriptor
>> + * @path: buffer to store sysfs path to device directory
>> + *
>> + * Returns:
>> + * On successfull path resolution sysfs path to device directory,
>> + * NULL otherwise
>> + */
>> +static char *device_sysfs_path(int fd, char *path)
>> +{
>> +        char sysfs[DEV_PATH_LEN];
>> +
>> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
>> +                return NULL;
>> +
>> +        if (DEV_PATH_LEN <=3D (strlen(sysfs) + strlen("/device")))
>> +                return NULL;
>> +
>> +        strcat(sysfs, "/device");
>> +
>> +        return realpath(sysfs, path);
>> +}
>> +
>> +/*
>> + * Verify the PMT directory structure
>> + *
>> + * BMG PMT directory structure:
>> + *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>> + *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>> + *
>> + * Note: different platforms could have a different pattern
>> + */
>> +static void test_pmt_directories(int dev_fd)
>> +{
>> +	struct dirent *ent;
>> +	int index;
>> +	DIR *dir;
>> +
>> +	igt_assert(device_sysfs_path(dev_fd, dev_path));
>> +
>> +	/* verify top level PMT directories */
>> +	dir =3D opendir(dev_path);
>> +	igt_assert_f(dir, "no directories found\n");
>> +
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name,
>sizeof(VSEC_CRASHLOG_DIR) - 1) =3D=3D 0)
>> +			strcpy(crashlog_vsec_dir, ent->d_name);
>> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name,
>sizeof(VSEC_TELEMETRY_DIR) - 1) =3D=3D 0)
>> +			strcpy(telemetry_vsec_dir, ent->d_name);
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n"=
);
>> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry
>directory\n");
>> +
>> +	/* verify crashlog directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	/* find the crashlog<x> directory instances */
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(CRASHLOG_DIR, ent->d_name,
>sizeof(CRASHLOG_DIR) - 1) =3D=3D 0) {
>> +			if (index < bmg_crashlog_max)
>> +				strcpy(crashlog_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_crashlog_max, "too many crashlog entries
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(crashlog_dir); i++)
>> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d]
>directory\n", i);
>> +
>> +	/* verify telemetry directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(TELEMETRY_DIR, ent->d_name,
>sizeof(TELEMETRY_DIR) - 1) =3D=3D 0) {
>> +			if (index < bmg_telemetry_max)
>> +				strcpy(telemetry_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_telemetry_max, "too many telemetry entri=
es
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(telemetry_dir); i++)
>> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d]
>directory\n", i);
>> +
>> +}
>> +
>> +static void find_pmt_file(const char *path, const char *file)
>> +{
>> +	struct dirent *ent;
>> +	bool found;
>> +	DIR *dir;
>> +
>> +	dir =3D opendir(path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	found =3D false;
>> +	while ((ent =3D readdir(dir)) !=3D NULL)
>> +		if (strcmp(file, ent->d_name) =3D=3D 0)
>> +			found =3D true;
>> +	closedir(dir);
>> +
>> +	igt_assert_f(found, "missing %s from %s\n", file, path);
>> +}
>> +
>> +static void open_pmt_file(const char *path, const char *file, int *fd, =
int flags)
>> +{
>> +	char file_path[PATH_MAX * 2 + 1];
>> +
>> +	sprintf(file_path, "%s/%s", path, file);
>> +
>> +	*fd =3D open(file_path, flags);
>> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
>> +}
>> +
>> +/*
>> + * verify that the expected telemetry file(s) are in place
>> + */
>> +static void test_pmt_telemetry_files(int dev_fd)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < bmg_telemetry_max; i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>> +			"intel_pmt", telemetry_dir[i]);
>> +		find_pmt_file(work_path, telem);
>> +	}
>> +}
>> +
>> +/*
>> + * verify that a read will be successful
>> + */
>> +static void test_pmt_telemetry_read_data(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t *val;
>> +	u_int32_t guid;
>> +	int telem_fd;
>> +	int guid_fd;
>> +	int ret;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < bmg_telemetry_max; i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>> +			"intel_pmt", telemetry_dir[i]);
>> +		open_pmt_file(work_path, telem, &telem_fd, O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid, &guid_fd, O_RDONLY);
>> +
>> +		ret =3D pread(guid_fd, buf, sizeof(buf), 0);
>> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> +		guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(guid > 0, "failed to get guid for device %d\n", i);
>> +
>> +		len =3D read(telem_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read telemetry
>data\n", guid);
>> +
>> +		val =3D (u_int32_t *)buf;
>> +		igt_assert_f(*val !=3D 0xffffffff, "0x%x: invalid telemetry data
>value: : 0x%x\n",
>> +			     guid, *val);
>> +
>> +		close(telem_fd);
>> +		close(guid_fd);
>> +	}
>> +}
>> +
>> +/*
>> + * verify that the expected crashlog files are in place
>> + */
>> +static void test_pmt_crashlog_files(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	int ret;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>crashlog_vsec_dir, "intel_pmt",
>> +			crashlog_dir[i]);
>> +
>> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, consumed,
>&bmg_info[i].consumed_fd, O_RDWR);
>> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd,
>O_RDWR);
>> +
>> +		ret =3D pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
>> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> +		bmg_info[i].guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device
>%d\n", i);
>> +	}
>> +}
>> +
>> +#define ENABLE_MSG "1\n"
>> +#define DISABLE_MSG "0\n"
>> +
>> +static bool send_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pwrite(fd, msg, len, 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>> +			 errno);
>> +
>> +	return ret =3D=3D len;
>> +}
>> +
>> +static bool verify_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	char buf[32] =3D {};
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pread(fd, buf, sizeof(buf), 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>errno);
>> +
>> +	return ret =3D=3D len && strcmp(buf, msg) =3D=3D 0;
>> +}
>> +
>> +/*
>> + * Set enable enable/disable bit and verify usage
>> + */
>> +static void test_pmt_crashlog_enable(int dev_fd)
>> +{
>> +	u_int32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].enable_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* force enable so we are in a known state */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify enable\n", guid);
>> +
>> +		/* disable */
>> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send
>disable\n", guid);
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x:
>verify disable\n", guid);
>> +
>> +		/* re-enable so we can do more testing */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify re-enable\n", guid);
>> +	}
>> +
>> +}
>> +
>> +/*
>> + * The error bit is set when a crashlog fails in HW.  It is read only s=
o only
>> + * need to verify that it is "0".
>> + */
>> +static void test_pmt_crashlog_error(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG,
>error),
>> +			     "0x%x: error clear\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * The rearm bit is set at cold boot.  It cannot be reset unless are re=
al crashlog
>> + * occurs (i.e. setting trigger will not change its value).  Verify tha=
t it is "1".
>> + */
>> +static void test_pmt_crashlog_rearm(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG,
>rearm),
>> +			     "0x%x: rearm set\n", guid);
>> +	}
>> +}
>> +
>> +//#define PMT_CRASHLOG_TRIGGER_ENABLE 1
>> +#if PMT_CRASHLOG_TRIGGER_ENABLE
>
>Sorry for the late reply. One idea that AI gave me and I liked:
>Instead of the #if, make it a separate subtest, e.g. pmt-crashlog-trigger,
>that does igt_skip_on_f(!getenv("IGT_PMT_DESTRUCTIVE"), ...)
>(like meta_test.c), and add it to tests/intel-ci/xe.blocklist.txt.
>Then it always builds, CI never runs it, and you run it by hand with
>
>IGT_PMT_DESTRUCTIVE=3D1 --run-subtest pmt-crashlog-trigger.
>
>with this change:
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>

I like this idea.

The tests need to be strictly ordered and splitting them into a separate te=
st will
be difficult.

Would this be acceptable?

--
static void test_pmt_api(int fd, enum pmt_device pmt_dev)
{
	test_pmt_directories(fd, pmt_dev);

	test_pmt_telemetry_files(fd, pmt_dev);
	test_pmt_telemetry_read_data(fd, pmt_dev);

	test_pmt_crashlog_files(fd, pmt_dev);
	test_pmt_crashlog_error(fd, pmt_dev);
	test_pmt_crashlog_enable(fd, pmt_dev);
	test_pmt_crashlog_rearm(fd, pmt_dev);
	test_pmt_crashlog_inited(fd, pmt_dev);

	if (getenv("IGT_PMT_DESTRUCTIVE")) {
		test_pmt_crashlog_trigger(fd, pmt_dev);
		test_pmt_crashlog_consumed(fd, pmt_dev);
		test_pmt_crashlog_clear(fd, pmt_dev);
	} else {
		igt_info("PMT destructive crashlog skipped\n");
	}
}
--


int igt_main()
>> +/*
>> + * Set the manual trigger bit and make sure the data is not 0xdeadbeef
>> + */
>> +static void test_pmt_crashlog_trigger(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t *val;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: trigger clear\n",
>> +			     guid);
>> +		/* set the trigger bit (1 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: set trigger\n", guid);
>> +
>> +		/* sleep to let the HW do its thing */
>> +		sleep(1);
>> +
>> +		/* make sure the bit is set */
>> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: trigger not set\n",
>> +			     guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		val =3D (u_int32_t *)buf;
>> +
>> +		igt_assert_f(*val !=3D 0xdeadbeef, "0x%x: invalid trigger value: :
>0x%x", guid, *val);
>> +	}
>> +}
>> +
>> +/*
>> + * After a crashlog has been "consumed" (read), setting this bit can be=
 done.
>> + * Verify that it is set correctly.
>> + */
>> +static void test_pmt_crashlog_consumed(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].consumed_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* check, set, verify */
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x:
>consumed clear\n", guid);
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x:
>set consumed\n", guid);
>> +		/* sleep(1) to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x:
>verify consumed\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * Test the clear crashlog bit. After setting the crashlog data buffer =
should be
>> + * set to 0xdeadbeef.
>> + * BMG supports writing "1" to the clear file, but writing "0" (DISABLE=
_MSG)
>to trigger
>> + * file is the "standard" usage, so test that usage.
>> + * This bit cannot be cleared by software (i.e. reboot required).
>> + */
>> +static void test_pmt_crashlog_clear(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t guid;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	int clear_fd;
>> +	int *val;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		clear_fd =3D bmg_info[i].clear_fd;
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>> +
>> +		/* set the clear bit (0 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: send enable\n", guid);
>> +
>> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x:
>clear set\n", guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		val =3D (int *)buf;
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef, "0x%x: invalid clear data value:
>: 0x%x", guid, *val);
>> +	}
>> +}
>> +#endif
>> +
>> +/**
>> + * SUBTEST: pmt-bmg-all
>> + * Description:
>> + *   Because of how the Crashlog Instances behave, these tests are orde=
red.
>Do not use them
>> + *   individually unless you understand the underlying HW behavior.  Be=
cause
>of this behavior,
>> + *   all of the test will be done in order in one step.
>> + *   NOTE:
>> + *     o Testing MUST be done after a cold reset
>> + *     o Once crashlog is triggered the device behavior is undefined an=
d
>requires a cold reset
>> + *
>> + *  Test category: functionality test
>> + */
>> +static void test_pmt_bmg(int fd)
>> +{
>> +	test_pmt_directories(fd);
>> +
>> +	test_pmt_telemetry_files(fd);
>> +	test_pmt_telemetry_read_data(fd);
>> +
>> +	test_pmt_crashlog_files(fd);
>> +	test_pmt_crashlog_error(fd);
>> +	test_pmt_crashlog_enable(fd);
>> +	test_pmt_crashlog_rearm(fd);
>> +
>> +#if PMT_CRASHLOG_TRIGGER_ENABLE
>> +	test_pmt_crashlog_trigger(fd);
>> +	test_pmt_crashlog_consumed(fd);
>> +	test_pmt_crashlog_clear(fd);
>> +#endif
>> +}
>> +
>> +int igt_main()
>> +{
>> +	const struct {
>> +		const char *name;
>> +		void (*func)(int);
>> +	} funcs[] =3D {
>> +		{ "pmt-bmg-all", test_pmt_bmg },
>> +		{ }
>> +	}, *f;
>> +	int dev_fd;
>> +
>> +	igt_fixture() {
>> +		uint16_t dev_id;
>> +
>> +		dev_fd =3D drm_open_driver(DRIVER_XE);
>> +		dev_id =3D intel_get_drm_devid(dev_fd);
>> +		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on
>BMG GPU\n");
>> +	}
>> +
>> +	igt_describe("PMT access and API testing");
>> +	for (f =3D funcs; f->name; f++) {
>> +		igt_subtest_f("%s", f->name)
>> +			f->func(dev_fd);
>> +	}
>> +
>> +	igt_fixture()
>> +		drm_close_driver(dev_fd);
>> +}
>> --
>> 2.43.0
>>
