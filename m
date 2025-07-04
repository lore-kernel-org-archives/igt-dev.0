Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656ADC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 15:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30AC10E093;
	Fri,  4 Jul 2025 15:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vbp1JItn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68DD10E093
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751642241; x=1783178241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kv44oVSvYQkOGUixpJpUHMsImdZerydvLeQ8XpqyIE8=;
 b=Vbp1JItnrtJ2e0ghN/ZUaazI0KXT9aDuxYEeu77YxOfab0JSUqve9zLM
 Nj6BdImLeOB2FvRu+iBUMQGSJSdt44gbulHAf8WyUVwS+IKBSaS0f5ITd
 BlHQsJDUqhlS2t6XBbzA7fidae3Q3VRAHENfwumCBIfJVhXJ7ggHzNJlK
 56vhbkKDzCopFtfwlyxudLO/xFIeZNxWqmncydnBN4hEr+zmRQSBlwOG6
 WoYF9MxJ0zkoiYDZH6S23OlGtx7iDxVoLI5HjWw+BvIK2X/Z/REUNNlH2
 fDbAhub3igYjM4y6tlwt7AIVojy6P2+LjCUZa90hhsULQTCZjdYLP5Kfh w==;
X-CSE-ConnectionGUID: Mvljca5QRTasNiTpBEqtPQ==
X-CSE-MsgGUID: e8FiFiDoQraffK1g0GjtzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65430112"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="65430112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 08:17:20 -0700
X-CSE-ConnectionGUID: ecHZIFtnT6W0KzhsjNBiiQ==
X-CSE-MsgGUID: jlmqCPpBRguWPAvslklXCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="160188628"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 08:17:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 08:17:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 08:17:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 08:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZT7jlRTJgfTqGz8378mZbbf5jCHqNU6oCdC0NuwnVfA0twWzl+RF74s87+F/xBNSccWVylD76lSLkOAC7uDfNXtBFhg6VAXgbL2syq2D44q70dwdk3EC5jqPpS5WXIpsDbPOHsYNpDl2dKfi65K//f0tj6UqvI4avXq9xnBal1ZSi7P2JW9pDBv9jF00+pHZBIZshhUUArtgXu6UcMZfP6iCFj209RSSMs8u6bNpjXyhsZZxMg29iiIOGyIUq9g3s2wc2/LXkxqLTmKBBBUVUsajd50AFWgj1EncW4wRhC62uS87Tf7G4IAAIpCzumvi+OEG6GTQEn/1Hatwoky+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp4HjaNSkpxOz1ZKMfDAiTQtsJ+qVripl7PhkIhq/8g=;
 b=i7jPb6S8utwiOnmgwC/BqAhNUsWfLXd+6/VipPpEoqJ2nyp1Ui8K9fuVW34VMp9e3LYLWf21RpHnylRSAR+AIkjCAmeYTrIGfAat6D4TPJsgQ1+WyYgum+76gFABoewYUsrIOfND/nZbwPRQ03fsmAQ+Jb0DyTFX/vsCXy0GZQYs164lH9YUwwiar6LXIebj9u1tcakz04q/K0vi83W08tqjy/L8BTIWEv1cGCaqmD3VGqW9IqnXwgP08jW5M0khD3rjV5KTH3sjYn41smeOLi1MpTKlcaXNHxUTwrFle+cscQvoiUrCeYDHJ4YscgY9YYnhOMYI73siheK3SRyW5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 15:17:15 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 15:17:15 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>, "Kalvala, Haridhar"
 <haridhar.kalvala@intel.com>, "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
Subject: RE: [PATCH] lib/pciids: Add one more PCI ID to BMG
Thread-Topic: [PATCH] lib/pciids: Add one more PCI ID to BMG
Thread-Index: AQHb7PA3VF1Sjlfb30eqpjgjhGt5GLQiEUGQ
Date: Fri, 4 Jul 2025 15:17:15 +0000
Message-ID: <IA1PR11MB626645000ABBB3122C16817FE242A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250704142953.101110-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20250704142953.101110-1-ravi.kumar.vodapalli@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|IA1PR11MB6145:EE_
x-ms-office365-filtering-correlation-id: c2bd6cdd-b888-47b1-dccf-08ddbb0ddbc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cqdirs2Ft5SB7w0NjEorZvahLm528EMyq7oEdZ3IK1WqaWiFTgrQp6oDI3hX?=
 =?us-ascii?Q?STW09sBjoDySWjvI3Mv9/2qUyqZBEjc6qDzyVgNifrvTAjOZrhW6ouw2VANi?=
 =?us-ascii?Q?7wm1euCpG86aNAtdtMla6kYBNaBxbc5BeYVYgKchijpafpjvZl12NjBPieaK?=
 =?us-ascii?Q?LpslyOkrpiabXHOQ/sQ5P/z22EDSMNzx1NAs1ZTU1fdK3AOALNN1roOZWuLf?=
 =?us-ascii?Q?deMEH9vI2Ed+yHvn13zHkzP6BGBmixFVQIB8M4WoihzAn5tGDboTzNe6k5uw?=
 =?us-ascii?Q?YbIAQZYle39D/sCjsZeywjM4XeiSoDKDQxUQNw6Gj4e80yRLF2k8p83puJ2B?=
 =?us-ascii?Q?Wg95fa8gGEeWa3Yz/12nh+yuqDRVo1Lul5vcT6Lk4zINX1kQqKgmOSZVYyuG?=
 =?us-ascii?Q?O0O8w3hOqcYwNPgzan8nW/BJ5EA6Xga+Nn/qE8TkCuTcmfaZg3WCZBPVQnvj?=
 =?us-ascii?Q?//d7xupHp/fcb1FC/z0gJIkXGyEZp4wXCt+v6oQrGJHDloGj97uRSJVWJOmC?=
 =?us-ascii?Q?4yhORK997j7oANk6KJhycjOGmXWVKY1+mlNfDZiKYdSzP8ltkLwr4Qfxt1ZD?=
 =?us-ascii?Q?8NwE70VIBRjgyPmVtFfroGUA9kHBX746e8/j2Op9Qj7CoyBS1qPbFMddXBed?=
 =?us-ascii?Q?YYimqoXVeAQ71jRqyXUmYkEXN9NjfrDXC+FctaqxMbOXYg/P7Xm0CJhP/Dav?=
 =?us-ascii?Q?ykuaOtJyRu3vEbWAyJQQYqosyzIxz92MJJHjAs6AB7mJcC8Cn4vWM2fSS6w3?=
 =?us-ascii?Q?8aTwepobC+6snhctigBOWSXdUSUJt+xsqqwk1v2guzvIMUcZXIZ0pNQnyhqJ?=
 =?us-ascii?Q?Aj3bWA1k7033GXWkhe2Yter/ci+l5NEj9tKDvytHiqt9b6Ve6lFVKFWv+RCc?=
 =?us-ascii?Q?nSxz9tOjLT2llmPPExP8Y24T9fMWHjOApzyRP2XsCWQXY5OymuhhH5ZwvvuW?=
 =?us-ascii?Q?B6mnrdHgklS2wDy/2rFf5Gcv4QXxoKEanlG02NRx6xMTnI/W3uhhMuUqnOIq?=
 =?us-ascii?Q?l26B9Gught25mNKXMSeBrw8ulaBxiklKueUdiK7LyVew3ZmBvw+v7otaCY44?=
 =?us-ascii?Q?8tbPfUIaI6Y8l9gibE1KESm3PWso79pr7OU/AJ3vS0uOEXsfKJPUQmrtwK8u?=
 =?us-ascii?Q?PGvqDTM+mhFVX6sggtiOrboT94gRgxgO+nyD2dxlxUj5X/ypUJjny/zWnMLl?=
 =?us-ascii?Q?dTvebHFdTk3X+M/rYU1gOUfKCruDPPmp9F9lBLNWyA+zNkCW1miHv+U9g4cn?=
 =?us-ascii?Q?aeJqy1PZvs1sSywHMPnKPgKXJQbaS/t62rHFP6BYRh0uD9u8nCWx3Eb7vX1b?=
 =?us-ascii?Q?vmwq9+RrbeEdp2bDRKBuXyMD+1yEktLQITzxYVQV9DyGYJOpOGM+tiY8yLwc?=
 =?us-ascii?Q?Qh3BN/ExXJQ5Xy8uW2EP9OGrBwD3ncmORxOsx9dO22LzzrMSWzrde80Zsj+S?=
 =?us-ascii?Q?URWfHtSbBiJ85Q6MMOjXoTTlglavEV9VBHF1RJ6UeAs6M3SGEqc1qw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kIrbThmJzvQw/7v5SCUVCyx++WDX58CT/B6Vou+usqwmUdZjXEpYk0iAalLo?=
 =?us-ascii?Q?awsAdQ/tIc/i8LdmTUxirt/Ya8sYFl2FAOv2Vbc+Ac9C4zopsSB3wPRBSKlb?=
 =?us-ascii?Q?kMWc6HD/3dY7s/aTJOVr//ywgEyabjmaVmo6M0p6OG2raiHdrVQF++jhIR82?=
 =?us-ascii?Q?NqO2bU8FpGwbgXpNNWZNC8mTzyr+tc2iEnDVtMTYGbnPEQ7b/LcW/sBWDY76?=
 =?us-ascii?Q?ItFa+SrLB2CqkuOJ8ZSATcRlZYe8IUC00RHmmw9tplBgDPazFnH/EjbrhmJf?=
 =?us-ascii?Q?ig5UH33+RJJcRkaXePL0GobdKHMDWHks6f3laQAAC8BOGD3SxQ2t3YyFQN+V?=
 =?us-ascii?Q?4blnmXdYc714DMFcMfQNHcVT880tfgSrKcXhUcKKo3pWgo6Oejpgw9+Xtv1d?=
 =?us-ascii?Q?f44lNP4QJEp6OI5pr+yAl9MJSht07jd1Y6kiN0xmBNqOy5r3XBt7a2ioI+TP?=
 =?us-ascii?Q?PDN7h+uQZSkW/8p4+Md1sJQA/bU8YAifc2c2Gqp2SZv5AuTw0G1oX4r7m3FY?=
 =?us-ascii?Q?M86WyEfLHzkbkSY8sCR7y8yCeqN9WVjR7Cr//hgIAsUUgdVQ37tbW7W+8j/t?=
 =?us-ascii?Q?fPnF+J9sgIcjHAbquBycKqHC9eTSoCnaKeXJuiY43sHTRfV/1X0e0yjefpjy?=
 =?us-ascii?Q?brl/ur0ASXyIrPqciVf6A1ahz/ed1KYT5eDgG3mjoymK5XNRUSMXYaRDrKwU?=
 =?us-ascii?Q?hXNvwJVL2iG7uUiqwcO2GA5+eEVUc1tweXpiCOcOC0ZeabhzB1AFc4gbFlfl?=
 =?us-ascii?Q?2r51IxKs6T3ol+2bjPhG2SKwIr4y8j3s8W/tGjWGVAx2nWldnjx0MKceRLv/?=
 =?us-ascii?Q?IyrTnjOGZKpxMuadRtBWduAwALI10ud9NG0yBjdmTnvSTylqmLHbF5OR0iCD?=
 =?us-ascii?Q?IXeml1g2/OCaqKvzpOkGVI4ppLAKn8kSEcTaFSReyznYa0/0CQtd4vxF6ltX?=
 =?us-ascii?Q?Nw0m8d2cfIjAvFx3c5imzMRMa4KpdZ0AXq6PvCxggFEHIXMJF3T99C3iRDKk?=
 =?us-ascii?Q?S3lFsDPHmCCK5m261hO8AlF7MmRwiMM5UMUODdAgTJsYWyQ24t1azAQbF6BM?=
 =?us-ascii?Q?t2gyQlgrdueIRYp0dmrH9vsMQgqPPAX+nA/HloN4cuxcunKO9Mm8H5qPiBOL?=
 =?us-ascii?Q?XQtKkChbt27SbRYP0O1/Ef9zqVi5RpWwD4BPXepxD9stRt4e/B3TDPq6a5vR?=
 =?us-ascii?Q?1PaUlNVnxAJfvVEfBN+lpf6eV3JEpBlVRWLx8iXoS2no/u0CsH1aiMHfp24t?=
 =?us-ascii?Q?bjs49znyXYLazTMcvH4Tn6lr0V7DtcmhjlBep4QflSH/pbQJuXOhyTenH5Yr?=
 =?us-ascii?Q?SMOTwYLQ5VcH5LfVAmUCrE30vd/Gyz/UOW5XTE+LqQJqP8LmJE/ySzVa4t+n?=
 =?us-ascii?Q?xz4E07Vwa0rL7nYaNVf8emJsPP2GN8zNksCmKvqe3gKFA27vC9Mwl0fGnfRb?=
 =?us-ascii?Q?JpLGwfQ43bsDm36sw1/6/y5UILGbmrkSofg5A5L+4C31SZGtc5w+8Bblm6T2?=
 =?us-ascii?Q?znsQWeujyLuh1JPlKkeAaZbj/LZ0qKphOUuFbEXoOBt98wnvtjSH0O0uXAxT?=
 =?us-ascii?Q?czdpXRmlEzNrRgHUyNfcostuLKLiCcgjfQKaKiwYggm8myl6JFViwccGIx+G?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bd6cdd-b888-47b1-dccf-08ddbb0ddbc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 15:17:15.2249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRuktcgvkW2qK2oxtvqLyA8+GSBJPcTByqOWWUr1J2xcvAlCDSqzkc0TQ+rrLUKYbfQN1huSIpjvRqAy9F2i98yqcD1p0tOcoFbiwneI3Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ravi K=
umar
> Vodapalli
> Sent: Friday, July 4, 2025 8:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>;
> Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
> Subject: [PATCH] lib/pciids: Add one more PCI ID to BMG
>=20
> Align with kernel commit ccfb15b8158c ("drm/xe/bmg: Add one additional PC=
I
> ID")
>=20
> It Adds one more pci id to BMG.
^^^^"adds" would be more correct here.

Also, you should be adding the reason why you have sent this patch as v2 so=
 folks=20
get to know what has changed from previous revision.

>=20
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  lib/pciids.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/lib/pciids.h b/lib/pciids.h index 129c3172a..666265b5f 10064=
4
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -846,6 +846,7 @@
>  /* BMG */
>  #define INTEL_BMG_IDS(MACRO__, ...) \
>  	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE209, ## __VA_ARGS__), \

With above changes LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Regards,=20
Dnyaneshwar=20
>  	MACRO__(0xE20B, ## __VA_ARGS__), \
>  	MACRO__(0xE20C, ## __VA_ARGS__), \
>  	MACRO__(0xE20D, ## __VA_ARGS__), \
> --
> 2.34.1

