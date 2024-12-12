Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B70FE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 08:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFFC10ECFF;
	Thu, 12 Dec 2024 08:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7rVyaTJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1C410ECFF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733993204; x=1765529204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7k26761tRFp8TcIcBOjRlJcZTjW5osRxhQCA2ColgT0=;
 b=F7rVyaTJofWhbZJyL0ppH2fTUXhdqrE8jTI/Rj0kaE3Hvl/qhfhIV2ny
 Ivc2op/VC4KDWrYpGIbp3HBkMIZKw//29FIr/HzFLJMxiFT2Bl69eVZo6
 VVOCdKWuW8ORyRuNOi8oBH8BEp9bxZu7xuPBdNSgIUZi3EAIQ1JOio3GF
 6r/NMr+oR7YLIW5TJySYq7aUFkXP5h9brWDaU9jft71oVKtQdD1jO7Mpk
 vGtiXV22j5pvhAeCdxm+pXwqBA7svV+Fi/F4WdFOEbqNvbvNFhArXb4eo
 p+Ykv44tJPV1QoFrQQJLjOUCUgMcQGHaR+2a4w/tvs8za8JJUe4MqNabl Q==;
X-CSE-ConnectionGUID: +93YpX3LT8u8+HlruVco6A==
X-CSE-MsgGUID: Gbed7DUBSeu8/LIwbVhcZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45807264"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45807264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 00:46:43 -0800
X-CSE-ConnectionGUID: AkQ7M8A2QNe5FoMNstaifQ==
X-CSE-MsgGUID: akcEr1ziSvaWP9D+1YAqEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100316298"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 00:46:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 00:46:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 00:46:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 00:46:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR+izubS7zPp2HJiuPSrYjKKjb9EThvUAuMubzFGGR37FwnICXF0plvphCAYVBhXL5ymyDObnCj0dkRL7Lczj0vllWd+6uVDIkP6+iEX/5seklhk4azZzGSCpHzSc1nMuV6IwoUYwFB7IEuh9W1gcBElY2ZPJ8FCLDuxgWqD7rB+yBN3+NoCn+8wiyrz0AwvtuKerYh4a76KqXisRoZa/AEco1l7OxHK/Q3bNlWAQm73R6g6yIGfe0JrozYZw8DOccM09XPsnbVUys7UkZ3l/LEcLAs0Sj+6gEkA6G6t8R4PT6ar/ME3HH7wheMxk76vOXZgDCN0bI8rKcE7LW/2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8XD2P+Autv/avw7KmGZmm3AIWFW5mZrMwRpDjHFHyk=;
 b=A3Dda4/Gqm7e+yTgRRlbwUmHgdPG/y8pBiR/+NkmIypyt5Il8sMXNaJS3CthJjUZ/OCMDtFZYduIsVzaO2KEOf8FeXzla4kEAZe/V6T/OKv7tw3zRxznuL4FrKCVfV90zmkBFrYfYu0drNihRzYo6c9JjjxiYI6Nyeg28ZtHorZFdg/bcRMdhjK3wZJ4PMtrnDhk5u2G4nt4VQXb84StqCxDu/CrtJKA2j8dhkl2uF2b5f1NI7lr4nP6tHAbQ17h+aITKVIU+1+BokZqoPY+p0+iV78dYNexyHpHgH2Z0Yq3ReEcpYBFS9JnWXktpQdJx7j24PjUEySpRMCp9TS/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 08:46:26 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 08:46:26 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/xe_eudebug: Set NEEDS_VISIBLE_VRAM for
 'create_bind_list'
Thread-Topic: [PATCH i-g-t 1/2] tests/xe_eudebug: Set NEEDS_VISIBLE_VRAM for
 'create_bind_list'
Thread-Index: AQHbTAFr9tdqkAZc7E+t2l6bv4f2U7LiTBcQ
Date: Thu, 12 Dec 2024 08:46:26 +0000
Message-ID: <DS0PR11MB72640A4BD179C7FA2971F2B8D93F2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241211191741.36973-1-christoph.manszewski@intel.com>
In-Reply-To: <20241211191741.36973-1-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB8197:EE_
x-ms-office365-filtering-correlation-id: 007b854c-f278-45c2-e928-08dd1a8976c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?RYsf6m8/ZBjup5JGAK0Bq7yI8iN3Jp7CUeNNwLLlffsi3dOMrsjdtPH/6I?=
 =?iso-8859-2?Q?fTJxTKLrdAimOk/Z14H9l+4PnClAOaTAY2LgktXXsdtE0JqkaRNvbl5qZZ?=
 =?iso-8859-2?Q?kA2rSOLKfyjOv1sD4L0zsZWK6DqWeRBT3fSqp5hDmcOxjErWWxBaOugxqm?=
 =?iso-8859-2?Q?lVf32FW19mac9XkIFzwJ2pYFfpIiJRG9+WShej/bEoP/M47CPh0xqg2Yg3?=
 =?iso-8859-2?Q?MBSYNHX2WQNTmNwaNYSW31+EmIuCtCaPuNa89yB9FJDoLXNSJktAIg5azF?=
 =?iso-8859-2?Q?Gj2hdXptgkk9gyw4z8DQ9FGllr5Z5/5iOmo9spuDcL1tb4N59S8JZHzGAT?=
 =?iso-8859-2?Q?f7rCyaMI9dUFXrpuvrmxs2e9/U3WuWBc855cF1iqbYRWBTIz516DKd9px+?=
 =?iso-8859-2?Q?Lzet4jBitlqY8Na6QaWxr1Zt7w0z5YLQ4wJS2V4bqegz+TBQkWV52OKqki?=
 =?iso-8859-2?Q?AGpHea9gOt1TUYcMlT0Hl8BQpy1ycMxczzNWqZQIFiTiQk5oNvW0HkxnDb?=
 =?iso-8859-2?Q?i/AS4pv5W3vdd849jWCRUe6UdjTcuhKCw1nLFdOvhmt+4SbACGQsUEzebk?=
 =?iso-8859-2?Q?eGRQtX9F2mPB2hy4qdhHX9t0V2Mn75T51qIOhwUdBkymqwOi6ZQJ59AFmy?=
 =?iso-8859-2?Q?yh4N08Bvk1D32foJs86UuqH0XuVjWVIevfhSDXKMGPIvAgAIFRfQmqtwKN?=
 =?iso-8859-2?Q?pkY6Fy07kE8NWnjfM1Ttj2fWBiFTlVA+CruDaS/1/pf+E3w75nAA0oKKxa?=
 =?iso-8859-2?Q?R5hID1SyIESwpyX6aWjQq1DQQbjPckqwvFrBO7V2JNy5BjYN4cGXqbde4u?=
 =?iso-8859-2?Q?pFnx1osllRu5RFy8FtpefeKr8qzEpOeifHEp1KqHgrFENSPM2mHLdaaxAU?=
 =?iso-8859-2?Q?W+IeSrWfwWdyfICiA1AFlnmObH2pk0CKGPRWPhP+h62nC73ecHefnfBma4?=
 =?iso-8859-2?Q?r7dOlIwfMQV631lPslFfb4BrDXSHJQPoxQpzJkUkNKJoTEUFRcagr+Vx/e?=
 =?iso-8859-2?Q?5xgkF4iMPCNJVljr2A7H7M8BcJ/o6OuzU1KH4oZ5HJR55uK/ONKNp1orDb?=
 =?iso-8859-2?Q?DKs2ydaDXdbQqjz1eagGuULf/QyN86xPJaROiAssVmVDuv23iPydpMdUOo?=
 =?iso-8859-2?Q?r75xLP9vTTGr0UCYwZYuCI4sJrGKftp7Oiuit83oLv3WIlRTpE6pprTGEX?=
 =?iso-8859-2?Q?YY4X88bKfOPhucssBLZ/ceNTg+AtYqRZG2I8qOsmItMsKnKjRuCsMljUzB?=
 =?iso-8859-2?Q?LQ96alzXt9hFJEELGmfvwlSepu1J7YeOeLJL4VwVav1I0hOcqdb0XqzgNz?=
 =?iso-8859-2?Q?7t72JKK90SmC2QnqGnf+JJK0Af0Gx7jFhymONDD1KgEm8kc+ppnNwND2bZ?=
 =?iso-8859-2?Q?cs9ZV/VTm2hNKvH4gT/bzkBwh6K6HmQtnulwBZPmAcg/Woq2fiCElxkk2N?=
 =?iso-8859-2?Q?i6Rzt33mTsOtdxnVMoxAsB2Vx1npPmKHsoI6Zg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?Olw/A+MYleWsF+qV3vto0EZ9yubeWz2K92ZA7e3Igi7RPQMOnif3ETw2/U?=
 =?iso-8859-2?Q?frd1CaGD32GSjToqQVywcHbymbOs6g0rMWM73LqABmIoVOU8I9oxmikaT5?=
 =?iso-8859-2?Q?uYJOpT8Ul6XlF3DXwhf6MNdAunN3K3Oe+aoTdwB8vmCTW9CzxMMNehUC/G?=
 =?iso-8859-2?Q?Td3NC7/0FeZbpsACazm5E5gnTa5dIbzYOAa/Iuvfm7yjmf5kHsX3gfv9Kb?=
 =?iso-8859-2?Q?ny8LGfHQ+NZ32O7CPs4jUkljuXRtFybEJ3/642XfGYs6DHR102U4fKXpHY?=
 =?iso-8859-2?Q?uNr4OdgL/cI4h1RtaSrlzI08VNJD0Ws098VoAX1QxlRQlWsjws67QwuCRl?=
 =?iso-8859-2?Q?X+uYzMTidXD5sHVJRKpYtLSWt6z4ZWDvM7knLOGoBayyXl2BNB2h9Oz/O3?=
 =?iso-8859-2?Q?IoKLuZLsRtZN8iYzsmtkZrztmEhHiTgCzFnJkhkXMgD7nKyABgUoorVsPt?=
 =?iso-8859-2?Q?00fCfLE9rdLTCV1CU/KtCQqDYOvd/l9OaUTKEZut9pC26UkeVwOg1et6Nz?=
 =?iso-8859-2?Q?xajOJY9H5eXbWvTWhhbe5Lxr0QTqD4fa9ASPFksoe1aN9jvgDXIKBMhIHU?=
 =?iso-8859-2?Q?QVH87BhKaloA++2iMr0fgrqXnJXVB4UA0eVVTqPeKot59arMJTKxClDye2?=
 =?iso-8859-2?Q?1tYA9jcZA6yDXQn9agfQsgXY36rX5q2EL1IPWDq9G6uYVeUWsICUHa2Mwp?=
 =?iso-8859-2?Q?SQBOGd5mN+dWccqDcJtHmvHAXMsjKp94eJ7TQmgCv7scnCxuhssBFlBwUh?=
 =?iso-8859-2?Q?cWhHkFefxCr9/e5OPEnFxHFiheOTI1TQitbpqOlLwElGG3aPaIYrt1ICpf?=
 =?iso-8859-2?Q?FKj0mKvCKsNxX6gb296zYEzXzGPRjoYvSuvme/lExdVdBk+F/HfuCpEY03?=
 =?iso-8859-2?Q?Mm7tFMtfH7SribpLIcwGoKT+GHxVEHPHUXFmRzffG0kIO2sOsbh3u/cVb3?=
 =?iso-8859-2?Q?4jMrkHP4LOLc3P5SXhpODzYJFDT6pUvBShvXnz4oxf+CjQaLUEyGUougAZ?=
 =?iso-8859-2?Q?QcDKk5QucNRvy9m5LoTXcln0Z+5ZY1LnRjg0CyeYVrseM3pfn8HzC9oPs1?=
 =?iso-8859-2?Q?Ke/0xV2pTxuvoj2ASXLDxcZ3CkFkfFBjf2I3o6DkDFpP+yV10sa37eyOLG?=
 =?iso-8859-2?Q?Q7erZdhXhiyXPaEWc+NqyRbJf2cpwOlkMAXpRdw+Xkak1BgYiUb8BqP9qW?=
 =?iso-8859-2?Q?lxc1V1iZG7wL6ip+fiVb0p32p0DnW3MGFnyPOp4qZ57V2sNvuUSSeUqo8e?=
 =?iso-8859-2?Q?2ihqb9o+2NOUotZOvdlG1FUpzQlaEVlxMSEimADvLQ77YkhcgkiJBxIO+J?=
 =?iso-8859-2?Q?805giJSO3Xy0E9SiexAJLBkGwQXEFzmx/FBlFUr20z8arIxUK/itBNm2Tg?=
 =?iso-8859-2?Q?ANfcRLHgDjXWslidlHP8aKW5YkfbhCS6JlqiAde+vmt70OtYLE6Jfni+8m?=
 =?iso-8859-2?Q?FzYKbz/2R63G/jg0TRSWKdAHmQfFA/fU2vds0Ymo+Of6JA1B0ZqSvDmcju?=
 =?iso-8859-2?Q?jR1EoNrsp4VY49uLZbFDuUjYj4sHk89naUZHgVBFEyKffE/4AYMbvbq94i?=
 =?iso-8859-2?Q?rJqYFTiNjMkPJ5ninOqfyPotNsgRrKkRJaN3MLw5AYe6TOttLPECRtl/WB?=
 =?iso-8859-2?Q?PIeXL5j1sYLLJ1zMoMrQ3rEeXAkG+B5aclE+beq+L/eLaVeaI4BI+UTA?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007b854c-f278-45c2-e928-08dd1a8976c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 08:46:26.1694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YygwZPbWU6YGjWtVExkyP6U/HJj5QqV1yjvx19BGSkefgfkTWqlXhVgkakVbzPacK/HtBJMP1uC6U4PX1sygnfwkb+7PZVbvABvH15C09Sly3FAUNcZWTel6Yea264mK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Wednesday, December 11, 2024 8:18 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Manszewski,
> Christoph <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/xe_eudebug: Set NEEDS_VISIBLE_VRAM for
> 'create_bind_list'
>=20
> The 'create_bind_list' function supports custom bo placement. Some subtes=
ts
> like 'basic-vm-access' can request vram placement and use xe_bo_map
> without setting the 'NEEDS_VISIBLE_VRAM' flag, which can result in a
> segmentation fault. Enable the 'NEEDS_VISIBLE_VRAM' flag by default, sinc=
e
> the 'xe_bo_map' igt funtion unsets it automatically for non vram backed
> bos.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 39db16457..22b0da658 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -241,7 +241,8 @@ static union buf_id *vm_create_objects(int fd,
> uint32_t bo_placement, uint32_t v
>=20
>  	for (i =3D 0; i < n; i++) {
>  		if (bo_placement) {
> -			bo[i].fd =3D xe_bo_create(fd, vm, size, bo_placement, 0);
> +			bo[i].fd =3D xe_bo_create(fd, vm, size, bo_placement,
> +
> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			igt_assert(bo[i].fd);
>  		} else {
>  			bo[i].userptr =3D aligned_alloc(PAGE_SIZE, size);
> --
> 2.34.1

