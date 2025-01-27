Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E8CC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 11:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE25010E2F0;
	Mon, 27 Jan 2025 11:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bI+oitpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D69210E2F0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737977547; x=1769513547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=lizHX3TPYJ9A83VbfYToK29d+k1FSp2JV0En/hAmNRs=;
 b=bI+oitpoMyRf5ePEKVdrb2RuJF2XDOi2KJJF3RD/GlulGpop8W/3WQZt
 wDLwBoIXUlakdSsSievldXyUuKoVt3ec6FXDv5z9A9TGZaR8oj9bZkI4Q
 9aKEynRDMYshGYnS+mRqOk91YQayMyH/Uw4cN7mg4DNPlvvMSkaJs0Rd5
 /uHiysckhPup/cJuA9Xd05cUfpt960cdeO+Cvzf3XRZdbWFYWQ3pdMFV4
 GOPySUi1SKnDbM/Bf0ipH0WhwlRNHTPRBuyCnuLqxeUNdmue/4xHWVqrh
 PETa20TLSv5McGX9Kb66RDVy6rYvMlyQt2Bo3r1pNhOzCoUZpnsTSb/aq g==;
X-CSE-ConnectionGUID: WxBbHgqiR/SGw8P8py8hJw==
X-CSE-MsgGUID: QhWKqt52Qg6AFB5S36a3uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63788705"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208,217";a="63788705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 03:32:26 -0800
X-CSE-ConnectionGUID: uazpUKtmRdGtonSCF616KA==
X-CSE-MsgGUID: u21zvberT9Wsm3ZCfz/4cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="113553218"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 03:32:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 03:32:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 03:32:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 03:32:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhGGnqF8dSi+TIWlYG2+nZqKXbq0oC/CSZiZ3HS+2ximtK1ldXw4UbZuFpWLm5QMNOnP5N3KcY2R33bP9zWGprG7P7aPU5DtZpwzgz/bPsqv1dOzmKnsqatisSxUjcn1vgPJNzP+CXvbZcPOMjSXbMYd2zs8TuwwhAqzCoXtc+CxiX4u4OtZWsSMgrMjVfyOjRCpoarpx6+2d0ji7MOcfZohfS9qlkvG4aAeYOrzBgXiHnb52CP8p7OHb8/sOk5NXDRoS+fKM3vjaD5FoSk3L3Zf3iBSba2/X2v1hiq5XTAkuo2j5FoFmlV17lSjLhLsEp6I1a1tFnFQ7RnJ9WhqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJPriklzHaUntIhY2s7rfszCjWUx9WT+2205EkgMI5c=;
 b=ZtP+nfuzxT/BGnkhWUDjWVRJh8ZBvkJ+r2WunTk3o12IK5J3VwFcmINAwBSSMOlvQHXjHCbxPjwS8CqbCRf96IfDFDhUV6FZ2Ec1iwXmM1bFeX6PsjZ93FAYpv6hxkVOKoiPagcD3dStJdcnrQzmIbeT6aR9P+YN2e6k1aFhQrWQAcuKn+oQNF2DZ715EGW2bA5rluOsACy0skMhLl0KfvOgAKHMKPQ9ze3p87+Dbe3x0IjBw5ax+g1qa7uRNHg08UtrkS8fXj7l/8LyO7gkXD9KlozQqdzTc1CU3pz0OxorI+sPnDBSyvWOqCOixkUlBNVe11lq0FHcaGo34BewSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN7PR11MB2691.namprd11.prod.outlook.com (2603:10b6:406:b3::12)
 by MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 11:32:23 +0000
Received: from BN7PR11MB2691.namprd11.prod.outlook.com
 ([fe80::1b22:8ff7:ef00:803b]) by BN7PR11MB2691.namprd11.prod.outlook.com
 ([fe80::1b22:8ff7:ef00:803b%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 11:32:23 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowres() func
Thread-Topic: [PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowres() func
Thread-Index: AQHbWuzLexbsXzKjoUuBQcvGqGtgo7MqphUZ
Date: Mon, 27 Jan 2025 11:32:23 +0000
Message-ID: <SN6PR11MB27042CD0D6A738304905546FDBEC2@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
 <20241230190315.48821-2-swati2.sharma@intel.com>
In-Reply-To: <20241230190315.48821-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2691:EE_|MW4PR11MB6862:EE_
x-ms-office365-filtering-correlation-id: 0afb4f62-bf35-4003-2853-08dd3ec64494
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?uDx43KyOnVqIFIHhgC/3XJyaSDCO/VkixNo60ULQZwctAm6LxC5s0hRO7B?=
 =?iso-8859-1?Q?5YxUsjC24gMxrkhoQydLRlj0uaN7i4Oo8m7belwD27U1saQ3ytyRmEsBOx?=
 =?iso-8859-1?Q?7+/x6hMy71OpnSei2zCcBkzovK9RLB65bCs8QYAvI6j4Vy4B0if0AoaR1I?=
 =?iso-8859-1?Q?9hM+7N8Js5z1hydUHQoeVGRfzTrU9hw/v0QGSZlqJ25heKC4Fot2LVGtd6?=
 =?iso-8859-1?Q?h2OuP55fBQMY1Y9cqRCGqqvqNMA8U/oWlyaryEG0H2Ae1T/zxpdHjJU+zu?=
 =?iso-8859-1?Q?1LALd4U8alhu14ST94cdBF2qmylRYHBrrE57GmcrZCEhwEEzjHzWE73MF1?=
 =?iso-8859-1?Q?BCv9O5b6F/9eu72QKxBcZ0SVC6pNDyv2/nNNXOmgHvj4IP1143i7AJqNwV?=
 =?iso-8859-1?Q?8dCxUl2ytk5DxK1v+lqSWvIk+wEclng+iSg6VvEn7B3TrxvM82ZClKtrp9?=
 =?iso-8859-1?Q?xJTLbu0HtuvSxcEEH2R9qJsnKyyBAttDFZrG5ikG0Yo4k6rEDwaZUiv8mc?=
 =?iso-8859-1?Q?I0ETMLAfOiRSZZB7Zc/FlYoSpv2oa3F8yPNfnW0I8BxVE0SbC4I0QjNBiO?=
 =?iso-8859-1?Q?3QN51JXqo9K3QJOi2lVj9oHXCJC6V+OXf4KOGRoswzezonTzu5CDGTFc0N?=
 =?iso-8859-1?Q?SVGfuVGFAaedfiMa/J29fxDIepW1gT8V47hXWMwuQz84EAwypvDy36AVUf?=
 =?iso-8859-1?Q?BqiVA7FsN5yAzTkKhCXdroLQ1MxbPQa0BEC/rWM9YhzGqvTuW5NnlSPZtC?=
 =?iso-8859-1?Q?UBpdx4Bhdxu05jNRn5sEZQKr+axDT2j+NTC2zQmJueT5PrOjl3upY37jLu?=
 =?iso-8859-1?Q?1mpfeuInqVns3ZGTlBW7IIBbb02Y+FVQ9usszz1t+8c8tMxl96JKrK+CJ9?=
 =?iso-8859-1?Q?C15gmkbY7h11NeCwnqWtgVLjhZWpphVTx+CwS5Al8engL2GhUdDHARpBt9?=
 =?iso-8859-1?Q?ItxEIT7VDODpiRd8838QNM/PChoId+3QiI1HAwL0SlrkQalOuXcNU40OyI?=
 =?iso-8859-1?Q?Xu/7cSsN1sKChoXKYFr7t6giS0GZ3lU0mi2BZy1Fa4gF3Ebbqsh3izFBoQ?=
 =?iso-8859-1?Q?cCcXzP5Fq16PLFnT5f2Da7wsq8S6JfPoTkbxardOHvkYCUBhKtdhEwSSL+?=
 =?iso-8859-1?Q?BA3ZNV77WWCmkbisVU6oGlcd+SoFj4YNRpNFYXc2qWqNLim0o0dwKsm0MA?=
 =?iso-8859-1?Q?NORTCJ9GIcl2Dae2miKupviUQ98wSdIr1OWi/nsU7a8Tf8RnzEs2txs+DM?=
 =?iso-8859-1?Q?0at37XUUO7C7ry0YRZwZrGeJAWbEW2Eq2i3O7Q3FvbzfkA1Hcmw2iaZhy1?=
 =?iso-8859-1?Q?/EKE+Z3E2iWbES8R7ZAfLiHtqOc2/Ov7s3ujAAGE+82HAJ3Q01N55F48sF?=
 =?iso-8859-1?Q?RmCmbz2Lhjinat9iiaGThpnVZKXjAkFEg8CJ/DVc9H3SyCJ/UAm3au3opm?=
 =?iso-8859-1?Q?j0Pma/+mHlWcqRExWnFSq/PTQhTD8Vw9WifYZS4YnDuKhRG588Aj/QijOD?=
 =?iso-8859-1?Q?BVRT/MaOgfqG8Cs08N2u8y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2691.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5jvaE37IzU+w5R7Pv2oe29y7WeByPvyRtrCvsxAHCH+GOUCnHcafS1P2n7?=
 =?iso-8859-1?Q?OgiMuhsJ1cjDvcfGlVG2hMQM3E9k1Hmo8Vb+nQwnvSchqDZLJY8f3kd2ux?=
 =?iso-8859-1?Q?YUmwb+As7S/G1iZCXbJslUzoRXPIzuBm31v0ibUjLZFyXYnjnoI8SgnsWE?=
 =?iso-8859-1?Q?eVF4cJ2QpmAQspa9jcxKnhcHT/hCCN1rDIircMbKGIvVqfBZESa+lxR2K/?=
 =?iso-8859-1?Q?p/Fiq//tWwwZ7p5s8YLaK9I6/nfMPwK6WEx2W4sCkzYNQH4zi0hWO3s/pN?=
 =?iso-8859-1?Q?Xx4vBuI1SILwPPa2+ipZzn/V1a5Swy4HwEiBxQ4DbGeNAaqgrgc0KPQf+t?=
 =?iso-8859-1?Q?oKUhLMcS5sudLRF9naDtvVN4gY+o6zTEzI2545wXuxPpQoTJhNA+gbnVVn?=
 =?iso-8859-1?Q?OaUipMkKNFdTI3ZzEbse16SMWB5MMFjtu9fd4CFwlLYhr4CPBm9w9CMbdg?=
 =?iso-8859-1?Q?bup0Ad4kFMrBysd+975XEHtXmUdCX+fFmApQqlI2y1WOwi8mHEDhvVGpup?=
 =?iso-8859-1?Q?Wutk4NaZvYDnAgWGrC/xspq2PbH0QubSViq73btA/Mmn4xOVnR7NytwYxE?=
 =?iso-8859-1?Q?HTxOBEOvU7tHxb4CI5yUEgZuVBPKM5TchnXGU6XEEgPphiZw3yOPEKIV6W?=
 =?iso-8859-1?Q?SVTQNQlgNM/GAclXz8Pi5Xwq61//ll5CO/X+M7qWRwdbf2exvupTLmt0PA?=
 =?iso-8859-1?Q?RfDWAd7gYKZpF9jaAXPrHj8S66/g6aPcGjZvAq1h+4uFVp9Rn1y+It0vt7?=
 =?iso-8859-1?Q?+PW1HsMP0HnbVmjiOjyZepVI4z8t/M4FLpzTVwhpswSrq5b5ykg8EpPNXH?=
 =?iso-8859-1?Q?uYcpLuOtFAtMhmVKAWeFbAyI9IC6aiQBy2xh3+xT+R5m6VfiaEiIJZAeQd?=
 =?iso-8859-1?Q?D+dm4ANvUjRxicpv3OV1nf45VGtM0eoOk/MQlKRvAQHnxAL+sS3GP3qmzB?=
 =?iso-8859-1?Q?cutR0NqkFRJudAsYCdylCogZvK/rFrPvd86dfxnuUs+JonTEoPUOOEteah?=
 =?iso-8859-1?Q?Z96p1TAVFMaQ97mF0Z+W5B1d/Q1kSinevYGixpKwuXK1Br9k04KkAsex6V?=
 =?iso-8859-1?Q?QnLmrORurc0qCOtXvdS7DyAoXsdM1qSAThXAIFf1prmEMU2/GsGNwDpYeF?=
 =?iso-8859-1?Q?Io6+xB7DmFvledSAvAPG+TdAKWZxmDQTRLPh9OfUm32ybKapaZLX6fAATR?=
 =?iso-8859-1?Q?eeMC09Yz9nYA10eZMKcS29oZItCQ9pXqK1Tl+Nr39ZGpQ4JShZ6oDxyKW8?=
 =?iso-8859-1?Q?UEiJ5BT+fEgaaJd31o16Xx7wWX/+Itt/iyO085AFnBUNJA1eLIOkPMXeJR?=
 =?iso-8859-1?Q?ijLV6vuBlx1K/BrfcMuQ3DG9OQ1ruFPwZHwBEfs89x0DuvO5An+DxRcBHw?=
 =?iso-8859-1?Q?MZ4w5dulp+tBGUGON4jTqul1gsBPchqB2u0ZXhV/dNDnjYTXoXtrNZykVE?=
 =?iso-8859-1?Q?hMgb9+mF8jPtlnDpqKKKcQn3a/8Czuo2HjA0mJ6Yy4fW6Wn2+L6vsQOMXK?=
 =?iso-8859-1?Q?RpBrGQQ14a0VpPSWN4IuGl620Bj2cLqN3t1ED/8UN4qdwGNx8Llit86kKz?=
 =?iso-8859-1?Q?qf0i8tFkrSyNZSvmifyQBH3tUed66APRPlzhw9VSdx+jqbMT0i8+deiKrt?=
 =?iso-8859-1?Q?/ZtI/tNMmsM64lYVLyp8ccYSVFx9hoBvXE/VzF+CPdwXVglmzZxybpvg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB27042CD0D6A738304905546FDBEC2SN6PR11MB2704namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2691.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afb4f62-bf35-4003-2853-08dd3ec64494
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 11:32:23.0932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rf3sPwJ8V1D7EkrqjPaMeLnAAoFAhoGHlHQHQpJ0N43y1OEFVCK5+JcZ9om7AhPEh7QAZHR4VcqELlSlUeV90+EYPx5N4ocHHoMTwGJLbKnhYujFmyZG3fx8f1t50ccQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
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

--_000_SN6PR11MB27042CD0D6A738304905546FDBEC2SN6PR11MB2704namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Swati,

________________________________
From: Sharma, Swati2 <swati2.sharma@intel.com>
Sent: Tuesday, December 31, 2024 12:33 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Reddy Guddati, Santhosh=
 <santhosh.reddy.guddati@intel.com>; Sharma, Swati2 <swati2.sharma@intel.co=
m>
Subject: [PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowres() func

Functions returning highest and lowest mode are added to lib.
Corresponding changes are done in relevant binaries.

LGTM

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c             | 34 +++++++++++++++++
 lib/igt_kms.h             |  2 +
 tests/intel/kms_cdclk.c   | 77 +++++++++++++++++----------------------
 tests/intel/kms_dsc.c     | 14 +------
 tests/kms_display_modes.c | 14 +------
 5 files changed, 72 insertions(+), 69 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a67d17c4f..4f2a5ca0f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4851,6 +4851,40 @@ drmModeModeInfo *igt_output_get_mode(igt_output_t *o=
utput)
                 return &output->config.default_mode;
 }

+/**
+ * igt_output_get_highres_mode:
+ * @output: Target output
+ *
+ * Returns: A #drmModeModeInfo struct representing the highest mode
+ */
+drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output)
+{
+       drmModeConnector *connector =3D output->config.connector;
+       drmModeModeInfo *highest_mode =3D NULL;
+
+       igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+       highest_mode =3D &connector->modes[0];
+
+       return highest_mode;
+}
+
+/**
+ * igt_output_get_lowres_mode:
+ * @output: Target output
+ *
+ * Returns: A #drmModeModeInfo struct representing the lowest mode
+ */
+drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
+{
+       drmModeConnector *connector =3D output->config.connector;
+       drmModeModeInfo *lowest_mode =3D NULL;
+
+       igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
+       lowest_mode =3D &connector->modes[0];
+
+       return lowest_mode;
+}
+
 /**
  * igt_output_override_mode:
  * @output: Output of which the mode will be overridden
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e2a927ab..18c480ce5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -546,6 +546,8 @@ void igt_display_require_output_on_pipe(igt_display_t *=
display, enum pipe pipe);

 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo =
*mode);
 int igt_output_preferred_vrefresh(igt_output_t *output);
 void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 382b3e9d1..f1a019eb7 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -110,24 +110,6 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
         return data_rate;
 }

-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
-{
-       drmModeModeInfo *highest_mode =3D NULL;
-       drmModeConnector *connector =3D output->config.connector;
-       int j;
-
-       for (j =3D 0; j < connector->count_modes; j++) {
-               if (connector->modes[j].vdisplay =3D=3D VDISPLAY_4K &&
-                   connector->modes[j].hdisplay =3D=3D HDISPLAY_4K &&
-                   connector->modes[j].vrefresh =3D=3D VREFRESH) {
-                       highest_mode =3D &connector->modes[j];
-                       break;
-               }
-       }
-
-       return highest_mode;
-}
-
 static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
 {
         drmModeModeInfo *lowest_mode =3D NULL;
@@ -172,7 +154,7 @@ static void test_plane_scaling(data_t *data, enum pipe =
pipe, igt_output_t *outpu
         int cdclk_ref, cdclk_new;
         struct igt_fb fb;
         igt_plane_t *primary;
-       drmModeModeInfo *mode;
+       drmModeModeInfo mode;
         int scaling =3D 50;
         int ret;
         bool test_complete =3D false;
@@ -182,14 +164,17 @@ static void test_plane_scaling(data_t *data, enum pip=
e pipe, igt_output_t *outpu
                 igt_display_reset(display);

                 igt_output_set_pipe(output, pipe);
-               mode =3D get_highres_mode(output);
-               igt_require(mode !=3D NULL);
-               igt_output_override_mode(output, mode);
+               mode =3D *igt_output_get_highres_mode(output);
+               igt_require_f(mode.hdisplay =3D=3D HDISPLAY_4K && mode.vdis=
play =3D=3D VDISPLAY_4K &&
+                             mode.vrefresh =3D=3D VREFRESH, "4K mode not f=
ound on output %s.\n",
+                             igt_output_name(output));
+
+               igt_output_override_mode(output, &mode);

                 primary =3D igt_output_get_plane_type(output, DRM_PLANE_TY=
PE_PRIMARY);

                 igt_create_color_pattern_fb(display->drm_fd,
-                                           mode->hdisplay, mode->vdisplay,
+                                           mode.hdisplay, mode.vdisplay,
                                             DRM_FORMAT_XRGB8888,
                                             DRM_FORMAT_MOD_LINEAR,
                                             0.0, 0.0, 0.0, &fb);
@@ -225,18 +210,20 @@ static void test_mode_transition(data_t *data, enum p=
ipe pipe, igt_output_t *out
         int cdclk_ref, cdclk_new;
         struct igt_fb fb;
         igt_plane_t *primary;
-       drmModeModeInfo *mode_hi, *mode_lo, *mode;
+       drmModeModeInfo mode_hi, mode_lo, *mode;

         do_cleanup_display(display);
         igt_display_reset(display);

         igt_output_set_pipe(output, pipe);
         mode =3D igt_output_get_mode(output);
-       mode_lo =3D get_lowres_mode(output);
-       mode_hi =3D get_highres_mode(output);
-       igt_require(mode_hi !=3D NULL);
+       mode_lo =3D *get_lowres_mode(output);
+       mode_hi =3D *igt_output_get_highres_mode(output);
+       igt_require_f(mode_hi.hdisplay =3D=3D HDISPLAY_4K && mode_hi.vdispl=
ay =3D=3D VDISPLAY_4K &&
+                     mode_hi.vrefresh =3D=3D VREFRESH, "4K mode not found =
on output %s.\n",
+                     igt_output_name(output));

-       igt_skip_on_f(mode_hi->hdisplay =3D=3D mode_lo->hdisplay && mode_hi=
->vdisplay =3D=3D mode_lo->vdisplay,
+       igt_skip_on_f(mode_hi.hdisplay =3D=3D mode_lo.hdisplay && mode_hi.v=
display =3D=3D mode_lo.vdisplay,
                       "Highest and lowest mode resolutions are same; no tr=
ansition\n");

         primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMA=
RY);
@@ -248,13 +235,13 @@ static void test_mode_transition(data_t *data, enum p=
ipe pipe, igt_output_t *out
                                     0.0, 0.0, 0.0, &fb);

         /* switch to lower resolution */
-       igt_output_override_mode(output, mode_lo);
+       igt_output_override_mode(output, &mode_lo);
         igt_plane_set_fb(primary, &fb);
         igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, =
NULL);
         cdclk_ref =3D get_current_cdclk_freq(debugfs_fd);

         /* switch to higher resolution */
-       igt_output_override_mode(output, mode_hi);
+       igt_output_override_mode(output, &mode_hi);
         igt_plane_set_fb(primary, &fb);
         igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, =
NULL);
         cdclk_new =3D get_current_cdclk_freq(debugfs_fd);
@@ -273,7 +260,7 @@ static void test_mode_transition_on_all_outputs(data_t =
*data)
 {
         igt_display_t *display =3D &data->display;
         int debugfs_fd =3D data->debugfs_fd;
-       drmModeModeInfo *mode, *mode_hi, *mode_lo;
+       drmModeModeInfo *mode, mode_hi, mode_lo;
         igt_output_t *output;
         int valid_outputs =3D 0;
         int cdclk_ref, cdclk_new;
@@ -297,11 +284,13 @@ static void test_mode_transition_on_all_outputs(data_=
t *data)
                 width =3D max(width, mode->hdisplay);
                 height =3D max(height, mode->vdisplay);

-               mode_hi =3D get_highres_mode(output);
-               igt_require(mode_hi !=3D NULL);
+               mode_hi =3D *igt_output_get_highres_mode(output);
+               igt_require_f(mode_hi.hdisplay =3D=3D HDISPLAY_4K && mode_h=
i.vdisplay =3D=3D VDISPLAY_4K &&
+                             mode_hi.vrefresh =3D=3D VREFRESH, "4K mode no=
t found on output %s.\n",
+                             igt_output_name(output));

                 igt_output_set_pipe(output, i);
-               igt_output_override_mode(output, mode_hi);
+               igt_output_override_mode(output, &mode_hi);
                 i++;
         }
         igt_require(intel_pipe_output_combo_valid(display));
@@ -320,12 +309,12 @@ static void test_mode_transition_on_all_outputs(data_=
t *data)
                 mode =3D igt_output_get_mode(output);
                 igt_assert(mode);

-               mode_lo =3D get_lowres_mode(output);
+               mode_lo =3D *get_lowres_mode(output);

-               igt_output_override_mode(output, mode_lo);
+               igt_output_override_mode(output, &mode_lo);
                 igt_plane_set_fb(plane, &fb);
-               igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdi=
splay);
-               igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisp=
lay);
+               igt_fb_set_size(&fb, plane, mode_lo.hdisplay, mode_lo.vdisp=
lay);
+               igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdispla=
y);
                 i++;
         }

@@ -343,13 +332,15 @@ static void test_mode_transition_on_all_outputs(data_=
t *data)
                 mode =3D igt_output_get_mode(output);
                 igt_assert(mode);

-               mode_hi =3D get_highres_mode(output);
-               igt_require(mode_hi !=3D NULL);
+               mode_hi =3D *igt_output_get_highres_mode(output);
+               igt_require_f(mode_hi.hdisplay =3D=3D HDISPLAY_4K && mode_h=
i.vdisplay =3D=3D VDISPLAY_4K &&
+                             mode_hi.vrefresh =3D=3D VREFRESH, "4K mode no=
t found on output %s.\n",
+                             igt_output_name(output));

-               igt_output_override_mode(output, mode_hi);
+               igt_output_override_mode(output, &mode_hi);
                 igt_plane_set_fb(plane, &fb);
-               igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdi=
splay);
-               igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisp=
lay);
+               igt_fb_set_size(&fb, plane, mode_hi.hdisplay, mode_hi.vdisp=
lay);
+               igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdispla=
y);
                 j++;
         }

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 5508e7a9e..1392e1cd4 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -94,18 +94,6 @@ static inline void manual(const char *expected)
         igt_debug_interactive_mode_check("all", expected);
 }

-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
-{
-       drmModeConnector *connector =3D output->config.connector;
-       drmModeModeInfo *highest_mode =3D NULL;
-
-       igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-
-       highest_mode =3D &connector->modes[0];
-
-       return highest_mode;
-}
-
 static drmModeModeInfo *get_next_mode(igt_output_t *output, int index)
 {
         drmModeConnector *connector =3D output->config.connector;
@@ -184,7 +172,7 @@ static void update_display(data_t *data, uint32_t test_=
type)
         igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
                     DRM_FORMAT_MOD_LINEAR));

-       mode =3D get_highres_mode(output);
+       mode =3D igt_output_get_highres_mode(output);

         do {
                 if (data->output_format !=3D DSC_FORMAT_RGB && index > 0)
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e41c60cc0..6ea44944a 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -60,18 +60,6 @@ typedef struct {
         int n_pipes;
 } data_t;

-/* Get higher mode supported by panel. */
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
-{
-       drmModeConnector *connector =3D output->config.connector;
-       drmModeModeInfo *highest_mode =3D NULL;
-
-       igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-       highest_mode =3D &connector->modes[0];
-
-       return highest_mode;
-}
-
 /* Get the 4k or less then 4k mode of connected panel. */
 static drmModeModeInfo *get_mode(igt_output_t *output)
 {
@@ -344,7 +332,7 @@ igt_main
                 igt_require_f(dp_mst_outputs > 1, "MST not found more then=
 one\n");

                 memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]), si=
zeof(drmModeModeInfo));
-               memcpy(&data.mode_mst[1], get_highres_mode(data.mst_output[=
1]),
+               memcpy(&data.mode_mst[1], igt_output_get_highres_mode(data.=
mst_output[1]),
                                 sizeof(drmModeModeInfo));
                 igt_require_f((data.mode_mst[1].hdisplay >=3D HDISPLAY_4K =
&&
                                data.mode_mst[1].vdisplay >=3D VDISPLAY_4K)=
, "4k panel not found\n");
--
2.25.1


--_000_SN6PR11MB27042CD0D6A738304905546FDBEC2SN6PR11MB2704namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Swati,</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Sharma=
, Swati2 &lt;swati2.sharma@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, December 31, 2024 12:33 AM<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Cc:</b>&nbsp;Nautiyal, Ankit K &lt;ankit.k.nautiyal@intel.com&gt;; Reddy=
 Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;; Sharma, Swati2=
 &lt;swati2.sharma@intel.com&gt;<br>
<b>Subject:</b>&nbsp;[PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowre=
s() func</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Functions returnin=
g highest and lowest mode are added to lib.<br>
Corresponding changes are done in relevant binaries.<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">LGTM</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Reviewed-by: Santhosh Reddy Guddati &lt;santhosh.reddy.guddati@intel.com&gt=
;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Signed-off-by: Swa=
ti Sharma &lt;swati2.sharma@intel.com&gt;<br>
---<br>
&nbsp;lib/igt_kms.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 34 +++++++++++++++++<br>
&nbsp;lib/igt_kms.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 2 +<br>
&nbsp;tests/intel/kms_cdclk.c&nbsp;&nbsp; | 77 +++++++++++++++++-----------=
-----------<br>
&nbsp;tests/intel/kms_dsc.c&nbsp;&nbsp;&nbsp;&nbsp; | 14 +------<br>
&nbsp;tests/kms_display_modes.c | 14 +------<br>
&nbsp;5 files changed, 72 insertions(+), 69 deletions(-)<br>
<br>
diff --git a/lib/igt_kms.c b/lib/igt_kms.c<br>
index a67d17c4f..4f2a5ca0f 100644<br>
--- a/lib/igt_kms.c<br>
+++ b/lib/igt_kms.c<br>
@@ -4851,6 +4851,40 @@ drmModeModeInfo *igt_output_get_mode(igt_output_t *o=
utput)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return &amp;output-&gt;config.default_mode;<br>
&nbsp;}<br>
&nbsp;<br>
+/**<br>
+ * igt_output_get_highres_mode:<br>
+ * @output: Target output<br>
+ *<br>
+ * Returns: A #drmModeModeInfo struct representing the highest mode<br>
+ */<br>
+drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnector *connector =3D outpu=
t-&gt;config.connector;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *highest_mode =3D NUL=
L;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(connector, s=
ort_drm_modes_by_res_dsc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; highest_mode =3D &amp;connector-&gt;m=
odes[0];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return highest_mode;<br>
+}<br>
+<br>
+/**<br>
+ * igt_output_get_lowres_mode:<br>
+ * @output: Target output<br>
+ *<br>
+ * Returns: A #drmModeModeInfo struct representing the lowest mode<br>
+ */<br>
+drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnector *connector =3D outpu=
t-&gt;config.connector;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *lowest_mode =3D NULL=
;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(connector, s=
ort_drm_modes_by_res_asc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lowest_mode =3D &amp;connector-&gt;mo=
des[0];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return lowest_mode;<br>
+}<br>
+<br>
&nbsp;/**<br>
&nbsp; * igt_output_override_mode:<br>
&nbsp; * @output: Output of which the mode will be overridden<br>
diff --git a/lib/igt_kms.h b/lib/igt_kms.h<br>
index 1e2a927ab..18c480ce5 100644<br>
--- a/lib/igt_kms.h<br>
+++ b/lib/igt_kms.h<br>
@@ -546,6 +546,8 @@ void igt_display_require_output_on_pipe(igt_display_t *=
display, enum pipe pipe);<br>
&nbsp;<br>
&nbsp;const char *igt_output_name(igt_output_t *output);<br>
&nbsp;drmModeModeInfo *igt_output_get_mode(igt_output_t *output);<br>
+drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);<br>
+drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);<br>
&nbsp;void igt_output_override_mode(igt_output_t *output, const drmModeMode=
Info *mode);<br>
&nbsp;int igt_output_preferred_vrefresh(igt_output_t *output);<br>
&nbsp;void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);<br>
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c<br>
index 382b3e9d1..f1a019eb7 100644<br>
--- a/tests/intel/kms_cdclk.c<br>
+++ b/tests/intel/kms_cdclk.c<br>
@@ -110,24 +110,6 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return data_rate;<br>
&nbsp;}<br>
&nbsp;<br>
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *highest_mode =3D NUL=
L;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnector *connector =3D outpu=
t-&gt;config.connector;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int j;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; connector-&gt;co=
unt_modes; j++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (connector-&gt;modes[j].vdisplay =3D=3D VDISPLAY_4K &amp;&amp=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;modes[j].hdisplay =3D=3D H=
DISPLAY_4K &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;modes[j].vrefresh =3D=3D V=
REFRESH) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; highest_mode =3D=
 &amp;connector-&gt;modes[j];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return highest_mode;<br>
-}<br>
-<br>
&nbsp;static drmModeModeInfo *get_lowres_mode(igt_output_t *output)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *lowest_mo=
de =3D NULL;<br>
@@ -172,7 +154,7 @@ static void test_plane_scaling(data_t *data, enum pipe =
pipe, igt_output_t *outpu<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int cdclk_ref, cdclk_new;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb fb;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo mode;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int scaling =3D 50;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool test_complete =3D fal=
se;<br>
@@ -182,14 +164,17 @@ static void test_plane_scaling(data_t *data, enum pip=
e pipe, igt_output_t *outpu<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_display_reset(display);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, pipe);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode =3D get_highres_mode(output);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(mode !=3D NULL);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode =3D *igt_output_get_highres_mode(output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require_f(mode.hdisplay =3D=3D HDISPLAY_4K &amp;&amp; mode.v=
display =3D=3D VDISPLAY_4K &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; mode.vrefresh =3D=3D VREFRESH, &quot;4K mode not found =
on output %s.\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_output_name(output));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, &amp;mode);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; primary =3D igt_output_get_plane_type(output, DRM_PLA=
NE_TYPE_PRIMARY);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_create_color_pattern_fb(display-&gt;drm_fd,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; mode-&gt;hdisplay, mode-&gt;vdisplay,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; mode.hdisplay, mode.vdisplay,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_MOD_LINEAR,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0, 0.0, 0.0, &amp;fb);<br>
@@ -225,18 +210,20 @@ static void test_mode_transition(data_t *data, enum p=
ipe pipe, igt_output_t *out<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int cdclk_ref, cdclk_new;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb fb;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode_hi, *mode_lo, *=
mode;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo mode_hi, mode_lo, *mo=
de;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_cleanup_display(display=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(display)=
;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output=
, pipe);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode =3D igt_output_get_mo=
de(output);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_lo =3D get_lowres_mode(output);<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_hi =3D get_highres_mode(output);=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(mode_hi !=3D NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_lo =3D *get_lowres_mode(output);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_hi =3D *igt_output_get_highres_m=
ode(output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(mode_hi.hdisplay =3D=3D=
 HDISPLAY_4K &amp;&amp; mode_hi.vdisplay =3D=3D VDISPLAY_4K &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_hi.vrefresh =3D=3D VREF=
RESH, &quot;4K mode not found on output %s.\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_name(output));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(mode_hi-&gt;hdisplay =
=3D=3D mode_lo-&gt;hdisplay &amp;&amp; mode_hi-&gt;vdisplay =3D=3D mode_lo-=
&gt;vdisplay,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(mode_hi.hdisplay =3D=3D=
 mode_lo.hdisplay &amp;&amp; mode_hi.vdisplay =3D=3D mode_lo.vdisplay,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Highest and=
 lowest mode resolutions are same; no transition\n&quot;);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary =3D igt_output_get=
_plane_type(output, DRM_PLANE_TYPE_PRIMARY);<br>
@@ -248,13 +235,13 @@ static void test_mode_transition(data_t *data, enum p=
ipe pipe, igt_output_t *out<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0, 0.0=
, 0.0, &amp;fb);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* switch to lower resolut=
ion */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, mode=
_lo);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, &amp=
;mode_lo);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, =
&amp;fb);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(=
display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cdclk_ref =3D get_current_=
cdclk_freq(debugfs_fd);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* switch to higher resolu=
tion */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, mode=
_hi);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, &amp=
;mode_hi);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, =
&amp;fb);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(=
display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cdclk_new =3D get_current_=
cdclk_freq(debugfs_fd);<br>
@@ -273,7 +260,7 @@ static void test_mode_transition_on_all_outputs(data_t =
*data)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D=
 &amp;data-&gt;display;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int debugfs_fd =3D data-&g=
t;debugfs_fd;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode, *mode_hi, *mod=
e_lo;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode, mode_hi, mode_=
lo;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int valid_outputs =3D 0;<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int cdclk_ref, cdclk_new;<=
br>
@@ -297,11 +284,13 @@ static void test_mode_transition_on_all_outputs(data_=
t *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; width =3D max(width, mode-&gt;hdisplay);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; height =3D max(height, mode-&gt;vdisplay);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode_hi =3D get_highres_mode(output);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(mode_hi !=3D NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode_hi =3D *igt_output_get_highres_mode(output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require_f(mode_hi.hdisplay =3D=3D HDISPLAY_4K &amp;&amp; mod=
e_hi.vdisplay =3D=3D VDISPLAY_4K &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; mode_hi.vrefresh =3D=3D VREFRESH, &quot;4K mode not fou=
nd on output %s.\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_output_name(output));<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, i);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, mode_hi);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, &amp;mode_hi);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; i++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(intel_pipe_out=
put_combo_valid(display));<br>
@@ -320,12 +309,12 @@ static void test_mode_transition_on_all_outputs(data_=
t *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mode =3D igt_output_get_mode(output);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(mode);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode_lo =3D get_lowres_mode(output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode_lo =3D *get_lowres_mode(output);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, mode_lo);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, &amp;mode_lo);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(plane, &amp;fb);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_fb_set_size(&amp;fb, plane, mode_lo-&gt;hdisplay, mode_lo-&g=
t;vdisplay);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_plane_set_size(plane, mode_lo-&gt;hdisplay, mode_lo-&gt;vdis=
play);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_fb_set_size(&amp;fb, plane, mode_lo.hdisplay, mode_lo.vdispl=
ay);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdisplay);<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; i++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
@@ -343,13 +332,15 @@ static void test_mode_transition_on_all_outputs(data_=
t *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mode =3D igt_output_get_mode(output);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(mode);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode_hi =3D get_highres_mode(output);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(mode_hi !=3D NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mode_hi =3D *igt_output_get_highres_mode(output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require_f(mode_hi.hdisplay =3D=3D HDISPLAY_4K &amp;&amp; mod=
e_hi.vdisplay =3D=3D VDISPLAY_4K &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; mode_hi.vrefresh =3D=3D VREFRESH, &quot;4K mode not fou=
nd on output %s.\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_output_name(output));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, mode_hi);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_output_override_mode(output, &amp;mode_hi);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(plane, &amp;fb);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_fb_set_size(&amp;fb, plane, mode_hi-&gt;hdisplay, mode_hi-&g=
t;vdisplay);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_plane_set_size(plane, mode_hi-&gt;hdisplay, mode_hi-&gt;vdis=
play);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_fb_set_size(&amp;fb, plane, mode_hi.hdisplay, mode_hi.vdispl=
ay);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdisplay);<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; j++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c<br>
index 5508e7a9e..1392e1cd4 100644<br>
--- a/tests/intel/kms_dsc.c<br>
+++ b/tests/intel/kms_dsc.c<br>
@@ -94,18 +94,6 @@ static inline void manual(const char *expected)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug_interactive_mode=
_check(&quot;all&quot;, expected);<br>
&nbsp;}<br>
&nbsp;<br>
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnector *connector =3D outpu=
t-&gt;config.connector;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *highest_mode =3D NUL=
L;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(connector, s=
ort_drm_modes_by_clk_dsc);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; highest_mode =3D &amp;connector-&gt;m=
odes[0];<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return highest_mode;<br>
-}<br>
-<br>
&nbsp;static drmModeModeInfo *get_next_mode(igt_output_t *output, int index=
)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnector *connecto=
r =3D output-&gt;config.connector;<br>
@@ -184,7 +172,7 @@ static void update_display(data_t *data, uint32_t test_=
type)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on(!igt_plane_has=
_format_mod(primary, data-&gt;plane_format,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_MOD_LINEAR));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode =3D get_highres_mode(output);<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode =3D igt_output_get_highres_mode(=
output);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (data-&gt;output_format !=3D DSC_FORMAT_RGB &amp;&=
amp; index &gt; 0)<br>
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c<br>
index e41c60cc0..6ea44944a 100644<br>
--- a/tests/kms_display_modes.c<br>
+++ b/tests/kms_display_modes.c<br>
@@ -60,18 +60,6 @@ typedef struct {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int n_pipes;<br>
&nbsp;} data_t;<br>
&nbsp;<br>
-/* Get higher mode supported by panel. */<br>
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnector *connector =3D outpu=
t-&gt;config.connector;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *highest_mode =3D NUL=
L;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(connector, s=
ort_drm_modes_by_res_dsc);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; highest_mode =3D &amp;connector-&gt;m=
odes[0];<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return highest_mode;<br>
-}<br>
-<br>
&nbsp;/* Get the 4k or less then 4k mode of connected panel. */<br>
&nbsp;static drmModeModeInfo *get_mode(igt_output_t *output)<br>
&nbsp;{<br>
@@ -344,7 +332,7 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_require_f(dp_mst_outputs &gt; 1, &quot;MST not fo=
und more then one\n&quot;);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; memcpy(&amp;data.mode_mst[0], get_mode(data.mst_outpu=
t[0]), sizeof(drmModeModeInfo));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; memcpy(&amp;data.mode_mst[1], get_highres_mode(data.mst_output[1=
]),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; memcpy(&amp;data.mode_mst[1], igt_output_get_highres_mode(data.m=
st_output[1]),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(drmModeModeInfo));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_require_f((data.mode_mst[1].hdisplay &gt;=3D HDIS=
PLAY_4K &amp;&amp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.mode_mst[1].vdisplay &gt;=3D VDIS=
PLAY_4K), &quot;4k panel not found\n&quot;);<br>
--<br>
2.25.1<br>
<br>
</div>
</body>
</html>

--_000_SN6PR11MB27042CD0D6A738304905546FDBEC2SN6PR11MB2704namp_--
